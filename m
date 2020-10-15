Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 456B628F79E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 19:28:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7682.20243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT72H-0003NF-Fg; Thu, 15 Oct 2020 17:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7682.20243; Thu, 15 Oct 2020 17:27:29 +0000
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
	id 1kT72H-0003Mq-Ce; Thu, 15 Oct 2020 17:27:29 +0000
Received: by outflank-mailman (input) for mailman id 7682;
 Thu, 15 Oct 2020 17:27:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LoCs=DW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kT72F-0003Ml-Mu
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 17:27:27 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef5a5738-dfe6-444d-bb24-b8dea69ba877;
 Thu, 15 Oct 2020 17:27:26 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=LoCs=DW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kT72F-0003Ml-Mu
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 17:27:27 +0000
X-Inumbo-ID: ef5a5738-dfe6-444d-bb24-b8dea69ba877
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ef5a5738-dfe6-444d-bb24-b8dea69ba877;
	Thu, 15 Oct 2020 17:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602782846;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=ZS18iKLT8mnFjsNWylUWI133jb2KC41TKGIcuW2aFw0=;
  b=SnvrbZMjjk4aRCLyxmGwsCCiVYtDnvoZ4YGXfE0p9X94XiGZ/PYVnRPG
   HO/Wxo3OyVZ4KqG/eKO3ZguTFKOmlixOvugz/+03LDSs27/geiLpiyd7W
   N1CJ4CVvPHJyzgNHwivgxSYTkfr6QU0cCNS8Ix7e2R0UfrD295KoVC/h+
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: MZD92vvaZdoGFRWDDsfQCD+rR3JriCQkBt78e42NYxr4Cuk8raootnvOnVdIbDoVx1A5jsdX8E
 pdwAenzQeVqSfyeXj+9tQ7vpgPl+EzOrA6k19rjmevqIecNheJ+TqlpZ4sylLxupQVr4xXqQXZ
 2H8pTFspZdC/RycWSiWnR8t84I/gXl8AFcUxmyokJ09HkH2fpbpTxRcnDzS/njBWUlT4PsXrXT
 52rqndaBFUffWSaKEvdfLHR/O49nxma4/t263WZTyEzjv5AxueECAYtVTwkiXACb/N/0vogOUI
 K+0=
X-SBRS: 2.5
X-MesageID: 29106077
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,379,1596513600"; 
   d="scan'208";a="29106077"
Subject: Re: [PATCH] libelf: Handle PVH kernels lacking ENTRY elfnote
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jandryuk@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
References: <20201014153150.83875-1-jandryuk@gmail.com>
 <6d373cae-c7dc-e109-1df3-ccbbe4bdd9c8@suse.com>
 <CAKf6xpv5GNjw0pjOxEqdVj2+C6v+O5PDZG5yYkNfytDjUT_r5w@mail.gmail.com>
 <4229544b-e98d-6f3c-14aa-a884c403ba74@suse.com>
 <CAKf6xpt_VhJ5r4scuAkWU3aGxgwiYNtHaBDpMoFJS+q837aFiA@mail.gmail.com>
 <d8e93366-0f99-37c7-e5f4-8efaf804d2e2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d1d45ef5-067d-1edb-fac9-514495277765@citrix.com>
Date: Thu, 15 Oct 2020 18:27:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d8e93366-0f99-37c7-e5f4-8efaf804d2e2@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 15/10/2020 16:14, Jan Beulich wrote:
> On 15.10.2020 16:50, Jason Andryuk wrote:
>> On Thu, Oct 15, 2020 at 3:00 AM Jan Beulich <jbeulich@suse.com> wrote:
>>> And why is there no bounds check of ->phys_entry paralleling the
>>> ->virt_entry one?
>> What is the purpose of this checking?  It's sanity checking which is
>> generally good, but what is the harm from failing the checks?  A
>> corrupt kernel can crash itself?  Maybe you could start executing
>> something (the initramfs?) instead of the actual kernel?
> This is at least getting close to a possible security issue.
> Booting a hacked up binary can be a problem afaik.

It's only a security issue if the absence of the check is going to cause
a malfunction outside of guest the guest context.  (e.g. in the
toolstack's elf parser)

There are a functionally infinite ways for a guest kernel to crash
itself early on boot - malforming the ELF header such that the state of
the guest once executing doesn't boot isn't interesting from this point
of view.

~Andrew

