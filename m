Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 310695F25EC
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 00:21:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414714.659084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1of7KG-00063J-2u; Sun, 02 Oct 2022 22:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414714.659084; Sun, 02 Oct 2022 22:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1of7KG-0005zv-09; Sun, 02 Oct 2022 22:20:44 +0000
Received: by outflank-mailman (input) for mailman id 414714;
 Sun, 02 Oct 2022 22:20:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=STlk=2D=runbox.com=m.v.b@srs-se1.protection.inumbo.net>)
 id 1of7KE-0005kR-2x
 for xen-devel@lists.xenproject.org; Sun, 02 Oct 2022 22:20:42 +0000
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com
 [2a0c:5a00:149::25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71b0edbf-42a0-11ed-964a-05401a9f4f97;
 Mon, 03 Oct 2022 00:20:39 +0200 (CEST)
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
 by mailtransmit04.runbox.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <m.v.b@runbox.com>)
 id 1of7KA-009okT-24; Mon, 03 Oct 2022 00:20:38 +0200
Received: from [10.9.9.74] (helo=submission03.runbox)
 by mailtransmit03.runbox with esmtp (Exim 4.86_2)
 (envelope-from <m.v.b@runbox.com>)
 id 1of7K9-0005p1-PJ; Mon, 03 Oct 2022 00:20:37 +0200
Received: by submission03.runbox with esmtpsa [Authenticated ID (536975)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1of7Jw-00061b-Fs; Mon, 03 Oct 2022 00:20:24 +0200
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
X-Inumbo-ID: 71b0edbf-42a0-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=wdiqOw82kPT1f9ktexLlKmUwEG+CKPWabDmPDS+O5k4=; b=wYPGzt
	cVD85qsBwNR5V3UzKo6NABK2mV5YimckAEe1rJn6C58rw3Um+9f1iSq6b14BgGk32a7OnRA4oommC
	tH29aMsQOWFTsWz+OI+QT7zDoc0hEYBI3krmBwjwvEJbJOP3JncutshClTuhBC+npxsobKszlFrkE
	x6CwGXPkumXI3ZtLiRa56HwnEBRRlI1+Dw26cXCtY6UHng4dhi9l0XNKRMbpicpJW7Utc4wJa9E2w
	UiUjTsM2sAGAfP9oVbunQrsrDDh0I1w92ZjKrffOLhyGVyVasenvTwHGGvbrXgGA+46aWj/YMNGoB
	1HriGkKs66eEe6hIEHAPMqlh+X4A==;
From: "M. Vefa Bicakci" <m.v.b@runbox.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: m.v.b@runbox.com,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 0/2] xen/gntdev: Fixes for leaks and VMA splitting
Date: Sun,  2 Oct 2022 18:20:04 -0400
Message-Id: <20221002222006.2077-1-m.v.b@runbox.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

First of all, sorry for the delay!

These patches continue the code review for the following patches:
  https://lore.kernel.org/xen-devel/20220912040002.198191-1-m.v.b@runbox.com/t/#u

The original description of the patch set is as follows:

  "The changes in this patch series intend to fix the Xen grant device
  driver, so that grant mapping leaks caused by partially failed grant
  mapping operations are avoided with the first patch, and so that the
  splitting of VMAs does not result in incorrectly unmapped grant pages
  with the second patch. The second patch also prevents a similar issue
  in a double-mapping scenario, where mmap() is used with MAP_FIXED to
  map grants over an existing mapping created with the same grants, and
  where grant pages are unmapped incorrectly as well."

A summary of the changes from v1 is as follows:
- Addressed Juergen's code review comment regarding the first patch.
- Amended the description of the second patch to note that the described
  issues are encountered with PV domains.

Verification notes:

- I have tested these commits on top of Linux v5.15.70 and v5.15.71, and
  I verified that they compile successfully on top of the tag
  "next-20220930", which corresponds to the base commit ID included at
  the bottom of this e-mail.

- My tests consist of using a kernel with Qubes OS v4.1's patches and
  these patches on my main computer for day-to-day tasks, in conjunction
  with Qubes OS's version of the Xen hypervisor v4.14.5, with the latter
  custom-compiled with CONFIG_DEBUG.

- I used a test program that verifies the following scenarios with an
  unprivileged paravirtualized (PV) Xen domain:

  - A program mmap()s two pages from another Xen domain and munmap()s
    the pages one by one. This used to result in implicit unmap errors
    to be reported by Xen and a general protection fault to be triggered
    by Xen in the affected domain, but now works as expected.
  - A program mmap()s two pages from another Xen domain and then
    attempts to remap (via MAP_FIXED) the same mapping again over the
    same virtual address. This used to result in similar issues
    (implicit unmap errors and general protection fault), but now is
    rejected by the kernel.
  - A program mmap()s two pages from another Xen domain and then
    attempts to mmap() the same mapping again to a different virtual
    address, by passing NULL as mmap()'s first argument. This used to be
    rejected by the kernel, and it continues to be rejected by the
    kernel.

- Unprivileged PVH Xen domains were also sanity tested with the same
  test program. I should note that PVH domains worked as expected
  without these patches too.

- Finally, I have verified that the original "g.e. 0x1234 still pending"
  issue does not appear after rapidly resizing GUI windows in Qubes OS
  v4.1.

Thank you,

Vefa

M. Vefa Bicakci (2):
  xen/gntdev: Prevent leaking grants
  xen/gntdev: Accommodate VMA splitting

 drivers/xen/gntdev-common.h |  3 +-
 drivers/xen/gntdev.c        | 80 +++++++++++++++++++------------------
 2 files changed, 44 insertions(+), 39 deletions(-)


base-commit: 274d7803837da78dfc911bcda0d593412676fc20
-- 
2.37.3


