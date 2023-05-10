Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B42A6FDB46
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 12:04:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532726.829002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwgff-00042g-On; Wed, 10 May 2023 10:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532726.829002; Wed, 10 May 2023 10:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwgff-0003zS-Ls; Wed, 10 May 2023 10:03:43 +0000
Received: by outflank-mailman (input) for mailman id 532726;
 Wed, 10 May 2023 10:03:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WIjz=A7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pwgfd-0003zK-R8
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 10:03:41 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f05de1a9-ef19-11ed-b229-6b7b168915f2;
 Wed, 10 May 2023 12:03:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6961.eurprd04.prod.outlook.com (2603:10a6:208:180::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Wed, 10 May
 2023 10:03:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 10:03:37 +0000
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
X-Inumbo-ID: f05de1a9-ef19-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyViGbAy9CHoyJVnL/OTCv76F3eVvOa86rZFU9hOzxiSAEcjoSvfu9fThTwVUwUokIRdEkibzq8Gqcuea3Zl9D8rvmC0frGlIJVFRz9jMunCojHpCceUhXMpi88GYcoUad8IEwV+fLGNfeD6XOsjLJQPAsagYk7meqji57XjPRoTliJEoJq+WmF6XEmPNaLUyDfKB7YprxqUVQoPm7kLDbqTJnwGNvr5PYr1Uz+7cbGiKxbDHis9tbd6ncef04/vYzHFISH+uA4FzfGoOjszRuKo3UTQGhZlx03XnkIfBG2on3YrEUrKtbVoncd3QisGWRB23AGrQnUHNZnWVaxO5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIzG/InMionDYyknx2veYU+SReoQM3RQYUFC15PQg4M=;
 b=fzIliewcBLpcIhXOFWN7L05uwI8+v40F+gkYKqscRAFKTagRdCIRYRH/pF9pzGf5K1k5mxuL7Bc/n8fhQxcl1I8rPsKiF1ZFtydyIh1ioVHAoUvwPEjhORzf04dPyB2HtreOHhYsUQ53TSEQaHyzuAmmGNFH1ZTLE3I2tkQbpL8XDEm49A1uhaQoIkfNciBSert/0AVRw4R7PZ93LrTmVcWmJARaZfCCYEaOr9N49usdAuIhfngjhZkXfVA+Vu2iZJTzeBskfJxm7hCQV6W+lqxgztDrJbL/WZXE+UPtXQSeQeUg+zdmwGGIHnDh45v+cPw7lcbjQ4gFrI5ShH3rKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIzG/InMionDYyknx2veYU+SReoQM3RQYUFC15PQg4M=;
 b=waQ2R+x8FWhPo/s5vZ90CvFX8eBvSPRQVuo1CM2pg0W5GST2K6ECizAEqXVn+3wsy0Z3eFiCp+3TnaYnHsyOtHK+4QmKHq6mmFobXN1xiWkm4O301CLhYK8Z8OFvNGNC0kDzq96TjDE8nrF8WugMKaTNmSQ6O/0aEd8VMy/stLZFpPQ/eC8BtKxlu19bYjhXJEcahE5S+2OMhB0vQz/yXc9XJ09xP8mFePj5neiYBY/H/e9xmZbtqvRwAXVWykNDM3BPnd/tb7nf2oIrbm4tAIAiHB9inSeF0PwAGU/b85DGKYzcHhc7NVnDarkIkmo3UA8xeb665fcv44ULbZ6d+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3c633370-bedc-96d2-1a33-271c6588da30@suse.com>
Date: Wed, 10 May 2023 12:03:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] x86/iommu: fix wrong iterator type in
 arch_iommu_hwdom_init()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20230509110325.61750-1-roger.pau@citrix.com>
 <56c5d0f1-bc47-8824-9515-239647015d47@suse.com>
 <ZFtWc3ks5f0kMAQT@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZFtWc3ks5f0kMAQT@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6961:EE_
