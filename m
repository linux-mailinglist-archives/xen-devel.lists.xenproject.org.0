Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C85F3502C7
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 16:53:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103989.198401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRcDw-00054P-5l; Wed, 31 Mar 2021 14:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103989.198401; Wed, 31 Mar 2021 14:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRcDv-00053z-WF; Wed, 31 Mar 2021 14:53:36 +0000
Received: by outflank-mailman (input) for mailman id 103989;
 Wed, 31 Mar 2021 14:53:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPDw=I5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRcDu-00053u-GB
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 14:53:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d92396d-c0dc-45d2-b0fb-9a5a4e6a1300;
 Wed, 31 Mar 2021 14:53:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CC25AB30F;
 Wed, 31 Mar 2021 14:53:32 +0000 (UTC)
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
X-Inumbo-ID: 3d92396d-c0dc-45d2-b0fb-9a5a4e6a1300
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617202412; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOu2KMufkpCGa1JEXFcSmFm9khbcT6sblcFBLElSEno=;
	b=CMY8JHUVVQU6ArfjPiHJMJVjvaoWtU68imR856XZDjw3QafhNNGFUSTrc9r6uXr6Xa7eoP
	Q9nJaY3sEU53qJFqrwCW9bJwE7OZA7fpgttv2AXIDD3JT57u/wD9MAKh0db0DGl2NGta4e
	hGCyRha4pJuwJnIp7zbHR22ejmVrspY=
Subject: Re: [PATCH] CHANGELOG.md: Make PV shim smaller by factoring out
 HVM-specific shadow code
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul.durrant@citrix.com>
References: <20210324172608.302316-1-george.dunlap@citrix.com>
 <f41680a0-9415-ea2e-c1e3-db8b0552823c@suse.com>
 <FB9CBC51-5793-41DD-A331-5274E6A82AF4@citrix.com>
 <23461afc-c0e0-eb33-9ed3-52f050b6aef0@suse.com>
 <27ecde00-f0aa-b701-6928-5480ed805064@citrix.com>
 <2A1FCD39-D0C0-468D-A977-2FBF7126FDE6@citrix.com>
 <24676.32400.548088.26254@mariner.uk.xensource.com>
 <1a87cfa9-d6c0-5da5-ea07-eae47186da9a@suse.com>
 <1832DBFA-B215-4CEA-9C8A-F53F2A5321E9@citrix.com>
 <9b899068-e0df-3f5f-5537-b9ff81bfa279@suse.com>
 <E58F7AAD-AD1B-4334-BE11-2AF746E8D198@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <90697fc8-00f4-6679-f465-997bbcb131d2@suse.com>
Date: Wed, 31 Mar 2021 16:53:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <E58F7AAD-AD1B-4334-BE11-2AF746E8D198@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 31.03.2021 16:30, George Dunlap wrote:
> 
> 
>> On Mar 31, 2021, at 3:06 PM, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 31.03.2021 16:00, George Dunlap wrote:
>>>
>>>
>>>> On Mar 31, 2021, at 2:54 PM, Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 31.03.2021 15:52, Ian Jackson wrote:
>>>>> George Dunlap writes ("Re: [PATCH] CHANGELOG.md: Make PV shim smaller by factoring out HVM-specific shadow code"):
>>>>>> I don’t understand why the two of you are downplaying your work so much. Yes, these are all only incremental improvements; but they are improvements; and the cumulative effect of loads of incremental improvements can be significant.  Communicating to people just what the nature of all these incremental improvements are is important.
>>>>>
>>>>> I agree with George here.
>>>>>
>>>>> There ae a number of reasons why behind-the-scenes work with little
>>>>> (intentional) user-visible impact are useful to note in the
>>>>> CHANGELOG.md.  With my Release Manager hat on I would like to see, for
>>>>> example,
>>>>>
>>>>>>> + - Factored out HVM-specific shadow code, allowing PV shim to be slimmer
>>>>>
>>>>> something about htis work in the CHANGELOG.md.
>>>>>
>>>>> IDK precisely, and I don't think George does either, what a good and
>>>>> accurate statement is.  But I guess we will go with the text above if
>>>>> we don't get something better.
>>>>
>>>> At the very least the part after the comma ought to be deleted. As
>>>> said in an earlier reply, at least the shim default config disables
>>>> shadow code anyway, so the factoring out has no effect there.
>>>
>>> Thanks.  So when you wrote the series, what was your motivation?  Did you have a particular technical outcome in mind?  Or did it just bother you that there was HVM-only code in a PV-only build? :-)
>>
>> What bothers me are more the implications - it being rather hard in
>> many cases, and in particular in shadow code, to be able to tell what
>> paths are involved in the handling of what kind(s) of guests. This
>> has made more time consuming investigation of (suspected) misbehavior
>> in more than one case.
> 
> OK, so how about:
> 
> - Factored out HVM-specific shadow code, improving code clarity and reducing the size of PV-only hypervisor builds

This sounds okay to me.

Thanks, Jan

