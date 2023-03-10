Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1106B5006
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 19:23:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508569.783351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pahOW-0007DC-B1; Fri, 10 Mar 2023 18:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508569.783351; Fri, 10 Mar 2023 18:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pahOW-0007Av-7Y; Fri, 10 Mar 2023 18:23:08 +0000
Received: by outflank-mailman (input) for mailman id 508569;
 Fri, 10 Mar 2023 18:23:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q69C=7C=chiark.greenend.org.uk=ijackson@srs-se1.protection.inumbo.net>)
 id 1pahOU-0007AY-CG
 for xen-devel@lists.xenproject.org; Fri, 10 Mar 2023 18:23:06 +0000
Received: from chiark.greenend.org.uk (v6.chiark.greenend.org.uk
 [2001:ba8:1e3::]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 966f9245-bf70-11ed-956e-85ef70e17bfa;
 Fri, 10 Mar 2023 19:23:02 +0100 (CET)
Received: by chiark.greenend.org.uk (Debian Exim 4.94.2 #2) with local
 (return-path ijackson@chiark.greenend.org.uk)
 id 1pahON-0000hS-Dg; Fri, 10 Mar 2023 18:22:59 +0000
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
X-Inumbo-ID: 966f9245-bf70-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=chiark.greenend.org.uk; s=c.chiark; h=DKIM-Signature-Warning:References:
	In-Reply-To:Subject:Cc:To:Date:Message-ID:Content-Transfer-Encoding:
	Content-Type:MIME-Version:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=+1UdwsCB6OqRIWNESAzcOD/MqmMCwm61CFlIOYaNfTM=; b=d+kGzXe/d9OP
	lrx88EGoSbGsERNVrPB7gvv0oVTR90bnI7zgOW7HDfDqjvdkR0iuf2weKhRK8q3SZQrgz/cKMMPVA
	9V0uYEbI6bDOKqeTAWsI3eGdHXSrpK5EEseT0qiGLl8KJvgoigTiq9PEE5kk07dUKZKNDptaid3j2
	vMWNkiL2z3/4MkYAseTyilHa38LJwHjFKOTuf0VKe0QnKqG7Uk0j+CMvcKD/wB6GKwxwwTh5ffMXy
	KoKp5ut/LpDk1LvzoeUHrR1LytH6uNMRcAz/G3Iw9nAmbSiUKGKtGPOWKwceHvJfin7QIkIJFagjP
	nRzi5c1LHOGrZBrTjkBhtQ==;
From: Ian Jackson <ijackson@chiark.greenend.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <25611.30083.331313.845838@chiark.greenend.org.uk>
Date: Fri, 10 Mar 2023 18:22:59 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: <xen-devel@lists.xenproject.org>
Subject: Re: [OSSTEST PATCH] PDU/IPMI: Be less aggressive with IPMI commands
In-Reply-To: <20230310170721.14493-1-anthony.perard@citrix.com>
References: <20230310170721.14493-1-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 27.1 (x86_64-pc-linux-gnu)
DKIM-Signature-Warning: NOTE REGARDING DKIM KEY COMPROMISE https://www.chiark.greenend.org.uk/dkim-rotate/README.txt https://www.chiark.greenend.org.uk/dkim-rotate/20/20778a84b8ea056027c57b730a5dde2a.pem

Anthony PERARD writes ("[OSSTEST PATCH] PDU/IPMI: Be less aggressive with IPMI commands"):
> The machine rimava0 doesn't power off or power on when we keep doing
> "power status" then "power off" ipmi command without waiting.
> 
> Currently, osstest does:
>     loop
> 	ipmitool power status
> 	ipmitool power off
> 	sleep 1
> 
> This loop goes on forever, the machine never change power state.
> Adding some wait in between both command works.

How sad.

> While here, test for timeout just after a status check instead of
> sending the `power off` command again which we would never check the
> result of.

Reviewed-by: Ian Jackson <ijackson@chiark.greenend.org.uk>

-- 
Ian Jackson <ijackson@chiark.greenend.org.uk>   These opinions are my own.  

Pronouns: they/he.  If I emailed you from @fyvzl.net or @evade.org.uk,
that is a private address which bypasses my fierce spamfilter.

