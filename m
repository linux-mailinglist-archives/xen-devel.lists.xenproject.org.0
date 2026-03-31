Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPK6FCjay2k2MAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 16:28:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B824B36AF58
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 16:28:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269009.1558169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7a5A-00084C-Kg; Tue, 31 Mar 2026 14:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269009.1558169; Tue, 31 Mar 2026 14:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7a5A-00082j-I0; Tue, 31 Mar 2026 14:28:40 +0000
Received: by outflank-mailman (input) for mailman id 1269009;
 Tue, 31 Mar 2026 14:28:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7a59-00082d-7V
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 14:28:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7a58-00Fcay-JT
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 16:28:38 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cbd9fd-5cb7-0a2a0a5109dd-0a2a450ac636-42
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 16:28:38 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69cbda16-1772-0a2a450a0019-d155dd36e9f3-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 16:28:38 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-43b95e5b3afso3375189f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 07:28:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d14c53928sm183131f8f.5.2026.03.31.07.28.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 07:28:37 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774967318; x=1775572118; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fH4wRtKzVIgGDJpY+fPXM+Nbj9QYXXdWqVlW01wy9mE=;
        b=TXaGQPa/nDjylBwYtHaj3k21m04DpMh+qHWwhhFpd7aB8vm5EXrxTakhIVdT9+kN3D
         B1R36tF+09d/xr7ae7wZZdx9bcN86NRQ/EyO1OCHkDBu0mUFnSkwKQ7jtVTmwUo1RoHX
         5uTh5eWlwMxpd28AheLVkUw6xTCC5AbzwiQ/0Urx9YWV0b7mumo76gpmIV869D9xYcmU
         bl+zHiMmcED+jhQLc0OYHBb81L5ApX0EMjGe045W2iU13mrKQvc4gf0yHdsYU0QPrD93
         MuVCGbliU6TwcArkOVu7PGRSe5uqCevHBMPariFmMNOaX9DEStUatz+bMb9U5Hie45SV
         PrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774967318; x=1775572118;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fH4wRtKzVIgGDJpY+fPXM+Nbj9QYXXdWqVlW01wy9mE=;
        b=eyR4DjpN0Urocfjxa6uMG9gPEHYNWzBTnFB7F2SKnJf675MymvqLDCmv3wj5LthmNE
         LnyfDxyofuoVpLGja7taTxHwczVD5Zz2OvqI1wi6omv492d/18s1VhHDfYv/xPNXuun5
         5aL4K7P4Pt3/n6FJCSnYgwz1KMA+8NL6drGdTFcBuujcO4R/rMSRXtdY3vJsx+7vlVq9
         I6tQK1t57bsayvHevxuR+BIoV+P+JDo05ekgsGCCTcMcU7EhT3s6S469sq7KK3bWpMiE
         kx+QT0civREzBIpK79AsBMvv8LBDIbxoI3T1fyv6kLDSL6BbBlhG8dkvHXMxnH5q0mm2
         NkQw==
X-Forwarded-Encrypted: i=1; AJvYcCXPKb0jVsWBdKrgyDiRgjO7/ap9GfGNQgnHJ20SmAUMiiBD0MslNOkLi4ObQnpse8ubMDbbHIRzvFs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxdqlPepfrr1t9DtOG1PmjjX7LcG/oaIhNnJtljHBABQwOE278
	62czT5qnHGI4u7noD1eu/3pdu/dlo8J8vuUOzNQ92XFeI1XvTZkyg8Fd+05sMGtpkw==
X-Gm-Gg: ATEYQzzptkI1+y5/36EmG0IjtgKAZHnu1Nu6TD6l0hKdm05VkQpBgzxcUHKbpj/hFiT
	hrqY/RNv48jdQlJBFsD4pKGwBBMoUAfWk52o/isAlhl8tn//4L/iK8Kg/I/hDxiwQ6pmjTe4Fsq
	rVRZTkBZe5VrM+FJwIT7U9iYP+hQOX7z5nMOTAmmBlIr0nk0PpI/cgWfPnWGFERZU7oDTf/2xnp
	1DNQr+x98N9rY81wJTg95j+iWmIT3N9t1LDke4u5d0kit2y+oUOAhvbIWHO033YvATUFPi5dDEx
	sSYwb4jaLXXFwGpF76svqyuvNJxI1CH4C7zIM+gza7m0ZqSdSTLaJFaBofK/kFW8xWiQdLUhvxG
	brt+iRGEX8gWB4t3roC/la5Lh+OcEsPhf6sUaivKQNVH/8pl7GucGMyTEad0nIRUuvzNhvGU5xc
	9naSh9agwH0qKSVem7+ZmNRoIjR43QwJsggLN4J6y4DHwix4SsF6OOaW3kh7oMD/zGwMvPFsHnm
	J8IUjF9VSkfBgA=
X-Received: by 2002:a5d:5f50:0:b0:43b:9a9f:8956 with SMTP id ffacd0b85a97d-43b9e99d921mr29169837f8f.22.1774967317766;
        Tue, 31 Mar 2026 07:28:37 -0700 (PDT)
Message-ID: <e4454dd5-0d17-4748-b2fa-67634e664667@suse.com>
Date: Tue, 31 Mar 2026 16:28:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] pci/iommu: Check that IOMMU supports removing
 devices
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1772806036.git.mykyta_poturai@epam.com>
 <0ba0f0a8a7db5c762fa59e2eec627199c023f8b9.1772806036.git.mykyta_poturai@epam.com>
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
In-Reply-To: <0ba0f0a8a7db5c762fa59e2eec627199c023f8b9.1772806036.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1774967318-53A9B900-15C74EB5/0/0
X-purgate-type: clean
X-purgate-size: 1353
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B824B36AF58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.03.2026 12:08, Mykyta Poturai wrote:
> before trying to remove them.
> Some IOMMU platforms, such as SMMU-V3 and IPMMU-VMSA don't support
> removing devices. Trying to call remove_device will result in a crash.
> So check that platform_ops have remove_device set before calling it.

Hmm, but both have .add_device populated. They ought to support
.remove_device, especially if ...

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -1545,6 +1545,12 @@ static int iommu_remove_device(struct pci_dev *pdev)
>      if ( !is_iommu_enabled(pdev->domain) )
>          return 0;
>  
> +    if ( !hd->platform_ops->remove_device )
> +    {
> +        printk(XENLOG_ERR "IOMMU: remove_device not supported by platform\n");
> +        return -EOPNOTSUPP;
> +    }
> +
>      for ( devfn = pdev->devfn ; pdev->phantom_stride; )
>      {
>          int rc;

... this is for PCI. (I'm simply not qualified to discuss DT.) This
being in the SR-IOV series, I have to assume for the change to be about
a PF de-configuring its VFs. This imo shouldn't end in -EOPNOTSUPP. In
fact PHYSDEVOP_pci_device_remove serves largely as a notification -
please check the xen_remove_device() use in Linux. That is, the device
is going to be gone anyway, and hence we'd better take care of that fact
in Xen.

Jan

