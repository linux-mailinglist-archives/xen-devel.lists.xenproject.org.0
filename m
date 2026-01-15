Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42604D25620
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 16:34:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205361.1519664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgPMP-0005x0-UA; Thu, 15 Jan 2026 15:34:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205361.1519664; Thu, 15 Jan 2026 15:34:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgPMP-0005u8-Qb; Thu, 15 Jan 2026 15:34:09 +0000
Received: by outflank-mailman (input) for mailman id 1205361;
 Thu, 15 Jan 2026 15:34:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LSxU=7U=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vgPMO-0005fo-4E
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 15:34:08 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9eaef482-f227-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 16:34:03 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AM7PR03MB6626.eurprd03.prod.outlook.com (2603:10a6:20b:1ba::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 15:34:00 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 15:34:00 +0000
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
X-Inumbo-ID: 9eaef482-f227-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UiqsnYr7LM7Wz7k+TGeOeQihUsYmZuwKacHFwp79425zc+sUc2bQl4DVFIBNRBieLKU0L0qA8blo/iixsYUZHQUXot7zG5UmLL61A4nsfyIdzibDNJLgJAgoK+0naeJAdF0cMu/ElHqvsVjDFYbp1nYrJbnrwfEw5wDU/sB1aIKfh5Ixv/6WNyGB7K7mV6IWRS3Sg5mwL+/oV5sW6nf2YdaeyCfBVfbYXDdc6rDOppL6UKT+CX1oLI8ysb4Uab3O+lYmxWW75wk1ib2EocAV+yUm2ZGYHD1Ldy1RG3OOx6zPrqoQeQTZ6hJp16+gdgP3pOfvHYKF/A+UOqAkbiTuhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hw5If/YVWfhpalv6uyl5toGeL9XCA6J9aLeMoMbQFqQ=;
 b=Uqc6HeEZzY5V/Q1vd0DNMA6Biv0a0YKmhwyeSDylMHPITHtKutN4BRjH7bxakZz5717pjkhLycpvKEMf6QDUEPxajbN1aZ+4E/x86hMgIhc7P0D3KTDv+4R7g986Txjygkn7bZdLfko/SF+rHUMPCgERmonRinmMLoOTlC/b0sw2YoaCtdKzGVHe4DVjjcJQS4lriSYhbRi+DyK9YIMaJKPPcIBdavEtQQIcfzCmmN4iBoBpClKdV4EKT/vyyQfoJHkijPjgIKgayZpijquePPW6SC9foX3bWIOhqmnW8pTf1zOTj7sI7R0/4ZdpGV5gMFKXAkvIqzDB2EO2L4g7SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hw5If/YVWfhpalv6uyl5toGeL9XCA6J9aLeMoMbQFqQ=;
 b=QAo8d8p5ABKnjmBJQPLweB5WqPbLNu+iUS7o0c/JgqBYda3Qi2d/T0YUniODkcGUQ7ZrXPMwPRC+2fT1VOb2YwCq4EoEpGDavw4wnyf4vwDB9HX3RoQq40ztbfjS1I90yKvmOCB6J0CDKi4CE3WsizdXciDiZfTcR/aD8bgt6H/erm+FCPAJEZFvRYs5skaEG9E48eQIFUT/C1SQAt/rsFVLjpdevvxodYuxHiXrG5QOyXA2N1biaYCGNKtWOYxlA3RwrkAWJruouHrygWALEGEFBfoMd9Pnf0RBOqP40veDVNOANTt8WlKINGmGtKBZv1x7eSzjLCxq3Yu/LRat5A==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v7 3/5] lib/arm: Add I/O memory copy helpers
Thread-Topic: [PATCH v7 3/5] lib/arm: Add I/O memory copy helpers
Thread-Index: AQHchYPD+fwQGyuKXEKqeHI8xFGbqLVS9u+AgAAq8ACAADvNAA==
Date: Thu, 15 Jan 2026 15:34:00 +0000
Message-ID: <c1f9885a-3e0a-4964-acfc-95f4c86aef06@epam.com>
References: <cover.1768415200.git.oleksii_moisieiev@epam.com>
 <d166348530b9229673e1a6e3b29ff4ee9123ab2f.1768415200.git.oleksii_moisieiev@epam.com>
 <bf3e38f1-d88a-445a-b55b-a13d401dba80@suse.com>
 <8539bed5-280f-4dcc-a63d-4c0ee3b7cff7@suse.com>
