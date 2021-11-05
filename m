Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C421B4464CD
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 15:23:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222423.384602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj07M-0006z0-DL; Fri, 05 Nov 2021 14:22:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222423.384602; Fri, 05 Nov 2021 14:22:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj07M-0006wJ-AJ; Fri, 05 Nov 2021 14:22:56 +0000
Received: by outflank-mailman (input) for mailman id 222423;
 Fri, 05 Nov 2021 14:22:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UJNx=PY=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1mj07K-0006wD-QT
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 14:22:54 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc34ec93-3e43-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 15:22:53 +0100 (CET)
Received: from [172.20.51.40] (50.216.66.194 [50.216.66.194]) by
 mx.zohomail.com with SMTPS id 1636122167162223.0732521740996;
 Fri, 5 Nov 2021 07:22:47 -0700 (PDT)
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
X-Inumbo-ID: dc34ec93-3e43-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; t=1636122170; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kyqpGSgfPCKfY34VtSewANLbOzF/IjBIO2vifbIh70hXcIycEkkML3QP1SR2iwxKsBGDAIVEFhGerU2ub2YNXW6yb2daXlRvLk7FtWh6dgDeQbx8kO5M50rLP74Wor98VQgU3T2nksNq6+GNKOj4loiHzfv8ZQh7j9ObUArOsR0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1636122170; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=bAxe5EcljUj22y9bmvV/Cyi1yP2wctTekgXbyalBHXE=; 
	b=PVb61bmXzdOiTIjv1CEjX7E8pYFC5JyMofOUtgJpSflzHDNWfVhto0+U6b5BMaR5BBUvieQKel/4iqjK+FFGg/6+QlElPFnv620QSYAuMwW3eU/Bc/paAM/5w/ZZ58pdZjxWWTaK+h94g9PvG9YzJbFrnB8/tsCLGwYTo5wwQGg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1636122170;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=bAxe5EcljUj22y9bmvV/Cyi1yP2wctTekgXbyalBHXE=;
	b=ev3NA9hTtUeo6BnQTr8KYfrvVguAXefwzfyROCMAZjOQ+E8xXpPSOEQ6bIR8aOEC
	uIjpl4BRxX7AkIFDCEmhlYnZZavehkuXzwrrgRwYnNxqvzdsSrgXaxX+mjeQ5sHC5tm
	+HW9nDY/fjcGDkQRO6cdOtYAD3F8d3e0+80o2Uc8=
Subject: Re: [PATCH 3/5] xen/xsm: Drop xsm_hvm_control() hook
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20211105135555.24261-1-andrew.cooper3@citrix.com>
 <20211105135555.24261-4-andrew.cooper3@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <8d5dac86-9a0d-c4d8-8ca1-803342843072@apertussolutions.com>
Date: Fri, 5 Nov 2021 10:20:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211105135555.24261-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/5/21 9:55 AM, Andrew Cooper wrote:
> The final caller was dropped by c/s 58cbc034dc62 "dm_op: convert
> HVMOP_inject_trap and HVMOP_inject_msi"
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
> CC: Daniel Smith <dpsmith@apertussolutions.com>

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>


