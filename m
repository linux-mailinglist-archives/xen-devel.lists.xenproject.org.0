Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 084FC2AB58C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 11:55:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22374.48683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc4p6-0001Lf-G4; Mon, 09 Nov 2020 10:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22374.48683; Mon, 09 Nov 2020 10:54:56 +0000
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
	id 1kc4p6-0001LD-Cr; Mon, 09 Nov 2020 10:54:56 +0000
Received: by outflank-mailman (input) for mailman id 22374;
 Mon, 09 Nov 2020 10:54:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2NS2=EP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kc4p5-0001L3-0i
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 10:54:55 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b021e9b6-823d-4a40-b579-9e6f8ed9c1d9;
 Mon, 09 Nov 2020 10:54:54 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2NS2=EP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kc4p5-0001L3-0i
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 10:54:55 +0000
X-Inumbo-ID: b021e9b6-823d-4a40-b579-9e6f8ed9c1d9
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b021e9b6-823d-4a40-b579-9e6f8ed9c1d9;
	Mon, 09 Nov 2020 10:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1604919294;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=DsODFVnxWQ5oJjDWjhOlPQGXBIFr2Rz/lhW84/4NfHk=;
  b=Dkez3Z/Wl1Ip/Fj3OCxMZGQJkfrbDcNyFsfYgTl7Z1c9rfrxlJv1y0p6
   4X8AZRxo4+IOzVBQt+p2cNPRGYdZyuBD7BFGAsSmVYfvSeKD96gIUZfxy
   ONcCwDzEBKTedRKnwKJfGZDwXpvH2KTfW26zXRNie3EmVv8JZtB2pchVh
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: tkidY/lwLE/119KhANGf2f5ppRW3wYyjl9PGLlz8N5tCmf04SdS8sLJefn0juoMOpb8JZuhy5x
 t9S9mDX2Crq7hTjVgZCk+46t0y9bSfp9EOPoDWdSPrwiCW1bKw8RdGt5rX/U6jBTplqvGEdvlR
 AJ8CoS/Q9bFAqPGpSLfnvEo+grLMYt9CpveP3kppREgxeIyii5IZZrdD9OCz8xNrj77jFR58qb
 idmFts0ZzhNOxdaGe/pF3b79dswyY0sW4C8CZINZ2b4TaTQTRQ9eWdJGECeEV+KyaoT/+8bDVi
 al4=
X-SBRS: None
X-MesageID: 31850263
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,463,1596513600"; 
   d="scan'208";a="31850263"
Subject: Re: [PATCH] x86/CPUID: suppress IOMMU related hypervisor leaf data
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <c640463a-d088-aaf5-0c3c-d82b1c98ee4f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <84272c0c-f9af-6853-e997-4f1bd11be1cb@citrix.com>
Date: Mon, 9 Nov 2020 10:54:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c640463a-d088-aaf5-0c3c-d82b1c98ee4f@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 09/11/2020 10:54, Jan Beulich wrote:
> Now that the IOMMU for guests can't be enabled "on demand" anymore,
> there's also no reason to expose the related CPUID bit "just in case".
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

