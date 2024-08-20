Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 195F1957D39
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 08:01:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780026.1189617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgHut-0005fF-ML; Tue, 20 Aug 2024 06:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780026.1189617; Tue, 20 Aug 2024 06:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgHut-0005cu-Ik; Tue, 20 Aug 2024 06:00:27 +0000
Received: by outflank-mailman (input) for mailman id 780026;
 Tue, 20 Aug 2024 06:00:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6ZGS=PT=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sgHur-0005co-P7
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 06:00:25 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2416::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b9ed180-5eb9-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 08:00:22 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA1PR12MB6702.namprd12.prod.outlook.com (2603:10b6:806:252::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 06:00:16 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 06:00:16 +0000
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
X-Inumbo-ID: 7b9ed180-5eb9-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nde32pXeyt7NMt5NIcY2z7hMWPMQWUuZyjxXdk2hBa+OtgldcSitgpwo09Oew3GXm/CzF2jP7LHwFLPHHO0RsOywCZ3TAoY2GB+llm3YT4qg/uMOVa2uU8BbcFcfwWrB7CJSlG8AeMnR9CwOueQAfBjb96JkTX5u41RkyqBQvE96huSUNXpFkxBhv2WQD6HRxVuFkpD9/gRJm9yUd99VAB/PzQeP/NrXPHDiqL76wVkDsxz6ouO2fLg/yEmuy3SNvY317+CoR78MiCWp9QjQUjbwj9uQp1wu6D4LcZ1xpZitO173hXiSvzhw3dFVnH2uF0tm0k2NFBaT9lywLv/fsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ioA6zHhTtvVwAMTBf37mPbsNZ106a3WkxE4VYIDNErE=;
 b=xk2/DpJ4hspWFESWdK7VOuhA1LF9GsQtBQhI9GCxyAfI/yf4hAwMjtQ8CgA0KAT94Cfu+DVGQYumyRHumWhqjExPgwvWiTOUdEouuTXCLmiRJYSPB6o+Rou5Sp91X1WvpnzYiKoF8+Y+6dIxHKkI9mSuhBv1JgAyZdJFcnjgpPmJW6nKrAh0k4VKAanBK5TDooIfetxtULLN6tO0wXGX1a0ZZru3uu+38V4/QHj63XwX9qG3Y7abeXjjghbxtsRbJnzBoqoLpx4wpoBroJARdTyROt/XP3w9e/bYkPDNLU2GstdLktYVXPcK6u1OZYQUsLnno07A6OS34coDSXJjUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioA6zHhTtvVwAMTBf37mPbsNZ106a3WkxE4VYIDNErE=;
 b=l6stKcuc6mkbCoHCvcsBezc3X4lr3tTOZfwPLC5qMMJfi6C9mqqx5qzAJhrgrmMi/vRDStBlHMGc4EUMZWgPlDEhd3YCsXvG8BV56mASyRSE06FkBNpW8tx0hVg5ICJipdckQ5JGzwJNRo+mDt0bD4FK23vI66lXyvTWTWCj+j8=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <gwd@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v13 1/6] xen/pci: Add hypercall to support reset of
 pcidev
Thread-Topic: [XEN PATCH v13 1/6] xen/pci: Add hypercall to support reset of
 pcidev
Thread-Index: AQHa78yrMx2rme7kLk2Lfq5OhJcOzrIuThwAgAGubYA=
Date: Tue, 20 Aug 2024 06:00:16 +0000
Message-ID:
 <BL1PR12MB58498DC98719ED77DA950478E78D2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240816110820.75672-1-Jiqian.Chen@amd.com>
 <20240816110820.75672-2-Jiqian.Chen@amd.com>
 <50717151-3098-491f-9dfb-71ebaff4b684@suse.com>
