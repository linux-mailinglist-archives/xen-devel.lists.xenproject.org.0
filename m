Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A8629F379
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 18:41:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14541.35907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBvB-0008Co-JI; Thu, 29 Oct 2020 17:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14541.35907; Thu, 29 Oct 2020 17:41:09 +0000
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
	id 1kYBvB-0008CP-FT; Thu, 29 Oct 2020 17:41:09 +0000
Received: by outflank-mailman (input) for mailman id 14541;
 Thu, 29 Oct 2020 17:41:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hwhy=EE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kYBvA-0008CJ-6k
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:41:08 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8cc04f88-2ecd-4c9d-8be5-b8d61ad6589f;
 Thu, 29 Oct 2020 17:41:06 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hwhy=EE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kYBvA-0008CJ-6k
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:41:08 +0000
X-Inumbo-ID: 8cc04f88-2ecd-4c9d-8be5-b8d61ad6589f
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8cc04f88-2ecd-4c9d-8be5-b8d61ad6589f;
	Thu, 29 Oct 2020 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603993266;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=XK9v4RmpfHkc84S2Lds000zmEHI8x7nt8fjLRmZIgtc=;
  b=fSxwJR5gOTw93GZgyTyGO4h/6uGpHV1fLkKoHtyUtGTU+RMtuBKW/19Y
   dXbQqJIFlx5nN9rTv5RR2pg1s7CgLYfiBaYreiLmIrziiNRULdDaco8Yu
   9EYTrqucgLqr+eXqVXnbcSPUk0U9du84+0qtfzNrC7tmUR6TOxEcPPWUd
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: AVuIuWTOedBXcQ8yufK5HrQggcd+UAiQyaItvFNi7wWBcxRSrSvnow9S2BTqITy7pcliiTYOsh
 liSlvYp1XxlO1diJ9pYYEpHZjAzuFICpDwOO7X0zBMVLSth08QoXdccnZwxQpwrkCUZSGS1saN
 rQ5KBLX5lYyXCTfQaRffcHoCu1Q56FczqKhO4P03mX1SMj/vle8InZjV/8/di5gB0HixEEEKPU
 TCFdnRepIRk1NOyT99sBqhopWuq71g3mDyI4MQ3I7dSqK71ChN2DsgqhKbR9pU+58f+1Whrhds
 Hi0=
X-SBRS: None
X-MesageID: 30425211
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,430,1596513600"; 
   d="scan'208";a="30425211"
Subject: Re: [PATCH 1/2] x86: fix build of PV shim when !GRANT_TABLE
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <94c18ebf-632d-8a2c-220c-c31d6e37eb55@suse.com>
 <333de96e-5f60-dc87-7668-e8027dcfbcdd@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c8172ed7-cda1-a47f-b21c-8d996208723f@citrix.com>
Date: Thu, 29 Oct 2020 17:40:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <333de96e-5f60-dc87-7668-e8027dcfbcdd@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 29/10/2020 17:09, Jan Beulich wrote:
> To do its compat translation, shim code needs to include the compat
> header. For this to work, this header first of all needs to be
> generated.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

