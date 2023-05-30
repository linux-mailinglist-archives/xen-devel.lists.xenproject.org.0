Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A70D715A80
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 11:45:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541039.843332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vuX-0003Nc-49; Tue, 30 May 2023 09:45:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541039.843332; Tue, 30 May 2023 09:45:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vuX-0003Ls-1G; Tue, 30 May 2023 09:45:01 +0000
Received: by outflank-mailman (input) for mailman id 541039;
 Tue, 30 May 2023 09:45:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q3vuW-0003Lm-93
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 09:45:00 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a37a97bd-fece-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 11:44:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7825.eurprd04.prod.outlook.com (2603:10a6:20b:24f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 09:44:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 09:44:54 +0000
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
X-Inumbo-ID: a37a97bd-fece-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NnXpTpWk1rbmVRrHDcGIhCCmbLm/w2iQ8NfrD64/kRoSUIo/WgPF847lH3JUhRMOmZHQvJO1TsySXaNBb4JX+/nWv4QV+eWEWkp5ocScGL3bvqq+5BZsNLXrrEMiaXy7di1xlGEwKytWOoPQ0mQJkvb9eayhRb9YWvvM+imktX+IPC2zaZDugf3zSBpuMgGoLGdaaJ5xdWD9YsEKp7v64DqlNGS0CMkDTNgNlc6r7xSelGpi0LheCaT7SZORnW8Xbl2iZR5E0fRHLZEtfrw+WbNRiwp9ulz3y0/RKGENX181KD1dA7JInZgrtt8YlMPbG/JI1RoP+iNWK991bsKv7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtV/UBaCqfDObDGTLdONMnijnY3rZTsyyJjrQuedfww=;
 b=amXOQenF+qFT704DiqSyodO2JjIwRxsKukTCsdy+RSisoN1U47BK9sZRXz9w9mwzwoKVlOLuaWSsAiTyTMf2QPuMDBo31mXNDP6vXxFe9f+mBex7/3uihiK2zmZKYxrgbfmTmFptLPpcC7y6wRtdRliYLepp2HAqrn5adKCemOS8xiXuvd2pLsVGcW6u+fKSo4zjCzNDRmBVqpswYv+Pm4cORY7f/nGL1nbBxJUrdDR/++HEx1PhldYTfVKgjfARh8KY41eIyj3OgccZ+549w6Nvr0FIdDZy7fo0r56XIU8/L+QiffKuV7EJE46blKs/1K2O0gTqMLNCprTYB2BZRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtV/UBaCqfDObDGTLdONMnijnY3rZTsyyJjrQuedfww=;
 b=plQ9bugyp0ElbDHwLbEZa3wwkn7ePC98jOCHM2Qhg2wv56hSNr7sC/TYKXf4YscH6EKwyJ6wo6hHXFBRwM8dujULi2OoRMghU1O2dbyXqrt85Cn3JJGsixF9M6wz0NYGSCYBOtKunDvDiyOxoIqc/4l7VSkSBVY3ajGmeITlll1jz2Ak5TTbs7tFh9A/vOIyxd8v+NDrM8M0UaV9mNkEctPymGnSQBkToiXHY86+Bm5s6PmU3WfvZbHZB36QM1V6kcu45yz3s4rAuIwUKxXFLK2xoZAvJ50bXTh+1sFxf3nt9EZiV09VBiBWsr6Q4OUCAhqWPILBsfBqnbctR8ya9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <830fb3cc-6ade-f10e-2a0a-95b676c63d87@suse.com>
Date: Tue, 30 May 2023 11:44:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v2] vPCI: account for hidden devices
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com>
 <ZG4zx+TvUWTCEMh3@Air-de-Roger>
 <2b1b1744-2bc3-c7c0-a2d8-6aa6996d4af9@suse.com>
 <ZG94c9y4j4udFmsy@Air-de-Roger>
 <cedbc257-9ad9-56f1-5060-eaf173d45760@suse.com>
 <ZHRdjCKSVtWVkX96@Air-de-Roger>
 <25663dac-6023-a9a7-a495-c995762191d8@suse.com>
 <ZHW+Fu99ZGHPgMj+@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZHW+Fu99ZGHPgMj+@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7825:EE_
