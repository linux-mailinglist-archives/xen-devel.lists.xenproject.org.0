Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F76191311
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 15:26:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGkRy-0007tQ-CD; Tue, 24 Mar 2020 14:22:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hjhq=5J=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jGkRw-0007tG-Tr
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 14:22:36 +0000
X-Inumbo-ID: e7f5afc0-6dda-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7f5afc0-6dda-11ea-92cf-bc764e2007e4;
 Tue, 24 Mar 2020 14:22:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8B225AD4F;
 Tue, 24 Mar 2020 14:22:34 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <1585056853121.58010@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <af97b12c-e1f5-0278-8599-96264dc57101@suse.com>
Date: Tue, 24 Mar 2020 15:22:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1585056853121.58010@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] xl vcpu-pin peculiarities in core scheduling mode
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.03.20 14:34, Sergey Dyasli wrote:
> Hi Juergen,
> 
> I've notived there is no documentation about how vcpu-pin is supposed to work
> with core scheduling enabled. I did some experiments and noticed the following
> inconsistencies:
> 
>    1. xl vcpu-pin 5 0 0
>       Windows 10 (64-bit) (1)              5     0    0   -b-    1644.0  0 / all
>       Windows 10 (64-bit) (1)              5     1    1   -b-    1650.1  0 / all
>                                                       ^                  ^
>       CPU 1 doesn't match reported hard-affinity of 0. Should this command set
>       hard-affinity of vCPU 1 to 1? Or should it be 0-1 for both vCPUs instead?
> 
> 
>    2. xl vcpu-pin 5 0 1
>       libxl: error: libxl_sched.c:62:libxl__set_vcpuaffinity: Domain 5:Setting vcpu affinity: Invalid argument
>       This is expected but perhaps needs documenting somewhere?
> 
> 
>    3. xl vcpu-pin 5 0 1-2
>       Windows 10 (64-bit) (1)              5     0    2   -b-    1646.7  1-2 / all
>       Windows 10 (64-bit) (1)              5     1    3   -b-    1651.6  1-2 / all
>                                                       ^                  ^^^
>       Here is a CPU / affinity mismatch again, but the more interesting fact
>       is that setting 1-2 is allowed at all, I'd expect CPU would never be set
>       to 1 with such settings.
> 
> Please let me know what you think about the above cases.

I think all of the effects can be explained by the way how pinning with
core scheduling is implemented. This does not mean that the information
presented to the user shouldn't be adapted.

Basically pinning of any vcpu will just affect the "master"-vcpu of a
virtual core (sibling 0). It will happily accept any setting as long as
any "master"-cpu of a core is in the resulting set of cpus.

All vcpus of a virtual core share the same pinnings.

I think this explains all of the above scenarios.

IMO there are the following possibilities for reporting those pinnings
to the user:

1. As today, documenting the output.
    Not very nice IMO, but the least effort.

2. Just print one line for each virtual cpu/core/socket, like:
    Windows 10 (64-bit) (1)    5     0-1   0-1   -b-    1646.7  0-1 / all
    This has the disadvantage of dropping the per-vcpu time in favor of
    per-vcore time, OTOH this is reflecting reality.

3. Print the effective pinnings:
    Windows 10 (64-bit) (1)    5     0     0     -b-    1646.7  0   / all
    Windows 10 (64-bit) (1)    5     1     1     -b-    1646.7  1   / all
    Should be rather easy to do.

Thoughts?


Juergen

