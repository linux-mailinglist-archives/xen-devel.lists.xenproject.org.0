Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FC7A81265
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 18:33:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943109.1342014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Bsx-0005NB-P4; Tue, 08 Apr 2025 16:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943109.1342014; Tue, 08 Apr 2025 16:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Bsx-0005LU-M4; Tue, 08 Apr 2025 16:33:15 +0000
Received: by outflank-mailman (input) for mailman id 943109;
 Tue, 08 Apr 2025 16:33:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=23Rw=W2=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u2Bsw-0005KN-64
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 16:33:14 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2009::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 284c5345-1497-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 18:33:12 +0200 (CEST)
Received: from MW4PR12MB7334.namprd12.prod.outlook.com (2603:10b6:303:219::21)
 by SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Tue, 8 Apr
 2025 16:33:06 +0000
Received: from MW4PR12MB7334.namprd12.prod.outlook.com
 ([fe80::2e77:557:17d5:86f8]) by MW4PR12MB7334.namprd12.prod.outlook.com
 ([fe80::2e77:557:17d5:86f8%3]) with mapi id 15.20.8606.028; Tue, 8 Apr 2025
 16:33:06 +0000
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
X-Inumbo-ID: 284c5345-1497-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oz1MRE7guYFK5uBy8lGphrYnDJMd24EPlByX0jgF4ZYD46TonWVJnhWSLcFhLjIYAZ/bo5PgdxdKYyMGj+P4YGpXsHSDydggjyJ+USVh7Ym2p8zC3xlgLQea3qvwdTVvwsiSemz2xNXPtEr2tRMkGUcGE10GlPGdBhgP458r4gYy3E3NlV0ZZXZYZt27RgBkwq8O4teJDI7zBjdl0zBhoprNe/vE7+Wdnkzo5ACoQXIM9e+Os9mDI0bkhzoncsvHMopAbDUwBgSvIJKNwR6CZyQuKkJm58sQu5r7044EkGGFJ9dCIXG4yKi3hYDnosBDxYRfvqKTtToPDap775VT6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5HMYBzBPyw+/+xhanZrfwRNnOpeY1ZmNP1ij1VuV9c=;
 b=cooyP71+DUhvBw5xMJEQSEUWTi4yKTG/Fdvv5EPxLNIiw+WKgI9dVYmEJio1a9E0zenEyo89TM/K3DfP9QdXg6zfpgA+QL8X034gcQPA9oYIOyonerK6DqvzMzQR0Si2gklmt2kN/JMgWNXLc2jS4KscH5W15rVSXMGhC3L32E/Y9Y0HyiUBmkOr10peZsmvFr2ZdI5/aD0ivzzR4/7HVoCE80AV004UMTD12K5mfwNxUFny0ftRvFKBQd6D3TlxjbQJyy6vKG2luLd7x5S1POauZNsFvRQ2FEmXYAqpTnW/AT/dzFHz8ldnMsaa2JgNvcu68EJnViZvTOACTJ/s5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5HMYBzBPyw+/+xhanZrfwRNnOpeY1ZmNP1ij1VuV9c=;
 b=ch9spC8gRNec+iVN2dyPJaWVyzTCg9CRybgjRS60eAaUnMcKJXPHLFs39BD8dskMJ6i+XhewStOAW4KaS6DILIBnVmQQmaYLAOWitfHNZLo6HAS8WuzDM99c1sjyf8l2S0VRpBNFxPWLIROPwGkbSfKzE22B1ieoWQ/j53JuxG0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <4f860a56-5536-455b-9490-196bfc220556@amd.com>
