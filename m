Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 343CC1C698E
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 09:00:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWE1E-0002Aa-92; Wed, 06 May 2020 06:59:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oCMl=6U=kernel.org=ardb@srs-us1.protection.inumbo.net>)
 id 1jWE1D-0002AV-3m
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 06:58:59 +0000
X-Inumbo-ID: 0eb5494c-8f67-11ea-b07b-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0eb5494c-8f67-11ea-b07b-bc764e2007e4;
 Wed, 06 May 2020 06:58:58 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8F22320936
 for <xen-devel@lists.xenproject.org>; Wed,  6 May 2020 06:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588748337;
 bh=Ks479yn5aVQr+JYUmqEOjDXZVAqGpQ/rIdxivLx95fA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Z75NbGVXlZKdfDB8TaKIII1u2Z0wfX2NGPFIXlUCzJ4CQMU2iN/hD+l5KiD8CjdUz
 HJahgNa3Ga4lwyGTpK+xgNFl9AGf4G+hP/EE1LIFpHa8v3YhYyBDWnTaq4ZAkkkqws
 5D6ThZRL99DujMDWEG2+I0ML55Q57SXpKaaJ5GJY=
Received: by mail-il1-f175.google.com with SMTP id f82so738559ilh.8
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2020 23:58:57 -0700 (PDT)
X-Gm-Message-State: AGi0PuY6d/YoSCn786aw7YPr0dNHW0hL+VGxk6OzuUuwG/SAZgWbe9Qd
 tpnwf3qmGh2T/LuYuxLriqdoWtQw5il59jcjkDs=
X-Google-Smtp-Source: APiQypJ+j9WB0CXDzEMS0djQWwsuQmQ1YFMfpWuKDz5YblY1xozgDCyQueyoHt/K75Od17jx0p9Uopjbk7a9keIA0ls=
X-Received: by 2002:a92:39dd:: with SMTP id h90mr7636723ilf.80.1588748336958; 
 Tue, 05 May 2020 23:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200429225108.GA54201@bobbye-pc>
 <ebdd7b4a-767b-1b72-a344-78b190f42ceb@suse.com>
 <20200430111501.336wte64pwsfptze@tomti.i.net-space.pl>
 <CAMj1kXF1vRtqbGS-eptB682h1xJ8LYQi74YaTZgM1nyYcpFsYA@mail.gmail.com>
 <20200505215833.GB301373@piano>
In-Reply-To: <20200505215833.GB301373@piano>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 6 May 2020 08:58:46 +0200
X-Gmail-Original-Message-ID: <CAMj1kXH1TsHKS9wS4br8_YYYXh-6sWes=2vAK7_MZG7RRu0YFA@mail.gmail.com>
Message-ID: <CAMj1kXH1TsHKS9wS4br8_YYYXh-6sWes=2vAK7_MZG7RRu0YFA@mail.gmail.com>
Subject: Re: [RFC] UEFI Secure Boot on Xen Hosts
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: michal.zygowski@3mdeb.com, Daniel Kiper <daniel.kiper@oracle.com>,
 krystian.hebel@3mdeb.com, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, olivier.lambert@vates.fr, piotr.krol@3mdeb.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 5 May 2020 at 23:58, Bobby Eshleman <bobbyeshleman@gmail.com> wrote:
>
> On Thu, Apr 30, 2020 at 01:41:12PM +0200, Ard Biesheuvel wrote:
> > On Thu, 30 Apr 2020 at 13:15, Daniel Kiper <daniel.kiper@oracle.com> wrote:
> > > Anyway, the advantage of this new protocol is that it uses UEFI API to
> > > load and execute PE kernel and its modules. This means that it will be
> > > architecture independent. However, IIRC, if we want to add new modules
> > > types to the Xen then we have to teach all bootloaders in the wild about
> > > new GUIDs. Ard, am I correct?
> > >
> >
> > Well, if you are passing multiple files that are not interchangeable,
> > each bootloader will need to do something, right? It could be another
> > GUID, or we could extend the initrd media device path to take
> > discriminators.
> >
> > So today, we have
> >
> > VendorMedia(5568e427-68fc-4f3d-ac74-ca555231cc68)
> >
> > which identifies /the/ initrd on Linux. As long as this keeps working
> > as intended, I have no objections extending this to
> >
> > VendorMedia(5568e427-68fc-4f3d-ac74-ca555231cc68)/File(...)
> >
> > etc, if we can agree that omitting the File() part means the unnamed
> > initrd, and that L"initrd" is reserved as a file name. That way, you
> > can choose any abstract file name you want, but please note that the
> > loader still needs to provide some kind of mapping of how these
> > abstract file names relate to actual files selected by the user.
>
> This seems reasonable to me and I can't think of any good reason right
> now, if we go down this path, to not just extend the initrd media device
> path (as opposed to creating one that is Xen-specific).  It definitely
> beats having a GUID per boot module since the number of modules changes
> per Xen deployment, so there would need to be some range of GUIDs
> representing modules specifically for Xen, and some rules as to how they
> are mapped to real files.
>
> It does seem simpler to ask the loader for "dom0's kernel" or "dom1's
> initrd" and to have the loader use these references to grab real files.
>

Yes. And note that using a single GUID + File component is easier on
the implementation too: the protocol implementation has to be
registered only once, and the single callback that exists will be
invoked with different values for 'FilePath', corresponding with
different values for File(). For example, in [0], this maps to the
check at line 120, where we currently only consider the
'end-of-device-path' terminator type to be valid, but this could
easily be extended to parse the contents of a subsequent file node and
resolve it to grab some actual contents.

[0] https://github.com/u-boot/u-boot/commit/ec80b4735a593961fe701cc3a5d717d4739b0fd0


> > One thing to keep in mind, though, is that this protocol goes away
> > after ExitBootServices().
> >
>
> Roger that.
>
>
> Thanks,
>
> -Bobby

