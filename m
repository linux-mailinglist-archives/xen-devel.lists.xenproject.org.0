Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 205809459D2
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 10:24:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770522.1181289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZnZm-0002qm-9g; Fri, 02 Aug 2024 08:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770522.1181289; Fri, 02 Aug 2024 08:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZnZm-0002o1-6V; Fri, 02 Aug 2024 08:23:50 +0000
Received: by outflank-mailman (input) for mailman id 770522;
 Fri, 02 Aug 2024 08:23:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uPwv=PB=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sZnZl-0002nv-5P
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 08:23:49 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060d.outbound.protection.outlook.com
 [2a01:111:f403:200a::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89a0bf5f-50a8-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 10:23:48 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH8PR12MB7111.namprd12.prod.outlook.com (2603:10b6:510:22d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Fri, 2 Aug
 2024 08:23:43 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7828.021; Fri, 2 Aug 2024
 08:23:43 +0000
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
X-Inumbo-ID: 89a0bf5f-50a8-11ef-bc03-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NC9+UDxbOEA+nJ3pHEYrGoU0aboPMo+MOdMdnnNKRm/XufO8MVhNBaML4p9ma24NBz+nds5vhrfCwVvLOXnt/XTx85Ltil8fKqg4tTHtAbhwliiwnXX0lDJIH5QHpPS4lWmRv/d4eJUY+4Dtv1f2YSQP2B/93GwpPNOtnAJdDz1KOSjqu67KAElJ6n8uZaN1XTXh+mGqggC+3LZmbKJa8gylGSpgJHPxpx0igYWGCZhuk+FN1C20v2i22KYZ0jV7QbVbo89z0cqDAy9CEw6X+zfUnUPiGb5MuCNro/xt0n9k18jmbsIZwx8MScdXnxXNgs/W2kXeTc/sSyj28tdTLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i187gn9CPcijMwA5t3I7vtgJ6MsrVrT4NuyA0N6lhTM=;
 b=DYKGJCQWf0SvAdW3iRgvAN7lFBpvKKMYipyh/3zLsB2ljWICAnEItHDkSKGrQvPhVXfUEcTMk/8g5/FrL151MYz4Iy+YvXRsyD8rm1ro6MptpsyuW9tmgFTxD2XHHPut8wwVHpBlZdGnjeqyJU75aUpiIr3rjArrTKMpCJkDPgbLoBoCd79hceJiGu84EKaTgki9uNqkUewrppGlbNLymryzK8avO3Aa1ZYLRbRaLjMppJpbo2SsR3qJ66zBxdvJaoDfgv24BjbttihDJX3hGDWJjG3Mi5Rkb8+jji+Ir5zrAy4Rrqptkl8j75pkfM0JZnEcI7caincSV3gh9feJag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i187gn9CPcijMwA5t3I7vtgJ6MsrVrT4NuyA0N6lhTM=;
 b=M7vDAkmZAOELHCavN+GLgtJfTDIiFyxDJuTs4q9z+OzLZ5WLNG0Co9NVEI/VaEpYCkF9yuYGFDPUvpRvD0gRbmtnsMsxDNExKjlo6evVVcd6MyvvpyuOt4TpMNFmZp8dJczyQOFJ3XN/nMktyN4IPJj0kgNTNuOfe0SZJ60TdqY=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei
 Liu <wl@xen.org>, George Dunlap <gwd@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v12 4/7] x86/domctl: Add hypercall to set the access
 of x86 gsi
Thread-Topic: [XEN PATCH v12 4/7] x86/domctl: Add hypercall to set the access
 of x86 gsi
Thread-Index: AQHa0SvYL4tONjoIyEuzfSK6fk2TK7ITw+cAgACJIwA=
Date: Fri, 2 Aug 2024 08:23:43 +0000
Message-ID:
 <BL1PR12MB5849D2461AEFEF735A1A2F17E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-5-Jiqian.Chen@amd.com> <ZqyT7ocbP6AZEb_S@macbook>
In-Reply-To: <ZqyT7ocbP6AZEb_S@macbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7828.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH8PR12MB7111:EE_
x-ms-office365-filtering-correlation-id: 20e8429e-8e6a-4b3d-5fa9-08dcb2cc6bf5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L1QzU0lLYVpUcVMzeWNOUFNjSm15RmFDRUk3ZG45am9PZG4xZ1NnVFZNcFFu?=
 =?utf-8?B?WUViMmx1ZG9ZRExRTkJzbHlmeG5iclEzTXVreDBUQlM1ODAwelBvWnJzdjgy?=
 =?utf-8?B?ZE9LUm5xRk95dXFHSWVpSEd5UHZ3N0hSdHcwMlU3M21kbVIzaTZBRzN2VFNI?=
 =?utf-8?B?bVFHRjYxNFpYSHBab0x4bGRIeXZ6TnpGUzlrMENIYzNLQVJBUWxjcHlQTFFn?=
 =?utf-8?B?ZEY2b2ZYZGMxanJBajhOMENEcitvSGVPK0kzV293OHZMRU0raDNsOWpPYXFN?=
 =?utf-8?B?WDhSalBwcjJDbFpSbFJtSEMwcUtrR3BFaEh0YjF2RVQrbmovNFdRSWkxS2JL?=
 =?utf-8?B?ZkRydWRWU0xhbWVSZGEybVlZU1hRS1hDdU1FbEdSZ0JYT2ZuY3lDM3FHSDdm?=
 =?utf-8?B?eUxFRnVKUVFGbnZoaTRZTU55d0hmN1hqSm83ckQ3UU4yYTJnOEtXUHFycXJx?=
 =?utf-8?B?NjdBWVpDejhPWWNmR3JUM0NyUldVajdmRTVLUThlZTR1ejRHdGZZY1M4YUdJ?=
 =?utf-8?B?dlFLcEFPVC9YenRGKy8zVFFDQU1OU2VSTjJINWcwTUl2Q0tVK1VYb1RJdVhu?=
 =?utf-8?B?V2x4VEJRUDd5UThYRXh0NFNCNThteThWRkFJRit3VTFzbExiVHBybGR0TDlX?=
 =?utf-8?B?NUJaQjV3bDgwRVVRM0VGaDJobStUMjdUM3JtTGI0RWhSVnlKRi9VUitBR3hl?=
 =?utf-8?B?cVdwSTVOeFY1MDIzUENOMHI4NklzdElJS0w4Um93NDBWZnBpeUl3Tkd5U2VB?=
 =?utf-8?B?ZmdaZzVNLzJrU3hVTkhYTUs4R0NtWklpSlloTWdTZW9HeDZFM0ZxdGpvNzBv?=
 =?utf-8?B?RnVTWG5IbkEzS0IvSnhQYjYvLzNEdUlyMUo3K1BHNVdZaFBhZ05USlZ3b2Vp?=
 =?utf-8?B?VlBxY29LTU1ncnJzSDg5TFJNTG9ickpLbHhiSFdYSFpVdVZZakJXcXQ4Skh5?=
 =?utf-8?B?aGNLV0EyL3JtRFBrc0xGNTR3V011Y3FPOUFzNnRWcm1PdXNzV1JwczZhNzZu?=
 =?utf-8?B?ODZ3dXZzSnRxaWVzbW5xdzVDT2QzVGZOOGtsV20zbzdHTjU2S1NGdTQ3aFFG?=
 =?utf-8?B?cEtqUlQxNC9KWUxxWjkzNWJKQmhjR3VGbnJtSmprdmVkY3h3aDVnbWN1Tjgr?=
 =?utf-8?B?OG1DWjBiejdYSXRycEJEeEhqL2dKV0RhTG9yOXN0Rm5SRm9pd3E4eWR2U3BU?=
 =?utf-8?B?SDBYUGtnTUtpbXFYRmVGaU9EN0VHMEptSm9PYmtRUHVqa2JxcUhKQ0lCdGp6?=
 =?utf-8?B?YmFjMVU5eStNN0lZTVVwRGRtL29xZUI4S0c4VVRUME9GZnpsbnUvTDJpZzl1?=
 =?utf-8?B?MUQ0dUNmVEZrVytqbGdkSkRVa2lRczFkMXZkVTNJVkt4OFhRNWZacXRPU1BT?=
 =?utf-8?B?NzRjZmsxWS9TaVhSQVZ4VW52VmhpUlVFMVlnMXQ5UmxwbTFKdFEwdDBnSkYx?=
 =?utf-8?B?WUNadUQ4YlZ2K244R0pEL0RCeEhCcVJpWkR1V1N1UVZlbG53L2FGVHJxdGVr?=
 =?utf-8?B?a0lseXl3eDVVZHNYNUxoZW5YMEQ1SDNTSy8zSXZiNzN4am1xRjFWOElCTTZY?=
 =?utf-8?B?OW05bEhyblVKbjJNV2k0c29GYnh4cFBwTWIwdnBFVk12SjB1dTZ3cFJBY1hS?=
 =?utf-8?B?YkxGcWdGRTlHZmlMQ3c3aFRWY21idTM1ZHluMFBxeFhMNlg5UktlVUFrZVE3?=
 =?utf-8?B?L05HWVVLVlRSVXFGQS9qUVlGQzdSamxGRDcyN0dIUVA4MVcrblZHcGUwOGth?=
 =?utf-8?B?MEVtY0Vjd0dWTXFuRWZwYzcyVWs4djBmWHFTV0htL2JBZXJORlkzdk85a0NQ?=
 =?utf-8?B?K05wUVI4UXhQcFFrSmEzVGxDSzZ6bDQ2MlBIbTh3am1ITGpkd2JDaHpleENw?=
 =?utf-8?B?anhjZW1hYVRVNExHQ3hYWlZmSS9aODliY2pENnJJaGQvaHc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z0tVdXhjeUZWUkdub2RtaFNLa2lmOHBaVnlwaUpmN0RIclFWT0xCV01HeC9G?=
 =?utf-8?B?QXkrUEZ0cTJhUVMyYkcybFprVk5pV2dLYzZmZjVKNmZjbEQvVVNKVUZVNm1S?=
 =?utf-8?B?MHZSZ0ozb0U3d29rQlh2QWNpckR2d1M2empKZVZxclJhbWIvRkU5T1FpNUd6?=
 =?utf-8?B?TGN1NjQ4Tm50MTk2NjZBZXV6SnZtaUNkT0lJbE9XTkRmMGhGR2Jud21Cd3Az?=
 =?utf-8?B?Y2t6S0VZOGJCZm5MRVBYUDJYaGxIYkNYbnZGcUVkRXhNa1BGa1Q2WWFiaFdi?=
 =?utf-8?B?S1grbkZLTzlvS2dVSEh2U3dIK1RwSHBKWFNYMlBNcGVmMndLNDAwY3RGNU4r?=
 =?utf-8?B?ZTVRSVYyWXNhbzdXMXAwNXNSSTF0WWRIMmxuR3dkQ21HakVLODJ6ZG0xSmM3?=
 =?utf-8?B?QkM1c0dTN0FVd0RvVFpiWk5PbGI4MXdzK0U3V0dzRGZlOG9teWhsKzFlcFpk?=
 =?utf-8?B?bW5QQW91cTZ0UUFVYjVGdWhqQ0FiQW8yRGRVUlBHNmZVZmMyNjZxOHR0OXpH?=
 =?utf-8?B?R2VEUXVpY1hYSTB2eHNvdDQxQlkrclRxZTNXNytCc2RYQ05JcXdRYlVyRGVx?=
 =?utf-8?B?bjNXYnB6dmZtVjhlT3ZkSzhkODEyMEYwZ2xWeUsxSjdMTzI2VUtqRUdjMGJT?=
 =?utf-8?B?VU1RVlhKcFpVQnNkb3pRZmwyZVQxOXljYjFLYXhIbkJQWkthd0QrQnJVMUMy?=
 =?utf-8?B?cnVVTS8xQktmVVhYY3d0Nno5Uy9ZSUNEZzgvZHZabVdKRW9wQW9CaHhJWGxx?=
 =?utf-8?B?eFBMKzg2S0k0RnF0QW1KSjFwMHZJL3Z1ckNEMlkrVHJiMERSMFFISi9iMy9z?=
 =?utf-8?B?d2JaYzgxM0pmek1TRWpVTEdYVmxsMEpXdUNQTUh2TlBVa0VSVGg3VUVuM24v?=
 =?utf-8?B?N28zWDVzMUlGUXo1a1F0QWJ6RTVFRXVnTHJDZXFxeWhkVTlFOEtrK09IaitP?=
 =?utf-8?B?NnVOVkRPYis4Tm1lVkhDc1kxWDdZNG53NmxSenRUQkRFYVpod2VybkRiMTc1?=
 =?utf-8?B?M1lYOHNVOVBtbHhiZGJkZ0w1T3dNZDRpR0NBaXlDVlBINmN0VUFzU3RJTDYw?=
 =?utf-8?B?a1FzVVJKY2s2WFM4aTNVdFdVb3V6aWo2QU9GQXN2Z0UrUXl6RFExTFh0SjVZ?=
 =?utf-8?B?dnQ1RlEyaC90clNOaVNtdS9XMzJ4bGdKN3JLY2Z6L3JYcFllY1FrV1JaTXg3?=
 =?utf-8?B?WmxzT0F2VVFQamZxRG1TUkdLTnEyc3padXVtVjNOQlluaWtMenh5TlJxQzM0?=
 =?utf-8?B?YjkwdURMZTNoeERuMTJkaUNCZFdvOW5wKzBrWkJHKzFWeGVTcFdWeEZJdWEv?=
 =?utf-8?B?bGxhektzNUZEL0lhUE5KWm90K3BrcWFNaHJvVXA0OWN3WlFpVnZHWEtFRjlx?=
 =?utf-8?B?VkRXTit3cGtWOTVNbE5GdGtncDlkeHF6Vm9aK2pFUzhKc1NjVTZrQU5xYVRz?=
 =?utf-8?B?d2xyZFYzZ2xjbkx3ZWpPeHFYbU9NVm83d2RIQzUwQkNBelluVE8zMVNDRmk0?=
 =?utf-8?B?K0F4bUQ2MkNJbmczR2tFL1RrZFE2aTl6RW1mUGtrelBlaTRCNm5QTUFRZ1R1?=
 =?utf-8?B?MTJQVGZucmxqelkzMXRMNnNqVVBoMmh2c1NLQnBtaEtRd0x4a0RzS3hMOFlZ?=
 =?utf-8?B?RlhCYWg2MUJOZStYYTFOTEJiVFl4anBZU0tZOVZla2hRUVEveUREcnIzMHhK?=
 =?utf-8?B?VmRJT2tnd2g3czVhUHRuVlpnbHl6emdvTWRZZVhYQi9hWFFnekhZNDFzLzYv?=
 =?utf-8?B?QjhkWEM3VVIzaDY3cHp3ZDVVTmFwMXVMRjB6SFQvR3VSaHVCY0IxbXZYQ1Z6?=
 =?utf-8?B?RXJTbnhVZ1JoRVV3V2wxQThFYkMyL29JQytQR0VJRDVXRk9tUnIxeHpCY0JJ?=
 =?utf-8?B?QXpvenU0RzdBa25JTjJwcTBuOFlwRXA5Q3lDcnFpR1M2cmhWVmovczR2MXdo?=
 =?utf-8?B?UkpuVi9JMlZwb3k2eWlCcUR3YVpPRG9venA5MDcveTAyUHN2eHZVcVVYSTVr?=
 =?utf-8?B?bmJjaWNMbUxtN01WVXVpOTJ5UE9qV0xEczZqZU94NzJ5SFo0c1BBWEh4dWhI?=
 =?utf-8?B?UHJOWFpGN2FVR3doWUdtTmNUMTdvVlQyUkVLOS8zUmpkOWJ3VWVqQlExU3dY?=
 =?utf-8?Q?+A9g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9295BB0216942D4E8C38E1B11B8AC931@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e8429e-8e6a-4b3d-5fa9-08dcb2cc6bf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2024 08:23:43.3663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M/EInlKYvuyJiC0ARrSyTedC4RLChJ56snTS5NOeGsn6FC/p2ySiNTw0oB5kuqf64DMJ/Bt5nCxSUE4qaQZhLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7111

T24gMjAyNC84LzIgMTY6MDgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIE1vbiwgSnVs
IDA4LCAyMDI0IGF0IDA3OjQxOjIxUE0gKzA4MDAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gU29t
ZSB0eXBlIG9mIGRvbWFpbnMgZG9uJ3QgaGF2ZSBQSVJRcywgbGlrZSBQVkgsIGl0IGRvZXNuJ3Qg
ZG8NCj4+IFBIWVNERVZPUF9tYXBfcGlycSBmb3IgZWFjaCBnc2kuIFdoZW4gcGFzc3Rocm91Z2gg
YSBkZXZpY2UNCj4+IHRvIGd1ZXN0IGJhc2Ugb24gUFZIIGRvbTAsIGNhbGxzdGFjaw0KPj4gcGNp
X2FkZF9kbV9kb25lLT5YRU5fRE9NQ1RMX2lycV9wZXJtaXNzaW9uIHdpbGwgZmFpbCBhdCBmdW5j
dGlvbg0KPj4gZG9tYWluX3BpcnFfdG9faXJxLCBiZWNhdXNlIFBWSCBoYXMgbm8gbWFwcGluZyBv
ZiBnc2ksIHBpcnEgYW5kDQo+PiBpcnEgb24gWGVuIHNpZGUuDQo+PiBXaGF0J3MgbW9yZSwgY3Vy
cmVudCBoeXBlcmNhbGwgWEVOX0RPTUNUTF9pcnFfcGVybWlzc2lvbiByZXF1aXJlcw0KPj4gcGFz
c2luZyBpbiBwaXJxIHRvIHNldCB0aGUgYWNjZXNzIG9mIGlycSwgaXQgaXMgbm90IHN1aXRhYmxl
IGZvcg0KPj4gZG9tMCB0aGF0IGRvZXNuJ3QgaGF2ZSBQSVJRcy4NCj4+DQo+PiBTbywgYWRkIGEg
bmV3IGh5cGVyY2FsbCBYRU5fRE9NQ1RMX2dzaV9wZXJtaXNzaW9uIHRvIGdyYW50L2RlbnkNCj4+
IHRoZSBwZXJtaXNzaW9uIG9mIGlycSh0cmFuc2xhdGUgZnJvbSB4ODYgZ3NpKSB0byBkdW1VIHdo
ZW4gZG9tMA0KPj4gaGFzIG5vIFBJUlFzLg0KPiANCj4gSSd2ZSBiZWVuIHdvbmRlcmluZyBhYm91
dCB0aGlzLCBhbmQgaWYgdGhlIGh5cGVyY2FsbCBpcyBzdHJpY3RseSB0bw0KPiByZXNvbHZlIEdT
SXMgaW50byBJUlFzLCBpc24ndCB0aGF0IHRoZSBjYXNlIHRoYXQgWGVuIGlkZW50aXR5IG1hcHMg
R1NJDQo+IGludG8gdGhlIElSUSBzcGFjZSwgYW5kIGhlbmNlIG5vIHRyYW5zbGF0aW9uIGlzIHJl
cXVpcmVkPw0KWWVzLCBmb3IgZ3NpcyB0aGF0IGhhcyBubyBlbnRyaWVzIGluIG1wX2lycXMsIHhl
biBkbyB0aGUgaWRlbnRpdHkgbWFwcy4NCkkgd2lsbCBkZWxldGUgdGhlIHdvcmRzICJ0cmFuc2xh
dGUgLi4iDQoNCj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlx
aWFuIENoZW4uDQo=

