Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1228780BFF
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 14:42:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586172.917384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWynw-0004Jz-2P; Fri, 18 Aug 2023 12:42:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586172.917384; Fri, 18 Aug 2023 12:42:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWynv-0004IK-Vr; Fri, 18 Aug 2023 12:42:15 +0000
Received: by outflank-mailman (input) for mailman id 586172;
 Fri, 18 Aug 2023 12:42:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWynu-0004IC-E6
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 12:42:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWynu-0000pX-2v; Fri, 18 Aug 2023 12:42:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWynt-0006rd-SF; Fri, 18 Aug 2023 12:42:13 +0000
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
	bh=KZr/i5DYyYyiZA3jg5siO5bP4DQZ62W2MOkzckUaYfc=; b=uCWzU+tZUQuLylzw82jd/Gbp/Y
	Gb55ft2RUP4ALAX3FCRYRzpdUii0shlq6ETIMtdXKzAC7j6rmtCcvkJAiTuIi5uZhWVoX6KMUIUaC
	i013SonyNS/468rHLS0qzjVR5pzNsA779GZbacuXyG2QUmFpqJ/K2NQWTK5Nh/2/+XyY=;
Message-ID: <19059e45-bd74-4404-96ee-4e3ac8b09022@xen.org>
Date: Fri, 18 Aug 2023 13:42:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/19] tools/xenstore: move xenstored sources into
 dedicated directory
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20230814074707.27696-1-jgross@suse.com>
 <20230814074707.27696-20-jgross@suse.com>
 <b9fc2c2e-7914-4484-92bf-403fbc0d9fee@xen.org>
 <0408a2b8-54f8-40dd-af42-d19a23df9143@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0408a2b8-54f8-40dd-af42-d19a23df9143@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 18/08/2023 13:14, Juergen Gross wrote:
> On 18.08.23 13:22, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 14/08/2023 08:47, Juergen Gross wrote:
>>> In tools/xenstore there are living xenstored and xenstore clients.
>>> They are no longer sharing anything apart from the "xenstore" in their
>>> names.
>>>
>>> Move the xenstored sources into a new directory tools/xenstored while
>>> dropping the "xenstored_" prefix from their names. This will make it
>>> clearer that xenstore clients and xenstored are independent from each
>>> other.
>>
>> In term of naming, I would prefer if we follow what was done for the 
>> console. I.e:
>>
>> xenstore/client: All the clients
>> xenstore/daemon: C Xenstored
>>
>> This would avoid the one character difference between the two 
>> directories.
> 
> Yes, that would be the alternative (apart from renaming the xenstore 
> directory
> to something different, e.g. xs-clients).

xs-clients would be OK. I guess you didn't suggest xenstore-clients 
because it is too long?

> 
> The reason I was leaning towards my solution was that the clients are 
> meant to
> be used with any xenstored implementation. This wouldn't be reflected by 
> using
> a common tools/xenstore parent directory for the clients and C xenstored.

You have a point. I was also trying to avoid to have too many directoy 
in tools. But we already have 'qemu-trad' and 'qemu-upstream'...

> 
> In the end I could live with your proposal, too.

My main concern with your proposal was the one character difference in 
the name. xenstored and xs-clients/xenstore-clients would work for me.

Cheers,

-- 
Julien Grall

