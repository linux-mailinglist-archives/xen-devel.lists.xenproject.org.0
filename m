Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF84DC68116
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 08:51:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164484.1491438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLGUz-0001x5-2f; Tue, 18 Nov 2025 07:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164484.1491438; Tue, 18 Nov 2025 07:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLGUy-0001u3-VZ; Tue, 18 Nov 2025 07:51:36 +0000
Received: by outflank-mailman (input) for mailman id 1164484;
 Tue, 18 Nov 2025 07:51:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g+ix=52=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vLGUx-0001tv-GG
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 07:51:35 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6659edec-c453-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 08:51:33 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CYYPR12MB8731.namprd12.prod.outlook.com (2603:10b6:930:ba::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.22; Tue, 18 Nov 2025 07:51:29 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 07:51:29 +0000
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
X-Inumbo-ID: 6659edec-c453-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1EVEKcUozbuNwX/fTI0nbVCglspMvmLFSqBXpLWCkkpbAawS8SJ0JUu/65a7rk5SN7/ufYYWf87NgRJUtRF+v3iwBwmsxH9J8rI+bDh2+cwqCyjflMX6h1sUZ0TXVzngt5UwXcGt9hhw56JBSO4Qes1a05r1Z5lUTTt1mDz1rwTvqtJj2Da/1oKEvq7ZtmLRnRS/EWPzjSMr9xkQ66cje03N3TiyxRCGjRaXhBlYHB6M2wqR1+PhFxuLzM23LAKArBPADgxwe4QwiMtB5/mcqLGKMCEg60Kx7fse+m0ArqH/ObdQMEjQzeFF0CTeC0Ie5yIn17AmNQAJgdK+dkXLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gIfVMT/j4v9E9Wl1jt70VSMKSXd88iOtbCjO212w5g=;
 b=x6kqRuvQ4qIoKtVEdy3Gbwd/vA+1lexuy81qHBOc9J2uSEpmqzeVlybUUAn7BxwTWEZ8BLXh43nX9ICqTkfuBt59U+Ba7PUlD5eP5SQUQkpkCI/dKS7PL6N/WDecdt8Dt8rRrryOPCqCMcOGOHjPLdRF3L7R6uJX5CQF0Dop9VW83TSofiDO7BB4DRul27h6aEuxAWSDk5lyOKCDPskP+w4lip/oZnFP35GpWBDZrdAjPMJciOh/yRZeUozKQ+Ss3QGOHT4EySgo3aJfIy1SVvyfToTAlKGuKSDC6AodHJN04+omvVOm9+U64TNTsNgm36KYuMELPdShP6BUCxv+Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gIfVMT/j4v9E9Wl1jt70VSMKSXd88iOtbCjO212w5g=;
 b=LHPn37UsXKXYsTQAZUzeQKxaUwxFVeXaG3MbE9+MWitAosdHw1woft+dDKMe3NupjYTs2IEyJVa8QVYnZ3ABrffsVeow8H1xvKyHIEIeypdOc5FhLnXYi0h3R37ZUpxSsJ4PakE9bbcLvFBD/ySbMnArz4k+99bS3CQXW0fIRi0=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>, "Andryuk, Jason" <Jason.Andryuk@amd.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "oleksii.kurochko@gmail.com"
	<oleksii.kurochko@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, "Orzel, Michal"
	<Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 28/28] xen/domctl: wrap common/domctl.c with
 CONFIG_MGMT_HYPERCALLS
Thread-Topic: [PATCH v3 28/28] xen/domctl: wrap common/domctl.c with
 CONFIG_MGMT_HYPERCALLS
Thread-Index: AQHcPCqhC21cJdWa5E25eCgk7enLhrTazScAgB1wfK+AAAbwUA==
Date: Tue, 18 Nov 2025 07:51:29 +0000
Message-ID:
 <DM4PR12MB8451B211FB0F01DD1F744502E1D6A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-29-Penny.Zheng@amd.com>
 <c18cdb1c-f2b3-4eeb-b064-670c86e19e67@suse.com>
 <DM4PR12MB84511357C8F6FB1976244CA0E1D6A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <ea81a0f2-d3d9-41f4-ae88-1426123129a6@suse.com>
