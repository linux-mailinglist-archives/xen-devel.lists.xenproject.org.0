Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B064B579C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 17:59:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272556.467448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJeh6-00088A-Ve; Mon, 14 Feb 2022 16:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272556.467448; Mon, 14 Feb 2022 16:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJeh6-00085p-SV; Mon, 14 Feb 2022 16:59:20 +0000
Received: by outflank-mailman (input) for mailman id 272556;
 Mon, 14 Feb 2022 16:59:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=R+2O=S5=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nJeh4-00085i-O0
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 16:59:18 +0000
Received: from ppsw-40.csi.cam.ac.uk (ppsw-40.csi.cam.ac.uk [131.111.8.140])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 715a940a-8db7-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 17:59:16 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:54906)
 by ppsw-40.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nJeh0-000KBC-jA (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 14 Feb 2022 16:59:14 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id D25391FB34;
 Mon, 14 Feb 2022 16:59:13 +0000 (GMT)
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
X-Inumbo-ID: 715a940a-8db7-11ec-b215-9bbe72dcb22c
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <5295e10c-d145-b6e3-d9a9-d345dc6cc93e@srcf.net>
Date: Mon, 14 Feb 2022 16:59:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 21/70] xen/evtchn: CFI hardening
Content-Language: en-GB
To: David Vrabel <dvrabel@cantab.net>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-22-andrew.cooper3@citrix.com>
 <71b7ebd1-5cc8-54f4-f45d-5da71f2298f6@cantab.net>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <71b7ebd1-5cc8-54f4-f45d-5da71f2298f6@cantab.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/02/2022 16:53, David Vrabel wrote:
> On 14/02/2022 12:50, Andrew Cooper wrote:
>> Control Flow Integrity schemes use toolchain and optionally hardware
>> support
>> to help protect against call/jump/return oriented programming attacks.
>>
>> Use cf_check to annotate function pointer targets for the toolchain.
> [...]
>> -static void evtchn_2l_set_pending(struct vcpu *v, struct evtchn
>> *evtchn)
>> +static void cf_check evtchn_2l_set_pending(
>> +    struct vcpu *v, struct evtchn *evtchn)
>
> Why manually annotate functions instead of getting the compiler to
> automatically work it out?

Because the compilers are not currently capable of working it out
automatically.

~Andrew

