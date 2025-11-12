Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9788C513CB
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 09:59:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159600.1487914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ6gc-0005EL-LB; Wed, 12 Nov 2025 08:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159600.1487914; Wed, 12 Nov 2025 08:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ6gc-0005Bz-IW; Wed, 12 Nov 2025 08:58:42 +0000
Received: by outflank-mailman (input) for mailman id 1159600;
 Wed, 12 Nov 2025 08:58:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skpP=5U=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vJ6gb-0005Bt-F2
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 08:58:41 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4700c4b-bfa5-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 09:58:34 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH3PR12MB9099.namprd12.prod.outlook.com (2603:10b6:610:1a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 08:58:30 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%3]) with mapi id 15.20.9298.015; Wed, 12 Nov 2025
 08:58:29 +0000
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
X-Inumbo-ID: c4700c4b-bfa5-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3KwcBbeXcXlkHAHdF2vIWpmR1EFjKVqPmj13sv9rwUKCD2S2HmLAdkSMWwzzho84ZsUGWDTaJMy236Fpby55YLcTgDu7e204Hdq/42GAhzApoNxqUAjs2/vFT32HPZK67ZYW0lTyURXsav1KXn4VMN2vmI/5ZHHdDUKtno5IjmiiYtIEAP4n8ign7zsyIWGOMEXo+jAE/CnKimlK4jKgxIbkN31QMmd+C7nciHyr9z0SnVsBFEKCEjFm6t69OGFBwM+B2Z8LZBgVNe1OMr8Sc5+qoc2YmV9loUApx+LRp1AuvtB0aWVex055+SwwphLSYFKUGLsGMTgziD4e+/J6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TM8/v1CzzK3nXKTbFWzQamZBiKvsRN+R/eiFMR1Z91Q=;
 b=uifBiWN8169Cz71O4HM7TlmSr9ITSzaTgt+XkwLI7qZ1z8KQd/zCHdF4zHI/19nkoLkS05UoR9VDy1yl8FS0p095hr8VGhY7+AhkKzs/padC7ly2eKTHgfWnfqpBe2OsfxSS05ayn71NJg2ZwLWp2C2lFsdwiEPnJiISqAsrF8PHudvwZzyv4RksovGxfATCO3gR4AY9766FZHqHboAmuhp8RRW/haPtDsaBhMpGEOLdOxjtTFexWHe5YxFJzWCkYjXoXZsPz1znnuag91cOo525rv02SikLjitD+rJibLkm/QMJq/PvlxBvcXsz00QOkJdD8UGgrXHD2sRWQF9rdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TM8/v1CzzK3nXKTbFWzQamZBiKvsRN+R/eiFMR1Z91Q=;
 b=qyw9XaIjiCKTvqPQWUweebKywe1xEF2aaTxsilQ/Zk79FW7hsx38hYgXxMj/79LdRpBU7nnKf0O39hpNTwGRC9U6p2k3W2wpNKZ6dJT7h8EFc2l51uiDTTdDyxOhBgB0KObj4g80JWQouMwmybwD0V/dtqjib2S83OJzCV1OtbM=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "oleksii.kurochko@gmail.com"
	<oleksii.kurochko@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Tamas K Lengyel <tamas@tklengyel.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 15/28] xen/domctl: wrap domain_kill() with
 CONFIG_MGMT_HYPERCALLS
Thread-Topic: [PATCH v3 15/28] xen/domctl: wrap domain_kill() with
 CONFIG_MGMT_HYPERCALLS
Thread-Index: AQHcPCqOfEVt2Jk05kOchIzPOp9r0LTavU6AgBQtWvA=
Date: Wed, 12 Nov 2025 08:58:29 +0000
Message-ID:
 <DM4PR12MB845189415FBE1E8C250C81D2E1CCA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-16-Penny.Zheng@amd.com>
 <8c74774a-458b-4918-8d65-fcb3eacfe98b@suse.com>
