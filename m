Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1D8948CE4
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 12:36:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772760.1183208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbHYC-0000MD-8i; Tue, 06 Aug 2024 10:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772760.1183208; Tue, 06 Aug 2024 10:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbHYC-0000J5-5v; Tue, 06 Aug 2024 10:36:20 +0000
Received: by outflank-mailman (input) for mailman id 772760;
 Tue, 06 Aug 2024 10:36:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ctxO=PF=ti.com=a-singh21@srs-se1.protection.inumbo.net>)
 id 1sbHYA-0000IY-Hd
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 10:36:18 +0000
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b44d7d12-53df-11ef-8776-851b0ebba9a2;
 Tue, 06 Aug 2024 12:36:15 +0200 (CEST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 476Aa0mQ084900;
 Tue, 6 Aug 2024 05:36:00 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 476Aa0dS114092
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Aug 2024 05:36:00 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Aug 2024 05:36:00 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Aug 2024 05:36:00 -0500
Received: from localhost (nightbug.dhcp.ti.com [172.24.227.225])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 476AZxUb073256;
 Tue, 6 Aug 2024 05:36:00 -0500
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
X-Inumbo-ID: b44d7d12-53df-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722940561;
	bh=qcQiwfiYAyGU3CfBX04/XJcXkyEng2Hb+rFNMTIbWNw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Vjo09Z9lNKoFcVbTfHr8vOaD97qZqSan41bkr5o+kEieNIBA2Xh1D30+SG1xWkUSs
	 wxk0QatgvZ7HekTNtsXraXMx8nHBq3RFBXSg81CVTGQf7QpiRYMg/kgboLtSLwLeyH
	 k5BEhzmKPLQN5O3XA1J0sIN0mO3R3N00egHNCNWk=
Date: Tue, 6 Aug 2024 16:05:59 +0530
From: Amneesh Singh <a-singh21@ti.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] drivers: char: omap-uart: add "clock-hz" option
Message-ID: <csvohhbfi7ilqjzmozhb7u75jp7kfncpyj335hz5vksjw7lr46@57puayor4b4r>
References: <20240719113313.145587-1-a-singh21@ti.com>
 <b7ef34fe-f6eb-45e8-8f6a-0e2c4bd0175b@xen.org>
 <njlq7laeswww46izwpkzuvnvu3lcycv7kc6dt2urbrpimj6uej@tzjuwwhwwqmp>
 <8c12dc98-bc9f-49bf-bc18-ddae99fa7312@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8c12dc98-bc9f-49bf-bc18-ddae99fa7312@xen.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 10:56-20240806, Julien Grall wrote:
> On 06/08/2024 10:50, Amneesh Singh wrote:
> > On 10:16-20240806, Julien Grall wrote:
> >> Hi,
> >>
> >> On 19/07/2024 12:33, Amneesh Singh wrote:
> >>> Quite a few TI K3 devices do not have clock-frequency specified in their
> >>> respective UART nodes.
> >>
> >> Can you outline why fixing the device-tree is not solution?
> > Because other frequencies, say 96MHz or 192 MHz are also valid inputs.
> 
> Are you saying this is configurable by the user? Or do you mean the
> firmware can configure it?
u-boot or some other bootloader are free to configure it. And usually,
linux's clock driver will pick it up using clk_get_rate (if not
specified in the DT), I think. Now, in case we add the frequency to the
DT, it may not match with the actual frequency configured before Xen
initialisation. Since, there is no equivalent to clk_get_rate under Xen,
and the fact I'm using imagebuilder, I found it easier to pass the
frequency the way I did.
Apologies if I come off as unclear. I recently joined as an intern and
am playing around with Xen.
> 
> >>
> >>> However hard-coding the frequency is not a
> >>   > solution as the function clock input can differ between SoCs.
> >>
> >> Can you provide some details how Linux is handling those SoCs?
> > Yes, like omap-uart under xen, the 8250_omap driver also parses the DT,
> > but unlike omap-uart, falls back to clk_get_rate() and if the value is
> > still zero, it defaults to 48MHz.
> 
> Thanks for the information. Then my next question is why Linux can get
> away with a default value and not Xen?
Sure why not? I guess, we can use a default value if everything fails
but there should still be a way for the user to specify the frequency.
Of course, we can instead just force the user to change the DT slightly
by just specifying the frequency. However, I feel it is easier to add it
here, especially when there's already a method to pass these options via
the command-line in place.
I believe, this is the best we can do with this.
> 
> To give more context, I don't feel it is right to ask the user to
> specify the clock speed. Xen should have a sane default like Linux.
> 
> >>
> >>> So,
> >>> similar to com1/com2, let the user pass the frequency as a dtuart option
> >>> via the bootargs. If not specified it will fallback to the same DT
> >>> parsing as before. For example, dtuart=serial2:clock-hz=48000000 can be
> >>> a valid bootarg.
> >>
> >> Regardless my questions, any change to the command line needs to be
> >> documented in docs/misc/xen-command-line.pandoc.
> > I am not sure if that will be necessary as the dtuart option already
> > says: "The options are device specific."
> 
> Let me ask differently, if you don't document in
> xen-command-line.pandoc, then how do you expect the user to know that
> the option clockspeed exists and what is the expected value?
> 
> To me the right place is in xen-command-line.pandoc because it should
> describe all the options (including device specific ones).
I have no qualms with adding device specific options, if that's not an
issue with everyone else :)
> 
> Cheers,
> 
> --
> Julien Grall
> 
> 
Thanks and regards
Amneesh

