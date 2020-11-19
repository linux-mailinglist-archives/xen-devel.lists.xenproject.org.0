Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EA12B97A5
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 17:22:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31118.61375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmhU-0001vp-AX; Thu, 19 Nov 2020 16:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31118.61375; Thu, 19 Nov 2020 16:22:24 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmhU-0001vQ-75; Thu, 19 Nov 2020 16:22:24 +0000
Received: by outflank-mailman (input) for mailman id 31118;
 Thu, 19 Nov 2020 16:22:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfmhS-0001vL-Pb
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:22:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9aadc79-7f68-4a2a-8586-b5271563f11c;
 Thu, 19 Nov 2020 16:22:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 42E74AC54;
 Thu, 19 Nov 2020 16:22:20 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfmhS-0001vL-Pb
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:22:22 +0000
X-Inumbo-ID: d9aadc79-7f68-4a2a-8586-b5271563f11c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d9aadc79-7f68-4a2a-8586-b5271563f11c;
	Thu, 19 Nov 2020 16:22:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605802940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n/9I4ebCYRTJCMWc7tmCqF9ONvCm8xUIyXovhL9gUiQ=;
	b=Ypy5dfipuRb7P7fuDcfpNXxWXNQB+OqlfZGjjF3sFSsKuqPVAxLfDsA7onGelroJcWD3lj
	tIGDMpsa4jomsAjIT7bbmWGPTBlh9fjxliXSDV0NO6xsHHlRgdS0t9708dFbbzBT0VUXqf
	wpiG8ffnc97oEyBLe8To9qBN4O2wX1M=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 42E74AC54;
	Thu, 19 Nov 2020 16:22:20 +0000 (UTC)
Subject: Re: [PATCH v3 1/3] xen/ns16550: Make ns16550 driver usable on ARM
 with HAS_PCI enabled.
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>
References: <cover.1605527997.git.rahul.singh@arm.com>
 <955996aa8cd7f17f9f39c60bd3b9b74ffaa5c5f7.1605527997.git.rahul.singh@arm.com>
 <3740e147-719a-4e97-bb0e-fe9bd2ec2aa5@xen.org>
 <aa256a44-8f8f-d4f1-f5f4-12529f45d8c8@suse.com>
 <9007e08f-6d90-88ed-ba64-2f0b3c21cb50@xen.org>
 <8531a99d-3c54-36c7-0cd4-2e4838f96eb0@suse.com>
 <ba26fdfb-34f8-c4d3-e082-f1f49c768981@xen.org>
 <89F35B3F-FAAD-4C58-B3FD-F93CA3290A49@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <022dbcfa-a7fc-f348-1a2c-5107fbc3911a@suse.com>
Date: Thu, 19 Nov 2020 17:22:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <89F35B3F-FAAD-4C58-B3FD-F93CA3290A49@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 19.11.2020 16:54, Rahul Singh wrote:
>> On 19 Nov 2020, at 10:16 am, Julien Grall <julien@xen.org> wrote:
>> On 19/11/2020 09:53, Jan Beulich wrote:
>>> Well, see my patch suppressing building of quite a part of it.
>>
>> I will let Rahul figuring out whether your patch series is sufficient to fix compilation issues (this is what matters right now).
> 
> I just checked the compilation error for ARM after enabling the HAS_PCI on ARM. I am observing the same compilation error what I observed previously. 
> There are two new errors related to struct uart_config and struct part_param as those struct defined globally but used under X86 flags.
> 
> At top level:
> ns16550.c:179:48: error: ‘uart_config’ defined but not used [-Werror=unused-const-variable=]
>  static const struct ns16550_config __initconst uart_config[] =
>                                                 ^~~~~~~~~~~
> ns16550.c:104:54: error: ‘uart_param’ defined but not used [-Werror=unused-const-variable=]
>  static const struct ns16550_config_param __initconst uart_param[] = { 

Looks like more code movement I need to do in my patch then. I was
never happy about the disconnected placement of these array and
the functions using them ...

Jan

