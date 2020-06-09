Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 562C81F3ED8
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 17:06:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jifpN-0001JS-W8; Tue, 09 Jun 2020 15:06:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kazQ=7W=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jifpN-0001JN-2z
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 15:06:13 +0000
X-Inumbo-ID: c19c5c56-aa62-11ea-8496-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c19c5c56-aa62-11ea-8496-bc764e2007e4;
 Tue, 09 Jun 2020 15:06:12 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d128so3511814wmc.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 08:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=DdBtwbu2BJNWL4QdNq8ZrBY16h2s9I7g5sLWO2vuH7I=;
 b=K7xiXG1I1R+TfuNGTFk/1lO/8Foi533aV926mY7KejIJZePCnSgLoJjXW4tJDKN5ar
 ZdF+Zg/Ql8C+oXIFTCmLH43I2B1RCY5YZTnWFsHx9wBDpG+H8iEjecSTiZp3eCrN+cqH
 LGZV8BUdYQEuNTJw8Dbhh1VaG97PfWgZmGimLXVHFNRkn2WY7Ne4Yz3dDZAO21ClkVwe
 2+j1Js5cWRlZteM/7iW5yQ19X7ykkEAlqxfixJ1E+6EwQ/F/DsE63C6A7P3urXL6dubB
 nokIiuN9QDeTDQMPpZJT3dxWZR/y/zFRJWMmDm5XiTAuoZ0yjlyMviC9PpjmsYdhntIF
 5/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=DdBtwbu2BJNWL4QdNq8ZrBY16h2s9I7g5sLWO2vuH7I=;
 b=EAd8iTRDwaDhQMzTJhJR138Shb17+ARJ0iS+hH7QgByB1gJcbDXC+7YLkBc8cOQKY6
 eNvy8xlEhoIfE7m1wAINXimbOh5nwpNKx8zgEsnaEmZ5AElnuuHkdjcKNG8OTS1vGa65
 06gzUno+uYu2Qnu8gQZqWT0UxEtHOOqXYH//LI+v62WUMCIBmMyml2jsJ4Ngt49/deAP
 7K8L2TJRGlDLDvPTO6e3fz5NxExJuN/BpIgOEmE1KyyT9+8j4nDfwM13dVK4hIzThgVP
 R3NCO44pm8200KN0t3ie8zgNVl6LEpKPnPnFnEsPKrZJkTf9nrA1K0xRfS1HI4jJunD4
 F2nw==
X-Gm-Message-State: AOAM5327BSpPX2hfRzMTgyL/n9RBrxwupD8ocNOu+YsQRRT3tzhpX5z1
 Y3MGulVjMT3P4f9trsFaDcc=
X-Google-Smtp-Source: ABdhPJwmPs4aMUM5Fx4h1ednyZmCnSyx7O8xq7WVTqhDX/yC+Infed4u5loTsYbSZmzXxiLI4WzynA==
X-Received: by 2002:a1c:bd84:: with SMTP id n126mr4218437wmf.149.1591715171628; 
 Tue, 09 Jun 2020 08:06:11 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id z25sm3235604wmf.10.2020.06.09.08.06.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 08:06:11 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'George Dunlap'" <dunlapg@umich.edu>,
 "'Paul Durrant'" <pdurrant@gmail.com>
References: <20191114045543.6759-1-julian.tuminaro@gmail.com>
 <CACCGGhBUhdLkh7x=Uf8=d=73DH-CAiNw0YcSwbzZG+0nEj3hRQ@mail.gmail.com>
 <CAFLBxZZ3k_U1zrs977PJCO8jEGL=+6e9-thChUwFUi4_ukbJPw@mail.gmail.com>
In-Reply-To: <CAFLBxZZ3k_U1zrs977PJCO8jEGL=+6e9-thChUwFUi4_ukbJPw@mail.gmail.com>
Subject: RE: [Xen-devel] [PATCH V2] kdd.c: Add support for initial handshake
 in KD protocol for Win 7, 8 and 10 (64 bit)
Date: Tue, 9 Jun 2020 16:06:09 +0100
Message-ID: <00b101d63e6f$82ce52e0$886af8a0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQEJ8ObCoXVZNyLYJBq22fcF/ZBpPgHyoU36Aj5tdimqR3RjoA==
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
Cc: 'Wei Liu' <wei.liu2@citrix.com>, 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Jenish Rakholiya' <rjenish@cmu.edu>, 'Tim Deegan' <tim@xen.org>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Julian Tuminaro' <jtuminar@andrew.cmu.edu>,
 'xen-devel' <xen-devel@lists.xenproject.org>,
 'Julian Tuminaro' <julian.tuminaro@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

De-htmling...

-----
From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
George Dunlap
Sent: 09 June 2020 15:42
To: Paul Durrant <pdurrant@gmail.com>
Cc: Wei Liu <wei.liu2@citrix.com>; Tim Deegan <tim@xen.org>; Jenish =
Rakholiya <rjenish@cmu.edu>; Ian Jackson <ian.jackson@eu.citrix.com>; =
Julian Tuminaro <jtuminar@andrew.cmu.edu>; George Dunlap =
<george.dunlap@citrix.com>; xen-devel <xen-devel@lists.xenproject.org>; =
Julian Tuminaro <julian.tuminaro@gmail.com>
Subject: Re: [Xen-devel] [PATCH V2] kdd.c: Add support for initial =
handshake in KD protocol for Win 7, 8 and 10 (64 bit)



On Fri, Nov 15, 2019 at 1:31 PM Paul Durrant <mailto:pdurrant@gmail.com> =
wrote:
On Thu, 14 Nov 2019 at 04:57, Julian Tuminaro =
<mailto:julian.tuminaro@gmail.com> wrote:
>
> From: Julian Tuminaro and Jenish Rakholiya =
<mailto:julian.tuminaro@gmail.com and =
mailto:rakholiyajenish.07@gmail.com>
>
> Current implementation of find_os is based on the hard-coded values =
for
> different Windows version. It uses the value for get the address to
> start looking for DOS header in the given specified range. However, =
this
> is not scalable to all version of Windows as it will require us to =
keep
> adding new entries and also due to KASLR, chances of not hitting the =
PE
> header is significant. We implement a way for 64-bit systems to use =
IDT
> entry to get a valid exception/interrupt handler and then move back =
into
> the memory to find the valid DOS header. Since IDT entries are =
protected
> by PatchGuard, we think our assumption that IDT entries will not be
> corrupted is valid for our purpose. Once we have the image base, we
> search for the DBGKD_GET_VERSION64 structure type in .data section to
> get information required for handshake.
>
> Currently, this is a work in progress feature and current patch only
> supports the handshake and memory read/write on 64-bit systems.
>
> NOTE: This is the Updated version of the previous patch submitted
> NOTE: This has currently been only tested when debugging was not =
enabled
> on the guest Windows.
>
> Signed-off-by: Jenish Rakholiya <mailto:rjenish@cmu.edu>
> Signed-off-by: Julian Tuminaro <mailto:jtuminar@andrew.cmu.edu>

LGTM.

Reviewed-by: Paul Durrant <mailto:paul@xen.org>

Paul, is this something worth adding a line to CHANGELOG about?

 -George
-----

Yes, I'd completely forgotten this had fallen in the 4.14 timeline. I'll =
send a patch.

  Paul


