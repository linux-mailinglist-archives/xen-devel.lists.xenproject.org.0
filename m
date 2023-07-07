Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BDD74ADD1
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 11:33:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560318.876150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHhpt-00007T-6h; Fri, 07 Jul 2023 09:33:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560318.876150; Fri, 07 Jul 2023 09:33:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHhpt-0008W7-3u; Fri, 07 Jul 2023 09:33:09 +0000
Received: by outflank-mailman (input) for mailman id 560318;
 Fri, 07 Jul 2023 09:33:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHhpr-0008Vz-9r
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 09:33:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46cb8965-1ca9-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 11:33:06 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8589.eurprd04.prod.outlook.com (2603:10a6:102:218::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Fri, 7 Jul
 2023 09:33:03 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Fri, 7 Jul 2023
 09:33:03 +0000
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
X-Inumbo-ID: 46cb8965-1ca9-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+vv7H8hizUgys2OGFUDwNXKeQfHa8aKApj5CuX1FAHmYJeHuKcdYoN9easNChqpfDC+gFsTLWR/iZENqtOhzcEtlGizJasvZo5IyFJ+AirUMP4nLEtPfID7GJq2gjzfSr2VhRHEjMe8TIi9ZcVydQfbP+L5MN43ZbuDepLeh2w32MZvASTUoNeTp0oA1PzUVEAbUpa0Bd1Aw8ugv3tWY5MyADoZh4YILkxOpTRJswtNVOWomUHT2QPbp1pYyOgYyOTfHmxKY62CPjdiRxd630lbww4pqddwSZMHHgPDppckfqONwpiSycQhU5zpjEcShU/kwv1wPC9e9MPC187yzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wz1crOwYzBFGsGkYUaPG69JYQEtQrUtNxrg74IC0P0U=;
 b=OqKgATJ7UuML5hQKidDlmm90tj4cgZc6t7lAwEWJskpG8gZhAZSmoS3gNxwQEXTgn+8aqzP8Dh43bmmCAEsK4PeSfcIs9yJ/o6P10MCpkijhqBqgeDTJTrp4g9jM7HnSwA05JBWKzu6e1ECoip0SgZ2z/DVKuUvryo6YMq16cQC4SVCa66dVuJXChApMV7BB/4PCntGvynMAn65cRudSoI5s81t4MXRKWbR7mH8BFooZJKqKf4UU6/KIY4dkrv3Z1WsfS0zMCXJlGL/vOVY0DLFGYjnicC3OOAFZWkX3GPYASMtBIuhtRahMasDIUWjL3HpypI4+GbP7bddPlc/SeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wz1crOwYzBFGsGkYUaPG69JYQEtQrUtNxrg74IC0P0U=;
 b=aNfkqsYdeggWCdk5guLg6SV98Onx6JaZYYY3P2fldGeJT6DEOb0PzWf5VyrbWhvyD5eFUi685KRzRMjPeiBUX8ugKa9cGM0gEr4Uoey9zdZwrmiSz/Y7CUklOFkdyzH42NHrx3C28b/EvJB61swbWBoQ3j2fE0yqpurbeoXgU3vfGm5t1QCirFox7vqrCT3cyKKbe5AURxwtwZKVso0A/IdU5qLXjlqDDA9F52lsLlZOys5Byicr4C4n0Yem9OYSZXoMqawuqLTxeCs9KkkhQDI0zCrMCXQCnVMP3l64V7XgICVPy94l3HUv0t5bbrxVJoz2PYMTH3HNVoO5bdAS/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <be40e52e-454c-57ba-0ad1-6fae2b896332@suse.com>
Date: Fri, 7 Jul 2023 11:33:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/6] xen/riscv: introduce reset_stack() function
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1687178053.git.oleksii.kurochko@gmail.com>
 <6024617719467cd2da8ae03b81ddc899f2ba4311.1687178053.git.oleksii.kurochko@gmail.com>
 <98f1cb38-673a-c66f-96be-ba2cb6ff242f@suse.com>
 <ba2694c1e64b6bdf493170c72564ae72d701b700.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ba2694c1e64b6bdf493170c72564ae72d701b700.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8589:EE_
