Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BCE61512E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 19:00:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435178.688297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opvYC-0006r7-Kk; Tue, 01 Nov 2022 17:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435178.688297; Tue, 01 Nov 2022 17:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opvYC-0006p3-I1; Tue, 01 Nov 2022 17:59:48 +0000
Received: by outflank-mailman (input) for mailman id 435178;
 Tue, 01 Nov 2022 17:59:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l9Gt=3B=citrix.com=prvs=297828b18=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1opvYB-0006ou-4H
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 17:59:47 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5ed9d00-5a0e-11ed-8fd0-01056ac49cbb;
 Tue, 01 Nov 2022 18:59:44 +0100 (CET)
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
X-Inumbo-ID: f5ed9d00-5a0e-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667325583;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nQ6PQbafsIuC2eqqQnyl8eWJ0xfyUt9qBIdXr8HJ8Z0=;
  b=UJasGdYc067tnqrJ02z/P3XX++QoGvq4Fm/NESwZyWC2bN6mBssoF4Ql
   LsTq32d1AD7qeX+tkNZQ7bBzP5Qdblj5m64RasRf2KOAqS0JsfYLG87CC
   j72fyPFrD6nYqoncuIAQmh4R7VH4oBY87NdCjTS+A8eZGIq0fAOFrwVoe
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 83943129
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:N6RAPaBvIxI/PxVW/yvjw5YqxClBgxIJ4kV8jS/XYbTApDN0hjIFn
 2EeXmCCPqncZ2v2eN5xPY3gphgH68fUzNUxQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtspvlDs15K6o4WpA5wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw0OlRHmdf8
 KwjEG4EUkyJtsyxn7f8Rbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2o0BPjDS0Qn1lM/BZ4gneHumn7ldD5wo1OJv6snpWPUyWSd1ZC9a4uJIYXQFK25mG6+n
 WSW4VTdGSolLePDigeA6lWpq9LQyHaTtIU6S+Tjq68CbEeo7nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVUxSmrVaesxUbWt4WFPc1gCmSzoLE7gDfAXILJgOtc/R/6pVwH2Zzk
 AbUwZW5XlSDrYF5V1q3+ZGLqyK3aRMtc2Y+OSU1Ywxa5p7s9dRbYg30cv5vF6u8j9vQED72w
 iyXoCVWu4j/nfLnxI3gowmZ3mvESozhC1dsu16JBj7NAhZRPtbNWmC+1bTMAR+sxq69R0LJg
 nULktP2AAsmXcDUz3zlrAng8diUCxe53N/02wAH83oJrW7FF5ufkWd4uWgWGauRGpxYEQIFm
 WeK0e+r2LddPWGxcYh8aJ+rBsIhwMDITIq7CaqIN4EUOcksKWdrGR2CgmbJgQjQfLUEy/lja
 f93j+7xZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjGI+ePiNKjiIquYe5caDOzghURtvzsTPP9r
 4kCbKNnCnx3DIXDX8Ug2dVIdg1WciNrXM6eRg4+XrfrHzeK0VoJU5f5qY7NsaQ890iJvo8kJ
 k2AZ3I=
IronPort-HdrOrdr: A9a23:ThjKAKl0eFrXu0jG9iG89bSea3rpDfIg3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7wr5OUtQ/exoV5PhfZqxz/JICOoqTNKftWvdyQiVxehZhOOIqVDd8kXFh4hgPM
 xbEpSWZueeMbEDt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.95,231,1661832000"; 
   d="scan'208";a="83943129"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <pau.safont@citrix.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH for-4.17 v1 0/2] xenctrl.ml: improve scalability of domain_getinfolist
Date: Tue, 1 Nov 2022 17:59:15 +0000
Message-ID: <cover.1667324874.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Pau has performed some performance tests by booting 1000 mirage
unikernels test VMs and shutting them down.
We've noticed on the flamegraphs that a lot of time is spent in Xenctrl
`domain_getinfolist`, 17.7% of overall time
(This needs to be multiplied by 16 because Dom0 100% usage = 16 vCPUs)
In particular time is spent in camlXenctrl___getlist_339
as can be seen from this flamegraph, and it also creates a very deep
call stack:
https://cdn.jsdelivr.net/gh/edwintorok/xen@xenctrl-coverletter/docs/tmp/perf-merge-boot.svg?x=948.9&y=2213

After some algorithmic improvements to the code now the function barely
shows up at all on a flamegraph, taking only 0.02%.
The function is called camlXenctrl___getlist_343, but that is just due
to the changed arguments, still the same function:
https://cdn.jsdelivr.net/gh/edwintorok/xen@xenctrl-coverletter/docs/tmp/perf-xen-boot-1150.svg?x=1188.0&y=1941&s=infolist

It was calling the Xen hypercall ~500*1000 times for 1000 VMs, and
instead it is now calling it "only" 1000 times.

I would suggest to try to take this in 4.17 given the massive
improvement in scalability (number of VMs on a Xen host).

There are further improvements possible here, but they'll be in xenopsd
(part of XAPI) to avoid calling domain_getinfolist and just use
domain_getinfo: the only reason it needs use infolist is that it does
the lookup by VM UUID and not by domid, but it could have a small cache
of UUID->domid mappings and then call just domain_getinfo (or get the
mapping from xenstore if not in the cache), but it looks like that
improvement is not even needed if this function barely registers on a
flamegraph now.

P.S.: the mirage test VM is a very old PV version, at some point we'll
repeat the test with a Solo5 based PVH one.

Edwin Török (2):
  xenctrl.ml: make domain_getinfolist tail recursive
  xenctrl: use larger chunksize in domain_getinfolist

 tools/ocaml/libs/xc/xenctrl.ml | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

-- 
2.34.1


