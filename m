Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 422F9738ADE
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 18:20:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552933.863201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC0ZF-0001Cc-Ng; Wed, 21 Jun 2023 16:20:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552933.863201; Wed, 21 Jun 2023 16:20:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC0ZF-00019Q-KV; Wed, 21 Jun 2023 16:20:25 +0000
Received: by outflank-mailman (input) for mailman id 552933;
 Wed, 21 Jun 2023 16:20:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=30K1=CJ=citrix.com=prvs=529504c83=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qC0ZE-0000tN-Bd
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 16:20:24 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83db6185-104f-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 18:20:22 +0200 (CEST)
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
X-Inumbo-ID: 83db6185-104f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687364422;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JWOT/JQ+ICaJDAuccPtcGYCuAD6Tj28cH0e/UkQDHRw=;
  b=BWFredKdnKFLik1NtISIVCRBQgmGePhQrlcQo61qCh5Jpkqw0H9es6pm
   R57BoaGmRgR4/7BCiUyJ6Lq6cAdUtQZxyJRjS3SnunKFz98P+GX9AgQUl
   P+RGIW7eB+JHSYQMqtiSuaQNBl3C/7DeFTgxhXsyQM2zJr5+cB82lXdPf
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112968598
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:ylT4CqmgGv0pTwvdwaZMufno5gyjJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLUT+HOPvfM2X8f9onOYqz9khV6p/cx9IyTAE9/iFgHiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5KyaVA8w5ARkPqgV5gaGyxH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 d84FhoMRwievu2Jx4mQTPtHu+BkJ9a+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQth/B/
 DOYrzmoUnn2MvSR5Cvc6Fn2vNbwkAPweNgTS+OxsfxT1Qj7Kms7V0RNCArTTeOCol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4CPYm4QuAzq7V5QexBWUeSDNFLts8u6ceRyEu1
 1KPt8PkA3poqrL9YXCX+6qQrDiyETMINmJEbigBJSMa5/HzrYd1iQjAJuuPC4bs0IezQ2uph
 WnX8m5n3e57YdM3O7uT3nD5qTOFvoXwQTEy3S7RTEmYykRye9vwD2C30mQ3/cqsPa7AEAne5
 ihbwpjEhAwdJcrTzXLQGY3hCJnsvq/Ya2OE3DaDCrF7r1yQF2ifkZe8Cd2UDGNgKY46dDDge
 yc/UisBtcYIbBNGgUKaCr9d6vjGLoC6T7wJrtiOMrJzjmFZLWdrBh1Ga0+KxHzKm0Mxi6w5M
 przWZ/yXSlAWfo/kWrsF711PVoXKscWnzm7eHwG507/jer2iIC9FN/pz2dinshmtfjZ8W05A
 v5UNteQygU3bQENSnC/zGLnFnhTdSJTLcmv+6RqmhurflIO9JcJV6WAntvMuuVNw8xoqws/1
 iHhBhAAlAak3hUq62yiMxheVV8mZr4nxVpTAMDmFQ/0s5T/Se5DNJsiSqY=
IronPort-HdrOrdr: A9a23:b5c+QagL/320eO0Ez1ys07bX83BQXtAji2hC6mlwRA09TySZ//
 rAoB19726RtN9xYgBEpTnuAsi9qB/nmKKdgrNhX4tKPjOHhILAFugLhuHfKlXbakrDH4Vmu5
 uIHZITNDSJNykYsfrH
X-Talos-CUID: 9a23:8Q3/1GwcIdXYviBzrugeBgU3Ov4Pc1TF0U7fHEiDImB7Y4CxDlSPrfY=
X-Talos-MUID: 9a23:qDXsWgSsqfHvEHF3RXTiqSA7Luwy2Z2RBWAGsc8H5JeNci5JbmI=
X-IronPort-AV: E=Sophos;i="6.00,261,1681185600"; 
   d="scan'208";a="112968598"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 0/3] build: reduce number of $(shell) execution on make 4.4
Date: Wed, 21 Jun 2023 17:19:56 +0100
Message-ID: <20230621161959.1061178-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.build-exported-shell-command-value-v1

With GNU make 4.4, the number of execution of the command present in $(shell )
in exported variables increased greatly. This is probably because as of make
4.4, exported variable are also added to the environment of $(shell )
construct.

From the annoncement:

    https://lists.gnu.org/archive/html/info-gnu/2022-10/msg00008.html
    > * WARNING: Backward-incompatibility!
    >   Previously makefile variables marked as export were not exported to commands
    >   started by the $(shell ...) function.  Now, all exported variables are
    >   exported to $(shell ...).  If this leads to recursion during expansion, then
    >   for backward-compatibility the value from the original environment is used.
    >   To detect this change search for 'shell-export' in the .FEATURES variable.

Also, there's a new paragraph in the GNU make manual, but it's a warning about
exporting all variable, still it might be relevant to the new observed
behavior:

    https://www.gnu.org/software/make/manual/make.html#Variables_002fRecursion
    > Adding a variable’s value to the environment requires it to be expanded. If
    > expanding a variable has side-effects (such as the info or eval or similar
    > functions) then these side-effects will be seen every time a command is
    > invoked.

The issue was reported on IRC by jandryuk.

So, I've locate a few obvious candidate to fix, maybe there's more $(shell) to
change?

Anthony PERARD (3):
  build: define ARCH and SRCARCH later
  build: evaluate XEN_BUILD_* and XEN_DOMAIN on first use
  Config.mk: evaluate XEN_COMPILE_ARCH and XEN_OS on first use

 Config.mk    |  6 +++---
 xen/Makefile | 21 +++++++++++----------
 2 files changed, 14 insertions(+), 13 deletions(-)

-- 
Anthony PERARD


