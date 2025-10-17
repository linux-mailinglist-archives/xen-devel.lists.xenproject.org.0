Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A22CBEA0E4
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 17:42:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1145253.1478334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9mZo-0000bk-KN; Fri, 17 Oct 2025 15:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1145253.1478334; Fri, 17 Oct 2025 15:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9mZo-0000Yl-HD; Fri, 17 Oct 2025 15:41:08 +0000
Received: by outflank-mailman (input) for mailman id 1145253;
 Fri, 17 Oct 2025 15:41:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vay5=42=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v9mZm-0000Yd-UI
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 15:41:07 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0fecc8a-ab6f-11f0-980a-7dc792cee155;
 Fri, 17 Oct 2025 17:41:05 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b3c2c748bc8so257776966b.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 Oct 2025 08:41:05 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65eb9523a7sm2041966b.71.2025.10.17.08.41.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Oct 2025 08:41:03 -0700 (PDT)
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
X-Inumbo-ID: b0fecc8a-ab6f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760715664; x=1761320464; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJL52wiNFpl4FOR8CPiE5gP7Lm/g9dYwKaDZ25+pF0Y=;
        b=mT3bABcUnRZJMqf+xnU+ZmUweLWqy7JtaPv5TYvoBxPp+jAW0Muikx+gtn0AeuhLEi
         c7+bk1mmXQiG4j0UHedoGEpC0OuWKl7B6/jKn7uuqVeT4h29x25tgWEBCjQorJLIxAsd
         nc0y+SrO2BMHLfV9V6jfisM0Y/kodEkXU4FINhzN40Wqd1vyrBo0ElyFEWV1+yoOJO2j
         ukCu+2CAU8lBVpecmaUPQvTSb/nvGuUDwFwGymJ6W+Uec4JSwDlB7Ohcp+o4uc2FSms8
         kEGEzynMxDTWDcKixpk0vb5h7d94eqKF3nC0bNfA2D4/rZdmvvpLt4oMXPVGWfxq/46p
         ohIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760715664; x=1761320464;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hJL52wiNFpl4FOR8CPiE5gP7Lm/g9dYwKaDZ25+pF0Y=;
        b=HeUVWfM1tvkKOWhDWkM+5s+SF72EpbinI1wOGMivF6zjTp0rqeoQdGpB7J5PWAejEC
         j5erh9IMDmZgLCJ8J8XdMwPff0hbJYXC+1qXPJoclKYlg9EopUI1G693YsS4XRVdz789
         FfYjg+TAHp7BP/zmesaf1SEFzOoyy9v2Q1YdRBIUCAke6f5BnCJYyeHfgSZEWp8X/1lO
         /wOoitxSNMd8uQ4XgdbA03HLYgLevCciFCXbfQvepDRN3TmvGNzyyvyt0BNPnqQ90pav
         tTXdMQzVE53T9lEQrn0ys9erzFE3zjXaW79tVCksPVv/ph79D/tbwriSjtpO70OFhdVk
         s4SA==
X-Forwarded-Encrypted: i=1; AJvYcCX8mHVsrHCjLUTtdHUlfWTiR18DhMu9LRSrhtKlHGxV8xKiY671U504V6Wo3oszrZ4ko/gjtWSa/iY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwwZUWYBRYLHRtQhmg53Od3Zp83V1g00sjLprqzRDaWm79VdOS
	BLmOVYX2xIYcYSM0IRAi3T9CPSFQ+JjJojukeFbXS/E2xXsFfWImZCRQ
X-Gm-Gg: ASbGnctPexMtruBc/mwF+F/XaE5GoDKulKFCiq8VSbtbcbSWiKdVk85uEMOR4ZgzwmS
	t1Zq/nk2HZTq2Fvf1gRxZSo8b0JfuDuKVlHqHrqY1VBTkvyuxRdVuUWyO0CYSvEj9NweC2qoDZQ
	W3PBSo/ix6EuTUAnScw8KkolurgD0VPfV1IxXc1PNr3wb3qLx0NuhxqmSlVIWiMj5EWAfsFvygb
	KWnlt+GBLosn2M8jCyqvi4EN5c9xSAQAOIyikY6agF1PIXWz+0SODdeiiRFRFr9J68LBfQ/OJvh
	XjmGlKqAOw/DaPcuNxdlxoIdsQniGOo5JJxnyUqjZxGlZwOOvuAqGHln1XE1JhkhvZpRJJ4Spnz
	rNKRlaRuqMieexFgRmEzhEHCD6a2W6SPgYCsq6omKJC8LGy1Fw7FZgivSmhDimbsr8HsTogh//f
	tv4X2Hefs55slIlaVVtxDazG9CanO/vKz4l9o0/z91bM4sptkvTkFU1rJKUJCUOtOrOvtQSG7dg
	+X6kA==
