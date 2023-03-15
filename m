Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3A46BAA35
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 08:59:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509925.786686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcM2e-0004eB-MN; Wed, 15 Mar 2023 07:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509925.786686; Wed, 15 Mar 2023 07:59:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcM2e-0004bS-Jk; Wed, 15 Mar 2023 07:59:24 +0000
Received: by outflank-mailman (input) for mailman id 509925;
 Wed, 15 Mar 2023 07:59:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcM2c-0004bM-V3
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 07:59:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a382bad-c307-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 08:59:20 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9191.eurprd04.prod.outlook.com (2603:10a6:20b:44e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 07:59:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 07:59:18 +0000
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
X-Inumbo-ID: 4a382bad-c307-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dN4TmJFFhufDLXpM244jNcjYTKG0jfpa1Wt2AVJEW30fuOQYWABHlYfveLc/TwvJbpTgyaYePgdGNveutel+q4KxJfYzxoCKtI9+YdWujNW5D5W9aXPxlrlu5S8wZkwDdxF3Kwrmz93GiNUqGzaaQpa3vDz2VLkm+6mJmDhqZoZXDmwbVlRsRWv5gVXQtzxbgqdYwHdPtuRQLQw0Rr6BG1CoYrWqyUUMqUYUdAbi0JC9A3PSzPXDdHj71WgR1SNLETA3kHsN73Kp+pMrtJwtYIoy7Ffr800rCaV4w2f+Kbw8VN5ziqLhcCx9Ff3nLBAcl0vYftr7iXw/9ZW8fU4cXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SohYZspYscigbG1Epvq4ssMMvrkYO5BVSX4PQ7Kzyio=;
 b=Jb/Vh4hxyfsUNdzCHfEKxz15aosNXMfqfuVHY2wyEJmlxJXBygJkEzv44tf2sXSB9vv+qCkBEAgmOZ1vru0fFt7QmATXCIwhQtmkD7z114LN1PfdzLeuF3YxAh4Wq9NA/xtgQuU65xGJslLyOyQyQL5XKofG2/Fs9El2S52UCtzpaMmCnn3+fljbVnrn7GsQ2Ute7zk5mEmQ646gcqo7uSyuEGmm5x361QlLEt1noQ2jooM063aMNF2O2Xrwgzx0z+3qjRxSviM+OGZtgKRKOhdJUA/39oD2bLEHrOxRX9RriCTsEydERqjD9vyBEL4RkhNItQ/zKys7awztbCmW5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SohYZspYscigbG1Epvq4ssMMvrkYO5BVSX4PQ7Kzyio=;
 b=ncwR3dKOavFn2VCjwocGappRp1a0cWvoy4GuCDWHuoVMMobDKbbFGm8m0viwhaoHwYcpTq39rMgU1GXReCpQ9hBMBY3eC6VautqqA+cD1Yyaoj/gnXFB26jG6t16WZQ7MOMgOtsynKi2rTFykmnbhXPFAvb6Kuw9+oJY8y8zclOsnEtXjwzDD94vAqnVaqBV4qN9Pb7g9JHZebp0yau6FfiePJq+hglQC/9YT3F1hBYdbI/jMInaVSg5mJ9hgC0LUS5yQ720uYisSoBpIH0Q9FmkLBreeqLVxT2zwUBpPU/fY+wqb6KEsX3kWLWXZGnW4F07mdEuyngNyzztpGg86g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <966c19e3-d255-db73-9bb4-7abe0a745396@suse.com>
Date: Wed, 15 Mar 2023 08:59:16 +0100
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
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <ad2249c1b5be01f99ef9c294a3264da0c9715bab.1678809641.git.oleksii.kurochko@gmail.com>
 <9c5ec3f3-c909-8f45-4460-1b29ce333d10@citrix.com>
 <e7c42fc7561b88b1a18463b9b28d0b09cd6553c4.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e7c42fc7561b88b1a18463b9b28d0b09cd6553c4.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9191:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae6314b-6fe7-4edb-cbb5-08db252b2d6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eero34zl+eeIwhagSg510+0CHBQ4PiQ6ehxVe8OuIPer1u2JjtAUqTvz6qg5tv4hEy9u4CO8kBgylCxZf9ZkQN1GrrCjzixoFPDq3e28MEgBdwl/nBKEyIztK/4NJFCGglvLxVcA2glcX9Yk8FBEiADNOLsJWbbYyrbjHakqgN5fe9XeRSJf0vpX96kyPAjxc848dL4VcJ1DhTNWGs6si79wHHhwQT0BsUneBj9CGZ9FuBMQizsen9YUjQ4H+xDii9d9NuTiKDbx1QHy9P4ZfLJO9ekj4h0Vo+ScOkP5nUDXzglturtjsjFIUTQoJdS0/u+UqeTKpLnp6PJaV6/ib4BipQ2Ov7dQ5Jz3HNfQjiBj/I0ZvazdHSI2ZxggRTw6VQ/vEpP+mENYaR7ywTaZ/ficvNkrIVm7PBm0uPpwH1qitPNQqGC/+lM1VqbhA7Q0tGEI9HLDm4k4SI3GbmIuyE4M0vOmUcUWHAGBqmZDAfF8WBSlovu5lMJ8E0Mwyvg9U9iHPNam/6f5WQXiDyPEnisLqZF+GaG2/duetPAZb4MjbwgLj1/eza7MpTVSq+8+QMGtrHEyHAwigHlWpnKtYOFy3rKkJveoOvMsrs5MBtECr8ocqW1yTFlENUlavMgqlWXBm5KkVRIVIpf0fsGa2XtVsSa+7JvJ2ZaPsAwNlKivlzUi0b1/L6J+1hhNaFQ1+eWISB7hTuYRxAiwSPu5Xpm+OidOMICCRqraUFWfiQo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199018)(6506007)(36756003)(6512007)(26005)(6486002)(8936002)(38100700002)(6916009)(66556008)(8676002)(66946007)(478600001)(4326008)(66476007)(316002)(54906003)(186003)(5660300002)(2616005)(86362001)(31696002)(41300700001)(53546011)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckdvdlhjYiswanFQckJVbnJMRjZid0kvK2Qvb0gxUVhKcTlzNUNXRGEvdURQ?=
 =?utf-8?B?MDQyOTg0SmhhRkpBblROaHl5WWlVS2NKYWtHMVZVVXkxVkZxRWRGbTRWWU5L?=
 =?utf-8?B?eHQxU2tQOUVWOWJjUmhiNDlWSnJKUVIvQWFyS2dqOTdKTWtWdXVTenA1bGhi?=
 =?utf-8?B?Z1ZoazdjajUzemtQLzVjMExaOXkyL3dqT2FtWm1UNG1Fd0Z4c3BWajRVVlZD?=
 =?utf-8?B?K1Q1ODZxR2JHcDZNNkZZRkN6S3NMU2I5d1lKVVRNYmxtd2E0Sk55dkZiMmM4?=
 =?utf-8?B?S1B6Wmg3N3psbUk2Y3VWT2FET3VHYy9Xc2VRVWpyTHNSNW4yald5L3dBa2Rq?=
 =?utf-8?B?WEh5N0lrZ0tJL0RtRlJGNzRxZ2JISFU0cmxOUkkycUdPSEdCY3hiZTBlTmVP?=
 =?utf-8?B?YWV4VFAyeUpKM3R2by9OMmR6UzZjQ0I1R1Bob2l6eW54RHgyUjFhSSt4UjQw?=
 =?utf-8?B?RHdYMGtvQVgvWk9RWENYdVFjQmVBSHZDNnRMQ05FMFdpQmRMY1I1dHdwQ0tX?=
 =?utf-8?B?NDZ0dk8rekZXWUNHT2JPMW04NmYyYjFZZEhhb2JkU2RNQ3BERVp1aEJKUEhU?=
 =?utf-8?B?TTMwRUxaVFZFN2lrbUlPVTBLem1nYldGL3NZN2VlaFFJanlub0pDM0tiYy8z?=
 =?utf-8?B?djAxdFBGVFVIMGV1NFEwSGRqaTFJcVdNSDdMY0ZZc3lUWCtiOTBVMkVscnVP?=
 =?utf-8?B?M2hXTWVVRUszN3Q2M3hyaGNYY0FUN2RCbUhwYXpiNjFhU0wybzlYUDBMQ0p4?=
 =?utf-8?B?WklTeTIySVBRYXdzc1ZGQXU2U09qcFQvMjlnQzZqd1BMVFE5QTRpNkswSHJ1?=
 =?utf-8?B?T0Y2Kzc3MzVHYXlMY3Z4Si92L0FycVRzNzFqd1Y3NjQ4VXkyR3RwUHF0eFdx?=
 =?utf-8?B?c21kMEw3YXlZdDBVRm04TGxBaE1MUWc5UGJlSXJVNmlGQTJUVnJ1clZ1Tk8x?=
 =?utf-8?B?Y2pyTUJVaWNwV2REa2hkdlh6UDRQVVd4aHUvRklMNVVPRWdSajBTejdRVkZj?=
 =?utf-8?B?MWlsZEUrR0hGWG1XS2NxVnFlVVRNbFo4YWJsWHQ4TElxd0NadHpqZitkYTNK?=
 =?utf-8?B?SUVpdnJwYkVwN3g3bHk4VGhtNWhmbUJWQlk2YnRjSVNxUzM2eGMrbm5hMW1w?=
 =?utf-8?B?ZXlkaGVNNURJUW5qOU8xNFRJQWp6U0RXMW9oWkI4Wlk5eE5HT0RUa1czNzJU?=
 =?utf-8?B?dmJuTnltTkhGSWxzRTlSZTNEeDZ3T3NNQzVUcXh0ekdyRjg5N1lqa3NMSDAw?=
 =?utf-8?B?N1M1OWJGbVNocjdSSjhmakx0amhHbVBEdUx6eHNJL0ZrYTdKV2o2b3IzTjJO?=
 =?utf-8?B?eTBoeVM0OElISjVDSlV0KzJVbXNMMnZia29GOEZ1M2RPcXZDZFZMdlhLVGcw?=
 =?utf-8?B?WGxRdHd2cEZ6eHNibVlEVitDMDk0SC93TmRCQ1dya05nNXFBTm02VVdvNkUw?=
 =?utf-8?B?ekdyaTJTbk40TzM3NUxYZklIbnR1NFRVWXdsSXZTTTFFOE9oLzA4VkRiS1Rp?=
 =?utf-8?B?UkluYzF3eVJXN1NVUnVadloxTUg2cE9ad0dsazZZOGRyQmhTT0VyTWNLdlVx?=
 =?utf-8?B?OEcyM1ppSXBxaHkvb0ZIYmc1RDduSDVPSlFGV0t4bkJTQnlsMnY1c3c2SXl6?=
 =?utf-8?B?MkhpZXpicTVvb2tMa3czWktCZU1pWHIwcWRMaXpCTlZjQ01DYXFVK0pKWldW?=
 =?utf-8?B?aVRLRTUwZDFFd2lNQUFqZlRpbHhwZGMrbi9qbjlzbVN0Tm55bllKNVFtREhQ?=
 =?utf-8?B?dGhjOCtxY1RtRTF5a3Q1ZlB2R2xndGkwR01WUDZsTmhuVW85TGR3UndmZzIv?=
 =?utf-8?B?OXIrZzdUQlJ2Z28rclB2VkxwRlp4bTdYYnp6Sy9BdU9YVkVoeE0wQ0UxNUps?=
 =?utf-8?B?c2dXMGdLS0ZCU1JkVWY0d0d5YlFzekVkeFAxaHVPM1p2RGlnWEZ2YnJidGFw?=
 =?utf-8?B?UjhEbXVlcHhCZjRNUjdmMlE5ZGlSSy9CMWRmTTJjanZGdTh5ejFkd21Gd2Y0?=
 =?utf-8?B?eVgvc0h6dDlUcVNJNDdJUVhROVJDbHdVOUhLUUhMUE1yT3pPYnFrUjNNL1Ax?=
 =?utf-8?B?WFJiVHRSOXR0amRWemUzZXlVZmQxOVYydTBTNG9TdXhMV04yZ1hhOFdzRnJp?=
 =?utf-8?Q?6yGGe7KxabWpBcFNclODIRTDS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae6314b-6fe7-4edb-cbb5-08db252b2d6a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 07:59:18.0258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LXRIemdcmyISEgbP3hVl2UZXswb1ozEm8UpUGTJY6Oh6fqQBFBF4rnCOP/8OVYmww4sZJ5nSShbczmc8+PfkZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9191

