Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AA1463F4A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 21:30:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235497.408519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms9ky-0001X1-Lk; Tue, 30 Nov 2021 20:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235497.408519; Tue, 30 Nov 2021 20:29:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms9ky-0001VE-Hi; Tue, 30 Nov 2021 20:29:40 +0000
Received: by outflank-mailman (input) for mailman id 235497;
 Tue, 30 Nov 2021 20:29:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ICIV=QR=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1ms9kw-0001V8-H4
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 20:29:38 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a7b9459-521c-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 21:29:34 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:34630)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1ms9kq-000Cav-7v (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 30 Nov 2021 20:29:32 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 3334D1FB4D;
 Tue, 30 Nov 2021 20:29:32 +0000 (GMT)
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
X-Inumbo-ID: 3a7b9459-521c-11ec-b941-1df2895da90e
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <3fcf10b1-6add-fb7b-2c38-c5da962ac406@srcf.net>
Date: Tue, 30 Nov 2021 20:29:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] x86/HVM: convert most remaining hvm_funcs hook
 invocations to alt-call
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
 <036ecf0f-02a2-feb2-9ce8-75cc66c46f8b@srcf.net>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <036ecf0f-02a2-feb2-9ce8-75cc66c46f8b@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/11/2021 14:57, Andrew Cooper wrote:
> On 30/11/2021 14:32, Jan Beulich wrote:
>> On 30.11.2021 15:25, Andrew Cooper wrote:
>>> On 30/11/2021 14:03, Jan Beulich wrote:
>>>> On 30.11.2021 14:48, Andrew Cooper wrote:
>>>>> On 29/11/2021 09:04, Jan Beulich wrote:
>>>>>> The aim being to have as few indirect calls as possible (see [1]),
>>>>>> whereas during initial conversion performance was the main aspect and
>>>>>> hence rarely used hooks didn't get converted. Apparently one use of
>>>>>> get_interrupt_shadow() was missed at the time.
>>>>>>
>>>>>> While I've intentionally left alone the cpu_{up,down}() etc hooks for
>>>>>> not being guest reachable, the nhvm_hap_walk_L1_p2m() one can't
>>>>>> currently be converted as the framework supports only up to 6 arguments.
>>>>>> Down the road the three booleans perhaps want folding into a single
>>>>>> parameter/argument.
>>>>> To use __initdata_cf_clobber, all hooks need to use altcall().
>>>> Right, but that's not going to be sufficient: The data members then also
>>>> need to move elsewhere, aiui.
>>> Nope.  It is safe for data members to stay.
>> But then it can't be in .init.data, can it?
> Very good point.  I'll need to reconsider that plan then.

Nope.  It's still fine.

In this scenario, you'd have {vmx,svm}_hvm_funcs in
__initdata_cf_clobber, because they're genuinely not used at runtime.

The embedded data is copied into the main hvm_funcs object, but in
general, the main object wants to be __initdata (if no embedded data and
fully altcall()'d), else __ro_after_init, or in the worst case
__read_mostly.

~Andrew

