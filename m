Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 567C6A4E9D3
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 18:50:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901385.1309342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpWOm-0000PB-E3; Tue, 04 Mar 2025 17:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901385.1309342; Tue, 04 Mar 2025 17:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpWOm-0000Nc-Az; Tue, 04 Mar 2025 17:49:44 +0000
Received: by outflank-mailman (input) for mailman id 901385;
 Tue, 04 Mar 2025 17:49:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rewT=VX=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tpWOk-0000NW-CK
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 17:49:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c4e5d2a-f921-11ef-9ab4-95dc52dad729;
 Tue, 04 Mar 2025 18:49:41 +0100 (CET)
Received: from nico.tail608894.ts.net (unknown [46.228.253.214])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id A735A4EE0755;
 Tue,  4 Mar 2025 18:49:39 +0100 (CET)
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
X-Inumbo-ID: 0c4e5d2a-f921-11ef-9ab4-95dc52dad729
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=46.228.253.214
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1741110580;
	b=4b6mxNfWPtud+Kf9nanAJc1zrE4s++8sEceADbWqE0vofVjYPtNl4iVIZlSZV93eg3Ag
	 StazDdWpiR+U/g+lTqWqMpCtaksPdN34XKO0y+xvXGKaYoQXKp3a5YhIQjjuxILR7qI70
	 Q/4isiagvx1sxzSC4+f1R5osoKyoMYkqziut5ijXdksDois0+/2rqAsXyBytu4nW0R8OA
	 VWfZaXVTu6BOjq5y8syBVxC6/JiCAfhlT5s6wcgH1SSqy7S1WQoHtBBZcPXvlGvy7Fp3U
	 3VBVMAB+k8XDrAXtrShqCWHPNkGX4QVtP7K6ckNuCLCmg5FVij9PZAzuRAcglhBYsq7c+
	 fw47EDDB7N5zSp8HKFJgKEw0Cy2oP7obObUoias+C74xygGLYgNwWXo4ACmyCEccHXPFp
	 7yUqtBoVmVw32DgbBuKqEgfxUZBaeAo850/4U7h6TYI0SKRianzae0EE+xYgyx7+hetHl
	 9gSsJnL87RQqh4pKqcFBc3fTRrQPIoAOAH6b7B93hUcavWjLXbuJ8hEt5Qlz6RTe48Dfi
	 r+xuuGNxfzrKXckhwKY5gx9juge9sSAb07p3w8k0VTJYYDcnYxxKILhcKFOuFguNRNzBB
	 GKwFGyRObREqQjS/abMJ2wIC7zttyFaxYNdVLEGmR1vt8BDHNh+qdFIGr6SZqxk=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1741110580;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4JIMb6FBUZDteB9P9Uim1LkTFDvZU84rc5rD3cL340Q=;
	b=sp5SdvKHL9DuuQsUIRRnV8eqMiTpcUqw7HSRsz2suWn6Fml8ReWRYaFqmJ5j2LbJUQaJ
	 RDRsMXGAwquM83XP09NoHaRzPMobZwyir34MtfxwML8RkgW/7qxS1In3uYO/y9O7MGfxG
	 DtPHHhyyDwuh5A7EHBAMCcPvOXU3/KzsVu0T3jbRTOIVQaLqZNtricGdIPOZWSHQb2eg7
	 TWtOu13gmWsGNdMuHW3xWPYaNcKYn6dFkkgwZXBmhio3IdWDYnj13WLsQfat+0D/cVyJC
	 I/IKwN7Jw1Z9qUB0B3+eZWxqNMA/UgNlN8etZMq5rbRZgfrYUtX4ha5wbd6QlBqg5zAek
	 Ch6s7nDpAkEF8A+1f0npbOBGWc0LuM2ThCzcCicwnFUMz03BK513sMgc1scd8HwdP/ySd
	 +Dckr/+4/i3bClt6u1A7SyvFK+B8gZGsabq0CMJsCxBD+XYn6HRWmZZ5lsec6Gbt2DXyn
	 hRjXx/B07GmJIfUc1z8VInJJs4d9uEYGHtexwtWqobcGQVR5/n4vc/NXxu/1OdmC2qyv4
	 6VLyrFEEHoQuVrXpgxvWihtXmrb697552UnUODKTzKLkzCoe1GwHcbMU37rtp1QnDh7rQ
	 WhhVvtibKU13kEss4+R9EjLX/B71L0UPcig0vhKXBeJdDjJeudiC/aGMHbM/0AI=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=46.228.253.214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1741110580; bh=43dffAVwCNub40pm1bFs0Ad/4+xd02zWrJaiORiRSRM=;
	h=From:To:Cc:Subject:Date:From;
	b=ZpDpg3vk6fri8yaU4XDW34VYYNIrCqz6QD49vYh3lN5nVEUwqxyYWjjWydsHlcSLg
	 7uFRAqeXgTq7FDLBaC8krdxCHpwKjVF6IJs3Q1i3lMWopqnf2gFUXkGelzCSSz6UxT
	 p/Y3MidydbzHXy5vBZKIxRfoVmVYO8w3PVOavJ7dxDAd2F0Kwp6kE0g2hFlHsmTA7J
	 o3Nbj2+B4b2lmSoKhug5QOBTSEEwMU5iXavq7nGz193p4qJH9WhTXqaZhr0TvhulU/
	 2Jc5IIXiLwjYApQgvYJ5XTVDQ43/DchCrKp/rmr3cjjuELt/ulzCvEaIMa9ATrlWJ8
	 u0Pq6X8UAiq9Q==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH] automation/eclair: Reduce verbosity of ECLAIR logs.
