Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F329926310C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 17:56:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG2Ra-0002WZ-Jl; Wed, 09 Sep 2020 15:55:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4PK=CS=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kG2RZ-0002W6-5T
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 15:55:33 +0000
X-Inumbo-ID: b09e0f09-e9f0-4166-a1e8-3fcd03282898
Received: from mail-wm1-x334.google.com (unknown [2a00:1450:4864:20::334])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b09e0f09-e9f0-4166-a1e8-3fcd03282898;
 Wed, 09 Sep 2020 15:55:29 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id a9so2903910wmm.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2020 08:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=cZr7m5an/lpVsEFUe9ORtvHj99pz0oEkVjwlmh+LL7w=;
 b=gRSWgKP11LafBvgKOF4hj8gZ8YnZhnPV0vgrS4YTKlDzPkxYDM2BNrXfuFNNsBpC9N
 EIGuU6S4aIiq1rIqB0XY585GI1355Nq2UMTdfDmHw7hPfBdpkZCmDMPkfKXaP9txMUr9
 0j6YfFBZPXJrSfWiKiS26YX+RkToP0ilAIbJBeUjvCImfKXKEMfySWVzHq+4p9aExUMn
 KLL2R6EwsPJC9pU8DwQMfdBHxH2PsrWzg6ghkiRlc+PWohsVoAb0k4FngDCFI+IT6rbN
 HDlyAcY8VwjuyFn4d1BgxWB8cToRnUg1W0ge/6vBNFMK+o8ES9PslcXLp01Zozd9bOt4
 clbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=cZr7m5an/lpVsEFUe9ORtvHj99pz0oEkVjwlmh+LL7w=;
 b=qaAR0gcYODvQ/YItYQEX+r2dtVduvSzcRFgiBdA83jP5Pj08XpAlLuO9In853rJY1z
 V4sUojsSmR8jG+0nyzTv2ja+cEsWtxmDFpP/p7vuMU34q8uc9tPn7EguNTs79TSjMR9/
 I3VwnPVkZrER49VObYn+mPAvfBHJL5oTfigxeztqkNJ1Aq4mHgIPzUHBcNXEdpoYNSuX
 vEkahmZ+mpugGsV52OO8Vv6C8RlgodPkvEz8LFcwuLmrAvqNpzyQH2g9WilyE7iZDhRJ
 zTRi5FHJ9P7ucX8s03Vw+YEXGe3OJtzqhpTbP46kGLocHA0WXkp1pUKhlXhptxCUgabd
 Wkuw==
X-Gm-Message-State: AOAM530wXUF1CnJRgWOgwbYbl6/veESqmsdQ9BQ1yzDd5rJCk2XNhhXn
 m31yTDRtWUVlOsSry8psegU=
X-Google-Smtp-Source: ABdhPJzkDjYCuwxS3S/5sTVwJBISqN4ZrzG8DhiBdZRpaEsIodrm3aPMU8pza6gwDTgsol/o6BcmiQ==
X-Received: by 2002:a1c:5685:: with SMTP id k127mr4359627wmb.135.1599666928553; 
 Wed, 09 Sep 2020 08:55:28 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id o124sm4363752wmb.2.2020.09.09.08.55.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Sep 2020 08:55:28 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Roger Pau Monne'" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Cc: "'Jan Beulich'" <jbeulich@suse.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>, "'Wei Liu'" <wl@xen.org>
References: <20200909145058.72066-1-roger.pau@citrix.com>
In-Reply-To: <20200909145058.72066-1-roger.pau@citrix.com>
Subject: RE: [PATCH] x86/hvm: don't treat MMIO pages as special ones regarding
 cache attributes
Date: Wed, 9 Sep 2020 16:55:27 +0100
Message-ID: <002501d686c1$a31c0160$e9540420$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHf/Df7LZfQ9Xm/eSTBd3e0hnXIhKlNij/w
Content-Language: en-gb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Roger Pau Monne <roger.pau@citrix.com>
> Sent: 09 September 2020 15:51
> To: xen-devel@lists.xenproject.org
> Cc: Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich =
<jbeulich@suse.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; Paul Durrant =
<paul@xen.org>
> Subject: [PATCH] x86/hvm: don't treat MMIO pages as special ones =
regarding cache attributes
>=20
> MMIO regions below the maximum address on the memory map can have a
> backing page struct that's shared with dom_io (see x86
> arch_init_memory and it's usage of share_xen_page_with_guest), and
> thus also fulfill the is_special_page check because the page has the
> Xen heap bit set.
>=20
> This is incorrect for MMIO regions when is_special_page is used by
> epte_get_entry_emt, as it will force direct MMIO regions mapped into
> the guest p2m to have the cache attributes set to write-back.
>=20
> Add an extra check in epte_get_entry_emt in order to detect pages
> shared with dom_io (ie: MMIO regions) and don't force them to
> write-back cache type on that case.
>=20
> Fixes: 81fd0d3ca4b2cd ('x86/hvm: simplify 'mmio_direct' check in =
epte_get_entry_emt()')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Cc: Paul Durrant <paul@xen.org>

This looks like the right thing to do...

Reviewed-by: Paul Durrant <paul@xen.org>


