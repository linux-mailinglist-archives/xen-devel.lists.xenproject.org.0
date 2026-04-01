Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CLQI6fKzGn5WgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 09:35:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5B3375FC9
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 09:35:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269823.1558709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7q65-0005Ul-6K; Wed, 01 Apr 2026 07:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269823.1558709; Wed, 01 Apr 2026 07:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7q65-0005TN-3R; Wed, 01 Apr 2026 07:34:41 +0000
Received: by outflank-mailman (input) for mailman id 1269823;
 Wed, 01 Apr 2026 07:34:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <penny.zheng@amd.com>) id 1w7q63-0005TH-Jp
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 07:34:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7q62-003JvB-Vv
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 09:34:38 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <penny.zheng@amd.com>)
 id 69ccca8b-bab6-0a2a0a5309dd-0a2a4505dcfe-12
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 09:34:38 +0200
Received: from [40.107.201.30]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <penny.zheng@amd.com>)
 id 69ccca8c-5aeb-0a2a45050019-286bc91e3298-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 09:34:38 +0200
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 BY5PR12MB4243.namprd12.prod.outlook.com (2603:10b6:a03:20f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 1 Apr
 2026 07:34:32 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%6]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 07:34:32 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AOD96thFTYQHhpQUneVeA61TprJUZidKZzRJongXjQqkdzGSnwSQPBdRErKJjgwSvNkA5Oa/dPe6ctoMNrzpJUWd/9FI9nQZ/lC3w6HAdGfc0nf9psKkeyszENrAuDNJ9sFs71OJ5tMy7+IoXR3v/3Tr2kIYyHSDOK2x5G87gkqmODjY2BIVB/+wPkdQzO6KgKSBKjza6EEs8atkcee0cy2SJNqRIvRaEucF+PBf37ZvhjINvHRncc3TZaWYOmxgvYrnONkk1OZ8QQfNJclvr82Q49adM8Avpgxazt8shJ3EiW2OCD4G1ShgTtrD+g2+JqbW82E8imi8AtZvxVqmiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfewqG2xAv+N14UNDbtlSiLtkkD0m9BGD8h0UcutuAA=;
 b=nf+TPeVGJE+X01Jwsfb60GQhnOWI4IZioz48wn3X9ashEWnBOV+sBlx0l+xYRlKvA9s4oPQSIPqlXp4I1NwvSJdBiMnx9h4sKhqYxtX5XObtrJk00N0WHZtr3TuQO0JGU7BUMd2cX+hvCB37/d6C8KX8IXNCeGFkABZh2woMBqgzJllwKQiu98spWWJnZqal4UiHrrX5hCoF1Pk4b2jOsh2g7P47judYw2tLnBOtBYIWklFYjrWMDzKIJH+hIeSDpz2ibY3+oc56C1smf5T7a23/ognRmMQXudmn8bKpXdO0iK5kFWpdR72KK+cW0n0lRZWiWAb21JOgLwN1RjH0+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfewqG2xAv+N14UNDbtlSiLtkkD0m9BGD8h0UcutuAA=;
 b=DQBxl1vLCj58C4yY1ul5C+8RQOfR9pFwZEO1cu0uQ7pwT+OZbvrxAh9fN3VYKQOBcR5B9+F/cDvK/I/rfHlCzbqbj/dRgJ+mQogdpFPkzbyft5GMJWRSROhd/ZaAMJ8r15AvNaodFJhEyIydN1V63ii0fhclvJuXiDhDHvIQwys=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, "Orzel, Michal" <Michal.Orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Garcia Vallejo, Alejandro"
	<Alejandro.GarciaVallejo@amd.com>
Subject: RE: [PATCH v1 1/3] xen/arm: generalize per-page GFN storage beyond
 xenheap pages
Thread-Topic: [PATCH v1 1/3] xen/arm: generalize per-page GFN storage beyond
 xenheap pages
Thread-Index: AQHcvb8lM85JfRwCbUCtKWTFoK4zzbXHHE8AgAK1uwA=
Date: Wed, 1 Apr 2026 07:34:32 +0000
Message-ID:
 <DM4PR12MB845158C2026FA4EA00E2409BE150A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20260327075025.3008606-1-Penny.Zheng@amd.com>
 <20260327075025.3008606-2-Penny.Zheng@amd.com>
 <8a0762de-493f-46f7-be8d-25949532e2fc@suse.com>
