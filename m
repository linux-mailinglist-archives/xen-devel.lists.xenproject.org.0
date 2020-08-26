Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34846252889
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 09:43:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAq44-0000uD-1q; Wed, 26 Aug 2020 07:41:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vb2W=CE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kAq41-0000u8-UV
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 07:41:45 +0000
X-Inumbo-ID: 0805041d-b08c-4750-80fa-e38b4e0cf2e2
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0805041d-b08c-4750-80fa-e38b4e0cf2e2;
 Wed, 26 Aug 2020 07:41:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 64118AC23;
 Wed, 26 Aug 2020 07:42:15 +0000 (UTC)
Subject: Re: [PATCH] libxl: avoid golang building without CONFIG_GOLANG=y
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
References: <e8dd70a7-bdde-e12a-3f4d-f52e58016234@suse.com>
 <20200804141639.k2tpoqy7jj34gcm6@liuwe-devbox-debian-v2>
 <CAEBZRSf4opmGw2fDOCOMZLTtjisFXaP=Oe9aD6E2fTfUs2YFQQ@mail.gmail.com>
 <0deed4c6-ca87-09d3-a19c-ac0c00003cb7@suse.com>
 <20200804155043.vq7aupbrvmmcgzlv@liuwe-devbox-debian-v2>
 <12790d2b-020d-b6fe-4924-2233a4e93d83@suse.com>
 <20200804155707.rrtzkksrle2nojbj@liuwe-devbox-debian-v2>
 <43f706e4-0292-5758-eb19-9fbb99b1337e@suse.com>
 <CAEBZRSc=xUjYq7ao9Rv-EEJsjiBkt5mio5QofvixErZj_SJUcw@mail.gmail.com>
 <289981a3-9baf-bf6a-abbd-e4d613709f2a@suse.com>
 <20200824145849.GA8275@FED-nrosbr-BE.crux.rad.ainfosec.com>
 <3e6858f4-bb63-5533-c523-cffd13503f2c@suse.com>
 <B99E1A82-FBE8-4EE3-943A-4384BA504184@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ea3ab742-84e0-1e98-87ad-2e38b2224917@suse.com>
Date: Wed, 26 Aug 2020 09:41:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <B99E1A82-FBE8-4EE3-943A-4384BA504184@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.08.2020 12:37, George Dunlap wrote:
> As an explanation, there are a combination of things. You proposed A (remove the dependency), Ian proposed B (use move-if-changed), but we’re hoping to do C (have an external tree) before the next release.  I haven’t had the time to look into either B or C (nor, unfortunately, to review Nick’s submissions to other parts of the code — sorry Nick!); but I’ve still been reluctant to go for A.
> 
> I think basically, unless someone is ready to tackle B or C immediately, we should just check in Jan’s fix (or probably better, just revert the patch that introduced the dependency).  It will be annoying to have to potentially fix up the generated golang bindings, but that puts the incentives in the right place.

One additional aspect to consider is that I ran into the issue actually
in a 4.14 tree (because it just so happened that the timestamps of the
involved files were "right" for the problem to be hit), i.e. whatever
we decide to do will also end up needing backporting. To me this looks
to make A less attractive.

Jan

