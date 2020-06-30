Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 162D020F4C6
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 14:35:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqFUN-0008AE-Ao; Tue, 30 Jun 2020 12:35:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/Ev=AL=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1jqFUL-00084T-Fq
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 12:35:49 +0000
X-Inumbo-ID: 386884e2-bace-11ea-8496-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 386884e2-bace-11ea-8496-bc764e2007e4;
 Tue, 30 Jun 2020 12:35:46 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id C9722A3808;
 Tue, 30 Jun 2020 14:35:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id C6F14A380A;
 Tue, 30 Jun 2020 14:35:44 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id FQulLJynH1yD; Tue, 30 Jun 2020 14:35:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 23389A3807;
 Tue, 30 Jun 2020 14:35:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id WizpvhWplQ1k; Tue, 30 Jun 2020 14:35:43 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id F3578A3801;
 Tue, 30 Jun 2020 14:35:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 2655C2231C;
 Tue, 30 Jun 2020 14:34:50 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id m9xyphjmeEWn; Tue, 30 Jun 2020 14:34:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 7701E22606;
 Tue, 30 Jun 2020 14:34:43 +0200 (CEST)
X-Quarantine-ID: <Ecl5c91OY5f7>
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Ecl5c91OY5f7; Tue, 30 Jun 2020 14:34:43 +0200 (CEST)
Received: from mq-desktop.cert.pl (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id 5067F225E6;
 Tue, 30 Jun 2020 14:34:43 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v4 10/10] tools/proctrace: add proctrace tool
Date: Tue, 30 Jun 2020 14:33:53 +0200
Message-Id: <0ab003238e4e666d3847024b8917dbc11c40fecb.1593519420.git.michal.leszczynski@cert.pl>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593519420.git.michal.leszczynski@cert.pl>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
MIME-Version: 1.0
In-Reply-To: <cover.1593519420.git.michal.leszczynski@cert.pl>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: tamas.lengyel@intel.com, Michal Leszczynski <michal.leszczynski@cert.pl>,
 luwei.kang@intel.com, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Michal Leszczynski <michal.leszczynski@cert.pl>

Add an demonstration tool that uses xc_vmtrace_* calls in order
to manage external IPT monitoring for DomU.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 tools/proctrace/COPYING     | 339 ++++++++++++++++++++++++++++++++++++
 tools/proctrace/Makefile    |  48 +++++
 tools/proctrace/proctrace.c | 163 +++++++++++++++++
 3 files changed, 550 insertions(+)
 create mode 100644 tools/proctrace/COPYING
 create mode 100644 tools/proctrace/Makefile
 create mode 100644 tools/proctrace/proctrace.c

