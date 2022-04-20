Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03197508124
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 08:26:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308856.524712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh3nE-0008Sa-4t; Wed, 20 Apr 2022 06:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308856.524712; Wed, 20 Apr 2022 06:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh3nE-0008Py-1Y; Wed, 20 Apr 2022 06:26:24 +0000
Received: by outflank-mailman (input) for mailman id 308856;
 Wed, 20 Apr 2022 06:26:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nh3nC-0008Ps-JN
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 06:26:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb570ec7-c072-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 08:26:21 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-WJJp6WiWM9yGNgmjnJhg1w-1; Wed, 20 Apr 2022 08:26:14 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.19; Wed, 20 Apr
 2022 06:26:10 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 06:26:10 +0000
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
X-Inumbo-ID: cb570ec7-c072-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650435981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mE8ftP2l0OUfGr4rw3d+irpMjfRLgo/vGwXH8jh5ELo=;
	b=SBDWFj2QUppQ4VXshyqh8hd4wy4G88DSAAorRguN3PuF21UAZo741Et1/doc6fwXnAm0p0
	SoCWGg4x62hW/NHzPVo5DcurTPoH8xZ/OFeKqpzIpLS8wv3wHKmUzIsWEp3mAXt+B5u5El
	MJaJ4OW+g3D4DDZ8MQhN6jedhBpb81A=
X-MC-Unique: WJJp6WiWM9yGNgmjnJhg1w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EErfmegagevATmGrYZ6D/y6xO8d63DZYuRMPzhL0pxgRKp1wwEN5wNC5cL03U94tYGJL4Vg3ZLAbVGprzkH/mucSVVKR3/t/lH7uMMD5EKJ+am0OKLSEim/meI8E8mM5wTB3U+MHTWFStxMo9bdM1ZXyDDoxR+zpvdOdnfEp8XYmMDlkBiw93igxNMQx30ZKmFDz1O8DKJ+y3/k6qnWAjLrs8UbQJ6EDNuFvZmlTWAyQ0ucX4lGNHDY5ZcVXUwkEwvO19Q0G/IwTavN/OSAkYBaetyHGYrpJ2gS7AunhG4JSin3Vdk2sC3SP92KNN8HPfZFNX8Xc+FNaeG25FIbOAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mE8ftP2l0OUfGr4rw3d+irpMjfRLgo/vGwXH8jh5ELo=;
 b=YJ2E6ENFT9eyxLvj2ePe2zQkH5MI5h62jenJ0S6FV4xUuNq/lXbltFVE77SMQon3ZQkIv6j4AqmTNfBq/qfP8w27xzWh6MaK1Uu6NFUrOmuE6dv8JLOu4W3NVItAQV8D3i1mVilXnu/or5Ht59OabQp5hBfHIaClQdSOvJuSTRsUpB/kswFlRhuc9RaLGQDEM6ftpoIXnz/0Fw0BIfor/acykNTSatE4H8AYVN25oD0kEo44vWZCVq7UZ+byJU02AB/9JWQPfEiCBufneH9/F0/YYoiweP+R/vlHzqaeqBwVZ2e2i5saEnBkhPK1mT3wdipvuxaGlsqQZzTKsTLyMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c65c58d3-e553-4247-680a-4d072b1c7c05@suse.com>
