Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD23969286
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 06:03:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788573.1197986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slKjn-0000GW-Mv; Tue, 03 Sep 2024 04:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788573.1197986; Tue, 03 Sep 2024 04:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slKjn-0000Et-Jq; Tue, 03 Sep 2024 04:01:51 +0000
Received: by outflank-mailman (input) for mailman id 788573;
 Tue, 03 Sep 2024 04:01:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqql=QB=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1slKjl-0000El-Mc
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 04:01:49 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2408::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c101988-69a9-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 06:01:45 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by BL1PR12MB5851.namprd12.prod.outlook.com (2603:10b6:208:396::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.26; Tue, 3 Sep
 2024 04:01:39 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 04:01:39 +0000
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
X-Inumbo-ID: 3c101988-69a9-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETWdZvRNinGxfkzkulwhZ1/4dMKpzLSrjB7XI8VWXtEAq8i/7v429CxRNx7pmAMvta51o5UhFqIWEXRUO9CBDPdYxqQvGOkkQEE4vBmFgehHn9ZszDqi0UWetyDq86WY/nha3SKO5HJ3vYRKPjROyjvBYrmNt17gma0o4fdOR9FsCIry+FgEa1rodFvDFAxXd3Jre6c1mBOfRWsBY7k4IMwtkoPkjhvXBa0m4NGRR1bL3HBsssPnrpMLTqhWD5vYDNAx+T8G8Pyix9mnhlpeHMpzmjIpcUaPZynG5c31GwmZvIMYODhML1N8MrtVbEA0bi2DiQUZROBxhHonl737RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CyaUbNZmBdfY1pvrJSgvFLG/ctwatjZMhcDNhSj/nWk=;
 b=HpBLKEcYqlDQkDHPU6iAtNuRig6TPC3Tn9YY6qFiMo+h/fQtJg7ELJLF6eWOuTDqkgXJur7ZRsfisGTpf+q9SVidJOdvXkMc9LUjcGFD42TtrYVI9E4XRuyDrRhufRXAtAm0FHarW6gEDu2BDmdwnWDAcNdIAXYkmYze60y4Hf1Yc8foBjobS+3jCyGvWUgP6va5tTKyud7ypKk5nfpQ8scB93jYgdtVLf/J9AVOWv8jwLgod3H3AI3gl5JqSOT0nFoK24iq8vDl59TxbBc5+rs7qTsENJ7F38YyoLmjqrel9/AcNYBMcrQd3G6nwC/Cm6QIdLt+ZqI9YdHhnETghQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CyaUbNZmBdfY1pvrJSgvFLG/ctwatjZMhcDNhSj/nWk=;
 b=PycnqDKEIYrnEcv6nv3s+hAmYG+SR/8cZuUM5cUPhMN174JNyWaTWEUDDqD3w9W4Azen8wR7J8q4VrAjzs4smhRryqYoac0airp0IMaSjecAxKWhLD0XZ2pGCwFsNoOj5pL1g9pRSBBUxUdEEQNIRBa3v9A+0XozOgHbTlExB1M=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George
 Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v13 2/6] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Topic: [XEN PATCH v13 2/6] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Index: AQHa78ytu3Dw7+A5rUaTPQAvAsIAxbIuTvuAgAHk7QD//4uogIAWUUQA
Date: Tue, 3 Sep 2024 04:01:39 +0000
Message-ID:
 <BL1PR12MB58490FB991A0851286858DE4E7932@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240816110820.75672-1-Jiqian.Chen@amd.com>
 <20240816110820.75672-3-Jiqian.Chen@amd.com>
 <4a421c07-d8a0-4af9-816f-5d76d39fe31f@suse.com>
 <BL1PR12MB58492B55B496755585774CB0E78D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <216ebf5e-75d2-40f2-bc79-65fe67e54bed@suse.com>
