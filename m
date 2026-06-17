Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lY1WKXuJMmqt1gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:48:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BA9699433
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:48:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=X3iLdLj8;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1340329.1601376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZokV-00060M-4l; Wed, 17 Jun 2026 11:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340329.1601376; Wed, 17 Jun 2026 11:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZokV-0005yD-1o; Wed, 17 Jun 2026 11:48:03 +0000
Received: by outflank-mailman (input) for mailman id 1340329;
 Wed, 17 Jun 2026 11:48:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZokU-0005y7-8V
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:48:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZokT-00FVwj-H0
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:48:01 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a32896e-bab6-0a2a0a5309dd-0a2a450cba9e-12
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:48:01 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a328970-62f1-0a2a450c0019-d1558032e0d3-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:48:00 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-490be29c1c5so59945575e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:48:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa891acsm158171885e9.9.2026.06.17.04.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 04:48:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1781696880; x=1782301680; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i/yuomSbXovR0P5CmFbI/elANuQtiVn8KrgnSABmox8=;
        b=X3iLdLj8PjTMDWpZKbf8Wg3kUVW1HQRblOu5tR0QDtxXBkfxQH8IDglSdWCF2VIUxF
         diwpYdV1t8PoI8EcY3Yarnsz3UwI7LDGCFdoj8XxhTKZAa5qt9nxPnkwQDd5BZRZjbdD
         WlJG70WWrbwHMGpwEcFtL6R4jm6uXK4zBIwWzPo25qZXf7ZULyzMbEKQG/OWB2hjqdFq
         1JhioAU7Sq9Y+h/9+jnIM2TchMrdVrUQwtt6jUhNMTYLqurPhQpY8f3Dx1LNMs0QO7ns
         OCAd3xVRGBcIqkIpOtkGe1l6mLdLpmTVr7oZHbF50R4GBJSynNN4ALoxiCVw/cduWuR5
         I2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781696880; x=1782301680;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/yuomSbXovR0P5CmFbI/elANuQtiVn8KrgnSABmox8=;
        b=Yw6OFjnGokyM7PRp6iioLV1q7y9Sy6ZjbwZTOzjs0YhSphSqtBfwgasK3zbgRndZ3V
         V/MPunpqHke0H9ShHNkJOlXh1qp1DK3yFFgAT3MsGrsTdnWaHJE4ezX5bObzMN/sSUfw
         eUeZixotF5VYIZWbmgdySZZZmpYVHe857M9GmmizGdqr+idrD6okFOuLzweX+6JkVCyg
         2BXyiwPuUSuPkuoQf9Z+edwTFnqJBsVF7OB8ZcsVOHnaYURjpaPNe7Bo1/OPswen47Ic
         fcDYUmeCEQsrdImXKLJqh3B3tY9h62rh83XysTRLOTmoVl0GaAVEDW+bx7N8SnV6DbPy
         nRwg==
X-Gm-Message-State: AOJu0YxtFsPlGyERR5SWMuZhUlD8kcX1mXdALIOnhNhfQTpgmBjIFwvq
	3tMqpvBOfFJ0jHWoLTQ/BbASOqScayg3grZWnsZ78rveyuBo7rxVCzw8HGiRZD4QXg==
X-Gm-Gg: Acq92OGM4f1AgMg81ElfLfdcfAyqkdSdxnEOKETVbf+Dp4nKt5G3S+Ofo1EhQHRkCoR
	XjitRFD/UA6gihBbdPOeasYp0Oaz7vAtnXiAVzCBK684Py91EoDNPtPIhCma16rmqNoPraOT8Zc
	KhGcivCgOgMgh7S/GfeCOnItM00W4XSx0BIvoeGQy/zOjH2HHTo3BR/xstty27IL48cVQdQDc1u
	TFod3OwCmgv/uLKjzfm1K6hf7Fn08iUkTqmZpIuXms4yjAHO1g1yJrCiIo4D75/VnHRNuTOq2Z6
	YvT1joE3hs5cIq5m0j2o19I47Da790dysbrJdvnfD1NEq2G4DUPRI7khQOcTPvqFacXKzhFvQ8s
	YNOdoHJ9s20C98TRwqv5ERH9v+cUuLr0r6iAdaYzBB/ihQlK7FL8qph+y7P/+utMzoN4wJWnguv
	U+q6qP3UUrMg0hjCvx73tD3qRpkNEKL8nn/Y1UVqZ+kmzzypYpcYINiUk7YO+Rp1ePQ7wdAiOXF
	isC
X-Received: by 2002:a05:600c:a30c:b0:490:c024:2eba with SMTP id 5b1f17b1804b1-492333e2829mr54486315e9.22.1781696880529;
        Wed, 17 Jun 2026 04:48:00 -0700 (PDT)
Message-ID: <327ed870-9d96-4f2e-95f9-120c20914f4d@suse.com>
Date: Wed, 17 Jun 2026 13:47:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.22? 4/7] domctl: restrict permission check for
 XEN_DOMCTL_memory_mapping's remove form
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <ad1eb834-b2f2-4db2-b2fd-9d7f5bb857a9@suse.com>
 <f17b9ac9-abeb-44c1-8eab-6b08d563bc5a@suse.com>
 <ajKG59Vh5dAVcMRz@macbook.local>
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
In-Reply-To: <ajKG59Vh5dAVcMRz@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1781696881-E0965CF5-172394FE/0/0
X-purgate-type: clean
X-purgate-size: 796
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,xen.org,kernel.org,vates.tech,amd.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 13BA9699433

On 17.06.2026 13:37, Roger Pau Monné wrote:
> On Wed, Jun 17, 2026 at 11:27:42AM +0200, Jan Beulich wrote:
>> While the granting of permissions when mapping was already removed from
>> this operation, check whether permissions actually were granted when
>> adding a mapping; the check of the requester having permission remains
>> unaltered.
> 
> I would possibly reword this as:
> 
> "Be less strict with permissions checks when removing a mapping and
> only request the caller domain to have access to the region.  Keep the
> same permission checks for addition operations."

Sure.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citirx.com>

Thanks. I've taken the liberty of correcting the typo in the domain name.

Jan

