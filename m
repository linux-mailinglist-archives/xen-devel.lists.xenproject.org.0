Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BF36D685F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 18:07:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518021.804153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjjC4-0004j0-6s; Tue, 04 Apr 2023 16:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518021.804153; Tue, 04 Apr 2023 16:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjjC4-0004gG-3O; Tue, 04 Apr 2023 16:07:36 +0000
Received: by outflank-mailman (input) for mailman id 518021;
 Tue, 04 Apr 2023 16:07:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gCXw=73=citrix.com=prvs=451435b33=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1pjjC2-0004Q2-Bv
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 16:07:34 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd171558-d302-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 18:07:31 +0200 (CEST)
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
X-Inumbo-ID: cd171558-d302-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680624451;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=P7/Mv4d7vPTIrhuPMkAr+Y3CR940VFPqx5xikklOBgo=;
  b=SJhGaJIFGPD3cRIsvDx8/7mUAWZD//QDkCd8k4QLCMD0V2knzwoR4rDw
   NC0lHra9VELCiSi6M2WQx6ynorjcsO4b8DjazyaBinajuFfkACl+SVLbq
   8H9U+eGy6S6ptF6+yBVzTw8QMXLELr3Hp4BlAfF1ngYSGG+tC8EziQDQ/
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 106724129
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:WrH9SK1LPnlbyBXylPbD5eVxkn2cJEfYwER7XKvMYLTBsI5bp2BSz
 2JLXWqGPayLZjHye9sib9m+/R8BupWDx4AxSQY4pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gBmOagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfWj4N5
 awyKzE0SDvYjP3t8rTkRepzmZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tPylnHbyYntUuVuOoasf6GnP1g1hlrPqNbI5f/TTHZsKxBrB/
 DOuE2LRJDwXFICz4jm59neB38WSn3vfVKBOLejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQo2
 UWOhMjBHiF0vfueTnf13rWJqTK/PwAFIGlEYjULJSMe+MXqqow3ihPJT/5gHbSzg9mzHiv/q
 w1mtwBn2e9V15RSkfzmoxae2WnESoX1ohAdvVqUTjKP7QJAQqX+bJPz216E4vVfM9PMJrWeh
 0Toi/Ry/chXU8HVynTRG7RRdF26z63baWOB2DaDC7Fkrm3woCD7IOi89RkkfC9U3tA4lSgFi
 aM5kSdY/9dtMXSjdsebiKrhWp1xncAM+TkIP804j+aigbArLmdrBAk0OSatM5nFySDAa50XN
 5aBatqLBn0HE6lhxzfeb75Dged2mn5vnziJG8CTI/GbPV22PSb9dFv4GAHWMrBRAF2s+205D
 Oqzx+PVkk4CAYUSkwHc8JIJLEBiEEXX8ave8pQNHsbae1oOJY3UI6OJqV/XU9A/zvs9eyah1
 i3VZ3K0P3Kk3yKdc13WMiE7AF4tNL4mxU8G0eUXFQ7A8xAejUyHt/p3m0cfFVX/yNFe8A==
IronPort-HdrOrdr: A9a23:D1ZmRaqMfUdI1X5YDbvdIUEaV5oAeYIsimQD101hICG9E/bo8v
 xG+c5wuCMc5wx8ZJhNo7+90dC7MArhHP1OkOss1NWZPDUO0VHARL2Ki7GN/9SKIVycygcy78
 Zdmp9FebnN5AhB5voSODPIaOrIGuP3lpxAWN2uqEuFkTsaE52IMT0JcDqmLg==
X-IronPort-AV: E=Sophos;i="5.98,318,1673931600"; 
   d="scan'208";a="106724129"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v4 0/3] xen-ucode: print information about currently loaded ucode
Date: Tue, 4 Apr 2023 17:06:52 +0100
Message-ID: <20230404160655.2354-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Posting v4 with addressed review comments. Changes from v3 are available
in each patch.

Sergey Dyasli (3):
  tools/xenctrl: add xc_get_cpu_version()
  x86/platform: introduce XENPF_get_ucode_revision
  tools/xen-ucode: print information about currently loaded ucode

 tools/include/xenctrl.h                  |  3 +
 tools/libs/ctrl/xc_misc.c                | 35 ++++++++++
 tools/misc/xen-ucode.c                   | 83 ++++++++++++++++++++----
 xen/arch/x86/platform_hypercall.c        | 29 +++++++++
 xen/arch/x86/x86_64/platform_hypercall.c |  4 ++
 xen/include/public/platform.h            | 11 ++++
 xen/include/xlat.lst                     |  1 +
 7 files changed, 154 insertions(+), 12 deletions(-)

-- 
2.17.1