In-Reply-To: <216ebf5e-75d2-40f2-bc79-65fe67e54bed@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7918.023)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|BL1PR12MB5851:EE_
x-ms-office365-filtering-correlation-id: b319c292-f703-4ad4-1941-08dccbcd1d3b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z0xOYlR4Umc2b0FBRjZoNER0eHlsNWc3MWV0bjRGcXVlNjRheHNnV1ZZbWRy?=
 =?utf-8?B?RGJ5WGFxNG5DOGdQMnpIRjdENFQ5VU84V2F1M3QzVERyYnZXYWJISEthT3g1?=
 =?utf-8?B?ZFk4TUw1bi9VbHBpS091UStmb1doaDlKMHpaa2VuOUMyQUZVaXVCQWEyVTIr?=
 =?utf-8?B?WHRia3NFa2YzUVY2ZXVqRmFkejZlcEpjaXJ0alRUMXdpVmxnak50eWswRmNP?=
 =?utf-8?B?ckFFRmxWZ1BJbE9udlVVRC9JZStObHlySUxXeENjTXlTR1h5dlF4YmVQUE5i?=
 =?utf-8?B?QXdXWFNPQU51bGMvSFRmZm92aUdPbUVIQ2dTZ0pJVmpFUWcwMXY3Z2V0dmx5?=
 =?utf-8?B?MlVzZFR2S1E0TWo4KzNJQUl0V3g5ZDJlMm4yaHZoeWpNNkl2MGk5Q2FSbWlT?=
 =?utf-8?B?eVExaE9xWWg3aUhQc2ZSYi8wRmMrUnlWeXErMzArOUloRGtoLzhWUytxOXRx?=
 =?utf-8?B?TTA4UHRGQ1dvR0Njb3RBeFQ0dTUwQXVwOFdRTVF2RVlEakxyMVk2SUd0Zk14?=
 =?utf-8?B?U25JYlBHUUpyN21XOG1BdFkvbzhIalZ3bWh6TjRBK0NuaEFxY1BaT2UyWlBs?=
 =?utf-8?B?WjF6ekwxTjBYaGYzMUk3dFdDVTRjbFhTVFhxblRIU1hTV1FPaFlBS2ErRHV5?=
 =?utf-8?B?bHVHeWpaQzBRMHBUU2ZCUzd3eUFHQ0FWOUpOTWJJM08wL2NZNUtmVlJPMWlT?=
 =?utf-8?B?UVJkV0xNU1E3R3B0WGg3d2s3R0NXSGg2STZrWlBuYWRET2ozV3NNVXlGSUNz?=
 =?utf-8?B?ZXVHZlYzeE14N205eG5GNFdFY1ZjaDdwL0VBNjFrREdDNVQ4bHBFbmZsUzd4?=
 =?utf-8?B?UzlWdFBSZWxZYkV1elhKWFJsank5NHJmZ3FObWZHeTJ4WXNMVFphaVNoRnl4?=
 =?utf-8?B?VmVYZU9UblVLUll0ckNPMWhmcWQ5ZGxpcmFNN25uRjhRTGpvdXV0bFEydTZM?=
 =?utf-8?B?WjZLQWRxSkhhT0hNK0kvcUg5bWhsMWE0RTV1OFFxenpKeWc5aS9nanBIS3Fv?=
 =?utf-8?B?TjVISHVKSkxsSWJxTis5M0RNb2hxdEFTNXAveW83UmNvcnRmZUdYNktpR284?=
 =?utf-8?B?b3ZEby9RMnczUUNvVVpWN0k5ZzlhcXlmQXhJQ01oZ2NvMk5JY0o0L1hIQWxO?=
 =?utf-8?B?ZEltTkNQQytQb2JOTERNMStMUXd0bEwrVDE1SVZLQmJIblFsR1lkclJGaGZ5?=
 =?utf-8?B?eTUyYlhabXUzSEhnL09WZ0I3N1NPZGYrTFE5cHVHM1czMUFBcFJ1bmt6eUls?=
 =?utf-8?B?ZHZYc2NWRDkyK3JyRXpQWWRjenF0Mjkxa3Q4VS9ya2tySXBWWjAza2txNjF2?=
 =?utf-8?B?eWVIMzdQYnFRRUVtc1lNZWc0TkdsenZodW5kUUgyRGwwZ1JhN2FHTlhhdGw3?=
 =?utf-8?B?ZmJkSDdsMlc3V3FtYTdlRWc0ODBQU3Z2cjkzdUkzUWEza1A4ek5BQ1ZTNnkx?=
 =?utf-8?B?d1lmamtiZXJXaFlPK25hUEhJLzcrQ01DOFRYenltZCtyYTR2ZG84Rkd0QzYw?=
 =?utf-8?B?Z2hGUG93U2tiRHUvQWxMVk1nVnlkbk9ZeERpSElOSkxsK2NHQTlPWWEzNGNF?=
 =?utf-8?B?Mm00UmJhL0oybW5WU0ZPS0UvUkEraFdhT2Zya3ptNnMzMTRTRE95N3hFaE9F?=
 =?utf-8?B?b1RmdVpNc0lENHUvaXR2YnhZL1FTbHowc2tyVmZ1emdXNFVFbVVmaEl5QU4z?=
 =?utf-8?B?Y0FrTWVsUmhVcmxEZ3p0TUlQbmV5QU84M3FlYW1MUjJBRkllcTNpZEE1dk40?=
 =?utf-8?B?dWZTTkdGK1BpeFF1Z0cxWVJBRERuWVhiRDVWRFZtWHVHb01CZUEwZDU2MlRk?=
 =?utf-8?B?SURsNlZzSVAydGQrMVdtU1BQR1R5bi93ZncvL2pzTDJQREhpT05kaDMwTkxw?=
 =?utf-8?B?bjhybm5NOFZzL0JWMVE2R2JjZ2Fza1IzcGxBUTVrakpuQkE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SEUrVE5sTVJMbUZ4MVAzeWd3UHRzd0JPSjM4dzMrQXVCSlk0c09YZWNFdzlq?=
 =?utf-8?B?eVA1QkVqYUNvUmw3WWEwTWNNcDgxMXFYdmpVZXNWYTBRaE15OTZQcktLQVFw?=
 =?utf-8?B?bnorT1R1dGRxT245WUcvUGhrb3U1dTRUQWR5eVBZNDN1MXJ2SzdsRm95UmtI?=
 =?utf-8?B?c2dQQnQ4WHlGd3hlZ2ZzSkcyWm9ZQ3ppRUFPdWU1dUJWQTRJaWU4NU0xZW5R?=
 =?utf-8?B?bjdYRFcrMUhmM2U1bkRzZFR3Wmk2SG81NGJYdnFsbU5XRlFhdlZ3NitNWXY4?=
 =?utf-8?B?YmNTRWFWZlVXTkxCOWhjK3kwT3hqV2xkV2c0WDUxSE5mWEdXRUVuRjNvc1cy?=
 =?utf-8?B?QzdGa3hyQWRXMTlYbDdsM2tlUENyM3J3VGxRcHB0cU44QnEzVU5SOW9waE9W?=
 =?utf-8?B?cjQ0a1VGTi92NnVDU1dLU2FHQjVXU2hpZ1pwWFJDTHVqUlpDRGZmZHRobVhQ?=
 =?utf-8?B?Y0F4dW9xbEp0cGllb0U1d3pIU2p1RExJUjRJSFNoQTErdmdWK1NtcTBuU0tx?=
 =?utf-8?B?UDVRTUFBTFE5eWFPVXM2T1c3aHlSdGJiZDhGMGFuby9Kd3czWjJxYkNXd1ZW?=
 =?utf-8?B?aTBYTkVibjZnb0pkYndkTURiVFlDVTZYdDFlWENqK1c0SXdka2lNd0VkZlI3?=
 =?utf-8?B?WlpTb2VnUlJudG41cXdjYTdSUFZzSS9xNTJBWjZQc2t2L3ByWkhpVU95emhZ?=
 =?utf-8?B?bXpoRHYxM20ycFhiSzFEcmZsV2pRbk5FWmhMZUhpaEFqSHkwSHBKc1dzc09q?=
 =?utf-8?B?Q1BtczdEeTM3RmhVUVJFSTQwS0tiUFhoS0F1eWlEYzNpbFMvVSs0Q3Q4bXNT?=
 =?utf-8?B?Ykd0TEp0ZVFocWY5cGNFWTlndHQ2aWVqMXlKWkR0M3Avc0Y0L1ZVaEhMeG10?=
 =?utf-8?B?TWZQMTlxaWU0dTlLMG5Wd3ljMnhScXAycGxoUFZPbG53ZlVydXNPbFRBNDlT?=
 =?utf-8?B?RGhESkp3M2RzVVJoeUNRd01sVTZOM2FqR24wZEp4RWYxZklqQkVxS1RJYytt?=
 =?utf-8?B?b3IyK3ZQSW9RZEt3UjVOYzZZYjdyaE55QjI5KzBBMkNYcVB3RGpjRDdvdFRl?=
 =?utf-8?B?eTJBR3hFVytDaWhYdzdFc0pDYzljVXVlejRCZnhJY2M3TFhDdFZ2ZFk1aWgv?=
 =?utf-8?B?QWNJTkNwVkFGa2dVaXpIZGJyMVE4RUZNMkpwS1RDd0FYdEJYT0pLMjNmSVJm?=
 =?utf-8?B?R1A4VllmR0ZXNThpTUdoUlQwdkNtMUVETWRxd1c5b3JzYngyNXlxWEM1WHk0?=
 =?utf-8?B?NkVGNndSUU55TzUrZTUxWlBITEVDQWpVZU01NWo3R1pDSGh1RzFaVXBvRkVC?=
 =?utf-8?B?Q2U0WlVuSTNLNHJieDlmNWRvMlBjV2YvbHNYNmJaSDZ4eGVuTExaU0UxY2hR?=
 =?utf-8?B?blpDY0hOcjljNm1hTDIrTTJsYlJYOGp0b1FSQ2dEdGhIU0N4Z3JvRklRZnFU?=
 =?utf-8?B?M1l6ZUJyWDJnYjZwcGpKdFJDTnBLR3ZrTEExOUZPT3Y3UWVGcHFsYXdyb084?=
 =?utf-8?B?OTk0OFlTRW9zNUZJNHhjV3NWdnV5TUpCcXZPS1dZRGFjeGd6cFAyWm9PUUlP?=
 =?utf-8?B?QndSeFRTd3lqREIxQnZOc05jWklLNVR3VGZQQ0g0NGdrcCtQUUlmbUFBL3Rn?=
 =?utf-8?B?QmtENWxXdW1hNFBKTmFJbWhLTDV6SDRRdUxSeDZJYTJYbmVzQW4raDVTYkRI?=
 =?utf-8?B?SU9zVFRicnZpdU96ZUtoUnI4TW04dXJXZkJ5azY5OHF2bUZFQkd4c0tNM2tx?=
 =?utf-8?B?V3E0VVlhZVUxRnRJbE1mM3J2SWpZWmFITXlCVzV6THYvVXFla1Vpdm9UL05Y?=
 =?utf-8?B?UU8zNU5kVU9adzEyYXpld0lvRUkzZ3FUWk1wQ3NIcCtkRXcvRXRZSk0vNjFn?=
 =?utf-8?B?Y0YxLzJOZHpGSDhOaWEzeElONmN1cEVZcDBFaGpXTlJ2bm55QUZCaS9DcVdW?=
 =?utf-8?B?REN0N3YrSnJoMWlrVlpvalppbXRRRVkzeUVPeHZiVU9BWFQwUTRxZmM2RGVi?=
 =?utf-8?B?MDR2VExFZjlCZ3VxNDQ1b2ZWYXRyVVZkWW43ek5vLzZ2NkV3Q2pVU253VmJi?=
 =?utf-8?B?MmhrZEJOYTV4bU5sdXp6Z20zUE5sU3hBTkVkY2EzN1F0dzlxQVoyOGorL2dY?=
 =?utf-8?Q?wafU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF51EDE8F0328245AE93339D263D7D11@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b319c292-f703-4ad4-1941-08dccbcd1d3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 04:01:39.8825
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sE0fr7qSugDxmNUTuyao+XdFnjDBODxaZjNK8nEmhbPq1GfA2bePrSQhWkMtR90fbnRSH7FiTeMuyK9CdlqJgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5851

