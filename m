Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Sew6E1zeNGrGiwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 08:14:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A60516A410F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 08:14:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="J/1yAeE7";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1341691.1601956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waSV0-0004pd-0B; Fri, 19 Jun 2026 06:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341691.1601956; Fri, 19 Jun 2026 06:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waSUz-0004mu-Tm; Fri, 19 Jun 2026 06:14:41 +0000
Received: by outflank-mailman (input) for mailman id 1341691;
 Fri, 19 Jun 2026 06:14:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1waSUy-0004mm-OU
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 06:14:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waSUw-00H8ux-TY
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 08:14:38 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a34de4a-bab6-0a2a0a5309dd-0a2a450bb26a-12
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 08:14:38 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a34de4e-5e53-0a2a450b0019-d155dd29b959-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 08:14:38 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-4602e2a0372so1373131f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 23:14:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46508a04dd1sm5653604f8f.7.2026.06.18.23.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2026 23:14:37 -0700 (PDT)
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
        d=suse.com; s=google; t=1781849678; x=1782454478; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SoIPhElsyxT0i10p2Y9YzkfqVMAbSTFP+IVSNu/1TFE=;
        b=J/1yAeE7ZE8D4vOXu6OYJc7K+Ye7jWXwFlJHwa2oMY95UrLTeeTrvlu9I7yUg3+4uB
         YLxd4Jhqo/4Q/X28TG080jaiKp0Tomgd/zVuMUPn7lEiA84H9wI1ZIrE+Q6juKY7CEHO
         WcHGMOLEc1KzHba8tbtU4NbuHXknXjLLj4B61Mt7WJTWUonnkD8/szvjZat/AI8+4kcy
         ieLB+L1REQp73ET2fzvBygN522ZAItDzr6nU5T/5JyyU4tjF+zkp3XCaMmrBw5DIGlpg
         wPg3ZhaIVP2/lMJgaLZI0Ga4c2BOsjC9piZZICGFjjzT2l0QXLcGrrvtcZr2li8Ac/FU
         JtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781849678; x=1782454478;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoIPhElsyxT0i10p2Y9YzkfqVMAbSTFP+IVSNu/1TFE=;
        b=s3znX7HIl2Pf84fhAIyAo7z3ToV7MfJClNVqTAyvuGIJCWSN2lmi3S6daUq1UlVVC0
         869V0ETUtooPVto1Yt7e6FAtdBNkBqr4ALVOgSwclYoUb/uOI/V2QJQL3b2JTvrFRrvK
         v7fk7PEA08WKx9WhSk00Oqtc9QR1dclO0c4U2VcdO1hYeiQezDCbk5E08oFAPwVCvr9q
         CfWcljNJMq0v+2HmIcQX7LyISFQMQK0crL2731WokZxfNBe1TVex1jjpvhdjnbVxHrBG
         Wotjf/sj6VOuVyMMNijIV2/bljCOz5FehvWDLoEqskIo/cjCqhug8Rc/Kviy1J2xabWg
         M/Nw==
X-Forwarded-Encrypted: i=1; AFNElJ+A0XF9Y71+J4BUF9Gm1WDOgzyJ6VIkUITKS44aikrWIFRGOko4A5X1YPKZifyIk1zvxntJvg8aewc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8WnaLlSHbcKw7dM00+ACY2iyT5Ym1NmIscXEA416AL9YNqwoP
	ycw3VuUh5SmH2nmM7GIpzS3pDu+nRQCVJyPdQijA++eV6LX3dCbNEXAjYhwHCAFOIw==
X-Gm-Gg: AfdE7cmoYchVoEkufe3Sp6ZgCvB6w2hUXjMfjsiFRSD0Eu3VRWCbzpy+PqPGZixasSB
	RgzXtzbuyNEhlDQZLlQa4Nml9xkuHvv/L3RNfZx3e2X9VQWtWuhn1S2EBbjvfR+Fsi1c8o6yhXC
	GP7L7CD9byI0qqbUKp6FZM3nYZPgPHEfyH+gNl/5P+932tZkRIgefYfSFz2BlYVMvDFTPvVI1FN
	kZADjnNO/Qkr1HU3BuIM8zYqCp9HlLhVNrxAeP6AMc4cw1BtFA8FjbzO3RaqRiWREpG3LzG54pM
	f1OZEVZwK1ZtvmVn+9t5b6oR0ZDb85l4HM767rMVU6JXdagdvb0WsT7FJvSwl8l5TY8NMCZR0DR
	uzyN3OY5LpLV6ImNpKt+cR1LX+b12u4MugxpeAdhahpPcs2kX/xavFjVpVgqpPNDQcqnSfZ6Pgs
	TNI3FQVqtTAlmHjZESL9SQx0JyfTU5HDfFEsuCbIGxYtqtAW/b9y7s54wjSjBrwGPioaFKWYJq2
	zSr
X-Received: by 2002:a5d:5d10:0:b0:461:dfe2:c7ed with SMTP id ffacd0b85a97d-4656dff26cdmr1632748f8f.27.1781849678062;
        Thu, 18 Jun 2026 23:14:38 -0700 (PDT)
Message-ID: <b7e19be5-5326-475d-8c58-68673ea159f6@suse.com>
Date: Fri, 19 Jun 2026 08:14:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/15] pci: Introduce parse_pci_sbdf{_seg}()
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794550.8631fc262581453bbf619ec5b2062170.19edb3b3411000701b@vates.tech>
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
In-Reply-To: <1781794550.8631fc262581453bbf619ec5b2062170.19edb3b3411000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1781849678-4F9EE00E-953C4CDF/0/0
X-purgate-type: clean
X-purgate-size: 1556
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A60516A410F

On 18.06.2026 16:50, Teddy Astie wrote:
> In many places, we're parsing a PCI string into individual
> parts (seg, bus, dev, fn) and then transform it into a pci_sbdf_t
> using PCI_SBDF macro. Rather than converting from parts to pci_sbdf_t
> and vice versa, introduce a new function that parses a PCI string
> into a pci_sbdf_t structure directly.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

You introduce two functions without callers, hence two new violations of
Misra rule 2.1. I understand there will be callers by the end of the series,
but I think we want to remain Misra-unregressed at every patch boundary.
Even for rules which aren't marked as clean (and hence blocking) yet.

> --- a/xen/drivers/pci/pci.c
> +++ b/xen/drivers/pci/pci.c
> @@ -202,3 +202,21 @@ const char *__init parse_pci_seg(const char *s, unsigned int *seg_p,
>  
>      return s;
>  }
> +
> +const char *parse_pci_sbdf(const char *s, pci_sbdf_t *sbdf)
> +{
> +    unsigned int seg, bus, dev, func;
> +    const char *out = parse_pci(s, &seg, &bus, &dev, &func);
> +
> +    *sbdf = PCI_SBDF(seg, bus, dev, func);
> +    return out;
> +}
> +
> +const char *parse_pci_sbdf_seg(const char *s, pci_sbdf_t *sbdf, bool *def_seg)
> +{
> +    unsigned int seg, bus, dev, func;
> +    const char *out = parse_pci_seg(s, &seg, &bus, &dev, &func, def_seg);
> +
> +    *sbdf = PCI_SBDF(seg, bus, dev, func);
> +    return out;
> +}

Nit (for both functions): Blank line please ahead of the main return statement
of a function.

Jan

