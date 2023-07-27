Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B56765673
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 16:55:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571157.894335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2OH-0003RR-Qz; Thu, 27 Jul 2023 14:54:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571157.894335; Thu, 27 Jul 2023 14:54:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2OH-0003Ov-NY; Thu, 27 Jul 2023 14:54:57 +0000
Received: by outflank-mailman (input) for mailman id 571157;
 Thu, 27 Jul 2023 14:54:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o85N=DN=citrix.com=prvs=5659ebe79=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qP2OG-0003Ok-2K
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 14:54:56 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b002ab0-2c8d-11ee-b248-6b7b168915f2;
 Thu, 27 Jul 2023 16:54:54 +0200 (CEST)
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
X-Inumbo-ID: 8b002ab0-2c8d-11ee-b248-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690469694;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Hcg0ovz5HbTHnbqiHpWTiuuU7P9vY7vRW2jCflylASU=;
  b=hCqgHrdCqyEC8IqHiJqyc31L/EufVgkEqZwzUwe0uqr1AVs52ifBHJU4
   pBy1mWm6r8h9/LDhJidc2hz8EOy7IecVvOiV6iKlNx5AUi7bkvxubnA3t
   hk1HpqbDKVrtb0ZJH/RlNsRDQVWR9FrZ5MTaOLiHdj499hwvUVGMBAlhV
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 118094556
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:JUBeHKh3WZ3OhCc7BOg/aXxyX161SBAKZh0ujC45NGQN5FlHY01je
 htvXzuAOKuPZjahfotyYInk8xlS657Rn95iTQBo/H0wEXsb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT4wWBzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQgEjI1TTCO396NmuK9evtFmPozC5LkadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27B/
 zKerjikX09y2Nq3kRGU8Wj3uPP0nCb9StoULJeRqe5ajwjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O/I+wBGAzOzT+QnxLmoOQyNFadcmnNQrXjFs3
 ViM9/vrGDhuvbu9WX+bsLCOoluaIjMJJGUPYSsFSwot4NT5pow3yBXVQb5e/LWd14OvX2uqm
 nbT8XZ43u9I5SIW60ml1Wj9gQqPhpWRcjVvtgPnTEu70BNeP4HwMuRE9mPnAeZ8wJexFwfQ5
 CNVwJjGsIjiHrnWynXTHbxl8KWBoq/cbWaC2QMH84wJrWzFxpK1QWxHDNiSzm9NO91MRzLma
 VS7Veh5tM4KZyvCgUOajuuM5yUWIUvIT46Nugj8NIYmX3SIXFbvENtSTUCRxXvxt0MnjLsyP
 5yWGe71UydCUvU5lmXnHL9CuVPO+szY7TmNLXwc5035uYdymVbPEetVWLdwRr5RAFy4TPX9r
 I8EapriJ+R3W+zieCjHmbP/3nhTRUXX8ave8pQNHsbae1oOJY3UI6OJqV/XU9A/zvs9eyah1
 i3VZ3K0P3Kk3yCdclzTNSw+AF4tNL4mxU8G0eUXFQ7A8xAejUyHtc/zq7NfkWEbydFe
IronPort-HdrOrdr: A9a23:j8TRu6Fht4TDJh8NpLqE18eALOsnbusQ8zAXPo5KOGVom62j5r
 iTdZEgvyMc5wxhPU3I9erwWpVoBEmslqKdgrNxAV7BZniDhILAFugLhrcKgQeBJ8SUzJ876U
 4PSdkZNDQyNzRHZATBjTVQ3+xO/DBPys6Vuds=
X-Talos-CUID: 9a23:p5u5hm54q+uXk4kVmdsszHQWIuMFfyXh9y2AJX+qIHhXWJrORgrF
X-Talos-MUID: =?us-ascii?q?9a23=3Aa0zItw9y0GFOOHTMbpCmKXKQf59D8qe0U34RqpQ?=
 =?us-ascii?q?DvdvcMxRaEmiNvDviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,235,1684814400"; 
   d="scan'208";a="118094556"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, George Dunlap
	<george.dunlap@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH v3 0/2] build: reduce number of $(shell) execution on make 4.4
Date: Thu, 27 Jul 2023 15:54:45 +0100
Message-ID: <20230727145447.2701-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.build-exported-shell-command-value-v3

v3:
- replace evaluation on first use construct by immediate expansion.

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

Anthony PERARD (2):
  build: evaluate XEN_BUILD_* and XEN_DOMAIN immediately
  Config.mk: evaluate XEN_COMPILE_ARCH and XEN_OS immediately

 Config.mk    |  8 ++++++--
 xen/Makefile | 16 ++++++++++++----
 2 files changed, 18 insertions(+), 6 deletions(-)

-- 
Anthony PERARD


