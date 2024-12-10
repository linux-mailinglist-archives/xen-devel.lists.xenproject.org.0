Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD00F9EA964
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 08:18:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851890.1265866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKuV0-0005lL-5F; Tue, 10 Dec 2024 07:17:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851890.1265866; Tue, 10 Dec 2024 07:17:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKuV0-0005iF-2O; Tue, 10 Dec 2024 07:17:38 +0000
Received: by outflank-mailman (input) for mailman id 851890;
 Tue, 10 Dec 2024 07:17:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Ho5=TD=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tKuUy-0005i9-4G
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 07:17:36 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20607.outbound.protection.outlook.com
 [2a01:111:f403:2405::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2da0656-b6c6-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 08:17:34 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS7PR12MB9503.namprd12.prod.outlook.com (2603:10b6:8:251::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 07:17:30 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8230.010; Tue, 10 Dec 2024
 07:17:30 +0000
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
X-Inumbo-ID: d2da0656-b6c6-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kro/ipH8Q4KDMqv7ySHO0CHfWPyfqTgXIu9jmjew2qliVRPeP2N3gKl+6dmjTXEaAXHuIZNXKsIECWZYvBPKz+CMi8vG8QpAW2q4tH7aQAMQsle7Gk1pABweSAZ9R7s/gAsx2EQ2i2Rr8Bp82i2ZgP45b53VwZLy71DWIkP1hihKwJKrfpaa+P9OunCiPmkCvxPED6nxj73IhrgtlIMuxkEhWk6CBr/+twFHBrRrN+jsbpCFK1QVf29xdFQAajxLPU0E9yd0O/559O73e4dUqZm0cf8ytK7/OP3yTTdFgle/5v3QiE65hcTuSQHFbb4/PWjeawivWRUd2QNat98StA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NGLjlrSD3dU4ZgxJf8dhYbDMLvlKQyK8dPKaHoyDmY=;
 b=nrTLgnjU0jSPtjNFQD/HnmBaX6pnutJQDITA13DIeTfSJ4rbhJydaLyG2crOLALpFJZNEToQcne8fgO+k/BC9QuO4OF12DlSB8TlGhmyVoPU5HfQMeLYEk0XUY2bZo86PNznTtxfrsU/vLrXSzVwIl8rL5HWL8r91IaeoFRc8qQv8RZTUvnyLC5JTSBgwRJ4RO1m+TKXcQwQIyNZEtrjaT1QvQQFeY/8+wK8749HsyHHPTitWuf5X1Eg8Hcan1M7Osm+FhsHVqIZqU6DzXgJQRX6sP/hxixLmrwsW7QE6hqnNEgAV4FrO+acXoqQqygfbjAzSiMcSdJYobe8jtIyEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NGLjlrSD3dU4ZgxJf8dhYbDMLvlKQyK8dPKaHoyDmY=;
 b=MtnM30QW85W5O783Mg1se2YDLGGaWN04yaYNjbKhFZde8hqUKHSZrOCJ70wkYr5bwyvlB5PeqaESrlfzwxU7ZHsMpWz88JsS8rxsRfxp+6xbru2Wrtv+MjwRxPD0zSXVbPanMWc4JQR+R/KpcvetbFZU0oD9sUkqSgqFqh3kwfA=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Anthony PERARD <anthony@xenproject.org>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [QEMU PATCH v10] xen/passthrough: use gsi to map pirq when dom0
 is PVH
Thread-Topic: [QEMU PATCH v10] xen/passthrough: use gsi to map pirq when dom0
 is PVH
Thread-Index: AQHbMBN9zgKXu6QHp0mudGAMtCr+w7K9RysAgCKFMIA=
Date: Tue, 10 Dec 2024 07:17:30 +0000
Message-ID:
 <BL1PR12MB58491C9D1CCC1880C442AF73E73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241106061418.3655304-1-Jiqian.Chen@amd.com>
 <Zztlvl0m-Oi2XGXq@l14>
In-Reply-To: <Zztlvl0m-Oi2XGXq@l14>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8230.010)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS7PR12MB9503:EE_
x-ms-office365-filtering-correlation-id: 19124c92-06ea-427c-492f-08dd18eab5b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?a0lyRXd4TGRNREdIOElYbnM0WEVid3ZFb1JCZVg1U2tPTVFoUngxZzZnRXFh?=
 =?utf-8?B?LytxS0xCT1ZBZElzcDBTakV5ZnEvOVJqZk5QYUU5c1BlZmlZdGsvZDRGaE1Y?=
 =?utf-8?B?UkwvcVBnZDFSUmNVZkpSSjgwU2hGcHpUZmIwcnA4MFVUVGgxS25zeWhiRGpw?=
 =?utf-8?B?SUYwUVZMbm4vNllsR25EYlhxOFpVUFh6TlUzSWttaTJXZzVCK25BbUt5TTJn?=
 =?utf-8?B?QmJCTVlBTW0waktnRUpNNTlQMlM2aGFGakYyZnJNUUpRR1lvVmdjTFBvWDdZ?=
 =?utf-8?B?b2NjZWF1YmJQZnBBcHBJc3VzNDVISDZrbU9jY0ZJbzBvVTRuVnRaMmxCclky?=
 =?utf-8?B?bXljcklrU3NyZDJtUXFGWmdrcFVtZnA2NHh2Wkw0dWlwUDIweU5udklXdjh1?=
 =?utf-8?B?ZWVoMUdIUTdZcWRPOWJ1cVI0S3cvUkx5WmN4NW00OXRLOTRSWEZUOVdqQUFX?=
 =?utf-8?B?LzkxMWpPaC9pNWpsb016QkhlakdaSktURzlucU12MlBMMG91OFZERmJhbTl4?=
 =?utf-8?B?bWk2bitDZHBsdGxZcjJsZlBoRkQvMkVsc1NNWjMwK1lwSHVMd0szVGZHWWlk?=
 =?utf-8?B?THlXS1pQSnlGUXhwUXBIN1pSVjAyTVp2U055cXlEVEpGNEc2RWxOeHByV0Jj?=
 =?utf-8?B?WUJWaTB6RkQwY0xnQUNTellEYzhTZ1BQRCtBZHk0MS9QWHBYYlVSanVkeTlr?=
 =?utf-8?B?RjB4eHBOV0RGMmw4eVhKd2pxNW1sS2NIcVN6b2VuL2JhaWVpS3RoL3h4UkJw?=
 =?utf-8?B?c2hTK0JpSXBneWwrMXhqb2E0SHZud3lEQ1AzVEZaODJOZDR5SjAzbXV2a2Zk?=
 =?utf-8?B?RXVyZjR4eEwzRzBPNkhjN3l6R3NMbUxIYVZNVHhOWGlqdWlndk55SGRTKzlz?=
 =?utf-8?B?Q08vNGdXZ29BVEQwTkhqS0dwei8wZjVtTEVsanZvaWFycmM1bWdpZmNQQVBk?=
 =?utf-8?B?YUZubWFGUTU4M24rN0gzSTJPM1J2YUd5ZjZMTFR0M2tqUjJJNUhRcklOU2pU?=
 =?utf-8?B?VnUrOTdWcnhpSE8zVG51UnpQUkpnRkZWNFd4c2E3cHAzRGc3OEJiOFBsWGZq?=
 =?utf-8?B?Wm4yaUsvMHowQkJFTzlsQVg1UC9mYWJqRGV1REVrdDNPclZBTEF6SEpPRWdN?=
 =?utf-8?B?QUhFK1hOQ3E5RXFRVDBac1BpZkdsVUpZcVdEbzk1cXZLOXpPLzRIOTgxaHZ4?=
 =?utf-8?B?WmE4L1hjQkNiZUdTODlhSHhxTExCV3d5a0Z1UGc2ZjBlYXJsaTBDd2U1KzND?=
 =?utf-8?B?b0tyZ29OQ0RTQnI0Wi9vT2lZSzRvQk5Xc2c2UG5SZHpSVUgxbkZMRG1WUE4x?=
 =?utf-8?B?WnRjRFdkeUdVaWhtK1d3R2R5b2huMGtUTjFMWjBQb0ZNQTdxOEtKN1B4Z1gx?=
 =?utf-8?B?dVVUb0NpMlFsdy8yOVg5ZWsyUTV2L2JBaWlkZXRDMHIxQXUxYmxVRXNZYmtH?=
 =?utf-8?B?VTdpNVlNYUFsU2tUMHJrbEpKV012blMvVmg2Mlo2b0hsbjhxTi9haEtrK05x?=
 =?utf-8?B?Y2xsT3ZOQzhUTDZMTFZ0K3d3Rm4yN0E3a0ZwRzJvdlc0VU1sRW5nWGdBV3Ez?=
 =?utf-8?B?U2txUVZOUjhkOUY0eUhOUFFhU0NBdnNhUUdNNG5SNEIzSyt6NGJ3N1MzYkEv?=
 =?utf-8?B?YU9FbW5XV0xNYnhjYmN4d3ZvVTdQVVJkWjZZdmNmMGVpWkRDTEtjeW5GZ3pk?=
 =?utf-8?B?UG93V24yY3ZJYVN6b0luY1RHM0tDdGNGNXhuMXkrTjB6ck9jNzBxVldoYXRD?=
 =?utf-8?B?RUx1TFc5TkFNaTd4b3lsdkxza3RtQmRXT0lzSXJHVE9vOVZsbHVKUmV1WXE4?=
 =?utf-8?B?Um1LM2Mwa3dFdk9rOENKeWoyQi8ycXBENWRpUU9DZ0FUeTZQSEI3SXEzeWhS?=
 =?utf-8?B?RlQ5WlIxUGlLbXZzalRVWEVvZUVSV0oyYytRRmJkUjg4SXc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bldiVVB5Y2JpZEptUWdCY2Y3ekErNTk2cGlRUGRERU1oU3pac1lMUXBYR2kv?=
 =?utf-8?B?SE9jTG8veHFkTnBlRUtEODFhSHRwN3hEcFJORDV2RXBCNlVNbm1YejNmSlhE?=
 =?utf-8?B?QkM0cHFvZEdVbTJRQlBzUzJnSEZSRjVxOGYrOTBncVdGQjBTNHNDZUE2bGJ3?=
 =?utf-8?B?c1FmZ3BxWkVkV0ZmUkFlTEcvem9oTzRYcDhTdHcyU2thQm56MzVUS3piV1dy?=
 =?utf-8?B?VlR6WjZmSElSbTJ0SWJDZW1rMlBrNWlhcXp1MWhzdjdyNE5xZ3d1bSsrS2Zy?=
 =?utf-8?B?b0VJdzRyc04yUDI0WVJVZHlIem5VVDRqcG1ncnpHcDU0Y2NxT3MrVVFUVW95?=
 =?utf-8?B?Wk80aUFSVmc2ajFMczdtbGllTjhHc2c2Vk9wV2szbFRHS0ZJM1lXZW5mRTdo?=
 =?utf-8?B?WUo5enZJSi82czFTbW40Vi95dkQzYzhkL2pJQU9ONkhkRWg5OHErcFlSV2VI?=
 =?utf-8?B?SXlaR2dPaWNLNCtNOCtaVHhqWE04UDQ1UzQyU0I1OUVYRVZZRjVHVDBWa0JP?=
 =?utf-8?B?THBPckhubk5yTkRlR0E0TFBqdUFrcGwraTlOMis0VDd6anNGSXVVZkdrZTRQ?=
 =?utf-8?B?WHdkNDVmQzNBdTdMUGI4L053cU9ldTRreEg1RlhpTTZOSEJlNVBhQ0p0Qmdh?=
 =?utf-8?B?d29WSVZ5UHlIRzRFbUdHTUZYeUg5RzhvUVovQnJUYnlwWHJma0ZnOWlyeUFp?=
 =?utf-8?B?azRqOGdDWWNNampFRnJmbkJFMkdyQzY5QWc3NXJEeEdtWk5abVIwQWVWSnRV?=
 =?utf-8?B?b0ZlNFA0Tms5My8zd3RYYVhCVDhnRGI3S0x4VitnZzI2YWQ2c2Y2bmQyZDk5?=
 =?utf-8?B?RWFQb0hkUzRDNG9RZGZuT2NScXFUdUNNTUNaT0VtYUdCWCt0dm1WRDB5K21B?=
 =?utf-8?B?ZzJMM3NScFY2TVlBVTcvR1BBSzYvNFl2ZFB6bDlKdUlKaDk4MmFDekVWbmtL?=
 =?utf-8?B?Q3VEa3VxZEdHRjNGTTFXR2kzSlMyRE42ck1ISzV6Vld2bERNa3R6Q1R3QjND?=
 =?utf-8?B?Qld1N3Z3UXJRQ1o4SDFJK0R0VFNtRWcwL3lHY3MxcVRtT1QrY0ZJZVo3cHZ5?=
 =?utf-8?B?WDNLeDk4WXkrUEZNUFNkYUxNbHpkOXAwWlh0a2JaNGkwa2JUTTYvYVJBQ2pK?=
 =?utf-8?B?QTFPZDRBODZuRjdIcWFnTWd4TlhpQ3hxWXlOMUI5SnRtOU1RVkdJdjVCMHRN?=
 =?utf-8?B?QktQYVBWd0ZkMVo3V24zZ3Fzd20vRlZLeGViMXVENWo0d1p5RXNSckxkUU96?=
 =?utf-8?B?VWRwVkpzTkN1azNQK00wRGxwbGFTa0JodlMxSkNOYnR4R01DbEExa3lqaStI?=
 =?utf-8?B?dHdFM25zbmJpSlhuc2xqM1NWTk5QcGNZUE1NUVBBdnBpaHRBWW5zMnl2bWxQ?=
 =?utf-8?B?bmZ5Wk5mMEZQcTFZcDMzV0tFNGJXOFhPV1VHWXZ3V005R3c5dmdxRlludWpD?=
 =?utf-8?B?SzV2M0dNQUhVZy9ER3UzdWVvQnpveWNXMkR3MlZQdldIa2RUcVZuN1E1MWdH?=
 =?utf-8?B?MWFBSHc0c0hQdDFvd09TYUpvcHRla3UyOHZIVmVCSHhHaVREZmR3dGdma01s?=
 =?utf-8?B?MWk2WVhDeDBEVnNkd0daSkgrOTE0OGloZ2NKMmJRQkptSGgzT3BQOGFmaDF5?=
 =?utf-8?B?b0J0N2RtZEdsa3JLbHlna3lsbWd1R1BzcFd3NVdNU01pQjUxUFJTS2FuWUla?=
 =?utf-8?B?SWlrRGs0SXV5Z2F4TDVoallvdjd5ZWxncVA2OStGNVZITkZ4STg0MnpTUmlM?=
 =?utf-8?B?VUorTHhaUjIybkpaY3pSTm03U0NCRG5ZRjdKUHh3QVZYOGVnM09tVFVwZERz?=
 =?utf-8?B?RHgrNXBTUDlGVldhL1FoTkcwSy9lSUsycC9wSDRpTjdRV1c1SjJTOTdCYU9J?=
 =?utf-8?B?SjdoOGNQZkdkeC9yR1dlTUZmL2d0dkJ0WkkySWhYZmp4UlhnS29XN2lCUUtZ?=
 =?utf-8?B?Ykx3Y1RjbDRWOURPUy9tOG9WbU8xVXRnN1dYTmp0Nnh0U1pVWmVIaFR3Ym95?=
 =?utf-8?B?Tkc5NEMyV2RVUDNHMnZQOC9BbVNtOFNURHhHRUN0SnF6dW43SE40N0NsVDJv?=
 =?utf-8?B?dFBzYzdLVzJNblQxOVpRRStxdm5qT2RQSk4xaXV5MTE2cmM1OVowekQ3KzMz?=
 =?utf-8?Q?PY4s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4DDD392F4AB7F8419E1F05A0129F2A5E@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19124c92-06ea-427c-492f-08dd18eab5b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2024 07:17:30.6029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZLY4M0g6ndmXQH5E/Y347Z2PdI/Vp3AJyEgByYqAQVT+Pk7b5Xe3GGhzCH7yBL/xcA8SAXKxbuSTkCbnfJ7aYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9503

T24gMjAyNC8xMS8xOSAwMDowNSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IE9uIFdlZCwgTm92
IDA2LCAyMDI0IGF0IDAyOjE0OjE4UE0gKzA4MDAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gSW4g
UFZIIGRvbTAsIHdoZW4gcGFzc3Rocm91Z2ggYSBkZXZpY2UgdG8gZG9tVSwgUUVNVSBjb2RlDQo+
PiB4ZW5fcHRfcmVhbGl6ZS0+eGNfcGh5c2Rldl9tYXBfcGlycSB3YW50cyB0byB1c2UgZ3NpLCBi
dXQgaW4gY3VycmVudCBjb2Rlcw0KPj4gdGhlIGdzaSBudW1iZXIgaXMgZ290IGZyb20gZmlsZSAv
c3lzL2J1cy9wY2kvZGV2aWNlcy88c2JkZj4vaXJxLCB0aGF0IGlzDQo+PiB3cm9uZywgYmVjYXVz
ZSBpcnEgaXMgbm90IGVxdWFsIHdpdGggZ3NpLCB0aGV5IGFyZSBpbiBkaWZmZXJlbnQgc3BhY2Vz
LCBzbw0KPj4gcGlycSBtYXBwaW5nIGZhaWxzLg0KPj4NCj4+IFRvIHNvbHZlIGFib3ZlIHByb2Js
ZW0sIHVzZSBuZXcgaW50ZXJmYWNlIG9mIFhlbiwgeGNfcGNpZGV2X2dldF9nc2kgdG8gZ2V0DQo+
PiBnc2kgYW5kIHVzZSB4Y19waHlzZGV2X21hcF9waXJxX2dzaSB0byBtYXAgcGlycSB3aGVuIGRv
bTAgaXMgUFZILg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hl
bkBhbWQuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNv
bT4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0K
PiANCj4gQWNrZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255QHhlbnByb2plY3Qub3JnPg0K
PiANCj4gQnV0LCB0aGlzIGZvbGxvd2luZyBjaGFuZ2UgcHJvYmFibHkgbmVlZHMgYW4gYWNrIGZy
b20gUENJIG1haW50YW5lcnMsDQo+IENDZWQuDQpBcyBQQ0kgbWFpbnRhaW5lcnMgZGlkbid0IHJl
c3BvbnNlIGZvciB3ZWVrcywNCmNhbiBJIGp1c3QgbW92ZSB0aGUgZGVmaW5pdGlvbiBvZiB0aGUg
bWFjcm8gYmFjayB0byB4ZW5fcHQuYyBmaWxlID8NCg0KPiANCj4+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2h3L3BjaS9wY2kuaCBiL2luY2x1ZGUvaHcvcGNpL3BjaS5oDQo+PiBpbmRleCBlYjI2Y2Fj
ODEwOTguLjA3ODA1YWE4YTVmMyAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvaHcvcGNpL3BjaS5o
DQo+PiArKysgYi9pbmNsdWRlL2h3L3BjaS9wY2kuaA0KPj4gQEAgLTIzLDYgKzIzLDEwIEBAIGV4
dGVybiBib29sIHBjaV9hdmFpbGFibGU7DQo+PiAgI2RlZmluZSBQQ0lfU0xPVF9NQVggICAgICAg
ICAgICAzMg0KPj4gICNkZWZpbmUgUENJX0ZVTkNfTUFYICAgICAgICAgICAgOA0KPj4gIA0KPj4g
KyNkZWZpbmUgUENJX1NCREYoc2VnLCBidXMsIGRldiwgZnVuYykgXA0KPj4gKyAgICAgICAgICAg
ICgoKCh1aW50MzJfdCkoc2VnKSkgPDwgMTYpIHwgXA0KPj4gKyAgICAgICAgICAgIChQQ0lfQlVJ
TERfQkRGKGJ1cywgUENJX0RFVkZOKGRldiwgZnVuYykpKSkNCj4+ICsNCj4+ICAvKiBDbGFzcywg
VmVuZG9yIGFuZCBEZXZpY2UgSURzIGZyb20gTGludXgncyBwY2lfaWRzLmggKi8NCj4+ICAjaW5j
bHVkZSAiaHcvcGNpL3BjaV9pZHMuaCINCj4gDQo+IFRoYW5rcywNCj4gDQoNCi0tIA0KQmVzdCBy
ZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

