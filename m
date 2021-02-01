Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EEC30A997
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 15:23:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79906.145714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6a6g-0006eZ-Cl; Mon, 01 Feb 2021 14:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79906.145714; Mon, 01 Feb 2021 14:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6a6g-0006eA-9T; Mon, 01 Feb 2021 14:23:10 +0000
Received: by outflank-mailman (input) for mailman id 79906;
 Mon, 01 Feb 2021 14:23:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWGu=HD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6a6e-0006e3-RP
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 14:23:08 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ce82b0d-327d-4457-bcc8-9f7f562ae2ff;
 Mon, 01 Feb 2021 14:23:07 +0000 (UTC)
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
X-Inumbo-ID: 2ce82b0d-327d-4457-bcc8-9f7f562ae2ff
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612189387;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=S1mLsKUUQh3XUJlDeuDVuscRMdGY+VyPnjPpCqoc9Fk=;
  b=cvFE7nzZm9yl9Py42gmvVfrIZM39UFKG14RPG9KqHHi12Rph407alDvU
   5PmjNxkKDFEOjZ1cExO7WUwfSRezk9mDeo1SVM61gw6kHDfW6ZzKnHzWr
   Yp/5jrI3FIibjTBEghmH8OcV9BqF3RhEJTv7svanjenwzb3CpXoC4XE/5
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ayd3akQopjyTRp2jIkTkijPgzDMHwMqP08SzGBEH1CDw/hybYIVXiPqdEfO2z6IdsZSr+KzzdE
 2BZYHc8K16VZ9o3xdMNJgOVsjbkqNBy7eOqZr7Ol8Ht5pjdentpKMCa1O0yx5nsnZGh1Bcm5im
 rbbIpLCAEiU2S/7foBsQz5M6NLU6p1NyHFHXgIgPc0p4QSzJ0G8cYEsO2dhqIR5QDIDZmq5By1
 DUtFbrC0rKT6NfZ+viV++L7ts15JCjYEACgkPOPflMTy6TAZElOCsSZOUNpzzmAmnl27Q/wRZI
 Tc0=
X-SBRS: 5.2
X-MesageID: 36235930
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,392,1602561600"; 
   d="scan'208";a="36235930"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S18wDtbOLO5SGredUbOa6zBBEMXj9lNRp38YtHkiWziXWUweW/Ml7oAzdb40KkJY8dPTznzVN0Dqy47utpSe9LGwxC9mL0Ikhd5gymonQCZcP1YJBIjQZdCz6Um8D4Vyrl3m+2z+4g0yKmddyi9XfFJibpTwWYaBAxc1zQ8/KqR8asP/mjIrfEN7FQFuuJYeVWMylDtplblHLCGsM3s9SpwMP4nzKehJSibgFBa6nu5BM8dIT1DNYKMWFp8nXPznXREbsnoOG6PE5RkH7WX8pOA0IH+/cUtO5eHGeXXOYLS2Hbqn8LIUAQEIv8lleTYNlqYmcyc1ZuPtPbA2WN897Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l31qFCme4UtzWak68FnfvS7fS+QbUGHWlTKm9xQxhTQ=;
 b=aUDuros7o7/k0aMyCqiVPSX20701Cq1c7UVGEheuN2P0w5Ifgwe+PjSvTGq7kj64RT+dqdc9c5fMqMJdcyMN+/5qfFmAfULWqHfa0pNpybrZOdHjvoWu8wQfaawvdW1jaeJeZxph1LpGWjWXd2tXGUjhZTI74vClqMToxEu9GDmP/SIIDoh70pEAb4SQ/zJafl6BQtPAl8ElQCvpH/gYWpCt/syfM8r4kXAwoqzWcskpP9gPL1dPIYRUaNaf+ESeFIoPhcwDiKUoclp0Bcsb+91U1i6vmqJSRxRrVDGGKQwCdHEC/HB55oQYRaJAWv7QlFclLtnFI+HjnhxJr8HZZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l31qFCme4UtzWak68FnfvS7fS+QbUGHWlTKm9xQxhTQ=;
 b=o2efHwRLzodVoh4gkzNguNtGDcDII6M/NOVrDCH+3crSh5ptswR1yIql5+yR9T85lEr7i1eCjNp4S74MgHlnIKJaC812de0bLeqrMP2SeiornkgOkRegDlzDh2m87n3ZhJELZD6vPyzfA3XY+L3pZYv5QOK5dfRnwu0B4FJlvQ8=
Subject: Re: [PATCH v8 08/16] xen/domain: Add vmtrace_size domain creation
 parameter
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
 <20210130025852.12430-9-andrew.cooper3@citrix.com>
 <3cf886f6-db7f-ccc1-5ef0-6fd8ccb38caf@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f54dec0a-65b6-07bf-9de8-ed96ffd8d791@citrix.com>
