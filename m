Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B54FC2742E5
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 15:24:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKiGy-0000GA-Bg; Tue, 22 Sep 2020 13:23:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J35V=C7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kKiGx-0000G5-Cs
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 13:23:55 +0000
X-Inumbo-ID: e47b6143-a0a9-4bf4-b37a-13ed7bb14c74
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e47b6143-a0a9-4bf4-b37a-13ed7bb14c74;
 Tue, 22 Sep 2020 13:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600781033;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=xF14LbqYhmFFgIn8CZDRDrjMXQV3XLolwE0qbXX1DIc=;
 b=EFvzQSXfNewgo8KJnIzKjdrzsH4Yk10FMY1J0VZ8otThGmHABQ6lMrRD
 M/9mJWpXDZ4fE9FkyBTLvc8bHZ8QyfPyY6jK4/EgtA74D3EkyZkYMfC7X
 4sWNgg/vlq/C2MKkvvwhnH4krqJ0TQOF8pRMlOVSbWdfKclXPre+oZFxt Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: rC5NQJEKwAHB9MWuXPGF1v1ukPwOs+x0eU+YZ3bjy+enegztuu08EmTnJiU58RNYaGtOgk/bCe
 w1yI2YP2SbVhv0rMbV/+VFbFejPSrccMIM7ewvpevs6YwALG2TaQCjysrLUr52NToXoMs/xoFI
 KaBlxbnarOe3CLCRc6EGUleoAhq/SeTnBzKJp2rw8QQ/l+vz55ixcmDkbK4tNwWBBxtxVyq1iY
 bsZZXXNhT9Co9Imeatw2OKUvIyY9VIX9rIzck1S61eOQvHLSTwWbC6Yd9+OTgZ3SaLSbjGww6q
 ASA=
X-SBRS: 2.7
X-MesageID: 27357917
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,290,1596513600"; d="scan'208";a="27357917"
Subject: Re: [PATCH 2/5] xen/gnttab: Rework resource acquisition
To: <paul@xen.org>, 'Xen-devel' <xen-devel@lists.xenproject.org>
CC: 'George Dunlap' <George.Dunlap@eu.citrix.com>, 'Ian Jackson'
 <ian.jackson@citrix.com>, 'Jan Beulich' <JBeulich@suse.com>, "'Konrad
 Rzeszutek Wilk'" <konrad.wilk@oracle.com>, 'Stefano Stabellini'
 <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>, 'Julien Grall'
 <julien@xen.org>, =?UTF-8?B?J01pY2hhxYIgTGVzemN6ecWEc2tpJw==?=
 <michal.leszczynski@cert.pl>, 'Hubert Jasudowicz' <hubert.jasudowicz@cert.pl>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-3-andrew.cooper3@citrix.com>
 <002801d66649$67098050$351c80f0$@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <939af824-9f4e-2c9b-186e-da766a4ecadc@citrix.com>
Date: Tue, 22 Sep 2020 14:13:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <002801d66649$67098050$351c80f0$@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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

On 30/07/2020 09:14, Paul Durrant wrote:
>> -----Original Message-----
>> From: Andrew Cooper <andrew.cooper3@citrix.com>
>> Sent: 28 July 2020 12:37
>> To: Xen-devel <xen-devel@lists.xenproject.org>
>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <George.Dunlap@eu.citrix.com>; Ian
>> Jackson <ian.jackson@citrix.com>; Jan Beulich <JBeulich@suse.com>; Konrad Rzeszutek Wilk
>> <konrad.wilk@oracle.com>; Stefano Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Julien
>> Grall <julien@xen.org>; Paul Durrant <paul@xen.org>; Michał Leszczyński <michal.leszczynski@cert.pl>;
>> Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
>> Subject: [PATCH 2/5] xen/gnttab: Rework resource acquisition
>>
>> The existing logic doesn't function in the general case for mapping a guests
>> grant table, due to arbitrary 32 frame limit, and the default grant table
>> limit being 64.
>>
>> In order to start addressing this, rework the existing grant table logic by
>> implementing a single gnttab_acquire_resource().  This is far more efficient
>> than the previous acquire_grant_table() in memory.c because it doesn't take
>> the grant table write lock, and attempt to grow the table, for every single
>> frame.
>>
> But that should not have happened before because the code deliberately iterates backwards, thereby starting with the last frame, thereby growing the table at most once. (I agree that dropping and re-acquiring the lock every time was sub-optimal).

It still attempts to grow on every iteration.  Its just growing to a
smaller size than already succeeded.

>
>> The new gnttab_acquire_resource() function subsumes the previous two
>> gnttab_get_{shared,status}_frame() helpers.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: George Dunlap <George.Dunlap@eu.citrix.com>
>> CC: Ian Jackson <ian.jackson@citrix.com>
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Wei Liu <wl@xen.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Paul Durrant <paul@xen.org>
>> CC: Michał Leszczyński <michal.leszczynski@cert.pl>
>> CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
>> ---
>>  xen/common/grant_table.c      | 93 ++++++++++++++++++++++++++++++-------------
>>  xen/common/memory.c           | 42 +------------------
>>  xen/include/xen/grant_table.h | 19 ++++-----
>>  3 files changed, 75 insertions(+), 79 deletions(-)
>>
>> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
>> index 9f0cae52c0..122d1e7596 100644
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -4013,6 +4013,72 @@ static int gnttab_get_shared_frame_mfn(struct domain *d,
>>      return 0;
>>  }
>>
>> +int gnttab_acquire_resource(
>> +    struct domain *d, unsigned int id, unsigned long frame,
>> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
>> +{
>> +    struct grant_table *gt = d->grant_table;
>> +    unsigned int i = nr_frames, tot_frames;
>> +    void **vaddrs;
>> +    int rc = 0;
>> +
>> +    /* Input sanity. */
>> +    if ( !nr_frames )
>> +        return -EINVAL;
> This was not an error before. Does mapping 0 frames really need to be a failure?

Yes.

You have spotted the -1 which depends on nr_frames being nonzero to
function correctly.

>> +
>> +    /* Overflow checks */
>> +    if ( frame + nr_frames < frame )
>> +        return -EINVAL;
>> +
>> +    tot_frames = frame + nr_frames;
> That name is confusing. 'last_frame' perhaps (and then make the -1 implicit)?

How is that naming any less confusing?

>> +        break;
>> +    }
>> +
>> +    for ( i = 0; i < nr_frames; ++i )
>> +        mfn_list[i] = virt_to_mfn(vaddrs[frame + i]);
>> +
>> + out:
>> +    grant_write_unlock(gt);
> Since you deliberately grew the table first, could you not drop the write lock and acquire it a read lock before looping over the frames?

I tried originally.  That's not an operation supported by percpu
read/write locks, and this isn't a fastpath.

~Andrew

