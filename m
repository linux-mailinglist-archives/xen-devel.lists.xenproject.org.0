Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F253820AFBB
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 12:32:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joleD-0003XM-Di; Fri, 26 Jun 2020 10:31:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPqg=AH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1joleB-0003XH-UJ
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 10:31:52 +0000
X-Inumbo-ID: 3f0449fa-b798-11ea-bb8b-bc764e2007e4
Received: from mail-wm1-x332.google.com (unknown [2a00:1450:4864:20::332])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f0449fa-b798-11ea-bb8b-bc764e2007e4;
 Fri, 26 Jun 2020 10:31:51 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id a6so8588130wmm.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2020 03:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=LJEpAjSLljoBnYDsCeysKW8fEHIzvuxKijSSjGWcaec=;
 b=kZ16ojR1Ej6/gKOPE86Kli4j4w1H7jPW7VPwrxwYtEB8o6y1x/gWKVpVWbSCXHYjf0
 upGV63PGPj0rgfQxB03G6ONrbmMCeGpCYo7uCJXnLFXwm4ICK0pVtg3pPIIsuT/jWQ4Z
 aI6xJAnV7Rfxcg1pKKn3q2Cz+Uj4h7+Jqt+wXLSNwlLpfATXFWnM/e2ZioFogyDSQvtW
 y0bd+MZELaByWhOwuIjBbmUgPPkq81sn404bzA++2CEksrzUq04k04FBcy2mKeoEqzvt
 yGabtKzA7+ySouUpiNevT8weMOELGKFRH5b8X3sjGx+2hjfZCn9Bznf9nVgq+98jat4y
 3jhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=LJEpAjSLljoBnYDsCeysKW8fEHIzvuxKijSSjGWcaec=;
 b=bSuXK44qw5nej5+y4+ejzTOBDAGjw9L86J3pb+gF+vfuKcsoBhqgycaogz5c2wu1ax
 JjZ6QsXFyDtGt/fUU9e/aG3zlwCX7PzcJlebwiR5Tm3+BU85ln33UbWUYfH+1nHuRtRM
 N0XyCyupoLg3oL0Zh2Tdl9cEZmc/3CQhDqt69Qdc68WQZ/SWtt5cRGbu6dzZ4v0znF6p
 Zy9iev3D/mn+cLYHtncB/idsyJdik3pCovQo/2BNN5rmWRPr/Ynlpc+Vtv3/nn2nxCZG
 Lt1yNqzx+5FqoZGni0zHA5tFcg7qG3px8uLgf2RAwXe0o4ffTGOi4OkYjjnj3Hw4DexO
 8SMQ==
X-Gm-Message-State: AOAM530ZyKKli9xVuzuV0g4ED4BUwWs18Ja/6NJqz6PmmJnIA7qfrscA
 MaoqDxGNuXtyXt50DZ0+wqg=
X-Google-Smtp-Source: ABdhPJzAFTF6wm9hmshIdyRLcFETZJ8tTV61MZ/b1Z4BKAfRh09F87AaU2EfUy7mjDC8FvY7mqcuuQ==
X-Received: by 2002:a1c:2049:: with SMTP id g70mr2821842wmg.90.1593167510493; 
 Fri, 26 Jun 2020 03:31:50 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id r1sm27444171wrt.73.2020.06.26.03.31.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jun 2020 03:31:49 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Wei Liu'" <wl@xen.org>
References: <20200608203849.18341-1-olaf@aepfle.de>
 <005001d63e3b$c85059f0$58f10dd0$@xen.org>
 <20200609121549.GA90841@deinos.phlegethon.org>
 <20200609152233.039cfc86.olaf@aepfle.de>
 <20200610191657.GA69414@deinos.phlegethon.org>
 <20200611211004.11e38f8f.olaf@aepfle.de>
 <CACMJ4Ga2oO94kXw2NVdRQb=dOZ9kqZRgDLkrE630D3RFTMoYQg@mail.gmail.com>
 <005a01d64480$49ce0730$dd6a1590$@xen.org>
 <20200626102654.e6ygxgnd37ptxosb@liuwe-devbox-debian-v2>
In-Reply-To: <20200626102654.e6ygxgnd37ptxosb@liuwe-devbox-debian-v2>
Subject: RE: [PATCH v1] kdd: remove zero-length arrays
Date: Fri, 26 Jun 2020 11:31:48 +0100
Message-ID: <000401d64ba5$00424b40$00c6e1c0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIqIZk/Qusa7Qsu5bkjM27jAUAPHgHVoA+LAfW9KPcCU2XTcQH8d5RuAcV3opsCrD1gbAGQYJk7ArIm6eOnvIq74A==
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
Cc: 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'xen-devel' <xen-devel@lists.xenproject.org>, 'Olaf Hering' <olaf@aepfle.de>,
 'Tim Deegan' <tim@xen.org>,
 'Christopher Clark' <christopher.w.clark@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Wei Liu <wl@xen.org>
> Sent: 26 June 2020 11:27
> To: paul@xen.org
> Cc: 'Christopher Clark' <christopher.w.clark@gmail.com>; 'Olaf Hering' <olaf@aepfle.de>; 'Tim Deegan'
> <tim@xen.org>; 'xen-devel' <xen-devel@lists.xenproject.org>; 'Ian Jackson'
> <ian.jackson@eu.citrix.com>; 'Wei Liu' <wl@xen.org>
> Subject: Re: [PATCH v1] kdd: remove zero-length arrays
> 
> On Wed, Jun 17, 2020 at 09:21:22AM +0100, Paul Durrant wrote:
> > > -----Original Message-----
> > > From: Christopher Clark <christopher.w.clark@gmail.com>
> > > Sent: 16 June 2020 21:50
> > > To: Olaf Hering <olaf@aepfle.de>
> > > Cc: Tim Deegan <tim@xen.org>; xen-devel <xen-devel@lists.xenproject.org>; Ian Jackson
> > > <ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>; paul@xen.org
> > > Subject: Re: [PATCH v1] kdd: remove zero-length arrays
> > >
> > > On Thu, Jun 11, 2020 at 12:12 PM Olaf Hering <olaf@aepfle.de> wrote:
> > > >
> > > > Am Wed, 10 Jun 2020 20:16:57 +0100
> > > > schrieb Tim Deegan <tim@xen.org>:
> > > >
> > > > > How tedious.
> > > >
> > > > Indeed. This compiles for me as well:
> > >
> > > just a nudge on this; it would be nice to get a patch into the tree
> > > since the build failure affects master builds of Xen in OpenEmbedded
> > > now.
> > >
> >
> > I'd be happy to take a patch into 4.14 if someone can provide one with a suitable maintainer ack.
> 
> Tim is the maintainer of KDD. :-)
> 
> I take it you're happy with me committing his patch then?
> 

I'm happy, but ought it not have an ack from 'the rest' since Tim submitted the patch?

Release-acked-by: Paul Durrant <paul@xen.org>

> Wei.


