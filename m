Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDA470261A
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 09:31:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534573.831705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pySfX-0000tt-CV; Mon, 15 May 2023 07:30:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534573.831705; Mon, 15 May 2023 07:30:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pySfX-0000n5-8A; Mon, 15 May 2023 07:30:55 +0000
Received: by outflank-mailman (input) for mailman id 534573;
 Mon, 15 May 2023 07:30:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xh4z=BE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pySfV-0000k9-PC
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 07:30:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7d00::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bbf71ad-f2f2-11ed-b229-6b7b168915f2;
 Mon, 15 May 2023 09:30:52 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8068.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 07:30:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.029; Mon, 15 May 2023
 07:30:50 +0000
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
X-Inumbo-ID: 6bbf71ad-f2f2-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCeaeO4oWmINosBRzuxAyCfJI6uEjqgk03fAwabFsDENaRKQ1En7DRY6bPWVa0QVtIY7R/w/uQCrbg8rY8sFv3JVDjnNI849IVTSOGsIg33K5Cso04PbLv+WVkhNj2WFQ9hhIJvcP9rdGJWoXmz/2yHIIiQT4x9oZfL5bpIt0Y4yZOKuaQlTLwfvKLMz12c9w7WFnP1jOKqLsY0ud/yI3XDWOq4V2IHqO/pEMGtzrP5VTs+ic5tfoZ3Fk1NSwsbtv1D5aglLxYZMlA5cFHtdTRXbdpkoNZu7vI/hztxiE+ad5ug9Q94rq7AZkXaJdAV+KJtSYNji30o5jKso+/eAzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDofIGobZV3ZfZtNUodE5fycUG4IC6S48IzkCYA1KAY=;
 b=FiIRiunyfnuxm5XX8q74pIetpzY3+kzMewRjHDZ1I+kOTxpdCyi797S/jHUF61DCtSJfQ8chYT8n8EorTxTK1EfLi3ykOecnFmRJrQ1l+7byC+wzUgsiv9budY6LOuDMQkL8bnsOtydNxOXm2nj5zFEHGKubj58ciGtEuAzKhnasxwAXFwjQZigIApWRUwNMhLLW/RN93cpFWNGy+EfBqcMlqc6Xgs9075g2IqGv816WfXwKyp+/MvpZ+HUvO9T/qJXw1BPO32s6+hs+jRdtkjcDlvD7+ZFZPXKCpGYazy/2mkFTXgzDgzOLUJ1BasNHdU0qYi3JT0PCbl2vHVCT+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDofIGobZV3ZfZtNUodE5fycUG4IC6S48IzkCYA1KAY=;
 b=luMccrqeDmXgqEzF8zU4uUxHeHtWgBzRMdpt/Sh94u4A2ddmuZDGRu7lVNma75sMtLfQL2lTinJgMCFhGGjo2B0t99Y1aeW/qemLLjH6+hIx1b8feovrkEarjoSmX6HDHrx6brT5DTufj1tN/DXwTrLXd9kaguSSzS9YndDjr5tMPK5dlN8pYCqKgdFcI2uOt9LI5Wo5FIjKJx8QRKeHDdp/gnyWTVpwl93tmGkjQbTz6kzQDVxjYk583E1rmsi35bZpD/J7HJontbSplPdTel5wgnDYL1KhuAUjCwD6BkkTuDfbvmFOYZYlgAm49wQeN+p0ywvD9zs9r+Q7taE04Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cdb08ae5-1cbb-ac43-67bb-0c73bde7f479@suse.com>
Date: Mon, 15 May 2023 09:30:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 5/8] pci/arm: Use iommu_add_dt_pci_device()
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230511191654.400720-1-stewart.hildebrand@amd.com>
 <20230511191654.400720-6-stewart.hildebrand@amd.com>
 <61ae93e8-ac8f-b373-4fa7-0a8aeb61ef4f@suse.com>
 <f7d78b4e-3a16-d342-59d2-caa4d2b75b9c@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f7d78b4e-3a16-d342-59d2-caa4d2b75b9c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0023.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::36) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8068:EE_
