Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4495C0A07B
	for <lists+xen-devel@lfdr.de>; Sat, 25 Oct 2025 23:52:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1151162.1481928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCmAI-0007ur-Gw; Sat, 25 Oct 2025 21:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151162.1481928; Sat, 25 Oct 2025 21:51:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCmAI-0007sM-Db; Sat, 25 Oct 2025 21:51:10 +0000
Received: by outflank-mailman (input) for mailman id 1151162;
 Sat, 25 Oct 2025 13:47:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rCcB=5C=failmail.dev=patrick@srs-se1.protection.inumbo.net>)
 id 1vCebk-0001KO-SQ
 for xen-devel@lists.xen.org; Sat, 25 Oct 2025 13:47:00 +0000
Received: from failmail.dev (failmail.dev [162.55.49.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 100f32b9-b1a9-11f0-980a-7dc792cee155;
 Sat, 25 Oct 2025 15:46:53 +0200 (CEST)
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
X-Inumbo-ID: 100f32b9-b1a9-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; s=rsa_default; d=failmail.dev; c=relaxed/relaxed; r=y;
	h=Subject:From:To:Date:Message-ID; t=1761399891; bh=BpAzC6KqIFyvNtFl55X1Ecu
	3ee15Bu1PFYWXuX/7qXE=; b=VF+V2Ha9ChWjTi3OitXixXe9x+Kt9TpmzRdevxWob3IboTo4yB
	K6oZYgmODKPTZXDy4qPJORspMGoPj9fNnGanbkGKDfm47gA679begvzO8ah5RpA0ZIlo8792Pdn
	3jA8dWMgKCw5Srb+yLIHoNn/39doLMOZsWtOroO1xBufHIBYfmz3vro79RWL3xBizTL6zhPjOuS
	Ws/JaMpg3KK3fUmm3pkbN+EtPNswG/wwINu7rzg2YH683T8h6A04Vq0PPgtK5Ff+jUvHGaOsxvt
	c2daZGOQlGc/86xO6laSfWxxgDcL/jv+14bUwCTbWaLnJ83xfTpvZth+UKPqH4/o4jw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=ed_default; d=failmail.dev; c=relaxed/relaxed; r=y;
	h=Subject:From:To:Date:Message-ID; t=1761399891; bh=BpAzC6KqIFyvNtFl55X1Ecu
	3ee15Bu1PFYWXuX/7qXE=; b=s4PNiwtqa4hcz0EmNJrdVkBBZ2Mh0Y52j8kMordcOU02MYNl/p
	ZbAMNdQFtPKK8WC5y8DonYJAz5fOy4bwoDCQ==;
Message-ID: <ab3a978a-2088-4a39-a4c1-822ae5050fe6@failmail.dev>
Date: Sat, 25 Oct 2025 13:44:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: xen-devel@lists.xen.org
From: Patrick <patrick@failmail.dev>
Content-Language: en-US
Subject: [BUG]: Crashing Xen when nestedhvm is enabled
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear all,

I think I have found a way for a guest to crash the hypervisor,
when hardware nesting is enabled and we are running on Intel using VMX.

This is done by executing the following steps in the non nested guest:

- Enable VMX and set a vmcs active
- Override the revision id of the active vmcs using memory access to any invalid id
- call vmwrite to write the `MSR_BITMAP`

Basically this:
```C
vmxon();
vmcs = alloc();
*(uint32_t*)vmcs = correct_vmcs_revision_id;
vmptrld(vmcs);
*vmcs = invalide_vmcs_revision_id;
vmwrite(MSR_BITMAP, NULL);
```

The `vmptrld` will set the provided vmcs as the link pointer as seen in
`xen/arch/x86/hvm/vmx/vvmx.c:1834`
```
if ( cpu_has_vmx_vmcs_shadowing )
    nvmx_set_vmcs_pointer(v, nvcpu->nv_vvmcx);
```

If the guest now calls `VMWRITE` it will access that vmcs directly,
execpt if writing/reading the `IO_BITMAP` or the `MSR_BITMAP`

`xen/arch/x86/hvm/vmx/vvmx.c:107`
```
/*
* For the following 6 encodings, we need to handle them in VMM.
* Let them vmexit as usual.
*/
set_bit(IO_BITMAP_A, vw);
set_bit(VMCS_HIGH(IO_BITMAP_A), vw);
set_bit(IO_BITMAP_B, vw);
set_bit(VMCS_HIGH(IO_BITMAP_B), vw);
set_bit(MSR_BITMAP, vw);
set_bit(VMCS_HIGH(MSR_BITMAP), vw);
```

If we now execute `vmwrite(MSR_BITMAP, 0)` in the guest it will execute this stack:
```
nvmx_handle_vmwrite
set_vvmcs_safe
set_vvmcs_real_safe
virtual_vmcs_vmwrite_safe
virtual_vmcs_enter
__vmptrld
```
The vmcs pointer being loaded in the last step being the one supplied by the guest
that has been overwritten.
Since we have overwritten the `vmcs_revision_id` the hardware will reject the vmptrld, which
will call `BUG()`.

---
A secondary similar bug happens when calling `VMXOFF` while a shadow vmcs is active.
This will not clear the shadow vmcs, and crash the guest if it ever writes to the vmcs again.
Effectively locking the page of being modified until a new vmcs is set active.
This should be fixed by applying this patch:

diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 2432af58e0..3895dd158a 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1589,6 +1589,8 @@ static int nvmx_handle_vmxoff(struct cpu_user_regs *regs)
     struct vcpu *v=current;
     struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
 
+	if ( cpu_has_vmx_vmcs_shadowing )
+		nvmx_clear_vmcs_pointer(v, nvcpu->nv_vvmcx);
     nvmx_purge_vvmcs(v);
     nvmx->vmxon_region_pa = INVALID_PADDR;

As far as I have read it is not specifically stated in the Intel SDM that a VMXOFF clears the active vmcs, however it
does also not state anything otherwise and I thinks it's saner to clear it than to crash the guest because of an
vmcs error, when it has vmx disabled.
 