diff --git a/tools/proctrace/COPYING b/tools/proctrace/COPYING
new file mode 100644
index 0000000000..c0a841112c
--- /dev/null
+++ b/tools/proctrace/COPYING
@@ -0,0 +1,339 @@
+		    GNU GENERAL PUBLIC LICENSE
+		       Version 2, June 1991
+
+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.
+                       59 Temple Place, Suite 330, Boston, MA  02111-130=
7  USA
+ Everyone is permitted to copy and distribute verbatim copies
+ of this license document, but changing it is not allowed.
+
+			    Preamble
+
+  The licenses for most software are designed to take away your
+freedom to share and change it.  By contrast, the GNU General Public
+License is intended to guarantee your freedom to share and change free
+software--to make sure the software is free for all its users.  This
+General Public License applies to most of the Free Software
+Foundation's software and to any other program whose authors commit to
+using it.  (Some other Free Software Foundation software is covered by
+the GNU Library General Public License instead.)  You can apply it to
+your programs, too.
+
+  When we speak of free software, we are referring to freedom, not
+price.  Our General Public Licenses are designed to make sure that you
+have the freedom to distribute copies of free software (and charge for
+this service if you wish), that you receive source code or can get it
+if you want it, that you can change the software or use pieces of it
+in new free programs; and that you know you can do these things.
+
+  To protect your rights, we need to make restrictions that forbid
+anyone to deny you these rights or to ask you to surrender the rights.
+These restrictions translate to certain responsibilities for you if you
+distribute copies of the software, or if you modify it.
+
+  For example, if you distribute copies of such a program, whether
+gratis or for a fee, you must give the recipients all the rights that
+you have.  You must make sure that they, too, receive or can get the
+source code.  And you must show them these terms so they know their
+rights.
+
+  We protect your rights with two steps: (1) copyright the software, and
+(2) offer you this license which gives you legal permission to copy,
+distribute and/or modify the software.
+
+  Also, for each author's protection and ours, we want to make certain
+that everyone understands that there is no warranty for this free
+software.  If the software is modified by someone else and passed on, we
+want its recipients to know that what they have is not the original, so
+that any problems introduced by others will not reflect on the original
+authors' reputations.
+
+  Finally, any free program is threatened constantly by software
+patents.  We wish to avoid the danger that redistributors of a free
+program will individually obtain patent licenses, in effect making the
+program proprietary.  To prevent this, we have made it clear that any
+patent must be licensed for everyone's free use or not licensed at all.
+
+  The precise terms and conditions for copying, distribution and
+modification follow.
+
+		    GNU GENERAL PUBLIC LICENSE
+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+  0. This License applies to any program or other work which contains
+a notice placed by the copyright holder saying it may be distributed
+under the terms of this General Public License.  The "Program", below,
+refers to any such program or work, and a "work based on the Program"
+means either the Program or any derivative work under copyright law:
+that is to say, a work containing the Program or a portion of it,
+either verbatim or with modifications and/or translated into another
+language.  (Hereinafter, translation is included without limitation in
+the term "modification".)  Each licensee is addressed as "you".
+
+Activities other than copying, distribution and modification are not
+covered by this License; they are outside its scope.  The act of
+running the Program is not restricted, and the output from the Program
+is covered only if its contents constitute a work based on the
+Program (independent of having been made by running the Program).
+Whether that is true depends on what the Program does.
+
+  1. You may copy and distribute verbatim copies of the Program's
+source code as you receive it, in any medium, provided that you
+conspicuously and appropriately publish on each copy an appropriate
+copyright notice and disclaimer of warranty; keep intact all the
+notices that refer to this License and to the absence of any warranty;
+and give any other recipients of the Program a copy of this License
+along with the Program.
+
+You may charge a fee for the physical act of transferring a copy, and
+you may at your option offer warranty protection in exchange for a fee.
+
+  2. You may modify your copy or copies of the Program or any portion
+of it, thus forming a work based on the Program, and copy and
+distribute such modifications or work under the terms of Section 1
+above, provided that you also meet all of these conditions:
+
+    a) You must cause the modified files to carry prominent notices
+    stating that you changed the files and the date of any change.
+
+    b) You must cause any work that you distribute or publish, that in
+    whole or in part contains or is derived from the Program or any
+    part thereof, to be licensed as a whole at no charge to all third
+    parties under the terms of this License.
+
+    c) If the modified program normally reads commands interactively
+    when run, you must cause it, when started running for such
+    interactive use in the most ordinary way, to print or display an
+    announcement including an appropriate copyright notice and a
+    notice that there is no warranty (or else, saying that you provide
+    a warranty) and that users may redistribute the program under
+    these conditions, and telling the user how to view a copy of this
+    License.  (Exception: if the Program itself is interactive but
+    does not normally print such an announcement, your work based on
+    the Program is not required to print an announcement.)
+
+These requirements apply to the modified work as a whole.  If
+identifiable sections of that work are not derived from the Program,
+and can be reasonably considered independent and separate works in
+themselves, then this License, and its terms, do not apply to those
+sections when you distribute them as separate works.  But when you
+distribute the same sections as part of a whole which is a work based
+on the Program, the distribution of the whole must be on the terms of
+this License, whose permissions for other licensees extend to the
+entire whole, and thus to each and every part regardless of who wrote it=
.
+
+Thus, it is not the intent of this section to claim rights or contest
+your rights to work written entirely by you; rather, the intent is to
+exercise the right to control the distribution of derivative or
+collective works based on the Program.
+
+In addition, mere aggregation of another work not based on the Program
+with the Program (or with a work based on the Program) on a volume of
+a storage or distribution medium does not bring the other work under
+the scope of this License.
+
+  3. You may copy and distribute the Program (or a work based on it,
+under Section 2) in object code or executable form under the terms of
+Sections 1 and 2 above provided that you also do one of the following:
+
+    a) Accompany it with the complete corresponding machine-readable
+    source code, which must be distributed under the terms of Sections
+    1 and 2 above on a medium customarily used for software interchange;=
 or,
