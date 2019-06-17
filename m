Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1562148B1B
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 20:01:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcvte-0004wo-SA; Mon, 17 Jun 2019 17:58:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=i68Z=UQ=gmail.com=emil.l.velikov@srs-us1.protection.inumbo.net>)
 id 1hcvtd-0004wi-10
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 17:58:21 +0000
X-Inumbo-ID: 7d626f88-9129-11e9-8980-bc764e045a96
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7d626f88-9129-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 17:58:20 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v19so312409wmj.5
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2019 10:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RA99XH++ZeHo9lFJDfpQ1th6xBYVyCVIO6aT2ccvLfQ=;
 b=iir/cwro3Uo0pydX2p6MssHcUcKCWLi3F0aRNfT9oiuPoCu3KzQi3D++TfCMCA5kbq
 UhdVsSno+MyWwqU7UMla2YRrjl3vooBFlx0nKtYTh44mvlxTjTeU/ZMsoTFT3Na0Nbo8
 zbXVWPc9pfLCEz8akgJpe2z9seqCP2z2haWgAfsi9/bgn50zH7bOZc5jW9vXW8SMk4Rt
 tx2lTCVIciiKlEe6uGemUYOgLdxEayja9E1N+noF29tOg7VjKlKwytO7pxFuV7oS4QEN
 rJlpCllgKrwVj7eJfedrwSjRfOJSjzakYsBlPrwpP8+Cypssx+Hl6JwcIa7W9QWRzmBt
 BA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RA99XH++ZeHo9lFJDfpQ1th6xBYVyCVIO6aT2ccvLfQ=;
 b=LmndRrcdVY0a2odOTGHwy8YSjW0Au7oDQZ8jZn/6HSua3JDYufNRkgpxuMvXZzFKTS
 OEd5DUvLwHCAaTNbwoFf6JPBd60m2ZxOg8tis+jdVeFPQeei8zwhRmPpQCBimvQL1BJZ
 ZOp7TCbaZYfsCJVrJg9uw8LAt2rvWR5XACcECWVcFXSm2Dqyj+yugP4+35pamhKxPwQV
 PFrSQSCOYMPVJZ/a8AjbAMsDqgrEeEMjQGchG/CL5tQBy2AbmQbgfbhKxRtuxtQ0GlPw
 5d8bwv32ceiYY3d3zipeJUe2Etdf9fVzTeLkO2R4W+sC4P8vCTT/egUiDJOeOAVNAyuv
 cHfQ==
X-Gm-Message-State: APjAAAUb9J/tsUhw6v99oeHhYnjJRdksrwh1wA/GvUJ9dF5iICp8h+64
 ggXXQXiPaCjib0YuU+oaHWs=
X-Google-Smtp-Source: APXvYqxzwMRI3pC9nLxx+cmi8fX06IrtlUhdDEcmz2BcTfXpaVk8v0SGvmPS+vZF06+nGUJcsaBAYg==
X-Received: by 2002:a1c:343:: with SMTP id 64mr21050453wmd.116.1560794289646; 
 Mon, 17 Jun 2019 10:58:09 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id s188sm13333537wmf.40.2019.06.17.10.58.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 10:58:08 -0700 (PDT)
Date: Mon, 17 Jun 2019 18:56:06 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <20190617175606.GE26766@arch-x1c3>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-7-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614203615.12639-7-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [PATCH 06/59] drm/prime: Actually remove
 DRIVER_PRIME everywhere
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 lima@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 NXP Linux Team <linux-imx@nxp.com>, spice-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 etnaviv@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS8wNi8xNCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBTcGxpdCBvdXQgdG8gbWFrZSB0
aGUgZnVuY3Rpb25hbCBjaGFuZ2VzIHN0aWNrIG91dCBtb3JlLgo+IApTaW5jZSB0aGlzIHBhdGNo
IGZsZXctYnksIGFzIHN0YW5kYWxvbmUgb25lIChpbnRlbnRpb25hbGx5IG9yIG5vdCkgSSdkCmFk
ZCwgYW55dGhpbmcgdmFndWVseSBsaWtlOgoKIkNvcmUgdXNlcnMgb2YgRFJJVkVSX1BSSU1FIHdl
cmUgcmVtb3ZlZCBmcm9tIGNvcmUgd2l0aCBwcmlvciBwYXRjaGVzLiIKCkhUSApFbWlsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
