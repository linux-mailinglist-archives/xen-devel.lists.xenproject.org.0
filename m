Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B8F29F4AA
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 20:15:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14589.36013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYDNx-0008O0-0r; Thu, 29 Oct 2020 19:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14589.36013; Thu, 29 Oct 2020 19:14:56 +0000
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
	id 1kYDNw-0008Nb-Sq; Thu, 29 Oct 2020 19:14:56 +0000
Received: by outflank-mailman (input) for mailman id 14589;
 Thu, 29 Oct 2020 19:14:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hwhy=EE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kYDNv-0008NW-TH
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 19:14:55 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5552412-28e1-4ea7-aa5d-b143026030fe;
 Thu, 29 Oct 2020 19:14:54 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hwhy=EE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kYDNv-0008NW-TH
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 19:14:55 +0000
X-Inumbo-ID: e5552412-28e1-4ea7-aa5d-b143026030fe
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e5552412-28e1-4ea7-aa5d-b143026030fe;
	Thu, 29 Oct 2020 19:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603998894;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=GJeVn2qDW5HK4YO9Jnmz/fILLqjy67QZMfCQwG2vVNo=;
  b=ci8f/+PsbX+K5LPYRZ4Ych5z/wZYqU9jpiY5fSwzjjKjCJPw0cjVStre
   UZ6FXjKpZUMyFtidQ71XBM25rJvGexjRYp5rHLoTJDHU6znS666mFwtuY
   LU8qnUD13gY8NxwsEcZnxsg4r6PKsnuG2kAPsXiMCueRZU7JQETVC9ha2
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ozP+qusxK5Fqqqpc8FMmZA7MW4bCpUKRNVRrXTodp3MvDfKivGZCatZ1uoa6KhOOLdRzOIHkIV
 7176IdnCU6+QCUvgR/n88QJao18LAF72zJZ4LPeZzJ04PwzmkbSLbB0h6TxL41DDE02Dh93Ibt
 kKwUKcOABU+72wV4i3p6TaTSZAXdz55UfH4vgb5+UfAgy3xszPFOtTe3kmTyH65IBTpSWEWI0X
 NccwZINrf1Y6FXZp5v4MB6Co+cFYPAdjXUE2cL5LkD979zZyFgd26iQRjdxknw7tU8LiORhyTj
 6Ks=
X-SBRS: None
X-MesageID: 30433939
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,430,1596513600"; 
   d="scan'208";a="30433939"
Subject: Re: [PATCH] x86/pv: Drop stale comment in dom0_construct_pv()
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201029140041.18343-1-andrew.cooper3@citrix.com>
 <2425da57-9c04-215e-297e-844fb11fac9a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b46a9ce5-cb84-b119-5b63-9ab63cd39b6f@citrix.com>
Date: Thu, 29 Oct 2020 19:14:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2425da57-9c04-215e-297e-844fb11fac9a@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 29/10/2020 14:37, Jan Beulich wrote:
> On 29.10.2020 15:00, Andrew Cooper wrote:
>> This comment has been around since c/s 1372bca0615 in 2004.  It is stale, as
>> it predates the introduction of struct vcpu.
> That commit only moved it around; it's 22a857bde9b8 afaics from
> early 2003 where it first appeared, where it had a reason:
>
>     /*
>      * WARNING: The new domain must have its 'processor' field
>      * filled in by now !!
>      */
>     phys_l2tab = ALLOC_FRAME_FROM_DOMAIN();
>     l2tab = map_domain_mem(phys_l2tab);
>     memcpy(l2tab, idle_pg_table[p->processor], PAGE_SIZE);

Oh yes - my simple search didn't spot the reformat.

>
> But yes, the comment has been stale for a long time, and I've
> been wondering a number of times what it was supposed to tell
> me. (I think it was already stale at the point the comment
> first got altered, in 3072fef54df8.)

Looks like it became stale with 99db02d5097 "Remove CPU-dependent
page-directory entries." which drops the per-cpu idle_pg_table.

>
>> It is not obvious that it was even correct at the time.  Where a vcpu (domain
>> at the time) has been configured to run is unrelated to construct the domain's
>> initial pagetables, etc.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.  I'll update the commit message.

~Andrew

