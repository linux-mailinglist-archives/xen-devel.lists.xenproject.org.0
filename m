Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9902E09D6
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 12:47:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57782.101256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krg7w-0000no-23; Tue, 22 Dec 2020 11:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57782.101256; Tue, 22 Dec 2020 11:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krg7v-0000nP-Uj; Tue, 22 Dec 2020 11:46:51 +0000
Received: by outflank-mailman (input) for mailman id 57782;
 Tue, 22 Dec 2020 11:46:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=if9N=F2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1krg7u-0000nK-02
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 11:46:50 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1272a12b-d560-4031-8651-5ae36a0b1e86;
 Tue, 22 Dec 2020 11:46:48 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 1272a12b-d560-4031-8651-5ae36a0b1e86
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608637608;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=tD5CRwL0RrGeMusPck/cEkV9FddfSXSlwlsPh9YbCWQ=;
  b=YI4XK+GgF609tJA7O6K645kGX/1NtFcQdHYZhctiA7eRxrvuCQPCQTQm
   JuhpmlZl9JCdpRPI1NkQDKO7XjxI7jLN5IQtwCveTC4TmfRxmO3rrtsB3
   dYaVearsqfk5ozNoFYOqY63+AqjY1Nro2UzxXcrOAhyfUP9g6rVTdbrQF
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: FUklLGfjUQ6tG5YjdSDgLd9k9O27XCNUy29jkUS0cupBJGuWYR05iPxAFkAW6ckkwCbDMowVtE
 iTsugbXCKWv4m6rP3MrFyL/q5kbrT9YVzbvM+AFVFZJouspruG7i2WnRvJ0jbtNF4/gJA6AHeB
 r1N/itjwb+ds650yulldiLvI296Ae5kEtigB5Cpbq41++eOZAEtyF2apGHCa7CcTdZBgDt2eja
 cKO/x+BdSC0pDpZ7LHL99J4dh2nxg/U2gDb3dkQUwuxqO2Ldlt7cDIpbGy3rCMgen1OuvPJ+Bb
 7R0=
X-SBRS: 5.2
X-MesageID: 34986516
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,438,1599537600"; 
   d="scan'208";a="34986516"
Subject: Re: [PATCH 2/3] xen/domain: Introduce domain_teardown()
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
 <20201221181446.7791-3-andrew.cooper3@citrix.com>
 <b3d1cb55-2793-f37e-13d1-b9e8de2057da@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <49d46056-2b99-3ec6-cf93-3f40be259330@citrix.com>
Date: Tue, 22 Dec 2020 11:46:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b3d1cb55-2793-f37e-13d1-b9e8de2057da@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 22/12/2020 10:35, Jan Beulich wrote:
> On 21.12.2020 19:14, Andrew Cooper wrote:
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -273,6 +273,59 @@ static int __init parse_extra_guest_irqs(const char *s)
>>  custom_param("extra_guest_irqs", parse_extra_guest_irqs);
>>  
>>  /*
>> + * Release resources held by a domain.  There may or may not be live
>> + * references to the domain, and it may or may not be fully constructed.
>> + *
>> + * d->is_dying differing between DOMDYING_dying and DOMDYING_dead can be used
>> + * to determine if live references to the domain exist, and also whether
>> + * continuations are permitted.
>> + *
>> + * If d->is_dying is DOMDYING_dead, this must not return non-zero.
>> + */
>> +static int domain_teardown(struct domain *d)
>> +{
>> +    BUG_ON(!d->is_dying);
>> +
>> +    /*
>> +     * This hypercall can take minutes of wallclock time to complete.  This
>> +     * logic implements a co-routine, stashing state in struct domain across
>> +     * hypercall continuation boundaries.
>> +     */
>> +    switch ( d->teardown.val )
>> +    {
>> +        /*
>> +         * Record the current progress.  Subsequent hypercall continuations
>> +         * will logically restart work from this point.
>> +         *
>> +         * PROGRESS() markers must not be in the middle of loops.  The loop
>> +         * variable isn't preserved across a continuation.
>> +         *
>> +         * To avoid redundant work, there should be a marker before each
>> +         * function which may return -ERESTART.
>> +         */
>> +#define PROGRESS(x)                             \
>> +        d->teardown.val = PROG_ ## x;           \
>> +        /* Fallthrough */                       \
>> +    case PROG_ ## x
>> +
>> +        enum {
>> +            PROG_done = 1,
>> +        };
>> +
>> +    case 0:
>> +    PROGRESS(done):
>> +        break;
>> +
>> +#undef PROGRESS
>> +
>> +    default:
>> +        BUG();
>> +    }
>> +
>> +    return 0;
>> +}
> While as an initial step this may be okay, I envision ordering issues
> with domain_relinquish_resources() - there may be per-arch things that
> want doing before certain common ones, and others which should only
> be done when certain common teardown was already performed. Therefore
> rather than this being a "common equivalent of
> domain_relinquish_resources()", I'd rather see (and call) it a
> (designated) replacement, where individual per-arch functions would
> get called at appropriate times.

Over time, I do expect it to replace domain_relinquish_resources().  I'm
not sure if that will take the form of a specific arch_domain_teardown()
call (and reserving some space in teardown.val for arch use), or whether
it will be a load of possibly-CONFIG'd stubs.

I do also have a work in progress supporting per-vcpu continuations to
be able to remove the TODO's introduced into the paging() path.  However
there is a bit more plumbing work required than I have time right now,
so this will have to wait a little until I've got some of the more
urgent 4.15 work done.

~Andrew