+
+    b) Accompany it with a written offer, valid for at least three
+    years, to give any third party, for a charge no more than your
+    cost of physically performing source distribution, a complete
+    machine-readable copy of the corresponding source code, to be
+    distributed under the terms of Sections 1 and 2 above on a medium
+    customarily used for software interchange; or,
+
+    c) Accompany it with the information you received as to the offer
+    to distribute corresponding source code.  (This alternative is
+    allowed only for noncommercial distribution and only if you
+    received the program in object code or executable form with such
+    an offer, in accord with Subsection b above.)
+
+The source code for a work means the preferred form of the work for
+making modifications to it.  For an executable work, complete source
+code means all the source code for all modules it contains, plus any
+associated interface definition files, plus the scripts used to
+control compilation and installation of the executable.  However, as a
+special exception, the source code distributed need not include
+anything that is normally distributed (in either source or binary
+form) with the major components (compiler, kernel, and so on) of the
+operating system on which the executable runs, unless that component
+itself accompanies the executable.
+
+If distribution of executable or object code is made by offering
+access to copy from a designated place, then offering equivalent
+access to copy the source code from the same place counts as
+distribution of the source code, even though third parties are not
+compelled to copy the source along with the object code.
+
+  4. You may not copy, modify, sublicense, or distribute the Program
+except as expressly provided under this License.  Any attempt
+otherwise to copy, modify, sublicense or distribute the Program is
+void, and will automatically terminate your rights under this License.
+However, parties who have received copies, or rights, from you under
+this License will not have their licenses terminated so long as such
+parties remain in full compliance.
+
+  5. You are not required to accept this License, since you have not
+signed it.  However, nothing else grants you permission to modify or
+distribute the Program or its derivative works.  These actions are
+prohibited by law if you do not accept this License.  Therefore, by
+modifying or distributing the Program (or any work based on the
+Program), you indicate your acceptance of this License to do so, and
+all its terms and conditions for copying, distributing or modifying
+the Program or works based on it.
+
+  6. Each time you redistribute the Program (or any work based on the
+Program), the recipient automatically receives a license from the
+original licensor to copy, distribute or modify the Program subject to
+these terms and conditions.  You may not impose any further
+restrictions on the recipients' exercise of the rights granted herein.
+You are not responsible for enforcing compliance by third parties to
+this License.
+
+  7. If, as a consequence of a court judgment or allegation of patent
+infringement or for any other reason (not limited to patent issues),
+conditions are imposed on you (whether by court order, agreement or
+otherwise) that contradict the conditions of this License, they do not
+excuse you from the conditions of this License.  If you cannot
+distribute so as to satisfy simultaneously your obligations under this
+License and any other pertinent obligations, then as a consequence you
+may not distribute the Program at all.  For example, if a patent
+license would not permit royalty-free redistribution of the Program by
+all those who receive copies directly or indirectly through you, then
+the only way you could satisfy both it and this License would be to
+refrain entirely from distribution of the Program.
+
+If any portion of this section is held invalid or unenforceable under
+any particular circumstance, the balance of the section is intended to
+apply and the section as a whole is intended to apply in other
+circumstances.
+
+It is not the purpose of this section to induce you to infringe any
+patents or other property right claims or to contest validity of any
+such claims; this section has the sole purpose of protecting the
+integrity of the free software distribution system, which is
+implemented by public license practices.  Many people have made
+generous contributions to the wide range of software distributed
+through that system in reliance on consistent application of that
+system; it is up to the author/donor to decide if he or she is willing
+to distribute software through any other system and a licensee cannot
+impose that choice.
+
+This section is intended to make thoroughly clear what is believed to
+be a consequence of the rest of this License.
+
+  8. If the distribution and/or use of the Program is restricted in
+certain countries either by patents or by copyrighted interfaces, the
+original copyright holder who places the Program under this License
+may add an explicit geographical distribution limitation excluding
+those countries, so that distribution is permitted only in or among
+countries not thus excluded.  In such case, this License incorporates
+the limitation as if written in the body of this License.
+
+  9. The Free Software Foundation may publish revised and/or new version=
s
+of the General Public License from time to time.  Such new versions will
+be similar in spirit to the present version, but may differ in detail to
+address new problems or concerns.
+
+Each version is given a distinguishing version number.  If the Program
+specifies a version number of this License which applies to it and "any
+later version", you have the option of following the terms and condition=
s
+either of that version or of any later version published by the Free
+Software Foundation.  If the Program does not specify a version number o=
f
+this License, you may choose any version ever published by the Free Soft=
ware
+Foundation.
+
+  10. If you wish to incorporate parts of the Program into other free
+programs whose distribution conditions are different, write to the autho=
r
+to ask for permission.  For software which is copyrighted by the Free
+Software Foundation, write to the Free Software Foundation; we sometimes
+make exceptions for this.  Our decision will be guided by the two goals
+of preserving the free status of all derivatives of our free software an=
d
+of promoting the sharing and reuse of software generally.
+
+			    NO WARRANTY
+
+  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRAN=
TY
+FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
+OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
+PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS=
ED
+OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK A=
S
+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
+PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
+REPAIR OR CORRECTION.
+
+  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRIT=
ING
+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
+REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGE=
S,
+INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARIS=
ING
+OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITE=
D
+TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
+YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTH=
ER
+PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGES.
+
+		     END OF TERMS AND CONDITIONS
+
+	    How to Apply These Terms to Your New Programs
+
+  If you develop a new program, and you want it to be of the greatest
+possible use to the public, the best way to achieve this is to make it
+free software which everyone can redistribute and change under these ter=
ms.
+
+  To do so, attach the following notices to the program.  It is safest
+to attach them to the start of each source file to most effectively
+convey the exclusion of warranty; and each file should have at least
+the "copyright" line and a pointer to where the full notice is found.
+
+    <one line to give the program's name and a brief idea of what it doe=
s.>
+    Copyright (C) <year>  <name of author>
+
+    This program is free software; you can redistribute it and/or modify
+    it under the terms of the GNU General Public License as published by
+    the Free Software Foundation; either version 2 of the License, or
+    (at your option) any later version.
+
+    This program is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+    GNU General Public License for more details.
+
+    You should have received a copy of the GNU General Public License
+    along with this program; If not, see <http://www.gnu.org/licenses/>.
+
+
+Also add information on how to contact you by electronic and paper mail.
+
+If the program is interactive, make it output a short notice like this
+when it starts in an interactive mode:
+
+    Gnomovision version 69, Copyright (C) year name of author
+    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `sho=
w w'.
+    This is free software, and you are welcome to redistribute it
+    under certain conditions; type `show c' for details.
+
+The hypothetical commands `show w' and `show c' should show the appropri=
ate
+parts of the General Public License.  Of course, the commands you use ma=
y
+be called something other than `show w' and `show c'; they could even be
+mouse-clicks or menu items--whatever suits your program.
+
+You should also get your employer (if you work as a programmer) or your
+school, if any, to sign a "copyright disclaimer" for the program, if
+necessary.  Here is a sample; alter the names:
+
+  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
+  `Gnomovision' (which makes passes at compilers) written by James Hacke=
r.
+
+  <signature of Ty Coon>, 1 April 1989
+  Ty Coon, President of Vice
+
+This General Public License does not permit incorporating your program i=
nto
+proprietary programs.  If your program is a subroutine library, you may
+consider it more useful to permit linking proprietary applications with =
the
+library.  If this is what you want to do, use the GNU Library General
+Public License instead of this License.
diff --git a/tools/proctrace/Makefile b/tools/proctrace/Makefile
new file mode 100644
index 0000000000..2983c477fe
--- /dev/null
+++ b/tools/proctrace/Makefile
@@ -0,0 +1,48 @@
+# Copyright (C) CERT Polska - NASK PIB
+# Author: Micha=C5=82 Leszczy=C5=84ski <michal.leszczynski@cert.pl>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; under version 2 of the License.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+
+XEN_ROOT=3D$(CURDIR)/../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+CFLAGS  +=3D -Werror
+CFLAGS  +=3D $(CFLAGS_libxenevtchn)
+CFLAGS  +=3D $(CFLAGS_libxenctrl)
+LDLIBS  +=3D $(LDLIBS_libxenctrl)
+LDLIBS  +=3D $(LDLIBS_libxenevtchn)
+LDLIBS  +=3D $(LDLIBS_libxenforeignmemory)
+
+.PHONY: all
+all: build
+
+.PHONY: build
+build: proctrace
+
+.PHONY: install
+install: build
+	$(INSTALL_DIR) $(DESTDIR)$(sbindir)
+	$(INSTALL_PROG) proctrace $(DESTDIR)$(sbindir)/proctrace
+
+.PHONY: uninstall
+uninstall:
+	rm -f $(DESTDIR)$(sbindir)/proctrace
+
+.PHONY: clean
+clean:
+	$(RM) -f $(DEPS_RM)
+
+.PHONY: distclean
+distclean: clean
+
+iptlive: iptlive.o Makefile
+	$(CC) $(LDFLAGS) $< -o $@ $(LDLIBS) $(APPEND_LDFLAGS)
+
+-include $(DEPS_INCLUDE)
diff --git a/tools/proctrace/proctrace.c b/tools/proctrace/proctrace.c
new file mode 100644
index 0000000000..22bf91db8d
--- /dev/null
+++ b/tools/proctrace/proctrace.c
@@ -0,0 +1,163 @@
+/***********************************************************************=
*******
+ * tools/proctrace.c
+ *
+ * Demonstrative tool for collecting Intel Processor Trace data from Xen=
.
+ *  Could be used to externally monitor a given vCPU in given DomU.
+ *
+ * Copyright (C) 2020 by CERT Polska - NASK PIB
+ *
+ * Authors: Micha=C5=82 Leszczy=C5=84ski, michal.leszczynski@cert.pl
+ * Date:    June, 2020
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; under version 2 of the License.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <sys/mman.h>
+#include <signal.h>
+
+#include <xenctrl.h>
+#include <xen/xen.h>
+#include <xenforeignmemory.h>
+
+#define BUF_SIZE (16384 * XC_PAGE_SIZE)
+
+volatile int interrupted =3D 0;
+
+void term_handler(int signum) {
+    interrupted =3D 1;
+}
+
+int main(int argc, char* argv[]) {
+    xc_interface *xc;
+    uint32_t domid;
+    uint32_t vcpu_id;
+
+    int rc =3D -1;
+    uint8_t *buf =3D NULL;
+    uint64_t last_offset =3D 0;
+
+    xenforeignmemory_handle *fmem;
+    xenforeignmemory_resource_handle *fres;
+
+    if (signal(SIGINT, term_handler) =3D=3D SIG_ERR)
+    {
+        fprintf(stderr, "Failed to register signal handler\n");
+        return 1;
+    }
+
+    if (argc !=3D 3) {
+        fprintf(stderr, "Usage: %s <domid> <vcpu_id>\n", argv[0]);
+        fprintf(stderr, "It's recommended to redirect this"
+                        "program's output to file\n");
+        fprintf(stderr, "or to pipe it's output to xxd or other program.=
\n");
+        return 1;
+    }
+
+    domid =3D atoi(argv[1]);
+    vcpu_id =3D atoi(argv[2]);
+
+    xc =3D xc_interface_open(0, 0, 0);
+
+    fmem =3D xenforeignmemory_open(0, 0);
+
+    if (!xc) {
+        fprintf(stderr, "Failed to open xc interface\n");
+        return 1;
+    }
+
+    rc =3D xc_vmtrace_pt_enable(xc, domid, vcpu_id);
+
+    if (rc) {
+        fprintf(stderr, "Failed to call xc_vmtrace_pt_enable\n");
+        return 1;
+    }
+
+    fres =3D xenforeignmemory_map_resource(
+        fmem, domid, XENMEM_resource_vmtrace_buf,
+        /* vcpu: */ vcpu_id,
+        /* frame: */ 0,
+        /* num_frames: */ BUF_SIZE >> XC_PAGE_SHIFT,
+        (void **)&buf,
+        PROT_READ, 0);
+
+    if (!buf) {
+        fprintf(stderr, "Failed to map trace buffer\n");
+        return 1;
+    }
+
+    while (!interrupted) {
+        uint64_t offset;
+        rc =3D xc_vmtrace_pt_get_offset(xc, domid, vcpu_id, &offset);
+
+        if (rc) {
+            fprintf(stderr, "Failed to call xc_vmtrace_pt_get_offset\n")=
;
+            return 1;
+        }
+
+        if (offset > last_offset)
+        {
+            fwrite(buf + last_offset, offset - last_offset, 1, stdout);
+        }
+        else if (offset < last_offset)
+        {
+            // buffer wrapped
+            fwrite(buf + last_offset, BUF_SIZE - last_offset, 1, stdout)=
;
+            fwrite(buf, offset, 1, stdout);
+        }
+
+        last_offset =3D offset;
+        usleep(1000 * 100);
+    }
+
+    rc =3D xenforeignmemory_unmap_resource(fmem, fres);
+
+    if (rc) {
+        fprintf(stderr, "Failed to unmap resource\n");
+        return 1;
+    }
+
+    rc =3D xenforeignmemory_close(fmem);
+
+    if (rc) {
+        fprintf(stderr, "Failed to close fmem\n");
+        return 1;
+    }
+
+    rc =3D xc_vmtrace_pt_disable(xc, domid, vcpu_id);
+
+    if (rc) {
+        fprintf(stderr, "Failed to call xc_vmtrace_pt_disable\n");
+        return 1;
+    }
+
+    rc =3D xc_interface_close(xc);
+
+    if (rc) {
+        fprintf(stderr, "Failed to close xc interface\n");
+        return 1;
+    }
+
+    return 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--=20
2.20.1


