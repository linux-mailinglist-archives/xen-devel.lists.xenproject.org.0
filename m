Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CF22F606C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 12:43:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66937.119099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l010x-0000jt-V4; Thu, 14 Jan 2021 11:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66937.119099; Thu, 14 Jan 2021 11:42:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l010x-0000jU-Qw; Thu, 14 Jan 2021 11:42:07 +0000
Received: by outflank-mailman (input) for mailman id 66937;
 Thu, 14 Jan 2021 11:42:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l010w-0000jP-3o
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 11:42:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7df880c8-d7a1-4016-90d2-0c6f0a3c211c;
 Thu, 14 Jan 2021 11:42:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CB17EB7A6;
 Thu, 14 Jan 2021 11:42:03 +0000 (UTC)
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
X-Inumbo-ID: 7df880c8-d7a1-4016-90d2-0c6f0a3c211c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610624523; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L3ez7sudmLRxqwxgYRMzp5lJt3IMC2iPpHMZA9ZLmZo=;
	b=ksy6wWvxDkEiDhnJPBrQ++MqZY6fr2MATwMuPplGFbHl2GxH/ayg5VLUI6afPQpG04J7Ak
	XZ85rSm3x/WGfsNusUZnJQR/zrR7g6+HW0ZnV/oVow5E7EeDGA9ONonH1f/rpErYPuOaOS
	Rpj1wTtfFsyC8LJoD7ZTeeQM2Wp7cyg=
Subject: Re: [PATCH] x86/dpci: remove the dpci EOI timer
To: Jason Andryuk <jandryuk@gmail.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20210112173248.28646-1-roger.pau@citrix.com>
 <MWHPR11MB1886695BC900030C025DD09A8CA90@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210113131100.p5xiyfgtp5s5rktz@Air-de-Roger>
 <CAKf6xps-GOMSsYzDHf9wgyjDes0X4hnaq9vBsn02rCv-DadW8A@mail.gmail.com>
 <20210113180558.do2xq4iaur6kyuy4@Air-de-Roger>
 <CAKf6xptFiFdh=Uwbia-6BOpB4_qO7h1PCST4WT-0BXTygssFaA@mail.gmail.com>
 <CAKf6xpuTgdpqBx7AR8QUA8nJgn64X9ttZns2aSEcwjjvzqw_fA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <68a31f4e-f7a8-c044-686a-2540277d89a1@suse.com>
Date: Thu, 14 Jan 2021 12:42:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAKf6xpuTgdpqBx7AR8QUA8nJgn64X9ttZns2aSEcwjjvzqw_fA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.01.2021 22:31, Jason Andryuk wrote:
> On Wed, Jan 13, 2021 at 1:34 PM Jason Andryuk <jandryuk@gmail.com> wrote:
>> I guess I'd also need to disable MSI for the two devices to ensure
>> they are both using the GSI?
> 
> lspci in dom0 shows the USB xhci controller, iwlwifi, and e1000e
> devices all with IRQ 16 and all with MSI disabled ("MSI: Enabled-").
> The two linux HVMs run with (PV) linux stubdoms, and the HVM kernels
> were started with pci=nosmi.

Just to be sure (because "smi" isn't an entirely meaningless
acronym): You did actually test with "pci=nomsi"?

Jan

