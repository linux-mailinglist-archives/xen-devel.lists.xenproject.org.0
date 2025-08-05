Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D49B1B2C8
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 13:50:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070392.1434031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujGBW-0000vf-0T; Tue, 05 Aug 2025 11:50:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070392.1434031; Tue, 05 Aug 2025 11:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujGBV-0000tX-Tw; Tue, 05 Aug 2025 11:50:25 +0000
Received: by outflank-mailman (input) for mailman id 1070392;
 Tue, 05 Aug 2025 11:50:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L9Xd=2R=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ujGBU-0000tR-U7
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 11:50:25 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e5351e9-71f2-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 13:50:23 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by GVXPR03MB10931.eurprd03.prod.outlook.com (2603:10a6:150:217::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 5 Aug
 2025 11:49:47 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 11:49:47 +0000
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
X-Inumbo-ID: 5e5351e9-71f2-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfBXGb9fv/KiyxD+3KzlaWymXv1CBsZ3/VYhbvqPM/Xsvm/cpkaQ6/a3mjZfDEHJIaxGSJUMzERDlaJASTi4JOX7y+MalQPoXSRDo7L5lHD+FRgJtS8qVOuFC2v+s+W5d+67h1wXpZ81gm/PisZT5CngNZ7fZnYGZID5Vm3s9mDd+v08r65ZdklqDVocSwcQcifVKsdD4DGotQIKSNcspkQz9URdEQVftg4wodC0hXByNQcObyFrc6184KGj2ZS0JU5fjwHbQs8TKKKIPNxMHwXacqgS0iUszpRoFyTZg/ot9wNqIIpZcYvNcNXPzHSURp1yiA0VSJeUsCE1N/v35A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1t3LPeE69Dbv8I4scKJI0IWAP9T8vjIj1hK//ITZCKI=;
 b=jPIncv4C+fIVABvYl21998Bm/AXVolu1V1bVNBb1hkDsl9RRZbPhyl87E+3LzeLYsYn09vMfJlMf6+M25m1Q9nYSdqmgMPgfCThHQkFRTJ/tPBYHNaazLIGV41GMBceYAnuobF5uyaz53GB7G5X5wYkONvT0nzI5Pu13rk4sb+PzTHczmlikEVsutmYrOsqk7dZw9VWTVLbqLHPxw7KSTajqdRZdjTOLd8kPd1D10AgALJWoY8Zd4gji93AKh1RAuuVwFfp3fcywYo+RuKhhGEvpRHhCRbChZPaF/Xrkacl/f4HTr/qDfLyulw53f91SR+a/CipD0JGQvqclz4VjOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1t3LPeE69Dbv8I4scKJI0IWAP9T8vjIj1hK//ITZCKI=;
 b=Ni/Su0Il8/TMfWi6xaS2+dqKDzD2O9cncITuPYJTuVU0rK8dT9mdjzKC1BepJ4C0hdcpjyEoSTirISv/wYrsbcfP+owQHvtb4Hg1l3N5HS3Tgs/at5GI6gKAixZmKRvii8aDQyF6FA7agYNrniDKpE0gJUEgAUyleEEPiWZyPREwVTtj1qVfs6iFOcAFDaeoKjinwFOR2W61iSDUAffTXs6T8X9/bj0V964m34AJIJAoIXYmZsq9hm3mRHqw6Pu4iBeZCh3IUakBhF8s7DOD7yRUE7Lc+4zyd5EFn4iB2K3Zrot9psqxsFPMjUtQNEhPi/jsqUfngNXura7VgLvN7Q==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] misra: fix violations in macros GVA_INFO, TRACE_TIME
Thread-Topic: [PATCH] misra: fix violations in macros GVA_INFO, TRACE_TIME
Thread-Index: AQHcAi4fqTKeJL6S4E6Pmu2ECW9SE7RMXc0AgAAFrACAAAIQgIAAATiAgAeS9wA=
Date: Tue, 5 Aug 2025 11:49:46 +0000
Message-ID: <91d2a8ec-8a8e-404a-85ac-1038317e937b@epam.com>
References:
 <73cfc8a2d4d66042b49f44c69e672ce8ad0556ce.1753971749.git.dmytro_prokopchuk1@epam.com>
 <470a04e6-f8c1-4937-8478-0f80107d562d@citrix.com>
 <898e1c2a-7684-489b-84cd-254b2ee53e5d@suse.com>
 <9952fc5c-b95a-4879-a442-12e491438e08@citrix.com>
 <689178480a418f04158d623e3cedd4bd@bugseng.com>