X-MS-Office365-Filtering-Correlation-Id: 57d4156f-9764-45d0-b06a-08db60f285ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NqBhX0hIqew2215oAJel3HhsxB4zKp1LbjmqabBoAX0//olza5htim2d573W4h9cS6mxY7WwregDNDGZTmTFW93BVDa8e1tYcdSecakiITYglKASjUiKsqzQUBSe3jwOjKRrGmGYJVUeNm6D4VV1I02QtGII5xnjpu9rw3yxynDqcij6ziJgF5/+mSDuLMtvIc7EMyb6JBKQqgdkqz2HynJ+Nu7xxHEy2dbqUUUTue3txmxCf9d//CUYjOMM9V0pBp5QlspuKDZP2lxFZHX504Lp10VxwBPAPGdsHL9EJ446i5CQXro8aDPVhu6PuxrpeX/gQOb+w7hnIioPZ5vxbdTRHEgWTccyopPYBgpt/lZHUcRcIdGKmFLU3YlyZyyOGkAxauOsYPYpeUqrfMmY9CdmHjMOnA3QCGbOxs7R4grIKRt16RA7YhAm9g4rQFR/9/SOx5T63xXD5F/vGpBSdJGjXHjJVlt2kowf01enJP3J80p8M0pYC0c6v2wZF8omL8qIrighy+3KFbwhqfIPkW+HePon4yurNuGTFGHF7yhlwfV48IHolnyH1JBdHh1iJBOoyOPdYfh4+KkO2c36LMegD/U/DOvMt3QyiPE2eQ/8lPqtRKmYnyR2MFxjVqOy+vy3qEa24evNLhguCg0SKA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(136003)(346002)(396003)(366004)(451199021)(186003)(26005)(15650500001)(6512007)(6486002)(53546011)(6506007)(316002)(2906002)(5660300002)(41300700001)(36756003)(8676002)(8936002)(478600001)(38100700002)(31686004)(54906003)(6916009)(4326008)(31696002)(86362001)(2616005)(66946007)(83380400001)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0wxcXVhSTVDZ2xSZnp1SnBBb3Ewb0RVbmxwZjk3eVZNeFlyelhMUTdaTThI?=
 =?utf-8?B?WXhEYUJLaFI2RW8xMi9neTRwaWRCanQ2bVNKcmVFZnRnTENOL05Ca2htZFNO?=
 =?utf-8?B?dHVmcEhKaXJrNFc4ZWF4QnR1d1h1MWNGY3dHT2V0ampBajJNa3BDcStGWGpi?=
 =?utf-8?B?eWR4SlZFUDlnZm9qeXNzNG5LcmRFelROKy8rS1hkNWFtMHgxekVqL2cwUXdB?=
 =?utf-8?B?U2RzN0Y1MmdHZFljWVVXNmRqQkpaQ3I4SFBCMGNGaGtVemVYdHB6aEd6bURC?=
 =?utf-8?B?M2MyU0dET3VRYzhtRVRTZmw2Um9USWczWE5uTEN1VjVHRnNEMEFVUk1hL3FQ?=
 =?utf-8?B?ZjBjQkQvR0xSSUlEYzlnNjA1dWdUT3Qwc01LV0cvYjkyM3hqMTgwNDlzWDJT?=
 =?utf-8?B?cGlvRUEzZzN4UHAwblpCQW5xRjZyb1dMV2NPZWVISDZlL3Z0dml0MkJOSWVW?=
 =?utf-8?B?MlVkSGxuNEpUb3RCZXllRGpiUzF0dDJSeUZiYnpxVTlSNU5OL290K0pkbmxa?=
 =?utf-8?B?a1B3K0lQejhndm8xZGQ5bmRrU0ozTFpkZFhHMm1WeGMzcmEvVWVrWU11OVR5?=
 =?utf-8?B?ejdTVldkMXNhZ01uNGV2SHFKTGN6TG1KbnZ1M1hDelA4cFI1aGNoNFptTDRp?=
 =?utf-8?B?Ny9lS3RHdFdXQ3R0NTVCb0JqU3V4eC9Va0l6MlFZVGNsdDJMYzA2eUV0RWpo?=
 =?utf-8?B?Q0Foc1I1KytkMjFHaEwxQVkwSDM2MzRteDFGYWppMTJOejZKbUllbWhneUV4?=
 =?utf-8?B?a0RvSzA5L3Y3aysxaUMrYXVxVFltc3JUMTdRYmVOOStxOWJLMWFwVzZib2Vw?=
 =?utf-8?B?WnBSbm5ncE1EZlpwMjdQSjY3S0FtVWU0SS93SkdHbURwWVczais1azhWY25C?=
 =?utf-8?B?eW9FZFJqNHI1SXlXZnludms2enNaTG5IUVVmcklTVEMvUUY3dEZuNXQvNE15?=
 =?utf-8?B?REJOYjVsUys2QVd3ODVKc21pRzlONEF5NWpkMWFnMExLcFhFNm9DbW04Zkd2?=
 =?utf-8?B?bDBHYUp5Uzd0SS9FcG11RHMraWl0cmxWczFYeGRNWFhDS1M0U252SnNsUGdV?=
 =?utf-8?B?azRCamRKY3hvRFRvOEtZMW5kTnlRcC92S0dKU2JaSTNnbjdXdWo0UDBEOTcw?=
 =?utf-8?B?Y2poeno3cHd0OGJ3bzhKM3JlcEQxN0tVV0ZGR3BJVWZJZmIxSmRHZ0ZqYm9W?=
 =?utf-8?B?RkRXNDRkbjY5cytPcVZubFpER1VjYVFUTzRQUXdLQk1qOG00d1RoQUxDN0E5?=
 =?utf-8?B?R2RTdVBIeHhCbHpBUG5kd29BQXlNbVJjMDk1cHZVTXh6WVVuOXNrOFlRSEcr?=
 =?utf-8?B?UzZ0cG9zZm9VT3lSbTBkNlpNR1VweVpDYjNzMVkzcmRrQWxkd3lUUUVqZjhL?=
 =?utf-8?B?dTRFT0IvVkpqTFdOVFFvdHQrM21CMU9yYnhHMWlCcngxZEYvTFBlSGgvaFMv?=
 =?utf-8?B?SG10Y2E1eU9zTUNvZG5WektLS3MycUdBVmI1c2UxZkVaWFZ1Zy85MTY2MlZL?=
 =?utf-8?B?TTVObkt6dDZ2Sis2QzFBVjdxM1V4c2ViL3lRVVpnNThzRlU3dTNvMVgxZlFm?=
 =?utf-8?B?MHFkanlJem9IT1d2ZHJuU0tET0xyZHI1azlYWENlRGxNS0NpWFYxcTBtMm1W?=
 =?utf-8?B?VnV5Y1lsQWhKL2hXZitseG9WRnBiVnJaQ0dUM2NGWVA0V1RlYWQwRlpaK3o0?=
 =?utf-8?B?cVVHbnorRTBKR3pDeFRLc0tabWRpYk1jbzl2NnNTNC9uQ1c2aFYvaE1OM1Z5?=
 =?utf-8?B?amdKVW9KUlJLb0JZN2ZTMEIxZDRacWFsOFBhOUphOEorTUpJTHZzSlpKMHQ5?=
 =?utf-8?B?dlhZcGJiSTZCd24rNkx6VElCMWc1aFpJQVU3YVdVNXhBNTlMNGhsWFM1RHo5?=
 =?utf-8?B?UUdaN0NZTytEMnRPM2daSlhuK3IzaFlNVkdpSjlTWWlWTnVTRGs0cUJXRElu?=
 =?utf-8?B?UU8xUmhjNVRHVUpVY2VFOE42blJkbnR4Zm44L2JnUStNaFM3V0w5M0RvK0Jm?=
 =?utf-8?B?b1lJYVRabVc1RE0vZjJrbXNvUGYzZlZzVVZjR21kcUY5ZGJxNytDMHV0Y3E0?=
 =?utf-8?B?aGNoV2U5MHNLdGxTamhGWWY4dFVvVit4ODRnM1U3b2pkZFgva3ZKMHlXU0x5?=
 =?utf-8?Q?ONjJ+OrwjRvVs6ghqxEof7889?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d4156f-9764-45d0-b06a-08db60f285ac
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 09:44:54.5566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9BBlK0ixlkoZqhyX/P7laCfVVXoUqHEoGgLqmIZmd7c6ApEKu0dMzAlEw8utjDBOmHP4QFLihX/Dwq0ncdIABw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7825

