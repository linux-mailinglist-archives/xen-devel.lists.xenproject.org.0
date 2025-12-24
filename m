Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 997FFCDD1DB
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 23:32:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193226.1512168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYXOL-0004jM-2I; Wed, 24 Dec 2025 22:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193226.1512168; Wed, 24 Dec 2025 22:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYXOK-0004gl-VK; Wed, 24 Dec 2025 22:31:36 +0000
Received: by outflank-mailman (input) for mailman id 1193226;
 Wed, 24 Dec 2025 22:31:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e2J/=66=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vYXOJ-0004gf-4h
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 22:31:35 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c6d374c-e118-11f0-b15c-2bf370ae4941;
 Wed, 24 Dec 2025 23:31:33 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB6480.namprd03.prod.outlook.com (2603:10b6:510:b0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 22:31:29 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 22:31:28 +0000
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
X-Inumbo-ID: 4c6d374c-e118-11f0-b15c-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QW7dXOLjF9ANr/B+dJ93CWI9Vvu6NLinurl3W6A/n/yI25w77/KSU5DLOq4fUf7f4+bVgwmTDwrOCpbzC9T+1/Rdph+bUk/Au+wnUQzuGcdzxdJbATBvwXo+xGJmZCMHJAS6H+Bnhd1ji68eJFdrgVM1o6vDHascqzpVyu4hwj4V2fKsiK3XnYRYj3M71O2SrYtcAofyFT/W7efON5nOCx/T2VPHnh0RVejMzw9YiYJZYorr+G4d90Rn+ldXRzy00M6khjRwydKNZofqxLruGPJTHitLYSYqVddMvGdW4QaqrHjPYNGbRRNkg/oFjyzIIK3GhFTeDMfE8KgpPtWKCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DkZW9ANeNkDRudJ8QD3cLuqVFYFjj1HgGXb3KTV1as=;
 b=XPSqMRH+tF9MoMHlMwie8OGjJUYe5nM9TvgXrRczXJcm2l1Dul3BVkCDOzD6TsdoyqPdS7CxN6weLvjvtNvaMyenY1B2Ohn5cPPLQoibsTlIV+yWjaPts/mZMB2TsDq2/p5oBuwVr8JxON6xIKNDCp2Rgz9KixpCTFbMGe9mC1KNTVwvq4FvlzH0FO2Ju7MZR4uvsG5uo8/d1DQxyZPNY/BgNq7805+TTgd4FIRbbEwmYOeyN/RtExIXbRiFP96gRo0/4Jqnscv2alHN7IVrhStZf1TkgCarZHML4eVSMp3AgiZ/enQAsv7L4uONNJFL+IeJBt4eZWAnRY4/YojMVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DkZW9ANeNkDRudJ8QD3cLuqVFYFjj1HgGXb3KTV1as=;
 b=l55Nt5tB6qgQpU/AvfNiuDk9npcMJbdvUczxm7m1NUiOOsy1/Nh0BOHhrPpobwMVzOKOLmj3lv2YXRVtWy7VMSKCsXJFSmgdRt5N7WvQFVuTatHYoy75pD7dzr9npE+T7vHdIy2tWSGxPzEb/3+V07qFASXFiccVNlneSw/pSGM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bf6a97ed-2daf-4057-a283-cfe820954c71@citrix.com>
Date: Wed, 24 Dec 2025 22:31:25 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/2] xen/mm: move adjustment of claimed pages counters
 on allocation
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20251224194035.60173-1-roger.pau@citrix.com>
 <20251224194035.60173-2-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251224194035.60173-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0655.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB6480:EE_