Date: Tue,  4 Mar 2025 18:49:36 +0100
Message-ID: <cd3fadd6c9c2f3737902acb5a543c5479f616144.1741110491.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While activating verbose logging simplifies debugging, this causes
GitLab logs to be truncated, preventing the links to the ECLAIR
analysis database to be shown.

No functional change.

Fixes: c4392ec83244 ("automation: Add ECLAIR utilities and settings")
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/analysis.ecl | 2 --
 automation/eclair_analysis/ECLAIR/analyze.sh   | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl b/automation/eclair_analysis/ECLAIR/analysis.ecl
index 824283a989c1..29409a9af0eb 100644
--- a/automation/eclair_analysis/ECLAIR/analysis.ecl
+++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
@@ -10,8 +10,6 @@ setq(analysis_kind,getenv("ANALYSIS_KIND"))
 # strings_map("scheduled-analysis",500,"","^.*$",0)
 # map_strings("scheduled-analysis",analysis_kind)
 
--verbose
-
 -enable=B.REPORT.ECB
 -config=B.REPORT.ECB,output=join_paths(data_dir,"FRAME.@FRAME@.ecb")
 -config=B.REPORT.ECB,preprocessed=show
diff --git a/automation/eclair_analysis/ECLAIR/analyze.sh b/automation/eclair_analysis/ECLAIR/analyze.sh
index 1dc63c1bc2d0..2356fc4007dd 100755
--- a/automation/eclair_analysis/ECLAIR/analyze.sh
+++ b/automation/eclair_analysis/ECLAIR/analyze.sh
@@ -91,11 +91,13 @@ find "${ECLAIR_DATA_DIR}" -maxdepth 1 -name "FRAME.*.ecb" |
   sort | xargs cat |
   "${ECLAIR_BIN_DIR}eclair_report" \
     "-create_db='${PROJECT_ECD}'" \
+    -quiet \
     -load=/dev/stdin > "${ECLAIR_REPORT_LOG}" 2>&1
 
 # Create the Jenkins reports file.
 "${ECLAIR_BIN_DIR}eclair_report" \
   "-db='${PROJECT_ECD}'" \
+  -quiet \
   "-eval_file='${SCRIPT_DIR}/report.ecl'" \
   >> "${ECLAIR_REPORT_LOG}" 2>&1
 
-- 
2.43.0


