Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E3BA2AEF8
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 18:35:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883064.1293151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg5mI-0005om-Q5; Thu, 06 Feb 2025 17:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883064.1293151; Thu, 06 Feb 2025 17:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg5mI-0005ly-NB; Thu, 06 Feb 2025 17:35:02 +0000
Received: by outflank-mailman (input) for mailman id 883064;
 Thu, 06 Feb 2025 17:35:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m4m1=U5=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tg5mG-0005ls-RL
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 17:35:01 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20616.outbound.protection.outlook.com
 [2a01:111:f403:200a::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adf76f26-e4b0-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 18:34:57 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DM4PR12MB7597.namprd12.prod.outlook.com (2603:10b6:8:10b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 17:34:52 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%5]) with mapi id 15.20.8422.009; Thu, 6 Feb 2025
 17:34:52 +0000
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
X-Inumbo-ID: adf76f26-e4b0-11ef-b3ef-695165c68f79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KllGonrAHZ++SDOOdw5LeWw/oQRw0V/iWOl2LMM482McNUioK44WA3VLQ3LlF3/BD2IaGDW5mKvhhms/mRASzHjQ7XBCZ9hOYeW8WR9RCDx6t9X00Csx9wk6KIrIiznmy+Q7IejIeM6dVSBMFLSvRHmAz6KxWPrZWq27jedA5MNkXy00b02KrDxDED8mNW90ezs+mr7rYMBOZezgkerz1jc/+sch7fvANLMh9eeDNyrsOiLVVWqi6jML8LDCJDj+JgynWtpmsNhSPq4L0dX/CsPjek2N5SfDOAJ563YURnrLggImiSiOnH6NHA+IpYCdmKmx4MnFnKtvHPrw892csQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUvUozjqNG1BlkdE5dZXBjsCNYigPlYybxSfXszBOlk=;
 b=RE+idEBsP34fEWWyO3d99ZkqdaytuDtY7IO0c+OChUzLnBOJJd+mQY7lB1BmzLKIdu4477b7xQxpU9D858htszwxDU/nQu1h50o3GnfQhu6blrpQO85zmA9DZMbdj/ja8D6VKvV0eUDwjsDjPFGXrYhWtkS4V0q5mHTisKzwekEAuBl1I85SYEarT4dj3kdjuJQaVmszBGrkNsiXK7MfwacsUteM86faP33u2AHG96h7coBiSE/5169aHI1iQfbSbtRk/+g4fNZqNfOz1SaHvES3aBGORDm52zMjy9QqYazCl8iOZpild99eSJ1O9leoWo9rivIs9LMm3sZz2Z43+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FUvUozjqNG1BlkdE5dZXBjsCNYigPlYybxSfXszBOlk=;
 b=RdlrTXDMww6LfMqutVEfzgOfcUY4dLz1G813qG+/HVNAhRraE/fazZ0NTwBOX/u3PBF8AOt5yvgPFhwWbQlKlfjoedZkQqK/MNIWuI50M2F0sn8ouEq7SN0d0+BSmTrlMmKkw9VLYPZsVo225a0341913D1FkiosEpSsMWTZtmI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3357b3b6-9705-4c26-bfcd-081019de5f53@amd.com>
