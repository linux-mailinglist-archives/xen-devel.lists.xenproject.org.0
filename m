Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6CE233939
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 21:46:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1EVe-0003gO-9l; Thu, 30 Jul 2020 19:46:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HZLI=BJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k1EVc-0003gJ-ID
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 19:46:32 +0000
X-Inumbo-ID: 5d59a146-d29d-11ea-8dc5-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d59a146-d29d-11ea-8dc5-bc764e2007e4;
 Thu, 30 Jul 2020 19:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596138390;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=o7236mwxcBJcdUA4ijAWCDksAy0tIC0prIHV5JjaWok=;
 b=LYAcKxmsBiKaJigoaztryJpmpBdqdAApY1RlRiJOBM7Ndpl4rAFS0xui
 hOcPCl+B7F4aJhsH2TYAj4tGdS+AfPHprTCgmvVaRdrJpgKeq069Sd7/y
 SSU3tcIyBYGj97bBvT7WvDUAcBLIO30oezO5MOiDjBYRWSlE6gnB+xqBX g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: y6sbKlEqBMtWssC+XHVuhAvCDVY9l0Vk2KNY8UIlEfqsRK8fZmgHfFqobjkiS2oJPrShPy6D3x
 2XJyKyN+dcCYapHa3xzAdF7ZNtvlaAJcIo+IsLgr8RqU25D+PxaYYGFkzLRCFyTFBFTxBaVz/F
 5AYN/iMUhSSiXZMAIGMY6aaInGwngsXH2+4ZjkE0szs8rByzCtryIz5uw3sc+31GNAltqD8YCe
 o6ff5UiT/JEq1soqlKgMzKc8VmLCxUaZhudEmYAXBvMyB0BpCgZPHs1YtZBvs3tPpQctMGSYJg
 NF8=
X-SBRS: 2.7
X-MesageID: 23902736
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,415,1589256000"; d="scan'208";a="23902736"
Subject: Re: [PATCH 4/5] xen/memory: Fix acquire_resource size semantics
To: <paul@xen.org>, 'Xen-devel' <xen-devel@lists.xenproject.org>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-5-andrew.cooper3@citrix.com>
 <002b01d6664b$c7eb5f40$57c21dc0$@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <474ff131-83d8-deff-4e3a-32392ea092b3@citrix.com>
