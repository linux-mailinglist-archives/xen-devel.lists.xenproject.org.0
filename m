Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3E2C20008
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 13:27:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153602.1483905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vERk2-0002V3-Gc; Thu, 30 Oct 2025 12:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153602.1483905; Thu, 30 Oct 2025 12:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vERk2-0002Sk-DU; Thu, 30 Oct 2025 12:26:58 +0000
Received: by outflank-mailman (input) for mailman id 1153602;
 Thu, 30 Oct 2025 12:26:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5IGd=5H=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vERk1-0002Se-22
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 12:26:57 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6aa9ec4-b58b-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 13:26:51 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by GV2PR03MB8653.eurprd03.prod.outlook.com (2603:10a6:150:75::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 12:26:43 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 12:26:43 +0000
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
X-Inumbo-ID: b6aa9ec4-b58b-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icCmXs8JP07XEQhOWn82gyKk1d77Sx6SZGsoACSRcdeoKKhqNA5ZiymL/j2DyGVJA9r8qVnBikebwo0FCLc1BkFcKtqMxPfClpfhstWLByk+PworQupoMCzKtvMTPAlZi+XrXnaQCt805bu1FKNpA7vuh9Qlk8bkxGQEqlRkCJwuRdLgEIi9vERrThixemVjBAKU+obokEkh7UL5nIvHuNaap5SQPh9fvcsKCK4RCPCRDPr837PMuKPxawQELc3XWR/zc0xX+5Q1rvPPrWSckwoCwZy5wE4xJ83JiRuWzbCbiKbZpdehX23WlGXk9jdE0aPBi9ytvJYBtzLE3gW/gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vksVh06D3GYjpty2dbEQmNqF5w0G4jzayLz/+2Ebawg=;
 b=vp1XxlvpHTSnHR19UY6hjpFmNQ48u996VrbVCxlY9gL8/xzgEHseBXkILQX4GYdp5GdOyc/OfWaAuHW3wkZl+FkGprBfq2drkRtFv9YIF/s3SQMvwNE+HFMjdNUh1rkhvPi4Olvjci3zL/mwzRZmEUCB3cV+dUhz+sTEv0Dtyx4HQTBl1RtqCP/+Mw0Hmxrvau5cu3sskUh520w57CZWcyJINWcRgDT29qZEclW3u8K2v3U/hmAKUaADzvbPipJVJMWV3IJLGt9mRkqo5V0euabW2ApRo+GAtsr1jfZzrC9Wqx5ebtjnuUVkOn7PTowdcDL+1DHu0aWDoGuDHOPZMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vksVh06D3GYjpty2dbEQmNqF5w0G4jzayLz/+2Ebawg=;
 b=WGOTymMKru7yQKuDavH5+Om36dbUL/7KBcHkiQNiDsWTGmTF/R6tBX0EDedK4pqdDMaNUHajT2B5Kla4fLWIKbTzmT3hc483pHe4KfWY85RbA87jRzMKI0pOjxfuSMxGacYbffiEunT/xLJ22Px4w9UJepj1u38asXIoF7mcxrU7oTpShmT5Prroc4hx9V3U/+GbkFPTwj90nv7xjl41w4GdyJbPBgJKGkPYVexIMZBNgX1bF03yGFI6EaytG4uUtMVEemRIKxNmsvHpR/BRP/WcbusJfNeTbA3LWdompduvtBF1Nx/C4Jy3WZiCMSeNG3fUVS08txKrCuhwCGMBsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <1a8eb5fd-f52b-4cdf-8dc5-f07d07d0daf3@epam.com>
Date: Thu, 30 Oct 2025 14:26:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 3/3] x86/hvm: vmx: refactor cache disable mode data
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251029235448.602380-1-grygorii_strashko@epam.com>
 <20251029235448.602380-4-grygorii_strashko@epam.com>
 <52395897-0e7f-4d24-8a28-0a303ff717b5@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <52395897-0e7f-4d24-8a28-0a303ff717b5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0230.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::15) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|GV2PR03MB8653:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bdf10a9-7c55-47c9-25dd-08de17af95f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVJjNjJRNXFDemFWUWp2c1R3QTRKRStyTXk2cGJRMmlkVm5YLzRPdnRVL1pN?=
 =?utf-8?B?WUt4UUN4MktkVmt1eGc0NVRubGdObTlZcFpYeW5FbmlNRXhHTzNCei84dGdW?=
 =?utf-8?B?M1lta01JUlZWWldqY1VKQ2lHTVl1REZXY2VLbDI4V1dzVkEwbTc3MXM4a0Vk?=
 =?utf-8?B?cFZobHpUWHEyOTU1anZxTU9FTy9NZXZuRjJWSEczNkFQazUxYjI1WHU3eGpF?=
 =?utf-8?B?WFN5NTZWSU15M3BibHRtbzdiQi9WQW5obmF0K3JLMHFtYTZUaVFFR2VDNHBG?=
 =?utf-8?B?VXNROEtGeExHb1Q0VlltZ25tSld6OUhsbVMyUU52akR4cU1NMU9Xa0VQa2Z1?=
 =?utf-8?B?dTBBRG9YL3NWYnZMdXV6c2c3czU4MWs1bCt4K0Z0dUR0SVlxV1oxWmZPYk0r?=
 =?utf-8?B?SDB6eXFvaXRwSnVHSXhEN1BvSUVQVzV0MnhDaWg4bEU2ZzZVZFg3cmlsQmFH?=
 =?utf-8?B?ZDk2WmV1czBWWlRrdHRHWEh6Z1Y3Rk4wWkV4NDExR2dFOHV4Y05icFhVM1Zl?=
 =?utf-8?B?RWRXL1QxQThVcjRZRVpVNVhzZUJwUThQY1RoQXN6ekNZaEdtTDYvVjFCTEdv?=
 =?utf-8?B?VFJyWHJ2bTVHUjVRWkFyRzZvV0YwdU5yalZVYXhWNXd4VHlNMndIMGdPaWw1?=
 =?utf-8?B?ZXA0bWNXMkJ0TjRJS2xqWHBqRTFiSVVMUnVaWENIUXN4VDRod3FlamFaOEtE?=
 =?utf-8?B?T2dMOUNQblAxc1c4NmtXeVF5dWRyU0RpTlF1VXUvMzg2MlZ1dU1RZS9pdm50?=
 =?utf-8?B?VjF0UTFackdGN0Z4VlZ3ejNHTzNncE0xazVyZXo0cUlpMW1yMzIyZzhIVHJR?=
 =?utf-8?B?TXRFcnUvWS90Nmdxcmo0SGlTVVlTRkcrT2s5MFo2WVl1dFh1YU10cndjem9J?=
 =?utf-8?B?eXcyZ0lodU1ZVlRtRURtT3Y3dDZ3VXc0U000WkpWYmtOV1JTY2xBSmRHQUlP?=
 =?utf-8?B?VTl1ZVIzU3hlY0JMNStNaFpaMVQ4SEpWZ2M2VE1QanZMVlFuOEY4K1RqK2hZ?=
 =?utf-8?B?eGFRM1JEaUhEeTU3b1pIR2N4M0NuRTZGOENuSkNCeEcwbTB0RWFpd1BEYlV2?=
 =?utf-8?B?YzkwNXdVekRyaUlPMDRQZjMvV3JQNCtyeFV2UzVReFdoZ2RkaDltV3M3ZFoz?=
 =?utf-8?B?ci90b0JHSWowdDQ1bDkyODBUS3l2ZlJjUTVqeGF2UHQwaE1VM1pPRkNMRHlz?=
 =?utf-8?B?VjduaFc4WHBsTUlBZXVXTllMRUowMCtQcjdLcDY3Njc3RVRsZjREM0lBaExD?=
 =?utf-8?B?N3NaY0tvRGlrYjNZd3Q0Y0YwUVUyeTNESzgrN1VFNjZqZGJtYWtrUGJQQVI4?=
 =?utf-8?B?K3gwUE1PcjZueE9keUFvQThnWTF5eGF0UzJ2Wk1aN3FSZHd2a2lDVktNRlVG?=
 =?utf-8?B?SU1TRk5pYTMzR0R6UTNnU2Q5M3IzMDN5SWsyUkd3Ulp2L25LNnU3YXE5R1Fx?=
 =?utf-8?B?MmNva3NScnJtWjdHSm9kNjY5aEpuUkg3K1ljamUzQVpOT3RKZkNlT3UzaHlQ?=
 =?utf-8?B?SDlLTlBIRnV0U0JvcFRrS3hQSW40aFA1T3QvaENpOTRXblJwQUlqSDFtTlBh?=
 =?utf-8?B?d3lWZjUxL2FscWtHdzA5RUdrc0oxSkp1OXRDekZvYk9FZW1zYlg1eGpnQ2RR?=
 =?utf-8?B?U0tSUlNMQ0IybXZYYysvOE9RZmU5ejRaMzdxbmhhZTZ2S2tROUdhRU5Qc0Zo?=
 =?utf-8?B?eWEzNWhjV1JhT3cxSDV3RU9pQWVPKzh2ajQ4aEV6eGtxcmNrNjdMb2Q1eEZi?=
 =?utf-8?B?NmpINllFZmt0MCtIV0NiSGNISGZkcnhYbUZiNFkxbjEyVjM1TzRtZnh0QkVk?=
 =?utf-8?B?OFVweklFQ3dEbUkweFNIQkU2d0RCb1Fkd1pyVUxhSEJEQVRDRFlhSzFIdytD?=
 =?utf-8?B?MS96b2dXUG00VnlMbkxXd1lHQ3R3dHJaNlZuN0R3VC9JeEZtbzdDeEdwWHJP?=
 =?utf-8?Q?0edaIhLWruIJYYJcqhPMyd3QGO+NQHx3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmZqWVVucnd3cWgzV0FPck91OFZ1WDRjWUJrbzZzZ01BWWE3MytHd0JvVzVR?=
 =?utf-8?B?T3BEQVFBNngzR3lKbzRTeHRGZGlqdk5IVHNsK1A0RExsTEtEVGM5RVZXeUtx?=
 =?utf-8?B?L0VjbktwY044bFFkbU1yOHY2TUkydzhUdE9rV2NiRnZMeGxWZ3FGWklQMXVN?=
 =?utf-8?B?T3g1UW5HZHFybmtnU3RjM1RHSk5RYkNwUEhyY0F4Vk9HME9MdTk0dXN6Y0ZP?=
 =?utf-8?B?emE1bUR1Vk1PSDBtUjFLNG1jYWlyR0xmZGxLQnFxa1JJM2l2ZWRqaUhOWi9l?=
 =?utf-8?B?eFBxanZKV2RWR3duc0J6UzVYb2VaMmVxUzVaRjBGSk9iREgrNDdnQVdaaUhT?=
 =?utf-8?B?MW9EOHpqQ0RnU0lEQlZDNy9tQXZTTGlOTGxHWHhydkpwaHZwZ09DSlhFeUgy?=
 =?utf-8?B?Y2llQy93VlZPNEZrcUpXYlhCc3dXNVpKMFZuOEpOcFpvT0pKSzlQTDNRWVo2?=
 =?utf-8?B?TlFWSXl0YjRrOGdjNTRsa1g5akExWGJrNzNqQ2Y0b3BWYnZ2MlYzV0VzVTZk?=
 =?utf-8?B?T25jcXUrOVhkcmQvY1BxOHZUcTZLM2RoQ3dKOWFVbVFsZ1g5andkTUp1aTRG?=
 =?utf-8?B?S0llNjl5OXZUbVBoMFNSN2lxUjAyTEdHMC9nbGVJVGJvNThJa0pob2c2ZlVS?=
 =?utf-8?B?KzZmMmtkZWI2WFZFV2ovUVArSDJORjJLTU5pWHQ1VEFXN2cxRkJGZ2sxeUFF?=
 =?utf-8?B?cGk2VlorNnRSN0tjRTZ0UHZHMGdsUkdaSUZEVmI5UVFvN0phajBHNndRWHVK?=
 =?utf-8?B?UXlZUmhQK2JTME9nbG9pRkFBRWgvNkhtV2x2dkNmQXBPSTRwZFRtUGRCY0Vx?=
 =?utf-8?B?ODRUMlJieVB6ZDFtcEsrL0hjOG0zVUNLeGFNcDBsV2p0aWJTK2pFNGMreTZ2?=
 =?utf-8?B?MkFNWGZGMjArRlM3ZDVzYVNTYmpSanladExydHV6NFpPVmxva0VVWVZBUk9Q?=
 =?utf-8?B?RXVkdjQ0QnQ1TTlLYUFWTWpYb1ZuNitrOUxoQ0taR2NWNjBBQUtnZ1h6TEg3?=
 =?utf-8?B?eElIV2w4Wm1HeEVGWWVtTEwrak40V1dYSURWcGFvSzhxdDB3YnBadVFWSTJW?=
 =?utf-8?B?VlZBYnlMMU9YaFVDYVVNRGNWeDZERHIwRUlBc25pUEFMVm9OczduSG94cVRY?=
 =?utf-8?B?eVVEZ0NEdTBKZXRmQVhqNlkySDNZdUFYSG1WanFHTWptODBKQTN1SXdIUW5E?=
 =?utf-8?B?dzFIcUw0eFB2VzdjRTNBUVowbXhVR1NsUzRib1hycFpjMjl5THFaMWtDTHh1?=
 =?utf-8?B?OUxrcEFyQzZqVDdXVWZDVGpGZEdzZlpRdjNJRHExSDVQYUl3UWFyb3Y1WWtu?=
 =?utf-8?B?amZ6dEtFMi8vdXJEQnUybVF6dDNDb1pPeGIrQ3dpNEJZN1lZa29GR1JiNjla?=
 =?utf-8?B?OFJkZG9qV1dSenFTeFN6MjIwVElneURRSFJCd0I4SFZkak1FUEl4eEdkQ3g0?=
 =?utf-8?B?ZWxKcm14bEdOS0ZWUUsxcXpIY0cyLzExS3hTNjY5WUV3QjlQSERrTEYxcFJZ?=
 =?utf-8?B?Q0VNREVFdS9ORUI4NTBObUJOeWpFNko4THJhTWZvOGFFeGpxNFB1blAzeUI2?=
 =?utf-8?B?SVpCbXVxWFZadFhlMDV2TmNZMGVrRSs1MDRseHpUTEtFZlQzVGtoU21yWXcz?=
 =?utf-8?B?a2IyY0dEM2c0VlQ4MWFNeXJQcjNVMTBzRHZtQ2d4ejMwQURBcmZJR3pieXVu?=
 =?utf-8?B?WGtwdE9LK0FRd1VmNCsxRTlrOGVtOWJ3a1g0K1hyd3RCZlRtTzJVS3MrUllw?=
 =?utf-8?B?TEkvQVpBRHNXZWViMWtIZ1FPcHVGM2swY0xtK08wK0FEZ3Z3ZkJwcUhsWm9Z?=
 =?utf-8?B?SXN4V3Buc1lOa2RVRTdudHlVVGtVZ1l1aUpibk1FUm1kdmhsdVhNRDNlZ2Zl?=
 =?utf-8?B?dXcwWVYvL05za25mNTZoOEhEcVZybjZwdlFVaXdDQVhQSDA1bWFDSGJVMndJ?=
 =?utf-8?B?SWdFNVAvNHZHOTlPTFZuMXMrRkRrVnl5N0ZaVk9pS1c1YTN2SDFKc0FobVAz?=
 =?utf-8?B?c1pJb3RTSzlpVTI2SFNFUnhVUGgzMUkvdEx2dC9DdlpNS2JINVRiUU1ZaVRs?=
 =?utf-8?B?K0JZQ3Z2dTA0Q0FQcUMvT2h4VnBwMisydFh4WGF2UHk5LzdGNnhJSnJhVVFp?=
 =?utf-8?B?Ly9zNlNvdXVlN3psaCsrR0dwZHFVZW5Kc3hORmJkTDM1Vkt3RGpOcUtOSndm?=
 =?utf-8?B?Wnc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bdf10a9-7c55-47c9-25dd-08de17af95f6
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 12:26:43.6862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qBK6F4q7qR9mtCIr0xv0SrVAlCYd/V9AX85pkS5I0ZqcCFrokAM9gX/TRa0jUX/PRBi8mBbi4y53BDsxZNrsnSlVed48T+N1Ol+Qkw7L4Nk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8653

