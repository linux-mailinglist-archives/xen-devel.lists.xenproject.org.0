Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5A36BC99D
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 09:46:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510381.787925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjEv-0006uH-A9; Thu, 16 Mar 2023 08:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510381.787925; Thu, 16 Mar 2023 08:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjEv-0006rN-73; Thu, 16 Mar 2023 08:45:37 +0000
Received: by outflank-mailman (input) for mailman id 510381;
 Thu, 16 Mar 2023 08:45:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcjEu-0006rF-1l
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 08:45:36 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20630.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea0f1d38-c3d6-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 09:45:33 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAWPR04MB9839.eurprd04.prod.outlook.com (2603:10a6:102:38b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.30; Thu, 16 Mar
 2023 08:45:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 08:45:31 +0000
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
X-Inumbo-ID: ea0f1d38-c3d6-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVsPdhId7SRywlSJq5GQpwTZZsiFjB61YUrMuhRPU8yp1RC0Kt6GxwqJkunCMcd5P1tNp+4mdC3eolpz2pdute86H+xvYLCDYSa2TbBP0f8PNeEKNnlZG3ngcraKg6jF0SsTXxZQ0cBWdxfLYiJZHSlOVwZ4SYzZWcTlqh4qzI3D8hS1NddJ0fbDaOmOAwGHg9Q62DlMBBO0pLE/Ux30PqBLbbKsBCb7YaEF/nUHbinoZBAD/JAX4TWTWdozuLCLxl/BHgOrRvB0JmqqR3cAqcI+wfnnYUFUlc6aVf89CF2sDIWMWX07X7l0DRFq5sND7NvUvobXSac9wH2+Pyj3Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kincf96ugAShNfufISnEk5Num1QIJTnn1kALguXkOEY=;
 b=QhLncGioD8tRlcADpDoev+jdQ/DiTFTr5XjZIbNwrs8Hw5i7NrXhjxt03PWgeB6jrq7DqD1aoQJX7nhvy9xeOWT7PIJIqbb7J2kEmdvZUOVGfw4W8d9F/TG6SWJsrVixkN0XWG+O/vmTJnGB+zsui6Ovd68T8zPrfNi5Y43jtv6qXd0OEJ9+4oGKG1Y1oRK7salE80n3USaqXVIlVNI6BOnc+2JoD2142aVqBt4JZ3Nq34woFJmfH171fUA2W1H8capSzIdm533uUWO2kewFwfsIAGO2Y/dvhqw1WRPPBJv+jCqy0gShTChoz8R7MidmU8ul/qpVhMedycp9uJf6ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kincf96ugAShNfufISnEk5Num1QIJTnn1kALguXkOEY=;
 b=aaKR/qcgGMm1zrkB8i11kpknbMw8w95hueBjmrNyDLj9eugKIgF6D+g32mboXzjYhGdaKC57AU5acyDVCE4Zkp26/gtSu3JdSOGwT3YqwxBmDC6WVXxnPVDHWexvIk6CczVpDn1lF/w1eTB6FEgFcnQc/W3Mww+ar0Mf9TYsIkItX8dDk/efTlGtYhvEUSNqzvFeYqP/Qnx8l964OSeaTYITVFuVvN9ju3GUCohM/6vdLxYJ93JcpQizgyZ0u0Jwjm2WmzzYSEt602HJfz13YY4YJ8sP04SU70Qtt7Duv04DEpuq/n7YNk8khxcjD6CS8hnHLXQBAEt8FGEapTqNQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4cee4508-7250-9a27-a186-8cc2000dc3ce@suse.com>
Date: Thu, 16 Mar 2023 09:45:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1] xen/riscv: make calculation of stack address
 PC-relative
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <ad2249c1b5be01f99ef9c294a3264da0c9715bab.1678809641.git.oleksii.kurochko@gmail.com>
 <9c5ec3f3-c909-8f45-4460-1b29ce333d10@citrix.com>
 <e7c42fc7561b88b1a18463b9b28d0b09cd6553c4.camel@gmail.com>
 <966c19e3-d255-db73-9bb4-7abe0a745396@suse.com>
 <ac357f76-653f-9dbd-dc54-6e31db28de9b@citrix.com>
 <00fc9016252e656be257671aa5c2c4e102df240a.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <00fc9016252e656be257671aa5c2c4e102df240a.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAWPR04MB9839:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f060b3a-c4a9-44de-2d23-08db25facd13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JP9DsTVfRS26S/X0Jh2+gFPy5Sep0gRPERq1hK1/9m+bT2WbTFK23fGSNJq4fXu7rUNP2H/Lm5Ntrg/Ti8sihiVaw9fl4bY3iYIKR3H9k0Di+uEuRnc/4DhoYKysfi48D2o1JIy4Z78X6w+v86pN4MEFqGScjdujW+ESsW3QRWbVvdlwSXBq+xskxPb4Zyl1cZlqbUG/pyFhhVcOH7fTuXHH+oElbsMB38naeASEWcXcv9eg9YC/G9J7eVyBcSpWyozc4UBNmQsMi+2XXFP4zf0CUGDQ6EaTayRzM2Zrr3dbCHCWN9FZwhaJvwV1RzTBBe9WhBLsnIwrqybBu+PMAyVLSj7HP2JaAQ9snQJt86x1NxsNEoA4iqEIulv0vnKVM/GFV9OojekS+EOOtUQnq0yNzB/KR5BjcHSpImn6NtQkIa2TCkyjClM4QULppFc9DCgqOzcpd9W8pLcr/BwS9ozXcVe07vi10jNom1Evu3UnD6DlnUdhFjWkJluPRINY9luBfW4BmyYgrh6JEG+wvmcosuvsdoODOFqN4mSQ1xEQyq1bbv+kQuiROB/F5KzyDn65d2kC0JM22+A2HiG8Li0WfcS7rqysNjm6yCAFZbD4KE+TCK6QQEas/CG9ePzARUkIMwd+7577O/h+Rzdfv8CZL6WTjfQP/gY2r34XVcfYXyrEyVfZU2ECBdnpBhXdUFexhyTa9oIVPi6Ojb0VEAmBqwKcqvfdvnQqikc4y9c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199018)(36756003)(6486002)(478600001)(2906002)(41300700001)(5660300002)(8936002)(66476007)(316002)(66556008)(54906003)(66946007)(6916009)(4326008)(8676002)(86362001)(38100700002)(2616005)(31696002)(26005)(6506007)(53546011)(186003)(6512007)(31686004)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1VDbnVWRWFranNPTm5aN29JTFkrQjZjclNibWIzQ21IbHJkbktaa290QUpp?=
 =?utf-8?B?MHFsZHdXY2x0UmV3dy8vWktWekRTeGVvZ3NERzVnZ3dnT3lNY0pqRnEwek5I?=
 =?utf-8?B?RTdzM0ZsY1NXMVR6VHJaa1hUOHBVREgxZ2pxL3F1YmVjR0FkTzJRakhQT3Vp?=
 =?utf-8?B?RFZGRjNrVUl6LzhvRzdNQUhkZXRaMlhmak1PRXFyTWJtZWVLYVRhdGtzNTFK?=
 =?utf-8?B?cUNCUWVaSG1mV2hZa0g1QlNLS2x5VnE2TlBya2hNcHVaNkpGcEgwdUhZWUZQ?=
 =?utf-8?B?UlZxY0JCMTdreUlKOU81U0VJSjMyK1U2WEg5NmVnZHFZekdSNWtzMHdRWjN0?=
 =?utf-8?B?YVNSQWZoejVtRS9hd3EvZll4ZFNPR0dndmZvbFpUa3B1Q2NFVEFZYU9Gb2l2?=
 =?utf-8?B?dXlYbGpoMmFZMU5KTW9QTmlCTmFGUS9MWTlHbG5rK2FCQi81V3pORFRGRnJO?=
 =?utf-8?B?WVpTWXh1M1V3ZlcySi9abHR3SFJEc3pmMkIwTG5EWnlTVHhSS3V4aFFkZ0ov?=
 =?utf-8?B?YWt3RnVrd0x2akhrNGMyNEVJRk02TXF1RXc1Z01aUWV0Y3BKQmZOS2FiWjlR?=
 =?utf-8?B?QmMxWG9IVytaVnJUZGVGT1EwQWJYUHYyRDYreWoweHJWWENPSlJ6dThqTEZF?=
 =?utf-8?B?ZG5qWmc5NFJZU29SaXpLYUFCdnFSZzRzNUdnbGdDUks4SStvTEJDelkzT2pN?=
 =?utf-8?B?a0RmSWxMSHhzd0xidHpBOWMycVE3YUZtRlp0Q2xBbzdDbll1dTh5aGpRYm12?=
 =?utf-8?B?bzZ5UU02cGFtc1hqRlNBSUdHeTBHbEZlT3ZIREltanVzM3ZDdFM1QmJaa2Fj?=
 =?utf-8?B?cXNUc2JjZUVXeUZSakdsS0ZoZlRmait2VVZOalFEdU1QWkt3S0JMcFZibmk0?=
 =?utf-8?B?WkVDRzZXZFpmNzlpRmVuckV6WVRacUVBZ0pSMnptWFlmMU0rWElVUCtqS2dh?=
 =?utf-8?B?TEU1aUlDK21QRThSMWliRHloTFZVR2syQ3kyY29DbWo0VlZaQjlWNGJUK1Vy?=
 =?utf-8?B?U01BVkpnZXFKQkx5V3dIa2pDWUxldEllNm0vNVJ2bVlYN01aNDRYL3dFYTdj?=
 =?utf-8?B?TG5TT1JqY1lnaSt1bWlQdjN4Uk5JNjgyaWFvaXNFdUdhYWZTQWtyVmxsbEhQ?=
 =?utf-8?B?VmdzZzZYUGsxdUVCVXFxVUtpaDFSbGdMTVl1UmlTdVk2VERaR0EyZnJuVnlo?=
 =?utf-8?B?M1RiWHFtbDJ0UjdCcHZFbnpHVmRRTlo3T3VvOE9NZDBVN2NhYU5maW1iNkZk?=
 =?utf-8?B?SWtVbDZ4eEtxY2tDUnF2TmdNRUE1NERLOG1jYWNZbjVkZXBTMFNEVnZCQU96?=
 =?utf-8?B?RzlpdENJZFBUSG1qbE1UVmtNZlByZnBET1c4UGRpSGd0MzhaY3ZjN004Z3Zx?=
 =?utf-8?B?RmlCeXFxQTRaazhSM25lSHRlcXczcFR4cUVFVlBvM2JJUlVPVXU1QkYyalZF?=
 =?utf-8?B?WE5lQmo5aGFONGtkN2wvOGNrbUYzaXBNT0pQRGY1c2cvQTRjOWtUWUlMWjc3?=
 =?utf-8?B?OGVyWWFJNHZSZnJDc1dLOW43OGJZekpzYVRRd2ZMaXRhSXBEUklmR2k3Mk1G?=
 =?utf-8?B?VnN6Z3FGam9XM0xUZGZPZ20vc1dGanA1RHBsT2pXc1pFNzI5RmFNVE4zN01v?=
 =?utf-8?B?d3ROUUNXTzUwMUY1SzZ6ejVFcTN1ck1sQ0VPcGlOb1JqNXpGcmkzRmE5SldM?=
 =?utf-8?B?WTcvdXhzbzdEY2QyVnk3T1VOL0lCTkttVSs1c0xyVHl5L2tpeUdEMW5sZTQ3?=
 =?utf-8?B?TWNBUHRJek50V3dNNExFaXk5dVZiZHd5YlFPUDg0UlordHBKVG9HUTIzZ3NZ?=
 =?utf-8?B?SE1mUzh2b0dCazJIOFkrSXEwRmRUd3NOQlR3TkYrMFd3YkVJQVV4RVJpblAx?=
 =?utf-8?B?aFErdW1SbnZ3SHBKZkZWTXNYMElSNjA3WUZFQjhkQ3pIb1cra0M1ZEhFbnli?=
 =?utf-8?B?dVBsaTlGOG5hM2xhTEpoK2NCNzhVWjJDMEQzSkNPQjk5SDh1aE5BMGJEMXY5?=
 =?utf-8?B?QWZLSFFhc3hrSVkvTCtYZGkrc01LNHMwcU9yVjF1eDQ1SkVnazJORmdHUndk?=
 =?utf-8?B?ODRHOXgvSk93Wmd5VHFzek9adVRBdVFIT0RZaG9sdGpKR0tka3BEdXkveURW?=
 =?utf-8?Q?ky5GRGUgf+BdJ6PkZrO18nuJp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f060b3a-c4a9-44de-2d23-08db25facd13
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 08:45:31.8350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zhLGzo0VQfN0wwQqETbql0GU+fu6mNi2kZAbDcqKpMY4P/SjThWjU4B/84BaSdQBxuaBzj463m1cTVYWG6m3Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9839

