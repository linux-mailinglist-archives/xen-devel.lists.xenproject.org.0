Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8018F506BFF
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 14:12:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308079.523598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngmii-0003Kz-O4; Tue, 19 Apr 2022 12:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308079.523598; Tue, 19 Apr 2022 12:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngmii-0003Ik-LD; Tue, 19 Apr 2022 12:12:36 +0000
Received: by outflank-mailman (input) for mailman id 308079;
 Tue, 19 Apr 2022 12:12:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dp8H=U5=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1ngmih-0003Ie-II
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 12:12:35 +0000
Received: from ppsw-41.csi.cam.ac.uk (ppsw-41.csi.cam.ac.uk [131.111.8.141])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7fde820-bfd9-11ec-8fbe-03012f2f19d4;
 Tue, 19 Apr 2022 14:12:23 +0200 (CEST)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:56344)
 by ppsw-41.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1ngmiN-000usy-QF (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 19 Apr 2022 13:12:15 +0100
Received: from [192.168.1.10] (host-92-26-109-251.as13285.net [92.26.109.251])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 7565F1FAD5;
 Tue, 19 Apr 2022 13:12:14 +0100 (BST)
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
X-Inumbo-ID: f7fde820-bfd9-11ec-8fbe-03012f2f19d4
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <8fbbd4ca-54b1-8c1c-19bc-3d0e6044ff5d@srcf.net>
Date: Tue, 19 Apr 2022 13:12:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 06/25] x86/xen: Add ANNOTATE_ENDBR to startup_xen()
Content-Language: en-GB
To: Peter Zijlstra <peterz@infradead.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1650300597.git.jpoimboe@redhat.com>
 <a87bd48b06d11ec4b98122a429e71e489b4e48c3.1650300597.git.jpoimboe@redhat.com>
 <b94cbac6-0a4d-8e4a-ec58-bbd46e385d45@citrix.com>
 <20220419115737.GU2731@worktop.programming.kicks-ass.net>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20220419115737.GU2731@worktop.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/04/2022 12:57, Peter Zijlstra wrote:
> On Tue, Apr 19, 2022 at 11:42:12AM +0000, Andrew Cooper wrote:
>> On 18/04/2022 17:50, Josh Poimboeuf wrote:
>>> The startup_xen() kernel entry point is referenced by the ".note.Xen"
>>> section, but is presumably not indirect-branched to.
>> It's the real entrypoint of the VM.  It's "got to" by setting %rip
>> during vcpu setup.
>>
>> We could in principle support starting a PV VM with CET active, but that
>> sounds like an enormous quantity of effort for very little gain.  CET
>> for Xen PV requires paravirt anyway (because the kernel runs in CPL!=0)
>> so decisions like this can wait until someone feels like doing the work.
>>
>>>   Add ANNOTATE_ENDBR
>>> to silence future objtool warnings.
>>>
>>> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>>> Cc: Juergen Gross <jgross@suse.com>
>>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>>> Cc: xen-devel@lists.xenproject.org
>>> Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
>> FWIW, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, preferably
>> with the commit message tweaked to remove the uncertainty.
> Something like so then?
>
> ---
> Subject: x86/xen: Add ANNOTATE_ENDBR to startup_xen()
> From: Josh Poimboeuf <jpoimboe@redhat.com>
> Date: Mon, 18 Apr 2022 09:50:25 -0700
>
> From: Josh Poimboeuf <jpoimboe@redhat.com>
>
> The startup_xen() kernel entry point is referenced by the ".note.Xen"
> section, and is the real entry point of the VM. It *will* be
> indirectly branched to, *however* currently Xen doesn't support PV VM
> with CET active.

Technically it's always IRET'd to, but the point is that it's never
"branched to" by the execution context of the VM.

So it would be better to say that it's never indirectly branched to. 
That's what the IBT checks care about.

>
> Add ANNOTATE_ENDBR to silence future objtool warnings.

Only just spotted.  All text in the subject and commit message needs
s/ENDBR/NOENDBR/

~Andrew

