Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C1C2D2DA7
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 15:58:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47506.84056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmeRZ-0005nw-TA; Tue, 08 Dec 2020 14:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47506.84056; Tue, 08 Dec 2020 14:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmeRZ-0005nX-Pv; Tue, 08 Dec 2020 14:58:21 +0000
Received: by outflank-mailman (input) for mailman id 47506;
 Tue, 08 Dec 2020 14:58:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmeRY-0005nS-9m
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 14:58:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d25603db-62aa-45d3-a1da-deaf3ef9b739;
 Tue, 08 Dec 2020 14:58:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 82F96AC9A;
 Tue,  8 Dec 2020 14:58:18 +0000 (UTC)
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
X-Inumbo-ID: d25603db-62aa-45d3-a1da-deaf3ef9b739
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607439498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+jgd78D59i4R04e+1pdQQfXhaDttc6ehT1IeLzQPV4A=;
	b=NmrwJPYfZfmbF0UWwR24PckTi3IELB4yklkMJ84P5OfwT4jBEUftdCNrZpmblQx/yoRsvU
	qMoy7zr1o1y8KdIf0r3xyLjdDRUbaNmElAn5WbhIsdshYnyS+3ngcoZv/Q9ttzK0z6A4Ph
	JHg4IHr+6TDUMVDHXCJWqKtwXYJ6h70=
Subject: Re: [PATCH] xen: CONFIG_PV_SHIM_EXCLUSIVE and CONFIG_HVM are mutually
 exclusive
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20201208135146.30540-1-jgross@suse.com>
 <6d68bb96-b57f-f13a-9242-47bb8bb7fc86@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0a1f7c01-4466-5e2f-2f50-b174e2ba9edf@suse.com>
Date: Tue, 8 Dec 2020 15:58:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <6d68bb96-b57f-f13a-9242-47bb8bb7fc86@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.12.2020 15:33, Andrew Cooper wrote:
> On 08/12/2020 13:51, Juergen Gross wrote:
>> With CONFIG_PV_SHIM_EXCLUSIVE some sources required for CONFIG_HVM are
>> not built, so let CONFIG_HVM depend on !CONFIG_PV_SHIM_EXCLUSIVE.
>>
>> Let CONFIG_HVM default to !CONFIG_PV_SHIM instead.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> So while this will fix the randconfig failure, the statement isn't
> true.  There are HVM codepaths which aren't even dead in shim-exclusive
> mode.
> 
> The problem here is the way CONFIG_PV_SHIM_EXCLUSIVE abuses the Kconfig
> system.  What is currently happening is that this option is trying to
> enforce the pv shim defconfig in the dependency system.
> 
> We already have a defconfig, which is used in appropriate locations.  We
> should not have two different things fighting over control.
> 
> This is the fault of c/s 8b5b49ceb3d which went in despite my
> objections.  The change is not related to PV_SHIM_EXCLUSIVE - it is to
> do with not supporting a control domain, which a) better describes what
> it is actually doing, and b) has wider utility than PV Shim.

Would you mind pointing me at where you had voiced objections
to that change? I've just searched both my inbox and the list
archives, without finding any. I only recall your objections
to the patch I sent later which is similar to Jürgen's. And
I'm quite certain I'd have stayed away from committing anything
while aware of unresolved objections, even if - more often than
not - this means waiting almost indefinitely, which I don't
appreciate as a way to deal with disagreement.

From what you further state, I derive that you'd like to see
e.g. !PV_SHIM_EXCLUSIVE be a dependency of a new CONTROL_DOMAIN
Kconfig setting? I'm not sure though I see how this would help
the situation (I'm not even sure what scope this control would
have: just domctl, or also sysctl, or additionally platform-op).
Nor do I see what's wrong with forcing HVM off in shim-exclusive
builds - there can't be HVM domains in such a configuration (but
I'm pretty sure I said so somewhere else already, without ever
hearing back, albeit it apparently wasn't on either of the
patches' threads according to my outbox).

Jan

