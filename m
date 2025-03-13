Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A822A5F92C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 16:02:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912407.1318667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsk3v-0003yv-FE; Thu, 13 Mar 2025 15:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912407.1318667; Thu, 13 Mar 2025 15:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsk3v-0003vn-Bq; Thu, 13 Mar 2025 15:01:31 +0000
Received: by outflank-mailman (input) for mailman id 912407;
 Thu, 13 Mar 2025 15:01:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2IX=WA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tsk3t-0003vh-E0
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 15:01:29 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09b702f4-001c-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 16:01:27 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3913d129c1aso890510f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 08:01:27 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df33ccsm2439585f8f.15.2025.03.13.08.01.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 08:01:24 -0700 (PDT)
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
X-Inumbo-ID: 09b702f4-001c-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741878086; x=1742482886; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1CBwzWImXpxS6A8+Z4zLZX1AmX9T6gxrClIqQeDIrjA=;
        b=cMRHd7jxHyyk3zGZ8SQHfw461tyXpkUk7l29eUqsNkjLx5WWwvDD7ZKyW7obviAHt4
         FszuJw2PWK++UmwffbUoEN+UE2db0rvoFV2xy8uvbLUcf/Inbmj5xOzlhrWOZcbN8r4g
         UpzFUdPK/tlZmFJQz98VtB15UY7teWwCLpPr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741878086; x=1742482886;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1CBwzWImXpxS6A8+Z4zLZX1AmX9T6gxrClIqQeDIrjA=;
        b=o/YePWz++foViWHMYi8v/ahfB3zdg56YulKOAnrRRdu+w/EclBvIGShMW4mfclJ664
         iWd8X3k9oniTTyg/rs2D7muV0t5xWIXR76nZPS476QD6FB4vo4ghIG/8g9scIHQOvz7g
         o0Ey31rplNPQk/P+3zyVuuO1tJSkM0TKFSSU8udnkJbNIQIDg5VCnRDUBT1yUwsdymLT
         jPH5ILTzBHzlMnJDQ4H1vXgVf3+eroxe4HUb3+WcOLgn7mPV6BI2pn43ITcduTYbZdvZ
         McaKZ3RXqaKqCYC/uYCUaj0RgBjRsEAX6Ctn9eAZ+S01cqAIF6YgYLkg2mk2Q9mpbwg3
         g4gw==
X-Forwarded-Encrypted: i=1; AJvYcCU3ku8t44SckFUIVgb+rMQoZRb6IRHe01HKJQrGtpsYY4t/J/g/uubi9DUep0g+7Cce2kq3vTh8CmA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzcg3bECLTy/ppL7wpHccDot3FbRmBoy9mCzZ8rFaYfd6JUjOen
	9qiMZbdSscqWn/wFRjdQ2w5u5ImCNwysMO7kZWGX7PQFZflqXfr1k++PYqkzdQHQtnA9FS7X+7s
	e
X-Gm-Gg: ASbGncvTZzCQW+uRMrt/huDa8ynqW1oXtcnx6z3/U2HTh0dUeb1IAl0n4EsUxXGmJWl
	Wv+Jq+PeB6eJuJWEn7KEVZk8L67evpmmE9DPmdRI8/9QdrjVvb+ML7192mXvMtURMGPqRUo1xbk
	xobNxyCN7w8AeWedTEneZVhRm7DFVGDj2XMLt6vcV8cvdfPVCcGldyOZe3MEYeyFaxzVT1YQTCa
	m0Wps+o9q/NX4bCWrS0NT/MhIdWhkG6Atl2fkBxu4JwvuRYmsgZFjf8x0Kordw8MWD2eylXjKIR
	M/aTnp+InbW8RAfE4KT16CZwKHCirPEsXgv3gp+s5Y7aZSlTDECTYq0N1DX3zR4OYtKNFA9xgou
	VT8PMEVMV
X-Google-Smtp-Source: AGHT+IFoQdh5OU53F+yxOgsF4XF9ewqFJg7l/TqLAYqdaoP6Zf3vk/hvWgR+4MN5RicYuteM3PHlcQ==
X-Received: by 2002:a5d:64e2:0:b0:390:f9e0:f0d0 with SMTP id ffacd0b85a97d-395b72a3060mr2878559f8f.6.1741878084722;
        Thu, 13 Mar 2025 08:01:24 -0700 (PDT)
Message-ID: <f64ca308-d3e4-4097-9a60-886ba4592644@citrix.com>
Date: Thu, 13 Mar 2025 15:01:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] VT-d: have set_msi_source_id() return a success
 indicator
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <8b610dba-0ce9-47ed-808d-035dc48f4f04@suse.com>
 <6468c44a-772e-45a6-b712-0732c9017234@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6468c44a-772e-45a6-b712-0732c9017234@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/03/2025 1:34 pm, Jan Beulich wrote:
> Handling possible internal errors by just emitting a (debug-build-only)
> log message can't be quite enough. Return error codes in those cases,
> and have the caller propagate those up.
>
> Drop a pointless return path, rather than "inventing" an error code for
> it.
>
> While touching the function declarator anyway also constify its first
> parameter.
>
> Fixes: 476bbccc811c ("VT-d: fix MSI source-id of interrupt remapping")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although...

>
> --- a/xen/drivers/passthrough/vtd/intremap.c
> +++ b/xen/drivers/passthrough/vtd/intremap.c
> @@ -436,15 +436,13 @@ void cf_check io_apic_write_remap_rte(
>      __ioapic_write_entry(apic, pin, true, old_rte);
>  }
>  
> -static void set_msi_source_id(struct pci_dev *pdev, struct iremap_entry *ire)
> +static int set_msi_source_id(const struct pci_dev *pdev,
> +                             struct iremap_entry *ire)
>  {
>      u16 seg;
>      u8 bus, devfn, secbus;
>      int ret;
>  
> -    if ( !pdev || !ire )
> -        return;
> -
>      seg = pdev->seg;
>      bus = pdev->bus;
>      devfn = pdev->devfn;
> @@ -485,16 +483,21 @@ static void set_msi_source_id(struct pci
>                              PCI_BDF(bus, devfn));
>          }
>          else
> +        {
>              dprintk(XENLOG_WARNING VTDPREFIX,
>                      "d%d: no upstream bridge for %pp\n",
>                      pdev->domain->domain_id, &pdev->sbdf);

as you're doing cleanup, %pd here?  Given DOM_IO for quarantine, I think
it's more likely now than it used to be.

> +            return -ENXIO;
> +        }
>          break;
>  
>      default:
>          dprintk(XENLOG_WARNING VTDPREFIX, "d%d: unknown(%u): %pp\n",
>                  pdev->domain->domain_id, pdev->type, &pdev->sbdf);

Here too.  Also, the "unknown(%u)" is less than ideal.  "%pd: %pp
unknown type %u\n" would be better.

~Andrew

