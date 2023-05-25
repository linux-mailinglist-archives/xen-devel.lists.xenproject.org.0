Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75363710FF1
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 17:49:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539743.840925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2DDP-0004an-Rv; Thu, 25 May 2023 15:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539743.840925; Thu, 25 May 2023 15:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2DDP-0004YM-OQ; Thu, 25 May 2023 15:49:23 +0000
Received: by outflank-mailman (input) for mailman id 539743;
 Thu, 25 May 2023 15:49:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q2DDO-0004Y9-3d
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 15:49:22 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b656cf67-fb13-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 17:49:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6776.eurprd04.prod.outlook.com (2603:10a6:20b:103::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Thu, 25 May
 2023 15:49:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 15:49:17 +0000
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
X-Inumbo-ID: b656cf67-fb13-11ed-b230-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNgFkT1SzOoyT95EcCnb05bN7foeUUDuAwA9nZ/h2yt5EXxcFlV8ZccfJeHVJqAI0A3btie7OmVMOUV97Mrd8htjm1W7q6lPJG0mEZsKOJzZKzr0BVMgeTS4RJtH6/3fewdFj9S/v1mQjw32UBwsK1ixDf4MKoB/swhIySp59lQmQFp2eSjhjb7y61dliXBjoHOGTXDro+p81CAXF11vPBNZ78fVBCs95YagSaWi9xvQcJFz5gqLaOM0x1H44MsdY11jsVD0OWSK7faDFg7/vm6qgVTy63AQi+1v7oJ523mEaJstYquK46HRU9/NSxN1w+Jbt24KIun8M9LD9HtDpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5pWTeVq/v8v8pHXg8YXid1x4BnzAHHD8VkxfAd2QbA=;
 b=nsIciXUIw8lyiEkG2m3KiVLkcDmtr14Li+qZ/HFKO/ySm9IiCDJTTd2yHqY3gmB6c2kb8MrIpBSAirPKrMSQ5KjjN4iLY/t1eSk/vfuurYdqPFFOoMZfXz4mjQdoVm2N1pc/3NnsNL4ESYhyPWOT7EJlnK2682bjyWiGzzGWiQysCOobP+0Sw2q3wjs/DsH3wx5U/epADSrql/uvBgcIkgFxmge2d4K7UGNpmuI3fEvQ2AKfCP3RwR+KLPkLJ08Fzgsq2O7x7hj+5qqyn713lqmjrlcSsB5nvB3QoUZLAmsj8njUITnY8MKC0VJv4G+fqTomQrsmmMGtwqlplQ3yfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5pWTeVq/v8v8pHXg8YXid1x4BnzAHHD8VkxfAd2QbA=;
 b=ZNTCWyB2+VgvD2Rm7JUfm+1w526vSKPYt6hwMC6B0QcopmCewPkCi20oGJuoO79wmq0NTZrBu4Xy8TBAdh/f1tgWx9/HSjdO0EZjktb2kPYGDOp2+HXX6UHXX5OLL4ikVp0O7QL5xXCo3REKmiRzO9kJQYmk19b2T2KonaI4tR9gGLRsnSkkyzQPWxNt4DGmD17l/KZPn8tnM2oHsm5Xnv/ChSKKQkV4GTsxfM0PEcbi5SvmXLGqlt9KD7xpVjyc9QdprzKxqjdQhtH9BvOfwXc93FVEb+XnFnJzLsA/3Dhi5p1U3fvxoYak56ch6TO3iLw2CfMBSNNWKPYbzsFZDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <210e2a81-45a9-50e7-b37c-f4b0d80d0e95@suse.com>
Date: Thu, 25 May 2023 17:49:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v2] vPCI: account for hidden devices
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com>
 <ZG4zx+TvUWTCEMh3@Air-de-Roger>
 <2b1b1744-2bc3-c7c0-a2d8-6aa6996d4af9@suse.com>
 <ZG94c9y4j4udFmsy@Air-de-Roger>
 <cedbc257-9ad9-56f1-5060-eaf173d45760@suse.com>
