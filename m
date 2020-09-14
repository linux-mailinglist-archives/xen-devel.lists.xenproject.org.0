Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB2D268AB6
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 14:15:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHnNT-0007sV-SP; Mon, 14 Sep 2020 12:14:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHnNS-0007sQ-Vx
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 12:14:35 +0000
X-Inumbo-ID: f0703274-84c7-4e80-aae2-d3318ff30740
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0703274-84c7-4e80-aae2-d3318ff30740;
 Mon, 14 Sep 2020 12:14:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 16A9CAC79;
 Mon, 14 Sep 2020 12:14:48 +0000 (UTC)
Subject: Re: [PATCH v3 3/4] efi: Enable booting unified
 hypervisor/kernel/initrd images
To: Trammell Hudson <hudson@trmm.net>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200907190027.669086-1-hudson@trmm.net>
 <20200907190027.669086-4-hudson@trmm.net> <20200914100609.GC753@Air-de-Roger>
 <3anr6Udui7bFFb1CwaGT9tU_oq3rEh_DwgajzdD_hzmYsvfJX3WGAXUYRzGzBKdgdoxuEfSLM6O1ipl5EitDiRGkgT3vUI8WGzLWM9P2Qdg=@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dec55ed4-22c1-d120-3a15-88f3d526ed93@suse.com>
Date: Mon, 14 Sep 2020 14:14:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3anr6Udui7bFFb1CwaGT9tU_oq3rEh_DwgajzdD_hzmYsvfJX3WGAXUYRzGzBKdgdoxuEfSLM6O1ipl5EitDiRGkgT3vUI8WGzLWM9P2Qdg=@trmm.net>
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

On 14.09.2020 13:19, Trammell Hudson wrote:
> On Monday, September 14, 2020 6:06 AM, Roger Pau Monné <roger.pau@citrix.com> wrote:
>> On Mon, Sep 07, 2020 at 03:00:26PM -0400, Trammell Hudson wrote:
>>> -   file->ptr = (void *)pe_find_section(image->ImageBase, image->ImageSize,
>>
>> This already returns a void *, so there's no need for the cast.
> 
> It returns const void *, but file has a non-const pointer.  Perhaps files should
> be immutable and that could be addressed in a const-correctness patch series.

But casting away const-ness is really bad. If file->ptr can't
be adjusted accordingly, I'm afraid the function will need to
return a pointer to non-const for the time being.

Jan

