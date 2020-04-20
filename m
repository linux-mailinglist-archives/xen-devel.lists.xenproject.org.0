Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C29881B097F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 14:37:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQVfT-00039B-9W; Mon, 20 Apr 2020 12:36:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/8R=6E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQVfR-00038p-7S
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 12:36:53 +0000
X-Inumbo-ID: 9c896818-8303-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c896818-8303-11ea-9e09-bc764e2007e4;
 Mon, 20 Apr 2020 12:36:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C6866ABCE;
 Mon, 20 Apr 2020 12:36:50 +0000 (UTC)
Subject: Re: [PATCH v3] Introduce a description of the Backport and Fixes tags
To: Wei Liu <wl@xen.org>
References: <20200417222430.20480-1-sstabellini@kernel.org>
 <35b34e2f-e6cd-6afc-19fd-c7880ec0eace@xen.org>
 <20200420102710.cg3bmjlntgpxqj77@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a4cfb801-f0c5-f08d-02fc-c35820bccd87@suse.com>
Date: Mon, 20 Apr 2020 14:36:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420102710.cg3bmjlntgpxqj77@debian>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: lars.kurth@citrix.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, konrad.wilk@oracle.com,
 andrew.cooper3@citrix.com, Ian Jackson <ian.jackson@eu.citrix.com>,
 george.dunlap@citrix.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.04.2020 12:27, Wei Liu wrote:
> On Mon, Apr 20, 2020 at 10:31:28AM +0100, Julien Grall wrote:
>> On 17/04/2020 23:24, Stefano Stabellini wrote:
>>> Create a new document under docs/process to describe our special tags.
>>> Add a description of the Fixes tag and the new Backport tag. Also
>>> clarify that lines with tags should not be split.
>>>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>> CC: Ian Jackson <ian.jackson@eu.citrix.com>
>>> CC: Wei Liu <wl@xen.org>
>>> CC: jbeulich@suse.com
>>> CC: george.dunlap@citrix.com
>>> CC: julien@xen.org
>>> CC: lars.kurth@citrix.com
>>> CC: andrew.cooper3@citrix.com
>>> CC: konrad.wilk@oracle.com
>>> ---
>>> Removing Acks as I added the description of "Fixes"
>>> ---
>>>   docs/process/tags.pandoc | 55 ++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 55 insertions(+)
>>>   create mode 100644 docs/process/tags.pandoc
>>>
>>> diff --git a/docs/process/tags.pandoc b/docs/process/tags.pandoc
>>> new file mode 100644
>>> index 0000000000..06b06dda01
>>> --- /dev/null
>>> +++ b/docs/process/tags.pandoc
>>> @@ -0,0 +1,55 @@
>>> +Tags: No line splitting
>>> +-----------------------
>>> +Do not split a tag across multiple lines, tags are exempt from the
>>> +"wrap at 75 columns" rule in order to simplify parsing scripts.  For
>>> +example:
>>> +
>>> +        Fixes: 67d01cdb5 ("x86: infrastructure to allow converting certain indirect calls to direct ones")
>>
>> The SHA-1 ID is 9 characters but...
>>
>>> +
>>> +
>>> +Fixes Tag
>>> +---------
>>> +
>>> +If your patch fixes a bug in a specific commit, e.g. you found an issue using
>>> +``git bisect``, please use the 'Fixes:' tag with the first 12 characters of
>>> +the SHA-1 ID, and the one line summary.
>>
>> ... you request 12 characters here. Can you make sure the two match please?
>>
>> However, I am not entirely sure why we should mandate 12 characters. With
>> the title, you should always be able to find back the commit if there is a
>> clash.
> 
> This is copied from Linux's document.
> 
> I normally use 8-9 characters, but I don't mind using 12 either.

Are they still saying 9? I've been asked to switch to 12 several
weeks back ...

Jan

