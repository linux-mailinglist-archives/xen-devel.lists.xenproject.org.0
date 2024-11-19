Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 498289D261D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 13:51:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840042.1255826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDNhK-00074O-2U; Tue, 19 Nov 2024 12:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840042.1255826; Tue, 19 Nov 2024 12:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDNhJ-000720-VD; Tue, 19 Nov 2024 12:51:13 +0000
Received: by outflank-mailman (input) for mailman id 840042;
 Tue, 19 Nov 2024 12:51:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Xh=SO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tDNhI-00071u-BO
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 12:51:12 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f26a2707-a674-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 13:51:08 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c9693dc739so4807298a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 04:51:08 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df515e0sm643578866b.53.2024.11.19.04.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 04:51:07 -0800 (PST)
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
X-Inumbo-ID: f26a2707-a674-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzIiLCJoZWxvIjoibWFpbC1lZDEteDUzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImYyNmEyNzA3LWE2NzQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDIwNjY4LjcwMjQ5Miwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732020668; x=1732625468; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0IKCBg8Wt8HGu2lHeJGsGH5/CDIw8fURbXvfftc4dac=;
        b=gzhx5MuFj7mKFxz55CvycSN4qPZsvDfTT9mNe+UiHNQRRTJEVYceOTwWUsNieMajOY
         eLCuLCrrL8nmXdIId8cAEzDyXyuYEJwAfBf/pjDojjnp9vJz+bvneJsnt7+Xutl6ydZw
         DJYn90hJ6uh9aNZZuNEYm9vCBLYMdv4FrGmxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732020668; x=1732625468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IKCBg8Wt8HGu2lHeJGsGH5/CDIw8fURbXvfftc4dac=;
        b=vVa0XUakCI2D3aSfKQBA/yGvbK1hX4qx9yPOMaBq4BeqNHqisgfVMdXzXMdEa9nb+5
         bRTKx8rCZrsr7kBgWpEzPYCCvCAOcCw5WhOwGdxR4lcoXKceOl02lRDESn6aJckFojKw
         c4Y0lg8ApkvZSlzQjockrOGGKOx9DZknJgM0H8aLUWnGRkrrIMZTr0SMfNAQHU2Ji9Q3
         +hBqkEXpD6I9Wp+Z989ZDTZ1/Omi3zvA8f35gOu+uE6fyCqMf/O4a/DenkeitF8wMK1b
         hF9rKYH8AVG0jHm+zispQKOOgJIgjQWbOXseDH+3D3sYUgs8w/goRhLs5q8nOsOfEuj4
         tStQ==
X-Gm-Message-State: AOJu0Yxb4CNlyFRkI0kim555rAUz7ZEBEGBZ5FahQYVFC335LENZHLct
	Xy8jugVSI8IEd9Ewecw9jMeXuhuUZKSFsDmX8CeyFi1j+3k0ovMcs0KjmYW3H9rbWaoixu/TzWZ
	s
X-Google-Smtp-Source: AGHT+IHlRtBm7ND14xz59rFrp5kNLLKad9h/NwRR7l5/uMbxTpWUyzHOmaOyPWkHw5Z5l7SfT/QhJA==
X-Received: by 2002:a17:907:c22:b0:a99:77f0:51f7 with SMTP id a640c23a62f3a-aa48357dff1mr1406412366b.61.1732020668150;
        Tue, 19 Nov 2024 04:51:08 -0800 (PST)
Date: Tue, 19 Nov 2024 13:51:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] vpci: Add resizable bar support
Message-ID: <ZzyJu9mrwJhDJClE@macbook>
References: <20241113080027.244240-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241113080027.244240-1-Jiqian.Chen@amd.com>

On Wed, Nov 13, 2024 at 04:00:27PM +0800, Jiqian Chen wrote:
> +static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
> +                                      unsigned int reg,
> +                                      uint32_t val,
> +                                      void *data)
> +{
> +    uint32_t ctrl, index;
> +    struct vpci_bar *bars = pdev->vpci->header.bars;
> +
> +    ctrl = pci_conf_read32(pdev->sbdf, reg);
> +    if ( ctrl == val )
> +        return;
> +
> +    ctrl &= ~PCI_REBAR_CTRL_BAR_SIZE;
> +    if ( ctrl != ( val & ~PCI_REBAR_CTRL_BAR_SIZE ) )
> +        return;
> +
> +    index = ctrl & PCI_REBAR_CTRL_BAR_IDX;
> +    bars[index].size = (1 << ((val & PCI_REBAR_CTRL_BAR_SIZE) >>
> +                              PCI_REBAR_CTRL_BAR_SHIFT)) *
> +                       PCI_REBAR_CTRL_BAR_UNIT;

One further comment: you also need to reset addr and guest_addr here
(possibly by reading them from the BAR register), as the specification
states that:

"After writing the BAR Size field, the contents of the corresponding
BAR are undefined"

Hence the cached addr and guest_addr are stale after a write to the
control register.

Thanks, Roger.

