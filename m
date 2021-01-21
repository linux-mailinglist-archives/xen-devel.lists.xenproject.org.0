Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 176D52FE78F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 11:28:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71990.129352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2XC1-0006rh-Nh; Thu, 21 Jan 2021 10:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71990.129352; Thu, 21 Jan 2021 10:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2XC1-0006rI-KY; Thu, 21 Jan 2021 10:27:57 +0000
Received: by outflank-mailman (input) for mailman id 71990;
 Thu, 21 Jan 2021 10:27:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH6i=GY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2XBz-0006r9-I6
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 10:27:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63fd445c-96ea-4e34-b304-815f152f2b64;
 Thu, 21 Jan 2021 10:27:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 10CB5AB7A;
 Thu, 21 Jan 2021 10:27:54 +0000 (UTC)
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
X-Inumbo-ID: 63fd445c-96ea-4e34-b304-815f152f2b64
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611224874; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ilr2Y3d9TXRrAqwdx00phSIblAZCT2Rd4+CVsRP5WJo=;
	b=ZyJOdpnqvq78jYIfH7JNroSAln3ujB2+goSAMERk4OPhHbjYt6stWGpcLjLQCsfkfMqH9W
	PLsLjwcTesy9fESEB7EiVm6LTcwelo1qsZjsHBZAporq48x9tkQRalqP5byyT6UpHTjS8b
	L+D0exPbxBSy4HoXRytfhWhkL62P3HE=
Subject: Re: [PATCH V4 09/24] xen/ioreq: Make x86's IOREQ related dm-op
 handling common
To: Oleksandr <olekstysh@gmail.com>
Cc: Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-10-git-send-email-olekstysh@gmail.com>
 <016657f8-371f-eba6-60ce-29741f0823b7@suse.com>
 <832cbb2f-a3dd-c97d-b35a-951fed63ad2b@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ed01dc68-2b55-4525-6f79-f9a7f0945699@suse.com>
Date: Thu, 21 Jan 2021 11:27:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <832cbb2f-a3dd-c97d-b35a-951fed63ad2b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.01.2021 11:23, Oleksandr wrote:
> I would like to clarify regarding do_dm_op() which is identical for both 
> arches and could *probably* be moved to the common code (we can return 
> common dm.c back to put it there) and make dm_op() global.
> Would you/Paul be happy with that change? Or there are some reasons 
> (which we are not aware of yet) for not doing it this way?

Probably reasonable to do; the only reason not to that I
could see is that then dm_op() has to become non-static.

Jan

