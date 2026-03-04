Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOpmFChGqGlOrwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 15:48:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8AB201E41
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 15:48:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245521.1544883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxnVP-0002ur-Sz; Wed, 04 Mar 2026 14:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245521.1544883; Wed, 04 Mar 2026 14:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxnVP-0002t8-QC; Wed, 04 Mar 2026 14:47:19 +0000
Received: by outflank-mailman (input) for mailman id 1245521;
 Wed, 04 Mar 2026 14:47:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xh4z=BE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vxnVO-0002t0-Kx
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 14:47:18 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a1c5de4-17d9-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 15:47:17 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4836f4cbe0bso58650255e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 06:47:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485188080edsm55771475e9.10.2026.03.04.06.47.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 06:47:16 -0800 (PST)
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
X-Inumbo-ID: 0a1c5de4-17d9-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772635636; x=1773240436; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fHFllxepf7SsU5yefoF7bkEmFMQtnjkUXCRHke/7Er4=;
        b=B/K4aEKv3Ul/uy/a3AAmZ2bg5tk4byq4NdmJDAIi27e4Bw5oKZVO1vurgWmp3U5Yop
         ldR/7WBnbdLYQB0I3kFHoRaoc54JO726HaaDrh8TFFzkfj5IeHi//nPxr5q0cMKP5FNL
         UYJIeVudmiYfGW+s270lHoQa8LQyZ3EuP3g0R4BphvrEFF+DdnckuSTY2zbzMGnahDhn
         hlJCDAH8iGZ2VDUyM1+k/IY88t1ykpNoBrNnogfc8fspDC0ENxhFq44QPb8CYjEo4QR3
         AS0pCu6pBw5K57FW5L/jB0HLtE3pKsnJcSd6CNhyE6YnSec2DS/BvntGJuIk/8dvTs9a
         cfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772635636; x=1773240436;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHFllxepf7SsU5yefoF7bkEmFMQtnjkUXCRHke/7Er4=;
        b=GJU35aWxFG5yQ/+4jGxSu/GCuU0DZVDRBt15Z4fAYaHLk1wPVgIArdeAkU0WzJjGg5
         +BA992UZba47vUZU4jWmNHLKEn264xtAcsxoJOrFnQRVHYchxYKCGT2orqKAcC6nmnRe
         pFTevD0fl2QFHKaaiQOr/mWf3axCUn1t9cMZwL5sN8uQmR2fvy05Hd85AZmV8B35qlcy
         W5udLm2UATo8YfFtB/yPrB+f7SWo3aLnr+cPGawgfvMyNow4dPPsJCm/RgjFHxuQDRwx
         Byt7qCsljz5g0unAPV4FZOP9lt4ZQMQeFFcqeZ1yo41+1XRNrkEIlLosSy7/m6UDCUEr
         qDMA==
X-Gm-Message-State: AOJu0YzBe10vOKoefYtZSsjuTEAalhhUBJgFQP+YPnlqPdaQZmHjCaOT
	7dHsq+YWGBT8O7e5NbqUnJDWTukianXochjlM3mb7HBHRzJ+bbUSy0RurCL0yKeNOw==
X-Gm-Gg: ATEYQzzAZpjObc95C8q18ZAvL8FZicWFHgAf71GjrL/+aWJ1hyUUcFiGHSawdiQ2TAj
	0meKhgxhdfUJRJ1YHaXGf42kr+ULGlV4cDCJbcdW06NwPsj7tigjOIxvgK41079NYzTzMVnBKSY
	MGfiqr3y1xT4WotKTGYtBmFzPVQbQzrDebCAP/7PrFF65TH7f35hLwOvHgy/VYbF1umCwmLh9Zm
	hSRVzosqfCy/BZKbC25RibAbIKUeHLdDi1fCVZxGXFmIceVW70jHLybX/Zw404xPwZ1BrCLXKCS
	iUsdyxBRvhhuJGDoH6KPpgF/BRJGso2V6gCyUusn/IVK7Kaw/N0RGs4D5WI2PJbjaQ3aWKqyBNJ
	ONsxv3G7wvk4h5A+l9glCs6Xg0LR1lhS9fU7Dsd4BMq679QcCXvvqZ/3y3xld7ctgOV67nQi6ZZ
	/nZE8BzqtiJn8mSLS1H6VNg9KnWAz+oipQH0vPzioEevvtraVZTYvpOw4W89Lx7VJb7xSftpqfe
	2VTU588iBpWra/mUIGQNnR6gQ==
X-Received: by 2002:a05:600c:c4a6:b0:483:6d4e:9811 with SMTP id 5b1f17b1804b1-485198c1c17mr36809295e9.31.1772635636490;
        Wed, 04 Mar 2026 06:47:16 -0800 (PST)
Message-ID: <0c556f7c-6567-43ec-a9cd-eb542fc970b3@suse.com>
Date: Wed, 4 Mar 2026 15:47:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/S3: restore MCE (APs) and add MTRR (BSP) init
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <12fbad10-78ad-4679-a1db-3995e34da094@suse.com>
 <aahDX_QvrB1MTLcq@mail-itl>
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
In-Reply-To: <aahDX_QvrB1MTLcq@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BA8AB201E41
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
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:dkim,suse.com:email,suse.com:mid,invisiblethingslab.com:email];
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
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 04.03.2026 15:36, Marek Marczykowski wrote:
> On Wed, Mar 04, 2026 at 02:39:01PM +0100, Jan Beulich wrote:
>> MCE init for APs was broken when CPU feature re-checking was added. MTRR
>> (re)init for the BSP looks to never have been there on the resume path.
>>
>> Fixes: bb502a8ca592 ("x86: check feature flags after resume")
>> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Sadly we need to go by CPU number (zero vs non-zero) here. See the call
>> site of recheck_cpu_features() in enter_state().
> 
> With this patch, I now see the "Thermal monitoring enabled" on resume
> also for AP.
> And then, the "Temperature above threshold" + "Running in modulated
> clock mode" for AP too. But, I don't see matching "Temperature/speed
> normal" for any of them...

Which would imply that for each CPU you see at most one such message after
resume. Can you confirm this? (Generally for every CPU they should be
alternating, but appear no more frequently than every 5 seconds. Albeit I
can't help the impression that it is possible for the current state to not
be reflected by the most recently seen message, for a potentially
indefinite period of time.)

> My simple performance test says it's okay for now, though. I'll see how
> it looks in a few hours...

I actually don't expect the change here to make a difference in that
regard. intel_thermal_interrupt() exists only for reporting purposes.

Jan

