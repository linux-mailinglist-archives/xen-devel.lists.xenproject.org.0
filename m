Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0719A45F652
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 22:24:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233494.405157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqign-0007Ll-UA; Fri, 26 Nov 2021 21:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233494.405157; Fri, 26 Nov 2021 21:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqign-0007Id-PX; Fri, 26 Nov 2021 21:23:25 +0000
Received: by outflank-mailman (input) for mailman id 233494;
 Fri, 26 Nov 2021 21:23:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqigm-0006mN-3q
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 21:23:24 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1505f391-4eff-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 22:23:22 +0100 (CET)
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
X-Inumbo-ID: 1505f391-4eff-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637961802;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=U0pjjfuaVHXyNjtIMrwlyno5NCM6O9c5yGUuwWsqke8=;
  b=WUx7zIKtHKF55TbcZQuS7Z4+iiEabwfSMHei24N9Jc6PT3zSS1lgITZ1
   +wVQntz9vKGDOnBLXU0ltx9pYXsxLZf7ac/0u2gwVC8gs8QKN+FqryyD/
   si3Y1ueOipXDDf8koxcVCFbUPq25y43PSdAfxvZJjVKxcgYdK1gUq95sY
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Lk26teUFy4kLo+qVce/xxjjagqWPwvW4AMyBS4i1p2JDwgaBjsJx6yXIPc3x+wV4IGnwKV/aiv
 FFY8bzwZc9tOW/7hNqI5lF3D+ayvLpC+RKfguw6H58/AZ8bHuvqqMJBDxss9FGXM60PE8J3Uh+
 gPf1jyWyUF1CqazC5WkRmWz97dg6DUJFqe3mr+uJpNCOcee02eLfDbhz+u/z2kpTpc9Z2ehBjn
 XQPgmQamX160ksY6e+EwDRGPNCKBOvzGpgbNii89TAKHi6JHlzqUiNOE9nY6qmYbWWOuIlydli
 WbKE0tFdf+e9TLqZ0MC7ZJ/F
X-SBRS: 5.1
X-MesageID: 58217719
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kbYFRaBESjPj0BVW/7Lkw5YqxClBgxIJ4kV8jS/XYbTApGgkgWQEy
 DdLXGGOMvncY2byKIolbd/k8kIH7JSEmIc2QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX5400w7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/rjjSkNRKl
 tJ3hYGKez8GDpeVqs8xekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFjG1p2Z8XTJ4yY
 eIjNCJhdBrOTiZ3GW4nDK4xx+GDoGPgJmgwRFW9+vNsvjm7IBZK+LTiPNfaYNWiWdRenkHeo
 HnPuWv+HHkyOMSEzDuZ8lqlnuLVgT7gQ4UWCaG58fhxxlaUwwQ7DRQMUFKhrPqRi0igWsleI
 UgZ5iovq6cp8EWhCNL6WnWQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OcUbzE30
 l6Cn/vyGCdi9raSTBq16bO8vT60fy8PIgc/iTQsFFVfpYO5+cdq00yJHo0L/LOJYsPdPDyrz
 DSx8i8Et6gpv/Yk55/iz3vrqmf5znTWdTId6gLSV2Ojywp2Yo+5eoClgWTmAeZ8wJWxFQfY4
 iVd8ySKxKVXVMzWynTRKAkYNOjxv67tDdHKvbJ483DNHRyJ8mXrQ41f6SoWyKxBYpddIm+Bj
 KM+VGpsCH5v0JmCMf8fj2GZUZ1CIU3c+TLNDKi8gj1mOMUZSeN/1HsyDXN8Jki0+KTWrYkxO
 I2AbeGnBmsABKJswVKeHrlGju52n31lnzmNGvgXKihLN5LEPxZ5rp9fbTOzgh0RtvvY8G05D
 f4DXyd19/mveLKnOXSGmWLiBVsLMWI6FfjLRz9/LYa+zv5dMDh5UZf5mOp5E6Q8xvg9vrqYr
 xmVBx4DoHKi1CKvFOl/Qi06AF8Zdc0k9ixT0O1FFQvA5kXPlq7ztvpCLMVuIuF8nAGhpNYtJ
 8Q4lwy7KqwnYlz6F/41NPERdaRuK0amgxygJS2gbGRtdpJsXVWRqNTlYhHu5G8FCS/u7Zkyp
 Lip1wX6R5sfRls9UJaKOaz3l17h72IAnO9SXlfTJoUBckvb74U3eTf6ieU6Ip9QJEyblCeaz
 QufHTwRufLJ/90u6NDMiK3d99WpHuJyE1B0BW7e6brqZyDW8nD6md1LUfqSfCCbX2Txof3wa
 eJQxvD6EfsGgFcV7NYsT+c1lfozvoK9qaVbwwJoGGTwQ26qUr4wcGOb2cRvt7FWwuMLswWBR
 U/SqMJRPq+EOZ25HQdJdhYldOmKydodhiLWsaYuOEz/6SJ6oOiHXEFVM0XegSBRNuIoYoYsw
 ONns88K8Q2vzBEtN4/e3CxT8m2NKF0GUrkm6c5GUNO61FJzxwEQe4HYBw/3/IqLOodFPUQdK
 zOJgLbP2uZHzU3YfntvTXXA0IKxX3jVVMymGLPaG2m0pw==
IronPort-HdrOrdr: A9a23:VallV6NgLl12pMBcTs+jsMiBIKoaSvp037Eqv3oRdfUzSL3/qy
 nOpoV96faaskdzZJhNo7+90cq7MBfhHPxOkOss1N6ZNWGM0gbFEGgL1/qa/9SKIU3DH4Bmu5
 uIC5IObeHNMQ==
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58217719"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Daniel Smith <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [PATCH 0/4] x86: Further harden function pointers
Date: Fri, 26 Nov 2021 21:22:54 +0000
Message-ID: <20211126212258.7550-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Slightly RFC, because patch 2 has some minor structure (ab)use, but the result
works alarmingly well.  So far, this demonstrates converting two subsystems.

hvm_funcs is the other area of especially low hanging fruit, but IOMMU, vPMU
also look like good candidates.  Anything which is partially altcall'd already
would benefit from being fully altcall'd.

Should we consider introducing __ro_after_init right now (as an alias to
__read_mostly) as this conversion is touching a lot of ares where true
post-init immutability ought to be enforced.

Andrew Cooper (4):
  x86/altcall: Check and optimise altcall targets
  x86/altcall: Optimise away endbr64 instruction where possible
  xen/xsm: Use __init_data_cf_clobber for xsm_ops
  x86/ucode: Use altcall, and __initdata_cf_clobber

 xen/arch/x86/alternative.c           | 60 ++++++++++++++++++++++++++++++++++++
 xen/arch/x86/cpu/microcode/amd.c     |  2 +-
 xen/arch/x86/cpu/microcode/core.c    | 38 ++++++++++++-----------
 xen/arch/x86/cpu/microcode/intel.c   |  2 +-
 xen/arch/x86/cpu/microcode/private.h |  2 +-
 xen/arch/x86/xen.lds.S               |  5 +++
 xen/include/xen/init.h               |  2 ++
 xen/xsm/dummy.c                      |  2 +-
 xen/xsm/flask/hooks.c                |  2 +-
 xen/xsm/silo.c                       |  2 +-
 10 files changed, 93 insertions(+), 24 deletions(-)

-- 
2.11.0


