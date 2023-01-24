Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF1B679676
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 12:19:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483481.749676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKHKf-0003sI-Lm; Tue, 24 Jan 2023 11:19:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483481.749676; Tue, 24 Jan 2023 11:19:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKHKf-0003pZ-Ia; Tue, 24 Jan 2023 11:19:17 +0000
Received: by outflank-mailman (input) for mailman id 483481;
 Tue, 24 Jan 2023 11:19:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKHKd-0003pT-Uh
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 11:19:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2053.outbound.protection.outlook.com [40.107.22.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb39f723-9bd8-11ed-b8d1-410ff93cb8f0;
 Tue, 24 Jan 2023 12:19:13 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8359.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 11:19:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 11:19:05 +0000
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
X-Inumbo-ID: eb39f723-9bd8-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3fNMc9sHrota4o9Rwa9dn+lPqX8rzzXDHVYYoPjC95+YY2NCyKCiWh5LHN0ibus5c2USJih1xaUMrwBCeOtrB6FOYE8dMxQ/F71YINNZIMtjzmzMqOWKj42AkLWVXOr7aPAII2nktxsw3FlmaryPryeNQiZd527XtbiFyF46X1g4taQnDeF6On5uBlQHxmfb9ky7y21WSkm1V9jZDhlrj/N/YnBi/kVlKVlcu55tj4LOxCM/bAGaUKsZ77ePgBGJN6IojGsROOYIZFG4Rpc6xsS2ifcBh07mTYNy0qoiluQxMf5B7AVZncBgobaRJc7qXHLWg9XN6FIzay1Ee9ntw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYDO/WG9lwrpKxcxKdvmeoiZh8bvQ9oxQUj65CXMJ6Q=;
 b=ZvEhDF43MypbdF53UP2eApIxy6pNa+PlmFZ4YSYxlWCLNdOqfLfsWqbd3HjPOy3sbEwSz8OJ+ARoUOdDLwgbvgLnqbh5ZCmGOQgpaGL6Uj89S3BYfs8I/UN+sl6BJlrKCfJqnurOG2WZEgpSdVd3gpUAOT5oEgqk7xg/mxVdT+h76s6p+qEUmGT6+jBSu/jLM9reeNp5e8t0vlJnhqu2SPe0I0PNvRoufZhWMObri/835ltHcnq1J56nq5J9SbBmUIsWucooH1c60WDEczbVRsy8ep9AvpDbmv6gZJ8zab9JA1pe+6uds8X8fIwht7pkPL0qjgawlPMGu/odqpGg3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYDO/WG9lwrpKxcxKdvmeoiZh8bvQ9oxQUj65CXMJ6Q=;
 b=CbLlbmT1Pbd3VCJFbZNfCvXIAztCcOUq+HgvGcgeCNqJO3id9MIqdgfQQSQoIfrJXmU8zr2G/4KRNOMKv+IkqR2/4QDz3ohw0umxnJmB0MetOom6KTs5O3bNrNdrXkYeJJHveVmaW9QsY6Y2GfSiM8S9F0gCILP6/Y9cmpPlwG/TxOX1VqwuAH6OrNCNyaS7QHeSGU90UN7JQdatQs3pdYS1V9X2m3dlVIQ/W44NL39Iy656vACUYmbBy9Y18X4spovBzlKY8ylxwEQCs25kYW2u/RV6vBOJuwKS3HGFq/7wF4Altp+oFuJUr3dPT8AhFIc+RmDDAF24TeG9tnF2sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6099e6fb-0a3e-c6da-2766-d61c2c3d1e96@suse.com>
Date: Tue, 24 Jan 2023 12:19:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/8] x86/mem-sharing: copy GADDR based shared guest
 areas
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <33cd2aba-73fc-6dfe-d0f2-f41883e7cdfa@suse.com>
 <dad36e4c-4529-6836-c50e-7c5febb8eea4@suse.com>
 <CABfawhmTe3Rxwo54gR5-4KGv=K0Ai7o9g6i=1nkb=XdES1CrcQ@mail.gmail.com>
 <a92b9714-5e29-146f-3b68-b44692c56de1@suse.com>
 <CABfawhkiaheQPJhtG7fupHcbfYPUy+BJgvbVoQ+FJUnev5bowQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhkiaheQPJhtG7fupHcbfYPUy+BJgvbVoQ+FJUnev5bowQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8359:EE_
