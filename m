Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 131449F7D75
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 15:59:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861274.1273215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOHyy-00083M-Ak; Thu, 19 Dec 2024 14:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861274.1273215; Thu, 19 Dec 2024 14:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOHyy-00081w-82; Thu, 19 Dec 2024 14:58:32 +0000
Received: by outflank-mailman (input) for mailman id 861274;
 Thu, 19 Dec 2024 14:58:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C+Gw=TM=bounce.vates.tech=bounce-md_30504962.67643493.v1-e1d13329625f43c4b6e01dc0f7a977a2@srs-se1.protection.inumbo.net>)
 id 1tOHyx-00081o-BW
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 14:58:31 +0000
Received: from mail133-1.atl131.mandrillapp.com
 (mail133-1.atl131.mandrillapp.com [198.2.133.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b478ca21-be19-11ef-a0d8-8be0dac302b0;
 Thu, 19 Dec 2024 15:58:29 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-1.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4YDYZq3vvczBsTyWJ
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 14:58:27 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e1d13329625f43c4b6e01dc0f7a977a2; Thu, 19 Dec 2024 14:58:27 +0000
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
X-Inumbo-ID: b478ca21-be19-11ef-a0d8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1734620307; x=1734880807;
	bh=LIcZ4kS6QwSkVcmgp4WEGadBISGt1CCixH2sTLJXo7c=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=XyYfI2fHjYxxdBprm8ihIH9UoGEb+iog4OfFrJRMUZg/dVvTsZPe0L2iCu0BSV7FA
	 YUbGALNgG3JH3j+HxDfWVL/ipffTZAhtsHFuGBBVzw3X/3iwCWGqmEA+e2CvGGXJA9
	 u6Y4U9Hn/uZcT04DtsAzx22g9IQ3HsZMIBM4+7iwWgSG6A6g2SWXs3NBcMrZGdx+ah
	 hKTdo8PsecKjzbdasOjBL4I1t2kxOuO53rpSf5A1uvtz06qVUcPsdFYJgh4IGGF60T
	 cvdjqVzb1I/FXYLJo1jDdZY5kwOQUzty2SW568PpLQkfTn9viNPl0ScE/igahL17ZL
	 Z1PhtApSPGiMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1734620307; x=1734880807; i=anthony.perard@vates.tech;
	bh=LIcZ4kS6QwSkVcmgp4WEGadBISGt1CCixH2sTLJXo7c=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=bZplh9ECLJGE2Sg0aULtohZBIcCpSffTQhrgE4JoSK70w4FLGdYaQE6z2cjdq7ftH
	 PEectnuN3IXfF9OsbiCERiyUZ184GViGYqy/qhSGgiKTRux8NGF9UfU6UVt3DxFywI
	 dcqEn2/oI2ZBcf/cOXdpYxZYwyAaVnrwaF65yoy6UvTEcQAfsZ3E3JL5pleE+GQIJ2
	 OtOWYRE8kkuqkSLHhDeaIaWkGhaX8qLPoI1E0lsAU6+4uNRS1tdGEJIUylcwAzmsbR
	 lViI2fWMSL3jRcC7RqBGDbsKBS+r9UNDO9PZtdDxhHC911p8wfusz3DK56/gAk9CrE
	 c2MFaGGndJPOQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20tools/xg:=20increase=20LZMA=5FBLOCK=5FSIZE=20for=20uncompressing=20the=20kernel?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1734620306094
To: "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Cc: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org, "Juergen Gross" <jgross@suse.com>
Message-Id: <Z2Q0jDWWNnPrVnaf@l14>
References: <20241008213225.728922-1-marmarek@invisiblethingslab.com> <Z2MNQTDM3N22ceWy@macbook.local>
In-Reply-To: <Z2MNQTDM3N22ceWy@macbook.local>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e1d13329625f43c4b6e01dc0f7a977a2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241219:md
Date: Thu, 19 Dec 2024 14:58:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 06:58:25PM +0100, Roger Pau Monn=C3=A9 wrote:
> On Tue, Oct 08, 2024 at 11:32:23PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Linux 6.12-rc2 fails to decompress with the current 128MiB, contrary to
> > the code comment. It results in a failure like this:
> > 
> >     domainbuilder: detail: xc_dom_kernel_file: filename=3D"/var/lib/qub=
es/vm-kernels/6.12-rc2-1.1.fc37/vmlinuz"
> >     domainbuilder: detail: xc_dom_malloc_filemap    : 12104 kB
> >     domainbuilder: detail: xc_dom_module_file: filename=3D"/var/lib/qub=
es/vm-kernels/6.12-rc2-1.1.fc37/initramfs"
> >     domainbuilder: detail: xc_dom_malloc_filemap    : 7711 kB
> >     domainbuilder: detail: xc_dom_boot_xen_init: ver 4.19, caps xen-3.0=
-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64
> >     domainbuilder: detail: xc_dom_parse_image: called
> >     domainbuilder: detail: xc_dom_find_loader: trying multiboot-binary =
loader ...
> >     domainbuilder: detail: loader probe failed
> >     domainbuilder: detail: xc_dom_find_loader: trying HVM-generic loade=
r ...
> >     domainbuilder: detail: loader probe failed
> >     domainbuilder: detail: xc_dom_find_loader: trying Linux bzImage loa=
der ...
> >     domainbuilder: detail: _xc_try_lzma_decode: XZ decompression error:=
 Memory usage limit reached
> >     xc: error: panic: xg_dom_bzimageloader.c:761: xc_dom_probe_bzimage_=
kernel unable to XZ decompress kernel: Invalid kernel
> >     domainbuilder: detail: loader probe failed
> >     domainbuilder: detail: xc_dom_find_loader: trying ELF-generic loade=
r ...
> >     domainbuilder: detail: loader probe failed
> >     xc: error: panic: xg_dom_core.c:689: xc_dom_find_loader: no loader =
found: Invalid kernel
> >     libxl: error: libxl_dom.c:566:libxl__build_dom: xc_dom_parse_image =
failed
> > 
> > The important part: XZ decompression error: Memory usage limit reached
> > 
> > This looks to be related to the following change in Linux:
> > 8653c909922743bceb4800e5cc26087208c9e0e6 ("xz: use 128 MiB dictionary a=
nd force single-threaded mode")
> > 
> > Fix this by increasing the block size to 256MiB. And remove the
> > misleading comment (from lack of better ideas).
> > 
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> 
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> 
> I assumed I already RB this, but it seems not.
> 
> Could we get an Ack from the tools or libs maintainer for this to go
> in?  It's not the best solution, but we need to get this sorted in
> time for 4.20, and backport to stable branches.

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


