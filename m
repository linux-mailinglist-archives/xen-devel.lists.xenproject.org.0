Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 459841CF211
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 12:02:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYRiB-0003cM-9H; Tue, 12 May 2020 10:00:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qSkR=62=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jYRiA-0003cH-Bk
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 10:00:30 +0000
X-Inumbo-ID: 68a9c2e6-9437-11ea-a289-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 68a9c2e6-9437-11ea-a289-12813bfff9fa;
 Tue, 12 May 2020 10:00:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EEC04AA55;
 Tue, 12 May 2020 10:00:30 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: odd pte_mfn_to_pfn() behavior
Message-ID: <b4c54557-e91a-adf4-8506-02dcc2b81f63@suse.com>
Date: Tue, 12 May 2020 12:00:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jürgen, Boris,

in figuring out why a W+X mapping warning has magically disappeared
(I now at least know that it was for the shared info fixmap page)
in 5.6, besides finding two logic errors in 2ae27137b2db ("x86: mm:
convert dump_pagetables to use walk_page_range") - one in the way
st->prot_levels[] gets maintained, the other it truncating 64-bit
PAE PTEs to 32 bits when calling note_page() - I've also noticed
that the observed (in note_page()) PTE for the shared info page is
now 0x62 (not present, PFN 0). Up to 5.5, only the PTE flags were
involved, and pte_flags() behaves better than pte_val() for this
particular PTE - pte_mfn_to_pfn() zaps _PAGE_PRESENT and the frame
number when it can't translate the MFN to a PFN.

Presumably this behavior is acceptable in most cases, but it
clearly is wrong here and would - even with aforementioned bugs
addressed - still prevent the W+X warning to reappear. I have no
idea whether it would be acceptable for the generic framework to
be changed to use pte_flags() again instead of pte_val().

Having looked at this code (and the prior logic) I have to admit
that I haven't been able to figure yet why I've seen these W+X
mapping warnings for the shared info page only ever on 32-bit.

Jan

