Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7091A775F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 11:31:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOHua-0000kU-Kj; Tue, 14 Apr 2020 09:31:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOHuY-0000kO-Tq
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 09:31:18 +0000
X-Inumbo-ID: b1442368-7e32-11ea-890f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1442368-7e32-11ea-890f-12813bfff9fa;
 Tue, 14 Apr 2020 09:31:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EE3D0AEFD;
 Tue, 14 Apr 2020 09:31:15 +0000 (UTC)
Subject: Re: [PATCH v7 09/12] xen: add runtime parameter access support to
 hypfs
To: Julien Grall <julien@xen.org>
References: <20200402154616.16927-1-jgross@suse.com>
 <20200402154616.16927-10-jgross@suse.com>
 <f08bdac6-122a-9289-3241-a0460a73c686@suse.com>
 <1a68e135-2761-0ccd-11fc-45344a84757d@suse.com>
 <bdd65308-e549-c2b2-0de9-fb220d03f087@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <82cfcac7-225f-204b-e8fc-cbd04f9652e9@suse.com>
Date: Tue, 14 Apr 2020 11:31:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <bdd65308-e549-c2b2-0de9-fb220d03f087@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.04.2020 11:29, Julien Grall wrote:
> On 03/04/2020 16:31, Jürgen Groß wrote:
>> On 03.04.20 16:51, Jan Beulich wrote:
>>> On 02.04.2020 17:46, Juergen Gross wrote:
>>>> V7:
>>>> - fine tune some parameter initializations (Jan Beulich)
>>>> - call custom_runtime_set_var() after updating the value
>>>> - modify alignment in Arm linker script to 4 (Jan Beulich)
>>>
>>> I didn't ask for this to be unilaterally 4 - I don't think this
>>> would work on Arm64, seeing that there are pointers inside the
>>> struct. This wants to be pointer size, i.e. 4 for Arm32 but 8
>>> for Arm64.
> 
> We don't allow unaligned access on Arm32, so if your structure happen to have a 64-bit value in it then you will get a crash at runtime.
> 
> For safety, it should neither be POINTER_ALIGN or 4, but 8.
> This is going to make your linker more robust.

Would you mind explaining to me why POINTER_ALIGN would be wrong
when the most strictly aligned field in a structure is a pointer?

Jan

