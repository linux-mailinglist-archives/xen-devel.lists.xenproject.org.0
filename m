Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3159149CFEB
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 17:43:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261034.451543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nClOB-0000kz-JF; Wed, 26 Jan 2022 16:43:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261034.451543; Wed, 26 Jan 2022 16:43:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nClOB-0000iv-Fr; Wed, 26 Jan 2022 16:43:19 +0000
Received: by outflank-mailman (input) for mailman id 261034;
 Wed, 26 Jan 2022 16:43:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iJVZ=SK=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nClO9-0000iW-ON
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 16:43:17 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d5f5d4c-7ec7-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 17:43:16 +0100 (CET)
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
X-Inumbo-ID: 0d5f5d4c-7ec7-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643215396;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ma2biUqHTpSS5SaZFZ5W6hVQcNktSz5lX77ibumn1pA=;
  b=RKjHkKxPoft2TfLHxSj+ptM3bQCHfHy1PDJEEcS0Wf5ujsJ000VKxU7a
   1H4JnUvN8aWkLI3a1A1h9aScl4xGTaPdOEa6fTrcLTz7U9pgo0cBCCVy5
   ulD4Cz67XWjjwh+tH611WJKbGqrrZkuyoiyhp+kUDVz/eRnGK4KJ8cdAI
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 4anLBNFVMj57IlnNQu3Kmr3I7i5pjiwCGonbV3WDFB8uC24qfHeg8qlCHLuFcPNs8850Ig+nBW
 BvUeXidX/ouDSkogpveoYonTgbNkNh515tXgxhfM6sGimiXOQxx5v0/QJL7kaiaX7uN6/y8cBS
 rLpcHCyI5orl15z+aqoQxSnov/Yvqbk8MiXfUw1qaGi+UJY5Cbt5YueH3+Z0eYSasWmcwzxSek
 4KGBwJNYItKEbunjS8LKnDoso3BU3ZCK5lCWvJifUUlI+SOPU27Prcbf8BedzQ5TGtdi1lWwtL
 TB1jM7bMYc01NPjBzUakH2U7
X-SBRS: 5.2
X-MesageID: 62284306
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bjxAPKmVu7Vmhj0ZEaa2L5Xo5gzzIERdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLXD3TbvbYMDOneNx1aIW08khVvMfRnIVlTAttrns3FyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29Q22YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 IQRp622QiE5ArHNqt0dYjhDTnxnZJQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQ6yEN
 5ZCMWQHgBLoahBmPEkcOokHn7m1jz7mTmJAiErOqv9ii4TU5FMoi+W8WDbPQfSHSdhchEqfj
 mLP9Wf+GQ1cMtGDoRKf83msj/XD2yP2Xo4fDqa/8NZugVua3GtVDwcZPXO+uuWRkEOyW9tDb
 UcT/0IGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6cD3IPQzoHYcQoucs8TCEv/
 lCMltLtQzdotdW9S3ub+q2FsDCaNi0cLGtEbigBJSMd6sTniJE+iFTIVNkLOLe4i8CwFTzuz
 jSiqi84iLMOy8kR2M2T5VrAhSCtoJnhVAM55gzLGGmi62tRf5W5boal7Vza6/doL4uDSFSF+
 n8elKCjAPsmVM/X0nbXGaNUQe/vt63t3CDgbUBHTsUzxjKm3W6fYYFi2TFPBVw0b99dQGq8C
 KPMgj956JhWNXqsSKZ4ZYOtFsgnpZTd+cTZuuP8NYQXPMUoHOOT1GQ3PBPLgTix+KQ5ufxnY
 f+mndCQ4WH24EiN5B6/XK8j3LAi3UjSLkuDFMmgn3xLPVdzDUN5qIvp0nPSP4jVD4ve+W05F
 uqz0ePQmn2zt8WlOkHqHXY7dwxiEJTCLcmeRzZrXuCCOBF6P2oqFuXcx7gsE6Q8wfgOz7yVo
 C3hBx8HoLYauZEhAV/bApyEQOi3NauTUFphZXB8VbpW8yVLjXmTAFc3KMJsIOhPGB1Lxv9oV
 fgVE/hs8dwUIgkrDw81NMGnxKQ7LUzDrVvXY0KNPWZjF7Y9GV2h0oK0L2PHqXhVZgLq5JRWn
 lFV/l6BKXb1b148XJ++hTPG5w7ZgEXxb8orDxKXeYECIRu1mGWoQgSo5sIKzwg3AU2r7lOnO
 8y+Wn/0fMHB/N049sfnn6eBo9v7GudyBBMCTWLa8ay3JW/R+W/6md1MV+OBfDb8UmLo+fr9O
 bUJnq+kaPBXzkxXt4dcEqpwyf5s7dXYuLIHnB9vG2/Gbgr3B+o4cGWGx8RGqoZE2qRd5VmtQ
 kuK99QDYeeJNcrpHUQ/Pg0gaujfh/gYliOLtaY+IVng5T8x972CCB0AMx6JgS1bDb10LIJ6n
 rtx5J9Is1Sy00N4PMyHgyZY83W3AkYBC6h35IsHBILLixYwzg0Qa5LrFSKrsoqEbM9BMxd2L
 2bM1rbCnblV2mHLb2E3SSrWxeNYiJkD5EJKwVsFKwjbk9bJnKZqjhhY8DBxRQVJ1BRXlel0P
 zEzZUFyIKyP+RZuhdRCAD/wS10QWkXB9xyj0UYNmU3YU1KsBz7EI2AKMOqQ+FwUrjBHdT9B8
 bDEkGvoXF4Gpi0qMvfejaK9l8HecA==
