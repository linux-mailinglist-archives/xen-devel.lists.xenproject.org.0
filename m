Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BEE4BF6E9
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 12:05:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276683.472927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMSyg-0004SS-05; Tue, 22 Feb 2022 11:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276683.472927; Tue, 22 Feb 2022 11:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMSyf-0004Ps-Sa; Tue, 22 Feb 2022 11:05:05 +0000
Received: by outflank-mailman (input) for mailman id 276683;
 Tue, 22 Feb 2022 11:05:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMSye-0004Pm-PE
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 11:05:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48df10a7-93cf-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 12:05:03 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-pYqfIgL-NZ-b7zKN3zcM3g-1; Tue, 22 Feb 2022 12:05:02 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4056.eurprd04.prod.outlook.com (2603:10a6:209:4d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Tue, 22 Feb
 2022 11:05:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 11:05:00 +0000
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
X-Inumbo-ID: 48df10a7-93cf-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645527903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FvfCc6pd7XsMdZa6RKY+0prVe21M3C3KKFxAYVblUG0=;
	b=LeguXT6l6FmQ3U/CbFgMMlq3lD2k9smdjgtcYXTec/ms1oaMwRWyTyQv8J843kBmoy/GY2
	fGZ4fKHlQ1ifKFPM1l6eCSTbr+7JBIhEWMlvJECvC94DoCnqjy62lhG5NRnfmsbZEyyAE1
	DMqiLHF2bz6AJN0UQotZb2nlK5Ci/K8=
X-MC-Unique: pYqfIgL-NZ-b7zKN3zcM3g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZxebqtGCwZHhaCYDD4lDUjJ0aiP4StSRUqIsKPP0/zkIajg6IMsgsYSMzbwTXGVwRLP4jLGCb7fWamRcKUrv+ZqhR8PhR0UnvzUFz2TU3amYMTs2EZZOFhKeuKOsoqz+hS9buHlylf5nTtS3f+LRcZUT6+IVsKBsAmABqkBb9t2oRVF30T+P/igNHVLQQ5D0/mZdp1ElXaFZyE4Q1ebIlFG+ET/yQIfS1fftkqwdu7MgtmowgnViPQPrryKl2MKJslLJcBk988BbkzZoT4Py+ZXlhpUFtH0KvL9SicZX/jhBy/f2xLtf9tUOzdRbw68N5Y31Wr/U2NeF4WB8PstfxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvfCc6pd7XsMdZa6RKY+0prVe21M3C3KKFxAYVblUG0=;
 b=JeN43FGpmTqoitdLIbgNBgCYLLe9Ri0EaKDfmskqAF9pV7H8i6UTY4oaZ8l8VfULxDaqUKathaTjvTNYMicyyrUZ1EOBQyfSc43hzsOjdwrUsd6QxEJZAQdIhMhkB1BoqSZ3kxHaXjW0ZIdorcn3/bRGI7QPQxy1Q5KY9DNmP+iLYypVF1HtlqXRnWkNQDUsf+ObVSp4i0yQtotvjeHq3P9k9akYzHrqEJjSt4hQQHyyoNynNQ7A/KniF+e0wazms4MVGx6wclT/u2ICcEhCUKH2f7lHs3V9BIbCImRhVKNFZo09ZGMP92tZzPyaQ94T1apNywp7VG5BjFomD2cKdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <83fe9ea7-7947-9cc3-4e38-4d66fe428a1e@suse.com>
Date: Tue, 22 Feb 2022 12:04:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2.1 8/7] x86/IOMMU: Use altcall, and
 __initconst_cf_clobber
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220221180356.13527-1-andrew.cooper3@citrix.com>
 <0c253fda-c5f6-b7ea-df6c-8b43b86c6a59@suse.com>
 <9e442a8d-ef71-3776-e655-8c8a226af706@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9e442a8d-ef71-3776-e655-8c8a226af706@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0004.eurprd07.prod.outlook.com
 (2603:10a6:203:51::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91518122-a287-4437-e412-08d9f5f32b99
X-MS-TrafficTypeDiagnostic: AM6PR04MB4056:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4056047DBF2E0D66103B0932B33B9@AM6PR04MB4056.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KT03Rp15z2QzUpTfklYGxUeGABF0Lax6LPXXGkT4Aa8IeKw34e92ztluO9MIEGCA1C3TSXDr1rfOqkBhPXehWrMlsdGhyRcemJ4WADc+6fQstiwo0/SQZoGsnXhs9uGP4loDdVKVRlzumgsVCPZSmplZamgu88vtGCw01XR7p43tNkeMAzQtbtEsfp+Og6a7pxgwGYk//X3FPK264s+1J7LfLiWEa7ScdGf0JU0AI60hpSXmJRs3vDLkeKWrGIzvStPO8R2OjjyIaxmw40L3K9D8+pbQMWxv91bHWrW6K1H2+fHrxPXrFlt8olQxdqoJG1kKSova3Eev6/jNM4A2tXLM3mWI+6XiS9+dRa9n6Yxi5MRP3zYbyzTBmOvb0+dtuM4O9af4NlECk08jNRzmjkAcPliXMy9AfKpP9UacBpmf3AcsbVeHE5aiIQZUFexncg+bYYkl9QYiQt3K30UseO/2DZtfZdkrpfpaXOVrXISDas2YY66KtdgHTdV9Dm+9qmIqpC0FGVErVux01RU2yE2CHLSeHqiG3AHC9cB/5qhulEVjjptw1AzOS6D7/tBYiB8Wubjs0RCV7o/zU2GBzitX41Azcx426MuRuFIDMEb9ek9Gk9UglIddogwN2o5W9GBi7Ww0I6UsYqKvnK1Nei3FJUA1QVKRehEflbto9UwyqNQsTEsfW2W0zSvf2sbMzUoEqsRXvNkwB/szSSQ0LtOOCvPXuJebhuyT42J5zEWTU3rZPqMNrh7Qbym83S1O
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(38100700002)(86362001)(6512007)(508600001)(6486002)(6506007)(2616005)(31686004)(31696002)(26005)(54906003)(186003)(53546011)(66556008)(83380400001)(5660300002)(2906002)(8676002)(66946007)(316002)(8936002)(4326008)(66476007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUo5cWRoR3R2VjFadURaL2t4KzN5bjVsZG9ENHFmRnEwY095TGlOOFBDVGhT?=
 =?utf-8?B?eEp3dFRCcmpabDlBTEpXUHQ3SjlEMEhJL0VSOCs2ZExaZEs2ZUJHd2xKdUs4?=
 =?utf-8?B?enh4MldKTDlVQzd0Sy9sYWNueGYxR3JiMW9kSDRPRnNuVENFSHFPR1BEK0ti?=
 =?utf-8?B?cUlYM0hyTlRpNk9PNSttWmNjamw2S0hvRGd4bDdTc2NMTVFxVGMzSGcrYmFz?=
 =?utf-8?B?UUZqeVFLaVMzSy8yZHdFd24wSFJ5VzJJeU0zZEY5WnU3UVpTUVg3QUZGYUZ4?=
 =?utf-8?B?dmg3NXJuV21OLzBldDdJNVAvRUhES09Tck9iMGxvRUl5bFJ4ZHFiZnZHSFRk?=
 =?utf-8?B?akNuMVB2cjd4TTU1NjdWZ0kxOGxaMVFUNThkdlFpcmo4RHh4VWJoTGdwY25C?=
 =?utf-8?B?ZGxnU1dPb0pYcGNJZGRZSUVpQ25qMXhKdTd5bDFPSGducktlcWs3TnBJNGpm?=
 =?utf-8?B?elZFRWFabVd0MXc2MFBHbUl5RlVjL0R4ait4SldweVNDcjBWTHNvZEhPQTlZ?=
 =?utf-8?B?bGpYeUNUL09sYUN3K1QxaDdEQWZRd09uRTFwclh3b1BuTXlYYnF3VlV5ZUlh?=
 =?utf-8?B?MzRNMFByeXo3eWs0UmZSR0Fkd2cxY0w5UjBVcmE2bVFvK051ejluRlNPOFRC?=
 =?utf-8?B?dzlteHlwNnE0U3o2Y1FORWZkd2Q2Z0d3ODgvNUwrOGFVQXhiSnU3VzU2NDkw?=
 =?utf-8?B?VmhmVUJVaEdON1JSYUhOdDREdHN2TVF6L2E3cUxtSmNhcmY1VnI2K1o3ZkNk?=
 =?utf-8?B?ZDhvcE5ibW9CdUtqcUNWYldmQXJPamg2TTh4b0oyVmtwTmZnSXVsUW8vNU04?=
 =?utf-8?B?NHVCWGFIenhXTXJyTk5KWDAwRXBYNlNKdCtveXVsM01oTlRVaHNVSGJVcm1q?=
 =?utf-8?B?SEFGYVFGbjRpRWZ0VS85d1o4ZythTHIrYktVb1J4K0tNYmFnNEFITGJBU2k2?=
 =?utf-8?B?RkY1WUF6Z3B3YWlKWG5IUzVkMHhuY2M4K3ZqVy9ucUtoaCtVc2pGZDF0UG4y?=
 =?utf-8?B?TlRkdW9TaGt0amQ2TzA5YVNYaDhXWGRwK2JZZ2ZjUFVqUnF0UFZZMm1CdE5p?=
 =?utf-8?B?bFZIT241OG5HM3lHN0g0WGZGYk1ycWMzelBRVUZER3Bad05DU2RvSHA4bzF1?=
 =?utf-8?B?azh4N2dhU0NZamJCOHA4U3o2M1Axb1NVeXk2VmJnZXgweDEwaktQYVFLMHhr?=
 =?utf-8?B?Rmh6SUJlNStwbnh6aTVVQXlkTFFSbm0wWThNbFFKTnhxaWpIQlJPbVIycmQy?=
 =?utf-8?B?T3UvMklhZTZ0SjBPN0JtVFUvMEVaMkxoWXNDLzBuUDdWZDU5WWk3MGFpYVBw?=
 =?utf-8?B?cW1uQW5hdzRxNE4xTWNMWHo1em82b3dXeWdEa1BsdlZLSHNUdCswYkpSSGNm?=
 =?utf-8?B?cFRGQjlobzM3QStYZTZ6QUF0S3piSGJaaDdzcFhJeXZLbEJsWUpBSFZ6V0xs?=
 =?utf-8?B?Z2p4bjl4ME9VNjczb1lqM0VWcWVsdWNaZXBRaWlpcmt2TS9QSElyeE9LaE5P?=
 =?utf-8?B?U1lQa294Nkt2czhNaFJLMFVRVUR2RS83U1RyZFlVUlk0NVd5ai92RVZ3MUkz?=
 =?utf-8?B?ZHdGaWVlSnR4cUJ2dFh2TmxXSXlUTUdLZUNid1FJbE8vQm9SckFCWXZXWkFR?=
 =?utf-8?B?WHVlMjJyTlNMVFUvZmpUMmxSWDdSdkZod21DVVMwMVZncWh3QzhtT1BCNUFP?=
 =?utf-8?B?V2pDVzBsVXlUb3pFcXRqdGFJYUYvc09QYUNxQXozVWNpME9XN08xaHpJYTFm?=
 =?utf-8?B?ZTgrazliZm9jZHdvSUFhMFVielJ5RFFyUjNXMzIvaXFVTGRDZU9GUHZLdXd0?=
 =?utf-8?B?TnhRUm9NaTN5Q2s2Z2pSNHdYaWFxazFiVlBxNGxGZlRUVnFwODZELzM4M1BN?=
 =?utf-8?B?TGxDdWw2QUQ3TFFNVE92cmlucnVBY1Q4SmdIY3ZUaXRMclEwWW5HMURpSkhh?=
 =?utf-8?B?TWkwczdpOUlNblh3anBJVDRSRkFzbElKMTAycUlQM3BaOWkwdkdUNnY0R1Ro?=
 =?utf-8?B?bnZhRXRnV2NOZVJzZFFRWkFNcHptWlFEQWg0T1dWWHgwdXdicU41S0tWcHFk?=
 =?utf-8?B?WWhhV1NpSEtYRE1zT09sUndhOFBYb1ZNRnZNUjhsaHdvUnJGRzk4TjBOMWtS?=
 =?utf-8?B?bm5VeG5GMFBiYWRRSGpBS3BoNXJwWGhsUFRTSWNYUW1jeGRxR3laN2JHRkp0?=
 =?utf-8?Q?67b938Hbjeo1N4k7GvOvteQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91518122-a287-4437-e412-08d9f5f32b99
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 11:05:00.9186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPpcDISdVU6hgVAENk1M9L/6wwCa6BX+HRk56TLebSht7Y3sHv2a8Kw82c1n/qVgUvSN+0WUdURH5T4PDe5d1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4056

On 22.02.2022 11:54, Andrew Cooper wrote:
> On 22/02/2022 09:29, Jan Beulich wrote:
>> On 21.02.2022 19:03, Andrew Cooper wrote:
>>> --- a/xen/drivers/passthrough/iommu.c
>>> +++ b/xen/drivers/passthrough/iommu.c
>>> @@ -540,7 +540,7 @@ int __init iommu_setup(void)
>>>  int iommu_suspend()
>>>  {
>>>      if ( iommu_enabled )
>>> -        return iommu_get_ops()->suspend();
>>> +        return iommu_call(iommu_get_ops(), suspend);
>> This use of iommu_get_ops() in such constructs is a pattern we didn't
>> have so far. Perhaps it just looks bogus, and all is fine in reality
>> (apart from the whole idea being wrong for Arm, or really any
>> environment where multiple dissimilar IOMMUs may be in use). Or wait,
>> there are pre-existing cases (just not immediately visible when
>> grep-ing for "iommu_v?call") in iommu_get_reserved_device_memory() and
>> iommu_setup_hpet_msi().
> 
> I think this means your happy(ish) with the change?

Yes. It looks a little odd, but since we have precedents this ought
to be fine.

Jan


