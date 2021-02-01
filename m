Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A9930B2A6
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 23:15:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80163.146417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6hTE-0000BC-NE; Mon, 01 Feb 2021 22:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80163.146417; Mon, 01 Feb 2021 22:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6hTE-0000Ak-Jh; Mon, 01 Feb 2021 22:14:56 +0000
Received: by outflank-mailman (input) for mailman id 80163;
 Mon, 01 Feb 2021 22:14:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWGu=HD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6hTD-0000Aa-9M
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 22:14:55 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fbb9e76-d2ee-4df9-a185-fa669aa16b08;
 Mon, 01 Feb 2021 22:14:53 +0000 (UTC)
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
X-Inumbo-ID: 2fbb9e76-d2ee-4df9-a185-fa669aa16b08
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612217693;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oFJYuSYsY/rLZDq6eu0OYK+gy+6p7XUPeqWI0PN/HbU=;
  b=FVnbwHpc45EosvGUScXzB1OCtlCsvpCkzOWRucx3V4+cjWIdG6cVMmnw
   xUroXXLt2HAsLQnTB8Q5wtaSlbK9WPiC5p1vsRvKkuP7HRlPofbR3ubcn
   Scb9D5xRV5YCqy1ljeGbupcIP96JTBq2/MLroeiCKKYZSCwDXVrT2rXk5
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: EGGn/zk/oY7erXeENt3JpKjOzsY+RRrI2+KiyiFbQu4Mt7G3jCdOQgok82deMmqpgGp091JmUb
 X4xArtVrpP7CkVf15OGt7xOaEXOYTFD4FPtOYQDCN/5ySEhj53HUYicK+Z2epRua2pNa7hPsvm
 fS5WoE1CArYUCo5IyXr16hfi8SIoREO9LtXYH7oKksKE9pbJcfsbzxNYAGI45N0rCKdm7mAUKS
 aaTah10GnFJoBRNSW8qhIoQs978OP0/QCWrcCXrCbcIKvdPa/09HwELcSPQ5BqOP017XyxllQ4
 jKE=
X-SBRS: 5.2
X-MesageID: 36698030
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,393,1602561600"; 
   d="scan'208";a="36698030"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJ8bao5qA2fzYI8l3B8RiAPFCbP1dYlKWITso+tJFIczZ0YpIjyPIBM+twV/0q8NEuUhP1jczN+yWD9UlnrLNi0siAkCP3ZFJakvbNymT8g4RCdlrcyR+hYutMXZwsLmyTNuA6HJtLFlphJfyFGnJu5eGED1d1eQcdzWyH2zHmHA8FS2z+BPFs7SYE5Dqng9xpBtH9SjPNNAKPPfW/W+h9zsIxsAse8IaFIxmdR2RwWxOghqoLsWmbPJlS/DhVbzL3ymyPAyBfZ0Y7JIYu9FFlhs3piqiN7v46RS89plI6lN+g0NV6wwReSvhu3R08JV8e0ICCbCtelBwvCYcUbuDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQ4GbX8DKqqb5qN1QA1TM1ZU1ty6R9EBq8A2DVGgQ5Q=;
 b=PT+uKhZKW/ckB8eOg0AxHEHrZ9zfeE5LqJK32KzzlWCZzMqugJw5vxNqAu6ZVUdNFiqa0yPhGA1BWaWtGCDCI3i/GgxUKDed1eb45SIhO/sAk2weuHysJQKci40bqbzH8BpOqxuKQWggXSa9zHpK8D9/peZqnigmdc1J+/5xpFh8JiwwJhdi6pVsGBQh8iJ7qQ/T8NlVLAUb/hfy0BVuFyfohmpsjiIwdxD0ICCD8MSh62jTpsJ4U8MTSLqouuhl/OZTM79HNENWlkzylGNwFO3QCzqEOG5GU/2JweSigSc85ODfaInRVr81TelF6Fx39USW0tuinEKNfg5MhjHhVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQ4GbX8DKqqb5qN1QA1TM1ZU1ty6R9EBq8A2DVGgQ5Q=;
 b=j6ll3ALfSAuogaoyX70XWmS8M0j9LC06ShODyVDgNnIk4z9eHYeui7PT+ohsU9kJ54CtTYGmZdIDAIg1vmh1VBWACi8JF/eeM9qqG0h1CRtMyxxC50VTJ5oUgOrrmLHylflgLD47emPrGhUJnTDHfayCC3S+7X/XmC9z/2IMx1E=
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
 <f54dec0a-65b6-07bf-9de8-ed96ffd8d791@citrix.com>
 <296e5ee3-0ae1-fe0b-9ec3-940b78284cdc@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <511115b6-5549-49fe-f6ac-6fdb3c66f605@citrix.com>
