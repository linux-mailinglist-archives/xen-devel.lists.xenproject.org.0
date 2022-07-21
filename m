Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 437D757C8FB
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 12:30:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372634.604470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oETRr-0005hV-Dx; Thu, 21 Jul 2022 10:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372634.604470; Thu, 21 Jul 2022 10:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oETRr-0005eA-Ao; Thu, 21 Jul 2022 10:30:27 +0000
Received: by outflank-mailman (input) for mailman id 372634;
 Thu, 21 Jul 2022 10:30:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=itvi=X2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oETRp-0005e4-9K
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 10:30:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 211e2669-08e0-11ed-bd2d-47488cf2e6aa;
 Thu, 21 Jul 2022 12:30:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8551.eurprd04.prod.outlook.com (2603:10a6:10:2d6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 10:30:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Thu, 21 Jul 2022
 10:30:22 +0000
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
X-Inumbo-ID: 211e2669-08e0-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkQjVnPhZEQ1jSNE1/65Aoku5iSzXFqBa7F5kat8a2NZALNUQXEfFYPIig0FV/R3gy1cTMaSdjLQeH24czDUjTwUK7qQhzEMOjTb3SUOR99zoi/LmPzlhGjUt1ZaDILMmtEUY3DIol/oytli0yPR83hFfzYFZJU4acykWlQ1REWk+m3l11vhvB2IPzeMdHjabuaGkyXsD8o8gcKBaeyqqY3R2mapYOAe5h9gZUVK4hULRx09BYxVi8SnAtyOAp7XiAbZqHzfokcvXFz8/jtOU6B82WzYGmawNBM2iqpabEDFM/gEapVs/+RZDXE+c0ayhNVBoy6+w3ZkNXmGbE/6tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/ab/DOg3tdwPdjncFnOMa7rsl9SBFoBkrkz1z2TLaI=;
 b=B94SEEy/CmsnRhRsaAIGPayUG5OADApPN4heXtsz6TTkGkjAmTeEPGP2MuSIkbsjhELRm97ZujZJyPiCPOlGjA2SI7u6IN+5bEnH3Otd/FO55tBHRzKwc3uCarqhLSwDpFp7q8aqYtlFZfcgukciArzci9aNvJF3WlrzLJxL7yH5GKfw1dRVICBwV2Ngum6Jh9O9g5yVYAuKwaOwlX8Pm7sTK9Ay4ihOVyyzGqGntdi2OiZng45WFNDXE7wRoxbQc3zIEE2/RgH9IjPi2f6ePR3q2WzKFQRM2VO0rNSyUs6M+15NTLblVSwI8yMYg54vGjRVobYPU1JJssV2FTgBwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/ab/DOg3tdwPdjncFnOMa7rsl9SBFoBkrkz1z2TLaI=;
 b=hbvUrOxg6SONRnKaadhLVAzEf/Fg/ycEZSihJzqixFZy7mArXAGxA6ZaaS3H8DcXY47IKcRzCYXpx1K2OxJHZORWIRdOF3VGSIP7EsKcxwrRQJ6Ob4zDC1IwyqZh6SAzxzk8qJHF6LNyZHrlG4UxZPZZTc1qT981kEorry4g8kB2Qh0jK8iUnIPE6ltqV1oTQkZCeQLfLC9uidTmko0IWhDkTfGYp3sbuiJ/OCPXLygi0jvV7CtkamRc87JP6xyQLL71BZRNqzi+dndTUrj50HFCzQ7bf0Tm1xzyO7cHVfKYGi9I0QD9oAr8AE6CsGIqpcv+BQ7DVYAGsQHkanTsyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b3320688-6e67-d1d7-1f29-4cba80ce79e0@suse.com>
Date: Thu, 21 Jul 2022 12:30:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 8/9] xue: mark DMA buffers as reserved for the device
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <0a30e15d9195d0cd09a5ea94297dc8a74bc12c97.1657121519.git-series.marmarek@invisiblethingslab.com>
 <a259bc09-710c-0c19-60c8-f7fa310357bc@suse.com> <Ythi9BXeKwcdmiOO@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Ythi9BXeKwcdmiOO@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR04CA0035.eurprd04.prod.outlook.com
 (2603:10a6:206:1::48) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea831996-3d58-4fb0-29fc-08da6b04046d
