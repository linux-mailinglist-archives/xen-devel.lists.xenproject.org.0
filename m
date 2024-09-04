Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 890CC96BE6B
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 15:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790348.1200072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slq1B-0002lH-BT; Wed, 04 Sep 2024 13:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790348.1200072; Wed, 04 Sep 2024 13:25:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slq1B-0002jY-8j; Wed, 04 Sep 2024 13:25:53 +0000
Received: by outflank-mailman (input) for mailman id 790348;
 Wed, 04 Sep 2024 13:25:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eMXQ=QC=bounce.vates.tech=bounce-md_30504962.66d85fdb.v1-b7939c8bbcc54f36a75ef404621a38e0@srs-se1.protection.inumbo.net>)
 id 1slq19-0002jS-Gz
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 13:25:52 +0000
Received: from mail135-11.atl141.mandrillapp.com
 (mail135-11.atl141.mandrillapp.com [198.2.135.11])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32a569a9-6ac1-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 15:25:49 +0200 (CEST)
Received: from pmta14.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail135-11.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4WzNXq1RYvzLfH0QC
 for <xen-devel@lists.xenproject.org>; Wed,  4 Sep 2024 13:25:47 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b7939c8bbcc54f36a75ef404621a38e0; Wed, 04 Sep 2024 13:25:47 +0000
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
X-Inumbo-ID: 32a569a9-6ac1-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1725456347; x=1725716847;
	bh=MBH/17mHyyyYy2M3ar65sBIMbHIE4Ar1hUX7H8g+zNs=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mUki4CgbXJ2x+Da/2G63HA60Cz95K5z7QUQG72HaDVK7F7qmZdsvFDw2UEfb6lAH1
	 LpxC0NeDd7ZK/5btUld0pAuiYKAncyn+iOQozvwM2ds2q8VHOfA8Kgjd4cxUuhrrF1
	 DQvb/zCYyuAW2Py19EkNV/PjSQ+ur9mWjFfK3K7Iybgo9l1EDj+w8tpbPEibXdXJR8
	 TmraSAQre7OsvPQSCEaw3b3MWXaEPMyBl9HLYhm8QPgZ6sN6fkZOMPQE6nZnuJ76aI
	 zqK0mjSmdb77rxa534MHekTwCgXIbraB9BKROudiB0o3QOgZHs4p1zYarSwwg3ltBG
	 uA/IFm7VhRSNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1725456347; x=1725716847; i=anthony.perard@vates.tech;
	bh=MBH/17mHyyyYy2M3ar65sBIMbHIE4Ar1hUX7H8g+zNs=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ai95WyKLCpZYIeyTDCj65wXTKnIKVYKZoZN/kqAYJhueS65iyy7YLnf55w7dx+BY1
	 teIS1HVHcfiPgnZFMWAHvKFJhxMjFu927jFqOd94PsxBlnx6KGvygMjAmPcnpUzTJi
	 MG6VQPQPO7UKXvTrC4eas7cijZeyzHEFp6GwbB9Y2+ny47gphtx7en7l0sy7+3kkEP
	 GiI4tfngrRdQEMLoLn2W7AWHtEcUtT9UV/kduhFbrcBPnVYvX4s2iJ7EW3iKaP8CEq
	 eFD9fLCsF/RhUZ2fxaLqgGe6HqN5ilr2DmkH90xUq/nsFNBcPhayK4HV9I8lqCvlk+
	 wz1uDOh2iLE6Q==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20blkif:=20reconcile=20protocol=20specification=20with=20in-use=20implementations?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1725456345719
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>, Owen Smith <owen.smith@cloud.com>, Mark Syms <mark.syms@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
Message-Id: <Zthf2avsHv7XP4cs@l14>
References: <20240903141923.72241-1-roger.pau@citrix.com>
In-Reply-To: <20240903141923.72241-1-roger.pau@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b7939c8bbcc54f36a75ef404621a38e0?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240904:md
Date: Wed, 04 Sep 2024 13:25:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 03, 2024 at 04:19:23PM +0200, Roger Pau Monne wrote:
> Current blkif implementations (both backends and frontends) have all slig=
ht
> differences about how they handle the 'sector-size' xenstore node, and ho=
w
> other fields are derived from this value or hardcoded to be expressed in =
units
> of 512 bytes.
> 
> To give some context, this is an excerpt of how different implementations=
 use
