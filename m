Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 334843B44AC
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 15:42:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147244.271271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwm5h-0000Cx-9W; Fri, 25 Jun 2021 13:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147244.271271; Fri, 25 Jun 2021 13:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwm5h-0000Ay-6G; Fri, 25 Jun 2021 13:41:53 +0000
Received: by outflank-mailman (input) for mailman id 147244;
 Fri, 25 Jun 2021 13:41:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eNyz=LT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lwm5f-0000As-7c
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 13:41:51 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a2def10-8298-4fc6-8213-47247ed25e9c;
 Fri, 25 Jun 2021 13:41:50 +0000 (UTC)
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
X-Inumbo-ID: 9a2def10-8298-4fc6-8213-47247ed25e9c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624628509;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=QabGLG8N+OC52EYYAaaSgkVs4imrXTRHmaOnENFab10=;
  b=f4yDbYL2DXRZ2A/LSJB8Mp+TG7ABqSRgjGegk0A/WmYK3JEHNq+T4ya2
   MI5r3NNjAtgjHAoZtaZ+ftcYV1pxE3UEyVaX0hYqmAZFRx0UuztF+5eF4
   Dpvq8DC7oApDCG7XgcQobpfUVmT601wjk3G9kCGPmerdI3Jp+ze5tbhHZ
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Ej+DwY/ylwjZmhRx6RKqJn2a0jhEEColw3c9HgG86ZArtc9V3QWPD4fEpWDCNh6xR6N3Wz/kFg
 splcdAlh0rPxL25F8Y44w2aUg3AFobALxuNwUzKqdc7Wry/4DR71wQ/G4j+fnNoKk6Iys6AVlv
 JNz4b+G1G82B10W2mo/QsDgy1cEpODa14CHXpxNUcKpc/C4/US7dkhoxmfVr6nO5BqHhIy/7sv
 uw7GmL+N0Zw+GqlOTpBwnKkXf8q32NoVL11R+mEpzrWozNAtgEXGGVUq7YpqhFwKWf5dN+WDUF
 up8=
X-SBRS: 5.1
X-MesageID: 46688731
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:h08KnqM6MeDDHcBcTjujsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+MjzsCWftN9/Yh4dcLy7VpVoIkmskKKdg7NhXotKNTOO0AeVxelZhrcKqAeQeREWmNQ96U
 9hGZIOdeEZDzJB/LrHCN/TKade/DGFmprY+9s31x1WPGZXgzkL1XYDNu6ceHcGIjVuNN4CO7
 e3wNFInDakcWR/VLXAOpFUN9Kz3uEijfjdEGY7OyI=
X-IronPort-AV: E=Sophos;i="5.83,298,1616472000"; 
   d="scan'208";a="46688731"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>
Subject: [PATCH] Replace FSF street address with canonical URL (again)
Date: Fri, 25 Jun 2021 14:41:40 +0100
Message-ID: <20210625134140.19870-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

As recommended in http://www.gnu.org/licenses/gpl-howto.en.html.

Exactly as per changeset 443701ef0c7ff3 - Some errors have crept back in in
the past 6 years.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
---
 tools/libs/guest/xg_dom_hvmloader.c | 3 +--
 xen/arch/arm/acpi/boot.c            | 3 +--
 xen/common/argo.c                   | 3 +--
 xen/include/asm-arm/acpi.h          | 3 +--
 xen/include/xen/argo.h              | 3 +--
 xen/include/xen/rbtree.h            | 3 +--
 xen/lib/rbtree.c                    | 3 +--
 7 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/tools/libs/guest/xg_dom_hvmloader.c b/tools/libs/guest/xg_dom_hvmloader.c
index ae50d98011..39e1e5f579 100644
--- a/tools/libs/guest/xg_dom_hvmloader.c
+++ b/tools/libs/guest/xg_dom_hvmloader.c
@@ -14,8 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
+ * License along with this library; If not, see <http://www.gnu.org/licenses/>.
  *
  */
 
diff --git a/xen/arch/arm/acpi/boot.c b/xen/arch/arm/acpi/boot.c
index 7ea2990cb8..db5085e15d 100644
--- a/xen/arch/arm/acpi/boot.c
+++ b/xen/arch/arm/acpi/boot.c
@@ -19,8 +19,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ *  along with this program; If not, see <http://www.gnu.org/licenses/>.
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
diff --git a/xen/common/argo.c b/xen/common/argo.c
index 49be715f63..eaea7ba888 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -12,8 +12,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/argo.h>
diff --git a/xen/include/asm-arm/acpi.h b/xen/include/asm-arm/acpi.h
index b52ae2d6ef..e53973e054 100644
--- a/xen/include/asm-arm/acpi.h
+++ b/xen/include/asm-arm/acpi.h
@@ -14,8 +14,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ *  along with this program; If not, see <http://www.gnu.org/licenses/>.
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
diff --git a/xen/include/xen/argo.h b/xen/include/xen/argo.h
index 2ba7e5c0c0..fd4cfdd55c 100644
--- a/xen/include/xen/argo.h
+++ b/xen/include/xen/argo.h
@@ -9,8 +9,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef __XEN_ARGO_H__
diff --git a/xen/include/xen/rbtree.h b/xen/include/xen/rbtree.h
index 1b72590e4e..77bf57d4ab 100644
--- a/xen/include/xen/rbtree.h
+++ b/xen/include/xen/rbtree.h
@@ -13,8 +13,7 @@
   GNU General Public License for more details.
 
   You should have received a copy of the GNU General Public License
-  along with this program; if not, write to the Free Software
-  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+  along with this program; If not, see <http://www.gnu.org/licenses/>.
 
   linux/include/linux/rbtree.h
 
diff --git a/xen/lib/rbtree.c b/xen/lib/rbtree.c
index 95e045d524..85a4f20313 100644
--- a/xen/lib/rbtree.c
+++ b/xen/lib/rbtree.c
@@ -15,8 +15,7 @@
   GNU General Public License for more details.
 
   You should have received a copy of the GNU General Public License
-  along with this program; if not, write to the Free Software
-  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+  along with this program; If not, see <http://www.gnu.org/licenses/>.
 
   linux/lib/rbtree.c
 */
-- 
2.11.0


