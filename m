Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EB02F6073
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 12:45:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66941.119110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l014F-0000uD-Hj; Thu, 14 Jan 2021 11:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66941.119110; Thu, 14 Jan 2021 11:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l014F-0000to-EI; Thu, 14 Jan 2021 11:45:31 +0000
Received: by outflank-mailman (input) for mailman id 66941;
 Thu, 14 Jan 2021 11:45:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l014D-0000tj-SY
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 11:45:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47f9bea4-15c9-4250-b5b2-fde359d8f2bc;
 Thu, 14 Jan 2021 11:45:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 119ADB7A5;
 Thu, 14 Jan 2021 11:45:28 +0000 (UTC)
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
X-Inumbo-ID: 47f9bea4-15c9-4250-b5b2-fde359d8f2bc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610624728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WGDL+j4zWevyAOOHAC7x4KzqWXO61MR0v8+W7Uolk18=;
	b=iw7mnrOx5L70C4wFq+uljzmJZJgWaubCtaWIajusqGfKxZyixltizcZOMqTeiv3v3sLw23
	6HemkEHCGp4cApU4OmLe6F4dC85jgwm35UIk9Cy7fWBod4sBBLFXZmLtgPZunKefVFutag
	xsR6xK+epWhe42boCWUc6esq/OmpnNA=
Subject: Re: [PATCH] x86/dpci: remove the dpci EOI timer
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>
References: <20210112173248.28646-1-roger.pau@citrix.com>
 <MWHPR11MB1886695BC900030C025DD09A8CA90@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210113131100.p5xiyfgtp5s5rktz@Air-de-Roger>
 <CAKf6xps-GOMSsYzDHf9wgyjDes0X4hnaq9vBsn02rCv-DadW8A@mail.gmail.com>
 <20210113180558.do2xq4iaur6kyuy4@Air-de-Roger>
 <CAKf6xptFiFdh=Uwbia-6BOpB4_qO7h1PCST4WT-0BXTygssFaA@mail.gmail.com>
 <CAKf6xpuTgdpqBx7AR8QUA8nJgn64X9ttZns2aSEcwjjvzqw_fA@mail.gmail.com>
 <20210114102205.ferwl6y7idooqy3y@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ecb3298d-39f1-183e-6ef6-2771dc3f79cf@suse.com>
Date: Thu, 14 Jan 2021 12:45:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114102205.ferwl6y7idooqy3y@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 14.01.2021 11:22, Roger Pau Monné wrote:
> On Wed, Jan 13, 2021 at 04:31:33PM -0500, Jason Andryuk wrote:
>> On Wed, Jan 13, 2021 at 1:34 PM Jason Andryuk <jandryuk@gmail.com> wrote:
>>> I guess I'd also need to disable MSI for the two devices to ensure
>>> they are both using the GSI?
>>
>> lspci in dom0 shows the USB xhci controller, iwlwifi, and e1000e
>> devices all with IRQ 16 and all with MSI disabled ("MSI: Enabled-").
>> The two linux HVMs run with (PV) linux stubdoms, and the HVM kernels
>> were started with pci=nosmi.  Networking through the iwlwifi device
>> works for that VM while a mouse attached to the xhci controller is
>> also working in the second VM.  Is there something else I should test?
> 
> Not really, I think that test should be good enough, the issue is that
> we don't know which OS was seeing the issues noted by Kevin.

Why a specific OS? Isn't this also guarding against malice?

Jan

