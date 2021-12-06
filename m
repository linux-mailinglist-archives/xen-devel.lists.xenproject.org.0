Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF43746951A
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 12:38:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238825.413900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muCJt-0008Ic-MQ; Mon, 06 Dec 2021 11:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238825.413900; Mon, 06 Dec 2021 11:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muCJt-0008Fk-JC; Mon, 06 Dec 2021 11:38:09 +0000
Received: by outflank-mailman (input) for mailman id 238825;
 Mon, 06 Dec 2021 11:38:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gMFW=QX=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1muCJs-0008Fe-SW
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 11:38:08 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa97bec5-5688-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 12:38:07 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:51264)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1muCJp-000GU9-hI (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 06 Dec 2021 11:38:05 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 14E3B1FE08;
 Mon,  6 Dec 2021 11:38:05 +0000 (GMT)
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
X-Inumbo-ID: fa97bec5-5688-11ec-a5e1-b9374ead2679
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <21f914a0-3d20-6ce2-cc4a-b3bfe26284fa@srcf.net>
Date: Mon, 6 Dec 2021 11:38:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-63-andrew.cooper3@citrix.com>
 <a64a40ef-82f7-2264-5656-aaa5c94384f1@suse.com>
 <a96abdb7-cdf7-2b24-d293-d3d2c6c77c78@srcf.net>
 <22317ebe-4e21-5515-9061-33b21eefd4ae@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 62/65] x86/entry: Make IDT entrypoints CET-IBT compatible
In-Reply-To: <22317ebe-4e21-5515-9061-33b21eefd4ae@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/12/2021 09:42, Jan Beulich wrote:
> On 03.12.2021 16:30, Andrew Cooper wrote:
>> On 03/12/2021 13:32, Jan Beulich wrote:
>>> On 26.11.2021 13:34, Andrew Cooper wrote:
>>>> Each IDT vector needs to land on an endbr64 instruction.  This is especially
>>>> important for the #CP handler, which will escalate to #DF if the endbr64 is
>>>> missing.
>>> One question here: How does this work?
>> Honestly, I'm not sure.
>>
>>>  I don't recall there being any "CET
>>> shadow" along the lines of "STI shadow" and "SS shadow", yet there's
>>> clearly an insn boundary here that gets "skipped" if the 2nd #CP gets
>>> converted to #DF. And fetching of the first handler insn also isn't part
>>> of exception delivery (and could cause other exceptions first, like #PF).
>> I can't make my observations of real hardware behaviour match the
>> description in the spec.
> I haven't been able to find a description at all of exception behavior
> when the exception occurs in wait-for-endbr state. There is text saying
> that #BP and #DB can occur this way, but I couldn't find anything about
> the tracker state changes in such cases. While I could see the state to
> remain engaged (requiring an ENDBR at the handler's entry point), I
> cannot see how the state would get re-engaged upon IRET from the
> exception handler, unless the return is back to CPL3.

Critically, there are two wait-for-endbr states.  One in MSR_U_CET and
one in MSR_S_CET, and the active one is dependent on CPL.

Interrupting CPL3 does leave the state visible (and frozen) in MSR_U_CET.

Interrupting CPL!=0 does not.  The interrupt/exception delivery
microcode forces the wait-for-endbr state which is why the entrypoints
need ENDBR64, and while I haven't confirmed yet, I'm pretty certain that
a WRMSR to MSR_S_CET which sets wait-for-endbr needs an ENDBR64
following it.

IRET does not alter the wait-for-endbr state, but does switch which of
the two trackers is active, as a side effect of changing CPL.


#CP is a decode-class fault, and takes priority over #UD and #NM. 
However, the #BP/#DB special cases are specific to the INT3/INT1
instructions, to specifically permit putting a breakpoint on an ENDBR
instruction and to take the breakpoint exception rather than #CP. 
Critically, #CP has higher priority than General Detect #DB.

(I've already got the beginnings of an XTF test case for shstk corner
cases, but it's got nothing on how complicated the IBT side of things
looks.)

>> Given what a mess it all is, I wouldn't be surprised if the exception
>> delivery microcode has a special case to escalate this to #DF.
> I am meanwhile wondering whether any exception in wait-for-endbr state
> at CPL < 3 would promote to #DF, for loss of state. Albeit there must
> still be a distinction between CALL/JMP induced state and that
> resulting from interrupt or exception delivery. Yet there's no
> architectural (or shadow) state expressing "first insn of an exception
> handler".

Architecturally, no, but there is internally by virtue of the fact that
all interrupt/exception delivery is organised by microcode.

> I'm not even convinced the aforementioned statements about #DB and #BP
> are actually meant to cover more than just CPL3, or at best ENDBR at
> normal CALL/JMP destinations.
>
> While for Xen's own use we may get away without knowing how all of this
> actually works (perhaps accepting the fact that one can't set breakpoints
> at exception handler entry points, depending on whether their delivery
> would promote to #DF), as soon as we were to support CET-IBT for guests
> we'd definitely need to know.

I'm afraid I don't follow the point you're trying to make.  INT3/INT1
are explicitly special, to let you breakpoint an ENDBR instruction, and
that really ought to mean everywhere.

Another possibility is that my observations are an errata in TGL, or
that I've made a mistake somewhere.

However, until we start getting to the point of having some real XTF
tests for behaviour, including that of the emulator, I doubt we'll get
much clarity.  Furthermore, there's a pile of work to do before that is
a possibility.  As a minimum, I need to fix up and repost my xsave
cleanup series, then implement XSAVES support for guests, before we can
make CET an opt-in feature pending completion of the emulation work.

~Andrew