In-Reply-To: <8c74774a-458b-4918-8d65-fcb3eacfe98b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-11-12T08:58:18.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH3PR12MB9099:EE_
x-ms-office365-filtering-correlation-id: 7d5ff605-7564-4bca-1b62-08de21c9a67f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZlpyYXhVS081R2FGN2NlbjFKbTlScjJTWDYvUnl5VWlmSUJaNXRBdEdDbTlC?=
 =?utf-8?B?TXNnRkI0UGJPU3dQK2g0YTZXUWgwRXNDUU13T1o3bWpoR0d4aGRjN3pLL3lt?=
 =?utf-8?B?aXZISStqampHRFE4WTJDVDJkbXVldkpnYTduTFB4T2R5Q0hSdWZLQjNLbUZo?=
 =?utf-8?B?cjRpOXRVWU1CS3N5SForSnR3VzBQKzNWdkFyOThKVHAvSk5mTzdLQjZnU0VZ?=
 =?utf-8?B?UHNSTmhHWGVkWW1WaFFxUmNYTXVIdHVmMzJCa3hxN3Uvd3gvWWVsR3QxQ1Ew?=
 =?utf-8?B?YTZsUHB1SSs5REtvRFZkeGp3RDVYeTNlRWtCRXh4Y2RnL201NGFIL2Q3TXdz?=
 =?utf-8?B?dVE0TFlka0txWGNJb00vMXVOT1VPUDZ2RXJOb3hhM0pIYlh3L1N2OHYwTVFs?=
 =?utf-8?B?WTVzaGdsaUZseEU0NjdlNkw4bWovRkhGQXpuSGEvNGJLa1hyYmhmdWlPNWR4?=
 =?utf-8?B?SGFvMjRPNzFpeXFkSktNOFp6aFZFdjF4elRxUVhIS0F4YUluQTNXUDhDYkRq?=
 =?utf-8?B?VXpjRGpINmh2clBteERIK0tUYi9CKy81b2N3VVhEM3dSRWVJR3RrYkxpdURO?=
 =?utf-8?B?TXJad0VzbDR1bFc4a2tJb3RRbHF2MjdncEhsajJyY3U3NStaTHlORVpqWlVT?=
 =?utf-8?B?eUJEWXFibGVXOFU4emNtRkdnaU1CWTFJZDNaY00walVyWGJuV2w5aExaNWNC?=
 =?utf-8?B?akpYN0llenFvOGY3MitNNVphZUt3VStjZ0ZhM0xNTFNHSUN4K2JKaEhJRk9O?=
 =?utf-8?B?bjJ1ZGNGZzI4ZTE2MFc0L2RQQk9xeU92OW0zazNYSHA2VXR3d2MwODFmcjlr?=
 =?utf-8?B?MkY1a3VWQ2hHSlFzOUtUamlCRXF0N1hqK3hJS1lBVk1qZ0grdnNiWFc3aVhm?=
 =?utf-8?B?MUgvVDlaTUVFVnlvb3RwUGZKT0J5VEpUSWZkNGVXb25vZXc4L0IvbThDeWNS?=
 =?utf-8?B?SjZaVDVCNFNCRmxKMGwvN0ppVHBnVzM5ZFN5WDAwQlNaWHJaUGJ2UGVFOWlS?=
 =?utf-8?B?VllzdmlscHRHVGUrUE5QRmZoa0o5VWRRQ1FOSGZaV0NSV01iY0dSdVNPU3k2?=
 =?utf-8?B?UkVPTFNEbDAxMGZMYkdBR0wvay8wcDYvOEdNNXF0bzBiZVhxZkRVc3pTS2NJ?=
 =?utf-8?B?YkxEc2lEVWRCYmoxSmZsU09zYTZVeUt5UjVpK2tlUUpRai9LMU54dndpTlox?=
 =?utf-8?B?Sm1nbmo1Zzc3T3U1Vmt3cThaRmh0djN4djcvYXBjUW8zRjdxMG1Lci9pTVdM?=
 =?utf-8?B?MzlPNFUzZG1NUWtXOWp0bzhobTluY1RvQXJLVG9rK3VtZDZ6NDBpU29QT3pU?=
 =?utf-8?B?UjBwN1czRU1YNnFWNU1hQ0ZqV0JiSGhBZWZRTFNtY3RSQlhJQmVzVUlENmVx?=
 =?utf-8?B?aGw3czhXTzlCejY1ZXNuOUJadFR3RzBEZmYwaEhjZ3RGd2Y0RDJyZFhPUVR2?=
 =?utf-8?B?ei9WS1VWMHhTdUNjcHZLSUVESjlkSDlVc3ZHeHF5NkcrVVB5eVE1TzB5ZGY1?=
 =?utf-8?B?SHgvNW94MVJCdkNUc0xxZVF4cHBlTTg5MzUxSWpSY2FzU1pkV0dkNk40TnZ3?=
 =?utf-8?B?V3V5S1djTFpxRzRvb2N0OWxmYnZ1aE9YMVN0Z3N6aVVnM0hjOEJveGhyaVpm?=
 =?utf-8?B?bk55VVpUUTNnSVltdXpmRUxUdGZCWHp5YlIzd3FZWGEwNVVYNEhMMkluYVBm?=
 =?utf-8?B?RVAvMXlLaWVmOFdBQ1ZUQlBPRzU4V2ZvS2ZwSytNTW1aeU5aNHpwR1dlOHMv?=
 =?utf-8?B?T05ZN2NiVjBXYVFYN2pGZng3SDlqVGRvTm1ZV05mcUNIb1N4ZWZkbExsQXps?=
 =?utf-8?B?SkpSSWZ1ditpU3F1TGYyREJDTzJrdVZveUhjUGkvN1IzanZ3NFVpKy91Q0da?=
 =?utf-8?B?YVl3a25IMlkyN0twYzB1ZTk2OU5LYVRsS1FzUjA4LzM1ODZvc3pFN056UDJQ?=
 =?utf-8?B?SkZEbjNIbUk5ajR1RDN1SUovTVhSajFWcUR1ZVRRM2FsZ25MMk9nWVRMcXNt?=
 =?utf-8?B?UFFuZmZsK2RTRjhKYWsvaVRnUTZYWTNTSHB3ek9Rdld5eXN1ek9UT29XNmd2?=
 =?utf-8?Q?yaqnsA?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S1U0Snlza3RZMkluR2x2VmF2QmtNMTJibjJQT3RtcFBvcHpEYlVTTHJpUTYv?=
 =?utf-8?B?a2FPOW1RMDRSM2xtWmNoQ1FQL2IvdGxSdzdPMldTRlFhaTB6Smlhdkh0MXN1?=
 =?utf-8?B?N1pFYVp1c2pQVkdESllCUmltalVqZXVmNWpkdG41SjRyRDdCbzBJams1Yldr?=
 =?utf-8?B?STJldDhZS3lsZmJybUwyRTJqQzJWakRYWFBUQ2trd3hFclVIZHdjMVc4ZDUz?=
 =?utf-8?B?eHlGSklEWCszd293RU45enRSVG5tbkVSQ2ZiV09pVzRlZWlUa2Jid1hoZjJl?=
 =?utf-8?B?dGRXUndpd2dSbU5nT0hlcXI5ODhDYTRDTzlXOXhJdG16UFh5bVg2VStSQk5Q?=
 =?utf-8?B?OGU3RXlvbE1wYkFaeDdwdjZWNG5rbzNyUTdxUFl0YnFWR2V6QlMyYzhyMVJv?=
 =?utf-8?B?NGNXc2ZMUk5WaEVjRHltYzQ4NXpheGtsRnZDSGZnNHdwcm9uTzVyMmNlb1Za?=
 =?utf-8?B?Nk9wNHFLSDZ5RXR6MjlJa3hPLzE2Q1VWbENhOGEzR1llRkZwbmhJVmJjaTY0?=
 =?utf-8?B?YnczaUEwM1dsVjFPaTdLNlFzN08vYmdHMGFMb1lLT3RRVm5SN0FNd2RsZmpp?=
 =?utf-8?B?Yk8yYVI5VVNYMU16dS9pQzlrTlY2b0VmUDFFQy8rR0RDUzROK1pOT1FIOW8v?=
 =?utf-8?B?U1BLTndkTHE5bTQycEYwc3MzYlArR1l0cHlNU3I0Qm44V3hCaXZMWTRwTGlY?=
 =?utf-8?B?Y01wMjEvNXJRSFBEUHhKOUxOZDg2aTc0UVRGSXp3VmNIdEVyV0orZDlVaDVO?=
 =?utf-8?B?bkoyOFJ4QnZWZko0TVEybDhYcDVDeTJoaGxkTnE5VW1uNlR0dm5xVUdmemZP?=
 =?utf-8?B?LzlPTFMzYzZxQldUVG5JK0NyS3B1RWh1RmQreFhWZzJ3eFJtWm02ZU1pdGdC?=
 =?utf-8?B?RUdpZnBvbW5lQUxkOStXMXVGbXREb3JjT3NMblgrQ1dGYks0Y0hNVXo4ZGZr?=
 =?utf-8?B?bVR2VlkwdUVYTXJJS0xxS0tkcGdXVytEL0NXR1dOZXBHTXl4SzN3Nnc0NW9O?=
 =?utf-8?B?M2pNQkxSS0E2UHFGN1NnYWZ1REZ4TEJxME5qdUp1ZjZFUmtmbytMSGFNWWRw?=
 =?utf-8?B?OXUxamhNSUREUUZNem1nTWljUmxoWFZaUmZaSE44bkJoc2dyWTRSeTREalhX?=
 =?utf-8?B?dlo4UVlXRDNJbFN2bkg3YjllTmNpT20xSGRqTjBIdW1YS0Q0djhpZzB0Qm9n?=
 =?utf-8?B?LzJrZkJBdUMxK1h2SmR1QjBXVFBrZUVtZnlyMDdxMXV6L0JyYTBCMGRxVnZQ?=
 =?utf-8?B?aHNrWFhJY2R2UkNIUnBVTkVSUStaYzFJcm9PVGswL2lBbHhOWVNtaXhsbnhE?=
 =?utf-8?B?bEI3TGJ0V1owclJWVDlYeGExbTRHeXVVaTBaOHJva3Zzak9ibytDdGlqQTI2?=
 =?utf-8?B?M1dJNkZ1TVkvQmRQejU5dHNmL1hHU3c0VHZuZUdya2s2SGZiMVRlNndYd0dH?=
 =?utf-8?B?TjYreHAvc0dHTERqVjNOamQ3YkwyM2ZRZ1U3dzdvcERxZWhHM3ZtRnViSnY1?=
 =?utf-8?B?c1dkeThFaGJCSkVMekhsTHBaZWlZenZUL1FNUHI3aFYzRmNCVzVZWFFOR2tr?=
 =?utf-8?B?WVI0RllwOHU4YWI3QWxnTGxEYk1OV1hFZnRIZzBHYWJ6dWhESS91Y0IwVkZG?=
 =?utf-8?B?YlBFQ2tvMVJFdUV6OUVaWGxpVTNZWENqbCs2ZTJPZEJPMlRHU2hCeldpSDd6?=
 =?utf-8?B?UjZnVlEycW1QTkR5L3dCRStUQlNGRFVERUJXNGdaZzZ6cmkrZGdNcFY3OTVW?=
 =?utf-8?B?bWozbVhVZnF1amlEamhOZlNkdVpVK1pib1BCWHRod2NTKzZGejZCczlqUTNj?=
 =?utf-8?B?cmV5WlFORmUxZ28zUEdxMmo0ZUlzcDl0VlNKU1FTTjhIeVJCRVhsenpYblYv?=
 =?utf-8?B?cjgrbDBBSU9LZm54OUEzVmwvSGswVUZHY1l2eFBkaDJhMjhrd29XeHg5Vkls?=
 =?utf-8?B?Y1hOcEs3Z3RNeXZPOVZjOW1uZlUwWlErWVd6aFhTaVRXVTVveGpjN21tRmxF?=
 =?utf-8?B?ZUJEVG5hODFXaUJJUXZGTTFRL3YxR2xBRVMvY1F6ZGdPSTkxUng1MXNvT1BV?=
 =?utf-8?B?V2dRRWxNZHlSTUJPbXJWdjUzRlcxZlFLVWFOVGZaVTUyTWRBTXpaVUxEaUp2?=
 =?utf-8?Q?Zx+k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5ff605-7564-4bca-1b62-08de21c9a67f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 08:58:29.8564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fThrR4Dt1K5bglwEJD4MQRWyl/TD5FrqvVNWJvBEvqAxFuPjtrixFE0e+NSioVU6VOcITF3F9CEyuizPJM0GRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9099

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDMwLCAy
MDI1IDg6NDQgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4g
Q2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgb2xla3NpaS5rdXJvY2hrb0BnbWFp
bC5jb207IFN0ZWZhbm8NCj4gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEp1
bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBCZXJ0cmFuZA0KPiBNYXJxdWlzIDxiZXJ0cmFu
ZC5tYXJxdWlzQGFybS5jb20+OyBPcnplbCwgTWljaGFsIDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47
DQo+IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IEFuZHJl
dyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBBbnRob255IFBFUkFSRCA8
YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47DQo+IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPjsgU2hhd24gQW5hc3Rhc2lvDQo+IDxzYW5hc3Rhc2lvQHJhcHRvcmVuZ2lu
ZWVyaW5nLmNvbT47IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT47
DQo+IEJvYiBFc2hsZW1hbiA8Ym9iYnllc2hsZW1hbkBnbWFpbC5jb20+OyBDb25ub3IgRGF2aXMN
Cj4gPGNvbm5vamRhdmlzQGdtYWlsLmNvbT47IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MyAxNS8yOF0geGVuL2RvbWN0bDogd3JhcCBkb21haW5fa2lsbCgpIHdpdGgN
Cj4gQ09ORklHX01HTVRfSFlQRVJDQUxMUw0KPg0KPiBPbiAxMy4xMC4yMDI1IDEyOjE1LCBQZW5u
eSBaaGVuZyB3cm90ZToNCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYw0K
PiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jDQo+ID4gQEAgLTEzOTYsNiAr
MTM5Niw3IEBAIGludCBfX21lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShzdHJ1Y3QgZG9tYWluICpk
LA0KPiA+ICAgICAgcmV0dXJuIHJjOw0KPiA+ICB9DQo+ID4NCj4gPiArI2lmZGVmIENPTkZJR19N
R01UX0hZUEVSQ0FMTFMNCj4gPiAgaW50IHJlbGlucXVpc2hfc2hhcmVkX3BhZ2VzKHN0cnVjdCBk
b21haW4gKmQpICB7DQo+ID4gICAgICBpbnQgcmMgPSAwOw0KPiA+IEBAIC0xNDUyLDYgKzE0NTMs
NyBAQCBpbnQgcmVsaW5xdWlzaF9zaGFyZWRfcGFnZXMoc3RydWN0IGRvbWFpbiAqZCkNCj4gPiAg
ICAgIHAybV91bmxvY2socDJtKTsNCj4gPiAgICAgIHJldHVybiByYzsNCj4gPiAgfQ0KPiA+ICsj
ZW5kaWYgLyogQ09ORklHX01HTVRfSFlQRVJDQUxMUyAqLw0KPiA+DQo+ID4gIHN0YXRpYyBpbnQg
cmFuZ2Vfc2hhcmUoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGRvbWFpbiAqY2QsDQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IG1lbV9zaGFyaW5nX29wX3JhbmdlICpyYW5nZSkN
Cj4NCj4gSXMgdGhpcyBuZWNlc3Nhcnk/IFNob3VsZG4ndCBNRU1fU0hBUklORyBhcyBhIHdob2xl
IGJlY29tZSBkZXBlbmRlbnQgdXBvbg0KPiBNR01UX0hZUEVSQ0FMTFMsIHRoZW4gYWxzbyBjb3Zl
cmluZyBYRU5NRU1fc2hhcmluZ19vcD8gKFRoZSBzYW1lIHdpbGwNCj4gYWxyZWFkeSBpbXBsaWNp
dGx5IGhhcHBlbiBmb3IgTUVNX1BBR0lORywgZHVlIHRvIGl0cyBWTV9FVkVOVCBkZXBlbmRlbmN5
LikNCj4NCg0KWWVzLCBTaW5jZSBJIGRpZG4ndCBzZWUgVk1fRVZFTlQgZGVwZW5kZW5jeSBmb3Ig
TUVNX1NIQVJJTkcuIEknbSBub3QgMTAwJSBzdXJlIHRoYXQgd2hldGhlciBtZW1vcnkgc2hhcmlu
ZyBmZWF0dXJlIGlzIGRlcGVuZGVudCBvbiBWTV9FVkVOVC4gQWxzbyBhcyBJIHJvdWdobHkgbG9v
ayB0aHJvdWdoIHRoZSBjb2RlcyBpbiBtbS9tZW1fc2hhcmluZy5jLCBtYXliZSBvbmx5IG1lbV9z
aGFyaW5nX25vdGlmeV9lbm9tZW0oKSB1dGlsaXplcyB2bSBldmVudCBzdWJzeXN0ZW0uDQoNCj4g
SmFuDQo=

