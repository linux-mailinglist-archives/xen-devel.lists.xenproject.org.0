Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3F244E420
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 10:48:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225039.388650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTAv-000546-8J; Fri, 12 Nov 2021 09:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225039.388650; Fri, 12 Nov 2021 09:48:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTAv-00051X-4A; Fri, 12 Nov 2021 09:48:49 +0000
Received: by outflank-mailman (input) for mailman id 225039;
 Fri, 12 Nov 2021 09:48:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mlTAu-0004Mh-6l
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 09:48:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb51e27c-439d-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 10:48:47 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2055.outbound.protection.outlook.com [104.47.9.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-dBZ6JrT9NTOwvvUdyK3rtg-1; Fri, 12 Nov 2021 10:48:46 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Fri, 12 Nov
 2021 09:48:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 09:48:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR1001CA0042.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:15::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Fri, 12 Nov 2021 09:48:44 +0000
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
X-Inumbo-ID: bb51e27c-439d-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636710527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7FtwyADRDx+mGc76WSsZhGw7jgd3KL9ZVlpKovmy4Q4=;
	b=Vqs6MSUVe1p1BT44ln/TsWvA+xNe0hDM8MyRJflc99xxzR9zZF5ZwqoJ0wE25ju3m9RBwH
	sl5elpeVhwNVGNQfsZOJzfns9Mecx6GaN2Hbm2xMHlSY7j5Q9dkUE74kyMxZESD/eEpB+D
	ZUlc8npyq10i0/HfHWbFfIvQeZRynrU=
X-MC-Unique: dBZ6JrT9NTOwvvUdyK3rtg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4DFr5BKmlXnAyIJG/YHcSUdlcRfbVNwW3lu1qkivLxFuxIUfIJVidYPvVuvIvZzCVxbXgRA6Dp3JosJYunXLsALnJi27hqmhFrndnxTx/32ykoqWOBCKUNCB+GGN/3t5XXepC1/13tDuKv9yHkwKRA7TkfB6gtQb+x7deDcsDwBVNdjW4bzKZW8goHEaN7rYj3u1V0POvWO8cVQcbZuP6eYonI6c8QlOYbPJt2Yj/AdOKI5g5oyWoBA6UWrz3N9E+PlUjH6vXIg9y4mc2cXrHSA471aPVY6AIw6ZPqfBT9Of3Lylb69/NrOkEYFqjsr0Fn2U+MFNnhkzvbBj2A8fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FtwyADRDx+mGc76WSsZhGw7jgd3KL9ZVlpKovmy4Q4=;
 b=RJozYg7RCivIdFs94DHiSK8ApqSIl2dR28dwAcPtE4CfTN+M8mKCUqYyixjHuWYk4Ki/bKm90vLysJdSYHdQ8kE/mLG8RFeOdhZ63t7kuIjckZq/K0ho8E5uaHVt5jUT+0TVjXrfeUaeTMv4hyi04RP3Ned9wU89leM14cmkIAd3fwc8/sH4qWOjn16fzfJiCgXn8nXa/hEfB0Nwmz1dUg0cOSNx6cU7ERMDqgjytJ1s5JD3wsUVXB0MnTqJmDuV+KsEQykwWiEpHN0stll+jsiNT3S8w30HJbikpDtkCS1T17cVdOOoJE8dpeb3IrvOCjArcSNGL7nX06OUo4I8Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d4ca5274-dbbf-4cde-1a4b-0d7fe294c360@suse.com>
Date: Fri, 12 Nov 2021 10:48:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH 3/6] VT-d: don't leak domid mapping on error path
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
References: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
In-Reply-To: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0042.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08fade5c-8977-4cca-4029-08d9a5c19e2d
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2335976C51D59ABDF7F6C396B3959@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:639;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ddTZL7lK2pZfRou+xY6cP8jdZdR6zJ2Z0tMoxvccI+38+hvFDfFFXajAXd0sr3wcWe2dv0b9za/hiq7ofBIegU95fZwwoOvFFvaHYoyKAqs9I9ubZOIFFAGwMIXyocyzccvw3N9ue6e07r4DcnukhyDorgWymZqZrdXr+iIAmAPm9FLDpFfULcJmJik+NQ0nmcIX0Npy7Gx4Ak1bjBy7WNSAFe/l7XRiY82osLf7SBB/2NSGWELHpZnJWQa8ljKQWPrUYOWdMVJOECxeZxHFO7vmcldIQJYWhd8H/p5+2bzVNIO6c93JMT14//A6h+4cPkBiCemAA/5MqjlOGZcGVjtIe+p/GS9dWyK+hHiYw+oROO69Cqfi+54Y4dRIYoc6OOD/IsQFLSim1r/tMOM3AGbgfjxldPv/1DJTZ/jq442JJqDvn0zMAL3vtiXow7W8JVGiwyX4NMvI7NFDiM+6aRdkh1c5ujYMsub3nl9snkqqyRQwLNaONnliNql8nCMh6naB7M549CDZrHAvRVo9tamZHkVG4qKzLNCLK7b1ZFW35AgUAegh3opDWssM2ZRNOQgUgUTrTw0JcX0zYWhhnP8IJtDyYQVpU493i/FHJi17SEsoUGOOkG+qVLY3qlsTEa6fus4oJghro9ln97Dhgd8+kDcbVkjt0VAt89Pus9FlB53MAYLT9hHkgiUsRdfaM+7gg2v+pNEhYMQaDE3xGeKzn6iY/5DVswgyH2D4uPk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(4326008)(16576012)(86362001)(956004)(2616005)(316002)(186003)(26005)(31696002)(38100700002)(66946007)(66556008)(66476007)(5660300002)(8936002)(8676002)(508600001)(6916009)(6486002)(36756003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVpjYTB5VU9JK3BaSmh4OHkrVlJkUFcrTDBxWmlrTDdJQTEyamZIYVdJRWQ0?=
 =?utf-8?B?UDZJYjROMHg2Zm1ITG5tdHllVTRhM0VicXV1MXZDNm1ZSEwwT1UrMXdaZm9z?=
 =?utf-8?B?ZEJNNUpWODlQWTlsc2JRMVBodTdEcUJBMHRTeDgxVFU2eU8vNHVXR3Vody91?=
 =?utf-8?B?NUxvK2hBa2M5WTMySDYxbzNTQjRXWXNzcDh0RW5WTDBxZXR4dk51YTFQd3pz?=
 =?utf-8?B?U3F1L1hJUzk0TTlBQ1c3bE9pekVUSjFreXRRbUZlTjQrcFNxU2N3bWttSEZo?=
 =?utf-8?B?TkxnOTI2WGpFb2h1ZFZieXdGci9qMngraWVtRlBTV0NnM0lzZ1NabkV1NVRj?=
 =?utf-8?B?RVZnSUVvOWpSWnpuM1owdkpYT29SYUtTNTB1eTB0Y2x3RTFjVDk2VzRnOWoy?=
 =?utf-8?B?TVFQdFVpYXBhVmpwQks2dlhHSkdYbmJJclgxcnNPaGpKV0NLRGxtUkVxMFhi?=
 =?utf-8?B?VUJ2SWRjVkx2MVVQdndIMEhXblVEK3pudlBmWjJTazlWbzk5SWtqWE5MV0FI?=
 =?utf-8?B?Y1llU2tucnVSNXdscGlaN2x2aWgvL0syK1gyWXZNU1NzeEZSMmk3SXJQL1V4?=
 =?utf-8?B?VTV3RmxvbktITk1nYlJtd3VBMVhFUkNGVFFzWGhBQ2s3OEJBV0JKbDNDSCsr?=
 =?utf-8?B?OEVZMHViWkpWWHNtTHZtUUFWbWEzV2pYU0V3L3gxVk00ZVAvSzNwSmlUMElz?=
 =?utf-8?B?NURzakFSSzlzVmFpMS9maC9SVUE0aWM4MkJQeDlxd0FYTjcxYVNGWDExT1hZ?=
 =?utf-8?B?ZmszSEpGR3loeGpSWUhaUGxoeFV0NFlYK1p2ckVycGtDVEcxRmtSRGI2OUgw?=
 =?utf-8?B?QzkraEg3SHo2ZGpPSVhhYWRVSUtjY3IvbEdHR3VzTTRHOWNhZGFTMnFpUGNI?=
 =?utf-8?B?bEpmbnRaOWZhSnRyWnB3TW83Q1FNYWN6d2c0ZmJIY0hESDhDcjNEdkJMV2ZF?=
 =?utf-8?B?NmEzd3AxVE1GTi84bWlYdDVFNk85U1R2MWNqUmZ4Nitxdm9XSXkrWENDcm91?=
 =?utf-8?B?QUFhWnRzRkh0MkhESWEzZHMwVWtRVDU0UGxNSzl1OCtPeXArcFNoUU1RRnZh?=
 =?utf-8?B?dGx6YnVUcHdLMWozZXArV01qNWxhMGJUaTBZRGl4Z000ODFER2E1S0cyeXp5?=
 =?utf-8?B?cFA1NlYwRGdZRDJkbFBkZEVzR0N0bFgvemk4dmltQlNlcFhuWEVnNkF3cGpw?=
 =?utf-8?B?VlFGVmJidjBxRFB5eVY3c3VHTnppRXAzeFdZTnppNTY2S3NiVFV5L0pJcUIv?=
 =?utf-8?B?ak1TUHZhYS9lUGVqMEowVEtFdzBOMkQ2NWgwS2paaUNMemgzbnpjdENuY1hr?=
 =?utf-8?B?VXFPYUQ4dG15ZVIzbWFiZjB2QTcrMTcrYXlBaVprc3hrR0ZYVFVuMFVRM1Ax?=
 =?utf-8?B?RVlrdi9heEhYTE44T1NIZ1l4VnBhNk95SURoako0elhibWFjbWZXRG9yRnpE?=
 =?utf-8?B?WTJ4VGRLSHFVR0h2ekx0RDJocGRqeThlbTVkWk1pd3krN2J6dHpiV3hJdEdq?=
 =?utf-8?B?eS8vRHBMOU1mTWhZamRSYkd5dnczdmttSUJQOE5XSVBqTldNUisxODJ1bEtL?=
 =?utf-8?B?SXpXejIrazlxQTRMTkx5UTlEM0hGSWcrOGEwRVlaMzkrcGZMc2pzdHFaazhI?=
 =?utf-8?B?VnNhMFhJSkN4N0RXQmdVOEFyRXZRc0pKVlI3blBzc0V0QWVNVzFiSzRFd0hN?=
 =?utf-8?B?RFdqUW03TDdyNkJDdmxaVlFGVDJCcUowaFcwU1VBMThvUmZRK0doV2NCcGNM?=
 =?utf-8?B?dmdZMGtVU05ZbHJOQld5LzJwaXNlUVBWM21mQXpzajRFNWs1aXpKR0VUTWxU?=
 =?utf-8?B?SzEvamozRVlGRGtTSHB5ZkszZ2xSdjViaEFaUmcxRXZiS0hDblhHa3plM2w0?=
 =?utf-8?B?aGhlSWM1UWExMXJFQ1M4UGY1MlZFd0ZqTTlleHp5TG42aEFYZ1BXTzRERmFS?=
 =?utf-8?B?OHEzTmV0VUJ2QTB2Y2gwUzdWQ3pGNk44YmR2Yk1nTDdkSXVuclhrTWl0NWRz?=
 =?utf-8?B?aTZ0SVhkamtoVWdPd2wxTWI1a2xCUlVvdnJ2U2hDbUh2Z1RlajUxSkpTcnB4?=
 =?utf-8?B?VTNkOXU2cmxyR2tpaUZGRGhlYUlVOFhqUlBEdTlMelR4b1lUWlpKN1V0cUt1?=
 =?utf-8?B?dFU5MCtSZXROd2NuUWU5bndxakw0bDBMN3p5RldFU2VJNUsydy9MdFcyY0Ji?=
 =?utf-8?Q?vYmrpZRbgHG++CHSBsw2buU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08fade5c-8977-4cca-4029-08d9a5c19e2d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 09:48:45.1732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dOymVuW6wZ8cwDZpJSwSYwMbDmLoGpEdGBkkmD+RahwYN0dIo4+VdPwvkINE51AG1eW/LXnMzJFZapw80eP/uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

While domain_context_mapping() invokes domain_context_unmap() in a sub-
case of handling DEV_TYPE_PCI when encountering an error, thus avoiding
a leak, individual calls to domain_context_mapping_one() aren't
similarly covered. Such a leak might persist until domain destruction.
Leverage that these cases can be recognized by pdev being non-NULL.

Fixes: dec403cc668f ("VT-d: fix iommu_domid for PCI/PCIx devices assignment")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The Fixes: tag isn't strictly correct, as error handling had more severe
shortcomings at the time. But I wouldn't want to blame a commit
improving error handling to have introduced the leak.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1518,7 +1518,12 @@ int domain_context_mapping_one(
         rc = me_wifi_quirk(domain, bus, devfn, MAP_ME_PHANTOM_FUNC);
 
     if ( rc )
-        domain_context_unmap_one(domain, iommu, bus, devfn);
+    {
+        ret = domain_context_unmap_one(domain, iommu, bus, devfn);
+
+        if ( !ret && pdev && pdev->devfn == devfn )
+            check_cleanup_domid_map(domain, pdev, iommu);
+    }
 
     return rc;
 }