> the value in 'sector-size' as the base unit for to other fields rather th=
an
> just to set the logical sector size of the block device:
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
> 
> An attempt was made by 67e1c050e36b in order to change the base units of =
the
> request fields and the xenstore 'sectors' node.  That however only lead t=
o more
> confusion, as the specification now clearly diverged from the reference
> implementation in Linux.  Such change was only implemented for QEMU Qdisk
> and Windows PV blkfront.
> 
> Partially revert to the state before 67e1c050e36b:
> 
>  * Declare 'feature-large-sector-size' deprecated.  Frontends should not =
expose
>    the node, backends should not make decisions based on its presence.
> 
>  * Clarify that 'sectors' xenstore node and the requests fields are alway=
s in
>    512-byte units, like it was previous to 67e1c050e36b.
> 
> All base units for the fields used in the protocol are 512-byte based, th=
e
> xenbus 'sector-size' field is only used to signal the logic block size.  =
When
> 'sector-size' is greater than 512, blkfront implementations must make sur=
e that
> the offsets and sizes (even when expressed in 512-byte units) are aligned=
 to
> the logical block size specified in 'sector-size', otherwise the backend =
will
> fail to process the requests.
> 
> This will require changes to some of the frontends and backends in order =
to
> properly support 'sector-size' nodes greater than 512.
> 
> Fixes: 67e1c050e36b ('public/io/blkif.h: try to fix the semantics of sect=
or based quantities')

Probably want to add:
Fixes: 2fa701e5346d ("blkif.h: Provide more complete documentation of the b=
lkif interface")

> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/include/public/io/blkif.h | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/include/public/io/blkif.h b/xen/include/public/io/blkif.=
h
> index 22f1eef0c0ca..07708f4d08eb 100644
> --- a/xen/include/public/io/blkif.h
> +++ b/xen/include/public/io/blkif.h
> @@ -240,10 +240,6 @@
>   *      The logical block size, in bytes, of the underlying storage. Thi=
s
>   *      must be a power of two with a minimum value of 512.

Should we add that "sector-size" is to be used only for request length?


> - *      NOTE: Because of implementation bugs in some frontends this must=
 be
> - *            set to 512, unless the frontend advertizes a non-zero valu=
e
> - *            in its "feature-large-sector-size" xenbus node. (See below=
).
> - *
>   * physical-sector-size
>   *      Values:         <uint32_t>
>   *      Default Value:  <"sector-size">
> @@ -254,8 +250,8 @@
>   * sectors
>   *      Values:         <uint64_t>
>   *
> - *      The size of the backend device, expressed in units of "sector-si=
ze".
> - *      The product of "sector-size" and "sectors" must also be an integ=
er
> + *      The size of the backend device, expressed in units of 512b.
> + *      The product of "sector-size" * 512 must also be an integer
>   *      multiple of "physical-sector-size", if that node is present.
>   *
>   ***********************************************************************=
******
> @@ -338,6 +334,7 @@
>   * feature-large-sector-size
>   *      Values:         0/1 (boolean)
>   *      Default Value:  0
> + *      Notes:          DEPRECATED, 12
>   *
>   *      A value of "1" indicates that the frontend will correctly supply=
 and

Could you remove "correctly" from this sentence? It's misleading.

>   *      interpret all sector-based quantities in terms of the "sector-si=
ze"
> @@ -411,6 +408,11 @@
>   *(10) The discard-secure property may be present and will be set to 1 i=
f the
>   *     backing device supports secure discard.
>   *(11) Only used by Linux and NetBSD.
> + *(12) Possibly only ever implemented by the QEMU Qdisk backend and the =
Windows
> + *     PV block frontend.  Other backends and frontends supported 'secto=
r-size'
> + *     values greater than 512 before such feature was added.  Frontends=
 should
> + *     not expose this node, neither should backends make any decisions =
based
> + *     on it being exposed by the frontend.
>   */
>  
>  /*
> @@ -621,9 +623,12 @@
>  /*
>   * NB. 'first_sect' and 'last_sect' in blkif_request_segment, as well as
>   * 'sector_number' in blkif_request, blkif_request_discard and
> - * blkif_request_indirect are sector-based quantities. See the descripti=
on
> - * of the "feature-large-sector-size" frontend xenbus node above for
> - * more information.
> + * blkif_request_indirect are all in units of 512 bytes, regardless of w=
hether the
> + * 'sector-size' xenstore node contains a value greater than 512.
> + *
> + * However the value in those fields must be properly aligned to the log=
ical
> + * sector size reported by the 'sector-size' xenstore node, see 'Backend=
 Device
> + * Properties' section.
>   */
>  struct blkif_request_segment {

Textually (that is without reading it) this comment seems to only apply
to `struct blkif_request_segment`. There is an other comment that
separate it from `struct blkif_request` (and it is far away from
blkif_request_discard and blkif_request_indirect). For `struct
blkif_request.sector_number`, the only comment is "start sector idx on
disk" but it's really hard to tell how to interpret it, it could be
interpreted as a "sector-size" quantity because that the size of a
sector on the disk, the underlying storage.

So, I think we need to change the comment of
`blkif_request.sector_number`.


Another thing, there's a "type" `blkif_sector_t` defined at the beginning
of the file, would it be worth it to add a description to it?

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


