Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C0FC63F8A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 12:59:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163625.1490711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKxsh-0005aI-0s; Mon, 17 Nov 2025 11:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163625.1490711; Mon, 17 Nov 2025 11:58:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKxsg-0005Yr-UI; Mon, 17 Nov 2025 11:58:50 +0000
Received: by outflank-mailman (input) for mailman id 1163625;
 Mon, 17 Nov 2025 11:58:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RXl4=5Z=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vKxsf-0005Yj-ER
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 11:58:49 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6089c89-c3ac-11f0-9d18-b5c5bf9af7f9;
 Mon, 17 Nov 2025 12:58:48 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA2PR03MB5740.namprd03.prod.outlook.com (2603:10b6:806:11b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 11:58:44 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 11:58:44 +0000
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
X-Inumbo-ID: c6089c89-c3ac-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fDgmWiPq052n0U09LG4XRbkjDL7PWZhCQFuO/4IoqnpeBPShRw2Yn8dHozmnVukApBbk57aj/5sREnVI3MvchEekqWDY4DwW5RXjMBVIEXLG5jRs4XqqYgB1KdbNSDMAOVj3QDGfvcxtjkUUGCjUHD5JLKTRyvBh/Bp+peB8Fd7rgLGdeTm6rRK70qbd/uOWaRrsKCNA+3CNuGK1BRNsApuuc7YWMfm7QrE4GIeSLxWOyVoTgVpse+IkGs2q7HQRDlJ/1mDrq/HwQY+L794tpQecRP3De0Q4vOntlL47RgE06NN27BEhtE8yuHKpqxXFVIFW/IcJYnBOOmZGVcG28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXOwgGuSEZnkIlEvTVf4y/Ty3nQxbky0qYGtI6rAeYc=;
 b=OV4pfn7NQvJPO6ccMtn9/JKODAZMOZ+LDWKABusVlkDdlDuKJbXEMZroiJ2gTOl/NqejsSTcE2RnQ5x6nSOGabAGWopCfhdwGkKvyVGlAG3YOfFg//LCQQFAArIQiyCf47ldpCflbFEYisMIGV3cxCBGfbzuOE16q7Rn8pXfiKq5Vr6QfaPzAA/+gUQW0aSMgKAfCYdzdpqCRVrr5RyfE+DnH5jfXKa+6Crkt3c49p6pEV0t6cPOVu6NANY2QxsCIxhQeZD4nns5RtUDJj09thPoO8RZ9CS5FZtxRrs1HobF4QQz4vHXldoEdy5jfTKdfF8b0sMe9Ww31jz8pSlLqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXOwgGuSEZnkIlEvTVf4y/Ty3nQxbky0qYGtI6rAeYc=;
 b=sP9eRXtLGlnXgL9Sn6/6+LdSuKTlrKM3bQgKc66m27VZa9qE8llgQZqzZCBIV6C1eAuOAQ71HJgahsXXaDEfQjZmdnM+Nskias5GVIpWUR2EC+Y8jCsVnC1wPOa0boVM6cvhOfQLw0lkM0g7vZAX6YES+0XxeMaI41lQX5glZ44=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ac2377d2-54eb-49f5-8906-a9745baca534@citrix.com>
Date: Mon, 17 Nov 2025 11:58:41 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] x86/ucode: Add extra rows to the entrysign model
 table (again)
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251114152447.272823-1-andrew.cooper3@citrix.com>
 <2db5085c-a04d-4745-8fc7-5e257ab30926@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <2db5085c-a04d-4745-8fc7-5e257ab30926@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0122.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA2PR03MB5740:EE_