In-Reply-To: <50717151-3098-491f-9dfb-71ebaff4b684@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7875.019)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA1PR12MB6702:EE_
x-ms-office365-filtering-correlation-id: ccb8baeb-09d9-498e-0079-08dcc0dd5d51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ckdIZXJEZXVrNmVyZmEyc2hqTU9JdDhsM1QwKzdDa3BWRjR1QTFDY09LbUdh?=
 =?utf-8?B?aC9paVkrNFRIRFdCTDhFbVAxV29veElXdjZXeENQU3VxNGNFZG1jVjMrSFNW?=
 =?utf-8?B?MVk2OGxVdXQxdTVsc2x2Q1NaOW9WeTh6OWZ3MFY1NVpUY2RhaGlIZUZmcUFt?=
 =?utf-8?B?QXplMGd0T3AwOTk4OVlidVRDbFF0SUZvQzMyR3Y0QjgrdDhxNDJ4VzZWSG5X?=
 =?utf-8?B?NE5hWHpuWnlNZkZnbVZVY2xFVmltdEpyNGxaZ3VwKzA4dk52NkgvdUhSQlBY?=
 =?utf-8?B?THJsYzVKdmJZTFhwS2hzUm1VWVVUSmtsV3dNbkl5bU9RbWtkYXphcTlEOXRK?=
 =?utf-8?B?MFZLV0V6c0Y3ampHa2hNeHFwUHFmak9ha3NjaTh4blJENFdRb0FiSTl2czVN?=
 =?utf-8?B?R3paWEN2emV1ZnVjalJjdU8rT0Z0ZlBRSUd4MlhnRVludjdXUU41MjZBeUIx?=
 =?utf-8?B?WjdUM2xsdWhNRmxzc3VuVXJOWXdkemtzNUlPKzFPU1BFZHpuYVdBTVRWMFVE?=
 =?utf-8?B?UlJNSEhoN2ZDSkVEN3VvYjl5MFdxOERtaWFPYmVEcEZkMzdEME1vQ0dNOC9D?=
 =?utf-8?B?cUlEbExjQW9DUndyNjlLTFZHUitZTEJQVzIvUTdxNmQxcHlLY0FrME5tRnFW?=
 =?utf-8?B?TjZiYnpJVXRtZDVxSHFSNDUyb3V2YzcxT0YzKzh5YmdQRTJkYTBRNjY4ZnJo?=
 =?utf-8?B?Z3luc3Z0V3hhVmxZNm5LNFFEaDAzYlVvSjl1RzZUVUFVMER1Q2pJZUVlZk1y?=
 =?utf-8?B?RDlsRmNwS01iLzY2Y2RIUDZtaFlTS1RFeWFTRW14eEdWRlRieW9yZkVsRExF?=
 =?utf-8?B?RktpMlpYdGMzVGdQSVhsVkFLbjBVdmxsV3lXeHdXYm5YNEZqa0VxaE5jRVVS?=
 =?utf-8?B?SXVobkpUMUhmTk9XbzlLNWhyK1Z2U0prUmo4UWNzRUpQVWtNSXdCOWs3Rkxv?=
 =?utf-8?B?cXJXcmdDamVhM2lyKzAra2ZSeFJZbGhNdHgwT3BiQlQzZTVnL0s3TFFkOXMz?=
 =?utf-8?B?YVFNbWFtWGx3a1NDNm9kMGpVc1B4cTRCQ1RmVXc1d1NWSFRNSVBoWDJRbTJC?=
 =?utf-8?B?R2l5VkN3WE9NWDVnMFJ3Ny84Yy9wcDlCWHRVQlFlNjV4RzVBdDZqR09kdncz?=
 =?utf-8?B?Skw4MzNhL3h0QUNveU9sM3Q2MFRCZTI4clJWWnVZY1JYWW5WVlVNMm9ZQUJh?=
 =?utf-8?B?UENKMGpwbDlBbGdUaGRnNk9HU0VKNHNrUHVKTWxsSU5KY0ZOdlZhaUt3N0hG?=
 =?utf-8?B?ellxVlh5OU5ydkVnbmJVWURSV2Q5bVVoYzVqdkpOSlhQUUZGRTlkSmdtSzlK?=
 =?utf-8?B?eUp6Sm1WUy9OeDFBamVwYWlVSnl2QjlUZHRhUDc4enVVL1lJOUJvQzB4YWFw?=
 =?utf-8?B?a3g0VTl3RVNUQnNobUVQaXNaanljcGNaUkx3SkxTdnl0TVlTaSt6NUxodmEx?=
 =?utf-8?B?YU9VcUpmT0o1czgxY3pCV0g3NzEyME5jeW04TWZVRzdPM0VTMVJsTitnNEhZ?=
 =?utf-8?B?Y3NETkErMmRtSXhjdDNrd0pBMTFDclY2dSs4RFNWRUYySXRoMkxUd2VoRVhQ?=
 =?utf-8?B?VHMzaUw5S3QzYmxtQ01jK0FiSmhzWVN0ZVYrT0hKdVVSWnl5Rk1wY0Z6M2Va?=
 =?utf-8?B?WnNmM0MyL0xXZEZpSDdhMU4zaXAxYm5nTjl4L3B6L253R3loTm5QZWkybjZm?=
 =?utf-8?B?OStZWG0wTk5sY2sydHlLeFU0WlhnNHhqeEtzS3BwNXFXMEZVVkw4TWkzNm5P?=
 =?utf-8?B?LzFZa2ZPNlhFMDM0SVp5aUJEeTN3dTJ0MjdCR0E0U1N5QVJGbHdHTklZV3ZG?=
 =?utf-8?B?V2xOak1teXkrZUNWWm5Rdit4SVhaQWlsdWJSdjdFdERGU3VPdkcrVmdKdkFG?=
 =?utf-8?B?ZUdtQVE1c29XNlpKbG1kVXIyZlNRUkx6bnF2Q0YxejVVbXc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QWxxTWFlWStLcHB4a3p6dDhzejdWeEdCYmNXYmptNEY4amFkNXBsbEhMb05W?=
 =?utf-8?B?NlNnOEpwQ0Uwek5jaTVXcEJxOGZkbDE1dnVxTzVweGdEZzN5U2p5OU1leW9v?=
 =?utf-8?B?VGxTTWNWTHdFaUUvd2hCQkllREF0a3hibHRueUhaU0ZjNXpaY205bHN5N0JJ?=
 =?utf-8?B?QUxXWVdwMlYyZUNtemU5LzF0UXF2K255OERUTk5TcldnSjJ0azB0QWozNFha?=
 =?utf-8?B?MTVqWjU0RGtmb0plcUVQa1hWYk1CTVFNbmlmQXRwakljTkl1Ujh3VklLOXFK?=
 =?utf-8?B?NXBObkJvWjBMaUVwcm5QYmxxZVc5UnlSRlUwVjRnNkhvN1ltTnRJNU9lZXI3?=
 =?utf-8?B?aXZwbE02NFR1cUN3RUhKR2JzbFRPWS9PcHRRbWVTLy9JS3lMd3ZsTXZKUGFi?=
 =?utf-8?B?ZWpzWHpmd2Z1WG1CcmdlWVk3YzZMK0RKV1Z1QlRMYi9tNjFyV2xPa0I0NkVT?=
 =?utf-8?B?V2dKb28yU2xGT0xQbCtCMG15UmJIb0hiN0Y3UmM2TmhXSmFuWUZYRW5oaXBx?=
 =?utf-8?B?SSs5Wmh2b1pJRnFUM0s0Z1BRV3R1Y09PUXRka3VDU0J4cGoyNEFqdlE4cGRh?=
 =?utf-8?B?YVgzV3FlMHJEM2hheTkyYWcrMUdlYVFFekdMbW4veHpWYkZBY3UxUWZYekpH?=
 =?utf-8?B?UFNoelhlYm9JL1VDSmtWWlpiVTlJeUhGNVRjc0tWT0wxZGgvUVdPNklPbzRt?=
 =?utf-8?B?N3lyNzFRSGVVNlRPY2UyVXVVV2QwK0pmUDdmU0c2ckZDY21kNUxUcVQzbUQ4?=
 =?utf-8?B?aTIzbWhqSWVudWl4WGRnL0xYdDdWSEpBSkkwODZWbU1kSUhNRDgyMlVvaFhW?=
 =?utf-8?B?RHlqdTVuMm1qTFliS290bCtJRWNNRTdFenVQeHNEaEVaT1ViMlZOZ3gyTkQw?=
 =?utf-8?B?djhiVzE3cm1IRHMrb1dkQmRBMnAxVDZxNTdad3p5M0lac3BlakltS3JNMENj?=
 =?utf-8?B?c20ydzZGRGhUZDRyem9XRDV4UFRtazV6WExMUHUvUnBIa3J6Nkx6VTNXRmQx?=
 =?utf-8?B?ZzNZaVJrVENNdXBVTXlRSlJ4K1ZCY1c2UllmRlFqTysxYURJU0EraFFkSkNn?=
 =?utf-8?B?UHFOMFJSdVN2ajZWNWtoU1FseEtOWHh2VGNndG94Z3k0MCtqSmRTOFpqYWt4?=
 =?utf-8?B?TDlERG5hV29XR0FGcmlHRXYvM2hwUS95RDFDTElqZjNacm1sN2YzcHg1dGR3?=
 =?utf-8?B?T1ArQ2VhS2FrOG1FQVNQcFNmME1rNlAvSVQrbnlRUjduSDJHaG9JYUl5R1U4?=
 =?utf-8?B?NnY2Tis3RDN4VTczUVQvaUg0VHE1WjlZajhURUd4Q2t3c1ZuZUtaL3ptSWYv?=
 =?utf-8?B?ck0zanlVaW4reE9iaGVzanR6NmhYUk9pL0R2UjdDa3NpWnZMYTh2WkdlZUdB?=
 =?utf-8?B?R1FybjM4QUNLUjdjY3o3YUFFaEZQN29KK3drelBrY00wYVlyY1FrZkYrZVRj?=
 =?utf-8?B?TmxhQVpqU3F0cGxXc2lLZm1pS05OaGZHUzN6d3RyY0c2ZXBDR3gyVjhXbVZE?=
 =?utf-8?B?K2E2UjJtZlN0b1BWMFJ4MkxGaEcyeW5WMjYya2w3eVRyWUhBeDdYYVBQblNj?=
 =?utf-8?B?Z0FYekFwZFJqQm41SXZoQXp3TzNlQ2Q0WjVZQzZDVXI1a3NXOStkS0hmemNN?=
 =?utf-8?B?MldvaGxLWmV5M1NDSjZTSVV4WGx4WjhLRkt2M2QvYXI2SjcwZkpEcDlvQTlz?=
 =?utf-8?B?djVkMkkxQ25aNU1kTkNxcmIza0MyVlM0ZisvbG5DZlZtM3dVRzhCM0x2b2NV?=
 =?utf-8?B?S1dpeTZ2ZERWbXExTlJ5ODRtWmNjQ3VjbzFtcjlMZUhwZG4remJyR29MYXlW?=
 =?utf-8?B?QnE0UklsRkc5N1N5dSsyM0ZXV3NWSDYwUytNdFhUZktBV2VDZ1ZSNFFaeVVk?=
 =?utf-8?B?QkRWcURZMldoZHhrMDVlTk0rNGFtcitKOHVaRzlmay8yeHYybjdOaGVFZGNU?=
 =?utf-8?B?YnIvR2ZubU9vQWpFd3hDZmJQZUR2cFdxaGF4S0VUeHk0ZmZ5aDFmTDVSSGZH?=
 =?utf-8?B?ME9HdmJGQWxkRUhXNHVublBBa053eUtiOUphM0JBdnJyMmRobFYwVmE0dDM3?=
 =?utf-8?B?OCtlV21GMy9DYUdBcGovU3dRdHI1aDZYUThPODhGZXB4NnlwSEE5Y0VhbllL?=
 =?utf-8?Q?2FME=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <024BC83DD41BB149A0398C169895AF2B@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccb8baeb-09d9-498e-0079-08dcc0dd5d51
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2024 06:00:16.5175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KqQE1m89R4BtFSMwxz9+ZqIdDrpmjerYE+s6tVZMtr/HQcOMv/GMownGXuOprCD/ArfqblZ2Bn5wlHQhqn/66A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6702