Date: Tue, 8 Apr 2025 17:33:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] arm/mpu: Provide access to the MPU region from the
 C code
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250407091430.2342709-1-luca.fancellu@arm.com>
 <20250407091430.2342709-3-luca.fancellu@arm.com>
 <0acf63c0-267e-44c0-b629-fa576307497c@amd.com>
 <1AC85CBD-02B1-4AA4-B9A3-68DFC06137AA@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <1AC85CBD-02B1-4AA4-B9A3-68DFC06137AA@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0390.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::18) To MW4PR12MB7334.namprd12.prod.outlook.com
 (2603:10b6:303:219::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB7334:EE_|SA1PR12MB5615:EE_
X-MS-Office365-Filtering-Correlation-Id: c4ed8412-b847-4135-5b2d-08dd76bb0a63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVBKa1lacE16MUliMWRkWnNqdG1UM1IvbC9rR1AvMDc0TmJvdWhvUWMvSDNP?=
 =?utf-8?B?MHY4cjIrZGhMQ2VIdFpCRHFZU2hXOVRoQWwyZ1NjSXRQaTJLTjVLd3pnVkJN?=
 =?utf-8?B?M2QrYWE4Vzg3c3JzdktEbTFlS09mbXNoWmNkaGpnTlhodjM1ZW9MalFuY1ZX?=
 =?utf-8?B?NDBHaDdMWVBNWUNlUGROdE5TNUhQQkFlZFVrZWl3T05SbCtKb1p5N1ppWVhv?=
 =?utf-8?B?TjJPTXpNNzk2dUFLNkJTaEtmSXh0ZFRxMWo1Ri9CMGlxTm9XVXdNSTRCMnl5?=
 =?utf-8?B?ZjBDM0N6YjI1MHNTVU03alltUERUNDlaZWg4R3hwM096OFpUODNtMDBBWVJT?=
 =?utf-8?B?NXNnUWxXK2d0WkxtNTdKRC9UY3UwZEl2ckpPNzlDeVcxSCtyTmxlM1JJaFdJ?=
 =?utf-8?B?dGVuUjlGMkZYVTNDbE5OZ05hd0ZMYXppMHB3OTBSNXp3djkwVE9lYnQrMThY?=
 =?utf-8?B?NlgyMisveHZ1U05nY2VsVUpFRUw5OWNlUlY1UjNwaHJVVVFISW1aS3cxc3Ex?=
 =?utf-8?B?aEhmSVdsd2pRaUdDaDJYdHoxZ29tZVczYUhvMUhjaTI0NjFlSFRYbmRtdlZt?=
 =?utf-8?B?S1AxT2NxRnFwNThBN2d5M2Q3U1FjaHQyVTJwNnIvemJCSVlCNHhtVjNYcmgv?=
 =?utf-8?B?cVlWU3k3Q283VG44SlQrYk55TWRGOTVURkYvaGxwQUFLMkFKUXZRMEF3b0dC?=
 =?utf-8?B?VDVjMmRJYkZpc3NWMkNZRVBFS0xSYnlHR20vNlpWTTlyVTdaWk9TNW82S2Rn?=
 =?utf-8?B?ckNDcUpDcWd2WHVXeStTLzlnaktXNmRPNjFtdzVIWGpSNlJ2aVNVaG5rUGE4?=
 =?utf-8?B?RjRiNXRqa1BzaEtMVVZNYm5kOUpEZnJGaXFrTEdYcWMwZ3k1Y2pFTm00UDlI?=
 =?utf-8?B?c3dUQ21IYU1wZHBta2ZwWnVrUnJQWGkwaldOcXU5d0VoSGEzTEJhOVdSaWlG?=
 =?utf-8?B?YXJDRFVISmZYOXVRN2lpVE1FWDFKQ2hhSFpra3pTZDd4a3U4Y1NmNTY4bmNO?=
 =?utf-8?B?aWlVSDhRQWJUdDBubjZ2dkxjd1A2UGVrNEFNcW4yL1U1cXB5UytOajhqNlRz?=
 =?utf-8?B?Z3JOVVh0L0J2c0FzNlFtbFFCRno4YW0xMUxSNXhyV3dzVDdDVFN0US9tZmdU?=
 =?utf-8?B?eHJRR3h1WTArU3FnN1h0WWhoZVVIR3RpUFdOZjJKK0dDTytjcWR6aldnSEF2?=
 =?utf-8?B?THJoYnErdnJQZlZGNGhCZHBGa2NFNlhEcFEyWEtWSEo4Q1kzZzZBOTFDbkxG?=
 =?utf-8?B?WGxqTnQ3aEkxRkpYVFZjQzY5TlNOKzJXNldBSEdJWnlLTi90Z3RnSURTbXlP?=
 =?utf-8?B?dzlscHMwREVFekl5TDFJdVFoTzRmeS9vY0JRMDI4MGY0bFlSY2hXVEJYTnR4?=
 =?utf-8?B?dk1rVC81MmVzQ2dYbGhUZW9zWEFCNzhXVW9VU0FycHgvRnRMMzFBVE9sRzB1?=
 =?utf-8?B?M2RyUzNFMU16WlpMWGJOTUNNUlFLcW5EcXBLSVB3WFY2QlRSZlJyUUlNRHor?=
 =?utf-8?B?NjhzSU9GQXNwRmhIY1hlbWNodUthOVROTHpWbDR5MmNDQXlNR25yRjJKM0dD?=
 =?utf-8?B?VU9LQ0d2aUpBTjhwci9ieXlIOE12ejA4MmNNY3BMa1hLUDZHQTJ0NGhMNVQ2?=
 =?utf-8?B?ZWN6dWtkNjVnTXJPeFdrbWZGOFhSZFM5M1hjenBiaEFVWWZaM2tEUjBUeFAz?=
 =?utf-8?B?a1BmdFF6bUhlbDdGbTBWMUZoRGs3eGdZd3dGeXEyWUlEdEo2TmR0T25PN2Rr?=
 =?utf-8?B?Z1cyTTUrUjNxMko2T0pOREZkeGdXTFJpaDJ3V0hZZjcxSUdWN1R3eHpMTnY5?=
 =?utf-8?B?M3ZqeEhuWFpIOWhLcTdFcStGaW1WcUJzZS9yQUgvRDJHd28yQ3RTWXRxaUhw?=
 =?utf-8?Q?3gvka7qmW9LAs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB7334.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmhoSjFoQWtOQU8wak5ndnhkTWpJRkxOYmoya1ZoWEJoTWtzcXNOUlVRTXJC?=
 =?utf-8?B?L3BUMlJCV0xUeFFMN0N4RTVsQzJwSitZdXUxcmpObFllandrcmxpbm02eXFi?=
 =?utf-8?B?SzF1bEhhbjQwZEtTSStKc0JhNEVDVkRrUlB2VXIrUThRdE1RY0tGNmM3dVRk?=
 =?utf-8?B?R29rSExaaG9FZ3pjOVZCTW1aS1g4ZWVTNk8xdUY4akxENG1jTkFrcFlIYW1M?=
 =?utf-8?B?UG1wSEFjNUthaEJBMm9QQTB1eTUySjJDOXRsUTlOYTk1MkhDOFE5aU4wcTJm?=
 =?utf-8?B?bHAweENvVWVBMDZLTi9nR3FWb2hNNi9JakRORVhFL1NpQkNvdXJHWkZoZjJp?=
 =?utf-8?B?R2dIbUVhRUd6RFN3STg1cHNqaFI2aUZLM0ZHblhmQVdORGJ6VDhrZnk1cVVE?=
 =?utf-8?B?L2dMcDJ1MUhOZ01NZ0FwQ05XdG5yc0lmS3k2UjNmOFJXb2tUYkd6cE5OUTFN?=
 =?utf-8?B?ZGpKQkhkdHA2WHN2TXhvdnc3WjNBVFRJSERMTmx3c29NNmNBTk04WmhRUzRU?=
 =?utf-8?B?aFdzQ2hibVpVYVpVWE55VXZtalhaeUpsaDhKZFQ5TFV5SzRmZUYvanJsZTU0?=
 =?utf-8?B?WkxpMzNHVEhxb3hnUm01WGNWZGIwbnF5RGl4aGIvNjRkRTFJMmlxdFVVK00z?=
 =?utf-8?B?a3ZXRUZROXVudnZpR2s5Uzg5eEE4VlE0aVVDQU5pamVjZXlSK1k4VmhqVHk2?=
 =?utf-8?B?a1RQaUliOExvNVU5eVA5WldabzZjK21sa3lQdldZWnBTR1BpdUYweXFxam5L?=
 =?utf-8?B?QVlyWXNONDdBTzduVWw0VWZpVW5aOTRDQ2pTSjBzQW1yNlBDV2dFRjhWSzRD?=
 =?utf-8?B?aU5QdGlaTGhuclIvYzkzaUV0QTBFTmluQWZtdityYWFEa2VJbFBlNStjWEtK?=
 =?utf-8?B?MHo5cll1V0RDY3F3S1Zvckxzd3BpU3Q4bGlhNVlYcXVVRkQrWW1SVXZXZ0s2?=
 =?utf-8?B?N3RkdG1pNEQ0Y0MrUkhVVWFHUklqYm1oOGp2bWUydnkxR1A5cnY5QmlOR3Zz?=
 =?utf-8?B?YUd6ZG1mcnNpY09kVUpIbUZqdXNTeTdyRlBnSGRRQThiK1FFVklFam12cXNt?=
 =?utf-8?B?SzYzcWRJVmEvZTBTUHhhUVY1aDBZdTJISlk0NlBrVXRSWkJvbGhQMUk3MU02?=
 =?utf-8?B?Y1ppN2wwUmRxcTVveUJyMDlOQnhjNnloMnBIcEl0TFYxZGZOY0Z4bXBRSzhZ?=
 =?utf-8?B?SVJZd3NjT2Q4akYwZTA4SDE3QlJ4b05DemNWSEhldDZzRC9ZaGRodGRJS2pK?=
 =?utf-8?B?bVRxRUlMSU9Ic0VBL1JZSkF0R1BjcnlLV0theTJ0MWxPczBGZUl6Y1JlRnFG?=
 =?utf-8?B?WkFzaHc5VTJlenpMOFhlUlBYbmFOcTk3Y09mRkRubnlST2lRdHU0ZnRJMUlG?=
 =?utf-8?B?Z2lsV0JTVFFENTJ1Si90Uk85bzJsQ0JnSEtIazF1T08yY1VYMTJXS21LQk1X?=
 =?utf-8?B?QVBrcmVkQmlLeXV3c2p5aENRUHFWRTVnTHo3Nkt0NUdNdlplNk04TGFHcjdI?=
 =?utf-8?B?YWYrYmRpT3NoU2M2YzJic1N1eHo5a3lUNkNtenhoWUYvWXZER3M2aG9oMS9Q?=
 =?utf-8?B?YTE0cFZmSUJsTklSQW45K3dKYkpGV2dpaUlkK21jWm9ibDNEZExCNE13KzIw?=
 =?utf-8?B?LzJyd2RJY1IvSmdKQTQxWmZ2SzJvcThabm1HRHRhaXltRjdjTHRoNkFsa1BZ?=
 =?utf-8?B?UTZ6MHczcVpNL2loL2E3aXlrLzNCVGxsMHVWWk5MS1B0VU9PeGFJeXV0YklH?=
 =?utf-8?B?ZUFKTk8vZlljMjRKb1VrS3RJTzkxS3NxeEp4aWZTbUJScERXN2k1U0RSTEtV?=
 =?utf-8?B?aHpVb2M0R3VVRUNvQnd6MHZNbXZZY3ZEWm94SkhMbHFzaW1ncnpHN1Z0TFQw?=
 =?utf-8?B?OVpIdUpyN0JLN3gwZkF0WmxYcVhENUJYdU9RVHA5U081ejFhUkRRZG9uaXB4?=
 =?utf-8?B?M1pRWWNFYzRhMERUQWxPWnI3K1o3cHorQ2Y2UnVTWkp1eWZuZDhGWDlTUElo?=
 =?utf-8?B?Kzg1YS8wc2RtbWxqMHRwamlMQm1hTWk5MjhVTEJhUnhUSUFwSkhuaTBjRmlx?=
 =?utf-8?B?WnJFNFRsM25DRFI2cFEzd3ExOEMydjl5MjJDN1FZM1gvWWxwajdVK1NGbnhM?=
 =?utf-8?Q?EEKh+lmtJEaADs5uBDnG2uLor?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ed8412-b847-4135-5b2d-08dd76bb0a63
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7334.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:33:06.4971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MnU9HjIdxntzPEe4o/YojYcp64y9x+ZAoXV+bDC8rEiy79KBUREKJLh1/WA5VS6rAojiADO3myMmnHZ6zc2RSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5615


On 08/04/2025 15:29, Luca Fancellu wrote:
> Hi Ayan,
Hi Luca,
>
>> On 8 Apr 2025, at 15:02, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>
>> Hi Luca,
>>
>>> +static void prepare_selector(uint8_t sel)
>>> +{
>>> +    /*
>>> +     * {read,write}_protection_region works using the direct access to the 0..15
>>> +     * regions, so in order to save the isb() overhead, change the PRSELR_EL2
>>> +     * only when needed, so when the upper 4 bits of the selector will change.
>>> +     */
>>> +    sel &= 0xF0U;
>>> +    if ( READ_SYSREG(PRSELR_EL2) != sel )
>>> +    {
>>> +        WRITE_SYSREG(sel, PRSELR_EL2);
>>> +        isb();
>>> +    }
>> This needs to be arm64 specific. Refer ARM DDI 0600A.d ID120821
>>
>> G1.3.19  PRBAR<n>_EL2, /* I guess this is what you are following */
>>
>> Provides access to the base address for the MPU region determined by the value of 'n' and
>> PRSELR_EL2.REGION as PRSELR_EL2.REGION<7:4>:n.
>>
>>
>> Whereas for arm32 . Refer ARM DDI 0568A.c ID110520
>>
>> E2.2.3 HPRBAR<n>,
>>
>> Provides access to the base addresses for the first 32 defined EL2 MPU regions.
>>
>> /* Here we do not need to use HPRSELR for region selection */
>>
>>
>> If you want to make the code similar between arm32 and arm64, then I can suggest you can use these registers.
>>
>> G1.3.17 PRBAR_EL2
>>
>> Provides access to the base addresses for the EL2 MPU region. PRSELR_EL2.REGION determines
>> which MPU region is selected.
>>
>> E2.2.2 HPRBAR
>>
>> Provides indirect access to the base address of the EL2 MPU region currently defined by
>> HPRSELR.
>>
>> Let me know if it makes sense.
>>
>> - Ayan
> Ok I didin’t get that before, what do you think if I modify the code as in this diff (not tested):
>
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index fe05c8097155..1bc6d7a77296 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -58,19 +58,21 @@ static void __init __maybe_unused build_assertions(void)
>       BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
>   }
>   
> -static void prepare_selector(uint8_t sel)
> +static void prepare_selector(uint8_t *sel)
>   {
> +    uint8_t cur_sel = *sel;
>       /*
>        * {read,write}_protection_region works using the direct access to the 0..15
>        * regions, so in order to save the isb() overhead, change the PRSELR_EL2
>        * only when needed, so when the upper 4 bits of the selector will change.
>        */
> -    sel &= 0xF0U;
> -    if ( READ_SYSREG(PRSELR_EL2) != sel )
> +    cur_sel &= 0xF0U;
> +    if ( READ_SYSREG(PRSELR_EL2) != cur_sel )
>       {
> -        WRITE_SYSREG(sel, PRSELR_EL2);
> +        WRITE_SYSREG(cur_sel, PRSELR_EL2);
>           isb();
>       }
> +    *sel = *sel & 0xFU;
>   }
>   
>   /*
> @@ -102,7 +104,7 @@ void read_protection_region(pr_t *pr_read, uint8_t sel)
>        */
>       prepare_selector(sel);
>   
> -    switch ( sel & 0xFU )
> +    switch ( sel )
>       {
>           GENERATE_READ_PR_REG_CASE(0, pr_read);
>           GENERATE_READ_PR_REG_CASE(1, pr_read);
> @@ -140,7 +142,7 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel)
>        */
>       prepare_selector(sel);
>   
> -    switch ( sel & 0xFU )
> +    switch ( sel )
>       {
>           GENERATE_WRITE_PR_REG_CASE(0, pr_write);
>           GENERATE_WRITE_PR_REG_CASE(1, pr_write);
>
> And later you will use some #ifdef CONFIG_ARM_32 inside prepare_selector() to check
> that the code is passing up to the max supported region or panic.
> And in {read,write}_protection_region() you could add some #ifdef CONFIG_ARM_32 to add
> the case generators for regions from 16 to 23 since R52 can address them directly.
>
> What do you think?

I got this diff working as it is for R82. This looks much lesser code

diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index fe05c80971..63627c85dc 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -28,23 +28,19 @@ DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGIONS);
  /* EL2 Xen MPU memory region mapping table. */
  pr_t xen_mpumap[MAX_MPU_REGIONS];

-/* The following are needed for the case generator with num==0 */
-#define PRBAR0_EL2 PRBAR_EL2
-#define PRLAR0_EL2 PRLAR_EL2
-
  #define GENERATE_WRITE_PR_REG_CASE(num, 
pr)                                 \
      case num: \
{ \
-        WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, 
PRBAR##num##_EL2);  \
-        WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, 
PRLAR##num##_EL2);  \
+        WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, PRBAR_EL2);  \
+        WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, PRLAR_EL2);  \
break; \
      }

  #define GENERATE_READ_PR_REG_CASE(num, pr)                      \
      case num:                                                   \
      {                                                           \
-        pr->prbar.bits = READ_SYSREG(PRBAR##num##_EL2);         \
-        pr->prlar.bits = READ_SYSREG(PRLAR##num##_EL2);         \
+        pr->prbar.bits = READ_SYSREG(PRBAR_EL2);         \
+        pr->prlar.bits = READ_SYSREG(PRLAR_EL2);         \
          break;                                                  \
      }

@@ -65,7 +61,6 @@ static void prepare_selector(uint8_t sel)
       * regions, so in order to save the isb() overhead, change the 
PRSELR_EL2
       * only when needed, so when the upper 4 bits of the selector will 
change.
       */
-    sel &= 0xF0U;
      if ( READ_SYSREG(PRSELR_EL2) != sel )
      {
          WRITE_SYSREG(sel, PRSELR_EL2);

Please give it a try to see if it works at your end.


And then, the code can be reduced further as

void read_protection_region(pr_t *pr_read, uint8_t sel)
{
     /*
      * Before accessing EL2 MPU region register PRBAR_EL2/PRLAR_EL2,
      * make sure PRSELR_EL2 is set, as it determines which MPU region
      * is selected.
      */
     prepare_selector(sel);

     pr_read->prbar.bits = READ_SYSREG(PRBAR_EL2);

     pr_read->prlar.bits = READ_SYSREG(PRLAR_EL2);

}

The same can be done for write_protection_region(...)

- Ayan

>
> Cheers,
> Luca
>
>
>
>

