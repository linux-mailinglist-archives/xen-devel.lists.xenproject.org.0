Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4633649B303
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:38:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260135.449418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCK8c-0002k5-Nd; Tue, 25 Jan 2022 11:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260135.449418; Tue, 25 Jan 2022 11:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCK8c-0002hi-KX; Tue, 25 Jan 2022 11:37:26 +0000
Received: by outflank-mailman (input) for mailman id 260135;
 Tue, 25 Jan 2022 11:37:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCK8b-0002hc-LW
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:37:25 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 292e75aa-7dd3-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 12:37:23 +0100 (CET)
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
X-Inumbo-ID: 292e75aa-7dd3-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643110643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l/0XlGoo/tHOvc6O3AQBz8/a3Kf5+jjtZ4PquUp4TGk=;
  b=g8Z/lq5Ri2CffbgyuUnKLrifvhLE5hQHMAq6V7HI533AzOaf/fq1j3iX
   6aP84fvCnhQFiMflwMOIkL0dQsOj4JhgSCyUv303eL/igV61+hhgaHFws
   8ljTyAdPWoM+2g6MUoRyepFV+RXTpgVGM+SxHPqKRfbB2ael28JsGsd5f
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: tGZZq6+buODcDAj2Z5x1htH7D366GYF/yPBhzIczvOI3QE3ItRTHjqL4SEFjkrs9+SZ+xNHanM
 YWLGd/F7axZ0Y/dmLggSsQEzIaE9Kjf1TNYKWTouQ8xXlJd0q51M14wlnTylavI2hvu0ofBZkw
 Z+2udbKUGt4wvHER//0OkcB4ZBbA6Rkud5rbX6pLKed6kNh0esYC2Z2DHntinF20PPpPFGBUrV
 rCA1g+W7hTde8JRadGMuE0xwHgZv6I4bO0cm6eChmLhRcZCckTQq2NlqFDXcnW7rbi4af5niHS
 Mdd7zH8291ZcVtRMN8aPlioO
X-SBRS: 5.2
X-MesageID: 62701857
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:52n/jqKbaulKdOTcFE+RkpMlxSXFcZb7ZxGr2PjKsXjdYENSgjUGz
 GQYWW7TaP3Za2GhKdogO4qz9RhQ7MeHzt9lTVBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Us5xrZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2boolc2
 PxMuqWaYiRuZ/3hlelMd0ZxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Glq2ZgXTauBD
 yYfQRBNLwbhZBdvAFUGU8o/l9u5vV3USQQN/Tp5ooJoujOOnWSdyoPFM93TYNWGA9pUmkWwo
 XjP9GD0RBodMbS31j6t4n+qwOjVkkvTVJoJEbyk9tZjmFCJ2nEIExoSSEe6pv+izEW5Xrp3J
 0MY9yU0pIAu5UerSZ/7RBT+r3ma1jYeUddNF+wx6CmW17HZpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRupIjQcJ2IGYS4CTCMG7sPlrYV1iQjAJv5hDaq0g9vdCTz2h
 TeQo0ADa6471JBRkf/hpBae3mzq9sOhohMJChv/TF/8wxNQZYGcTaeLrgGLwPtNfaLGZwzU1
 JQboPS24OcLBJCLsSWCRuQRAb2kj8q43C3gbU1HRMd4qWn0k5K3VcUJuWwleh81WioRUWKxO
 CfuVRVtCIi/1ZdARYt+eMqPBssj1sAM/vy1B6mPPrKijnWcHTJrHR2Ch2bNhwgBc2B2yMnT3
 Kt3l+72UR727ow8lFKLqx81i+ND+8zH7Tq7qWrH5xqmy6GCQ3WeVK0INlCDBshgsv/f+FmEr
 IkBZprSo/m6bAEYSnOLmWL0BQtSRUXX+Lis85AHHgJ9ClQO9J4d5w/5nup6Jt0Nc1V9nebU5
 HCtMnK0O3Kk7UAr3T6iMyg5AJu2BM4XhStiYUQEYAj0s1B+P9fHxPpPJvMfIOh8nMQ+nKEcc
 hXwU5jaahi5Ym6Zq211gFiUhNEKSSlHcirXb3P6O2BuJsA5L+ELk/e9FjbSGOA1JnLfnaMDT
 3eIj2s3mLIPGFZvCtj4cvWqww/jtHQRgrsqDUDJPsNSaAPn940zc379ifo+IsctLxTfx2TFi
 1bKUElA/eSd8ZUo9NTphLyfq9v7GeVJAUcHTXLQ6qy7NHeG8zP7k5NASuuBYRvUSHjwpPe5f
 exQwvylaK8HkV9GvpBSCbFuya5itdLjq6UDllZvHWnRbkTtAbRleyHU0c5Kv6xL57lYpQrpB
 R7fpogEYe2EYZq3HkQQKQwpavW4+csVwjSCv+4oJEja5TNs+ObVW0tlIBTR2jdWK6F4Md15z
 L556tIW8QG2ljEjLs2C0nJP722JI3END/cnu5UdDNO5gwYn0AgfM5nVCyuw65CTcdRcdEItJ
 2bM1qbFgr1dwGvEcmYySieRjbYM28xWtUAY1kIGKnSIhsHB160+0xBm+DgqShhYk0dc2OVpN
 2k3b0B4KM1iJduzaBSvi4x0Jzx8OQ==
IronPort-HdrOrdr: A9a23:bBppOKDpztm5kLvlHemu55DYdb4zR+YMi2TC1yhKKCC9Vvbo8P
 xG/c5rsSMc5wx8ZJhNo7+90ey7MBXhHP1OkOws1NWZLWrbUQKTRekIh+bfKn/bak/DH4ZmpN
 5dmsNFaOEYY2IVsfrH
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="62701857"
Date: Tue, 25 Jan 2022 11:37:16 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross
 Lagerwall <ross.lagerwall@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [XEN PATCH v9 30/30] build: adding out-of-tree support to the
 xen build
Message-ID: <Ye/g7P0wV5Vj8OoT@perard>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-31-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220125110103.3527686-31-anthony.perard@citrix.com>

On Tue, Jan 25, 2022 at 11:01:03AM +0000, Anthony PERARD wrote:
> This implement out-of-tree support, there's two ways to create an
> out-of-tree build tree (after that, `make` in that new directory
> works):
>     make O=build
>     mkdir build; cd build; make -f ../Makefile
> also works with an absolute path for both.

Maybe I should have made it more explicit in the description that those
only works within the xen dir, i.e. not the whole project.

-- 
Anthony PERARD

