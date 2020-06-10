Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAE61F537C
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 13:37:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiz1r-0006F9-11; Wed, 10 Jun 2020 11:36:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YKF/=7X=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jiz1p-0006F4-Lh
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 11:36:21 +0000
X-Inumbo-ID: 9aba0992-ab0e-11ea-b41d-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9aba0992-ab0e-11ea-b41d-12813bfff9fa;
 Wed, 10 Jun 2020 11:36:20 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: zGm1M8xzTxUjXKVxjS+NZJj3MwKhV5on1JRQnmqhzVmGMk3I28LEq8V2E+Mfrv1qRmjr+1aKBq
 843Iz1q2hZ4B9ibGY9jXtetgPl/7iRt/xB6/wQuqFDIWBlkQ+d46OakybaQwDybhI1e+IIWATS
 3icVX9RTt6EQ55NXirxmcImINaZT2GJUFrPQZaYEVXyft9TQkzXas4CTMo/cTgsVDDRS7c1nCy
 niZGkWOtzuuzXhNRj/W8+gJ6kJ71B8AUVqrZE2zYmxqLd7MDbqmyHfvuy5MUMteu8eO8Dq/Hu9
 hBA=
X-SBRS: 2.7
X-MesageID: 19689660
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,495,1583211600"; d="scan'208";a="19689660"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24288.50608.805045.90130@mariner.uk.xensource.com>
Date: Wed, 10 Jun 2020 12:36:16 +0100
To: "paul@xen.org" <paul@xen.org>
Subject: RE: Build fix backports for 4.9 - 4.11 inclusive
In-Reply-To: <00e201d63f1a$81a74150$84f5c3f0$@xen.org>
References: <24288.49140.163747.998808@mariner.uk.xensource.com>
 <00e201d63f1a$81a74150$84f5c3f0$@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 'Wei Liu' <wl@xen.org>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant writes ("RE: Build fix backports for 4.9 - 4.11 inclusive"):
> Something like this is hitting me building 4.11 too. Weirdly it does not hit if I do a clean build... only incremental:

Wow.  Yes.  Same here.  With the other stuff I mentioned my 4.10
builds, but only if I start from a clean tree.

> make -C seabios-dir all
> make[3]: Entering directory '/local/scratch/pdurrant/xen/tools/firmware/seabios-dir-remote'
>   Compiling IASL src/fw/ssdt-misc.hex
> out/src/fw/ssdt-misc.dsl.i      4: DefinitionBlock ("ssdt-misc.aml", "SSDT", 0x01, "BXPC", "BXSSDTSUSP", 0x1)
> Error    6155 -                                                                 Invalid OEM Table ID ^  (Length cannot exceed 8
> characters)
> 
> ASL Input:     out/src/fw/ssdt-misc.dsl.i - 102 lines, 2567 bytes, 35 keywords
> Listing File:  out/src/fw/ssdt-misc.lst - 8393 bytes
> Hex Dump:      out/src/fw/ssdt-misc.hex - 4096 bytes
> 
> Compilation complete. 1 Errors, 0 Warnings, 0 Remarks, 2 Optimizations

Maybe the generated output file is committed in tree and the build
system is also a bit shonky ?

I'll push my now-building 4.10 branch to xen.git#staging-4.10, anyway.

Ian.

