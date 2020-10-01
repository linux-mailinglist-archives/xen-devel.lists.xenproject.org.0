Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9612803DE
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 18:25:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1457.4609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO1OF-0001VC-A7; Thu, 01 Oct 2020 16:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457.4609; Thu, 01 Oct 2020 16:25:07 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO1OF-0001Uf-5A; Thu, 01 Oct 2020 16:25:07 +0000
Received: by outflank-mailman (input) for mailman id 1457;
 Thu, 01 Oct 2020 16:25:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0qz=DI=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kO1OD-0001JL-Jp
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:25:05 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffc40c9e-ce12-41c2-9097-de9fe89da053;
 Thu, 01 Oct 2020 16:24:50 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kO1Nx-00029L-SQ; Thu, 01 Oct 2020 17:24:49 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=j0qz=DI=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kO1OD-0001JL-Jp
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:25:05 +0000
X-Inumbo-ID: ffc40c9e-ce12-41c2-9097-de9fe89da053
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ffc40c9e-ce12-41c2-9097-de9fe89da053;
	Thu, 01 Oct 2020 16:24:50 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kO1Nx-00029L-SQ; Thu, 01 Oct 2020 17:24:49 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 5/8] cri-getplatforms: Give names to xenarch and suite
Date: Thu,  1 Oct 2020 17:24:36 +0100
Message-Id: <20201001162439.18160-5-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201001162439.18160-1-iwj@xenproject.org>
References: <20201001162439.18160-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.  This will be useful in a moment.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 cri-getplatforms | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/cri-getplatforms b/cri-getplatforms
index 2b8cee0b..1f206908 100755
--- a/cri-getplatforms
+++ b/cri-getplatforms
@@ -17,9 +17,11 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
 getplatforms () {
+	local xenarch=$1
+	local suite=$2
         perl -e '
                 use Osstest;
                 csreadconfig();
-                print join " ", $mhostdb->get_arch_platforms("'$blessing'", "'$1'", "'$2'") or die $!;
+                print join " ", $mhostdb->get_arch_platforms("'$blessing'", "'$xenarch'", "'$suite'") or die $!;
         '
 }
-- 
2.20.1


