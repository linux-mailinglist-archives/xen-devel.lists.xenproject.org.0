Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8637DAB60E5
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 04:47:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983714.1369924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF28N-00008l-AM; Wed, 14 May 2025 02:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983714.1369924; Wed, 14 May 2025 02:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF28N-00005N-7P; Wed, 14 May 2025 02:46:15 +0000
Received: by outflank-mailman (input) for mailman id 983714;
 Wed, 14 May 2025 02:46:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b4Lg=X6=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uF28K-00005G-TO
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 02:46:13 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20617.outbound.protection.outlook.com
 [2a01:111:f403:2417::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96ea1076-306d-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 04:46:10 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH7PR12MB6667.namprd12.prod.outlook.com (2603:10b6:510:1a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 02:46:05 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 02:46:05 +0000
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
X-Inumbo-ID: 96ea1076-306d-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7j+DuSbhq/RYIAALY9ibgh3R89ttu9LSclDlkFwhzCD/s3fC3eFFPLWRuWK4usCej0XEHSdkBud0U/BrZm373WBBMAqzOVd7c0F3jFDV7PiPA5kexMa2qa8TQttUAHVd3wUYy4PukaT+KLibD5Ves4JaYwU+e0VVRyVnfynWdYEP6FJhmfwpSHatf3gYY+6B1E/gEj+FkZTREtp/14Z6asn1Ep3sp1EY9jLssvhjniOzRlhZWd5t1XXmukvmT/QmU4+CVp6t/kQCrqNR1KFhg1I56aoyreyc9xLCeuUsE84qMyuYxTGm926e0CRpnYHpPv46PDzs6DwAV2aKdMU8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFyHfXkgoGtX6uQDPfT80OBoYCcwhwVaK7GSHcOxXI0=;
 b=jpOykjvLpuuaI4OnjHXdDJL1bE1xnwqN9rIY6nrOUhPzK/BulnGmeuVTOeie62v+7GfKShhVwwkjQj1BvA0CpPSmnU52YQFT2g25N/zxRxJQCF687MRYtDsJX/7OjYaJr1LxKGkjazXZZmjG81V9A7JoDXkyg5GnVs/oW+v0bLOVIACerFIPn379RV+Hyph7oEIaWPaGknEXyaaYPf3nWGCwJY4S4H6HRYyRtcz7m4/EYNXuuAuKQacOIDD0nd1tA1g0q6g2E9RgE//vkceIJHjfbzNXY+YJUBDAqzuoFf1WaqrmKOaTRDP1q7CEHWkkSK68/XmCRRUSGA5MnTlciA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFyHfXkgoGtX6uQDPfT80OBoYCcwhwVaK7GSHcOxXI0=;
 b=Zv9pqXo9IcH8NZPuQh/tWqEKU2FJnvand6B6Kf1cMynJ8fybNOtBzz4Qzo8qv0hUMWc5gRlKNpqL8EDwhqBbV0JqSlV/grgEfs5lmmbSjzv3JsO8i8waK4JxYC3MuQBlf+k0kadc0/zSZn2uxMmvF7qv1J9tbW8caqp+8Kjupwk=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 02/15] xen/cpufreq: extract _PSD info from "struct
 xen_processor_performance"
Thread-Topic: [PATCH v4 02/15] xen/cpufreq: extract _PSD info from "struct
 xen_processor_performance"
Thread-Index: AQHbrRCjQUXzVZg75kKZW3IeVU/v2LO5SzoAgAvud1CAChU8gIACS2EQ
Date: Wed, 14 May 2025 02:46:05 +0000
Message-ID:
 <DM4PR12MB8451E2BF8A10583BD72E61CAE191A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-3-Penny.Zheng@amd.com>
 <829e710d-d257-455a-b4fc-1746119609ef@suse.com>
 <DM4PR12MB8451AEBC8D8D1A005A074D5EE1892@DM4PR12MB8451.namprd12.prod.outlook.com>
 <c86a08d3-46b9-4341-b6ed-a13a7a760bf0@suse.com>
In-Reply-To: <c86a08d3-46b9-4341-b6ed-a13a7a760bf0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=fdb35494-bfc1-4161-a69b-d10dbde4ffff;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-05-14T02:45:57Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH7PR12MB6667:EE_
x-ms-office365-filtering-correlation-id: e63ada86-03d7-4638-dabb-08dd9291792b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bnhoWWRMZFRqaFUzUlNLMFdKVWR0ZnVQUG9na3p6bFVGTjdnbU9CamJONTB4?=
 =?utf-8?B?ZjNid29nL1Q1QjgzVjl6cEIxU1hjTjdGUXFYMHc4RnJabUwyNU1ZOHl2K2VS?=
 =?utf-8?B?RHJ1c1d1QkdhZHhCd2k5Mmt0SDU2WVh3bE9HZkYvVC9uejNYdlNrWmhaTy9h?=
 =?utf-8?B?eGxvcFFOUTJCL2JqU2dmcUFPcGc3cDdQTDhhQjBDSGJ2V294Q1B5NU81VnJE?=
 =?utf-8?B?aDV4SGthZ1dPMkJsVzUzR29GOTNwVUpBZHcwMWtQcHdaekY4aWhkK0tjdG9W?=
 =?utf-8?B?eVRSYnlzUGcyNHFNZUZjdFBoSUZzNjY0V0ZkZUdLY0oxNmdzVnczOWlMa05D?=
 =?utf-8?B?QXRYbkVZa08vSGRXZEg4K0JpakdSQmRFN2JLQ0Q3UmRZK1lWVjRoVWVYTVB5?=
 =?utf-8?B?QVh4ZDBnQ2NFUFoxRHJVbFRGYU50bWV2Mm5OV21iK3d1WDk1UHFRM3dpa2Vk?=
 =?utf-8?B?cXU5ZVNwNFFmUFJTcUwvNmtKMjQ4Rkl5MG85N2NxaTVYZnZudEtHSFdPZHJQ?=
 =?utf-8?B?NUN4eGd1d1kxUHM4M1lDeHpIeDhGblVYUDc1NXdRd0Z1enhGc1dLbDMzRWxG?=
 =?utf-8?B?Z1JGdzc1QWZuWS9zQ1VNdFhybWJWb1VYaVc2MlVLSFlzaDl0Mmc0MDFaV2lI?=
 =?utf-8?B?aGtOL2l2WEVYaUdmTC9HMnI1Q20vbHQvTXlpL2liaGIxbDZqdW1KMlZuSmNN?=
 =?utf-8?B?Ynd4K1VQOFlZSEkyS3JzYTIrcWxqNzJxZFhZMzF5Z1VBUDM4VzJWeEZHN1Ji?=
 =?utf-8?B?eFVnWi83MzBESS9TUFNzZmhTaVNBWlFFQittYmdsc2N1WHZPd0YzQWtDUFlX?=
 =?utf-8?B?VjdqWUhqTWxmR0RpSU1UZ091OGRSeTRpaUpUUEdTN1g1U3ozbGtFVUVEY0V6?=
 =?utf-8?B?OVlyNU50TytvcnpaM2FxU1hwS0JsTHloMHZCNDF5MTNsOVlaK1RjWnp6c2hH?=
 =?utf-8?B?WmtDTmUrakd5UnE0T0JyM01MWDNmTU1JRXFreVJrZFdjYUF5RS9Nd3ZDT3JZ?=
 =?utf-8?B?bGNlVnVFSldJNnRyS3NnVWtxbUZtZ0h6RGl2SmFDY01wS2xxbmtjaEY2YURR?=
 =?utf-8?B?K0J1L0dURDdQNVFJc1JxSzBZQjBwMHJzNWdqNUdUUEErQVhHMzNUelJaYjd0?=
 =?utf-8?B?a1p2QlBwNFhRY21PR1MySkNCbEJmR0prVHY0Z2lVVUg2dW1ncm1KeVNxZEZl?=
 =?utf-8?B?Q0hCRi9QL1JWTWVwcFd0VXhtNkpjVEVhTTBOWVNJQ1Z6V1krMXhTZk5PSkwy?=
 =?utf-8?B?b1FQQVArWVE0MnRvaG04S1JCa3ltYjA1RmNMKzFkbU5zOHoxak1Ib1NpSHZh?=
 =?utf-8?B?Q1labFBubUVqVWRsZU8wSzJVbWk3dzJMVVhScTNsSVhUem5TTkJBQVNKVzU5?=
 =?utf-8?B?cnVjRC9GSm1yVU5HSVNVLzcxR0JvOXRvUU9IN1VWQllWTE52MXdjcXhxaWJh?=
 =?utf-8?B?aVRIYzNpdCthUE80SVFRZGtzL1VLTmVlbTAxRmYrRmRZcDZKd3FUS1NLYWxQ?=
 =?utf-8?B?NTRjT0sySGc1YXl2Vk44aFFhWU80SjNrMHhhRmNyL3M2UDZXUEZ3TkthS2o1?=
 =?utf-8?B?Y0hnbVhPUzRYZ1lYZWRXWUhCVUtNaXhSYkt5VDZJYXZXVlVWditJajhZYTFy?=
 =?utf-8?B?VytEMG1wM0UxVEwvZHJRd0t2R0JzNW5SMHZQS055Tll0a0I0M2pYT2pwWGwy?=
 =?utf-8?B?bXR2UGVrMGlWNkYvUkJ3bHZXZmN1REp5Y2UwbDQwNkNqODAzVisyZHBFNTFk?=
 =?utf-8?B?bStSb3gxZjRoN29GRHZGZzQ4YmE5MkhpRG1wbFR2QnVoVW85OGFxWFVna25t?=
 =?utf-8?B?Qm9McVFTRmhuZVVncDVlYXd0c0Y2NlA0T1dBYmVhczQ5ZHkrVWRhOTZvcmkx?=
 =?utf-8?B?dDRRWkV0djRLWE9OTWJ0UzZtUzVsUXRTaVNDdXhNMnk2V3lvQUpLeFRNRGV2?=
 =?utf-8?B?cTUzRGdST0M2T0J3RFBWTU8zYXp0cVZzY1pZY2RUcFNJakZGZ3NMTDZpY1lj?=
 =?utf-8?Q?8h42+pe40hGfEDuDbiehpt3RXq1zXc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ekxxaFFQaERUdU96NSs0VUVFUTlIczJoVERXWlM4bmZJQVlXWHU3eEFQSWJ3?=
 =?utf-8?B?Y0MwWnJjRVNSOEpvS3BxTHh0QmNCOHMvL1hVZjZTbVBCQ0xHZWlwdE1vT1ls?=
 =?utf-8?B?MHBhRDA3NWNuR3lESmhYK0dHd1Z2UVJaaW5waVM1R3UxN1dHeGFsdjhDSzJI?=
 =?utf-8?B?L1VOdFF3M1NKb3RXd2RuVzRrb0JmdHNJRTdtQ3p1Ny90NUNwZDBhL3lkQXoy?=
 =?utf-8?B?c3E1NEZEK3V0WFFETGRucWtUU1E0YXNWVzd0alBhRms1YTFSYXBMOC9nMXNw?=
 =?utf-8?B?SVFSaEx4MWZ6OXk2dEdoTWRkdzFRK2szaktzcFo0NThDNHZVNGtRNmlqenBp?=
 =?utf-8?B?dFFaNVQ1UFB5c3FzUEtzK29qT1RKbFpNeU1FbWlJTldqa0VnMUN0dmJvdisz?=
 =?utf-8?B?UjJJMmI5eVNZcHUwb01XVVZYdFhJSlNFaEl4QVN1enh6bWZOcm5IUFMwS3pv?=
 =?utf-8?B?d0UyYWFzUDFpdXlPWVYyOVYwK3owWUpUM2MxbUJyUGJhNFRuWHBSR3RBbGVl?=
 =?utf-8?B?RnZLWk1WTEZpcklCS1FManRGdjNpckhaZHVJc0xHdU9TcHVaRDFSd3hqTkhm?=
 =?utf-8?B?Z2NqbklESm9iTzRURVluT2hVTU5JamRSbXRLU1ZjUHRJN09MM2lLLzVNRjB3?=
 =?utf-8?B?VXp4SS90MFVzU09lUFdEaERjaElYNTdoOWR0ZDVOZFRySVd5N3N1S21kanR3?=
 =?utf-8?B?MWhhZUE5QjBBOFY5bFZleFoyOFU0eWxQUW1FS0FldGtienptZFkxL2U2VnNN?=
 =?utf-8?B?RDl1ck5NM0FBQjFpU214TllseGhpa3F3bXdPam9zQ0hvOTREd0xaaFhhSFZl?=
 =?utf-8?B?TzAzMjFtMElXVUs4dk5leDRpQWI5M3ppa3JYcFRCQmgwNzlJSzlJZHZ6UHQx?=
 =?utf-8?B?eVFZTllVNUVKZWYwbU1IWU5KT1BJNDJpNVBEVUdtdEZhUUVIWU9pK3pya0lN?=
 =?utf-8?B?YlNHcGozcU9Sc2Y1eTd4aWlNdVVQZ1RzejJMTFVKT01LaG1TQVp1WDFyeVBQ?=
 =?utf-8?B?NU5JeXdMU1V5YWxab2t4R3FyTGM2bXRwRXdsUjV3cUswRXF3dTJ5TVIrWDFn?=
 =?utf-8?B?YklmQThpenBBTld2aUFLdW0wOC9PN3NBTk5NblprTU1tdmhKeGRVYmRXTkJQ?=
 =?utf-8?B?bGd6VUVwWlM1SU5Va0NKUHdHbDk4aTVUWnZlMHdJVzUrK1VUVjlQVFk3NGNZ?=
 =?utf-8?B?dmxYNFFVb2ZRUnFoMTZ3elVEeU1qWEJZTW9hWTVIYVgweWNScVZzWDBHUVQz?=
 =?utf-8?B?S0RDZDRKeHlBdHhsbE9OaVZ6OUlKaHpEb2ZXSlJyUFJoVXZuZDR2eHVobTlG?=
 =?utf-8?B?YUoxWlg1cVhHeGRNWFBjRFg5Wi9lb2pQby9HNkRuYzZ3RTFiMkhwT2s4QUpM?=
 =?utf-8?B?cTNncWpsYkR4bEdQeVNQUmUzMEZmNFpRTG93MDNpRzdILzZIYWZhbWF6QUFw?=
 =?utf-8?B?QXh3Z1RUaUxGRXpKd3FuQTQ1VVl5ZVo2enVhcUxjbEkyalFKMmozM3V3VHpl?=
 =?utf-8?B?QjZMakhQQWlTakZPYmhLSVBHM3NUUE4yY2VHd0M1bi9lQVRqSGtQV1VsbnNY?=
 =?utf-8?B?SDZ0ZWdCSTdlSHlxRTVqRUw3bi9PU2xrZ3RRdnJrSHp5cXUyWFZjN0pyS2JF?=
 =?utf-8?B?RFNSaXF6a2IwNkJQNmcrU01sMGxITXZIak5mT3ZlMXRndmVMend4WjFDUDBC?=
 =?utf-8?B?SHVCT3NnOWdqM3M4ZTl2VWFWbUowR25MVWU5cUh6cVNNRHM2ajlwT2xldEZm?=
 =?utf-8?B?SktkVzQ2MFA0MlYzN1hOcVFkRzFQeHR1aFJEVmJ2bllEcEtic0d6OFh6M3Fn?=
 =?utf-8?B?RUNRRjdmc0E3L3pqNmhlR2FzV0tWb0cyOHVEZ3E0YmRLcysrRlhvT0xjUllw?=
 =?utf-8?B?Z2JmcDgweHVrRE8xVWFhbUZZVU5XT0lDWDM2TVV2RW03US9qS0ZpNm0xbHVh?=
 =?utf-8?B?T3FUMCtFbE9QM1Z4cHV4MFFsOHh1a2tKSE81VXBiZllhaUpBZUtrR2ZJcDVS?=
 =?utf-8?B?OE1Hd1FvVW5hVSs1dHRpV1p2US9RTElCL05jMmt2WHFhTzBldzFDY2V5Ri9K?=
 =?utf-8?B?M2V1U3VSa1lqaSs0bjl1b1FCTDRXQ3IvaE5od3pkVXUzMUJwK2dpN09vOW5t?=
 =?utf-8?Q?wXqw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e63ada86-03d7-4638-dabb-08dd9291792b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 02:46:05.7250
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SbAMszDFO/9WyV6deTVOhpAMnQXE7bwoPZ/srDMb8pn8ptrVDUsbTC1UlsKOV0lQgmjJyDGwyyZ5nfoNoCzhWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6667

W1B1YmxpY10NCg0KSGkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTWF5IDEyLCAy
MDI1IDExOjQzIFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+
IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRA
dmF0ZXMudGVjaD47DQo+IE9yemVsLCBNaWNoYWwgPE1pY2hhbC5PcnplbEBhbWQuY29tPjsgSnVs
aWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFJvZ2VyIFBhdQ0KPiBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY0IDAyLzE1XSB4ZW4vY3B1ZnJlcTogZXh0cmFjdCBfUFNEIGluZm8gZnJvbSAic3RydWN0
DQo+IHhlbl9wcm9jZXNzb3JfcGVyZm9ybWFuY2UiDQo+DQo+IE9uIDA2LjA1LjIwMjUgMDc6NTYs
IFBlbm55LCBaaGVuZyB3cm90ZToNCj4gPiBbUHVibGljXQ0KPiA+DQo+ID4gSGksDQo+ID4NCj4g
Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBTZW50OiBNb25kYXksIEFwcmlsIDI4LCAyMDI1IDExOjMy
IFBNDQo+ID4+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+ID4+IENj
OiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4gPj4gPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBBbnRob255IFBFUkFSRA0KPiA+PiA8YW50aG9ueS5w
ZXJhcmRAdmF0ZXMudGVjaD47IE9yemVsLCBNaWNoYWwgPE1pY2hhbC5PcnplbEBhbWQuY29tPjsN
Cj4gPj4gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kNCj4g
Pj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPjsNCj4gPj4geGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMDIvMTVdIHhlbi9jcHVmcmVxOiBleHRyYWN0IF9QU0Qg
aW5mbyBmcm9tDQo+ID4+ICJzdHJ1Y3QgeGVuX3Byb2Nlc3Nvcl9wZXJmb3JtYW5jZSINCj4gPj4N
Cj4gPj4gT24gMTQuMDQuMjAyNSAwOTo0MCwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+PiAtLS0g
YS94ZW4vaW5jbHVkZS9wdWJsaWMvcGxhdGZvcm0uaA0KPiA+Pj4gKysrIGIveGVuL2luY2x1ZGUv
cHVibGljL3BsYXRmb3JtLmgNCj4gPj4+IEBAIC00NDAsNiArNDQwLDExIEBAIHN0cnVjdCB4ZW5f
cHNkX3BhY2thZ2Ugew0KPiA+Pj4gICAgICB1aW50NjRfdCBudW1fcHJvY2Vzc29yczsNCj4gPj4+
ICB9Ow0KPiA+Pj4NCj4gPj4+ICsvKiBDb29yZGluYXRpb24gdHlwZSB2YWx1ZSAqLw0KPiA+Pj4g
KyNkZWZpbmUgWEVOX0NQVVBFUkZfU0hBUkVEX1RZUEVfSFcgICAxIC8qIEhXIGRvZXMgbmVlZGVk
DQo+ID4+IGNvb3JkaW5hdGlvbiAqLw0KPiA+Pj4gKyNkZWZpbmUgWEVOX0NQVVBFUkZfU0hBUkVE
X1RZUEVfQUxMICAyIC8qIEFsbCBkZXBlbmRlbnQgQ1BVcw0KPiA+PiBzaG91bGQNCj4gPj4+ICtz
ZXQgZnJlcSAqLyAjZGVmaW5lIFhFTl9DUFVQRVJGX1NIQVJFRF9UWVBFX0FOWSAgMyAvKiBGcmVx
IGNhbiBiZQ0KPiA+PiBzZXQNCj4gPj4+ICtmcm9tIGFueSBkZXBlbmRlbnQgQ1BVICovDQo+ID4+
PiArDQo+ID4+PiAgc3RydWN0IHhlbl9wcm9jZXNzb3JfcGVyZm9ybWFuY2Ugew0KPiA+Pj4gICAg
ICB1aW50MzJfdCBmbGFnczsgICAgIC8qIGZsYWcgZm9yIFB4IHN1YiBpbmZvIHR5cGUgKi8NCj4g
Pj4+ICAgICAgdWludDMyX3QgcGxhdGZvcm1fbGltaXQ7ICAvKiBQbGF0Zm9ybSBsaW1pdGF0aW9u
IG9uIGZyZXEgdXNhZ2UNCj4gPj4+ICovIEBAIC00NDksMTAgKzQ1NCw3IEBAIHN0cnVjdCB4ZW5f
cHJvY2Vzc29yX3BlcmZvcm1hbmNlIHsNCj4gPj4+ICAgICAgWEVOX0dVRVNUX0hBTkRMRSh4ZW5f
cHJvY2Vzc29yX3B4X3QpIHN0YXRlczsNCj4gPj4+ICAgICAgc3RydWN0IHhlbl9wc2RfcGFja2Fn
ZSBkb21haW5faW5mbzsNCj4gPj4+ICAgICAgLyogQ29vcmRpbmF0aW9uIHR5cGUgb2YgdGhpcyBw
cm9jZXNzb3IgKi8NCj4gPj4+IC0jZGVmaW5lIFhFTl9DUFVQRVJGX1NIQVJFRF9UWVBFX0hXICAg
MSAvKiBIVyBkb2VzIG5lZWRlZA0KPiA+PiBjb29yZGluYXRpb24gKi8NCj4gPj4+IC0jZGVmaW5l
IFhFTl9DUFVQRVJGX1NIQVJFRF9UWVBFX0FMTCAgMiAvKiBBbGwgZGVwZW5kZW50IENQVXMNCj4g
Pj4gc2hvdWxkDQo+ID4+PiBzZXQgZnJlcSAqLyAtI2RlZmluZSBYRU5fQ1BVUEVSRl9TSEFSRURf
VFlQRV9BTlkgIDMgLyogRnJlcSBjYW4gYmUNCj4gPj4+IHNldA0KPiA+PiBmcm9tIGFueSBkZXBl
bmRlbnQgQ1BVICovDQo+ID4+PiAtICAgIHVpbnQzMl90IHNoYXJlZF90eXBlOw0KPiA+Pj4gKyAg
ICB1aW50MzJfdCBzaGFyZWRfdHlwZTsgLyogWEVOX0NQVVBFUkZfU0hBUkVEX1RZUEVfeHh4ICov
DQo+ID4+PiAgfTsNCj4gPj4+ICB0eXBlZGVmIHN0cnVjdCB4ZW5fcHJvY2Vzc29yX3BlcmZvcm1h
bmNlDQo+ID4+PiB4ZW5fcHJvY2Vzc29yX3BlcmZvcm1hbmNlX3Q7DQo+ID4+PiBERUZJTkVfWEVO
X0dVRVNUX0hBTkRMRSh4ZW5fcHJvY2Vzc29yX3BlcmZvcm1hbmNlX3QpOw0KPiA+Pg0KPiA+PiBX
aGF0J3MgdGhpcyBtb3ZlbWVudCBhYm91dD8gSW4gdGhlIHB1YmxpYyBpbnRlcmZhY2Ugbm90aGlu
ZyBjaGFuZ2VzPw0KPiA+DQo+ID4gQXMgd2Ugd2lsbCBoYXZlIHNoYXJlZCB0eXBlIGluICJzdHJ1
Y3QgeGVuX3Byb2Nlc3Nvcl9jcHBjIiB0b28sIG1heWJlDQo+ID4gdGhlIGRlZmluaXRpb24gd291
bGQgbGlrZSB0byBsaXZlIGF0IG1vcmUgY29tbW9uIHBsYWNlLCB0aGVuIGl0IGNvdWxkIGJlIHNo
YXJlZD8NCj4gPiBMaXZpbmcgaW5zaWRlICJzdHJ1Y3QgeGVuX3Byb2Nlc3Nvcl9wZXJmb3JtYW5j
ZSIgbG9va3MgbGlrZSBpbnRlcm5hbCB2YWx1ZXMgZm9yDQo+IGludGVybmFsIGZpZWxkLg0KPiA+
IElmIGl0IGJyZWFrcyB0aGUgcHVibGljIGludGVyZmFjZSBzb21lIHdheSwgSSdsbCBjaGFuZ2Ug
aXQgYmFjayBhbmQNCj4gPiBkdXBsaWNhdGUgdGhlIGRlZmluaXRpb24gaW4gInN0cnVjdCB4ZW5f
cHJvY2Vzc29yX2NwcGMiIHRvbw0KPg0KPiBJIGRvbid0IHRoaW5rIGl0IHdvdWxkIGJyZWFrIGFu
eXRoaW5nLCBidXQgSSBhbHNvIGRvbid0IHNlZSBhbnkgbmVlZCBmb3IgdGhlDQo+IG1vdmVtZW50
LiBBbmQgZ2VuZXJhbGx5IHdlIHByZWZlciB0byBhdm9pZCB1bm5lY2Vzc2FyeSBjb2RlIGNodXJu
Lg0KDQpVbmRlcnN0b29kLCB0aGVuIEknbGwgZGVsZXRlIHRoaXMgY2hhbmdlLg0KDQo+DQo+IEph
bg0K

