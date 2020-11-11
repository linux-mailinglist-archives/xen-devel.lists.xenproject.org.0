Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0132AF19F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 14:07:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24751.52157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcpqf-0008O9-IE; Wed, 11 Nov 2020 13:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24751.52157; Wed, 11 Nov 2020 13:07:41 +0000
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
	id 1kcpqf-0008Nj-Es; Wed, 11 Nov 2020 13:07:41 +0000
Received: by outflank-mailman (input) for mailman id 24751;
 Wed, 11 Nov 2020 13:07:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ttLz=ER=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kcpqd-0008N4-UF
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 13:07:39 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 797f297d-fbb9-4c56-b237-f505a4617ac4;
 Wed, 11 Nov 2020 13:07:35 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ttLz=ER=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kcpqd-0008N4-UF
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 13:07:39 +0000
X-Inumbo-ID: 797f297d-fbb9-4c56-b237-f505a4617ac4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 797f297d-fbb9-4c56-b237-f505a4617ac4;
	Wed, 11 Nov 2020 13:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605100055;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=jTs8Zr1UEJJ+HqAfKraLLnswhhUH2wLtQwV/5mjasAk=;
  b=NA8NarIIPkzb3ByX3y0FTCQZ4SR7hLxWHZzuuQpLoOTgoY4UqvB9Hflt
   13jHXq9I3ugnIaCBPWWpOiBaP2EDsbq+7nD0O50+G1i3LyA46aH+bvn00
   1dTSKzjuxWPEhx4VuOT/zLJVO0MFxCSmSvZ875FZK3iyGVjNf5traq4ea
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: XwCwG/3cCEY3R262RXsJvddRrMasfNx/uxqHcbSVReuFIPAVI1C5MQA1L1E7B/bgsyWKLHK+yZ
 KPaNhw0OM5AsyUdwk5bVmdr9rpmm9Rxk2Gxg/CJvZruHbH2pQieSNFI1JR/AtQJm1RHCpatT1J
 bCKDsVlhHRlCVkw1cdxksitAnL3OBITv0MO0itiTzxPAM7eWJIeYUEfIR+39u8BvmhiGXDV7Cg
 /bLJc3NNKM3pGXZgr17/BzY2polPTPbFFY4RiWL91ItqYDqeEpz6Tm8OTFHQiIRj0i+B5L4sRv
 410=
X-SBRS: None
X-MesageID: 30916781
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,469,1596513600"; 
   d="scan'208";a="30916781"
Subject: Re: [PATCH] x86/vpt: fix build with old gcc
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <b345a4ed-dd6d-42a2-f114-6e6393640be5@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0f4a5a4e-39ea-c598-d832-333587e137f0@citrix.com>
Date: Wed, 11 Nov 2020 13:07:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b345a4ed-dd6d-42a2-f114-6e6393640be5@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 11/11/2020 12:58, Jan Beulich wrote:
> I believe it was the XSA-336 fix (42fcdd42328f "x86/vpt: fix race when
> migrating timers between vCPUs") which has unmasked a bogus
> uninitialized variable warning. This is observable with gcc 4.3.4, but
> only on 4.13 and older; it's hidden on newer versions apparently due to
> the addition to _read_unlock() done by 12509bbeb9e3 ("rwlocks: call
> preempt_disable() when taking a rwlock").
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

