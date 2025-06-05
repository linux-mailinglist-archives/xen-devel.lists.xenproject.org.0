Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A238ACEE7F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 13:24:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006691.1385930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN8hz-0006Gn-V3; Thu, 05 Jun 2025 11:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006691.1385930; Thu, 05 Jun 2025 11:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN8hz-0006E0-SG; Thu, 05 Jun 2025 11:24:31 +0000
Received: by outflank-mailman (input) for mailman id 1006691;
 Thu, 05 Jun 2025 11:24:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIxA=YU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uN8hy-0006Ds-B1
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 11:24:30 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4ab62eb-41ff-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 13:24:28 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-442eb5d143eso8072195e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 04:24:28 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-451fb1698acsm15887015e9.3.2025.06.05.04.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 04:24:26 -0700 (PDT)
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
X-Inumbo-ID: a4ab62eb-41ff-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749122668; x=1749727468; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iM1SRI6nLs3g6caslCWs1Vs8xHBwtCJcHog+t4a6Dn8=;
        b=hSBORaL4F4tw8B52pyK4sFs8Bb+hUmxFgu2S8+p20fSLKgrcZr8hR0iYdblvCxkQsu
         RB2n6msekzW8oDqVoYtEcbff1CazaH4jFp5is+/TPB58zFYohLiNF8MBZboi1JWusLXk
         uZdmXubn0tC/znCkUdDuv+PQHP/eUxKNwuP6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749122668; x=1749727468;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iM1SRI6nLs3g6caslCWs1Vs8xHBwtCJcHog+t4a6Dn8=;
        b=psompk8BBGv1viT3lgZtFuChoU977Y7UnElmgoBEpdwJMZRXBv19+tNRvm2ulP/pCC
         5mLre0hoZKYj19ZWttrS0dmHmB1nW6K52Fzmc1fXpTp81LwlUpdzh5XvvzLyAVBcl73L
         sVDJw1YLc2x4Cs5Y1gu/CwZIOML47Zn50OdBFkvbZuWrdQFTfjkT/tAbdu3KmpYRtT90
         QqE69iTLnhhIJzfQMApO+WMsVEIV0RZhHgpPGkWUUQ7//LDGuBXbYvaAYtz80XwxLdcG
         Qkxv7cF/+6z+6x1O5LLFYBuXCfhm45/4QrOVteB7iU7HoYolwLxXQkJwR1s4OMYN23yi
         RcoQ==
X-Gm-Message-State: AOJu0YyfWiQT6ZhjYExOFIgo0feBeNYq6lDoTgmhZCRZ3O+qVbnwbAgT
	fKhHd1VNIP5AflDrZWAQfzFZ9U/ztMjWXICq+vbV6M33ezfRaf2r05+nmrRH+TGraJA=
X-Gm-Gg: ASbGncuJSNos52yM4IeedS9wPR1WZt6VOFDL5bbnxub4mciOdMQ206Luadlv4Fp3+lZ
	+LeE6VgcOHxgpEXYDAvZ31Ktxe4cENYXXoXWWlLr7Fd5OXzGeLtF10+SXV5t+Jy484CNZX9Qk1U
	PJr7xNYI5LgQKlBrhRAgMdjr76USRwExBqhNcPRFcuwT2T4mb85RDfEiyzLa53AlIpelWUgQov4
	O8vjEWmzxF4Hk+tEblqRI0jgxKAV4VDwaxNui37EZilGjW4C5TLSqJTzIBisWVcA42y9MO9ScGh
	bwgE5FoxImI8stLm/W9ljUW33oZqENL7t5o5nxK33X+UZoAjSLkkcB+8fD1OGMXy/aFUkZDyarX
	t04ISOsWn7GAkybmWEfg=
X-Google-Smtp-Source: AGHT+IG4ASCKtKOCAF5n3VRq+SPfwvoyise3yaT3MRsbxiLQScv8j3+yrkgM+hrrdmZpPPUqUlpeHg==
X-Received: by 2002:a05:600c:6219:b0:441:b076:fce8 with SMTP id 5b1f17b1804b1-451f0a757c8mr62820235e9.14.1749122667806;
        Thu, 05 Jun 2025 04:24:27 -0700 (PDT)
Date: Thu, 5 Jun 2025 13:24:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v5 03/10] vpci/header: Emulate extended capability list
 for dom0
Message-ID: <aEF-aXoU37k4XHJX@macbook.local>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-4-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250526094559.140423-4-Jiqian.Chen@amd.com>

On Mon, May 26, 2025 at 05:45:52PM +0800, Jiqian Chen wrote:
> Add a new function to emulate extended capability list for dom0,
> and call it in init_header(). So that it will be easy to hide a
> extended capability whose initialization fails.
> 
> As for the extended capability list of domU, just move the logic
> into above function and keep hiding it for domU.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v4->v5 changes:
> * Add check: if capability list of hardware has a overlap, print warning and return 0.
> 
> v3->v4 changes:
> * Add check "if ( !header )   return 0;" to avoid adding handler for
>   device that has no extended capabilities.
> 
> v2->v3 changes:
> * In vpci_init_ext_capability_list(), when domain is domU, directly return after adding a handler(hiding all extended capability for domU).
> * In vpci_init_ext_capability_list(), change condition to be "while ( pos >= 0x100U && ttl-- )" instead of "while ( pos && ttl-- )".
> * Add new function vpci_hw_write32, and pass it to extended capability handler for dom0.
> 
> v1->v2 changes:
> new patch
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/drivers/vpci/header.c | 47 ++++++++++++++++++++++++++++++++-------
>  xen/drivers/vpci/vpci.c   |  6 +++++
>  xen/include/xen/vpci.h    |  2 ++
>  3 files changed, 47 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index d26cbba08ee1..4b2f761c9c24 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -836,6 +836,42 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
>                                    PCI_STATUS_RSVDZ_MASK);
>  }
>  
> +static int vpci_init_ext_capability_list(struct pci_dev *pdev)
> +{
> +    unsigned int pos = PCI_CFG_SPACE_SIZE, ttl = 480;

I think you can drop the ttl variable, as said by Jan in a previous
review, the purpose of that counter is to detect overlaps in the PCIe
config space, but for the context here the call to vpci_add_register()
already serves that purpose by returning -EEXIST.

Thanks, Roger.

