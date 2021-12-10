Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1454646FE11
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 10:43:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243683.421591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvcQm-0002Zl-IZ; Fri, 10 Dec 2021 09:43:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243683.421591; Fri, 10 Dec 2021 09:43:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvcQm-0002XE-F2; Fri, 10 Dec 2021 09:43:08 +0000
Received: by outflank-mailman (input) for mailman id 243683;
 Fri, 10 Dec 2021 09:43:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aCrA=Q3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvcQk-0002X7-V3
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 09:43:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 935db0e9-599d-11ec-a831-37629979565c;
 Fri, 10 Dec 2021 10:43:06 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2059.outbound.protection.outlook.com [104.47.1.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-mrnF4yHTOmCltdqw1w9VHw-1; Fri, 10 Dec 2021 10:43:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2704.eurprd04.prod.outlook.com (2603:10a6:800:b5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Fri, 10 Dec
 2021 09:43:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Fri, 10 Dec 2021
 09:43:02 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0084.eurprd06.prod.outlook.com (2603:10a6:20b:464::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 09:43:01 +0000
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
X-Inumbo-ID: 935db0e9-599d-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639129385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SVKrgVODsMisA7hAdSfCVZF40vsXj/6vK8YDpjrtqLw=;
	b=bfBffmP5FreOaDvkO9EuSKp0TPeI8KZMLKjUVj45yvxTDy7pp4c7+JSVu5HfVJeC6nX+4U
	AGEy1OBXfM/yxJ8Bz9pqfstmncggVSNcOM/J5Z0ft+XPbcvcA3/3Ku+1GO21PUCO15Ua7L
	9c0nveQ8QOdrDb3HfJNBU2EFeCVJFBo=
X-MC-Unique: mrnF4yHTOmCltdqw1w9VHw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZIJjmVQpvaUZH3h7nMCFjYMcHaUX/6ztmwaciT40EPzrAsSoKA+54ZzV7sRzEDI4wCq9P4ufXracpHEsU0VY6XyiJ5hkiGMzyMuNHN6nPXZyNOjhbU2nvy9A8M6DuyeTCBowBxzN2n5HKBWhUnecg4KluH/eFQPQwQm6upRWJZ/u2E2PKImfVQSfy6rlRvKRJ2oOpeFiIJ6q0RHvjxa7dqQA6jgdH72y6Y5K7LzGC7rkJVrGx7Bw3xgqAChggc4CgTmqPcTGrmQINPfxcvsdwds6XgvODi/85Gug8IhVtIVEaftXek9H5xJDPsI0q/Q8S5V1W7wA3sp0mrspb7TPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVKrgVODsMisA7hAdSfCVZF40vsXj/6vK8YDpjrtqLw=;
 b=hoWFyrvavFdygNxkQuHCA+7XebhL61ldqNujUUaLIkkHaitcY11x/BTjXqZqS39WuqLRwEtB5MsE464pbLY8vR3Cwtaz4zunBSqrV+nqEZNnGsDbgtceDROOVHvYfP7tIIpUrkDLwjv5pemuh4krIQBif3iVPAs/PQt7mMKz19t752NMgJjLGWDgJ4XMva6hHGthtYKJe52n6q91/jI01kZQx5vuXT2+6YI4a6sHkj2l69EqPaluMKoAlZAM5qaOh9bzuzI39GGC0SxKEKurqnVBwhUMlvpg2PR2Z9MtPN0yY3GWqWFq2/HigXdk7sLrhzPte0194s7j8zHZ4PJo9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <828210f4-852b-22e3-e144-8a353fa4443c@suse.com>
Date: Fri, 10 Dec 2021 10:43:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Ping: [PATCH 0/3] x86: insn-fetch related emulation adjustments
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Paul Durrant <paul@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <10c7b3c0-c64f-3d12-06d3-8c408f7c9f4c@suse.com>
In-Reply-To: <10c7b3c0-c64f-3d12-06d3-8c408f7c9f4c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0084.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebfed82f-f535-4f9f-a6fc-08d9bbc17543
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2704:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2704187445B62A1AAF29E03EB3719@VI1PR0402MB2704.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MtYlHyzeifB+S4wSpcZU8NgYUo8HKimregj1JOFRmyeKHbNelJVVjuh1hHRtIfQFRxeEO3Nc+VduAjtZjafIjtf5rgz1kOcE6rIK2y/qcypIvlmrFYPUqYjwFOXgnY6OHqB2jNq9Pn9vuWN77+oTyQpFxluTFmsk0x9sEJhR9Xiu6AD+81ZC3yAPQbxcOWohG2qxE9qwQaP5A4+g0osGzEPonRZ7+KxUIx5hyMJkKvFD7nsdYcfFSQ48DIPrdj859QHFtH+TEctiT4QmOgwwMcmihdckn/fQICre1ILEy5wBYILd7136K2m4qKbhcKHeMP+JiujbelRKl2GLHCZe7DAar0o9soGN6iGH7FyBKD/Ihl6PANZ9XlusaTrlwSMRJX5I5gfbzC7x+WWdi3jMVD1HaPFP/2Ctf01lP3MOpRNeByWcQiBGs/5ybh1MMrU36KKNnxEm3WufTRHw1azgsl+twPjKBNWuj5OyKfxh16y4nCzUWElyVrdduAgV/8QEB1voL+ABpTMDVkz2BoRaL1g9J8541O+XjB64bik3DVkw4G95xqbYqLHk2QoMSBj5bDHgBOAaWbhhFgkS3AWPHW3DKQArzYPGeRpE375FLB5VyirBk6cNltX8AhbbtNAXwcutXQoGVLrKzDQWI2SphtUDqu1KdVjQXz0S4tXNBUufd4rIxjLnsRmu3ip7MPwYK4OdWuoaOYQImuSRwpBadA3fFTeltg4T13IGhiJ11LqtOS8Qm6VwkZSfR6UUPQVh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(53546011)(508600001)(8936002)(26005)(5660300002)(4744005)(2616005)(956004)(66946007)(8676002)(66556008)(186003)(4326008)(86362001)(31686004)(36756003)(66476007)(6916009)(38100700002)(2906002)(54906003)(316002)(16576012)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1RQaU1EMWMxTjZIUFFLVlllcnFLZVlpRW9NdUVSRmxqOGhuK0xuZ3JKWS8z?=
 =?utf-8?B?V2d2K3laM0V3OFlDQ1NhQXpzWHFndnRlZ0pkMDdIczRucFA1eFVDVTBBZEc5?=
 =?utf-8?B?MElDcjN4U3J6ZlVCWldpamRNdDBvN3pjY0NETHZxdUMvb1oyUUMra1BFZGFJ?=
 =?utf-8?B?Q1NtSnBFSlh6TVZCeXFPNyswaEp6N3dVbFZwL3RyNTNYK2xxMG41Rm5JRm9V?=
 =?utf-8?B?dzhUUFlvZWkraTNUOFN6dkN4TzdhZzVqWGFxZm1MNXl0SG5odmlkUE43SDBL?=
 =?utf-8?B?Y0RaSnNUeTNReUhzenRrQmpvYzVsYTBzTjZFU1l0UWNJK28zNURGTUF2NkYz?=
 =?utf-8?B?dHluNW1QaEhuMjlwYXJRVW1scmx6MnVQQ0dMVVF6WSs1UUsxRnJoNUY5RU1a?=
 =?utf-8?B?VVRZZ1pXTmtzeEUyN2xqSjhNMmhuUGFMT2ZuNUYvaTR1RERYK2ZhL1dEV1hB?=
 =?utf-8?B?NkNLQ0xpT3p3REIvOVZLZ1Y2RFBhRHdaMllCYmwwRlN0Q2dDbVlHSTJTN3Fs?=
 =?utf-8?B?OFZxcTlLUlAzakg5VmMwRjJwbmRUdTBFeHNLTmVTOWV6SlZvbEdQZ200aFZ0?=
 =?utf-8?B?RnhWTDhES3BwOG5hMU03dFN2KytaOTRmQjg2TzFDYjhwL2tzQkhBUFBJUXZ1?=
 =?utf-8?B?dEg5WU9zVlA2alJkdVlxdXpFZ0J2eEhiWVkyeGVlR1ZyY0k0VzhUR3AwYTl2?=
 =?utf-8?B?QVB0VUlFRXRyYmprMHVWcjYvTGdNeVpTWHd2dUNkM0J3UTFSZWozRGtuNGFF?=
 =?utf-8?B?VStrSncwZlpOTTBEU0tnRkQ1dXQ2SEdmNTZpVG9BTjBrY3RodWtwcHIxS3Fq?=
 =?utf-8?B?aXZ4VHhTU1BpRmNaM0U5Z041aHdNWFpJS014N1MzcVlkWENtZHBqZWxPWFds?=
 =?utf-8?B?V3BSeFRodlpwb3ZRZ1lWYWFlU0dEb1ZEcURGcEVWM1MyR24yVERKRHlNaXlB?=
 =?utf-8?B?bVl2blY1WE9QSWtZNW5IOTZ4Vk9YQnR1RmVsTFhQckthUzN2L0QzV2xSUVRK?=
 =?utf-8?B?Wk5SMWZZSkEvYlp3bmltd29GL3ppZEhESldvd0xwRVFKL1kwOVlHeUdKZG02?=
 =?utf-8?B?MEJoenArbFo0N2lrMXpVMUZkb1RRWjF3MHZDL1JiSTRCNUtLZUVnS0NhTXdJ?=
 =?utf-8?B?Z3lNaUFLbzRXbGZYV3BTK2x6UkZrMzJ5Rkp2SUUyUVo0YVNiSmtoekM1bnlz?=
 =?utf-8?B?VTRseUJBWWJET0dPR3BhS0o3QkRxandtWGVtb2hzakdBNlRleE5BZlV1Z1pI?=
 =?utf-8?B?cTNQeVJNMXVGb0xiamh3SWJQS0dpd0dDMmNsdWpqT2FaNkZQaDlnNUZLOEZD?=
 =?utf-8?B?T1lXdllvM1I0b0FKdWdkNzFoR09va25xR2JnV2JPcnhTdzRpVCtJYldnT3Av?=
 =?utf-8?B?ZUMvMndxYjVudUFCYzliOFllU3B3OEMza1hIYWNUQWpLam9scm1nSk4vRkdB?=
 =?utf-8?B?N3dLK0h1V2g2dnYzc3lXRFBoL1dERVFDWHRMcitLNDBXYm9mTFJmWm9uVHlt?=
 =?utf-8?B?UWdqb2tsK3pmbVhhb0phM210Y1lsRDh1WHVvSXhIZ3lUd29mTFhBN2h4UzhV?=
 =?utf-8?B?ejVRWWdkNElSNGpRTzN6d1dkbzFOWTV6VEtJK0JOQ0hIQzBmUWtsdjdxQmEv?=
 =?utf-8?B?MzdUVHBZSm1EaC9IWkNIaUZ1b0tyTmZvcmdoejl6NkFiN0RiOURaUGhmWEE1?=
 =?utf-8?B?b2FQSGoxaW9OSWcrR29JN3lETC8zYXFaUTQyVER2WEFmdlZRdVM1aEYyb1B3?=
 =?utf-8?B?MDRyK2xxb1h1RjNza3J4REQ1RTl5MjRGOXBWRzR4SVBtMlBrcXVTSmxLNFRX?=
 =?utf-8?B?WE5aZzMrUVhtTENiSHE4Nm1VU1Z1ektSMzlsU1VGeFVESGxNRDA3SkROYkNn?=
 =?utf-8?B?ZkVpYTlnQXhreC85RFR5RVdTazQvQUh5SHg2OThEbEZQRXBKZ01pRzYwSS9v?=
 =?utf-8?B?RUpueHlaZEFGckVqM3gzN2V6VjJnQVZVUlNWSFY5bVVtd1psTkRSQ2dZZ0JC?=
 =?utf-8?B?TzVSYlppZDdiblVEOGs2c1FUMjFELzU4MWhNMjlKM0FZQk5HTzlxN1QyZG53?=
 =?utf-8?B?azNOdUdibmc0YXFUZkFDQWFXeVNIMG9tNisxZnN0UnFVYlJCK3BuM1VoeG1U?=
 =?utf-8?B?UjQwNloxUW1aQlJPOVR4NEtWVGlZbE4wdmVacXVOMXh1blZFU01FV3drQVZN?=
 =?utf-8?Q?HOjGT7bY41yaRXRt6kLW1GQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebfed82f-f535-4f9f-a6fc-08d9bbc17543
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 09:43:02.2484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4Ukk71RWOfx5QCv6WZEP0OYVm6jMzYffKCINaPNJcPOqjEa5L/YJ2Gahk5katm5qWwsLm3B9Xwb9ncS13X3mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2704

Paul,

On 03.12.2021 12:18, Jan Beulich wrote:
> Two fixes and some tidying.
> 
> 1: HVM: permit CLFLUSH{,OPT} on execute-only code segments
> 2: HVM: fail virt-to-linear conversion for insn fetches from non-code segments
> 3: emul: drop "seg" parameter from insn_fetch() hook

may I please ask for an ack or otherwise on patches 1 and 3 here?

Thanks, Jan