In-Reply-To: <689178480a418f04158d623e3cedd4bd@bugseng.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|GVXPR03MB10931:EE_
x-ms-office365-filtering-correlation-id: 23c53eb3-4513-47a6-c98e-08ddd4162d36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MTdwbmpSUm9mdUFMdTQwdEpPNldZbmRXUzd0UXY4T042Sm9YcUc1NXRUdUN4?=
 =?utf-8?B?bW9MYUhwMThmZUhscUNaRGpETW9aYTQyYThQVDVZQTJSZ0wyM1hBNlhyOW4y?=
 =?utf-8?B?Ty9XSkVzNDFRSjJWRzVsbnBrczFMdUFzaTZ6ZDVPdFJ4UWNTOVdhUnFDaFdR?=
 =?utf-8?B?ejBiUEtSbmh0bWxHcTBjeVVBMEJFUzlaREdrbFpsWWduTDdybFZMaHJRZzNJ?=
 =?utf-8?B?eDhCTkNDbGRGMzZGaFZWVWRrRlE2RjBXQUhqZFNwY0svUDk5MlY2VzhlWE1U?=
 =?utf-8?B?TUZ3Vkw2VDVSY2RzN29DUHVTdGpmbEdQdXJkeVg0OFFueExyajVxSXhESVFE?=
 =?utf-8?B?dHRsZG5memMvaTJqWGt2bXQ2Z29tQzh6eDhZSU1QbFNXNW9zVFZWKzJBTlA5?=
 =?utf-8?B?VHRERUlxVlg3RGhvUVZ3R0o4U3d0ZktyMWVUcUZVd2I0b0FBOFk4eEpSK25E?=
 =?utf-8?B?Tmw5UXE2YjFXU2JHZUo1TnR3OWhyRUovUUc5cFM0S2VhTXN4eGZiSHFIdVpx?=
 =?utf-8?B?WFI5bW1MTTJQSXV4ZjRmS3pOeGlXZGRXb05hdUptdVlnZXVmaUZJV29GMkR1?=
 =?utf-8?B?ZXpUVnNKajdtZ2JsODlYMmlOVCtSeHdya29jWFM1QUNMc0VoRm52bEVYOE5r?=
 =?utf-8?B?U0lzNkdnTW1XMzhaTzNaMVVTRWIyNWFMeVdiR29QN0ZIdUhqQ0JvLzhUWTBl?=
 =?utf-8?B?R2o0VWRGNGZ4MUg5MytYLzB0ZGFyL0hLVE5xV1ZMUEh1bVBVQVBqSDVZS2ph?=
 =?utf-8?B?VDhSRXNkQ2l1RVFVRlZFNlNINXF1MXBKNk40RmVUZGdPeXgyeU9pWlA0MmRW?=
 =?utf-8?B?MmtMY2hlc3BjTFdkRzMvemlBd216b0pWSTRNMWRIajU5WVdQMUIrZzROOHAv?=
 =?utf-8?B?MUxheFFRRTRvbUZLNFFyY1RhUTlGZnJPVWFsMlMwT2ZlMExNMGFwRXNSeXVE?=
 =?utf-8?B?NjllWWlVZDJqQUJwS3NWN1g1UWJUUlh4MmF4MXBrNWNUV1g2SldWNTk1VnYw?=
 =?utf-8?B?Vys2Qys3REhaUkN2NmZKYTJHa2lmbnorMFhaUk9JWnpEa0hHT25oNk9Zamwv?=
 =?utf-8?B?cktSb29rVXBuVU1aUkNmRGtRWHFLTHQwdzQzcklSVnRheFFRSWxiOU5QbXVS?=
 =?utf-8?B?VEtMSlVQR3FFZW8rTFFIV2h2Zmd0VzNLZWk5MHRITkFaYnFueTZjcTRMOWtF?=
 =?utf-8?B?eWN4Rjl6RHpBRlFoUWJjbjBLaUtCdGRiekt6UWdoNS80SVljQmV0cmNrd3Z4?=
 =?utf-8?B?QnhGcDBiRFFLQmxNSGcyY3QwMDZBbDMydW16U0w3TWRySWE1eHlUSmtZSmlk?=
 =?utf-8?B?QXNObERHMUN2aGloU1NYWjRLb0gzck1abm85c0h0dWdtSnozU0pNUjlYM1JG?=
 =?utf-8?B?a3FtSnRLSkUvMmxzeVZVdTVaemgxRi8zN1BvK1BGY3ZXMXo1K2FLOVZheFVm?=
 =?utf-8?B?WlRoa05UVGQ4dlVTNkpHYnRCM0syVEI1NUx5ZDFpY2tLeXJZYWx6ZGdsWDBv?=
 =?utf-8?B?Qlg1Rmo2VVQrTnArbnMwZSs3Qk4xblhCakZsT3FabFFndVF0OWF1RnVXMWk1?=
 =?utf-8?B?NzFIQ2dPcFZIT0VYL2lrWU5xN0c5M2YvUGthMUpjeUY0blN2NERwRndKRUxn?=
 =?utf-8?B?TnJ0KzFFdXRiSGdSbUFLODVLQzRpY0RGU1JqZk1UMjh4WVlmZ2c0RGJlM2ZU?=
 =?utf-8?B?ZDNHc0pSY2toUFRQajI3RUgwd3FNN0Y2YU0vdEI4ZXc3dVFBbTdxVGZnZ2d3?=
 =?utf-8?B?MzgzYVV2NDhuYkQ1eWVxQmY2Q3YzTUJObFFLNU5Wbmh4VHJCb3NVcFZqZlVt?=
 =?utf-8?B?QUdLakN5NzdGRnhSMWxGV1lxVHNhWCtaT3ZIT1lNdHo5ZTNMd1U3WUNnckY2?=
 =?utf-8?B?WGpYMk1hbE9VRlcvTG5NOU5Lc0ltV2JmTVBzUHBxYWFzaG5OMHp0alYwVWRH?=
 =?utf-8?B?Q3hnVkdzY0xNaVRNOWJJK1BrQitLNllmVnV3MHZxZUlxa3A0N29FUURpaWlS?=
 =?utf-8?Q?P4uoX3wRhUJjWf58Rc0wcKDNJ5ewKU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MjlGa3RBYWxSZWNlYk5tWlJBbmVTUFkrSkl4TCtJYTBhN3I0RXp2ZWhOQmJ3?=
 =?utf-8?B?LzVZeDNZd3V3ZVEvVE4zS25WREdJcmRQWnc0c0ppS0IxbHJxSFlqb2cxNE9i?=
 =?utf-8?B?cVFFeDMxQTUySlpLQUJnRUpILzZKM1FjM0VuUk1zRzJYa083aDRRb2ZLckxO?=
 =?utf-8?B?RHpHeldLcDR3RFliUkUzRnhOWU9qTW5LaUdwQ0syWHZDeHF3VExUQitnTHE2?=
 =?utf-8?B?R1BSbEIzaml1ZU9HWHdxVlRoU2dONGVvVHpiU0cxUWs5VTZTNXBFanV6WDV4?=
 =?utf-8?B?dVQwZ21ud2VqOFQyZTZwZzhlRFB6OFV4TVBmaGphR3B3TUxQbFJQcm1zRzdM?=
 =?utf-8?B?MDUraWVvOFJFbHdVQ3hHT3NRaFZoeHBWUUExOEQ1TElNSjdBc3FQUGdON3Yz?=
 =?utf-8?B?Y2lGSGpab0k2anp0ZVR1K2NmUVlxOUdPWFE1eGRxTnR2L2oxbWwyVVBsN0pl?=
 =?utf-8?B?ZXRISVIxL2pBTGw4bXlrQXhsSDI3dmp1WS9LSHFLcXZXOElvTVIzRVEwVzdr?=
 =?utf-8?B?cHAzcmRyK0hWNllIYUJDdkRCUGMzMFN3dlJ1Q2hBNW1EREVHK3EzeGNkSytN?=
 =?utf-8?B?d0NMN3lxeGZiTXhaZ3BqaFkyZWtsbWxLejNUQUpoY3cyN1BDa01VTWxkWXhJ?=
 =?utf-8?B?T1o3VUJPcDJVMVFvM3VZVWZTbjhuM1dvQzFLMHpuQWEvSUNjWU45NDJaNmpr?=
 =?utf-8?B?cVEveEYxU3BFTlN2UWljT3ljZ0ZpbGhDb1laTmR3cGtnam9TRE5idENTMVJ3?=
 =?utf-8?B?aGs3enU3eDVxM1o4aHh6RlhGNVhiS3hvSW1ycVF3TGxucWdyMlpaTVVpbDhX?=
 =?utf-8?B?aHVJYkR5dDlzdnZCUmpPWWtkK2hMVndYTitmcWJ3cERqaVhHMmRQRDZXamd5?=
 =?utf-8?B?SUt2bm1tU2FYZVBucHRUanFDb3ZtUG4xeTg3OUZjODR5MTNKRWF1UXBwcm1K?=
 =?utf-8?B?KzJib3FaSENub29xM2xJZ3hzZmR0WG5NQnVXcXlrWnFUVnBJd3JoaDB5MCtY?=
 =?utf-8?B?b0l4NHR0Z2hJdWJZbXJGNXdxNW4yRDY2UkZ6ODJDeE80UFZMMXhHOGZEa2g0?=
 =?utf-8?B?T004cUl4YWJtVEM2ZmdkaG8zMHZZaDFEM2lhV2Y0UWZnS3FiVFNLRGtQaWFs?=
 =?utf-8?B?eHYyTVUrejd3LzJaOTVTazVOSTk5MTcxRzZDMklkc2tWOGJtbURKd1JUZEFh?=
 =?utf-8?B?cTNoUGF6WnNXUnFleVhETWFlOEhIakxBRzB0U0Fld09zSmJGbzZLOU9wUmd0?=
 =?utf-8?B?VEdXTStiSGNKM3IwSEJELzMxQUlXV2FiQStsWkdlVHpzbWVpKzNyV2llRlVO?=
 =?utf-8?B?a1B6bTVWME5qb0VtazNVYkpUZVYvZ1ptN2ZmUDNjUkxMQjM0UGdaL3pnRDl6?=
 =?utf-8?B?NVJWbDhuR1h3OENwT1VrQnFhWDFEeEVrUUdpbVNueTFtZzQ2K21qUStza1RC?=
 =?utf-8?B?cC9Bb2pvQ2JRTFNmcTNOWjNOZXI3cWZZL0tUbDMvNm1WYXhCSTFUYnByVXNQ?=
 =?utf-8?B?OXJ3MDZ4U2lPK1dpYmZDbW8yYzF6WHh4VUx6VWJZbldnTGxya1ZtWGtiazZ5?=
 =?utf-8?B?TlRJbzR6dTIrTm1CaXFWRk9NU3NBbUVsckZzSGF2c1kwdFVNNDRBYzAxajhM?=
 =?utf-8?B?QkN1ZkhWendFTUhzbW5NN0FVcnlFalZGR2tjTHB3ZHhZeUpacG5EanljSHpj?=
 =?utf-8?B?LzdrZnErYUE0SHYwWWhMQndpREo3c0FQb0NadDlweXR3QzB1MDlsQVlycHRy?=
 =?utf-8?B?Wno5aDJRR1NPNkN3U2lYeWhkSXNCSmdYQVhIQWxtSXhwZkh4NWpOSWE3MWJG?=
 =?utf-8?B?ZFllUndDcXl5ajIzT0prMzQyS1dVYk03NUNUMHBBelpPbWR2aW5UandQNEVk?=
 =?utf-8?B?dmNDT3ViQTRoRXBXUGd6R0dPTmFvQjFhZDVCc2NCblozdDROcWRJQWpyUFE5?=
 =?utf-8?B?S1pqYlc4UHF3cWRxaEI0bG9EOXowTG9ZMS8rZmVnQlJkMzhzSVNsNTM2TFMr?=
 =?utf-8?B?NTZ3dWptY0pGQ3FndlFLQVFrd3lmSUtpV1hLQzg3eWdQWFV5emswMjNDRFlJ?=
 =?utf-8?B?OGFSRnlrVHowT3hKaGhWandhWXBzWXBVNVpCVGtzalQ2VHlaMlgyeE5XRWJC?=
 =?utf-8?B?Z0wxSEJGRWZmekxQWXo2dnRxVmgzVWVXY2FIaHBleXUyVXcxc0RDTEJpcmtK?=
 =?utf-8?B?MEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0C6A6F0F9F6B04AB975FAB03703C4DC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c53eb3-4513-47a6-c98e-08ddd4162d36
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 11:49:46.9180
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OlHe9x9X2hP8k6cgxnxtmLTrrRfS/UV0t9Eim3sUQCVuQWkI9oJWEjvQHGZX60GoqK3IX4/Pw+z598NrtW6EohtU0JFYGjs8JNOwyN88erw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10931