Date: Thu, 6 Feb 2025 17:34:47 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] xen/arm: mpu: Create boot-time MPU protection regions
 (arm32)
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250204192357.1862264-1-ayan.kumar.halder@amd.com>
 <20250204192357.1862264-5-ayan.kumar.halder@amd.com>
 <1A45084E-DCB3-4014-A95D-0C82286ED025@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <1A45084E-DCB3-4014-A95D-0C82286ED025@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0154.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::28) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DM4PR12MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: 3916f001-e76b-4b01-e502-08dd46d49010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3FyazlyTThqN1BxRFJudUsvenRlT1JrRWZXU0xqNERSa2ZkN2JIdXhQUUwx?=
 =?utf-8?B?Y0diZHRaSGJaYTZEN0h1T3NVa3FFUVV6TmlIbStjYXJQaTc0MHBhSlp6RG1a?=
 =?utf-8?B?ejUwL2F3WEtLK3pRNnduZzlYRlZGVktmWEo5ZkVzaTRYRFMzaElYbmh1aE5h?=
 =?utf-8?B?SC85SXg1OGd3YXI1YXo5VTNiRTVvS3RRQmhXNHNlVHE2dTVaZXBKNFd6Tytw?=
 =?utf-8?B?aGhydmdmRFQrblBNeGxtRTZHL1FJUFpwQVhNaUVYWFJMcjlSNlJJS0dhYk8r?=
 =?utf-8?B?RXdwbW1WL0FHeDk1NTlUS1ZlMWtXNU52TEg5S3pkSFZnaHpTTWxmTm5acldN?=
 =?utf-8?B?elI4aStTVTdoQ0p4VE1odW5RaGdOS1FHdTZWdTlvaXR6L3JTRXp6WXFuSjlJ?=
 =?utf-8?B?czF3UDRHZmxYNFVSZW9iYmdzbVZiVkgzVzRZd1d0VFgwSGJuWUlGQUNZeFlp?=
 =?utf-8?B?dXN4T3dKUjIydkhWMm5mbWpCdWxtNEJXUkVrT3FXeDVaN0xLMitZTnRaQktQ?=
 =?utf-8?B?WmdTZm91UzZESURBYUpMd0ZnK2JaTXZQclFQZE9mZG5zdjNoa3EyZWh2Y1hO?=
 =?utf-8?B?TjQvcTVQWmhHN2xRSzljbWhrYmF2aGgwYzFYZUNvK2ZVMGpZbEt5Wmd0cTZ6?=
 =?utf-8?B?Nm8yTlVIOVkyS3RMNGJUSjNaeWVkNjNZazJ3Q3E3TWJpK3R0dGU1V2JlS2JP?=
 =?utf-8?B?a1dkdXM1SlFzR29kYVdydjlEeVh1Mm5PUFRrUGR1ZVhQaUlkUFM1cWwwZlJG?=
 =?utf-8?B?WVdPTDlQOG5XYVIwdWE4alZONnlFWGVBSC8xaWdMTXN4WTErc0VrdlVONHo0?=
 =?utf-8?B?NXQvaGdCU3JBTjlvbFZrR3pGQnhTb1lZUklGZ1NvNVpnVDVzTDhOOU82UnZi?=
 =?utf-8?B?SWVxN2VOTit3REhhcTJpWFB2Y3JDaVZnZHJJbHF2OU11bFQ4U3ltRkMwMXU0?=
 =?utf-8?B?L1VxTVhZZC9DZTFURm1mTUY4akZBekNkNkl2N05yMFlLTGF3Q3hNV0ltMlF3?=
 =?utf-8?B?VS9Xc2V3REgrTnVWY0hKbGRYNDJ3S0RWN1hIRVFpWFpuVWowbU4rS016aC9H?=
 =?utf-8?B?VXBBeURrVkNjaEZIVXpsZ2ZrSVlNYnVjbEwwcTkzdWpEUnBQdThiVFYyU2FV?=
 =?utf-8?B?NWNKWnFNbGo3dTMwaFdQb2xjMGtMRXNwUEFRN0FBNEttZWFTYjVkeGNXcVBx?=
 =?utf-8?B?dlUzOHRIQlgzc0xwQlBOVzA4V3BwSnFKWXJSbHo5TStkVHEyWjdnMzIzS1Nm?=
 =?utf-8?B?NG91cmYwZnNhODNiSlU0cGxKK09TOTZWY01oZDh6SWtuVnNEeXRYZm4ranJm?=
 =?utf-8?B?cUZObHpJeUF0RE1sMnZZWHh5dnRxZmIxbTlyUDNrV1ZqbGg5NVBJdGthUGtJ?=
 =?utf-8?B?VUwyUzZNTnYvWVgvcytsNFY1emFyS21OeTEzZDM5VEx1MXFzL0NCUHhnQ1N3?=
 =?utf-8?B?S2RTWTVUN3RiRCs5TTNXR096bkVpVFNtNXdTSjdYcmxhVWg4cExhQzlYL2Vk?=
 =?utf-8?B?UHZDWWxyMFlvbTB5VWlPOGh1aTU1RWp5U1N3blNjSEZKN2NPcS9oNEF0ZXpK?=
 =?utf-8?B?QkdyV3M4ZGpqY2JXeVcvbkJoTkRLdENyZTI5N0hsQTN4TWZieERFNU04WENk?=
 =?utf-8?B?TUJFZWtWN0s3NUhLd0lIYTJub0JsTVEydklKZklud055dzhTWExEV1J5enFJ?=
 =?utf-8?B?ME5hWFFxYkQ1RmZLK0t4dkp0Q1g2UGZhQiszYnBBTG8vNkVzd1pKdm52UXVv?=
 =?utf-8?B?aXJZMTZoaTJRNmFuTWFzTkJKTnNFeDl3N2FWRENaaDJVVktkR1JCN1JiKzEr?=
 =?utf-8?B?OXVLZExSOGUrY2ViNkxXZDFpQTFtQ3pBUUM5Mjg0TXdFSlZBdW4zRzR3L1lS?=
 =?utf-8?Q?rFTrLjqSlJJqc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZW90aDRvSU5Md25rOHZyTjFmL2E0NTlPajNiQmNKN3NweTg4dTZacTBkY2Ny?=
 =?utf-8?B?bzY5ZTI5UHc4aExtUWlqRG5BVkNtWG5RaGR1V0ZqZlhianlsMmVlc1dWVDlN?=
 =?utf-8?B?WmhWc2pFQUUrVUxVUEtXSnZ6RzN4Sm5Bcll0TUpvckhsN3FXNmdkUGVDZEpR?=
 =?utf-8?B?M1dJbGh0SUp1UjNTUjUwUm9DTkdkMGJPRFQ3SnVmejJLRVAvRDgvZUo5RXdv?=
 =?utf-8?B?MGowOTRLdlU1eVRXUkw3SzlhdVFsNTR5VHFSbTNpK0RPdklzeTg5Qm9PMDRW?=
 =?utf-8?B?dHlweVhZTXZkQ3B2TFZPUHB2MUV3cVZzakJqeE9DMEk1M2Nnamlkb3R2Wlox?=
 =?utf-8?B?b0JQd1N1MHZNV2F2S2F6NW9xc3BaNDJ0OXBZZ244bDZoeVErNlRmK3FoRXpL?=
 =?utf-8?B?NUtKNTA5VU5TakZ5ZDZOK3c1a3Q4QzVVc25Rd1JKb2JhbDNYQ2ordHJ2clV0?=
 =?utf-8?B?bGtUeWZJVlZLenZhVkZYOGVCS2V4ZW9HTnI4WWNhMmpZdm9vSEphME5iclJn?=
 =?utf-8?B?M0paSnNSOXYvT2VTMXlDTDBScVZld2pvVmRkMzBXRiswUkcxa0FhUkc0UFll?=
 =?utf-8?B?RHpRUnUyZTREQkRlWHFtNldxTGNpYlRNNGppWEZmNEN1ZXBqcWxFSnhZMENO?=
 =?utf-8?B?THdNb2FJdFcrL1p0L0drRlg0UnNFa1RQUDVnM1h3VXE1eG9sL1hmeDc3ZjVY?=
 =?utf-8?B?QlJwS3luT2JxRnBYQVRNSUFTUXlXOU9lVjZUL2hlRDVYaW9hd0Nzd05sRi9U?=
 =?utf-8?B?Mk1wYzRXRkFUZ3E1MStkYVZWSC9yNUUzZnV6aDFudHQvcGFxZzdvYXpUOVRX?=
 =?utf-8?B?YmtHNm81Uk9NeFV5NU0vVkNtNHFBMk1HbHFHeStzMWNOM3drWVhQajAxOGI4?=
 =?utf-8?B?ZHFZMndoT3MwTU9wTjNUT1gvRU5nemU2OG44bmdzK1dWK25JeDA0Q1FCbEZx?=
 =?utf-8?B?dXgydFJLMmNzS000WWFTb0hpMXdwWTNMOVBzUGt1Z2R1MTdYQ1dVVHcyMkRr?=
 =?utf-8?B?UGh2Mmp1djc0TUR3ajh1OTFDa2R0emFFc0pKeDhJZVZtZUFvM1BrUmpVeHZS?=
 =?utf-8?B?UU9WdHhwZGRYQmhUWjVzNlVGME16TE9IWlBFY1UvVjdGTXBrR0svUWo0Z2lO?=
 =?utf-8?B?MDZWT3Nsa2VjNGNMSGdrYnV4ckhDRHBkTDJnVldkamZXeWhDVnpnZ0dBaEZB?=
 =?utf-8?B?ZTA0MUpEbjZBQ1BZZVQ3d0xVUWZNN0o2UXljMTZEalJUSXZTZFR3NVhMTE1K?=
 =?utf-8?B?RjNjbW91Q1g0dHkwTENIS1JMRm1mcTgxbldQdXY5ek9nNDdWSXhzdFh4Smpn?=
 =?utf-8?B?ZWdTakdqditjeWh3am5PeGpKMWozc0s3ak85c0xuUlg1SCs2ckFKY2QrNFdl?=
 =?utf-8?B?dFRXL2VoN1YzdklpUTR3SGFxNEZ3SWFDMCtGTGNGMG54czJCR0lmMWpUOExm?=
 =?utf-8?B?VUtVT3RTUStEa1NKWElKYnB0YmNKUDlUWm45bjc3eFdUdEFDK1Q0T0ZLQWJp?=
 =?utf-8?B?TnNmT0FqSnUvcFJiYVNySkpRK0ZGd205YVV5NjdISmk4bXdPanQ1MW5sTWF4?=
 =?utf-8?B?Wm1wWjBjazZsZzErN2t2NDc5THBsU09uVWdQRHNIblhEMGdneXhyQll1VS9E?=
 =?utf-8?B?eFQ2bmswajZ0eGNYTG4vM2FOdUJrbGFWb2lwSDdNOUhyaS9Fakw5ekVMb1J0?=
 =?utf-8?B?RDFmZW1mWEdFNmlPZ01jVnlON3FqNDFCRGNYWEdoRHFuZ3k0R3JkZ3NoQzBC?=
 =?utf-8?B?WjBDWmV5Wm1UNlRHTHZuN0hhRWVVTEZEVktGQVVtQ3ozbGhJc2lwem82S2FZ?=
 =?utf-8?B?WlJhQVFod2p0Q2I0S2lVRTdONE9EUWFqTWFtaHVKWmR1Y21VLzJidlNDWFQ5?=
 =?utf-8?B?eEJJNTJQM29GaVRoZXZCNDk4dHVxSFJSTTRMM0QvYXN1bUJjbVpaVDlsQ0Ju?=
 =?utf-8?B?TzNOcHlYWVI4RFlxTDdMOVFsT0RTNzlNYmtKd0NUVUZxZmZ6bURiYlBCS1ZF?=
 =?utf-8?B?ZU92bEd6RlBJRWE4UlE5QnkrMUVVTHRCb0JQalRKd1hSR05sTUo4VGppbXJ3?=
 =?utf-8?B?MVpHOHlyc3A5QURHT2lEK05la0FsM2h3bVY1RWxXMUFYYnYvZDZmZzlMdkZJ?=
 =?utf-8?Q?jVs24hvSkyF3ePlq7PNxiSeYw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3916f001-e76b-4b01-e502-08dd46d49010
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 17:34:52.3322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KatUXbq0KKFdChyNEEzUk595MpSrkkCn0AJc16qJfvtNOGDtGsMpioUjuiVa9ECDfryI95Tls2AD8plmKH5K2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7597


