Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8369901C18
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 09:50:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736997.1143111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGZmq-0003GK-7C; Mon, 10 Jun 2024 07:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736997.1143111; Mon, 10 Jun 2024 07:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGZmq-0003EG-2h; Mon, 10 Jun 2024 07:49:52 +0000
Received: by outflank-mailman (input) for mailman id 736997;
 Mon, 10 Jun 2024 07:49:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGZmp-0003D5-0Y
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 07:49:51 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03f2c942-26fe-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 09:49:50 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a6266ffdba8so311449766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 00:49:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efed85dc3sm315910266b.124.2024.06.10.00.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 00:49:49 -0700 (PDT)
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
X-Inumbo-ID: 03f2c942-26fe-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718005790; x=1718610590; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KwiEJNVRVOeG3gLM45b2+/KiKZQYIw3B7SIhM/nKLRs=;
        b=F/iPOaz7QSKrE3flLtmCdRe4xwsOfYDbQ5DaJ/ggMbmckVDQ8PZ4tL2Grv77jF1ZuJ
         qulVYfdNI5oXKcw+5mEUoix3TxQzFP96vAUevbuI6NxvxZL5VlykvHxgzkTOGHDDUiul
         ir3TIA5ipt4K3TxbUDFuSD3hLyFiaPsertk12sStPFf/1VKjthGtDuIq1Qvg/9K8jBkc
         0xsUswWg/fW0SyeG6wv40KmTk1i+XUiUoIYJ6LZkYgLIZJkzNY7hVEOamFD23nodIOD0
         52xFVuUwqhXglO3ddNja6FuR8m64BLU4chzz9MBaf39dkYZUHd7DJbl4fOu+D/hGc8Mi
         9SwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718005790; x=1718610590;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KwiEJNVRVOeG3gLM45b2+/KiKZQYIw3B7SIhM/nKLRs=;
        b=jXxwoBUltee4iW3D3ehSM6aUGAOLIt2TBEG2piHFbO+Oe6MdqtmIdGbTKAri3PSsQY
         NPfdH7pfC53Pe8W0a3/TQFBuzfiTT2S5mdRRFUbcXD/KGNWup60JZdgvxPhWkbUADzPM
         w86nAhm6egxdNPn5oFyq6pQDT1DoUT3XPhg+W0wY66/YwhtgeYAAI4bdhjJjC/Iw6Jh7
         JrS759o+QvzVUIwnDHEdzrs8ArMNLj1Z7eOffs4W8+UO25pHTwFAciUMUPV80mNApq4S
         MUKYDwakJEdrHkCZtvQdn3jMdW1UDDsKokiOoBYyXpiAMlL2cX3WonLKwpyxc6RYEjQg
         diiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXP+zAB26KaBJBjDP3+5Gp6TlPsCvcvmBVdWP/Uxy0Lyj00o2z5HKRKLAQiFs5iRpy6ESpCA4G4ueCo1tm6vGgf9DmMFHwHix9t+I0gZuk=
X-Gm-Message-State: AOJu0YwehqONKcNwo0fh/B3TfxBg/c3ycDxgSi6MuLXI0SxNBzpygE85
	U/mvXiP1ftkTCL66NDJjOnEbPJNaL0FDrW5KnGMlRQgFI4uB2DrjA7w2vfhvkw==
X-Google-Smtp-Source: AGHT+IHwC/Vukz1JeyzipUsg056gd0k4WnZOoz8F/+UkhcQ0n2rmEUO9tEIwvIH7PM7xzw4G844e+g==
X-Received: by 2002:a17:906:68c5:b0:a6f:2d5c:5c8d with SMTP id a640c23a62f3a-a6f2d5c6342mr17558766b.30.1718005789617;
        Mon, 10 Jun 2024 00:49:49 -0700 (PDT)
Message-ID: <a5b5b0f4-0fe3-451b-b2d5-c9d2bcc91bc4@suse.com>
Date: Mon, 10 Jun 2024 09:49:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: xen-pciback: Export a bridge and all its children as
 per TODO
To: Abhinav Jain <jain.abhinav177@gmail.com>
Cc: skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com,
 jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20240609184410.53500-1-jain.abhinav177@gmail.com>
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
In-Reply-To: <20240609184410.53500-1-jain.abhinav177@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.06.2024 20:44, Abhinav Jain wrote:
> Check if the device is a bridge.
> If it is a bridge, iterate over all its child devices and export them.
> Log error if the export fails for any particular device logging details.
> Export error string is split across lines as I could see several
> other such occurrences in the file.
> Please let me know if I should change it in some way.
> 
> Signed-off-by: Abhinav Jain <jain.abhinav177@gmail.com>
> ---
>  drivers/xen/xen-pciback/xenbus.c | 39 +++++++++++++++++++++++++-------
>  1 file changed, 31 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/xen/xen-pciback/xenbus.c b/drivers/xen/xen-pciback/xenbus.c
> index b11e401f1b1e..d15271d33ad6 100644
> --- a/drivers/xen/xen-pciback/xenbus.c
> +++ b/drivers/xen/xen-pciback/xenbus.c
> @@ -258,14 +258,37 @@ static int xen_pcibk_export_device(struct xen_pcibk_device *pdev,
>  		xen_register_device_domain_owner(dev, pdev->xdev->otherend_id);
>  	}
>  
> -	/* TODO: It'd be nice to export a bridge and have all of its children
> -	 * get exported with it. This may be best done in xend (which will
> -	 * have to calculate resource usage anyway) but we probably want to
> -	 * put something in here to ensure that if a bridge gets given to a
> -	 * driver domain, that all devices under that bridge are not given
> -	 * to other driver domains (as he who controls the bridge can disable
> -	 * it and stop the other devices from working).
> -	 */
> +	/* Check if the device is a bridge and export all its children */
> +	if ((dev->hdr_type && PCI_HEADER_TYPE_MASK) == PCI_HEADER_TYPE_BRIDGE) {

Besides it wanting to be & here, it feels as if such a change can't be done
standalone in pciback. It likely needs adjustments in the tool stack (even
if that's not send anymore) and possibly also arrangements in the hypervisor
(to correctly deal with bridges when handed to other than Dom0).

> +		struct pci_dev *child = NULL;
> +
> +		/* Iterate over all the devices in this bridge */
> +		list_for_each_entry(child, &dev->subordinate->devices,
> +				bus_list) {
> +			dev_dbg(&pdev->xdev->dev,
> +				"exporting child device %04x:%02x:%02x.%d\n",
> +				child->domain, child->bus->number,
> +				PCI_SLOT(child->devfn),
> +				PCI_FUNC(child->devfn));
> +
> +			err = xen_pcibk_export_device(pdev,
> +						      child->domain,
> +						      child->bus->number,
> +						      PCI_SLOT(child->devfn),
> +						      PCI_FUNC(child->devfn),
> +						      devid);
> +			if (err) {
> +				dev_err(&pdev->xdev->dev,
> +					"failed to export child device : "
> +					"%04x:%02x:%02x.%d\n",
> +					child->domain,
> +					child->bus->number,
> +					PCI_SLOT(child->devfn),
> +					PCI_FUNC(child->devfn));
> +				goto out;

Hmm, and leaving things in partially-exported state?

Jan

> +			}
> +		}
> +	}
>  out:
>  	return err;
>  }


