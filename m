Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDAB1A7E50
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 15:37:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOLkN-0001gF-QY; Tue, 14 Apr 2020 13:37:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOLkM-0001g8-A4
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 13:37:02 +0000
X-Inumbo-ID: 04ea35d0-7e55-11ea-8935-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04ea35d0-7e55-11ea-8935-12813bfff9fa;
 Tue, 14 Apr 2020 13:37:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2A2E3ADC1;
 Tue, 14 Apr 2020 13:36:59 +0000 (UTC)
Subject: Re: preparations for 4.13.1 and 4.12.3
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <f8ecb6b1-00de-67c1-07c6-6fdb92dd63ae@suse.com>
 <dbce2a2e-4cfd-9838-564d-710e5f10ab53@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6b800158-9f05-1b91-e1ae-f368746852bb@suse.com>
Date: Tue, 14 Apr 2020 15:36:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <dbce2a2e-4cfd-9838-564d-710e5f10ab53@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.04.2020 15:07, Andrew Cooper wrote:
> On 09/04/2020 08:41, Jan Beulich wrote:
>> All,
>>
>> the releases are due in a week or two. Please point out backports
>> you find missing from the respective staging branches, but which
>> you consider relevant. (Ian, I notice there haven't been any
>> tools side backports at all so far. Julien, Stefano - same for
>> Arm.)
> 
> 540d4d60378c "cpu: sync any remaining RCU callbacks before CPU up/down"
> which fixes crashes after vcpu hotplug in shim.
> 
> It looks to depend on 53ddfc80a84a, a9b6dacf88fe, c301211a5111 and
> 53594c7bd197 which are other RCU bugfixes.

And cef21210fb133 as well as a6fe79a5979a then. Iirc we had even
talked about this on irc, and were largely in agreement that this
is a little beyond what we'd normally backport.

I have to admit that while I followed Igor's advice that there is
a dependency of his patch on Jürgen's work, I'm still not really
clear where that dependency actually lies. The patch merely moves
where rcu_barrier() gets invoked from (thus covering previously
uncovered places). If there hadn't been that named dependency, I
would have taken Igor's patch already.

Jan

