Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0E473A507
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 17:31:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553675.864374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMH0-000199-9I; Thu, 22 Jun 2023 15:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553675.864374; Thu, 22 Jun 2023 15:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMH0-00017A-5O; Thu, 22 Jun 2023 15:31:02 +0000
Received: by outflank-mailman (input) for mailman id 553675;
 Thu, 22 Jun 2023 15:31:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQdr=CK=citrix.com=prvs=530e6dbed=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qCMGz-00016o-Bk
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 15:31:01 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c899aebc-1111-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 17:30:59 +0200 (CEST)
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
X-Inumbo-ID: c899aebc-1111-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687447859;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N7Z9i/yFILbVIDzapsZ/aOY65dkOvf6ZeRxJLnx2AHA=;
  b=VZ6s4WPSV++7P/H4TQslgnyX3nGW7TUcJ9mDbZaZZdcb7qHt8O1Y3I8m
   LWIXS2HnHaIag+12dnspNqnfybOfHCMJLJ8JUIszqvJ+W7arpZfx0D6vu
   MUG2cTERmZMrq3yWux/nxRrwPTOxm9yWek0gDSF53EkR0ad0WlacgU9np
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 114179871
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:GTC336PKJfgNP8jvrR1Xl8FynXyQoLVcMsEvi/4bfWQNrUp0hGEHz
 zYfDzqPOPmMZTCkeIgkbdu2oBtTusTWz9BqSQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tG5AZmOZingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0t9zJWt3/
 /IYEh8ibjuyn760muu8W9A506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUoXTGZwKzxbH/
 woq+UykJyNZO8S+9wDc9yLzqajkgQLVB5wrQejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxastRkaXd1SH+Qk6Rqlxa/d4gLfDW8BJhZIbN09qMY3X3okz
 FaPlNLyLSNju/ueTnf13rWJqTK/PwAFIGlEYjULJSMH6dT+pIA4jjrUU81uVqWyi7XdBjXY0
 z2M6i8kiN07ltUX3q+2+VTGhTOEpZXTSAMxoALNUQqN5ARzbp+ofIys5F3S695PKY+YSh+Ku
 31spiSFxLlQV9fXznXLGbhTWujzvJ5pLQEwn3ZWG70rzj6j+0SMUoB70SkiJh0wNdc9LGqBj
 FDohe9B2HNCFCL0PfAsPdLvV5RCIbvIToq8CK2NBjZaSt0oLVLconkzDaKF9zq1+HXAh53TL
 ntynSyEKX8BQZpqwzOtLwv2+e96n3turY8/qH2S8vhG7VZ9TCTPIVv9GAHSBt3VFYvdyOkvz
 /5RNtGR1zJUW/Dkby/c/OY7dA5aciNkX8qm85EMJ4ZvxzaK/kl7UJc9Jpt7IeRYc1l9zL+Ur
 hlRpGcGoLYAuZE3AVrTMS0yAF8edZ1+sWg6LUQR0aWAghAejXKUxP5HLfMfJOB3nNGPONYoF
 5Hpje3cWKUQItkGkhxBBaTAQHtKLU/12VnQYHr5OVDSvfdIHmT0xzMtRSO3nAFmM8Z9nZJWT
 2GIvu8Dfac+eg==
IronPort-HdrOrdr: A9a23:DkhWyKBmpSi+wovlHemT55DYdb4zR+YMi2TDGXoBMCC9E/bo7/
 xG+c5w6faaskd1ZJhNo6HjBEDEewK+yXcX2+gs1NWZLW3bUQKTRekI0WKh+V3d8kbFh4lgPM
 lbAs5D4R7LYWSST/yW3OB1KbkdKRC8npyVuQ==
X-Talos-CUID: 9a23:Ew6K5mPByoCl7u5DYS1D/nceFMAfXVLd50bIf03iUGF4cejA
X-Talos-MUID: 9a23:N7VjkQjIHpG+LLzCwmWkkcMpaeJaoKu2KX43yJBW5ObDHjBRFWiDtWHi
X-IronPort-AV: E=Sophos;i="6.01,149,1684814400"; 
   d="scan'208";a="114179871"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Connor Davis <connojdavis@gmail.com>, "Alistair
 Francis" <alistair.francis@wdc.com>, Julien Grall <julien@xen.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bob Eshleman
	<bobbyeshleman@gmail.com>
Subject: [XEN PATCH v2 0/5] build: reduce number of $(shell) execution on make 4.4
Date: Thu, 22 Jun 2023 16:30:00 +0100
Message-ID: <20230622153005.31604-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.build-exported-shell-command-value-v2

v2:
- new patches removing TARGET_SUBARCH and TARGET_ARCH.
- style change in first patch

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

Anthony PERARD (5):
  build: define ARCH and SRCARCH later
  build: remove TARGET_SUBARCH, a duplicate of ARCH
  build: remove TARGET_ARCH, a duplicates of SRCARCH
  build: evaluate XEN_BUILD_* and XEN_DOMAIN on first use
  Config.mk: evaluate XEN_COMPILE_ARCH and XEN_OS on first use

 Config.mk              |  6 +++---
 xen/Makefile           | 40 ++++++++++++++++++----------------------
 xen/Rules.mk           |  2 +-
 xen/arch/riscv/arch.mk |  2 +-
 xen/build.mk           |  6 +++---
 5 files changed, 26 insertions(+), 30 deletions(-)

-- 
Anthony PERARD


