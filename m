Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8446A1250B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 14:42:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872544.1283516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY3ed-0000KB-EC; Wed, 15 Jan 2025 13:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872544.1283516; Wed, 15 Jan 2025 13:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY3ed-0000IQ-BB; Wed, 15 Jan 2025 13:41:55 +0000
Received: by outflank-mailman (input) for mailman id 872544;
 Wed, 15 Jan 2025 13:41:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wvqr=UH=bounce.vates.tech=bounce-md_30504962.6787bb1b.v1-9919a5251a274e66bc5c60372eae440b@srs-se1.protection.inumbo.net>)
 id 1tY3eb-0000ID-I8
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 13:41:53 +0000
Received: from mail178-22.suw51.mandrillapp.com
 (mail178-22.suw51.mandrillapp.com [198.2.178.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7862ea71-d346-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 14:41:50 +0100 (CET)
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail178-22.suw51.mandrillapp.com (Mailchimp) with ESMTP id
 4YY6bv5XS2zGlswDW
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 13:41:47 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9919a5251a274e66bc5c60372eae440b; Wed, 15 Jan 2025 13:41:47 +0000
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
X-Inumbo-ID: 7862ea71-d346-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1736948507; x=1737209007;
	bh=ege9jiwZ4C5yykyiqHT3wU0a3MG1WEBInyWyycWHsOU=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GHVpzdlk6Yd1Wtmg2ocFRc7hMM4rK22TzMr+9yODNYieJl3kmSspHvgYTZv5mrZWp
	 S9rxiaydZ9Q05I773e/rTqKr8rqqC0A916h3e70ach+HJikum/MYpQkNUTw17i7jjG
	 +EgumntSOGaW0N0wS1IYUS1aTGR4rSA+h9+7ouuXgYpsS5gnDgPFG66frb3uI12cs+
	 brYwLckLWNO/JY51STCwYTzgnQZHwAw7AT89rbwRgvOA7pOwr9WJmW+t8Tt9tzec6O
	 NGnLzaTOOacBNsxxSy5GeywVLWxMUGOY7wfrrl3cHTSWrKSCUTsNR/b2UdUPC7lYq9
	 QEqQE9gKdM7Rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1736948507; x=1737209007; i=yann.dirson@vates.tech;
	bh=ege9jiwZ4C5yykyiqHT3wU0a3MG1WEBInyWyycWHsOU=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=v5EJp8N6B8MOiA3ZYeLTEq9FkveJo8x90bttEScgGQlCocHb9skw8YVDt1RVMR1Dq
	 /Wj887x7ZMsItLSNMvKwT39rN2alDN0PmCLnQbMNEl0QtbrKQ9tFdyl96kgt/vD8ZZ
	 ARAd/dwx9GeIELg3ZxgFfLIg9XDEm9iBy4OY3x3avFYocYoN3McTPmhoA0SE45Zj3p
	 4S1CnkbJC6F8FofGJmMuRgGNoC7sTe9gYRfrq+jG8UXP8+D0MDAT+AjCzF2JY1IDhh
	 42f8gy8Co1+21otCjTAvD3Y60dvJHnAveDVONcjioAe6kM2gFRYAWWCLFM6p63vGaa
	 1kpt72XocPGNA==
From: "Yann Dirson" <yann.dirson@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH]=20docs/sphinx:=20overview=20of=20serial=20consoles?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1736948505670
Message-Id: <15b4e4f6-eb79-4f67-850e-deb2c0659826@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
References: <d40643bf0730c2f227f2dfbc7985ba0b5f8878cf.1736942790.git.yann.dirson@vates.tech> <58753517-26b6-47cc-a060-e8b5a88639bd@citrix.com>
In-Reply-To: <58753517-26b6-47cc-a060-e8b5a88639bd@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9919a5251a274e66bc5c60372eae440b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250115:md
Date: Wed, 15 Jan 2025 13:41:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 1/15/25 14:27, Andrew Cooper wrote:
> On 15/01/2025 12:07 pm, Yann Dirson wrote:
>> ---
>>
>> Notes:
>>      This is a very preliminar first draft for comments:
>>      
>>      - would this structuration be adequate?
>>      
>>      - Is my basic understanding correct, are those first enumerations
>>      correct? (some of it come solely from console.txt, which has alread=
y
>>      proven to be seriously outdated on many aspects)
>>      
>>      - is there some doc about the qemu/ioemu backend I missed?  Is it a=
ble to
>>      deal with PV consoles, or is it just for virtual UARTS?
> 
> Consoles are probably one of the harder areas to get started.
> 
> First, we need to distinguish between host consoles and guest consoles,
> because admin-guide/console could be either/both.

OK, so this would rather be admin-guide/guest-console or even 
admin-guide/guest-serial-console.

> 
> Host consoles are mostly UARTs, but we have several flavours including
> usb2 and usb3 flavours.=C2=A0 ARM has extensive early printk support, whi=
ch
> RISC-V/PPC are borrowing too.=C2=A0 Xen is also capable of using
> hypervisor-provided consoles too.

Let's leave this for a later admin-guide/host-console :)

> For guest consoles, there's the plain CONSOLEIO hypercalls, and whether
> they do anything interesting depend on whether you're dom0 and/or the
> CONFIG_VERBOSE build setting.

I would see that part in something like guest-guide/serial-console.

>=C2=A0 ARM has the ability to mutiplex output
> from different guests onto the host console.=C2=A0 There's also the
> xenconsoled, things emulated by Qemu or other emulators, and even the
> in-Xen UART emulator currently on list.
> 
> Then, for specific guests, they've got different console options
> available.=C2=A0 e.g. Linux has a dedicated earlyconsole option for Xen (=
uses
> CONSOLEIO) as well as an hvc driver.

Those definitely seem in the scope for the doc I was thinking about

> And ideally we want all this information documented nicely, between "how
> do I set up debugging for my guest"

Debugging is an obvious superset, would hint to a "Guest debugging" 
section.  Maybe it would be enough to add admin-guide/guest-debugging as 
intermediate level, but not be necessary to create an additional level 
of subdir for the contents?

 > and how do I write a driver for xenconsoled.

That one does not really fit in either of admin-guide, guest-guide, and 
hypervisor-guide.  Something like toolstack-implementation-guide?



Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


