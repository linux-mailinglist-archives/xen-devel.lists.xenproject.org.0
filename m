Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6/biE7dPPWqE1AgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 17:56:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA60A6C7382
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 17:56:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="MVOz/ahJ";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1345763.1604507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcmRJ-0005X9-Bm; Thu, 25 Jun 2026 15:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345763.1604507; Thu, 25 Jun 2026 15:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcmRJ-0005UM-95; Thu, 25 Jun 2026 15:56:29 +0000
Received: by outflank-mailman (input) for mailman id 1345763;
 Thu, 25 Jun 2026 15:56:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcmRH-0005UF-Ky
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 15:56:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcmRH-003bf8-0p
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 17:56:27 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d4f87-2eae-0a2a0a5409dd-0a2a450c973e-34
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 17:56:26 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d4faa-f399-0a2a450c0019-d155dd31c4bd-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 17:56:26 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-464192ab2e1so1784827f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 08:56:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c2279b85csm16045723f8f.28.2026.06.25.08.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 08:56:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1782402986; x=1783007786; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9S02mqoUKbOvtNufQ+Jpz5iHDh98M41Uigg4E/yxITc=;
        b=MVOz/ahJTpjVYPoKYl8/WhuRBAHN3G4n9b4DjKFczmiV0WRKX/s5VxbLYP76JZAvGS
         wQJ392gol5kxs2tooIVz9RJTohirS/lo3zTz3ZHg8AXa/J5R8R6gaLWPVGvsRvptKcsO
         Y10qZVZzo55O0toXGVw7zkc/IcTpATbdWTWGVR7I3heXSlwjCH75dcpqV2HXCqEg2wTE
         JtX1XHQjqn8RyrXSo6RzvDuQQYjmVOsH3hFbzPg5HxJKqYfgP8m4I0kJigQw2jyBxlwx
         Ecl5MN4FwC//4qShSVRhxYvkpf4Xo5+mePYsTTWKSZlL1oI2Q9P+zgYxbyHQEhcXAfCa
         T/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782402986; x=1783007786;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9S02mqoUKbOvtNufQ+Jpz5iHDh98M41Uigg4E/yxITc=;
        b=nTsx9Bq+NKiABf239HOrSgw8kgz1h8uRSpmWdYgRvIInVCjkvjzqRGt3ZkK9PoSjMW
         8qwM2rCqwStx05ODyEMCqQ0wGFDGIKQb0lPmU7m8SwcN80tAS0pp9JhqVADIwfxeGNpJ
         uaIow0w8AT/c9yq9PXslMYNMyHd2WffS7OnaGMLuR3ZmQ/+9bASKUXLekMq8Yiqbm1U/
         UGrjrGkloqK+pyXjq8/ZI7nowyJdUgDs6ESgc70A57gsxe6G84P3iUrWaZuyMZqmqd7Z
         ZISl15X9JAb6E3wqQErTnPycdZwX50I67qO76xPkmJ4J3QOptz/XJxgMcEU8csQh7CdU
         Cz7Q==
X-Forwarded-Encrypted: i=1; AHgh+RrHYu3krkXWXFV3yDkeLWavKLrBGHZExyUtV3fV1WdvJena9V6cJKZpoLdvsE+4pu9n+mnBaffsP7I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmzcqrozXXamTDXVRJ+MYEOhlHKSin3+eeaVLABdjgjIIce5LM
	Nh7CQK8J0XLuCw6VLSy+bKRV71D4NIHq5gvgyZBQQP30r9+tlvjHcXNClRRvOgoW0A==
X-Gm-Gg: AfdE7clG3scUmzPytNCPRItjlvPWcMT4cGDRne2YCbDCHC91nMllOKZoEBRxQrvhm5y
	1ObLTWG3KkE4etwJkqes7+b3+VkhGgLHLyD/yR2Iq+fR4YhzHz7OYSbV2qaAuSj/aEcEB83w12o
	xhRQsezU4U/I5u9m/XkJ9aqY1DnVFVobg3er7RF/cQb6dCTBz3HSaP5VDHbVljQEqpzyCymKXsw
	PSD2dEE2rwNNqvz1/fXw/8KwvRcvCV0ILm3KtRvRjpsVsLEihILJgrsTpI5cyRDmmJUrLxGmXpE
	keKk60cAicBmNdHkZbaikcStgFk17fDp10C7SwygEl0nVbvqKk1qgAmEv6t+ptG3O54jrxP7aGs
	zCsFnXiYcntifQu3R3fGJNjJ0Cclq3ReenK9a+BJ0PKQrVG6n8j/84oXqb0epqmhYVLLF0rp29D
	9RvfROyOS4cLeIW1Z5EgLJL8xenjtHHe58rMRfKTnggAuREq0VzvGRt+4zL66eW/UG0QGzYUkO5
	/tt
X-Received: by 2002:a5d:64cb:0:b0:46d:7259:fdf6 with SMTP id ffacd0b85a97d-46dc0efe433mr5123496f8f.20.1782402986298;
        Thu, 25 Jun 2026 08:56:26 -0700 (PDT)
Message-ID: <cc4fe54c-a245-4c27-b629-da519093116b@suse.com>
Date: Thu, 25 Jun 2026 17:56:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] x86/passthrough: Wrap pt_irq_create_bind() restart
 block in braces
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
 <1777298079.8631fc262581453bbf619ec5b2062170.19dcf387e25000f373@vates.tech>
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
In-Reply-To: <1777298079.8631fc262581453bbf619ec5b2062170.19dcf387e25000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1782402986-91B25D51-F7B06FF6/0/0
X-purgate-type: clean
X-purgate-size: 683
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA60A6C7382

On 27.04.2026 15:53, Julian Vetter wrote:
> Enclose the restart/retry block in pt_irq_create_bind() in an explicit
> compound statement to prepare for its extraction into a helper function.
> No functional change.
> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
> Changes in v4:
> - New patch
> - Split out as a preparatory no-functional-change step to make the diff
>   in patch 5 (pt_irq_bind_msi() interface change) easier to review

I've been staring at patch 5 for quite some time, but I can't make the
connection. Perhaps you mean patches 3 or 4, but without you quoting the
title of the patch in question that would be pure guesswork.

Jan