X-MS-Office365-Filtering-Correlation-Id: 562b1bf2-0a99-4f65-7237-08dafdfccdf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1KYDM8G1IsVyjsYrqYWcnhgFVv9tp6283knR2d1SuWQA+FR7GVrLrZ7QdZn8GfwBUb1kRBK0qogQut2aQEpMF8UzU67aJHzpfW6AgiwfGj8icuooDvYLSZPizm05UJ9zdYPBTrIs3YCrQTAAOdSt+qXWEWXdbQ3kjLE2IsJX0tIrCC4S5AyfZ/l2szVYuXgikx0IxPR01t5ZQMwwJCAUNyKKdiRdIGFKG9M0EukNYWg6AH/RGweqpPtNvY1glp3kZjc4kDqlfJQfuEwZKzYU2mDDH8w/s7vikcKttggRSOVAEc+lIL6xMUWdn24QsfCCKwasZDi3aWrOOR/+JZPg0tDYXHnVietM53qg29tQo4qMBfaRqijqQMVIc8vOFhkyldJUuvjzMeryT4kBEQQNmz1Edv9sYYh6hZb0qElWvgmlbvGAY5IwW/aRLTLi8bgA/m33qS48SkU7acdmyXGImQHpmhGSUGfzcFOdrB9RQ7OaL8djeAnrjY44Zp07hIefjbAfPcsn4ctMh6q+siztFqEjChSYLFkT0A42WuwtNluqCg4DEEFsIhpDCwri7xFuO0b9Gpfa8gZOq9hAAaVUTLVw8rGQP92Y1fPIfbBUSuqOpWa88dnGGQctE8XRbYJwl+8ICp0U2vIspB1/UrW4YVl5KfM+dJnF7YZj2vXYIyroGstettIcky9IOLfw/rKgAsjgjgV+/CTHH1hfcgbbLmHkwDfaCGMDy1prQ92TcBY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(346002)(396003)(366004)(39860400002)(451199015)(31696002)(36756003)(41300700001)(86362001)(8936002)(5660300002)(4326008)(2906002)(38100700002)(83380400001)(478600001)(6486002)(31686004)(66946007)(6916009)(53546011)(6512007)(26005)(6506007)(186003)(8676002)(316002)(54906003)(2616005)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGhyN1ZaeXVQZ3BoYW8rQmRJV2dIMXZUbWltdkVCdU8zUmxBRDdtMUJsVGRv?=
 =?utf-8?B?UjdrZmVVK0dUZUVyU2Z4N3ExeTFLSVR5bG5JakJ6KzFpRVZ6bmdaVUZjcHUx?=
 =?utf-8?B?WW9iY0lwU0pnOGwvUlpwajdkZkxSczl6Nm4vWWJSMXRDZ2ZaYWFHUHpiUzdY?=
 =?utf-8?B?VGJNbFduT3NFbUJvM3N5RUsrcGMydG5BNlYwelo3MkUrdFQ3VEJzQUdwMGR4?=
 =?utf-8?B?L0hSYk9XZDErTDBCVno0d3cyNGFYYWhGQXJGQmgyT0h0VStCUHNzMERNUGZ4?=
 =?utf-8?B?YlVCaUhjaDhPRVVzR1ZKMDdmUDd6a2w1bnc1UkxZVU8rNXpRcDQ5cUJGNWdy?=
 =?utf-8?B?aVlHTXRBQ3VIS0ZaMjUvOUR5R25WeVB6ZFZ1N0Jqbng5cThmT3JVbm4xOHU4?=
 =?utf-8?B?ck5ndzNEdHZsb1drU09tSUxVclRZelBRVWFsaGh0cnlETTd6UmZCQU9YSm9B?=
 =?utf-8?B?dFN6dVhrRkoyQyswQUQzcnFSY1ZjUVgvaGtIR2c2TnJVZjNXSFl0Y3B3M3Nw?=
 =?utf-8?B?SmEva1FRajZ1ZnZZWXhBOElzbWdmc1BiVnNkQVAvdWcxNnlsYk05YUExZG00?=
 =?utf-8?B?MVJ1Skp2WDNkcjl6TlVjb0Z3RzVBZXJIdHhGREdtbFcwMkpVVEY1OVlMeGFU?=
 =?utf-8?B?N2o2cXFRbFBGd0hmOTE3aldUbEFKWVVnYXpPQ0djYlkycDlJQ2VPVTY4SHpC?=
 =?utf-8?B?MEhOU0JBeHdsd3BvL1B1dDd6ZDhjWCtkNlVOUE1LUmhCQ1dzZ25QV0pSTlBw?=
 =?utf-8?B?RE1WRTduWUtlVW9BaTcwM0dsV2lmVXJsa051WktGNXJmYlBtMEJIRGpQUzdo?=
 =?utf-8?B?NHBtM1JBWlNWdDFUSFJ2ZWdRdGJVTnBIeGdkSDRkbU0xM25rZFFUWFZXOEg3?=
 =?utf-8?B?VnRYLzJ1eTBLa1lUd3psL3ZKZktTbEk0QVJrZHZXbnlhc1l4Vi9KRWlWOXRs?=
 =?utf-8?B?YzE5QnRkbFhkQWdBNFlWV3g1Z09vOHVPYmEvOU1ySWorb1puZ1EyckV3N0FY?=
 =?utf-8?B?ZElUdGw5VkpUN2dJcHNUbUg0ZkNCaFpEQzkwa2pJNGw2dE9XSFJaM25RN2t1?=
 =?utf-8?B?UHU4K1JoMXIxSkdZRitkVi94Z3Fmd3JEWTVOQlZqdUFqYlNMdElBeDVZZzMz?=
 =?utf-8?B?N29SM1VFRVpzWWlZbE9MMXJNNlpoOGVyTUZzWXg4cEliTU1wdDB4SXlkSmI2?=
 =?utf-8?B?ZTVlQUtQN2kwVExGOUhDdXRyWDhPbUEyeFcxQnNGNFMxb1dneFhNeU9pR2ZT?=
 =?utf-8?B?NDcrZHRaS2FpY2VXZjR2bzZ4VU5vK1dwSVdNeVBwNms2NDdaWVgwcDh6ZDQv?=
 =?utf-8?B?ZTFGS1FqYmlMQ1dKc3pNQStnQWg0SUg0Z3c0V0xBZnhEMnBkNDA2WmVDL3BM?=
 =?utf-8?B?RjlPbkhBb0xTaEVzenlPZUM3VEJXZ3VvbXFVWjYwSHorZzlMeHMycEZaS0tT?=
 =?utf-8?B?NTlEMTJsRUp0WlNsNkx4NE82Z3ZBbkNlUlZLOU9ubDIyUEw2U0tFc3hTUTFY?=
 =?utf-8?B?VTR6RXZ3VmEwRURiRGY2WFZJZEoxTkczVTVESDIwQmFEazJxOFQwcG5uMmdK?=
 =?utf-8?B?a1lNY3UxRXRjcHBYaHpoSU8yL0lYTGFoL2pubGx2NnBNVzZZZXlYM29xdFVv?=
 =?utf-8?B?djBWYUU1bEdYVVhQTDlpMmhKU2o2Ryt5bFZVa3BSTDdnVmhaVC9RLzJ3cFBu?=
 =?utf-8?B?djBRRjVSZnNLQk1OS2NtcDI2aUt1VFk3RVBsbGEweDE3NWxvSnhveVZGVTZx?=
 =?utf-8?B?b2xqU0h6eVVzS0UrUW5hc0g3OWpId1NuL1BaTkFGQlBTek5pVzM1YkJFdmdE?=
 =?utf-8?B?aitJZy9haUNYRXVYUW1wNkZsa2pDQS9Mb3ZBQmliNnV3YjJNRlpOcmZvTGRl?=
 =?utf-8?B?Q25zY0tDL2NUSmpOVG8xYWJ2bDJQYnBqVmg1RlU1RFFlUXZ3WFZYWnNBalVm?=
 =?utf-8?B?UUVWQWI3eTUydEhyeHpPKy9QRExaNUR6UE1LVTF4UDlFSUZ3SUNySUM2RzQz?=
 =?utf-8?B?eWRXNjJFSXR2a25yVTNFallGQ1hzRGovb2QxUlp6YjYxWnNNMmNzRzBuN21m?=
 =?utf-8?B?K3hQNndZdEoxWXdxb0hEL05XVEZpSVhMTTFoYzdlVnhhWCtHbzdlOXBWWDNV?=
 =?utf-8?Q?/HOaG+dpuRmi5CjTgX5b5qM5P?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 562b1bf2-0a99-4f65-7237-08dafdfccdf1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 11:19:05.7272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4+81QytibjlCRXWqrBcy+9d8tB0fbwddSkFZhkW141H/dJgXB9NnrJUhlS7JNrzzlsfwnD/8JTP5ssqNXXUvUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8359

