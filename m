Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6157ADC1F6
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 08:00:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017711.1394710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRPMT-0001VX-Ap; Tue, 17 Jun 2025 05:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017711.1394710; Tue, 17 Jun 2025 05:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRPMT-0001Tc-6w; Tue, 17 Jun 2025 05:59:57 +0000
Received: by outflank-mailman (input) for mailman id 1017711;
 Tue, 17 Jun 2025 05:59:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zxid=ZA=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uRPMR-0001TQ-TT
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 05:59:56 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20623.outbound.protection.outlook.com
 [2a01:111:f403:2418::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48837778-4b40-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 07:59:52 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH7PR12MB7871.namprd12.prod.outlook.com (2603:10b6:510:27d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 05:59:47 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 05:59:46 +0000
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
X-Inumbo-ID: 48837778-4b40-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJAxeopSda1idqTrexJh5nPU0M8AQbDOrV6nc1P9ZKa0NM23JxqWER4CN8Omf6evmuuqWo6ZtOCCgP7pJ9uz2UPIO8+f3lNgjiwoVG0dlS6sLBzO6649FudUUk/Wx/USjT+on8tXOjlNzAb5iFPp5btVBRPu1/j+rjRYKqT8V1AWKsWx07RxwO1WwWsSsLmZUnpX3WZdJ6u+MxvTR6zkRQP2O4/rkzDfGal2HFc0ZJvnBV26Fnrbe3afnD1lvjsnorgJC3d3xsSVzNH2ot2mmMBdvdBL/FEAim6XR3TmgABlF3TTTA11KdsB3NoQJXsPRH7rjBDRNt8zsSrzpeH3PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WeCtjvwUQlw0E6jxPQjg5dAnYKyJUVJjSp8ObjgbPTU=;
 b=BXOTbptXRS0HmpHnXxgJzC67c5fL1QWbFgVpqIBjwj5CsY5S556W3NUxRkqCR/5gtpU8oSS+mdULAodZ/eUvgzEQdr3DBz0m0QUKob+AqLJROy1o00O1F5CY0ZKRumk14Q4NiyXbNATeTJeXxhIa0BS4Y5aA+js4zOy3SJxOx1+czYd4z1BfLU2k2FOGA1mWHn2UvRjQ5621904m6numnn/8V9Z7h44komGTI6TvuNCQtXR18UZvv63820bdo0rHFe487HkTTi/HkD9ekSAMoportiE3jGH8EbEnbQ0BcwgNefwOqpQlaLyLA/53CbfbB+abBINc8Wz75Tr3T0i8+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WeCtjvwUQlw0E6jxPQjg5dAnYKyJUVJjSp8ObjgbPTU=;
 b=tFxiZBou8HhG/e/LK0QPelmGQU9uth6JWBw7fSVK1LQct7mm1g1gBASRx0iIm+2elc5eB/SXjCQSIWdh3IH9ar8bUW7NsdKd0PDMkvHFCSlqnmNGmNec866p7ASvHwk82C323bK1tia6bdAsSzFi2AX87U9SVafiMqbO68YONXo=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: "Andryuk, Jason" <Jason.Andryuk@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Jan Beulich <jbeulich@suse.com>
Subject: RE: [PATCH v5 05/18] xen/cpufreq: refactor cmdline "cpufreq=xxx"
Thread-Topic: [PATCH v5 05/18] xen/cpufreq: refactor cmdline "cpufreq=xxx"
Thread-Index: AQHbzuQ9uCUmVxaE7E6nhT8/lomgsbP9sLQAgAlLVmA=
Date: Tue, 17 Jun 2025 05:59:46 +0000
Message-ID:
 <DM4PR12MB84511B90BB13054D078DA784E173A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-6-Penny.Zheng@amd.com>
 <4d6a72fc-5e7d-4817-8b52-b6b24fca9d25@amd.com>
In-Reply-To: <4d6a72fc-5e7d-4817-8b52-b6b24fca9d25@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-06-17T05:59:32.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH7PR12MB7871:EE_
x-ms-office365-filtering-correlation-id: a2cbfeee-e690-4320-3183-08ddad6429b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?c2xCRTlwaTZtV0EvK2sza21UcjFSVDhRZzV4cTZ2Yzl1dzFEY3JBSGlDYlFk?=
 =?utf-8?B?VU5jT0l6YytUeFJPY0F2NFBKSzk0bjNFNFIrUEZheDRvLzg4TWludXFTWXBL?=
 =?utf-8?B?OXUyb29XeFJNZUk2SlZBaFVPSkM3VUszRGY0TStpSXowUWoraXQvblNDSGQ5?=
 =?utf-8?B?OFlaaHZBcFhJWHBmK3R5T2UzczQ3Y0FOSnFpSlQwMEdOS28vazF0Nko0dm0z?=
 =?utf-8?B?d0lGRlE3R2hFSDhuTW90aXc0V3FYcE9uakxCeEJQdW9EODRBMjNxSHd3U2pu?=
 =?utf-8?B?WlNlVTdtdkVVS2NrSmV5czlIMjdmekdiR1hYV2FCRGRRbHdlbTlyazdlLzQ4?=
 =?utf-8?B?cXk2T1ByTG40amo1WlgxUEJiM3FhNEFEK2JGQ0JxLzFKQ3VQUmhOanJxZ0Nt?=
 =?utf-8?B?aXNFUmIyTG05U2RxSkU4WUJKS0hNNGFjTFY5Z3U4bUpqekpZb3ZvL0E1WTdk?=
 =?utf-8?B?c1FjMkw4VUF5YXBtRWFScHVRQWxZMnlhcEFEV0F6c0w5Tm82eGROVWdGV2FT?=
 =?utf-8?B?b04vSkRjYmlqUjVoWmNKMXVXY2JNTW1oVGYxVjc1SmdFRlhVNEZHQ2E0dGlq?=
 =?utf-8?B?dnRjUmd5a0xlY0p3TnlqOXlod1E1WExXVEFjbG9kT0RGM0VrVU1jbDNSQnZB?=
 =?utf-8?B?aEF2YXBqNDloMU9xNXB1M1BmM1ArQ0dUd2RkblAzZCtuL295ai9NSTlGYWpR?=
 =?utf-8?B?YUdtdk9taWdOMllsU0JaemtENGVYdjhKSktSbTZBVnJxcTljSlRwd3cyRzZ0?=
 =?utf-8?B?cldtMWZqSjRRUlg2TW11SHdqYVpWUUs2bFBvdXdzQzhFb1BiN2txZUg4STJk?=
 =?utf-8?B?QWUzUlJSVzdva3RPZm5idWdscEF0WCtHb3Q0MEptV1RBY0YvWU1VZGNSOE12?=
 =?utf-8?B?d05xVnZZNU1kdkZydW11Ris0TDBCWlNDY0svMFdTdGZaL0pVb3NENkRFT2pk?=
 =?utf-8?B?SXVGQkVNd0FPdlN5Rlo4bWRJNUVFcDRMd3h0aDQ1OHdLZW9vNVVOSFFNRnpR?=
 =?utf-8?B?UlFDbFhpQXA2RE1XYTJjc3V2czQ1akwzMnNsSW50b2RqSzRBZEZXMTNXLzNR?=
 =?utf-8?B?OG85VmhWc1JKNjRnVFdPODVGaGY5eFFmV0tXcmNTbjMrY3NZbDdEVHRrMTVv?=
 =?utf-8?B?SVdTd2V4MUpUNm1UOUw4VXdtZHFDdUZwVFlLR2NoTEtpeklOT2I3QTBUOFlw?=
 =?utf-8?B?MXRoSHBqS1pFc2tvRmhiZjkzUFdWT1VERUlzNjl1eDNtdEhyQWRhdmV0eExr?=
 =?utf-8?B?MGJqZ3BPZ0VrWGtGeGZRNzg4NXpIU2dKR2hQazM4STdzU0lRSkcrbkRrdDdw?=
 =?utf-8?B?N1JxbmM4TWd0aVEyd0FoS1E3OVAzUGlHeWM3VG1EMVNsZk1ERU5qcDZzOWp5?=
 =?utf-8?B?WnpZQ3hmNmtjOUJySXNMY0RKaDZGWDBsYjFBZEM5SDNhNnJKSjdwenZsc2N4?=
 =?utf-8?B?Ymx4NlFZWGl6V21lbGRUTkNnM2liUjQ3NXI5VnVRejlnaGhKQW9jalk3QlZ6?=
 =?utf-8?B?MUJPWTdaa1RtQ2psWDFzeVptYURoN045YklxeWFzUEIvSVVocnNHMXA3M3NU?=
 =?utf-8?B?V1ZXSUtKQ1J2SWltblB3c1ZWc2NOdnNpQW8rSURHZE1sV3VzQURCVllHYW1F?=
 =?utf-8?B?dGlOVlhhT2crMEpCb214UFZqQVc1MUp0NUswNTRneFo5TEd4REYwbDFwRGoy?=
 =?utf-8?B?MGRKYlYzVzFXWVVTN0o2VmJEMDBsT2pHTUEyWTFJbUkvQ2ZnUjl4K2licEE3?=
 =?utf-8?B?d3N2aXdMYzMzNUluMUEycW56L1B1M1dqWUJMUGtrYklmQ3BGbzVUbVJNMDJI?=
 =?utf-8?B?WkU2M05DMDVmc2RFNlYvMFRYUGVmQlRiOVBtU2dNZGN6THNSZWN1NXE0Lzdr?=
 =?utf-8?B?ZzgvOXg2a2tudVVZUytkV2YrVDFyeG01VXVRa1NnSU94dTZlUVJRM3Jnc05Q?=
 =?utf-8?B?eTA2Ukc1dnYxSUxQNXRKcXlOelVuWjRpZ1dkcXRLWFNxdnZKRm5xcHdIb3B4?=
 =?utf-8?Q?IsSeskIEr/EvIjoqIxX3kSSS0R6Ca0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eU9Oc0p0c0NndGZia1IvekE3UUMvRGkxOVlLeVE0VkpCSjlmRXZaSU1xQ0NY?=
 =?utf-8?B?SXRlYmJKVXdnRW45L2pxTllteHdJbFViRlRhSVNCSDZkTXR3YnZwdGw5WU5p?=
 =?utf-8?B?ZVd0ME1BaFRtMm04cFZTQkZVT2YyWWE0aDM2bHJVb253L0xIVHdGeEEybDAw?=
 =?utf-8?B?NTlLNXV1WHlOK2JnaTlYNzZsZWNmZ1pOUXI4UmJ5T0hRVXFOOEo5U0Z3d3oz?=
 =?utf-8?B?SW9yd1FiMk5YaGpRSUplQUNBK3Q0eWsxb3pTaFZsMElNZnk3Q1VoVFF3NWtm?=
 =?utf-8?B?cUNoNmxieS9yeE50elZSc1ZZR245SVFnQjJjM0Rxd1g5amxSaGFQRElvakZs?=
 =?utf-8?B?cUt4ZThVZXlHUlhWdXAycmZKTE0wU0VGc20veFQ4ZkVZR1oyUkJLL0FqaUpm?=
 =?utf-8?B?ME9VZmNqYjFlRXdTVzUwbTk3ZVBXcGRteitOb0hKZ2lFU3RUY3JobkxFbzVt?=
 =?utf-8?B?REpjWEx3SXkwWEFDUU5xTGJBSmRmU0xScU9kK3NZdnZpZlN3L3VnOUVVV2xY?=
 =?utf-8?B?QUhVZlp6Ny9CVmg4S0tHVjlqVG5JS3I4akZQTEpWWDNZbEFKQkRpQ2N3WVVs?=
 =?utf-8?B?MVpvek1mR1RURk9yY1NMdUR1THh4NmtpWHdKVzMrNTZrWmVDTXNoUVFQR1By?=
 =?utf-8?B?alhZaGJQMDZ3S1gzU3FMMkIwdWpnNWpjYXoyT0lNYU1aZUtvaFBhL3p5czNa?=
 =?utf-8?B?QW9tYTRqcGIwbmRVdUsyeTZzdWs5QXNpSEV5UENSVytLbGlhMElYZmtTU0NR?=
 =?utf-8?B?WExMdHVMVWV6Q1cwVUg0R1RpOVBwcVNQS01RQUJ4WWR2NVVnS3FzQktOcCsx?=
 =?utf-8?B?dDMrN2VuM2d3TDJCWDY0VzIyQTdCSElLd1RxY0pkeXdTTDM3akRvRUcrYWh2?=
 =?utf-8?B?b2RyS0RGd1pSSDBpS21SdG1CYjRkb1pPQ0p2REtyODBwNG1vZzZZMWdsN1BW?=
 =?utf-8?B?cDB5U0hyK0gyRG5sU1VwMmwyby9uV0dmcDlDWlJkZUdzMWtFZkFwb1FMUHhk?=
 =?utf-8?B?d0FuaDBLMVVHQ3l2Ti90cXdMalBFQ3RNV2JvR2l2OEMraGp4ekNrWk1SaDJv?=
 =?utf-8?B?VVpIcU42Qi9NYkFTYktRS252cER2MHkzN3lrZlFLQlRIcXRzbHg1K0w4aWJ5?=
 =?utf-8?B?VTdFbTZMcU8ycjVwcXkxbjZrdG44aFpuaHM2TTl5OElPbmZaM1duWld6a3BH?=
 =?utf-8?B?K0ZkbVZOOVA4V29UdnF6bEYzUFhGc2RJMllvc0JzQlNTaXhQMlhTOEVDVjh5?=
 =?utf-8?B?bVFpUW9yRDg2M050d0VXNk5YalpQaExTQU9HWHhuRWVUUnRQOWJ0bkJhWFhL?=
 =?utf-8?B?akZubHFSZ0wvS3ZlSkFlaUh5K0RTZ2NDSmFyS3E4My83TnJHRzFwei9LUFZS?=
 =?utf-8?B?WnU5cnY4N3FQd1Evb0lFdzh5NjRPTkpCVHkrZkhTbXpXbk9Pc3NHQ1JGK3cz?=
 =?utf-8?B?Y2c4b3h0SHhyWTdUODIwOTdaYmZhK2pTdmRSemprMUFrZERSSWgrdHR1S0hP?=
 =?utf-8?B?amFBNU9ON3lySUdVbFN5bHBxUmVmQmZuZi85dFNoMUtaQW9IUjloOGhwVTl4?=
 =?utf-8?B?bFBGT1dyZ05BOWpJTVhKWmlOVEFlKzV1ZWdwZzU1cmRMYmlRRjZEb2M4S0dG?=
 =?utf-8?B?UUErbmdubm9vZXUrVmNjWWZpZU5SeURhVTQzY0NwcFN1cjJKWFpqLzNjS1do?=
 =?utf-8?B?SXlmTmFyN0tab0lFYm1xNzl6SUpEcmViL3JVTVp5KzA1VzJyWjNubUdzWGo4?=
 =?utf-8?B?UG9ueGRMUkZ5VUt1bitQb3ZvYnE3OGZQVUFyWElsN01RWk1XWTdySnA0cTNO?=
 =?utf-8?B?aFQyRzl1VEtya1o5enNNdHYyZTh4VEE5TElURUpra1oyb1FKekI0MG1xMlNr?=
 =?utf-8?B?c1l1bi9DQWxCOFVLNVlqTFh3dW1uYUxlalRZSjEyS3hEeXhpeERWSHhBUnRV?=
 =?utf-8?B?cERhSTdBWkY2V1VzVStkZHdZS0ZFM1BWWFpVYWtkSkxnSkxVOGFxK2puTGFo?=
 =?utf-8?B?bVovQ3lsaitKbnZlNWxQQ25INWZrNklKN243a2Fub3d2c3hsUnU4UWwycWxR?=
 =?utf-8?B?M0tKY2MyclRhd2cvZzc4ZXAxTUo5WU5hMWxjMFpETXBncWtCTGdVQm5EdGx5?=
 =?utf-8?Q?dq2A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2cbfeee-e690-4320-3183-08ddad6429b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 05:59:46.3984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i2muESd8YHog9/3xlJU0SO2YABRV59MeHtrGl8xsUOdWflxQ38EogBFf3XzjkZPTj8PmSF3jBIzW3ziK8mWUGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7871

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYXNvbiBB
bmRyeXVrIDxqYXNvbi5hbmRyeXVrQGFtZC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSAx
MSwgMjAyNSA0OjAzIFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+
OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5I
dWFuZ0BhbWQuY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHY1IDA1LzE4XSB4ZW4vY3B1ZnJlcTogcmVmYWN0b3IgY21kbGluZSAiY3B1
ZnJlcT14eHgiDQo+DQo+IEhpIFBlbm55LA0KPg0KPiBPbiAyMDI1LTA1LTI3IDA0OjQ4LCBQZW5u
eSBaaGVuZyB3cm90ZToNCj4gPiBBIGhlbHBlciBmdW5jdGlvbiBoYW5kbGVfY3B1ZnJlcV9jbWRs
aW5lKCkgaXMgaW50cm9kdWNlZCB0byB0aWR5DQo+ID4gZGlmZmVyZW50IGhhbmRsaW5nIHBhdGhl
cy4NCj4gPiBXZSBhbHNvIGFkZCBhIG5ldyBoZWxwZXIgY3B1ZnJlcV9vcHRzX2NvbnRhaW4oKSB0
byBpZ25vcmUgYW5kIHdhcm4NCj4gPiB1c2VyIHJlZHVuZGFudCBzZXR0aW5nLCBsaWtlICJjcHVm
cmVxPWh3cDtod3A7eGVuIg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPFBl
bm55LlpoZW5nQGFtZC5jb20+DQo+DQo+ID4gQEAgLTExNCwyMCArMTYxLDE0IEBAIHN0YXRpYyBp
bnQgX19pbml0IGNmX2NoZWNrDQo+ID4gc2V0dXBfY3B1ZnJlcV9vcHRpb24oY29uc3QgY2hhciAq
c3RyKQ0KPiA+DQo+ID4gICAgICAgICAgIGlmICggY2hvaWNlID4gMCB8fCAhY21kbGluZV9zdHJj
bXAoc3RyLCAieGVuIikgKQ0KPiA+ICAgICAgICAgICB7DQo+ID4gLSAgICAgICAgICAgIHhlbl9w
cm9jZXNzb3JfcG1iaXRzIHw9IFhFTl9QUk9DRVNTT1JfUE1fUFg7DQo+ID4gLSAgICAgICAgICAg
IGNwdWZyZXFfY29udHJvbGxlciA9IEZSRVFDVExfeGVuOw0KPiA+IC0gICAgICAgICAgICBjcHVm
cmVxX3hlbl9vcHRzW2NwdWZyZXFfeGVuX2NudCsrXSA9IENQVUZSRVFfeGVuOw0KPiA+IC0gICAg
ICAgICAgICByZXQgPSAwOw0KPiA+ICsgICAgICAgICAgICByZXQgPSBoYW5kbGVfY3B1ZnJlcV9j
bWRsaW5lKENQVUZSRVFfeGVuKTsNCj4NCj4gRG8gd2UgbmVlZCB0byBjaGVjayByZXQgYW5kIGVy
cm9yIG91dD8gIChhbmQgYmVsb3cpDQo+DQoNClJpZ2h0LCB3ZSBuZWVkLCB0aGFua3MsIHdpbGwg
Zml4DQoNCj4gVGhhbmtzLA0KPiBKYXNvbg0KPg0KPiA+ICAgICAgICAgICAgICAgaWYgKCBhcmdb
MF0gJiYgYXJnWzFdICkNCj4gPiAgICAgICAgICAgICAgICAgICByZXQgPSBjcHVmcmVxX2NtZGxp
bmVfcGFyc2UoYXJnICsgMSwgZW5kKTsNCj4gPiAgICAgICAgICAgfQ0KPiA+ICAgICAgICAgICBl
bHNlIGlmICggSVNfRU5BQkxFRChDT05GSUdfSU5URUwpICYmIGNob2ljZSA8IDAgJiYNCj4gPiAg
ICAgICAgICAgICAgICAgICAgICFjbWRsaW5lX3N0cmNtcChzdHIsICJod3AiKSApDQo+ID4gICAg
ICAgICAgIHsNCj4gPiAtICAgICAgICAgICAgeGVuX3Byb2Nlc3Nvcl9wbWJpdHMgfD0gWEVOX1BS
T0NFU1NPUl9QTV9QWDsNCj4gPiAtICAgICAgICAgICAgY3B1ZnJlcV9jb250cm9sbGVyID0gRlJF
UUNUTF94ZW47DQo+ID4gLSAgICAgICAgICAgIGNwdWZyZXFfeGVuX29wdHNbY3B1ZnJlcV94ZW5f
Y250KytdID0gQ1BVRlJFUV9od3A7DQo+ID4gLSAgICAgICAgICAgIHJldCA9IDA7DQo+ID4gKyAg
ICAgICAgICAgIHJldCA9IGhhbmRsZV9jcHVmcmVxX2NtZGxpbmUoQ1BVRlJFUV9od3ApOw0KPiA+
ICAgICAgICAgICAgICAgaWYgKCBhcmdbMF0gJiYgYXJnWzFdICkNCj4gPiAgICAgICAgICAgICAg
ICAgICByZXQgPSBod3BfY21kbGluZV9wYXJzZShhcmcgKyAxLCBlbmQpOw0KPiA+ICAgICAgICAg
ICB9DQoNCg==