X-MS-Office365-Filtering-Correlation-Id: 43b5456b-2d47-46e2-1124-08de25d0a88a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkpRVW5zTWROSmtTWnI3TmI3RWt4U0h2R3ViUmNDWDA4YnJpNGJwRVpGWEFZ?=
 =?utf-8?B?TE4rWHBWTTRnSGk4MXdYNXpaWWh5aGtVeUY2dGlEdTdjN3JvWjd1UnZQR2ha?=
 =?utf-8?B?ekFVWThMUTlET2pWblFwNnpYaGpMMlhQV1p4QmtIY0krbEZXbG9DSzl4R3Ev?=
 =?utf-8?B?dE5HSFd4R0NUSUlxUU9XSmdwVEZVQmZVSjF5QmxydkYweWxHMGYvYzBNY3pU?=
 =?utf-8?B?UGErQ0krT1dobm9SVFFNc00xSmxEZDdIVVBpMm5yZmVXRCtGbklzajFmSzRj?=
 =?utf-8?B?bFc2dVVuZERpdjJEY1BxekVKemRhSm5mVU55amQ5YTlGRVVVcUlxczBCUk5l?=
 =?utf-8?B?ZDRBUE40bXErVE12akVockQyQlRDYWJZbVFrRVpjcEhHY2c5dzBPRjNSSE5I?=
 =?utf-8?B?eEc0WTB3QjlrT1JFOGlxSnB5cDl2SUVqU3pLLy9GVmJ0NytCTjNMMmFMVVZD?=
 =?utf-8?B?NDZzQ2tKTEJFWGhmV3kwVnlFSi9QK3dwWkF6ZWh4aTZQWkh2Mm50WC9BeXhn?=
 =?utf-8?B?ekZ3MWljSFRaUFF0UjhhbkVXWTVsNGxhdlZGUXp4WEtlZ011Q1R4dTAxVTNr?=
 =?utf-8?B?UUVIYWtlNGxpQTRWMVhjcGdwZHhnUlRUTXVrblFJR1oyK2JhVXp0L0g5bW1J?=
 =?utf-8?B?aGU2dlNTUUE0d3kyUUl4d0NWTkpwV0hyRVh4Q3c4NkRSZTR0T0RxYTQwNVBo?=
 =?utf-8?B?dnJVTExVR2VraDd4cDd5WDZJRUxQandyWjR0eXIvNHN4RGJ3cTZRSjlkbXBM?=
 =?utf-8?B?U3l4QlhDSVYwRU9vdjJnM3F5dktLVHFIVGJCWFJUZGF6am83ZGxMOXdNZHdE?=
 =?utf-8?B?cWNyY0RTaStFY3F2ZXoxSVhuSmlTdWFhZ0E3Q3VCcDJZRW9lZkVYRWdmTk5Z?=
 =?utf-8?B?ZmFXUW5sczk3bkxXVEVxZzRXU0w3dGtrT205NStXYjdvbk5lTnl6V0ZWRDF5?=
 =?utf-8?B?dUtVQ2JuZnQ2Q2ZwRDN2eGNQdzEvdncrVHFvSWhCbVdZNi9TbCsvcEJCRGl5?=
 =?utf-8?B?QU9TczZWaXhvTmgrQmNPSktOOFFDbFBaSU1uY0c5T3Z1UWtabUFTZzdGWkQr?=
 =?utf-8?B?cW1pYlZXK3I2ajI4d05GRERpZVJNVFg3ejNWSGlyV04vK1Z2UjJxUXFZV3hj?=
 =?utf-8?B?TWEveXp1OUNNMy9FajFUWUpCc2NDL0UvOFpQL1YzSjZPT0xySU9KNWZDbDdI?=
 =?utf-8?B?UE9HWEFmaTVoS0d3MW5sd1FOTyttYWtSUkY5RW5LYWJqOXBESGFySFgrZUdq?=
 =?utf-8?B?SS9TNmNqQ0pVRkl6VEtaeERVcUlRc2JQeWJlVTVsMHdvcjM3Z1p1MU9NRnRM?=
 =?utf-8?B?MFY2cnRlc1ZVVnhsLytsUWR5SDdtOXl6U3phSjRmTWk1L3lyRHJRdmRKQWVZ?=
 =?utf-8?B?MEtyTWtqOURTVVdhcDRCQW1yM2IzV1VYVDdqajlWTnl4dG9GMUxZK2ZqTmts?=
 =?utf-8?B?bk5oS3JSK0dzbkNnRExOcE4rYnhXajg4SzBMMFlZQ2Iwa3BMQ2QvZzdEZDRN?=
 =?utf-8?B?TWtGTWVYV2V1TmtBYm13ejhlZlZ2MHlwNzdLajJOQmgrMEpjRklETmVJbFVL?=
 =?utf-8?B?a2ErQlB6UU1OWlBObkR3QXR4emNtbEh3TjJpWmlRYmpNNm9ycFRTNTJoSTQ5?=
 =?utf-8?B?NXR2MVNmUk01c3NMR1NVaHB0UmtpcmFUNzgxY2Z6S0ZwY05Hczk5SDh1VGMw?=
 =?utf-8?B?NmZXNUVvYUExdU9ESExWOTdDcWhMdXRBVURVQ2NGNkh0T0o3T2p3ZkNLdWpj?=
 =?utf-8?B?TUxmV0QwSjh5dEJ1U21NdEIzcUFvUmtHdzJnWnNpdlYyNmk4c0V2bUdNaWFZ?=
 =?utf-8?B?dnhZNFA4KzY0d3Z2Mm5wTGRJbFVBUm1UTnBXNTRWZUxyZWFkU0JSTzBDTGcz?=
 =?utf-8?B?TzRPR0tsQ3pPWS9zKzJVeUFjUXJNK2RqaVQzcmowYVJ1YlFHb3N6ZUtUSTJh?=
 =?utf-8?B?V2V3RHNwb3VCMWt5dk1uNStEU0dmbXc1Vit4NGhoQ1JpN2h6Zy9kYUNrOE9r?=
 =?utf-8?B?ZFlHV3h6MjlBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1duS25oNERtSUI3S1FwZ0ZWV21aMXRkS3Fqa01ld0dmbE95dTkwbUs5OExC?=
 =?utf-8?B?WkdndkZ3aEpXY1F6Y1NWbzdpa0RNcmdNYklGUVB1VmJzZWk1Y2ZpV1RtSXdW?=
 =?utf-8?B?SmovcGQ4UjBFZ1dYWE5SOG0wVnlJeVFEejN1MkxFK2FIYXR5WndCQ0RjUDUr?=
 =?utf-8?B?aVZOVVhKNFV6RWJHSW0yNU9JaFp2bngvYmdTT2NLNG9CWEt1OUNVM09IalE1?=
 =?utf-8?B?U1c1RElqRVpjQ29RVkdvRzhnend2enlrMk4xUHEvdGRhT0NaSVhDZlZ0eGJl?=
 =?utf-8?B?b2tnSkJSK2NISk04NU9TaUNOdndRcUoxSjNSS3UvdnFEb3RlZHBzM3RxbUFV?=
 =?utf-8?B?ZWdrdUdGcSs1Z2VNU2d3S2MrM0pjbWpzS2ZsdGxDWXV4RmtSNDZiZkRsL01k?=
 =?utf-8?B?b3BiZ0xHZEs3dnhhZUlFZlBFejltdm0rb0JHVXMvZmZTRU1CcnpWalNHeTFQ?=
 =?utf-8?B?Z2JJRit5Q1dBZUY1KzdrWmZuSlZsME5qbFhDVTBRaWs5OWdzVmhVYnQrRHUx?=
 =?utf-8?B?eEE0RzEzNkowQVJsUFc0THhPY1JtZHpnak5rQWdMbU1zQllFSFcyaEEwMDc1?=
 =?utf-8?B?RFNxWGZoYnhsaTlVTE44K3cvelpQNWFKNW9hRjNYSWd5NlNkT0FJZ3Y1S3ZD?=
 =?utf-8?B?cHFybk12M0crckdOZlIvMGhhM3A4eDZyTW9va0FvRGpVY0FIVk5idzdpMFFJ?=
 =?utf-8?B?cFlqd3ZKVGljWVgwclBoREtBWVdwdkNqMituS01vbzA2QmxMeWNlNGFncVR1?=
 =?utf-8?B?MUEvdGZmcG1PY2hDTW1URldpV2gvL29LYkZ6NTc4NU1QdTBmeFg1bUhDcXh6?=
 =?utf-8?B?TGtDcWJLZzFyTUF1VzhvbGZOdHptT2NRWjdyT1IzM1hhVjdNSWdpUEk4NUU1?=
 =?utf-8?B?ckZjZXR6RkczNkNWcjY3R0hvc2FCdVJTZTFXaksrczFWQjVRMTY5SmhBTkhu?=
 =?utf-8?B?cHo5U0pScHJyM2JHMDBzZ2FnRUpFUDRpdFNibTU1eUw4QjRFaUxkanphb3RK?=
 =?utf-8?B?cjJ4UmNodWltUDA1ck9WbDF1ZWh6enROTlV2WSs1a0h1eWtBbTRUWlRoYWZT?=
 =?utf-8?B?ZzdqakFNMDMzb2ZTVHZTd0lJYzZ2d3d4WWtpbjlFUzF4S2ZiaitzZXN5bEZH?=
 =?utf-8?B?S1JsSVRnRExYZEw5bm5XZWpBamRRb0trdmxKcjJod1RKeEs4QTVHbXQxb0lG?=
 =?utf-8?B?R0JmRGJLSFJtZ3kxWEN1bzdTNHhsUnRyZ3NUTXhCcXQwY040ZXpKeUE0Nnha?=
 =?utf-8?B?RVAwajBkOXppNUlqREhocnRSZFk4Y1BTMzNUcW9HdUJZQ2NBTzNEZ0tOMlJH?=
 =?utf-8?B?dGVWV215M1hhSVVOMFRTT3FMQXlrQndCazhVeUV3RnRFRVN2K1pUellyUnBv?=
 =?utf-8?B?YmdWZE9IdExCTm1GVmFIdG5TcnBoMXR0ZUdVL0Z5Z2NoYmVDUjYzRVgwL0c4?=
 =?utf-8?B?QldrK1grRnNCOENya2M5RGtaam54bU1GdVRPUC9RYU90ZDFnVE5vUmkvL2lX?=
 =?utf-8?B?YzBxc2RlOHYzM21hQVRwa0dYTXJnTFEvdzRhYWdXM2lHWThBK0JPUGRWeHB5?=
 =?utf-8?B?Y3JQSlZteGRtRVhBVDdqcElrV2lsVTVja2lsV1ZKalRweFR1cWp0Mmg1QnZ0?=
 =?utf-8?B?Wm1ZQnVwTFI2YVRHTmY2V3lkS1lmYmhrdmZGUURrcEFURDdaWXVsVzBacmRk?=
 =?utf-8?B?U2I5cVo0TE9MeHBUQU9LMHdlSXo5S1NiZ2t1NFF4M3NjQzM3MlBxWG5mUFIw?=
 =?utf-8?B?N0dNOGo3VXZQZGs4MUlsOEx6enpGbzhYQlU3TWNYT3J5UTBRK250Z09aOThD?=
 =?utf-8?B?YnplWDcwa3BxYldMbjMyZ01PWUFMOWpiVktvaXM2TUNkQ1FoNjF2QTFVZTNa?=
 =?utf-8?B?VjVHVmZRcEFndkYyeGdnYmRPeHk5TVlxYjFUOUpybVVlSVQzTlhodlhicXZ2?=
 =?utf-8?B?S1FCWnpRS01hTnNFOGE3Y2YzUC9tcnpYSnlwUDF4cUt3UEZ5YXhEc0JaaFlK?=
 =?utf-8?B?WE9Gc3owYWFPY3JaUW5YTUlIMkRnMUE2YVJCbDBaWkY3WGhXeFYrUWZ2TGVi?=
 =?utf-8?B?RDNLWkdIOUN2bzZNdkpvZ3h3dTNhdEhlWkxDelVTUkxxQUhTTmU2cmlLM1Fr?=
 =?utf-8?B?NGFHZHlDRGlzMXZvOFVOZFlTMHhySDdlZTlndFFYMzhoOUp0NE1adzRFUmRv?=
 =?utf-8?B?elE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b5456b-2d47-46e2-1124-08de25d0a88a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 11:58:44.6199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ScREtYqr85vIUH8VhXsyYk5vng+ekHUXEFpjehWWBjcVLeoqhBFcvauVs+7L0ZWG407BRf9ZspU8sIYNf00HWvwvkACsRkOZxnK3F39U97I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5740

On 17/11/2025 9:43 am, Jan Beulich wrote:
> On 14.11.2025 16:24, Andrew Cooper wrote:
>> Link: https://git.kernel.org/tip/dd14022a7ce96963aa923e35cf4bcc8c32f95840
>> Fixes: ff8228ab4658 ("x86/ucode: Relax digest check when Entrysign is fixed in firmware")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> Found because AMD have released ucode to fix RDSEED on this CPU, and I
>> cross-referenced the tables.
> I wonder how many more we're going to see.

I doubt this will be the last.

~Andrew

