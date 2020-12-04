Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C11F2CEB9F
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 11:03:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44308.79426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl7ul-0007YA-Th; Fri, 04 Dec 2020 10:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44308.79426; Fri, 04 Dec 2020 10:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl7ul-0007Xl-QG; Fri, 04 Dec 2020 10:02:11 +0000
Received: by outflank-mailman (input) for mailman id 44308;
 Fri, 04 Dec 2020 10:02:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c9tS=FI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kl7uk-0007Xg-DJ
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 10:02:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fb25cac-dc63-4e1c-909b-5931cc4c5452;
 Fri, 04 Dec 2020 10:02:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A9816AFB4;
 Fri,  4 Dec 2020 10:02:08 +0000 (UTC)
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
X-Inumbo-ID: 2fb25cac-dc63-4e1c-909b-5931cc4c5452
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607076128; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yWdjWukSl+2mN1AWCmKhG0bEjMooLyrm1HRLOc99GTs=;
	b=T0cs8FczasGJrkUjdPIKLQ+aFXUAAtVp8jUmPvvmjDIA+0dV1NMZkslQPXoibrOQeqaiAS
	OKsmzla9oCWQcrpfOu2r/j47uHWCf30vuDok1kbfvBsla6CUTLa/WUPCSntB9jHVRt9/sn
	rwx8Ogwyf2zoOjNrjsN9Mhd7Xhn/rlU=
Subject: Re: [PATCH] gnttab: don't allocate status frame tracking array when
 "gnttab=max_ver:1"
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a484cc88-f41d-5d38-d098-4eda297569a1@suse.com>
 <bf921997-fc9a-b1b9-78d9-7a7f85fe4608@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6fb5dd40-d9b8-a3c6-9616-070d5fadb59b@suse.com>
Date: Fri, 4 Dec 2020 11:02:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <bf921997-fc9a-b1b9-78d9-7a7f85fe4608@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02.12.2020 19:31, Julien Grall wrote:
> On 05/11/2020 15:55, Jan Beulich wrote:
>> This array can be large when many grant frames are permitted; avoid
>> allocating it when it's not going to be used anyway. 
> 
> Given there are not many users of grant-table v2, would it make sense to 
> avoid allocating the array until the guest start using grant-table v2?

Hmm, yes, seems possible. Let me give this a try.

Jan

