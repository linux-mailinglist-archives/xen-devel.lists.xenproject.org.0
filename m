Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B492B67BF
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 15:47:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29050.58256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf2Fi-0002Fl-J2; Tue, 17 Nov 2020 14:46:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29050.58256; Tue, 17 Nov 2020 14:46:38 +0000
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
	id 1kf2Fi-0002FM-Fy; Tue, 17 Nov 2020 14:46:38 +0000
Received: by outflank-mailman (input) for mailman id 29050;
 Tue, 17 Nov 2020 14:46:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGex=EX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kf2Fh-0002FG-EB
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 14:46:37 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4383c75-692d-408c-98e1-7fe364ea4ae0;
 Tue, 17 Nov 2020 14:46:36 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=mGex=EX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kf2Fh-0002FG-EB
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 14:46:37 +0000
X-Inumbo-ID: b4383c75-692d-408c-98e1-7fe364ea4ae0
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b4383c75-692d-408c-98e1-7fe364ea4ae0;
	Tue, 17 Nov 2020 14:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605624396;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=PHZmOYQKAawXJYU3wsIkiuYykq2AVxYFG5RJRHmYfQk=;
  b=G2EnqVItyAgVND5RkairYMwvM3/U5pWMS6Vycv0ZILdlJR/KsxnU6Xxs
   gbH97W8Cv0xrFaLJ0cRoXtLduFqobzo2/y6cXApVE73fQ1/y8MdG1v8AH
   gPWgFu7p1iiN7LfVYZZvdpoG+zO+R7ljHwUcEJ+eVyz7A3BDDZnwZOi8t
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: yiyGHD1RHVq6yrvTz8YevvYS0Bx8G939tk9M2LKRgnehBun9Be7851ofXWyPKa8/IrZc/lmJBL
 5/gbaOFikFtdhnIzgRwBn3zMtd7QKtEyE/A8mD2BUdXRPtsDTS1VPI7TvhjM5+hVB+4qTSmwxi
 iRM1RdOrNLDUAUG0MIQzYKeQXvFxuhzzsoEVikemxMjb1m/c8ALLpcbZmbzbO1+ILW6iM+NYds
 CaOrZljAvTZOBCa+hA661zvFU2dqvf+eztZt8eEVDBBopSlY/iZ0kPyzLVvIpp/H5yYSog6p5y
 LuU=
X-SBRS: None
X-MesageID: 31338751
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,485,1596513600"; 
   d="scan'208";a="31338751"
Subject: Re: XSA-351 causing Solaris-11 systems to panic during boot.
To: Cheyenne Wills <cheyenne.wills@gmail.com>, Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>
References: <CAHpsFVc4AAm6L0rKUuV47ydOjtw7XAgFnDZxRjdCL0OHXJERDw@mail.gmail.com>
 <7bca24cb-a3af-b54d-b224-3c2a316859dd@suse.com>
 <CAHpsFVcy2n2Sr845mPw4txH5UTbtKrbezRtgdmDaDX0T2r5wog@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ad2bf514-75b9-1383-bc2f-c800ab5e1a7a@citrix.com>
Date: Tue, 17 Nov 2020 14:46:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHpsFVcy2n2Sr845mPw4txH5UTbtKrbezRtgdmDaDX0T2r5wog@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 17/11/2020 14:43, Cheyenne Wills wrote:
> The Solaris version reported in the copyright banner on the ISO is
> SunOS Release 5.11 Version 11.4.0.15.0 64-bit
>
> My existing guest solaris systems are also at the same release/version
> level
>
> At the time of the panic, the panic log reports that the rcx register
> contains '0606' (this was from my notes yesterday).  If additional
> information is needed, I will need a bit more time to set up my system
> again.

As I said on IRC, this is RAPL_POWER_UNIT, but if it is read unguarded,
then the others will be too.

~Andrew

