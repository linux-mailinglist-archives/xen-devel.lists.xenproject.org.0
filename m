Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5459B27268E
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 16:02:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKMP1-0005h4-2J; Mon, 21 Sep 2020 14:02:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kKMOz-0005gr-DJ
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 14:02:45 +0000
X-Inumbo-ID: b992dcc5-59cd-4174-b392-755791ff288a
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b992dcc5-59cd-4174-b392-755791ff288a;
 Mon, 21 Sep 2020 14:02:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600696964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tOM/Pt9gUa/sDt0PyyduVjgfTe0kAbzbOVUCL2yb+S8=;
 b=jLQnwHGcbxDxG6YKk6GSPZDMEpav1dkLhZ18gTuAM3d44hzT1NFJFsSofvXJ7XZJzzTfbB
 GehIoZtIERD/Tefs3/Bt446Uyt3CHxqoj2D+b7XGkTizxBRe7HDyqymWLr3bkLxHgTlAFp
 v4L9y7+vLBtDwaZ4AJrQyVUcKDFbNns=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 05118B03F;
 Mon, 21 Sep 2020 14:03:20 +0000 (UTC)
Subject: Re: Memory ordering question in the shutdown deferral code
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Xia, Hongyan"
 <hongyxia@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <468576ba-8d3f-98e9-e65e-1128b5220d40@xen.org>
 <a75efed4-d435-1746-85ab-a87b328c1101@xen.org>
 <92a6373003e142e9943a4057024a2616@EX13D32EUC003.ant.amazon.com>
 <ad81f6ac-6127-bea8-a503-d16d3dc175df@xen.org>
 <80e221e0-a1d5-4cc1-b083-1e8f537f016c@suse.com>
 <6909eb6bc4dd4f16b4cd2f8119b3144d@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <19fb5697-ab78-30f9-e95a-042f5dddc712@suse.com>
Date: Mon, 21 Sep 2020 16:02:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6909eb6bc4dd4f16b4cd2f8119b3144d@EX13D32EUC003.ant.amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21.09.2020 15:35, Durrant, Paul wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 21 September 2020 14:32
>>
>> On 21.09.2020 15:27, Julien Grall wrote:
>>> I think this part is racy at least on non-x86 platform as x86 seems to
>>> implement smp_mb() with a strong memory barrier (mfence).
>>
>> The "strength" of the memory barrier doesn't matter here imo. It's
>> the fully coherent memory model (for WB type memory) which makes
>> this be fine on x86. The barrier still only guarantees ordering,
>> not visibility.
>>
> 
> In which case I misunderstood what the 'smp' means in this context then.

I find this confusing too, at times. But according to my reading
of the doc the "smp" in there really only means "simple compiler
barrier when UP".

Jan

