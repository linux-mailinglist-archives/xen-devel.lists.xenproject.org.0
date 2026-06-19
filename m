Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ee3ZJ3PgNGp3jAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 08:23:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 038F56A415F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 08:23:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=PLD2wvn7;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1341706.1601974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waSdW-0007SB-27; Fri, 19 Jun 2026 06:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341706.1601974; Fri, 19 Jun 2026 06:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waSdV-0007QC-Vq; Fri, 19 Jun 2026 06:23:29 +0000
Received: by outflank-mailman (input) for mailman id 1341706;
 Fri, 19 Jun 2026 06:23:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1waSdU-0007Q6-9d
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 06:23:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waSdT-005zx1-4W
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 08:23:27 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a34e057-bab6-0a2a0a5309dd-0a2a4504cf80-26
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 08:23:27 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a34e05e-5f9f-0a2a45040019-d155dd29e4ee-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 08:23:26 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-460662fcb4eso1232456f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 23:23:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fcd7027sm43940205e9.1.2026.06.18.23.23.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2026 23:23:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1781850206; x=1782455006; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6bfhodsip9J8dS5Us8P/2FvVfaqI0dYSwiPT8GwFOf4=;
        b=PLD2wvn7mEZybWhtgJ3oyz1lqtBpuak4kR0XmFNacQhx/1f+WzrzMvK/+6rPVMf9/o
         UMuE2mxRoFqj12AMNdAf0kyui9bfT3/vbOHwOhKFEgEhfuVSWcxy8vw/m9QSDm7mkg4r
         PFegCFksQDvylojab0gQmeM/AHZ4vYOKXSuqWA8CrC/tJoOC5b50N3kD7wd2u6N2Z6v5
         BeS9EmjlxlgSjCPkpOz3ljCpewOHFAzzXY8vEWHXiqHHP4Vnj6L0Bm7fhTNM5uBGd0Ve
         fY+jjjMYauglDPLQ75LMEQ5X32Ai+i1TT210LFpGO7e1+WNGV5wbos0WZCkFQKFeCkIA
         PqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781850206; x=1782455006;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bfhodsip9J8dS5Us8P/2FvVfaqI0dYSwiPT8GwFOf4=;
        b=DJrqCbo35PXW2x5k0/bhaFUHN17zIGR86lIZ18iT1iuItYqv/WTBRWblc56i19DdYy
         GTFv4OYXXFrTQyXJIERWpjBK77j0Fe2KkCLMYhmY6tnHp2vgLdF2SSwJ83+wjCexX3UP
         mTdfF20Qtz12xVwycdq1NAX+CJBn5yAvkx3YKnCkFOkrM6iuGVbKjnGvFeoX5ErC05bJ
         QIbRtOgOm5ZTOBL8YsKKIAG0dMFZkFPvNzSo2DdgfvsCg2gfMX+38ac8qmv2jF0gtuIc
         ZrMD33AJ+no5MHanNJmKj+NR9UU1ouW7pDRRoMPyLIqvDxmsI3MXEcX+PQnSQWUvxtsu
         Emnw==
X-Forwarded-Encrypted: i=1; AFNElJ+horAg9tutZq3ETr1kpOBEQrmYmSX9q7/R2hk7pBNZTUCpovNaYqasHmbWl0oD1u175MuOShgfeXs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0qSob8QL7R1QmqM2mHH1QDdpZku+mCgL4nUEI+q/SiHHx6Bei
	KLia/UQFYGRKfwVAF3o4x9QaRzrdLZ1IQBY1LbJU/6bbzu5x7VgZuMTfu+Hzifp32Q==
X-Gm-Gg: AfdE7clINHA9LrMRPBCeJ//jcEcrKmyxTMDipmmKHuhgyPfeW7qvZm24TCyMgzIltbF
	cJdN0zemEVq0jd1b8O85ucRZKNqlJ27E54jl22z78o7ltPrFVxO4aeCO6zSTWrxYxrvKIFocY/4
	jO7QnK583LM8WjlGBSS7qKuO0D2myl0pP/zBZOtjDVIvSVsQTaPpFhho0BVdDSTck/+zaqw6HG9
	NgYUoAqLND2EDUWnn/5KCxtXD+5xRm2n+2ctHXnmAurzlZccpmYQdaxy5acgpAsHi1KnZ+td624
	2QhuSqWxxeKTeQ0xOEY7Pa3MScgys94wRW5+fImrIUJdk5s1bdxWGI+1CWRkA3XCDFzFP6b28Xr
	WVBsn+bZZJpUPvhW7lLeqnZ84A/YpNQRkzKIQNpNJPUFLAYeDz3P+aDmU1niKx4o5ydla7tV8LF
	zcvuKRgyoWhixmFlKEWi19vrC4kzfTvQ0HmWPUNdjUeNtLOcIdFHCpRYSjI8GFj64JySmTGF6Yb
	OUj
X-Received: by 2002:a7b:c456:0:b0:491:8043:5c4a with SMTP id 5b1f17b1804b1-49240e95431mr23855055e9.31.1781850206470;
        Thu, 18 Jun 2026 23:23:26 -0700 (PDT)
Message-ID: <9a26d6fe-9eab-4ca0-b9ba-507689395790@suse.com>
Date: Fri, 19 Jun 2026 08:23:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/15] vtd: Use pci_sbdf_t in acpi_parse_dev_scope()
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794551.8631fc262581453bbf619ec5b2062170.19edb3b36a1000701b@vates.tech>
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
In-Reply-To: <1781794551.8631fc262581453bbf619ec5b2062170.19edb3b36a1000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1781850206-467D5141-2FBF4F04/0/0
X-purgate-type: clean
X-purgate-size: 1236
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
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
X-Rspamd-Queue-Id: 038F56A415F

On 18.06.2026 16:50, Teddy Astie wrote:
> @@ -386,16 +381,15 @@ static int __init acpi_parse_dev_scope(
>  
>          case ACPI_DMAR_SCOPE_TYPE_ENDPOINT:
>              if ( iommu_verbose )
> -                printk(VTDPREFIX " endpoint: %pp\n",
> -                       &PCI_SBDF(seg, bus, path->dev, path->fn));
> +                printk(VTDPREFIX " endpoint: %pp\n", &dev_sbdf);
>  
> -            if ( drhd && pci_device_detect(seg, bus, path->dev, path->fn) )
> +            if ( drhd && pci_device_detect(seg, dev_sbdf.bus, dev_sbdf.dev, dev_sbdf.fn) )
>              {
> -                if ( pci_conf_read8(PCI_SBDF(seg, bus, path->dev, path->fn),
> +                if ( pci_conf_read8(dev_sbdf,
>                                      PCI_CLASS_DEVICE + 1) != 0x03

Another formatting remark: Technically the two lines above now can be un-wrapped
(as you do in other cases), as the result fits on a single line. However, with ...

>                                      /* PCI_BASE_CLASS_DISPLAY */ )

... the comment in mind maybe overall this would best be as

                if ( pci_conf_read8(dev_sbdf, PCI_CLASS_DEVICE + 1) !=
                     0x03 /* PCI_BASE_CLASS_DISPLAY */ )

Jan