X-MS-Office365-Filtering-Correlation-Id: 620e5a86-90d2-4419-b193-08de433c2e51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ekJ6QXdnd3Y1Vjd2RkVsVHJCQlZKclhBajRjTDRRYWdPUUlVckxNSmUvckdq?=
 =?utf-8?B?M2c1UXc1YjFobWs5UVdMcjc5cGhCMExQK0VueDFMNU85a2lqUHJyRk5jRU5C?=
 =?utf-8?B?Uk1lWUIrQjZtZE9qbFdXb0Nhek5Say9GazBDZ1UyRjhtQ1NEWVBoeHEvZFZj?=
 =?utf-8?B?aFJrMmRVV3E2d0VwMXRzelRocVI5emlVUGc4dGZLZmppeTBDUVhybmFhVlRM?=
 =?utf-8?B?Smo0bEhaaUVqSlY3WHl0REVkY3F4QWcyazcwcUdUR2lhVXRISVR4NVVDV29N?=
 =?utf-8?B?K0xFRUxKZVVRakl5MDU2RHNudU1UUTRqQzVzZDFCdVAraEZiLy9HeXRVN1pS?=
 =?utf-8?B?YXp5ZkRnUzMvSFZDWm1COUNSSzB5dVFZOWFjYzV3OThmK2xYTlo0RWtGRzdq?=
 =?utf-8?B?aGlzcURaeUdpOXMzcXhoZlVBdzJFU0llRS9wbFh3VTVqTU13OEQvRVJYMXRj?=
 =?utf-8?B?QnFUUnMvSm9PUmJ4VFBjWUNmYjRkTm5mdmNqRWdKcU1LaFZnODdCZk5TS3JZ?=
 =?utf-8?B?VUFiV2I5VzlQRkNTNjBLa25RR0dlT1BEalpmN1RvZzZvNlMycHRkcWk5MUZP?=
 =?utf-8?B?UlJLMEk3OFVybU1ONEUyTnNXR2VNTHE2c0F3QmVIOE9hR2oyektCLzhUT0Jt?=
 =?utf-8?B?NmFoSXU5VDlqajRENlYxOXJMeUR1MjdxMnJDWVFHWkcrd3ZUY2N0aXRCdWZi?=
 =?utf-8?B?bkcrYjVQUFRyelZ5M2dKV3ZpbmNnK3FwQlRWSzBxeHBia0V5YjdZeDNtZzlM?=
 =?utf-8?B?MXhWQVFjQmF0dU5BdmZyanlURnZwV1BzUnlHS05QRlFlQWM4djJuMUtVVnNH?=
 =?utf-8?B?ZTFjNnBuNGF6cWdwazcyV2xMSXFmRWU3T2IrcE5XOHh6ZTI2VFBRbTVJSnZr?=
 =?utf-8?B?VW5xeXVxY1FQS1gzU1B5aGJZSHhid2ZmdzRaNkZSUlEwcFc0THl4SzdGOFli?=
 =?utf-8?B?eHNtbTZhWFgwdStZRWJkbE5jK3htanRwQWFaWlBYdU41WWdSVTFMbFpqby9L?=
 =?utf-8?B?NFFhckxpK2tIdjYvZU5iaEpxS3RWVitucFdzNlVCZ3E1SzBLRjlaYWdabU1u?=
 =?utf-8?B?djk2d3NnMlpwVWl3eUVHQVJVYU1PUzhBd3FYblV1bGF3QTlWaU5GcUFFcXhW?=
 =?utf-8?B?VWlSZFhQZHZtcmMvVE16dXUyUDMvWTNtQlllVndMZTJxRm5GbHJXOTZXOXEv?=
 =?utf-8?B?MHp5bDZLS0ZUTHBRakg1TkNXNWNqdFZOb1FveHpPV0JlNnAvL1d5WXRyVisx?=
 =?utf-8?B?YWtTdkRrMkJwRzJJTllTVTlsL3hyYXc0OXNSR0FDTURTbmE0NFFUTTE4dzNs?=
 =?utf-8?B?ZHg5MHh5aGVnZW00VktJbmg4QVhRdXRLYlpZdG1HRXRtajdBeUdDMGxpY2FS?=
 =?utf-8?B?NUIrVmhKY0pzNXN4ZE5JNWY0RVdKNGlUNVV2T05iY21ySVFhQzZUYUVVbnFV?=
 =?utf-8?B?TjIxb1RMaHBrc1pOb1ZubmlyZGZwclhLK0x1S0FSTHZCWXVESzNIUDBNRklD?=
 =?utf-8?B?RlFsL29oTXdqUHJGTVB5dEJER3NtMXZNRDd6aG4rQkc3MkVSekw2QTczQkRv?=
 =?utf-8?B?N2hGV1UrZlY1WFZuZS9yNmx2V29zT2krK05rYTlWYmZ4aFZ3YXB6MnAzSDhG?=
 =?utf-8?B?MFNDVytsWkRkU1JjR0YvVUp6N08xWXZ3aTc0ak5Zd0hUOExHVVkyd0ppZ1gv?=
 =?utf-8?B?Rm1QbGZ1blJjOHhweHphRElDVjRJOEQwRlk0aFNRN2lLY1hpSzR4cmR1SjZp?=
 =?utf-8?B?QjUrSmpKNzBxOHVUSHR4cmVSL3Z2Nkl6U2lEK0orSHhkQ3NwY2lJQjRJUExC?=
 =?utf-8?B?VFpiM1JFZ010OGk3QUk0a29iVytaK09tUzY0T204Y01MSG9pcWtZQlZvS2lR?=
 =?utf-8?B?bEdwSzlEWGRuaklyOVR1d2lGVWdkSDkxTFhSK1VUMWJUcjZ1TjI5c3pGZVN5?=
 =?utf-8?B?ekh2SUNhQURXMWYwTDZwVEhYMldoMWF5TzNCL0lKVitLd2QzcTJNYkVpS2Nq?=
 =?utf-8?B?NTRsUVA0ZHB3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFI5SzB0N09xR2prMnJMQThMSHFrTHpqeU9UMlJXZ0hCbHJpWktLeCtDRXht?=
 =?utf-8?B?QlhobERnWDBhSWlyOU9TcVBBWldYb0lMSU42Wi94dEF5b3hRTS9mN2k4L1VP?=
 =?utf-8?B?cmdyOTFNbEJTcm9OV1lTOEVGTTdRcENqUnB6SzNqSmxQSkQxemZnaEhqSU5z?=
 =?utf-8?B?Z21ISUE5ZUVQZkFRdjF5OE90MUdGTGNEV2xTNGQ4d3dRbGU3U1pNTzNLOThR?=
 =?utf-8?B?L3ZmbEVDWk90SEVDbzllOEZkTTdFTm5Mc3lMMXk4SUVjVjJNaVlhKzJMbHdl?=
 =?utf-8?B?elN0RGNZWmk5aktmY0xUWVJHMGl0OVNkLzhtdSt5R2hMZGU1dXFiVUlyamxC?=
 =?utf-8?B?ZHVZc3dxUFEwcHk5MkJCRVQ5N0J3cnJ5MWM1U1RrMXVvRWdIRjlSQWV6OEx6?=
 =?utf-8?B?MkpjK1NZdTNwSGs2OUtIRXlmeXNjeGRxZG1UZkFEejNDUHVZZjNyVWFqT1FH?=
 =?utf-8?B?elEwOFh0bDR4SVhBL2IvN3BFRlJwZE11cjVCM3VBSGdGazczSXRRWFdFVlZy?=
 =?utf-8?B?ekFGdVRROEFiSHAxL2swMCtTZ1J5ZWxkYUNIMUNLemw2MnRsSW1lNkNibGhq?=
 =?utf-8?B?ZW9jZzNsck9SMTh3dStsWkJXMnk3UTV4KzhwZjlHMkJDYzFwaXVWRzRQVmRi?=
 =?utf-8?B?QnN1Yy9rQ1pRSGhBMUZhVnNCSDh5MDVmQVMvb1AvV2tJNlpFL29kODNiTFNl?=
 =?utf-8?B?Y0lTS1BkbzFKYitKRjNxejNMSjhGM253NE00WW5abUxFTXZ3eTB5MGNVQjE3?=
 =?utf-8?B?amxlbTJzamN4WmR6NDBscGNwZWRqTmdCUFJmbG9tZGV0bnFJWkphcFIxckNq?=
 =?utf-8?B?Z1FRWG5vazMrRGV6RUgxd2Q5Z3Q5VjNodGtTMXFoYmQ4OHFrdkswMVVTbjNJ?=
 =?utf-8?B?Zm5ZTTlVb290VU84WExUMVR0RHVaMktidXVSUnVSS08yUkRSRWhTd3ZQTXNN?=
 =?utf-8?B?NmNNZVRxSmFpT0pubEdGWEMxRFVXSXFvUThjSFJxTGhhN3Z2UHB4VFlkVFRt?=
 =?utf-8?B?bWZCQlgvemlCWDlyY3dEbklOSExoUmNsWXdaek1kQUV6eUZaaFB2bDFNZk9i?=
 =?utf-8?B?TTNUaGdEOWxacVBibitoMUs3STl2U09reEkyVUp0MzQwSUk0Tnk5Nzdnc0Vo?=
 =?utf-8?B?b1BQRkg4Qk83ODQ3VXdLMEdodnRBdVR0clMxYXJ2MGprOHJXZ2U0QUpFZlh3?=
 =?utf-8?B?OUNQd0VXMlhDUGs5aGxWZjhkYTJZaHJ2ZWdwTUgzVEJPWDQ3anJobVM2ZG5m?=
 =?utf-8?B?VzJycVZVUXhTdXNZQmVLVTZwRUV0Wk5HQzNqVzAyWFQ2bGcxNGdqeStGWHBH?=
 =?utf-8?B?UG9id2owWmd2Sy92bVFDa0JJOVRYMzNSdUNPdzRJVDFBNFp6MVdmZVpGd0Jy?=
 =?utf-8?B?bDJEUDhIczFXdEE5WEVDOEpmY2R3UUxYTThjQm9CRmJWYnNWSXI4TFFXRDFM?=
 =?utf-8?B?ZDdtbkYxRlRkQjNEcnBlUzYyd0c3Z3ZlZ3VCaXRLam1ZRDh2NStTVEpvTVVD?=
 =?utf-8?B?WTg1OG9zN3pjMGs3QXVod0NUb3pyYytSUlpaM3BiTzFOd05IMXA1bU1sM3hj?=
 =?utf-8?B?MzFwNE5pSU5uMnpzbXFDdVowWi93ZDdTQUxFZXo0U1U4ampZTGpQVE04bW1w?=
 =?utf-8?B?M2Zxc09yK09ZTUdZTUloN2U2WDRLVHp1bmhDa2l6dUQ2UGZLdlBCYUZ5YmVF?=
 =?utf-8?B?VE8zaFFDZjFhRFRNOHJkVHF0dCtIRWhDcDc0cWxGUTZLcXdQSkhWRDlEMmZx?=
 =?utf-8?B?UTJuZ1E5UENLdy9aVkk5Uy8rTVhNcFZDSU8ySEpaVGRCRWNETk82cGJlRVBi?=
 =?utf-8?B?K1Q0ZVR3N3VsdFdqOTVOZ29RUFprQ3FZWENWZmozTWFEWmFURkpEeW95eFlX?=
 =?utf-8?B?OWlXbXZlMm8zbTVMbS9jSWVZSUsvWUlYMEE2TzB4eDNyVGhWUW4rN1gwQW1Q?=
 =?utf-8?B?WjNoakZLQ0ZzL2t0ekFoTjh1WXhPTHQ5Y2pQUWVKY1hMNTBEQjdLK0hFTVZ3?=
 =?utf-8?B?ZnJrekVpSmFWMEtkUzhqQVdxc3EwVkJVSlJkS3g2dEV1V0ZSeFU4clFDWEg3?=
 =?utf-8?B?RmMrWU53OVRzMlNhZVlDbDBJUEVHSUh1RnljVlVxUzNZaUpUTDA5bnh6cGlN?=
 =?utf-8?B?Y2R2ZVAyS1g0ak1kZExVTndJcjM3c0NoMFVtTnZLbkFITUt5a1RTUzQ5dTBD?=
 =?utf-8?B?dEdrbGlHQjZ0RGVKaGluajB5ZGltcjJJZDdCL2FaZDIzdWVMaVFxb2M5TllR?=
 =?utf-8?B?aHU2MkYwWENrb21HK1dBQmw4V2J5YlZQTlpBa09IblpINlJ6eU1mZEhiVHBM?=
 =?utf-8?B?NFo3cHJlRXQ2ci94Ti9OaGYvVi9JY1FSUUg4Zi95bnovRXV1bUR0UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 620e5a86-90d2-4419-b193-08de433c2e51
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 22:31:28.8084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bootJhKXpgYgCUtaO6uRByxEB+MpKXW+XAjNJLooQGz1ZvhtJmKIzPmdKOn/wsujLetRz0ePiG7jxO+D2r064jchziFfcuaVG6BgZ1uk3Qk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6480

