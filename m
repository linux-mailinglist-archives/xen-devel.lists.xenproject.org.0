Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C607CAF15
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 18:25:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617869.960938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsQOr-0008QY-G9; Mon, 16 Oct 2023 16:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617869.960938; Mon, 16 Oct 2023 16:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsQOr-0008Md-CR; Mon, 16 Oct 2023 16:25:01 +0000
Received: by outflank-mailman (input) for mailman id 617869;
 Mon, 16 Oct 2023 16:24:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fDQ6=F6=citrix.com=prvs=646b7f3c5=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qsQOp-0008I7-A6
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 16:24:59 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a096ab6-6c40-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 18:24:57 +0200 (CEST)
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
X-Inumbo-ID: 8a096ab6-6c40-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697473497;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E8wbjDHabY5D/w/rdgUdQWa9yTs1C8lznXVUosJwlwA=;
  b=JdhFWE/AVVCPN77v3YbLAyxPXR4m3C17Kn9tTDbcUA9mgTtfbZPVjmcQ
   RdAGIowQLT2t5GmCCeKOsrUXm7ElBNI6LInS8Lfw9oRt96wOfKVdZeE+p
   JmZWJ1fWTHqUgTbZ6l2BtZUVNZXqnp4vxFJvCtod3T7nACl2oSIYxWqNR
   o=;
X-CSE-ConnectionGUID: yzlbLRSHSoK8GKn78rkUIQ==
X-CSE-MsgGUID: kaHAD0lkQNW0mX7KsF/kmA==
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 126162428
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:H1YPRK06Eqp0XnEYC/bD5R5xkn2cJEfYwER7XKvMYLTBsI5bpzAGn
 DYaWDuObPiOYWvyLdl3aorn90IO7ZPQz9ViQQRvpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb83uDgNyo4GlD5wRnO6gS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfEHNK/
 9giExA2aTPTqMGwn+KhSdRNv5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGc+KkuYC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTH5sMwBzE/
 DKuE2LRARg6HfDHzTm81E30g9+QvjjVH4EXPejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslgUHR9NaHuk+6QeM4qnZ+QCUAi4DVDEpQMMinN87Q3otz
 FDht9H0AT1itpWFRHTb8a2bxRuQEyUIKW4JZQcfUBAIpdLkpekbjB3VSc14OLWoldCzEjb1q
 xiqoS4klvMshMgE/6yh+BbMhDfEm3TSZldrvEONBDvjt14oItH9D2C11bTFxedSKIy9dGKhh
 38ny+e96r9eF5KwtRXYFY3hA4qVC+a53Cz02AA+QMV7qGz8oxZPbqgKvmsjeBkB3tIsPG+xO
 RCN42u98bcJZBOXgblLj5Vd4ijA5ZDnEMzsUPecRNdHaZgZmOSvp3o2OxD4M4wAiiERfUAD1
 XSzK5zE4Y4yU/gP8dZPb751PUUX7i4/33jPYpvw0g6q17GTDFbMF+ZaawrTM7hpvPzbyOkwz
 zq4H5LRoyizrcWkOnWHmWLtBQxiwYcH6WDe9JUMK7/rzvtOE2A9Ef7BqY4cl3het/0NzI/gp
 yjtMnK0PXKj3RUr3y3WMCE8AF4uNL4jxU8G0dsEZw3ygSl6Ot/zsc/ytfIfJNEayQCq9tYsJ
 9FtRilKKq0npujvk9jFUaTAkQ==
IronPort-HdrOrdr: A9a23:2XXDa68c8gXw9j8g10Vuk+C9I+orL9Y04lQ7vn2ZKCYlEfBw8v
 rFoB1173PJYVoqOE3I++rgBEDwex7hHPdOiOF7AV7IZmfbUQWTQ71f0Q==
X-Talos-CUID: 9a23:8LE142GHlV/FUEUXqmJ25koePvoeUkba7yf/AEnnWXxqdZysHAo=
X-Talos-MUID: 9a23:78BYJgo1c+JNfjfV82AezzJrFO5Eu6CtMWYyyZA25OqfG2tzPh7I2Q==
X-IronPort-AV: E=Sophos;i="6.03,229,1694750400"; 
   d="scan'208";a="126162428"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>, Henry Wang
	<Henry.Wang@arm.com>
Subject: [PATCH for-4.18] docs/sphinx: Lifecycle of a domid
Date: Mon, 16 Oct 2023 17:24:50 +0100
Message-ID: <20231016162450.1286178-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Juergen Gross <jgross@suse.com>
CC: Henry Wang <Henry.Wang@arm.com>

