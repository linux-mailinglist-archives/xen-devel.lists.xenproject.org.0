Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4212DCAAD
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 02:54:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55681.96995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpiUm-0002wn-4S; Thu, 17 Dec 2020 01:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55681.96995; Thu, 17 Dec 2020 01:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpiUm-0002wN-0v; Thu, 17 Dec 2020 01:54:20 +0000
Received: by outflank-mailman (input) for mailman id 55681;
 Thu, 17 Dec 2020 01:54:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHja=FV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kpiUk-0002wI-Rj
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 01:54:18 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0154d6b6-1693-48b5-84e2-1c301b1b6c33;
 Thu, 17 Dec 2020 01:54:18 +0000 (UTC)
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
X-Inumbo-ID: 0154d6b6-1693-48b5-84e2-1c301b1b6c33
Date: Wed, 16 Dec 2020 17:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608170057;
	bh=A7K8EVznVBsm9la5oP/60sCc5/xOkT+pdBJ9Nrg/VwA=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=aBwqbzIFJVCLIk/FPsIqJtyhwfOPdJSQ9HbjtuYfW3aF8uYw1jjv9z//J18Y1pdKV
	 wg8h7bq9RTRaLjpCGYwcGzPc1WeKMQ492GHRsLhdp8zRLRAgi9rkZapoImoVmMyvnN
	 lqTtWLcWJ9BSLA8KEds7eGKb+bGMrAiHlSJR0BO5MYnzfxMK9scHNqmIedvNC5TXW2
	 A+gnxQ4fVAwnAg4dNJsz6juMhkkjy3mzj6JxRh74w5zjMV4rJhwaaIVQINHyx3JmIx
	 Kvdlu5BYq7NGiw+blSyAP5TRNr6ZC4a9+ABzsEfJ48UjfbjjlhjvBhU6lPCAQsfNC0
	 6KrEuM4KYo6vQ==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
cc: iwj@xenproject.org, anthony.perard@citrix.com, wl@xen.org, 
    dgdegra@tycho.nsa.gov, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org
Subject: Re: arm32 tools/flask build failure
In-Reply-To: <alpine.DEB.2.21.2012151823480.4040@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2012161753100.4040@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2012151823480.4040@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Dec 2020, Stefano Stabellini wrote:
> Hi all,
> 
> I am building Xen tools for ARM32 using qemu-user. I am getting the
> following error building tools/flask. Everything else works fine. It is
> worth noting that make -j1 works fine, it is only make -j4 that fails.
> 
> I played with .NOTPARALLEL but couldn't get it to work. Anyone has any
> ideas?
> 
> Cheers,
> 
> Stefano
> 
> 
> make[2]: Leaving directory '/build/tools/flask/utils'
> make[1]: Leaving directory '/build/tools/flask'
> make[1]: Entering directory '/build/tools/flask'
> /usr/bin/make -C policy all
> make[2]: Entering directory '/build/tools/flask/policy'
> make[2]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.
> /build/tools/flask/policy/Makefile.common:115: *** target pattern contains no '%'.  Stop.
> make[2]: Leaving directory '/build/tools/flask/policy'
> make[1]: *** [/build/tools/flask/../../tools/Rules.mk:160: subdir-all-policy] Error 2
> make[1]: Leaving directory '/build/tools/flask'
> make: *** [/build/tools/flask/../../tools/Rules.mk:155: subdirs-all] Error 2


The fix seems to be turning the problematic variable:

POLICY_FILENAME = $(FLASK_BUILD_DIR)/xenpolicy-$(shell $(MAKE) -C $(XEN_ROOT)/xen xenversion --no-print-directory)

into a rule.


diff --git a/tools/flask/policy/Makefile.common b/tools/flask/policy/Makefile.common
index bea5ba4b6a..9a086d8acd 100644
--- a/tools/flask/policy/Makefile.common
+++ b/tools/flask/policy/Makefile.common
@@ -35,7 +35,6 @@ OUTPUT_POLICY ?= $(BEST_POLICY_VER)
 #
 ########################################
 
-POLICY_FILENAME = $(FLASK_BUILD_DIR)/xenpolicy-$(shell $(MAKE) -C $(XEN_ROOT)/xen xenversion --no-print-directory)
 POLICY_LOADPATH = /boot
 
 # List of policy versions supported by the hypervisor
@@ -112,17 +111,19 @@ POLICY_SECTIONS += $(USERS)
 POLICY_SECTIONS += $(ALL_CONSTRAINTS)
 POLICY_SECTIONS += $(ISID_DEFS) $(DEV_OCONS)
 
-all: $(POLICY_FILENAME)
+policy:
 
-install: $(POLICY_FILENAME)
+all: policy
+
+install: policy
 	$(INSTALL_DIR) $(DESTDIR)/$(POLICY_LOADPATH)
 	$(INSTALL_DATA) $^ $(DESTDIR)/$(POLICY_LOADPATH)
 
 uninstall:
 	rm -f $(DESTDIR)/$(POLICY_LOADPATH)/$(POLICY_FILENAME)
 
-$(POLICY_FILENAME): $(FLASK_BUILD_DIR)/policy.conf
-	$(CHECKPOLICY) $(CHECKPOLICY_PARAM) $^ -o $@
+policy: $(FLASK_BUILD_DIR)/policy.conf
+	$(CHECKPOLICY) $(CHECKPOLICY_PARAM) $^ -o xenpolicy-"$$($(MAKE) -C $(XEN_ROOT)/xen xenversion --no-print-directory)"
 
 $(FLASK_BUILD_DIR)/policy.conf: $(POLICY_SECTIONS) $(MOD_CONF)
 	$(M4) $(M4PARAM) $(POLICY_SECTIONS) > $@

