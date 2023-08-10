Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5893777B7D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 17:01:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582109.911696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU78W-0006EA-9c; Thu, 10 Aug 2023 14:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582109.911696; Thu, 10 Aug 2023 14:59:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU78W-0006Bc-6L; Thu, 10 Aug 2023 14:59:40 +0000
Received: by outflank-mailman (input) for mailman id 582109;
 Thu, 10 Aug 2023 14:59:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qU78V-0006BW-5s
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 14:59:39 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2079.outbound.protection.outlook.com [40.107.7.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85480f6c-378e-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 16:59:35 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7345.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Thu, 10 Aug
 2023 14:59:06 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Thu, 10 Aug 2023
 14:59:06 +0000
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
X-Inumbo-ID: 85480f6c-378e-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMiA8hn2N1gF4hQnf8EoQYqomciQf7SEwDwC0/mS7Ht7SHufH3ZE32tgMgXJMzE7yfskRv3VVjZ4qwJMphnAKsWTvLmezqywM/lGLSA+z6iIUiNZR1G3T0JNHJxgX2IeBAQQX+cNurN5kZBHetfYldrmb/VfsZ5OC3SWOxQw46Og1aOIrZHeH9sd2yGaTOKhmV0fZt+O9uqpUEJAf5YO1jB3Vu2cUYflDrmfxAMtgZUSObL5f2IsDOxCrIPbeGh4KlQ6FUC4YV8MQo66hZORwABbohjlGp4xnd+tH0JnfOdvUdT2HdvkypNro0aob8XVhp/8NhPaBEp4UzDgdqrCdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rYYKw0tV9x7V2m5N+9V7884IoTi9TEJZdeF+fwU9UE=;
 b=fLt+kA/HKLYGnp7prdqwPmpdISmFoPM7uurP+ocxBGGUpB4oH9MVeCII3FhSaHP2Gt6X2+Owds82wIj9l4hNaK/AvWF2teXySxOEl2S1PNsSM8Vnm3phFBjZcauX7lzGg9sdBN/MIFc9/OdEEKjjmvP2UBuFyti7E5q2zdyZu10WtmFI+Bv4lMfCjAr142ZsMgFk94fNrnKujYayN+EalKbPIcAqiDndu1exwWwgQRDd35Xhx7ZJA6/Zsf7E/ZKhzVkY/ORPNVqV6tgVK5kUCj88Bi0yqn/HNBmzavd9vnfDAz7G6tYjV1j/HVtDOsIYBMCK5yjNMnZugDxx/fmkmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rYYKw0tV9x7V2m5N+9V7884IoTi9TEJZdeF+fwU9UE=;
 b=Y321hFQdcEsxCYqsELDJM2zptoAl49jhHSq5eu+3c+jDid1RHlgT+nguOkdQQk67m/fiL89SJg37qlPQDrscdiXY1X4fkRwqKHjsM+LwUP9tQDlrgmTDKLexNtj9vZerG6gHaTBKouGIqjysAhCDtkv6fZKgqs7fEDuCBxbNhIU0N+AEAq6c77D6tdiITDVXlanlC4JDQw1APiEaRn2UA6HJ/Xq4TJh52b/9Vk19aMVqqshiNqRpZFg0pXwBgQnwOgDI1oRMQuIOqV7nCFU3i/4g/WgmU3GBwuBbs1Nr7hUKvo/y45m0tReEBj/npbn75zs1LswzeB8Mhz5iaegWAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e3d3de6d-2406-0655-ea3d-49a50570256b@suse.com>
Date: Thu, 10 Aug 2023 16:59:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: adjust comparison for earlier signedness change
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::23) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f635905-d1ce-43f8-e4ab-08db99b25810
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p4IxJVVA6eiarLIxGXs1pXcleKg73lzsxcIvrL78LQy8tqSU5YTaV9MCn3Y2gLJlJm2Bm/6a8j2CbPcChhMAk+6ZDTNLANyMEToC/+3Ql5ncLBJo2oulY6zKnHKxOMIqu9tVGqPgzEitSdgLL4ZAsgHe9fwqYdjc2ShCsepRU5XNiJH1CZhtRMK2onYjOIHYNDqHnAe9KREVo1UjOhAxJixm/4xYRX788Jh7JAj92UfCcFLPXIYmbYjomnlJyzbOmSOwQKIFVT7zgxopt/bbk+BNkw2kp2N4m9QA7dBXT0r5V/R4UyFFzW717HXsS81Eur6KfE5paP6J+/Xm6cO89G+QWLbzEyudt4wDCIWxiOHMdq461li/tkmM41LxuLIABSp9d3EzdfhZI6t1G0TYAwSV5lWKL5zqMITmjg6z/FUCulqBaDwqnzeeujakIebQ9tP2qecWlHT0RSug7DDIDdZVMpPe67z9CUu6ZdQzIpKOYSJa9Gt5dy9n2GbGyaHunD/399qT7Ojs6nvzS3vBLh18q2kEkzWkV4+Erkf2UgA/nYKgAQBC9yIKwJS93jfVzIXa9qovV8oH4IkmC/yGfWIgvr7RaaVrpXSU0os2DFzfZa2ABYXJLrskxSxzXY61FuoQ6Gzxd+Mnhn2fm2Xu6Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199021)(186006)(1800799006)(478600001)(31686004)(6486002)(2616005)(66946007)(6512007)(4744005)(6506007)(26005)(8936002)(316002)(41300700001)(66476007)(6916009)(31696002)(2906002)(4326008)(8676002)(36756003)(38100700002)(54906003)(66556008)(86362001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXlFVytQQ1FaeVRPNERoZHpHVHpwMCtucndoU3k3TkRiSFRXczVQNHZvYzRh?=
 =?utf-8?B?OTNzWlg3bDBGeDkyNHR2Qk03UFJmT2VNQ0VjSFlMRVEyQXZqNTBMcU03MFNP?=
 =?utf-8?B?TUdlTEE4UUJBYjdWRStLRlNlNUNOQWtsVVdrejd0bXlOUi8vNHNocHB5WnFJ?=
 =?utf-8?B?V1g0WnRxMzNSOTNXSDd1QlM1Ni9OUTdiUTVXMDVpZGUzWFQ4QTNuMkdEQldr?=
 =?utf-8?B?ditKWUpwTTFtR2Q2MjFVWWFXdmtRTXJIVGZRblIrNFZlRGpQUGU3VVVkREdY?=
 =?utf-8?B?MmhQSjV6emhnWDkzMnRDNzgwSmhsc2g0OFErTTl5UUphSjUvV3h5MDE0WVBW?=
 =?utf-8?B?ZHEvOGpSUXRVRzFCb1FKNnpoMEF3amkvN0FqVjJRdzl1THRKcHlsQUFlS2ds?=
 =?utf-8?B?RFhtemV1VlZkL2RtTTk5NkJqQnFoK05sanFYSDMvK0FWaThEdnJmRSt6RkJP?=
 =?utf-8?B?OTV1ekNjdXp4UEV3K2oxV1F3TGllRnRLZHlPczVMV3NtbFAxNlEwaUJoQkdS?=
 =?utf-8?B?aWlFV1QzYm9scXhJWHpzVHArMCtVVXVacCtwR3NRY1BPREpJODFvTzhHQXh4?=
 =?utf-8?B?NGZFajM3UHZScWNqcjhRV1RLRys5U003Z0lBcVlzemRxbGFha0dBMmFLMmM0?=
 =?utf-8?B?KzZPd1E3MWhkNlF1cXlIOXpWb2RUMVpVTDZPZ2ZUcCtIN003THVDSTI0OUZZ?=
 =?utf-8?B?WDVPUHQvNS92QjhiUWc0VS8vbFZhcWs3YVNGRzBxTDFLNTJ3dUM1ZWlUclBj?=
 =?utf-8?B?S0J5NlVLbVR3d3hCQjNFMGFxY2hUTVYxWDFYV3FZNVVPSm9OSStMbXpHTW1o?=
 =?utf-8?B?VDlPdGJDaFhvU3RHY3RLNzBiOXFDcU5Da0JicWFwV0RxakRtMzdPc21RUEhz?=
 =?utf-8?B?c2lQMzBtaWMzRWo3N0tKaDZXMWp0bEZ4bGJMR0IwWUNXRUliUEtoU1ZiZDgr?=
 =?utf-8?B?d3VYbXpIRlA2YjBMQ0JPeHNqSHZqN1lVb3Ewd25YWHphKy92b3h0UUdGQlgz?=
 =?utf-8?B?cEs5ZU5UWDZpWVQ2bXVkU0RpSU5wb2ExaVhWY1lzVkE2NmYwTWlZRmcwVFJu?=
 =?utf-8?B?Z2YwODl1WHUwWlAyMEVENUZWTEU4Z0I3Ui9Qc2JvWXpCOVdCOGplb0YzNEx2?=
 =?utf-8?B?UUJXWUoyYzVkUTZCWWMvL2htVWIxeU1iN3dkSGFCYUlzUGpPR3dyNlVlTk96?=
 =?utf-8?B?d2R3OEg3a1c0SEVyRGNTYWVQcmRGNEpkL1RQSFd1UVJuUGtuelhkTy9yQ2FP?=
 =?utf-8?B?VkNnak1BbHZzQVlZUDJBeCt2cDlLdkQyMFRJZFVnTnNBT21SOVBkWGhwcDNz?=
 =?utf-8?B?V2xKQnFpQUdsc1pRRVQrUVc2dHU5YnVHUlBtaVJTUmgvUWRIZ2pLRDh2Nncr?=
 =?utf-8?B?dXpjQVhpY3lBWW1aWHVPMFVabmQwQ2pqcjJwY2NWdmJWWUYzZVJ1TVhULzAv?=
 =?utf-8?B?cHpWeCtEY3Flc1krTS9ZU01rYlFmblM1TS82WW0xUHVtRFJzUDhyZ3ZCNGlS?=
 =?utf-8?B?MTBITjlUYUkxTjU4bE9BRk5VR2dxeUk4SWtweU51ZUFtV21aVWYrK2V0ZWlS?=
 =?utf-8?B?TVRmT1RMRmpNdm52eHNOb2RjNEtXcmcwSmtlSFZMOWdhQUpTZzhZTzY0R1li?=
 =?utf-8?B?L1Q3Z0tRaGFQM1l0cWlvUFgwWmJjTW1YOVFEVmdmUkZRbkk3Sk1mYnJzeFBB?=
 =?utf-8?B?eWExWkhUeFVJT1JRbzhaZnZvZDVWUHNTWXpFNEgySlhlWmxteWtmVEZlRGY5?=
 =?utf-8?B?aFQraTgvZysvampBY256Y3RBbmM0T2dWOW5yMjlrTmtWb0VBdS8wVEJwbDds?=
 =?utf-8?B?WlhnZytWSnp2Y2J6bUpzb3N1MVdOem1Xdk1NTWdJcjZJYjdaZDc1aGFrYlBQ?=
 =?utf-8?B?K2poc1NRSy9Oc1JPNGMzV2dVUVFMQmlQdE82NzNXdE5ra1RQT1BMeWQrTVNx?=
 =?utf-8?B?Z0tIdFQ3bXBmMmdSQnNKam0yRWs2U0xJTVdhOUl4SlI2VmNvM2YrcE56TFN1?=
 =?utf-8?B?ZzJIZ3lhd29pZ25RYlkxODlENE5SaWhIeTlnQ0wrWktncGFGcGV3YnZMbXMw?=
 =?utf-8?B?bWNmVi9CUk5DMFFaZ0Fxa0dMdW9QU2VhdXZ6SU9MT0YrajVBRUV0Y0hYU21C?=
 =?utf-8?Q?+Rv7exulmtdesTGlk1vpFdveB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f635905-d1ce-43f8-e4ab-08db99b25810
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 14:59:06.6133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ljHh2pUN2zGJnNIh1tRdXIhpWnXjg43RmnmzsnBmHEPfztKd+Gf+4ftitmXBJ/f6OXItZISSOqtWAi2AOrM2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7345

Interestingly only Clang warns about the now bogus less-than-zero
comparison. Convert it to something that's more explicitly doing what
the comment says.

Fixes: 4086857cc159 ("x86: implement cpuid() in terms of cpuid_count()")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/intel_cacheinfo.c
+++ b/xen/arch/x86/cpu/intel_cacheinfo.c
@@ -187,7 +187,8 @@ void init_intel_cacheinfo(struct cpuinfo
 
 			/* If bit 31 is set, this is an unknown format */
 			for ( j = 0 ; j < 3 ; j++ ) {
-				if ( regs[j] < 0 ) regs[j] = 0;
+				if ( regs[j] >> 31 )
+					regs[j] = 0;
 			}
 
 			/* Byte 0 is level count, not a descriptor */

