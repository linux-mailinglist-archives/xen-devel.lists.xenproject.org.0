Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1F1261159
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 14:30:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFckp-0000uW-7N; Tue, 08 Sep 2020 12:29:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yBuC=CR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFcko-0000uR-As
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 12:29:42 +0000
X-Inumbo-ID: f235afab-df5a-482e-9d67-f7de33c09921
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f235afab-df5a-482e-9d67-f7de33c09921;
 Tue, 08 Sep 2020 12:29:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 308CDAC37;
 Tue,  8 Sep 2020 12:29:41 +0000 (UTC)
Subject: Re: [PATCH v3 1/4] x86/xen.lds.S: Work around binutils build id
 alignment bug
To: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200907190027.669086-1-hudson@trmm.net>
 <20200907190027.669086-2-hudson@trmm.net>
 <5b8f533d-c646-8a52-cf37-d21b182ccf9b@suse.com>
 <6SnmUgvnHWozDhOcXRgAUuB_aEQdoXlOD5-uC6-t2LGRtadueg0vaUUmBISei_7NrT_9DCVBfNLUR12D6XTYoJNri7W2fw1_yeMUXULfwR0=@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e1eb360f-5ffc-aa3f-1f82-ace6c4bc6b0c@suse.com>
Date: Tue, 8 Sep 2020 14:29:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6SnmUgvnHWozDhOcXRgAUuB_aEQdoXlOD5-uC6-t2LGRtadueg0vaUUmBISei_7NrT_9DCVBfNLUR12D6XTYoJNri7W2fw1_yeMUXULfwR0=@trmm.net>
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

On 08.09.2020 11:30, Trammell Hudson wrote:
> On Tuesday, September 8, 2020 11:04 AM, Jan Beulich <jbeulich@suse.com> wrote:
>> [...]
>> Personally I think this kind of a workaround patch is something
>> distros ought to be fine to carry, if they care about the
>> functionality and only until they get around to upgrade their
>> binutils. But I'll be happy to hear differing opinions.
> 
> Y'all just merged something to support building with make 3.81,
> released in *2006*, so why require a bleeding edge binutils to
> work with the executable image?

Building Xen has to work on the tool chain versions we document it
works on (and we're in the process of discussing to raise the
base line). Playing with the output of our build system is an
entirely different thing. As with, I think, the majority of new
features, distros would pick up your new functionality mainly for
use in new versions, and hence would likely run with new binutils
anyway by that time.

>> I also don't see any mention anywhere of why it's 32 bytes, and not
>> 16 or 64 or yet something else.
> 
> It is 32 because you said 32 was probably fine.

Well, that's then setting us up for running into the same issue
again in case this "probably" turns out wrong. Referring to the
size of the structure created by binutils to insert the build ID,
otoh, could maybe give a proper reason. However, there's also the
question whether this (not) functioning also depends on the
particular size and/or alignment of the preceding section. Iirc
this was the reason why you had thought there was a connection to
live patching enabled / disabled in the build.

Jan

