Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7499CBF7FD
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 20:12:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187540.1508907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVDyj-0005p7-Qy; Mon, 15 Dec 2025 19:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187540.1508907; Mon, 15 Dec 2025 19:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVDyj-0005ma-NS; Mon, 15 Dec 2025 19:11:29 +0000
Received: by outflank-mailman (input) for mailman id 1187540;
 Mon, 15 Dec 2025 19:11:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6GmU=6V=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1vVDyh-0005mU-7C
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 19:11:27 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6450c00-d9e9-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 20:11:21 +0100 (CET)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BFFNWE32465365; Mon, 15 Dec 2025 19:10:36 GMT
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b0y28ap06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Dec 2025 19:10:36 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 5BFHcduh024791; Mon, 15 Dec 2025 19:10:35 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com
 (mail-eastusazon11012036.outbound.protection.outlook.com [52.101.53.36])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 4b0xk9abek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Dec 2025 19:10:35 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by IA1PR10MB7333.namprd10.prod.outlook.com (2603:10b6:208:3fa::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 19:10:28 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::312:449b:788f:ae0e]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::312:449b:788f:ae0e%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 19:10:28 +0000
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
X-Inumbo-ID: d6450c00-d9e9-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=pCivCSrwTAv2vF1zDUek5czQH4e16qJplgshxD5vjZQ=; b=
	DtL2/xv/RdPVhaGI28isZBYgWxJ/9fyKr+p7QS6x6wwpRzPxK00BOXF0jXBYg19X
	WUD3c0MPDLroDMMKs6YFlvMbjmSYI+WT6KsDyW6FIe9x+iRdpKARYlqIy1jldpc5
	iigLkH/U5i3x6tQT/cKRbGkzoytLw8FF+vd6TCe58W/STPj1lE0NRclOOHX//Mvw
	Cmhhke/fkpMGtlgNstLIOwDCEu880wxbPnP6MswiLQx2LVilV9NM5q7D7ABA1WT0
	AFe8e8hxZjlIrJ8lMMgDfS0ti/JRQdr/L0WmRR5Vkth1ddQgIIG+XWG+loyQXq/i
	5WIvPExWo8WP3U2U1uNYBw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9kdvjgdH+XIU39mvhvDRjXYeUo3D3smWIPvDzljvrxUlRJnMe3VCxUNwp091MLUstaOXgDc1zkSmKtuyVkfREorPaeGfB0m94aYdZ6Nw+vmWP356KVgjOzYOkPrSxpDZ7lkdioIklQ1is2AaRnbLSXIFS0qcp9ZEMk0gn5KkawH/hWGasjnXJbzDksCw7Vy2JLgHe6k3nDr+g7VrmC6fO0BkILPKsGsSkavOwZ0K4FYi6QYrjeXcg7gTeUQH5SOr3hB05Xd5u+Fa9opd8WoAeEPjb11pjipo/8NBwAQRHZp4esVtVUBRQwy5D3kQZT4V9PQw8dJ+4hOTzD/Xj5PaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCivCSrwTAv2vF1zDUek5czQH4e16qJplgshxD5vjZQ=;
 b=LRjBz0FkyaM2VUs/Q1AKndA/1TulmC8VE7hxe4BNQcBmD4Uz/IKnwvEYDqotGP+GqjndvAHWUhwZCQKK1HccE4ar1Etjipm0qWFC4FGaKyYC+c+Dnqv4RCYy9yQOuxa/LabnOXM54OhmJH7MDJfjK0+fPJKyYwBZIvygv7p5kWq4RSNuFOARDx8G08t7wuGvmKHdw5sKfRAujFo0inuwuhuqAN5b//BH+luTbZjgs/95XuPRnkrXO4729iEydpA5xMmIHbNgpivuCa3UTfRf9/x/YqrI/GQL5rEWWxEcP1lxXqNVWJ2y9DhSgrg8SrWry74wb7m+iAkVQig9cr9SGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCivCSrwTAv2vF1zDUek5czQH4e16qJplgshxD5vjZQ=;
 b=uJ8A8x523HoiLmO7WiwDmkYemgh1EyZtJkEBIIrwE5BHHtMEaX6ZqoKkj5cgBlhnRU8QEwQdpPMcDXdEiNVxjd2sBKZu1luFpp2g7+9MoqtdGepns4oamwGqnZ8rJKBUs0gAQtu4h0FAOjUMHS6YcC4Q90TFGdLBtlivwbt0caU=
