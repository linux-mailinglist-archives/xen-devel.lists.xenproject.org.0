Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1D523C9A2
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 11:55:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3G8o-0004LS-8y; Wed, 05 Aug 2020 09:55:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gIoy=BP=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k3G8m-0004LK-Ly
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 09:55:20 +0000
X-Inumbo-ID: 97749f16-824a-4045-9486-0e2bfdaaf52f
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97749f16-824a-4045-9486-0e2bfdaaf52f;
 Wed, 05 Aug 2020 09:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596621318;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=w2+u7I9XBs8VzIqw/b/kjdEgHa04heKz9RHkt1QQ+uY=;
 b=F2zAb8jbhC2/nesC17tl/YbPnvU9bVMeS/6fPXuoL19mz3LzwuJyaESJ
 iGEGzmsfc4nl1WqcvZJgfbeVqG8fhtJ5Txjx50jSe3XmRhCV+jghZZ7th
 Sq+++yksAbAESY96nb4MQopiT32V8/3fuDGG1PsRthqhpQK+JMlRopYRR E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: NrlHOk4GkmwUNzvyIXArgpH4zbzQ8iO7O/c659c70QuZ70qtU2ZBkieUA8YjHpzeQiXDPsEpCb
 /N/V0uc11epFovF8ZFfdKyRie5e95lmWFOeTw/W5sPftfzKQExHmQq80hqWShoQ4rHIlp20Xh/
 Pom+ShmYyXh6Ha/80nqQWLS/3ZcP01BZCy3BD9mZyJH3kCz7BBv21jTqxwXS78RxJFh2zceejW
 3xlEGA1tLb8HnA+ByoFyVOAf1ki3lIAr4AMW2TiWRlY4Skfnt82fncIiSLf51qwFL2lRDv0kGp
 8CQ=
X-SBRS: 3.7
X-MesageID: 24239405
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,436,1589256000"; d="scan'208";a="24239405"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24362.33281.726014.586449@mariner.uk.xensource.com>
Date: Wed, 5 Aug 2020 10:55:13 +0100
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH] libxl: avoid golang building without CONFIG_GOLANG=y
In-Reply-To: <CAEBZRSc=xUjYq7ao9Rv-EEJsjiBkt5mio5QofvixErZj_SJUcw@mail.gmail.com>
References: <e8dd70a7-bdde-e12a-3f4d-f52e58016234@suse.com>
 <20200804141639.k2tpoqy7jj34gcm6@liuwe-devbox-debian-v2>
 <CAEBZRSf4opmGw2fDOCOMZLTtjisFXaP=Oe9aD6E2fTfUs2YFQQ@mail.gmail.com>
 <0deed4c6-ca87-09d3-a19c-ac0c00003cb7@suse.com>
 <20200804155043.vq7aupbrvmmcgzlv@liuwe-devbox-debian-v2>
 <12790d2b-020d-b6fe-4924-2233a4e93d83@suse.com>
 <20200804155707.rrtzkksrle2nojbj@liuwe-devbox-debian-v2>
 <43f706e4-0292-5758-eb19-9fbb99b1337e@suse.com>
 <CAEBZRSc=xUjYq7ao9Rv-EEJsjiBkt5mio5QofvixErZj_SJUcw@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 George Dunlap <George.Dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Nick Rosbrook writes ("Re: [PATCH] libxl: avoid golang building without CONFIG_GOLANG=y"):
> Jan - is the problem specifically that a fresh clone,  or `git
> checkout`, etc. changes file timestamps in a way that triggers make to
> rebuild those targets? I have not used the move-if-changed approach
> before, but AFAICT that would be sufficient.

I don't think there is, from the point of view of the build system,
anything different about gengotypes than about any other in-tree
committed file which is updated using makefile rules based on only
other in-tree files and common utilities (eg, in this case, Python).

I guess using move-if-changed will probably fix this.

Jan: the reasons why this output file has to be committed are
complicated.  We've discussed them at length.  Ultimately the reason
is deliberate deficiencies[1] in golang.  Sadly this is the best of a
not-very-good set of options.

Ian.

[1] This is an extreme phrase, but justified I think.  The golang
designers have deliberately aimed at what they regard as "simplicity"
and one of the things they have "simplified" away (in their language
and in their package management and build tools) is the ability to
conveniently generate golang code at build time.  Committing the
generated code is the norm in the golang community.

