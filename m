Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2805F815823
	for <lists+xen-devel@lfdr.de>; Sat, 16 Dec 2023 08:03:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655452.1023217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEOgP-0003Ov-Qm; Sat, 16 Dec 2023 07:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655452.1023217; Sat, 16 Dec 2023 07:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEOgP-0003MM-O0; Sat, 16 Dec 2023 07:01:57 +0000
Received: by outflank-mailman (input) for mailman id 655452;
 Sat, 16 Dec 2023 07:01:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7H9O=H3=neowutran.ovh=xen@srs-se1.protection.inumbo.net>)
 id 1rEOgN-0003MG-Or
 for xen-devel@lists.xenproject.org; Sat, 16 Dec 2023 07:01:56 +0000
Received: from neowutran.ovh (core.neowutran.ovh [51.83.40.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd15b35c-9be0-11ee-9b0f-b553b5be7939;
 Sat, 16 Dec 2023 08:01:51 +0100 (CET)
Received: from neowutran.ovh (maisonhome.neowutran.ovh [82.65.3.49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by neowutran.ovh (Postfix) with ESMTPSA id 53AD26107A
 for <xen-devel@lists.xenproject.org>; Sat, 16 Dec 2023 07:01:50 +0000 (UTC)
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
X-Inumbo-ID: fd15b35c-9be0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=neowutran.ovh; s=mail;
	t=1702710110; bh=Aovk/JMxhTbP1pVB4wFTtzzp3nMrjuWwL/mImbaWQhQ=;
	h=Date:From:To:Subject;
	b=lyTxb5Th4D1DMJYoDji0A/RDCPtAgskTsEh1S/vPObes/ejsBbBMLoywkcu9sMJ8V
	 3HMNvz92yRxQ7Q1iYtPTQMbCxMs6qd18Et5jv3TALzCi9TmS8VZieyox/JLZTM9Im+
	 2PwEazAG+HXccocC24MnqwLkPMbtDC4RuSRg9J/Tc+UkIjNaRZ/0XuMFH5upge6Ll2
	 7uOQGnJY2WKRpjzxF5OLP6I05qmXqxIkhtRdwixOdwFWmBO7a/zWNCMR+pkxhe+HcY
	 o5sPv+2xi3wItcPXXGcVxk77Xn03T8g+UZom6LbZeTiSrhuSNh77S0/N8DxQBCyiih
	 ApOtzjOB1lnagOTr8Ni2vh+fpoG0dID2v9rIORArwzDutAVwe7W/TKe3K85//t1XI6
	 LCwshhmqfHIJlEEM86al8m7HL1BekuepjMw0YrXMJ0V8Zd+c+LycZ0dCuPVPDLxMDw
	 zmPMKEZjpYN+e7J9QAjsgHLk+Ft2xakRB9d3pEtEVrYJQH6/VCcLEBrJLR8om1AMow
	 MDAm2eoALJRdsrrtY/3NBVHApzl4ksI7hbIkL3Wh5SoCG+Wfds0b7gnSiu3uow5Zx4
	 dR1BcGvkscW4KOLxvJlHMGFtMhvCtWlIRxxHKxGhwW0aJ3LVWr4Wtn4qWHn+Rl881w
	 956QYWJkHfUs3Yl09FXJ5bt0=
Date: Sat, 16 Dec 2023 08:01:32 +0100
From: Neowutran <xen@neowutran.ovh>
To: xen-devel@lists.xenproject.org
Subject: hvmloader - allow_memory_relocate overlaps
Message-ID: <7oe275z3eap7rhdwmrm4mvqnjnhrpag5cjwnfvwsf7rchhkyjv@pd3abzwdhg6v>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

I am wondering if the variable "allow_memory_relocate" is still
relevant today and if its default value is still relevant. 
Should it be defined to 0 by default instead of 1 (it seems to be a
workaround for qemu-traditional, so maybe an outdated default value ? ) ? 

Code extract: 

tools/firmware/hvmloader/pci.c 
"
   /*
     * Do we allow hvmloader to relocate guest memory in order to
     * increase the size of the lowmem MMIO hole?  Defaulting to 1
     * here will
 mean that non-libxl toolstacks (including xend and
     * home-grown ones) means that those using qemu-xen will still
     * experience the memory relocation bug described below; but it
     * also means that those using q 
emu-traditional will *not*
     * experience any change; and it also means that there is a
     * work-around for those using qemu-xen, namely switching to
     * qemu-traditional.
     *
     * If we defaulted to 0, and failing to resize the hole caused any
     * problems with qemu-traditional, then there is no work-around.
     *
     * Since xend can only use qemu-traditional, I think this is the
     * option that will have the least impact.
     */
    bool allow_memory_relocate = 1;
"

"
        /*
         * At the moment qemu-xen can't deal with relocated memory regions.
         * It's too close to the release to make a proper fix; for now,
         * only allow t
he MMIO hole to grow large enough to move guest memory
         * if we're running qemu-traditional.  Items that don't fit will be
         * relocated into the 64-bit address space.
         *
         * This loop now does the following:
         * - If allow_memory_relocate, increase the MMIO hole until it's
         *   big enough, or  
until it's 2GiB
         * - If !allow_memory_relocate, increase the MMIO hole until it's
         *   big enough, or until it's 2GiB, or until it overlaps guest
         *   memory
         */
        while ( (mmio_total > (pci_mem_end - pci_mem_start))
                && ((pci_mem_start << 1) != 0)
                && (allow_memory_relocate
                    || (((pci_mem_start << 1) >> PAGE_SHIFT)
                        >= hvm_info->low_mem_pgend)) )
            pci_mem_start <<= 1;
"

The issue it cause is documented in the source code: guest memory can
be trashed by the hvmloader. 

Due to this issue, it is impossible to passthrough a large PCI device to a HVM with a lot of ram.
(https://github.com/QubesOS/qubes-issues/issues/4321). 

(Forcing "allow_memory_relocate" to be 0 seems to solve the issue
linked)



Thanks, 
Neowutran
 