IronPort-HdrOrdr: A9a23:4nyGe6552m4nrYLvtgPXwMzXdLJyesId70hD6qkXc20zTiX4rb
 HLoB1/73TJYVkqNE3I9eruBEDiexPhHPxOj7X5VI3KNGOKhILCFuBfxLqn7zr8GzDvss5xvJ
 0QFpSW0eeAbmSSW/yKgjWFLw==
X-IronPort-AV: E=Sophos;i="5.88,318,1635220800"; 
   d="scan'208";a="62284306"
Date: Wed, 26 Jan 2022 16:43:03 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: <paul@xen.org>
CC: Jason Andryuk <jandryuk@gmail.com>, QEMU <qemu-devel@nongnu.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen-hvm: Allow disabling buffer_io_timer
Message-ID: <YfF6F6jG1mDbAMAj@perard>
References: <20211210193434.75566-1-jandryuk@gmail.com>
 <adfe1c14-f773-0592-e304-d80da8380cc0@gmail.com>
 <CAKf6xpv0=ex+OrFb1z4TpaULsmMaPQqmmsxoY_d4yJRt6Zx3sw@mail.gmail.com>
 <2ebaf0d6-a84a-e929-5ac2-597c81d40230@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2ebaf0d6-a84a-e929-5ac2-597c81d40230@gmail.com>

On Wed, Jan 26, 2022 at 01:47:20PM +0000, Durrant, Paul wrote:
> On 26/01/2022 13:43, Jason Andryuk wrote:
> > On Tue, Dec 14, 2021 at 8:40 AM Durrant, Paul <xadimgnik@gmail.com> wrote:
> > > 
> > > On 10/12/2021 11:34, Jason Andryuk wrote:
> > > > commit f37f29d31488 "xen: slightly simplify bufioreq handling" hard
> > > > coded setting req.count = 1 during initial field setup before the main
> > > > loop.  This missed a subtlety that an early exit from the loop when
> > > > there are no ioreqs to process, would have req.count == 0 for the return
> > > > value.  handle_buffered_io() would then remove state->buffered_io_timer.
> > > > Instead handle_buffered_iopage() is basically always returning true and
> > > > handle_buffered_io() always re-setting the timer.
> > > > 
> > > > Restore the disabling of the timer by introducing a new handled_ioreq
> > > > boolean and use as the return value.  The named variable will more
> > > > clearly show the intent of the code.
> > > > 
> > > > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > > 
> > > Reviewed-by: Paul Durrant <paul@xen.org>
> > 
> > Thanks, Paul.
> > 
> > What is the next step for getting this into QEMU?
> > 
> 
> Anthony, can you queue this?

Yes, I'll send a pull request soon.

Sorry I tend to wait a while before preparing pull requests, especially
when there's only one patch. But there's another one now.

Cheers,

-- 
Anthony PERARD

