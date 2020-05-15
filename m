Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 318C51D572C
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 19:16:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZdw1-00045f-8e; Fri, 15 May 2020 17:15:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OuqU=65=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jZdvz-00045V-Fx
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 17:15:43 +0000
X-Inumbo-ID: b4c77fe8-96cf-11ea-b07b-bc764e2007e4
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4c77fe8-96cf-11ea-b07b-bc764e2007e4;
 Fri, 15 May 2020 17:15:42 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id f134so3070471wmf.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2020 10:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=n1ffL/SUcQ313IGVkpwazg6BWeAGgp8cidcIXU2wv9k=;
 b=W8PThp2Tb7VaHKHbgXiVAk9omIy9fNxDfZrSc/b4mH4QgHvAP2SaZ/XPdqmw0SGM27
 GUOnFZiad77Cy9VEwpES3Dw+ZV/SZ2txApQGdSV0MTqcNJfhE5Ks2Ngge7Gyxsru7O7v
 LcSA0fywIxhqecxU42G9CGEYF3+zDVHwLTgf/b/ONe6CF+EAZtP4mdRhnbtjzGUsnhaV
 iw5RpaoAMd6AVIUj6UlKiZw/KMgRZ9JkiWHengea2yzglrZcn525A6y5Fd1LBvMVEadT
 tc3rkZcHGzMRwhQhmboSrT4r5Y2049K18/1z7m+LxmP7Mdu4j+KZXiN3Fgv3rYORO9GG
 3Njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=n1ffL/SUcQ313IGVkpwazg6BWeAGgp8cidcIXU2wv9k=;
 b=I3OtpFXJIM6z8xdpZxqLHXFN8sbbnxBMlnYGbfHYdaU6zG4NqpnnGaxvhEGidzOz5I
 3IqZLB6Aug0ZmUBRdwlwvpBlvH2biu0HauT7Jcs+sEfESOucXF/qDoSKVNQ+MfnfCL73
 83N85Uti4t1JeEdtogwsiYIL4bVf8VE3WsDHWKyEHQ12RQl6XFW/E5SFCFRXLgl3+xxy
 tQLIIEUV/3aqkUbAPvWOIAoB/7AMfNR4fUbKREoGnyiWOpZVYs+aKk1qBbB7mZjDULuH
 zeaPZ6CsxD1TnLakABiQwVj1jhIR11jDVdpqwhhRt4Egtz7jMO1cTSaNzTNGFPgC2h8q
 /Z/w==
X-Gm-Message-State: AOAM530O+AoN+vazQsThWojPPlp07gZgG+dzyuCRpN9ONBUBObMGIdcN
 uYq6HIeTzFMevq60Jcr2JA4=
X-Google-Smtp-Source: ABdhPJxsq67gpQwJRa6Y1YKe8flogSsIVPE9ecTjaFM4pbFndMdwIXIrnOmUPngL8hQtvLysxYJhPQ==
X-Received: by 2002:a7b:c959:: with SMTP id i25mr4969069wml.84.1589562941065; 
 Fri, 15 May 2020 10:15:41 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id r11sm4386655wrv.14.2020.05.15.10.15.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 15 May 2020 10:15:40 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Wei Liu'" <wl@xen.org>
References: <000401d62aaa$e0eccab0$a2c66010$@xen.org>
 <20200515164355.oujf2mvbep6yhlua@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
In-Reply-To: <20200515164355.oujf2mvbep6yhlua@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
Subject: RE: Items for CHANGELOG.md in 4.14
Date: Fri, 15 May 2020 18:15:39 +0100
Message-ID: <001601d62adc$75558940$60009bc0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQKPZmgsyOvWLQ9lSdYfSjCDezh0+QEfP5V4py3x0oA=
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
Cc: xen-devel@lists.xenproject.org, 'Roger Pau Monne' <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Wei Liu <wl@xen.org>
> Sent: 15 May 2020 17:44
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; 'Roger Pau Monne' <roger.pau@citrix.com>; Wei Liu <wl@xen.org>
> Subject: Re: Items for CHANGELOG.md in 4.14
> 
> On Fri, May 15, 2020 at 12:20:44PM +0100, Paul Durrant wrote:
> > All,
> >
> >   In the last community call I took an ACTION to send a reminder email to submit patches to get
> CHANGELOG.md up to date. Several
> > items were mentioned during the call (see minutes at
> https://cryptpad.fr/pad/#/2/pad/edit/qPQUEQEv3nJJ97clS8b2KdtP/):
> >
> > - Ability to conditionally compile-out 32-bit PV guests (security attack surface reduction)
> > - Basic support for AMD Milan CPUS
> > - Golang binding advances
> > - x2apic, improvements on tlbflush hypercall
> > - General improvements in pvshim
> > - Xen on Hyper-V
> 
> As part of this work, there is now a "framework" to make it easy to port
> Xen to run on top of hypervisors. Does this need calling out?

IMO it is worth calling out this; it encourages further development not strictly related to Hyper-V.

  Paul

> 
> Wei.


