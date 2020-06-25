Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E7C20A256
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 17:47:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joU64-0007R7-Ds; Thu, 25 Jun 2020 15:47:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bi8a=AG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1joU63-0007Qz-37
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 15:47:27 +0000
X-Inumbo-ID: 29b8e56d-b6fb-11ea-81f9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29b8e56d-b6fb-11ea-81f9-12813bfff9fa;
 Thu, 25 Jun 2020 15:47:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 28502B0B7;
 Thu, 25 Jun 2020 15:47:25 +0000 (UTC)
Subject: Re: [PATCH] scripts: don't rely on "stat -" support
To: Ian Jackson <ian.jackson@citrix.com>
References: <691aebb4-87af-60df-b6ad-07cb6fef4167@suse.com>
 <24308.50838.149966.847431@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <64c6a187-bf90-ae69-793b-0651bedd4f88@suse.com>
Date: Thu, 25 Jun 2020 17:47:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <24308.50838.149966.847431@mariner.uk.xensource.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jandryuk@gmail.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.06.2020 17:45, Ian Jackson wrote:
> Jan Beulich writes ("[PATCH] scripts: don't rely on "stat -" support"):
>> While commit b72682c602b8 ("scripts: Use stat to check lock claim")
>> validly indicates that stat has gained support for the special "-"
>> command line option in 2009, we should still try to avoid breaking being
>> able to run on even older distros. As it has been determined, contary to
>> the comment in the script using /dev/stdin (/proc/self/fd/$_lockfd) is
>> fine here, as Linux specially treats these /proc inodes.
>>
>> Suggested-by: Ian Jackson <ian.jackson@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks.
> 
> The only code change here is this:
> 
>> --- a/tools/hotplug/Linux/locking.sh
>> +++ b/tools/hotplug/Linux/locking.sh
>> @@ -45,18 +45,14 @@ claim_lock()
>> -        if stat=$( stat -L -c '%D.%i' - $_lockfile 0<&$_lockfd 2>/dev/null )
>> +        if stat=$( stat -L -c '%D.%i' /dev/stdin $_lockfile 0<&$_lockfd 2>/dev/null )
> 
> Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
> 
> Has anyone executed this ?

I have, of course, to confirm this fixes my issue. But I'm not sure
that's what you've meant to ask - you may have wanted assurance
that someone else has also tried it.

Jan

