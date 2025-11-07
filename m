Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE3AC3F6C8
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 11:27:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157473.1486239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHJgs-0003pR-2b; Fri, 07 Nov 2025 10:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157473.1486239; Fri, 07 Nov 2025 10:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHJgr-0003nY-Us; Fri, 07 Nov 2025 10:27:33 +0000
Received: by outflank-mailman (input) for mailman id 1157473;
 Fri, 07 Nov 2025 10:27:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qRNH=5P=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vHJgq-0003nS-5t
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 10:27:32 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d9ef107-bbc4-11f0-9d17-b5c5bf9af7f9;
 Fri, 07 Nov 2025 11:27:31 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PAWPR03MB9977.eurprd03.prod.outlook.com (2603:10a6:102:360::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 10:27:27 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 10:27:27 +0000
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
X-Inumbo-ID: 5d9ef107-bbc4-11f0-9d17-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FN6vzqDctfHbhHC4iNqMour3Fu+7wWirDkfgOOL/4J1uq6UD+xFNmA+5Cs7uFokvQ/HzpyoaNjD0qI+4mhO/rgW0Pt/eXaLooF+QWJWQtrifVwHEjyozbShNLWNxfMz/Sr8dL029iqwE2zIKAGv8yl2By9BDCH4jrpabfs5fBbMz0afGjbtnxExNaJVyfXA6FqmrO8ru9UB8L91djViat4iB+XLHbyCqyYFJx4F+7wOo2bbOTZtGXJhGfxmOW0zhgEHG5hPc9oMh93J1gD4jYdwEZbLGg29BoiMkjzUCRBE3L+Fhwd12C2KN7Cf6jS0Wry8coohsUXWef2M95k4xMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NONuVg/NJzAZPSkDh4oPbS2bwGloAdzoWNcm+cTEJHk=;
 b=ZLLuhWpYU8WAr1E2q6VLMXy4kAdeIwwa3hXTAb872YkMt7y5lPRji5ZKaThz8VN2Yfq/pKDb1MRimg4Vdp3W2c9/OALbatEm1vWYvUn6oftPWTkbObuTi7AFa/4x5kDgBLYz6Nb4kp/lYYrzeCqNW6kzK2Ppwgl7v4j4opwMPIKCIRKdgCeuDLt03zKBQHVZz/1RUyKDc+k+kR1MbJrfnhGkPeWI14TmQ1cGnd+fEbNew3xgbgAX8xBULoGStgOjsVdSNFDdEA0eSbe7Qgok1kD5KoBcBbEPushHbnRZqUqan33fDpoAp6+u7aqz3D4zA16Nv+5XVZiDng99q94vbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NONuVg/NJzAZPSkDh4oPbS2bwGloAdzoWNcm+cTEJHk=;
 b=UdDRXmkaDaDvz/g+YTeKwY5/YkpApdTsAVwZj1rXQj4Yf7BKdHL/jwY2yIKfyfTN1S9AURujdTHeYpplPJhoDdq1eVFVIbVyjd9I1x4yMf9Oe14LX9myHVBn4ehdZZxyZByLs9Tg0skSM9qmuPC2Ekz+Ej/YuZyO3xWmpc3vxKx7iqMxsc4e/WIgS4nR/Oo79TWceLRYLbUxICCCbjVZzquxYXMmdZ/WWRdFEjztJVNyEOuTcldc+X8ww2UBQ4QgfImcp4g7EhWu1A1ZDj4lc298dFxHDecFmzP9ub22ucdDxJ9gYn8U0Y7/wDsslfEr7v5mpbmpFoeoSjNUI5mklA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <9baf3150-c787-4fb8-a67d-70fade104b54@epam.com>
Date: Fri, 7 Nov 2025 12:27:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen/x86: guest_access: optimize raw_x_guest() for PV
 and HVM combinations
To: Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20251031212058.1338332-1-grygorii_strashko@epam.com>
 <434d9ce4-e5e1-453d-84b7-e21e66d0c5a3@vates.tech>
 <b012c6c3-fb8d-4336-922f-f40bc43eb2b5@epam.com>
 <0217b1ff-2c33-43ae-adbc-d665c881473d@amd.com>
 <ffb2ad53-c150-44e3-a0b8-7ed3473886f6@vates.tech>
 <01ad9a85-ff61-445c-97d4-076f9a81b649@epam.com>
 <2e298f37-78b2-4870-89a0-07dc4501372c@amd.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <2e298f37-78b2-4870-89a0-07dc4501372c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0225.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::17) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PAWPR03MB9977:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a32fd58-b14b-4dea-1d37-08de1de83fe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YU14bnBKeEZFYWI3NzZaZjg1NFp5ZTVrR29UR2F4OUV0VXNEWjFPWWM5NUox?=
 =?utf-8?B?OWF1VEdyeExZQzYzRHNQMmdJdEc5NVp5ZDdsQllSeFZsTzNHZkswQTltbUQx?=
 =?utf-8?B?NGdhamtuVGZneXdUaEU3c1VGVjhSSFdySzZyK1pUSlJxME43MlVVREJ4Zm0z?=
 =?utf-8?B?Zm10dTFhaklOd1psWFVvY1NNTEZ0blFSUXcrVjZ0dUk4RUt6c2l6UldEbjRq?=
 =?utf-8?B?NW9QSjNzSFR0ZEg3SjhXZ2VvUzNMcUdRN0hNbzdXTElYQU5CTmQ3akl2SkNN?=
 =?utf-8?B?dDhJUXRTMUhBclRzcHhZbkJ0NWFISEFHblBUQWtObmpiM3RCZU1XUUxXZS9r?=
 =?utf-8?B?d3hBaFd3alloUHdSejFoMUt6bXZtTXFpWVFsQitTemZpSWFsaUJpMEtsZVA1?=
 =?utf-8?B?TENUVGJFTGR1WVlmSjg5VHRNaXNDTS9mNWhyeHpMQ1RsTDQyd1I2UktLWXV3?=
 =?utf-8?B?MlBiL0pqdjd0TDNZeElVRFRNb0Y3MmFkYVJNdHJPZm1qSkdqUDkwYlYyL3Rp?=
 =?utf-8?B?cUdodndKbzgycXpDbU5zbnRlRFQwcjkwbmc0YzFNT0hESXJkY2Z2RVM2elkw?=
 =?utf-8?B?VUNjeCtQS1FRNXN2c1drdEpnZ1J3NEZkQVUzT3dyZXJtUkUxR0xlRUVuelZx?=
 =?utf-8?B?R0V1U2N0bmFXVzJsS1hVZTFydUNyWHlCcVl0a0FkV29YOVNlK2IzaE45K1Iv?=
 =?utf-8?B?aWl2UTBwalVLbnVXZ2lDRTFhYnRMdU1tQk9MTldrYmpOMHpqN1A5c0R2Z3Np?=
 =?utf-8?B?NTFBd0JsT1RkVlNTT2RJV3I4VzdJYm45QVZ4a0QzQ0ZFVDg5ekptbDZyYWE4?=
 =?utf-8?B?OXdnT3lqRW01aU4wRUpLTXU2Q09ta29kUjZJankwdWhqMmZFeXlVVGpwd3NT?=
 =?utf-8?B?Y2NIOHI3TUhuWnhQSkhwRFdtSklDNERiYTRiYUZJQWhwUERDSnVQeGl4Rkl5?=
 =?utf-8?B?dTZzN2czSXZXVndrNWQ4dlNoeWZtWE1udnlHdUV5R2hPcDRHMnN1cktUcmhS?=
 =?utf-8?B?WUxZQmNWVzFsZ1R3TUVmTGRrOUNzeGE3c2xBQUFXZWxjam5lRDhuZ21kRjRo?=
 =?utf-8?B?RXpEK0FUZmRUTWl1UmovOWt0R09BZW5EaHorUkFodTBkOTlqOUJJUUtKTmk1?=
 =?utf-8?B?WlBWMi9rc3lMbGxFNWRaMnd5TE9lSUx6K1BpRG9OeThFS21scFBBVStNeFAr?=
 =?utf-8?B?b0dCTlhEazVLaGNrT2lEMmF1TmFLK3VaRlhCdFgrM3VEdmFGQmsyRUtjbFZY?=
 =?utf-8?B?NkJUOWVHUnl3TUJLakZRUFAweVhNT3ppVHNCeEh5M2pHQnRzSHpxWXdaWWxU?=
 =?utf-8?B?RitqajVLS0VoMGZXeFdTeHg2U1dGVmFTM2ZuRlRuM25CWGlMMThRaTV2WjF2?=
 =?utf-8?B?UDNiQ3BLL01KU3h1Wlh0Tk9BeFFoSys1U01iVXFqbGsvTWV6LzROa3NLTWxN?=
 =?utf-8?B?bExsc0VUUEt0SnRNT0Fud1dPcmI3ckt4RUtlcWFMbmEvUHc0eVBCRHpOU2Nt?=
 =?utf-8?B?UCtPZ1hEVkhMQWNaUFBJRStCZ1dZbGticE14Nkg1S2l4aU11MWk2QkU5ejRV?=
 =?utf-8?B?L0FTRFRvTjZJSkRNR09EeVI1MkZPdlorMDVaczJhSHgyUmswUC9BMHcyR0hH?=
 =?utf-8?B?MzNZWGVsRjc2WGJRcHpvaEpoYVRsdU9DTzVkaWtBcWZiT3RDTHFaY0FtTk41?=
 =?utf-8?B?eUxzaGJ2czJtQWJRN25PckVCVTNzKzU3UDYwZUVQK3RrdTRsT2FOT1d6ZUlN?=
 =?utf-8?B?Y05aMGZkbVBVSyt6d2NwSlQzV1poTHAxOEswQnByN3dKZGt1RTJVN1BCM3VY?=
 =?utf-8?B?dnJCczFtWW03Tm03NGlzdW0wVmNDcGhBbjZ4Q0xkN2tlVGtrK2RqRXJZc09x?=
 =?utf-8?B?V2YrSERydFFLOEd1bVIwQ214ZmVMRDRpSDNEcTZUL3BXUnBEOU1NVEpMeVVx?=
 =?utf-8?Q?mFVnc/2Pg5Wizgbb7r5d8SVICaqvZ3mm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVJFNzhQb1VpUHZjQ0hOUFlqU2xLWkVLVFlobmRZMTVza0E5ZWlZNGVxUkV3?=
 =?utf-8?B?ekFrQ2dXSWhPbi9RNEZQWjhrV1V5dDVNN1ZmSXRDMXN6TjJMeHNISjVJT085?=
 =?utf-8?B?ZUxrZmlXYnhZUCtEeWZpMEc4djlockF3cDhxWktJWEtPUDRhdk9yYXpRY0xV?=
 =?utf-8?B?MnRDdkdwQ0V2ckVvN2hLajBvbStuVTRmZmlFdmkvSkZINXJEM2FMWU84WlZE?=
 =?utf-8?B?NERKYzN1SWxTaWJDVk9LU2lYL1RDRjFZTEM2Y2U0SjY4T21KYmxYRWh4KzRi?=
 =?utf-8?B?T3U1b0wwenNMemNsUXpKdlJVeTNQT3ZseU9qbmQ5R1RuTjZxR3prZWM0YUVl?=
 =?utf-8?B?ZUVsa0hhTHYzWVdTL2UvUGhZWk0rZFBoRkNmeWd3ODc2VnZ6b2ZmZUJ0dnRi?=
 =?utf-8?B?MXlGQ2xHMTY2NE1iMHV1WW1GNjJ6dHRUWi93L2RRbzA2bTg2K3VqNDBudDdO?=
 =?utf-8?B?cVJCbTVJZllXUEZDUUxpcUNsUTFjTUVxZHRsbmNMM0h4Z05OaFE3aXdxUHNw?=
 =?utf-8?B?UEZsOEVqK216RVRGUTdOOXdrSmh2TnQ3T3NaREFzOUJDT3ZEUGR3d05Za3B3?=
 =?utf-8?B?aEJOTUNxY2UxR2lZOHcxQ2NKRGViOHJTYitSbFR3d2NiWlF4OHJUWUcxcFJM?=
 =?utf-8?B?TGdXcEI3U1QrNlcySGhpUnVYemR5WU1RLzNKVkthRG94c0ZYWi9VcFZoRmFv?=
 =?utf-8?B?WDF4NFBPUmRLdjlHWEg1M1d4NjFCTWlESHdkNHNJUFNYczY1OHh0SHFEZ2t3?=
 =?utf-8?B?LzE1b2wrN3NWUks3SVpWRElScWJPdXdQcjUwMThzcExCSGd0Q2dMcHU1Ujdn?=
 =?utf-8?B?YVpmdnJPaWFpYkJJTjZCckhTZS8vN1ZFRzZIWFlvbkxTRmtpbUQ1STBlNWlx?=
 =?utf-8?B?M0lxc1RRb2FXRXczN3lUbWo3a1NuMzFua0FMMWQvTFBJQ1hwTGx4K1A2SDh4?=
 =?utf-8?B?UjJYajJ1eTAwS29aTnJmQ3BtK0dJT2wwT1htR2xOcE5SME9QMnhhcm8wdk1n?=
 =?utf-8?B?cGhiUXp5VEUvRXVtZGc2ZnpOdHJwZFRNa2tKMFNVS1RqWFdUV0drSVQ4aXpC?=
 =?utf-8?B?Z3VNWkd5L0gzTjNDaHA2dC9PUk1zc0d1eDgrWHJTMGtaNThqSHhSM2xmcGt6?=
 =?utf-8?B?WkJuQmdra1VnYjJBazV2OStDREMyQ0hrL0hCdHNsSDJKOHZRZVZpQmROcGFZ?=
 =?utf-8?B?ZUhXaDYzK21sTUR0SWJLaHN4eEJJZ0I1Rko0c0dSZUVvTXk0OWdFelJNWEVa?=
 =?utf-8?B?aGtTSXpUOVV1RWlzOEM3WjVLYXlaM2U5MWsraERONEhMMmN6bGg1NFhuaXBL?=
 =?utf-8?B?OXl0Q0VwMGpRcmdhakNpZmJnTmx0b3BNMkRTYm5IVmVMcVR2bFV2ZHBNN2h0?=
 =?utf-8?B?aklJWjl1M3kyWE5HUGNiQWhranFoTG5MemxQMEIrRXJDanFOY0JWZHIrYXE2?=
 =?utf-8?B?U0dGN2VVa2d0WC9TUEFlTEdBWjI5bUFhUjNxT3p4alVYZG5jcHFZTXdEeDNS?=
 =?utf-8?B?VlBTZ21zNXJwWE1QYU5rTVR3aW5NSUtqK3E4K0U0SHFDcm5MWDRWWE1yY09V?=
 =?utf-8?B?MDBrRWVhRTVQZERwUVI4ZmVOUVUrTndYSEJBc1lwNGJDcXJvMVl6L0xGUzU0?=
 =?utf-8?B?RStzNlMyRERSempJZ3cybmxJWHFPclVWT0VyN1pHeHM2YXJpZ0RYNG1ZT3Bu?=
 =?utf-8?B?cUh3K0JKcTlyTU9hZUJ0M2E3SU1oVGNsWlQzd0xwQzNxN2VnekpiRjMyYVZv?=
 =?utf-8?B?YXhTVlZTeUF5MlFueDZodkFEUmZXcEsrelJQUmlWMFNwVTVoeGZPVy8vMGNI?=
 =?utf-8?B?N3Bxd3FvbG83bUJ1RzBqWnp0RlRQalVPRHFKZVJmM003TGpkdnlhNFRKdmRa?=
 =?utf-8?B?dElsQnYrb3dEZXRES0J3a3BHa1Y4dmUvSzRhVnRlU0ZFTEtqTjhEK0E2NUVL?=
 =?utf-8?B?QkdJbFlxN2c2dGY1ZXBSMXd1R1lObUR2a2JUVWdFSnRkUC8zWlRBbGd2YTd3?=
 =?utf-8?B?dHNMeVpVSWlpbVJoa1JWWlRhY0Zud1YvM3FyS2NTeDFqZGxzQXBKV0t1aS8w?=
 =?utf-8?B?RTM4Z1VlTWFWUmViRk13QzFzTmVpWnM2dGg5N0FzWUNaSFdRVlhxQUFBdVZL?=
 =?utf-8?B?S0p6TW5XM1hWUmEzcXdaOEV0L0RLZHFNWTBKS2d1V3FwK0lUYmhrQTdVWlMz?=
 =?utf-8?B?ZUE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a32fd58-b14b-4dea-1d37-08de1de83fe1
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 10:27:27.5779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: chs/SZyPIoVzWU3APFq6GMiz9anNpBLWGlK5/HDzofrb/sk6T3YlTOLjO8e0rPT8qf1UaKSptlbDb+cU72Qm+jg70/S4ABOh3S9fjkSx68g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9977

