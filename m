Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF1250AD72
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 03:53:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310617.527524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhiSo-0006gB-7t; Fri, 22 Apr 2022 01:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310617.527524; Fri, 22 Apr 2022 01:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhiSo-0006dc-41; Fri, 22 Apr 2022 01:52:02 +0000
Received: by outflank-mailman (input) for mailman id 310617;
 Fri, 22 Apr 2022 01:52:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pzHF=VA=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nhiSm-0006dU-JP
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 01:52:00 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb0eebeb-c1de-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 03:51:58 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 23M1phrv007102
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 21 Apr 2022 21:51:49 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 23M1ph7Q007101;
 Thu, 21 Apr 2022 18:51:43 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: cb0eebeb-c1de-11ec-a405-831a346695d4
Date: Thu, 21 Apr 2022 18:51:43 -0700
From: Elliott Mitchell <ehem+undef@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Xen Domain Configuration file issue
Message-ID: <YmIKLzhVWENKnDEI@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

I've been considering weaknesses with the `xendomains` script and how one
might address them.  In the process I've run head-on into some rather odd
design choices with Xen domain configuration handling.

The obvious place to dump domain start/stop configuration information is
into the domain.cfg files themselves.  One favored way to do this is to
stick the configuration information into comment sections.  This has
advantages and disadvantages.  Another way is if the file format syntax
allows it, simply stick the information into the main portion of the
files.

This lead to two observations.  First, domain.cfg files can have
arbitrary extra sections added and `xl create` doesn't complain about
unknown sections.  Second, unrecognized settings in domain.cfg files are
*completely* ignored.  Having these two characteristics combined is
extremely odd.

Complaining about unknown settings is the most common UI choice.  This
alerts users they've misconfigured things.  Sticking "colonel=XEN_EFI.fd"
is likely a configuration error.

On the flip side, since `xenstored` can hold more or less arbitrary
values, depositing unrecognized options there also seems reasonable.

Might the best behavior be for `xl create` to default to producing an
error if unrecognized options are found?  Then add a "-U" option to
`xl create` which places unrecognized options into the XenStore?

A replacement for `xendomains` script could then use `xl create -U` to
load domain.cfg files.  Configuration options it recognized could then be
consumed and if unrecognized options were left it would then complain.

Either approach is going to need some work on libxlutil.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