Date: Mon, 1 Feb 2021 14:22:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <3cf886f6-db7f-ccc1-5ef0-6fd8ccb38caf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0300.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::24) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f874483c-6b01-4dd1-3a3e-08d8c6bce276
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5872:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB587294CA7065DEC3427B6CD0BAB69@SJ0PR03MB5872.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OnjgKUdYGyRuz6ExZBCe3OI0a+99SdIr9MWzpL3ZoNKwqV2+l3mljbi3T5srVevSMpa2VHnDVUXeTBLJeJSoEdn+gfQ+nuCE/UEyep5x8slhxM0Jz0UoWQvtwgXd/Ng3Z4DmcljYNy9MuziclRqy29sd2CWs/lHO7LZ6XZaetrvCFLAIE0TpTillA9BRPWIVhVyGePE11AjbfGxv5QWOLosHqrdhYnLOTwZSC77jjQSfbLiPc/8OKue3zYsBbwNLVURD8ghFbjK59lDlap9BblzBxSayXkCtJ6X7upc+4geECB/VGctQH+DmGKeQSHKZ/i+2duZYFiqthrn7ynH710tKD1fHAB011NhDa1v1U5RxMbJIFysMWtPV0V9HFYlz0jFwe+kRMCIeDi+ozlIiMHdzBYVZE6XvcTln/wVMoYh+tn5qepEh/oAMWIIhFla09alk7Q9K59jQzrOKpgcPnny+TExKWvNPxXAGT61zDEGWPnoJLzinyZD8V6CR+MMhdz12hjG+i8m3v2sS5EqNo26L9JI2Unt/WKFfyGiDrLUbPJMH+ghIVKXe7fjnrG0ddJvo5uXgaq8Cnd8n4MOXdjvpD75C8Z4hATD8qGYrq8w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(31686004)(8936002)(4326008)(478600001)(53546011)(6666004)(5660300002)(8676002)(66946007)(956004)(31696002)(316002)(66476007)(2616005)(83380400001)(36756003)(66556008)(16576012)(86362001)(6916009)(54906003)(26005)(6486002)(186003)(2906002)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R1pESGJ4VHR5RG8xbjRZMXZKSGp0TlhmZGVYQXg4eXMvUEEralQ3a3g5MWxI?=
 =?utf-8?B?R01SYktzZEg5Q1o3ZEpjTFZ1blY3RWMwbllHL3FPbGxKWVZadUlJOFNaM2t0?=
 =?utf-8?B?dkdudFV5WDlwMnpKNFRRNVpzY0pydkYwc0p2WFJiMkZPRTZpVi9lT245K0hl?=
 =?utf-8?B?dUwyL2FKMjlWQ1AyUDNTQjJ4SzVtTzJkamZRcHRyNWpiQ2JMTWtQTHRRY0Z2?=
 =?utf-8?B?NzVtR3dqOXJhUHJzZlFiRjZYQjlOM2IvaW1uaGVsME9NQkc3dENEbTFEZVp2?=
 =?utf-8?B?QUtXODVNY3JONVdITmY5T3NaYytQZk1CSDBsbHpVRWo5U3dMZ1M1VjNFb000?=
 =?utf-8?B?cndZTm1VMEhVdFVJY2JDNnEyMDNuTUNDSGZZNUUvRE5nM2RqVVRabUNDTkQz?=
 =?utf-8?B?Nlk4TFJZWDhYQkdIZ3dTQkRiNVowb1VHeHJ4aURVVldoSFNLL2k2WVpycEdU?=
 =?utf-8?B?QjdCU2FMY25JZmlaVnhlUTkxMlQzS3VWVWYzVlp4SnJ5dGRVVXJCUXJUcHRB?=
 =?utf-8?B?d3luRy8xOSt1RDlQckdCbTFiQm0zT0dSK0FDRW5tVlRuOFVvZG9wR2txV0hR?=
 =?utf-8?B?L2xqVFA4dGpleHg5NkVJZS91Z3RzbzJqaDdJZnUwMU1nWGlQUzk1bVg2YzAx?=
 =?utf-8?B?MXpKMkRCYi9MZWtUSUE4dUo5ZGRyOFhpeWRzNGR1eGlobWhER0lEbXBPanpv?=
 =?utf-8?B?aWhvN21ZNzVTTGpFRFZVbFBlVk11blBmZ0tLcVlxSndwZDhKdVE0ZFJkQzBx?=
 =?utf-8?B?UWVqdEh3L1ZsQllaRW80WWhVYVpJSmFJN1I4eGdwMmRtQjV4cXloalRhZE82?=
 =?utf-8?B?QkFHOEVqRXFxNkZqaWdvZnlMTW1QTElJbnUya3FoZCtESlNiekc3cjRsU1lz?=
 =?utf-8?B?NXUremY2cFJsRzRIL3RDcmdpdVI2L01sd096QmFNRWVYZWw4Zk41WllCekhz?=
 =?utf-8?B?Ylh2YmtZRlJZMUhKV1NvZ3NEVGxUaUVxTzV4b214MjhZbC91RnZmUXlqSWRG?=
 =?utf-8?B?cGVCMFp0UHhzcFFKZDRqa1FZVWM0VTV3dC9ua01QODdJN1pGYW5yb292MkM2?=
 =?utf-8?B?bUZiSHdsK3dOK1JiRVlpYktpNnRiU2Ztdy85VTlVSFVIM09sWVVlOFNWVUpS?=
 =?utf-8?B?aWFEVk81emRrTjllK08rdWgvODNKUVhPWDEyYkx0QThJem1wS2FOcTY1TE1z?=
 =?utf-8?B?M1BycTZzQ0ZCWnpGVFlNeTdMV0hxSEYvYnRhS2VYa1B6Z3hPNWhBbThiMWcv?=
 =?utf-8?B?RmowYm1yM0RaODZxZEU0Q0hHRkpUTWUvUHhNWUV1c1BmSEllRm1zWXJ4dllB?=
 =?utf-8?B?UU16M1Fzb3cyamFOSGxDNDRUMmRvV2svM1puL3k5MUdLUTcveGY0Z1FUT1ow?=
 =?utf-8?B?UmlWZUJMYjdYWFdKRG4xcGNvM0grNXlna2cva1VLeU5mY1h2S2tqMjFraVht?=
 =?utf-8?B?a1pIWFF4ZVhseEtsVmxyVkw0OGZ5VTVGYkkvSFZRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f874483c-6b01-4dd1-3a3e-08d8c6bce276
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 14:23:03.0714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFNEc26cQS4Xpm4NgQ86r7sM3oiwA2Pkl1TJBK4vHSemO/2ze+VaRCD6ADYVMVX1aBEMDBpgpFTDFlFVTne+//5y5TMEW1qmUWsezU72dWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5872
X-OriginatorOrg: citrix.com

