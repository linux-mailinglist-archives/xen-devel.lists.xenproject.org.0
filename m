Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DQMM0bRlWlEVAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 15:48:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 705EB157279
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 15:48:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235656.1538575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsiqc-00070D-4c; Wed, 18 Feb 2026 14:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235656.1538575; Wed, 18 Feb 2026 14:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsiqc-0006yF-07; Wed, 18 Feb 2026 14:48:14 +0000
Received: by outflank-mailman (input) for mailman id 1235656;
 Wed, 18 Feb 2026 14:48:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oIww=AW=citrix.com=abdelkareem.abdelsaamad@srs-se1.protection.inumbo.net>)
 id 1vsiqa-0006y4-G3
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 14:48:12 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.corp.cloud.com
 [160.101.131.8]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7a2748c-0cd8-11f1-b164-2bf370ae4941;
 Wed, 18 Feb 2026 15:48:10 +0100 (CET)
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id DA5AF4147501;
 Wed, 18 Feb 2026 09:47:52 -0500 (EST)
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
X-Inumbo-ID: d7a2748c-0cd8-11f1-b164-2bf370ae4941
From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
To: andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com,
	teddy.astie@vates.tech,
	jbeulich@suse.com,
	jason.andryuk@amd.com,
	Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Subject: [PATCH v4 0/2] Virtual NMI
Date: Wed, 18 Feb 2026 14:47:59 +0000
Message-ID: <cover.1771424278.git.abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:jason.andryuk@amd.com,m:abdelkareem.abdelsaamad@citrix.com,s:lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[abdelkareem.abdelsaamad@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[abdelkareem.abdelsaamad@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_DKIM_NA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:url,gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid]
X-Rspamd-Queue-Id: 705EB157279
X-Rspamd-Action: no action

Currently, the Xen hypervisor delivers NMIs to the guests using the Event
Injection mechanism. The Event Injection mechanism does not block the delivery
of subsequent NMIs. So, the Xen Hypervisor tracks the NMI delivery and its
completion (by intercepting the IRET instruction) before sending a new NMI.

With the 4th generation AMD EPYC, a hardware NMI virtualization support,
Virtual NMI (VNMI), is introduced.  The vNMI allows the hypervisor to inject
the NMI into the guest w/o using Event Injection mechanism. No need to track
the guest NMI and intercepting the IRET instruction.

NMI Virtualization support is indicated by CPUID Fn8000_000A_EDX[VNMI] = 1.[1]

NMI Virtualization is enabled by setting V_NMI_ENABLE (bit 26 in offset 60h
of the VMCB). Enabling NMI Virtualization requires the NMI intercept bit to
be set. An attempt to run a guest with V_NMI_ENABLE without the NMI intercept
bit set results in #VMEXIT(INVALID) [1]

Three new bits are added to the VMCB field at offset 60h to provide NMI
virtualization hardware support:

V_NMI(11): Indicates whether a virtual NMI is pending in the guest. The
processor will clear V_NMI once it takes the virtual NMI.
V_NMI_MASK(12): Indicates whether virtual NMIs are masked. The processor will
set V_NMI_MASK once it takes the virtual NMI. V_NMI_MASK is cleared when the
guest successfully completes an IRET instruction or #VMEXIT occurs while
delivering the virtual NMI.
V_NMI_ENABLE(26): Enables NMI virtualization. [1]

[1] https://docs.amd.com/v/u/en-US/24593_3.43

---
Changes in v4:
 - Delete the changes in svm_get_interrupt_shadow. The vNMI handling for
   multiple\concurrent NMIs should not be considered blocked if vnmi_pending
   and vnmi_blockking are set.
 - Fix formatting indentation in the svm_inject_nmi function.
 - CI tests:
https://gitlab.com/xen-project/people/aabdelsa/xen/-/pipelines/2334257666
---
Changes in v3:
 - Delete the introduced hvm_function_table::vNMI boolean and all the 3 vNMI
   hooks, hvm_function_table::is_vnmi_enabled,
   hvm_function_table::is_vnmi_masked and hvm_function_table::set_vnmi_pending.
 - Use the HVM_INTR_SHADOW_NMI to indicate that the NMI is blocked rather than
   the usage of HVM_INTR_SHADOW_MOV_SS | HVM_INTR_SHADOW_STI.
 - CI tests:
https://gitlab.com/xen-project/people/aabdelsa/xen/-/pipelines/2327265341
---
Changes in v2:
 - Merge the patches for
   "svm/vnmi: introduce the vnmi bit support in the cpuid feature set"
   and
   "svm/vnmi: add the definitions for the svm vnmi management bits in the VMCB"
   into the one patch
   "x86/svm: Add Enumerations for the SVM virtual NMI".
 - Change the patch subject "svm/vnmi: Add support for the SVM Virtual NMI" to
   "x86/svm: Use virtual NMI when available"
 - Move the print out of the VNMI capability to the patch
   "x86/svm: Use virtual NMI when available" when it is being used.
 - Remove the hvm_intblk_vnmi enumeration that was introduced for the separate
   masked vNMI handling.
 - Introduce the hvm_function_table's is_vnmi_enabled callback to allow for the
   SVM implementation to verify that the VNMI is enabled by checking the VMCB
   bits in addition to the CPUID reported support.
 - Change the the name of the hvm_function_table's callback is_vnmi_pending to
   is_vnmi_masked.
 - The svm_inject_nmi function gains a check for the distinct NMI injection
   handling when the VNMI is enabled.
 - Simplify the check of AMD SVM Hardware support for the VNMI. The check
   cpu_has_svm_vnmi is performed unconditionally.
 - Simplify the introduced changes diff for the vintr_t union for the VNMI bits
   support.
 - Adopt the Xen formatting guidelines for the control structures.
 - CI tests:
https://gitlab.com/xen-project/people/aabdelsa/xen/-/pipelines/2325298577
---

Abdelkareem Abdelsaamad (2):
  x86/svm: Add Enumerations for the SVM virtual NMI
  x86/svm: Use the virtual NMI when available

 xen/arch/x86/hvm/svm/intr.c        | 8 ++++++++
 xen/arch/x86/hvm/svm/svm.c         | 1 +
 xen/arch/x86/hvm/svm/vmcb.c        | 2 ++
 xen/arch/x86/hvm/svm/vmcb.h        | 8 ++++++--
 xen/arch/x86/include/asm/hvm/svm.h | 2 ++
 5 files changed, 19 insertions(+), 2 deletions(-)

-- 
2.52.0


