Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA89462B24F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 05:27:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444150.699040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovA10-0000mH-EX; Wed, 16 Nov 2022 04:27:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444150.699040; Wed, 16 Nov 2022 04:27:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovA10-0000jI-BV; Wed, 16 Nov 2022 04:27:10 +0000
Received: by outflank-mailman (input) for mailman id 444150;
 Wed, 16 Nov 2022 04:27:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Po/4=3Q=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ovA0y-0000j7-Ul
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 04:27:08 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id edae9900-6566-11ed-8fd2-01056ac49cbb;
 Wed, 16 Nov 2022 05:27:07 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6916F13D5;
 Tue, 15 Nov 2022 20:27:12 -0800 (PST)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 81C843F663;
 Tue, 15 Nov 2022 20:26:54 -0800 (PST)
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
X-Inumbo-ID: edae9900-6566-11ed-8fd2-01056ac49cbb
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Christopher Clark <christopher.w.clark@gmail.com>,
	Nathan Studer <nathan.studer@dornerworks.com>,
	Stewart Hildebrand <stewart@stew.dk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tim Deegan <tim@xen.org>,
	Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Meng Xu <mengxu@cis.upenn.edu>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v2 0/3] Populate entries for 4.17
Date: Wed, 16 Nov 2022 04:26:31 +0000
Message-Id: <20221116042634.50948-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The following changes are preparation work for the 4.17 release. Also
collecting the changelog changes happened during the 4.17 dev phase.
This is my first pass at the log for the release, it's likely missing
more entries.

I'm Ccing all maintainers in this cover letter and also in patch #1 for
further feedback on missing items.

Thanks,
Henry

v1 -> v2:
- Pick other changelog patches happened during the 4.17 dev phase.
- Correct wording for two x86 entries (clock frequency calibration
and SPR & ADL support) following Jan's suggestion.
- Add missing Arm entries from Oleksandr.
- Add missing i.MX entry following Stefano's suggestion.

Andrew Cooper (1):
  Changelog: Add __ro_after_init and CET

Henry Wang (2):
  CHANGELOG: Add missing entries for work during the 4.17 release
  CHANGELOG: Start new "unstable" section

 CHANGELOG.md | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

-- 
2.17.1


