Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF56357258
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 18:47:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106852.204286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUBKf-0005sn-QN; Wed, 07 Apr 2021 16:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106852.204286; Wed, 07 Apr 2021 16:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUBKf-0005sO-Mj; Wed, 07 Apr 2021 16:47:09 +0000
Received: by outflank-mailman (input) for mailman id 106852;
 Wed, 07 Apr 2021 16:47:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gkPf=JE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lUBKd-0005sI-DU
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 16:47:07 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 974b7d54-a817-46fb-a33a-a1e32bfd94a1;
 Wed, 07 Apr 2021 16:47:05 +0000 (UTC)
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
X-Inumbo-ID: 974b7d54-a817-46fb-a33a-a1e32bfd94a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617814025;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=w23i8GSsuj4BQov6vS2VilAQeeBQJuwxLnojVwx7HHI=;
  b=emyrIj0gHWy1fDu5Vq7Cjg2Bx79JlbQe7YbNKKHWjxBiPZm9bgnUk2qZ
   fGekg1Jqi6K7enrz1IvXqS6V2Ns95Tq2oxso+7k5G9+uHT6k4llvkfaam
   +/RjarOkyaRB/ZcGDlFuGNezSKSOWYtHhFONmWZ0DOEjtiH7cJX+HKrWL
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WuFP++YhHZrjqPuBny0ZM7r0gtMY9caWhH16cab2eKwVUHAu5ZarjotoZj9uRyPWUvCJJZf95Z
 bD5gJxWHOHGuhMW2NUoodQ/g2vtuKOunI0exg43zDGe4WAClZHVYE/1ogfzReZ+WNRw0Q8/Crn
 Gw//pzOlxWMumFpKd2O/P6jxMnL1hk4edRNoDqPM/LE0DgoriryMWfZPxzEBzoYM87T2iSlk4F
 mi8e/dR244RQnl7l0kgrmYGvlwjcc1obxM5wuv+NedJgli9V/hWSapWX3WALEB7pAy7smc63cS
 2kk=
X-SBRS: 5.2
X-MesageID: 41470308
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:lDWbQ6pswUNWNvzk/YACWFoaV5v5L9V00zAX/kB9WHVpW+SFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex7h3LR+iLNwAZ6JWg76tGy0aLxz9IeK+UyFJwTS1M54kZ
 1hfa93FcHqATFB5/rSzQGkH78br+Wv37uvgY7loUtFaSFPR+Ve4xxiCgCde3cGITVuIZYiDp
 KT6o5milObCBcqR/+2DHUEQOTPzuej/P7bSCULGgI97022hS6ogYSQLzGjwhwcXzlTqI1Sk1
 TtrgqR3MSemsD+8DDw/Sv575NamNzuo+EzefCku4wuBRjHziqtbIRlcbWesD4yu/HH0idXrP
 D85y0OEu42x3TNfnykgRaF4Xie7B8er0XM5HXdoXz/rdf3TDg3YvAx+75xQ1/ixGcL+PRfuZ
 g7uF6xht5sIj7r2BnZ3ZzuUSpnk0KlyEBS6tI7vjhkfqY1LINKoZd3xjIyLL4wWBjUxaoAC+
 dUAMTV9J9tACmnRkGchGVpzdC2N05DZyuucwwHssyR5TBcgGp0+Use3NAehXcN7vsGOuF529
 g=
X-IronPort-AV: E=Sophos;i="5.82,203,1613451600"; 
   d="scan'208";a="41470308"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TeuADc7OF0XvVGxKF0fkQQ+YgllDAcGmJwIrcY2nAMhN6PE3/1Cj4NhcNAmaMdOEa7Rsrw6ROxhL/cJnN3bhg4foTivdB9onH/nr5kHi6sJTrw7fII+5hRNY0ZSMh/2LpnWyNBmwELUkWYU5MFHQxsAhGF2WD9N7N73Eb37BHNA9y6pLXWfOLB+plpfEpv8TIRq4idHHmhnLcx5QiUlSRVNumR/pBFwMSsy0dn9qvcHEZ72m+39OTuva0rzLfOLq3l81YD+XhnV3sGejkrBryLKho9Q1rrEbLfo8ZyUzECt/UJhjLfvRiwWAzyVWDU7EVtTsEhVOoEIMpJ7lFaTz4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQISxLn7cl+Xpu0aBwzT99DyZWyjhTJ0C1evcy3bkkc=;
 b=eHJwwrrAKFkS/dYR3Nq1S+wJKm2X5vDFJbYMh9ycAUhNhdMnS0n5ETp+BrW288CmoCORp+gejBLqAu4lgr424MpEp47svzYA4wzZ/GJZZP9V0HjgkPOwydIWQg8EpDSCo89a2QGGTT3nkwMS8jEE2y80DwWVHi/T8CaMwuaj4//S88YhY9KaRGQH/S7W66IzeYqU3c/6ET1o6BwODPSYJmzZXesZe7JC7SAfqOgSwymPMmYuXtPZE8Iu+bxE5bVKRYmACvQdkgU2x270nsxZCEX/E0v6/biRA7Cs3UdNp2ex154aCkpbiTicJ4WTeMDw6XFbSc+5DDnnn43svWw37w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQISxLn7cl+Xpu0aBwzT99DyZWyjhTJ0C1evcy3bkkc=;
 b=ebYshAW5sTCt+MdkpiDkW0fRvTw9YjYwBhFH8jixPcVFDlW4zgD4tlblUzg1S7/MppVrBkcthkAtTalRLVVh4dnbV7eIZ3xW3RdSY6yKU9qPl7aiiDpdt2cHBq47uP2seCPMxSZIzTy/RjAtAC5D4CWigV6XX4bG+bIxegK7cUw=