On 06/02/2025 15:29, Luca Fancellu wrote:
> Hi Ayan,
Hi Luca,
>
>> On 4 Feb 2025, at 19:23, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>
>> Define enable_boot_cpu_mm() for the Armv8-R AArch64.
>>
>> Like boot-time page table in MMU system, we need a boot-time MPU protection
>> region configuration in MPU system so Xen can fetch code and data from normal
>> memory.
>>
>> To do this, Xen maps the following sections of the binary as separate regions
>> (with permissions) :-
>> 1. Text (Read only at EL2, execution is permitted)
>> 2. RO data (Read only at EL2)
>> 3. RO after init data and RW data (Read/Write at EL2)
>> 4. Init Text (Read only at EL2, execution is permitted)
>> 5. Init data and BSS (Read/Write at EL2)
>>
>> Before creating a region, we check if the count exceeds the number defined in
>> MPUIR_EL2. If so, then the boot fails.
>>
>> Also we check if the region is empty or not. IOW, if the start and end address
>> are same, we skip mapping the region.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
> With this one there is quite some duplication now between arm64/mpu/head.S
> and arm32/mpu/head.S, do you think it is necessary?
>
>> xen/arch/arm/arm32/mpu/head.S         | 164 ++++++++++++++++++++++++++
>> xen/arch/arm/include/asm/cpregs.h     |   4 +
>> xen/arch/arm/include/asm/mpu/cpregs.h |  21 ++++
>> 3 files changed, 189 insertions(+)
>> create mode 100644 xen/arch/arm/arm32/mpu/head.S
>> create mode 100644 xen/arch/arm/include/asm/mpu/cpregs.h
>>
>> diff --git a/xen/arch/arm/arm32/mpu/head.S b/xen/arch/arm/arm32/mpu/head.S
>> new file mode 100644
>> index 0000000000..4aad3c6b5d
>> --- /dev/null
>> +++ b/xen/arch/arm/arm32/mpu/head.S
>> @@ -0,0 +1,164 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Start-of-day code for an Armv8-R MPU system.
>> + */
>> +
>> +#include <asm/early_printk.h>
>> +#include <asm/arm32/sysregs.h>
>> +
>> +/* Backgroud region enable/disable */
>> +#define SCTLR_ELx_BR    BIT(17, UL)
> This is the same as arm64
This can be moved to a common header file if it makes sense.
>
>> +
>> +#define REGION_TEXT_PRBAR       0x18    /* SH=11 AP=10 XN=0 */
>> +#define REGION_RO_PRBAR         0x1D    /* SH=11 AP=10 XN=1 */
>> +#define REGION_DATA_PRBAR       0x19    /* SH=11 AP=00 XN=1 */
>> +#define REGION_DEVICE_PRBAR     0x11    /* SH=10 AP=00 XN=1 */
> these are the same as arm64 but shifted right by 1, we might want to ask the maintainers
> about what is better here
I wouldn't read it in this way. The main difference is XN is 2 bits in 
arm64 and 1 bit in arm32. So, I will prefer to keep the definitions 
separate to avoid any confusion.
>
>
>> +
>> +#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
>> +#define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
> same as arm64
>
>> +
>> +/*
>> + * Macro to prepare and set a EL2 MPU memory region.
>> + * We will also create an according MPU memory region entry, which
>> + * is a structure of pr_t,  in table \prmap.
>> + *
>> + * sel:         region selector
>> + * base:        reg storing base address
>> + * limit:       reg storing limit address
>> + * prbar:       store computed PRBAR_EL2 value
>> + * prlar:       store computed PRLAR_EL2 value
>> + * maxcount:    maximum number of EL2 regions supported
>> + * attr_prbar:  PRBAR_EL2-related memory attributes. If not specified it will be
>> + *              REGION_DATA_PRBAR
>> + * attr_prlar:  PRLAR_EL2-related memory attributes. If not specified it will be
>> + *              REGION_NORMAL_PRLAR
>> + *
>> + * Preserves \maxcount
>> + * Output:
>> + *  \sel: Next available region selector index.
>> + * Clobbers \base, \limit, \prbar, \prlar
>> + *
>> + * Note that all parameters using registers should be distinct.
>> + */
>> +.macro prepare_xen_region, sel, base, limit, prbar, prlar, maxcount, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
>> +    /* Check if the region is empty */
>> +    cmp   \base, \limit
>> +    beq   1f
>> +
>> +    /* Check if the number of regions exceeded the count specified in MPUIR_EL2 */
>> +    cmp   \sel, \maxcount
>> +    bge   fail_insufficient_regions
>> +
>> +    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
>> +    and   \base, \base, #MPU_REGION_MASK
>> +    mov   \prbar, #\attr_prbar
>> +    orr   \prbar, \prbar, \base
>> +
>> +    /* Limit address should be inclusive */
>> +    sub   \limit, \limit, #1
>> +    and   \limit, \limit, #MPU_REGION_MASK
>> +    mov   \prlar, #\attr_prlar
>> +    orr   \prlar, \prlar, \limit
> Up to here this is the same as arm64
>
>> +
>> +    mcr   CP32(\sel, PRSELR_EL2)
>> +    isb
>> +    mcr   CP32(\prbar, PRBAR_EL2)
>> +    mcr   CP32(\prlar,  PRLAR_EL2)
>> +    dsb   sy
>> +    isb
> here we have something specific for arm32 for what it concern the register write,
> maybe we could do something around that area to have a common code that
> calls specific arch-related methods to write the registers on arm32 and arm64.
>
>> +
>> +    add   \sel, \sel, #1
>> +
>> +1:
>> +.endm
>> +
>> +/*
>> + * Failure caused due to insufficient MPU regions.
>> + */
>> +FUNC_LOCAL(fail_insufficient_regions)
>> +    PRINT("- Selected MPU region is above the implemented number in MPUIR_EL2 -\r\n")
>> +1:  wfe
>> +    b   1b
>> +END(fail_insufficient_regions)
> same as arm64
>
>> +
>> +/*
>> + * Enable EL2 MPU and data cache
>> + * If the Background region is enabled, then the MPU uses the default memory
>> + * map as the Background region for generating the memory
>> + * attributes when MPU is disabled.
>> + * Since the default memory map of the Armv8-R AArch64 architecture is
> 										    ^— this needs to be updated
yes
>
>> + * IMPLEMENTATION DEFINED, we intend to turn off the Background region here.
>> + *
>> + * Clobbers x0
>> + *
>> + */
>> +FUNC_LOCAL(enable_mpu)
>> +    mrc   CP32(r0, HSCTLR)
>> +    bic   r0, r0, #SCTLR_ELx_BR       /* Disable Background region */
>> +    orr   r0, r0, #SCTLR_Axx_ELx_M    /* Enable MPU */
>> +    orr   r0, r0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
>> +    mcr   CP32(r0, HSCTLR)
>> +    isb
>> +
>> +    ret
>> +END(enable_mpu)
>> +
>> +/*
>> + * Maps the various sections of Xen (decsribed in xen.lds.S) as different MPU
>> + * regions.
>> + *
>> + * Clobbers r0
>> + *
>> + */
>> +#define NORMAL_MEM_SIZE         0x001fffff    /* 2MB - 1 */
> this is not used here
sorry, this should be dropped.
>
>> +
>> +FUNC(enable_boot_cpu_mm)
>> +    /* Get the number of regions specified in MPUIR_EL2 */
>> +    mrc   CP32(r5, MPUIR_EL2)
>> +    and   r5, r5, #NUM_MPU_REGIONS_MASK
>> +
>> +    /* x0: region sel */
>> +    mov   r0, #0
>> +
>> +    /* Xen text section. */
>> +    ldr   r1, =_stext
>> +    ldr   r2, =_etext
>> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_TEXT_PRBAR
>> +
>> +    /* Xen read-only data section. */
>> +    ldr   r1, =_srodata
>> +    ldr   r2, =_erodata
>> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_RO_PRBAR
>> +
>> +    /* Xen read-only after init and data section. (RW data) */
>> +    ldr   r1, =__ro_after_init_start
>> +    ldr   r2, =__init_begin
>> +    prepare_xen_region r0, r1, r2, r3, r4, r5
>> +
>> +    /* Xen code section. */
>> +    ldr   r1, =__init_begin
>> +    ldr   r2, =__init_data_begin
>> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_TEXT_PRBAR
>> +
>> +    /* Xen data and BSS section. */
>> +    ldr   r1, =__init_data_begin
>> +    ldr   r2, =__bss_end
>> +    prepare_xen_region r0, r1, r2, r3, r4, r5
>> +
>> +#ifdef CONFIG_EARLY_PRINTK
>> +    /* Xen early UART section. */
>> +    ldr   r1, =CONFIG_EARLY_UART_BASE_ADDRESS
>> +    ldr   r2, =(CONFIG_EARLY_UART_BASE_ADDRESS + CONFIG_EARLY_UART_SIZE)
>> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
>> +#endif
>> +
>> +    b    enable_mpu
>> +    ret
>> +END(enable_boot_cpu_mm)
> This one is equal to arm64 apart from the registers xY -> rY, but I’m not sure we would
> want to consolidate that.
I am not sure either.
>
>> +
>> +/*
>> + * Local variables:
>> + * mode: ASM
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
>> index aec9e8f329..6019a2cbdd 100644
>> --- a/xen/arch/arm/include/asm/cpregs.h
>> +++ b/xen/arch/arm/include/asm/cpregs.h
>> @@ -1,6 +1,10 @@
>> #ifndef __ASM_ARM_CPREGS_H
>> #define __ASM_ARM_CPREGS_H
>>
>> +#ifdef CONFIG_MPU
>> +#include <asm/mpu/cpregs.h>
>> +#endif
>> +
>> /*
>>   * AArch32 Co-processor registers.
>>   *
>> diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
> xen/arch/arm/include/asm/mpu/arm32/mpu.h? Where you define all the MPU registers but with
> a translation from the aarch64 name to the arm32? Not sure about that, better ask a maintainer.

I think this will be confusing. IMO, better to keep them separate unless 
Arm ARM specifies some translation.

- Ayan

>
>> new file mode 100644
>> index 0000000000..bd17a8c75a
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/mpu/cpregs.h
>> @@ -0,0 +1,21 @@
>> +#ifndef __ASM_ARM_MPU_CPREGS_H
>> +#define __ASM_ARM_MPU_CPREGS_H
>> +
>> +#define HMPUIR          p15,4,c0,c0,4
>> +
>> +/* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register */
>> +#define HPRSELR         p15,4,c6,c2,1
>> +#define PRBAR_EL2       p15,4,c6,c3,0
>> +#define PRLAR_EL2       p15,4,c6,c8,1
>> +
>> +#define MPUIR_EL2               HMPUIR
>> +#define PRSELR_EL2              HPRSELR
>> +
>> +#endif
>> +
>> +/*
>> + * Local variables:
>> + * mode: ASM
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> -- 
>> 2.25.1
>>
>>

