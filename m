Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 162A570F012
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 10:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538804.839049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1jQt-0002qc-Vo; Wed, 24 May 2023 08:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538804.839049; Wed, 24 May 2023 08:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1jQt-0002oC-SH; Wed, 24 May 2023 08:01:19 +0000
Received: by outflank-mailman (input) for mailman id 538804;
 Wed, 24 May 2023 08:01:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1jQs-0002o6-5d
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 08:01:18 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28c34b41-fa09-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 10:01:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7341.eurprd04.prod.outlook.com (2603:10a6:800:1a6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 08:01:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Wed, 24 May 2023
 08:01:07 +0000
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
X-Inumbo-ID: 28c34b41-fa09-11ed-b22f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gcbtwhMT0ggJSURqDoBAJFQ68LXXKNiXR8NSVdUDMciO9bxayjbHOjlEeqUH43LPDMqmL1iomdZM6+bvMOpwT0RmNH9SoErX6vlo7bjqp+7n8tSh/BQ03Zlz1zBvzQ36aPIm0aKTgXndTiYD87f5PCfl/NWHhaJcCWzb4AHac7aeB2cuFDCpHr9sSCccBuDGBgquAwpmiBT78wUnQbmJRTda4EsObjp0yjI3K1wbFOV5Ia5J5FhQ6NTiqTzt2AcPCj5Sr5/vV7OR3PwqLwVe5BArPoW9+mSFZWHU8WW1tPlGilkE1DdHjg/1ALh4zfqFTu5+B2Kc0UQArgl0DRQeHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=un/dK/U6I31Il4k/zp4fEZ6bx9r0hWlIAKWoVSrhzUA=;
 b=FMsPVca0VZ23OREM/xygVd/bMr75xBxjGUtBS4wVK0WtCtyvM+/29aNfoou45u1Az2zZFup7EGDmhosNAoRVsIDE25XthOWrwxPtuAmLlNl9uMDowHQq2VGLudFTe1xFNINglTrMUaORhMpfUl6R74gTJWB3tEJpA4AmpLM3fwfdVWUhK49WrhoyBkopVcR9VqFujoUMaTcnjG7SkUh4m68xdcq+7pn4K3Xug7hitNQCUy65oRSHu8ViyLl3dVQJ7PosXIVa62AWDsFxgcXpdQaDowhNkOlLjcuFkde4S3uvYtjS92VNoPfgrJy/za/k5o3urbvXJEwBw31IdSs33Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=un/dK/U6I31Il4k/zp4fEZ6bx9r0hWlIAKWoVSrhzUA=;
 b=ro15YyUJo8gNPM+KAW5rlZb2qDKsQy9WjDZE3O8W8CvcLg/xLzzZ5/4jJ1jNdAM1O6gL7CK56E9r2yTE+pMkL/dmKPw6qz46LFgNCiZK/g95+nOVX27xBIBFOsuS8ONQqbNYuTFSEFRqsJWFXAEV2iQYG+U/IkSrT1w1G4wkEdRlbcuc5STV4724ISGNIT5l8MhWCMDvnuPSoacXYl1MvmBC2YcT316f39eTjsFYP20ZWvOFJK6V+p96Muc+XAGlT57KWFeJI7l/3fzZi40ihMYz+AGs07EcGFDWvTbmqFh5Hb7Tw1hDpH39swjdTpeyuZH+dcg3Xrg829ZVFoyW0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ee97f251-a780-82be-b607-7cc7783a950f@suse.com>
Date: Wed, 24 May 2023 10:01:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH 02/15] build: rework asm-offsets.* build step to use
 kbuild
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-3-anthony.perard@citrix.com>
 <CBAF4CF3-C7DD-4071-9321-5EC7BEA1D432@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CBAF4CF3-C7DD-4071-9321-5EC7BEA1D432@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR09CA0064.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::32) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: a0edec24-8e52-429a-dae8-08db5c2d0716
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fJ64El7lkK9+mQIVtIOaGVJyH76azQPrWslNhBXWa0t2L3F1FH+XaKdwei2/eYoYet2R5Z4DHWwg+qZ18HyUEo1rPPhWpSCmnHsbPWnGkYogmTHIStNnsA/ZKazc+n5SdM+p5OLVFJYBKXHMJLYRTR+7ZgU4GyaLLVXIXelLRYeg/520G6Ba8xVPuawdfecup67mW8m9AEliDFlOvo03V0z2zj+ftbJ3SstkPbvahFs804qxuk/2t3MKOy+Om3Hp5BLML/j2jc5QcizC8oizt3EWpVSkbQfJ2q6224XsHAN3U3XSQAOaPNTMMYLxsTApymUV6D2vyOGIERbjDDgi6zY39RXdLMQGxGcGU77JZF3SNATDf3kE8zMD1oQ32slBRbb8ymCc5feY2HkCVtLx4tHRDFaUkyjSw+ESvJSnFORfdUbQXoHodSxxLwEQw/Q+jBfHZzQbVvetZNdxwXh5tPoS6BLy8FXQL3Pf7TcudKZgVDdmj7VtUIgAm01sM10aC9NA5eYRN02zCi8b9gAssFFu48t0s16PPt/vd2WN4XIZ2KVYEXZeUyDEN5BlvRMwPPI65ckhl3zk+K/oW32HnQN1Zrt1us/i3qW0a9qj7InM1Iz3DN9sEQ0icRtkbhALKPD5V3YbJ9/IGmVXZlsOXw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199021)(31686004)(66946007)(66556008)(66476007)(6916009)(31696002)(478600001)(41300700001)(6486002)(6666004)(54906003)(316002)(4326008)(86362001)(8676002)(5660300002)(8936002)(26005)(186003)(53546011)(6512007)(6506007)(2906002)(38100700002)(2616005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGhic1QrOS9hb2hlQ1pMUXhSYVJsNSs4aWdleTNidzFuQ1hQZWtyOUZLOTQz?=
 =?utf-8?B?dW5Ickx5RFZ0TG5tZkdVWUNOUG4wNnQwUGt0VXVVcy8wYXBITTdYT0FJRVdQ?=
 =?utf-8?B?SmdZRHZZVjVERmRWU1lCQzA5S2VvclpMaHpOQnJpaWVWYkU4TDgxcXV0T2xn?=
 =?utf-8?B?em1Nb0loSXFLMFREdElPUkxra3o5bVFKa1Q0UlNsbWhqU1JsenhTVzlSei8x?=
 =?utf-8?B?N1cwWHBOaVBOa1gzK203ZTdHbmRoT0pkME5Od3ZLMzNMak01NTVWZWJQQTc3?=
 =?utf-8?B?MUg4V1ZRS2JUSk95TlZNalJDcUUzcm1PNFpCQ2RzZWd5N1ZkRThtZ0gwRXMy?=
 =?utf-8?B?a2lrdkxmUCsxc2lTU24rWEFCKzBYMXFVMkY2RVdmaFRablU4Tkp3SzFEZ0Uy?=
 =?utf-8?B?SEJDVmdQWW9Uanh4Yi93UFYrT214UGRDRUQvQ2VyVXpJL0J3ZXIxaWo0a2Vl?=
 =?utf-8?B?ZHZXcURwTnIzZ2NrRFBSVWlQUy96ZDNaNmhYK0hIMFZ5bGNPMXdSb2poK1A3?=
 =?utf-8?B?M09wK3JlYnJiOVV3enEvUWxtTGJqOE0wNmY4cVVLTjFsaWZZVmcvUW95SHZE?=
 =?utf-8?B?cFA2ZTBiSWZqc1RCenhyS3VmcDNUNGZyblhZT3pzcDdCVnVzYzhGREM1TldS?=
 =?utf-8?B?dmR1QUNoRGZBWDZCem1ZcEZtbHlySm50Smg1eFpReGxCRzRxVXE2M2pwdUtt?=
 =?utf-8?B?N0k2R0NkdDluNlAzYSsvLzhOZi9LZlRrR0NjajVBVWpMTHNMelVUNFRrZ25u?=
 =?utf-8?B?YzF5WVZEdkxJNm9jMzZKOE81L2tSK0JVQnhGNTdlcFJpT0cydnZmV1Bpc0J5?=
 =?utf-8?B?L2JWd0FrTW1GcDFoWXNVRncwVzZDdGxNYU1yelhsY3cxQ09aYVk4QTFSQXFB?=
 =?utf-8?B?YUppdUVBWFNqTVhVRVJ2RUpxdFQ2M3luL0k5RG93eitTbUdyYjliMHZmRVh1?=
 =?utf-8?B?Z1prNnJCMjJEdWd2cXJCVUtRbWx3cVN4ZUZSMGVpZUxIOURNZlVjTzRFM1J4?=
 =?utf-8?B?VUZLSTUyVFdveXhjRjZZWFR1NzIvNDhzM1N5SFB2bloxUG5uVHZReHNHZ2JX?=
 =?utf-8?B?SEpYSUdjbjZ4M2lMaHl4YWR5Qk9sSHFKSmI2SlJ5alNkcWViK01rNGxEVzds?=
 =?utf-8?B?S0R4cnF6OUlXQlBJV281VmkxdWkzNk1TTlpVMStWMmNaZXpSeHE4U0o0K21Y?=
 =?utf-8?B?RDdkK0tUWE5lS0dBTUx3T094bWIyakFFZElyNlh0enN2eHdoZnZZeGQ5dUVi?=
 =?utf-8?B?U2wrUlNUS1h5TEZuL3ozblhZTERvQjlaUXpvNDY2R09zSzRFR0IwaDNyTDR5?=
 =?utf-8?B?SS8vUVNzcEhxb2N1bkg1aFVzTUlYUmo4WmlkMHRkTi84V2FkOWxVbU1CS0Nm?=
 =?utf-8?B?TjlIWTJlcW5CRE55STM1V3VESUNkVTBSMjJ6c1h2a0ZwYlU5L3BZTUc3VWVU?=
 =?utf-8?B?QTgxWkZLUmNhdERvQy9icDJHa2VkTFBhZnZVQW1SLzEzLzZoRkc1L1lxNzNV?=
 =?utf-8?B?Zlg5cTk5V3U3WSszV3R6QStZTUFoMllNSjBOd2dvRnhMTHhaWmdta2p2SDRF?=
 =?utf-8?B?TTRyR1BPQ24xbE85TE95R29zdWpKZW9XYngrdGRhekhGL1JaMXZ6SVBQaGVn?=
 =?utf-8?B?dnl6OGMzNlVWY2Q4ckxjalJaMUl3NW80eEg5dlZJa1psYVV4Q0VtRkxJWFJT?=
 =?utf-8?B?cDkxQ0xwT0prTkFiTW8vRkd3ajZYQjQ0TWxMTTdUd01oUHhpS0xVcnBqZW5a?=
 =?utf-8?B?UjZxZ3E4ZmtQVzhjWEdMRyt4bTJZODBSL2dHVlFpTWxwZ1ZXMyt5Lys0VFdH?=
 =?utf-8?B?MjNkbnNWemxBWFMvenlra3lWT09VNU5jUzVBTEFTUUdQUVZoWGgxQkM1ZG9I?=
 =?utf-8?B?SkptMzhHWm41YjFHbmQzVnpWYmdwdGFIOXUrSmJxMk4rT09QcjgrMDA3Z2VX?=
 =?utf-8?B?cGVNdDIwQSszVlRFTm9HWkkrZzFRdWw1ZFpmS0RLR2FsbG1xajVJelJvdkZl?=
 =?utf-8?B?dE5WelRRRER3RWlzdDFqeFFKcGV3MTBjWUQvbzZaM0ZlcFd5TXQwcXppc3JK?=
 =?utf-8?B?MkJKaGRQYU93VEdWRFY3L2VFMDR5RWhwOFhqTVBBUWpoUG10YThOZW9uTDZh?=
 =?utf-8?Q?bzqn0/cK6eP5Ru2oIZL8KibeI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0edec24-8e52-429a-dae8-08db5c2d0716
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 08:01:06.9925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qBC6iqGpuTkeRI+afaiCp8VsCuoCLDlg84w+XRVHrkBbjrdDT2Cdy5gb12O2mGwf+4F5XvSW4+f654KQl2d+3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7341

On 24.05.2023 09:39, Luca Fancellu wrote:
>> On 23 May 2023, at 17:37, Anthony PERARD <anthony.perard@citrix.com> wrote:
>> Instead of having a special $(cmd_asm-offsets.s) command, we could
>> probably reuse $(cmd_cc_s_c) from Rules.mk, but that would mean that
>> an hypothetical additional flags "-flto" in CFLAGS would not be
>> removed anymore, not sure if that matter here.
>>
>> But then we could write this:
>>
>> targets += arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.s
>> arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.s: CFLAGS-y += -g0
>> arch/$(TARGET_ARCH)/include/asm/asm-offsets.h: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.s FORCE
>>
>> instead of having to write a rule for asm-offsets.s
> 
> The solution above seems clean, maybe I am wrong but -flto should not matter here as we are
> not building objects to include in the final build, isn’t it? And gcc documentation states just:
> 
> “It is recommended that you compile all the files participating in the same link with the same
> options and also specify those options at link time."
> 
> I’ve also tested this patch and it works fine, I have to say however that I preferred
> a more verbose output, so that people can check how we are invoking the compiler,
> but I guess now it’s more consistent with the other invocations that doesn’t print
> the compiler invocation.

If you want it more verbose, you can pass V=1 on the make command line.
(Of course that'll affect all commands' output.)

Jan

