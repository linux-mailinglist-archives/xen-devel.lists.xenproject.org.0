Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A45C460BF9
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 02:02:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234289.406614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrV2s-00063s-D5; Mon, 29 Nov 2021 01:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234289.406614; Mon, 29 Nov 2021 01:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrV2s-0005zd-9z; Mon, 29 Nov 2021 01:01:26 +0000
Received: by outflank-mailman (input) for mailman id 234289;
 Mon, 29 Nov 2021 01:01:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pV+N=QQ=gmail.com=robherring2@srs-se1.protection.inumbo.net>)
 id 1mrV2q-00052H-E0
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 01:01:24 +0000
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de66ffd8-50af-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 02:01:23 +0100 (CET)
Received: by mail-oi1-f181.google.com with SMTP id t23so31449673oiw.3
 for <xen-devel@lists.xenproject.org>; Sun, 28 Nov 2021 17:01:23 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.99.229])
 by smtp.gmail.com with ESMTPSA id r22sm2635197oij.36.2021.11.28.17.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 17:01:21 -0800 (PST)
Received: (nullmailer pid 2935047 invoked by uid 1000);
 Mon, 29 Nov 2021 01:01:19 -0000
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
X-Inumbo-ID: de66ffd8-50af-11ec-976b-d102b41d0961
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gkyjuo6MmtLiwh7POxoNoQdP1NjooIZOrMils/hYYIE=;
        b=gUT2tTMk0BczHy3ryDY6B4Zhzar/0M8YaktP7Ufe62zuFb4o03d/BGvUbmDEkfm8Ev
         J9h7nlLuoVDyrQqvukIgG707170ptlitFCoxT3w9Tfm6+AMK/NFXauBbvUk0vTuHFXOj
         ng1yQXNfHhUs2NJV+U1nxXMiWd0DP+HDyYCL0aZ8XuN0sAu23mI0A2G4TolQVfz4IgOI
         EW9XwrwnvQoyLlU9duvPKrrGWmNFNAta9bYmOs1/Ai/WC3fTcjQqDJakfPjAV1Ie3LSj
         keJPmA6sZc/uBTqkqtcn3rrKp0YLiDV4LqWvZWttLqKUpcbOAxOScfiuYGpyMtSGyHbO
         WMFw==
X-Gm-Message-State: AOAM531DLb1B11orNdDjm1BXrqKpX+s/cON6USsM1UeSOfRqeii2RQYN
	vyGlfDlnJv2qtE4EwtaajQ==
X-Google-Smtp-Source: ABdhPJwr/v9hFcvb1N+bf6bPHrQUb9xfuS63o4Gq1N5QJ09K6S+ZDqeDG+Ki8ve08g69OHSEAFdsTw==
X-Received: by 2002:aca:afc6:: with SMTP id y189mr37224521oie.46.1638147681830;
        Sun, 28 Nov 2021 17:01:21 -0800 (PST)
Date: Sun, 28 Nov 2021 19:01:19 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH V3 6/6] dt-bindings: xen: Clarify "reg" purpose
Message-ID: <YaQmX/OlHFa0F4kD@robh.at.kernel.org>
References: <1637787223-21129-1-git-send-email-olekstysh@gmail.com>
 <1637787223-21129-7-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1637787223-21129-7-git-send-email-olekstysh@gmail.com>

On Wed, 24 Nov 2021 22:53:43 +0200, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Xen on Arm has gained new support recently to calculate and report
> extended regions (unused address space) safe to use for external
> mappings. These regions are reported via "reg" property under
> "hypervisor" node in the guest device-tree. As region 0 is reserved
> for grant table space (always present), the indexes for extended
> regions are 1...N.
> 
> No device-tree bindings update is needed (except clarifying the text)
> as guest infers the presence of extended regions from the number
> of regions in "reg" property.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> According to the recent update to Xen's guest.txt:
> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob_plain;f=docs/misc/arm/device-tree/guest.txt;hb=refs/heads/master
> 
> Changes V2 -> V3:
>    - new patch
> ---
>  Documentation/devicetree/bindings/arm/xen.txt | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