X-MS-Office365-Filtering-Correlation-Id: 01a622b9-848f-4de6-7bba-08db55164ec7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CSoXzY4dSEVBT5BhiQCrdCrJg3zAqVpqmFwq1HCqYVspZXmQlH1cxoAQb8v6JRLtQoja5Gb0RwOpzW7rWe7Cz9DrUBTjESiY0wyxK2y3e1vYj2nON0865KsbtBY8tW9bTn87Kf09BvmyRmsgAQcxqQ99zNN9ZgMo4sCtMCFLm6IjnCCiKJP62EtZyagZC9qupaE6UxArNN0YHhggBhQwyUfBB8HAWqCX+6LsE8X7gHj8WMOC8A2Tbmq/9yuwdGtF9hKx/8jFSxoeFmk9kT8TihNKlsHdLg0HSNwzo60ZnspD65eSNERFNTOwnbdrlNOrTPweXWLUPQwqIUvgv3125VeQp+x1lxWFk+5zRqpovCheeji81sS4aXWDO5AGDd4RkZmaK2XDipS0MZp2TIswSXtcqOOhlxFxXpZREsSOIxLefTmg/RuCAFWBo7tb3i8ruBDq6Z3wcK8AAYNhor2k9aZABIsjH4E2LQFT/QryDI8tkIj7nOBk7czKGZKXhSvP4Gyf2312QOzlJ1gK34IFPYzVwDk4EtrRCphuhGDUrNymR3X55WzrjCaS8TPj1g9oCzVdEzPFWw0wET3hvij/A1GTrfCGmZL1XUgt0jemhFQMSY0jdT+/NMYN/1GZOaOdIxu0ckHUHzz+/xLl9iqeeQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(39860400002)(366004)(396003)(136003)(451199021)(31686004)(66556008)(6916009)(4326008)(66476007)(478600001)(66946007)(54906003)(6506007)(186003)(53546011)(6512007)(38100700002)(2616005)(36756003)(8936002)(8676002)(2906002)(6486002)(316002)(31696002)(86362001)(5660300002)(41300700001)(7416002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVM4eDVrakZGZi9CK2VBbWxlblV4WW1GanNLUEVINzJsUm1XMk5PU0NhZHYr?=
 =?utf-8?B?cU1sOWw4VktheGh2anhSTnZ1cEw0c05EODVleTdVZmRXUVJGcVlxUlorTlFt?=
 =?utf-8?B?bXFzM3NkV1JlNjZzUzJhWHBHVVF0aXVvckw4cDczdFZrcHcrdGQxM0hCcy8y?=
 =?utf-8?B?T3ZDeGwxbG13QTRUM2lzcHEzaUZjMXkrVGx3ckNqbmRWWW5wdUorclpXSE1C?=
 =?utf-8?B?Uk9NWkc5M0REWmtLeHFkY3dsVlBCTEtPeGpJSU5kQ01JUnhSMUJDSk9Yam01?=
 =?utf-8?B?UlNXMkQ1THhjeFI0QmhQUlVCcjNkV2owcjRFckNHMGNFVU44N05ySmJQaTIw?=
 =?utf-8?B?bEhkSDUyenZpamU4VmdLaEd0dElvb29wNXpWSzQwVFZ1RXJEbEF1SkF0dVND?=
 =?utf-8?B?N3drTk13M1owS3gwZUcxcCtZbzJkeWVYMmJzTERVQ01sOWVPZnlaNm53Q0tE?=
 =?utf-8?B?UzduclZoclRabWptMkRkV05LSlcvRWpaTmZRWThVM0ZCV3ZIbFl3cmpPTFJB?=
 =?utf-8?B?K1FsTXpVRG15SlVldjVoQkh1WFpnM1NuNEdkL1VkQWJyVGtnTlFtdmxDV1dJ?=
 =?utf-8?B?TEVuTHZCWWVkTFFzOVRXdlM3UnptSy9mZ3N2MzNLbHBwZTE3SW81SExlQzVz?=
 =?utf-8?B?TDJUZGwybHp1Mi9kd1dDaFdVOGovMld6MlFNOGpoRTZLc1RVajRFYVNEVFIv?=
 =?utf-8?B?WWU0akVDSktuRjQwdTRweWdHbDlWOTJ2blZCMHF1eHExU2svaSthQzhROXZj?=
 =?utf-8?B?QzJwWnZpcm1Ydng3YVVwU3JDMGlhejZuSDVGU2tzNnZTN1d5bE1jYTZLYVBL?=
 =?utf-8?B?MHFYMG5rbDlZTWZINVlYQzFhV1NYa0Z6RURrekFOMTZVbDRGZGg0OG9WNlVq?=
 =?utf-8?B?Z3lnbENCTkdHdnlwYkcwVUZrM3l3VVVVZTEwa3ZCNUJOM0ttaWd3Z2tRbzNj?=
 =?utf-8?B?Tk1jMGVzZldPZW5ueHNOdWpLM1crM3p1cWtXbDlvTFFBTGdFamcyVGFTSG96?=
 =?utf-8?B?YmFjVEd5WlcwWnVWeUtzT2hHdVhEYjQ3SFErUmpZVWk1T01zSVFPVS82TWg5?=
 =?utf-8?B?T28vQS95c3V6NUxCSEE4SE9lcVJpRTIxZ0RWcWFMVTlCd2RaWE9TcURBZWRG?=
 =?utf-8?B?QWQzOTVwZ1RKZWlWaTFJNEt5UE9ya0luTGl4RTdrWS84L3FJcTNibThBOC9M?=
 =?utf-8?B?OTJvZnVDRGtjaUNleWdrUXNxY1lFMWRZVXNxR0dDQVpkVjlvdlJ4ZXRsdkhU?=
 =?utf-8?B?S3lNbytsbk1vTE5rSk1Sd05VR0JndHFnZUs5dGlhd0VFNkJCK05FeWR6MmxY?=
 =?utf-8?B?NHZUR01sOUdrM1RJSEN5NCszZVgzTTMvOC9kSDJ1K3BmYnNpajR2VW4xN1ox?=
 =?utf-8?B?Y1Y0VE9wR1JmS25mbU5vcHdXS3VHcmlMRzVLSjBvVTlWQVFlb0NMN0pmK1VY?=
 =?utf-8?B?Ukp6aUhiRGpoSWVlWFc5cjVkRTk4TVNEVk1vV0NVUHpiSWpxY3VCdmhtYXFm?=
 =?utf-8?B?NlU5Q053UzJGQ0dDd1hWLzlqQ1J1SFNzdXdtZU9CQWJhK09xaXl0ellJTTdj?=
 =?utf-8?B?ZExTR0kyMEJxNlNTUFoyNFVEaEo5dUlWMDZWQk5WeEMvVjJkZThTdWxNVm5T?=
 =?utf-8?B?TUc1ZFdMSEZhcUk2b0M1bmJBWXJnbDVzQU40ck1rZmg1VmVNQmEvNjhrUzdk?=
 =?utf-8?B?VU11UE5Hd2dXNjhCeDI2NmFsazAwQWVMM2N6OElNZnJtbERkTnMrYlF6RUpK?=
 =?utf-8?B?Y1U2SmpwaWsyN0ZrKytvdlN2MWZoNm16VjljcjN5T2pEWmJYTXRJd1FYeUY4?=
 =?utf-8?B?T3NBS0Y3Uzh4N3RObG5KRU0wYkczdncyM0h0RW5Nb01YdjZreWVVdkpCaG1S?=
 =?utf-8?B?a3lnMjJYZm9RRmY2YzlMYnY3eE5mcHF0K2NzQ05kckZlOVNucFJ2ZlA2dDJJ?=
 =?utf-8?B?b25udHRBYjJuNFd5ZUg0dExybDZoOTBUdzlHZjd2TXMyQUdHSXRPMkYvU29u?=
 =?utf-8?B?YytJYnIvenBFcFpBaWkrVHVOSTY2VHNWYmZEcjBJNUR1cy9KSmVqMFhNNGg1?=
 =?utf-8?B?UHd2d0hmTTkyV1Z0OW84WDNuOHdJWXZYdU9CL2lOUVNkMlR6RllaSDFhT05y?=
 =?utf-8?Q?VkTj842C6QuSn09M1MGZx2asb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a622b9-848f-4de6-7bba-08db55164ec7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 07:30:50.4008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /5Llqd/tAt6sFFt8m7nB/raLtse34GIjmX9AlyVk5gYyGHRm6v7Tlac2Epr0KEUmzwLmthXCIwSQmyl34g98uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8068

On 12.05.2023 23:03, Stewart Hildebrand wrote:
> On 5/12/23 03:25, Jan Beulich wrote:
>> On 11.05.2023 21:16, Stewart Hildebrand wrote:
>>> @@ -762,9 +767,20 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>              pdev->domain = NULL;
>>>              goto out;
>>>          }
>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>> +        ret = iommu_add_dt_pci_device(pdev);
>>> +        if ( ret < 0 )
>>> +        {
>>> +            printk(XENLOG_ERR "pci-iommu translation failed: %d\n", ret);
>>> +            goto out;
>>> +        }
>>> +#endif
>>>          ret = iommu_add_device(pdev);
>>
>> Hmm, am I misremembering that in the earlier patch you had #else to
>> invoke the alternative behavior?
> 
> You are remembering correctly. v1 had an #else, v2 does not.
> 
>> Now you end up calling both functions;
>> if that's indeed intended,
> 
> Yes, this is intentional.
> 
>> this may still want doing differently.
>> Looking at the earlier patch introducing the function, I can't infer
>> though whether that's intended: iommu_add_dt_pci_device() checks that
>> the add_device hook is present, but then I didn't find any use of this
>> hook. The revlog there suggests the check might be stale.
> 
> Ah, right, the ops->add_device check is stale in the other patch. Good catch, I'll remove it there.
> 
>> If indeed the function does only preparatory work, I don't see why it
>> would need naming "iommu_..."; I'd rather consider pci_add_dt_device()
>> then.
> 
> The function has now been reduced to reading SMMU configuration data from DT and mapping RID/BDF -> AXI stream ID. However, it is still SMMU related, and it is still invoking another iommu_ops hook function, dt_xlate (which is yet another AXI stream ID translation, separate from what is being discussed here). Does this justify keeping "iommu_..." in the name? I'm not convinced pci_add_dt_device() is a good name for it either (more on this below).

The function being SMMU-related pretty strongly suggests it wants to be
invoked via a hook. If the add_device() one isn't suitable, perhaps we
need a new (optional) prepare_device() one? With pci_add_device() then
calling iommu_prepare_device(), wrapping the hook invocation?

But just to be clear: A new hook would need enough justification as to
the existing one being unsuitable.

Jan