On 23.01.2023 19:32, Tamas K Lengyel wrote:
> On Mon, Jan 23, 2023 at 11:24 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 23.01.2023 17:09, Tamas K Lengyel wrote:
>>> On Mon, Jan 23, 2023 at 9:55 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> --- a/xen/arch/x86/mm/mem_sharing.c
>>>> +++ b/xen/arch/x86/mm/mem_sharing.c
>>>> @@ -1653,6 +1653,65 @@ static void copy_vcpu_nonreg_state(struc
>>>>      hvm_set_nonreg_state(cd_vcpu, &nrs);
>>>>  }
>>>>
>>>> +static int copy_guest_area(struct guest_area *cd_area,
>>>> +                           const struct guest_area *d_area,
>>>> +                           struct vcpu *cd_vcpu,
>>>> +                           const struct domain *d)
>>>> +{
>>>> +    mfn_t d_mfn, cd_mfn;
>>>> +
>>>> +    if ( !d_area->pg )
>>>> +        return 0;
>>>> +
>>>> +    d_mfn = page_to_mfn(d_area->pg);
>>>> +
>>>> +    /* Allocate & map a page for the area if it hasn't been already.
> */
>>>> +    if ( !cd_area->pg )
>>>> +    {
>>>> +        gfn_t gfn = mfn_to_gfn(d, d_mfn);
>>>> +        struct p2m_domain *p2m = p2m_get_hostp2m(cd_vcpu->domain);
>>>> +        p2m_type_t p2mt;
>>>> +        p2m_access_t p2ma;
>>>> +        unsigned int offset;
>>>> +        int ret;
>>>> +
>>>> +        cd_mfn = p2m->get_entry(p2m, gfn, &p2mt, &p2ma, 0, NULL,
> NULL);
>>>> +        if ( mfn_eq(cd_mfn, INVALID_MFN) )
>>>> +        {
>>>> +            struct page_info *pg = alloc_domheap_page(cd_vcpu->domain,
>>> 0);
>>>> +
>>>> +            if ( !pg )
>>>> +                return -ENOMEM;
>>>> +
>>>> +            cd_mfn = page_to_mfn(pg);
>>>> +            set_gpfn_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));
>>>> +
>>>> +            ret = p2m->set_entry(p2m, gfn, cd_mfn, PAGE_ORDER_4K,
>>> p2m_ram_rw,
>>>> +                                 p2m->default_access, -1);
>>>> +            if ( ret )
>>>> +                return ret;
>>>> +        }
>>>> +        else if ( p2mt != p2m_ram_rw )
>>>> +            return -EBUSY;
>>>> +
>>>> +        /*
>>>> +         * Simply specify the entire range up to the end of the page.
>>> All the
>>>> +         * function uses it for is a check for not crossing page
>>> boundaries.
>>>> +         */
>>>> +        offset = PAGE_OFFSET(d_area->map);
>>>> +        ret = map_guest_area(cd_vcpu, gfn_to_gaddr(gfn) + offset,
>>>> +                             PAGE_SIZE - offset, cd_area, NULL);
>>>> +        if ( ret )
>>>> +            return ret;
>>>> +    }
>>>> +    else
>>>> +        cd_mfn = page_to_mfn(cd_area->pg);
>>>
>>> Everything to this point seems to be non mem-sharing/forking related.
> Could
>>> these live somewhere else? There must be some other place where
> allocating
>>> these areas happens already for non-fork VMs so it would make sense to
> just
>>> refactor that code to be callable from here.
>>
>> It is the "copy" aspect with makes this mem-sharing (or really fork)
>> specific. Plus in the end this is no different from what you have
>> there right now for copying the vCPU info area. In the final patch
>> that other code gets removed by re-using the code here.
> 
> Yes, the copy part is fork-specific. Arguably if there was a way to do the
> allocation of the page for vcpu_info I would prefer that being elsewhere,
> but while the only requirement is allocate-page and copy from parent I'm OK
> with that logic being in here because it's really straight forward. But now
> you also do extra sanity checks here which are harder to comprehend in this
> context alone.

