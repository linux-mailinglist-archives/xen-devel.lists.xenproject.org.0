Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFED56798A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 23:50:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361626.591234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8qR5-0007zd-1b; Tue, 05 Jul 2022 21:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361626.591234; Tue, 05 Jul 2022 21:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8qR4-0007xp-V5; Tue, 05 Jul 2022 21:50:22 +0000
Received: by outflank-mailman (input) for mailman id 361626;
 Tue, 05 Jul 2022 21:50:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o8qR3-0007xh-F1
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 21:50:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8qR2-0006Pe-Tu; Tue, 05 Jul 2022 21:50:20 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8qR2-0007YC-ON; Tue, 05 Jul 2022 21:50:20 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=7306w47pqjFIkVP2a5AFzWOidnDcnkqSr12fl/9Lq1o=; b=Wn/WDiNH+JujKuNl0GEMamscVX
	B273bC9H05wsgaGkyKeeoHvYxeY2Omzbbyc0VMQjFUOeo/KWjNogveBgjEYBKxzCs1kIYvcc6N3he
	jp3wX5mOgoFV9zjwGoUGSLf9LI2kwwb7kQsqSAaqxLqmVSTHF23sH9pCncwwztHQUg+E=;
Message-ID: <e4783ebd-6922-7b14-081f-9224c9e54763@xen.org>
Date: Tue, 5 Jul 2022 22:50:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <79ebbde2-4be8-d393-476d-25326a2aa327@suse.com>
 <9916754f-b730-6201-5225-167995f69b51@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] EFI: strip xen.efi when putting it on the EFI partition
In-Reply-To: <9916754f-b730-6201-5225-167995f69b51@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05/07/2022 17:03, Jan Beulich wrote:
> On 09.06.2022 17:52, Jan Beulich wrote:
>> With debug info retained, xen.efi can be quite large. Unlike for xen.gz
>> there's no intermediate step (mkelf32 there) involved which would strip
>> debug info kind of as a side effect. While the installing of xen.efi on
>> the EFI partition is an optional step (intended to be a courtesy to the
>> developer), adjust it also for the purpose of documenting what distros
>> would be expected to do during boot loader configuration (which is what
>> would normally put xen.efi into the EFI partition).
>>
>> Model the control over stripping after Linux'es module installation,
>> except that the stripped executable is constructed in the build area
>> instead of in the destination location. This is to conserve on space
>> used there - EFI partitions tend to be only a few hundred Mb in size.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> GNU strip 2.38 appears to have issues when acting on a PE binary:
>> - file name symbols are also stripped; while there is a separate
>>    --keep-file-symbols option (which I would have thought to be on by
>>    default anyway), its use so far makes no difference,
>> - the string table grows in size, when one would expect it to retain its
>>    size (or shrink),
>> - linker version is changed in and timestamp zapped from the header.
>> Older GNU strip (observed with 2.35.1) doesn't work at all ("Data
>> Directory size (1c) exceeds space left in section (8)").
>>
>> Future GNU strip is going to honor --keep-file-symbols (and will also
>> have the other issues fixed). Question is whether we should use that
>> option (for the symbol table as a whole to make sense), or whether
>> instead we should (by default) strip the symbol table as well.
> 
> Without any feedback / ack I guess I'll consider this of no interest
> (despite having heard otherwise, triggering me to put together the
> patch in the first place), and put on the pile of effectively
> rejected patches.

Sorry, I haven't looked at this patch because I am not very familiar 
with the Makefile code. Reading through the commit message, I think 
having this patch would be quite beneficial.

Regarding the review, Anthony has been working on the build system 
recently. So maybe he could give a review? (I have CCed him).

Cheers,

-- 
Julien Grall

