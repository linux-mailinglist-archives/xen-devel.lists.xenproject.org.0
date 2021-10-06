Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5AF424584
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 20:01:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203095.358156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYBEK-0005Y0-IO; Wed, 06 Oct 2021 18:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203095.358156; Wed, 06 Oct 2021 18:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYBEK-0005Vb-FI; Wed, 06 Oct 2021 18:01:24 +0000
Received: by outflank-mailman (input) for mailman id 203095;
 Wed, 06 Oct 2021 18:01:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mYBEJ-0005VV-5c
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 18:01:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mYBEI-0000rK-19; Wed, 06 Oct 2021 18:01:22 +0000
Received: from [92.174.63.74] (helo=[192.168.1.232])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mYBEH-0002jE-J3; Wed, 06 Oct 2021 18:01:21 +0000
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
	bh=MHx/s+wZOzfk6BqqNO2OyRss/FVEruQTbmXK96pzaAk=; b=OpMkMgUhIG1sp4lq1H+d0l2oix
	gJP85WqCo/TkLQcOk+KEBEUN+0k8EsW68JCjpanZkv7hvXNeVlaEnD4eLcmVoZAgw6QNhVV5KgEVj
	45TSxQvqwvGoE/3h+iICYnYf+YApwUHDKggZmuGB/ReJjf2Bb+tN7JIcnqgPShmL7In8=;
Message-ID: <7bdac405-a889-15e1-be19-5876f7253855@xen.org>
Date: Wed, 6 Oct 2021 20:01:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.2
Subject: Re: [PATCH v5 10/11] arm/libxl: Emulated PCI device tree node in
 libxl
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Andre.Przywara@arm.com,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <b81b5dea800c8fe47071f3dbd20588b1e472fb99.1633540842.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b81b5dea800c8fe47071f3dbd20588b1e472fb99.1633540842.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 06/10/2021 19:40, Rahul Singh wrote:
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 3f9fff653a..78b1ddf0b8 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -644,6 +644,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>   
>       ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>                                  ("vuart", libxl_vuart_type),
> +                               ("vpci", libxl_defbool),

I have posted some comments regarding the field in v4. To summarize, 
AFAICT, this option is meant to be only set by libxl but you still let 
the toolstack (e.g. xl, libvirt) to set it.

If you still want to expose to the toolstack, then I think the option 
should be outside of arch_arm. Otherwise, this should be moved in an 
internal structure (Ian, do you have any suggestion?).

Cheers,

-- 
Julien Grall

