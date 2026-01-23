Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IE1yL81dc2l3vAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 12:38:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E61752E1
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 12:38:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212189.1523466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjFUW-0003n8-Eg; Fri, 23 Jan 2026 11:38:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212189.1523466; Fri, 23 Jan 2026 11:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjFUW-0003kj-Bz; Fri, 23 Jan 2026 11:38:16 +0000
Received: by outflank-mailman (input) for mailman id 1212189;
 Fri, 23 Jan 2026 11:38:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gw2r=74=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vjFUU-0003kG-OW
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 11:38:14 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8db76cd-f84f-11f0-9ccf-f158ae23cfc8;
 Fri, 23 Jan 2026 12:38:01 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-42fb5810d39so1271436f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 23 Jan 2026 03:38:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1e71562sm5822194f8f.21.2026.01.23.03.37.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jan 2026 03:38:00 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: f8db76cd-f84f-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769168280; x=1769773080; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0lwrbFmSohjzihfQACN8j3xVvbNZg4GY2Lp3vK8Kj2g=;
        b=cOxEu9Z6LTDQpeX4bhxXzzeisPyc5ZkH454i/Gf1CRh454hVP6r4gd0sYqNB6vu/AS
         cBL7ClUVFNF13J2gOQ1aoKrfWPzxo36DwGpx9wGPis2iaJ9UV9pvuRb6UeuDujjZGNp/
         cGJFTDuF2LG6x9m1gY2Fwe/UVrnfwZO7dFTZTMrnZAPXmY//kDlo5kXD6Z5Elc43j5J0
         9S9xAngxJ5LpIcO7tglMQ8qYaX+ehYwzY7y23M3LgB6e8MfhSclaPRtqRmCEiE3BJEwe
         TOtQYqeGRRctuyWZ//QApNpk2+8cEdJjjW2TSECPj//2PsK1D9j11KNGHiCxXuM3WqvQ
         P20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769168280; x=1769773080;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lwrbFmSohjzihfQACN8j3xVvbNZg4GY2Lp3vK8Kj2g=;
        b=iLh5Uu1a30xEjPw+PAPILeAP65sszEuGZreg1QC9l6JQFJwFNXbfKcxbgjFtMRqRGy
         9VQ7XdW0ei2GM5HMglCWutU7vIaGaR7arov/zCLJHraclRZDXrr83UEnlvyO4MpK2RLu
         A5wukFuLB/HZww0GNJKjqhJYI/eIeDAWEJvFiR57YvXKhahkuariOfQWgiV4AsQKlWsB
         cxGzKfeIgKzwNNnMeEZVy1OmV2zj2HMdOTGMZRujOw0M9J9WHFkwJ8rqxWDs9wVA4+AD
         hYQDf1xf0Q+DH/w9EAcMHQcKM0Jml/rIjRUFpufIR8N4iye2t0mChmuRE8i7qKe5K4Oh
         fTvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwl736zoW8afaAY+87cJ46yWsAk+hfHfnyvKF5H3l8eWTjdZglxgI5OAlwoae2GASG+IYbuf0G+xI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyyHPQOxWuOqKF5LJPiMApRilqGFtWD5Oc2ZHtmkxYasAdeqcqo
	AojgeznZAptF7vq5Xfs9is7Myw6xSTKIrMPlxRJwUsdCcQoXEuGa7x2WxkUeHovwVw==
X-Gm-Gg: AZuq6aLBxwQvEI37lILxKfaVrinJpxWlbhAv67bhABHfdEedsDX9bPUmWX8SLaonRMH
	Y+piqQhwXmlBOXmGK94w45zr8GQmu4pclrOlQy6PzmafD2/VFKBi7Ekgy9fFZreVcBdOZ7tgQnT
	hjaffG/Rxb3SHvJ6UrfAHE6u4pmDkNRmPHgqq9v4G2doKXe2MhAAAvQ/pAsJz0CnDVCe2WqpcKO
	HPfLwvNAnJo1/AeOR/2REOw/RUkA+dkoxVN1dcYGQ8B/D76mrrm8Fuz+x5jf8XcIy15LfYdSYUA
	VMXX9ZF9U29NNLBZpZZQRMg7o959xwpmfqc0PI/xHLizC6FdhdQMiWtx5D3t/uKhNu9l8Oft2EM
	dxKwcHTO6gAtk3xMP/qiLBX2gwyFdgIuVW5Kc5bKhZxTxM2zIgJDiGf/D0cuwuilZuNk4g3GmgG
	1tzhA7s7oUfSNU/J2be9mJc+GcNkpJxqrCsmnCIT547vT9WSI+c78jDDForAx/0haQLeT0TOWzl
	uc=