Hi Jan,

On 30.10.25 13:23, Jan Beulich wrote:
> On 30.10.2025 00:54, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> The Cache Disable mode data is used only by VMX code, so move it from
>> common HVM structures into VMX specific structures:
>> - move "uc_lock", "is_in_uc_mode" fields from struct hvm_domain to struct
>> vmx_domain;
>> - move "cache_mode" field from struct hvm_vcpu to struct vmx_vcpu.
>>
>> Hence, the "is_in_uc_mode" field is used directly in mm/shadow/multi.c
>> _sh_propagate(), introduce the hvm_is_in_uc_mode() macro to avoid direct
>> access to this field and account for INTEL_VMX configuration.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Requested-by: Andrew ?

ok

> 
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -583,6 +583,7 @@ static int cf_check vmx_domain_initialise(struct domain *d)
>>       int rc;
>>   
>>       d->arch.ctxt_switch = &csw;
>> +    spin_lock_init(&d->arch.hvm.vmx.uc_lock);
> 
> I don't think this is the best place; in any event it wants to be separated from
> adjacent code by a blank line. I'd prefer if it was put ...
> 
>>       /*
>>        * Work around CVE-2018-12207?  The hardware domain is already permitted
> 
> ... below this CVE workaround.

ok

> 
>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
>> @@ -46,7 +46,9 @@ struct ept_data {
>>   
>>   #define _VMX_DOMAIN_PML_ENABLED    0
>>   #define VMX_DOMAIN_PML_ENABLED     (1ul << _VMX_DOMAIN_PML_ENABLED)
>> +
>>   struct vmx_domain {
>> +    spinlock_t uc_lock;
>>       mfn_t apic_access_mfn;
>>       /* VMX_DOMAIN_* */
>>       unsigned int status;
> 
> Any reason to make this the very first field of the struct? It might better
> live adjacent to the other field you move; there's going to be some padding
> anyway, afaict.

