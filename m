Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A4F2B21AA
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 18:13:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26806.55303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdcdg-0002QG-Mr; Fri, 13 Nov 2020 17:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26806.55303; Fri, 13 Nov 2020 17:13:32 +0000
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
	id 1kdcdg-0002Pr-J1; Fri, 13 Nov 2020 17:13:32 +0000
Received: by outflank-mailman (input) for mailman id 26806;
 Fri, 13 Nov 2020 17:13:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uoW6=ET=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kdcde-0002Pm-EM
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 17:13:30 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 990adde9-7fda-4edf-bc23-6b11b0ad0eb8;
 Fri, 13 Nov 2020 17:13:29 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uoW6=ET=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kdcde-0002Pm-EM
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 17:13:30 +0000
X-Inumbo-ID: 990adde9-7fda-4edf-bc23-6b11b0ad0eb8
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 990adde9-7fda-4edf-bc23-6b11b0ad0eb8;
	Fri, 13 Nov 2020 17:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605287609;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=zhNfuYvFoIkrUjwdSPYa6x5TSR2fKQYqHzLxNnXLPBA=;
  b=ZZgi/HvKksCjgD2FGw/01chrgIIfSNtptvp8NUReP9WkRPN6UHKe191p
   06IL0KL4YyfUQRbatihJZ63ujoHKyttxXP6HPPOwyijm7gB2YEHZUC6T4
   KZNxruSxJ2Lc9LoMtpuIVaveQBJPCFSbWihX1IIzCC5g617ub2h0sobNJ
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: qxkmov4/hWhPuPJ5ymtWsEcOpYYlSdpTBfnio195YO9S2U2vuQNFS58U734F7tM5OyKrSaHE5d
 x5Tg16as+H2zjKfgPXGaFIyWy7BHsd6uirliPP4Iu1wni0RL0wHwGCFFh4ry+Kq3F6BKczjU2Q
 ZvRSgBa+oclMkTj05LTV5zfJyJPEQ1uHVRNRg62wlmLJUl1bLHfBfw5K5nPfC0IfeJK/gsE27F
 Mkggq5SkXkLaWVGMQ3zNb9rbHpI4I+833M2FFA6S85KkSA+CG8FL0V6bWNAaYNBmGiAr5ruzUf
 z/Q=
X-SBRS: None
X-MesageID: 31162691
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,476,1596513600"; 
   d="scan'208";a="31162691"
Subject: Re: [XEN PATCH] tools/xenstore: Log xenstored build ID on startup
To: Bjoern Doebel <doebel@amazon.de>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
	<jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.co.uk>, Eslam Elnikety <elnikety@amazon.de>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Edwin Torok
	<edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>
References: <20201113141823.58712-1-doebel@amazon.de>
 <5ac379ad-33fd-2973-dfdb-9e06ea539809@suse.com>
 <0e6b09fe-ffc4-195f-1b6c-67abc0cff92c@amazon.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c1352a2a-112a-966f-7410-b917cabe1d91@citrix.com>
Date: Fri, 13 Nov 2020 17:13:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0e6b09fe-ffc4-195f-1b6c-67abc0cff92c@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 13/11/2020 16:56, Bjoern Doebel wrote:
> On 13.11.20 16:36, Jürgen Groß wrote:
>> On 13.11.20 15:18, Bjoern Doebel wrote:
>>> Right now we do not have a mechanism to determine the version of the
>>> currently running xenstored at runtime. As xenstored runs throughout
>>> the
>>> lifetime of a Xen host, this may lead to problems when newer user space
>>> builds are staged. Then, the running xenstored will no longer match the
>>> version of the installed xenstored.
>>>
>>> To allow users to always identify the running version of xenstored, add
>>> a linker-generated unique build ID to every xenstored build. Add
>>> functionality to log this build ID into a file upon service startup.
>>>
>>> Signed-off-by: Bjoern Doebel <doebel@amazon.de>
>>> Reviewed-by: Martin Mazein <amazein@amazon.de>
>>> Reviewed-by: Paul Durrant <pdurrant@amazon.co.uk>
>>
>> No support for oxenstored or xenstore-stubdom?
>
> Your suggestion further down will apparently help for stubdom. I do
> not speak ocaml at all - how do we address this?

CC'ing Edwin and Christian who have done the bulk of the oxenstored
recently.

It sounds like it might not be possible right now, but would be possible
with a future plan to switch the Ocaml build system over to dune (the
new/preferred Ocaml upstream toolchain).

If it does end up being an XS_CONTROL sub-op, we can implement it at a
future point when we can usefully answer the question.

~Andrew