Date: Wed, 7 Apr 2021 18:46:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 05/11] x86/vioapic: switch to use the EOI callback
 mechanism
Message-ID: <YG3iAeFFA/ZJh5es@Air-de-Roger>
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-6-roger.pau@citrix.com>
 <f8d9c37f-8896-36af-712a-ac0765567409@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f8d9c37f-8896-36af-712a-ac0765567409@suse.com>
X-ClientProxiedBy: MR1P264CA0017.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f52d145a-87d2-402a-cc9d-08d8f9e4c4ff
X-MS-TrafficTypeDiagnostic: DM6PR03MB4217:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB42171ACC9DAF13DD349635678F759@DM6PR03MB4217.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VD78VIOA+j2Kz2sXCEZEK2Cz4ZnNM9PHODe0zbJc/uoi5g3PXgQwcwZEsa4ANdwCV/0G7xeArBPF7atthdrLwaAIpYzHIwvFQPYwlgILWavIQ84Kn69Kel1VQUu6XcYfVbdnY/y+LVd3xSVMskSkyyu0Q/M5R26er98noimfoyIt6QdGscYLV+VjyL3zNhz5/PUrkIFNkwQPCDL7TLDToUgA5vWCnSQq31lilZ2oiEm0d/L0p2bmezwv7xJnP6W1+7OUUt4Zw0pCq5baPXTm69WXEkxIiUp86b+v5wPmC0etjPwDRWCstSctPxVqtHcb6/6mGIH9992+UORaS56gZ7Haqg+e78F/YuUTBrvw0DOlsDX4oCZe7aFyMFu5N/ahjfBEVgvR2Z3oB8hwpwrBmr9qwgv6lO0jOl+6eWQJnU8RVrNf6x2TMDTTlWcqKlqIKVZ8Y4yZWytfX5nPdsts5jvCJu5Fed1l+1LzDGY2DrqFL7gcNKjM/IJsQYG+NukrxOGd72zL9f5DckccbBuaaWXGM5Vfu+oEjAFaM4yu51kZVfIIdgsmyUmxP0sObLLITrlI7Fh+zsgLo389Cowp+i3HpIDw3SpMHNVLNbuMSstEuwIJNuoD4UGfV+aTlyp3wctgL0XO+/cdgKXPjykQTvweizPa8Pdq5u9ripN+KANi8NxJFkj6kMKJrlkiXs59
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(396003)(366004)(136003)(346002)(376002)(86362001)(6486002)(66476007)(66946007)(66556008)(8936002)(9686003)(8676002)(6916009)(6496006)(83380400001)(956004)(85182001)(4326008)(6666004)(26005)(53546011)(16526019)(2906002)(186003)(33716001)(38100700001)(5660300002)(54906003)(478600001)(316002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WVNRRWVXOWwzdnphVDYyd2RKbWNtd0FkM1pNL3JiLy9hZ2FNM1JCU0NqZEZG?=
 =?utf-8?B?MkRrWFZGd0dHZXNPU0drVjdPd3dSSjVsakNlVlVNMlkzejBQWW1ZVU1NYUgw?=
 =?utf-8?B?RnJkcE9jWDF6aHVxNjZaaHlIN2tGVTJzL0wvT0o1bHUyMnlKandZZC9FWHg5?=
 =?utf-8?B?ZUJLQW92QjJnbkpnZnBqV24vREJ0aW9kaC9tUCthUlVyTEN1aXBEN2IvUUln?=
 =?utf-8?B?K1p3VDAzdGFaWWFMdG45TFVMNGNUVFB6c2ZaZ0JDUE1jT1VxYWVTdkUrQjJZ?=
 =?utf-8?B?Y1ZNTDJUbGR0akVnOFpEclBNeEs1d0Fkd3BJZWtLMEJ4VzJQMGlmSG5FdG92?=
 =?utf-8?B?OUU5MXBJeHJJaXJJNjdqTXlRWlE1c1Zvd1dIdHNCRkFnUHhoMDFXbG5wUjU2?=
 =?utf-8?B?ajFuMFBOQkdjR2JOdkk5ZWo4YzhsMUFuZVlrVTFkaFJoMTZ4bnNIcTROUmRD?=
 =?utf-8?B?K0grZjFWMTUzWVdTcTlaZ213SStGaUVib3Q3RmN1dXRrZEhuejVpT28vUzNM?=
 =?utf-8?B?d1BLNyt1d1RTWU9WUHQwNVpSR2ZpbUJFTnJuTWE3d0VuNjVzYU1LTGFrbDlZ?=
 =?utf-8?B?dDlka1lrY0E3OU9NaWV6KzFGSSs0RzdUdGs0RlJHUG9xSm5tMmhUOGZBVkxN?=
 =?utf-8?B?YVBzVHNVSVdxUHNxbEpQZmsyTG1MUFF3eFBiY3RldGZwWUFlNlJZRlczbmMr?=
 =?utf-8?B?S0VkR0xCcnVYVGp5ZFlOM1plMGc0U28wVUppUVJSMzNxSFptNWRnT2I5N2pF?=
 =?utf-8?B?ZHQwNUF6RHJHRUdlaGNqNGErZ1AwSFVocnJ1MVdYUFhqYWJuU0Nlb29CRnUw?=
 =?utf-8?B?ZlVwdi9iVkF6T2lUc1dhaThyMU1PeEUyRDVQcVl3MjdBeVUzcytTOXNUaW96?=
 =?utf-8?B?bGFJNjU2eFBVRk9TWHlPdDBIbDdaQllZUnFJcUxhZ3VEamMxU2tDVGttRENT?=
 =?utf-8?B?akFld0l0LzNtYURLVjNTZHJ2TG9lTndtNytjNGs4ZWJtKzh1NERGMVVoRlFL?=
 =?utf-8?B?T2krZ0s5c2FCMnpFbHlkMmVsYnJzM3g4blNlWFZnV29ZOGhnL0NvSVhQVFlZ?=
 =?utf-8?B?SzdmWjhHck8yVjZ1azF2Z1pibStyMU5OOHNzUmNDem1XRVAwYm1BZytrSlNR?=
 =?utf-8?B?azNkRXJ6aUEvbXZPTHZNUmtXRk52OGsxbUJ3YVF2R2QvSEo5UUdnUzhCVUJF?=
 =?utf-8?B?SDdxVFhtSmFaY1JNY1JZZmNWU0lEWkxIellLbGpzUXNVRDA4M2IxN0RKNklj?=
 =?utf-8?B?a3NZS0RUKzRNQktZYS9hTU9oRVlDRXBuLy9CRWZmWVVOYjNvQzZ3MXd4VW1U?=
 =?utf-8?B?cGF2NFRjcXVMazYvUWFvMkQ1ZUZjWmtHd3h3aThmVis2NG52eU5YOHpDeWhz?=
 =?utf-8?B?TXNlTStSNXlHQWF3aUxnQk1kcUV3NlpEbWRhK0UrMG9RUjRxYnpEUmJSRzBo?=
 =?utf-8?B?bjlNY2RsK3JXNnZMUlVCd2tiaUo3M1ltNGtzMEkvK3ZzZmNCZWZyRXBRMkFV?=
 =?utf-8?B?eEQ5T1FTWUJXMkZlY2tWK1dHajdkTUtSUzcyZWV0ZVYzMU80b2FXdnBVZGhM?=
 =?utf-8?B?YVhTcDRrNDBXQy9meHZqb1hKcUpwTlhuUXl4aVhWS0Zmbm51cWx6Z2JZZURM?=
 =?utf-8?B?L2lneE5sK2ovWHZxUXJlazkzcGxwb09HRk9xaXZFdG5tZ081NFlLa2wyZlJB?=
 =?utf-8?B?TmdMVTlHV1VkRjlLVlVpMHZjclEwRGdWQkRpMGE1RUcxa0RNaFdPWHRQcFg3?=
 =?utf-8?Q?4WZ/OECVhyZiW+jk4BR28dwdJvfvhxXk6skrRi1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f52d145a-87d2-402a-cc9d-08d8f9e4c4ff
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 16:47:02.8377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnSo4BlnT6d95fAmdx0/P4zd2ittwKcHSPf6IYcT5gTJyi6GvC+KpxRfpj07tWkmrA+onXlKB3TMcssmBDe2uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4217
X-OriginatorOrg: citrix.com

On Wed, Apr 07, 2021 at 05:19:06PM +0200, Jan Beulich wrote:
> On 31.03.2021 12:32, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/hvm/vioapic.c
> > +++ b/xen/arch/x86/hvm/vioapic.c
> > @@ -621,7 +624,43 @@ static int ioapic_load(struct domain *d, hvm_domain_context_t *h)
> >           d->arch.hvm.nr_vioapics != 1 )
> >          return -EOPNOTSUPP;
> >  
> > -    return hvm_load_entry(IOAPIC, h, &s->domU);
> > +    rc = hvm_load_entry(IOAPIC, h, &s->domU);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    for ( i = 0; i < ARRAY_SIZE(s->domU.redirtbl); i++ )
> > +    {
> > +        const union vioapic_redir_entry *ent = &s->domU.redirtbl[i];
> > +        unsigned int vector = ent->fields.vector;
> > +        unsigned int delivery_mode = ent->fields.delivery_mode;
> > +        struct vcpu *v;
> > +
> > +        /*
> > +         * Add a callback for each possible vector injected by a redirection
> > +         * entry.
> > +         */
> > +        if ( vector < 16 || !ent->fields.remote_irr ||
> > +             (delivery_mode != dest_LowestPrio && delivery_mode != dest_Fixed) )
> > +            continue;
> > +
> > +        for_each_vcpu ( d, v )
> > +        {
> > +            struct vlapic *vlapic = vcpu_vlapic(v);
> > +
> > +            /*
> > +             * NB: if the vlapic registers were restored before the vio-apic
> > +             * ones we could test whether the vector is set in the vlapic IRR
> > +             * or ISR registers before unconditionally setting the callback.
> > +             * This is harmless as eoi_callback is capable of dealing with
> > +             * spurious callbacks.
> > +             */
> > +            if ( vlapic_match_dest(vlapic, NULL, 0, ent->fields.dest_id,
> > +                                   ent->fields.dest_mode) )
> > +                vlapic_set_callback(vlapic, vector, eoi_callback, NULL);
> 
> eoi_callback()'s behavior is only one of the aspects to consider here.
> The other is vlapic_set_callback()'s complaining if it finds a
> callback already set. What guarantees that a mistakenly set callback
> here won't get in conflict with some future use of the same vector by
> the guest?

Such conflict would only manifest as a warning message, but won't
cause any malfunction, as the later callback would override the
current one.

This model I'm proposing doesn't support lapic vector sharing with
different devices that require EOI callbacks, I think we already
discussed this on a previous series and agreed it was fine.

> And btw - like in the earlier patch you could again pass d instead of
> NULL here, avoiding the need to establish it from current in the
> callback.

On the new version the vlapic callback gets passed a vcpu parameter,
as I will drop the prepatches to remove passing a domain parameter to
vioapic_update_EOI.

> > --- a/xen/arch/x86/hvm/vlapic.c
> > +++ b/xen/arch/x86/hvm/vlapic.c
> > @@ -192,7 +192,13 @@ void vlapic_set_irq_callback(struct vlapic *vlapic, uint8_t vec, uint8_t trig,
> >  
> >      if ( hvm_funcs.update_eoi_exit_bitmap )
> >          alternative_vcall(hvm_funcs.update_eoi_exit_bitmap, target, vec,
> > -                          trig || callback);
> > +                          /*
> > +                           * NB: need to explicitly convert to boolean to avoid
> > +                           * truncation wrongly result in false begin reported
> > +                           * for example when the pointer sits on a page
> > +                           * boundary.
> > +                           */
> > +                          !!callback);
> 
> I've had quite a bit of difficulty with the comment. Once I realized
> that you likely mean "being" instead of "begin" it got a bit better.
> I'd like to suggest also s/result/resulting/, a comma after "reported",
> and maybe then s/being reported/getting passed/.
> 
> As to explicitly converting to bool, wouldn't a cast to bool do? That's
> more explicitly an "explicit conversion" than using !!.

I've always used !! in the past for such cases because it's shorter, I
can explicitly cast if you prefer that instead.

Thanks, Roger.

