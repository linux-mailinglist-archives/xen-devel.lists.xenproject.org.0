Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F6A1E22B9
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 15:08:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdZIK-0008Ve-0h; Tue, 26 May 2020 13:07:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zc16=7I=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jdZII-0008VZ-3n
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 13:06:58 +0000
X-Inumbo-ID: c6fdb274-9f51-11ea-9947-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6fdb274-9f51-11ea-9947-bc764e2007e4;
 Tue, 26 May 2020 13:06:57 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id w10so24441602ljo.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2020 06:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pA/KPitDzDn71tBmji2Hne4OFzrRzYGwCFdjGoKaubU=;
 b=lXlW3S6YNmMsBKt2gkfn1fxYmPIKLfa2dWjgFxBj99n+gkASpyg4LSbqawo7YOqaHr
 Y+K40fSRLEsun0zcn0cXe91KXZhJnt9o4yeYGaCPuxJ64Dp2qWFhxnkSKIaG3BF5vLxu
 gapn2/Tl0lleWds09KWb+r4w2DROx3Hna0iqRurUV4BZn/i5TfZ02WK9nnWkTOAWCmxj
 zqUUL9owN/3ilx4aAFReeJIxv3TDWUhuPZVSjPctcxYBBGUit0bXZ4RJrTB5g183UQYL
 +alWOM7Cfj2MG/UacJGUGdN5oVoyW3RLheR5Kt8nO+so+OwWXHQki4KSlaDZVkPfiQhv
 6ARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pA/KPitDzDn71tBmji2Hne4OFzrRzYGwCFdjGoKaubU=;
 b=LHkLM2XKPsjEJRwXGJ65PSL+FITpCFk+xexxtTJ2o4mJLCeSy3MbiNmt5p3jOzzEkY
 OWf9/U6t3eXOezsiFK7nopJxAOMjNAskK99b9WsnyG7jQojROz3DKP20YASjjbHor7WI
 VkdZsBD29kGRWh42ay/AWtJ6oh9wnpypYiRrEX601hAhwC3iKX7g/h35R6YWp6vUL7JO
 UNvjscx3CCxcHsgMqMTnB/fwDUuGYIKNdvL/jqDXvs4tL1oV9LGFrmOzVIx3EkOonH9p
 /5pRBTHwfocDVTZNlvONB4XLHDTN/oXUH/pCrykfUcLf8m/6aCboi8DQgd3kQJ3cKaGq
 SpHA==
X-Gm-Message-State: AOAM530rfNi6sOqyhwzm1Hb+s4nD5szTnz/Oz5zlVJCFraZhJ9UYFpoB
 yY1hgOrO81R6rCaGyjZsvnPhi8y7SRdUjYKH3e4=
X-Google-Smtp-Source: ABdhPJzWbI2umDYcfXTOHNuNk+H1mlfS3jOJaXvIHLpyqOfekDoUUjVpxKuGIxWaL0/uBWM/DlG0pKu3mn/nn/fsg4E=
X-Received: by 2002:a2e:8053:: with SMTP id p19mr592714ljg.199.1590498416322; 
 Tue, 26 May 2020 06:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200525025506.225959-1-jandryuk@gmail.com>
 <3986B3CE-1730-443C-BD10-D2161C2A75F4@citrix.com>
In-Reply-To: <3986B3CE-1730-443C-BD10-D2161C2A75F4@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 26 May 2020 09:06:45 -0400
Message-ID: <CAKf6xpt3ALKd2F8bP5ui+VhvhSWrTG+Hj_5TQSezOtUm_2A99w@mail.gmail.com>
Subject: Re: [PATCH] SUPPORT: Add linux device model stubdom to Toolstack
To: George Dunlap <George.Dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 26, 2020 at 6:50 AM George Dunlap <George.Dunlap@citrix.com> wr=
ote:
>
>
>
> > On May 25, 2020, at 3:55 AM, Jason Andryuk <jandryuk@gmail.com> wrote:
> >
> > Add qemu-xen linux device model stubdomain to the Toolstack section as =
a
> > Tech Preview.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> > SUPPORT.md | 6 ++++++
> > 1 file changed, 6 insertions(+)
> >
> > diff --git a/SUPPORT.md b/SUPPORT.md
> > index e3a366fd56..25becc9192 100644
> > --- a/SUPPORT.md
> > +++ b/SUPPORT.md
> > @@ -153,6 +153,12 @@ Go (golang) bindings for libxl
> >
> >     Status: Experimental
> >
> > +### Linux device model stubdomains
> > +
> > +Support for running qemu-xen device model in a linux stubdomain.
> > +
> > +    Status: Tech Preview
>
> Acked-by: George Dunlap <george.dunlap@citrix.com>
>
> Out of curiosity, what do you think is missing to be able to declare this=
 =E2=80=98Supported=E2=80=99?  Are there any features missing, or do we jus=
t  need to add a test to osstest?

Yeah, adding testing would be good.  From this list of limitations:
 - PCI passthrough require permissive mode
 - at most 26 emulated disks are supported (more are still available
as PV disks)
 - only one nic is supported
 - graphics output (VNC/SDL/Spice) not supported

PCI passthrough requiring permissive mode is fine for now.  26
emulated disks is probably fine forever.  We should have support for
multiple nics, and I have a idea for that.

The lack of graphics output is probably the biggest limitation at this time=
.

Regards,
Jason

