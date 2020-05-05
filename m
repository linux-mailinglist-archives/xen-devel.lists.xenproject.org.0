Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A01D1C5CE2
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 18:03:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jW01X-0005Tu-6N; Tue, 05 May 2020 16:02:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uapr=6T=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jW01V-0005Tp-RO
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 16:02:21 +0000
X-Inumbo-ID: cc9e4f9a-8ee9-11ea-9dcd-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc9e4f9a-8ee9-11ea-9dcd-12813bfff9fa;
 Tue, 05 May 2020 16:02:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8B845AEFD;
 Tue,  5 May 2020 16:02:21 +0000 (UTC)
Subject: Re: [PATCH] xenbus: avoid stack overflow warning
To: Arnd Bergmann <arnd@arndb.de>
References: <20200505141546.824573-1-arnd@arndb.de>
 <30d49e6d-570b-f6fd-3a6f-628abcc8b127@suse.com>
 <CAK8P3a0mWH=Zcq180+cTRMpqOkGt05xDP1+kCTP6yc9grAg2VQ@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <48893239-dde9-4e94-040d-859f4348816d@suse.com>
Date: Tue, 5 May 2020 18:02:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0mWH=Zcq180+cTRMpqOkGt05xDP1+kCTP6yc9grAg2VQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Yan Yankovskyi <yyankovskyi@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.05.20 17:01, Arnd Bergmann wrote:
> On Tue, May 5, 2020 at 4:34 PM Jürgen Groß <jgross@suse.com> wrote:
>> On 05.05.20 16:15, Arnd Bergmann wrote:
>>> The __xenbus_map_ring() function has two large arrays, 'map' and
>>> 'unmap' on its stack. When clang decides to inline it into its caller,
>>> xenbus_map_ring_valloc_hvm(), the total stack usage exceeds the warning
>>> limit for stack size on 32-bit architectures.
>>>
>>> drivers/xen/xenbus/xenbus_client.c:592:12: error: stack frame size of 1104 bytes in function 'xenbus_map_ring_valloc_hvm' [-Werror,-Wframe-larger-than=]
>>>
>>> As far as I can tell, other compilers don't inline it here, so we get
>>> no warning, but the stack usage is actually the same. It is possible
>>> for both arrays to use the same location on the stack, but the compiler
>>> cannot prove that this is safe because they get passed to external
>>> functions that may end up using them until they go out of scope.
>>>
>>> Move the two arrays into separate basic blocks to limit the scope
>>> and force them to occupy less stack in total, regardless of the
>>> inlining decision.
>>
>> Why don't you put both arrays into a union?
> 
> I considered that as well, and don't really mind either way. I think it does
> get a bit ugly whatever we do. If you prefer the union, I can respin the
> patch that way.

Hmm, thinking more about it I think the real clean solution would be to
extend struct map_ring_valloc_hvm to cover the pv case, too, to add the
map and unmap arrays (possibly as a union) to it and to allocate it
dynamically instead of having it on the stack.

Would you be fine doing this?


Juergen

