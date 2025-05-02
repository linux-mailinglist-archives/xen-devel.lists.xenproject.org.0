Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA1AAA7D6D
	for <lists+xen-devel@lfdr.de>; Sat,  3 May 2025 01:46:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975191.1362834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uB04q-0006Y4-0E; Fri, 02 May 2025 23:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975191.1362834; Fri, 02 May 2025 23:45:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uB04p-0006Wd-Sc; Fri, 02 May 2025 23:45:55 +0000
Received: by outflank-mailman (input) for mailman id 975191;
 Fri, 02 May 2025 23:45:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3DVg=XS=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1uB04p-0006WW-2K
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 23:45:55 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2413::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 949e4024-27af-11f0-9ffb-bf95429c2676;
 Sat, 03 May 2025 01:45:52 +0200 (CEST)
Received: from SJ2PR12MB8876.namprd12.prod.outlook.com (2603:10b6:a03:539::18)
 by SJ2PR12MB7963.namprd12.prod.outlook.com (2603:10b6:a03:4c1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Fri, 2 May
 2025 23:45:46 +0000
Received: from SJ2PR12MB8876.namprd12.prod.outlook.com
 ([fe80::69d9:a014:7a29:de4a]) by SJ2PR12MB8876.namprd12.prod.outlook.com
 ([fe80::69d9:a014:7a29:de4a%4]) with mapi id 15.20.8699.019; Fri, 2 May 2025
 23:45:45 +0000
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
X-Inumbo-ID: 949e4024-27af-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iqb0+6kANc3xwu1g+C9uOZLI5myxytkfb4jc9PgZ4hd0UY+DBgTer3ClFHyLWnLYbNCWpA7JJ1BydSJxOEGsaukapb2liMl8lfUrxDq6mmywtSB5ibS4J/hyjtMJy84iZRFuFBlCAqYU37aMv5nF8XrdV7DN0QF37TwOqAz3daOH1soTjsyVCvAL1TBRdIk3t0xFOnbebnY1h+TcvyxmiGSSgZm5ZT3J0nqF1aMaxTQBsDH1kn/ZOc22fCHdcqU/Pq6ytq9d3Bslu2k8dwURSvgRr5yv0+tp4zQoCQCuCGFqq6LUr0MwTqobx7+tT3HaYyRbWf2R++A2zjxIHjmV9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSSAEmJkM8IPsZFvN1yjK0BOBv8Jbi0hibXZ+yFDpb4=;
 b=YrEW0FxSVu//fqaUTbutbO5/TsljD0CM9ewOzVACUJ23tOUvcTUJa3Jt1R7qOlGZriVj4LQugIS/qndAhIkuhGGmCxVoKdzTxDkafGt9kDYdgsKZi10zirHJ17kW8IkkjZ2TsOQAjpqdxmUNystBoofMuna3n4qHSxkIHP2qTrh838Nwy8SW1M+qHBRDNth5DGrRNA7kSrzJE9RFkmZb1S8HRMc21M9n7LVO6MCKp46gGqB8jEYcZNfljoIDJW8qy9d0OOIcR3TjftmP8LC6i6CP183D3LoNVW3L9FbFJFTWSc/XvEnAUozMaJP8TaKLqg3TnwSp0+8146vbyUyedw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WSSAEmJkM8IPsZFvN1yjK0BOBv8Jbi0hibXZ+yFDpb4=;
 b=UJsnm9ViFxlvtjUwwzc1WZcLN6dqMDGw9zDYzv63DuOzvMqmfLNLQLldCUBpDlNWjGSYye4+/PYxQQoNcnMnfM7hLJ2lq1bboZIYgtBV8T/FhhFQ2bTpNAvuUxDuI5tpoJgfKGvzTmh4H7KrZxzaoc3AvHVKyYtvnHAYdzY6hko=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <68d30d0b-1f85-4480-a2e1-0c9c5effb49b@amd.com>
Date: Fri, 2 May 2025 16:45:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] automation/eclair: tag Rule 19.1 as clean
To: xen-devel@lists.xenproject.org
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250502233535.3532279-1-victorm.lira@amd.com>
 <20250502233535.3532279-2-victorm.lira@amd.com>
