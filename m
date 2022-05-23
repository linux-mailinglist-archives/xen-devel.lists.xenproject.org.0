Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6F8532450
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 09:42:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336284.560639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPBL-0000ok-4B; Tue, 24 May 2022 07:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336284.560639; Tue, 24 May 2022 07:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPBK-0000l7-VH; Tue, 24 May 2022 07:42:18 +0000
Received: by outflank-mailman (input) for mailman id 336284;
 Tue, 24 May 2022 07:42:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ntP5p-0003DA-NB
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 07:36:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 705b9b97-dab3-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 18:14:36 +0200 (CEST)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-BWfENAyBMZS-q3CNKJWKtw-1; Mon, 23 May 2022 18:14:40 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5558.eurprd04.prod.outlook.com (2603:10a6:20b:9a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22; Mon, 23 May
 2022 16:14:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 16:14:38 +0000
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
X-Inumbo-ID: 705b9b97-dab3-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653322482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FpquWPTdkPs4vboyT6efgqWfGQrZ9In3hkbUO+6Myso=;
	b=BZUZ+WP7OKNrrKhUwFCFKNFGigl5JtF2uRx3dqVzp0ptJ5ov1VMSZia8xR4PPZnUtC3IUP
	FMuYiMA9eUNepKl3oQueRtmXiexl0M/szcW2zwHXXs7i1QmJDAqm9T7ugFDqWkeiP5Ldse
	BmaQoBQyFAQ4kx1e2BOszd3kfGZiDsU=
X-MC-Unique: BWfENAyBMZS-q3CNKJWKtw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vxoi64KltvzFHpLirVPFfpkCmAw6YeAIMP0/F/2q06xeM+vgAV46OaMeDh9RmbD6R2butQZXapt1uOQvdlCbud6CrOAZ24X39OYgiLHICNZ4tZ6+C9utHv/2xK4+9NW9vNqLo18b810csWW3G9J4iSyi+4ll9MZjiBYn3o1WxLCufrZFwxD9wCxLY34J0Xy0XoCXOkn061/1k9bKUv9SsG1ZxSlnAYgxrigZ+MNHRy/reWwVp81d/uxhD+3fUwS7Ea5Y72At1jvnR90D5kZxDSZJ17em7M6fQ55+mkx3/vumjFQRcMGcGvVJw9GWqtTcSOKDKFuRRLgcpDJ/mlueEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FpquWPTdkPs4vboyT6efgqWfGQrZ9In3hkbUO+6Myso=;
 b=I2Wj7P5mXVi/xOWv+wwwAscP4bHJ3NHFRL9luN2MCaIhVTJHmVNN7jtGDkAs6PRVtstlIxuLoZmhoeiainYfSPfLbDSjuScK/8GBXrwwrX35kqrvnYOeCZlcUenj1pkVsqDDmyQxiFooibz5sWDSy3QpXke3G/5TWkzcdwsKZ5+67qeWDD4fjgWvC3pi/tfklZYqcY9VcOplOD4eVqa1iKfX15QZagmCwP2IFu6DjUMKyLjkB1eBlCVivgEym0udBBwodVpn/22wFUBpaDgiQeX084L8TtVn13KLSS6/krAyIsEa25dpS1gLH0qgNDt1eLhNk4ccgfKDVKUXBPSUNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7225c9cb-8cca-9f84-6b8b-13b6675b8919@suse.com>
Date: Mon, 23 May 2022 18:14:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 4/6] xen: Switch to byteswap
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?B?TGluIExpdSDvvIjliJjmnpfvvIk=?=
 <lin.liu@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1653314499.git.lin.liu@citrix.com>
 <dcabb541d0b5ab7858ccf1c925afc334f3123ad5.1653314499.git.lin.liu@citrix.com>
 <8fcd30a6-9b93-6687-a0f5-1e035fa5f789@xen.org>
 <d77a5995-a916-70a9-4bf2-efdb2948588b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d77a5995-a916-70a9-4bf2-efdb2948588b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0052.eurprd07.prod.outlook.com
 (2603:10a6:203:2::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdb69cf5-9c2e-410f-75a2-08da3cd75623
X-MS-TrafficTypeDiagnostic: AM6PR04MB5558:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5558D4DA652AC31548181FFAB3D49@AM6PR04MB5558.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q7kSE5jCl8r1JRj6Xobi61yYBIKtH3NU6dBn0ztAGlACsG/9Z5kzG2gXBtxnuNJIW/264ooiTj3xn7zRHETSHcEGCaaKAiU6Q4AIYhP5rEScOPeYBCNJ8QfoD/9gB+/tyvrtVp71fJj00lOCWwkMefVvwzinMZz+Wm22UFr3gUemYk+TMbmJ7otyjcFTFxVHACWKz4TjAqMRx9HINwzFBLhL1aJr1461ZCDzTc3bx/cXeuyDpaHjydtZUTyrh2ahIFbEGSH3sAy2+EVUUdjU9F17vAPkoKNxaKXETzTQb128/d9XGO4R+bedIRPe1KTtZmb/F0hBW/j0mirNobmh33xLJruYDuaN6AWQ5TRNzUE7qfb+N14mnY9rcHBU0EA8NQJToDS0nWiVpd6RWdXBMOnjBotgcDdA8YFOUA9+Pc0Zc28HRpSXpQioL4xxg/oFsD2Yu744P6psR55AFpS9pRresmtwx6oiLpt3WweogCeS2LJkmjrtQQeyBZxSv5SQ5KgJFzYN/NWDGIJuBjkPsc01ZHkqujmZW7Q2p07GZmojQrZiyPjbJkT1C74HH5oqPq9X8c6nZ/vx25stLYbzzSF+wkjeqgYG1gXAn2OPT6Yxh8Cr0nvArXb3JmvSFDufs9Z84EFEQ2JKD0nYGlvQqaTmBTxTywWrbmPqSBV6LfYd5cS8CoruuR3v6c2jfI8IXXL6bGD7quFxKyMWSF52R9kXHsdPDQgF+c5Fp/ZDUG0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(6512007)(26005)(6506007)(508600001)(36756003)(2616005)(83380400001)(6486002)(53546011)(6916009)(186003)(31686004)(4326008)(316002)(66476007)(4744005)(31696002)(66556008)(38100700002)(5660300002)(8676002)(86362001)(8936002)(2906002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1M4eFV3MDF5MHRmNGZKd3RZZnVZQzRUQityVktkRFE3ZDlONjBpcFkrNDBy?=
 =?utf-8?B?RHJvTzVZMmZHYVlmSzJQQVF1S0JrSWdNL1FBakIxSjcwNDFBSEJnQjJoU0t2?=
 =?utf-8?B?Vm5QeUdEWnZEY1hHSFJRMWVQT0poSXR2WjlGMDFXVFRaSzhPb2ZiUU1HTDlO?=
 =?utf-8?B?S2I2Y1pHZkJRcWs3WEdIUDBlNGd1SisxUDNWWldDTDNEVzFsQmVvdW04bnkx?=
 =?utf-8?B?cCt3OTBRVEhWOVdaOXJYckZtaDZxTWwvVjJjeVB4cC9IeGxxc1Z3R3RLZTV2?=
 =?utf-8?B?SEJPM21QS1JDekJqTzM2aGVYNEVVbjVaMnVDc0hielBjVG5palVlclZ6cmJn?=
 =?utf-8?B?YU1kMEdxalZMVTZCREdUYkVTN2hSTnlQOWFZUWhXd3BPb3hWVFlJTEpmRVNU?=
 =?utf-8?B?dG1nZjdoV2daSXYrYXVBaS9MMXF4SEpNemdqTlVUVzJnSFZRcndTMmFQTFk1?=
 =?utf-8?B?UWkzZ1dqTWdTSDUxZlBoNWVaNllYVkk3emNKYjhBSW9nWm1LNUxZRjVuQVNY?=
 =?utf-8?B?Nm04ZVNlRTJBTk1uSmkzWm1PQjZUa2FpMGx0ZHViU2tNRjVlTjNGaVU2UVFm?=
 =?utf-8?B?M0dSRU1QOUU5M1g3VUh2cDVrRDRrQWNXZHF6Z3g2OUc3U1EwYnJmRWlibjZm?=
 =?utf-8?B?Q2w4d3k2Q1l4Y2JoWkRZTWdKc1FIZ0FmT3ArNUNYeS9qOTB1TWxPMnJ5ajB2?=
 =?utf-8?B?MTE1b1FocW5BVWh5eXVNSEtuQWNvTkFmczFNWDZOMmNnbEpYWTNOWWdVdGJk?=
 =?utf-8?B?eHdYZFk5cDlLcDV4ZGFnSmdTeFlIVElIcEFZUDM3Sys2N0FWeWozRGRPZGsy?=
 =?utf-8?B?MDJ2TFJ2eDlKZVZoQ2tRRUtBbWE4eXhTYk5TcDQ1M1FoeFU1akRFRFIrcnVI?=
 =?utf-8?B?UVQyS1A5S25SaEhMOWhlMGc3elY4SFlldUsxQ2VGdDRSUGMyenU2OFVDVEJL?=
 =?utf-8?B?dnAvWTROd05lYlROYVBRQXBHRmtEenBNV2Y2anZoMXdXN1VWVUZtOFNRTzVJ?=
 =?utf-8?B?M3RScnB3dkc3RlJqUDFhZnMzUWNBMEV5ZGVMbGt4MUV0cmp4UzFYZU42dkFk?=
 =?utf-8?B?UEVLb2RLcHB3a21aYWNoY3NQWC9wbmE0cC84RWhTR0xHWElSeWwrblFSYmVD?=
 =?utf-8?B?WXBoeloxSC9Qc0tpUEU3aUg2NWJjZkMxejdpcmljM0gyTEVwSXpVakJlNitk?=
 =?utf-8?B?VkIwR0dxNmlNVmc3eHdZRTRzbXJ6TUk1RjAyZzNRNlNmWWluNWczUWZuWGJu?=
 =?utf-8?B?MFNCWnd4Z09INTJHUXNVQS9hd21EOU90YlZWOUtsT1FYL0l2cXUxVnZXSmIr?=
 =?utf-8?B?dXZTZ1FDR256V1VZcGlrU3RrYWd0a2t2bzVyWHQ0QTNnZkNOV2l0ck9iUFhB?=
 =?utf-8?B?WEVJTjNhNWN0YmNYZWtJa3VkNFJjRGJRSDZiU2lmQjVnY3VKNXlPNytqUVY5?=
 =?utf-8?B?c1VaSFJBWUVJZnJraVBJQkxYdHdKUm5WY1ZkR05xVjQwdWloanYxWmNBcDZw?=
 =?utf-8?B?TVQzcE9wQVNzUXlpd3daU201c3FUbnJmOUc2blB0Zjg0VUkwYnliUEVrOTZO?=
 =?utf-8?B?WDJud0MwcFNZN3lkLzRTTGgrVStNTy9QenZleWhhSnhGTVJ1U3pkT2ViaHNa?=
 =?utf-8?B?bGpZSnNVOURmdW9qOWJwTkdmNFVjV1Qxc2Y5NFdEbkNDZ1M2cmUrMVBGSVg5?=
 =?utf-8?B?WnU2RFEyRFJnSDB0UUNtOUZSYkphRndtaWM5ZStrZmpMNHpmcGRhQkJpVFFB?=
 =?utf-8?B?WC9DYUFkb1R1UVRJUCtLdlZvTGhYR0U3Wmdaa2NGWHE3OHhOVkJFS2Y3SkdO?=
 =?utf-8?B?UzlDWGtwelhieHFrOW4rRnNON2U5TUZsUDhWYk0zdmJyeDQwSm4vSnFNTURo?=
 =?utf-8?B?SGRqeWNPb05hc216MUtGdksxT1JjUDRSVzdySFUxaDBpc094TUVwRzdCMmFy?=
 =?utf-8?B?SUVmQU91N0F4Mmc5R3diQ3BnQjgvdkpLRVBDTm5sNytLWU5lcm5qVll0NkN1?=
 =?utf-8?B?Q0JVcFlJb3JoeTZ3ZnJTRHM1MFR5NXpFb0NPS2RySHUydCtRTVpoeWR5aWZ2?=
 =?utf-8?B?MEVvdWp1VnozRTRBS2REZTVrNUNTQ0JKUTkzWUpHa3RhdC8yWFljbUIvMWQz?=
 =?utf-8?B?a1BIUytucXdKUktndjRYT1B1NWhpZ2pCQjZubFp3NTFOTGZUbWN2QnRUQU5m?=
 =?utf-8?B?Y3Blc2F6R284QysybHlsN0lHSnFiR2FVRzRHQ3FUT1k0UHpDckkxbzJObzRP?=
 =?utf-8?B?VFozczNSeEpYb1ZPa3EyOHViUGhkWUtoU2JjaXV1UTRnQ1luWk1xK1Q0VGtY?=
 =?utf-8?B?MS9lV2dpdmo0bWdyckhMNUQvVk9JL2c5d1lCY0kvVnRGL1Vib3N5UT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb69cf5-9c2e-410f-75a2-08da3cd75623
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 16:14:38.8708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYA2S5/qbdqluVk3I4rtwmE3B02N6H5iiFfExwFPMhxWsmdXaDh76GoDHKhc21rhlgOhGSDWToe3CkPAKw/Dfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5558

On 23.05.2022 17:38, Andrew Cooper wrote:
> On 23/05/2022 15:56, Julien Grall wrote:
>> On 23/05/2022 15:50, Lin Liu wrote:
>>> Update to use byteswap to swap bytes
>>> be*_to_cpup(p) is short for be*to_cpu(*p), update to use latter
>>> one explictly
>>
>> But why?
> 
> Because deleting code obfuscation constructs *is* the point of the cleanup.

It's obfuscation only as long as not implemented correctly, i.e. dealing
with unaligned data. Then "be*_to_cpup(p) is short for be*to_cpu(*p)" no
longer applies.

Jan


