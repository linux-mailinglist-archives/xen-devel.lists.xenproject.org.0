Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DEB3DE6EB
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 08:58:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163272.299115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAoNE-0003iI-F9; Tue, 03 Aug 2021 06:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163272.299115; Tue, 03 Aug 2021 06:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAoNE-0003fp-BC; Tue, 03 Aug 2021 06:58:00 +0000
Received: by outflank-mailman (input) for mailman id 163272;
 Tue, 03 Aug 2021 06:57:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mAoNC-0003fj-5O
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 06:57:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06903cba-cfe9-42a7-8f9d-70d66faa9736;
 Tue, 03 Aug 2021 06:57:56 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-KKD6tIRUM0C-fOdhJI8jVQ-1; Tue, 03 Aug 2021 08:57:54 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2333.eurprd04.prod.outlook.com (2603:10a6:800:28::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Tue, 3 Aug
 2021 06:57:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 06:57:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0016.eurprd09.prod.outlook.com (2603:10a6:102:b7::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.21 via Frontend Transport; Tue, 3 Aug 2021 06:57:52 +0000
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
X-Inumbo-ID: 06903cba-cfe9-42a7-8f9d-70d66faa9736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1627973875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DDOJD6ysxFaxuiOooFdk4/TKPo2IFXQAkBP5yX8zKi4=;
	b=fuJSwEk+j1l/hQkoMDQqPl32zeusKOKHe5EoqBd18tj7ENv6W6s2+GKRJCLQQeo7CNHb6W
	EOI+2+1SjmkJfgdtPi3VmZ8EMExRAkZZf8Nkdcjr6jN9Gj/ouOXeodm7apOqPAcnP75t4V
	cwIx9G2vbL+Yw3Q8OgTa3/BuydSA8RY=
X-MC-Unique: KKD6tIRUM0C-fOdhJI8jVQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VvBDuFjm7asv52KvGuB8mvrSEpOj4FPNNmj+4NJM5Xkm6HwQChCpodAXyN+EDjHyZplsaA+B8lBhuvXNQlo4jO8jb1Uk9LNJOePAHe37UtEckzG0qKCanAH0NYcfn/1gtra1WPI9qkiwhuDFxRek9VoyDiXhaa4qko5g3xnp698lt8mLSqICONjA6jp9hOdAu5vVShkZgsUmpE70bSpvtowD/KyMTAbXox7eK1VBZkrqbmXJ35GaTiRgZ4Zh0/w0hVxfYXqb7xXQX6heRDxhGC4tCXRSZE87GSyk2dvBXMrAYdQI6mULV/j/3ZXkcttk7IjAV/rRbPa9JSkwKjoYqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DDOJD6ysxFaxuiOooFdk4/TKPo2IFXQAkBP5yX8zKi4=;
 b=mmeiPx/BHky4+1HsgP+/OVQmlajkNrYDlhEgMbB+llfTUiuZSgH7SKiTTmHK6J86dCAXNsuclft+H8xXtbcFCJY3xv/sZ2XYGm06FLmnD3oTzPS9d0VLh+aR4/w+j7Yut5abmxeHIsZpPiF2O4X5U70P3HZp7Ulda6hJ9Si5+stlk/BXt0reMmmMssJq/ozMF+fXoUBizYTpbNmLG06Cy8BDiJqDqx/5g1EtUnOIxdoGTs+h2ddqKzrDntKHEl4v4ykGaqcsf/GiFr8N3px9BBAL2oPKakTmdTZNtDgP8g5H2+aD6Teh2VChRk+s/xNElR2Z7gRE5HQHpygheGXxcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v5 2/4] xen: do not return -EEXIST if iommu_add_dt_device
 is called twice
To: Julien Grall <julien@xen.org>
Cc: Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 rahul.singh@arm.com, brian.woods@xilinx.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2107221634130.10122@sstabellini-ThinkPad-T480s>
 <20210722233642.22515-2-sstabellini@kernel.org>
 <97f0713b-f6bb-72cd-f364-f0d42c868171@suse.com>
 <1df74545-d2fa-2d80-5246-a0b0158550b4@xen.org>
 <e262a28a-ced3-3097-4748-fe2b9efe08f5@suse.com>
 <f4bdbeaf-b432-5bda-28fc-c9358b26ab5a@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <165b7bf4-2927-6b22-34aa-cb44bf780200@suse.com>
Date: Tue, 3 Aug 2021 08:57:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <f4bdbeaf-b432-5bda-28fc-c9358b26ab5a@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3PR09CA0016.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48226060-a696-4cfe-4d2e-08d9564c03ae
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2333:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2333FE9EB76058DF0CB1063BB3F09@VI1PR0401MB2333.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bPV4dDpK1W0RApV+NJCZcMrF9+CRwmy1Gar+zGZTnCdhv+pAZElIMWW0UooBPwOkwEjqt/e364q7AO9Np6lJhEzPU16Rf2STOkYhaIFnn/oH0mdoE9cztslHoQh5q0LQqvSW/n8Bp4/Cr8oEx/jMjZuFLTKcIeDtnXYgjvtls8L+PTtt0Ma/1ZfeMDwWiCm1dl2wQMj03pVph73tCrg1pDGWI8enhFOrdJXKBTxCDPaOHyPAYurIbA2GNnwKdvIuDIdcREcMaHo84Ri0eDmXGmRJmgMmAE3UMWF0PL+TyJ3YShJdQVPV7Grl9g5hpYPQfq9BgUAbE/yF7IayyZS4D44JWLmQ3TJAKcYgYUvFnCiHejXP+VQMuHmQ/PUsW1nqW7W3wGEJZ+TKEkLUuDzfAcBwHdGMWZ19ksQHzqtOembjaDaTi33TvsS898PDDdpvqzpejZLVm1z71joz0MP/WJwJvJLSNEm8rDgd6lzfAtXdAoueK0E2BYxSVS5jlckjk4SxVsCUpeMeHC9OUZf0fK1jPCuTkHpYHZuk5L1Lv9GZA5UP85/jrteWE/PGums/LD/0F4U/IP3MmZZUCHsGyD24VlmV4G9PzpDHWRJeelX3P6YomXGy/6zvUMvRpcAtAvjsaB4iNQViXVdyqOl4x4L3E+k2YlDExe5cyG26du63JJ4sa2ts7u8QJ7FxHTLTDMtgN5AhIDZJG1Z2716tIV+bo4OxexcMKxD1f0wwmcw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(346002)(396003)(366004)(136003)(376002)(36756003)(2616005)(26005)(956004)(53546011)(31696002)(8936002)(2906002)(8676002)(186003)(38100700002)(478600001)(16576012)(5660300002)(31686004)(66476007)(83380400001)(6916009)(86362001)(6486002)(316002)(66946007)(66556008)(54906003)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2ZyN0FsaEtlcHBpK3FRYTJPZEZUdHFud0pEVWlYMjNZV2lMUXNIQ3dOODBZ?=
 =?utf-8?B?RmwwV1Bra3Ryb1pnVm82dkdNRHpJcUZ6b0R1WlN3ZTA5VlBHMGtMNE1YRnJs?=
 =?utf-8?B?bWhWWnBiSDdVQkVTWjlWdWFES2RnYjJ2RUwva0JxWTNCbGhoazdGeGE4RHIv?=
 =?utf-8?B?MnJZd3BNd0ZPQWI5RFBjREhicGV1UGlRU3RGczdpYjU5Z0tyS1ZubndZOVJZ?=
 =?utf-8?B?Uys2bXo0ZHhCYSsvdlpsNmlwcEJjOGh6TEpSd2Rub1d1ZHdoS2FHdmNRTmw2?=
 =?utf-8?B?czFIMVNGOGtjeGgxVXhFRmFuMXFQVkFPNFZkTUVMdzJiRmZNWUtZRkRXMWJz?=
 =?utf-8?B?anBycFd2dFhScnVRRmFHS0VMUm1zcTg0dWlwblM5b2RsTTRydDFQa1ZDKzYv?=
 =?utf-8?B?dWRseG9FVURRNzJKUWJKRXFRZkFRU2htTTJQM3ZHd24vS2kwNUFsaFRGcThs?=
 =?utf-8?B?cGpwbnFxa3Y1bjRaNld6VTVmR1gzQjVrUGY3dC9BODZRSmdnYkRrVVNSRjZ2?=
 =?utf-8?B?TmgrdTVFSHNxNlpnWTZ0ck44Q3RQNkZydXhPV0lBQm00ZWY2SUpTTGRDR0w5?=
 =?utf-8?B?ZGtNSDBSSUh1VDhoL1BVbkZxQUdwdkRTS0tMVy96bm91ZFYycitERnNnSG5T?=
 =?utf-8?B?WDlwMndmT09RbXFuVlY2QkR5Ly9CQ3pXeEovM2htMEZmMVFrRjNCeGRHUHJK?=
 =?utf-8?B?M1Q5dGJySzZmSzlWcFgxRldHQVlaR1pKQmJab3FEd05ZMS8rZDRVZTErQkpi?=
 =?utf-8?B?NUxTM1JRWW52N2RQUHIyL3RJdWdUQXE3cC9LLy9zSU90RkhSWldJTWQ3bzhY?=
 =?utf-8?B?TjFGVTlwTW5GK2E3OERML1dsQ2NuVG9YcWJoRCtNVGNMcmxadHQyQm00L1pj?=
 =?utf-8?B?UlZRWGpGZGk5cHJVOERoL3hqYStFWFV0WHlYZzJxL1U1a240SG4vL2djbkJM?=
 =?utf-8?B?dVdNUk5aYTBUTHJ5MWFwOTl1dk9aMC9jUi9mMzN3N2hhbWJMbSt1YmVzT3Qw?=
 =?utf-8?B?YVNDazJhZ0M3Qm5EUU1jazZydUNRWklxQWdTeEo1NUN1a2oxN1BXOEkwNUxp?=
 =?utf-8?B?QXdNV25kRlFTclRUMVpNQkNOeDBHTDYvZ0RFYk1iUVlvdzNnZkZReVBVTTZr?=
 =?utf-8?B?eHJCbUVwUGgydVZDZEUvSlBEWi96azVRa3RsMjNWSEN3T09sQ016NzA5WklD?=
 =?utf-8?B?R3dIWVRkVUxodjJVZjVnOWpYeFRsWGMwTXZaQTBlVmwzTk1xcnNpWXJNbkhL?=
 =?utf-8?B?ekdZWmxrWTF1M1AzY09MaCtibkhWMXQzd1Z6eUtXdFBZNUxxOVhad1lYcDN3?=
 =?utf-8?B?ME0zNzhnajIvR2FhbTFvenNVRjBUTWxVY01DWEtPZktBVy96bFAzVDkvNUVP?=
 =?utf-8?B?ZnBjeUJTajR0R3B4eWoxbmVuVWtvdmRIQXdsbUgyaUlJSUVmWUV5TzZPakhN?=
 =?utf-8?B?eWVkck0rRWZXcU9EYlFKYUphUytPTUJJb1JHY3dEcEV1UUhpMGNBZ3UwZTJI?=
 =?utf-8?B?bm5US2FIb3FTa3dZcHlLQVdqeUs3NnVXa1Z3ODBmSm11RVJ5RlJsYXJnMkhQ?=
 =?utf-8?B?Q0tvekJadzRGRmNYUXdSclhqamVQUzVHc1N4OGhNZ085YmNDRVViNFoyeU9w?=
 =?utf-8?B?enY0N3FLZkVQcFdQRWVYNHFZWWk3cHlvUmJnZ00yQW43TkdzNzAzRVhEQkZB?=
 =?utf-8?B?VDRwQUhlbHZPMXltTTk3TUZNbXdvRGZoTnBSakd6QkNTZFI1bTUwUHZ2aWNo?=
 =?utf-8?Q?2elI1EvKFzPQ8lSkZQEJzIyfOtgjBxQWYKD0TQf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48226060-a696-4cfe-4d2e-08d9564c03ae
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 06:57:52.9983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WY2Txn6wjxajkir2YOx0UNL4cxXX7kJmKIW4cywvcobnNaDXweSOS6sBwR9qYvA6qgQg8/iaJTGDZT9AjdHtng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2333

On 26.07.2021 17:45, Julien Grall wrote:
> On 23/07/2021 14:02, Jan Beulich wrote:
>> On 23.07.2021 11:28, Julien Grall wrote:
>>> On 23/07/2021 07:31, Jan Beulich wrote:
>>>> On 23.07.2021 01:36, Stefano Stabellini wrote:
>>>>> --- a/xen/drivers/passthrough/device_tree.c
>>>>> +++ b/xen/drivers/passthrough/device_tree.c
>>>>> @@ -140,8 +140,13 @@ int iommu_add_dt_device(struct dt_device_node *np)
>>>>>        if ( !ops )
>>>>>            return -EINVAL;
>>>>>    
>>>>> +    /*
>>>>> +     * Some Device Trees may expose both legacy SMMU and generic
>>>>> +     * IOMMU bindings together. If both are present, the device
>>>>> +     * can be already added.
>>>>> +     */
>>>>>        if ( dev_iommu_fwspec_get(dev) )
>>>>> -        return -EEXIST;
>>>>> +        return 0;
>>>>
>>>> Since the xen: prefix in the subject made me go look (I wouldn't have
>>>> if it had been e.g. dt: ), I may as well ask: Since previously there
>>>> was concern about bogus duplicate entries, does this concern go away
>>>> no altogether?
>>>
>>> The check wasn't originally added because of legacy vs generic binding.
>>>
>>> It was added because in some circumstances iommu_add_dt_device() could
>>> genuinely be called twice (for instance if the device is re-assigned).
>>> This was returning -EEXIST rather than 0 so the caller can decide
>>> whether it is normal that the device is already added.
>>
>> Okay. If that distinction is of no interest anymore, then I can see
>> this wanting dropping.
>>
>>> Calling iommu_add_dt_device() twice doesn't hurt but after patch #1
>>> (this patch should really be first), dev_iommu_fwspec_get() will return
>>> a non-NULL pointer as the legacy devices are added when the IOMMU is probed.
>>>
>>>> It's one thing for there to be a legacy and a generic
>>>> binding, but another if you found two legacy or two generic ones, I
>>>> would think.
>>>
>>> I am not quite too sure what you mean by "two legacy" and "two generic".
>>> Can you clarify it?
>>
>> Well, I'm having trouble describing it in different terms. I mean
>> two entries of the same kind (both legacy or both generic) referring
>> to the same device, thus leading to the function recognizing the 2nd > time round that the device is already there.
> 
> I think you are misunderstanding the purpose of this function. It is 
> called when we discover a new device rather than discovering a new entry 
> in the IOMMU. The function will then sort out what to do for the device.

I'm struggling with assigning meaning to "discovering a new entry in the
IOMMU". Otoh to "discover a new device" means the device wasn't (supposed
to be) known before, which to me means -EEXIST is appropriate.

> The legacy binding is somewhat specific because it bypass the function 
> as the discovering is done per IOMMU rather than per device.

Well, I then guess I'm lacking too much context here.

Jan