On 24/12/2025 7:40 pm, Roger Pau Monne wrote:
> The current logic splits the update of the amount of available memory in
> the system (total_avail_pages) and pending claims into two separately
> locked regions.  This leads to a window between counters adjustments where
> the result of total_avail_pages - outstanding_claims doesn't reflect the
> real amount of free memory available, and can return a negative value due
> to total_avail_pages having been updated ahead of outstanding_claims.
>
> Fix by adjusting outstanding_claims and d->outstanding_pages in the same
> place where total_avail_pages is updated.  Note that accesses to
> d->outstanding_pages is protected by the global heap_lock, just like
> total_avail_pages or outstanding_claims.  Add a comment to the field
> declaration, and also adjust the comment at the top of
> domain_set_outstanding_pages() to be clearer in that regard.
>
> Finally, due to claims being adjusted ahead of pages having been assigned
> to the domain, add logic to re-gain the claim in case assign_page() fails.
> Otherwise the page is freed and the claimed amount would be lost.
>
> Fixes: 65c9792df600 ("mmu: Introduce XENMEM_claim_pages (subop of memory ops)")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Regain the claim if allocated page cannot be assigned to the domain.
>  - Adjust comments regarding d->outstanding_pages being protected by the
>    heap_lock (instead of the d->page_alloc_lock).

