Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHEsOX54jGktpAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 13:39:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D5212467F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 13:39:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227555.1533975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9Uy-0000m9-NJ; Wed, 11 Feb 2026 12:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227555.1533975; Wed, 11 Feb 2026 12:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9Uy-0000kt-JA; Wed, 11 Feb 2026 12:39:16 +0000
Received: by outflank-mailman (input) for mailman id 1227555;
 Wed, 11 Feb 2026 12:39:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DopK=AP=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1vq9No-0001nh-6p
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 12:31:52 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3036b3f-0745-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 13:31:50 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 99D1D40299;
 Wed, 11 Feb 2026 12:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97BBC19421;
 Wed, 11 Feb 2026 12:31:47 +0000 (UTC)
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
X-Inumbo-ID: a3036b3f-0745-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770813108;
	bh=W8TRYpIoLHSafIBZHOcM/I2GuwyMlNQIh5ra5DvldiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cb7kHJkpaJ+oF+1f0CI3Mnyrqme7h5dxui+DjsIxmnEZW7mTlF/jmxrWKSvqSB8bk
	 lm+UbBPnB/JSpWjVMpSA2B0R+LDMFuttB3WUSlm01BXlrJgo2otYjbK4Qrr068GnE/
	 bfyZybUW5fYfuhOS2tuKFjIW7ZwvE6/D8ExH+b55IJPMyILuCWwJNYa8ZRIRx+gB7t
	 7edcfcwwlWRh/ykHE2Hnm1NXwNxIozHhx8W5ulpXzaTs+8sOfoh7T1V2o4iUVqOh4i
	 arUg5WZuG2eChvLuYEf+kb7lXO8sz//PyK8vgEuWcHyP51ejBWQgJC62hNGZTIBusb
	 8C0+5IHM0A1IA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Hou Wenlong <houwenlong.hwl@antgroup.com>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 6.19-5.10] x86/xen/pvh: Enable PAE mode for 32-bit guest only when CONFIG_X86_PAE is set
