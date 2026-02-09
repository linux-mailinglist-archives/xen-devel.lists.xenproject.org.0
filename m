Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEm1L1cKimnKFwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:24:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9751127A8
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:24:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225731.1532298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpU47-0000DD-7y; Mon, 09 Feb 2026 16:24:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225731.1532298; Mon, 09 Feb 2026 16:24:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpU47-0000BJ-57; Mon, 09 Feb 2026 16:24:47 +0000
Received: by outflank-mailman (input) for mailman id 1225731;
 Mon, 09 Feb 2026 16:24:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpU45-0000Az-TY
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:24:45 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d81f7ac5-05d3-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 17:24:45 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4834826e555so6182165e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 08:24:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483203d5ef7sm140940585e9.1.2026.02.09.08.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 08:24:43 -0800 (PST)
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
X-Inumbo-ID: d81f7ac5-05d3-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770654284; x=1771259084; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t3SkBfniM4CMpQmsE2OUcSyYgPlvgbiB4rgan/SixUg=;
        b=abz4L3vViBeUeIMY7tERJJUT+U7PxcA6sT9cbFk3sFx5KGEjPORSOQHunIq3L56J6T
         LvvSEcQ3cyz61eerxefll6TWbLEUGcX/7OST8czPAd2Yqn7z2o+3JbU8vUNfioUR/ulg
         h5izrzGeL0oI0zK3jXhhDpx+XIBqraHDsA+doNbtj94z3AeQ490FL2bm4p2P8wplsiHn
         y1a4dM74jTovtsFEpI0rryb6oCMcpV8+wfHN4LvoIUnWg+8ftIm+RTwTCOp5UPibF5lo
         fvDtg2VKlXm2/fJhKgakmfDKHMKxlvKx4b9IsDAIDoG8bGuCfm//bLoYssgyI8f6dTfg
         YBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770654284; x=1771259084;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3SkBfniM4CMpQmsE2OUcSyYgPlvgbiB4rgan/SixUg=;
        b=m3vhSm5qxIjnTDb+9Re2WcAphQINUzYJeaBz4+Q8PFfdNbs5PSUtrzLU2Y97pQJgmD
         ikr3tF5daUNwrYltKR1P1vzKuoUsHLX4vXBKcGh5aDRMLrOybKTgdPMp/xk3by9kXRDV
         aqHwrwVJKINuRdMFCEa39s1UXjSevZsGxkW0bPwY/Tz+7en23eiZSJPZOApWDa/WyuGN
         BqdMTUsssXTBPqIe70EYvfc3ag67lQTDFMuZBwo7UeHmcNJdgpFyMN4rOyg7K0KtBnBn
         2aaNkQagNPiTtRDn/swpQPzozHHyF5rkdTj5WBQx8hgmMaaP5S0ZszRiBbHC9Gbnjuxr
         yzWg==
X-Gm-Message-State: AOJu0YzKe9Dr+p5bxpM5ZxMYp0fMi1pbLDuuVGlwuB5YxZ+SpWbvXj/D
	eDHVwqi7nyFajsFpMYYe35AhVbckkFGoGGiYKBPSUy5OExnPUPASx2XOE3dz7FpIIA==
X-Gm-Gg: AZuq6aIQnp/nds8CqRTijPrrp4y0vgeZBb8g8CfR/zZ07S0QElfRINw+0VI8sJHalEl
	gEQY5guhTZzS0Z0nxutTKyy3xhKWzHNXdh3VSkopi0bezyZ3VW3+ChKZ05o1Apid0rP95I78QCb
	a6kisNBlcKZyiGDhmkzimTbHFAdSSyLKUImhWhjG9nBXYH1cbi8fJPGQaZMMRsnDlhDlmP7Yc2q
	z7iEbeE8dfFss+60K1MWZ6m3CBKuAgy6xyYkoQeQxsPZ4L2ids8iBE79lrPMXMiQa92PNqd2UFt
	/t2eyruSNk3F66ek4XgWipaWrIy+Styxi+KkbWIuRHbZvIX8HE80KOTlGaKXAyOfH165/K/x5Hh
	SjV6YaeG5PMosoCGR6xmPaX81MrpnwlL63KBE/xyty9lUKQpx2XzsXOAA8fgx9UNt7Z9Ml55MWw
	UubIzlDeUaMScYHkNzSaot65ECLhsTfIPxZPJ0gJp4mUA+cyRibcGGxIXDDZmR01bIMSspUqCQl
	eAc4C56dOCPdWo=
X-Received: by 2002:a05:600c:3509:b0:47a:975b:e3e6 with SMTP id 5b1f17b1804b1-48320216069mr144133665e9.18.1770654284071;
        Mon, 09 Feb 2026 08:24:44 -0800 (PST)
Message-ID: <193c1ed0-75dd-4881-b6c4-9770cbb347d7@suse.com>
Date: Mon, 9 Feb 2026 17:24:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: short-circuit HVM shadow guest creation earlier
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel-bounces@lists.xenproject.org>
References: <20260209144049.86535-1-roger.pau@citrix.com>
 <DGAK325RDOQA.3QQFQYK6R0KWP@amd.com> <aYoHO2WDnVR4wIL5@Mac.lan>
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
In-Reply-To: <aYoHO2WDnVR4wIL5@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:xen-devel-bounces@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2E9751127A8
X-Rspamd-Action: no action

On 09.02.2026 17:11, Roger Pau Monné wrote:
> On Mon, Feb 09, 2026 at 05:02:26PM +0100, Alejandro Vallejo wrote:
>> On Mon Feb 9, 2026 at 3:40 PM CET, Roger Pau Monne wrote:
>>> If shadow paging has been compiled out short circuit the creation of HVM
>>> guests that attempt to use shadow paging at arch_sanitise_domain_config().
>>> There's no need to further build the domain when creation is doomed to fail
>>> later on.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>>  xen/arch/x86/domain.c | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
>>> index 8b2f33f1a06c..8eb1509782ef 100644
>>> --- a/xen/arch/x86/domain.c
>>> +++ b/xen/arch/x86/domain.c
>>> @@ -627,6 +627,12 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>>          return -EINVAL;
>>>      }
>>>  
>>> +    if ( hvm && !hap && !IS_ENABLED(CONFIG_SHADOW_PAGING) )
>>> +    {
>>> +        dprintk(XENLOG_INFO, "Shadow paging requested but not available\n");
>>
>> nit: s/requested/required/, maybe?
> 
> The wording matches the rest of the messages in
> arch_sanitise_domain_config().  I'm not saying that makes it correct,
> but if we word this differently we should also change the others
> IMO.

+1

>> Also, with this in place can't we get rid of the panic in create_dom0() that
>> checks an identical condition?
> 
> Hm, I would possibly leave that one, as I think it's clearer for the
> dom0 case.  Otherwise someone using a build without HAP or shadow and
> attempting to boot in PVH mode will get a message saying: "Shadow
> paging requested but not available", which is IMO less clear than
> getting a "Neither HAP nor Shadow available for PVH domain" error
> message.
> 
> Just my thinking, both checks achieve the same result, but the error
> message in the create_dom0() instance is more helpful in the context
> of dom0 creation.

+1

Jan

