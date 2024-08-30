Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1FE966689
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 18:10:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786518.1196088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk4Bn-0006Jx-71; Fri, 30 Aug 2024 16:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786518.1196088; Fri, 30 Aug 2024 16:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk4Bn-0006I6-34; Fri, 30 Aug 2024 16:09:31 +0000
Received: by outflank-mailman (input) for mailman id 786518;
 Fri, 30 Aug 2024 16:09:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kvro=P5=bounce.vates.tech=bounce-md_30504962.66d1eeb5.v1-855aff8734354a5badf40d95c5f5b5fc@srs-se1.protection.inumbo.net>)
 id 1sk4Bl-0006Hz-0O
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 16:09:29 +0000
Received: from mail177-17.suw61.mandrillapp.com
 (mail177-17.suw61.mandrillapp.com [198.2.177.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a7422ee-66ea-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 18:09:26 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-17.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4WwNPx49VqzRKLlgq
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2024 16:09:25 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 855aff8734354a5badf40d95c5f5b5fc; Fri, 30 Aug 2024 16:09:25 +0000
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
X-Inumbo-ID: 3a7422ee-66ea-11ef-a0b1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1725034165; x=1725294665;
	bh=AW7FJqN6YyE+MwvmPnT4Bx3Se7i+/6V1JEROid/5nE4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=S303CoyslbWpPLsvIwvZ9qfzdxZbPCp6gBznRbW35PJNgyC7Zoc5YdGuX+Y4d6RHW
	 rMn1jTEiVBUUoQRdp48BmTIq2iODlMn5wiAxCRNGpd4x3nJ4sj7Sz7iuspVANUXDSp
	 0lTCvfuTJbqaNF8EojdDhveXzlsRveBdoQIFE4C1BNVb0sQi1+3XZULgWX/rl7KL+N
	 LwUJkx4V8HBW8hKvfY9JQ1t6F1BFDNFDy95gQFuRAHi3eL/CP9kMv3AYupiuSiTK5q
	 cAhdXCJERpqSkR9Q58/x28GOAUDZeH5jufISgi7o/+9Q2+lrJRqaYokjm472IjPg+r
	 lRUEg4PoPBDjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1725034165; x=1725294665; i=anthony.perard@vates.tech;
	bh=AW7FJqN6YyE+MwvmPnT4Bx3Se7i+/6V1JEROid/5nE4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=reBLIWO1T/JOy6oBWN2GU/ExKHoajIDZejhCvUfxrhHooXqNUUaCIdSvL3+VonJ+2
	 CpTO/pJcIA93Hnqv2c8aTc/dZVlUCvupUT4OzLHh2SskzIr9zf83WQfCVobuWCq/w3
	 mO7txF5T5SG1WgwDzWhzTKzudWKru+YJMEVRMPGsdM1tfYLiJEnJagAWVw4JlUYhte
	 O6vALcRaiVZUuHFY0faQYY6DY+AXcftO4reKWjmfi+JQj7JYZlwXg6R0wAnNUr9pva
	 GmkzUMLN5b+DoOMh2nTRuPpAMMPwpz4LtDNHeW36tenZHLSHpaWd7y30jhMFlz14xV
	 AMpFyrgEty86A==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20Block=20protocol=20incompatibilities=20with=204K=20logical=20sector=20size=20disks?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1725034164181
To: =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>, Owen Smith <owen.smith@cloud.com>, Mark Syms <mark.syms@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
Message-Id: <ZtHus/ytlA1UnHEI@l14>
References: <ZtBUnzH4sIrFAo0f@macbook.local> <ZtB0fMRCGajdcfap@l14> <ZtCW9Qq9k8UQ-jJC@macbook.local>
In-Reply-To: <ZtCW9Qq9k8UQ-jJC@macbook.local>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.855aff8734354a5badf40d95c5f5b5fc?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240830:md
Date: Fri, 30 Aug 2024 16:09:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 05:42:45PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Thu, Aug 29, 2024 at 01:15:42PM +0000, Anthony PERARD wrote:
> > On Thu, Aug 29, 2024 at 12:59:43PM +0200, Roger Pau Monn=C3=A9 wrote:
> > > The following table attempts to summarize in which units the followin=
g fields
> > > are defined for the analyzed implementations (please correct me if I =
got some
> > > of this wrong):
> > >
> > >                         =E2=94=82 sectors xenbus node =E2=94=82 reque=
sts sector_number =E2=94=82 requests {first,last}_sect
> > > =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
> > > FreeBSD blk{front,back} =E2=94=82     sector-size     =E2=94=82      =
sector-size       =E2=94=82           512
> > > =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
> > > Linux blk{front,back}   =E2=94=82         512         =E2=94=82      =
    512           =E2=94=82           512
> > > =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
> > > QEMU blkback            =E2=94=82     sector-size     =E2=94=82      =
sector-size       =E2=94=82       sector-size
> > > =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
> > > Windows blkfront        =E2=94=82     sector-size     =E2=94=82      =
sector-size       =E2=94=82       sector-size
> > > =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
> > > MiniOS                  =E2=94=82     sector-size     =E2=94=82      =
    512           =E2=94=82           512
> > > =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
> > > tapdisk blkback         =E2=94=82         512         =E2=94=82      =
sector-size       =E2=94=82           512

Tapdisk situation seems more like:

     tapdisk blkback         =E2=94=82      ??????????     =E2=94=82      ?=
??????????       =E2=94=82         ?????

I've looks at the implementation at xapi-project/blktat[1] and the way
sector_number or {first,last}_sect seems to be used varied on which
backend is used (block-vhd, block-nbd, block-aio).

[1] https://github.com/xapi-project/blktap

block-vhd seems mostly sectors of 512 but recalculated with "s->spb"
(sector per block?) but still, sector seems to be only 512.

block-nbd seems to set "sector-size" to always 512, but uses
"sector-size" for sector_number and {first,last}_sect.

The weirdest one is block-aio, where on read it multiply sector_number
and {first,last}_sect by 512, but on write, those are multiplied by
"sector-size". With "sector-size" set by ioctl(BLKSSZGET)

At least, is seems "sectors" is a multiple of 512 on all those, like in
the table, but I've only look at those 3 "drivers".


> > There's OVMF as well, which copied MiniOS's implementation, and looks
> > like it's still the same as MiniOS for the table above:
> > 
> > OVMF (base on MiniOS)   =E2=94=82     sector-size     =E2=94=82        =
  512           =E2=94=82           512
> > 
> > >
> > > It's all a mess, I'm surprised we didn't get more reports about broke=
nness when
> > > using disks with 4K logical sectors.
> > >
> > > Overall I think the in-kernel backends are more difficult to update (=
as it
> > > might require a kernel rebuild), compared to QEMU or blktap.  Hence m=
y slight
> > > preference would be to adjust the public interface to match the behav=
ior of
> > > Linux blkback, and then adjust the implementation in the rest of the =
backends
> > > and frontends.
> > 
> > I would add that making "sector-size" been different from 512 illegal
> > makes going forward easier, has every implementation will work with a
> > "sector-size" of 512, and it probably going to be the most common secto=
r
> > size for a while longer.
> 
> My main concern is the amount of backends out there that already
> expose a "sector-size" different than 512.  I fear any changes here
> will take time to propagate to in-kernel backends, and hence my
> approach was to avoid modifying Linux blkback, because (as seen in the
> FreeBSD bug report) there are already instances of 4K logical sector
> disks being used by users.  Modifying the frontends is likely easier,
> as that's under the owner of the VM control.
> 
> > > There was an attempt in 2019 to introduce a new frontend feature flag=
 to signal
> > > whether the frontend supported `sector-size` xenstore nodes different=
 than 512 [0].
> > > However that was only ever implemented for QEMU blkback and Windows b=
lkfront,
> > > all the other backends will expose `sector-size` different than 512 w=
ithout
> > > checking if `feature-large-sector-size` is exposed by the frontend.  =
I'm afraid
> > > it's now too late to retrofit that feature into existing backends, se=
eing as
> > > they already expose `sector-size` nodes greater than 512 without chec=
king if
> > > `feature-large-sector-size` is reported by the frontend.
> > 
> > Much before that, "physical-sector-size" was introduced (2013):
> >     https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit;h=3Da67e2dac=
9f8339681b30b0f89274a64e691ea139
> > 
> > Linux seems to implement it, but QEMU or OVMF don't have it.
> 
> Yeah, I was aware of this, normal disks already have a physical sector
> size (optimal sector size) and a logical sector size (minimal size
> supported by the drive).  Some implement a smaller logical than
> physical sector size by doing read-modify-write.
> 
> > > My proposal would be to adjust the public interface with:
> > >
> > >  * Disk size is calculated as: `sectors` * 512 (`sectors` being the c=
ontents of
> > >    such xenstore backend node).
> > >
> > >  * All the sector related fields in blkif ring requests use a 512b ba=
se sector
> > >    size, regardless of the value in the `sector-size` xenstore node.
> > >
> > >  * The `sector-size` contains the disk logical sector size.  The fron=
tend must
> > >    ensure that all request segments addresses are aligned and it's le=
ngth is
> > >    a multiple of such size.  Otherwise the backend will refuse to pro=
cess the
> > >    request.
> > 
> > You still want to try to have a "sector-size" different from 512? To me
> > this just add confusion to the confusion. There would be no way fro
> > backend or frontend to know if setting something other than 512 is goin=
g
> > to work.
> 
> But that's already the case, most (all?) backends except QEMU will set
> "sector-size" to the underlying block storage logical sector size

QEMU, only if feature-large-sector-size is set, indeed, otherwise it
just return an error if it have to set "sector-size" to a value
different from 512.

Otherwise, yes for Linux, FreeBSD, and maybe yes for blktap. For blktap
it seems to depend of the storage, more or less:
    - block-vhd: always "sector-size" =3D 512
    - block-nbd: always "sector-size" =3D 512
    - block-aio: physical storage sector size

> without any way to tell if the frontend supports sector-sizes !=3D 512.
> So the issue is not inherently with the setting of the "sector-size"
> node to a value different than 512, but rather how different
> implementations have diverged regarding which is the base unit of
> other fields.
> 
> > Also, it is probably easier to update backend than frontend, so
> > it is just likely that something is going to lag behind and broke.
> 
> Hm, I'm not convinced, sometimes the owner of a VM has no control over
> the version of the backends if it's not the admin of the host.  OTOH
> the owner of a VM could always update the kernel in order to
> workaround such blkfront/blkback incompatibility issues.  Hence my
> preference was for solutions that didn't involve changing Linux
> blkback, as I believe that's the most commonly used backend.

Going the Linux way might be the least bad option indeed. sectors in
requests has been described as a 512-bytes for a long while. It's only
"sectors" that have been described as "sector-size"-bytes size.

> > Why not make use of the node "physical-sector-size" that have existed
> > for 10 years, even if unused or unadvertised, and if an IO request isn'=
t
> > aligned on it, it is just going to be slow (as backend would have to
> > read,update,write instead of just write sectors).
> 
> I don't really fancy implementing read-modify-write on the backends,
> as it's going to add more complexity to blkback implementations,
> specially the in-kernel ones I would assume.
> 
> All frontends I've looked into support "sector-size" !=3D 512, but
> there's a lack of uniformity on whether other units used in the
> protocol are based on the blkback exposed "sector-size", or hardcoded
> to 512.
> 
> So your suggestion would be to hardcode "sector-size" to 512 and use
> the "physical-sector-size" node value to set the block device logical
> sector size the frontends?
> 
> If we go that route I would suggest that backends are free to refuse
> requests that aren't a multiple of "physical-sector-size".

After looking in more detail in the different implementations, and linux
one, I don't think changing "physical-sector-size" meaning is going to
be helpful.

What to do about "feature-large-sector-size"? Should backend refuse to
connect to the front end if that flag is set and "sector-size" want to
be different than 512? This would just be Windows frontend I guess.
(Just as an helper for updated backend)


So yes, after more research, having sector in the protocol been a
512-byte size seems the least bad option. "sector_number" and
"{first,last}_sect" have been described as is for a long while. Only
"sectors" for the size has been described as a "sector-size" quantity.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


