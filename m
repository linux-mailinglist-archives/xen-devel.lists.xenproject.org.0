Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AF536EB76
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 15:43:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120037.226972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6wY-0004e1-Kr; Thu, 29 Apr 2021 13:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120037.226972; Thu, 29 Apr 2021 13:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6wY-0004dc-HS; Thu, 29 Apr 2021 13:43:02 +0000
Received: by outflank-mailman (input) for mailman id 120037;
 Thu, 29 Apr 2021 13:43:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfjL=J2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lc6wX-0004dX-Fa
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 13:43:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a182b1e8-528f-4112-aa29-38e35d2beead;
 Thu, 29 Apr 2021 13:43:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E9C34B286;
 Thu, 29 Apr 2021 13:42:59 +0000 (UTC)
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
X-Inumbo-ID: a182b1e8-528f-4112-aa29-38e35d2beead
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619703780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uuUaKh06of2ktr9Q3/hKc7QkSEccf38zGi6lripnjTI=;
	b=HaPFUSpn6bLe8KW2D1opNh4pcEkWTlAgLnkeJv2ojxhItdc433XcRTJguG5C2UdtSp371W
	6QTO0gn07gd/6RcHJy9+5h6Lb4mAVX7H1NbYFX9Vh+TYy+70QOr3dCT454NEHQPge2DJfP
	TN6ZC6lFMy2pUBYmfSDhnudpDeffuzA=
Subject: Re: [PATCH] x86/ACPI: Fix build error when tboot is disabled
To: Costin Lupu <costin.lupu@cs.pub.ro>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <79df12ade0840338590f440cd064052a961fe23b.1619698239.git.costin.lupu@cs.pub.ro>
 <ce98780e-5a32-9faf-832e-04eae6cdfbcb@suse.com>
 <32cb6cda-5522-02fc-f800-9e4c279e45f6@cs.pub.ro>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fdcfbbcb-7657-6a48-b0a5-21b02593b36e@suse.com>
Date: Thu, 29 Apr 2021 15:42:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <32cb6cda-5522-02fc-f800-9e4c279e45f6@cs.pub.ro>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.04.2021 15:22, Costin Lupu wrote:
> On 4/29/21 3:40 PM, Jan Beulich wrote:
>> If there is a specific case where the compiler fails to DCE the
>> offending code, then you need to describe this in sufficient
>> detail.
> 
> Yes, indeed. My bad, it is for a debug build with -O0, so without DCE.

Iirc there's a series pending to switch to -Og; I don't think we
build with -O0 under any circumstances (for this very reason).

Jan