Date: Wed, 20 Apr 2022 08:26:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1] page_alloc: assert IRQs are enabled in heap alloc/free
Content-Language: en-US
To: David Vrabel <dvrabel@cantab.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 David Vrabel <dvrabel@amazon.co.uk>, xen-devel@lists.xenproject.org
References: <20220419150134.64704-1-dvrabel@cantab.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220419150134.64704-1-dvrabel@cantab.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR02CA0034.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::47) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9c6d69e-3a83-446a-76c5-08da2296a8df
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB84619166119044B0C70148F6B3F59@DB9PR04MB8461.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q+J7a4sSFMrapDQK8f6/2Zv/M8jCStGaODoqU/mxADrmamxaALcx7ZLS7YXVGICQ0RHrZWl91iByoSUxjJfSWoks7wn2DFSY9mNo/pzeK1yOsUYvQFswygZiWkwvl5FaDmW1IRdwZDSV0Ll7bSpBPwJKb/UWioSk5AfvEk7Yrp8XoC4KRxRoNSTIHkmT6LYM83DMrQhQtVJC2601tzAfrXNnDORvHnI2o1ZEpaBhDDTYul99n5Fe5q8WtLmwsDFSd7ruz+ZED/zQKGFPxmZTzFO/OozQ3+prUWfVwT5ZQVnGqtB0dT/sn9zxU/0iN6S4zyCO/2Y8G7F32Dpuwwz7lPDc50JPaLqR2XKjT4q1G1KPYNSIW+//UKWeOb93RQtOSz2SUqUyKGLd+9v2cKqMsU9dRVQGcgbuVG/A8vPTDAgfJ+DHNNcDdvNH4c6gGjDsJ6/cwNghuu46baymxqvPRHo82nNWniEN70j3fOr1w6m6nZEag9MILgRZ/z0p7lkd902d84LooJ6z/lSYqXYNh3Jhi4VZc4CyY9VetHJlb0ppb+TIQBf1zaXVEyM/DcQ/EpOLOGNUC2Enku2+FKwEk54ShzHqA6yaf/uDkhR3cS31RFA06v2g1Ohi4wwpOFPAh2OQ8qs1Ozw0IRqd8cBUBerTDWIt7lz0N4wwZwnAqxmyUh+SbAiZBYa50uiZRsK0bE2y1FJMrluhfHTCXDUKZNMVKUAs6FAcjeKe2mky/WU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(54906003)(26005)(6916009)(316002)(83380400001)(6512007)(31696002)(8936002)(5660300002)(86362001)(53546011)(2616005)(2906002)(6486002)(38100700002)(36756003)(66946007)(31686004)(66556008)(66476007)(8676002)(4744005)(6506007)(4326008)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djFZek5rUkpnQnRxUHk2UkhtcFhZNUR0YmNiVUl1aWFDRy95NFpWV3BVeHlj?=
 =?utf-8?B?dEtyRHVmMlV0ZFdtMHF4OWtmTjdyQ2VsUnBUWGU4WWkrdHRoc1ZkRjlDMWhk?=
 =?utf-8?B?OXVMY1YxNUdKakxSNnFJVWU0ZTNRQ2NySjA5c294Z0hjQVd5WEZwK2xBQkJm?=
 =?utf-8?B?eERubGNtc2UwWmxhbjBpUHUrUGtML2NWSnBEUTRMRnJaZnozdVh0MTNDdzY5?=
 =?utf-8?B?MG1zZitqaVRRUTN1ZlFHYnRNcnJKaTE1aDNrZ09iQ3g5RHNjZlJrSFNnWGZl?=
 =?utf-8?B?aUdlbE5mWWEwNnlZYjNRa1B2TXU1NzhWUGNGYnpZeEhTUzJ0RGQwcDFxRWxJ?=
 =?utf-8?B?cVhaSXk3dXJEazVsTEFhQXFCYjRVMlRLSzVZMkI4TG5RZ2FkRkxPLzloRGhy?=
 =?utf-8?B?Z0xsdS9lNHZ0SEZyU3JhMG8wdGVTdlp2aFc5cUI2K0tQR2FqUnJpS3BkckpS?=
 =?utf-8?B?bWM4TXNYbFZaY1c1OUdXb1BIcGFCSEUrZnRpSnZFR2hqcGJZSDFibXR0UXdr?=
 =?utf-8?B?OEI5L1MvQW1iM1d0WDQyNWwyRGtqdnRUbFA3Uk0yZk9EVnEyTVNpRHJhWEZQ?=
 =?utf-8?B?TkZwY0xDQ2YrRGxDZ0VzNVh2T2JaVWVTQ1MwM21razdHR0drem9EalV3VU5S?=
 =?utf-8?B?cDhjOTI5S1pVeWdBTnU2RGNSK0RpYnBwUG9uUEVoY3pHN1RENmZ2VFFlU2ZX?=
 =?utf-8?B?dlhKL2ZiSVl6bys0bHl2bWNjWEJzK2t6UGg2elNrQWo1WGY4WFFHaHhRa0dF?=
 =?utf-8?B?UE5ZVHNVVHRIUExxSmE5TmZCYldRYXI4elpkV0FvcjhRcXk1QWVZeGJ4UzNt?=
 =?utf-8?B?bm5tb213ejdabVZVNnBsNE9nQmJGbW4vb2lkTDlZZmVhMVVPTVpzWVpnQVlH?=
 =?utf-8?B?U2s1d1haZTFIZDdZdEhVc2lRYkRGT1pIdnl2ZHhZbGdMMWdZQmJ1aS9kc0lZ?=
 =?utf-8?B?Q01GRTVTaXVBMnhtNHU2ZC91TDBOQ0lZNWYwNVA3dVFzaXN3RnNXZ0p1dE56?=
 =?utf-8?B?SU9ONFFTcjJpYk04NkpDM2hMaWFZb3orSTZSbzVQWWN0Y21RN0RaZ0lqcEk0?=
 =?utf-8?B?b0piZ0ozaG9VNmpsL3ZRZk5TVFpmbnZIektSYlZFRGNySTVBZmt1WjFmckZN?=
 =?utf-8?B?Q3NOWW9QODFqNXk0UTFiV0h5R2dtcDJ2ZzZBRnVOTGtneWZ6UkZ5VGpuQ3Zp?=
 =?utf-8?B?SVI0dHV5THpoQVhEOHVKWmxyQk1ISFAyN2pFUE5sU0Nsai90d3Rna3pmdW5p?=
 =?utf-8?B?MnBPVVJ4SUptaDIyRHdHd1hpdkZFRzgzUlgrN1RYUmluUFRRYnAwODBFNlJz?=
 =?utf-8?B?WnZrWEZ0NHhFd20rTHRrc3lRb2FPMDhteDZabzRkNVBOK25TaFdUcGtOM0FZ?=
 =?utf-8?B?STRxaGloNkZibFdKU21xNmFBaDFja2dGeGdDL0YzdDdHZ3RCY1kzR05BV0Qw?=
 =?utf-8?B?SG9WUU1ZSGxsaHhiNGhNeWRRUWxqUDJ5UHRSbGsrWVMrcmRubkkyOHdMYlFr?=
 =?utf-8?B?L21hNy9tUVlGclFPUEU1QUlHK2d1SmZnb25KSHh6MTVUVnUzUDVPVlZCMld1?=
 =?utf-8?B?UWdJZjlXV2VuSnhqN1B4OHdPckRYdjB3ZnZ5ZEVudngwYml2TXhDcktIRHVp?=
 =?utf-8?B?RnFwcVpPZUQ5WllVTWtNYWxYRHJOOFNQWGt1TkVLR2hId2lEV0ZPM1BWeHdr?=
 =?utf-8?B?NHQ2SGxEVjdFcEJGc2czSDRKQWkySlhqMTF0WTZkTU1RcUhHZjkxV3NOYVgx?=
 =?utf-8?B?ODZNWGFXSit6NDhJVEpDcWhsVjZQMndqNEV6NHloZVhDWHRqZ04veVBCb1lr?=
 =?utf-8?B?ZFVsOEltb3hOb2RrYWxmeW1rcnZ1aUFyVHNVditwUVJBZlZ5RFk5bURFdVBR?=
 =?utf-8?B?WTJIUE4zZUlDM3JDOTJkNFB2RzduL1NTQVpKaUR5UUtOYXpJejV1anZLd1VN?=
 =?utf-8?B?TkNOQXRHMGh1SG5rblcxcG8ySUFreXBpeVN4S1pha2RiYUw0amZzditGMnBh?=
 =?utf-8?B?L3owVFRUQkhPLzJ3YW5hd3FQWXNVSmJIVU5vcDc4RTRvd1g3ay9Tc1M0NU8v?=
 =?utf-8?B?dFgrTnkxWTZNekRJRVQyWmZVVDBzc0Q2RkdlcHA2SmIvOVpaYVdtdFp6cURI?=
 =?utf-8?B?STBPUU1wT2JHcjdKR3lzYlhhRWM0RVBvMVg0cnpPTjB0d0RKaUtMZnJrMnJP?=
 =?utf-8?B?eHVHMFF3VUtvS3UrNy9hc09VRThPd1piYXdNUkI5Vnc3YTFPRVlLbXVmc3F3?=
 =?utf-8?B?OWRZcEMyL0xPRHVlb005WUZaOHYzb21LSzRYSVgyaG1mbWhnRVE1ZDFhSWpo?=
 =?utf-8?B?K1N1RGYxRXBwVFlvb1htZkF3ZkcxdTQ3Tlo4VkhBUU9hNjAzeHVwQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c6d69e-3a83-446a-76c5-08da2296a8df
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 06:26:10.1096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HkoFmEO+++p+p5tNCYu3nQsbCNlXJRnCYad98mNwLztbKMHbmVmNm82NGpMgoMsgxG9UeMN2dVo/V3cxck1dvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8461

On 19.04.2022 17:01, David Vrabel wrote:
> From: David Vrabel <dvrabel@amazon.co.uk>
> 
> Heap pages can only be safely allocated and freed with interuupts
> enabled as they may require a TLB flush which will send IPIs.
> 
> Enhance the assertions in alloc_xenheap_pages() and
> alloc_domheap_pages() to check interrupts are enabled. For consistency
> the same asserts are used when freeing heap pages.
> 
> As an exception, during early boot when only 1 PCPU is online,
> allocations are permitted with interrupts disabled.

This exception is tightly coupled with spin lock checking, i.e. the
point in time when spin_debug_enable() is called. I think this wants
making explicit at least in the code comment, but as a result I also
wonder in how far the extended assertions are really worthwhile: Any
violation would be detected in check_lock() anyway. Thoughts?

Furthermore I'm concerned of Arm not using either SYS_STATE_smp_boot
or spin_debug_enable().

Jan


