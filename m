Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72887451F9B
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 01:41:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226054.390532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmmXX-0000Zt-6g; Tue, 16 Nov 2021 00:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226054.390532; Tue, 16 Nov 2021 00:41:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmmXX-0000YK-2v; Tue, 16 Nov 2021 00:41:35 +0000
Received: by outflank-mailman (input) for mailman id 226054;
 Tue, 16 Nov 2021 00:41:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G1Gk=QD=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mmmXW-0000Wv-8S
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 00:41:34 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f112a2f2-4675-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 01:41:31 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:36598)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mmmXO-000aIX-mT (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 16 Nov 2021 00:41:26 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 417401FDB0;
 Tue, 16 Nov 2021 00:41:25 +0000 (GMT)
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
X-Inumbo-ID: f112a2f2-4675-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Subject: Re: [PATCH 3/5] xen/sort: Switch to an extern inline implementation
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
 <20211111175740.23480-4-andrew.cooper3@citrix.com>
 <409d2c17-d1e7-40b3-226a-b6ca4c0a15bf@xen.org>
 <alpine.DEB.2.22.394.2111151632160.1412361@ubuntu-linux-20-04-desktop>
From: Andrew Cooper <amc96@srcf.net>
Message-ID: <5816e643-450e-1433-d58c-b12a286fb237@srcf.net>
Date: Tue, 16 Nov 2021 00:41:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2111151632160.1412361@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 16/11/2021 00:36, Stefano Stabellini wrote:
> On Thu, 11 Nov 2021, Julien Grall wrote:
>> On 11/11/2021 17:57, Andrew Cooper wrote:
>>> There are exactly 3 callers of sort() in the hypervisor.
>>>
>>> Both arm callers pass in NULL for the swap function.  While this might seem
>>> like an attractive option at first, it causes generic_swap() to be used
>>> which
>>> forced a byte-wise copy.  Provide real swap functions which the compiler can
>>> optimise sensibly.
>> I understand the theory, but none of the two calls are in hot paths or deal
>> with large set on Arm. So I am rather hesitant to introduce specialised swap
>> in each case as it doesn't seem we will gain much from this change.
> While I like Andrew's optimization, like Julien, I would also rather not
> have to introduce specialized swap functions any time a sort() is
> called. Why not keeping around generic_swap as extern gnu_inline in
> sort.h as well so that the ARM callers can simply:
>
>     sort(bootinfo.mem.bank, bootinfo.mem.nr_banks, sizeof(struct membank),
>          cmp_memory_node, generic_swap);
>
> ?
>
> That looks like a good option, although it would still result in a
> small increase in bloat.

That is basically what Jan suggested.

I'm still unconvinced that you actually want to be doing byte-wise
swapping, even if it isn't a hotpath.  A custom swap function will
compile to less code than using generic_swap() like this, and run faster.

~Andrew