Rendered form:
  https://andrewcoop-xen.readthedocs.io/en/docs-devel/hypervisor-guide/domid-lifecycle.html

I'm not sure why it's using the alibaster theme and not RTD theme, but I
don't have time to debug that further at this point.

This was written mostly while sat waiting for flights in Nanjing and Beijing.

If while reading this you spot a hole, congratulations.  There are holes which
need fixing...
---
 docs/glossary.rst                         |   9 ++
 docs/hypervisor-guide/domid-lifecycle.rst | 164 ++++++++++++++++++++++
 docs/hypervisor-guide/index.rst           |   1 +
 3 files changed, 174 insertions(+)
 create mode 100644 docs/hypervisor-guide/domid-lifecycle.rst

diff --git a/docs/glossary.rst b/docs/glossary.rst
index 8ddbdab160a1..1fd1de0f0e97 100644
--- a/docs/glossary.rst
+++ b/docs/glossary.rst
@@ -50,3 +50,12 @@ Glossary
 
      By default it gets all devices, including all disks and network cards, so
      is responsible for multiplexing guest I/O.
+
+   system domain
+     Abstractions within Xen that are modelled in a similar way to regular
+     :term:`domains<domain>`.  E.g. When there's no work to do, Xen schedules
+     ``DOMID_IDLE`` to put the CPU into a lower power state.
+
+     System domains have :term:`domids<domid>` and are referenced by
+     privileged software for certain control operations, but they do not run
+     guest code.
diff --git a/docs/hypervisor-guide/domid-lifecycle.rst b/docs/hypervisor-guide/domid-lifecycle.rst
new file mode 100644
index 000000000000..d405a321f3c7
--- /dev/null
+++ b/docs/hypervisor-guide/domid-lifecycle.rst
@@ -0,0 +1,164 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Lifecycle of a domid
+====================
+
+Overview
+--------
+
+A :term:`domid` is Xen's numeric identifier for a :term:`domain`.  In any
+operational Xen system, there are one or more domains running.
+
+Domids are 16-bit integers.  Regular domids start from 0, but there are some
+special identifiers, e.g. ``DOMID_SELF``, and :term:`system domains<system
+domain>`, e.g. ``DOMID_IDLE`` starting from 0x7ff0.  Therefore, a Xen system
+can run a maximum of 32k domains concurrently.
+
+.. note::
+
+   Despite being exposed in the domid ABI, the system domains are internal to
+   Xen and do not have lifecycles like regular domains.  Therefore, they are
+   not discussed further in this document.
+
+At system boot, Xen will construct one or more domains.  Kernels and
+configuration for these domains must be provided by the bootloader, or at
+Xen's compile time for more highly integrated solutions.
+
+Correct functioning of the domain lifecycle involves ``xenstored``, and some
+privileged entity which has bound the ``VIRQ_DOM_EXC`` global event channel.
+
+.. note::
+
+   While not a strict requirement for these to be the same entity, it is
+   ``xenstored`` which typically has ``VIRQ_DOM_EXC`` bound.  This document is
+   written assuming the common case.
+
+Creation
+--------
+
+Within Xen, the ``domain_create()`` function is used to allocate and perform
+bare minimum construction of a domain.  The :term:`control domain` accesses
+this functionality via the ``DOMCTL_createdomain`` hypercall.
+
+The final action that ``domain_create()`` performs before returning
+successfully is to enter the new domain into the domlist.  This makes the
+domain "visible" within Xen, allowing the new domid to be successfully
+referenced by other hypercalls.
+
+At this point, the domain exists as far as Xen is concerned, but not usefully
+as a VM yet.  The toolstack performs further construction activities;
+allocating vCPUs, RAM, copying in the initial executable code, etc.  Domains
+are automatically created with one "pause" reference count held, meaning that
+it is not eligible for scheduling.
+
+When the toolstack has finished VM construction, it send an ``XS_INTRODUCE``
+command to ``xenstored``.  This instructs ``xenstored`` to connect to the
+guest's xenstore ring, and fire the ``@introduceDomain`` watch.  The firing of
+this watch is the signal to all other components which care that a new VM has
+appeared and is about to start running.
+
+When the ``XS_INTRODUCE`` command returns successfully, the final action the
+toolstack performs is to unpause the guest, using the ``DOMCTL_unpausedomain``
+hypercall.  This drops the "pause" reference the domain was originally created
+with, meaning that the vCPU(s) are eligible for scheduling and the domain will
+start executing its first instruction.
+
+.. note::
+
+   It is common for vCPUs other than 0 to be left in an offline state, to be
+   started by actions within the VM.
+
+Termination
+-----------
+
+The VM runs for a period of time, but eventually stops.  It can stop for a
+number of reasons, including:
+
+ * Directly at the guest kernel's request, via the ``SCHEDOP_shutdown``
+   hypercall.  The hypercall also includes the reason for the shutdown,
+   e.g. ``poweroff``, ``reboot`` or ``crash``.
+
+ * Indirectly from certain states.  E.g. executing a ``HLT`` instruction with
+   interrupts disabled is interpreted as a shutdown request as it is a common
+   code pattern for fatal error handling when no better options are available.
+
+ * Indirectly from fatal exceptions.  In some states, execution is unable to
+   continue, e.g. Triple Fault on x86.
+
+ * Directly from the device model, via the ``DMOP_remote_shutdown`` hypercall.
+   E.g. On x86, the 0xcf9 IO port is commonly used to perform platform
+   poweroff, reset or sleep transitions.
+
+ * Directly from the toolstack.  The toolstack is capable of initiating
+   cleanup directly, e.g. ``xl destroy``.  This is typically an administration
+   action of last resort to clean up a domain which malfunctioned but not
+   terminated properly.
+
+ * Directly from Xen.  Some error handling ends up using ``domain_crash()``
+   when Xen doesn't think it can safely continue running the VM.
+
+Whatever the reason for termination, Xen ends up calling ``domain_shutdown()``
+to set the shutdown reason and deschedule all vCPUs.  Xen also fires the
+``VIRQ_DOM_EXC`` event channel, which is a signal to ``xenstored``.
+
+Upon receiving ``VIRQ_DOM_EXC``, ``xenstored`` re-scans all domains using the
+``SYSCTL_getdomaininfolist`` hypercall.  If any domain has changed state from
+running to shut down, ``xenstored`` fires the ``@releaseDomain`` watch.  The
+firing of this watch is the signal to all other components which care that a
+VM has stopped.
+
+.. note::
+
+   Xen does not treat reboot differently to poweroff; both statuses are
+   forwarded to the toolstack.  It is up to the toolstack to restart the VM,
+   which is typically done by constructing a new domain.
+
+.. note::
+
+   Some shutdowns may not result in the cleanup of a domain.  ``suspend`` for
+   example can be used for snapshotting, and the VM resumes execution in the
+   same domain/domid.  Therefore, a domain can cycle several times between
+   running and "shut down" before moving into the destruction phase.
+
+Destruction
+-----------
+
+The domain object in Xen is reference counted, and survives until all
+references are dropped.
+
+The ``@releaseDomain`` watch is to inform all entities that hold a reference
+on the domain to clean up.  This may include:
+
+ * Paravirtual driver backends having a grant map of the shared ring with the
+   frontend.
+ * A device model with a map of the IOREQ page(s).
+
+The toolstack also has work to do in response to ``@releaseDomain``.  It must
+issue the ``DOMCTL_destroydomain`` hypercall.  This hypercall can take minutes
+of wall-clock time to complete for large domains as, amongst other things, it
+is freeing the domain's RAM back to the system.
+
+The actions triggered by the ``@releaseDomain`` watch are asynchronous.  There
+is no guarantee as to the order in which actions start, or which action is the
+final one to complete.  However, the toolstack can achieve some ordering by
+delaying the ``DOMCTL_destroydomain`` hypercall if necessary.
+
+Freeing
+-------
+
+When the final reference on the domain object is dropped, Xen will remove the
+domain from the domlist.  This means the domid is no longer visible in Xen,
+and no longer able to be referenced by other hypercalls.
+
+Xen then schedules the object for deletion at some point after any concurrent
+hypercalls referencing the domain have completed.
+
+When the object is finally cleaned up, Xen fires the ``VIRQ_DOM_EXC`` event
+channel again, causing ``xenstored`` to rescan an notice that the domain has
+ceased to exist.  It fires the ``@releaseDomain`` watch a second time to
+signal to any components which care that the domain has gone away.
+
+E.g. The second ``@releaseDomain`` is commonly used by paravirtual driver
+backends to shut themselves down.
+
+At this point, the toolstack can reuse the domid for a new domain.
diff --git a/docs/hypervisor-guide/index.rst b/docs/hypervisor-guide/index.rst
index e4393b06975b..af88bcef8313 100644
--- a/docs/hypervisor-guide/index.rst
+++ b/docs/hypervisor-guide/index.rst
@@ -6,6 +6,7 @@ Hypervisor documentation
 .. toctree::
    :maxdepth: 2
 
+   domid-lifecycle
    code-coverage
 
    x86/index

base-commit: dc9d9aa62ddeb14abd5672690d30789829f58f7e
prerequisite-patch-id: 832bdc9a23500d426b4fe11237ae7f6614f2369c
-- 
2.30.2


