Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAAE1FF874
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 18:02:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlwz9-0003q3-Uv; Thu, 18 Jun 2020 16:01:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XTxy=77=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jlwz8-0003pj-7h
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 16:01:50 +0000
X-Inumbo-ID: 0479602a-b17d-11ea-bb8b-bc764e2007e4
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0479602a-b17d-11ea-bb8b-bc764e2007e4;
 Thu, 18 Jun 2020 16:01:49 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id q2so4186659wrv.8
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2020 09:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=fYe3LoFUceqMJwwcKHTwyFS5p3TKF8kVHKKkDzRMsFU=;
 b=qQOHKOpI/WBha+qg4XrmxITIaC3ckHMZUGqFdziGhWJ8vpEaaBuhDtwvE0ffySqV7u
 9R4o99h16dCHghxphnjoSb2Ya7nfnzhTrjSlLjjJRxj+mcn9vNcyPaBlP6BdyhYpVM4a
 aSV0Ds+wQfR031awI9mGOIVQyrBneZB1+ZBBzdktmSJcTD/KixTPVPjMK+chf7iGhcsj
 OXuE8KtBOpfFOI7dpRvJYtCQ3J7Xl98sbnBxe5R8cTTd46mh/UIExUtolqXJ+QCPC3QX
 LZWm5Yx7ONFlXbYAwWhsD0KfWsbbYML63KEqYFaWC0+OJgzLBpggRj7MikxcXn4qBCxp
 ZVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=fYe3LoFUceqMJwwcKHTwyFS5p3TKF8kVHKKkDzRMsFU=;
 b=sdmLP8DkDWGRcojAdW8GegTD11evyoLIPMmHDIiSOf3YMX0nf0NMBNLarPbiKwaQ5K
 Coi2taiabDf1aDyLaDGLGED62gQ4bAwpmYfSGYWQZIu+q7K/sISi/06GpD9iLN8apLla
 IIQzD/ugR9b2hDCEaGBj/Z9x9oIaboajwPZj6tBkqrA08PpZ9nyrRkKSDBj0Dpi0lk29
 gMLgDprZZElVhzr4g+l3/LKAIhrMxTP+oAbc7HJgxK1Q6fkqTMIST+ngwXjb5V5r50dT
 XoJjuZuqYFjjcGwRYnkkH1bQEf3SHruEbyW38OAv7CymGy4fpX17hXkRV8o3Hy/wZO6Y
 xlAA==
X-Gm-Message-State: AOAM530RQoidU2qtqwCgOHYL+p6fQEmcSl9XDZ8Wr/IoPf/2vraGW7nO
 ifcAX6DqqFQVUikOPHd6VJw=
X-Google-Smtp-Source: ABdhPJzk8LQUJOSuRcE11JXMS40YUYyeRp83+bAz9LIB3hos/f0ydGeNJrLtcNFXjcN2Ln4mbzbmbA==
X-Received: by 2002:a5d:66c3:: with SMTP id k3mr5228904wrw.401.1592496108917; 
 Thu, 18 Jun 2020 09:01:48 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id d11sm4223536wrm.64.2020.06.18.09.01.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jun 2020 09:01:48 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Ian Jackson'" <ian.jackson@citrix.com>,
 "'Paul Durrant'" <xadimgnik@gmail.com>
References: <20200617060841.7241-1-olaf@aepfle.de>	<CAKf6xptxO0cVUGzfLw2gEHuzvRZsnQFwhbO9XAzijFRXUq1F5g@mail.gmail.com>	<20200617134025.2tdrjxslnh66dmng@function>
 <24299.36521.246994.731819@mariner.uk.xensource.com>
In-Reply-To: <24299.36521.246994.731819@mariner.uk.xensource.com>
Subject: RE: [XEN PATCH for-4.14 v1] stubdom/vtpm: add extern to function
 declarations
Date: Thu, 18 Jun 2020 17:01:46 +0100
Message-ID: <006901d64589$c593c440$50bb4cc0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIv4nHnfBuTNWH2eRSm761nFo0E0wJ3IkteAgwDO1EB4kHQg6f4IwYw
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
Cc: 'Samuel Thibault' <samuel.thibault@ens-lyon.org>,
 'Olaf Hering' <olaf@aepfle.de>, 'xen-devel' <xen-devel@lists.xenproject.org>,
 'Wei Liu' <wl@xen.org>, 'Jason Andryuk' <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Ian Jackson <ian.jackson@citrix.com>
> Sent: 18 June 2020 16:56
> To: Paul Durrant <xadimgnik@gmail.com>
> Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>; Jason Andryuk <jandryuk@gmail.com>; Olaf Hering
> <olaf@aepfle.de>; xen-devel <xen-devel@lists.xenproject.org>; Wei Liu <wl@xen.org>
> Subject: Re: [XEN PATCH for-4.14 v1] stubdom/vtpm: add extern to function declarations
> 
> Samuel Thibault writes ("Re: [PATCH v1] stubdom/vtpm: add extern to function declarations"):
> > Jason Andryuk, le mer. 17 juin 2020 09:35:52 -0400, a ecrit:
> > > On Wed, Jun 17, 2020 at 2:10 AM Olaf Hering <olaf@aepfle.de> wrote:
> > > >
> > > > Code compiled with gcc10 will not link properly due to multiple definition of the same function.
> > > >
> > > > Signed-off-by: Olaf Hering <olaf@aepfle.de>
> > >
> > > Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> >
> > Acked-by: Samuel Thibault <samuel.thibaut@ens-lyon.org>
> 
> Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
> 
> Thanks.  I have confirmed that these symbols look to be defined (in
> tpm/tpm_emulator_extern.c).  So the patch is correct.
> 
> I think this is 4.14 material.  Paul ?

Agreed.

Release-acked-by: Paul Durrant <paul@xen.org>

> 
> We should also consider it for backports.  How far back do we need
> to go ?
> 
> Ian.


