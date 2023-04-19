Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE866E77B0
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 12:46:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523330.813301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp5KV-00075i-4M; Wed, 19 Apr 2023 10:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523330.813301; Wed, 19 Apr 2023 10:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp5KV-000731-1g; Wed, 19 Apr 2023 10:46:27 +0000
Received: by outflank-mailman (input) for mailman id 523330;
 Wed, 19 Apr 2023 10:46:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pp5KS-0006CV-VX
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 10:46:24 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dd92642-de9f-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 12:46:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7013.eurprd04.prod.outlook.com (2603:10a6:20b:116::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 10:46:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 10:46:23 +0000
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
X-Inumbo-ID: 6dd92642-de9f-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZHNvWxjZhlshU9FWzDmjFI4NCjQyVdHO4eLwswL7ROeDq9qxakyyvzc5dvg4d6oxutn+8gplwj/9JkVgrpKmsm0aYCVB38XkAJ2KU0jBxIe1l3PM39iIqDmuj8rq6kIH/10lGYVChY734k5dMacRP2XsH17rABEBIsdZpVBJf22ToMYpRDkGzVWSFMVQBie5tT69r+Fhuoou101TmrWYO+oEk5iYjBhhhZAX9Nd1GsugV1L5ab2VgbMzOMxTFskWzD56ko7sbGsqjIm6jEpJiAcuuTLc2KieN62BgBuRxZqDC14wT+e6/wBTYeu/2Iz2nYfs80RTVrGoMyoPch8nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tq9WHKGqRr1z/PValrjLOh415pqYopf5CMM1Py5K+Iw=;
 b=NwHfGoCRIHh3pURNKg2sXz5jlvVPWcKrwTuM2vrKsKU6P6JTaeKslJGmfYnDdhkEr3I2UqNnlx9fpED7quBExRlAA3bnG8zLXaT248TerrSxEUH1VUCq2OHzc7LShM7ljq66mDpZ3xhkoyVA1nWHgUmS0qW7fl2Nr0FcsAjH6mcc54/VnWbleS6yxw1k2XHuo42Lb6NY2qyUsqJky2vnXjJML3MywCsDY8liqx3/HO2Ws91vnbpNSypHkPr4wSRbC4FyXKRngUokgCyg4itznc7t/niZc2k1tynstiGNqbXWmoBiR9LZFa0B0h8M5vMqGfMEKlqZO1DdrERq6x6WGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tq9WHKGqRr1z/PValrjLOh415pqYopf5CMM1Py5K+Iw=;
 b=igKjTYW6eq1St33CBa9YYBklQHM8GsLA7uraQFVMRKOWpFyaXtAgNGioi7L4YGo4N/4t2yv1wRYbnbnS5HZrzo5CUxWZxKFHp44I8Qo4vsicnepMSmev3YvnjsefRCJJo6CY356pLzyx2Xg3v6ble/jsfDzuVtunvi4xU/ASSE3lEEkeDrcELw3eStCxfP1pv5jYiJjv4QSWDhDsTWmB59+epSoUCerIC9pL3zNaWl8NpJ8B+RaylbabxwEuLNayYLTKfzd4PYk6K4f0I7L3fokJt7cLzeudlyrclcUtk8cY9a6xQfBShHOSz22f5W+/ObG2JvkRc9gZazQI2NXKng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d07ee286-52f2-c7ec-2d0d-1c343dbc78be@suse.com>
Date: Wed, 19 Apr 2023 12:46:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH 4/5] VT-d: restrict iommu_flush_all() to cache writeback
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <4b42e920-f007-186c-d838-a0294bfa86b5@suse.com>
In-Reply-To: <4b42e920-f007-186c-d838-a0294bfa86b5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0263.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: 22352383-79f2-464a-ab91-08db40c35158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qh1WnuqT5me8oDW6t0ajcZaYYk9SsQUn1+Cm8vAzfayfAXimO4Rs6csHRjNnkE9i0rXDf0MJrPV7+Ew0hvaRYOadp0MwKL/4YU8hfoEZMxII16F1Mo5zsOYfMqN2FWwJoi/0cVpshgYE6Anp1oxsw4TMY+owUdz2jWd3T4MyQ2LghDjX9QdD/nGLeeM2P4E8L3DJoqlxAgUGZgAbUmRMyawN98Es6MZtYDfGyNlAB8It+Jdo60qiUb7tvL/keivTYQshsa4D1H9B222urZLQkyIY2JsTNWAAyB08OnGZNkVHDylUSfzhF0WPFfuGyjkFMlGm02G/ekg04rOU9zDOyBlOGaDh1M3Vd1bl8Urrw+h90z+YljPKpZDloYOxwap8si9gKrNoXnqJtIGtKhygKqA1pOu9zeAiDJx/rhiizFpmsa9wsA+U+z1juSe/W4ADkGCYj9OrwmSckm47zS4DUAf7p+fS4hEpv67ek3I7h+gLoJLjRttnmIKarHCK6+/paRu0N9id4suI8TBO39CphPiwa/l+QY71GehRcvgEINoq8Oh2FdhAq4k1SJBMn2yCqz+odW99piBesiESGFYTE/X9yQGqI78qa+xlHTmke8EmJSJmueXOAmdPtIqBFA/wgGEq++Ap65GUKS4pBQfAAg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39850400004)(396003)(346002)(376002)(366004)(451199021)(5660300002)(86362001)(2616005)(83380400001)(31696002)(6512007)(186003)(6506007)(26005)(38100700002)(8676002)(8936002)(54906003)(478600001)(6486002)(316002)(41300700001)(36756003)(4326008)(6916009)(66946007)(66556008)(31686004)(66476007)(2906002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ay90cllZZU1hWDJRMWVjdlJ3cEV4SGVCRDNNZ1hsVnpXY1dnYjRpV0JIanJK?=
 =?utf-8?B?YzVTVCtVRTBzNHk1WTVvZmF3ZWRZWXkrSVY2WFVaNWxKSlpsRmc2L0ZJNlJl?=
 =?utf-8?B?dXJGQXBTZXh1YUVPOEJ1ZzZQVlpCNUEvS0ZJQTV0TFJZei9FOUkxeDdMUW80?=
 =?utf-8?B?N0x1WHBhc3ZxSVd6eWNBMi9uSFJPYUg1UGU2dGFJV1RSZHVuQy96ODBuVU9r?=
 =?utf-8?B?aXdlWDdEejdRQk00bVB4eW5URGZpUHpDeU5zRXlXZHFRMUJieWtQanB4WXZs?=
 =?utf-8?B?WGtTTkx5UUlTVGNuOXNxK1lONjNCZ1E4MWFsNmVrc1JTYXFFZ2U4TjA0SUxZ?=
 =?utf-8?B?UGVmblVwMmhhanJETEJKSG5FTkhVb2thNHI2VWNVeldEQTBwNFo1TnQybGxu?=
 =?utf-8?B?b0NiT01rM1dSdVNKVUloNFdnSmNybHFVak81RnFRbEtoYTVBQUJpRmRXeVdj?=
 =?utf-8?B?QzhnNks4OGFCN1RoY1ZNeXM4cU15Y0pYalVYNFYwajdoTzF2Q25qYkxzR3hl?=
 =?utf-8?B?ak5Md0RvdW9Fa1FOU0Fkc0c1dG4rWjJiZUlaejVEWGhJU0V1Ti9CV0toS2JV?=
 =?utf-8?B?TGhHMVpac3pscmpPV3hubHl2VTNNTGw4aldQZkErbXRnTldTR0lNbFZvS290?=
 =?utf-8?B?MnYvWGE4Zm1LRXpZaVdQMVdxd2RUa3JyWXpYbEdNNjZvekc0aEsraGYwVXZn?=
 =?utf-8?B?YTRJb1ZlZkFoZU5pV1RWMi83Nk8yWWFMckVPL3Zod0ZVWW9TN3dNWUZFRjN0?=
 =?utf-8?B?QU9OaXNXR2Y4UkhPQlIxYWxURkJHK1BGaCt3RXduSzd3WTA1SGV6Vi9BNWZH?=
 =?utf-8?B?SUxCVW5BNVdNQ3JlUHRGY1YzMnZpLzZnTkdWVFNkVVpiOU0yZGNsT2lJejBj?=
 =?utf-8?B?bHZYbTE2M2YxRmpyUkVINE45UUpjdXFvYkg3cXRFSm1YV2lDbFRjUGNCdzBp?=
 =?utf-8?B?V1Jydk83N3NUVzF3TjFyR3lZWWVubU9UT2Q0dnV5S0FyYTNQbkdMOE1KWTJN?=
 =?utf-8?B?NTRkMWR2RVhVQis4bEtJd01aSWYwR2V0dThtQTE3NVBNWHJSQ3hrWjVXUE9M?=
 =?utf-8?B?N2xSTk82VHFJNnZqcFNUdy84dVVWVGRIekpDRDZFUVFyYW1tVCtOVVpyTDUr?=
 =?utf-8?B?SnVzam1XVlkrVHgzMWNQcWRvYkJNTEJDL0VnV2Rzekk4OVVkNzBGMjFaaTBp?=
 =?utf-8?B?TnpVeWFvQVJwVjBmY3lHY1VadGpuTU1xTzVVV1NTWStTTjhhNWFHV3JUTWdU?=
 =?utf-8?B?MzhvNmxIOXQ1dU1jRHVTMmczcStBSnNGVndVSktpRjFxOE5LME92bHNYY0oz?=
 =?utf-8?B?WXlzSTh0MlFWTld4cDBkV2pWZWdvMThCSXFwRmk4WjU5bE9aUEJDZWpqbHZX?=
 =?utf-8?B?UnYxVnlHcGsyVkdPeU5GNjJ2MXFUR1BLNjhmR1orRDl1eHROd3o2M2FBKzdF?=
 =?utf-8?B?R1pteDRIRzhNa2djSnFXNWtZZnByMjU0RTNRNlBzKytXYTJUZEdJWTliK3FO?=
 =?utf-8?B?REdTSDYzWkg3MTc5R0xTdi9jVzNiZnZhVnJudTAxTjYwZ3lvZEd3WUUxSEpF?=
 =?utf-8?B?eXJ6am13ckw4WTF3djBONncvOWMwQUVGUGowbk1tSFRuMUhtc2F4akRUMXdr?=
 =?utf-8?B?RE9LdURkSTA0ZXVxRnJCbDNyeWtnSk9jdC8wZEtUbkRFUE9FcUphMm5XODFr?=
 =?utf-8?B?YWdNRWtzZVEzZXF3OGd1V0lFNFFDRGZXbHNaMFZ6YWhGMTZmQjh1cTdCL3BJ?=
 =?utf-8?B?ZnA2N2hPYmErL1VQMSs5VHRBMTFKbnV2OTBoV3NBTks0R3pqRmJyRUp5amtF?=
 =?utf-8?B?Rm5HM1RucVhMdTFpaXBsRXdtNTY5Uzg1R3pYSW10Qis4ZXFsN3l4MjBEb0NW?=
 =?utf-8?B?YkdTYWFtUHBhZGU0dW5GQ3VXUkw0a1grOG9FUHQwRzlGRVAwMFV1U1krME5F?=
 =?utf-8?B?dUVRRENDY2wrcTdjQWs3cEttVzg0RlA0a1g4OTNKaVJVWWdsTzEyQlc4bkUz?=
 =?utf-8?B?eHdwS1A1WXpLYWs2WENmb0tlRjJJMHp0RXF6Y05nU2tsclpIbHVrZEtoYytz?=
 =?utf-8?B?bG9zUnU5SURPb3drQXk3enQwSXdGUnhJYzg1OUUybGxNYk9McnFMMmgyTXdS?=
 =?utf-8?Q?MDvc4/qKTLEhL/dJUADLFFWfW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22352383-79f2-464a-ab91-08db40c35158
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 10:46:23.1947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhMQsbeKyzqu18/ZP+15HtTiIOfYZr0nFxJLaPK+J74gfTKfyjfEcTswglgDw2pyt3S+2hH68bHw99RMgfQzFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7013

We don't need to invalidate caches here; all we're after is that earlier
writes have made it to main memory (and aiui even that just in case).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This, aiui, being an analogue to uses of iommu_sync_cache() (just not
range restricted), I wonder whether it shouldn't be conditional upon
iommu_non_coherent. Then again I'm vaguely under the impression that
we had been here before, possibly even as far as questioning the need
for this call altogether.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -693,7 +693,7 @@ static int __must_check iommu_flush_all(
     bool_t flush_dev_iotlb;
     int rc = 0;
 
-    flush_local(FLUSH_CACHE);
+    flush_local(FLUSH_WRITEBACK);
 
     for_each_drhd_unit ( drhd )
     {


