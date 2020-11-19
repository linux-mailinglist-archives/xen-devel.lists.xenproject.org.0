Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB9F2B9843
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 17:42:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31165.61439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfn0R-0004bn-2j; Thu, 19 Nov 2020 16:41:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31165.61439; Thu, 19 Nov 2020 16:41:59 +0000
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
	id 1kfn0Q-0004bN-VV; Thu, 19 Nov 2020 16:41:58 +0000
Received: by outflank-mailman (input) for mailman id 31165;
 Thu, 19 Nov 2020 16:41:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2P/M=EZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kfn0P-0004bD-Mk
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:41:57 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f2b2b57-1996-4ad2-a8f9-7a48cc5e5a55;
 Thu, 19 Nov 2020 16:41:56 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2P/M=EZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kfn0P-0004bD-Mk
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:41:57 +0000
X-Inumbo-ID: 4f2b2b57-1996-4ad2-a8f9-7a48cc5e5a55
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4f2b2b57-1996-4ad2-a8f9-7a48cc5e5a55;
	Thu, 19 Nov 2020 16:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605804116;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=pp5O/TkDrpUj+vxBbksvm2fig6K3QAat0xWShWQy/zA=;
  b=MHPohreBd5eJ7SlLofYAroYuAdhpeNiQx9lXFN9Cg2EcmQveUxLWpsXT
   v4rINTQN6YAQSKPK/KhUood/DgRN+zENYs+GqmYng+e2kqwd+n0Io/aY4
   6xz4tAYFhlZUhOC4bBf3j7gb3wYdyUGM+YADxRG4/qHunoLSg+7ybFmo4
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: GQtfO1VChODKd5TOpknbO/rvyoyxzvPkOPnLVGARPnfQplQJqAjVlmVVG/TcPWYOovfeoqow3E
 lye7Vdes8VH+T10tQRS++uIWkPPZABAjBiWd4mY/t7jL4iiE5KXzJP5R/UzbcgcgiG9iE4+bJa
 n7qVb4GOjXvjXcc/Yvb7JeK4/NqqjbzOncd1Fwyk/IV+xaRnkCfTp+ul+2UzJ6T9GA634Zamzg
 yd3dvhTdeoeYMZ4HzgCBLQQawVsoSvMLsz1O0kmKb3cqkQFpBi3AkWmaCc3cV6WsB2n+eoEhDd
 04I=
X-SBRS: None
X-MesageID: 31885037
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,353,1599537600"; 
   d="scan'208";a="31885037"
Subject: Re: [PATCH] xen/iommu: vtd: Fix undefined behavior pci_vtd_quirks()
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Kevin Tian <kevin.tian@intel.com>
References: <20201119145216.29280-1-julien@xen.org>
 <16b256f5-1ceb-c12f-ff7b-9c6f1a5cc3cb@citrix.com>
 <12223d32-c1da-2b6e-1193-93b6ca113953@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b2fd4b70-a949-479e-b943-b19543d85b0f@citrix.com>
Date: Thu, 19 Nov 2020 16:41:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <12223d32-c1da-2b6e-1193-93b6ca113953@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 19/11/2020 16:40, Julien Grall wrote:
>
>
> On 19/11/2020 16:38, Andrew Cooper wrote:
>> On 19/11/2020 14:52, Julien Grall wrote:
>>> Note that splat is from 4.11.4 and not staging. Although, the
>>> problem is
>>> still present.
>>>
>>> This can be solved by making the first operand unsigned int.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>
>>> CR: https://code.amazon.com/reviews/CR-38873112
>>
>> IIRC, this is an internal link, which doesn't want including on the
>> upstream commit?
>
> Yes. I forgot to sanitize commit message when sending it.
>
> I will remove it while committing unless there is a need to send a new
> version.

No problem.  FWIW, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

~Andrew