X-MS-TrafficTypeDiagnostic: DU2PR04MB8551:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CY/5w9qqgO2GhdLnPR+2dPgtcrWwUwq6jWet2yaPWoBRJYDu+CbjXx9gIcZvBUA/GHgxYkC6kJHGvAzDicG1THOGiBCrE5M/g2SK/WxA5bmJuMsdCWd/DaOZvXib+e98U1hzuognkJB9BKHQ6bN8JtPt+UWUgMfcqt1ddK36U/RrpvJoK8Df1yNwfRtgmG/x6rIDiDjoQCkdOK0VfJez7c3u8KiXVxUC4xXAmI8LEslbJiVfBqLKw6RNI3V/DpI/Vr8g56Ybol4+d89IJwlAbYrQTbpLktSOB8ZgxstR/HFgoql9QEHr+deTm099MshD1JrgOszu7tXPce+UvJWp+SNh1tB22ogPvtx/0sZFY2BbhVQYNYaLk6v8KtztnqQZrEL6FKmj+vMiPqq8joshVb9r8rWzzxPhFkbR6yX6ovol0UgrgR4ZK6WIt97pM/UikCiEFpTQtWTdhUzPkr4dpdhiK4C82bpSSp7WIpAjJGJ+vRyuKZ8RTucUtU0Ccu3/H8NlSNDrv8USI3+vFoninkvw+nw2x3pRMgzmIkbpSOTubAVomAsX2oTSb6gxQy3TC0yJ+Yu5u+edCqMByUUG0d+VFcE+pVN+wGcZV1rAdb8Dmnc89Lr7YwgYG97TYgIx+oap2te39HZcTgF5mK+gJlEc5RTALU2tk5ofqfs0qpzXfpXjJZ40qyEO8FFezdq6TQOyo8pJlqAH+2sYhNWn42I0y8d0uS1d59oM2nGWgfRdN/BysTtQJrFGIcS5onwpMkckg+++vtM3tyU/0xx7KdA4hm4RZ7PXPe5fAmL8hKlH5Lk+5UDEWihFI/edYZs5dXfNXNYmKvH7RBTI10AWlg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39860400002)(136003)(346002)(376002)(36756003)(8936002)(26005)(6506007)(6512007)(6486002)(53546011)(478600001)(5660300002)(2906002)(41300700001)(6666004)(83380400001)(66574015)(31696002)(86362001)(66476007)(186003)(38100700002)(8676002)(4326008)(6916009)(66946007)(54906003)(66556008)(316002)(31686004)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUl0T3E4aldQY2NBWlo2SDVWRURSN09jMUg4VjQ1bUhJemk0K1NLQVlocW9y?=
 =?utf-8?B?TlV0K3RDckVuWkswNGRHb0RYU2RmVWpnKzlIZGZVazBvSGlzNHdEWFFkNFQw?=
 =?utf-8?B?TFA2azJwNUtsNC9xSmo4QkhKNkVZSWZIMjFRUU1QeUwvUHZhWCtxaW5GOTZZ?=
 =?utf-8?B?MEdRZk1MbWROdE5sY2ZKSlJrY2FvaFBybjZkNThoZml0MFNJeTV5eW9OU3ln?=
 =?utf-8?B?SEhPa3VOWGc1VTlDSzRHZWtUWW1kN0pqVUxVa1BLcU1NZmRacUtlK2gzai9F?=
 =?utf-8?B?MjVPa1V0RFpxc1ZLa1Y4Y2N0WGFIaE0yUitBeVU0RHkya1h3WktJQWxadnlk?=
 =?utf-8?B?blB3NHVsVmRWMzJuUmxNNUk2bGNSZnpiMFM5TE9Wc3J2TG9ORkNvZ0RlT3px?=
 =?utf-8?B?elJValRNaW83VnlXVnltKzA1ZFBaQ2xyQTNVUWxDdjNNbk16bkt5ZVFkOFJH?=
 =?utf-8?B?QXRvNnRydW5uNDQ1QSttaTVRYUlEN0h3N1BCaEU1RWM5YjRTcFNUYzM1SWJl?=
 =?utf-8?B?S1Ztb3ByTFVPTGk0UldhNWZPOVRlYm1abWZWMVluKzErSmpnUkRUM1ZNRmF2?=
 =?utf-8?B?ZEJ0YlhzaEd5ZVVDMTRxZFQxWDVCbXllcTgwWGVLOUxiaE85aGQ1TEd2eWdy?=
 =?utf-8?B?eGVGNllYOGdVRlpuYUMxRFdSVEZCbXJKc2xvaldCZnlzdTBLZEpDN2VuZFNJ?=
 =?utf-8?B?V3podHowVFhYWXRIdCtvR290Nmp6Q2gwVzB1dWUvYUw1WUU0YzRyblg2bWE4?=
 =?utf-8?B?UWpUb3FuSUF5TmNLREFSZDBjZkJ1aW5kOUdXMGk1Ry92anU3T08wazNrZ0x3?=
 =?utf-8?B?Q1hEKzFjTmlNZHlERlpFV3BCREV6aVdLUnpWdWtpOElEeGUxS244ZzRUT1Ri?=
 =?utf-8?B?QUtqTWlBVkdySW81WFB1NmRJVWhzY1JMMlJuUUtTU25EQUFFeWtMOW0raUNx?=
 =?utf-8?B?dDd0T0Uvc2pHVGk3czF0Z216ZmlvQzBWTlozWmFBQWdxREFHM1diakpEVWVU?=
 =?utf-8?B?OEUrTDk0TnNsUXZhQVBxdjA4bUZOeG9EelM2eFFTUzRiU3lKeHFBN1dPcVln?=
 =?utf-8?B?ckI0MzVCVXV2WVJOVzd3Y3BFcVJlVGZOR2dqZkxNRmVhc0Flbi92RkllZGd5?=
 =?utf-8?B?ZjFTVDg1WUMxbUQ4MW8vWU1adDdMVVcyME9PMTM0bkM3K3NDMU0xbzJwMG5Z?=
 =?utf-8?B?b3kxNXM3dFNVSmRlR3I3dnFTWHMwSTFZMVkvUlkzQ01EOGlOTUwyUWNmaTJv?=
 =?utf-8?B?dUF1NytDM3l1YkVUSVp5S3BWdHc0MGNZWE5Lc2FWNXB3aWhVdnp1dFphVjFF?=
 =?utf-8?B?bzNoZWNWcjJpTzlyTzZtWG5rcG1tNDZqQ3VpRnY0WFRVbjd0UDliN1h1Q1VH?=
 =?utf-8?B?VUlxWGFqY0RTOXpsS3dXRWZNWFhwVzJFOFdFaVVWUS8zSGlyc0FGRTUzZmlh?=
 =?utf-8?B?RW5ML1ArSkg4WnVEQ2ZMeHF1VEdDSkUxSWI4bGxjTWlWRWphQzRXelh5cXcw?=
 =?utf-8?B?V2NPT0FRU1dWZUFzN0JsMW5ycGt2c0pLRWJ5S21weUxjTWtOdnFvWDRoeEtw?=
 =?utf-8?B?UXkzQ0ErWDdxb2w3aG9aTUNONzllNWZTdFYwWnZlTzc1OHNGclB0N1dZZEhW?=
 =?utf-8?B?QTlzeGlneHh0QWhBVng0L2o1WGNVb3FLVEJCbUV1dEM3eEpWSmM5L2IyUmJU?=
 =?utf-8?B?NE0xNXg3R1hCZk51WnJ3cmNRdzg2VUZROVdBQzlpWXNIRUR0bGxRUVdzRE90?=
 =?utf-8?B?TThPWWlhUXJwOTBiMGQxTU9iUzlaWHhmMkIyTlRtVWJ4UHFWUkcrUGEvaDNT?=
 =?utf-8?B?SHlwU3E4bXpsZjgrbGR4cDE3clRUY0ZQZzA3c1NsbitSSHNDNURMd2t2WTJq?=
 =?utf-8?B?V2hrN0FKV2llbXd0Y213QmtETDh6eWtQRDFYL2JtQjFyN1FKUzRkOTNBUEhF?=
 =?utf-8?B?N0hXN09qeFY5NEp4V0VPejBOVmdxKzF5TFdiSndaU2tpY2JQTGcrczY3aUJG?=
 =?utf-8?B?dTN6UnBwZUsyL0tDR3l0dFNodlNOOHZRZ1Jxbzh3N2xsNkZBQnVURXcyWnJr?=
 =?utf-8?B?Nzh5VEoxejdReVQyVkhDZ01NYlU5NDhDZ3pXcUY4R3BQWVVTdWVjTlo0RCtF?=
 =?utf-8?Q?49DErijFxsSUg+/sV+LLyyFcq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea831996-3d58-4fb0-29fc-08da6b04046d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 10:30:22.6369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adNHWxTxGzxYjK6MT3kWQ439eni8l6Wb0wrB9P8VAhZYHtGLBbJ2CAuTi9s96KvsMlXrs8XxwJ8LTwSQ2Ada+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8551

