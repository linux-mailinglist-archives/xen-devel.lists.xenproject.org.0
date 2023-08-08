Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9A7773F2E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 18:44:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580108.908408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTPo2-0003lL-5w; Tue, 08 Aug 2023 16:43:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580108.908408; Tue, 08 Aug 2023 16:43:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTPo2-0003iq-2e; Tue, 08 Aug 2023 16:43:38 +0000
Received: by outflank-mailman (input) for mailman id 580108;
 Tue, 08 Aug 2023 16:43:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7Ml=DZ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qTPo0-0003ik-O3
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 16:43:36 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5683846-360a-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 18:43:34 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691513003720900.7514399342488;
 Tue, 8 Aug 2023 09:43:23 -0700 (PDT)
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
X-Inumbo-ID: b5683846-360a-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1691513005; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ars4vVcGhiDHxCU36qEhp85KzI5ev7jsJ+KagjOKqLneQlqX6GYkJrhrW5QpkCIHJ0i8cMA2cmFWEGQJNufWPYybhEfxp4lbwzh2wohA1lP4OxprJ/PdY1vSN9BxQsPmcAbnnrxD0KxPf+q2ZbJ4bARqCklTyqxjKhnadSqac/M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691513005; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=52txK7ESKDZok3A5srdKuASszxGqFqTYvgKIv0vR6sY=; 
	b=V8eP5AtnJCYb3ogGRO169JXpHwbkeO8PydthFx2231tpBhrYRzyR7BnJTZTcsoGMgdPR843KHtZLzmolmURxDkmlHbSML15kUTwqTbBJGBCNMAw6gUzZnn8x5Qd/jcGiiMoNVk2ojaK4DIWCiyt79b9RQiLe1glCVYp4Y4X71Fo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691513005;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=52txK7ESKDZok3A5srdKuASszxGqFqTYvgKIv0vR6sY=;
	b=I8oEGcCW3cTdLAS0A7IXI/XyKwm8pvtniAPKCh7va/pC/xLtEjfmmIuZEsRStlOY
	hyRGqvm2aO9Zte/Nb5aUF8HNhYol5vQC62m5B56kfHFa0PWS0du2dfgXpmzCyffRQi8
	HlJQfn1xJtC8dVsxAzofEJ/QatifnbP61kK0XH0E=
Message-ID: <4ee78808-5807-58e8-2054-016486607713@apertussolutions.com>
Date: Tue, 8 Aug 2023 12:43:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 1/2] common: move Linux-inherited fixed width type
 decls to common header
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <652ef09f-3654-548a-37d7-bbc46cbda177@suse.com>
 <c641b981-54b8-d3ca-26a4-28331dc79ca5@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <c641b981-54b8-d3ca-26a4-28331dc79ca5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/4/23 02:08, Jan Beulich wrote:
> Have these in one place, for all architectures to use. Also use the C99
> types as the "original" ones, and derive the Linux compatible ones
> (which we're trying to phase out). For __s<N>, seeing that no uses exist
> anymore, move them to a new Linux compatibility header (as an act of
> precaution - as said, we don't have any uses of these types right now).
> 
> In some Flask sources inclusion of asm/byteorder.h needs moving later.

I just did a test build against staging for x86 with all asm/byteorder.h 
includes removed from FLASK and it built successfully. If there are no 
object to a small non-functional change patch, I can clean up include 
ordering as well and submit it to xen-devel.

v/r,
dps

