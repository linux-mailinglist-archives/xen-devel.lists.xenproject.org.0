Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB2828E23E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 16:34:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6766.17807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kShqs-0001nb-Fk; Wed, 14 Oct 2020 14:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6766.17807; Wed, 14 Oct 2020 14:34:02 +0000
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
	id 1kShqs-0001nC-Cd; Wed, 14 Oct 2020 14:34:02 +0000
Received: by outflank-mailman (input) for mailman id 6766;
 Wed, 14 Oct 2020 14:34:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aNf1=DV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kShqr-0001n7-66
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 14:34:01 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0ae73c2-18ed-4660-8f90-379172a3944f;
 Wed, 14 Oct 2020 14:33:59 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aNf1=DV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kShqr-0001n7-66
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 14:34:01 +0000
X-Inumbo-ID: c0ae73c2-18ed-4660-8f90-379172a3944f
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c0ae73c2-18ed-4660-8f90-379172a3944f;
	Wed, 14 Oct 2020 14:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602686040;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=OBlQNft8lThLjba6mdAAjURP9gw22tLr3iM2AsJIrD8=;
  b=EN+OyJQCb6pxb99hMM/frx8+dbVPugxFgrBNydU4Zs+vxZujmc+o45Ht
   wdN6CfVC3y80zUlMcusmCDZWq17/rmfixDx9+qUrX9RiNJK8yJQNrc9CB
   K6HdA4z4fuUk+uwi5BBznH5hGzh4A+sZBUxNnodHMyllrRzlMmafzKTL4
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 0Ji6ZduMgnMoiynENHP8+q0RW58zkiP4zEmlnRX3nw4pQ63S2du3y8HHwNfRMigfY6yQqZQdDD
 tr4vC21AkwlZugpEWtAYqeEJf84gxJBXnOS1IfrB2ell/GVSjcMHx750F8GTbKKBkq+FLhb5nV
 UpcNQVmFjfUAkHKwBxF7z7UHhUHMAcn03axz6R2baYJSpOFmzSQCO697tNOfkKVS5PVUTaaScS
 GPRxHAylAEgF5lSx/g3ddA1TrjPApJZ9gRoY0og4SzONzHYYbgugp4Yp3w+oaDhu4w69vq4rk0
 l4Q=
X-SBRS: 2.5
X-MesageID: 28968362
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,375,1596513600"; 
   d="scan'208";a="28968362"
Subject: Re: [PATCH v2] x86/pv: Inject #UD for missing SYSCALL callbacks
To: Manuel Bouyer <bouyer@antioche.eu.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Andy Lutomirski <luto@kernel.org>
References: <20200923101848.29049-4-andrew.cooper3@citrix.com>
 <20201009115301.19516-1-andrew.cooper3@citrix.com>
 <20201014141620.GS19254@Air-de-Roger>
 <20201014142050.GA11721@mail.soc.lip6.fr>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2a0dd6d0-703a-49e0-fccf-451c1e737746@citrix.com>
Date: Wed, 14 Oct 2020 15:26:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201014142050.GA11721@mail.soc.lip6.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 14/10/2020 15:20, Manuel Bouyer wrote:
> On Wed, Oct 14, 2020 at 04:16:20PM +0200, Roger Pau Monné wrote:
>> [...]
>> Would this result in a regression for NetBSD then? Is it fine to see
>> #UD regardless of the platform? It's not clear to me from the text
>> above whether this change will cause issues with NetBSD.
> AFAIK this should not cause any issue. If I understand it properly,
> SYSCALL in a 32bit context would not work in any case on Intel CPUs.
> The patch just makes if fail on AMD cpus the same way it fails on Intel.

Correct.

~Andrew