On 20.07.2022 22:17, Marek Marczykowski-Górecki wrote:
> On Thu, Jul 14, 2022 at 01:51:06PM +0200, Jan Beulich wrote:
>> On 06.07.2022 17:32, Marek Marczykowski-Górecki wrote:
>>> +    /*
>>> +     * Don't place anything else on this page - it will be
>>> +     * DMA-reachable by the USB controller.
>>> +     */
>>> +    char _pad[0] __aligned(XUE_PAGE_SIZE);
>>
>> I don't think this is needed, due to sizeof() being required to be
>> a multiple of alignof().
> 
> I'd prefer to be explicit about this, because if some future change
> breaks this property (makes alignment smaller than a page size), the
> result will be pretty bad.

I don't mind you leaving the comment; anyone making adjustments there
ought to be checking the effects of what they're doing.

>>> @@ -990,16 +999,22 @@ void __init xue_uart_init(void)
>>>          xue->sbdf = PCI_SBDF(0, bus, slot, func);
>>>      }
>>>  
>>> -    xue->dbc_ctx = &ctx;
>>> -    xue->dbc_erst = &erst;
>>> -    xue->dbc_ering.trb = evt_trb;
>>> -    xue->dbc_oring.trb = out_trb;
>>> -    xue->dbc_iring.trb = in_trb;
>>> -    xue->dbc_owork.buf = wrk_buf;
>>> -    xue->dbc_str = str_buf;
>>> +    xue->dbc_ctx = &xue_dma_bufs.ctx;
>>> +    xue->dbc_erst = &xue_dma_bufs.erst;
>>> +    xue->dbc_ering.trb = xue_dma_bufs.evt_trb;
>>> +    xue->dbc_oring.trb = xue_dma_bufs.out_trb;
>>> +    xue->dbc_iring.trb = xue_dma_bufs.in_trb;
>>> +    xue->dbc_owork.buf = xue_dma_bufs.wrk_buf;
>>> +    xue->dbc_str = xue_dma_bufs.str_buf;
>>>  
>>>      if ( xue_open(xue) )
>>> +    {
>>> +        iommu_add_extra_reserved_device_memory(
>>> +                PFN_DOWN(virt_to_maddr(&xue_dma_bufs)),
>>
>> virt_to_pfn()?
> 
> Doesn't exist. Did you mean virt_to_mfn()?

Oh, sorry, never mind then. virt_to_mfn() would be good to use if
the function took mfn_t, but as long as it doesn't what you have
is as good.

Jan

