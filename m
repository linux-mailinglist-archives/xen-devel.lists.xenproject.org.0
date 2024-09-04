Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 066B396B6CE
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 11:36:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789968.1199648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slmQU-0005SW-CQ; Wed, 04 Sep 2024 09:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789968.1199648; Wed, 04 Sep 2024 09:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slmQU-0005Pr-9o; Wed, 04 Sep 2024 09:35:46 +0000
Received: by outflank-mailman (input) for mailman id 789968;
 Wed, 04 Sep 2024 09:35:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gAgT=QC=bounce.vates.tech=bounce-md_30504962.66d829ec.v1-f28fa7f5fa0145898e8658d9d68e7c94@srs-se1.protection.inumbo.net>)
 id 1slmQS-0005Pl-Sn
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 09:35:45 +0000
Received: from mail135-11.atl141.mandrillapp.com
 (mail135-11.atl141.mandrillapp.com [198.2.135.11])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d5d3330-6aa1-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 11:35:42 +0200 (CEST)
Received: from pmta14.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail135-11.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4WzHRJ6zNWzLfH093
 for <xen-devel@lists.xenproject.org>; Wed,  4 Sep 2024 09:35:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f28fa7f5fa0145898e8658d9d68e7c94; Wed, 04 Sep 2024 09:35:40 +0000
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
X-Inumbo-ID: 0d5d3330-6aa1-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1725442541; x=1725703041;
	bh=nM1J1d2/XcqzceWeQb+foz1YDM8xXDORV/0DCKa841c=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=EeKli1EDwUi7Oe/k2w/VwxAbRIx6UBxW8+SwRaKhhxz0vyFUBYn+hlqd9GErOJCE1
	 +O6526deOOclxBlfcUp6HAMaUDFGnC40yb3ffcuplGT3FW38DLlzLNjSo4qJuEWKLA
	 T4oQzhLy34n9fmFpDymh52rxs0wVIEYmwEFMg0f3LdkCxsaxvlS877LOiQxheuXLtm
	 S6+RAyOJG/amK3i3AAjkhZwCdRrkrpndSXc4X9u0FgljksGHkC9ueqEwJkdtHOpfXx
	 asNYXNfLhN6CrqLzn2/f1HlBQbpHQhmCl8p6GexqHqH/MT0H3ye+B45l+aJee2GE26
	 SUizkbgK67afg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1725442541; x=1725703041; i=anthony.perard@vates.tech;
	bh=nM1J1d2/XcqzceWeQb+foz1YDM8xXDORV/0DCKa841c=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FnQ/q4iU5NO6lB/5Qj3dwte4PfePD7k0DFgxsH7CCi/+0ge5EMyaxWkWYxe1LDGsU
	 DbXxGLUTN92i+33JM/sD4p2NyJElD4s+G9ic3uJiOFGqCa9me72VhgglzQVUe/xALa
	 GkKyJSAugshDptzWxz7ndTsExF/pfMJnRdv4HFqCQiKgQ8evHQbmNNLVLn12y5NPrl
	 2u3ALNbqWBnipFWHIOAXzc6u/6XykX+V/PG5BEe5rGGoiWyK8XsBLQCVIztbJnvD5S
	 oG1I7G+VByxV7sPZlNUB05uNLAHpJtyMGDMFb1Y5rRnC4ptwPuEDby3rLRoNj1FhxK
	 b9Et4sAjixZcA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20blkif:=20reconcile=20protocol=20specification=20with=20in-use=20implementations?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1725442539346
To: =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: paul@xen.org, Jan Beulich <jbeulich@suse.com>, Owen Smith <owen.smith@cloud.com>, Mark Syms <mark.syms@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Message-Id: <Ztgp6j571lKZFam5@l14>
References: <20240903141923.72241-1-roger.pau@citrix.com> <99b15fe5-34e0-44e4-a351-d510ae67b5a4@suse.com> <ZtgYnAeXSamlGKgC@macbook.local> <c3f6df7e-780e-4c00-9d09-95d690166878@xen.org> <ZtgkVzByhyXjaIqY@macbook.local>
In-Reply-To: <ZtgkVzByhyXjaIqY@macbook.local>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f28fa7f5fa0145898e8658d9d68e7c94?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240904:md
Date: Wed, 04 Sep 2024 09:35:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 04, 2024 at 11:11:51AM +0200, Roger Pau Monn=C3=A9 wrote:
> On Wed, Sep 04, 2024 at 09:39:17AM +0100, Paul Durrant wrote:
> > On 04/09/2024 09:21, Roger Pau Monn=C3=A9 wrote:
> > > > In the absence of that I'm afraid it is a little harder to
> > > > judge whether the proposal here is the best we can do at this point=
.
> > > 
> > > While I don't mind looking at what we can do to better handle 4K
> > > sector disks, we need IMO to revert to the specification before
> > > 67e1c050e36b, as that change switched the hardcoded sector based unit=
s
> > > from 512 to 'sector-size', thus breaking the existing ABI.
> > > 
> > 
> > But that's the crux of the problem. What *is* is the ABI? We apparently
> > don't have one that all OS subscribe to.
> 
> At least prior to 67e1c050e36b the specification in blkif.h and (what
> I consider) the reference implementation in Linux blk{front,back}
> matched.  Previous to 67e1c050e36b blkif.h stated:
> 
> /*
>  * NB. first_sect and last_sect in blkif_request_segment, as well as
>  * sector_number in blkif_request, are always expressed in 512-byte units=
.
>  * However they must be properly aligned to the real sector size of the
>  * physical disk, which is reported in the "physical-sector-size" node in
>  * the backend xenbus info. Also the xenbus "sectors" node is expressed i=
n
>  * 512-byte units.
>  */
> 
> I think it was quite clear, and does in fact match the implementation
> in Linux.

That's wrong, Linux doesn't match the specification before 67e1c050e36b,
in particular for "sectors":

    sectors
         Values:         <uint64_t>

         The size of the backend device, expressed in units of its logical
         sector size ("sector-size").

The only implementation that matches this specification is MiniOS (and
OMVF).

Oh, I didn't notice that that random comment you quoted that comes from
the middle of the header have a different definition for "sectors" ...

Well, the specification doesn't match with the specification ... and the
only possible way to implement the specification is to only ever set
"sector-size" to 512...

No wonder that they are so many different interpretation of the
protocol.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


