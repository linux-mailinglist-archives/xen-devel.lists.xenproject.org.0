Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5CA948C69
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 11:50:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772678.1183136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbGps-0005vf-EM; Tue, 06 Aug 2024 09:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772678.1183136; Tue, 06 Aug 2024 09:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbGps-0005uA-BV; Tue, 06 Aug 2024 09:50:32 +0000
Received: by outflank-mailman (input) for mailman id 772678;
 Tue, 06 Aug 2024 09:50:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ctxO=PF=ti.com=a-singh21@srs-se1.protection.inumbo.net>)
 id 1sbGpq-00052v-9X
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 09:50:30 +0000
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e400841-53d9-11ef-8776-851b0ebba9a2;
 Tue, 06 Aug 2024 11:50:27 +0200 (CEST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4769oH4u034387;
 Tue, 6 Aug 2024 04:50:17 -0500
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4769oHOI107799
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Aug 2024 04:50:17 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Aug 2024 04:50:17 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Aug 2024 04:50:17 -0500
Received: from localhost (nightbug.dhcp.ti.com [172.24.227.225])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4769oGuT001402;
 Tue, 6 Aug 2024 04:50:17 -0500
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
X-Inumbo-ID: 4e400841-53d9-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722937817;
	bh=KGxtvzWm4CKuEy1Yhe+/6m3wsihu1QMSnKc4+ubhIBc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=zBAb8anr5oSaL3DKMJ2yfXRsJu1BJ7f6ldOTgmUl/IKUs80ggaIPxkwgi7ek8+Ptb
	 FEuZkjsKe4EZOuw7qH1zgNvCRop/oCSGaShYEyxUfS+kBa+Ufp0gxLWDYvc5xX/WSn
	 uH9YHUnAJ20Ap+EDWxFMeaWIvSpEVlkSuSFM8qJ8=
Date: Tue, 6 Aug 2024 15:20:16 +0530
From: Amneesh Singh <a-singh21@ti.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] drivers: char: omap-uart: add "clock-hz" option
Message-ID: <njlq7laeswww46izwpkzuvnvu3lcycv7kc6dt2urbrpimj6uej@tzjuwwhwwqmp>
References: <20240719113313.145587-1-a-singh21@ti.com>
 <b7ef34fe-f6eb-45e8-8f6a-0e2c4bd0175b@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b7ef34fe-f6eb-45e8-8f6a-0e2c4bd0175b@xen.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 10:16-20240806, Julien Grall wrote:
> Hi,
> 
> On 19/07/2024 12:33, Amneesh Singh wrote:
> > Quite a few TI K3 devices do not have clock-frequency specified in their
> > respective UART nodes.
> 
> Can you outline why fixing the device-tree is not solution?
Because other frequencies, say 96MHz or 192 MHz are also valid inputs.
> 
> > However hard-coding the frequency is not a
>  > solution as the function clock input can differ between SoCs.
> 
> Can you provide some details how Linux is handling those SoCs?
Yes, like omap-uart under xen, the 8250_omap driver also parses the DT,
but unlike omap-uart, falls back to clk_get_rate() and if the value is
still zero, it defaults to 48MHz.
> 
> > So,
> > similar to com1/com2, let the user pass the frequency as a dtuart option
> > via the bootargs. If not specified it will fallback to the same DT
> > parsing as before. For example, dtuart=serial2:clock-hz=48000000 can be
> > a valid bootarg.
> 
> Regardless my questions, any change to the command line needs to be
> documented in docs/misc/xen-command-line.pandoc.
I am not sure if that will be necessary as the dtuart option already
says: "The options are device specific."
> 
> Cheers,
> 
> --
> Julien Grall
> 
> 
Regards
Amneesh

