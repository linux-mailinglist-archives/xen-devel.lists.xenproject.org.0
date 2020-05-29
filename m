Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3719C1E7BE1
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:32:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedFo-0000oB-An; Fri, 29 May 2020 11:32:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedFm-0000ne-OR
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:32:46 +0000
X-Inumbo-ID: 1a487112-a1a0-11ea-81bc-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a487112-a1a0-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 11:32:40 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3T-0003xZ-OK; Fri, 29 May 2020 12:20:03 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 26/49] 20_linux_xen: Adhoc template substitution
Date: Fri, 29 May 2020 12:19:22 +0100
Message-Id: <20200529111945.21394-27-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
References: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This file is a template that various build-time variables get
substituted into.  Make thos substitutions by hand (actually, by
copying the values our file for stretch).  And rename the file.

So now we are using our file instead of the grub package's.  But it is
the same...

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 .../etc/grub.d/{20_linux_xen.in => 20_linux_xen}       | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename overlay-buster/etc/grub.d/{20_linux_xen.in => 20_linux_xen} (98%)
 mode change 100644 => 100755

diff --git a/overlay-buster/etc/grub.d/20_linux_xen.in b/overlay-buster/etc/grub.d/20_linux_xen
old mode 100644
new mode 100755
similarity index 98%
rename from overlay-buster/etc/grub.d/20_linux_xen.in
rename to overlay-buster/etc/grub.d/20_linux_xen
index 98ef163c..fb3ed82f
--- a/overlay-buster/etc/grub.d/20_linux_xen.in
+++ b/overlay-buster/etc/grub.d/20_linux_xen
@@ -17,14 +17,14 @@ set -e
 # You should have received a copy of the GNU General Public License
 # along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
 
-prefix="@prefix@"
-exec_prefix="@exec_prefix@"
-datarootdir="@datarootdir@"
+prefix="/usr"
+exec_prefix="/usr"
+datarootdir="/usr/share"
 
 . "$pkgdatadir/grub-mkconfig_lib"
 
-export TEXTDOMAIN=@PACKAGE@
-export TEXTDOMAINDIR="@localedir@"
+export TEXTDOMAIN=grub
+export TEXTDOMAINDIR="${datarootdir}/locale"
 
 CLASS="--class gnu-linux --class gnu --class os --class xen"
 SUPPORTED_INITS="sysvinit:/lib/sysvinit/init systemd:/lib/systemd/systemd upstart:/sbin/upstart"
-- 
2.20.1


