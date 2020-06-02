Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5E81EB683
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 09:22:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg1F0-0001a2-Hz; Tue, 02 Jun 2020 07:21:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jg1Ey-0001Zx-De
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 07:21:40 +0000
X-Inumbo-ID: b2a7cec2-a4a1-11ea-aba2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2a7cec2-a4a1-11ea-aba2-12813bfff9fa;
 Tue, 02 Jun 2020 07:21:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 86086B016;
 Tue,  2 Jun 2020 07:21:39 +0000 (UTC)
Subject: Re: Xen XSM/FLASK policy, grub defaults, etc.
To: Julien Grall <julien@xen.org>
References: <24270.35349.838484.116865@mariner.uk.xensource.com>
 <0D83AAA6-A205-4256-8A38-CC8122AC063D@citrix.com>
 <24272.59646.746545.343358@mariner.uk.xensource.com>
 <4a8e7cf2-8f63-d4d2-e051-9484a5b8c8ed@suse.com>
 <96F32637-E410-4EC8-937A-CFC8BE724352@citrix.com>
 <24273.8332.662607.125522@mariner.uk.xensource.com>
 <7eaa7541-f698-b29b-b4b3-1f40fc37c5d7@xen.org>
 <63838ce9-8dbf-aacf-521d-97540758a945@suse.com>
 <429e81a2-80d5-0d50-6352-6471cd4698a8@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1a08fcca-e890-a735-682d-635e9d11f2a4@suse.com>
Date: Tue, 2 Jun 2020 09:21:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <429e81a2-80d5-0d50-6352-6471cd4698a8@xen.org>
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "cjwatson@debian.org" <cjwatson@debian.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.05.2020 19:24, Julien Grall wrote:
> On 29/05/2020 16:11, Jan Beulich wrote:
>> On 29.05.2020 17:05, Julien Grall wrote:
>>> On 29/05/2020 15:47, Ian Jackson wrote:
>>>> George Dunlap writes ("Re: Xen XSM/FLASK policy, grub defaults, etc."):
>>>>> Which isn’t to say we shouldn’t do it; but it might be nice to also have an intermediate solution that works right now, even if it’s not optimal.
>>>>
>>>> I propose the following behaviour by updste-grub:
>>>>
>>>>    1. Look for an ELF note, TBD.  If it's found, make XSM boot entries.
>>>>       (For now, skip this step, since the ELF note is not defined.)
>>>
>>> I am afraid the ELF note is a very x86 thing. On Arm, we don't have such
>>> thing for the kernel/xen (actually the final binary is not even an ELF).
>>
>> Ouch - of course. Is there anything similar one could employ there?
> 
> In the past, we discussed about adding support for note in the zImage 
> (arm32 kernel format) but I never got the chance to pursue the discussion.
> 
> With Juergen's hypfs series, the hypervisor now embbed the .config. Is 
> it possible to extract it?

How easy is it to reliably find a random blob of gzip-ed data in an
otherwise unstructured (as in: no ELF sections, and hence no way to
put the data of interest into a separate section for easy
recognition) binary? Also don't forget that the embedding of .config
is an optional thing.

Jan