Date: Mon, 1 Feb 2021 22:14:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <296e5ee3-0ae1-fe0b-9ec3-940b78284cdc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0286.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::21) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22142e7f-72b0-42d5-42e2-08d8c6fec700
X-MS-TrafficTypeDiagnostic: BYAPR03MB3848:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3848E214E270223C8BE049A7BAB69@BYAPR03MB3848.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qNe4/nHgy4fW97p7Imw7SRLiIxEfog2UNLSS1EU31T8pxNczVeNWcd/6LDT/dQrxtOM4kYEsaJ39pNF+ulG4TmL/fDtgcqprRNbKVSs3nzbp8mD8QO4gi0CjUOCJy9tkvyanOuyjNQYd5PyGwNmzP9bBf8G+VJaLvtm+4qMcm9KFYCpb9QCODGazDWpkPsBMFjpVWubbnTfhkdESz9jvKmhQRP47Dk3s/KrtxCw6qomkGlYyh6CPywJPev9Ba0u7iz7DVQ//V+LwhbI1IhpL5oCy508gAwK+R/05HM+ui3W1aXE0o8UpLHUOT0LdbtEEnulnaXn0StiDb3K8B+K4gD/yb8OOv8FoasbltDJ04+88Ig45JFGx9kLlNam/Je4ycwf9HA2ZC5/hXErhXZbbku1X15HGS3om4BHJKmBocIhyiQZ7UUPo/Z4tUpZg5VDWz0DLdtK58MZYfoc8vdFaeIOXY8U3yTN0rbwOFPjL6B6DEalO+PndMjQbdWXt6bloUXzQ/el8eu4eg+mLc5hKQrm1PAeZXDZmIsk/rN6DWrZW9/RFeebiNE4mO7orE9RmjY/0XVwl7cClAoBhdfh1m+KVfNPHz6U7HQGnmmxJ2FY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(8676002)(66556008)(478600001)(66476007)(66946007)(4326008)(83380400001)(6486002)(6666004)(6916009)(5660300002)(8936002)(2906002)(54906003)(31696002)(16576012)(31686004)(2616005)(16526019)(26005)(186003)(956004)(53546011)(86362001)(36756003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TmFSVlAxWnJOemZGNktRdmloVXgxenk5NHg5WlZFSFBzNTVNOGk5Z0EwYjI2?=
 =?utf-8?B?Qi8ybVNDWFA0UUtkZU8yTEdLdnRqeVZ4TnNjQ1B2T1dDOE1SdnZpSVhwRkdk?=
 =?utf-8?B?SEZOaDBqYittazUvL05NekJuL0xpeTNqVm1kNUErb3lxdXNrYzZPUmJIbHh2?=
 =?utf-8?B?cmptRnpxRFBuaHQrQ0dkYWdodGlvcXhxRG1oaS9CSFJyMU9zNWRzTURsNDgx?=
 =?utf-8?B?V0Y3cmowTW1DUk1aaHVrUmd6UUZpdkRNZVBxc3B2d0ZQYm9ieEhjeDNka2NK?=
 =?utf-8?B?Q1FwTHFxUWlmT0tnSFVKaDVVdjJ5K25PdGJ4czhJZDIxcDhxaU0relpXczNO?=
 =?utf-8?B?dzVESkJFNGI3WUFSQ3RNVWJEZ1FVK3ljQnZlcWtaMXBFWFJzYzQxQ1RkSzdJ?=
 =?utf-8?B?dkQ3eUs1Y1NGOFdtbEU0dkJFWlV6UEcvbUlKRzlDWjZ3NlVmb1NWc09YZVZF?=
 =?utf-8?B?N2ZPSEo3YVdxRUZtNzU2ZVZ1ZVlhbGpKdEZtNTJCS2VNR09oZEJPUDRwT2l1?=
 =?utf-8?B?anJVOTBrc1k3Q3BmVnJxeWIwQkJZbTFhMTJSdnU0dERTMktzRmZxMzQyeWRO?=
 =?utf-8?B?bFFwalgxUU5Qbit1cW9ORXRFRWc1NDFIVjdJKzBNM04rSHFvZEVBb3JSSXlF?=
 =?utf-8?B?U29KOTRvelZOSWNNdStHaWc5UGl0a0VRZUFWekJSSHJVSUU1ZVVGR01UNk8y?=
 =?utf-8?B?THNkMk41a0I3Z20relNITk8wVnRRNXgxckxLYk02eXl2UGlSUThTMW40cHhI?=
 =?utf-8?B?N2VJNkNIVlhhalFDWm9NWFRPTEk3TDg1MzV4dExyWWRYeS92akVpdk85Y1BN?=
 =?utf-8?B?ODJ2c3dzWEE0cHBOQTQ3QXVFWUJEaU03Z0h3VWpaNCthMkNXMXJQWVZvYjRu?=
 =?utf-8?B?UHVvMDQrTmlxVzNuYVpETGNmTklWNGdVc2plVGlkMVJidzhzd1AvRzNCSUkr?=
 =?utf-8?B?K2Jha1ZaY1Rsc2tQNXdnUVZKbXd0SmVtcVJreWhYSGcxNlBEK0VSdFpta3Y2?=
 =?utf-8?B?VmZpMCt3NllGU1ppYVNyNjllOGwwNzFnRjdxNHppNFQzWWI1L0RqM0hqanNF?=
 =?utf-8?B?QUU2SlprM09mYjRPRDJnNU85SXhHNEJtNWJ3S1FRUEhoUjVLY2VKTVZYY0pw?=
 =?utf-8?B?VGJ3bTFhdnVBRFQvNzdpcllmSy9jUERGSTZmc29EUVlQVjZCMEROZ3dsK1NC?=
 =?utf-8?B?QytBb2REQjZTYzFoM1FNRFpYeTBBM0ZnOEtsbUpESE40cTZuTmV2d1ZpWUR0?=
 =?utf-8?B?dTFvY3FzbzV2ZWw3TlliWWJ4T1Bzd3VobjJ0Qzh1cVhLQ1NnN2I4M2VnRWFK?=
 =?utf-8?B?NFNHT0Rja1ppOHZ0Zlpib0pDWHhQVi9VMDdibDE4VEZ1Q3dZSjFvbEw2K0xB?=
 =?utf-8?B?N2NLVWlyMDNQbXdCV0ZFRHgyUG01Z1BJYkNPMVNqTWRHakk3UlRXVC8wRnBM?=
 =?utf-8?B?ZDB0SFFRQ09XRitMVy9icmRFdlVFendUaGducEl3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22142e7f-72b0-42d5-42e2-08d8c6fec700
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 22:14:43.9129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twHz7Zw8wKebqf+Zmvcao+k249cJgTa4CdBbHC+gn+1h2AZZEr+LIY/QPFYh6d1tR0rOHbt457ck+k2VtCtZkeFN3pfTK5eKlwRhfJsbiAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3848
X-OriginatorOrg: citrix.com

