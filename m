Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C71C65B036
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jan 2023 11:59:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470277.729728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCIWA-0002oC-2P; Mon, 02 Jan 2023 10:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470277.729728; Mon, 02 Jan 2023 10:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCIW9-0002kq-Uw; Mon, 02 Jan 2023 10:58:09 +0000
Received: by outflank-mailman (input) for mailman id 470277;
 Mon, 02 Jan 2023 10:58:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pCIW8-0002kk-34
 for xen-devel@lists.xenproject.org; Mon, 02 Jan 2023 10:58:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pCIW5-0002ro-8k; Mon, 02 Jan 2023 10:58:05 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pCIW5-0007Wf-2q; Mon, 02 Jan 2023 10:58:05 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=ObKuiq2kyQgt9UlGOidlvxa/0ITGglmtp5rnTLQ3o8c=; b=OBjT2xDwb5x/plFAci6CErolg3
	8MgG/EfJYMhCSfktf3dbPZispRk4mKQt/YFq0vyqyWv66UUiZ9JzuohnrtKt5YA7te2V2Tge4ycw4
	BxuUFOda0NNLOIFoGyg+FsHMuP3nr04aIIQyCVQ73jfh411E4HTLdkl1LSRR0f2rEO9Q=;
Message-ID: <6c46401b-9fbd-b7e0-5f09-cdaec92beead@xen.org>
Date: Mon, 2 Jan 2023 10:58:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [XEN PATCH v1 1/4] arch/riscv: initial RISC-V support to
 build/run minimal Xen
To: Oleksii <oleksii.kurochko@gmail.com>,
 Julien Grall <julien.grall@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Gianluca Guida <gianluca@rivosinc.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1671789736.git.oleksii.kurochko@gmail.com>
 <5d5ec5fbd8787ed8f86bf84a5ac291d07a20b307.1671789736.git.oleksii.kurochko@gmail.com>
 <3343c927-0f27-e285-5b6e-281c61939bb4@xen.org>
 <43d726761900ba3d8b4919fc29fe7cb1991ac656.camel@gmail.com>
 <CAF3u54A+Qqn+7dyBqh8utnN04b-DYkHbtL5DEEWuw9HQ2EQzTQ@mail.gmail.com>
 <540787f539e2620951ebbc7d0aa6767588e0e3ab.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <540787f539e2620951ebbc7d0aa6767588e0e3ab.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 29/12/2022 08:45, Oleksii wrote:
> Totally agree then.
> I missed that there is .bss.*.
> Actually I reworked a little bit xen.lds.S. As a basis I took xen.lds.S
> from ARM and removed all arch specific sections. So xen.lds.S contains
> stuff which isn't used for now (for example, *(.data.schedulers)) but
> will be used in future.
> Would it be better to go with the reworked linker script or remove
> unneeded sections for now and make it get a linking warning/error when
> sections will be used?

I don't have a strong opinion either way. I would say what's the easiest 
for you. In the long term, we will want to have a common linker script.

But that's a separate discussion and not a request for you to do it.

Cheers,

-- 
Julien Grall

