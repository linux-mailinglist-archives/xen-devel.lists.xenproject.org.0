Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2E954A27F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 01:19:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348494.574725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0tK5-0002YW-6o; Mon, 13 Jun 2022 23:18:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348494.574725; Mon, 13 Jun 2022 23:18:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0tK5-0002W6-3t; Mon, 13 Jun 2022 23:18:17 +0000
Received: by outflank-mailman (input) for mailman id 348494;
 Mon, 13 Jun 2022 23:18:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YWck=WU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o0tK3-0002Vh-61
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 23:18:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18a78e49-eb6f-11ec-8901-93a377f238d6;
 Tue, 14 Jun 2022 01:18:14 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 421F561560;
 Mon, 13 Jun 2022 23:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32884C34114;
 Mon, 13 Jun 2022 23:18:11 +0000 (UTC)
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
X-Inumbo-ID: 18a78e49-eb6f-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655162291;
	bh=AvC5Jris24qA8kxAHIl2kaIWHhvJWc4uyIKV4+afHj0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GdeQXtdG2EhmeIVb5oDCUb9py30bzXo7on3NHu4y2PQzuuGw5EWgs+wVoXlxFSUhz
	 Jc5mbaU07t5+Uz7P4Z/37cRgLQlC90roP+cd4UvjiEAQVrhfS0j7IkTFL2YqwSZwHN
	 PgKoOaDYYKJcEuJZK8fAX87cD62ZS942sMpYBnASTwTbzk8Ze1A3Dl2f+id6lHwzp5
	 GPgQ4MjegmW+BZZrfZv3gToly5Ekw9buCDmgQejS75NVedpOn3EbHGz/vStNM9oJxh
	 khy5EMf+Xvqn+CrFVWW7ypqP2BYinJTAFEWxRnwZn4lSylraQyPTjWYFp0W7vKjtvb
	 D8A08ruu/cm0g==
Date: Mon, 13 Jun 2022 16:18:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand.Marquis@arm.com
Subject: Re: [PATCH v2 2/2] xen/arm: add FF-A mediator
In-Reply-To: <f664f35b-2fec-38e4-3382-1fd14ba66e8d@xen.org>
Message-ID: <alpine.DEB.2.22.394.2206131617490.1837490@ubuntu-linux-20-04-desktop>
References: <20220609061812.422130-1-jens.wiklander@linaro.org> <20220609061812.422130-3-jens.wiklander@linaro.org> <alpine.DEB.2.22.394.2206101758030.756493@ubuntu-linux-20-04-desktop> <f664f35b-2fec-38e4-3382-1fd14ba66e8d@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 11 Jun 2022, Julien Grall wrote:
> On 11/06/2022 02:23, Stefano Stabellini wrote:
> > > +static uint32_t ffa_rxtx_map(register_t tx_addr, register_t rx_addr,
> > > +                             uint32_t page_count)
> > > +{
> > > +    const struct arm_smccc_1_2_regs arg = {
> > > +#ifdef CONFIG_ARM_64
> > > +        .a0 = FFA_RXTX_MAP_64,
> > > +#endif
> > 
> > This ifdef is unnecessary given that FFA depends on ARM64 and SMCCCv1.2
> > is only implemented on ARM64. It also applies to all the other ifdefs in
> > this file. You can remove the code under #ifdef CONFIG_ARM_32.
> 
> To me the #ifdef indicates that it would be possible to use FFA on arm32. So I
> think it is better to keep them rather than having to retrofitting them in the
> future.

OK, fair enough