On 30.05.2023 11:12, Roger Pau Monné wrote:
> On Tue, May 30, 2023 at 10:45:09AM +0200, Jan Beulich wrote:
>> On 29.05.2023 10:08, Roger Pau Monné wrote:
>>> On Thu, May 25, 2023 at 05:30:54PM +0200, Jan Beulich wrote:
>>>> On 25.05.2023 17:02, Roger Pau Monné wrote:
>>>>> On Thu, May 25, 2023 at 04:39:51PM +0200, Jan Beulich wrote:
>>>>>> On 24.05.2023 17:56, Roger Pau Monné wrote:
>>>>>>> On Wed, May 24, 2023 at 03:45:58PM +0200, Jan Beulich wrote:
>>>>>>>> --- a/xen/drivers/vpci/header.c
>>>>>>>> +++ b/xen/drivers/vpci/header.c
>>>>>>>> @@ -218,6 +218,7 @@ static int modify_bars(const struct pci_
>>>>>>>>      struct vpci_header *header = &pdev->vpci->header;
>>>>>>>>      struct rangeset *mem = rangeset_new(NULL, NULL, 0);
>>>>>>>>      struct pci_dev *tmp, *dev = NULL;
>>>>>>>> +    const struct domain *d;
>>>>>>>>      const struct vpci_msix *msix = pdev->vpci->msix;
>>>>>>>>      unsigned int i;
>>>>>>>>      int rc;
>>>>>>>> @@ -285,9 +286,11 @@ static int modify_bars(const struct pci_
>>>>>>>>  
>>>>>>>>      /*
>>>>>>>>       * Check for overlaps with other BARs. Note that only BARs that are
>>>>>>>> -     * currently mapped (enabled) are checked for overlaps.
>>>>>>>> +     * currently mapped (enabled) are checked for overlaps. Note also that
>>>>>>>> +     * for Dom0 we also need to include hidden, i.e. DomXEN's, devices.
>>>>>>>>       */
>>>>>>>> -    for_each_pdev ( pdev->domain, tmp )
>>>>>>>> +for ( d = pdev->domain; ; d = dom_xen ) {//todo
>>>>>>>
>>>>>>> Looking at this again, I think this is slightly more complex, as during
>>>>>>> runtime dom0 will get here with pdev->domain == hardware_domain OR
>>>>>>> dom_xen, and hence you also need to account that devices that have
>>>>>>> pdev->domain == dom_xen need to iterate over devices that belong to
>>>>>>> the hardware_domain, ie:
>>>>>>>
>>>>>>> for ( d = pdev->domain; ;
>>>>>>>       d = (pdev->domain == dom_xen) ? hardware_domain : dom_xen )
>>>>>>
>>>>>> Right, something along these lines. To keep loop continuation expression
>>>>>> and exit condition simple, I'll probably prefer
>>>>>>
>>>>>> for ( d = pdev->domain != dom_xen ? pdev->domain : hardware_domain;
>>>>>>       ; d = dom_xen )
>>>>>
>>>>> LGTM.  I would add parentheses around the pdev->domain != dom_xen
>>>>> condition, but that's just my personal taste.
>>>>>
>>>>> We might want to add an
>>>>>
>>>>> ASSERT(pdev->domain == hardware_domain || pdev->domain == dom_xen);
>>>>>
>>>>> here, just to remind that this chunk must be revisited when adding
>>>>> domU support (but you can also argue we haven't done this elsewhere),
>>>>> I just feel here it's not so obvious we don't want do to this for
>>>>> domUs.
>>>>
>>>> I could add such an assertion, if only ...
>>>>
>>>>>>> And we likely want to limit this to devices that belong to the
>>>>>>> hardware_domain or to dom_xen (in preparation for vPCI being used for
>>>>>>> domUs).
>>>>>>
>>>>>> I'm afraid I don't understand this remark, though.
>>>>>
>>>>> This was looking forward to domU support, so that you already cater
>>>>> for pdev->domain not being hardware_domain or dom_xen, but we might
>>>>> want to leave that for later, when domU support is actually
>>>>> introduced.
>>>>
>>>> ... I understood why this checking doesn't apply to DomU-s as well,
>>>> in your opinion.
>>>
>>> It's my understanding that domUs can never get hidden or read-only
>>> devices assigned, and hence there no need to check for overlap with
>>> devices assigned to dom_xen, as those cannot have any BARs mapped in
>>> a domU physmap.
>>>
>>> So for domUs the overlap check only needs to be performed against
>>> devices assigned to pdev->domain.
>>
>> I fully agree, but the assertion you suggested doesn't express that. Or
>> maybe I'm misunderstanding what you did suggest, and there was an
>> implication of some further if() around it.
> 
> Maybe I'm getting myself confused, but if you add something like:
> 
> for ( d = pdev->domain != dom_xen ? pdev->domain : hardware_domain;
>       ; d = dom_xen )
> 
> Such loop would need to be avoided for domUs, so my suggestion was to
> add the assert in order to remind us that the loop would need
> adjusting if we ever add domU support.  But maybe you had already
> plans to restrict the loop to dom0 only.

Not really, no, but at the bottom of the loop I also have

        if ( !is_hardware_domain(d) )
            break;
    }

(still mis-formatted in the v2 patch). I.e. restricting to Dom0 goes
only as far as the 2nd loop iteration.

Jan