X-Google-Smtp-Source: AGHT+IGJPc/FES88dOUjOpNR39UOumvqAB9KTh20+PfLy0MWsVdgit8wDR3ltKaY4c9N8qr2EPUMZw==
X-Received: by 2002:a17:907:bb49:b0:b3c:82d5:2119 with SMTP id a640c23a62f3a-b647403a63amr442781066b.6.1760715664053;
        Fri, 17 Oct 2025 08:41:04 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------aYbdf80rzwsshXOvemTriGIh"
Message-ID: <9123a2d1-e280-458d-8799-d6014b4f7fc5@gmail.com>
Date: Fri, 17 Oct 2025 17:41:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] tools/libxc: fix xc_physdev_map_pirq_msi() with
 PCI segments != 0
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
References: <20251017141434.15205-1-roger.pau@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20251017141434.15205-1-roger.pau@citrix.com>

This is a multi-part message in MIME format.
--------------aYbdf80rzwsshXOvemTriGIh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/17/25 4:14 PM, Roger Pau Monne wrote:
> Otherwise it's not possible for device models to map IRQs of devices on
> segments different than 0.  Keep the same function prototype and pass the
> segment in the high 16bits of the bus parameter, like it's done for the
> hypercall itself.
>
> Fixes: 7620c0cf9a4d ("PCI multi-seg: add new physdevop-s")
> Signed-off-by: Roger Pau Monné<roger.pau@citrix.com>
> ---
> I think it's 4.21 material, as otherwise it's not possible to passthrough
> PCI devices on segments != 0.

Make sense to me:
   Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> ---
>   tools/libs/ctrl/xc_physdev.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/libs/ctrl/xc_physdev.c b/tools/libs/ctrl/xc_physdev.c
> index 25e686d7b389..1307d6836d72 100644
> --- a/tools/libs/ctrl/xc_physdev.c
> +++ b/tools/libs/ctrl/xc_physdev.c
> @@ -79,7 +79,7 @@ int xc_physdev_map_pirq_msi(xc_interface *xch,
>       }
>       memset(&map, 0, sizeof(struct physdev_map_pirq));
>       map.domid = domid;
> -    map.type = MAP_PIRQ_TYPE_MSI;
> +    map.type = MAP_PIRQ_TYPE_MSI_SEG;
>       map.index = index;
>       map.pirq = *pirq;
>       map.bus = bus;
--------------aYbdf80rzwsshXOvemTriGIh
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/17/25 4:14 PM, Roger Pau Monne
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20251017141434.15205-1-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre">Otherwise it's not possible for device models to map IRQs of devices on
segments different than 0.  Keep the same function prototype and pass the
segment in the high 16bits of the bus parameter, like it's done for the
hypercall itself.

Fixes: 7620c0cf9a4d ("PCI multi-seg: add new physdevop-s")
Signed-off-by: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
---
I think it's 4.21 material, as otherwise it's not possible to passthrough
PCI devices on segments != 0.</pre>
    </blockquote>
    <pre>Make sense to me:
  Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:20251017141434.15205-1-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre">
---
 tools/libs/ctrl/xc_physdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/ctrl/xc_physdev.c b/tools/libs/ctrl/xc_physdev.c
index 25e686d7b389..1307d6836d72 100644
--- a/tools/libs/ctrl/xc_physdev.c
+++ b/tools/libs/ctrl/xc_physdev.c
@@ -79,7 +79,7 @@ int xc_physdev_map_pirq_msi(xc_interface *xch,
     }
     memset(&amp;map, 0, sizeof(struct physdev_map_pirq));
     map.domid = domid;
-    map.type = MAP_PIRQ_TYPE_MSI;
+    map.type = MAP_PIRQ_TYPE_MSI_SEG;
     map.index = index;
     map.pirq = *pirq;
     map.bus = bus;
</pre>
    </blockquote>
  </body>
</html>

--------------aYbdf80rzwsshXOvemTriGIh--