Message-ID: <ace2b760-9cfc-4919-86c5-da22a3d110be@oracle.com>
Date: Mon, 15 Dec 2025 14:10:24 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/21] x86/xen: Drop xen_irq_ops
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
        x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, xen-devel@lists.xenproject.org
References: <20251127070844.21919-1-jgross@suse.com>
 <20251127070844.21919-16-jgross@suse.com>
Content-Language: en-US
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20251127070844.21919-16-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P223CA0010.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::19) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5009:EE_|IA1PR10MB7333:EE_
X-MS-Office365-Filtering-Correlation-Id: 47b32e18-2a25-45f8-b5b6-08de3c0d9bf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWZHdk9xeHE3ZTNPeUdwNXBILzMxdFVzbkZuS3BQbCs3L01CMjJyNjIvVVp2?=
 =?utf-8?B?SldzY0QxQWtaSGN6aDhBYXplMitveThoUG9OVll5ZDdyWTFCVi9pbDNlUlU2?=
 =?utf-8?B?WjlrbFlVRU5UYWQvWER4K3h6MlNsMllzYkgveS93TStMajk5Y1N0dlFZNWF0?=
 =?utf-8?B?RUdoNEppelMwL2hqRFlBa1duTytQNmhIeWpBZDV1WTdPaGVicjZtQ0ZZdlU1?=
 =?utf-8?B?MDlBUjhkSG9kM0Y5SXROR1JXT2NldUZuYmtlcUZrZVoya29SalZlUHQ2RFZL?=
 =?utf-8?B?c1ROelJ4VXRCdGppa043VGZDdCtCa3Radk0ycCt6VFBlS2NoNUsrbWpsandi?=
 =?utf-8?B?OEV0Y0UybEZ6UTJPaUVIcmpaSjdWUUhOS0k4SnJ6UnJhSVNHQ1ZXbHQzQkxC?=
 =?utf-8?B?VVVSVSt6Qjd1VGdBY2JFaWZJWWpYOVNXQWE0RlUzcHZXNHVvdTZGL21LWUl4?=
 =?utf-8?B?NC96a3pCS3R3aHZjc01JUGRRb3NrZEQrVm16Zk1CRW1uWlI5WExOV0pkaEx4?=
 =?utf-8?B?U2hjQWE3bUlDejM4Q1FrbXRtc0RUT3VHUXFwNW5rUFVvWVAwdWl2TStsYVJ3?=
 =?utf-8?B?UURaS1h0TXhQaS9wVjFpWm1kRUxhMXNMVC9vZnZHU0czS0dNTjl4cXB2YnEx?=
 =?utf-8?B?Mno0d1ZyNk9yVnFheVJ5RXdVTFRTZk9KWTV2OWx6ZEs4Q1B3UDBnc1lGQy9P?=
 =?utf-8?B?L2J4ME1BZ2ZRRVdSRElKemtMVUhtVVNXMktDcTdtT3JQNTZ4bEMwTmM4eC9i?=
 =?utf-8?B?RERMTkpzd085ZHhMbkQ2TGRaeTBZUnBjZEQwR0greURWYnhNSUdlVmFFSWds?=
 =?utf-8?B?SHF1M2gvMzRMOTlqeVhIbDFmMG5hMVhPWHFIR0NmeVBXN251aW5xUEUrMjZu?=
 =?utf-8?B?Rjg2bDR5SmhSNmk1aGFSQm1tSFhqSElseVl3Q0VKQ2IwVDNWZHRRUnlwK2Vq?=
 =?utf-8?B?dVBIVW5YQnhYeHhxblI0eWxuUDJxU3p1ZmswNmgwKzFYbm51MXkxajlvN3ZD?=
 =?utf-8?B?THo3V3U3ME85eHZxRlNoaGR6dDcwUUNKQzJZTSt5aG5SNzN4SHF0TkQweXpV?=
 =?utf-8?B?Tm1LT2dHYkdBazNrdXBKUHhQUnBTUXdVZ0VBaStzd2lkU2JydmVGQWlmV3Bz?=
 =?utf-8?B?bGVmaldiTytDSmR3Wi9keklleExSOFFBUUx1UCtrNFR2dnJrN0czU3d1Q2FF?=
 =?utf-8?B?cmoyb3RTL2hDQ1pYbVFJMkdiWVlOZGtwZ2dlbnV3TTl4Uys3MEwybENUaldZ?=
 =?utf-8?B?TWRDcnNGUlJwY2tKbmRtSXUxRE1iUFdabitUWDF2UzdqZnBqZ2hNSUQzS0Jx?=
 =?utf-8?B?c0E3OWVNK2ZVTEJ4SEN1TjY2YnpxdTgwMkJXWnprc0IzS240UldRa1RWVXRv?=
 =?utf-8?B?d3oyam5WQTB3SDRyWnFkS1RLUCt6SiszdlFEL0dWMGlqRU5mR3BQTDVEalNl?=
 =?utf-8?B?OXVaenhaL3QwYVhEYnJjTGU1M0JQMTU4aDNVTmFEeG5acTRFUHByeWptN3FN?=
 =?utf-8?B?SlZmMzZHM2pxRzJySUphSWZrdmMxdGN4S1F5cmNXZk5xSVhhVFNBZGg3b21u?=
 =?utf-8?B?N1ZGM1FuYkR2eGYxMFFEN3Q2dzdyWXN6SDljOC9lUzJmaVFCdk5MdUxKWVl1?=
 =?utf-8?B?U0RYcUR3VDFubmVxdS9FWFdzczA5V2tGQTRENTU5N0tib3NQeFp4SXJOMDBz?=
 =?utf-8?B?WGZkUnlMNzlsaUsvZjdnbHdnMExWS3JjQys4RlpzckpoMkcrRFQrOHcwMVF6?=
 =?utf-8?B?ZlVMb2swZEhZSHZ2YStZZTE1REVpZFFJUmNxWGlibzVEWjdRaU02VUFwZ205?=
 =?utf-8?B?c2xmdkloV2tvYkFWaE5tWk8wSzdrSm9lVmFtS2R4aUhFWW9LL1kycm5Oangw?=
 =?utf-8?B?b1pZd2xIOEkzVktxenR2WHJ3VStsTHQrNDhtb2poL3ZuMTVWV28zLzFYMk5l?=
 =?utf-8?Q?bKlf3+/2tI3/WYS+QEg5uwXGueZ0Vllf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFJibjk4NXhqMUNtemFXOThJS2hUMEVXSEk1Qk0vQzlSS0lYTWptNmlTV2N4?=
 =?utf-8?B?NzF3UjBKZFpXeUtMaVlDeEZwSEpUS09lV3h3cGlCOUl3MDdHaU1yTm5OWngy?=
 =?utf-8?B?Vmc3SFliY0hseldPQlFSbENPTDBmNGE2WmRYZGlaVTFIbGNyT2JUdFJMbEFI?=
 =?utf-8?B?VUhrUjJwcVJ3RWpyc3MvMHMyZEZHRGhjbi90Q0V2ZnlScjBJV252SE5xc3Nq?=
 =?utf-8?B?L3J5QXRoVGVtWWFYSDc1YlF4M2s1M0IxZGdBZElKYy9ReXZWVUVGeUJMSFlz?=
 =?utf-8?B?aHNYekFNM3FKd1NlZkxuMnFkUlNiTmY0WENCQ2lQYWRScW05ZG1aYVgrY3Fm?=
 =?utf-8?B?ajFDUTlLa3BKbFg5dEhOc3cvMTBEU2Z6YzVZcEVqM2VkbmxDN09zUk9zM3k5?=
 =?utf-8?B?NHViRTdhU28vNEt2Q0FMemdEdUh1dWxJZTEveWsyQmdlQXlTUnhVWlBISDdi?=
 =?utf-8?B?NGVZTGZOdWlmM01pZ0Jud2VEUmFKOXNnWUlXRTdyRG5jTWdhSkU4NXNXdWF2?=
 =?utf-8?B?ZDR4ZXFDdTVtV3FXYU9YVEJJM3ZBUmJ5WlJQdXhHelUzVVJOQmMwaTVoeFg5?=
 =?utf-8?B?T1VOYjlSN0lQZ1M5YUpkNVVObEh1Tmp0TE9GYnROeTF2NVM0S1FhblJyTnV4?=
 =?utf-8?B?akRCL25FTjhPUndEbmRTeFJPU0ozdjBBTGppUTFFQklZN2VoVGFkUTYzQy91?=
 =?utf-8?B?aWZ6MmF4TllSaWhWZW55UGRiRTUwRERtTGFwclQrK3ZrR29jQU5oajZEVDV6?=
 =?utf-8?B?R3l3cHhldEZXUER0Y01nREJ1V01OWm9XVE56OVBMSG5mT2ZmZ21WK3h4ZDRk?=
 =?utf-8?B?VWc5NXU0TityWnVuR3o0aUpkWW5HQUJZUmJGbHFZNi9DTjFQVWdvQVdSdTVY?=
 =?utf-8?B?ZVNHbXpvb1I0RGhYajNkbUs1RGl3eDA3VWJiK0ZWTFhiYkxiUzIzSTZaWnBn?=
 =?utf-8?B?b0Yxd3FqeEJhQnpYL2h2aWlTY0VkM0dBY2NmQzBkSFNJVmNBVzh5UGhRZVhH?=
 =?utf-8?B?aXpjeTR1ZzBOLzc2OXBRZkUxWElsSDlYRWFlSUZLWXJHVHVRc0dIRnJjNmNP?=
 =?utf-8?B?cmdwbERjdHZZWUsvT3FmNXlPM1NiYzg5SnpaMzc1c1d0UlFxRU5XbEx6OTRS?=
 =?utf-8?B?dHFPQWZ3U3Y3bzMrb2FQZkswQVRuU1lSL1p2YXZPSmQ1a050VlhCK2JDMzBC?=
 =?utf-8?B?UEdjQWhUY3dZT0lVTjgxSjBjOXorOFd1Z0svNGpqZGM4U1Y0elpCaC9iUHRZ?=
 =?utf-8?B?dUc3eWVKcmJqU285TEdWSXo2SFhHRDZ3UUQ1ZDNJTWhxZys1bXROazE3d1VG?=
 =?utf-8?B?cU16bkg4M3lqSW5UNzBKMXhJOGphVFFMOG9PZDhNYno0eFloS1dLdkZnNkpz?=
 =?utf-8?B?VVZUVGpDT0dvM3QrRjZnd2xKVzVSaXR2QlpWS1NpRHRYZ2lCQ2ZxU2J5ZjRi?=
 =?utf-8?B?ZC9JUUZMcVVQNGhDcGpoLzh1SWl4NjFDcTFpeXg4d1IySko3K2dVcVpCcjc1?=
 =?utf-8?B?SUQwRkpxKzBkWnJWL25UbE85N05zSzMySDBaanY1TG9pNVllQ2FOWXlINmwx?=
 =?utf-8?B?MVZxQVg3RzZPQVJtT0tUWjhqLzYxNnpqaFRMdWlPT2lpaWVrTXZyNWN3MXIz?=
 =?utf-8?B?R3JId0FPM012a3ZqUktWOThkdGNjWTc0K09Ja1J3YXpXQ1lIS2NyVlVQQnht?=
 =?utf-8?B?dUkzV0RMdlc1b2h5UzZReW1vM3dKOXB3d0J2WW9FcHRibTJkQjJnOEdSY3FH?=
 =?utf-8?B?cWR4bmpNaXJjV0FjNW4yNlp5UkNwMkYwZTk3ZzQ5d2MrL2dQdlRtcWdWcEdR?=
 =?utf-8?B?dzU3WFROOTl4Q3E1WXU1VHM1MlhsdmZUZitNb1FzUHpXNm9NRitRSm5jbjJI?=
 =?utf-8?B?eGw0RUluZEV5d2dUNTFuUENVY1hZRG1iSnJEcExLRlFFV2lrUFlFejU3UGNO?=
 =?utf-8?B?RnBtMUdNRjluWWdSbHFQcFJwdHN2cStCRi9KUTNmc2I1OFpSUXFKWitzbDVh?=
 =?utf-8?B?Mkp1NHdZQ0JnRHd4R1lzQnlSREJvZTdHaGEwdXZUSXF3T3VTY2cxVXA5Mjdu?=
 =?utf-8?B?VE90eXJ4L1p3NFhIQnhDa2hibWd1UWkvM0JPK2wzY2pYcCt4Ym9RT1NHRWph?=
 =?utf-8?B?ZDRJcVp0d3VvWk81eUJPSG0yUWlFM2pvM0M2bW1GL25PNGtrcVRnMlI1OWw2?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wLasl/F8R1XZxT7kKPsr4Bm/8/CPq8+3HNrHt237a6CCZFo5Y4FXn8j1n/+i/UjUm1J4aGCx2G6v9fACJrvSypD7yLarYEanueV7AJ7Ir08j1yQhv5/EtS7twugqIrIhKGU+XRjFnb3RaKzCpmVHiWAljSxkfoJ6NlAPxqRSayETnR+bI8fbFjzcpU7zWRtkj8ey05DwsD6ABYlSzfVp6kOF66ESNAUZp5BVfqeoBtk0hRtuZfc7I0qL0vDn/2Ll9zfNZGWHfp6UlYEJzHFT38xho2PeT03WpF+rvu/rQ8R7y7vaFFh3NPiSFEYT/qM7Dpqq0gK3gBV3E/J2Ume5cfIq68efR5H74DkkcpUHh9oj878TEUGmcljIQ0IpOkheyvYo3pS+bbURwKXqlXAD4LX56sokibyOQAgXA0j1sMjGBQcxGvIkR5xx8/VBhVz7EeBGBLZvlsJRc1z+ic+TVp7PfOpGhZt4vPz3FutIB5FLtVfxHne9j54e/EFOC5KqWZIWM1Y+APpWwcFZrQdsO62h5gJH6IVcevkliM51fFrjYuG25l6Keg3xSj5oaMUhyo+j37ZnFf3fxMxXfDmmizNziEMZpG8ftYIgjyxo9UU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b32e18-2a25-45f8-b5b6-08de3c0d9bf0
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 19:10:28.3517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AjcxbltqvSuVuK+KVJBvxQtnEbTY+RVdgIyWiRSs2uyw9y4KvLYBuO7U8YSmNbCEpgmXdMHvznKL0xogRjs/24j1jazU/0XGsYPhZ6F8auI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7333
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_04,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512150166
X-Proofpoint-GUID: ztFGM9eb2EJUWqfGEhVjUQ9OUyXV5d7Z
X-Proofpoint-ORIG-GUID: ztFGM9eb2EJUWqfGEhVjUQ9OUyXV5d7Z
X-Authority-Analysis: v=2.4 cv=fOQ0HJae c=1 sm=1 tr=0 ts=69405d2c b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iox4zFpeAAAA:8 a=yPCof4ZbAAAA:8 a=AoAeTN9Xs-P516mdDt0A:9 a=QEXdDO2ut3YA:10
 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE2NiBTYWx0ZWRfXxnydIKyYcgwj
 /3r2U5xvfgW1ox0FEuUk+zTEj5Sce95gul+1VGXwtInoQ+RZvQzh0NyvVg4bWC6/hQB28y1ROWZ
 IUK4GbEQtz5Y2EYKYZyMdsV3i2GiSCMURZ7xUFsAJJgkO2s5aoGQ87pJCNlRF1VokMZjgtZ3IDt
 ywWfPZbJJSZAYyhPdzgbxQbhz1IWxWf3JEpuonzhYTxf4i3Ok/CRB9anMsypcA/C2XxbSy+/7uG
 RxYPqgl0aPE2GMyFKY6cRn2Ur+lIHSgpMnkFKgNxuE3JnWsWbgy5V4QR07FQsdALP+kN1H+TNiE
 q9bT78xT7bk8z3PJEh2idtX2pwnXK2HVYGTiPpSXOtIh9GhIRtWBtXzZCt3oyqZ6IHRKJ3gW7cB
 Y9hm8YSMVuVJ6c++jZ1hx5tNrcLesw==


On 11/27/25 2:08 AM, Juergen Gross wrote:
> Instead of having a pre-filled array xen_irq_ops for Xen PV paravirt
> functions, drop the array and assign each element individually.
>
> This is in preparation of reducing the paravirt include hell by
> splitting paravirt.h into multiple more fine grained header files,
> which will in turn require to split up the pv_ops vector as well.
> Dropping the pre-filled array makes life easier for objtool to
> detect missing initializers in multiple pv_ops_ arrays.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


