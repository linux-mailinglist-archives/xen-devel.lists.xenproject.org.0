Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 967401EB860
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 11:23:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg38S-0005fg-7b; Tue, 02 Jun 2020 09:23:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJcj=7P=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jg38R-0005fX-E6
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 09:23:03 +0000
X-Inumbo-ID: a85af67c-a4b2-11ea-9947-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a85af67c-a4b2-11ea-9947-bc764e2007e4;
 Tue, 02 Jun 2020 09:23:02 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y17so2584180wrn.11
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 02:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=+YYjsK4KRgX34vzfUAgKWTPBD+k2YZNB2ALORVkyR2g=;
 b=dqdCBoqgj+Q61Z4UDyQnpHPYTAX6wDXjgurPA9T++vmU2ZOSU3wdMH6pPayo4JD3E7
 9I5YnkbpG38/+NW9DPmkrOOCZbfkmGW3eMnTebRh6pxJVcDMUcKuLjX80/fmMSzzxxAi
 4Hl62j8fMz6NCY9nDnrvfXdjX1PS86f6B3wmnKzAPE9mjiT2GIPZTYwwryoF0Gb/kyCY
 MfIueLbXyN/+emFob1w30QPtKpvyZGBWgKo2elUgqE6jIhsqE/0JJNflLfSeiXaD0tFf
 id5JsE1lgsgpFze8T4Jrk5KZU/MDGVXUjCqVkuRBH/OwaPVmtFq7nCPnE6Lr2C8vG0Vz
 /U1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=+YYjsK4KRgX34vzfUAgKWTPBD+k2YZNB2ALORVkyR2g=;
 b=CyfgsA81fBnS40jtq8a/M4E6K1x9XQnmq5FT+Q2pZpcoXOvzCEOSwkCabAav1iAwau
 qh4EMjRgD1ueyC8WBF02kynUYbeVoq/TeOV4uEKfAKqKz6fuqra8ONxlFR5x/QDxsWaY
 o6gVXfssyZkOtxChC8+7urPIevvr9Mb78VC19POkqaSV4Z6kisHGOWPiO6v66Ce61KJt
 ZzCAK5U+xPEOIs+YDmmzmoZ+pmulByX7Hu31BXhiqrYbh4sk8wkqPG37fPIkEJDoR7hk
 TFEzI/ff3Mt3+8sOxV/mcaRUJmO10FP3Q0LEo3bWpcZhphTjpTLZTuv7kspRRAHOb98Y
 qfGg==
X-Gm-Message-State: AOAM531zVknri245h51qzPSHN6OaZr2yrhDqvue0L6JkrLHhaWdVf4uZ
 SyKQdOGgRyRjsdkFVqdEQbQ=
X-Google-Smtp-Source: ABdhPJyoGpSqppZ/7yfbp9Fs6Uj3MCQBivPDMAwPH+A9dG3MEdSlfEuRYLOcwaAgt6pFL8E90Jd7Zw==
X-Received: by 2002:a5d:6b81:: with SMTP id n1mr25158179wrx.411.1591089782068; 
 Tue, 02 Jun 2020 02:23:02 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id a126sm2568527wme.28.2020.06.02.02.23.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jun 2020 02:23:01 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Wei Liu'" <wl@xen.org>,
	"'Dario Faggioli'" <dfaggioli@suse.com>
References: <158827088416.19371.17008531228521109457.stgit@Palanthas>
 <86969ba1ea7e270267cfaa3408a89b55c86b3dca.camel@suse.com>
 <78e986122386915cacba8b4c3b572a460f9622e1.camel@suse.com>
 <20200602090721.r62ho7cagazgr2ji@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
In-Reply-To: <20200602090721.r62ho7cagazgr2ji@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
Subject: RE: [PATCH 0/3] Automation: improve openSUSE containers + podman
Date: Tue, 2 Jun 2020 10:23:00 +0100
Message-ID: <003901d638bf$69917e20$3cb47a60$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLJzs6x995B/uNQdEw2qPaFLQGt1wHxU21fAiyNZtYCqBw6I6ansRaA
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
Cc: xen-devel@lists.xenproject.org, 'Doug Goldstein' <cardoe@cardoe.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Wei Liu <wl@xen.org>
> Sent: 02 June 2020 10:07
> To: Dario Faggioli <dfaggioli@suse.com>
> Cc: xen-devel@lists.xenproject.org; Andrew Cooper <andrew.cooper3@citrix.com>; Doug Goldstein
> <cardoe@cardoe.com>; Wei Liu <wl@xen.org>; Paul Durrant <paul@xen.org>
> Subject: Re: [PATCH 0/3] Automation: improve openSUSE containers + podman
> 
> On Fri, May 29, 2020 at 12:20:25PM +0200, Dario Faggioli wrote:
> > On Thu, 2020-05-21 at 09:43 +0200, Dario Faggioli wrote:
> > > On Thu, 2020-04-30 at 20:27 +0200, Dario Faggioli wrote:
> > > > Hello,
> > > >
> > > > This short series contains some improvements for building Xen in
> > > > openSUSE containers. In fact, the build dependencies inside the
> > > > Tumbleweed container are updated and more handy helpers are added,
> > > > in
> > > > containerize, for referring to both Leap and Tumbleweed containers.
> > > >
> > > > In addition to that, in patch 3, the containerize script is
> > > > enhanced
> > > > so
> > > > that it is now possible to use podman, instead of docker. Rootless
> > > > mode
> > > > for podman also works (provided the system is properly configured)
> > > > which,
> > > > IMO, is rather nice.
> > > >
> > > > Docker of course continue to work, and is kept as the default.
> > > >
> > > Ping?
> > >
> > Ping^2? :-D
> >
> > Adding Wei. get-maintainers.pl seems told me I should no Cc him, so I
> > dind't, but I've seen automation/ stuff Acked-by him recently, so...
> 
> I think these are good improvements, so in Doug's absence:
> 
> Acked-by: Wei Liu <wl@xen.org>
> 
> You can already push to the container registries right?
> 
> Cc Paul. Gitlab CI is not gating pushes. I think there is very low risk
> involved in committing this series during freeze.
> 

I'll trust your judegment :-)

Release-acked-by: Paul Durrant <paul@xen.org>

> 
> >
> > Thanks and Regards
> > --
> > Dario Faggioli, Ph.D
> > http://about.me/dario.faggioli
> > Virtualization Software Engineer
> > SUSE Labs, SUSE https://www.suse.com/
> > -------------------------------------------------------------------
> > <<This happens because _I_ choose it to happen!>> (Raistlin Majere)
> >
> 