X-MS-Office365-Filtering-Correlation-Id: 55172830-4ed3-4182-c129-08db513dd28b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+zuebOjPhwYOcI9fcHfziBieuPP2IpcCTN0xJvi38VZw0eKVuJ1w50IdMe1WbMfVHn3eU1NAiclpmdcR/RiN/tUqkYKZ/lHcIk6nJdIrajbm96hP/Jenp3KKJWZIgwCSZI3kHSMQ6kKTUXIJAnDdoKglTBlkWla0bicFR1YGeV2yLOdDpH01YHmEbHWiBFWAA3TEvkfAkwnIbm6+BeGn7vqwn1O+WmP2RgAN0wXXWL9AH4Y+uWSaqY2H+J3U/uU89152wOoTUZSvcMvImGcXcHcQ4z3KaKZgOr8rkSazeUL5Caw/qrR3z7cLRLJPvdCmzw2buojf8klRHwLKMRmpWBo3nx8xoo0PcomSsZZuGTqCOL/I5WjSgV6skjKmwq3TnAA0xdxvDUIJSaNsyfAr6SG3ofxFqXtL3deBPUy6vNGxmyhedsJfEMyhcPuO/qWMCrU/MYbLxZfIAT3X4s7kM+3EBIiFwhHY+5Y6kHwogffVkgEmDVTaLpB2UwE6fVGMw/k+r/SzGWb2hlu4FAT+zbnexTXOWggXuw0MWPs5IH4k+9ntrXq+hybfwH/fjuAcLdtKYox06B9jJFr9GliPqgVPKM/sGwEV8qCX9H+TRBJ7HC4EG5UuLsCdqeeLi+tJrSw3EbNcTiAe9B9YA9Hy2w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(376002)(396003)(136003)(39860400002)(451199021)(41300700001)(38100700002)(6486002)(5660300002)(8936002)(8676002)(478600001)(316002)(6916009)(36756003)(4326008)(66476007)(66556008)(66946007)(2616005)(86362001)(186003)(2906002)(83380400001)(31686004)(31696002)(53546011)(6512007)(6506007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGk5VXJNUktuQWdUTTl0SW1kcWRrdDEwT0F0Q016OEovUWFKTTdoVk9VS0Q4?=
 =?utf-8?B?Ymk1ckduTTF2ZklCYXR1TUNhcTNaQ093WkZ1WnFTemdWMExOdTRSME9QaXBQ?=
 =?utf-8?B?QW5GazlFTGtzV0RtZ0thWFZBVlhJMGZJNS9MWHZTblFSSVprOUxEdFd3NWh6?=
 =?utf-8?B?a3g2UGxsWkMvRHAvS3RFWkJqM3pHOG5oWmxHa2w4Q3RrZnlQTUw0NXExTWVn?=
 =?utf-8?B?Q0ZsWXFkL3ZqeVBXRlhnWG1RVDVGN1Z3Vmp3b1VFWXhFMURkNUFaM0R0Nzc3?=
 =?utf-8?B?NlZJbTFsaE1HYmUxd0VVWUhoaUd1ekVzdUF0d2ttRi9lTFdlcTBQN1NqMFY3?=
 =?utf-8?B?UjdCSjFZVGJHWUxqeXU2OElHSFVGMG14NkluR3c1anNYQXppMTY3NjViSDda?=
 =?utf-8?B?TjVoRGwzSUUvQXp3b2tYeGdmNTdZQ3U3TGVwQzU5UFllbU5mcW9iVGowZUVS?=
 =?utf-8?B?U20xWWFvWUZ2dGJxREpTK0sxQWVueVpxdFNXeTY3MHJVeUpITzZ4UzRPZmc2?=
 =?utf-8?B?Vmp5SHBKWFpJM2EvV0t6YXhTbmZWUFU1ZTRsa1VjbDdQR3RDZ094WFBEZTFp?=
 =?utf-8?B?Z3BzOEhaVWJ3bDJLc0taTllYc3F5aFRHb1pZS0NZU2oyUzRmTndncWE5NklE?=
 =?utf-8?B?WWxkWndma1VHTitJSDBJRGhaMTMwbW9WSCs0SkY3MVozRVdjRi9GWkMrYkRh?=
 =?utf-8?B?UXQxMEdDZHdhYmZpSkQ4b3lYZWR3c09mbWUwNlZ4VlhlWG5NMVhGSHlxTWIr?=
 =?utf-8?B?MWF1MnREbmZacEZST2IrR3Ivd3VWV01FR2ttZzNWd3pLNlRVV003ZkcrWFI1?=
 =?utf-8?B?Z2NTQVk4TDR6N2RxLzd0MC9mUlNWdnh2MGQ0Z09ZQ2UrOGV5clZmWUZOSHpZ?=
 =?utf-8?B?VWZQektPcjhETEp6dlBYSmhRTHZMSUk4d0VKSDl3MXFWcUNyeThLOEc1b1g0?=
 =?utf-8?B?cEkrUUhKaXVDMVBMZWYxMzEwNDdZU29oaXFSK1ZqSGJaSzV6K1hrT0dScWV3?=
 =?utf-8?B?cjRLYjNmTG9Fakk5bGNISXpYdWNBQUVlTkVwazFHYklMT1FCSXpickcydFVm?=
 =?utf-8?B?cEpZL2VwUkRRbFNWWWNXd2VzMTJ4cUZBUEF0MERib1lUWFhjNmZDN1hKZW9M?=
 =?utf-8?B?V0phZTFyODVJWnlLNm5tM3dUNE93dWxydmE0VFd5ZDlPOUVkVW9pSENIQlpI?=
 =?utf-8?B?NXVLSjE3RkhZMFBqdFlTenA5TDMwMGZxRm5USXJxd1dGR3Vud0c3SjBMYllG?=
 =?utf-8?B?Z3d1RXIxMlp1czRXTk45ZElQN1NvcXF3cHY3dUJhWDRIS1Rob1NxNjJtYy9T?=
 =?utf-8?B?bXBBYjZaZUFDZDZwcTU0bG1HNFZIREpOdStYeU8xMFQyM0FySFQybXBrSEQ3?=
 =?utf-8?B?UURoa3JYS1VEWUxNMmNXa3VTZXEzMDU3cm1zV0RlYWUxMFloS2hmNmhpd2xT?=
 =?utf-8?B?cWlmb3Y3RXQxZHE0bENKRzlreHNDVTBRdUgvWE00bzQ0MDZwUFBlN255SFlP?=
 =?utf-8?B?QWJ5NUJzM1FIVGs2NU9haVV0WGIzU29ZNWUrektyNm8reGVqSHhvOFFpNnFK?=
 =?utf-8?B?TjYxdEliaVdIN1B5L051Q0VkRGFjMHM2MWhBWXR2R2VSOGVBTE90V2MwbkN1?=
 =?utf-8?B?dXFOZ0VGemoyWkx1R3RZSUsra3pqU3NUY0VqVEtFZXlYRHo1b2lyaGRncWNq?=
 =?utf-8?B?NkVxbEt4Y0E2b2laSTNNWGVVdkFjdEZ5S0s0blZoY2E3STBDUnpVVkVJbmU0?=
 =?utf-8?B?MXNDeTIrcUpMRDA0RFdSN2tVdEFZNEZ0cWUwUGdJVzNwSHArTktyVkx0VUdF?=
 =?utf-8?B?LzBENGlJUDdRUzFRU3YrTXR2Z1R1TU54UlB3YVppem9OSDEvbGxtaW1YUkxp?=
 =?utf-8?B?TThsOVpIajRSZUpnUncya1NmM3E2UjUyQkRIVlRkZCtLbEF0dnorSm41VW4x?=
 =?utf-8?B?VDZEY1JhVXUwNjE0MTZ0bDRWczRhTDdXU3dqeURvQjExZlhraUdYaW12KzMw?=
 =?utf-8?B?MVJZaTc1RllhTW8rbUYrelRKZEpjWjdvQUg4RTBSR1RtekphWFliM1FhYlpT?=
 =?utf-8?B?WWUxZkJFOXpsU09FQVlTWWdtclpEa3E2QkNkVHZDZTVmWVBhVWNCSHNOOXdS?=
 =?utf-8?Q?jAMpOLo7Oi02bl8L+9IrTNQCo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55172830-4ed3-4182-c129-08db513dd28b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 10:03:37.2163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 31AECp7XDGaiAqOWcQLVs24Y+IpIu3itEM0waYKlAFM5yyN+kPbv1YhCHtOi/j44dMmM23reKHA1iGVFQrjoAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6961

On 10.05.2023 10:32, Roger Pau Monné wrote:
> On Tue, May 09, 2023 at 06:25:05PM +0200, Jan Beulich wrote:
>> On 09.05.2023 13:03, Roger Pau Monne wrote:
>>> The 'i' iterator index stores a pdx, not a pfn, and hence the initial
>>> assignation of start (which stores a pfn) needs a conversion from pfn
>>> to pdx.
>>
>> Strictly speaking: Yes. But pdx compression skips the bottom MAX_ORDER
>> bits, so ...
> 
> Oh, that wasn't obvious to me.
> 
>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>> @@ -406,7 +406,7 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>>>       */
>>>      start = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
>>
>> ... with this, ...
>>
>>> -    for ( i = start, count = 0; i < top; )
>>> +    for ( i = pfn_to_pdx(start), count = 0; i < top; )
>>
>> ... this is an expensive identity transformation. Could I talk you into
>> adding
>>
>>     ASSERT(start == pfn_to_pdx(start));
>>
>> instead (or the corresponding BUG_ON() if you'd prefer that, albeit then
>> the expensive identity transformation will still be there even in release
>> builds; not that it matters all that much right here, but still)?
> 
> So far the value of start is not influenced by hardware, so having an
> assert should be fine.
> 
> Given that the assignation is just done once at the start of the loop
> I don't see it being that relevant to the performance of this piece of
> code TBH, the more that we do a pdx_to_pfn() for each loop
> iteration, so my preference would be to use the proposed change.

Well, okay, but then please with the description also "softened" a
little (it isn't really "needs", but e.g. "better would undergo"),
alongside ...

>> In any event, with no real bug fixed (unless I'm overlooking something),
>> I would suggest to drop the Fixes: tag.
> 
> Right, I could drop that.

... this.

Jan

