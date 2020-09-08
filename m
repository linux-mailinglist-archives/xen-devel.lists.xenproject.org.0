Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C56D26126D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 16:12:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFeMN-0003CU-Lw; Tue, 08 Sep 2020 14:12:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yBuC=CR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFeMM-0003CP-84
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 14:12:34 +0000
X-Inumbo-ID: 534711cd-f4b0-4997-8326-c8e07ff373d4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 534711cd-f4b0-4997-8326-c8e07ff373d4;
 Tue, 08 Sep 2020 14:12:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 626BFAE33;
 Tue,  8 Sep 2020 14:12:32 +0000 (UTC)
Subject: Re: [PATCH] Arm64: fix build with gcc 10
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <4c3c3f21-29bf-268c-039e-5adecff05f3a@suse.com>
 <1edce029-34ef-4a49-fff3-c60e91bfaa64@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <720a90d7-82e5-d975-d2fb-a197981ddd49@suse.com>
Date: Tue, 8 Sep 2020 16:12:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1edce029-34ef-4a49-fff3-c60e91bfaa64@xen.org>
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

On 08.09.2020 15:03, Julien Grall wrote:
> I would suggest: "xen/arm64: Force GCC to always inline generic atomics 
> helpers".
> 
> On 08/09/2020 13:53, Jan Beulich wrote:
>> With gcc10 inlining is (no longer?) the default for certain atomics.
> 
> How about the following:
> 
> "Recent versions of GCC (at least GCC10) will not inline generic atomics 
> helpers. Instead it will expect the software to either link with 
> libatomic.so or implement the helpers.
> 
> To keep the previous behavior, force GCC to always inline the generic 
> atomics helpers.
> 
> Long term we probably want to avoid relying on GCC atomics helpers as 
> this doesn't allow us to switch between LSE and LL/SC atomic.
> "

Fine with me; I've edited it further very slightly.

Jan

