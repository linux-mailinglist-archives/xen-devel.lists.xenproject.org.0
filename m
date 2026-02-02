Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uI1aHjvQgGlBBwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:26:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FEBCEF19
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:26:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218975.1527859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwkc-0004zC-LG; Mon, 02 Feb 2026 16:26:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218975.1527859; Mon, 02 Feb 2026 16:26:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwkc-0004xP-IH; Mon, 02 Feb 2026 16:26:10 +0000
Received: by outflank-mailman (input) for mailman id 1218975;
 Mon, 02 Feb 2026 16:26:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bi8a=AG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vmwkb-0004xJ-4J
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:26:09 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfed4a5c-0053-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Feb 2026 17:26:06 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4801ea9bafdso19835255e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Feb 2026 08:26:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e476dsm44209088f8f.4.2026.02.02.08.26.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 08:26:05 -0800 (PST)
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
X-Inumbo-ID: dfed4a5c-0053-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770049566; x=1770654366; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tc6gOz20lEaU/3fSZjEE3ALZJibk+cRJSW+ufdKy2jw=;
        b=P0mA9mUJEqp1Q9DFyD8rOv/slQ/JyJ+vM+G4c+q0z4YvWg/TYMOf6aTxS3Se/KgVnh
         rZsqVMim5+Kk1ZiyHzuYpwfFozqaVeclOwP7NZaMRvpY7Fvwzf/k5JppfAj+3qRiiXUa
         BqHsMaYFITCB/37oxTX1l2gba/8KZWY1HZBfuW2bQoZjigLZ2lISaPO9DNueAAK6DAVm
         OAjlCkP6RttVSdvExOeaNAWUpPnUevu8dWzDfwQp0AQlZAwkYEl94H64qLlVi7O2FwNS
         gJikd2JH+Ftt5HYepwfT2KN1KPkX92fduAxKuW7XkAaonUQUB3CGhfrpBqkNFB7TAQ+G
         o7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770049566; x=1770654366;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tc6gOz20lEaU/3fSZjEE3ALZJibk+cRJSW+ufdKy2jw=;
        b=KMuRFRXakZVzN47aNo0yHtmRhrvqZfkVBrD4k2V7Mnjt6dMvnZdyAoS/78h+VIV0xY
         UAeAsVIdG/JbMSyDCWgi895BUNG+4LR9la7oJU0+z9Krm8WS5DMBk3eTtSVc48GPhiQX
         WP1NJoajgjxUWx1Kdxij851Gtb/qMd/J9BaegF6T1Xd3lq79zOpCYFeSs3h6P9smK24I
         I3727jFFtaht5cu1r58r5BLNkuK6TpK5mUk2cd5O3Xv0X2uhpznewz2cnZBntF+maJg2
         2qKlozzQ6GcsWwUQ86Ch0BKV5WIMB/mdOauKgVzIOWPcsbd0zwnJnu+0laorypiEQu50
         hGIg==
X-Forwarded-Encrypted: i=1; AJvYcCXI9QwlOKiZIUHYKr7A6QV4aM4A1FS1K0SFzLAdeq3oH12LE0ph9sc/ddiNR/ymBx+RuL4xuyxNBLw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLy+HSpqerpLKAEHf2gQrsPv3xK/1bSKKTh+/HmzK6orL5rDrt
	MO/roS3SxxpFSNzmXRXfHFwtVouJavq4QHeJELqbrYrtHvlpd/h2w/wfIN5umSQJQg==
X-Gm-Gg: AZuq6aL/Zswaiiq2wjbPwIhAHTHA/nRCfPXYZ+dK8i+Yw+V9eH8JU+vxfZIRXQ4WwN5
	ObpLXpdpSwDdIWDXYYZL4NSNGZx9AC60AFdMurFJcOlfhqaoQ/7we3ZgxgFc/UVoSFRvlsEeyTi
	hRAWi4T1HGSzaoTLFxVHhWbmuaErNHkpt2RZ7ec1uE9+8DTwRK+NcTpRlA0z5M+xY0e2ZnQq3ut
	c/gYf9oFjGMtMmmIY/KUCnk7NfhbRl0kXzOK9nTWxiRSjE2GsQ8lBBFgQf3tm42LggHeoKgtH09
	0TLkGb6HcnknkgwffXbNDSPXBJVGed7UWc4I7QLYL4rXSllonvzzA6kb/W3UI9zLG6W105EPVFd
	S4Qk1UmYn9LJqCbDaEV0eYYH1wm4kvg3jMQ8jC2dFyIfatUwbBnmbseFCHRZdnxYBZ9fAsdeM2+
	S3o6QxyJCoqebEC/Nu6AtW9UShoPKOD8xocp4XHDfRZmz5/yJ8UYFDRG+My/swdUdx4TReByN/W
	n0=
X-Received: by 2002:a05:600c:c4a3:b0:47e:e9c9:23bc with SMTP id 5b1f17b1804b1-482db49d765mr183192495e9.30.1770049565975;
        Mon, 02 Feb 2026 08:26:05 -0800 (PST)
Message-ID: <e5e75e36-a383-4506-8e59-288faeffb614@suse.com>
Date: Mon, 2 Feb 2026 17:26:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/cpu-policy: move CPU policy library code
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4bd68e41-e665-4992-9d3c-0086bb5195ef@suse.com>
 <7c06bd5e-fad2-42cb-947f-6749f647b068@suse.com>
 <d8eb4220-da82-43b3-b0e0-9d006f68877c@citrix.com>
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
In-Reply-To: <d8eb4220-da82-43b3-b0e0-9d006f68877c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D5FEBCEF19
X-Rspamd-Action: no action

On 02.02.2026 16:47, Andrew Cooper wrote:
> On 07/01/2026 2:17 pm, Jan Beulich wrote:
>> diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
>> index 0203138a819a..be6c76d2934b 100644
>> --- a/xen/arch/x86/arch.mk
>> +++ b/xen/arch/x86/arch.mk
>> @@ -4,6 +4,7 @@
>>  export XEN_IMG_OFFSET := 0x200000
>>  
>>  ARCH_LIBS-y += arch/x86/lib/lib.a
>> +ALL_LIBS-y += arch/x86/lib/cpu-policy/lib.a
> 
> This wants to extend ARCH_LIBS-y surely?  Is this a rebasing oversight?

No, this was deliberate. The functions here are different from those in
arch/x86/lib/lib.a. We don't need to fear collision with "common code"
ones. Hence I preferred to use the more "normal" placement into what's
passed to the linker.

Jan

