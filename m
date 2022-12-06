Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D631644E7B
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 23:19:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455643.713181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2gHr-00008o-Ii; Tue, 06 Dec 2022 22:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455643.713181; Tue, 06 Dec 2022 22:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2gHr-00006C-FS; Tue, 06 Dec 2022 22:19:39 +0000
Received: by outflank-mailman (input) for mailman id 455643;
 Tue, 06 Dec 2022 22:19:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2gHq-000064-9A
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 22:19:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2gHo-0004BH-Vp; Tue, 06 Dec 2022 22:19:36 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2gHo-0004jQ-Ot; Tue, 06 Dec 2022 22:19:36 +0000
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
	bh=6H4zowFRj0dcGo/Dh2rtIje78mf9Xu2exZ3ot2JrWHQ=; b=R5bShYLQFq9Q6KqlXl4vnNYJvN
	q+Ty3cYcv6hdsYde4saVaTPf2uH5VU+NQjBAaEYx1xLgPUapuM8ZP6rmA3GpODhyhowJpHGZfhcXD
	tNFDD99a+H74LQ6eGy240fT0I/J6ZkhCciGR4sjPB3oPliVIsQFF6cEOTB1FjvxAV+tM=;
Message-ID: <8c186d60-c4c8-dac2-68bb-adad0f93e4ec@xen.org>
Date: Tue, 6 Dec 2022 22:19:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 18/19] timers: Don't migrate timers during suspend
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
 <babd4e0c615c7f61c10b53ad884c68c85641ce7c.1665137247.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <babd4e0c615c7f61c10b53ad884c68c85641ce7c.1665137247.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/10/2022 11:32, Mykyta Poturai wrote:
> Migrating timers during suspend causes Dom0 to freeze after resume.

This wants a bit more details such as why dom0 will freeze. But looking 
at upstream, there might be some patches that (e.g. 37f82facd62f 
"xen/sched: migrate timers to correct cpus after suspend") could have 
solved a similar problem.

Cheers,

-- 
Julien Grall

