Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DBB5BA09F
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 20:16:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407625.650185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYtOk-0003qf-WD; Thu, 15 Sep 2022 18:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407625.650185; Thu, 15 Sep 2022 18:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYtOk-0003nC-TU; Thu, 15 Sep 2022 18:15:38 +0000
Received: by outflank-mailman (input) for mailman id 407625;
 Thu, 15 Sep 2022 18:15:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nsV+=ZS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oYtOj-0003n5-FF
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 18:15:37 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64001b7c-3522-11ed-a31c-8f8a9ae3403f;
 Thu, 15 Sep 2022 20:15:35 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1064FCE1C0A;
 Thu, 15 Sep 2022 18:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B8CC433D6;
 Thu, 15 Sep 2022 18:15:29 +0000 (UTC)
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
X-Inumbo-ID: 64001b7c-3522-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663265731;
	bh=TLFsK3Vya/NKYK0efkkZ5bqOngb7MP8/8lEXrRfyuz4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Alh4PdGzgTSos6fdNBy2R4N+BzIZqboooXZbsAw7EFgqmRDQJKauniSwDDq2DWGCO
	 cf+1dt+C9UlWlMDQt3qVvFvdUE0jWFl6dB2HK9GybtEzrax+Y7+YLFMknC6iaDdAu7
	 OkUlhfmfVi+0OEfFmn1aj8XTsTDPXQgw0bF7o/vjPyKuZeg9mD2R+DhXQ0vJRUEuYp
	 oVvvmZwm+rH1jkEfsZ9ZoLcmKaIB6X5WhHQkgRzkNR/JjM5kbETiMQISA8XYjKa4Pg
	 OdRR3TaEb/VEKR9U7SPhN4PzkBLYEtjkqI0xNDIMgSzmxzUEa1xyOPsbCqhcJnWmRO
	 VHt5JnCnd6M7g==
Date: Thu, 15 Sep 2022 11:15:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Carlo Nonato <carlo.nonato@minervasys.tech>, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, julien@xen.org, stefano.stabellini@amd.com, 
    wl@xen.org, marco.solieri@unimore.it, andrea.bastoni@minervasys.tech, 
    lucmiccio@gmail.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 00/12] Arm cache coloring
In-Reply-To: <65f5a6b5-37a7-4b5f-b42b-805a51790a60@suse.com>
Message-ID: <alpine.DEB.2.22.394.2209151041170.157835@ubuntu-linux-20-04-desktop>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech> <65f5a6b5-37a7-4b5f-b42b-805a51790a60@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 Sep 2022, Jan Beulich wrote:
> Plus an advanced question: In how far does this interoperate with
> static allocation, which again is (for now) an Arm-only feature?
> Your reference to dom0less above doesn't cover this afaict.

I take you are referring to static-mem, the static memory ranges for
dom0less domUs described in docs/misc/arm/device-tree/booting.txt.

static-mem doesn't interoperate with cache coloring: each static range
would span across multiple colors. You have to choose either feature,
using both at the same time doesn't make sense.

Cheers,

Stefano

