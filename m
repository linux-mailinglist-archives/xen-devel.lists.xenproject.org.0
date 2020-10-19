Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3644E2923A6
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 10:32:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8655.23155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUQZz-0004S1-31; Mon, 19 Oct 2020 08:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8655.23155; Mon, 19 Oct 2020 08:31:43 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUQZy-0004Rb-Vr; Mon, 19 Oct 2020 08:31:42 +0000
Received: by outflank-mailman (input) for mailman id 8655;
 Mon, 19 Oct 2020 08:31:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUQZx-0004RW-65
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 08:31:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6bd6afc0-4b3d-4217-bf89-4345c8549902;
 Mon, 19 Oct 2020 08:31:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8F22AACF1;
 Mon, 19 Oct 2020 08:31:38 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUQZx-0004RW-65
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 08:31:41 +0000
X-Inumbo-ID: 6bd6afc0-4b3d-4217-bf89-4345c8549902
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6bd6afc0-4b3d-4217-bf89-4345c8549902;
	Mon, 19 Oct 2020 08:31:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603096298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gDl2iUCT19sfCpQsI79DfcMdnshL273KLKcJMUbWfTY=;
	b=UsmOAvcPaA5bM1y/Cdcp7Dy1bKhYxB2DkZYYMAph4cAC/kEJic52b+iTwz5SOcQp113SUg
	CoBT3UjLM96XVaEbO1NUjVyRTvCaGBPMUwgcvgYfqdthiq6Q/c9qJ20arDnsbVjJ5FY3y7
	EyXld53OncBbg4TYJlkoOd2ojkN90gQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8F22AACF1;
	Mon, 19 Oct 2020 08:31:38 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] tools/python: pass more -rpath-link options to ld
Message-ID: <d10bb94f-c572-6977-40a4-57a61da4094b@suse.com>
Date: Mon, 19 Oct 2020 10:31:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

With the split of libraries, I've observed a number of warnings from
(old?) ld.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
It's unclear to me whether this is ld version dependent - the pattern
of where I've seen such warnings doesn't suggest a clear version
dependency.

--- a/tools/python/setup.py
+++ b/tools/python/setup.py
@@ -7,10 +7,15 @@ XEN_ROOT = "../.."
 extra_compile_args  = [ "-fno-strict-aliasing", "-Werror" ]
 
 PATH_XEN      = XEN_ROOT + "/tools/include"
+PATH_LIBXENTOOLCORE = XEN_ROOT + "/tools/libs/toolcore"
 PATH_LIBXENTOOLLOG = XEN_ROOT + "/tools/libs/toollog"
+PATH_LIBXENCALL = XEN_ROOT + "/tools/libs/call"
 PATH_LIBXENEVTCHN = XEN_ROOT + "/tools/libs/evtchn"
+PATH_LIBXENGNTTAB = XEN_ROOT + "/tools/libs/gnttab"
 PATH_LIBXENCTRL = XEN_ROOT + "/tools/libs/ctrl"
 PATH_LIBXENGUEST = XEN_ROOT + "/tools/libs/guest"
+PATH_LIBXENDEVICEMODEL = XEN_ROOT + "/tools/libs/devicemodel"
+PATH_LIBXENFOREIGNMEMORY = XEN_ROOT + "/tools/libs/foreignmemory"
 PATH_XENSTORE = XEN_ROOT + "/tools/libs/store"
 
 xc = Extension("xc",
@@ -24,7 +29,13 @@ xc = Extension("xc",
                library_dirs       = [ PATH_LIBXENCTRL, PATH_LIBXENGUEST ],
                libraries          = [ "xenctrl", "xenguest" ],
                depends            = [ PATH_LIBXENCTRL + "/libxenctrl.so", PATH_LIBXENGUEST + "/libxenguest.so" ],
-               extra_link_args    = [ "-Wl,-rpath-link="+PATH_LIBXENTOOLLOG ],
+               extra_link_args    = [ "-Wl,-rpath-link="+PATH_LIBXENCALL,
+                                      "-Wl,-rpath-link="+PATH_LIBXENDEVICEMODEL,
+                                      "-Wl,-rpath-link="+PATH_LIBXENEVTCHN,
+                                      "-Wl,-rpath-link="+PATH_LIBXENFOREIGNMEMORY,
+                                      "-Wl,-rpath-link="+PATH_LIBXENGNTTAB,
+                                      "-Wl,-rpath-link="+PATH_LIBXENTOOLCORE,
+                                      "-Wl,-rpath-link="+PATH_LIBXENTOOLLOG ],
                sources            = [ "xen/lowlevel/xc/xc.c" ])
 
 xs = Extension("xs",
@@ -33,6 +44,7 @@ xs = Extension("xs",
                library_dirs       = [ PATH_XENSTORE ],
                libraries          = [ "xenstore" ],
                depends            = [ PATH_XENSTORE + "/libxenstore.so" ],
+               extra_link_args    = [ "-Wl,-rpath-link="+PATH_LIBXENTOOLCORE ],
                sources            = [ "xen/lowlevel/xs/xs.c" ])
 
 plat = os.uname()[0]

