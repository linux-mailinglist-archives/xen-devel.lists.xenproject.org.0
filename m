Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA381E78F3
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 11:03:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeau6-0007rj-52; Fri, 29 May 2020 09:02:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jeau4-0007re-8g
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 09:02:12 +0000
X-Inumbo-ID: 14daf304-a18b-11ea-a881-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14daf304-a18b-11ea-a881-12813bfff9fa;
 Fri, 29 May 2020 09:02:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0A755AB3D;
 Fri, 29 May 2020 09:02:09 +0000 (UTC)
Subject: Re: Xen XSM/FLASK policy, grub defaults, etc.
To: George Dunlap <George.Dunlap@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>
References: <24270.35349.838484.116865@mariner.uk.xensource.com>
 <0D83AAA6-A205-4256-8A38-CC8122AC063D@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <09d87f3d-e166-1e7c-ec8d-dd3e54f366fb@suse.com>
Date: Fri, 29 May 2020 11:02:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <0D83AAA6-A205-4256-8A38-CC8122AC063D@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "cjwatson@debian.org" <cjwatson@debian.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.05.2020 18:08, George Dunlap wrote:
>> On May 27, 2020, at 4:41 PM, Ian Jackson <ian.jackson@citrix.com> wrote:
>>
>> The Xen tools build system builds a FLASK policy by default.  It does
>> this even if the hypervisor build for XSM is disabled.
>>
>> I recently sent patches upstream to grub to support XSM in
>> update-grub.  update-grub is the program which examines your /boot and
>> generates appropriate bootloader entries.  My merge request
>>  https://salsa.debian.org/grub-team/grub/-/merge_requests/18
>> finds XSM policy files, and when theya are found, generates "XSM
>> enabled" bootloader entries. [1]
>>
>> The result of these two things together is that a default build of
>> grub will result in these "XSM enabled" bootloader entries.  In
>> practice I think these entries will boot because everything ignores
>> the additional XSM policy file (!) and Xen ignores the
>> "flask=enforcing" option (!!)
>>
>> This is not particularly good.  Offering people an "XSM enabled"
>> option which does nothing is poor because it might think they have the
>> extra security but actually significantly more steps are needed.  But
>> there doesn't appear to be any way for update-grub to tell whether a
>> particular hypervisor does support XSM or not.
>>
>> I think the following changes would be good:
>>
>> 1. Xen should reject "flask=enforcing" if it is built without FLASK
>> support, rather than ignoring it.  This will ensure users are not
>> misled by these boot options since they will be broken.
> 
> +1

Yeah, probably better indeed, despite the current behavior being
documented correctly. I'll make a patch.

Jan