T24gMjAyNC84LzIwIDE1OjA3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjAuMDguMjAyNCAw
ODoxMiwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNC84LzE5IDE3OjA4LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxNi4wOC4yMDI0IDEzOjA4LCBKaXFpYW4gQ2hlbiB3cm90ZToN
Cj4+Pj4gSWYgcnVuIFhlbiB3aXRoIFBWSCBkb20wIGFuZCBodm0gZG9tVSwgaHZtIHdpbGwgbWFw
IGEgcGlycSBmb3INCj4+Pj4gYSBwYXNzdGhyb3VnaCBkZXZpY2UgYnkgdXNpbmcgZ3NpLCBzZWUg
cWVtdSBjb2RlDQo+Pj4+IHhlbl9wdF9yZWFsaXplLT54Y19waHlzZGV2X21hcF9waXJxIGFuZCBs
aWJ4bCBjb2RlDQo+Pj4+IHBjaV9hZGRfZG1fZG9uZS0+eGNfcGh5c2Rldl9tYXBfcGlycS4gVGhl
biB4Y19waHlzZGV2X21hcF9waXJxDQo+Pj4+IHdpbGwgY2FsbCBpbnRvIFhlbiwgYnV0IGluIGh2
bV9waHlzZGV2X29wLCBQSFlTREVWT1BfbWFwX3BpcnENCj4+Pj4gaXMgbm90IGFsbG93ZWQgYmVj
YXVzZSBjdXJyZCBpcyBQVkggZG9tMCBhbmQgUFZIIGhhcyBubw0KPj4+PiBYODZfRU1VX1VTRV9Q
SVJRIGZsYWcsIGl0IHdpbGwgZmFpbCBhdCBoYXNfcGlycSBjaGVjay4NCj4+Pj4NCj4+Pj4gU28s
IGFsbG93IFBIWVNERVZPUF9tYXBfcGlycSB3aGVuIGRvbTAgaXMgUFZIIGFuZCBhbHNvIGFsbG93
DQo+Pj4+IGlQSFlTREVWT1BfdW5tYXBfcGlycSBmb3IgdGhlIHJlbW92YWwgZGV2aWNlIHBhdGgg
dG8gdW5tYXAgcGlycS4NCj4+Pj4gU28gdGhhdCB0aGUgaW50ZXJydXB0IG9mIGEgcGFzc3Rocm91
Z2ggZGV2aWNlIGNhbiBiZSBzdWNjZXNzZnVsbHkNCj4+Pj4gbWFwcGVkIHRvIHBpcnEgZm9yIGRv
bVUgd2l0aCBhIG5vdGlvbiBvZiBQSVJRIHdoZW4gZG9tMCBpcyBQVkguDQo+Pj4+DQo+Pj4+IFRv
IGV4cG9zaW5nIHRoZSBmdW5jdGlvbmFsaXR5IHRvIHdpZGVyIHRoYW4gKHByZXNlbnRseSkgbmVj
ZXNzYXJ5DQo+Pj4+IGF1ZGllbmNlKGxpa2UgUFZIIGRvbVUpLCBzbyBpdCBkb2Vzbid0IGFkZCBh
bnkgZnV0aGVyIHJlc3RyaWN0aW9ucy4NCj4+Pg0KPj4+IFRoZSBjb2RlIGNoYW5nZSBpcyBmaW5l
LCBidXQgSSdtIHN0cnVnZ2xpbmcgd2l0aCB0aGlzIHNlbnRlbmNlLiBJIGNhbid0DQo+Pj4gcmVh
bGx5IGRlcml2ZSB3aGF0IHlvdSdyZSB0cnlpbmcgdG8gc2F5Lg0KPj4gQWgsIEkgd2FudGVkIHRv
IGV4cGxhaW4gd2h5IHRoaXMgcGF0aCBub3QgYWRkIGFueSBmdXJ0aGVyIHJlc3RyaWN0aW9ucywg
dGhlbiB1c2VkIHlvdXIgY29tbWVudHMgb2YgbGFzdCB2ZXJzaW9uLg0KPj4gSG93IGRvIEkgbmVl
ZCB0byBjaGFuZ2UgdGhpcyBleHBsYW5hdGlvbj8NCj4gDQo+IEkgdGhpbmsgeW91IHdhbnQgdG8g
dGFrZSBSb2dlcidzIGVhcmxpZXIgY29tbWVudHMgKHdoZW4gaGUgcmVxdWVzdGVkDQo+IHRoZSBy
ZWxheGF0aW9uKSBhcyBiYXNpcyB0byByZS13cml0ZSAoY29tYmluZSkgYm90aCBvZiB0aGUgbGF0
dGVyIHR3bw0KPiBwYXJhZ3JhcGhzIGFib3ZlIChvciBtYXliZSBldmVuIGFsbCB0aHJlZSBvZiB0
aGVtKS4gSXQncyBvZGQgdG8gZmlyc3QNCj4gdGFsayBhYm91dCBEb20wLCBhcyBpZiB0aGUgb3Bl
cmF0aW9ucyB3ZXJlIHRvIGJlIGV4cG9zZWQganVzdCB0aGVyZSwNCj4gYW5kIG9ubHkgdGhlbiBh
ZGQgRG9tVS1zLg0KDQpJIHRyaWVkIHRvIHVuZGVyc3RhbmQgYW5kIHN1bW1hcml6ZSBSb2dlcidz
IHByZXZpb3VzIGNvbW1lbnRzIGFuZCBjaGFuZ2VkIGNvbW1pdCBtZXNzYWdlIHRvIHRoZSBmb2xs
b3dpbmcuIERvIHlvdSB0aGluayBpdCBpcyBmaW5lPw0KDQp4ODYvcHZoOiBBbGxvdyAodW4pbWFw
X3BpcnEgd2hlbiBkb20wIGlzIFBWSA0KDQpXaGVuIGRvbTAgaXMgUFZIIHR5cGUgYW5kIHBhc3N0
aHJvdWdoIGEgZGV2aWNlIHRvIEhWTSBkb21VLCBRZW11IGNvZGUNCnhlbl9wdF9yZWFsaXplLT54
Y19waHlzZGV2X21hcF9waXJxIGFuZCBsaWJ4bCBjb2RlIHBjaV9hZGRfZG1fZG9uZS0+DQp4Y19w
aHlzZGV2X21hcF9waXJxIG1hcCBhIHBpcnEgZm9yIHBhc3N0aHJvdWdoIGRldmljZXMuDQpJbiB4
Y19waHlzZGV2X21hcF9waXJxIGNhbGwgc3RhY2ssIGZ1bmN0aW9uIGh2bV9waHlzZGV2X29wIGhh
cyBhIGNoZWNrDQpoYXNfcGlycShjdXJyZCksIGJ1dCBjdXJyZCBpcyBQVkggZG9tMCwgUFZIIGhh
cyBubyBYODZfRU1VX1VTRV9QSVJRIGZsYWcsDQpzbyBpdCBmYWlscywgUEhZU0RFVk9QX21hcF9w
aXJxIGlzIG5vdCBhbGxvd2VkIGZvciBQVkggZG9tMCBpbiBjdXJyZW50DQpjb2Rlcy4NCg0KQnV0
IGl0IGlzIGZpbmUgdG8gbWFwIGludGVycnVwdHMgdGhyb3VnaCBwaXJxIHRvIGEgSFZNIGRvbWFp
biB3aG9zZQ0KWEVORkVBVF9odm1fcGlycXMgaXMgbm90IGVuYWJsZWQuIEJlY2F1c2UgcGlycSBm
aWVsZCBpcyB1c2VkIGFzIGEgd2F5IHRvDQpyZWZlcmVuY2UgaW50ZXJydXB0cyBhbmQgaXQgaXMg
anVzdCB0aGUgd2F5IGZvciB0aGUgZGV2aWNlIG1vZGVsIHRvDQppZGVudGlmeSB3aGljaCBpbnRl
cnJ1cHQgc2hvdWxkIGJlIG1hcHBlZCB0byB3aGljaCBkb21haW4sIGhvd2V2ZXINCmhhc19waXJx
KCkgaXMganVzdCB0byBjaGVjayBpZiBIVk0gZG9tYWlucyByb3V0ZSBpbnRlcnJ1cHRzIGZyb20N
CmRldmljZXMoZW11bGF0ZWQgb3IgcGFzc3Rocm91Z2gpIHRocm91Z2ggZXZlbnQgY2hhbm5lbCwg
c28sIHRoZSBoYXNfcGlycSgpDQpjaGVjayBzaG91bGQgbm90IGJlIGFwcGxpZWQgdG8gdGhlIFBI
WVNERVZPUF9tYXBfcGlycSBpc3N1ZWQgYnkgZG9tMC4NCg0KQW5kIHRoZSBQVkggZG9tVSB3aGlj
aCB1c2UgdnBjaSB0cnlpbmcgdG8gaXNzdWUgYSBtYXBfcGlycSB3aWxsIGZhaWwgYXQgdGhlDQp4
c21fbWFwX2RvbWFpbl9waXJxKCkgY2hlY2sgaW4gcGh5c2Rldl9tYXBfcGlycSgpIC4NCg0KU28s
IGFsbG93IFBIWVNERVZPUF9tYXBfcGlycSB3aGVuIGRvbTAgaXMgUFZIIGFuZCBhbHNvIGFsbG93
DQpQSFlTREVWT1BfdW5tYXBfcGlycSBmb3IgdGhlIHJlbW92YWwgZGV2aWNlIHBhdGggdG8gdW5t
YXAgcGlycS4gVGhlbiB0aGUNCmludGVycnVwdCBvZiBhIHBhc3N0aHJvdWdoIGRldmljZSBjYW4g
YmUgc3VjY2Vzc2Z1bGx5IG1hcHBlZCB0byBwaXJxIGZvciBkb21VLg0KDQo+IA0KPj4+PiBBbmQg
dGhlcmUgYWxyZWFkeSBhcmUgc29tZSBzZW5hcmlvcyBmb3IgZG9tYWlucyB3aXRob3V0DQo+Pj4+
IFg4Nl9FTVVfVVNFX1BJUlEgdG8gdXNlIHRoZXNlIGZ1bmN0aW9ucy4NCj4+Pg0KPj4+IEFyZSB0
aGVyZT8gSWYgc28sIHBvaW50aW5nIG91dCBhbiBleGFtcGxlIG1heSBoZWxwLg0KPj4gSWYgSSB1
bmRlcnN0YW5kIGNvcnJlY3RseSwgUm9nZXIgbWVudGlvbmVkIHRoYXQgUElSUXMgaXMgZGlzYWJs
ZSBieSBkZWZhdWx0IGZvciBIVk0gZ3Vlc3QoImh2bV9waXJxPTAiKSBhbmQgcGFzc3Rocm91Z2gg
ZGV2aWNlIHRvIGd1ZXN0Lg0KPj4gSW4gdGhpcyBzY2VuZSwgZ3Vlc3QgZG9lc24ndCBoYXZlIFBJ
UlFzLCBidXQgaXQgc3RpbGwgbmVlZHMgdGhpcyBoeXBlcmNhbGwuDQo+IA0KPiBJbiB3aGljaCBj
YXNlIHBsZWFzZSBzYXkgc28gaW4gb3JkZXIgdG8gYmUgY29uY3JldGUsIG5vdCB2YWd1ZS4NCj4g
DQo+IEphbg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