In-Reply-To: <cedbc257-9ad9-56f1-5060-eaf173d45760@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0270.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f8bb3a4-c1d7-4fcb-34de-08db5d3798fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FeBpvbpXAV+Bh33p5m1zF7YjSBmfuqu5/wCKElrMgW8JxrlNwfsOQQmYd4m6Isn7/ssPQQeWHAye9PDpqvYOaaZ1JSOdPJ9oFtBr/weII7ugor7OqdbTu3H/wml8RaYVqc4MqoEKrRL3FdHxyr40f3fy2b7Ay5e0pM5SyJh7uH605DJOeHs8RheeZK/25G8a80zh1ME77atR47gLQaDol2CQt3r87ZJtuAl9JFIKSePb4/d6toxEF+1RXneNCb8tuXyxwnENV8SB+K4VL2mCbynHzuO98C1i4ZwczpvrScK/+zWQ/c2qSVw8AatwSgOpiyl7s+wjxkYuh1GHX+Rxz8dqvKPBtlOLaWg99+MyEgUiwmBRtW982X2vPL8fxqu6YZAtLod0EWI+oPLmdsR0cg26LExUf7kqoweR5jk/EuYLive0qmX2FjMtg9eqkztCyQSGG5+ARUUzDo+8xHvNxLn/CuBQ+d4f+FD3Oh5PNploCrRELhwYCisulqomZklN/aBM30YhiCOfS7C0FTk7g/YrRJQ0cmErNRiyLBjK+eLrUHEyA6hmrqgPW8p88Bs6Cv4555mtKIwwtZVEUZtuqZrqB0QOsUsyqbIkfEbLSwpLKOwlj4FuSpvrxYyaSh+aD/PtAr60wwvZXQNSm+ihYA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(376002)(366004)(136003)(396003)(451199021)(316002)(54906003)(31686004)(4326008)(66476007)(66946007)(66556008)(6916009)(38100700002)(6486002)(478600001)(41300700001)(8676002)(5660300002)(86362001)(8936002)(15650500001)(6506007)(83380400001)(26005)(6512007)(31696002)(53546011)(36756003)(2906002)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlZwNjNuV3hMOGNES3FJb2pVbTZyRUZ3b0Nxb2RVMUVZbk56WmY0ejdNVzg3?=
 =?utf-8?B?alExMGY3M3NzQWZNb1pDN3FGSWJOcVd5d0N5b0w1dGRKWnV4MG5paFd6Nnc1?=
 =?utf-8?B?SGpTN3ZsL1ptMkRvS3RDZmpDcTZWK1pjZWdQV0VjT0d3bE1ZRU45SllSdWd1?=
 =?utf-8?B?UmlmSHlYaWVWMXY2cUN6N0lycit4VjlJd1JHL1VVTm5aOWw0ZUZKWjA0c3kw?=
 =?utf-8?B?bC8zR0EzR3ZjeEVabU9KSklsY1FSenZ3L3ZoZzVNbVpxd3FiVnZtR2VMdVlK?=
 =?utf-8?B?QmRTWDh4UnBObFYwbUdiMFptV3dCQXBsRUYrOGZzYnRxajFJZGRNTWlLU0VY?=
 =?utf-8?B?aGswaEtaWmpCMUpYSEpYYVEvQ0JiSDBuQ1M2eE5oOEhhVFYvL2FUb3h4ZG5X?=
 =?utf-8?B?d2d5UTZzSDJtYnhpYm41VTN3cjZGVS8wYnRYMUhsWllZa2YweFdmbUQ2N0h4?=
 =?utf-8?B?N3I0YmdiVEsvVmcwc3JZWmxHUEdpbVpGb2Z0Q2U5RGovNlNxWXJidDNmeFor?=
 =?utf-8?B?V040eFA2MklpeHhHVzFhWXhnQWJ5MUdOUVg5UmVnZXU5aU5QTkR0WTUvOU9t?=
 =?utf-8?B?VkVQQWNrWFhqTVlTSDQ2QXFoTHFjWHdQdGdPYUR0a3pxT3NFNXJWdGJuZ29u?=
 =?utf-8?B?MDVSL0NTMTNLN0o2UjN5STVCTW01cE1GN0dQNjRCWEFrYnJOY1hTc3VtS1Nw?=
 =?utf-8?B?NExuOGdUR1FjOS9aQzJzSTByWkpzc1VRNmJxWHRzSGN5V0JBemd5VGpEY2dR?=
 =?utf-8?B?aWIvVjhYcUtoQkdrTTBjaDBHaEpIbnowRFVkMjZLK1ZCL05UMUNPZWpZRkZs?=
 =?utf-8?B?UktlSUUrcHFHbG91VGRVOEUxcFZFc3Z2VDJxNjQ5MllENzBBZ0RyejdrTzNL?=
 =?utf-8?B?NkpFZ3NZYWZ0RWhQTHQ3WmNnNVFYN0VDUFk2a0RaRklXSCthRWU5WDlSVU5D?=
 =?utf-8?B?RDJBN24yYURJR21reTBXdThOREkreWprTUFOemU1dEhOenVwemxVY1hkb2RK?=
 =?utf-8?B?VitMYk9kU0M4ckw0TG93cml5aUpLcDVFeXBtOFlDS1ZzVGI4cmRraE9jVHpn?=
 =?utf-8?B?Y0ZJS2lsdmRBbVJST0x5aXRsSW1vMXVqT1FXeVFSQkpHMmFTbmthVmtoVzBG?=
 =?utf-8?B?SFBBTlQyTVdYSFJPellTa1ZaNkd1NDYwaHVtSjRXaktOTERybTZIQ1RqbDZo?=
 =?utf-8?B?ZTI2bGRxbXFIUEFYVmx1dTZ1b2J0eGlTNmtWQUtQRkYxTHFTM29ESDBJL3lH?=
 =?utf-8?B?czI0cXl5WWJjcUdCVEZuMHZleVNpMCs2aGZ0d3lMcVNsS05hVWswTmV1ODRI?=
 =?utf-8?B?dmxBRmp2cTdEcGNpWU1KQ1dzbEQwNUs3Wm9lWDVIVW0yYkpLZExvSzB3V2w5?=
 =?utf-8?B?N0pPK25FZGVTbHRGTkZlTGg5Q01tSUZjOGw0UG9LTG1VK1dGc05tUE1yd2Vn?=
 =?utf-8?B?T2dDWGFHS0RpNXN2bHdCeUtZWTNSUkpVS01xSGJReVo5NThYQ0NFaWNxWUJW?=
 =?utf-8?B?NkRtREVpYTgwNzFibXdYamVQR21QSTBIUTM3blluL3BrSFFpRU1VNnl4ZXFM?=
 =?utf-8?B?OWV0UEUrU0w3d1FKRTU5MXFRUEpUSUZCTkxHMk9IM2k1NlVOZG9QRUNvV3BK?=
 =?utf-8?B?OWVyTWtLalhMcEtWc0dvWldoMmZJQjcyb2VPc05XUERnZEMrOGVzQk14KzMw?=
 =?utf-8?B?RXZTMWNkbGlwa1Z2enVJcHY0Z0RTMW16Umx1ZXFramNHUDBKdWU0ZXA2d05R?=
 =?utf-8?B?UkFqSDhoOHFzV2k2bTdjRHZaQk9hWUcrcm5xRmpnK0tRYVo0dnIwL21YM2R6?=
 =?utf-8?B?SkFsNnJNanVWRUVuOXhlUkxNTHYxZnhoRjdCMUIrSVUrZ295cUJCWUF3ekVB?=
 =?utf-8?B?dVdLZDdIbjJ5K3hRTjd5WEFTczhQcEVJaG9NQTlicEg3MVlKelJYWVRrc1hp?=
 =?utf-8?B?RmZFcVFsZkZKeWFBcm00TkxMWWYwTjBwUXZHWGFEbGRKVUxCRDJOTGhBclVp?=
 =?utf-8?B?aUdQdXZWREdDQWhDNGlqbEROWHJuTHlpVFArbUZKaXMrRTFqZ1NYdlphWWR1?=
 =?utf-8?B?ZnFOb3dMcGRQcnduOThsV3FIOXB1S3Y5cnE0VGZPbkt0ZEZmcC8xbFltWmxI?=
 =?utf-8?Q?dHDrUDATOprMr/wMIr+aXMx2r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f8bb3a4-c1d7-4fcb-34de-08db5d3798fc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 15:49:17.5610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gmscC2gx9kUTQEEfcoK+qPmXquypRDDXymFnmGUddYWxZxqt6kBr1ri+PuQAZsvFsCoPCOqln01GS6Ply177Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6776