This is a complicated patch, owing to the churn from adding extra
parameters.

I've had a go splitting this patch in half.  First to adjust the
parameters, and second the bugfix. 
https://gitlab.com/xen-project/hardware/xen-staging/-/commits/andrew/roger-claims

I think the result is nicer to follow.  Thoughts?

As to the logical part of the change, the extra parameters are ugly but
I can't see a better option.

> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 1f67b88a8933..b73f6e264514 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1071,6 +1049,28 @@ static struct page_info *alloc_heap_pages(
>      total_avail_pages -= request;
>      ASSERT(total_avail_pages >= 0);
>  
> +    if ( d && d->outstanding_pages && !(memflags & MEMF_no_refcount) )
> +    {
> +        /*
> +         * Adjust claims in the same locked region where total_avail_pages is
> +         * adjusted, not doing so would lead to a window where the amount of
> +         * free memory (avail - claimed) would be incorrect.
> +         *
> +         * Note that by adjusting the claimed amount here it's possible for
> +         * pages to fail to be assigned to the claiming domain while already
> +         * having been subtracted from d->outstanding_pages.  Such claimed
> +         * amount is then lost, as the pages that fail to be assigned to the
> +         * domain are freed without replenishing the claim.
> +         */
> +        unsigned int outstanding = min(d->outstanding_pages, request);
> +
> +        BUG_ON(outstanding > outstanding_claims);
> +        outstanding_claims -= outstanding;
> +        d->outstanding_pages -= outstanding;
> +        ASSERT(claimed);
> +        *claimed = outstanding;

Something that's not explicitly called out is that it is invalid to pass
claims=NULL for a non-NULL d.

There are only 3 callers, and two of them are updated in this way (the
3rd passing NULL for both), but it caught me a little off-guard.

In principle alloc_heap_pages() could return {pg, claimed} via a struct
which avoids this entanglement, but is unergonomic to express.

> @@ -1553,6 +1554,12 @@ static void free_heap_pages(
>  
>      avail[node][zone] += 1 << order;
>      total_avail_pages += 1 << order;
> +    if ( d && claim )
> +    {
> +        outstanding_claims += claim;
> +        d->outstanding_pages += claim;
> +    }

In the rework, I added a comment here:

+    if ( d && claim )
+    {
+        /*
+         * An allocation can consume part of a claim and subsequently
+         * fail.  In such a case, the claim needs re-crediting.
+         */
+        outstanding_claims += claim;
+        d->outstanding_pages += claim;
+    }


because it's very non-intuitive that `claim` is only non-zero in the
case of a failed domheap allocation.  Calling the parameter rebate (or
claim_rebate) would be clearer, but I'm not sure if it's a common enough
world to be terribly meaningful to non-native speakers.

It really is inconvenient that you can deplete the claim with part of a
single allocation.  The intended use doesn't care for this corner case;
you're supposed to claim what you need and have it drop exactly to zero
as construction progresses (anything else is a toolstack error).

However, taking such a simplification to the claims behaviour doesn't
help here AFAICT; you still need something to distinguish the rebate
case from others, so you can't drop the parameter entirely.

~Andrew