On 16.03.2023 08:42, Oleksii wrote:
> On Wed, 2023-03-15 at 21:12 +0000, Andrew Cooper wrote:
>> On 15/03/2023 7:59 am, Jan Beulich wrote:
>>> On 14.03.2023 21:16, Oleksii wrote:
>>>> I checked in Linux binary how 'la' instruction is transformed,
>>>> and it
>>>> looks like it is translated as I expect to auipc/addi pair:
>>>> ffffffe000001066: 00027517 auipc a0,0x27
>>>> ffffffe00000106a: f9a50513 addi a0,a0,-102 # ffffffe000028000
>>>> <early_pg_dir>
>>>>
>>>> I checked compiler flags between Xen and Linux. The difference is
>>>> in-
>>>> fno-PIE (Linux also adds -mabi and -march to AFLAGS):
>>>>
>>>> 1. Linux build command of head.S: riscv64-linux-gnu-gcc -Wp,-
>>>> MD,arch/riscv/kernel/.head.o.d -nostdinc -isystem /usr/lib/gcc-
>>>> cross/riscv64-linux-gnu/9/include -I./arch/riscv/include -
>>>> I./arch/riscv/include/generated -I./include -
>>>> I./arch/riscv/include/uapi
>>>> -I./arch/riscv/include/generated/uapi -I./include/uapi -
>>>> I./include/generated/uapi -include ./include/linux/kconfig.h -
>>>> D__KERNEL__ -D__ASSEMBLY__ -fno-PIE -mabi=lp64 -march=rv64imafdc
>>>> -c -o
>>>> arch/riscv/kernel/head.o arch/riscv/kernel/head.S
>>>>
>>>> 2. Xen build command of head.S:riscv64-linux-gnu-gcc -MMD -MP -MF
>>>> arch/riscv/riscv64/.head.o.d -D__ASSEMBLY__ -Wa,--noexecstack -
>>>> DBUILD_ID -fno-strict-aliasing -Wall -Wstrict-prototypes -
>>>> Wdeclaration-
>>>> after-statement -Wno-unused-but-set-variable -Wno-unused-local-
>>>> typedefs
>>>> -O1 -fno-omit-frame-pointer -nostdinc -fno-builtin -fno-common -
>>>> Werror
>>>> -Wredundant-decls -Wno-pointer-arith -Wvla -pipe -D__XEN__ -
>>>> include
>>>> ./include/xen/config.h -Wa,--strip-local-absolute -g -mabi=lp64 -
>>>> I./include -I./arch/riscv/include -march=rv64gc -mstrict-align -
>>>> mcmodel=medany - -c arch/riscv/riscv64/head.S -o
>>>> arch/riscv/riscv64/head.o
>>> Looking into why you see different code generated than I: Nothing
>>> in
>>> here directs gcc to pass -fpic to gas; in upstream gcc (consistent
>>> from gcc7 through gcc12, which are the versions I've checked; the
>>> actual range may be wider) there is
>>>
>>> #define ASM_SPEC "\
>>> %(subtarget_asm_debugging_spec) \
>>> %{" FPIE_OR_FPIC_SPEC ":-fpic} \
>>> ...
>>>
>>> Can you check whether your gcc passes -fpic to gas even when
>>> there's
>>> no -fPIC / -fPIE (or alike) on the gcc command line? Or whether
>>> your
>>> gas (unlike upstream's) defaults to PIC mode? (For .S files
>>> ASM_SPEC
>>> is all that counts. For .c files gcc is redundantly passing -fpic
>>> along with also emitting ".option pic" or, in the opposite case, it
>>> is omitting -fpic along with emitting ".option nopic".)
>>>
>>> You gcc may have been configured with --enable-default-pie, while I
>>> know mine hasn't been (simply because that's the default).
>>
>> From the thread, the difference is clearly around the pie option, but
>> I
>> have to admit that I'm confused.
>>
>> With GCC 10 from Debian repos and current staging (modulo the build
>> fix), we end up with:
>>
>> 0000000080200000 <_start>:
>>     80200000:   10401073                csrw    sie,zero
>>     80200004:   00002117                auipc   sp,0x2
>>     80200008:   00413103                ld      sp,4(sp) # 80202008
>> <_GLOBAL_OFFSET_TABLE_+0x8>
>>     8020000c:   6285                    lui     t0,0x1
>>     8020000e:   9116                    add     sp,sp,t0
>>     80200010:   7f10206f                j       80203000 <start_xen>
>>
>> In this case, the auipc/ld pair makes a PC-relative reference into
>> the
>> GOT, but the pointer spilled into the GOT is the link time address of
>> cpu0_boot_stack.
>>
>> For the executable as a whole, we've got:
>>
>> [ 6] .got              PROGBITS        0000000080202000 003000 000010
>> 08  WA  0   0  8
>> [ 7] .got.plt          PROGBITS        0000000080202010 003010 000010
>> 08  WA  0   0  8
>>
>> i.e. both nonzero in size, so presumably with expectations of
>> something
>> else to fix up the references.
>>
>> I suspect we want to extend the x86 section asserts into the other
>> architectures too, alongside figuring out how exactly to disable code
>> generation of this form.
>>
> But AFAIU it is expected that it will use GOT sections with the link
> time address of cpu0_boot_stack inside them because of pie option.
> 
> If we need to work with pie option that we can fix all address in
> .got{.plt} somewhere at the start of head.S

While .got is very sensible in "normal" binaries, I think its use should
be avoided in kernels and alike.

> but why we can't go with -
> fno-pie as it is done for other architectures:

Why do you ask this repeatedly when the suggestion was to actually
use EMBEDDED_EXTRA_CFLAGS?

> Config.mk:
> 	EMBEDDED_EXTRA_CFLAGS := -fno-pie -fno-stack-protector -fno-
> stack-protector-all
> EMBEDDED_EXTRA_CFLAGS += -fno-exceptions -fno-asynchronous-unwind-
> tables
> 
> arch.mk:
>     $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
> 
> 
> Could you please explain what is x86 section asserts?

If you look at the bottom of x86's xen.lds.S you'll find a number of
assertions, among them one towards .got being empty. Some of the
sections checked there may indeed not be applicable on arbitrary
architectures, but I think .got is sufficiently universal. So I agree
with Andrew that it may be worthwhile making some of this generic.

Jan