On 01/02/2021 13:18, Jan Beulich wrote:
> On 30.01.2021 03:58, Andrew Cooper wrote:
>> +static int vmtrace_alloc_buffer(struct vcpu *v)
>> +{
>> +    struct domain *d = v->domain;
>> +    struct page_info *pg;
>> +    unsigned int i;
>> +
>> +    if ( !d->vmtrace_size )
>> +        return 0;
>> +
>> +    pg = alloc_domheap_pages(d, get_order_from_bytes(d->vmtrace_size),
>> +                             MEMF_no_refcount);
>> +    if ( !pg )
>> +        return -ENOMEM;
>> +
>> +    /*
>> +     * Getting the reference counting correct here is hard.
>> +     *
>> +     * All pages are now on the domlist.  They, or subranges within, will be
> "domlist" is too imprecise, as there's no list with this name. It's
> extra_page_list in this case (see also below).
>
>> +     * freed when their reference count drops to zero, which may any time
>> +     * between now and the domain teardown path.
>> +     */
>> +
>> +    for ( i = 0; i < (d->vmtrace_size >> PAGE_SHIFT); i++ )
>> +        if ( unlikely(!get_page_and_type(&pg[i], d, PGT_writable_page)) )
>> +            goto refcnt_err;
>> +
>> +    /*
>> +     * We must only let vmtrace_free_buffer() take any action in the success
>> +     * case when we've taken all the refs it intends to drop.
>> +     */
>> +    v->vmtrace.pg = pg;
>> +
>> +    return 0;
>> +
>> + refcnt_err:
>> +    /*
>> +     * In the failure case, we must drop all the acquired typerefs thus far,
>> +     * skip vmtrace_free_buffer(), and leave domain_relinquish_resources() to
>> +     * drop the alloc refs on any remaining pages - some pages could already
>> +     * have been freed behind our backs.
>> +     */
>> +    while ( i-- )
>> +        put_page_and_type(&pg[i]);
>> +
>> +    return -ENODATA;
>> +}
> As said in reply on the other thread, PGC_extra pages don't get
> freed automatically. I too initially thought they would, but
> (re-)learned otherwise when trying to repro your claims on that
> other thread. For all pages you've managed to get the writable
> ref, freeing is easily done by prefixing the loop body above by
> put_page_alloc_ref(). For all other pages best you can do (I
> think; see the debugging patches I had sent on that other
> thread) is to try get_page() - if it succeeds, calling
> put_page_alloc_ref() is allowed. Otherwise we can only leak the
> respective page (unless going to further extents with trying to
> recover from the "impossible"), or assume the failure here was
> because it did get freed already.

Right - I'm going to insist on breaking apart orthogonal issues.

This refcounting issue isn't introduced by this series - this series
uses an established pattern, in which we've found a corner case.

The corner case is theoretical, not practical - it is not possible for a
malicious PV domain to take 2^43 refs on any of the pages in this
allocation.  Doing so would require an hours-long SMI, or equivalent,
and even then all malicious activity would be paused after 1s for the
time calibration rendezvous which would livelock the system until the
watchdog kicked in.


I will drop the comments, because in light of this discovery, they're
not correct.

We should fix the corner case, but that should be a separate patch. 
Whatever we do needs to start by writing down the the refcounting rules
first because its totally clear that noone understands them, and then a
change to all examples of this pattern adjusting (if necessary).

~Andrew