In-Reply-To: <8539bed5-280f-4dcc-a63d-4c0ee3b7cff7@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AM7PR03MB6626:EE_
x-ms-office365-filtering-correlation-id: 073f46ad-fd41-41f5-4e68-08de544b817f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VkJYOE9sYnJKU2htNU5VM0JPSHM0TVJRK0xBd0UzTmRnaTQzcWYwbnpidEFu?=
 =?utf-8?B?eTNuT3BKNnhsQ2IvMnhDU2V4cGI5K2JvQ2ExZFhnRTd6aDA3NWZPdy9vZGRI?=
 =?utf-8?B?c0FtRS83Y1NXT1MvK09ldEt2dnRlbGkvUEs0RnhGc2llNmwzWWNoZ2dlVzVa?=
 =?utf-8?B?V0xGTkdPUEY5OU9GcHRNQ2RlZGgzQXkrWW5JMC9vaklGOHRtaDFLMXRyRjZ4?=
 =?utf-8?B?SlErSlQ4Q3owa3dXVEZQQWltR3YzR2M4Q1NhKzltTzI0Rjc2T1U4R1llV0Q5?=
 =?utf-8?B?Tk5HZEV6N0syZnhZOU9selhMeW1IUUpmdVkrM29iblRPSXl0dmhlc3ZGMjEr?=
 =?utf-8?B?NTNFWlpGZ2RyTUI1SlhhcHhGRE1NRUI3cVBIR3h6R3hkZnhpTllmN3pPSWpl?=
 =?utf-8?B?ZHVadmlYZmN6OXY0MnZCYzdVL0RJejhnR3IwTUR5SUhFZjMzMUVUeGJYenBF?=
 =?utf-8?B?QWpLU3hoVDJhTnBja1BFa0RHbDFDbGM4emNSRXh5RXgwZjFZaXdkQVZ6Zngw?=
 =?utf-8?B?anJ4Zk5Kd2dHT0JtNGlETmZGb3AvdXVqR2Y0aVhUWVlRS1VieFR4a09DSmtU?=
 =?utf-8?B?cWx4WG9UaDRtRWJib2czVnJaeTZZdTF5WVBtSmh3Nk93TDRoTUk1d3JzdVl6?=
 =?utf-8?B?eFZTSVFVaDR1dnc5VTUzRktROWFVbHRlY1JpL3kyTUdFMng5czk0NmlqdkxB?=
 =?utf-8?B?V0pRcGRKVG1MZFdsckppODFiVUpkMW5HVDEwN3E1Nk1QNWRxVVUya3k3Sm4y?=
 =?utf-8?B?UTZ0cjZGSVQ2L1BLMFR5TU9ML25RaWhkc1VVdlVLVzdRN1A4c1U5R0prVTlG?=
 =?utf-8?B?RysveU9pTHhweFdDQUpjOG50ZWpCSHZmN3liZ2pNeUtHUkJZSEV2UDlFWVla?=
 =?utf-8?B?cmhhS3pqT21LMWYvR0xoRXNkUHdVb21QckZ5SjdiNFJIOGcyblNZSm50TEY3?=
 =?utf-8?B?emFnVndWL25Fc3V6NkxVNDRaazQ1VnZpRkpiS21jQ1B1R0Y3T0V1SndnODBC?=
 =?utf-8?B?YXNnSXo0b0txd2ROa0VLM2dwUlV0THBpNlY1YzBjNDBuZU1taFI5ck1xbElR?=
 =?utf-8?B?Nk5FNDVmQ3BHM0VTMXMvcWNGbmlTM2FqL3hXK0dpMHZsRFBGZXB1a2NXSG4r?=
 =?utf-8?B?N1UxQS90QXM1cy9JNjBNSlVNWWh1VXRVV1pteGtMSmhGSXc4OFVGTm02OFFS?=
 =?utf-8?B?OGZrN0djYnE4OEtELyt4YUNDVWxVSUlFS1J2SHhsalFMMUdBN3Y2MjBSSGQx?=
 =?utf-8?B?Rm9lN0E0ZHl0NDc4RGdNRmh2YW9yTzBQeTZBa1NTRE91VitZN25jZDlsWVlF?=
 =?utf-8?B?RmNrcjUyeHlUTHczRzlUdC9WYm9WbmpLSmc0ZzJIQ21GRm9SVTZQZ0o5eVQy?=
 =?utf-8?B?RU0wcCt4bnNCazhuNm1Hbk9NZTJxL0E4c2tKTnRIQnVsQmRMWTdkN3BRNWZB?=
 =?utf-8?B?eFo3MHZEdUV6elkzL0VJQ2M5WlRZZ2NYN1J4cWtiS1hFanVFVW4zOE5tZW91?=
 =?utf-8?B?dy9Xa1BVblYyUytIOC9adEhFUXVkT001WWJRZkhTUjVISitTMTVtVEtNbWJk?=
 =?utf-8?B?TGJpOXZRRGl5T1hnSkNHQ0ZQc0srWEJ6cWpzZ0JWK3lzdGRhRzZvdWx4NXlP?=
 =?utf-8?B?LzhvTTB2cFZ1UHpaT3VsU3FkaGQxRnFja3Y0cGVTei93K1BYWmZWZ2lkNmtX?=
 =?utf-8?B?WXdiTy8rOXNsY3IwWDFHRFQ3dHBGdmZMeExmeGFUaFFBcFR6Vy9vRmF4VFdH?=
 =?utf-8?B?MVJ0ZnpyaUF2WHlvOUVUdm9KbXA1RmRXSVpLU1FqNzVjeUE1T09UcEwrMGQy?=
 =?utf-8?B?OE5tdlk0MVpRT3pkc3FxdTZTRDF4bFQ1S1A0b1FWbzBqQUV1THdWN3RhUk9L?=
 =?utf-8?B?aGo5NzkranlUSmhVOXA0djB2TFY1aFZ0czEzelNoeEFxdWs2akFwcVlMSml5?=
 =?utf-8?B?TXI1WXJERmlLOEVCUkZ2OERzYWsxR1FwQ0s1UDl6Sy9BSmdKTWpJZm9QYkh6?=
 =?utf-8?B?eFhwbjJ6dUFraFVLU3IyY1ZQWXlCb21SaUp5alNmOTBkdWtvVDVZOWdYQS9u?=
 =?utf-8?B?SWYvK2hSRGtyang2MDhCc2ovWnIzZm1ESGJQQlhSOGZBRTJJb2JON2Z0Qm1v?=
 =?utf-8?B?WXJhSnpvL0NWeWQvQUhNK3I1Uk55ME9NbENzTk9EbTVvRmh6alJkdC9BQ3dk?=
 =?utf-8?Q?rLplIKVlM8JkGnP450XPMMc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Yy9naGh2ZUlYYmhFcDJ5OXRocVRaTVV1UFRDeFdrM0sxWmVieEp6T3dWNi85?=
 =?utf-8?B?QkRQb2dHNWRRdGw4V1dLK2hMZXp4a0QzOUNLTGYyZzdUSWh0OEV5S2k2U2tG?=
 =?utf-8?B?UmllMGNDUmdxbnlwYnVyZ2JPOXV1bkFsL3lIdkZGdSt5M1pEYlQ1eFBxektr?=
 =?utf-8?B?TmJvelFDSmV3VzBLdWhDUlJsNDl0NTBVdzRrM1FOMEFVUkNKQWYvTmx1M3VO?=
 =?utf-8?B?UUdBbDB6ekh3Vk9yUlJtQTNnSkRteUxXNGZrQXlTUkowT0JJTFF1T2FBdFRy?=
 =?utf-8?B?OFJTUXNZMUNCdXdUL2oyZldQQUhLNXFQTmNFM2xDdUh1endieUJFN2svYzRD?=
 =?utf-8?B?RkFsVkFzdWdiZHkyZk1HeG9Oek4rUVpoa2xldVpBelNsYVZmVVFoM2Q2djhj?=
 =?utf-8?B?Q0lJOW1JTFU5c3BjZUFvQzllM1BqNGx5MHU0cjZQS3BqTHpvQURFR2dSR3lv?=
 =?utf-8?B?V0dwaUZVc0Jkamkrc2hRSUNjaC9pM1pta0R1SVdnekdVZVNmNnZXaEJsajNu?=
 =?utf-8?B?UW9XSmdWZUhtdlBCRmtxdzh3bmhhTm1pbTV1T2RZY2FDMDNtVTZQanAzWFVY?=
 =?utf-8?B?T3Z6Nk5FTmVRcVZIUjlBSGVhM2hkd1JvQUxPUXV3OEpjdHcrdHVpT21JVk56?=
 =?utf-8?B?amZJTlRQVzFiY0RZam0vYjVpTU1SVEJHV3RVUGp5WGxoeGlOdFZFMjlVaGJX?=
 =?utf-8?B?SUhHY0JpRWY2ZWRzT3hSc2hUbTd1Zlk0dUVrV0s2cGE3aTQxSzQrUG5HUTV0?=
 =?utf-8?B?bGlOMmk1bk5HZXhIWTE1VWRMbS9NdXZZSEhBekEyR090RWlKd1JuZVFnMjBM?=
 =?utf-8?B?TWpSdW43WThOamo2TUMwY1BpZWxZRkRIWlFmMng1ZDlqODdvQnVaMjIwNzQ2?=
 =?utf-8?B?ZUk4MGtNRDUyUE9VK2lRN2tWLzRmenFjZzdSTG5BaWcrU0Q3WVgwWDV6Yjg3?=
 =?utf-8?B?Ynk1WVNiekkrODQ1T1ZrZmd6QnloK2hRN052UEpHNEl0K0dCZkQ0Rzc5dnR1?=
 =?utf-8?B?RVYva2U0bno3ekhHZWZybnRiY1BQZ0s3b1p3emRWRWRXVTlVellrWTdiSWZy?=
 =?utf-8?B?WFg4ci9ZT1BVMzNlMzFpUHpoVkkvVWZTdUF4bFlWZUdJTDZFRURsY0F2MVNu?=
 =?utf-8?B?SGNkcHhtNzdqb04zUHlXSVJwdHRBVHlTd2ZnblV3MzRVRFc5UnBpTjliV2VM?=
 =?utf-8?B?UXJpZG1CeEJXRW1OR3I1aU0rSEhMTmgxQ1hJVk1TYi9FYlk5K2dLQkxQaUxY?=
 =?utf-8?B?Q3YrNjltZldtMmh5S2ZzVk5PMW1iU05rdDRaeGsraURPYi8xeXVjMGt3S3Ji?=
 =?utf-8?B?Nk9iM3NPaDBVb25YTjFoWkhvQXcxNEE1Vmd2elE5M0hZQzRBZmNFUENHeEta?=
 =?utf-8?B?MW1hTjZNL1VKanRGT2VjTGM3OGN3M08wQlgvZndiM2xsUXBLT2pQTExmeTRX?=
 =?utf-8?B?eFRNbHdPeW9hK3ZGNzFpeE5YTmlVTVZwRUZyWlVPdHAybVZiNnhGQ3pCbmUw?=
 =?utf-8?B?SDlINlc4ZGxVQVdLLzdhb0djZENsQ3VxNkxib2RmNWNha2RnUXlaR3lOQUNO?=
 =?utf-8?B?ZnJXWUovbTNOak5FbWh2MEI2ZnNKdG14V1FnOXlpRjR2TEltRHZKejM4eTNV?=
 =?utf-8?B?bVJMTXZIZ0JJbFNHbmh4M1IvZTYzdHRWMlYrc01ybEhhYWZZMy9aSERuOEdq?=
 =?utf-8?B?ZkYrVDQvNDJ1LzNOQ3N4ZUplQTF3cVhOZUlLbDdqQTU5RGhoa2RSbllDQ1Jj?=
 =?utf-8?B?RTJpQnl6Lzl6RWxuMzZ0OTBJVlQ1Yzh3cVhBMDE3ZldDak1jMjZIMmt2bnli?=
 =?utf-8?B?bmlITlNCUXg2ZTkxU0tNeDZSU0wwYXU4MlkrTm95Z25CZmtUcHh0ejlEblJw?=
 =?utf-8?B?NkJFQ0wza3F6MHBWL05lb0JZRE40MUxCMEQzaEFYRmI5Ky9pWFJ5S1lSTFkv?=
 =?utf-8?B?U1F4b1ZmZFBnYU1aUWtRdkkzMmlMSnMzeXpwVXJDS1FOeUJIcTlEa3JsMEo5?=
 =?utf-8?B?YWJ6MTBTT08vcHdQVk9RMU9Wc2wxVktYTXU5ckhiQzRNeFpoQUdMQ2VaSldq?=
 =?utf-8?B?MHI4Q1dONTlWR0c3TUdTMmtYaU51b2N5NG01MExtTldKc3djQW1OclllWFBG?=
 =?utf-8?B?OHJPbHdPQWcxSTJXRE9nU2ZHM2twL3RlU0Nzc3JyR2l2QUVaRGhVS0pBMWdN?=
 =?utf-8?B?OUZVM3g2bUFwanhGY2MrdlM1dUNlZFE3Z2RGQ3JYVVpDTEhQQm10YmVVNXFZ?=
 =?utf-8?B?VFhwTkFUNWdBRDdOVFpsMFhpcTkvTHR4a2ZQT3dQc3g4M3ZBZlV0VnE0bTFt?=
 =?utf-8?B?LzZZZmdvdGhBR0p1QjVVWDBFK2ZLYXl0dlJkNDIrcGZCRVFNYm1KVmhEZnN4?=
 =?utf-8?Q?bpeHRbif/T+f/kq8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4CC4432D7DC99F4693E194887FED4349@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 073f46ad-fd41-41f5-4e68-08de544b817f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2026 15:34:00.4666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sc2ei9+4A9TRHgMjdF4/mTlCXa1QSmJTjuw5mvNsiym41QXQv8eJd3FPQJ+Rf4c28i8d4aTIPhyXetnlF6A5YTLqltDp+ihVdxcLia2Snek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6626

