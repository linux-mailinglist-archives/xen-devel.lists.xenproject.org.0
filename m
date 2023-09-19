Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FCB7A686A
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 17:56:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604913.942458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qid5G-0006Jf-15; Tue, 19 Sep 2023 15:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604913.942458; Tue, 19 Sep 2023 15:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qid5F-0006Dp-Ts; Tue, 19 Sep 2023 15:56:17 +0000
Received: by outflank-mailman (input) for mailman id 604913;
 Tue, 19 Sep 2023 15:56:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmoc=FD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qid5E-0006Ce-HH
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 15:56:16 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2048.outbound.protection.outlook.com [40.107.7.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f8372be-5705-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 17:56:14 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9463.eurprd04.prod.outlook.com (2603:10a6:102:2ab::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Tue, 19 Sep
 2023 15:55:45 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 15:55:45 +0000
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
X-Inumbo-ID: 0f8372be-5705-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHrzlItGfPiY0lZWzuRDhuDJOBQeguUyuQUNVoDClN20/8x1lhOESH6G9SrZIerCSRQzOD9HSaBbJALI8oNHCpKOC6Wv76TljZIFju+4rCuep7mJKATFypay4IDXWnwsn8jmAVE670fDYdHfVpWyx86AO6K7TFRZo71m/Djkfqcv4fDC0zb683PRilZLiHn8zZcM6pETfyFoOA7n7vbd4Bv2sWUmiSV9U4RTKcGMbdW+eBDFBDw7OOy7s0fCyIOAX8wVm5Bkp6wF81wppbky8Jh+o31BPIoDhbTW+YBkO6E3bpG2wWIhpWGy/9L0mNLfV5GWDoeXlEIPY9adF5TytQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0ZPEyw7aeGQ7+pn2Et2gUiel0EI+zK3LZNm12STbD0=;
 b=RYOLRwlvHSltC3kd2i80UHIVL1SnodBhJNMXOKajFxNtemaliMrNFarIHsAamNHyMqjmO6df+2w2ePtJX7unPQp5uZP575GvRFQJeClMoqfKPhDYpGSyMRrKcSxx+Aiqcm1ErRQnN+cN6vyuA26ZLb8N8MQ+Jb+Slo4pR2KVtV2DRLHnMKMTsoinB1e/LGSWbWbZDZY9ceITu1DwXnMsjxQnTNbtj2JGctGUh5AE82+cAdbME1E3q1w887+F+9oVTigT1v4IGplg70Y9J5cCPUC1q+bsP/NcoR0FDmrVxKyJ2VQ1Z6Cp/c0NWVreyp1ptsnVfLEPPKzvYIwtHiIk+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0ZPEyw7aeGQ7+pn2Et2gUiel0EI+zK3LZNm12STbD0=;
 b=CLf4gx8Gx3yGpy27COMQt8ToLAZLCQ/uqHVSxmFJ7VBhUKn6TBZ3UDlvf5aKIgpLdonBp05IO1XQfjVwToSm8mLmBpcsVXjQRIgUD01WmEd4fgwFDEg6Rx0KcBJPPbmCTn4erhGIbR24V9oF5F6N7qOGWmRgLgbS2c1tD9ul9a02vwFaeXTwtoBuD6bvgBuu7h1NTKCEzhVPkKwkh797VXzf6QmgAEzmogeBxFlyFuLdBdi1I2uthNw+lXHY7BqSPTj2GcKvZnAbqccmLvLZGLAv51f7Qo3S6BFLZcmt1Tyg3ndkL2eCMN6qoAhvTBXGnLa8/MDO3D3zZRSFIBcTPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5cf73ef3-3ec5-9539-3a29-b8535a73d9cc@suse.com>
Date: Tue, 19 Sep 2023 17:55:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v9 02/16] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-3-volodymyr_babchuk@epam.com>
 <ZQnAvNSDn0WB13Gn@MacBookPdeRoger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZQnAvNSDn0WB13Gn@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9463:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f9ddfe-998f-48e8-879f-08dbb928e24c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eNNo8Ms01xGdXlOwmcKza0WsdfbB8FgYElZqvieZkaQX68Hy/hnt1teqw/VRBL4mg9M//WGuGRRUllfbcO84VsUA/77XRZI+P1UZLdTC4dXVgPkIq+tHMI3qCCoDaeYXSjOWNdzuBHimU123XhKT3KBuUwNXc0hsHNYNaBiSvdRhYqTPX0S60fyGh2pLuN1qAXsTuZPa2nrqiMK+cumU1jVdVYye7rGnK3cyMZEz09ns5SGJxXGRQ43nM60Q0IXXYyhwnRS/HMY05j8fPVodgTblxTjo1QiN9x71qlX+7pygpkyPmBffPIqPtcqfD7QTyTPSpsDBzmU+qvgVuUCaspSKgWpA1ZhW8Tt2Zui5cGTgJ3Hi+t5d9rjXuboeccxvokmQjZwNodgDxUejuziyMFlQ4Loy4lRkEhbG75max9fZWvRxXEJD7zRJ3y4s68CWscOZmrvvUTvndyiL9U3cKwXPpXQjFQYfBMqmdaP3C/QP4rHHDZT1R68Fvc8a8iBsY5iyxnDiwixW6x/C/Y3QuRnixZK3ZIs0tnEUfDyjwVT6GGpQCrUEmEi2olRGxxMDwIsdlV7TIjkZwLnDOw8BMhz0hAnKj74VgY2Aq0lDhyzS/64/gXs4LxUjHSO8cZ91pEbklVPd7hpIQm7XG2Nq0Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(396003)(39860400002)(346002)(1800799009)(186009)(451199024)(5660300002)(26005)(8936002)(4326008)(8676002)(2616005)(2906002)(7416002)(31696002)(36756003)(86362001)(38100700002)(83380400001)(66476007)(66946007)(6506007)(6486002)(66556008)(53546011)(54906003)(110136005)(31686004)(6666004)(478600001)(6512007)(41300700001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODVzRi9iN0l1SlVBU3hzSEZJNGdBSFZQcnNLMGFRSmp0UnhrZGhFRmZkNWsz?=
 =?utf-8?B?dFpuQncyT0pXZmF0MVZKa3p3VnVVTm9XNDIzNWhKeGZoUUpOVlVPRHdXbWZz?=
 =?utf-8?B?emlvcnpZNEV5UjFyYm9FNFVNRnMyVVg3MlpZcWkyeVkvZmJiNlhpZk4zZi9N?=
 =?utf-8?B?UXdRaTQ1NTcrY2pzYWJiTFFqMTM0TVJMM2tsRmRsOHV6WnlUWUxGcm9SamRD?=
 =?utf-8?B?YUxxZk9ObjhSNTZMQnJFMEZnMEV5cGo3K3MxRkFrSlBSOUt2dGhKdUh4ay8z?=
 =?utf-8?B?TnZ5dFI0VmZPcXRwU2xzRVFyMzZCQkdoRDZ6eGVHekxZWUIvYzJ2Q0toZUIw?=
 =?utf-8?B?QndSMndHNHdRRUh2dHVjVDdQTm9BUVhEME1WR0hmWGhnT2pnWTNnMExpTC9Q?=
 =?utf-8?B?VTllcU8yQmFMOWpCcUV5K3laTGFIMFVZUW51blRsT0QxVmZxM3U4SmlYTm13?=
 =?utf-8?B?YURlVFh2NkViVE1kczhkdnRvTDlNWDFDejNVcnZLNVFKTm5ON1ZRMFlmSjRy?=
 =?utf-8?B?NjhqY0FwVzZ1OS9UMktrY3Z4U3VsLzNNQXVseUZmRzJ6Q28rNkhDTHhkY2FB?=
 =?utf-8?B?dXdoZHVHWEFTWnFWOUJ4QmlLTU9PWXBQSlltWHAxRlQxUkFxU3VOdlJrUFk2?=
 =?utf-8?B?U2ZxRzJLdGV4ZVAvM1MzbmVtWDJ5cHFlYnZLMjdQOEV2MnUyQXJtbE5MK3RG?=
 =?utf-8?B?a1JmQnVvUElBN09SM1hxRjZEand5Z2NyRDBhSXlBeDl1ZWFydWNhMUp5OXBi?=
 =?utf-8?B?Nm9aYUVQaTg1QWRHOEtoRlQyaVJxQi9QaDE4N3pBOVFvM2ZWdXNzVW9wZllz?=
 =?utf-8?B?VnozdnR4cVJUSE5WQmgyd1JVYVptWlFYQ2lmczloSW5MaGoxOTg0TGRzWG44?=
 =?utf-8?B?d1VKN0MvK2lNR21peXhKTWl5b1pkQW5nSUxBWm9VWmpsRzZKWVVtSGh0QUxU?=
 =?utf-8?B?UlRUdDh0S3J1bjVuSW5Gb25EL2d4Zk1HdWVkaS9sMEhQOW1jamtYOGlVMFd3?=
 =?utf-8?B?RGN3OVZDeFBYYVVISk9hcTcrNVRDd25xYkc1TDhpTFpQNHRTS3psMXpFT0Vi?=
 =?utf-8?B?dUFMY0RkalgzZWxNME0wbUpibTdEclBrcTRCUWhFUFRuRFppSTVrYU1paFpq?=
 =?utf-8?B?akZLb05rN2t3TU5Xb3Z6RVJhdzJGWTk3Vlc1eDhYY0NpNEZuR2JKT2NVdFc1?=
 =?utf-8?B?Wi9MRXJ6UXZpNjNjT2tyUFMvUEd0MFJDNnhTZkwvSFBHd1Nwc2FRaGlOeUZK?=
 =?utf-8?B?ZndyNERQLzBxOFVJbFZ3bG9ZNzhuMnJoV2hEbUFyYi8wZ0dqQmxFQ2ZsRVJX?=
 =?utf-8?B?QzZubENDaU43VWc5Yk5iWUtDU3BPd2tyamZkWlI1NTBVdWhSeWdyT0NldGNH?=
 =?utf-8?B?MW1GWURWemtibHdWQ2RYM2lqY2ljNWJ4VWNEOVBBaklsUTFxNUNBdXNZcU1t?=
 =?utf-8?B?SUptbk1GeXd1Y0NDTndHU1BFUWE2YkxmTTFYQTVtdjQyYlVrRGFqMk5sRW9I?=
 =?utf-8?B?YUJjYmsyQ01DTFNGbEJLZ3loc21qNGkzR2VDdnBSd0NzYUcwUnJPU1Zkd2V1?=
 =?utf-8?B?VjBuNm96dDlGRWdGQ2RWV2dENlVmV0JLM1FVdEJoTWprbU1LNHZ6UE5jQkZX?=
 =?utf-8?B?M1VUL1JUUUw0WEJsZHNMb3loNmlBTi9XMTdBOWlvQmwzVlVFdFdrNHNWRjl2?=
 =?utf-8?B?QVdnUHNnUTczeDRjYU5hcXZMK2JWSmNnQVpzQ2xJYWJCTjZzYzBnN21RZXRH?=
 =?utf-8?B?bXlTam9Hc25XSHBxdElMTlV5Q1JHazBicDVsUWFyYW56Q29wMmg0VFd3cjBy?=
 =?utf-8?B?ZGM3MFVrT0g0aUZrWE8xeVR5cCtzbjg1cGVwUVZYbUpJazJhcmllaU9oSlhz?=
 =?utf-8?B?clBPR2IzTUcxK3dkT2JVWTBBamI0cERrOGg4OXFDQ01zMFFDazFqU3Fyc1c5?=
 =?utf-8?B?a1U4aDF4ME5KNnBrNVFWaUJKOEg4SnVJbExva0RXdXFGWk1GR3E0dEt2TDFQ?=
 =?utf-8?B?TVBVcUk1d2V0RDl3UFEvZXgyM1M4UW05eW9YMFkrUVB2U2Zkam9JcDJZWlZ1?=
 =?utf-8?B?L09nb2VaaWVkR1ZUQjU5aGJTY254UElkUW5uNE1lR2N0WVYvd24vWWhkZTFn?=
 =?utf-8?Q?Tp1zhws7NNLYuWDT/oZxC0zb/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f9ddfe-998f-48e8-879f-08dbb928e24c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 15:55:45.0523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1P3sTO/sIhqkuNTDpVkcvN0hE7W9TJexGNvXaMQTW3dUw0eHx6Q5r3I7VM+NUfsvJfcKH7D/3OKiC/wKvngd8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9463

On 19.09.2023 17:39, Roger Pau Monné wrote:
> On Tue, Aug 29, 2023 at 11:19:42PM +0000, Volodymyr Babchuk wrote:
>> @@ -2908,7 +2908,13 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
>>  
>>      msi->irq = irq;
>>  
>> -    pcidevs_lock();
>> +    /*
>> +     * If we are called via vPCI->vMSI path, we already are holding
>> +     * d->pci_lock so there is no need to take pcidevs_lock, as it
>> +     * will cause lock inversion.
>> +     */
>> +    if ( !rw_is_locked(&d->pci_lock) )
>> +        pcidevs_lock();
> 
> This is not a safe expression to use, rw_is_locked() just returns
> whether the lock is taken, but not if it's taken by the current CPU.
> This is fine to use in assertions and debug code, but not in order to
> take lock ordering decisions I'm afraid.
> 
> You will likely need to move the locking to the callers of the
> function.

Along the lines of a later comment, I think it would by rw_is_write_locked()
here anyway. Noting that xen/rwlock.h already has an internal
_is_write_locked_by_me(), it would in principle be possible to construct
something along the lines of what the comment says. But it would certainly
be better if that could be avoided.

As to the comment: A lock inversion cannot be used to justify not
acquiring a necessary lock. The wording therefore wants adjusting (if the
logic was to stay).

Jan

