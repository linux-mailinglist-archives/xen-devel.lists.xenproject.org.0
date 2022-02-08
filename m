Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3584AD5D3
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 11:50:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268107.461898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHO4y-00044M-6v; Tue, 08 Feb 2022 10:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268107.461898; Tue, 08 Feb 2022 10:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHO4y-00042P-3h; Tue, 08 Feb 2022 10:50:36 +0000
Received: by outflank-mailman (input) for mailman id 268107;
 Tue, 08 Feb 2022 10:50:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JWzo=SX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nHO4w-0003z3-8u
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 10:50:34 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef662a64-88cc-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 11:50:32 +0100 (CET)
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
X-Inumbo-ID: ef662a64-88cc-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644317432;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CcCLrbjqPFDfvnH5TeV6cL6muP0iCqcxn0lV354vxq4=;
  b=RMz4MSnX3vpfBF2OC8eCMYkAsI2YyP0+er7G9AlylIu97Wbp5Bf8Xzby
   t+2cp/B5Zf4NbjNTTM0igRWdl746AJNFMvtQalvTNRmmA45YE6JMFbjSW
   pQsoCWds/olgjbnQWr6BYkxWzE1/cCZgffR5k1YWHBrZDe4oRh2twqA9l
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xIDufEyvyBCoWa2NlrqxG/NdN69rpHBMTh5X/mYlNCAxEho4iGjXC8nc/azYhHB6ohzmJseMjK
 HJGAkwIJt5UAYw4jFqTRDBViLOADylPIEn2c5vylPh8AXYzvuToRrBqtk0Ot+cb/0hZUKiGW+z
 /bOqeEEUPN1UepfXcbIQu1gBtaiSOss5JIKQKVAC/gGNQc/H/sqXCwEzRurkNHRSFulIXqo5Vs
 fIcK0biT4X3itggL4tJBntIrNOTkT0jn1tjmIPHD5e6ARmlQBtzkjda/Zulc0zExa42KP3A4sd
 YuGFCrn6TYWGuvYkwMGmaF7R
X-SBRS: 5.1
X-MesageID: 63630989
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xoezDamv8ZkoCI6+3S+dGrjo5gxHIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaUDzQPv2IYmf8cot+OYuz9hxXsJbXzNBhGgZs+Xo8QyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2NY42YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NFwn9uTTBUtAoTdptw0SCN8OR1MZpQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQ62AP
 JJIOWsHgBLoUgdIYnkaL6kCm+7v2nCmaGRnkWu/jP9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zpDxdfONGBxD6t9nO3mvSJjS79QJgVFrCz6rhtmlL77m4cEhoNTnOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0X+d6VM4/+gWx47vq2y+CPEwucgwaUYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPPt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4PeRECnCBtJ6sybp1qXHb7
 RA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSL/JNEJuW8vfh4yWirhRdMOS
 BWC0T69GbcJZCf6BUOJS97Z5zsWIVjISo2+C6G8gitmaZltbg6XlByClmbLt10BZHMEyPllU
 b/CKJ7EJS9DVcxPkWrnL89AgORD7n1vmgv7G8uhpzz5iuX2WZJgYepcWLd4Rrtit/3sTcS82
 4s3CvZmPD0FCLKnOXSModdIRb3IRFBiba3LRwVsXrbrCmJb9KsJUJc9GJstJN5ombp7jODN8
 i3vU0NU0gOn13bGNR+LejZob7a2BcRzqncyPCoNO1e02id8PdbzvflHL5ZnL6M68OFDzOJvS
 6VXccu3HfkSGC/M/C4QbMehodU6Jgirnw+HIwGsfCM7I8x7XwXM99K9Jlnv+SACAzCZr8w7p
 7H8hArXTYBaH1ZpDdrMaeLpxFS05CBPlOV3VkrOA99SZESzr9Q6d32v1qc6epheJw/Cyz2W0
 xetLS0Z/eSd8ZUo9NTphLyfq9v7GeVJAUcHTXLQ6qy7NHeG8zP7k5NASuuBYRvUSHjwpPe5f
 exQwvzxbK8HkVJNv9YuGrpn1/tjtd7mprscxQV4BnTbKV+sD+o4cHWB2MBOsIxLx6NY5lTqC
 h7epIECNOXbIt7hHX4QOBEhP7aK2vwjkzXP6eg4fRfh7yht8bvbCUhfMnFgUsCGwGeZ5G/9/
 dochQ==
IronPort-HdrOrdr: A9a23:V3K/QasSb9Y9EMMosvqfpkRo7skDdtV00zEX/kB9WHVpmszxra
 6TddAgpHvJYVcqKRQdcL+7VZVoLUmxyXcx2/h3AV7AZniFhILLFuFfBOLZqlWKcREWtNQttp
 uIG5IObuEYZmIasS+V2maFL+o=
X-IronPort-AV: E=Sophos;i="5.88,352,1635220800"; 
   d="scan'208";a="63630989"
Date: Tue, 8 Feb 2022 10:50:27 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 4/5] tools/libs/evtchn: use _xen_list.h
Message-ID: <YgJK87Jr4Lmhu7cr@perard.uk.xensource.com>
References: <20220208070638.5909-1-jgross@suse.com>
 <20220208070638.5909-5-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220208070638.5909-5-jgross@suse.com>

On Tue, Feb 08, 2022 at 08:06:37AM +0100, Juergen Gross wrote:
> Instead of including xen-external/bsd-sys-queue.h use the header
> _xen_list.h in minios.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