DQoNCk9uIDE1LzAxLzIwMjYgMTM6NTksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNS4wMS4y
MDI2IDEwOjI2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDE0LjAxLjIwMjYgMTk6MjksIE9s
ZWtzaWkgTW9pc2llaWV2IHdyb3RlOg0KPj4+IC0tLSAvZGV2L251bGwNCj4+PiArKysgYi94ZW4v
bGliL2FybS9tZW1jcHlfZnJvbWlvLmMNCj4+PiBAQCAtMCwwICsxLDQ4IEBADQo+Pj4gKy8qIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgKi8NCj4+PiArI2luY2x1ZGUgPGFz
bS9pby5oPg0KPj4+ICsjaW5jbHVkZSA8eGVuL2xpYi9pby5oPg0KPj4+ICsNCj4+PiArLyoNCj4+
PiArICogVXNlIDMyLWJpdCByYXcgSU8gb3BlcmF0aW9ucyBmb3IgcG9ydGFiaWxpdHkgYWNyb3Nz
IEFSTTMyL0FSTTY0IHdoZXJlDQo+Pj4gKyAqIDY0LWJpdCBhY2Nlc3NvcnMgbWF5IG5vdCBiZSBh
dG9taWMgYW5kIHNvbWUgZGV2aWNlcyBvbmx5IHN1cHBvcnQgMzItYml0DQo+Pj4gKyAqIGFsaWdu
ZWQgYWNjZXNzZXMuDQo+Pj4gKyAqLw0KPj4+ICsNCj4+PiArdm9pZCBtZW1jcHlfZnJvbWlvKHZv
aWQgKnRvLCBjb25zdCB2b2xhdGlsZSB2b2lkIF9faW9tZW0gKmZyb20sDQo+Pj4gKwkJICAgc2l6
ZV90IGNvdW50KQ0KPj4+ICt7DQo+Pj4gKwl3aGlsZSAoIGNvdW50ICYmICghSVNfQUxJR05FRCgo
dW5zaWduZWQgbG9uZylmcm9tLCA0KSB8fA0KPj4+ICsJCQkgICFJU19BTElHTkVEKCh1bnNpZ25l
ZCBsb25nKXRvLCA0KSkgKQ0KPj4gTml0OiBYZW4gc3R5bGUgaW5kZW50YXRpb24gKG5vIGhhcmQg
dGFicykgcGxlYXNlIHRocm91Z2hvdXQuDQo+Pg0KPj4+ICsJew0KPj4+ICsJCSoodWludDhfdCAq
KXRvID0gX19yYXdfcmVhZGIoZnJvbSk7DQo+Pj4gKwkJZnJvbSsrOw0KPj4+ICsJCXRvKys7DQo+
Pj4gKwkJY291bnQtLTsNCj4+PiArCX0NCj4+PiArDQo+Pj4gKwl3aGlsZSAoIGNvdW50ID49IDQg
KQ0KPj4+ICsJew0KPj4+ICsJCSoodWludDMyX3QgKil0byA9IF9fcmF3X3JlYWRsKGZyb20pOw0K
Pj4+ICsJCWZyb20gKz0gNDsNCj4+PiArCQl0byArPSA0Ow0KPj4+ICsJCWNvdW50IC09IDQ7DQo+
Pj4gKwl9DQo+Pj4gKw0KPj4+ICsJd2hpbGUgKCBjb3VudCApDQo+Pj4gKwl7DQo+Pj4gKwkJKih1
aW50OF90ICopdG8gPSBfX3Jhd19yZWFkYihmcm9tKTsNCj4+PiArCQlmcm9tKys7DQo+Pj4gKwkJ
dG8rKzsNCj4+PiArCQljb3VudC0tOw0KPj4+ICsJfQ0KPj4+ICt9DQo+PiBCYXJyaWVyIHJlcXVp
cmVtZW50cyBvbiBBcm0gYXJlbid0IHF1aXRlIGNsZWFyIHRvIG1lIGhlcmU6IElzIGl0IHJlYWxs
eSBjb3JyZWN0DQo+PiB0byB1c2UgX19yYXdfcmVhZHtiLHcsbH0oKSBoZXJlLCByYXRoZXIgdGhh
biByZWFke2IsdyxsfSgpPyBJZiBpdCB3YXMsIHdvdWxkbid0DQo+PiBhIGJhcnJpZXIgdGhlbiBi
ZSBuZWVkZWQgYXQgdGhlIGVuZCBvZiB0aGUgZnVuY3Rpb24/DQo+IFRoaW5raW5nIGFib3V0IGl0
LCBhcyB0aGUgb3JkZXIgb2YgTU1JTyBhY2Nlc3NlcyBuZWVkcyB0byBiZSBndWFyYW50ZWVkDQo+
ICh1bmxlc3MgeW91IGhhdmUgZXh0cmEgaW5mb3JtYXRpb24gYWJvdXQgdGhlIGFyZWEncyBwcm9w
ZXJ0aWVzLCBsaWtlIGl0DQo+IGJlaW5nIGEgdmlkZW8gZnJhbWUgYnVmZmVyKSwgSSdtIHByZXR0
eSBzdXJlIG5vdyB0aGF0IHJlYWR7Yix3LGx9KCkgbmVlZHMNCj4gdXNpbmcgaGVyZS4gSW4gZmFj
dCB0aGUgY29tbWVudCBpbiB0aGUgaGVhZGVyIHNheXMgdGhhdCBpdCB3b3VsZCBoYW5kbGUNCj4g
Ik1lbW9yeSBvcmRlcmluZyBhbmQgYmFycmllcnMiIHdoZW4gaXQgZG9lc24ndCBsb29rIGFzIGlm
IGl0IGRpZC4NCj4NCj4gTm90ZSBob3cgTGludXggbG9va3MgdG8gaGF2ZSBncm93biBtdWx0aXBs
ZSBmbGF2b3JzOiBCZXNpZGVzDQo+IG1lbWNweV9mcm9taW8oKSBJIGNhbiBhbHNvIHNwb3QgYXQg
bGVhc3QgZmJfbWVtY3B5X2Zyb21pbygpIGFuZA0KPiBzZGlvX21lbWNweV9mcm9taW8oKS4NCj4N
Cj4+IEFuZCB0aGVuLCBpZiBpdCB3YXMgcmVhZHtiLHcsbH0oKSB0aGF0IGlzIHRvIGJlIHVzZWQg
aGVyZSwgd2hhdCBhYm91dCBhbGwgb2YNCj4+IHRoaXMgd291bGQgdGhlbiBzdGlsbCBiZSBBcm0t
c3BlY2lmaWM/IEhtbSwgSSBndWVzcyB0aGUgSVNfQUxJR05FRCgpIG9uICJ0byIgaXMsDQo+PiBi
dXQgdGhhdCdzIEFybTMyLXNwZWNpZmljLCB3aXRoIEFybTY0IG5vdCBuZWVkaW5nIGl0PyBQbHVz
IHRoZW4gaXQncyBhZ2FpbiBub3QNCj4+IGV4YWN0bHkgQXJtLXNwZWNpZmljLCBidXQgc3BlY2lm
aWMgdG8gYWxsIGFyY2hpdGVjdHVyZXMgd2hlcmUgbWlzYWxpZ25lZA0KPj4gYWNjZXNzZXMgbWF5
IGZhdWx0Lg0KPiBUaGVyZSdzIGEgYmlnZ2VyIGlzc3VlIGhlcmUsIHdpdGggYWNjZXNzIGdyYW51
bGFyaXR5IChkZXNwaXRlIHRoZSBoZWFkZXINCj4gY2xhaW1pbmcgIkltcGxlbWVudCBhbGlnbm1l
bnQgaGFuZGxpbmcgZm9yIGRldmljZXMgcmVxdWlyaW5nIHNwZWNpZmljDQo+IGFjY2VzcyBzaXpl
cyIpLiBNTUlPIGNhbiBiZWhhdmUgaW4gaW50ZXJlc3Rpbmcgd2F5cy4gVGhlIGhlYWRlciBjb21t
ZW50DQo+IHNheXMgbm90aGluZyBhcyB0byByZXN0cmljdGlvbnMsIGkuZS4gd2hlbiB0aGVzZSBm
dW5jdGlvbnMgbWF5IG5vdCBiZQ0KPiB1c2VkLiBZZXQgY29uc2lkZXIgYSBkZXZpY2UgcmVnaXN0
ZXJzIG9mIHdoaWNoIG11c3QgYmUgYWNjZXNzZWQgaW4gMzItYml0DQo+IGNodW5rcy4gQXMgbG9u
ZyBhcyB0aGUgb3RoZXIgcG9pbnRlciBpcyBzdWl0YWJseSBhbGlnbmVkLCBhbGwgd291bGQgYmUN
Cj4gZmluZS4gQnV0IHlvdSBoYW5kbGUgdGhlIGNhc2Ugd2hlcmUgaXQgaXNuJ3QsIGFuZCBoZW5j
ZSB0aGF0IGNhc2UgdGhlbg0KPiBhbHNvIG5lZWRzIHRvIGZ1bmN0aW9uIGNvcnJlY3RseS4gQXQg
dGhlIHNhbWUgdGltZSBhY2Nlc3NlcyB0byBhIGRldmljZXMNCj4gcmVxdWlyaW5nIDE2LSBvciA2
NGJpdCBncmFudWxhcml0eSB3b3VsZG4ndCB3b3JrIGF0IGFsbCwgd2hpY2ggZm9yDQo+IHJlcXVp
cmVkIDgtYml0IGdyYW51bGFyaXR5IGl0IHdvdWxkIGFnYWluIG9ubHkgd29yayBwYXJ0bHkuDQo+
DQo+IEhvdyBtdWNoIG9mIHRoZSBhYm92ZSByZXF1aXJlcyBjb2RlIGFkanVzdG1lbnRzIGFuZCBo
b3cgbXVjaCBzaG91bGQgYmUNCj4gZGVhbHQgd2l0aCBieSB1cGRhdGluZyBjb21tZW50YXJ5IEkg
ZG9uJ3Qga25vdywgYXMgSSBrbm93IG5vdGhpbmcgYWJvdXQNCj4geW91ciBwYXJ0aWN1bGFyIHVz
ZSBjYXNlLCBub3IgYWJvdXQgcG9zc2libGUgZnV0dXJlIG9uZXMuDQo+DQo+IEFsc28gbm90ZSB0
aGF0IHRoZSBoZWFkZXIgY29tbWVudCBzdGlsbCByZWZlcmVuY2VzIHRoZSAuLi5fcmVsYXhlZCgp
DQo+IGZ1bmN0aW9ucywgd2hlbiB0aGVuIGltcGxlbWVudGF0aW9uIGRvZXNuJ3QgdXNlIHRob3Nl
IGFueW1vcmUuDQo+DQo+IEphbg0KSGkgSmFuLA0KDQpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5
b3VyIHZhbHVhYmxlIGlucHV0IGFuZCBpbnZvbHZlbWVudC4NCg0KQWZ0ZXIgZnVydGhlciByZXNl
YXJjaCBhbmQgcmVjb25zaWRlcmluZyBhbGwgdGhlIHBvaW50cyB5b3UgcmFpc2VkLCBJIA0KaGF2
ZSBkZWNpZGVkDQp0byBzd2l0Y2ggdG8gdXNpbmcgdGhlIG9yZGVyZWQgTU1JTyBhY2Nlc3NvcnMg
KHJlYWRiL3JlYWRsIGFuZCANCndyaXRlYi93cml0ZWwpLg0KDQpIZXJlIGlzIG15IHJlYXNvbmlu
ZzoNCg0KVGhlIGNvbmNlcm4geW91IG1lbnRpb25lZCB3YXMgdmFsaWQ6IHRoZSB1c2Ugb2YgX19y
YXdfcmVhZCovX19yYXdfd3JpdGUqIA0KaW4gdGhlDQpoZWxwZXJzIGRpZCBub3QgcHJvdmlkZSB0
aGUgb3JkZXJpbmcgZ3VhcmFudGVlcyBleHBlY3RlZCBmb3IgTU1JTyANCmNvcGllcywgYW5kIHRo
ZQ0KaGVhZGVyIHN0aWxsIHJlZmVyZW5jZWQgKl9yZWxheGVkLCBldmVuIHRob3VnaCB0aGUgaW1w
bGVtZW50YXRpb24gbm8gDQpsb25nZXIgdXNlZA0KdGhlbS4gVGhpcyBjb3VsZCBhbGxvdyByZW9y
ZGVyaW5nIGFyb3VuZCB0aGUgY29weSBhbmQgbWlzcmVwcmVzZW50IHRoZSANCmludGVuZGVkDQpz
ZW1hbnRpY3MuDQoNCkEgZmV3IGFkZGl0aW9uYWwgdGhvdWdodHMgcmVnYXJkaW5nIHlvdXIgb3Ro
ZXIgcXVlc3Rpb25zOg0KDQpJcyBpdCBzdGlsbCBBcm0tc3BlY2lmaWM/DQpGdW5jdGlvbmFsbHks
IHRoZSBsb2dpYyBjb3VsZCB3b3JrIG9uIGFueSBhcmNoaXRlY3R1cmUgdGhhdCBzdXBwb3J0cyAN
CjgvMzItYml0IE1NSU8NCmFjY2Vzc2VzIGFuZCB1c2VzIHRoZSBzYW1lIGFjY2Vzc29yIHNlbWFu
dGljcy4gSG93ZXZlciwgdGhpcyBpbXBsZW1lbnRhdGlvbg0KcmVsaWVzIG9uIEFybeKAmXMgcmVh
ZCovd3JpdGUqIG9yZGVyaW5nIGd1YXJhbnRlZXMsIGFzIHdlbGwgYXMgdGhlIA0KQXJtLXNwZWNp
ZmljDQpJU19BTElHTkVEIGNoZWNrIHRvIGF2b2lkIG1pc2FsaWduZWQgZmF1bHRzLiBUaGVyZWZv
cmUsIGl0IHJlbWFpbnMgDQpBcm0tc3BlY2lmaWMNCmFzIHdyaXR0ZW47IG90aGVyIGFyY2hpdGVj
dHVyZXMgd291bGQgbmVlZCB0aGVpciBvd24gaW1wbGVtZW50YXRpb25zIGlmIHRoZXkNCmhhdmUg
ZGlmZmVyZW50IGFsaWdubWVudCBvciBncmFudWxhcml0eSByZXF1aXJlbWVudHMuDQoNCk9yZGVy
ZWQgYWNjZXNzb3JzIHZzLiByYXcgYWNjZXNzb3JzICsgdHJhaWxpbmcgYmFycmllcjoNCkkgY2hv
c2UgdG8gdXNlIG9yZGVyZWQgYWNjZXNzb3JzIGluc3RlYWQgb2YgcmF3IGFjY2Vzc29ycyB3aXRo
IGEgDQp0cmFpbGluZyBiYXJyaWVyDQpiZWNhdXNlIHJlYWRiL3JlYWRsIGFuZCB3cml0ZWIvd3Jp
dGVsIGFscmVhZHkgcHJvdmlkZSB0aGUgcmVxdWlyZWQgDQpkZXZpY2Ugb3JkZXJpbmcNCmFuZCBi
YXJyaWVyIHNlbWFudGljcywgbWFraW5nIGFuIGFkZGl0aW9uYWwgYmFycmllciB1bm5lY2Vzc2Fy
eSBhbmQgDQpzb2x2aW5nIHBvdGVudGlhbA0Kb3JkZXJpbmcgaXNzdWVzLg0KDQpVc2UgZm9yIHJl
Z2lzdGVyIGFjY2VzczoNClRoZXNlIGhlbHBlcnMgYXJlIHN1aXRhYmxlIGZvciBNTUlPIGJ1ZmZl
cnMsIHNoYXJlZCBtZW1vcnksIGFuZCANCnJlZ2lzdGVycyB0aGF0DQp0b2xlcmF0ZSA4LS8zMi1i
aXQgYWNjZXNzZXMuIFRoZXkgYXJlIG5vdCBhcHByb3ByaWF0ZSBmb3IgcmVnaXN0ZXJzIHRoYXQN
CnJlcXVpcmUgMTYtIG9yIDY0LWJpdCBhY2Nlc3Nlcywgb3Igd2hlcmUgc2lkZSBlZmZlY3RzIGRl
cGVuZCBvbiB0aGUgZXhhY3QNCmFjY2VzcyB3aWR0aC4gSSdsbCB1cGRhdGUgdGhlIGhlYWRlciB0
byBkb2N1bWVudCB0aGlzIGxpbWl0YXRpb247IA0KZHJpdmVycyBuZWVkaW5nIHN0cmljdA0KcmVn
aXN0ZXIgc2VtYW50aWNzIHNob3VsZCBjb250aW51ZSB0byB1c2UgcmVhZGwvd3JpdGVsDQoob3Ig
cmVhZHcvd3JpdGV3L3JlYWRxL3dyaXRlcSkgZGlyZWN0bHksIHJhdGhlciB0aGFuIG1lbWNweV8q
aW8oKS4NCg0KU3VtbWFyeToNCg0KSSBoYXZlIG1hZGUgdGhlIGZvbGxvd2luZyBjaGFuZ2VzIHRv
IHRoZSBoZWxwZXIgZnVuY3Rpb25zOg0KDQotIHN3aXRjaGVkIHRvIG9yZGVyZWQgYWNjZXNzb3Jz
IHRvIGFkZHJlc3MgdGhlIG9yZGVyaW5nIGFuZCBiYXJyaWVyIA0KY29uY2VybnMuDQotIHVwZGF0
ZWQgdGhlIGRvY3VtZW50YXRpb24gdG8gbWF0Y2ggdGhlIGltcGxlbWVudGF0aW9uIGFuZCBleHBs
aWNpdGx5IHN0YXRlDQp0aGUgc3VwcG9ydGVkIGFjY2VzcyBzaXplcyBhbmQgZ3JhbnVsYXJpdHku
DQoNCklmIHRoaXMgYXBwcm9hY2ggc291bmRzIGdvb2QgdG8geW91LCBJIHdpbGwgcHJvY2VlZCB3
aXRoIHRoZSBmaXggYW5kIA0Kc3VibWl0IGEgbmV3IHZlcnNpb24uDQoNCkJlc3QgcmVnYXJkcywN
Ck9sZWtzaWkNCg0K

