Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC9045ECCD
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 12:40:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232565.403299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqZZb-0000VW-47; Fri, 26 Nov 2021 11:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232565.403299; Fri, 26 Nov 2021 11:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqZZa-0000OY-Vr; Fri, 26 Nov 2021 11:39:22 +0000
Received: by outflank-mailman (input) for mailman id 232565;
 Fri, 26 Nov 2021 11:39:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3jyU=QN=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mqZZZ-0000Ja-Bt
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 11:39:21 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ce0d088-4ead-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 12:39:18 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:39298)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mqZZN-000VrR-pA (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 26 Nov 2021 11:39:09 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 845941FA77;
 Fri, 26 Nov 2021 11:39:09 +0000 (GMT)
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
X-Inumbo-ID: 7ce0d088-4ead-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <5665bac6-4315-dccc-3a36-5910f5624146@srcf.net>
Date: Fri, 26 Nov 2021 11:39:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <1637880559-28821-1-git-send-email-olekstysh@gmail.com>
 <b51fd518-6c32-c945-d220-f2092ff2666a@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [RFC?] xen/arm: memaccess: Pass struct npfec by reference in
 p2m_mem_access_check
In-Reply-To: <b51fd518-6c32-c945-d220-f2092ff2666a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/11/2021 07:46, Jan Beulich wrote:
> On 25.11.2021 23:49, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Today I noticed a "note" when building Xen on Arm64 with
>> aarch64-poky-linux-gcc (GCC) 9.3.0. It turned out that Andrew Cooper
>> had alredy reported it before [1]:
>>
>> mem_access.c: In function 'p2m_mem_access_check':
>> mem_access.c:227:6: note: parameter passing for argument of type
>> 'const struct npfec' changed in GCC 9.1
>>   227 | bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla,
>>                                   const struct npfec npfec)
>>
>> From the explanation I understand that nothing bad actually is going
>> to happen in our case, it is harmless and shown to only draw our
>> attention that the ABI changed due to bug (with passing bit-fields
>> by value) fixed in GCC 9.1. This information doesn't mean much for us
>> as Xen is an embedded project with no external linkage. But, of course,
>> it would be better to eliminate the note. You can also find related
>> information about the bug at [2].
>>
>> So make the note go away by passing bit-fields by reference.
>>
>> [1] https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg87439.html
>> [2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88469
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>> Compile-tested only.
>> ---
>>  xen/arch/arm/mem_access.c        | 28 ++++++++++++++--------------
>>  xen/arch/arm/traps.c             |  2 +-
>>  xen/include/asm-arm/mem_access.h |  2 +-
>>  3 files changed, 16 insertions(+), 16 deletions(-)
> It's all Arm code, so I'm not the one to judge, but I'd like to recommend
> to live with the note or convince distros to backport the gcc side fix.
> This definitely was a compiler flaw; see
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91710.

I too would recommend just living with the note.  The code change
proposed is a backwards step in terms of runtime complexity - you're now
passing around a pointer to 7 bits of information, which the compiler
cannot pull into a local because of C's aliasing rules.  At a guess, the
very best an optimising compiler could do is turn it into only two
dereferences of the pointer.

~Andrew

