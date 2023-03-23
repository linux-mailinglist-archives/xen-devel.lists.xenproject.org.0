Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B566C66A3
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 12:33:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513793.795337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfJBk-00036G-Io; Thu, 23 Mar 2023 11:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513793.795337; Thu, 23 Mar 2023 11:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfJBk-00034B-G7; Thu, 23 Mar 2023 11:33:00 +0000
Received: by outflank-mailman (input) for mailman id 513793;
 Thu, 23 Mar 2023 11:32:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8edK=7P=citrix.com=prvs=439de8c1e=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pfJBj-000345-DH
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 11:32:59 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 743a0c53-c96e-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 12:32:56 +0100 (CET)
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
X-Inumbo-ID: 743a0c53-c96e-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679571176;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KwvTtc2PjzwTUMm4LzlotCipRvkIYqD6X48g8GQVTb4=;
  b=dvFzoorP7jD+n5nQpMqRgIPwD4h7JbmkeXyGIXq8h863UfWJ1UjAD+Yg
   MTNWOtAIfq9sx7TsBwq+RGPe0wTD/ZQZnqY5cNYfrLpYU11inVJVF44CN
   2GmN8mBOtsJwitAffurFrmACPvoSDseZo7L6Z7yXRo26lt0fRFu/shjql
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 100806944
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:zFT4ialWO6G7LOE1FNgkc5Xo5gyLJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfDWCBP/jfYTH1fd0kOtuwoExXv8PVx9dkGVdqrys2HyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5gSGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 a0KDyoBdyiBvdvoh77qavsvg+Q+feC+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQth/A/
 jKeoTWlXnn2MvS+xCKGyny1ndXzjB37Vb4+F+We/eB11Qj7Kms7V0RNCArTTeOColG6c8JSL
 QoT4CVGhaEq+VaiVNXVQxyyq3nCtRkZM/JSHPc98xql0bfP7kCSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluP1TM9dDFYI3VeFE1cvoel+dto5v7Scjp9OP+nqcf5AAny+
 QnU6yRvp6dQiO4WhozuqDgrnAmQSoj1oh8dv1uIDzn7s1MgP+ZJdKTztwGFsK8owJKxCwDY4
 SNaw5X2APUmV8nlqcCbfAka8FhFDd6hOSaUv1NgFoJJG9+Fqy/6JtA4DN2TyS5U3ic4ldzBO
 hW7Vft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKlDWoXg2PBTKjz+2+KTJrU3YE
 cnzTCpRJSxCVfQPIMSeHo/xLoPHNghhnDiOFPgXPjys0KaEZW79dIrpxGCmN7hjhIvd+V292
 48GZ6O3J+B3DbSWjt//qtVIczjn7BETWPjLliCgXrXef1c2STF6UKC5LHFIU9UNopm5X9zgp
 hmVMnK0AnKl7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:p6MEd6uY8czvtjJ6QL37VqBO7skDZ9V00zEX/kB9WHVpm62j+v
 xG+c5xvyMc5wxhO03I5urwWpVoLUmzyXcX2+Us1NWZPDUO0VHARL2KhrGM/9SPIUzDH+dmpM
 JdT5Q=
X-IronPort-AV: E=Sophos;i="5.98,283,1673931600"; 
   d="scan'208";a="100806944"
Date: Thu, 23 Mar 2023 11:32:46 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 4/5] tools/libfsimage: remove private offsetof()
 definition
Message-ID: <96c9a402-d559-45be-b34e-622b34c640dc@perard>
References: <20230323090859.25240-1-jgross@suse.com>
 <20230323090859.25240-5-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230323090859.25240-5-jgross@suse.com>

On Thu, Mar 23, 2023 at 10:08:58AM +0100, Juergen Gross wrote:
> xfs/fsys_xfs.c is defining offsetof privately. Remove that definition
> and just use stddef.h instead.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

