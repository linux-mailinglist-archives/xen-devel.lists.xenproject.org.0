Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E23415A2F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 10:41:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193509.344676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTKIP-0001Mz-UB; Thu, 23 Sep 2021 08:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193509.344676; Thu, 23 Sep 2021 08:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTKIP-0001L4-R6; Thu, 23 Sep 2021 08:41:33 +0000
Received: by outflank-mailman (input) for mailman id 193509;
 Thu, 23 Sep 2021 08:41:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mTKIO-0001Ky-LJ
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 08:41:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTKIN-0003PT-LX; Thu, 23 Sep 2021 08:41:31 +0000
Received: from [202.153.84.92] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTKIN-0006UR-BN; Thu, 23 Sep 2021 08:41:31 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=oGTGb53KwrXJZg3OWCEohSAIq+O4UDOxgTZE1KabNu8=; b=dHjVg5h0MG4trwUFjF/moW1+Fy
	RnOgVHvXbObqh/SGYxItZAGPnDyNAGNKWvu5HotRUfKbr9BpFw2zNGvbzJQWmRrASTQ759d1rhd3/
	4gyZkz9pdBgOQcKT0ACZnvmIDkrFSQw7Ay7EYYmX2pN2P5/QLhfz4lhVwn0sCFx6G+OE=;
Subject: Re: [PATCH v2 6/6] gnttab: allow disabling grant table per-domain
To: Juergen Gross <jgross@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <20210922082123.54374-7-roger.pau@citrix.com>
 <b900f179-c6c2-00f5-e531-5110307fa491@xen.org>
 <c6dc7f81-0c4a-5c2f-1ac8-bb3ce5a58120@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4ff81f6e-a422-3d96-0089-9c7325371937@xen.org>
Date: Thu, 23 Sep 2021 13:41:26 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c6dc7f81-0c4a-5c2f-1ac8-bb3ce5a58120@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 22/09/2021 14:38, Juergen Gross wrote:
> On 22.09.21 11:19, Julien Grall wrote:
>> Hi Roger,
>>
>> On 22/09/2021 13:21, Roger Pau Monne wrote:
>>> Allow setting max_grant_version to 0 in order to disable grant table
>>> usage by a domain. This prevents allocating the grant-table structure
>>> inside of Xen and requires guards to be added in several functions in
>>> order to prevent dereferencing the structure.
>>>
>>> Note that a domain without a grant table could still use some of the
>>> grant related hypercalls, it could for example issue a GNTTABOP_copy
>>> of a grant reference from a remote domain into a local frame.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>>   docs/man/xl.cfg.5.pod.in     |   4 +-
>>>   tools/libs/light/libxl_dom.c |   2 +-
>>>   xen/common/grant_table.c     | 100 +++++++++++++++++++++++++++++++++--
>>>   3 files changed, 98 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
>>> index c5a447dfcd..d507540c2c 100644
>>> --- a/docs/man/xl.cfg.5.pod.in
>>> +++ b/docs/man/xl.cfg.5.pod.in
>>> @@ -583,8 +583,8 @@ L<xl.conf(5)>.
>>>   =item B<max_grant_version=NUMBER>
>>>   Specify the maximum grant table version the domain is allowed to 
>>> use. Current
>>> -supported versions are 1 and 2. The default value is settable via
>>> -L<xl.conf(5)>.
>>> +supported versions are 1 and 2. Setting to 0 disables the grant 
>>> table for the
>>> +domain. The default value is settable via L<xl.conf(5)>.
>>
>> Technically, the version only applies to format of the table for 
>> granting page. The mapping itself is version agnostic. So this feels a 
>> bit wrong to use max_grant_version to not allocate d->grant_table.
>>
>> I also can see use-cases where we may want to allow a domain to grant 
>> page but not map grant (for instance, a further hardening of XSA-380). 
>> Therefore, I think we want to keep max_grant_version for the table 
>> itself and manage the mappings separately (possibly by letting the 
>> admin to select the max number of entries in the maptrack).
> 
> You mean the already existing domain config option max_maptrack_frames?

Yes. I didn't realize we already had an option for that :).

Cheers,

-- 
Julien Grall