Hi Jason,

On 07.11.25 03:29, Jason Andryuk wrote:
> On 2025-11-06 12:40, Grygorii Strashko wrote:
>>
>>
>> On 06.11.25 19:27, Teddy Astie wrote:
>>> Le 06/11/2025 à 18:00, Jason Andryuk a écrit :
>>>> On 2025-11-06 11:33, Grygorii Strashko wrote:
>>>>> Hi Teddy, Jan,
>>>>>
>>>>> On 06.11.25 17:57, Teddy Astie wrote:
>>>>>> Le 31/10/2025 à 22:25, Grygorii Strashko a écrit :
>>>>> Can try.
>>>>
>>>> Yes, I was thinking something like Teddy suggested:
>>>>
>>>> #define raw_copy_to_guest(dst, src, len)        \
>>>>           (is_hvm_vcpu(current) ? copy_to_user_hvm(dst, src, len) :
>>>>            is_pv_vcpu(current) ? copy_to_guest_pv(dst, src, len) :
>>>>            fail_copy(dst, src, len))
>>>>
>>>> But that made the think the is_{hvm,pv}_{vcpu,domain}() could be
>>>> optimized for when only 1 of HVM or PV is enabled.
>>>>
>>>> Regards,
>>>> Jason
>>>>
>>>> xen: Optimize is_hvm/pv_domain() for single domain type
>>>>
>>>> is_hvm_domain() and is_pv_domain() hardcode the false conditions for
>>>> HVM=n and PV=n, but they still leave the XEN_DOMCTL_CDF_hvm flag
>>>> checking.  When only one of PV or HVM is set, the result can be hard
>>>> coded since the other is impossible.  Notably, this removes the
>>>> evaluate_nospec() lfences.
>>>>
>>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>>> ---
>>>> Untested.
>>>>
>>>> HVM=y PV=n bloat-o-meter:
>>>>
>>>> add/remove: 3/6 grow/shrink: 19/212 up/down: 3060/-60349 (-57289)
>>>>
>>>> Full bloat-o-meter below.
>>>> ---
>>>>    xen/include/xen/sched.h | 18 ++++++++++++++----
>>>>    1 file changed, 14 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>>>> index f680fb4fa1..12f10d9cc8 100644
>>>> --- a/xen/include/xen/sched.h
>>>> +++ b/xen/include/xen/sched.h
>>>> @@ -1176,8 +1176,13 @@ static always_inline bool
>>>> is_hypercall_target(const struct domain *d)
>>>>
>>>>    static always_inline bool is_pv_domain(const struct domain *d)
>>>>    {
>>>> -    return IS_ENABLED(CONFIG_PV) &&
>>>> -        evaluate_nospec(!(d->options & XEN_DOMCTL_CDF_hvm));
>>>> +    if ( !IS_ENABLED(CONFIG_PV) )
>>>> +        return false;
>>>> +
>>>> +    if ( IS_ENABLED(CONFIG_HVM) )
>>>> +        return evaluate_nospec(!(d->options & XEN_DOMCTL_CDF_hvm));
>>>> +
>>>> +    return true;
>>>>    }
>>>>
>>>>    static always_inline bool is_pv_vcpu(const struct vcpu *v)
>>>> @@ -1218,8 +1223,13 @@ static always_inline bool is_pv_64bit_vcpu(const
>>>> struct vcpu *v)
>>>>
>>>>    static always_inline bool is_hvm_domain(const struct domain *d)
>>>>    {
>>>> -    return IS_ENABLED(CONFIG_HVM) &&
>>>> -        evaluate_nospec(d->options & XEN_DOMCTL_CDF_hvm);
>>>> +    if ( !IS_ENABLED(CONFIG_HVM) )
>>>> +        return false;
>>>> +
>>>> +    if ( IS_ENABLED(CONFIG_PV) )
>>>> +        return evaluate_nospec(d->options & XEN_DOMCTL_CDF_hvm);
>>>> +
>>>> +    return true;
>>>>    }
>>>>
>>>>    static always_inline bool is_hvm_vcpu(const struct vcpu *v)
>>>
>>> While I like the idea, it may slightly impact some logic as special
>>> domains (dom_xen and dom_io) are now considered HVM domains (when !PV &&
>>> HVM) instead of "neither PV nor HVM".
>>> We want at least to make sure we're not silently breaking something
>>> elsewhere.
>>
>> first of all idle domain - I've tried to constify is_hvm_domain() and even made it work,
>> but diff is very fragile.
> 
> Interesting.  Yeah, I did not consider system domains.  It seems fragile today if sometimes !is_hvm_domain implies idle_domain.  :/
> 
>> Diff below - just FYI.
>>
>> -- 
>> Best regards,
>> -grygorii
>>
>> Author: Grygorii Strashko <grygorii_strashko@epam.com>
>> Date:   Fri Oct 17 17:21:29 2025 +0300
>>
>>      HACK: hvm only
>>      Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
>> index d65c2bd3661f..2ea3d81670de 100644
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -567,17 +567,17 @@ int arch_vcpu_create(struct vcpu *v)
>>
>>       spin_lock_init(&v->arch.vpmu.vpmu_lock);
>>
>> -    if ( is_hvm_domain(d) )
>> -        rc = hvm_vcpu_initialise(v);
>> -    else if ( !is_idle_domain(d) )
>> -        rc = pv_vcpu_initialise(v);
>> -    else
>> +    if ( is_idle_domain(d) )
>>       {
>>           /* Idle domain */
>>           v->arch.cr3 = __pa(idle_pg_table);
>>           rc = 0;
>>           v->arch.msrs = ZERO_BLOCK_PTR; /* Catch stray misuses */
>>       }
>> +    else if ( is_hvm_domain(d) )
>> +        rc = hvm_vcpu_initialise(v);
>> +    else
>> +        rc = pv_vcpu_initialise(v);
> 
> This looks like an improvement as it makes the idle domain case explicit.
> 
>>
>>       if ( rc )
>>           goto fail;
>> @@ -2123,7 +2123,7 @@ void context_switch(struct vcpu *prev, struct vcpu *next)
>>       vpmu_switch_from(prev);
>>       np2m_schedule(NP2M_SCHEDLE_OUT);
>>
>> -    if ( is_hvm_domain(prevd) && !list_empty(&prev->arch.hvm.tm_list) )
>> +    if ( !is_idle_domain(prevd) && is_hvm_domain(prevd) && ! list_empty(&prev->arch.hvm.tm_list) )
> 
> The idle domain's tm_list could be initialized.  It should remain empty and be equivalent without modifying this line.  Though maybe your way is better.
> 
>>           pt_save_timer(prev);
>>
>>       local_irq_disable();
> 
> 
>> diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
>> index 839d3ff91b5a..e3c9b4ffba52 100644
>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>> @@ -236,7 +236,7 @@ static void cf_check vmcb_dump(unsigned char ch)
>>
>>       for_each_domain ( d )
>>       {
>> -        if ( !is_hvm_domain(d) )
>> +        if ( is_idle_domain(d) || !is_hvm_domain(d) )
> 
> I don't think this should be needed as idle domain, and system domains in general, are not added to domlist.  So for_each_domain() will only iterate over user domains.
> 
> domain_create() has an early exit for system domains:
> ....
>      /* DOMID_{XEN,IO,IDLE,etc} are sufficiently constructed. */
>      if ( is_system_domain(d) )
>          return d;
> 
>      arch_domain_create()
>          paging_domain_init()
>              p2m_init()
> 
>      domlist_insert()
> 
>>               continue;
>>           printk("\n>>> Domain %d <<<\n", d->domain_id);
>>           for_each_vcpu ( d, v )
>> diff --git a/xen/arch/x86/mm/p2m-basic.c b/xen/arch/x86/mm/p2m-basic.c
>> index e126fda26760..c53269b3c06d 100644
>> --- a/xen/arch/x86/mm/p2m-basic.c
>> +++ b/xen/arch/x86/mm/p2m-basic.c
>> @@ -34,7 +34,7 @@ static int p2m_initialise(struct domain *d, struct p2m_domain *p2m)
>>       p2m->default_access = p2m_access_rwx;
>>       p2m->p2m_class = p2m_host;
>>
>> -    if ( !is_hvm_domain(d) )
>> +    if ( is_idle_domain(d) || !is_hvm_domain(d) )
>>           return 0;
>>
>>       p2m_pod_init(p2m);
>> @@ -113,7 +113,7 @@ int p2m_init(struct domain *d)
>>       int rc;
>>
>>       rc = p2m_init_hostp2m(d);
>> -    if ( rc || !is_hvm_domain(d) )
>> +    if ( rc || is_idle_domain(d) || !is_hvm_domain(d) )
> 
> Given the snippet above, I think p2m functions can't be reached for system domains.
> 
>>           return rc;
>>
>>       /*
>> diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
>> index 05633fe2ac88..4e62d98861fe 100644
>> --- a/xen/arch/x86/mm/p2m-pod.c
>> +++ b/xen/arch/x86/mm/p2m-pod.c
>> @@ -1425,7 +1425,7 @@ bool p2m_pod_active(const struct domain *d)
>>       struct p2m_domain *p2m;
>>       bool res;
>>
>> -    if ( !is_hvm_domain(d) )
>> +    if ( is_idle_domain(d) || !is_hvm_domain(d) )
> 
> accessed via:
>      do_domctl()
>      vm_event_domctl()
>              p2m_pod_active()
> 
> The passed in d needs to be from domlist, so again a system domain cannot reach here.
> 
>>           return false;
>>
>>       p2m = p2m_get_hostp2m(d);
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index ccf8563e5a64..e1862c5085f5 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -2158,7 +2158,7 @@ static int __hwdom_init cf_check io_bitmap_cb(
>>
>>   void __hwdom_init setup_io_bitmap(struct domain *d)
>>   {
>> -    if ( !is_hvm_domain(d) )
>> +    if ( is_idle_domain(d) || !is_hvm_domain(d) )
> 
> This looks like it is called for dom0 or late_hwdom, so only real domains.


Thank you for your comments. Unfortunately, I probably will not continue this
HVM_ONLY exercise in the nearest future :(, so if anyone interested and want to pick up - feel free.

-- 
Best regards,
-grygorii