I've tried to put fields in holes and checked with pahole.

With current change it is:
struct vmx_domain {
	spinlock_t                 uc_lock;              /*     0     8 */
	mfn_t                      apic_access_mfn;      /*     8     8 */
	unsigned int               status;               /*    16     4 */
	_Bool                      exec_sp;              /*    20     1 */
	_Bool                      is_in_uc_mode;        /*    21     1 */

	/* size: 24, cachelines: 1, members: 5 */
	/* padding: 2 */
	/* last cacheline: 24 bytes */
};

It seems can be grouped like below?:
struct vmx_domain {
	mfn_t                      apic_access_mfn;      /*     0     8 */
	unsigned int               status;               /*     8     4 */
	_Bool                      exec_sp;              /*    12     1 */
	_Bool                      is_in_uc_mode;        /*    13     1 */

	/* XXX 2 bytes hole, try to pack */

	spinlock_t                 uc_lock;              /*    16     8 */

	/* size: 24, cachelines: 1, members: 5 */
	/* sum members: 22, holes: 1, sum holes: 2 */
	/* last cacheline: 24 bytes */
};

> 
>> @@ -56,6 +58,12 @@ struct vmx_domain {
>>        * around CVE-2018-12207 as appropriate.
>>        */
>>       bool exec_sp;
>> +    /*
>> +     * If one of vcpus of this domain is in no_fill_mode or
>> +     * mtrr/pat between vcpus is not the same, set is_in_uc_mode.
>> +     * Protected by uc_lock.
>> +     */
>> +    bool is_in_uc_mode;
> 
> Imo while moving, the is_ prefix could also be dropped. It doesn't convey any
> extra information on top of the in_, and I think we prefer is_*() also as
> typically function(-like) predicates. (I.e. in hvm_is_in_uc_mode() I'm fine
> with the name.)

ok

> 
>> @@ -93,6 +101,9 @@ struct pi_blocking_vcpu {
>>       spinlock_t           *lock;
>>   };
>>   
>> +#define NORMAL_CACHE_MODE          0
>> +#define NO_FILL_CACHE_MODE         2
> 
> As you necessarily touch all use sites, could we switch to the more common
> CACHE_MODE_* at this occasion? Also imo these want to live ...
> 
>> @@ -156,6 +167,9 @@ struct vmx_vcpu {
>>   
>>       uint8_t              lbr_flags;
>>   
>> +    /* Which cache mode is this VCPU in (CR0:CD/NW)? */
>> +    uint8_t              cache_mode;
> 
> ... right next to the field they belong to.

ok.

-- 
Best regards,
-grygorii


