Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FED4CC100
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 16:18:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283442.482444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPnDO-0001P8-LD; Thu, 03 Mar 2022 15:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283442.482444; Thu, 03 Mar 2022 15:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPnDO-0001N1-I5; Thu, 03 Mar 2022 15:18:02 +0000
Received: by outflank-mailman (input) for mailman id 283442;
 Thu, 03 Mar 2022 15:18:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ylIu=TO=citrix.com=prvs=0548df38f=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nPnDN-0001Mv-Vf
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 15:18:01 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bfcfce2-9b05-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 16:18:00 +0100 (CET)
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
X-Inumbo-ID: 1bfcfce2-9b05-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646320680;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AgntS+T/lzLvB/tG+MbQRKYvi2r5mV7YrzbckKO7chg=;
  b=S/8uDgxX8g/+mCqiXHmVRfQjVjKdCRNG0h2sS0Rf0DV7M94S0gG9pXxe
   Tn1Fa4LEPzthGaRHVvMy/S+b+44YB5DhaiWGGFQZceD+/51P5J2fa3mFr
   2nKezlMGpPuG5BzguiYQT+GywgJodJiUtBzYicnhlWUfO+MXRjRWm0vUP
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65323142
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rjNpdqz8rMOo6G5XMS56t+fRxirEfRIJ4+MujC+fZmUNrF6WrkVSm
 2oZWT2Ba6mOY2emc4x2bYS38EIAuMKAnNJrTVBkrSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2YPhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplpL2ZdS41bvT2nekGXgZUGRMlE/EZ9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6AO
 pFDMmMzNnwsZTVTFXEbEZsvntyGoSDWMG1YoQ6YpPQotj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKh0VONGQ0zOt7mOnhuiJmzjyHo0VCtWQ+uZxhVyPxkQaEBAMSUaguv69l1K/XNREb
 UcT/0IGtrMu/UamSt38WRyQo3OeuBMYHd1KHIUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRturCITXOW9p+PsCi/fyMSKAcqZzIATAYDy8nupsc0lB2nczp4OPfr1JuvQ2i2m
 m3U6nhl71kOsSIV/7Sa1Gzun2L1nJ3EVQMq6g/lBUz5sQwsMeZJeLeUwVTc6P9BKqOQQV+Ao
 GUIlqCi0QweMX2evHfTGbtQRdlF897AaWSB2gA3Q/HN4hzwoybLQGxG3N1pyK6F2O4gcCShX
 kLcsBg5CHR7bCrzNv8fj25c5q0XIUnc+TbNC6i8gjlmOMEZmOq7EMdGPxT4M4fFyhVErE3HE
 c3HGftA9F5DYUid8BK4Rv0GzZggzT0kyGXYSPjTlkr7j+DCOiLEEuhYaTNii9zVCove+m05F
 P4FaqO3J+h3CrWiMkE7D6ZJRbz1EZTLLc+v8JEGHgJyCgFnBHsgG5fsLUAJIORYc1Buvr6Qp
 BmVAxYAoHKm3CGvAVzTOhhLNeO+Nb4i/ClTFXF9Yj6VN40LPN/HAFE3LMBsI9HKNYVLkJZJc
 hXyU57YU6QXF2+eoGx1gFuUhNUKSSlHTDmmZ0KNCAXTtbY8L+AV0rcIpjfSyRQ=
IronPort-HdrOrdr: A9a23:PZwpi69SXWOVCKgc2a5uk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-IronPort-AV: E=Sophos;i="5.90,151,1643691600"; 
   d="scan'208";a="65323142"
Date: Thu, 3 Mar 2022 15:17:54 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: Re: [XEN PATCH v9 26/30] build: replace $(BASEDIR) and use $(srctree)
Message-ID: <YiDcIj8LwI1/oWLv@perard.uk.xensource.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-27-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220125110103.3527686-27-anthony.perard@citrix.com>

On Tue, Jan 25, 2022 at 11:00:59AM +0000, Anthony PERARD wrote:
> $(srctree) is a better description for the source directory than
> $(BASEDIR) that has been used for both source and build directory
> (which where the same).
> 
> This adds $(srctree) to a few path where make's VPATH=$(srctree) won't
> apply. And replace $(BASEDIR) by $(srctree).
> 
> Introduce "$(srcdir)" as a shortcut for "$(srctree)/$(src)" as the
> later is used often enough.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

This patch is now missing two hunks due to recent changes in the tree:

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 11ac0d5e28a4..1ab9db3424c2 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -153,7 +153,7 @@ $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
                >$(@D)/$(@F).map
        rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
 ifeq ($(CONFIG_XEN_IBT),y)
-       $(SHELL) $(BASEDIR)/tools/check-endbr.sh $@
+       $(SHELL) $(srctree)/tools/check-endbr.sh $@
 endif

 $(obj)/note.o: $(TARGET)-syms
@@ -226,7 +226,7 @@ endif
                | $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort >$(@D)/$(@F).map
        rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
 ifeq ($(CONFIG_XEN_IBT),y)
-       $(SHELL) $(BASEDIR)/tools/check-endbr.sh $@
+       $(SHELL) $(srctree)/tools/check-endbr.sh $@
 endif
 else
 $(TARGET).efi: FORCE

-- 
Anthony PERARD