Date: Wed, 11 Feb 2026 07:30:28 -0500
Message-ID: <20260211123112.1330287-18-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260211123112.1330287-1-sashal@kernel.org>
References: <20260211123112.1330287-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:patches@lists.linux.dev,m:stable@vger.kernel.org,m:houwenlong.hwl@antgroup.com,m:jgross@suse.com,m:sashal@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,antgroup.com:email,suse.com:email];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[sashal@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 86D5212467F
X-Rspamd-Action: no action

From: Hou Wenlong <houwenlong.hwl@antgroup.com>

[ Upstream commit db9aded979b491a24871e1621cd4e8822dbca859 ]

The PVH entry is available for 32-bit KVM guests, and 32-bit KVM guests
do not depend on CONFIG_X86_PAE. However, mk_early_pgtbl_32() builds
different pagetables depending on whether CONFIG_X86_PAE is set.
Therefore, enabling PAE mode for 32-bit KVM guests without
CONFIG_X86_PAE being set would result in a boot failure during CR3
loading.

Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Message-ID: <d09ce9a134eb9cbc16928a5b316969f8ba606b81.1768017442.git.houwenlong.hwl@antgroup.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have all the information needed for a complete analysis.

---

## Detailed Analysis

### 1. Commit Message Analysis

The subject clearly states the problem: PAE mode is being
unconditionally enabled for all PVH guests, but for 32-bit guests it
should only be enabled when `CONFIG_X86_PAE` is set. The commit message
explicitly describes a **boot failure** scenario: loading CR3 fails when
the page table format doesn't match the CPU's paging mode expectation.

The commit is:
- Reviewed by Juergen Gross (Xen subsystem maintainer)
- Signed off by Juergen Gross (subsystem maintainer sign-off)

### 2. Code Change Analysis

**The Bug Mechanism:**

The PVH entry path in `arch/x86/platform/pvh/head.S` is the boot entry
point for PVH (Para-Virtualized Hardware) guests, used by Xen and KVM.
The flow is:

1. **Line 94-97** (before fix): PAE mode is unconditionally enabled in
   CR4:

```94:97:arch/x86/platform/pvh/head.S
        /* Enable PAE mode. */
        mov %cr4, %eax
        orl $X86_CR4_PAE, %eax
        mov %eax, %cr4
```

2. For **64-bit** guests (`CONFIG_X86_64`), this is correct — PAE is
   always needed as a prerequisite for long mode (line 99-104).

3. For **32-bit** guests (the `#else` path starting at line 196), the
   code calls `mk_early_pgtbl_32()` to build early page tables:

```196:205:arch/x86/platform/pvh/head.S
#else /* CONFIG_X86_64 */

        call mk_early_pgtbl_32

        mov $_pa(initial_page_table), %eax
        mov %eax, %cr3

        mov %cr0, %eax
        or $(X86_CR0_PG | X86_CR0_PE), %eax
        mov %eax, %cr0
```

4. `mk_early_pgtbl_32()` in `arch/x86/kernel/head32.c` builds
   **fundamentally different** page table structures depending on
   `CONFIG_X86_PAE`:

```95:103:arch/x86/kernel/head32.c
#ifdef CONFIG_X86_PAE
typedef pmd_t                   pl2_t;
#define pl2_base                initial_pg_pmd
#define SET_PL2(val)            { .pmd = (val), }
#else
typedef pgd_t                   pl2_t;
#define pl2_base                initial_page_table
#define SET_PL2(val)            { .pgd = (val), }
#endif
```

   - With `CONFIG_X86_PAE`: Builds **3-level PAE page tables**
     (PGDIR_SHIFT=30, uses PMDs + PDPTEs)
   - Without `CONFIG_X86_PAE`: Builds **2-level non-PAE page tables**
     (PGDIR_SHIFT=22, uses PGDs directly)

**The crash**: When PAE is enabled in CR4 but non-PAE page tables are
loaded into CR3, the CPU interprets the 2-level page directory as a PAE
PDPT (Page Directory Pointer Table). When paging is activated
(CR0.PG=1), the processor tries to load the PDPTE entries from the
address in CR3. The non-PAE page directory entries are completely
incompatible with PAE PDPTE format, causing a **#GP fault or triple
fault**, resulting in an immediate boot failure.

**The Fix:** Simply wrapping the PAE enablement with proper `#ifdef`
guards:

```asm
#if defined(CONFIG_X86_64) || defined(CONFIG_X86_PAE)
        /* Enable PAE mode. */
        mov %cr4, %eax
        orl $X86_CR4_PAE, %eax
        mov %eax, %cr4
#endif
```

This ensures PAE is only enabled when:
- `CONFIG_X86_64` is set (64-bit always needs PAE for long mode), or
- `CONFIG_X86_PAE` is set (32-bit with PAE — page tables match)

Note that the 32-bit path at lines 212-220 already has code to disable
PAE before jumping to `startup_32`, which confirms the original author
was aware that PAE and non-PAE modes exist, but the initial enablement
was not properly guarded.

### 3. Classification

This is a **boot failure fix**. It's not a feature, cleanup, or
optimization. It fixes a configuration where a 32-bit PVH guest without
`CONFIG_X86_PAE` completely fails to boot.

### 4. Scope and Risk Assessment

- **Lines changed**: 2 lines added (`#if defined(...)` and `#endif`), 0
  lines removed
- **Files touched**: 1 (`arch/x86/platform/pvh/head.S`)
- **Complexity**: Minimal — conditional compilation guard
- **Risk**: Extremely low
  - For `CONFIG_X86_64`: No change (the `#if` is always true)
  - For `CONFIG_X86_32` with `CONFIG_X86_PAE`: No change (the `#if` is
    true)
  - For `CONFIG_X86_32` without `CONFIG_X86_PAE`: PAE is no longer
    enabled, matching the page table format — this is the bug fix
- **Regression potential**: Near zero. The only behavioral change is for
  the broken configuration that currently crashes.

### 5. User Impact

- **Who is affected**: Anyone running a 32-bit kernel without PAE as a
  PVH/KVM guest. This is a legitimate configuration since `config PVH`
  has no dependency on `CONFIG_X86_PAE` or `CONFIG_X86_64`.
- **Severity**: Complete boot failure — the system cannot boot at all
- **Workaround**: Users must enable `CONFIG_X86_PAE` for 32-bit PVH
  guests, which may not be obvious and adds unnecessary configuration
  constraints

### 6. Stability Indicators

- **Reviewed-by**: Juergen Gross (Xen subsystem maintainer) — very
  strong indicator
- **Signed-off-by**: Juergen Gross (accepted through the Xen tree)
- The fix is trivially correct by inspection — when `CONFIG_X86_PAE` is
  not set, enabling PAE in CR4 is wrong because the page tables aren't
  in PAE format

### 7. Dependency Check

- **No dependencies** on other patches — this is a completely self-
  contained fix
- The affected code (`pvh_start_xen` with the unconditional PAE
  enablement) exists in **all current stable trees** (confirmed present
  from v5.4 through v6.12)
- The fix context is slightly different in older stable trees (e.g.,
  `rep\n       movsl` vs `rep movsl`, PIC vs absolute addressing), so
  minor backport adjustments may be needed for older trees, but the fix
  itself (adding `#if`/`#endif` around the PAE lines) is trivial to
  adapt

### 8. Conclusion

This is a textbook stable kernel fix:
- **Fixes a real, severe bug**: Complete boot failure for a valid kernel
  configuration
- **Obviously correct**: The fix is a 2-line conditional compilation
  guard that makes PAE enablement match page table format
- **Small and contained**: 2 lines added to 1 file
- **No new features**: Just correctness fix
- **No risk of regression**: Only changes behavior for the currently-
  broken configuration
- **Present in all stable trees**: The bug has existed since the
  original PVH commit (v4.11, 2017)
- **Reviewed by subsystem maintainer**: Juergen Gross

**YES**

 arch/x86/platform/pvh/head.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index 344030c1a81d4..53ee2d53fcf8e 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -91,10 +91,12 @@ SYM_CODE_START(pvh_start_xen)
 
 	leal rva(early_stack_end)(%ebp), %esp
 
+#if defined(CONFIG_X86_64) || defined(CONFIG_X86_PAE)
 	/* Enable PAE mode. */
 	mov %cr4, %eax
 	orl $X86_CR4_PAE, %eax
 	mov %eax, %cr4
+#endif
 
 #ifdef CONFIG_X86_64
 	/* Enable Long mode. */
-- 
2.51.0


