Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2789D9544E6
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 10:55:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778424.1188454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sesjN-0002v4-OG; Fri, 16 Aug 2024 08:54:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778424.1188454; Fri, 16 Aug 2024 08:54:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sesjN-0002t5-Lj; Fri, 16 Aug 2024 08:54:45 +0000
Received: by outflank-mailman (input) for mailman id 778424;
 Fri, 16 Aug 2024 08:54:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjix=PP=bounce.vates.tech=bounce-md_30504962.66bf13d0.v1-ac3bf4db3f7c4d75accfe4bc309cd023@srs-se1.protection.inumbo.net>)
 id 1sesjL-0002sz-SQ
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 08:54:44 +0000
Received: from mail186-11.suw21.mandrillapp.com
 (mail186-11.suw21.mandrillapp.com [198.2.186.11])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cd02b76-5bad-11ef-8776-851b0ebba9a2;
 Fri, 16 Aug 2024 10:54:41 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-11.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4WlbQm43DyzLfHCqG
 for <xen-devel@lists.xenproject.org>; Fri, 16 Aug 2024 08:54:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ac3bf4db3f7c4d75accfe4bc309cd023; Fri, 16 Aug 2024 08:54:40 +0000
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
X-Inumbo-ID: 2cd02b76-5bad-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1723798480; x=1724058980;
	bh=8kQsH7eQyW6rWZBoG8iP9iO2Zo0stjNNaGsUaLDbesU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qtM8t06+2Vx9a7/oYWV9IHruM9vq5Fgq/jJb6n4+xNUiG1TT2oeTTLYTZaQKjQs1q
	 JuyalRXPVWX76qL2iiEBegXq6VBQkrKTQIwpIdVwk74Rz1uFplAeP67eWxDBEFKsRr
	 TYnCD3z+PamSn/vnXbmQ/G2aOosPGJdjl9yMNLee63HbEcPvAfVzln3W2gDRo+qNsO
	 TBOjZZSmMN5ZiuossOlXaSjD4MS5bKWIzKB99uEnZ6YXgNKQUtGpzdR8R0xx1vNCUv
	 a8u5GPyYFzPgHG4E5kkVT6z3evQw8IjjX1dMfQaLxKkNZe/eTWSD9gndcCzptVtSi+
	 9719e+kuaKvnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1723798480; x=1724058980; i=anthony.perard@vates.tech;
	bh=8kQsH7eQyW6rWZBoG8iP9iO2Zo0stjNNaGsUaLDbesU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ARPvptkTbmQYj9Il/BYxwSIqNlAAgD8cLPS1U3VhtGB3TOcZOJnZUGXFG1zbws/BL
	 7MrpmvuW7bBr0TGbHjiM2z0EVM2uOWyP/BG7EyxU1+wyYMTrEuOlbeAnaE+i7OZDn1
	 EUlU7j/InSx2obFdsTN2Cp1bUgPfLMpGrEamEmM5D8geP+xGsqbZQMA6+hfgKNzai+
	 HefK8HtBxncs+0Xc8DHLlK4ZNJHqqc+P1YqZCHiUi8WxCK4Y8QvBhtCYmBQgUmE0zw
	 0DfAIKOz/CpKI2zlxzjefjthf6tTDGj2WIEL8z7V29ydKoSWsQ2pK9cYxiML7KCRi5
	 HPDslA9D8le3w==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2]=20mktarball:=20only=20archive=20Xen?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1723798479578
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Message-Id: <Zr8TzofOZ4ul0Uu1@l14>
References: <5d8c1cf6-71cc-4c1b-b2cc-2b9ff4829c04@suse.com>
In-Reply-To: <5d8c1cf6-71cc-4c1b-b2cc-2b9ff4829c04@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ac3bf4db3f7c4d75accfe4bc309cd023?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240816:md
Date: Fri, 16 Aug 2024 08:54:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Wed, Aug 14, 2024 at 09:42:46AM +0200, Jan Beulich wrote:
> --- a/Makefile
> +++ b/Makefile
> @@ -200,10 +200,6 @@ rpmball: dist
>  subtree-force-update: mini-os-dir-force-update
>  	$(MAKE) -C tools subtree-force-update
>  
> -.PHONY: subtree-force-update-all
> -subtree-force-update-all: mini-os-dir-force-update
> -	$(MAKE) -C tools subtree-force-update-all

If this rule is removed, the one in tools/Makefile and the one in
tools/firmware/Makefile should be removed as well. (Also remove that
string from $(no-configure-targets) in tools/Rules.mk.)

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

