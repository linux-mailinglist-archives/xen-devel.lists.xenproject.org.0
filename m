Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B37337607
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 15:45:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96646.183069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMYC-0007w8-NH; Thu, 11 Mar 2021 14:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96646.183069; Thu, 11 Mar 2021 14:44:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMYC-0007vj-KL; Thu, 11 Mar 2021 14:44:32 +0000
Received: by outflank-mailman (input) for mailman id 96646;
 Thu, 11 Mar 2021 14:44:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QJ7d=IJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKMYB-0007vZ-88
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 14:44:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d39eb568-073b-492f-ba2f-ccd49e4b5ec1;
 Thu, 11 Mar 2021 14:44:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6BFC8AD72;
 Thu, 11 Mar 2021 14:44:29 +0000 (UTC)
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
X-Inumbo-ID: d39eb568-073b-492f-ba2f-ccd49e4b5ec1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615473869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IscWbjnVtI7ozSXwYlcHTZll37v+EaVHgEC/72Mdcn8=;
	b=ewJbRdY7UElPi3Agn5RlwrSxTxxILn7JMCa5pV16l5BZ00/ZKbpCd6VRObGo4IFHKd2E7p
	rC0AiIUNRw+ydfVdAGsC+W+9I1HqF5K2K25fyHNqV/BmyufMCszu+aDZ/U36eJc0ooFja+
	v/DbQWRUyxzMQW451gw4a1T9UcnXF+I=
Subject: Re: [PATCH for-4.15 v2] xen/dmop: Strip __XEN_TOOLS__ header guard
 from public API
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>,
 Paul Durrant <paul@xen.org>
References: <20210310150722.27194-1-andrew.cooper3@citrix.com>
 <d375232a-d1a7-737c-0887-8b7e1c9a772d@suse.com>
 <13f03a67-18c2-e564-a0f6-84eccc7eeb76@citrix.com>
 <556ce32b-5087-b8b1-432e-643218dd8c6e@suse.com>
 <9ca069ab-8b6c-c8f1-d68b-4a9bb0cf5c56@citrix.com>
 <c8ed458a-6064-95d3-f189-f0928b09baca@suse.com>
 <62b79d56-2438-23ab-49c0-a8c4b290c4f7@citrix.com>
 <9a248354-f68b-8cba-f18c-f4a26473f9bf@suse.com>
 <586f5bcc-9d96-dc37-2aa1-aed0bf11117c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0779dcee-4aa1-019c-3e6d-5b6330e395ee@suse.com>
Date: Thu, 11 Mar 2021 15:44:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <586f5bcc-9d96-dc37-2aa1-aed0bf11117c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.03.2021 14:43, Andrew Cooper wrote:
> On 11/03/2021 13:28, Jan Beulich wrote:
>> On 11.03.2021 14:00, Andrew Cooper wrote:
>>> However, having laid things out in this way today, it occurs to me that
>>> we should consider further cleanup as well.
>>>
>>> I do agree that code wanting to use the libxendevicemodel.h API almost
>>> certainly don't want/need the dmop ABI.  (i.e. an individual consumer
>>> will want one, or the other, but almost certainly not both together).
>>>
>>> Should libxendevicemodel.h really be including dm_op.h?
>> I was indeed wondering.
>>
>>>   AFAICT, it is
>>> only the ioserverid_t typedef which is API shared between the two
>>> contexts, and we can trivially typedef that locally.
>> Hmm, a local typedef isn't nice - there should be one central point.
>> Granted there's no risk for this to change in anywhere halfway
>> foreseeable future, but still. Also neither C89 nor C99 allow a
>> typedef to be repeated - in those versions we'd then rely on an
>> extension.
> 
> I wonder if we're depending on that extension elsewhere.  As far as the
> stable libraries go, we are dependent on a Linux or BSD environment
> currently.

Right, but we'd like the headers to be consumable by any environment.

> Alternatively we can drop the typedef and use uint16_t instead without
> breaking things in practice.  (As long as we make the change in 4.15 and
> we lose the wiggle room afforded us by the entire interface being behind
> __XEN_TOOLS__ previously).
> 
> Thoughts?  I can't think of any ifdefary which would help, and swapping
> to uint16_t would reduce the use of an improperly namespaced identifier.

I'm not outright against, but this might inspire people to use
uint16_t elsewhere too, when they should use the typedef. How
about a transient #define (suitably commented)?

Jan

