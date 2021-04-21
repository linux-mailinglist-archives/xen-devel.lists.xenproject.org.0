Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 285DE36689F
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 11:58:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114262.217698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9bs-00041N-J2; Wed, 21 Apr 2021 09:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114262.217698; Wed, 21 Apr 2021 09:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9bs-00040y-Fu; Wed, 21 Apr 2021 09:57:28 +0000
Received: by outflank-mailman (input) for mailman id 114262;
 Wed, 21 Apr 2021 09:57:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZ9bq-00040q-8s
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 09:57:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a05a73e-29fd-4a3f-a08f-793965053fb9;
 Wed, 21 Apr 2021 09:57:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 570D1B2E4;
 Wed, 21 Apr 2021 09:57:24 +0000 (UTC)
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
X-Inumbo-ID: 0a05a73e-29fd-4a3f-a08f-793965053fb9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618999044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1MWCgYJ9vm8dNUxTuxroyyeMbS6hF5EKzhdVBSxK0bw=;
	b=U9yOXTIr5M3IVsbiUHRMhGzgjad9RFTUKDPjnEDvtMTjceTi0xcjgrMDXqbblW46u5mJcR
	xYyXt+v+d+rItn5kNlpw1I3ijjYAdPouNn7Vna/XTDpKcin6tuxOSL5ILoxT5DjWNm4vf/
	qSXnk55F0owN3qo2DZq4T/0QiS9IsOk=
Subject: Re: [PATCH v4 2/3] x86/time: yield to hyperthreads after updating TSC
 during rendezvous
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <d929903c-0e7a-adb9-3317-b66782f13b36@suse.com>
 <81da85eb-2e8e-9b76-2fb3-2beddc33e9af@suse.com>
 <YH76RJTqvwYmvXu+@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <96811f9d-b55d-0b40-3629-1516c5a2ed0e@suse.com>
Date: Wed, 21 Apr 2021 11:57:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YH76RJTqvwYmvXu+@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 20.04.2021 17:59, Roger Pau Monné wrote:
> On Thu, Apr 01, 2021 at 11:54:27AM +0200, Jan Beulich wrote:
>> Since we'd like the updates to be done as synchronously as possible,
>> make an attempt at yielding immediately after the TSC write.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> Did you observe any difference with the pause inserted?

I wouldn't even know how to measure it precisely enough. So - no,
I haven't. In fact ...

> I wonder whether that's enough to give a chance the hyperthread to
> also perform the TSC write. In any case there's no harm from it
> certainly.

... I have an inquiry pending with Intel as to better (more
reliable) ways to yield, for quite a bit longer than the 8259 one,
yet with the same lack of any outcome so far. Until then it really
is going to be no more than "make an attempt", as said in the
commit message.

Jan

