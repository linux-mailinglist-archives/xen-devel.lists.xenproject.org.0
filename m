Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Af4oCE9lRmqYSgsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 15:19:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 736076F8403
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 15:19:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=WsYyfrrt;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1351883.1608899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfHJj-0000b3-E0; Thu, 02 Jul 2026 13:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351883.1608899; Thu, 02 Jul 2026 13:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfHJj-0000YR-BB; Thu, 02 Jul 2026 13:18:59 +0000
Received: by outflank-mailman (input) for mailman id 1351883;
 Thu, 02 Jul 2026 13:18:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfHJi-0000X6-7h
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 13:18:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfHJh-005sZh-3I
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 15:18:57 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a466532-bab6-0a2a0a5309dd-0a2a450c867c-24
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 15:18:56 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a466540-f399-0a2a450c0019-d1558035c853-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 15:18:56 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-493c19bad03so14857945e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 06:18:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c6354926sm58037265e9.1.2026.07.02.06.18.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 06:18:55 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782998336; x=1783603136; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f/ZNJVP0fUmpD0EWNlk5M4ki1CL0rYI/U52aPfaxbz4=;
        b=WsYyfrrtWoDIpamn59Lt1Jb/jnAI2UAlo0GJ8qW3UBbBcHroPtgtTSq/Bgx9Mzxh9S
         a2c7p3gxKOXsRojFf/D5RKnpKg3spkV5olmi4sCZ1FJVaJaHnHvoleuUfrigy6zy1sJh
         lVvpR/7NpT9AsesF0yljEVah+ZdeiLxf8oFJo8JEzmw+cbNnjh3HirspVZ9MPDRcrSgu
         WrKW9ZWx5ztYq+Yjrr/YfCDQUgYVkYeWqOGzy5db8rSXMvmcvARkv+T3ysXYNdyEj6wP
         MbsQ+Dgyv4tqJRoo2c61R8HkupmRzEwCHd/7sRt/hb///qdLltrykjMNeRDW1Lp/lhCd
         GDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782998336; x=1783603136;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/ZNJVP0fUmpD0EWNlk5M4ki1CL0rYI/U52aPfaxbz4=;
        b=HwBRcBY3WovYDjCS0Xu0wmo8aBlW5ijKM3nzhhbuXveCJOCd0K8JX9ucVsP09EadNx
         rRi64g4wqUTzzYYnYtBZrebnM1ski5zt/j9G7eandmKAcMrMFvPYI026PxIWstTzWh9p
         7w30wEGsb7oGFhRPweKIjkwfC5h/I4vPJHA1zLvExoM1FFusioylfQOt8K+8ziw2jCBb
         yI3D4LaHQ00tlgCrrxl3KAFIGN0AzsgkVd3CGzJMEiDZ1t/W3CG5m5pbx68Fokz+EyFN
         0d26QdDkyiHyQWeW6Sh+zgWl49xkc7Pqj2XvByjpBXMFkXyeHA12iMvwrHMy4ZabZ9dq
         1HzA==
X-Forwarded-Encrypted: i=1; AFNElJ/SQFr8geir8/3zCyqQYUKSblJHTsaLPuWdEqtH9wUpyxEoklcrwSlaI7VmVL9dhfY+i8bl5KKaXN8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBIEQXFC+912utB6KJlLeckHahWyquXMwcBnwPj9v5o0AtlRS2
	Bq8boWi2Rwx7X8/M/+i616ITHd5yCY66vFEX9qWzluoQJnMJztjpMLiCIMAvDrAs4SpVGD2mSMY
	vk60t2A==
X-Gm-Gg: AfdE7ckixdpLZqHdL6E6XoTMmX+xu9+Qtx66Yj5idTrSw+FLTySwoWvOQbWgh0hkVLO
	OVPghlu1cK83RqjT70mRA/y5Uy1ggjsuveYLrKz6Oo4htItW/SBunGk/eMy/3MSSruM/kPh1PyZ
	p6PXrFgolIp0Owhh0ii3cfNtSYOpt1F/PRckRZ3tuTDD2NrN0+pG9MSkIfP2Co32A/Hh9U1JVCb
	mPiM3H/ZHaO4w7pX+LSdQRZit719879LplB902tPyOepnvXk1mvZ9S8RG9pIKEv3ay7GlPufV6l
	iA468rxh9QgV0oCXodLuUGNHowfbV9kKHCXFhmdaAdwGvAyJab9wTKMOPHfpacIyT0IYPcWc133
	dxTJkfRzkTFGEB/BqkqpsACAW96RAhijmjE+FYNFVihcwi9lbIxotWMySGuDYR8FBla4C2qDViv
	Yhg4BVXW3Lv4Z7lK6mM2x9jQq5tToSblm3+csswl4QbD6avnHOOn9KSHFnUCU+To8Jy1yjdqQrV
	suPOZRxpxGW0fo=
X-Received: by 2002:a05:600c:a00c:b0:493:c4e1:40a6 with SMTP id 5b1f17b1804b1-493c4e140f9mr45568225e9.32.1782998336287;
        Thu, 02 Jul 2026 06:18:56 -0700 (PDT)
Message-ID: <20836109-fadf-4ad4-ad9e-9fa44883716a@suse.com>
Date: Thu, 2 Jul 2026 15:18:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] x86/HVM: don't (almost) open-code POP_GPRS
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7ba5ecff-af64-49c0-abf9-23963ca56aa6@suse.com>
 <a89951cb-43c0-45bd-aba1-273cd053deae@suse.com>
 <6065311f-15b3-403e-b39c-f9652f0513ff@citrix.com>
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
In-Reply-To: <6065311f-15b3-403e-b39c-f9652f0513ff@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1782998336-91128D51-B08C898D/0/0
X-purgate-type: clean
X-purgate-size: 1206
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:wl@xen.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 736076F8403

On 02.07.2026 13:31, Andrew Cooper wrote:
> On 02/07/2026 11:55 am, Jan Beulich wrote:
>> It can be used as-is for VMX. For SVM the special treatment of %rax needs
>> accounting for.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> This is the minimum required as a prereq to the next patch (to avoid the
>> need for custom adjustments in the two places). We could go further and
>> switch to using PUSH_AND_CLEAR_GPRS at the same time.
> 
> I've got several part-series that result in purging SAVE_ALL/RESTORE_ALL.
> 
> If you want to put this patch in, then Acked-by: Andrew Cooper
> <andrew.cooper3@citrix.com>

Thanks. Yes, I think I'll put it in as one small piece in the move.

> but I firmly want to finish my series before
> patch 2 adds yet-more complexity to macros which I'm wanting to remove
> for being too complicated already.

Well, if you make this a strict prereq, then I might as well make one or
more patches myself to replace at least the SAVE_ALL the next patch needs
to fiddle with. Or else I'd like to understand when you expect your work
to arrive, as this series imo is one of those which have already been
blocked for far too long.

Jan

