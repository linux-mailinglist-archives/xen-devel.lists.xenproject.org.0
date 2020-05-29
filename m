Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F21B1E7B1F
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:02:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jecmO-0003qU-Ff; Fri, 29 May 2020 11:02:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jecmM-0003qP-Tx
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:02:22 +0000
X-Inumbo-ID: de166b08-a19b-11ea-a893-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de166b08-a19b-11ea-a893-12813bfff9fa;
 Fri, 29 May 2020 11:02:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9C6B7AD09;
 Fri, 29 May 2020 11:02:19 +0000 (UTC)
Subject: Re: Xen XSM/FLASK policy, grub defaults, etc.
To: Ian Jackson <ian.jackson@citrix.com>
References: <24270.35349.838484.116865@mariner.uk.xensource.com>
 <0D83AAA6-A205-4256-8A38-CC8122AC063D@citrix.com>
 <24272.59646.746545.343358@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4a8e7cf2-8f63-d4d2-e051-9484a5b8c8ed@suse.com>
Date: Fri, 29 May 2020 13:02:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <24272.59646.746545.343358@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "cjwatson@debian.org" <cjwatson@debian.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.05.2020 12:50, Ian Jackson wrote:
> George Dunlap writes ("Re: Xen XSM/FLASK policy, grub defaults, etc."):
>>> On May 27, 2020, at 4:41 PM, Ian Jackson <ian.jackson@citrix.com> wrote:
>>> 3. Failing that, Xen should provide some other mechanism which would
>>> enable something like update-grub to determine whether a particular
>>> hypervisor can sensibly be run with a policy file and flask=enforcing.
>>
>> So you want update-grub to check whether *the Xen binary it’s creating entries for* has FLASK enabled.  We generally include the Xen config used to build the hypervisor — could we have it check for CONFIG_XSM_FLASK?
> 
> That would be a possibility.  Including kernel configs has gone out of
> fashion but I think most distros ship them.
> 
> Are we confident that this config name will remain stable ?

Well, if it's to be used like this, then we'll have to keep it
stable if at all possible. But that's the reason why I dislike
the .config grep-ing approach (not just for Xen, also for
Linux). It would imo be better if the binary included something
that can be queried. Such a "something" is then much more
logical to keep stable, imo. This "something" could be an ELF
note, for example (assuming a similar problem to the one here
doesn't exist for xen.efi, or else we'd need to find a solution
there, too).

Jan