Content-Language: en-US
From: "Lira, Victor M" <VictorM.Lira@amd.com>
In-Reply-To: <20250502233535.3532279-2-victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:510:339::10) To SJ2PR12MB8876.namprd12.prod.outlook.com
 (2603:10b6:a03:539::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8876:EE_|SJ2PR12MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e5fc493-ad28-4d50-dbe6-08dd89d37530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFJrN1lKMkZOeDBRR0NPcU1MWkNaL0U5ZjlSUnhDY01OczNQNUxCOWZ6SWc1?=
 =?utf-8?B?SXpUamlSZ1pkNnlrN05lUTJESzE2WHR1aTVGM3k0ek1XcVB3QWx4M1BzYWxC?=
 =?utf-8?B?bE9iMThWNkFxYzVKODNZaFcxTkZaOXJHeDRqRkpMeWZsM1hrM0lyZXhkQXR1?=
 =?utf-8?B?Rmp4ekFtVEQ2ZEdYbGlDd2FIdXNQR3VybHFGMExkT0c3UGdMWXpleWZjRkR1?=
 =?utf-8?B?dVUxdHNNcEdJTmhiMDFsa283RlpWR3dyM244VFJseXNjeEo4dFVlaVgvUk10?=
 =?utf-8?B?VGFLVVByWjE4cUhoWVNnSUNNbXRZSFNjRk45QmhQVk5pNnpHT2Q4b1FSM1Jh?=
 =?utf-8?B?YVdwbmpnWDZFZjVOdjkrenNpWjdDd0VpNWQxbGdZYVZDZVRHNlpxZ3R4RlRB?=
 =?utf-8?B?clFyc0dudmRsMzgzOERFK1lkN0tGeXNIcE1wQzlMbi9QYnhWcmlwMUp1QlNH?=
 =?utf-8?B?QTBJa2h6bDlkMGpvUVJTSFpPRjR5MCs1SCthTjVGUk5NZy9tQUZma3p5NUtG?=
 =?utf-8?B?M1A5Y1prMlZPOURHLzZVT21wSHJmaGtXTWk4RU1LNTV0T2dGNFZjY3RLRUli?=
 =?utf-8?B?ZXFheXdML25pcEc4Z3hYMjBobWRZTERDNTYxMndzM1VhRzB1WWpSWjZuQ29Q?=
 =?utf-8?B?T2R3ZmhpZjJGWHJwcXBXUzRuZkN3SndoSGdMRTVUaGxUemJLbHptZEFHMkEr?=
 =?utf-8?B?Q29JclNYYjRYdEhndHBrRFB1QkFxRTA4UnBFVFhWUjBTV3V2M3RCR2h1bHZP?=
 =?utf-8?B?dDF0VDVvTTdaT29FL3EvNmRLL1dTQU1obk1PRVhYeGcrTkJHODB5S3RwL2pS?=
 =?utf-8?B?dXVjNm1ORllOcDMrL2t3Wk00MGE5Q0FlWGl1MGhKbXpCamM2b2ZhTzF4TjBB?=
 =?utf-8?B?b2g0VFBESHZ5WjNNM3hDa2pLMkUxNmw1L09USW1pOXoxU1F2MnRweHZYdE5Z?=
 =?utf-8?B?K25CTXBvQkFtbjlRajhwMXFlZTdjMStDRkR1TEFCcGFtSmY0SWc5RnFDSW1i?=
 =?utf-8?B?V0lkVXBrSnpZWUZxZEgxWWw4dDdTZXJYRS9sRHErN2Z4bWJxaHRoK1NiUmNn?=
 =?utf-8?B?c05ZRkVFTWxQZGlSVmxETmk2QW5zeHhHd3VwYTBCRHlrbnBEL0RwZis1d2pB?=
 =?utf-8?B?SDA5cytGNCtBY242b2ZLSDNzYkx3MU5PN01mZjRBeERxNU1JcDV1OEZjSXp1?=
 =?utf-8?B?aGV5RGljeWltRTJ2RGxPWVRxV093eUx1ekFGWW5iblB2SnArdHpoMWNoc0ox?=
 =?utf-8?B?NzIrU0VLb1NGOFdZa2RhQ3VpMG5rWHlJakJySVJZd24xbFFzd29acWxER2hQ?=
 =?utf-8?B?ZnEvcDhTYytSQk9DRnNpUi9aNWMrUEM3MXM2bkpGdHgzK0RiZktsS2VRYlIx?=
 =?utf-8?B?dUYxcCtxdXozek9oeTlRSFd2YWFrZjRNVzZockdpY3ZEQ3RjdnNpWFc0ZWVt?=
 =?utf-8?B?L25jSXhwMFIzZzZsTnJsOGFmYVlzNFQ2cEVzbEt2cWtqOWtub1BZaHo1dnJ1?=
 =?utf-8?B?TjF6LzhxcURqKzl5cm5ncy9mN0g0NjV6Yi9lZjF6MEVJbk45bko2YUZLSXp2?=
 =?utf-8?B?MThFbE1ZTDFSUTNjeDEzUUdJM2hUdFlaeHB6VzE0ZENwblNCenI2RFFjelFJ?=
 =?utf-8?B?aEQvVEcyMmI0Wmd3UUg0T05mc2k3MGo5SGNYdW9xNUZrYTlXKzcwL3pLUXFV?=
 =?utf-8?B?NEJ5STBXYzhGcFN5NHJzOHhleEF6YVNDYWFEOFZVeEFrbTRhK3BPaXlnVUU3?=
 =?utf-8?B?L1M1YUplcUM3OVBjRmVnUEk3anZwNWVTR0FnOWk2MWV1cEFMTm84cTRtMm1k?=
 =?utf-8?B?VTJlSGhEQkI0OXZjT3FCeTRvY0FmbGk4V2UvVTUxQ2taT2w0MnFjRkhqbTdL?=
 =?utf-8?B?RWptWXk0cVZBSnVrbmJHc2lnMDFDbzN5My9Lb255aVpmbHVYZHNvbkRzOWJ4?=
 =?utf-8?Q?DQjuAKKPX6U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8876.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUNmb2VrYnhUTklieUJFY3BjVDcyZzNlTGhRKzlEMUtiR0xPS0psQkwxcTdY?=
 =?utf-8?B?NndhS0MyMkI3RkN6NHl4NE56bVZaL3J4NGFYUXFqWWhEU25STHV1ajFJd095?=
 =?utf-8?B?Z2tDRXdFcVJoRzJ2K1FTV2o0Z2JpMlowVTE0YWlaQzFhTVlJM2lrRW1oN0U2?=
 =?utf-8?B?N3pWK04yc1FLeTMrYzZrZDZtT05iQWIwVmtkaWNreHdVN2thWGRnZnJiTFkz?=
 =?utf-8?B?bUVIb0lVVGVCZHZJRVRTR01WQ0IyLy8rRVlhVmQzNzJjdmxrQmxKOThtc3Qr?=
 =?utf-8?B?U3JTVS9TNG81d2JPNlFONzlkWm5WeWhZRGdXNW1GMTQwUGNHTlBUZ3VkWjFj?=
 =?utf-8?B?SlRZVVlQL1Z4cXZGUFhPRXNxVG5uTCs4WG5oTFhpOU1KTEVCVUdpMlk0bndG?=
 =?utf-8?B?WUJCRVlpWmJaNmk3WUZhV1ZVdmlsUnNSV3JFMFN0aWZHakp0S1grYk1jdDhC?=
 =?utf-8?B?eTNweCs0Q0JReElrK3hKTFhwYTFBSGVjTzdGV1BFYXVsZHJTUFFNazlKOG9Q?=
 =?utf-8?B?SnZHSVdhY0lVYjVocU41K1E4MGZUa3VLVWJwVVluUEl2MG5EWURFaktUT1lB?=
 =?utf-8?B?elZNRDQwZWdjTWZRVnlsY1NTSUVRVks3ZDl2VTdFdk43UDVLNzRWSTF3UmIy?=
 =?utf-8?B?L043L0g1c3plTzVYeUVuckZCd1FtUU9TSjhXcksvWVFXVGZaL3NtY2FIUVNn?=
 =?utf-8?B?cTN0OEErUGpXRmxmQU0ybkNFUTEyN0tXMW1vZHhYUDRLeG9yV3pJT1BvQTdK?=
 =?utf-8?B?azhUa0dsQWNVeHFDMCtWa0lTbW96aGZuRWJjQWdvYXBlbHZjcEhHT05tRXJI?=
 =?utf-8?B?Qk1TQk1BQ3JLOUFZaFBlM2JBNFlOaU9LSFBvek40SUpTUWVwSXI1cG96M1pF?=
 =?utf-8?B?SkkzeFlPVExHMWtZNHBmZWRLM1p2T3JJRGxLK3ZTMUxXMWlNakFIOFdpTXNT?=
 =?utf-8?B?azZaVC9sWHFWV1hOaElRSGZGekppdGJ6V3JMdUQxUXIzSkYvTzhlcEhOeFpX?=
 =?utf-8?B?SHJtL0g5UkJYNjFWSUIxZGdvS2szdk51VFlramYrYVJZMktUQTBLWTc2b2Z4?=
 =?utf-8?B?ekhwQ1BZbnpjVitFOGk0UEJFVC80U0QxZzQ5OTBWVVQ2M1M0bnFXSlkvRUV4?=
 =?utf-8?B?RDBzUWIzZktQazYxNVVDNkd4VUhUUFJJSUtCN0c5VnNSaWJSL1BuTGlTdVJl?=
 =?utf-8?B?T3hieDJ1ZFhMcFM3NURLbVZlclRhaVBWUFdibFJxK0wycGpGblRpWFlRZDN4?=
 =?utf-8?B?Vkl5TUhLenZyRFEvYnVwY2dvclBWUUFFTjZrVVFHYTZnaHFaNTBHT2ltSXFp?=
 =?utf-8?B?L0J0bmdPMmUydjBlYWo4b0ppQUNkbEdhSnZzMnp5OTNqS2orOWdscmdVbFUx?=
 =?utf-8?B?NmMyU1hnNDVQZlBaNktCSUxHU1BxMkxGTDJrQUlTU3VsSVBySExWdW5uUWs2?=
 =?utf-8?B?R2R4dG5NMnhnUndWQVBSL0lmandISzYxV0V5dVIzaXZ0bVJSMzJ4QWRmNkRG?=
 =?utf-8?B?UFE5ODhsb0gzUmkzSnBLaTZSTlBKd0NGTTdZOWo0NGw3WjZKMDByN085SlFZ?=
 =?utf-8?B?SlV3QmJWYURpZGxjcXVvSW9PaGdjSm5TaXVmVWJ4RDZZK0hPbktpYThXRXRZ?=
 =?utf-8?B?K3kzMzRlMTIzdTB3Kyt2dGgvN0RoSnM3U0pBQW5tUXpMSWk5ZExCZWJ6bkRK?=
 =?utf-8?B?STlaaVZWUDdFRmRSaEt1Smwxb1FvR2g2OUVjaUNCbTBqWEY4bmpnazF3Ylgy?=
 =?utf-8?B?czV5ckswRXZaRGNDeUV0QktZSUJUVUZ5R2FneXhlZ20vaytydEthaCtoeXJ4?=
 =?utf-8?B?Q0hLK1ljZXBsQjRRVkprMUt3eHEvLzFwQ0daSWVyOXZYN1R6TEhKSkg1S2s4?=
 =?utf-8?B?WDlNcEdUclVXRlBBdzZDWld5ZzF5NlBQVExzczhaYy9LK0RQd1JzRkF4VVNq?=
 =?utf-8?B?cTRySGZYK3ZQTGxtcnZ6cEZtRVVaaHZnYTNkd3hZS1lTbEVzMS9NdzlRTUF3?=
 =?utf-8?B?TnVqYVE2ZzdzSHAzZW5iN3VGSE16aGtCTVlBQVJoaDJmNS9BR1RIZ01iVlJD?=
 =?utf-8?B?UDdYWTNjdEp1ZWNvOEJYTGt1SjFhcDJBcHhNSHJkU0NYdk1PM0x3Q3dubUMz?=
 =?utf-8?Q?0WAkEzIERxrnnLY0Dd8PbcK3y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e5fc493-ad28-4d50-dbe6-08dd89d37530
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8876.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 23:45:45.6095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5A7wUsmpwNUzIlKUS+CUvOvlv9MAYskblLLb5VeaTwcpHURRc4qdqojDNIORcs5DdstcGEmAo//NFeM6alCYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7963

Sorry, the content transfer encoding was wrong so the patch might not 
apply, I'll re-send this.


Victor