What sanity checks are you talking about (also below, where you claim
map_guest_area() would be used only to sanity check)?

> What if extra sanity checks will be needed in the future? Or
> the sanity checks in the future diverge from where this happens for normal
> VMs because someone overlooks this needing to be synched here too?
> 
>> I also haven't been able to spot anything that could be factored
>> out (and one might expect that if there was something, then the vCPU
>> info area copying should also already have used it). map_guest_area()
>> is all that is used for other purposes as well.
> 
> Well, there must be a location where all this happens for normal VMs as
> well, no?

That's map_guest_area(). What is needed here but not elsewhere is the
populating of the GFN underlying the to-be-mapped area. That's the code
being added here, mirroring what you need to do for the vCPU info page.
Similar code isn't needed elsewhere because the guest invoked operation
is purely a "map" - the underlying pages are already expected to be
populated (which of course we check, or else we wouldn't know what page
to actually map).

> Why not factor that code so that it can be called from here, so
> that we don't have to track sanity check requirements in two different
> locations? Or for normal VMs that sanity checking bit isn't required? If
> so, why?

As per above, I'm afraid that I'm lost with these questions. I simply
don't know what you're talking about.

>>>> +
>>>> +    copy_domain_page(cd_mfn, d_mfn);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>  static int copy_vpmu(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
>>>>  {
>>>>      struct vpmu_struct *d_vpmu = vcpu_vpmu(d_vcpu);
>>>> @@ -1745,6 +1804,16 @@ static int copy_vcpu_settings(struct dom
>>>>              copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);
>>>>          }
>>>>
>>>> +        /* Same for the (physically registered) runstate and time info
>>> areas. */
>>>> +        ret = copy_guest_area(&cd_vcpu->runstate_guest_area,
>>>> +                              &d_vcpu->runstate_guest_area, cd_vcpu,
> d);
>>>> +        if ( ret )
>>>> +            return ret;
>>>> +        ret = copy_guest_area(&cd_vcpu->arch.time_guest_area,
>>>> +                              &d_vcpu->arch.time_guest_area, cd_vcpu,
> d);
>>>> +        if ( ret )
>>>> +            return ret;
>>>> +
>>>>          ret = copy_vpmu(d_vcpu, cd_vcpu);
>>>>          if ( ret )
>>>>              return ret;
>>>> @@ -1987,7 +2056,10 @@ int mem_sharing_fork_reset(struct domain
>>>>
>>>>   state:
>>>>      if ( reset_state )
>>>> +    {
>>>>          rc = copy_settings(d, pd);
>>>> +        /* TBD: What to do here with -ERESTART? */
>>>
>>> Where does ERESTART coming from?
>>
>> From map_guest_area()'s attempt to acquire the hypercall deadlock mutex,
>> in order to then pause the subject vCPU. I suppose that in the forking
>> case it may already be paused, but then there's no way map_guest_area()
>> could know. Looking at the pause count is fragile, as there's no
>> guarantee that the vCPU may be unpaused while we're still doing work on
>> it. Hence I view such checks as only suitable for assertions.
> 
> Since map_guest_area is only used to sanity check, and it only happens when
> the page is being setup for the fork, why can't the sanity check be done on
> the parent?

As above, I'm afraid I simply don't understand what you're asking.

> The parent is guaranteed to be paused when forks are active so
> there is no ERESTART concern and from the looks of it if there is a concern
> the sanity check is looking for it would be visible on the parent just as
> well as the fork.

The parent being paused isn't of interest to map_guest_area(). It's the
subject vcpu (i.e. in the forked instance) where we require this. Thinking
of it - the forked domain wasn't started yet, was it? We could then avoid
the pausing (and the acquiring of the hypercall deadlock mutex) based on
->creation_finished still being "false", or even simply based on
v->domain != current->domain. Then there wouldn't be any chance anymore of
-ERESTART making it here.

> But I would like to understand why that sanity checking
> is required in the first place.

See further up.

Jan

