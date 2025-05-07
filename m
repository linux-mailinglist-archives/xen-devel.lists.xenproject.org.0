Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51610AAD533
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 07:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978175.1365025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCXJf-0003O2-KT; Wed, 07 May 2025 05:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978175.1365025; Wed, 07 May 2025 05:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCXJf-0003Ku-Gu; Wed, 07 May 2025 05:27:35 +0000
Received: by outflank-mailman (input) for mailman id 978175;
 Wed, 07 May 2025 05:27:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UeMd=XX=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uCXJe-0002qb-1A
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 05:27:34 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20626.outbound.protection.outlook.com
 [2a01:111:f403:2409::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f957ce05-2b03-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 07:27:32 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CY3PR12MB9678.namprd12.prod.outlook.com (2603:10b6:930:101::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Wed, 7 May
 2025 05:27:25 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 05:27:24 +0000
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
X-Inumbo-ID: f957ce05-2b03-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQOPxk82f8TLDqFj2UUBuSG0xb73M30omoTL6EZdw/yb7U1IE1EDC6rVWDlnLsQw1WVJrBVHXnXrd/30j+pb/ne2P7UqYIA/lO5GETUyHvT2oveKMVIWGFLsgXw4dKFvZmzifs9lRsYRcvpLzt3nIahVYAnySWCx5jAKVpSLKRFek6C/HKVR4+dVEawPCd+TMHUeLE1lNIvd+J186gzMLWwlCZowm4Az8id8NRpLnWygt2Ub3lbSI/Y4cTrAUMsOlqkTsdJzLsl1RGKYqEZihzZbrVloXC3O6JVs/YpcQbL+3Vl6SAAL83/XfA+t09eFBXh/7yW167oAc2ZBOYXnKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XF7zXImdY1hbj3LxkfgEZU3aKT8tV5xHPOr87Te/Rzs=;
 b=R9XXJUwci6WDBEAROeqQeVsXp27TaOO4x47kLAUzVqtlm2JPNxoxgbNrKpyQj6PJmVjLf4zLdmUbShivwWoUd3/1cjtuGH3EPOipLDaBXWqaBKuJiIuYboyamghgOuauV6Vf2XMd5JALK9hZ8wGckw7QGk6UPGSPwewWGy5ompSmaZ+NL60dCEnSnkEWodrvkqJiXvX0fTKthWWkNxyW4PofEm0EzRgegTQe0WEBgj9o4ujD6OO0mGP5wqv5q0yw9LZYywXdFfIivWiAZlvJIxZlTWjbbFR+c4EewfY/R+mpeh9r8easglBkHgCJrtDRasl8LOjummbmpTiCPl3pTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XF7zXImdY1hbj3LxkfgEZU3aKT8tV5xHPOr87Te/Rzs=;
 b=iuUTsgN1+iYxMKQ7D5+VEICcS21feZz32SvRIMREFsaqLT4zzR+YugUz1V07QELyhu9YZRoS+ahbcbqrRAKkKG3dTJiazz0Db6rBlCrgek8oXP/zAR9LTIWCMFYZ9eWAvRTeatkthqVJjP0a1EoJQjbx17mvl8KmzACCjrLj0Qg=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 05/15] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
Thread-Topic: [PATCH v4 05/15] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
Thread-Index: AQHbrRCmtZ7pr/knH02upOrsNIOYE7O6sNeAgAvz/ZA=
Date: Wed, 7 May 2025 05:27:24 +0000
Message-ID:
 <DM4PR12MB84510753F3B015F1404803FDE188A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-6-Penny.Zheng@amd.com>
 <57a3b2c0-d57d-46e3-b248-0e243f715423@suse.com>
In-Reply-To: <57a3b2c0-d57d-46e3-b248-0e243f715423@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=e5bd0894-797d-44c3-a227-8ec4b52f72c8;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-05-07T05:27:14Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CY3PR12MB9678:EE_
x-ms-office365-filtering-correlation-id: fa38bffb-6f9b-4230-071c-08dd8d27d961
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QVlVb1E4VnlDRDJ2ZlVsOHJCTWZGU0phU25DK2k4UWpROUVoYmJFVzNSQk9F?=
 =?utf-8?B?YVkwekM1S0J3THQ0VFhLc0dISGxjV0VQTGsrT2IyVWNtUjdIRHVYckh4Nm96?=
 =?utf-8?B?dUV0ejFuM1F3OHdBeG9OZzNuSGx5dlpJVWROT0tSVldhUHJLQ2RwZU1UbkFF?=
 =?utf-8?B?MzRmUzZMVjJEc1VsclkwVE4vSXlDSmhJcy9kaGNXNFdZeFZLc1o5ZDdvOEJW?=
 =?utf-8?B?RFUzeEE2N21qM05FSW9DOWxZZjFGMkVPdThNcE9sWml5RXExamxCUVowTDVG?=
 =?utf-8?B?NVlKU2VsdjB2L3BtRFNnbFBUaExHUkdEL3VoeWNpV2dVcjFUMXJHMGdSK0xQ?=
 =?utf-8?B?ZTBzMWZ0cHhUR013cHp5YWhxOVA5Zy9CVmtyTWdvRHJkS2JLdVNwNjByMVox?=
 =?utf-8?B?ZEVUL1BTRFFBS0RtNGRkVi9EdjNZM1QyUWNaV1VFR2QxWjRHbHU1SHd4Wm51?=
 =?utf-8?B?bksrSEJVT01PcytQcFdJb2k1alByWGhBNjhxS0NwT1BHVFpISFBCbStWMStC?=
 =?utf-8?B?UUVjUWpQcTlJNGlJZzBpQjZWbG5JNDdCMUNMUHMzWGl3ajU4RmlqMm1KcEFo?=
 =?utf-8?B?NGZHdndPRGN0cjJnS3ZBblJZZFJZS0lPU0dUL1V2aVgwa25VRnpNVjZBdUNs?=
 =?utf-8?B?d2wxaGVQRHlrbWhVTWI4MW1sUVVKanF0cEZIcUZHbjYrbGdKdVg5YzdYa01q?=
 =?utf-8?B?QUJ3SDFhdGhKaFRtMGxuUXYxYnBYWW1wdk9QdEdBRXZJa1J4blN5QzZpd1VH?=
 =?utf-8?B?eklKWlFjeFhpWjVvdDFjRDR3WW9OVWxNRVdCRCtZS0VlL1F6c3J2L004Zjg3?=
 =?utf-8?B?ZTh6Wnp1QVQ2aCswRytpeThoejc2ckNzMGVyTm5xL1pmTWZ5ZlUzVFVxdkNw?=
 =?utf-8?B?TGN0VkoxRUFUVHZ3UFU4Nk1CZzdoYm5OYXNtRU9RYjVKcnd3eTZTWEpWRCt1?=
 =?utf-8?B?MmVHV3llM0ZNNU9mTmx0dmc2UVEzMytueHV1cTh1eityVlJwQWZtckdhRnND?=
 =?utf-8?B?NVZGaGpJY0JqUVdWdVpIN3BQNXVqOVFvbkxHNFJ0RFpROWE4Z29zMk1tSENs?=
 =?utf-8?B?SG1HR1Z1ZGNUZC9QUjZBVlNNekxxY29haHRsSXhpUVRxVVJVdUY3UVlTU3Br?=
 =?utf-8?B?bzVyeWxHYXdPREYyczl6L291VmV5WDdGNlZkR2N6cFl4czdXQmdHeWUrVlU1?=
 =?utf-8?B?OTlQS0t0aHpsclZXL2JmOEhObnlBRzJkMUhCemJWdXFqMkkwSmlyMnowTlBL?=
 =?utf-8?B?RkhBb2dESVZWalRKaXRQZ3FHaGtVRko4TVlWV0lHMXVVVlh4c0Vyek1QSU9q?=
 =?utf-8?B?a2F6NGVpTnFrUlhVcFZSWjcyS2RjVzJSWVVCUFRYcUR3TGZqNEdJMFJucU1o?=
 =?utf-8?B?VGJzcHVoQURyeTErVndWTWxRaDFqTWpNOHlOOFRiWXJSNFdkK3Bnc2RZRUtE?=
 =?utf-8?B?dGR1SUFiaUt6STFCY3g0MzFGTVBMUElicVF4dU4vaUd2MWVGUG1wOU9kS1Fh?=
 =?utf-8?B?N2J1SDdFdlNGSWRML1pGc1gvaWg1eTdKQWFPQ201aDU3SkV5UG5qTytDQ2Y5?=
 =?utf-8?B?WEMya250QnVnbUZYbnY1ckkzU0Q0dG9SejFrWVZ2QWlJUlI3SVF3cTUxdG1B?=
 =?utf-8?B?MkR5UlVsS3V5NGxROWppZ3BTdTZNdVpkUXMzQlJLZnliNlJrZkJNZTdHc3N0?=
 =?utf-8?B?UC9YZGxZbHlsOUUzeUdVMitlaVBVb0U5WmdBVFFmQkJ2MGY1Z1VJRnRWYVM4?=
 =?utf-8?B?OGppcjBHQXE5VWFGdlNiZWdtZi9sZk5uQy9TZGNzWE1KS1NOV2tVUDIvT3or?=
 =?utf-8?B?Mk5HaW1nZWZsdjRXVm9XMmU2eW8rVmcrQjZFdi9JN2NwbWE2UTVaalU5dEZh?=
 =?utf-8?B?c1lUYlkreUl3RUFkekJEZWJYMk55NVdnbktzWTJ0L0xOdlR1dFRmc2kwY1d2?=
 =?utf-8?B?SEtsUURmWHQ0R1hmR3JqYy9WTzI3eFl4SEVjcmhlL2g4ZUQrZmNVczUwMjYy?=
 =?utf-8?Q?rgwHONku5odTIlHKGikcPmoaxEoE9E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cklBQ0sxam5uNVZjQ1V3ZVM0V3ZnV29FQWtDaTRmZzUrZ2FGYUFTRDJ3SFNv?=
 =?utf-8?B?WXZLaUhhU0x1SVQyYlJmUDNpMVk4bTB4eXlFeCtQTDJHcXRvZFVIajY2NzVK?=
 =?utf-8?B?eUxGRkxJcjVUZkNPZkliL0JsWFVWc3UzeXZ3VGZTREdLdlhzUEphSHBIZWd2?=
 =?utf-8?B?d0tUNTlqaGhtMzl3N3hJS1ZKQ21xQ0RFR1puSlo4RFQ0Y0Z1RlBoTmlSZjha?=
 =?utf-8?B?TzRXeUNFZ0NkbnZ6NE9CNkJ1K1JYaXErU0tsNExtM1lQM2ZaeDhWTWpaS2tv?=
 =?utf-8?B?Ri8rQWxVeUhNY3c3NytwTGh4dzlWUHRzMjhmdnZ2czMzL3RreDd3enZXbWRG?=
 =?utf-8?B?S1JLRmJER0JGZE9rQ3VCZXR2NEpDYTFtVG5qNzNleHdtSHkxdm9XblFobTBx?=
 =?utf-8?B?eFpYMGhEdVl6ekx5d09qS0lYd2M1UFpiVWwvWkU5T3VqV3U0WkQxV0ZUQXdt?=
 =?utf-8?B?cnVTMFR4Ky9KMTZEYjY3MDBTR0U3RkpvUVVDRldRNXdLbTJ0V2JGa2VFNmkz?=
 =?utf-8?B?bjBDbjN0Rkp3ZFlKamNNbnBVTEs0NkpnTnNhSHhwYVo3Sytxb0ZsbUVNR3RV?=
 =?utf-8?B?d2tuNVVERFlnbHA5QTdxcXFueVJDZWg2TjRiWjVJendHZnlYaXc0a3hpVWxo?=
 =?utf-8?B?SE5QdjVMUWhycUtlRGlQWDFyMFV4eFJBT3l4S1grc1hmcW1IcnVHRjd3TFhv?=
 =?utf-8?B?YjFwYTVKTW00K1RxdTJTZ3BVTkZ5RVJHZG8wdExnaTBCUjNnVWNvdVdXNEVC?=
 =?utf-8?B?WUhoY0x0cGMwY1lsZjlSdG1vYTA5RlE0cnJnVEVDTkM3UDhmT0FSNWZZOUNu?=
 =?utf-8?B?anFhVitESmlkSHRTRjZEQmdXMjRnV3B2RDFWRnhLN0UxNnlHOHJpSlBzT3JO?=
 =?utf-8?B?RXBPdG1FTnJVZjl2ejMzTmhza01adm96bTJrS1VJS0poalIxVm9sTHVacW9T?=
 =?utf-8?B?U3hMdGZTTUdLdUwrM1M0ZERVOTQyY1JVVjArYlZWa0tHeEYrSVhjRHd2WGpD?=
 =?utf-8?B?VGU4UUk0aE1NUTloZlpUeFZMUERCdU5KUXhSY1RWbnFlZE9uMHNsM0tXZFVn?=
 =?utf-8?B?SDJCY0NWYUNheDBTQXl5QnMwRStzQzQ5Tnk4T1F6dmxRQzdqSFdxTEFtZWJx?=
 =?utf-8?B?MityQ2Q3QTFsaXpIVk5PSjgvcGdYSjFmWTNrVUJENUlsOEl2b2IwZzdZQmIr?=
 =?utf-8?B?V0NmWnlXYmZqWlltUlo3U3MyVkswM2hOT3VuZWQxSzhLWkJaM1MzWmtXSEFL?=
 =?utf-8?B?Y3F6akRCY1RSWXBmNFkwYUV6WGhNUitlUk1VVzN2N0ZFbTZGWGVIQ0xGemEw?=
 =?utf-8?B?TVRmY3FCaW1MZ0ZPSmVLV05NY25VY25pT0RQODYwOEthVDd1VFJWdjJDamM4?=
 =?utf-8?B?ZUc5Z09TRGlFN1VZZG1jNjAxWlpJTWMzVm1NQVZwVVJPODhBVmd1UU5Dcjdx?=
 =?utf-8?B?cFphY1drb3ZUQjZBREd1VE5QUzQyTCtva25pMWJXS1BEaDZ2NWMxTXQ3SEg1?=
 =?utf-8?B?dGF5SkNhSXYzOUYwaHIrQkhvY0JmNVB2b1gwZnBXbzloVUdzMGhRWE9xeGpo?=
 =?utf-8?B?VW55OUhlUEdaNTJXbWZXK2h4b1VoQU1BQXVTMDJaZERQYzNSNmtKOFpPdzRa?=
 =?utf-8?B?YUJxejRFaHp4LzRUMFA1SkRHYjlWNWlNUk92SGJBSzZncmZIWTF5bzhZSFZq?=
 =?utf-8?B?eTRaRzJ2TTJTWWY3WEI0UmxsckpVeDZUckgvM1R5TmZRSTFWUkwrTTZ4RjY0?=
 =?utf-8?B?ejNTbUNPVHc5WENJTWIzT0gxZ3luZmNocXhwWmltZk9ZNmpTNHhXQmNVb2l0?=
 =?utf-8?B?ZXpHbHBqM1h6bUZBNDJkYmdmVTZwWDA5OGcyYlZmSHFUUnB1ckh0YzJCbUNI?=
 =?utf-8?B?NUFIQ1dJcnhjeEF2UEJ1WnVwTGFkQUxhNFcrdCtFV25MNDZralBsSDVHWEs2?=
 =?utf-8?B?ZDBXSlpXWWlkU25CWmYyenErK3ZoVTNXUFFnRXA0TFhraGhaWTJnVlA2VHN3?=
 =?utf-8?B?UU5oTS9TSlZoSmNDL1gzbHFDYldNaUFiNHJyZjB0VTYwdm9SUHY5U0NnSWkx?=
 =?utf-8?B?V3RuRDkrOEpadThRcHRibWdoTFc4T0hVRldFR0dHejh5UEcyZThyY2lQR0R6?=
 =?utf-8?Q?84Qs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa38bffb-6f9b-4230-071c-08dd8d27d961
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 05:27:24.6660
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k8nQVuW+SjHB6VSUCoJNjsgmxlXZZYD8JCIAGdXOgLCO8GMn3Zh5qx0HmbmT8TJer11UVWRIEL7lW28+rzHK1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9678

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBBcHJpbCAy
OSwgMjAyNSA4OjUyIFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+
DQo+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4g
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJh
cmRAdmF0ZXMudGVjaD47DQo+IE9yemVsLCBNaWNoYWwgPE1pY2hhbC5PcnplbEBhbWQuY29tPjsg
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFJvZ2VyDQo+IFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsNCj4geGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjQgMDUvMTVdIHhlbi94ODY6IGludHJvZHVjZSAiY3B1ZnJlcT1hbWQtY3BwYyIgeGVu
DQo+IGNtZGxpbmUNCj4NCj4gT24gMTQuMDQuMjAyNSAwOTo0MCwgUGVubnkgWmhlbmcgd3JvdGU6
DQo+ID4gQEAgLTUxNCw1ICs1MTUsMTYgQEAgYWNwaV9jcHVmcmVxX2RyaXZlciA9IHsNCj4gPg0K
PiA+ICBpbnQgX19pbml0IGFjcGlfY3B1ZnJlcV9yZWdpc3Rlcih2b2lkKSAgew0KPiA+IC0gICAg
cmV0dXJuIGNwdWZyZXFfcmVnaXN0ZXJfZHJpdmVyKCZhY3BpX2NwdWZyZXFfZHJpdmVyKTsNCj4g
PiArICAgIGludCByZXQ7DQo+ID4gKw0KPiA+ICsgICAgcmV0ID0gY3B1ZnJlcV9yZWdpc3Rlcl9k
cml2ZXIoJmFjcGlfY3B1ZnJlcV9kcml2ZXIpOw0KPiA+ICsgICAgaWYgKCByZXQgKQ0KPiA+ICsg
ICAgICAgIHJldHVybiByZXQ7DQo+ID4gKyAgICAvKg0KPiA+ICsgICAgICogQWZ0ZXIgY3B1ZnJl
cSBkcml2ZXIgcmVnaXN0ZXJhdGlvbiwgWEVOX1BST0NFU1NPUl9QTV9DUFBDDQo+ID4gKyAgICAg
KiBhbmQgWEVOX1BST0NFU1NPUl9QTV9QWCBzaGFsbCBiZWNvbWUgZXhjbHVzaXZlIGZsYWdzDQo+
ID4gKyAgICAgKi8NCj4gPiArICAgIHhlbl9wcm9jZXNzb3JfcG1iaXRzICY9IH5YRU5fUFJPQ0VT
U09SX1BNX0NQUEM7DQo+ID4gKw0KPiA+ICsgICAgcmV0dXJuIHJldDsNCj4gPiAgfQ0KPg0KPiBX
aHkgaXMgbm8gc2ltaWxhciBhZGp1c3RtZW50IG5lZWRlZCBpbiBwb3dlcm5vd19yZWdpc3Rlcl9k
cml2ZXIoKT8gSW4gcHJpbmNpcGxlIEkNCj4gd291bGQgaGF2ZSBleHBlY3RlZCB0aGF0IGl0J3Mg
bm90IGVhY2ggaW5kaXZpZHVhbCBkcml2ZXIgd2hpY2ggbmVlZHMgdG8gY2FyZSBhYm91dA0KPiB0
aGlzIGFzcGVjdCwgYnV0IHRoYXQgdGhlIGZyYW1ld29yayBpcyB0YWtpbmcgY2FyZSBvZiB0aGlz
Lg0KPg0KDQpUaGVuIG1heWJlIHdlIHNoYWxsIGFkZCB0aGlzIGhlcmUsIHRvIGV4dHJhY3QgdGhl
IGNvZGVzIGZyb20gZWFjaCBzcGVjaWZpYyBkcml2ZXI6DQpgYGANCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvYWNwaS9jcHVmcmVxL2NwdWZyZXEuYyBiL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdWZy
ZXEvY3B1ZnJlcS5jDQppbmRleCBlYWMxYzEyNWEzLi45Mjc2MjQxMjkxIDEwMDY0NA0KLS0tIGEv
eGVuL2FyY2gveDg2L2FjcGkvY3B1ZnJlcS9jcHVmcmVxLmMNCisrKyBiL3hlbi9hcmNoL3g4Ni9h
Y3BpL2NwdWZyZXEvY3B1ZnJlcS5jDQpAQCAtMTkwLDYgKzE5MCwyNSBAQCBzdGF0aWMgaW50IF9f
aW5pdCBjZl9jaGVjayBjcHVmcmVxX2RyaXZlcl9pbml0KHZvaWQpDQogICAgICAgICAgICAgICAg
IGlmICggcmV0ICE9IC1FTk9ERVYgKQ0KICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQogICAg
ICAgICAgICAgfQ0KKw0KKyAgICAgICAgICAgIGlmICggIXJldCAmJiBpIDwgY3B1ZnJlcV94ZW5f
Y250ICkNCisgICAgICAgICAgICB7DQorICAgICAgICAgICAgICAgIHN3aXRjaCAoIGNwdWZyZXFf
eGVuX29wdHNbaV0gKQ0KKyAgICAgICAgICAgICAgICB7DQorICAgICAgICAgICAgICAgIGNhc2Ug
Q1BVRlJFUV9hbWRfY3BwYzoNCisgICAgICAgICAgICAgICAgICAgIHhlbl9wcm9jZXNzb3JfcG1i
aXRzICY9IH5YRU5fUFJPQ0VTU09SX1BNX1hFTjsNCisgICAgICAgICAgICAgICAgICAgIGJyZWFr
Ow0KKw0KKyAgICAgICAgICAgICAgICBjYXNlIENQVUZSRVFfeGVuOg0KKyAgICAgICAgICAgICAg
ICAgICAgeGVuX3Byb2Nlc3Nvcl9wbWJpdHMgJj0gflhFTl9QUk9DRVNTT1JfUE1fQ1BQQzsNCisg
ICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KKw0KKyAgICAgICAgICAgICAgICBjYXNlIENQVUZS
RVFfbm9uZToNCisgICAgICAgICAgICAgICAgZGVmYXVsdDoNCisgICAgICAgICAgICAgICAgICAg
IGJyZWFrOw0KKyAgICAgICAgICAgICAgICB9DQorICAgICAgICAgICAgfQ0KKw0KICAgICAgICAg
ICAgIGJyZWFrOw0KICAgICAgICAgfQ0KICAgICB9DQpgYGANCg0KPiA+IEBAIC01NzMsNiArNTc2
LDE0IEBAIHJldF90IGRvX3BsYXRmb3JtX29wKA0KPiA+ICAgICAgICAgIH0NCj4gPg0KPiA+ICAg
ICAgICAgIGNhc2UgWEVOX1BNX0NQUEM6DQo+ID4gKyAgICAgICAgICAgIGlmICggISh4ZW5fcHJv
Y2Vzc29yX3BtYml0cyAmIFhFTl9QUk9DRVNTT1JfUE1fQ1BQQykgKQ0KPiA+ICsgICAgICAgICAg
ICB7DQo+ID4gKyAgICAgICAgICAgICAgICByZXQgPSAtRU9QTk9UU1VQUDsNCj4gPiArICAgICAg
ICAgICAgICAgIGJyZWFrOw0KPiA+ICsgICAgICAgICAgICB9DQo+DQo+IFdoaWxlIGF0IGxlYXN0
IHlvdSBubyBsb25nZXIgdXNlIC1FTk9TWVMgaGVyZSwgSSBxdWVzdGlvbiB0aGlzIGJlaGF2aW9y
LCBpbmNsdWRpbmcNCj4gdGhhdCBmb3IgdGhlIHByZS1leGlzdGluZyBjYXNlczogSG93IGlzIHRo
ZSBjYWxsZXIgc3VwcG9zZWQgdG8ga25vdyB3aGV0aGVyIHRvDQo+IGludm9rZSB0aGlzIHN1Yi1v
cD8gSWdub3JpbmcgZXJyb3JzIGlzIGdlbmVyYWxseSBub3QgYSBnb29kIGlkZWEsIHNvIGl0IHdv
dWxkIGJlDQo+IGJldHRlciBpZiB0aGUgY2FsbGVyIGNvdWxkIGJsaW5kbHkgaXNzdWUgdGhpcyBy
ZXF1ZXN0LCBnZXR0aW5nIGJhY2sgc3VjY2VzcyB1bmxlc3MNCj4gdGhlcmUgcmVhbGx5IHdhcyBh
biBpc3N1ZSB3aXRoIHRoZSBkYXRhIHByb3ZpZGVkLg0KPg0KDQpVbmRlcnN0b29kLg0KSSB3aWxs
IGNoYW5nZSBpdCB0byByZXQgPSAwLiBEbyB5b3UgdGhpbmsgd2Ugc2hhbGwgYWRkIHdhcm5pbmcg
aW5mbyBoZXJlPw0KRG9tMCB3aWxsIHNlbmQgdGhlIENQUEMgZGF0YSB3aGVuZXZlciBpdCBjb3Vs
ZC4gWEVOX1BST0NFU1NPUl9QTV9DUFBDDQppcyBub3Qgc2V0IGNvdWxkIGxhcmdlbHkgYmUgdXNl
cnMgY2hvb3Npbmcgbm90IHRvLiBJbiBzdWNoIGNhc2UsIHNpbGVudGx5IGdldHRpbmcgYmFjayBz
dWNjZXNzDQpzaGFsbCBiZSBlbm91Z2guDQoNCg0KPiBKYW4NCg==

