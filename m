Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 950BE23DB42
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 16:58:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3hL0-00086q-Iu; Thu, 06 Aug 2020 14:57:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=49j5=BQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k3hKz-00086l-DJ
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 14:57:45 +0000
X-Inumbo-ID: 69314e7d-1d3e-4e54-8e57-b508ae626cb9
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69314e7d-1d3e-4e54-8e57-b508ae626cb9;
 Thu, 06 Aug 2020 14:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596725865;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=jFz80T16EOcJg2+pcu+RItNVey5tN69mEwikaX2UYpA=;
 b=G4RbuJs1TaoapNtUF0qH4oEEB6MneTcKMangY/RNhOXtAv7bcmuNUt7Q
 mzNP7WS9ipbHQg696mkIMSpfHw2FqOlhHLaYg9M7OQXv9eS2HKT2ZsD2Y
 TGZfBqJTr0yG8yCN33sE9fzYCgI72fhuobpurls7YZhdZ7RA1GqdlkKWa w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 817E7x4PikiW+9i7BdycV0Pf9GSxivWjxZLH7dmxiaPUgImB8DsQrA3eGfSc8FExCVStn6wgIs
 jwuKwtmVum7Fj0gi1j2+yh5i8xaqcnfb87GJmkA8yMSc10T9nM7Xsa0k2JovJ6j3SkKhrtwjXN
 whTjikeURbgcnRJK6FWFr0Rm5jktCq73X3Zu7AW5h/Asg/5WFdonfcK8PhV+/TDtpYjvZonTip
 Icj8oQSx3+6jR6bTjHFppCxT6c5n9iqrmN2OFU8b8ePopHaY9ZCDS2+f9MruoJ6ubgI+Niti9F
 Ppc=
X-SBRS: 3.7
X-MesageID: 24022695
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,441,1589256000"; d="scan'208";a="24022695"
Subject: Re: [PATCH 1/4] build: work around bash issue
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
References: <305c2532-408a-9f78-61fe-c90a2e86eb8e@suse.com>
 <b427e8e6-b9ff-65d2-074b-19439a2e3d02@suse.com>
 <e8006147-31e5-d4c5-8c13-74250f267c0c@xen.org>
 <df45f8af-a32b-67cf-2f56-4761ce263a28@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6a7226b9-9702-9adc-c849-e21d27a8fced@citrix.com>
Date: Thu, 6 Aug 2020 15:57:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <df45f8af-a32b-67cf-2f56-4761ce263a28@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06/08/2020 10:14, Jan Beulich wrote:
> On 06.08.2020 11:07, Julien Grall wrote:
>> On 06/08/2020 10:04, Jan Beulich wrote:
>>> Older bash fails to honor "set -e" for certain built-in commands
>> "Older" is pretty vague. May I ask the exact version you run into the issue?
> If I knew in what version the issue got fixed, I'd have specified
> that version. I've observed it with 3.2.57(2).

Its still very useful information for the commit message.

I tend to phrase something like this as "Older versions of bash (at
least, 3.2.57(2))" which gives a clear indication that the problem was
observed with the specified version, without suggesting that this is a
boundary of when the issue was introduced/fixed.

With this adjusted, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
to avoid a second posting.

~Andrew

