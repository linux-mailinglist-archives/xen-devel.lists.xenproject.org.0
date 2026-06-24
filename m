Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ifNSNmyzO2ovbggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 12:37:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EE06BD6BF
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 12:37:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=AXCYzJuF;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344762.1603795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcKyp-0002Gu-RM; Wed, 24 Jun 2026 10:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344762.1603795; Wed, 24 Jun 2026 10:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcKyp-0002EX-OY; Wed, 24 Jun 2026 10:37:15 +0000
Received: by outflank-mailman (input) for mailman id 1344762;
 Wed, 24 Jun 2026 10:37:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcKyo-0002E8-KX
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 10:37:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcKyn-00HTHC-IN
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 12:37:13 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bb349-5cb7-0a2a0a5109dd-0a2a4507daee-46
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 12:37:13 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bb359-4766-0a2a45070019-d1558029dd1e-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 12:37:13 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-49222fb062bso9063745e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 03:37:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c22c680fasm5635472f8f.34.2026.06.24.03.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 03:37:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1782297433; x=1782902233; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ucWgnpTCF51EIOyo3GCnRu7JsJCy9+YwE1oOUaEuGbI=;
        b=AXCYzJuFQWFKiKZ2URfC5LknIBbyX791vEjQ3PyLNqiSqHmebad2h8dMQMkb16Ax3H
         HD1AVAqRI+tzI0NjlVD+xNuOR9CwAWNdZH/IERzuvGXmzqmNulE54ir4CStCpxqmDFSY
         5stxmFM09+n67ondqr4wg0hK3pD3GZpYWtFYKf+9HO0tkfmn2iHdK/0mFF99dCozi4Kf
         i+RXSBVUHpEHWWwZrmsiBog6M9qax8zSSNRHQw8L9OhyXGO9JxlQbwUp/MUQqkcLMkdR
         UVY/Tvbo+K29yzfMzBTfFOMMa/eisCKKkqotqrOBaEkr83Gy8bt4xNvu15Uqzj3bG++l
         /mAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782297433; x=1782902233;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucWgnpTCF51EIOyo3GCnRu7JsJCy9+YwE1oOUaEuGbI=;
        b=JgGHL9AjOYi+HtS6k2kFCk0GsHDup7QjMjby7OgAJZSFDSgtHRkvAJupywthLPlYoJ
         Aqeptua2MRGTUL2dINyeVQoGif8kHciTfHVF4F9jGG3+3v3Usi8/CIkkWHkT08q1VySK
         PGGm0M3XVIOpd8lOEaS53vpst9YQskd5Ja6rMuSrHfKdE7rtF4buDdrK3FxcFLR51FWS
         PJ7moHacGq3oVWeAFVVeanEw5dyjJH2T9WyFM1hLuLyJZr+HJIXhSrlPMfrfJb3gBSAk
         qPvb23lyE3QLqP6ZSJpAk20lgVeNMhVmwDovT44bH3NQgilUYgligcn3vdL5xNAfbPnq
         me/A==
X-Gm-Message-State: AOJu0Yy7x/WVdJ57IMZhQF11SH97zSLwlm3qz63uv+PC4RipuIbg22yH
	zsWuSTjjcO4PDX3P6DQ+BlI0Yvn9QnUBGmnlKvQ9k0/pn9GHs9/LVnxsfKB+z6zk6g==
X-Gm-Gg: AfdE7ckjFKDkroekmuRTgx9udAV6xIykHOnN0SLJErHVPGKpBNdvKRrnKmw4/hkGplD
	+o1X3xQVATLaOX358TQy3AOB/JNO/xl0KsP5ffcOrMIQQMN2uS205xynItQYlVOuE1Qj23ZlA0u
	fSWIha5ez6zBogxcEi6DJJRrc7UfJVvtzlF4XWrSaM37ET+tVMlwC36/CKEQ5hWDVXaSr9ZBO74
	ehRBOozweqry2wGVnSD/zs92S7iXs+qJMNTFJv3dwPuWnXm5EINEPULr0o7eCoNiJycXVaPNB9F
	VG1zoDDvaz/Icr7l7IOgMjWWKyKjy2H8SExAFsfLBPzsE8jxeoEllmZJT63dnf4Pl8yh6ntsj/O
	j0hQS3ySr1EjduBpcytTlrbk+WsBaVswkNCOaLiedwvdiGeE6lOQbcIXFEtgbDY063Nqg+Q7S+F
	TEjMbXnkuoe1GPtOLXphcL7/Oh0tJ/3mvPpbFp1IyR8H+V6i3eI4+Atso0T4/GshkSdFVZqq0Bd
	OcY
X-Received: by 2002:a05:600c:a07:b0:492:59e4:f3fb with SMTP id 5b1f17b1804b1-4926084a269mr38421775e9.3.1782297432576;
        Wed, 24 Jun 2026 03:37:12 -0700 (PDT)
Message-ID: <d2d794a4-dfd3-45c3-b5fe-836d0a0c2244@suse.com>
Date: Wed, 24 Jun 2026 12:37:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: sort obj-<...> list of main Makefile
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <fe611607-c4d4-4db0-85a2-445bbec5fc47@suse.com>
 <1e3b36a6-1970-4376-97fa-621899ae2ad4@citrix.com>
Content-Language: en-US
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
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
In-Reply-To: <1e3b36a6-1970-4376-97fa-621899ae2ad4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1782297433-88FF0979-97E5FF7D/0/0
X-purgate-type: clean
X-purgate-size: 1975
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
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
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 41EE06BD6BF

On 24.06.2026 11:10, Andrew Cooper wrote:
> On 24/06/2026 8:50 am, Jan Beulich wrote:
>> It is mostly sorted, but there are anomalies. Eliminating them gives
>> people fewer excuses to (blindly) add to the end of the list.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> Do you want me to pull this into for-next?  I'll (hopefully) be queuing
> the series which caused you to notice it into for-next in due course.

Feel free if you want to, but I'll get this in soon after branching anyway.

>> ---
>> Of course sorting with underscores or dashes in filenames is always going
>> to be ambiguous: Some may prefer C locale sorting, some may prefer sorting
>> as if non-alphanumeric characters simply weren't there, and some may
>> prefer yet different criteria. But those corner cases probably aren't even
>> worth formally settling on a particular model.
> 
> That's not a relevant consideration in this patch is it?  I see no
> ambiguity.

I thought io_apic.o vs ioport_emulate.o would have been affected, but they
aren't.

> Also, if in doubt, surely always C locale?  Pretending that _- aren't
> present is definitely a bad sorting algorithm.

ls looks to be using this by default, so it can't be all that bad.

>> x86_emulate.o coming rather late in the list may want considering to make
>> an exception for: It takes comparably long to build, and hence it may be
>> best if it got scheduled as early as possible in a parallel make.
> 
> Move it to the front with a comment saying "Really a subdir, but not
> expressed in that way" or something?

We have

obj-y += x86_emulate/

there, so excusing this by what you say would feel somewhat wrong.
Mentioning in a comment that it's there for build performance would look
okay to me. I raised the question mainly to get an understanding whether
such an exception would be acceptable at all.

Jan

