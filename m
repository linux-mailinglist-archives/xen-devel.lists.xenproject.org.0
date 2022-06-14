Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5231C54B5E9
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 18:23:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349229.575416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o19Jh-0002VA-V9; Tue, 14 Jun 2022 16:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349229.575416; Tue, 14 Jun 2022 16:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o19Jh-0002St-Rh; Tue, 14 Jun 2022 16:22:57 +0000
Received: by outflank-mailman (input) for mailman id 349229;
 Tue, 14 Jun 2022 16:22:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cShD=WV=citrix.com=prvs=157bf7d09=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o19Jg-0002Ro-Bb
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 16:22:56 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d77f2ba-ebfe-11ec-a26a-b96bd03d9e80;
 Tue, 14 Jun 2022 18:22:54 +0200 (CEST)
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
X-Inumbo-ID: 3d77f2ba-ebfe-11ec-a26a-b96bd03d9e80
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655223774;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4i0rdmeUpTiIobrUgWp6yae7mM3fyKCUFwFlF40zIzo=;
  b=UoLGxROMbvl+YiRfQmbEX52p6n0rP8Pyk+pg2OwY12rfxDV3nEOR+Gcc
   vKkyg4P1TxQUG8jMknqCCH9S5CP6J6lIg9RRND5RZUSUX7NUTdvTPvi/P
   jrY37GaPVRMv97qDf+KiuLBj9YvElk4LYGlYpoIyBEyrgfnIyZ/kQIJTL
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 73581200
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tjIIrKKaKWNbtPZoFE+RqJUlxSXFcZb7ZxGr2PjKsXjdYENShGQGy
 2UbCDuOa63ZZDT9LtokaNu1oUMD6J6EztdlTFBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh3Nc02YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PBXj7/ua0B1B+6SpuQQQyt5Ig5QILITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQq2DN
 5NDMWIHgBLoXhF2N0VILJcHhMyFpmv1KG1Xr3mNuv9ii4TU5FMoi+W8WDbPQfSIWMFUk0Cwt
 m/AuWPjDXkyK9i32TeDtHW2iYfnnyn2RYYTH72Q7eNxjRuYwWl7IA0bUx63rOe0jma6WslDM
 AoE9yw2t68w+Ue3CN7nUHWQu2WYtxQRX95RFewS6wyXzKfQpQGDCQA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9bGin1em26m+LenYrLWISVw41YiUY/Iy2yG0stS4jXuqPAYbs0ICoQ2ivm
 W7WxMQtr+5N1JBWjs1X6XiC2mvx/caRE2bZ8y2NBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/5nzvp5pyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN5F4IuMIJYybwMvcfj2eN5yMCnMDd+SnNDKiIPrKinLAqHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6RMJruMow+lGDeb75EidcDn3lirUuOFMuT50n2jtKjiIu9FO5t3K2mNbhpsstpYWz9r
 r5iCid9404DCLGmO3CModF7wJJjBSFTOK0aYvd/LoarSjeK0kl4YxMN6dvNo7BYopk=
IronPort-HdrOrdr: A9a23:HWsIZqheV2JAdvkueQmdfv4PZXBQXtAji2hC6mlwRA09TySZ//
 rAoB19726QtN9xYgBGpTnuAsi9qB/nmKKdgrNhX4tKPjOHhILAFugLhuHfKlXbaknDH4Vmu5
 uIHZITNDSJNykYsfrH
X-IronPort-AV: E=Sophos;i="5.91,300,1647316800"; 
   d="scan'208";a="73581200"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 0/4] xen: rework compat headers generation
Date: Tue, 14 Jun 2022 17:22:44 +0100
Message-ID: <20220614162248.40278-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.build-system-xen-include-rework-v2

v2:
- new patch [1/4] to fix issue with command line that can be way too long
- other small changes, and reorder patches

Hi,

This patch series is about 2 improvement. First one is to use $(if_changed, )
in "include/Makefile" to make the generation of the compat headers less verbose
and to have the command line part of the decision to rebuild the headers.
Second one is to replace one slow script by a much faster one, and save time
when generating the headers.

There's some number here:
    https://lore.kernel.org/xen-devel/Yp3%2F%2Fc%2FCAcwLHCvi@perard.uk.xensource.com/

    On my machine when doing a full build [of the hypervisor], with `ccache`
    enabled, it saves about 1.17 seconds (out of ~17s), and without ccache, it
    saves about 2.0 seconds (out of ~37s).

Thanks.

Anthony PERARD (4):
  build,include: rework shell script for headers++.chk
  build: remove auto.conf prerequisite from compat/xlat.h target
  build: set PERL
  build: replace get-fields.sh by a perl script

 xen/Makefile                    |   1 +
 xen/include/Makefile            |  25 +-
 README                          |   1 +
 xen/tools/compat-xlat-header.pl | 539 ++++++++++++++++++++++++++++++++
 xen/tools/get-fields.sh         | 528 -------------------------------
 5 files changed, 557 insertions(+), 537 deletions(-)
 create mode 100755 xen/tools/compat-xlat-header.pl
 delete mode 100644 xen/tools/get-fields.sh

-- 
Anthony PERARD


