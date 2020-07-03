Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D521213E65
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 19:16:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrPIK-0005We-Ds; Fri, 03 Jul 2020 17:16:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x5eZ=AO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jrPII-0005WZ-Vo
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 17:16:11 +0000
X-Inumbo-ID: e3172130-bd50-11ea-8a05-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3172130-bd50-11ea-8a05-12813bfff9fa;
 Fri, 03 Jul 2020 17:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1593796571;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=dqeiGuK5cYVNFmkGldspUWwR9pAfBDVSylO2ZhDXxgA=;
 b=OboNHorrDLyxTT03ZvD66t3/9cUXj0SP2+xwxrHH02xnomyJir6d6i50
 HlVF0RLj556zgUO80pdX8uaYpnGkN00FjUkE4aT+abvihgfRWpA6Sn/ZU
 Sx5JF22LzD4nVUgs4oFXEbLWzxvy+LeSX99cDdkwD7YQX6BJgzbF9y1Hq 4=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Wmjh8XanJ46odrm8NoGJflxLrYjP3hhL6XwFpCOGk+igvaFduGuN3NR99lPlmnofEXknmtK5yj
 mwzzdR267dX4eqgtColQf885PR+XTcgtUzCf82Mt1LA8qqfWWE254d1aH161crac2N1+PkIEN6
 wreuB3wIIqvAcUFETs2YmxbDlJ4sGPI+Yeshdyq6/EprEzutj1L7lcvj25/3tjJ+lw4TSd+04W
 xIozewpd6O9j6mWYLM7dpXhA+kAcYIDXJqv5VzNXdBnnYImLbofcLHVKwymQFkU87HH8zq1SYK
 Onk=
X-SBRS: 2.7
X-MesageID: 21581824
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,308,1589256000"; d="scan'208";a="21581824"
Subject: Re: FSGSBASE seems to be busted on Xen PV
To: Andy Lutomirski <luto@kernel.org>, xen-devel
 <xen-devel@lists.xenproject.org>, LKML <linux-kernel@vger.kernel.org>,
 Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>, "Boris
 Ostrovsky" <boris.ostrovsky@oracle.com>
References: <CALCETrVfi1Rnt5nnrHNivdxE7MqRPiLXvon4-engqo=LCKiojA@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e78d2ee5-66cf-2ed8-c04f-71dd92efdfe1@citrix.com>
Date: Fri, 3 Jul 2020 18:16:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CALCETrVfi1Rnt5nnrHNivdxE7MqRPiLXvon4-engqo=LCKiojA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: X86 ML <x86@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03/07/2020 18:10, Andy Lutomirski wrote:
> Hi Xen folks-
>
> I did some testing of the upcoming Linux FSGSBASE support on Xen PV,
> and I found what appears to be some significant bugs in the Xen
> context switching code.  These bugs are causing Linux selftest
> failures, and they could easily cause random and hard-to-debug
> failures of user programs that use the new instructions in a Xen PV
> guest.
>
> The bugs seem to boil down to the context switching code in Xen being
> clever and trying to guess that a nonzero FS or GS means that the
> segment base must match the in-memory descriptor.  This is simply not
> true if CR4.FSGSBASE is set -- the bases can have any canonical value,
> under the full control of the guest, and Xen has absolutely no way of
> knowing whether the values are expected to be in sync with the
> selectors.  (The same is true of FSGSBASE except that guest funny
> business either requires MSR accesses or some descriptor table
> fiddling, and guests are perhaps less likely to care)
>
> Having written a bunch of the corresponding Linux code, I don't
> there's any way around just independently saving and restoring the
> selectors and the bases.  At least it's relatively fast with FSGSBASE
> enabled.
>
> If you can't get this fixed in upstream Xen reasonably quickly, we may
> need to disable FSGSBASE in a Xen PV guest in Linux.

This has come up several times before, but if its actually breaking
userspace then Xen needs to change.

I'll see about making something which is rather more robust.

~Andrew