X-MS-Office365-Filtering-Correlation-Id: ab470c7b-d152-4698-b3ec-08db7ecd2970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cx138B5rgj38NLZojDIor9iWIbKWW/LJ2UKNitbEt3WROY2ElC83cx3jM7BqarQ6CbxP/BbG7qHiihWJk8JYXgJwsAdOIUho1St7uM3NgWsCgNGSo3JW/+qSPGLSymC2DimNHVPLUoDs1zbDNWISJOgwb9IkgFSK4m6CaHvDmq0RgIJFp/kzy+2DZff6A/QHvtSduBhwxL/BjYg1XQZ/90l9F/tzR6wDJEWZAltiGnEMJ+/4JdoRmKuG8VBCnR+Dy4M1mDBWBwWHOFnXZ6Y6KymJRNiHAAofZLYqfddxTeckzExANBLdxTWZ0gs8HsNgaMtKi1YIbku2l5+HbE4FVY5OHvRdFMjFnrQQ58eP5EBXIV2G+Fy31qkqRTNlT1qxT2kEKWttV/h0TcOc1QccY3x9SW5Vg4YzslktIpiXo1G7fW7kaRZlY8AIt/eMCwjIJZGx94zTMDr7q7NJx+21aqr7CVXnlXz4iURnGHxg2aK0QYwpXf9sR4GwwLXLAhGpP6CJNvaKoRUOU+p1CuZp9jIniukShrv42ughM77kbNFcPn+CLoxsYBQhZvhmCGCQBLn8fUhI1FBuP9azp1n/V2m8kiDYTqB1zpFMCNmn2AY9GDODbIBPE5HNekUTHk2P1YbuBGCYBjZxQLVhhKfj8g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(346002)(376002)(396003)(136003)(451199021)(41300700001)(4744005)(186003)(38100700002)(2616005)(53546011)(6506007)(83380400001)(6486002)(26005)(6512007)(31696002)(86362001)(54906003)(478600001)(66556008)(36756003)(316002)(4326008)(2906002)(66476007)(66946007)(8676002)(8936002)(6916009)(31686004)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RENDa3V0b0FSUHdma1hONXI4RlZLcjN4b2M0cU9ZZkNIM0VNcHJXNU5BVW9W?=
 =?utf-8?B?YTVaTTNkeFc2dllpalE1VmRFclY3L3pGeGo4TkJGYmZ3azFSai9tR3I5ZmJw?=
 =?utf-8?B?Qmw5ZENMM05qYWNOQVhsNTNNc0lkREpObHVZcGpOdmVGRndZOTBnRmxlY3RM?=
 =?utf-8?B?QmpDUlk0RW9WSEd1aFBBeXhlR0N5dllvV3dtdjB1bmJWUkp3VzNPemV5YmJa?=
 =?utf-8?B?ZXF4VU0vOE1KM1RyVjZpOUVnMlo1QTlKRFhmdzF1U2VqQkZXZFNEbkU1WjJJ?=
 =?utf-8?B?MEN0eWNxSGVRWjZxNHhYb3hZc0RWeEpyUWZoNUZPalVOTmIzZjhoZHk1U1Fa?=
 =?utf-8?B?b29QTDRqT3l5cENGaDJWbWpBTmprU1hVcWhKSXkzUGZwc0hHaWVqN2g0MlNP?=
 =?utf-8?B?TTlDcHVNRnBoUlorWCtiaHBzTDRlaGY5RzJYV0hvYUJ4U0hMK3Qzbi8yNVVy?=
 =?utf-8?B?NVl5OFlMc2drS2d3ZnZDWm5xMVdlYys5UlVOcHRkcnc1NlMwb2g3QUlVZDYy?=
 =?utf-8?B?K1dSUzA3WllMSkoyYkM5UUsxSk5PZFN6Q2E0dnFzS2xZLy9xT2l1cjAzWCt6?=
 =?utf-8?B?cGhGNXBtTVdDem94ejRkTVpidnNOckF0U28rbnY4c3YwZkJ5UE5IOXY4Y0d6?=
 =?utf-8?B?dWdjU3pMNGRTRnhiUEIyUW5CNkt4NXFOTjRhTDdWUWFCdjJPbjNPWnNibU9i?=
 =?utf-8?B?VlZ4dml1MUx2SjNiZnduV2dLZ0E4ci9FTE9rcmw0U2ttTGI0SGhQdG1LVWxn?=
 =?utf-8?B?K1ZxeXFJMXg4V1ZlclFpa0t2MHRBMFczaXZTamM1M0pSMWZveSsvUElGcmJ3?=
 =?utf-8?B?WUZCV2tFYnhhMGdwMXpXWFBEN2puUDRBSDBBUWM5WGV6ZFNGUVZNaUJxTGdH?=
 =?utf-8?B?dmpvYldlaFhMcjcyaFpiN0s3Z3h5QkxOOHhGcm8zbXcyVkhlR05WRmVGRlpw?=
 =?utf-8?B?RkMzSXVIWUFsSWtGT3plOU5TbVVjN3FNUnBYVDM2KzVBcVRYVWtCRVJuUmRr?=
 =?utf-8?B?b2UxbmFXUWxJcllDbHVQRjNraVNUUGJ3YzJ1OXNYdWFrZzZiOE42VjJXNndy?=
 =?utf-8?B?cFRHeGZoNXVEWVJJbUpURVVYVFhwc3Q3dzRmZlIxc0xjb1p3T0NGVHY0RlBt?=
 =?utf-8?B?SmMvcGhvWnR1cjdqMU1TQ2JBeGY3VzBSKzdBRThCa3F3RU1uMFo5dmVhcmNh?=
 =?utf-8?B?OEhVUUQwWDFnUTdCcjZveGN6WWdaNDk1TWV2K1ZTbWQvdmhLNXQ2NE1yd21y?=
 =?utf-8?B?bjZNVlNtTVBKalh2QlAxZk1BK1pRRjl5V2twVmhGOHQySnhHanF1VWJyV3ZW?=
 =?utf-8?B?KytuOE1MQVVjQ3NoN2M5b1JndjJ1TlVtMWlnT3JzeTV6ajVTZFE1dGdjbC9t?=
 =?utf-8?B?VHplOUZVL1B3TGlJcVRoMkpwS04vV2xVbTY5QzNKMnEwSHdVdXYvWFVDS2dq?=
 =?utf-8?B?YUh5RWczdGx3alJ6dERDaEVVT0tJNXJCNTlMblJyV3lFTC9kSE1zblUzU2Zn?=
 =?utf-8?B?K0VkaHBmMHVRd1NzeExqUC9YR01Fb005UEdCQkI2M0F3cVdPQUVDbUZ0OWNJ?=
 =?utf-8?B?Z0I3QzY5WDdKYm1WNFVKVXRaeHluaHRMNUZyVi9nNVZBSk9tSHNkNTJEMG8r?=
 =?utf-8?B?SkNSa0VmRlllVHdHOE54endOTzU5MWNxcW1VM01SaWhLb0lTOVRuRWlLc0VR?=
 =?utf-8?B?amtWQXhWdUZFWXlCK3dnNm1jK3pHVmlYa3d5ZGdtczFSWmZhdWxvaEhlQkt2?=
 =?utf-8?B?QkwzUXZaTFo2aGlxVXFuVEpMUmlrSTJpWWp6NkFOTnJPWnJHT2ZKbkY2cnVI?=
 =?utf-8?B?YVJ6bGxLOWxCM0FMenl1VVl4TVk4SHVGZ0hHUE44ck9BNitoUUxnNUNYRjZp?=
 =?utf-8?B?YlZjTnMvUlI2Z0FDNFpXM3VtQzlQejN4RlhsaFRPY2RQem5oZ2pRaGVudDNs?=
 =?utf-8?B?RG5jaldscTY2NHdnTTMzMWU4VVUvSnBvc0daV0xZV0NrRDVReitnNUVWcmcz?=
 =?utf-8?B?TXpJUXVyQTZPc3RrQWIwak10ZGJOV1FXNitqMWZ5UEtGSWc4MHIvNkI1bjU4?=
 =?utf-8?B?QXA3YWd3RWUzVG9tMDBZVWRmVFBCdjZVMWl0VXh2WXlNcGFuSDd1bm1wbXA2?=
 =?utf-8?Q?bz1T6c0554Sq4YhkxfAWvFomP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab470c7b-d152-4698-b3ec-08db7ecd2970
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 09:33:03.3122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+6UvzFVKE6O9xnDPEKqEQfh2wAJh6RTySuzXXTTB+w12nb1rOxiRP2HyPTXOz7YUOKF4VALGJC1I9PaEt9buQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8589

On 07.07.2023 11:08, Oleksii wrote:
> On Thu, 2023-07-06 at 13:17 +0200, Jan Beulich wrote:
>> On 19.06.2023 15:34, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/riscv64/head.S
>>> +++ b/xen/arch/riscv/riscv64/head.S
>>> @@ -27,8 +27,16 @@ ENTRY(start)
>>>          add     t3, t3, __SIZEOF_POINTER__
>>>          bltu    t3, t4, .L_clear_bss
>>>  
>>> +        jal     reset_stack
>>> +
>>> +        tail    start_xen
>>> +
>>> +        .section .text, "ax", %progbits
>>> +
>>> +ENTRY(reset_stack)
>>>          la      sp, cpu0_boot_stack
>>>          li      t0, STACK_SIZE
>>>          add     sp, sp, t0
>>>  
>>> -        tail    start_xen
>>> +        ret
>>> +
>>
>> Looking at patch 4 you will want to add a comment here to emphasize
>> that a0 and a1 have to remain unclobbered.
> Thanks for a note. I'll add it in the new patch version

Having seen how things end up by the end of the series, there's an
alternative: You could save a0 and a1 ahead of the 1st call to
reset_stack, rather than immediately afterwards.

Jan

