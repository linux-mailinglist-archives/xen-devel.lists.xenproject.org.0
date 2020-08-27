Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D06C72545C4
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 15:17:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBHlk-00067A-Vd; Thu, 27 Aug 2020 13:16:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CP5/=CF=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1kBHlj-000675-E9
 for xen-devel@lists.xen.org; Thu, 27 Aug 2020 13:16:43 +0000
X-Inumbo-ID: b0d35fc4-eb81-42db-a7ac-c78d6be7a25e
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0d35fc4-eb81-42db-a7ac-c78d6be7a25e;
 Thu, 27 Aug 2020 13:16:40 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 07RDGcBo002648
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO)
 for <xen-devel@lists.xen.org>; Thu, 27 Aug 2020 15:16:38 +0200 (CEST)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 07RDGcBQ008424
 for <xen-devel@lists.xen.org>; Thu, 27 Aug 2020 15:16:38 +0200 (MEST)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 7C7D67215; Thu, 27 Aug 2020 15:16:38 +0200 (MEST)
Date: Thu, 27 Aug 2020 15:16:38 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xen.org
Subject: Re: qemu-xen and bridge (xen 4.11)
Message-ID: <20200827131638.GA1998@mail.soc.lip6.fr>
References: <20200824181143.GA571@antioche.eu.org>
 <CAMmSBy_cvK2c3x6anVS3KzZPANW4OdVCgO2dfQY+SCi7dxTeDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline
In-Reply-To: <CAMmSBy_cvK2c3x6anVS3KzZPANW4OdVCgO2dfQY+SCi7dxTeDg@mail.gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 27 Aug 2020 15:16:38 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 24, 2020 at 11:24:06AM -0700, Roman Shaposhnik wrote:
> On Mon, Aug 24, 2020 at 11:12 AM Manuel Bouyer <bouyer@antioche.eu.org> wrote:
> >
> > Hello,
> > with the recent XSA about qemu, I'm trying to switch the NetBSD port from
> > qemu-xen-traditional to qemu-xen (in Xen 4.11 for now, I'll look at
> > 4.13 later).
> > One showstopper is that with qemu-xen, the bridge name is not passed
> > any more to the qemu-ifup script. I tried adding a br= option to
> > the qemu invocation, but qemu-system-i386 doesn't seem to use it
> > (at last the script is still called with only one argument).
> > I'm not about to pass to qemu the value of nics[i].script instead of
> > libxl_tapif_script(), so that at last per-domain script can be
> > specified.
> >
> > How is this issue dealt with on other OSes ? I can't believe I'm
> > the only one with multiple bridges in the dom0 ...
> 
> You mean something like?
>    https://github.com/lf-edge/eve/blob/master/pkg/xen-tools/patches-4.14.0/10-bridge-helper-support.patch

Hello,
the attached patch is needed on Xen 4.13 in addition to the above patch,
so that xl calls qemu with the br= argument properly set.

In addition to this, I also added an environnement variable XEN_DOMAIN_ID,
which can be used from the qemu-ifup script if you need to query the
xenstore (it's usefull for me).

Would such a patch be accepted ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

--UlVJffcvxoiEqYs2
Content-Type: text/x-c; charset=us-ascii
Content-Disposition: attachment; filename="patch-tools_libxl_libxl_dm.c"

$NetBSD: $

--- tools/libxl/libxl_dm.c.orig	2020-05-14 14:19:32.000000000 +0200
+++ tools/libxl/libxl_dm.c	2020-08-27 14:12:38.150082263 +0200
@@ -742,6 +742,10 @@
         int nr_set_cpus = 0;
         char *s;
 
+	static char buf[12];
+	snprintf(buf, sizeof(buf), "%d", domid);
+        flexarray_append_pair(dm_envs, "XEN_DOMAIN_ID", buf);
+
         if (b_info->kernel) {
             LOGD(ERROR, domid, "HVM direct kernel boot is not supported by "
                  "qemu-xen-traditional");
@@ -1503,8 +1507,10 @@
                 flexarray_append(dm_args, "-netdev");
                 flexarray_append(dm_args,
                                  GCSPRINTF("type=tap,id=net%d,ifname=%s,"
+					   "br=%s,"
                                            "script=%s,downscript=%s",
                                            nics[i].devid, ifname,
+					   nics[i].bridge,
                                            libxl_tapif_script(gc),
                                            libxl_tapif_script(gc)));
 
@@ -1772,6 +1778,10 @@
     flexarray_append(dm_args, GCSPRINTF("%"PRId64, ram_size));
 
     if (b_info->type == LIBXL_DOMAIN_TYPE_HVM) {
+	static char buf[12];
+	snprintf(buf, sizeof(buf), "%d", guest_domid);
+        flexarray_append_pair(dm_envs, "XEN_DOMAIN_ID", buf);
+
         if (b_info->u.hvm.hdtype == LIBXL_HDTYPE_AHCI)
             flexarray_append_pair(dm_args, "-device", "ahci,id=ahci0");
         for (i = 0; i < num_disks; i++) {

--UlVJffcvxoiEqYs2--