X-Received: by 2002:a05:6000:26ca:b0:431:808:2d58 with SMTP id ffacd0b85a97d-435b161d35amr4589573f8f.51.1769168280479;
        Fri, 23 Jan 2026 03:38:00 -0800 (PST)
Message-ID: <a4dc1cd1-30a0-414b-a2b9-686d30f69f8d@suse.com>
Date: Fri, 23 Jan 2026 12:37:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] xen: Allow lib-y targets to also be .init.o
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20260121154757.44350-1-alejandro.garciavallejo@amd.com>
 <20260121154757.44350-2-alejandro.garciavallejo@amd.com>
 <526ef477-0730-4e22-a82f-4c598ad78e0a@suse.com>
 <b7475771-3ae3-426e-9255-d886ec0b2ba9@suse.com>
 <7024dd52-b209-4daa-94a4-8b966aed4499@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <7024dd52-b209-4daa-94a4-8b966aed4499@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,suse.com:email,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.985];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 31E61752E1
X-Rspamd-Action: no action

On 23.01.2026 11:56, Orzel, Michal wrote:
> On 22/01/2026 11:01, Jan Beulich wrote:
>> On 22.01.2026 10:49, Jan Beulich wrote:
>>> On 21.01.2026 16:47, Alejandro Vallejo wrote:
>>>> There's some assumptions as to which targets may be init-only. But
>>>> there's little reason to preclude libraries from being init-only.
>>>>
>>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> I can't tell (yet) what it is, but as per CI something's clearly wrong with this
>>> change. Both xilinx-smoke-dom0less-arm64-* and qemu-smoke-dom0*-debug* fail with
>>> it in place. qemu-smoke-dom0-arm64-gcc (no "debug") was fine, suggesting it may
>>> be an early assertion triggering.
>>
>> Or an early UBSAN failure. I think ...
> I did a test and it looks like the problem is division by zero in
> generic_muldiv64. At this point, time is not yet initialized on Arm, so cpu_khz
> is 0 in ticks_to_ns.

And division by 0 is otherwise benign on Arm64? (On x86 it raises an exception
and hence would be a problem also without UBSAN.)

Jan

> (XEN) [000000005019d0ee] UBSAN: Undefined behaviour in lib/muldiv64.c:23:21
> (XEN) [00000000501cfc11] division by zero
> (XEN) [0000000050211d11] Xen WARN at common/ubsan/ubsan.c:176
> (XEN) [000000005023b3ec] ----[ Xen-4.22-unstable  arm64  debug=y ubsan=y  Not
> tainted ]----
> (XEN) [0000000050afc964] Xen call trace:
> (XEN) [0000000050b0e4ec]    [<00000a000032ab44>]
> ubsan.c#ubsan_epilogue+0x14/0xec (PC)
> (XEN) [0000000050b2f1c1]    [<00000a000032b35c>]
> __ubsan_handle_divrem_overflow+0x114/0x1e4 (LR)
> (XEN) [0000000050b577dd]    [<00000a000032b35c>]
> __ubsan_handle_divrem_overflow+0x114/0x1e4
> (XEN) [0000000050b790fb]    [<00000a00003eb9d0>] generic_muldiv64+0x7c/0xbc
> (XEN) [0000000050b94539]    [<00000a00003bfb9c>] ticks_to_ns+0x24/0x2c
> (XEN) [0000000050bad89d]    [<00000a00003bfc04>] get_s_time+0x34/0x54
> (XEN) [0000000050bc731b]    [<00000a000032dec8>]
> console.c#printk_start_of_line+0x2bc/0x374
> (XEN) [0000000050be7987]    [<00000a000032ef3c>]
> console.c#vprintk_common+0x454/0x484
> (XEN) [0000000050c06033]    [<00000a000032ef94>] vprintk+0x28/0x30
> (XEN) [0000000050c1e4df]    [<00000a000032eff8>] printk+0x5c/0x64
> (XEN) [0000000050c3904b]    [<00000a00005548f8>] end_boot_allocator+0x31c/0x548
> (XEN) [0000000050c55a86]    [<00000a0000585c58>] start_xen+0x150/0xe68
> (XEN) [0000000050c70232]    [<00000a00002001a4>] head.o#primary_switched+0x4/0x24
> (XEN) [0000000050c8d2bf]
> 
> ~Michal

