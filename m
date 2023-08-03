Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B11A76F07A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 19:17:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576533.902778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRbwz-00037I-Ik; Thu, 03 Aug 2023 17:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576533.902778; Thu, 03 Aug 2023 17:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRbwz-00034W-Et; Thu, 03 Aug 2023 17:17:25 +0000
Received: by outflank-mailman (input) for mailman id 576533;
 Thu, 03 Aug 2023 17:17:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0usr=DU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qRbwx-00033Z-NR
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 17:17:23 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a175a9b-3221-11ee-b269-6b7b168915f2;
 Thu, 03 Aug 2023 19:17:22 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691083031153710.1109667925965;
 Thu, 3 Aug 2023 10:17:11 -0700 (PDT)
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
X-Inumbo-ID: 9a175a9b-3221-11ee-b269-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1691083032; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gz4cRN/UxO1k9s/AeHLVWvWE7UGRKSMCOvgsJYYJMPiD7a7TPQqI5n4ZTpVu1uU1XvLCHgV+Maty7ymb0pL7PslJP7bgT7gtkYsStEz4mBbxGbwXHhN4aAZLtm1ZEhKWNFZub1aXbDq08EoyTcQUBqphT8Zi1zQeEeAMob03nw4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691083032; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=AmEf/+ki1UJIP4coeTooEdy1afIkuTFZimjus8hcjZc=; 
	b=N2X5Yd9Mx4hU2ZaPbKyUtia56cA9xJPr8mpLDByH8dmw3g+t95jn8zLwRzXJL+zJTVCqbVIbfd2xUuNLU+im25EweqVk7cvfgaWOrqDw/BwZIrvEH2t59/sMKH91LY/+wikBVYl6YZdusncEG9AkrxwNlxKjiDtDXT7A9NQDqDE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691083032;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=AmEf/+ki1UJIP4coeTooEdy1afIkuTFZimjus8hcjZc=;
	b=hmEKx9wCh+NW3rupnWwk4ZGDvlaNQ6mlgDuvxsIekmSYdognA3tBw05jWmLL9VaB
	ZDtWVvs5/VhnQSu1xzJHTsxUEeI39yGcx6IXCYAa8KrwPnEVmB1M7gfF6YdHW9Lymnl
	ciUB/qoV/ES2lxQ+coYNqIE/E/gatLg1o02N5qAg=
Message-ID: <b9fdd60a-e847-76a8-f29e-a431fae6d9ba@apertussolutions.com>
Date: Thu, 3 Aug 2023 13:17:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] docs: update hyperlaunch device tree
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230803104438.24720-1-dpsmith@apertussolutions.com>
 <20230803104438.24720-2-dpsmith@apertussolutions.com>
 <52a02ef3-80a7-9000-4644-38adbb5a2573@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <52a02ef3-80a7-9000-4644-38adbb5a2573@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/3/23 08:19, Jan Beulich wrote:
> On 03.08.2023 12:44, Daniel P. Smith wrote:
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -332,6 +332,15 @@ M:	Nick Rosbrook <rosbrookn@gmail.com>
>>   S:	Maintained
>>   F:	tools/golang
>>   
>> +HYPERLAUNCH
>> +M:	Daniel P. Smith <dpsmith@apertussolutions.com>
>> +M:	Christopher Clark <christopher.w.clark@gmail.com>
>> +W:	https://wiki.xenproject.org/wiki/Hyperlaunch
>> +S:	Supported
>> +F:	docs/design/launch/hyperlaunch.rst
>> +F:	docs/design/launch/hyperlaunch-devicetree.rst
>> +F:	xen/common/domain-builder/
> 
> I would generally suggest that maintainership changes come in a separate
> patch. Furthermore aiui lots of stuff is going to be moved from elsewhere,
> and such code may better stay under its original maintainership (unless
> it was agreed that it would shift). So initially maybe best to name the
> original maintainers here under M: and add the two of you with R: ?

I can do this as a separate patch and mark it as fix for `d4f3125f1b 
docs/designs/launch: Hyperlaunch design document` where Christopher and 
I are the original authors of the only existing files covered under this 
new MAINTAINERSHIP entry currently.

As far as code moving here, the dom0less rebranding proposal called for 
an additional MAINTAINERS section titled HYPERLAUNCH DOM0LESS 
COMPATIBILITY that would retain the maintainers (or new ones if Arm 
wanted to propose others) from the ARM section.

The purpose of putting Christopher and I at the top are for several reasons,

  - The code in v1 was conglomerations of reuses/relocated code and a 
substantial amount of new code around it.

- As mentioned regarding the HYPERLAUNCH DOM0LESS COMPATIBILITY section, 
there may be paths below HYPERLAUNCH that are owned by others, but 
ultimately we conceived, designed, and created the capability. So it 
falls on us to ensure anything done in sub-feature, doesn't break or 
violate the larger design we sought to achieve while also not letting it 
fall back on THE REST.

> I also don't think it makes sense to include a not-yet-populated path
> here; who knows what this is going to change to by the time things get
> committed.

Well, if my proposed plan is executed as I suggested, hopefully there 
would be a series very soon that would move the dom0less device tree 
parsing under that path. Now to be inline with the above and address 
your concern, as the HYPERLAUNCH DOM0LESS COMPATIBILITY section is added 
to cover the file(s) the series adds, the HYPERLAUNCH section could then 
be updated with the top level path.

v/r,
dps