On 25.05.2023 17:30, Jan Beulich wrote:
> On 25.05.2023 17:02, Roger Pau Monné wrote:
>> On Thu, May 25, 2023 at 04:39:51PM +0200, Jan Beulich wrote:
>>> On 24.05.2023 17:56, Roger Pau Monné wrote:
>>>> On Wed, May 24, 2023 at 03:45:58PM +0200, Jan Beulich wrote:
>>>>> --- a/xen/drivers/vpci/header.c
>>>>> +++ b/xen/drivers/vpci/header.c
>>>>> @@ -218,6 +218,7 @@ static int modify_bars(const struct pci_
>>>>>      struct vpci_header *header = &pdev->vpci->header;
>>>>>      struct rangeset *mem = rangeset_new(NULL, NULL, 0);
>>>>>      struct pci_dev *tmp, *dev = NULL;
>>>>> +    const struct domain *d;
>>>>>      const struct vpci_msix *msix = pdev->vpci->msix;
>>>>>      unsigned int i;
>>>>>      int rc;
>>>>> @@ -285,9 +286,11 @@ static int modify_bars(const struct pci_
>>>>>  
>>>>>      /*
>>>>>       * Check for overlaps with other BARs. Note that only BARs that are
>>>>> -     * currently mapped (enabled) are checked for overlaps.
>>>>> +     * currently mapped (enabled) are checked for overlaps. Note also that
>>>>> +     * for Dom0 we also need to include hidden, i.e. DomXEN's, devices.
>>>>>       */
>>>>> -    for_each_pdev ( pdev->domain, tmp )
>>>>> +for ( d = pdev->domain; ; d = dom_xen ) {//todo
>>>>
>>>> Looking at this again, I think this is slightly more complex, as during
>>>> runtime dom0 will get here with pdev->domain == hardware_domain OR
>>>> dom_xen, and hence you also need to account that devices that have
>>>> pdev->domain == dom_xen need to iterate over devices that belong to
>>>> the hardware_domain, ie:
>>>>
>>>> for ( d = pdev->domain; ;
>>>>       d = (pdev->domain == dom_xen) ? hardware_domain : dom_xen )
>>>
>>> Right, something along these lines. To keep loop continuation expression
>>> and exit condition simple, I'll probably prefer
>>>
>>> for ( d = pdev->domain != dom_xen ? pdev->domain : hardware_domain;
>>>       ; d = dom_xen )
>>
>> LGTM.  I would add parentheses around the pdev->domain != dom_xen
>> condition, but that's just my personal taste.
>>
>> We might want to add an
>>
>> ASSERT(pdev->domain == hardware_domain || pdev->domain == dom_xen);
>>
>> here, just to remind that this chunk must be revisited when adding
>> domU support (but you can also argue we haven't done this elsewhere),
>> I just feel here it's not so obvious we don't want do to this for
>> domUs.
> 
> I could add such an assertion, if only ...
> 
>>>> And we likely want to limit this to devices that belong to the
>>>> hardware_domain or to dom_xen (in preparation for vPCI being used for
>>>> domUs).
>>>
>>> I'm afraid I don't understand this remark, though.
>>
>> This was looking forward to domU support, so that you already cater
>> for pdev->domain not being hardware_domain or dom_xen, but we might
>> want to leave that for later, when domU support is actually
>> introduced.
> 
> ... I understood why this checking doesn't apply to DomU-s as well,
> in your opinion.

Or did you mean that to go inside the if() your patch adds (and hence
my patch won't need to add anymore)? I didn't think you did, because
then it would rather be

ASSERT(d == hardware_domain || d == dom_xen)

imo.

Jan

