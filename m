Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C73ABB543AF
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 09:19:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121491.1465746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwy3D-0004oh-Vb; Fri, 12 Sep 2025 07:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121491.1465746; Fri, 12 Sep 2025 07:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwy3D-0004nC-So; Fri, 12 Sep 2025 07:18:31 +0000
Received: by outflank-mailman (input) for mailman id 1121491;
 Fri, 12 Sep 2025 07:18:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DZes=3X=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwy3C-0004n6-Lu
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 07:18:30 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20620.outbound.protection.outlook.com
 [2a01:111:f403:240a::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9b1cdbf-8fa8-11f0-9d13-b5c5bf9af7f9;
 Fri, 12 Sep 2025 09:18:22 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 MN0PR12MB6174.namprd12.prod.outlook.com (2603:10b6:208:3c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 07:18:17 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 07:18:17 +0000
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
X-Inumbo-ID: a9b1cdbf-8fa8-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1QmiaRORkcYXR0QrXxZWjJrspdYdxLSk2+lZuHOfOaQ8MgO8VCNsy+kk+KW7Ja2RqG5sSxtsXmm/MvB0i4+JzrTBrqy0Loclf/v9eeBh6WHfBs0hKPikjUsSBbKZDHLDgTLuss7IFqH+fm19YKKze+SKb/U0oG6/hL6hQALbD0pabCtjvF86iRMWvt+LDNgKToj6H45IeqmYJNTYe4NgExQNuaeQSE1Mw+yeWH5SKDa4HSfrNFE+LRjV3jjja26JXxzD2C+N+O8KHBxlHBN2n/akWcNzUSe8srLdFVS9MyBM21R3q0BN5WV6SZ/YpEzQs4uXfmBPgcMCVzl5tfqXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=va/hHtoVUddBHPPJfrZeDTTi86YAml7MWdPG+2P6Py4=;
 b=AvKbKKoG53vD33Fb1OT/iX2zLcqS7TEPbPY6Nkfggi4bKKKB/DDGXspfrHAXvn0uvqUmZXhwNAVREz9vbWGfYvKr7bAXXNJw40MfNODJL4iq+Sxgux3fFFyhKx962l3uMpp8DN/R/s6bIUl7eaHMWJQQmm/wVVZiQYRdfvqbVNK55gb6Fa8Xe0o3z3XBVDLwvQlZ3+jhE3GLahmdS+eNdlJYZWEZNa0VkZBjgtD1oahuCUWowzCnwGYROARj30F+zgwMj/58LFH5UVHYu+g7g8gHCtlOhrHs40XbQ9P5sZO0IS2DvSoQkmLnXg+p34xug8qKiIloqPBzjQIuncD0zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=va/hHtoVUddBHPPJfrZeDTTi86YAml7MWdPG+2P6Py4=;
 b=5FGZtnWRDzDe0/K7NMNJZBjG/zkebTySFaQ7cQ1ovGgUxLLAETAIZdxmap7EOHmISDmDLxmDzOidPzQmnsIYmLEtajRPbDfWzBUQ1jv71kLzxkYfC/RzyxOauL//fn3extHW6VyfrVh1tiioY/KmPmQFFLUj6UZafJqJGAa78vs=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, "Orzel, Michal" <Michal.Orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Christopher
 Clark <christopher.w.clark@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 08/26] xen/domctl: wrap domain_soft_reset() with
 CONFIG_MGMT_HYPERCALLS
Thread-Topic: [PATCH v2 08/26] xen/domctl: wrap domain_soft_reset() with
 CONFIG_MGMT_HYPERCALLS
Thread-Index: AQHcIiYHZJOGLvR3zUGWUPGFPkbfXLSMhqOAgAKeg+A=
Date: Fri, 12 Sep 2025 07:18:17 +0000
Message-ID:
 <DM4PR12MB8451D1EBF99396A526F05FB6E108A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-9-Penny.Zheng@amd.com>
 <4be69331-8002-47a3-a2e1-e34b12a5c5bb@suse.com>
In-Reply-To: <4be69331-8002-47a3-a2e1-e34b12a5c5bb@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-12T07:18:10.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|MN0PR12MB6174:EE_
x-ms-office365-filtering-correlation-id: 36e0a22f-f153-4916-d8a2-08ddf1cc8bcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ODVmVW9EZGttWW9aR3AwaGNGYkZFTXZRblU3QVFBMk1yZnhNd0duNUZBTlV1?=
 =?utf-8?B?U1dQK2ZlSXlYM1Z6QnIxRzFCY0o0UUl4VUQ2aGVHalZqYllQdmNYNnk2RS9K?=
 =?utf-8?B?WTJ5MEZyY0VHaHVvVGRJaWJxUlczQWlVdk5zdEMrL2VVRlQ2YTVBTlZIaVRs?=
 =?utf-8?B?bk15QVYyWWxuc0NSNFVRQlBzeGxtYks2OGVHNi9rMm93ZGhOWEVXT21VNlFP?=
 =?utf-8?B?VVZvOUkyMDNDUVNkS24rY1oyVWF2dUVxN2JBczM1Yk1VV3RleUtJMVAwSGtK?=
 =?utf-8?B?VTlBWDFzUTZtMmd5K3hiMW1NWW4vZTk1TWdaUUhROWpma3I2L3duYmlvSUVT?=
 =?utf-8?B?cjk0eGwxSEQzbENXNXRCSGUzcTIrUEJkd0ExTHZTNVJtZi9jS3FVbXRVd2lS?=
 =?utf-8?B?KytHNXo1T1d6R0dHWkF5a1BEZFE4MEFMWm9yQkwrNlJ6b1UxamVwbXBMZWpF?=
 =?utf-8?B?aVdvU1NJV09Sb1k5a2Y1M0hZN3J3cmYzeFZHTUtOMXhhUEkvenViK2gvVVlt?=
 =?utf-8?B?RlB5YXFBK2VmekczTGlMaFZSNVV5c0ZScE1URGN4eXRQMDhsdVcyeDZkT3dv?=
 =?utf-8?B?clVVWUpZelI5WHlFdFJlNFpDcEp5TFdaNEs5UnNSSzRFY3RRYi9CL1QzRkc5?=
 =?utf-8?B?NnJhaWZNMEFrNllCZkZvamtFeUxmRmFBNlg0ODNSU3drZ1FtMG9rVGpNdmhr?=
 =?utf-8?B?TUJjbzJwZmlRMlYyVGRhZWVVa0lNcTZzWGU5WTRncEsxWUd1bTZTU0RzUmo2?=
 =?utf-8?B?emZPQ1ZVRzlIU014YktRbXhBL3d1bmFscUVXL2JnREVjNlkwWkhFY2pIVTBr?=
 =?utf-8?B?N01pZVkxRHBxNjRRby9ObjdaQldIbFpnVjB4K3MvSVlGditUaXZuQzhSZ21N?=
 =?utf-8?B?SmJuOENHWUdJZHNCL3FITTg5bFlmUHcrbkV1dTdPYUUvNzczOEZJTUQ5QXov?=
 =?utf-8?B?ZitrWlZuWS9mVm5ZUUtyR3haRHBPWFhLNWhlWk5LRExzTXFMWjAwZXJ0N1lv?=
 =?utf-8?B?NzVjc05KOXhmOEpMOUd6TXZLYlNNMnRrYWVpVEMzcE9nQTNHcnp1cDRaam92?=
 =?utf-8?B?dC9mT3hoSTJZTm5PNHVyMEpqSmp5Mlk1YnJpSjlLcUtMQVg5d2hSbzRGc3Ew?=
 =?utf-8?B?b0Zld2ZibSszamQrclNFZGUyNys5VTdtVEhLM095aWNUczVPQU1adXdlY29J?=
 =?utf-8?B?UGUvSG03ZUw3cHUrakRHMWFpVjdObTZRT3ZJNFVBTXRrWjZUWUk4V3ZWWXJO?=
 =?utf-8?B?anhGZmN5aTZuV0tZT1oyK0FmejJVOGwxU0Q4RTlsTFZ1MTRHY1BKdnMyekd5?=
 =?utf-8?B?cGQ2K1dka3lwNGpuaW1OWE55U0RMTEhMcVpDc01LL2cvU2JXWTVnWkZWc1RZ?=
 =?utf-8?B?VExZTW9UbFZTRDFvZ2ZrbGcycEhjVTZPdkZ2elgvcVE1YzZaYjV1T0lBdWFJ?=
 =?utf-8?B?MVhzVnY5d1pSbVZ2V2hLK1hoSFR6Yll6S1VJcmVpK1BFOUkyYU5NSHpldUxO?=
 =?utf-8?B?cEsvL2lNL3RIVnlRUWVaejlBWVBoWjE4UWlUdzJtM213MEJnVXoyN0lEMmpl?=
 =?utf-8?B?ampDdXo0WHdTdXc0RUVCRVZNSU1jR1N5TkpZZzV1QmZmRzBkRWlSaUMyR25T?=
 =?utf-8?B?bE9ZY1I2K3E3UThKMnZWMGVPUGJrc1kwbFJyc3J1TUZOZWRQdTFaSG1WNkJS?=
 =?utf-8?B?VzBBUDRWSEt2NUs2K3AxQkVFMWJzMkpBTlFQZzdveHRDTURrR0FJRFJJcXIx?=
 =?utf-8?B?QWNSaytKVlh0RU5ZZkdvT2dlMFB4ckRyM2Jnbm9MTzR0a0VYQjB5Q1pWNWFt?=
 =?utf-8?B?YjVVajZGVitZREgwMzBWa2o3VkRXRHYzU3V0TEFBSkRiWkxTRzd0MEczd2NP?=
 =?utf-8?B?MXlWMlVsMlM5OHNiUFprOE5lQ0xrcUFjZ0FVYU1Wd1J4TUtSeTk1OVRhMEp0?=
 =?utf-8?Q?jXgBDLnVP2Q=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UDBEN0gvTDNHMzQwT3d6RDNvR0lTZWJ1VnhKaXFsY045aWU3ajh1eFJHNHds?=
 =?utf-8?B?RHI0QXg4K3JvaEh0ZjBOYXdaR3dWbkVWZVRjMjlGTXlEN0lhdUlPYTNFZWlO?=
 =?utf-8?B?M0R4U2hxcStBSHJpS1dCaXY0UGVXL3U5b09EY2VlTmpXbHl3QytQSTFmRXFT?=
 =?utf-8?B?UXJXU0w3U3lUQVdHeVM2OWhGVWNjMEpWaGdITGVEaU9DYnRjbkh6UFdYSytI?=
 =?utf-8?B?bk5pcTM5VnVZSDJBYlFUMWp2TjE0K082TjFTR1orR2wwZERYeG9ybE14LzJa?=
 =?utf-8?B?anVxYkNhQkdianZqVVd3anNncW5XdHNJTW91dVlDUnBEdnEvZWVmSjNIaDcv?=
 =?utf-8?B?L2ozeGM3dlFoOHFLaVpBWDJSTDAzb1NQbjYxbFkxNjRkM2x4bjZwM3pCZ3gx?=
 =?utf-8?B?cEpwMHdLQXE5Y0dZYXBvbUpESHVKZGhwWUlHTmFOS0tVYzN0VXNUWmJRWkRx?=
 =?utf-8?B?QWdrd2o3bmlMZFdaVEtXSXlLNGR2UXFhVTE4WGo5ekh4SlREaXhBL2M3UUZx?=
 =?utf-8?B?S294dk54V0tsemxMdUNMTVIzNXQ2OXhncjNOeE1kZmQ4ZFIxN3dTQm5XcW01?=
 =?utf-8?B?TjlYd242ckREYTB1V1MxYU4yRDE1WjN4djR0L3VCemhYY2p6WXlMR2lHMHNu?=
 =?utf-8?B?b2NWYzd2R3BGRmFwZTZRZVBOMndqeFpzNW5ISHNCNEFGcFdpTkRpN0ZWc0R3?=
 =?utf-8?B?ZngxUE1RZS9yQUl4QUFLQVA2VDBvejF3STNFcWtiQzgzL2pzUEdyTFloQWVv?=
 =?utf-8?B?dkdFYmk1aTN2USt1SWdUS3huNkE0NzczNXZDTFFKbGppd09rbjBFQVdLVmor?=
 =?utf-8?B?akI1MzdyVGw2dkxxZndaK0Q0dkdZQjUxYkFiYlk0TzRNT2tPLzduNmhTNzk2?=
 =?utf-8?B?R0dHZ2phMGVyTCt1MXU2Z2NMUjlhS3JzSWRlcnAzUGlvNnVXWExOYnJXbkI1?=
 =?utf-8?B?alEyaG5oQ3FvdVRWeVFCUFpMSVo4VU4wcDBiVFlYZDR3K1htWHhBNGFSMG1t?=
 =?utf-8?B?Y3JBTWF2WGRGSFNFZjltL0U5OVZsS0dpekNDMVQ5TmVMRXhuK2pscWhqVytL?=
 =?utf-8?B?ZHJYZHF3SGh0OVlzMTgrQjl2SFNJT1ZBTmNldFdRTyttN3dBTDcwOUZvWkFr?=
 =?utf-8?B?c2lpSFRpOHdrckpoMGJDbHN3WE5FNEdiejV4OEYxa2djN1VaQk1HeURMUlJC?=
 =?utf-8?B?a0Fzc283SFpUcDM0VU1najNvbnFUbG5ncEVZOGtLcXV5QVJEOS9WUDB5N05S?=
 =?utf-8?B?cHpLRWJ5OUJ4dEg3QUZZS2lwS0dSVVNyeFVEOUtXMDRudFY3MmowWm85eEIx?=
 =?utf-8?B?YmUvWVM0eUVMYklhZGdQZmt6Y2FIazE4WW9nQ3ZWMEk3eWRiRy9HQmFNcWEw?=
 =?utf-8?B?OHM1YVgvbSszY3ZIM3E0OHRYVCtaSERYRzdKdXhhanNKcEc5Uk9KTjFUUFpF?=
 =?utf-8?B?Ym8yWkxHK1B3MXI3L0ZLWXVOZWpjbThWYmpEMmZTZkE5SzNEWHJFMktlUE81?=
 =?utf-8?B?K2Vsamp4aDdpSUNEcmY3aUJpL2JwQ2xIazZXSmtuUzZYeEw3TCs3TVZDT25w?=
 =?utf-8?B?TUd3WTduRERnYXRTNDZPMmMwYU5XU3gxL1N0VjZXWHVnb1FrNkNmV2tlQVJH?=
 =?utf-8?B?TlRiUThrNDhtNmttQUZqa0VwOHowaUcxajZabUtXMHVUVTBRSjlDOWdXVnhN?=
 =?utf-8?B?MW51SU51bEYzUWU2VXk1QTFZTnE4TXJ2OHlscEwxS242Uk01c3Nxak5nNmZy?=
 =?utf-8?B?S3NDdjlYOTFyQU50enhJMmlsS3NHajRSVlNJRkVIT2lQaHlLZEw1WHVHTkln?=
 =?utf-8?B?dS9YMWVDZWM3eUdUMVVYbWFzYS9MZGFwMUJvSGVUZWFMbyt4QVluQkZ2VElM?=
 =?utf-8?B?dVNZaHVCcWsvMXd1aUlNVWhwbkpMb2U4OXVkZWViZFBFWmV6R2poSmlMMlFS?=
 =?utf-8?B?YlYrZnZ6bG5UMlZYODR0Y2oxT3h5ZUZ0U1RSN3V5UWxTUi90ZUlLMzRjNkM3?=
 =?utf-8?B?aCtydEVvaTNydVRSWEF3R3h5bU83K09uZUtyc09hcWJ4TGRBelJLcXZHUGM5?=
 =?utf-8?B?TFZzcGpDTE9Xd1J2YWwyRXBKOTVpby9WSzkrblVGQmdUcitidmJrWnBXSklz?=
 =?utf-8?Q?llMI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e0a22f-f153-4916-d8a2-08ddf1cc8bcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2025 07:18:17.7485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +IGKMd98T1xJkcoonrGWXxm1KLQCDPOXUjFHa3hQZ5IQFGDk8KqMFefqWZU7l0QnkueGYlECQvCHtmncfITgBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6174

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDEw
LCAyMDI1IDExOjE0IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+
DQo+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGlu
aQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+OyBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+OyBPcnpl
bCwgTWljaGFsIDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47DQo+IFZvbG9keW15ciBCYWJjaHVrIDxW
b2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+OyBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVj
aD47DQo+IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgQ2hyaXN0b3Bo
ZXIgQ2xhcmsNCj4gPGNocmlzdG9waGVyLncuY2xhcmtAZ21haWwuY29tPjsgRGFuaWVsIFAuIFNt
aXRoDQo+IDxkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tPjsgeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMDgvMjZdIHhlbi9kb21jdGw6
IHdyYXAgZG9tYWluX3NvZnRfcmVzZXQoKSB3aXRoDQo+IENPTkZJR19NR01UX0hZUEVSQ0FMTFMN
Cj4NCj4gT24gMTAuMDkuMjAyNSAwOTozOCwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gRnVuY3Rp
b24gZG9tYWluX3NvZnRfcmVzZXQoKSBpcyByZXNwb25zaWJsZSBmb3IgZG9tYWluIHNvZnQgcmVz
ZXQNCj4gPiBkb21jdGwtb3AsIGFuZCBzaGFsbCBiZSB3cmFwcGVkIHdpdGggQ09ORklHX01HTVRf
SFlQRVJDQUxMUyBUcmFja2luZw0KPiA+IGl0cyBjYWxsaW5nIGNoYWluLCBhbmQgdGhlIGZvbGxv
d2luZyBmdW5jdGlvbnMgc2hhbGwgYWxzbyBiZSB3cmFwcGVkDQo+ID4gd2l0aCBDT05GSUdfTUdN
VF9IWVBFUkNBTExTOg0KPiA+IC0gZ3JhbnRfdGFibGVfd2Fybl9hY3RpdmVfZ3JhbnRzKCkNCj4g
PiAtIGFyZ29fc29mdF9yZXNldCgpDQo+ID4gLSBhcmNoX2RvbWFpbl9zb2Z0X3Jlc2V0KCkNCj4g
PiBXcmFwIFhFTl9ET01DVExfc29mdF9yZXNldC1jYXNlIHRyYW5zaWVudGx5IHdpdGgNCj4gPiBD
T05GSUdfTUdNVF9IWVBFUkNBTExTLCBhbmQgaXQgd2lsbCBiZSByZW1vdmVkIHdoZW4gaW50cm9k
dWNpbmcNCj4gPiBDT05GSUdfTUdNVF9IWVBFUkNBTExTIG9uIHRoZSBjb21tb24vZG9tY3RsLmMg
aW4gdGhlIGxhc3QuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBaaGVuZyA8UGVubnku
WmhlbmdAYW1kLmNvbT4NCj4gPiAtLS0NCj4gPiB2MSAtPiB2MjoNCj4gPiAtIHJlbW92ZSB1bm5l
c3Nhcnkgd3JhcHBpbmcgaW4gc3R1Yi5jDQo+ID4gLSBhZGFwdCB0byBjaGFuZ2VzIG9mICJ1bmlm
eSBET01DVEwgdG8gTUdNVF9IWVBFUkNBTExTIg0KPiA+IC0gd3JhcCBYRU5fRE9NQ1RMX3NvZnRf
cmVzZXQtY2FzZSB0cmFuc2llbnRseQ0KPiA+IC0tLQ0KPiA+ICB4ZW4vYXJjaC9hcm0vZG9tYWlu
LmMgICAgfCAyICsrDQo+ID4gIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICB8IDIgKysNCj4NCj4g
V2hhdCBhYm91dCBQUEMgYW5kIFJJU0MtVj8gVGhleSBoYXZlIHRoZSBmdW5jdGlvbiBpbiBzdHVi
cy5jLCBidXQgbm90IGFkZGluZyB0aGUNCj4gI2lmZGVmIHRoZXJlIGluY3JlYXNlcyB0aGUgY2hh
bmNlIHRoYXQgd2hlbiB0aGUgc3R1YnMgYXJlIHJlcGxhY2VkIGJ5IHJlYWwNCj4gZnVuY3Rpb25z
LCB0aGUgaW50ZW5kZWQgI2lmZGVmIG1pZ2h0IHRoZW4gYmUgZm9yZ290dGVuIHRvIGFkZC4NCj4N
Cg0KQXMgd2UgYXJlIGFkZHJlc3NpbmcgY29uY2VybnMgb24gdGhlIHYxIGFib3V0IGVkaXRpbmcg
c3R1YnMuYyBmaWxlcyBbMV0sIEkgcmVtb3ZlZCB0aGVtIGFsbCBpbiB0aGlzIHBhdGNoIHNlcmll
LiBJZiB0aGV5IGFyZSBjb25zaWRlcmVkIG5lY2Vzc2FyeSBub3csIEknbGwgYWRkIHRoZW0gYmFj
ayBpbiBuZXh0IHZlcnNpb24NClsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hp
dmVzL2h0bWwveGVuLWRldmVsLzIwMjUtMDgvbXNnMDAxMzUuaHRtbA0KDQo+IEphbg0K