In-Reply-To: <ea81a0f2-d3d9-41f4-ae88-1426123129a6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: Jason.Andryuk@amd.com
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-11-18T07:51:21.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CYYPR12MB8731:EE_
x-ms-office365-filtering-correlation-id: aac8cb65-8763-48c4-cd95-08de267748ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?S1Vkd2pXUGhPT1R6RDFzTEM2RnRPdFZFQzd3eXhjclVIS0dxQTY5WVFqZ1Yz?=
 =?utf-8?B?L2Fxd29HeFFZQm5kQndjNlBseFV4OVNML2NablI0UVlpOVBwMWlBN0U3OGc4?=
 =?utf-8?B?WEZwa3J5cVlJdkZ3dDEwRmtVY05PL3AzcDdUeTk4L0diR3NMOEkxN1p2eTRR?=
 =?utf-8?B?QkUxK2VPbGVYZW55c2VXNzllbjA2MkNldnVDZ05VQmxxZmcvdjl2UkpnSG5U?=
 =?utf-8?B?aVRKWit4Z09HekI4dDBzbnNVS1ZQNlFaaFptZWkxeHR3ZDlWaWRpVVhGdXJ6?=
 =?utf-8?B?STl0WW0xM1JKeHFRc3g2eEpBaWFzWnFQclJmOWxIcGlOZDFDeFBFbXFtelJP?=
 =?utf-8?B?aW1QdzVNYy9xWXpQVi84QlEweG1kc3dPZndVdkY4eDB5eWVJNTBYSGNuSHVs?=
 =?utf-8?B?WmlXampLVUQ0YnJZZWc3RmNwWlgzWWpMbjJmL2d5Z3RYYktPNXJYaHk4ZTEz?=
 =?utf-8?B?ZVYrZ3dGdVZVMGM0bVhTS3RMUzMvc2V4Tk92SkpGZmJORlBybXdkb20wcTAz?=
 =?utf-8?B?Y2hTRWl0Y3laeUJTZ0NVdmFYQk45SnBmN2RFQ0R4WXZBRFV0VjN0T0F6ZGZX?=
 =?utf-8?B?a09FV0YvVDJRSUxhOTNYLzdxRmpma01RMTVtYm91YzlINnF0eTZGSWFGMCtm?=
 =?utf-8?B?bHIxYWpFckFNR1VlaUgvVXorMkExbkNjaUlSNHVCRmdIb0h5c0ltazFyQUl5?=
 =?utf-8?B?YllhMDNEZVhyWUN5VUNzbjZsMk54Y0FWQzZyVmdodmZoSGhXQUNoVVkvU3ox?=
 =?utf-8?B?ZkFBWEE1MUVSdzlLNXZzRTZiNlprMmxlYkVqa0NvMFJXZUVXYVR2VkEvR2hL?=
 =?utf-8?B?d3dOVCtVN0NucGRTckZTbUVsWHBxTThVMUdybUU4NkNjVkxIbllkU243aEhP?=
 =?utf-8?B?Nkd2dGE1Z0tsYlBBRnRJeWZxeXd4VW9EN3hodTlwMERoR2tvRGlFaENhMHli?=
 =?utf-8?B?Nzd3czdRYnh4TUs4Snk1bERFT0dhTjhWMFB2dVdSalk4TWFGWm5UWTlhQXFJ?=
 =?utf-8?B?ZmpwdlRjS3NIK3FFa3RYTUp1cmlWd1JhbEZtUGpybmR2TTFUSFBqVEtEaktU?=
 =?utf-8?B?VzVwUVF1emo3Wk9LcEJDckFhWC9jVzNiZ0NLVzdYV1VNZFZVbW1lcVAyOEd2?=
 =?utf-8?B?SlFXVmtSMnI4cmR6MkNyeUpwZ3Q3S2lSUm9FMHYvOUdLbmk0SWZmSGU1ZlVv?=
 =?utf-8?B?SFh6VHNaNTdRa0ZJTWtwTFVTL0p6bHBCbm0zaFlTOVMrNU5zL2dxN1kzUFlP?=
 =?utf-8?B?a202WnhTSDBzeG5mMTQyUDhhakdTMC9WT3pCaXhuQk41SUU3WFdpNE53bEI4?=
 =?utf-8?B?ZXhOTkRFblh1N09tOHNyTWFueWRacmljcUZWeWF4R1FINWs2S0RkQWxia1p3?=
 =?utf-8?B?S00vSThqY2lHYVJMTXVWQm5ES0lmcjNCVGZlYU1rUGhQN0pkK2FuSmFEMWNJ?=
 =?utf-8?B?alUvOEduNGsyWUtVdVd6M05kT1dvTkU2RWVLb25mWTc5MS9STWZobDNiYlZK?=
 =?utf-8?B?M0kxNmJRWVcyS3oxSFkxK3R5OU51b2NIZmpUNTJzVkpaOTY2SzNoUFBDVUx4?=
 =?utf-8?B?MzU3ZE00dVVKTERRWXJqbkFHUFBGbzZWTDc1c0Z4NUhTVzYvZmpjeUlYVUZ5?=
 =?utf-8?B?Z2t6VHZjckVGNWFTVVgxd3RmZ0hsYnE5L25pcTlVKzVtdmlkWWQ5ZmRLcTEv?=
 =?utf-8?B?RVBCL2F5bzhRSzhXeE1ycmc1bTFUTG9waUZiS3ZkVmxJVVpwUVNsUVordEJN?=
 =?utf-8?B?dUhRQm90bGRFMFI4VmtoWC9VdjM0dnQwQ3NYc0N6RVd4TDdNckNUSEZ0QklE?=
 =?utf-8?B?RDFidXBDelgrd08yQTJUS3JqUXpJYzBFU1pRZ3VvV3ZBZEZjMXhYQU4rT1F4?=
 =?utf-8?B?dEJzSVlqZGc4VS96S29IbzdnWXVVOEMxRCtJK2hHR3puRm4yTlplTzNuYmNR?=
 =?utf-8?B?THRwcy8xMlF5b3c3cHRsQkg2OS9xS1ZQRVhKMlFXcHNOMVEzUEtIc2hNMGZt?=
 =?utf-8?B?RVJ2SjY3NUNjY2VFRTlubExDb0xZZUxlc1FDUWszMDBlUWhPMFBPcVlwT1Jk?=
 =?utf-8?Q?YzJfgj?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cWRwVVArVGdYbUtjTk9zajVabExSTkp3NmF0WFFaRDdVWnIvbFpUTE1QU3la?=
 =?utf-8?B?aFhQazlVQklQeDB1akhwZ3ZUdTFxZFUrZnlmcnhiZGJVQjVXU2NYR2xLVnBi?=
 =?utf-8?B?RlUxQTBaZThHdi82SDhtQzlJMDBSVDN4M2RJSGxKY29JYkJHbGc3cU8zSEdB?=
 =?utf-8?B?TlVMWkZvZDU3NlVXU1o2Nloxd1ZyMEFYNUpJVjRzVXhYS2xCWm9zVUVWaWNC?=
 =?utf-8?B?VU4rYnFYckNWY3A1Z2E1RVE5MDFxTlRBUEpNR0Qyck1rSm9jNkdmN2hJWnZr?=
 =?utf-8?B?bkpGTjZaVXY3WHBJTFYrMjMzWThzaWlOVGtpZDh3VzVTMWsweHBCMHphN2pN?=
 =?utf-8?B?T0crclZJa1ErdG1GeG9wOGVrUmhKbmgrcXdMUXU4RmRHRElzcU1wZ0NnWHFV?=
 =?utf-8?B?Q2Fram5xNkRuWkR2cUtUbVZmMlRENURvb3pKTS94Q1lKTGR6UkhTOTVrd0VC?=
 =?utf-8?B?NnpJdUl6VW9WWkg3WDd6SDJEZ3ZQdlZWSkxEQlNYNnZHb21GNllERGU5NlB6?=
 =?utf-8?B?cVluK3l2ckxGWitCTGU2RU56YTJWclVNbExqWms4bnQvVnBnQmdPUU9TSVYr?=
 =?utf-8?B?NFM5S3M4RWI1bCtPeC9hR2JmdTl3MW0yZk8ycmY3TnZRMlVQNmpNZ2JrejZG?=
 =?utf-8?B?Uy9SclNyLzFZd2NIQzJQakN4dGp3OGVrdXNOVHJWZ0tna3VsejZNY1VKQklM?=
 =?utf-8?B?ZGxzM2Q2ZmlvcWxIY1JvU3ltMkw5cmpOS1QwNUVGc09pYmxIUkMzbmJEeDB2?=
 =?utf-8?B?cnpPczdoVCttckdCeHFLT2oxbDEyL0hrZ3VHVEo0ZHo2b08rMUdvanVvTktV?=
 =?utf-8?B?S2lTZTVLeTRXZjRWb0FCdlBPc1lSR29idGZZMUZQVjZvRjF3Wklka1dYQkU1?=
 =?utf-8?B?L3JybVZucXdkVWVNdnM2eWM5Q0R2WlE1WGszRkg0dHIvVHJFQUMrd2pSOGZr?=
 =?utf-8?B?OVh5V011dEhTWFkyN1poUGJRbVFXbnNqdHhwc1dKUytCcDVqazl3RjAxeVB5?=
 =?utf-8?B?R21FSUlLWUVBdHQ2QlZkaXJnMWZranByNmJWMGdVdnhnY0VTaDVaZ1Jxd3h4?=
 =?utf-8?B?WGttV3BVemk3UmRMSVAzL0RiREhwUWI0dzdBUUpCaU5qaDhMS1J2eHpIaXRV?=
 =?utf-8?B?VnM3dDd1SThNcXo5bml1Vmh4Nm9qcUd6NU85a291bGY5NTVtVVpwdkVVVHVx?=
 =?utf-8?B?eGhSb0JVVkZYRURnTFBkUFluY2ppbTMvOXpNSnlhZ1Jkc3JQYnpMUS9oRTVj?=
 =?utf-8?B?Qk4wUTNBR1JDMGZFY1d5LzRKamNDWDllQVdMN0lYRlBrTHFyd3FaQXNTRS9Z?=
 =?utf-8?B?RWtsN21YcjMxVWpsL2VQQk5VVkdqSGJVTXgwNHdOdXdaWkQ0WC93QVBWYnJt?=
 =?utf-8?B?bmc2WTE3cXh3Wjl6Wnl3UnNoQUhaSitoNmdUTThmME5majljd3d1TUVBSk82?=
 =?utf-8?B?dXFta2VnbmxEYlJyVzBwZU1QZHo4UDU4RTdsbFlxTzZza2haWHlMV2FzZjFp?=
 =?utf-8?B?ZmgxcHU5UjNROFpjVVdwV3NQWHpSRVJadEQ1cDhxSkhPVzdyQTJQbERQOU1l?=
 =?utf-8?B?OC9lcjFxREdWcG9wTkFXNHgvNVJWaURPMGNQbldrL2w1QTUrMjBUVG43VHVL?=
 =?utf-8?B?TDJjb1U5SVgxZE9kWFVmOW9mWnJGeThldmVQNkFmNnZiNkhyc0c2Vy9JQzhU?=
 =?utf-8?B?bEJ0bXNsRWZRREVsUDV0Nk9Za0xiWGlMZ09xZytPL2tDTzVmWG9raXkrRE44?=
 =?utf-8?B?eTNvaGluREU2SEZzVWxtTUlObGVJTnhpd1VJYkNnbkRsUVhoZUZGUnJkR3Rw?=
 =?utf-8?B?dklydm1PemF2cjJhV0JKR3dwdTVicEo3cUYvTTFrS1MzS1IzOVk0ZFJWT1RU?=
 =?utf-8?B?WlZ3bUtPcHFnTUdFaklSWG1Nc2hmd0VCZk5KNVNFVWRzVC8xSmZUQkhsSVFy?=
 =?utf-8?B?ZFJjOGRzQ3krODdEd0NQOUxaZmpxbU00QURQd1NvTHZoRktEZDlBY2p5alRT?=
 =?utf-8?B?VnVpWW9FVGhQNWlXVzd6K1dyVjZsalplaHRpQXFUTm9PQ1RrSUUxYXZmUVVh?=
 =?utf-8?B?MXQrUnZZdHVLcjc2bktJWXNNN1Uyb1F3Yzk1L1kyN1B4YjZlY0VaaGdiOGFX?=
 =?utf-8?Q?zMR8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aac8cb65-8763-48c4-cd95-08de267748ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 07:51:29.4952
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iuD7qWq31F70vcdnpeZFK7hRCk0ahKbgsZ+KOFNlmNfLLXPho3UQUCutrYV6Ar+tcRnobXbkZwK5bdYbVfP9aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8731

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDE4LCAy
MDI1IDM6MTQgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4g
Q2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgb2xla3NpaS5rdXJvY2hrb0BnbWFp
bC5jb207IEFuZHJldw0KPiBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBBbnRo
b255IFBFUkFSRA0KPiA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IE9yemVsLCBNaWNoYWwg
PE1pY2hhbC5PcnplbEBhbWQuY29tPjsgSnVsaWVuDQo+IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgU3RlZmFubw0KPiBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMjgvMjhdIHhlbi9kb21jdGw6IHdyYXAg
Y29tbW9uL2RvbWN0bC5jIHdpdGgNCj4gQ09ORklHX01HTVRfSFlQRVJDQUxMUw0KPg0KPiBPbiAx
OC4xMS4yMDI1IDA3OjQzLCBQZW5ueSwgWmhlbmcgd3JvdGU6DQo+ID4gW1B1YmxpY10NCj4gPg0K
PiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDMwLCAyMDI1
IDk6NDAgUE0NCj4gPj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4g
Pj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgb2xla3NpaS5rdXJvY2hrb0Bn
bWFpbC5jb207DQo+ID4+IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
OyBBbnRob255IFBFUkFSRA0KPiA+PiA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IE9yemVs
LCBNaWNoYWwgPE1pY2hhbC5PcnplbEBhbWQuY29tPjsNCj4gPj4gSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kNCj4gPj4gPHJvZ2VyLnBhdUBjaXRyaXguY29t
PjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsNCj4gPj4geGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMg
MjgvMjhdIHhlbi9kb21jdGw6IHdyYXAgY29tbW9uL2RvbWN0bC5jIHdpdGgNCj4gPj4gQ09ORklH
X01HTVRfSFlQRVJDQUxMUw0KPiA+Pg0KPiA+PiBPbiAxMy4xMC4yMDI1IDEyOjE1LCBQZW5ueSBa
aGVuZyB3cm90ZToNCj4gPj4+IC0tLSBhL3hlbi9jb21tb24vS2NvbmZpZw0KPiA+Pj4gKysrIGIv
eGVuL2NvbW1vbi9LY29uZmlnDQo+ID4+PiBAQCAtNjQ2LDExICs2NDYsMTMgQEAgY29uZmlnIFNZ
U1RFTV9TVVNQRU5EDQo+ID4+PiAgICAgICBJZiB1bnN1cmUsIHNheSBOLg0KPiA+Pj4NCj4gPj4+
ICBjb25maWcgTUdNVF9IWVBFUkNBTExTDQo+ID4+PiAtICAgZGVmX2Jvb2wgeQ0KPiA+Pj4gKyAg
IGJvb2wgIkVuYWJsZSBwcml2aWxlZ2VkIGh5cGVyY2FsbHMgZm9yIHN5c3RlbSBtYW5hZ2VtZW50
Ig0KPiA+Pj4gICAgIGhlbHANCj4gPj4+ICAgICAgIFRoaXMgb3B0aW9uIHNoYWxsIG9ubHkgYmUg
ZGlzYWJsZWQgb24gc29tZSBkb20wbGVzcyBzeXN0ZW1zLCBvcg0KPiA+Pj4gICAgICAgUFYgc2hp
bSBvbiB4ODYsIHRvIHJlZHVjZSBYZW4gZm9vdHByaW50IHZpYSBtYW5hZ2luZyB1bm5lc3NhcnkN
Cj4gPj4+IC0gICAgIGh5cGVyY2FsbHMsIGxpa2Ugc3lzY3RsLCBldGMuDQo+ID4+PiArICAgICBo
eXBlcmNhbGxzLCBsaWtlIHN5c2N0bCwgZG9tY3RsLCBldGMuDQo+ID4+PiArICAgICBCZSBjYXV0
aW91cyB0byBkaXNhYmxlIGl0LCBhcyB1c2VycyB3aWxsIGZhY2UgbWlzc2luZyBhIGZldyBiYXNp
Yw0KPiA+Pj4gKyAgICAgaHlwZXJjYWxscyBsaWtlIGxpc3Rkb21haW5zLCBnZXRkb21haW5pbmZv
LCBldGMuDQo+ID4+DQo+ID4+IFRoaXMgaXMgc3RpbGwgdG9vIGxpdHRsZSwgaW1vLiBGb3Igb25l
IEknbSBub3Qgc3VyZSAidXNlcnMiIGlzIHF1aXRlDQo+ID4+IHRoZSByaWdodCB0ZXJtLiBJJ2Qg
c2F5IGl0J3MgbW9yZSAiYWRtaW5zIi4gQW5kIHRoZW4sIGFzIG1lbnRpb25lZCwNCj4gPj4gdGhl
cmUgYXJlIGEgZmV3IGRvbWN0bC1zIHdoaWNoIGFyZSB1c2FibGUgYnkgRE1zLiBBaXVpIGRldmlj
ZQ0KPiA+PiBwYXNzLXRocm91Z2ggbWF5IGFsc28gYmUgaW1wYWN0ZWQsIHdoaWNoIGltbyB3aWxs
IHdhbnQgbWVudGlvbmluZw0KPiA+PiBoZXJlIGFzIHdlbGwuIE9yIGVsc2UsIGlmIHRoZXJlIGlz
IGFuIGltcGxpY2F0aW9uIHRoYXQgRE1zIGFyZW4ndCB0byBiZSB1c2VkIHdoZW4NCj4gTUdNVF9I
WVBFUkNBTExTPW4sIHRoYXQgaXMgd2hhdCB3b3VsZCB3YW50IGNhbGxpbmcgb3V0Lg0KPiA+DQo+
ID4gSG93IGFib3V0DQo+ID4gIg0KPiA+ICAgICAgICAgQmUgY2F1dGlvdXMgdG8gZGlzYWJsZSBp
dCwgYXMgYWRtaW5zIHdpbGwgZmFjZSBtaXNzaW5nIGEgZmV3IGJhc2ljDQo+ID4gICAgICAgICBo
eXBlcmNhbGxzIGxpa2UgbGlzdGRvbWFpbnMsIGdldGRvbWFpbmluZm8sIGV0YywgaGVuY2UgbGVh
ZGluZyB0bw0KPiA+ICAgICAgICAgaGF2ZSBhbiBpbXBhY3Qgb24geGwtZGV2aWNlLXBhc3N0aHJv
dWdoIGFuZCByZXN0cmljdGVkIERNLg0KPiA+ICINCj4NCj4gTXVjaCBiZXR0ZXIuIEhvd2V2ZXIs
IHdoeSAieGwtIiBhbmQgd2h5ICJyZXN0cmljdGVkIj8gTmVpdGhlciBhc3BlY3QgbWF0dGVycyBo
ZXJlLA0KPiB1bmxlc3MgSSBvdmVybG9vayBzb21ldGhpbmcuDQo+DQoNCkxhdGVyLCBpbiBoeXBl
cmxhdW5jaCBzY2VuYXJpbywgZGV2aWNlIHBhc3N0aHJvdWdoIGlzIHN0aWxsIG5lZWRlZCwgYnV0
IGl0J3Mgbm90IGN1cnJlbnQgZGV2aWNlIHBhc3N0aHJvdWdoIG1vZGUsIHdoaWNoIGRlcGVuZHMg
b24geGwtdG9vbC1zdGFjayB0byBkZS1hc3NpZ24gaXQgZnJvbSBoYXJkd2FyZSBkb21haW4gYW5k
IHJlLWFzc2lnbiBpdCB0byBndWVzdC4gSXQgd2lsbCBiZSBsaW1pdGVkIGluIGJvb3QtdXAgc3Rh
Z2UsIGFuZCBjb25maWd1cmVkIHZpYSBkZXZpY2UgdHJlZSBvbmx5LiBGV0lVLCB3ZSBtYXkgcmV1
c2UgVlBDSSBmcmFtZXdvcmssIGJ1dCBjb21tYW5kcyBsaWtlICJ4bCBhc3NpZ24vZGVhc3NpZ24g
eHh4IiB3aWxsIG5vdCBiZSBuZWVkZWQgYW55bW9yZS4gUExaIGNvcnJlY3QgbWUgaWYgdW5kZXJz
dGFuZCB3cm9uZ2x5LCBAQW5kcnl1aywgSmFzb24NCg0KQW5kIERNLCBsaWtlIFFFTVUsIGlzIHN0
aWxsIGFwcGxpY2FibGUsIGJ1dCBvbmx5IHN1cHBvcnRzIGEgbmV3IG1hY2hpbmUgdHlwZSwgInB2
aCIuDQoNCklmIGl0IGlzIHRvbyBtdWNoIGRldGFpbHMgYW5kIG9ubHkgYnJpbmdzIGNvbmZ1c2lv
biwgSSdsbCBkZWxldGUgYW5kIHJlZmluZSBpdCB0byAiIGhhdmUgYW4gaW1wYWN0IG9uIGRldmlj
ZS1wYXNzdGhyb3VnaCBhbmQgRE0gIg0KDQo+ID4gQW5vdGhlciBxdWVzdGlvbiBvbiBQVl9TSElN
X0VYQ0xVU0lWRToNCj4gPiBBZnRlciBTdGVmYW5vJ3MgIiA2YzgwZjBkZDFiYiAgeGVuOiBmaXgg
cmFuZGNvbmZpZyBidWlsZCBwcm9ibGVtcyBhZnRlciBpbnRyb2R1Y2luZw0KPiBTWVNDVEwgIiBy
ZXZlcnNpb24gcGF0Y2gsIGFuZCB0byBhdm9pZCBpbmN1cnJpbmcgcmFuZGNvbmZpZyBmYWlsdXJl
cyB0aWxsIHRoZSBsYXN0LA0KPiBtYXliZSBJIHNoYWxsIGNvbWJpbmUgYWxsIFBWX1NISU1fRVhD
TFVTSVZFLXJlbGF0ZWQgY2hhbmdlcyBpbnRvIGEgbmV3DQo+IGNvbW1pdCBhbmQgcHV0IGl0IGlu
IHRoZSBsYXN0LCBhZnRlciBtYWtpbmcgTUdNVF9IWVBFUkNBTExTIG9wdGlvbmFsIGFnYWluPw0K
Pg0KPiBXaGF0ZXZlciB3b3JrcyBiZXN0Lg0KPg0KPiBKYW4NCg==