In-Reply-To: <8a0762de-493f-46f7-be8d-25949532e2fc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-04-01T07:34:09.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|BY5PR12MB4243:EE_
x-ms-office365-filtering-correlation-id: c2689964-6f62-4303-8b40-08de8fc11dd0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 KuSqZsJ+f1EKdBwcrhFOlPy+YE9hUfLX+wG7xEEDzO5dl6dI3U6HmiHbNKsQFiLBGm9wzNJH/2xyr7wbQp0x1FAGXRp9eww9hH27Li+OirJyoVoAPUpzNBcGyzKWJXSz41GA9QHLBQlS1HQGB3d+AdDASCoPO0XqIdkcbSZ5o2x+Dm6ppsY6l7G5dHaQ1koqPzwRojOaHSdDftkq4kPSemn4RxAXZgQSOwS7BDsh8lKK/W1vKAqyrcnXOKFs7QhfO/bKqxkOmtPNWxH9WL+ceJ/M5DFM9xIdQUXthr73QgvZPwwztSv9MojuzjIuydWsSa0sOR1O8BCvF8AjIoc0bp6mWqoBYsIVBQj8nnArkmpvvbTioRinNhPaiuFwHf8ujgsxOAoaZ7BYVgznF9bWw01ZDyDCC+Ad65GfTdqP5kuPUdhEkBaB/kp+S9RU4t1D9dVIyne0+hnLyNxEF0WCAb8Q3ImvECP+GQ7xbvrqLKvSnlqQL53gzWVQW1t4tW3ah+PkoMwev7YdoXgT0+uTqj00qPZA2VH9spktVrUqhCNA65fN4p2RS9BBqV4shUdM0ypYdlAs+X7sos4Nb3Zf/gx44FjaBg0BiV+HA5o0QR62ASriMx9L1Zk71z61ZNIDyoQZEKQueN5Y5ew/LBy8QQIkB5iPv4ryqK9hIQkHjXFSg3rxe0/SrHfG9T+lTiigXBd2PuLrHnAtxCMlIpPCOW21MLthCTWGfQl4gHfzWqmCNmjORhwbNDL5pE+0PxN/wi3XtNmDwOJmuTeocmIyIzpAe374GZ6UfKsgKj4/Al8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eVV3ekdKSFROTHBOQzA1ejFLRFRLbGhJeVI3clk5M1pjWmJjbWZKRytQVCtt?=
 =?utf-8?B?ZUpBc3NQWGFqNG0vYXROUjRlclliWi9vZVlyQVJPakFiS1hZNWZUT0hXelJ4?=
 =?utf-8?B?MUx5VUM4eEZnSjBVdUY2M2FvMVpxSWM2eFkvODhVK2I5Zzhtc2QxRVhIMVVh?=
 =?utf-8?B?dHpqRXVXTk9lZmkxa2ZmMTJSRTF5bzNyNWliUlFKMjhrRHZEVjVULzlLQ1c3?=
 =?utf-8?B?SCtkSjNveFl4RFZvVHUzeWhoVmwwVS9ON0NIdVlNTU41WnMreEVWWnM0cjEr?=
 =?utf-8?B?SnE5ZllmRHZOMVZqdGxuOThzdXdoaC9ZS0JGeWpQejFTZTJBdko1TjUyd2FS?=
 =?utf-8?B?V1psSXdNZEZ1YUV2VGMwUW5GdHAzSlZvcW0wb2RXU1MwMzhvSDVob2I5WkZ6?=
 =?utf-8?B?ZkpzV2RyZGxBdDlVNEtsNDF3QlZ3WDllelViWmEvN1RKVm14T2w2RFdTVFRz?=
 =?utf-8?B?QTlxMXJWbCtaclEvNFpmV0lsTkdBa3dkU0oreGlDVjRzemV1Z01RRURvaGNl?=
 =?utf-8?B?TnNnUkIycWFWN1ZYNnhCRkZOYzd2Y3l6aUozWmdvRFhlcVhISVArNnZqcndT?=
 =?utf-8?B?RzN2YUFkSk9CQ1pjN1VsU28vREkxeHpLODRnRnJuZkZNa1Vac2NwUkRwRmt6?=
 =?utf-8?B?VkRBY1RJWmZ5L2ZzY3M2YU1vU2RRVDJqdG8wYjNDODh4UEkvNW5TNVhjaUhM?=
 =?utf-8?B?NTRtY2hZOUhhUmNxZGdVYW43VGNSc203ZVhPenNwbml3N3VPTnJPTXJxRllR?=
 =?utf-8?B?bXp6QUFNZ3RzYS94bklkSVdGZ2JEU1VwVmxTZmFoNUxsN1Q0d1kyNncrL3Jr?=
 =?utf-8?B?NkVYeWhQLytXOUlFbmxoRUlvS3IwbEZTeUVvelZwb093ZFVMVlcxQ3gzQ3ps?=
 =?utf-8?B?d3BpQXNkaXVWTERwVXY0NXB1OFE5YVFPRWkrakY4YTNMbmJTbkUxc0l0bFpT?=
 =?utf-8?B?SWZMaDN6YVVDK3R4aVU0SHpkN3A0QkZjbDI3Uzg4TW10RTBJM3hmR2hUdDUw?=
 =?utf-8?B?OWZYblh6dkNhbDdkM2VuYnRhVkgxR1NIRFpkMVF1RmFwZ1A5bUNBajYxSXV0?=
 =?utf-8?B?MDN6cFVvMnFBRWFuYzMxc0VyNzlXU2lCTEZ6SkNBYnB6eFhzSzZ2WUVab1Vj?=
 =?utf-8?B?YnlxTXFaSFM1ckZKQ0FqYU05MjN3ZjhqK2M5RXExV0U4R2t2cUdHZkFkZ1BW?=
 =?utf-8?B?T1BzTnM3VnJKaEE5ZFI4NTA1S01kZzd0YTBrUDZYb0RHSXFOV1UvMUIrejVD?=
 =?utf-8?B?Z3IzazN3RGZCaWFQbE1BOThZYnR6QS9WK29KYTVKZkVFRkJFRzB1YTV0aWdU?=
 =?utf-8?B?aUlXbWRzS1hWL0lBRXA1SjNXR0hRai83bXFQZlZKN1llWUlVT1dDVUphblov?=
 =?utf-8?B?dWEyZDlxSHRBTlNRZlhsQXp5K1ZmNkZvTWlqdkdKVC9FQmNRaUJrNGZ3emd3?=
 =?utf-8?B?QUZ0ak5qc21aTklxVytFUEsyeVgrbUZUSHV1MmZUcFlvMFd2TktuSDlXaVp0?=
 =?utf-8?B?Vy9IcnFaQlowbU9PVFVQUkFWVnN1ODlNVG9TTXZsN3h2TDArM0hDYURTSkF5?=
 =?utf-8?B?TmZsRHk4Z0laMEJlb2MzM2x0MDRCeEF4NjRnSnZWM0RmOXY2enphdC9sU0Rw?=
 =?utf-8?B?UTdjdEcxcHkwSU1NY0ZrTTZHQW1wZS9rU0wzbktsS2NFOU1yS3VqcmV1dzBx?=
 =?utf-8?B?RDdVdzlpdS94UEpYY2hNZzRFSUNRS1UxYXdMNHpBcG1scGhpZENKM1ZUc0ZN?=
 =?utf-8?B?NlhFamZrUGk5c29CdHF1L21KelFIdXpQdCtYVVh4aXF4ZU5PZ0pFS3c0UC9D?=
 =?utf-8?B?OEhrMnAyeWRsMU4vUHpITnpSdXZweUpqdEd2ZXhmSjJ3MndHOTlyVUc0akkr?=
 =?utf-8?B?NTF2ZU4zVmIzd1l5ZkNERkdMZDdJWUM2U2Yva21IWjQ4VDdNN2l6RVRZbGdt?=
 =?utf-8?B?U3JWMWdiR3VUbG03N2hwc1RPWVlkSDh1Qis5QlUxckNLdmFqWlo4Q1pCNGRr?=
 =?utf-8?B?VlpiZEFjZUhuNHF3eEZGZDZOb3hrWWYwNzkwbXFtRWROOFNsTFVWa3hCQXVN?=
 =?utf-8?B?NFdCbUUzMUpoei8zaVFLSzNCeFlJSlRqTTZPdVNhMHlCaWNJYy9LTVh0UW9i?=
 =?utf-8?B?T3pmdk1ERkxLbHJFdHRQRWtxaVpYZWRhdEJxbDJZcWozbDhiL3pnU2RZcVBq?=
 =?utf-8?B?b3JGeHQ0aUV3d0VtdG1kQlNqSDAwODBELzA4eFZGdE1TNUZaTVczYmpxeVpT?=
 =?utf-8?B?OXVpSXN1QWVoMVZpcmxINmFxMGswUTZJYkU0WXVvUkFiL1U5UFVGZ2dDS2Ex?=
 =?utf-8?Q?hLPJeeA63WtW9kK809?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2689964-6f62-4303-8b40-08de8fc11dd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 07:34:32.4661
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GfNuZ/LZj+tkVaTmOFnK6PUym/Nu+4LayDw0wR8IB9kzXbCd3/BrKhceGLYfnoSIoXNH30ZMlFPLa5dapwWKdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4243
X-purgate-ID: tlsNG-c201ff/1775028878-2229B488-3C6C4358/0/0
X-purgate-type: clean
X-purgate-size: 3740
X-Spamd-Result: default: False [-1.09 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Ray.Huang@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Michal.Orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,m:Alejandro.GarciaVallejo@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[penny.zheng@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:email,DM4PR12MB8451.namprd12.prod.outlook.com:mid,epam.com:email,arm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[penny.zheng@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DD5B3375FC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBNb25kYXksIE1hcmNoIDMw
LCAyMDI2IDk6NDkgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4N
Cj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5p
DQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9y
Zz47IEJlcnRyYW5kIE1hcnF1aXMNCj4gPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT47IE9yemVs
LCBNaWNoYWwgPE1pY2hhbC5PcnplbEBhbWQuY29tPjsgVm9sb2R5bXlyDQo+IEJhYmNodWsgPFZv
bG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Ow0KPiBHYXJjaWEgVmFsbGVqbywgQWxlamFuZHJvIDxBbGVqYW5kcm8uR2FyY2lhVmFsbGVqb0Bh
bWQuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxIDEvM10geGVuL2FybTogZ2VuZXJhbGl6
ZSBwZXItcGFnZSBHRk4gc3RvcmFnZSBiZXlvbmQNCj4geGVuaGVhcCBwYWdlcw0KPg0KPiBPbiAy
Ny4wMy4yMDI2IDA4OjUwLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBBcyBwcmVwYXJhdGlvbiBm
b3IgZml4aW5nIG1mbl90b19nZm4oKSBvbiBBUk0sIHdlIGV4dGVuZCB0aGUgZXhpc3RpbmcNCj4g
PiBHRk4gZmllbGQgaW4gcGFnZV9pbmZvJ3MgdHlwZV9pbmZvIHRvIGJlIHVzYWJsZSBmb3Igbm90
IG9ubHkgeGVuaGVhcCBvbmVzLg0KPiA+IEFub3RoZXIgdXNhZ2Ugd2lsbCBiZSBpbnRyb2R1Y2Vk
IGxhdGVyIGZvciBzdG9sZW4gcGFnZXMgaW4gbWVtb3J5IGV4Y2hhZ2luZy4NCj4gPg0KPiA+IElu
dHJvZHVjZSBnZW5lcmFsLXB1cnBvc2UgcGFnZV9nZXRfZ2ZuKCkgYW5kIHBhZ2Vfc2V0X2dmbigp
IGhlbHBlcnMNCj4gPiB0aGF0IHJlYWQgYW5kIHdyaXRlIHRoZSBHRk4gc3RvcmVkIGluIHR5cGVf
aW5mby4gVGhlIG9sZA0KPiA+IHBhZ2VfZ2V0X3hlbmhlYXBfZ2ZuKCkgYW5kIHBhZ2Vfc2V0X3hl
bmhlYXBfZ2ZuKCkgYXJlIHJldGFpbmVkIGFzIHRoaW4NCj4gPiB3cmFwcGVycyB3aXRoIHRoZWly
IHhlbmhlYXAgQVNTRVJUcywgc28gYWxsIGN1cnJlbnQgY2FsbGVycyByZW1haW4gdW5jaGFuZ2Vk
Lg0KPg0KPiBXaHkgd2FzIHRoaXMgR0ZOIHNldHRpbmcgbGltaXRlZCB0byBYZW5oZWFwIHBhZ2Vz
IGJhY2sgYXQgdGhlIHRpbWU/IERlcGVuZGluZyBvbg0KPiB0aGUgcmVhc29ucywgcmV0YWluaW5n
IHRoZSBvbGQgYWNjZXNzb3JzIG1heSBvciBtYXkgbm90IGJlIGEgZ29vZCBpZGVhLg0KPg0KDQpU
aGUgb25seSBjYWxsIHNpdGUgaXMgdG8gc2V0IHNoYXJlZF9pbmZvIGdmbi4gSSBhc3N1bWVkIEdG
TiBzZXR0aW5nIGNvdWxkIGJlIHVuaWZvcm1seSBhdmFpbGFibGUuDQpGV0lULCB0aGUgb25seSBs
aW1pdGF0aW9uIGlzIHRoYXQgaXQgc2hhbGwgbm90IGJlIGFwcGxpZWQgdG8gc2hhcmVkIHBhZ2Vz
LiBJbiBhcm0sIEkgdGhpbmsgaXQncyBzdGF0aWMgc2hhcmVkIG1lbW9yeS4NCg0KPiA+IEFsc28g
aW50cm9kdWNlIFBHVF9JTlZBTElEX0dGTiBhcyB0aGUgZ2VuZXJhbCBzZW50aW5lbCwgd2l0aA0K
PiA+IFBHVF9JTlZBTElEX1hFTkhFQVBfR0ZOIGFsaWFzZWQgdG8gaXQgZm9yIGJhY2t3YXJkIGNv
bXBhdGliaWxpdHkuDQo+DQo+IFRoaXMgSSB2aWV3IGFzIHVubmVjZXNzYXJ5LCBpZiBub3QgY29u
ZnVzaW5nLg0KPg0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tbS5oDQo+ID4g
KysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21tLmgNCj4gPiBAQCAtMTEzLDE4ICsxMTMs
MjEgQEAgc3RydWN0IHBhZ2VfaW5mbw0KPiA+ICAjZGVmaW5lIFBHVF9jb3VudF9tYXNrICAgIFBH
X21hc2soMywgMykNCj4gPg0KPiA+ICAvKg0KPiA+IC0gKiBTdG9yZWQgaW4gYml0cyBbMjg6MF0g
KGFybTMyKSBvciBbNjA6MF0gKGFybTY0KSBHRk4gaWYgcGFnZSBpcyB4ZW5oZWFwIHBhZ2UuDQo+
ID4gKyAqIFN0b3JlZCBpbiBiaXRzIFsyODowXSAoYXJtMzIpIG9yIFs2MDowXSAoYXJtNjQpIEdG
TiBpZiBwYWdlIGlzDQo+ID4gKyB4ZW5oZWFwIHBhZ2UsDQo+ID4gKyAqIG9yIHN0b2xlbiBvbmVz
IGluIG1lbW9yeSBleGNoYW5naW5nLg0KPiA+ICAgKi8NCj4NCj4gRG9lcyB0aGUgcHVycG9zZSBy
ZWFsbHkgbmVlZCBsaW1pdGluZyBsaWtlIHRoaXM/IElmIHRoZSBmaWVsZCBjb3ZlcmVkIGJ5IFBH
VF9nZm5fKiBpcw0KPiB1bmlmb3JtbHkgYXZhaWxhYmxlIChzZWUgdGhlIHF1ZXN0aW9uIGFib3Zl
KSwgSSBkb24ndCBzZWUgd2h5IGEgbmV3IGNvbnN0cmFpbnQgd291bGQNCj4gbmVlZCBzcGVsbGlu
ZyBvdXQuIElmIGl0J3Mgbm90IHVuaWZvcm1seSBhdmFpbGFibGUsIHRoZW4gbGlrZWx5IHRoZSBk
ZXNjcmlwdGlvbiBuZWVkcw0KPiBleHBhbmRpbmcgYXMgdG8gd2hlbiB0aGUgbmV3IGFjY2Vzc29y
cyBhcmUgb2theSB0byB1c2UuIElmIHVuaWZvcm1seSBhdmFpbGFibGUsDQo+IHdoYXQgbWF5IHdh
bnQgc3BlbGxpbmcgb3V0IGlzIHVuZGVyIHdoYXQgY29uZGl0aW9ucyBvbmUgY2FuIGV4cGVjdCB0
aGUgZmllbGQgdG8gYmUNCj4gcHJvcGVybHkgc2V0ICh1bnRpbCBzdWNoIHRpbWUgd2hlcmUgaXQn
cyBzZXQgY29ycmVjdGx5IG9uIGFsbCBndWVzdC1vd25lZCBwYWdlcykuDQo+DQo+IEphbg0K

