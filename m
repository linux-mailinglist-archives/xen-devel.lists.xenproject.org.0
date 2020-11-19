Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AFA2B9819
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 17:38:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31148.61402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmxQ-0003Lh-43; Thu, 19 Nov 2020 16:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31148.61402; Thu, 19 Nov 2020 16:38:52 +0000
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
	id 1kfmxQ-0003LI-0t; Thu, 19 Nov 2020 16:38:52 +0000
Received: by outflank-mailman (input) for mailman id 31148;
 Thu, 19 Nov 2020 16:38:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2P/M=EZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kfmxO-0003LC-QN
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:38:50 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d8923b2-a5ac-4564-bffd-c1eb8e33f105;
 Thu, 19 Nov 2020 16:38:49 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2P/M=EZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kfmxO-0003LC-QN
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:38:50 +0000
X-Inumbo-ID: 8d8923b2-a5ac-4564-bffd-c1eb8e33f105
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8d8923b2-a5ac-4564-bffd-c1eb8e33f105;
	Thu, 19 Nov 2020 16:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605803929;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=XW+It94G6+dYFOkryCtNAWQQoMoEuCBf2FsJzmnphcg=;
  b=Mxve+bQzubBaq2M7gAdChjZLlIFlWzuFRPV68+rmIvxIfTMAKwGxk1zC
   CkKJRHpSf719c4h7KduUlIZPdcKXpX7rRLBbBRvZeC/AghQzlSlnjx69d
   47CyGvkb60J0FL/GJkzSCBwvwkUInWlj/n0//vboeGNJZo8QAkIYhs9tg
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: fnz8AP2Zq5ukmTk8F97QD9SQiLysb9NgrqMW2iDYaIoFfBYmNC6YzApTzkuMavP3DHPV7N7Gzb
 YsoHBBrNhP1NBQKkIrs4y2F7kQeC2KrC7ESlHoHLqZsOS/mQRPXDLz1aP/xDzNYX+BxmLpHVAP
 1UmzmUgAzP6hN4u57mWHSoiBLVLq7obWAXYeX4noAKxI1Lz7ZeyYD7RZTQ4jXpjSabMZ/ApvSQ
 uHopSMp0YMfwPcHsVVm9XhmCsKGtYaLnl+wzqtWVbQJ6RQrkGOJLMnLlEhc68SrHSP438ly34m
 l3U=
X-SBRS: None
X-MesageID: 32690080
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,353,1599537600"; 
   d="scan'208";a="32690080"
Subject: Re: [PATCH] xen/iommu: vtd: Fix undefined behavior pci_vtd_quirks()
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Kevin Tian <kevin.tian@intel.com>
References: <20201119145216.29280-1-julien@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <16b256f5-1ceb-c12f-ff7b-9c6f1a5cc3cb@citrix.com>
Date: Thu, 19 Nov 2020 16:38:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119145216.29280-1-julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 19/11/2020 14:52, Julien Grall wrote:
> Note that splat is from 4.11.4 and not staging. Although, the problem is
> still present.
>
> This can be solved by making the first operand unsigned int.
>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>
> CR: https://code.amazon.com/reviews/CR-38873112

IIRC, this is an internal link, which doesn't want including on the
upstream commit?

~Andrew

