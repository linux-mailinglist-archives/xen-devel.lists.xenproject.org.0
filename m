Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF14A8985D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 11:42:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952415.1347860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4coQ-00031x-Vp; Tue, 15 Apr 2025 09:42:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952415.1347860; Tue, 15 Apr 2025 09:42:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4coQ-0002zS-Sa; Tue, 15 Apr 2025 09:42:38 +0000
Received: by outflank-mailman (input) for mailman id 952415;
 Tue, 15 Apr 2025 09:42:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGoX=XB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u4coP-0002zD-RD
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 09:42:37 +0000
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [2607:f8b0:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f67acadc-19dd-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 11:42:37 +0200 (CEST)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-736b98acaadso4791351b3a.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 02:42:37 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-73bd1fe6b4esm8077195b3a.0.2025.04.15.02.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 02:42:35 -0700 (PDT)
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
X-Inumbo-ID: f67acadc-19dd-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744710155; x=1745314955; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c8uyRkZg7HCiC0XTq1yi8oVmOZHsOsRgynksx7DJLv8=;
        b=Yx5+nVeK5lNrSzmz3o6RBtSEBuRpP3tmMuI7JR2nSBFc84v3uXQ5/5bb3oLtAe8TiW
         /29fben8bJ5IcMTUzLI92tVXW24ub+ArMMMBPB16Ol98zZKAa+WRbcTE7ySTI0g32zbK
         /uxLcY1uvNYyVZh4wvoTP0uaCHdi5NM6GMd+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710155; x=1745314955;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c8uyRkZg7HCiC0XTq1yi8oVmOZHsOsRgynksx7DJLv8=;
        b=JI2Vgr72l5Qw51ZDmrw585a+1EPIKQPnsZaMGIUOM01xELiwWVkeJRZ95M3rAxiaXX
         3RrzRPWvLa3NQqDbH0pLyGAXnznAXV6QoNIulCtmbDazFc9LTlTWVnyRv4Yh4CY94Xte
         ED/HbMq7YruJhr9vXyPkl3YCXxsvsDFKGvS89m+HKJ4TM0cJUkX83BUI6WJIvHeQRIsT
         MlE68BKas7YSd3HnHmBOFg7OOc+3RSJr3kKS6zQDQ9VsX3yAIIj3C1g7sRfqldQgLD2h
         b22vtif/wg8aL+aYgY7S70nhJFWZ2k2E+zeKf7lgI74iC2vmas8zwyKwIVpgUyteuzO7
         /D8Q==
X-Gm-Message-State: AOJu0YwFrX7Y8/5CF7ib5fNf/NkcIOlHN+MPEqT1x1u6TSZIIwe6uqTW
	2SYiUTfsABXw3+p7ThjqZlFd+JIs0DEr0zcmmmKDhNs+BESU0Uda4bXrvwHG2P8=
X-Gm-Gg: ASbGncu4ABZNT9o+BBC+PK/MeGWneb6STt+/pIaEM4QXF75V9MdABZL0ATEULMjkYIa
	hYOkKvfy6nZ2tbGbDFO8XX/hpRE+B50QgxrCezLft2cCuO6gskJthkwIpVsSOJmVTpUBavOXTcd
	mjVjrRhdrMKp3lPPXdgFoCY/d1X2a9PPI+ekJ1LdJnkSPG3/c82TBa6MTkHL9bAfjUhgwMlRoUh
	V/3WiUvfwoRTw4+tQq71nhju5sGYcXy6amh5qHJSeR9cuaAxfEZHY/lK9OhMP4ulAO9FzmFlZ5Y
	H4FFlzp98azUM5tX0f9FR/rpBuMEprOZjC9sE7CuJudiMw==
X-Google-Smtp-Source: AGHT+IHfWLWKlU9AxILLcyPUIHqp12ThhM8buDvvroUBZTQCxchGKzo+Fjv8AUfFAhbte+kAp5Hpow==
X-Received: by 2002:a05:6a21:339d:b0:1f5:8678:1832 with SMTP id adf61e73a8af0-201797a1866mr20990869637.11.1744710155578;
        Tue, 15 Apr 2025 02:42:35 -0700 (PDT)
Date: Tue, 15 Apr 2025 11:42:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v2 3/8] vpci/header: Emulate extended capability list for
 host
Message-ID: <Z_4qBjte-STlLIum@macbook.lan>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-4-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409064528.405573-4-Jiqian.Chen@amd.com>

On Wed, Apr 09, 2025 at 02:45:23PM +0800, Jiqian Chen wrote:
> Add a new function to emulate extended capability list for host,
> and call it in init_header(). So that, it will be easy to hide
> a capability whose initialization fails.
> 
> As for the extended capability list of guest, keep hiding it.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v1->v2 changes:
> new patch
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/drivers/vpci/header.c | 44 ++++++++++++++++++++++++++++++++-------
>  1 file changed, 36 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 0910eb940e23..6833d456566b 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -815,6 +815,39 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
>      return rc;
>  }
>  
> +static int vpci_init_ext_capability_list(struct pci_dev *pdev)
> +{
> +    int rc;
> +    u32 header;

uint32_t would be preferred.

> +    unsigned int pos = 0x100U, ttl = 480;
> +
> +    if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        /* Extended capabilities read as zero, write ignore */
> +        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> +                               pos, 4, (void *)0);
> +        if ( rc )
> +            return rc;

I think you want to unconditionally return here, otherwise you will
most likely add a duplicated handler over "pos" when going inside the
loop below?

Also for domU we don't want to expose any extended capabilities yet.

> +    }
> +
> +    while ( pos && ttl-- )
> +    {
> +        header = pci_conf_read32(pdev->sbdf, pos);
> +
> +        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,

You don't want to pass NULL here, as that would prevent dom0 from
writing to the register, you instead want to pass vpci_hw_write32 I
think.

> +                               pos, 4, (void *)(uintptr_t)header);
> +        if ( rc )
> +            return rc;
> +
> +        if ( (header == 0) || (header == -1) )
> +            return 0;
> +
> +        pos = PCI_EXT_CAP_NEXT(header);

Don't you need to check that pos >= 0x100?  Possibly done in the while
loop condition: while ( pos >= 0x100 && ... )

Thanks, Roger.