DQoNCk9uIDcvMzEvMjUgMTk6MDksIE5pY29sYSBWZXRyaW5pIHdyb3RlOg0KPiBPbiAyMDI1LTA3
LTMxIDE4OjA1LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4gT24gMzEvMDcvMjAyNSA0OjU4IHBt
LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAzMS4wNy4yMDI1IDE3OjM3LCBBbmRyZXcgQ29v
cGVyIHdyb3RlOg0KPj4+PiBPbiAzMS8wNy8yMDI1IDQ6MTYgcG0sIERteXRybyBQcm9rb3BjaHVr
MSB3cm90ZToNCj4+Pj4+IE1JU1JBIFJ1bGUgMTMuMTogSW5pdGlhbGl6ZXIgbGlzdHMgc2hhbGwg
bm90IGNvbnRhaW4gcGVyc2lzdGVudCBzaWRlDQo+Pj4+PiBlZmZlY3RzLg0KPj4+Pj4NCj4+Pj4+
IFRoZSB2aW9sYXRpb25zIG9jY3VyIGJlY2F1c2UgYm90aCB0aGUgYEdWQV9JTkZPYCBhbmQgYFRS
QUNFX1RJTUVgIA0KPj4+Pj4gbWFjcm8NCj4+Pj4+IGV4cGFuc2lvbnMgaW5jbHVkZSBleHByZXNz
aW9ucyB3aXRoIHBlcnNpc3RlbnQgc2lkZSBlZmZlY3RzIGludHJvZHVjZWQNCj4+Pj4+IHZpYSBp
bmxpbmUgYXNzZW1ibHkuDQo+Pj4+Pg0KPj4+Pj4gSW4gdGhlIGNhc2Ugb2YgYEdWQV9JTkZPYCwg
dGhlIGlzc3VlIHN0ZW1zIGZyb20gdGhlIGluaXRpYWxpemVyIGxpc3QNCj4+Pj4+IGNvbnRhaW5p
bmcgYSBkaXJlY3QgY2FsbCB0byBgY3VycmVudGAsIHdoaWNoIGV2YWx1YXRlcyB0bw0KPj4+Pj4g
YHRoaXNfY3B1KGN1cnJfdmNwdSlgIGFuZCBpbnZvbHZlcyBwZXJzaXN0ZW50IHNpZGUgZWZmZWN0
cyB2aWEgdGhlDQo+Pj4+PiBgYXNtYCBzdGF0ZW1lbnQuIFRvIHJlc29sdmUgdGhpcywgdGhlIHNp
ZGUtZWZmZWN0LXByb2R1Y2luZyBleHByZXNzaW9uDQo+Pj4+PiBpcyBjb21wdXRlZCBpbiBhIHNl
cGFyYXRlIHN0YXRlbWVudCBwcmlvciB0byB0aGUgbWFjcm8gaW5pdGlhbGl6YXRpb246DQo+Pj4+
Pg0KPj4+Pj4gwqDCoMKgIHN0cnVjdCB2Y3B1ICpjdXJyZW50X3ZjcHUgPSBjdXJyZW50Ow0KPj4+
Pj4NCj4+Pj4+IFRoZSBjb21wdXRlZCB2YWx1ZSBpcyBwYXNzZWQgaW50byB0aGUgYEdWQV9JTkZP
KGN1cnJlbnRfdmNwdSlgIG1hY3JvLA0KPj4+Pj4gZW5zdXJpbmcgdGhhdCB0aGUgaW5pdGlhbGl6
ZXIgaXMgY2xlYW4gYW5kIGZyZWUgb2Ygc3VjaCBzaWRlIGVmZmVjdHMuDQo+Pj4+Pg0KPj4+Pj4g
U2ltaWxhcmx5LCB0aGUgYFRSQUNFX1RJTUVgIG1hY3JvIHZpb2xhdGVzIHRoaXMgcnVsZSB3aGVu
IGFjY2Vzc2luZw0KPj4+Pj4gZXhwcmVzc2lvbnMgbGlrZSBgY3VycmVudC0+dmNwdV9pZGAgYW5k
IGBjdXJyZW50LT5kb21haW4tPmRvbWFpbl9pZGAsDQo+Pj4+PiB3aGljaCBhbHNvIGRlcGVuZCBv
biBgY3VycmVudGAgYW5kIGlubGluZSBhc3NlbWJseS4gVG8gZml4IHRoaXMsIHRoZQ0KPj4+Pj4g
dmFsdWUgb2YgYGN1cnJlbnRgIGlzIGFzc2lnbmVkIHRvIGEgdGVtcG9yYXJ5IHZhcmlhYmxlOg0K
Pj4+Pj4NCj4+Pj4+IMKgwqDCoCBzdHJ1Y3QgdmNwdSAqdiA9IGN1cnJlbnQ7DQo+Pj4+Pg0KPj4+
Pj4gVGhpcyB0ZW1wb3JhcnkgdmFyaWFibGUgaXMgdGhlbiB1c2VkIHRvIGFjY2VzcyBgZG9tYWlu
X2lkYCBhbmQgDQo+Pj4+PiBgdmNwdV9pZGAuDQo+Pj4+PiBUaGlzIGVuc3VyZXMgdGhhdCB0aGUg
YXJndW1lbnRzIHBhc3NlZCB0byB0aGUgYFRSQUNFX1RJTUVgIG1hY3JvIGFyZQ0KPj4+Pj4gc2lt
cGxlIGV4cHJlc3Npb25zIGZyZWUgb2YgcGVyc2lzdGVudCBzaWRlIGVmZmVjdHMuDQo+Pj4+Pg0K
Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRG15dHJvIFByb2tvcGNodWsgPGRteXRyb19wcm9rb3BjaHVr
MUBlcGFtLmNvbT4NCj4+Pj4gVGhlIG1hY3JvIGBjdXJyZW50YCBzcGVjaWZpY2FsbHkgZG9lcyBu
b3QgKGFuZCBtdXN0IG5vdCkgaGF2ZSBzaWRlDQo+Pj4+IGVmZmVjdHMuwqAgSXQgaXMgZXhwZWN0
ZWQgdG8gYmVoYXZlIGxpa2UgYSBwbGFpbiBgc3RydWN0IHZjcHUgKmN1cnJlbnQ7YA0KPj4+PiB2
YXJpYWJsZSwgYW5kIHdoYXQgRWNsYWlyIGlzIG5vdGljaW5nIGlzIHRoZSB0aHJlYWQtbG9jYWwg
bWFjaGluZXJ5DQo+Pj4+IHVuZGVyIHRoaXNfY3B1KCkgKG9yIGluIHg4NidzIGNhc2UsIGdldF9j
dXJyZW50KCkpLg0KPj4+Pg0KPj4+PiBJbiBBUk0ncyBjYXNlLCBpdCdzIGxpdGVyYWxseSByZWFk
aW5nIHRoZSBoYXJkd2FyZSB0aHJlYWQgcG9pbnRlcg0KPj4+PiByZWdpc3Rlci7CoCBDYW4gYW55
dGhpbmcgYmUgZG9uZSB0byB0ZWxsIEVjbGFpciB0aGF0IGB0aGlzX2NwdSgpYA0KPj4+PiBzcGVj
aWZpY2FsbHkgZG9lcyBub3QgaGF2ZSBzaWRlIGVmZmVjdHM/DQo+Pj4+DQo+Pj4+IFRoZSBvbmx5
IHJlYXNvbiB0aGF0IEdWQV9JTkZPKCkgYW5kIFRSQUNFX1RJTUUoKSBhcmUgcGlja2VkIG91dCBp
cw0KPj4+PiBiZWNhdXNlIHRoZXkgYm90aCBjb250YWluIGVtYmVkZGVkIHN0cnVjdHVyZSBpbml0
aWFsaXNhdGlvbiwgYW5kIA0KPj4+PiB0aGlzIGlzDQo+Pj4+IGlzIGFjdHVhbGx5IGFuIGV4YW1w
bGUgd2hlcmUgdHJ5aW5nIHRvIGNvbXBseSB3aXRoIE1JU1JBIGludGVyZmVyZXMgDQo+Pj4+IHdp
dGgNCj4+Pj4gd2hhdCBpcyBvdGhlcndpc2UgYSBzdGFuZGFyZCBwYXR0ZXJuIGluIFhlbi4NCj4+
PiBJcnJlc3BlY3RpdmUgb2Ygd2hhdCB5b3Ugc2F5LCBzb21lIG9mIHRoZSBjaGFuZ2VzIGhlcmUg
d2VyZSBlbGltaW5hdGluZw0KPj4+IG11bHRpcGxlIGFkamFjZW50IHVzZXMgb2YgY3VycmVudCwg
d2hpY2ggLSBpaXJjIC0gb2Z0ZW4gdGhlIGNvbXBpbGVyDQo+Pj4gY2FuJ3QgZm9sZCB2aWEgQ1NF
Lg0KPj4NCj4+IFdoZXJlIHdlIGhhdmUgbWl4ZWQgdXNhZ2UsIHN1cmUuwqAgKEknbSBzdXJlIEkn
dmUgZ290IGEgYnJhbmNoIHNvbWV3aGVyZQ0KPj4gdHJ5aW5nIHRvIGFkZCBzb21lIG1vcmUgcHVy
ZS9jb25zdCBhcm91bmQgdG8gdHJ5IGFuZCBoZWxwIG91dCBoZXJlLCBidXQNCj4+IEkgY2FuJ3Qg
ZmluZCBpdCwgYW5kIGRvbid0IHJlY2FsbCBpdCBiZWluZyBhIG1ham9yIGltcHJvdmVtZW50IGVp
dGhlci4pDQo+Pg0KPj4gVGhlIHJlYWwgcHJvYmxlbSBoZXJlIGlzIHRoYXQgdGhlcmUgYXJlIGEg
KnZlcnkgZmV3KiBudW1iZXIgb2YgY29udGV4dHMNCj4+IHdoZXJlIEVjbGFpciByZWZ1c2VzIHRv
IHRvbGVyYXRlIHRoZSB1c2Ugb2YgYGN1cnJlbnRgIGNpdGluZyBzaWRlDQo+PiBlZmZlY3RzLCBk
ZXNwaXRlIHRoZXJlIGJlaW5nIG5vIHNpZGUgZWZmZWN0cy4NCj4+DQo+PiBUaGF0IGlzIHRoZSB0
aGluZyB0aGF0IGJyZWFrcyB0aGUgcHJpbmNpcGxlIG9mIGxlYXN0IHN1cnByaXNlLCBhbmQgd2UN
Cj4+IG91Z2h0IHRvIGZpeCBpdCBieSBtYWtpbmcgRWNsYWlyIGhhcHB5IHdpdGggYGN1cnJlbnRg
IGV2ZXJ5d2hlcmUsIHJhdGhlcg0KPj4gdGhhbiBmb3JjZSBwZW9wbGUgdG8gbGVhcm4gdGhhdCAy
IG1hY3JvcyBjYW4ndCBoYXZlIGEgYGN1cnJlbnRgIGluIHRoZWlyDQo+PiBwYXJhbWV0ZXIgbGlz
dC4NCj4+DQo+IA0KPiBJJ2xsIHRha2UgYSBsb29rLiBMaWtlbHkgeWVzLCBieSBhZGRpbmcgYSBo
YW5kZnVsIG9mIHByb3BlcnRpZXMuIFRoZXJlIA0KPiBhcmUgc3VidGxldGllcywgdGhvdWdoLg0K
PiANCg0KSGksIE5pY29sYS4NCg0KRGlkIHlvdSBoYXZlIGEgY2hhbmNlIHRvIHRyeSBjb25maWd1
cmUgRWNsYWlyIHRvIGlnbm9yZSB0aGlzIG1hY3JvIA0KYHRoaXNfY3B1KClgPw0KDQpUaGFua3Mu
DQpEbXl0cm8=

