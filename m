Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FE348E970
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 12:49:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257597.442749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8L5H-0001ZK-K7; Fri, 14 Jan 2022 11:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257597.442749; Fri, 14 Jan 2022 11:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8L5H-0001WO-H8; Fri, 14 Jan 2022 11:49:31 +0000
Received: by outflank-mailman (input) for mailman id 257597;
 Fri, 14 Jan 2022 11:49:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vyuu=R6=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n8L5F-0001WI-Sn
 for xen-devel@lists.xenproject.org; Fri, 14 Jan 2022 11:49:29 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 062714e0-7530-11ec-9bbc-9dff3e4ee8c5;
 Fri, 14 Jan 2022 12:49:28 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:48234)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n8L55-000sKF-iA (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 14 Jan 2022 11:49:19 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 55C2F1FC09;
 Fri, 14 Jan 2022 11:49:19 +0000 (GMT)
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
X-Inumbo-ID: 062714e0-7530-11ec-9bbc-9dff3e4ee8c5
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <7c38fdfc-e2a1-c84c-bff3-30c331d1eb45@srcf.net>
Date: Fri, 14 Jan 2022 11:49:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/3] x86/spec-ctrl: Drop
 SPEC_CTRL_{ENTRY_FROM,EXIT_TO}_HVM
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20220113163833.3831-1-andrew.cooper3@citrix.com>
 <20220113163833.3831-3-andrew.cooper3@citrix.com>
 <YeFhmM0deHmdYOEW@Air-de-Roger>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <YeFhmM0deHmdYOEW@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/01/2022 11:42, Roger Pau Monné wrote:
> On Thu, Jan 13, 2022 at 04:38:32PM +0000, Andrew Cooper wrote:
>> These were written before Spectre/Meltdown went public, and there was large
>> uncertainty in how the protections would evolve.  As it turns out, they're
>> very specific to Intel hardware, and not very suitable for AMD.
>>
>> Expand and drop the macros.  No change at all for VT-x.
>>
>> For AMD, the only relevant piece of functionality is DO_OVERWRITE_RSB,
>> although we will soon be adding (different) logic to handle MSR_SPEC_CTRL.
>>
>> This has a marginal improvement of removing an unconditional pile of long-nops
>> from the vmentry/exit path.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>
> I wonder however if it would be clearer to define
> SPEC_CTRL_ENTRY_FROM_{SVM,VMX} and EXIT macros in spec_ctrl_asm.h
> (even if just used in a single place) so that all the related SPEC
> macros are in a single file.

For AMD MSR_SPEC_CTRL support, I'm going to need to shift the STGI/CLGI,
then call up into C, and I do not thing this is appropriate to have
separated out into spec_ctrl_asm.h

I left the comments intact deliberately so `grep SPEC_CTRL_ENTRY` still
lets you find everything.

The main difference between VT-x/SVM and PV is that for HVM, we have
this dance exactly once.  For PV, it is repeated multiple times in
subtly different ways, which is why having all the spec ctrl shadowing
logic together makes sense.

Its pretty ugly whichever way you look at it.

~Andrew

