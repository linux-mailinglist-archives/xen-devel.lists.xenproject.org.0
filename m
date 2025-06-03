Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D595ACCDCB
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 21:44:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004833.1384530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMXYB-0007Vx-T7; Tue, 03 Jun 2025 19:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004833.1384530; Tue, 03 Jun 2025 19:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMXYB-0007Tg-Q5; Tue, 03 Jun 2025 19:43:55 +0000
Received: by outflank-mailman (input) for mailman id 1004833;
 Tue, 03 Jun 2025 19:43:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gbA8=YS=oracle.com=ross.philipson@srs-se1.protection.inumbo.net>)
 id 1uMXY9-0007Ta-A2
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 19:43:53 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1189a2f7-40b3-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 21:43:50 +0200 (CEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553HY1bQ020072;
 Tue, 3 Jun 2025 19:43:36 GMT
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8kanj9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Jun 2025 19:43:36 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 553IqTx0035024; Tue, 3 Jun 2025 19:43:35 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11010046.outbound.protection.outlook.com
 [40.93.198.46])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 46yr7a3nxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Jun 2025 19:43:35 +0000
Received: from DS0PR10MB7224.namprd10.prod.outlook.com (2603:10b6:8:f5::14) by
 SA1PR10MB6541.namprd10.prod.outlook.com (2603:10b6:806:2bd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 3 Jun
 2025 19:43:33 +0000
Received: from DS0PR10MB7224.namprd10.prod.outlook.com
 ([fe80::c57:383f:cfb2:47f8]) by DS0PR10MB7224.namprd10.prod.outlook.com
 ([fe80::c57:383f:cfb2:47f8%4]) with mapi id 15.20.8813.018; Tue, 3 Jun 2025
 19:43:32 +0000
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
X-Inumbo-ID: 1189a2f7-40b3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=sEXC6T0MJe2O10glzMtv7+EQ4/Y0XN4bug/GWxox0gY=; b=
	CC3nc6zFb3Fq3kGNhGUNRKPpSFzV/tsijo/90/P2vSb7yF/iY9/LlUz+nq+gNkYT
	EAil1PE6WFDgP5AKqPOfaQDbNs8m/Cn1rFHR0T3Ui+hG8u29YzqneZZa0p2WA8yO
	JQ3eW3KQ36dxTkGHr1kLDc3EGNjTqk76deO9mu2Tegzfonp3bTsAK/aGzYLVrJUb
	zpZJUgI4z1DLiMINSjk+KI342nZj9vmzaaNxPfOX9jKHJODPEBQCkz69pmWr5IYV
	0JCoNZYMXBm9al4TFFC7/oyKG7I2FSasDeCjLeLYxZldolWIOxRpn2NMpRrhTstN
	1EHsncOJOsqWz1pZ2G9N2g==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QLo6BE1NFR701FHn0cw5w58f1ukKFLBIkZfnvQ4uuah1fwXKiucybklXCSIkenLhpBxQ+hthl4WPc4Ccfo4uWr9dDixqUYiXXsiXtyuqxOlqENd7khqzB28pT2CCoVIEzOAJrwTpzz6unrS5Oi3Wd27hW4BfJLJwobt70aSi44vHQ5U49/V+0fmT8McDowcKIJ/K0tTc9BwiDF0IdgAaKbLFa2UYpVtdpkcUgx/Fa2nL33K6zuZO1CQ1TPYKP6Jb8Kq7JWOFFGCGlnvfylJvZ6et6vo65tv8AbS4DYaT6OvgAjXtyRzxpuXi/7t53G90LH1CZuqqiI0pTFa5F+kccA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEXC6T0MJe2O10glzMtv7+EQ4/Y0XN4bug/GWxox0gY=;
 b=PrzrbvOQ2gOiRi30ciH/9n7a3hlOZ6zcG7TKgvWAs5alz5//wyweyEwylwp7UuxPE8tvjO3jdhMp3NFNp+qQ04z+/I2Y8yOIuaeZOmBZFzX0gj3UAliRppfj1nCTmFJ1KN9vnUblM6QWkUA9B0gmASRMee3PZ0nNItgZ036xfHHySgD02gDk8Cq6UlBgGinZvaIXJf5ncv863gmOX2g8PuXcg/bHTSsWMtlo/P0xJphVbuvSmme+b9yw6NVWPejlGQwAEwnCNtjGTUZMfrcBTE0hdh8w3QlskchVYtHpLnN2qJSvXG3H5eO3cR0G8tyfMUv/tHBtjn2QAaB9SDpJZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEXC6T0MJe2O10glzMtv7+EQ4/Y0XN4bug/GWxox0gY=;
 b=NUwEDkhg2/fZCbLBlpl20chPXcTi8pJzZ+b9XpNHyyI4fHU3X474p1kHPcsybrGnJtyBetTNLjyGBJ3J0O9QjoThdpmsNHLKvI7/OaLhz4f7pXFqPDBMLwmOk0oXBrUEdQNa0wDY+pkXAkLdwZcQdMqT30OLnztiy8acorY47vA=
Message-ID: <b5a083fc-ed94-4d94-acf3-e3b454440a3e@oracle.com>
Date: Tue, 3 Jun 2025 12:43:30 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/22] x86/slaunch: restore boot MTRRs after Intel TXT
 DRTM
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
        Andrew Cooper
 <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
        "Daniel P. Smith" <dpsmith@apertussolutions.com>,
        trenchboot-devel@googlegroups.com
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <5b6b9bf165a4fd9444dc53848fb8faa2cea30781.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Language: en-US
From: ross.philipson@oracle.com
In-Reply-To: <5b6b9bf165a4fd9444dc53848fb8faa2cea30781.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::26) To DS0PR10MB7224.namprd10.prod.outlook.com
 (2603:10b6:8:f5::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7224:EE_|SA1PR10MB6541:EE_
X-MS-Office365-Filtering-Correlation-Id: a965491f-4d2c-46b6-3ed4-08dda2d6ec42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnpEak85RTVudHFrWlpQbEVXMXpBNjFJK1NiZmhSRmFUcDVLOUlCc3lmQnJW?=
 =?utf-8?B?c2xQMHJUS3Ird05UTXh0eUwrejJjb0lRRlp2aTZWRmRzWDNQQ2d3MGZ4UzQw?=
 =?utf-8?B?bjJrbVU0MzlFL0JTQUZPKy9uK2p6YmtlYzYwZDBHeWovUXJTOUl5WlQ3MTRO?=
 =?utf-8?B?OVJLWnFHQ3d1QWljWEExanBzaHE3RW1VR0crK2kxa0ZvOG5QcVRSV2FybWR3?=
 =?utf-8?B?THR6VUIwL2psbURnNlB2V1dFQ3BndjBieHppYTVhMzB0MWpOK2VVOStJZHdK?=
 =?utf-8?B?RjZOd3ovcWcxelBHZmNwME54SUJKaHdoUnYvdzh2VlVxQThXWGh6eEpaRHNt?=
 =?utf-8?B?NkRXRU5WcEJIQ282RTZMeVdoNHUzZEpBR2JUdnRUUW5STlN1Nys4d0RaYy9r?=
 =?utf-8?B?Z2lEUzE2NWtoeWxGa21mTERvYUJxczF4ZnpIbktvV01CV2ViYXJXRjIyTWZC?=
 =?utf-8?B?QnlMbm9MakVCbmZiU0JPWUROYXNsNTVoR0RXTkg2Q3NlOURxSGkyUnBOdmhw?=
 =?utf-8?B?ZXVBYldZSmhudkJsSVFoU2FYdlVnaWZFU0FzMGVBTUl6MEo4NzJZKzJtN3Jn?=
 =?utf-8?B?TU41ZTMzZjlKUEU2dklUYW9DNXd1SGxZVStrVWFpRUs0MjcxcXA1aEJXTDRJ?=
 =?utf-8?B?elJrL25LNGpDL09pRHNFeHg3ZHFubzBkY2I3a0ZxVTkzMm9aazRwNXBYVlFr?=
 =?utf-8?B?aG9uM3RURVR6UkttdU1HZ0ZDb0E2SENaa1hwY1RaaWpwOGEranl5cW1vQ29z?=
 =?utf-8?B?TWtGK2VxbEZDelo5ZE9CZGlvRzRxWmZmOHdCYW5NbDVWVDF0N2FmNUZtaTVG?=
 =?utf-8?B?bVMvMHd4OWRNRW43amRHdmo4ZzVQWUErWmpVa0xaT0xQY00weHBQeHlXMDEr?=
 =?utf-8?B?THYzUWM0dlRBQWVXdFVBMC9UM2ExUzI2dzhGU3d5YzZYM3N3R0dSUWxYYU9j?=
 =?utf-8?B?NDZiVCtMOHo0b3dNZWRBRGpnMm5CSjZZOUhva0JNNDZJMWhDeTRIVlA5Q3FK?=
 =?utf-8?B?SkRvTmtZOG5hMUFSWFRHTkZkdDg0U2t0dm5RNlFBZUNJQVNLeExGUTQwRW54?=
 =?utf-8?B?enIzbXM3OEFkOXVaR2tyUWZlT1B6Zmd2MHlEbUZ0VWcxUm5DY0RhY0U1MHl3?=
 =?utf-8?B?Y3VIc2U2cHdGWWEzYTl3NGtmOVg2ZjZLTmY4VVVsNEg3cklhM0pMaWFKbUor?=
 =?utf-8?B?WThGQWx1N0NFMWVHK01sZ3YwUUwxS3VmSXYveUF4TSt3VUl4MlhZc2E4c2p6?=
 =?utf-8?B?cldqZ2xsd2gwK0lKVVJGMk0xNXdVVmtNY2c3b1E5MXVqa1BZc3AwRnlpR0VD?=
 =?utf-8?B?dDU1UHIxeFBucFJaN2hNc05KWE1qRmdYOUlMS2ZNbURodVVmeDN1bGVkTDVU?=
 =?utf-8?B?V1FHUWxldVpra3E4RnNxOFhtNWpzVDBiWUFFVWpGK0VnQklUQnUyTCtOYzVw?=
 =?utf-8?B?S3dUL2pSVXBqclhOTzZra0dDa2JUbHR5NnhSc0JOSDVoaURwQVVJMWJ6WktR?=
 =?utf-8?B?ckttK2psT1FNbW90QUxMZCtXMndMb3hqWDBNQVk5M3YzbC9XeXBSSUZ3b2g4?=
 =?utf-8?B?TDd4Z1hjUWFoLzRyL1lKVTQ3WGkydFk3QUJpQk0yUVlEUmJhaFVUb2pmcWNL?=
 =?utf-8?B?bUpGYSs3QUhYZnA3MFR2MWJ4MUo0dnhIYjIvMUxRdFJlbDJ0c2lmU1NlUitO?=
 =?utf-8?B?NHVQVENYcUpFcGJaZWlMNjlEcW9GU3JQSS8wNXlmZlU4cEdMNmRCaTJtZnhO?=
 =?utf-8?B?K2lmU1d5Nlh1ZFlXV1pZcWhPT3dTbGhCWWJraHUwVnpPSUhwazVzUzVMSkpr?=
 =?utf-8?B?VCtQUGc2ZFRwVTVSN0tQMytEOHRyVnp1M3FCcjJXYUpXU3R0bUxQeUttTHZR?=
 =?utf-8?B?RG1WcnRDR0ZEbUhLeEE2ZDZYOTFONGNXcWovQ2QxUUN2b3NQMkN6WnhkNm1H?=
 =?utf-8?Q?Sk/kZps/KNU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7224.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVI2RVdzUGg2MDF6Q2VyaUtQb2VYQkFKRWViTDhkZk9NeUtZZHZ4NktzbEly?=
 =?utf-8?B?elplSnRsSEJ0Nk5FZURHZ0NGWEc0czdud2dmV2ZIaDE3bG5GN2N3bGJhbFRE?=
 =?utf-8?B?cktrTWprM1UrK25TcGpsZFNvZGkwVFljWDJkVlVubC9hUTNYMlVSWFN0THgw?=
 =?utf-8?B?UmF0Nyt5QWNBSVBVR21YbEQ4T2FGM0tUSytVZWRIQW9nRXVGRmpNaHdFK3pH?=
 =?utf-8?B?MG9GbVFPcVdUT0doc0tUdmwwZGpxcW1CelA1NEN2RVJRRXkrUzhvYUlRZmQ1?=
 =?utf-8?B?OFhodWJKM0hScGZWZmlOMlhMS1Q1ZlprVGJMNlZZN3RqVjJoaUIvU1pITVBW?=
 =?utf-8?B?RW9JY1lFZlJZUGhpMUFpR3pnbGpDNXI4OXpqbXBRSExhdFNjR0FGa3JYbnlJ?=
 =?utf-8?B?SFVyRUpyNDRNR3BtTXU5YjRQdkt1VlZwK3NRWkg5U0hQT3dHcnZ6c0hUeUZV?=
 =?utf-8?B?MFlPamJSMEJKUm5WWmFtditWNzQ3a1FGY0ZTM0swY1BTdFBtS1NhVklidzRO?=
 =?utf-8?B?T0pUTHNBakpuOTNVMHRKTE5lNW00KzhubStEWnpEeTZzaUV5YU1LSGpsaEd5?=
 =?utf-8?B?ZUtSZWFzSklUTGlpMUhXenhIekFvVXBLeFpoRzBJL1kwVlo5aFV5ZzByUDkx?=
 =?utf-8?B?a2M4ZmxSYWJhNVNHNG52SXQ3TnlSRHdTOHR0VldrNmdEQWtTVDRmZXdZSFdo?=
 =?utf-8?B?ZVhTRlhBNU5CZjFsRHd3elIzZm5tN0ZwZVVZV0tyYkpKVDJMWW5wVllWY1ZJ?=
 =?utf-8?B?MUIvUmRXZFNaZjA0NlZyVG94RENETjFISmM0dmgxQlE1eXBicGlObER3L002?=
 =?utf-8?B?dnNlTkIyZHJsazl3bUVqYWhuencwK3d4ZzAvbFlPdVZNSk1Sd2xMQlVRb2NG?=
 =?utf-8?B?L2JSM1dQemw2MkVZcVVvUWYyU0NCbnFxUVNaSFdPTUUxa1psMHlBazRXNitl?=
 =?utf-8?B?STE1NVg2SUx5UDRSTGU1Y0huaEk0TDZ4SnNpdHMyNStVMUw1YW1kOGRhdmxm?=
 =?utf-8?B?aWdKMFl6cUhkVFcrZmQrVk5qd1hqbG9taEE4NFp4RU9PRW1idU4zY2ZFRkEw?=
 =?utf-8?B?NVhuVDgvVmlDTnJSSy85RFUxNStISFcxcGF3KzRVbFBpQ2VBTjdVOW5ieFNY?=
 =?utf-8?B?dlBuOFQ5QnIwQ2diemwrSk04YmVGdnY5QmZRREN5MmFPTTRKZ1N5TytlRXN1?=
 =?utf-8?B?dlNGaXBPVm1VYUF4L1RvUkhrd3JBQlVQS2J0YnIwV2xNajNOcG14UG1jeHdF?=
 =?utf-8?B?RXBuODhRZ1Z1MW1lcFhpWlFJN01iVG9tUE5kTDVyYndZTmtWajhBZGJqZEhw?=
 =?utf-8?B?ODRRK3ByaUxDcEE0bVBVLzJheFBvOWFlZ0MyZlF4ajBZaVBBNjQ0aitlQU1S?=
 =?utf-8?B?M3NIMFVHbTRkUm4rRzQ4czNnNlJrNEI4dFNaTXZtMWZzZWd1NzMzRkVXUVNZ?=
 =?utf-8?B?dUZuSzBQaHQ2eUpiVnE3YVFvRlJFWTdVNTg2RVJEYUE2V2xGN3g3OUY1Rmlh?=
 =?utf-8?B?Mjh0a2QzcjdSTVlLUmUyY3BZU2dFNXRkR2VKNC90UmJlOENoZCt2S0R5ZDhk?=
 =?utf-8?B?d3YvWkFoNEN5cGRUeFRzUDR0bkFZRkJ0WHlvSnVJdUZrR3NoRG10R25JWDRE?=
 =?utf-8?B?bkVQWGxudHhRT2NHZFVRaWxHM1hFNkNjdEdTb1RkUUpSYllCYzZoTFFtNFZT?=
 =?utf-8?B?SCtvOXEvUmlrTVRFVmR6d0kwYUJYRnZ6bzRyekFhcTdCQUU2ck1YOFBCRmg0?=
 =?utf-8?B?eUxEV0QxSVRNNnRLa2dUNFpoVjEzb3pHaVpIVjZNS0IwMzlqdkZzUHlMS0Fr?=
 =?utf-8?B?b2Y4b2ZFVDdEb0ZHLzcydHlHelFBdmx4dzBYblhvdXFJWnVKY1J0QVZGK3ZP?=
 =?utf-8?B?aTZiWTJjQ0F4QWxKejhEdkRNM2FlMWthcnlXTGNWbmdka1lUNVZwSlFtT2JN?=
 =?utf-8?B?V0xlM1NNcU91aEZzZXl1Q2ZPbzFPbGY1VTZvc04wRXRHelJLRGk3OWozNUF5?=
 =?utf-8?B?bEp3SERGR21PNU1CM0E3dUhSbmpaazBYRnhWa3IvYmltYlBhT0FjNlgxcWl4?=
 =?utf-8?B?VGVMSHZVeGVGVUpFMHRIYmN4cVQ4Tk5OM1pETWRWekgwd29VaHpLM21pZzhi?=
 =?utf-8?B?UlN6bHk2M1ZxMGFPSFJoeGI2b2FrS1A4S2Jtcjc4ZS9HTVpoc3RNcEFrQ2hY?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KFeP+m+X3jyb4bO7qOh/LSWFw7dBMvUTZdenf1fRfWE0S87OIkJWMdFIDr1pOvdwvU1WkJdLO+yUSgA+kqm5zlQNm/hV5Wa2WzBIsGZgqs1ObVB2rlAvZPgrDjaI1sveMfzVa5sWOKWWiYpvEG4akBx5fU5+b2MqoE0SoeBtyo6MDkLyly6Er9Ie2PdQEE4NQVNwk4EZQKsa/kVysKHhR35xw/BFv8tSud/MbCUYLLjPE+lDJtCXXU60oEovpCfNVRCMFMY2LIWAAGaBSntvQMIV6BdFLAl5jRMu9AYcCi1BiRyLH92mFULk1/g9sQ7bsbt4EfdDJW+UdBrsHPlnoGv2kVLcFYW/U61Uu6aQOGLi13lVKiZ4eWgMpkyZpXidlzjeNPSu8EwyQ3jX+i9xai64tb2mjYlZfmEe0V5NSxLCyWFQIHPTytiC3HYV6ZEkpQNmNnsho20NuS5/HfvMGxOLlhxbIXPsl0izSyxxVkwXloPEUYvnoCX2AAghAy+Sp2nAAjs72yLSMMc3NF6i5Ed4mQJYXnZDGItG58EtrN2umgyq5QOsa0pbKJHci8+1LLGZklk1i0XVs6lrl0/5AOLNmsfWzpZ2QuLzo3idnsM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a965491f-4d2c-46b6-3ed4-08dda2d6ec42
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7224.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 19:43:32.8379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wu9B+VH+c1zCjRGRqDNw/jU2IM2J7LtjgKFNO/95kTUusI6ppQM2ZL39lwlqKneWRa7NniST4hsOWb5pwdmdMHvH6hMhvJ2faMCIma6eiQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6541
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_02,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030172
X-Proofpoint-GUID: m6o4JVHiNyJWHCOTe64BCyxvvr6F6kZo
X-Proofpoint-ORIG-GUID: m6o4JVHiNyJWHCOTe64BCyxvvr6F6kZo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDE3MiBTYWx0ZWRfXwKlDzEbC7y8s zX1gCj1BuJHNsK1upbrx3D7L/VlLE0H+k5LcF7eNRe8D7j6hcj5jctmYUmVGqxAfHD2msEwJu6S OBvAfHY7x67cvftKiQoerDbV6JL4ii4RpaWHY7uIi+NRP5n+DgRi8mTiEQvVnL353kbBrYZ1lf5
 Me9EKHUX24FBr4n935pC+TxVFQFGhU532Jhfh1FMNQxzmbILXYBWQGvAJoJbLOPzG+8zcWG/c/o nKQEuhan31Ya9L7jJIfsZSfn3eKliiaftfhc89YdmBCpW+fYOyroYbA2zfzjFGvYOE0j+pyRxWj +P/qleufu5JxZcE8fadISO4c/cXEpDRTh8udJGJXHreF07yUY+GI53Yk+6jjkTMQ/+jWyySPA+n
 hOaoAZHLn+zjyPtzOpPt6OvOzmXFUT/WCXgEwyMUcnVuknOYZbTLsx7lB0FlL7QPlUjz2HZo
X-Authority-Analysis: v=2.4 cv=FM4bx/os c=1 sm=1 tr=0 ts=683f5068 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=C_d68mY_AAAA:8 a=b_4gr1VNPdOSmOihzdAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=wASdygnoxNaGnvDdgHrj:22

On 5/30/25 6:17 AM, Sergii Dmytruk wrote:
> From: Krystian Hebel <krystian.hebel@3mdeb.com>
> 
> In preparation for TXT SENTER call, GRUB had to modify MTRR settings
> to be UC for everything except SINIT ACM. Old values are restored
> from SLRT where they were saved by the bootloader.
> 
> Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
> Signed-off-by: Michał Żygowski <michal.zygowski@3mdeb.com>
> Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
> ---
>   xen/arch/x86/e820.c                  |  5 ++
>   xen/arch/x86/include/asm/intel-txt.h |  3 ++
>   xen/arch/x86/intel-txt.c             | 75 ++++++++++++++++++++++++++++
>   3 files changed, 83 insertions(+)
> 
> diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
> index ca577c0bde..60f00e5259 100644
> --- a/xen/arch/x86/e820.c
> +++ b/xen/arch/x86/e820.c
> @@ -11,6 +11,8 @@
>   #include <asm/mtrr.h>
>   #include <asm/msr.h>
>   #include <asm/guest.h>
> +#include <asm/intel-txt.h>
> +#include <asm/slaunch.h>
>   
>   /*
>    * opt_mem: Limit maximum address of physical RAM.
> @@ -442,6 +444,9 @@ static uint64_t __init mtrr_top_of_ram(void)
>       ASSERT(paddr_bits);
>       addr_mask = ((1ULL << paddr_bits) - 1) & PAGE_MASK;
>   
> +    if ( slaunch_active )
> +        txt_restore_mtrrs(e820_verbose);
> +

I was just curious why they are being restored here in the e820 code? It 
seems that could be restored earlier. Until they are restored, most of 
RAM is set UC as you know. I also don't have an exact idea how early in 
Xen boot cycle this is occurring so maybe this is fine but obviously for 
performance reasons it should be done as early as possible.

Thanks,
Ross

>       rdmsrl(MSR_MTRRcap, mtrr_cap);
>       rdmsrl(MSR_MTRRdefType, mtrr_def);
>   
> diff --git a/xen/arch/x86/include/asm/intel-txt.h b/xen/arch/x86/include/asm/intel-txt.h
> index ad3c41d86c..0b0bdc1bb2 100644
> --- a/xen/arch/x86/include/asm/intel-txt.h
> +++ b/xen/arch/x86/include/asm/intel-txt.h
> @@ -426,6 +426,9 @@ void txt_map_mem_regions(void);
>   /* Marks TXT-specific memory as used to avoid its corruption. */
>   void txt_reserve_mem_regions(void);
>   
> +/* Restores original MTRR values saved by a bootloader before starting DRTM. */
> +void txt_restore_mtrrs(bool e820_verbose);
> +
>   #endif /* __ASSEMBLY__ */
>   
>   #endif /* X86_INTEL_TXT_H */
> diff --git a/xen/arch/x86/intel-txt.c b/xen/arch/x86/intel-txt.c
> index 163383b262..0c14d84486 100644
> --- a/xen/arch/x86/intel-txt.c
> +++ b/xen/arch/x86/intel-txt.c
> @@ -10,6 +10,8 @@
>   #include <xen/types.h>
>   #include <asm/e820.h>
>   #include <asm/intel-txt.h>
> +#include <asm/msr.h>
> +#include <asm/mtrr.h>
>   #include <asm/slaunch.h>
>   
>   static uint64_t __initdata txt_heap_base, txt_heap_size;
> @@ -111,3 +113,76 @@ void __init txt_reserve_mem_regions(void)
>                        E820_UNUSABLE);
>       BUG_ON(rc == 0);
>   }
> +
> +void __init txt_restore_mtrrs(bool e820_verbose)
> +{
> +    struct slr_entry_intel_info *intel_info;
> +    uint64_t mtrr_cap, mtrr_def, base, mask;
> +    unsigned int i;
> +    uint64_t def_type;
> +    struct mtrr_pausing_state pausing_state;
> +
> +    rdmsrl(MSR_MTRRcap, mtrr_cap);
> +    rdmsrl(MSR_MTRRdefType, mtrr_def);
> +
> +    if ( e820_verbose )
> +    {
> +        printk("MTRRs set previously for SINIT ACM:\n");
> +        printk(" MTRR cap: %"PRIx64" type: %"PRIx64"\n", mtrr_cap, mtrr_def);
> +
> +        for ( i = 0; i < (uint8_t)mtrr_cap; i++ )
> +        {
> +            rdmsrl(MSR_IA32_MTRR_PHYSBASE(i), base);
> +            rdmsrl(MSR_IA32_MTRR_PHYSMASK(i), mask);
> +
> +            printk(" MTRR[%d]: base %"PRIx64" mask %"PRIx64"\n",
> +                   i, base, mask);
> +        }
> +    }
> +
> +    intel_info = (struct slr_entry_intel_info *)
> +        slr_next_entry_by_tag(slaunch_get_slrt(), NULL, SLR_ENTRY_INTEL_INFO);
> +
> +    if ( (mtrr_cap & 0xFF) != intel_info->saved_bsp_mtrrs.mtrr_vcnt )
> +    {
> +        printk("Bootloader saved %ld MTRR values, but there should be %ld\n",
> +               intel_info->saved_bsp_mtrrs.mtrr_vcnt, mtrr_cap & 0xFF);
> +        /* Choose the smaller one to be on the safe side. */
> +        mtrr_cap = (mtrr_cap & 0xFF) > intel_info->saved_bsp_mtrrs.mtrr_vcnt ?
> +                   intel_info->saved_bsp_mtrrs.mtrr_vcnt : mtrr_cap;
> +    }
> +
> +    def_type = intel_info->saved_bsp_mtrrs.default_mem_type;
> +    pausing_state = mtrr_pause_caching();
> +
> +    for ( i = 0; i < (uint8_t)mtrr_cap; i++ )
> +    {
> +        base = intel_info->saved_bsp_mtrrs.mtrr_pair[i].mtrr_physbase;
> +        mask = intel_info->saved_bsp_mtrrs.mtrr_pair[i].mtrr_physmask;
> +        wrmsrl(MSR_IA32_MTRR_PHYSBASE(i), base);
> +        wrmsrl(MSR_IA32_MTRR_PHYSMASK(i), mask);
> +    }
> +
> +    pausing_state.def_type = def_type;
> +    mtrr_resume_caching(pausing_state);
> +
> +    if ( e820_verbose )
> +    {
> +        printk("Restored MTRRs:\n"); /* Printed by caller, mtrr_top_of_ram(). */
> +
> +        /* If MTRRs are not enabled or WB is not a default type, MTRRs won't be printed */
> +        if ( !test_bit(11, &def_type) || ((uint8_t)def_type == X86_MT_WB) )
> +        {
> +            for ( i = 0; i < (uint8_t)mtrr_cap; i++ )
> +            {
> +                rdmsrl(MSR_IA32_MTRR_PHYSBASE(i), base);
> +                rdmsrl(MSR_IA32_MTRR_PHYSMASK(i), mask);
> +                printk(" MTRR[%d]: base %"PRIx64" mask %"PRIx64"\n",
> +                       i, base, mask);
> +            }
> +        }
> +    }
> +
> +    /* Restore IA32_MISC_ENABLES */
> +    wrmsrl(MSR_IA32_MISC_ENABLE, intel_info->saved_misc_enable_msr);
> +}


