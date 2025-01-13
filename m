Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7148A0BDE1
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2025 17:46:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870687.1281792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXNZ8-0001Cn-UR; Mon, 13 Jan 2025 16:45:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870687.1281792; Mon, 13 Jan 2025 16:45:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXNZ8-00019j-Ro; Mon, 13 Jan 2025 16:45:26 +0000
Received: by outflank-mailman (input) for mailman id 870687;
 Mon, 13 Jan 2025 16:45:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3HK6=UF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tXNZ7-00019d-A1
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2025 16:45:25 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c85181cb-d1cd-11ef-99a4-01e77a169b0f;
 Mon, 13 Jan 2025 17:45:23 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso883921366b.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2025 08:45:23 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95624c1sm524597166b.131.2025.01.13.08.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 08:45:21 -0800 (PST)
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
X-Inumbo-ID: c85181cb-d1cd-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736786723; x=1737391523; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cQhL2mF6OQLPil4TM0uc1EA1az0dYWSLTPiDCCkoP+M=;
        b=bPxQMPXol589v/t8bSkRGh5rzUnnZDeA+bKZVMiWmBb2gi1+OgRrDAU/ubqe+MEQGU
         eMIp16ne2DAiPOXiYrcPrfENJtcc5rOkDSyp6zdIuPfkpgIglSDcUd57ZKaAdqhQQI20
         hdGciFZWoBIH8CJI+pYx6/MkXDKk90/ckP0KQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736786723; x=1737391523;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cQhL2mF6OQLPil4TM0uc1EA1az0dYWSLTPiDCCkoP+M=;
        b=lgiW0ZVnS86rYZ1ubV2/jUY7Ucq2nBeYf+gnzyUNfCJKFascyI8u2V8u1q9PX0k9NR
         8DJkyjk+kRVx+YTGmGFOnWBiyA+3jvat4QSX3kKbbBB1kaaJLiv7szv/wyyIzTUyNpy1
         nDKTGL944+YW0Ajk2KW+OZD/LAEoq42B1vdrDmQVakOKC/dwhAhNdVUxriXDjiQ8OsKy
         UTyImPxOxgWe6GuC7Noy93uu959j1mstjF9rdG0CfGsn+MCOx7q615EI3/BK5OK39sTG
         Dp/5LNP7GshYSW1MWuPmoGFjehg28/u1ir0lrPlSZu1g5GWVKzNlcnIM7Ued7dpApz+s
         5uBA==
X-Forwarded-Encrypted: i=1; AJvYcCVGs8Y/WiIdUovpRgHqJltBhgB6YsY/LvrS+xWEY0wYvWIykxmGTJXROQrQMZmVI2VOSvuJYMKUVXA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGO8xuriTPA2Ani+eEV2ncJS1m6Zs7/GXfw2GlxImLon0OlcdD
	V9yas4TPsRkeOSeioKjqY/bF4WblZC1uMionKtATezCbnfpmvpVC62YyD8oIL00yYvGCG/3Q5qj
	R
X-Gm-Gg: ASbGnctAub1xF2sbzb1rKyuCG0GPMlAaHSt+vjBv1c0NjPqGAv9/EOf2V6cUobakQa7
	LPX2BdnvLHRdDtQH9i1zdCd7MTM7+NxEvjs5jGVyh5pcrQEDtNKr/1rceePOwCjYT76l4j+Ss3j
	/14fPXv7rigr935TtoPNilH/JXGlE1QYVYdy2+TbhyfaqQMzRmBofnXo1KA2Z1chP5e+It0HmNu
	NgffLwAg+YRH5TDHperGw82naZjryw53Dxi0ImUiSPXCfPQn4Ggwset6neVXTXATnU=
X-Google-Smtp-Source: AGHT+IHboldTatC3Kvev2XggrqHCZW62HtgtMcXWz1/Gh1eCBct54o6sVYa7J7MMTTePNV00zm0xNQ==
X-Received: by 2002:a17:906:6a26:b0:aaf:73e4:e872 with SMTP id a640c23a62f3a-ab2ab16a9bbmr1562074266b.3.1736786722622;
        Mon, 13 Jan 2025 08:45:22 -0800 (PST)
Date: Mon, 13 Jan 2025 17:45:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Keith Busch <kbusch@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C2=B4nski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 2/3] vmd: disable MSI remapping bypass under Xen
Message-ID: <Z4VDIPorOWD-FY-9@macbook.local>
References: <20250110140152.27624-3-roger.pau@citrix.com>
 <20250110222525.GA318386@bhelgaas>
 <Z4TlDhBNn8TMipdB@macbook.local>
 <Z4UtF737b3QFGnY0@kbusch-mbp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4UtF737b3QFGnY0@kbusch-mbp>

On Mon, Jan 13, 2025 at 08:11:19AM -0700, Keith Busch wrote:
> On Mon, Jan 13, 2025 at 11:03:58AM +0100, Roger Pau Monné wrote:
> > 
> > Hm, OK, but isn't the limit 80 columns according to the kernel coding
> > style (Documentation/process/coding-style.rst)?
> 
> That's the coding style. The commit message style is described in a
> different doc:
> 
>   https://docs.kernel.org/process/submitting-patches.html#the-canonical-patch-format

It's quite confusing to have different line length for code vs commit
messages, but my fault for not reading those. Will adjust to 75
columns them.

Regards, Roger.