On 01/02/2021 14:36, Jan Beulich wrote:
> On 01.02.2021 15:22, Andrew Cooper wrote:
>> On 01/02/2021 13:18, Jan Beulich wrote:
>>> On 30.01.2021 03:58, Andrew Cooper wrote:
>>>> +static int vmtrace_alloc_buffer(struct vcpu *v)
>>>> +{
>>>> +    struct domain *d = v->domain;
>>>> +    struct page_info *pg;
>>>> +    unsigned int i;
>>>> +
>>>> +    if ( !d->vmtrace_size )
>>>> +        return 0;
>>>> +
>>>> +    pg = alloc_domheap_pages(d, get_order_from_bytes(d->vmtrace_size),
>>>> +                             MEMF_no_refcount);
>>>> +    if ( !pg )
>>>> +        return -ENOMEM;
>>>> +
>>>> +    /*
>>>> +     * Getting the reference counting correct here is hard.
>>>> +     *
>>>> +     * All pages are now on the domlist.  They, or subranges within, will be
>>> "domlist" is too imprecise, as there's no list with this name. It's
>>> extra_page_list in this case (see also below).
>>>
>>>> +     * freed when their reference count drops to zero, which may any time
>>>> +     * between now and the domain teardown path.
>>>> +     */
>>>> +
>>>> +    for ( i = 0; i < (d->vmtrace_size >> PAGE_SHIFT); i++ )
>>>> +        if ( unlikely(!get_page_and_type(&pg[i], d, PGT_writable_page)) )
>>>> +            goto refcnt_err;
>>>> +
>>>> +    /*
>>>> +     * We must only let vmtrace_free_buffer() take any action in the success
>>>> +     * case when we've taken all the refs it intends to drop.
>>>> +     */
>>>> +    v->vmtrace.pg = pg;
>>>> +
>>>> +    return 0;
>>>> +
>>>> + refcnt_err:
>>>> +    /*
>>>> +     * In the failure case, we must drop all the acquired typerefs thus far,
>>>> +     * skip vmtrace_free_buffer(), and leave domain_relinquish_resources() to
>>>> +     * drop the alloc refs on any remaining pages - some pages could already
>>>> +     * have been freed behind our backs.
>>>> +     */
>>>> +    while ( i-- )
>>>> +        put_page_and_type(&pg[i]);
>>>> +
>>>> +    return -ENODATA;
>>>> +}
>>> As said in reply on the other thread, PGC_extra pages don't get
>>> freed automatically. I too initially thought they would, but
>>> (re-)learned otherwise when trying to repro your claims on that
>>> other thread. For all pages you've managed to get the writable
>>> ref, freeing is easily done by prefixing the loop body above by
>>> put_page_alloc_ref(). For all other pages best you can do (I
>>> think; see the debugging patches I had sent on that other
>>> thread) is to try get_page() - if it succeeds, calling
>>> put_page_alloc_ref() is allowed. Otherwise we can only leak the
>>> respective page (unless going to further extents with trying to
>>> recover from the "impossible"), or assume the failure here was
>>> because it did get freed already.
>> Right - I'm going to insist on breaking apart orthogonal issues.
>>
>> This refcounting issue isn't introduced by this series - this series
>> uses an established pattern, in which we've found a corner case.
>>
>> The corner case is theoretical, not practical - it is not possible for a
>> malicious PV domain to take 2^43 refs on any of the pages in this
>> allocation.  Doing so would require an hours-long SMI, or equivalent,
>> and even then all malicious activity would be paused after 1s for the
>> time calibration rendezvous which would livelock the system until the
>> watchdog kicked in.
> Actually an overflow is only one of the possible reasons here.
> Another, which may be more "practical", is that another entity
> has already managed to free the page (by dropping its alloc-ref,
> and of course implying it did guess at the MFN).

Yes, but in this case it did get dropped from the extra page list, in
which case looping over the remaining ones in relinquish_resource would
be safe.

~Andrew

