Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F07723BD35
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 17:31:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2yto-0002op-TL; Tue, 04 Aug 2020 15:30:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k2ytn-0002ok-BH
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 15:30:43 +0000
X-Inumbo-ID: e7fafa4a-965e-468e-97bc-fd1747f3410c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7fafa4a-965e-468e-97bc-fd1747f3410c;
 Tue, 04 Aug 2020 15:30:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 86F16B675;
 Tue,  4 Aug 2020 15:30:56 +0000 (UTC)
Subject: Re: [PATCH] libxl: avoid golang building without CONFIG_GOLANG=y
To: Nick Rosbrook <rosbrookn@gmail.com>
References: <e8dd70a7-bdde-e12a-3f4d-f52e58016234@suse.com>
 <20200804141639.k2tpoqy7jj34gcm6@liuwe-devbox-debian-v2>
 <CAEBZRSf4opmGw2fDOCOMZLTtjisFXaP=Oe9aD6E2fTfUs2YFQQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0deed4c6-ca87-09d3-a19c-ac0c00003cb7@suse.com>
Date: Tue, 4 Aug 2020 17:30:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAEBZRSf4opmGw2fDOCOMZLTtjisFXaP=Oe9aD6E2fTfUs2YFQQ@mail.gmail.com>
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.08.2020 17:22, Nick Rosbrook wrote:
> On Tue, Aug 4, 2020 at 10:17 AM Wei Liu <wl@xen.org> wrote:
>>
>> On Mon, Aug 03, 2020 at 10:06:32AM +0200, Jan Beulich wrote:
>>> While this doesn't address the real problem I've run into (attempting to
>>> update r/o source files), not recursing into tools/golang/xenlight/ is
>>> enough to fix the build for me for the moment. I don't currently see why
>>> 60db5da62ac0 ("libxl: Generate golang bindings in libxl Makefile") found
>>> it necessary to invoke this build step unconditionally.
>>>
>>
>> Perhaps an oversight?
> 
> This is intentional, and I think the commit message in 60db5da62ac0
> ("libxl: Generate golang bindings in libxl Makefile") explains the
> reasoning well. But, to summarize, CONFIG_GOLANG is only used to
> control the bindings actually being compiled (i.e. with `go build`).
> However, we always want the code generation script
> (tools/golang/xenlight/gengotypes.py) to run if e.g.
> tools/libxl/libxl_types.idl is modified.
> 
> I hope this helps.

Not really - I'm still not seeing the "why" behind this behavior. I.e.
why build _anything_ that's not used further in the build, nor getting
installed? Also if (aiui) you effectively object to the change that
Wei has given his ack for, would you mind providing an alternative fix
for the problem at hand?

Jan

