Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D7844EFE4
	for <lists+xen-devel@lfdr.de>; Sat, 13 Nov 2021 00:01:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225463.389354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlfXg-0001eO-0c; Fri, 12 Nov 2021 23:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225463.389354; Fri, 12 Nov 2021 23:01:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlfXf-0001bP-Tk; Fri, 12 Nov 2021 23:01:07 +0000
Received: by outflank-mailman (input) for mailman id 225463;
 Fri, 12 Nov 2021 23:01:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ivG=P7=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1mlfXe-0001bJ-EK
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 23:01:06 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a1acf52-440c-11ec-9787-a32c541c8605;
 Sat, 13 Nov 2021 00:01:05 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id b15so43372169edd.7
 for <xen-devel@lists.xenproject.org>; Fri, 12 Nov 2021 15:01:05 -0800 (PST)
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
X-Inumbo-ID: 6a1acf52-440c-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dBD81CkCABtFHIXR8TFFqpzzA3qNyZrY+swv30yU3/A=;
        b=gH/t681u2jkD1W07+EWdEI3pd1w77oGBlTFbergz6VtHCHVn/U6QC0eNLB5bDuTkX+
         VS/l/WPtP+SAhIDcxg/eC4xVy2Sh2Si0WRNT3mU3WPyaxHwZ4tn0tIAtMjYMYw/XvwWC
         z7l5qtUJ/h0ktQlN+Y627qn4hcjNjCBQFRHBkwxTVE69PbqnTT5ctwMYDV2eCbmPOAp/
         fgCYsSwvUc0I76ZGD4+B2f7VaOZLNewxURwbSBN44ToqQXbwYoBwsys+23p3iLv2tTBE
         s9E3dWuk4M0nLEg2Ok4vpitGWfcj6SQd30MTRu2B0arzx1jND7b68784BP0WVj0mKtpr
         FqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dBD81CkCABtFHIXR8TFFqpzzA3qNyZrY+swv30yU3/A=;
        b=Mh+oZnL5CJfJGtcln5O3hqU/b5As9W4KY/N2cvAdoJa2w/9lQFLdpc59qa6/bNBdZf
         NXuaO/EB2lfB9pMfUyupIGP1WT+6Iveyo1PQIwuInmFFoeewa6ClE6c/tizFqayb1lbk
         VCbEhtGj9I8QSA4uGXlH2unVilsXqt3S3hOQTnozolhajwqu2KIPcrk9IjgfHULxK8GR
         fyHyOJj8DNqnEXH05tMv8pmBmX5hnc7ZWPC6AtDnYGxj1d9K5GqYIckqKPUt/ONoaRRx
         KN552IloWPcEnSgfAaLoWSq9akvpUtFpDFxxcavFQSzx5niYf6GoK/lanI5uaVwF2/ua
         apRA==
X-Gm-Message-State: AOAM530M0i/gJV4vjqnugSCI1gy2bPQWU9j/qveQoy7h/ffWnjIaQ9VT
	n3bSsa/KJB1IgwKENcAm2fBQv0yZ+oSouZKfvKk=
X-Google-Smtp-Source: ABdhPJxUg+XPzyV10elbnSQMt1UIewfGtYLsIklyltl5opiUbEZ56Jzkrw3KhAzbiIsM6945A0sXNZ9aIbhi3/DCnpY=
X-Received: by 2002:a05:6402:3508:: with SMTP id b8mr26200289edd.347.1636758064939;
 Fri, 12 Nov 2021 15:01:04 -0800 (PST)
MIME-Version: 1.0
References: <YY3tSAFTCR4r2FaI@mattapan.m5p.com> <AM9PR08MB62428F41C4F998AD676C027C92959@AM9PR08MB6242.eurprd08.prod.outlook.com>
 <YY6L5JQPn0s3c6Jp@mattapan.m5p.com> <1d3561ef-548a-ea13-d362-0f95d7dba33b@xen.org>
 <YY6bsu8/y/LeMfg3@mattapan.m5p.com> <40474f12-e269-f251-99b1-cb5b0a317bb2@xen.org>
 <YY7ZVPQSTapB7Jnj@mattapan.m5p.com> <CAJ=z9a0EooNfXyrNB82_4yT9qnz5fxEJtVN6oUbVyCzjU4hEKA@mail.gmail.com>
 <YY7rfIWPC1PwidMA@mattapan.m5p.com>
In-Reply-To: <YY7rfIWPC1PwidMA@mattapan.m5p.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Fri, 12 Nov 2021 23:00:54 +0000
Message-ID: <CAJ=z9a1=V+MKD0a9aTCBvy-1nxKj4TC7ZOg82oBYn1vmfsu23g@mail.gmail.com>
Subject: Re: ACPI/UEFI support for Xen/ARM status?
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Henry Wang <Henry.Wang@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Nov 2021 at 22:32, Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > My preference is to introduce a per-platform quirk (I believe Stefano was happy
> > with this). The advantage is we could get ACPI support for your board hopefully
> > merged quicker.
>
> This could be workable as a temporary workaround.  Longer term I suspect
> it might well be rather better to *fully* tackle the issue *now*.
> Otherwise this seems likely to turn into a database of board-specific
> hacks for hundreds or thousands of devices.

As usual, you have to find a balance between cost vs benefits.

If you look at the Device-Tree side, we don' t have many platforms
requiring quirks.
In particular, the DMA is so far strictly limited to a single platform (RPI).
So I would be surprised if we suddenly require tons of quirks when using
ACPI.

Therefore I am unconvinced that such a big effort is necessary. That being said,
if you have plenty of time to invest to implement a DSDT parser in a
stub domain,
then I would be happy to review the patches.

Cheers,

