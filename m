Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FD4251255
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 08:48:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kASkM-0007bB-L7; Tue, 25 Aug 2020 06:47:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kASkL-0007b6-6b
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 06:47:53 +0000
X-Inumbo-ID: c31ccc63-26eb-4035-b386-ec53a17ca724
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c31ccc63-26eb-4035-b386-ec53a17ca724;
 Tue, 25 Aug 2020 06:47:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F0AA3AF99;
 Tue, 25 Aug 2020 06:48:21 +0000 (UTC)
Subject: Re: [PATCH] libxl: avoid golang building without CONFIG_GOLANG=y
To: Nick Rosbrook <rosbrookn@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3e6858f4-bb63-5533-c523-cffd13503f2c@suse.com>
Date: Tue, 25 Aug 2020 08:47:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200824145849.GA8275@FED-nrosbr-BE.crux.rad.ainfosec.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.08.2020 16:58, Nick Rosbrook wrote:
> My understanding was that you were going to use move-if-changed to fix
> this for now (it seemed everyone agreed this was the quickest short-term fix).

A technical and a non-technical remark:

Thinking about this some more, I'm no longer convinced the
move-if-changed approach is appropriate here. It is typically
used to avoid updating files with a large set of dependents
(all of which would need re-building if the file in question
changed, even if merely in its time stamp), and where the
cost of re-generating (and comparing) is relatively low.
While I can't really assess the cost part here (I know too
little of Python to be able to compare its use with e.g. a
shell script), I don't think the "large set of dependencies"
aspect applies here at all.

On the non-technical side I have to admit that I find it,
well, unfriendly to have a person not only run into and
investigate a (recent) regression, but also make multiple
attempts at fixing (or at least working around) it. I'd
rather view this as preferably the responsibility of the
person having introduced an issue. In the case at hand it is
quite clear that I wasn't even remotely aware of the
requirements, and hence determination and testing of a more
adequate solution would far better be done by someone
familiar with all the influencing factors. (Things might
yet be different if an issue is difficult to reproduce, but
I don't see that being the case here.)

Jan

