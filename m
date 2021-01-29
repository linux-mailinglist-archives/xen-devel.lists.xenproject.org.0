Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D083308722
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 09:49:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77795.141129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5PSi-0001LX-SN; Fri, 29 Jan 2021 08:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77795.141129; Fri, 29 Jan 2021 08:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5PSi-0001L8-Ow; Fri, 29 Jan 2021 08:49:04 +0000
Received: by outflank-mailman (input) for mailman id 77795;
 Fri, 29 Jan 2021 08:49:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5PSi-0001L3-51
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 08:49:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6ee815a-c5a0-4cfd-a64b-a2fcf09c06f7;
 Fri, 29 Jan 2021 08:49:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 585C8AF27;
 Fri, 29 Jan 2021 08:49:02 +0000 (UTC)
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
X-Inumbo-ID: a6ee815a-c5a0-4cfd-a64b-a2fcf09c06f7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611910142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oXB7Tb6GR3ZWTcpLoorkCt1kOMR0SnzmbgMlc6L9r5o=;
	b=jIiaQAcO5KF6JZY4qNamwSldT9nwVkHxLWcjjchHF8zm52bSmuV3YnfQBzhdOdSSkC/t9G
	E/MY//ZhlZi+MBmUodnZGY7cnjmSF+I3zPgvujRNaZbi/i/7AhgBkdmqMZSaf3JFVxW2At
	ydfLk9QzCZ5t9HRS/7E2utvHqAWXkDU=
Subject: Re: [PATCH V6 00/24] IOREQ feature (+ virtio-mmio) on Arm
To: Wei Chen <Wei.Chen@arm.com>, Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <Julien.Grall@arm.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Kaly Xin <Kaly.Xin@arm.com>,
 Artem Mygaiev <joculator@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
 <DB7PR08MB3753D1F61623C538FCEF77059EB99@DB7PR08MB3753.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9b21efce-42c9-1bdd-e97b-342dd6130620@suse.com>
Date: Fri, 29 Jan 2021 09:49:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <DB7PR08MB3753D1F61623C538FCEF77059EB99@DB7PR08MB3753.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.01.2021 09:13, Wei Chen wrote:
> I just tested the v6 and the latest backend service with the latest staging branch.
> They work well. 
> 
> Tested-by: Wei Chen <Wei.Chen@arm.com>

An faod this was again Arm-only testing?

Jan

