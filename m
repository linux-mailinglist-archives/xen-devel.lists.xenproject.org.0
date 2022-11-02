Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 693DC616614
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 16:27:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435981.689967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqFdc-0004LA-Fe; Wed, 02 Nov 2022 15:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435981.689967; Wed, 02 Nov 2022 15:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqFdc-0004IE-Cl; Wed, 02 Nov 2022 15:26:44 +0000
Received: by outflank-mailman (input) for mailman id 435981;
 Wed, 02 Nov 2022 15:26:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2cji=3C=citrix.com=prvs=298722737=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oqFda-0004I8-M6
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 15:26:42 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be757f72-5ac2-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 16:26:39 +0100 (CET)
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
X-Inumbo-ID: be757f72-5ac2-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667402799;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H963iADFFHE0RAKLVSkRhg3KPlfTRTn86dkD/1P0sEk=;
  b=K7g02+QpuDt3Mf+RH4QwVCvzBTEyWqktU9SHOvaaEBBl12DiQZIfpEky
   kU5Mm1ykV3ZD0An1CLCA040UJVDNN+h/Vl19+h3b0YxIDCvboq3/Jr6mx
   DydIPFz0MRQ5VQoXC49hn67raKBvxAtYEr4WLTSqWGM7Nob2kmHseKpHa
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 84019006
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:46Yz8q7IXuSuPeivfcGzLgxRtPXHchMFZxGqfqrLsTDasY5as4F+v
 mdMW2/QbqmMNmHwKdp2b46180kH6MfVxtEyGVFqq3o1Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4ZwehBtC5gZkPKkT5geE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m0
 sMHNjEBaCG6pqGJ4+24b+Vigp4lBZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJU0UUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0Fwh7B9
 zqeoQwVBDlKa/2WkjCPyUi9xf7mhDLgeaw0Oeeno6sCbFq7mTVIVUx+uUGAieKilke0VtZbK
 koV0ikjt64/8AqsVNaVdx+lpH+JuDYMVtwWFPc1gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaEQgYK3UTIxANSwQt6sPm5oo0i3rnTNxuDaq0hd3dAizrz
 naBqy1WulkIpZdVjePhpwmB2m/y4MiSJuIo2unJdkWa8R14aIiUXq3r1nuE7tNMIoLDSHDU6
 RDohPOixOwJCJiMkgmET+MMAKyl6p65DdHMvbJ8N8J/rmrwohZPaagVuWgjfxkxbq7obBezO
 CfuVRVtCIi/1ZdARYt+eMqPBssj1sAM/vy1B6mPPrKijnWcHTJrHR2Ch2bKgQgBc2B2y8nT3
 Kt3lu71VB4n5VxPlmbeegvk+eZDKtoC7W3SX4vn6B+szKCTYnWYIZ9cbgXRNbpms/vV8VyJm
 zq6Cydt40wBONASnwGNqdJDRbz0BSVT6W/KRzx/KbfYf1sO9JAJAP7N27IxE7GJbIwM/tokC
 kqVAxYAoGcTcFWddm1mnFg/N+60NXu+xFpnVRER0aGAgCJ5MNnzvfdGJvPav9APrYRe8BK9d
 NFdE+3oPxiFYm6vF+g1BXUlkLFfSQ==
IronPort-HdrOrdr: A9a23:CigtYqsBxUAabURrVxwX05zC7skDdtV00zEX/kB9WHVpmszxra
 6TddAgpHvJYVcqKRQdcL+7VZVoLUmxyXcx2/h3AV7AZniFhILLFuFfBOLZqlWKcREWtNQttp
 uIG5IObuEYZmIasS+V2maFL+o=
X-IronPort-AV: E=Sophos;i="5.95,234,1661832000"; 
   d="scan'208";a="84019006"
Date: Wed, 2 Nov 2022 15:26:33 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH for-4.17 1/4] xen: Add licence information to
 public/errno.h
Message-ID: <Y2KMKUagLDUBlSvP@perard.uk.xensource.com>
References: <20221102112854.49020-1-anthony.perard@citrix.com>
 <20221102112854.49020-2-anthony.perard@citrix.com>
 <bd732008-d3f3-0f84-651d-f6bf64d9f33a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bd732008-d3f3-0f84-651d-f6bf64d9f33a@suse.com>

On Wed, Nov 02, 2022 at 01:58:11PM +0100, Jan Beulich wrote:
> On 02.11.2022 12:28, Anthony PERARD wrote:
> > Fixes: 81f559e97974 ("make error codes a formal part of the ABI")
> > Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > ---
> >  xen/include/public/errno.h | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/xen/include/public/errno.h b/xen/include/public/errno.h
> > index 5c53af6af9..6bdc8c5079 100644
> > --- a/xen/include/public/errno.h
> > +++ b/xen/include/public/errno.h
> > @@ -1,3 +1,5 @@
> > +/* SPDX-License-Identifier: MIT */
> > +
> >  /*
> >   * There are two expected ways of including this header.
> >   *
> 
> Doesn't this require at least part of Stefano's "[PATCH v4 0/4] introduce
> SPDX" as a prereq? I notice quite a few files already use leading SPDX
> comments, but perhaps wrongly so without it being explained anywhere in
> tree what this is about?

I don't think Stefano's work is required or needed, beside pointing out
that new file should use SPDX, and providing guidelines.

It seems that using the SPDX identifier in a project without explanation
is enough. It could be seen as a useless comment if not understood (but
useful for some tools) and in this case the COPYING files (in our case)
would tell the licence been used.

But, if used, "SPDX-License-Identifier: MIT" have a very specific
meaning, it means that the licence used in question is
https://spdx.org/licenses/MIT.html, and Stefano's work shouldn't change
that meaning.

Thanks,

-- 
Anthony PERARD

