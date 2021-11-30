Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B274A463860
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 15:57:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235230.408167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms4ZU-0001cu-RD; Tue, 30 Nov 2021 14:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235230.408167; Tue, 30 Nov 2021 14:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms4ZU-0001b9-Mh; Tue, 30 Nov 2021 14:57:28 +0000
Received: by outflank-mailman (input) for mailman id 235230;
 Tue, 30 Nov 2021 14:57:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ICIV=QR=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1ms4ZT-0001b1-LQ
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 14:57:27 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3ec4f91-51ed-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 15:57:26 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:50476)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1ms4ZP-000kmP-hp (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 30 Nov 2021 14:57:23 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 57E291FC54;
 Tue, 30 Nov 2021 14:57:23 +0000 (GMT)
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
X-Inumbo-ID: d3ec4f91-51ed-11ec-b941-1df2895da90e
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <036ecf0f-02a2-feb2-9ce8-75cc66c46f8b@srcf.net>
Date: Tue, 30 Nov 2021 14:57:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9fd8ba19-9744-fa50-1afb-15fae8955cac@suse.com>
 <17b42cc5-1979-f977-7c2e-a59fc97f87ea@srcf.net>
 <30b2711a-de67-ca15-e8a8-a4c8b962e620@suse.com>
 <34c9551c-4e60-8472-15ce-fa14076cf393@srcf.net>
 <f651c62e-65ee-1d82-843b-0c453c38f7b5@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] x86/HVM: convert most remaining hvm_funcs hook
 invocations to alt-call
In-Reply-To: <f651c62e-65ee-1d82-843b-0c453c38f7b5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/11/2021 14:32, Jan Beulich wrote:
> On 30.11.2021 15:25, Andrew Cooper wrote:
>> On 30/11/2021 14:03, Jan Beulich wrote:
>>> On 30.11.2021 14:48, Andrew Cooper wrote:
>>>> On 29/11/2021 09:04, Jan Beulich wrote:
>>>>> The aim being to have as few indirect calls as possible (see [1]),
>>>>> whereas during initial conversion performance was the main aspect and
>>>>> hence rarely used hooks didn't get converted. Apparently one use of
>>>>> get_interrupt_shadow() was missed at the time.
>>>>>
>>>>> While I've intentionally left alone the cpu_{up,down}() etc hooks for
>>>>> not being guest reachable, the nhvm_hap_walk_L1_p2m() one can't
>>>>> currently be converted as the framework supports only up to 6 arguments.
>>>>> Down the road the three booleans perhaps want folding into a single
>>>>> parameter/argument.
>>>> To use __initdata_cf_clobber, all hooks need to use altcall().
>>> Right, but that's not going to be sufficient: The data members then also
>>> need to move elsewhere, aiui.
>> Nope.  It is safe for data members to stay.
> But then it can't be in .init.data, can it?

Very good point.  I'll need to reconsider that plan then.

>>>> There is also an open question on how to cope with things such as the
>>>> TSC scaling hooks, which are only conditionally set in {vmx,svm}_hvm_funcs.
>>> Why's that an open question? The requirement is that the pointers be
>>> set before the 2nd pass of alternatives patching (it's really just
>>> one: setup()). That's already the case, or else the hook couldn't be
>>> invoked via altcall. And that's also not the only hook getting set
>>> dynamically.
>> This was in reference to cf_clobber, not altcall().
>>
>> If the conditional hooks aren't added into {vmx,svm}_hvm_funcs, then the
>> clobbering loop can't find them.
> Oh, I see. Which simple means the clobbering loop shouldn't run
> meaningfully earlier than the 2nd pass of patching.
>
>>>>   However...
>>>>
>>>>> [1] https://lists.xen.org/archives/html/xen-devel/2021-11/msg01822.html
>>>>> ---
>>>>> Another candidate for dropping the conditional would be
>>>>> .enable_msr_interception(), but this would then want the wrapper to also
>>>>> return void (hence perhaps better done separately).
>>>> I think that's a side effect of Intel support being added first, and
>>>> then an incomplete attempt to add AMD support.
>>>>
>>>> Seeing as support isn't disappearing, I'd be in favour of reducing it to
>>>> void.  The sole caller already doesn't check the return value.
>>>>
>>>>
>>>> If I do a prep series sorting out nhvm_hap_walk_L1_p2m() and
>>>> enable_msr_interception(), would you be happy rebasing this patch and
>>>> adjusting every caller, including cpu_up/down() ?
>>> Sure. I don't think cleaning up enable_msr_interception() is a prereq
>>> though. The potential for doing so was merely an observation while
>>> going through the hook uses.
>> Yeah, I suppose that one can be a followup.
>>
>>> With it not being sufficient to convert the remaining hook invocations
>>> and with the patch already being quite large, I wonder though whether
>>> it wouldn't make sense to make further conversions the subject of a
>>> fresh patch. I could commit this one then with your R-b (and further
>>> acks, once they have trickled in) once the tree is fully open again.
>> Honestly, this is legitimately "tree-wide".  While the patch is already
>> large, 3 extra hooks (on top of a fix for nhvm_hap_walk_L1_p2m()) is
>> mechanical, and probably easier than two patches.
> Okay, I'll wait for your change then and re-base on top.

Thanks.  I'll get them posted, and then we can decide exactly what to do.

~Andrew

