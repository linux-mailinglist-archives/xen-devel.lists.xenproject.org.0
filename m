Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A87B11E8108
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 16:56:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jegR1-0002bL-DZ; Fri, 29 May 2020 14:56:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jegR0-0002aS-8q
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 14:56:34 +0000
X-Inumbo-ID: 962c4814-a1bc-11ea-a8cd-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 962c4814-a1bc-11ea-a8cd-12813bfff9fa;
 Fri, 29 May 2020 14:56:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 929D6B077;
 Fri, 29 May 2020 14:56:32 +0000 (UTC)
Subject: Re: Xen XSM/FLASK policy, grub defaults, etc.
To: Ian Jackson <ian.jackson@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
References: <24270.35349.838484.116865@mariner.uk.xensource.com>
 <0D83AAA6-A205-4256-8A38-CC8122AC063D@citrix.com>
 <24272.59646.746545.343358@mariner.uk.xensource.com>
 <4a8e7cf2-8f63-d4d2-e051-9484a5b8c8ed@suse.com>
 <96F32637-E410-4EC8-937A-CFC8BE724352@citrix.com>
 <24273.8332.662607.125522@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5dc712c4-a57d-a387-89cd-e8a8991226a8@suse.com>
Date: Fri, 29 May 2020 16:56:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <24273.8332.662607.125522@mariner.uk.xensource.com>
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.05.2020 16:47, Ian Jackson wrote:
> George Dunlap writes ("Re: Xen XSM/FLASK policy, grub defaults, etc."):
>> Which isn’t to say we shouldn’t do it; but it might be nice to also have an intermediate solution that works right now, even if it’s not optimal.
> 
> I propose the following behaviour by updste-grub:
> 
>  1. Look for an ELF note, TBD.  If it's found, make XSM boot entries.
>     (For now, skip this step, since the ELF note is not defined.)
> 
>  2. Look for a .config alongside the Xen binary.  Look for
>        ^CONFIG_XSM_FLASK=y
>     If the file is is not found, or no line matches, make no XSM
>     boot entries.

Sounds like a plan then, I think.

Jan