On 14.03.2023 21:16, Oleksii wrote:
> I checked in Linux binary how 'la' instruction is transformed, and it
> looks like it is translated as I expect to auipc/addi pair:
> ffffffe000001066: 00027517 auipc a0,0x27
> ffffffe00000106a: f9a50513 addi a0,a0,-102 # ffffffe000028000
> <early_pg_dir>
> 
> I checked compiler flags between Xen and Linux. The difference is in-
> fno-PIE (Linux also adds -mabi and -march to AFLAGS):
> 
> 1. Linux build command of head.S: riscv64-linux-gnu-gcc -Wp,-
> MD,arch/riscv/kernel/.head.o.d -nostdinc -isystem /usr/lib/gcc-
> cross/riscv64-linux-gnu/9/include -I./arch/riscv/include -
> I./arch/riscv/include/generated -I./include -I./arch/riscv/include/uapi
> -I./arch/riscv/include/generated/uapi -I./include/uapi -
> I./include/generated/uapi -include ./include/linux/kconfig.h -
> D__KERNEL__ -D__ASSEMBLY__ -fno-PIE -mabi=lp64 -march=rv64imafdc -c -o
> arch/riscv/kernel/head.o arch/riscv/kernel/head.S
> 
> 2. Xen build command of head.S:riscv64-linux-gnu-gcc -MMD -MP -MF
> arch/riscv/riscv64/.head.o.d -D__ASSEMBLY__ -Wa,--noexecstack -
> DBUILD_ID -fno-strict-aliasing -Wall -Wstrict-prototypes -Wdeclaration-
> after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs
> -O1 -fno-omit-frame-pointer -nostdinc -fno-builtin -fno-common -Werror
> -Wredundant-decls -Wno-pointer-arith -Wvla -pipe -D__XEN__ -include
> ./include/xen/config.h -Wa,--strip-local-absolute -g -mabi=lp64 -
> I./include -I./arch/riscv/include -march=rv64gc -mstrict-align -
> mcmodel=medany - -c arch/riscv/riscv64/head.S -o
> arch/riscv/riscv64/head.o

Looking into why you see different code generated than I: Nothing in
here directs gcc to pass -fpic to gas; in upstream gcc (consistent
from gcc7 through gcc12, which are the versions I've checked; the
actual range may be wider) there is

#define ASM_SPEC "\
%(subtarget_asm_debugging_spec) \
%{" FPIE_OR_FPIC_SPEC ":-fpic} \
...

Can you check whether your gcc passes -fpic to gas even when there's
no -fPIC / -fPIE (or alike) on the gcc command line? Or whether your
gas (unlike upstream's) defaults to PIC mode? (For .S files ASM_SPEC
is all that counts. For .c files gcc is redundantly passing -fpic
along with also emitting ".option pic" or, in the opposite case, it
is omitting -fpic along with emitting ".option nopic".)

You gcc may have been configured with --enable-default-pie, while I
know mine hasn't been (simply because that's the default).

Jan