Date: Thu, 30 Jul 2020 20:46:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <002b01d6664b$c7eb5f40$57c21dc0$@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>, 'George
 Dunlap' <George.Dunlap@eu.citrix.com>,
 =?UTF-8?B?J01pY2hhxYIgTGVzemN6ecWEc2tpJw==?= <michal.leszczynski@cert.pl>,
 'Jan Beulich' <JBeulich@suse.com>, 'Ian Jackson' <ian.jackson@citrix.com>,
 'Hubert Jasudowicz' <hubert.jasudowicz@cert.pl>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30/07/2020 09:31, Paul Durrant wrote:
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Andrew Cooper
>> Sent: 28 July 2020 12:37
>> To: Xen-devel <xen-devel@lists.xenproject.org>
>> Cc: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>; Stefano Stabellini <sstabellini@kernel.org>; Julien
>> Grall <julien@xen.org>; Wei Liu <wl@xen.org>; Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>; George
>> Dunlap <George.Dunlap@eu.citrix.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Paul Durrant
>> <paul@xen.org>; Jan Beulich <JBeulich@suse.com>; Michał Leszczyński <michal.leszczynski@cert.pl>; Ian
>> Jackson <ian.jackson@citrix.com>
>> Subject: [PATCH 4/5] xen/memory: Fix acquire_resource size semantics
>>
>> Calling XENMEM_acquire_resource with a NULL frame_list is a request for the
>> size of the resource, but the returned 32 is bogus.
>>
>> If someone tries to follow it for XENMEM_resource_ioreq_server, the acquire
>> call will fail as IOREQ servers currently top out at 2 frames, and it is only
>> half the size of the default grant table limit for guests.
>>
>> Also, no users actually request a resource size, because it was never wired up
>> in the sole implemenation of resource aquisition in Linux.
>>
>> Introduce a new resource_max_frames() to calculate the size of a resource, and
>> implement it the IOREQ and grant subsystems.
>>
>> It is impossible to guarentee that a mapping call following a successful size
> s/guarantee/guarantee
>
>> call will succedd (e.g. The target IOREQ server gets destroyed, or the domain
> s/succedd/succeed
>
>> switches from grant v2 to v1).  Document the restriction, and use the
>> flexibility to simplify the paths to be lockless.
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
>>  xen/arch/x86/mm.c             | 20 ++++++++++++++++
>>  xen/common/grant_table.c      | 19 +++++++++++++++
>>  xen/common/memory.c           | 55 +++++++++++++++++++++++++++++++++----------
>>  xen/include/asm-x86/mm.h      |  3 +++
>>  xen/include/public/memory.h   | 16 +++++++++----
>>  xen/include/xen/grant_table.h |  8 +++++++
>>  xen/include/xen/mm.h          |  6 +++++
>>  7 files changed, 110 insertions(+), 17 deletions(-)
>>
>> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
>> index 82bc676553..f73a90a2ab 100644
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -4600,6 +4600,26 @@ int xenmem_add_to_physmap_one(
>>      return rc;
>>  }
>>
>> +unsigned int arch_resource_max_frames(
>> +    struct domain *d, unsigned int type, unsigned int id)
>> +{
>> +    unsigned int nr = 0;
>> +
>> +    switch ( type )
>> +    {
>> +#ifdef CONFIG_HVM
>> +    case XENMEM_resource_ioreq_server:
>> +        if ( !is_hvm_domain(d) )
>> +            break;
>> +        /* One frame for the buf-ioreq ring, and one frame per 128 vcpus. */
>> +        nr = 1 + DIV_ROUND_UP(d->max_vcpus * sizeof(struct ioreq), PAGE_SIZE);
>> +        break;
>> +#endif
>> +    }
>> +
>> +    return nr;
>> +}
>> +
>>  int arch_acquire_resource(struct domain *d, unsigned int type,
>>                            unsigned int id, unsigned long frame,
>>                            unsigned int nr_frames, xen_pfn_t mfn_list[])
>> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
>> index 122d1e7596..0962fc7169 100644
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -4013,6 +4013,25 @@ static int gnttab_get_shared_frame_mfn(struct domain *d,
>>      return 0;
>>  }
>>
>> +unsigned int gnttab_resource_max_frames(struct domain *d, unsigned int id)
>> +{
>> +    unsigned int nr = 0;
>> +
>> +    /* Don't need the grant lock.  This limit is fixed at domain create time. */
>> +    switch ( id )
>> +    {
>> +    case XENMEM_resource_grant_table_id_shared:
>> +        nr = d->grant_table->max_grant_frames;
>> +        break;
>> +
>> +    case XENMEM_resource_grant_table_id_status:
>> +        nr = grant_to_status_frames(d->grant_table->max_grant_frames);
> Two uses of d->grant_table, so perhaps define a stack variable for it?

Can do.

>  Also, should you not make sure 0 is returned in the case of a v1 table?

This was the case specifically discussed in the commit message, but
perhaps it needs expanding.

Doing so would be buggy.

Some utility is going to query the resource size, and then try to map it
(if it doesn't blindly know the size and/or subset it cares about already).

In between these two hypercalls from the utility, the guest can do a
v1=>v2 or v2=>v1 switch and make the resource spontaneously appear or
disappear.

The only case where we can know for certain whether the resource is
available is when we're in the map hypercall.  Therefore, userspace has
to be able to get to the map call if there is potentially a resource
available.

The semantics of the size call are really "this resource might exist,
and if it does, this is how large it is".


As for the grant status frames specifically, I think making them a
mappable resource might have been a poor choice in hind sight.

Only the guest can switch between grant versions.  GNTTABOP_set_version
strictly operates on current, unlike most of the other grant hypercalls
which take a domid and let dom0 specify something other than DOMID_SELF.

There is GNTTABOP_get_version, but it is racy to use in the same way as
described above, and if some utility does successfully map the status
frames, what will happen in practice is that a guest attempting to
switch from v2 back to v1 will have the set_version hypercall fail due
to outstanding refs on the frames.

~Andrew

