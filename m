Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA1C281113
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 13:15:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1935.5791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOJ1M-0001oe-6M; Fri, 02 Oct 2020 11:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1935.5791; Fri, 02 Oct 2020 11:14:40 +0000
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
	id 1kOJ1M-0001oI-2w; Fri, 02 Oct 2020 11:14:40 +0000
Received: by outflank-mailman (input) for mailman id 1935;
 Fri, 02 Oct 2020 11:14:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kOJ1K-0001o8-Bb
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 11:14:38 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8231079-a6db-4922-9812-b6655889c356;
 Fri, 02 Oct 2020 11:14:37 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kOJ1K-0001o8-Bb
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 11:14:38 +0000
X-Inumbo-ID: f8231079-a6db-4922-9812-b6655889c356
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f8231079-a6db-4922-9812-b6655889c356;
	Fri, 02 Oct 2020 11:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601637277;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=GFnw3e1iFTPxYR1b9DtWHRUiA4+esND/Ff+pFeDntaU=;
  b=RkBeCHTtNsEoFXZl/AWChwLCcfN+UTFsMLHUr5NB5gofThbr1sUzLZfQ
   L2Gkjt4V+BKhPuq3z4NZfGJTFPJ1fiqQilPLVe3AzQy+7ThoUUgTRn8li
   I/ehZPPQSpKiTZ6DcNkVY/b8Qj3hOvmZZb3f4fml4/HBPztBOO/+BxYY+
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: f/pLEhB4TAsLSU9Nomz70Xt+CII5FRAqlZHbo4qYL1uGk4OkyDPoLPFhKZnoBabTaXJnqw18hW
 B0Bg7LTTNaiLlmm4UxG7lWMHHc3XZaOR4rq4PvDSJYLSpGRogl73FcHNHfYnzVGEmTVXi2HEKF
 kPN8vgw9sCTrkPItrFX8WXMoAU8e2rpRT3QDMmkSx4Fyx1n8q0v0nSMyLQyTgZkLCOGj3MzMHs
 yj8kRlDJmqgsVBTi9notaZcpKMASgjbxtAh1gAmBdN629rECGKZZLbyF2m/zHZadP0zBuaX2yP
 o0Q=
X-SBRS: None
X-MesageID: 28485448
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,327,1596513600"; 
   d="scan'208";a="28485448"
Subject: Re: [PATCH 2/3] x86: fix resource leaks on arch_vcpu_create() error
 path
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <1a55f2f0-f0aa-4a33-1219-1091ed9150df@suse.com>
 <77106fd6-96c5-4a62-5eee-8a37660db550@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <df700f00-9458-c7f8-90fc-65dc31850b48@citrix.com>
Date: Fri, 2 Oct 2020 12:13:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <77106fd6-96c5-4a62-5eee-8a37660db550@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 02/10/2020 11:30, Jan Beulich wrote:
> {hvm,pv}_vcpu_initialise() have always been meant to be the final
> possible source of errors in arch_vcpu_create(), hence not requiring
> any unrolling of what they've done on the error path. (Of course this
> may change once the various involved paths all have become idempotent.)

I'd agree that the way the code was previously laid out expected
{hvm,pv}_vcpu_initialise() to be the final failing option.

I don't think "has always meant to be" is reasonable, because where is
the code comment explaining this design choice?

The idempotent plans will definitely be removing this misbehaviour, and
the memory leaks it causes.

> But even beyond this aspect I think it is more logical to do policy
> initialization ahead of the calling of these two functions, as they may
> in principle want to access it.

Not these MSRs.  They're currently a block of zeroes, and while that
will eventually change, it will still be a bunch of MSRs in their RESET
state.

The interesting MSRs are the domain ones, not the vCPU ones.

>
> Fixes: 4187f79dc718 ("x86/msr: introduce struct msr_vcpu_policy")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com> although I'd
prefer some adjustment to the commit message along the indicated lines.

