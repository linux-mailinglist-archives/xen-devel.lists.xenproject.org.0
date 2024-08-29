Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DEE96461D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 15:16:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785880.1195405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjf08-0001fm-Mw; Thu, 29 Aug 2024 13:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785880.1195405; Thu, 29 Aug 2024 13:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjf08-0001dp-J2; Thu, 29 Aug 2024 13:15:48 +0000
Received: by outflank-mailman (input) for mailman id 785880;
 Thu, 29 Aug 2024 13:15:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0n6n=P4=bounce.vates.tech=bounce-md_30504962.66d0747e.v1-9fbed1d04ff84916936c2e20710d9ed7@srs-se1.protection.inumbo.net>)
 id 1sjf07-0001dd-2D
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 13:15:47 +0000
Received: from mail135-11.atl141.mandrillapp.com
 (mail135-11.atl141.mandrillapp.com [198.2.135.11])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbdc9fcd-6608-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 15:15:44 +0200 (CEST)
Received: from pmta14.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail135-11.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4Wvhby6BFnzLfH091
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 13:15:42 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9fbed1d04ff84916936c2e20710d9ed7; Thu, 29 Aug 2024 13:15:42 +0000
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
X-Inumbo-ID: cbdc9fcd-6608-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1724937342; x=1725197842;
	bh=GNvtVlkOwaX8Tpje5yHMSIrXJ2hP+8ENORnl23xzVs8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=lEfIq2jktmrt6qk/YIx0jkEZ0X9DgChcJrxyBuaJz2NPFbnJ2m3mrBf+7Rli9JY8J
	 A4FCLFjZ3CgLu5ZMWHBz7qu0lKJ21YXl0GN95IjOft6RRbDLlhsn8XYpcivrSJTSxP
	 49QUXrrc05fIafveD3LN2rus22mKI6+NF4SB/FIIHT7QpfufXDnlCRsbSOgZqXnuAp
	 4qbnL501L22chZtjqbAbmI66gGTJw8iLTC6+71lhxqNuM0zD8Uf406cadCaExuPKjH
	 wlIk0XkPPoseaj9KhEA5w+n3ayYxd4DtCmFGmPnXPxl1faXlf2UuuNW1spHTfuWDOp
	 FtkJS+hh4yhlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1724937342; x=1725197842; i=anthony.perard@vates.tech;
	bh=GNvtVlkOwaX8Tpje5yHMSIrXJ2hP+8ENORnl23xzVs8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=aQsIS3vBVJDtfBzajYBUaiU5TRYJ07IsQhlQoYrKlLm43tmA2r7uCjFPJq0sIEi0Y
	 OvO4fi0YzchUJ+seg7PoyGBUPcmscma1ovxzVMRzbQqHX1Z24wmLKe1dLjWkBuhnL2
	 uq7962XTNTyjWJPHpnCqtF1fNfidirerxXBCdlY+wThpvBfZQmtHGcRtM1co2kZ9Fp
	 OVyKsFezQ1sj2t7rtg+l8BmxhSlDMSeTH2KQUp3UmDgXGbjbsifcXCYV07Y3LNasLc
	 IVH6XuxPmqD9uk3MPaVDxEc/b0bbxWMTCBL85u7CsWfF+6DtWuHsk5CNeogDlSmTmP
	 vW22HY2EfGs+g==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20Block=20protocol=20incompatibilities=20with=204K=20logical=20sector=20size=20disks?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1724937341282
To: =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>, Owen Smith <owen.smith@cloud.com>, Mark Syms <mark.syms@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
Message-Id: <ZtB0fMRCGajdcfap@l14>
References: <ZtBUnzH4sIrFAo0f@macbook.local>
In-Reply-To: <ZtBUnzH4sIrFAo0f@macbook.local>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9fbed1d04ff84916936c2e20710d9ed7?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240829:md
Date: Thu, 29 Aug 2024 13:15:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 12:59:43PM +0200, Roger Pau Monn=C3=A9 wrote:
> Hello,
> 
> To give some context, this started as a bug report against FreeBSD failin=
g to
> work with PV blkif attached disks with 4K logical sectors when the backen=
d is
> Linux kernel blkback:
> 
> https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=3D280884
> 
> Further investigation has lead me to discover that the protocol described=
 in
> the public blkif.h header is not implemented uniformly, and there are maj=
or
> inconsistencies between implementations regarding the meaning of the `sec=
tors`
> and `sector-size` xenstore nodes, and the sector_number and {first,last}_=
sect
> struct request fields.  Below is a summary of the findings on the
> implementation I've analyzed.
> 
> Linux blk{front,back} always assumes the `sectors` xenstore node to be in=
 512b
> units, regardless of the value of the `sector-size` node.  Equally the ri=
ng
> request sector_number and the segments {first,last}_sect fields are alway=
s
> assumed to be in units of 512b regardless of the value of `sector-size`. =
 The