T24gMjAyNC84LzE5IDE3OjA0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTYuMDguMjAyNCAx
MzowOCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBAQCAtNjcsNiArNjgsNTcgQEAgcmV0X3QgcGNp
X3BoeXNkZXZfb3AoaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+
PiAgICAgICAgICBicmVhazsNCj4+ICAgICAgfQ0KPj4gIA0KPj4gKyAgICBjYXNlIFBIWVNERVZP
UF9wY2lfZGV2aWNlX3Jlc2V0Og0KPj4gKyAgICB7DQo+PiArICAgICAgICBzdHJ1Y3QgcGNpX2Rl
dmljZV9yZXNldCBkZXZfcmVzZXQ7DQo+PiArICAgICAgICBzdHJ1Y3QgcGNpX2RldiAqcGRldjsN
Cj4+ICsgICAgICAgIHBjaV9zYmRmX3Qgc2JkZjsNCj4+ICsNCj4+ICsgICAgICAgIHJldCA9IC1F
T1BOT1RTVVBQOw0KPj4gKyAgICAgICAgaWYgKCAhaXNfcGNpX3Bhc3N0aHJvdWdoX2VuYWJsZWQo
KSApDQo+PiArICAgICAgICAgICAgYnJlYWs7DQo+IA0KPiBJdCBvY2N1cnMgdG8gbWUgKG9ubHkg
bm93LCBzb3JyeSk6IERvZXMgdGhpcyBjYXNlIHJlYWxseSBuZWVkIHRvIGJlIGFuDQo+IGVycm9y
PyBJLmUuIGRvIHdlIHJlYWxseSBuZWVkIHRvIGJvdGhlciBjYWxsZXJzIGJ5IGhhdmluZyB0aGVt
IGZpbmQgb3V0DQo+IHdoZXRoZXIgcGFzcy10aHJvdWdoIGlzIHN1cHBvcnRlZCBpbiB0aGUgdW5k
ZXJseWluZyBYZW4/DQpJIGFtIG5vdCBzdXJlLCBidXQgZm9yIHg4NiwgcGFzc3Rocm91Z2ggaXMg
YWx3YXlzIHRydWUsIGl0IGRvZXNuJ3QgbWF0dGVyLg0KRm9yIGFybSwgdGhpcyBoeXBlcmNhbGwg
aXMgYWxzbyB1c2VkIGZvciBwYXNzdGhyb3VnaCBkZXZpY2VzIGZvciBub3csIHNvIGl0IGlzIGJl
dHRlciB0byBrZWVwIHRoZSBzYW1lIGJlaGF2aW9yIGFzIG90aGVyIFBIWVNERVZPUF9wY2lfZGV2
aWNlXyogb3BlcmF0aW9uPw0KDQo+IA0KPj4gKyAgICAgICAgcmV0ID0gLUVGQVVMVDsNCj4+ICsg
ICAgICAgIGlmICggY29weV9mcm9tX2d1ZXN0KCZkZXZfcmVzZXQsIGFyZywgMSkgIT0gMCApDQo+
PiArICAgICAgICAgICAgYnJlYWs7DQo+PiArDQo+PiArICAgICAgICBzYmRmID0gUENJX1NCREYo
ZGV2X3Jlc2V0LmRldi5zZWcsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgZGV2X3Jlc2V0
LmRldi5idXMsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgZGV2X3Jlc2V0LmRldi5kZXZm
bik7DQo+PiArDQo+PiArICAgICAgICByZXQgPSB4c21fcmVzb3VyY2Vfc2V0dXBfcGNpKFhTTV9Q
UklWLCBzYmRmLnNiZGYpOw0KPj4gKyAgICAgICAgaWYgKCByZXQgKQ0KPj4gKyAgICAgICAgICAg
IGJyZWFrOw0KPj4gKw0KPj4gKyAgICAgICAgcGNpZGV2c19sb2NrKCk7DQo+PiArICAgICAgICBw
ZGV2ID0gcGNpX2dldF9wZGV2KE5VTEwsIHNiZGYpOw0KPj4gKyAgICAgICAgaWYgKCAhcGRldiAp
DQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgcGNpZGV2c191bmxvY2soKTsNCj4+ICsg
ICAgICAgICAgICByZXQgPSAtRU5PREVWOw0KPj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4gKyAg
ICAgICAgfQ0KPj4gKw0KPj4gKyAgICAgICAgd3JpdGVfbG9jaygmcGRldi0+ZG9tYWluLT5wY2lf
bG9jayk7DQo+PiArICAgICAgICBwY2lkZXZzX3VubG9jaygpOw0KPj4gKyAgICAgICAgc3dpdGNo
ICggZGV2X3Jlc2V0LmZsYWdzICYgUENJX0RFVklDRV9SRVNFVF9NQVNLICkNCj4+ICsgICAgICAg
IHsNCj4+ICsgICAgICAgIGNhc2UgUENJX0RFVklDRV9SRVNFVF9DT0xEOg0KPj4gKyAgICAgICAg
Y2FzZSBQQ0lfREVWSUNFX1JFU0VUX1dBUk06DQo+PiArICAgICAgICBjYXNlIFBDSV9ERVZJQ0Vf
UkVTRVRfSE9UOg0KPj4gKyAgICAgICAgY2FzZSBQQ0lfREVWSUNFX1JFU0VUX0ZMUjoNCj4+ICsg
ICAgICAgICAgICByZXQgPSB2cGNpX3Jlc2V0X2RldmljZShwZGV2KTsNCj4+ICsgICAgICAgICAg
ICBicmVhazsNCj4+ICsNCj4+ICsgICAgICAgIGRlZmF1bHQ6DQo+PiArICAgICAgICAgICAgcmV0
ID0gLUVPUE5PVFNVUFA7DQo+IA0KPiBFSU5WQUwNCj4gDQo+IEJ1dDogV2hhdCBhYm91dCB0aGUg
b3RoZXIgZmxhZyBiaXRzPyBZb3UgZG9uJ3QgY2hlY2sgdGhlbSAoYW55bW9yZTsgSQ0KPiB0aG91
Z2h0IHRoZXJlIHdhcyBhIGNoZWNrIHRoZXJlIGJlZm9yZSkuDQpCZWZvcmUgdGhpcyB2ZXJzaW9u
LCBoZXJlIHVzZWQgdmFsdWUobGlrZSBlbnVtKSwgc28gbm8gY2hlY2sgZm9yIG90aGVyIGJpdHMo
c2hvdWxkIGJlIHplcm8pLg0KSSB3aWxsIGFkZCBpbiBuZXh0IHZlcnNpb24uDQo+IA0KPj4gLS0t
IGEveGVuL2luY2x1ZGUvcHVibGljL3BoeXNkZXYuaA0KPj4gKysrIGIveGVuL2luY2x1ZGUvcHVi
bGljL3BoeXNkZXYuaA0KPj4gQEAgLTI5Niw2ICsyOTYsMTMgQEAgREVGSU5FX1hFTl9HVUVTVF9I
QU5ETEUocGh5c2Rldl9wY2lfZGV2aWNlX2FkZF90KTsNCj4+ICAgKi8NCj4+ICAjZGVmaW5lIFBI
WVNERVZPUF9wcmVwYXJlX21zaXggICAgICAgICAgMzANCj4+ICAjZGVmaW5lIFBIWVNERVZPUF9y
ZWxlYXNlX21zaXggICAgICAgICAgMzENCj4+ICsvKg0KPj4gKyAqIE5vdGlmeSB0aGUgaHlwZXJ2
aXNvciB0aGF0IGEgUENJIGRldmljZSBoYXMgYmVlbiByZXNldCwgc28gdGhhdCBhbnkNCj4+ICsg
KiBpbnRlcm5hbGx5IGNhY2hlZCBzdGF0ZSBpcyByZWdlbmVyYXRlZC4gIFNob3VsZCBiZSBjYWxs
ZWQgYWZ0ZXIgYW55DQo+PiArICogZGV2aWNlIHJlc2V0IHBlcmZvcm1lZCBieSB0aGUgaGFyZHdh
cmUgZG9tYWluLg0KPj4gKyAqLw0KPj4gKyNkZWZpbmUgUEhZU0RFVk9QX3BjaV9kZXZpY2VfcmVz
ZXQgMzINCj4gDQo+IE5pdDogUGxlYXNlIHBhZCB0aGUgMzIgdG8gYWxpZ24gd2l0aCB0aGUgMzAg
YW5kIDMxIGluIGNvbnRleHQuDQpXaWxsIGNoYW5nZSBpbiBuZXh0IHZlcnNpb24uDQo+IA0KPiBK
YW4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