> `feature-large-sector-size` node is neither exposed by blkfront, neither
> checked by blkback before exposing a `sector-size` node different than 51=
2b.
> 
> FreeBSD blk{front,back} calculates (and for blkback exposes) the disk siz=
e as
> `sectors` * `sector-size` based on the values in the xenstore nodes (as
> described in blkif.h).  The ring sector_number is filled with the sector =
number
> based on the `sector-size` value, however the {first,last}_sect fields ar=
e
> always calculated as 512b units.   The `feature-large-sector-size` node i=
s
> neither exposed by blkfront, neither checked by blkback before exposing a
> `sector-size` node different than 512b.
> 
> QEMU qdisk blkback implementation exposes the `sectors` disk size in unit=
s of
> `sector-size` (as FreeBSD blkback).  The ring structure fields sector_num=
ber
> and {first,last}_sect are assumed to be in units of `sector-size`.  This
> implementation will not expose a `sector-size` node with a value differen=
t than
> 512 unless the frontend xenstore path has the `feature-large-sector-size`=
 node
> present.
> 
> Windows blkfront calculates the disk size as `sectors` * `sector-size` fr=
om the
> xenstore nodes exposed by blkback.   The ring structure fields sector_num=
ber
> and {first,last}_sect are assumed to be in units of `sector-size`.  This
> frontend implementation exposes `feature-large-sector-size`.
> 
> When using a disk with a logical sector size different than 512b, Linux i=
s only
> compatible with itself, same for FreeBSD.  QEMU blkback implementation is=
 also
> only compatible with the Windows blkfront implementation.  The
> `feature-large-sector-size` seems to only be implemented for the QEMU/Win=
dows
> combination, both Linux and FreeBSD don't implement any support for it ne=
ither
> in the backend or the frontend.
> 
> The following table attempts to summarize in which units the following fi=
elds
> are defined for the analyzed implementations (please correct me if I got =
some
> of this wrong):
> 
>                         =E2=94=82 sectors xenbus node =E2=94=82 requests =
sector_number =E2=94=82 requests {first,last}_sect
> =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
> FreeBSD blk{front,back} =E2=94=82     sector-size     =E2=94=82      sect=
or-size       =E2=94=82           512
> =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
> Linux blk{front,back}   =E2=94=82         512         =E2=94=82          =
512           =E2=94=82           512
> =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
> QEMU blkback            =E2=94=82     sector-size     =E2=94=82      sect=
or-size       =E2=94=82       sector-size
> =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
> Windows blkfront        =E2=94=82     sector-size     =E2=94=82      sect=
or-size       =E2=94=82       sector-size
> =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
> MiniOS                  =E2=94=82     sector-size     =E2=94=82          =
512           =E2=94=82           512
> =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
> tapdisk blkback         =E2=94=82         512         =E2=94=82      sect=
or-size       =E2=94=82           512

There's OVMF as well, which copied MiniOS's implementation, and looks
like it's still the same as MiniOS for the table above:

OVMF (base on MiniOS)   =E2=94=82     sector-size     =E2=94=82          51=
2           =E2=94=82           512

> 
> It's all a mess, I'm surprised we didn't get more reports about brokennes=
s when
> using disks with 4K logical sectors.
> 
> Overall I think the in-kernel backends are more difficult to update (as i=
t
> might require a kernel rebuild), compared to QEMU or blktap.  Hence my sl=
ight
> preference would be to adjust the public interface to match the behavior =
of
> Linux blkback, and then adjust the implementation in the rest of the back=
ends
> and frontends.

I would add that making "sector-size" been different from 512 illegal
makes going forward easier, has every implementation will work with a
"sector-size" of 512, and it probably going to be the most common sector
size for a while longer.

> There was an attempt in 2019 to introduce a new frontend feature flag to =
signal
> whether the frontend supported `sector-size` xenstore nodes different tha=
n 512 [0].
> However that was only ever implemented for QEMU blkback and Windows blkfr=
ont,
> all the other backends will expose `sector-size` different than 512 witho=
ut
> checking if `feature-large-sector-size` is exposed by the frontend.  I'm =
afraid
> it's now too late to retrofit that feature into existing backends, seeing=
 as
> they already expose `sector-size` nodes greater than 512 without checking=
 if
> `feature-large-sector-size` is reported by the frontend.

Much before that, "physical-sector-size" was introduced (2013):
    https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit;h=3Da67e2dac9f83=
39681b30b0f89274a64e691ea139

Linux seems to implement it, but QEMU or OVMF don't have it.

> My proposal would be to adjust the public interface with:
> 
>  * Disk size is calculated as: `sectors` * 512 (`sectors` being the conte=
nts of
>    such xenstore backend node).
> 
>  * All the sector related fields in blkif ring requests use a 512b base s=
ector
>    size, regardless of the value in the `sector-size` xenstore node.
> 
>  * The `sector-size` contains the disk logical sector size.  The frontend=
 must
>    ensure that all request segments addresses are aligned and it's length=
 is
>    a multiple of such size.  Otherwise the backend will refuse to process=
 the
>    request.

You still want to try to have a "sector-size" different from 512? To me
this just add confusion to the confusion. There would be no way fro
backend or frontend to know if setting something other than 512 is going
to work. Also, it is probably easier to update backend than frontend, so
it is just likely that something is going to lag behind and broke.

Why not make use of the node "physical-sector-size" that have existed
for 10 years, even if unused or unadvertised, and if an IO request isn't
aligned on it, it is just going to be slow (as backend would have to
read,update,write instead of just write sectors).

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


