Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ADB687CAE
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 12:51:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488767.757012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNY75-0001aE-Cu; Thu, 02 Feb 2023 11:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488767.757012; Thu, 02 Feb 2023 11:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNY75-0001Xi-AJ; Thu, 02 Feb 2023 11:50:47 +0000
Received: by outflank-mailman (input) for mailman id 488767;
 Thu, 02 Feb 2023 11:50:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t7Uy=56=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pNY73-0001Xc-Rb
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 11:50:46 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe16::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2b9a16b-a2ef-11ed-933c-83870f6b2ba8;
 Thu, 02 Feb 2023 12:50:44 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8479.eurprd04.prod.outlook.com (2603:10a6:10:2c5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Thu, 2 Feb
 2023 11:50:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%6]) with mapi id 15.20.6064.024; Thu, 2 Feb 2023
 11:50:41 +0000
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
X-Inumbo-ID: d2b9a16b-a2ef-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dq/9WdFCw8j+OV9ujHzb21m47feA424DnFN6ULugtF1QAuqCVOhCyYpOUu2EjpLdKc850yImlTpA9FK4EiV83Tf+t8vAVFQseSVf34YpX47cECOrC0E1Y+1I6rjoecl+iTtcWNYclsF4vAh70mWdjjVbK1j+56MkDfwCJk8+wpoYOo7xamGOo45E6ro3YSsmlkFnoC+WO/bB8hUj/2un616rbiiIUefEmfKwyCACjnj5rYVTvpfNHy1RL2LxhNj18of6FDmM6Q343tk/dScoLEUhbJflmFXR4vPJSUY4SVTRdhIRldDTdV2neshYkv/EuHWZcaTUu0oQO5LvpHPghA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ml+veEjEwYmlA5aBnex8Kj6IT16gjIKNEqJmPsjzHYA=;
 b=jvr60OQov3wI4djmNIfIUI6XoRrceWd+gcOJAEiqLK6VkqXW6ntXG8EamFhK1eYfolDvheP/y3YOOgSWT+b/Z1gFY0vAtXZ7bspghjgRme/LdtcqwYcyF655wuFsLGtmF1/CNAwBSE6Qn1ZxDwAW+OF8epT5wWuF6kuF/26meA4Ive1N0hjcYHV9AFeWrgpCkOgDhNsCJsst2IssQyNtAF8TeHMGssbnq1oPze6i+CmuS4gKHNyb9jYMzFJyudqjSk/GGHEtYQenVg7U37+wdZATQyvgZSJyADaaLeGuZXksY0HK6CIaa14eauQ3nbMkdfVIkF4Tg2W6D65pEtwmcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ml+veEjEwYmlA5aBnex8Kj6IT16gjIKNEqJmPsjzHYA=;
 b=t85ImZix1Dv2Lq1Bb6xBGHRr0iktD/FT4QmHUdTELzfv3Ov2PofvV5ZVdFAwk3W3KqSnkjAA7GOx0CiYyusSa4UcV4/+NsxdLKZt1HyGEABeEDAnXtgXVRJA+Tknnal5TjFu495fwaCcrdRmX8dbdq1jYNRVWEoRm9TCVogymznfL1n3GI1qcgZG5lnjCcbIwgUmIhCjFcou58jcqm11OxVsBJ11ewALYVL9h4UnjBTENE2oJMR65KCEI22GGPlx4T3g4XPuUoh597OngqB327wZxFkWEU0OHd+J0kJ8sZezk+GJL2yd3qC6x1Ta6uz3RuaiksSw+elyOuKXWUqWBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3c649ad7-ddee-8a3f-485b-3e056f1e9c73@suse.com>
Date: Thu, 2 Feb 2023 12:50:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 12/14] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Oleksii <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
 <06c06dde5ee635c6d1ebf66a8cff9e7e1f4fbf5c.1674818705.git.oleksii.kurochko@gmail.com>
 <73553bcf-9688-c187-a9cb-c12806484893@xen.org>
 <2c4d490bde4f04f956e481257ddc7129c312abb6.camel@gmail.com>
 <873d4754-0314-0022-96a9-e54ed78ac6ef@xen.org>
 <d41b705904b693e80cf5fdadd46a26e38d1bc596.camel@gmail.com>
 <b5dba106-e7ed-4aa9-ea44-19adacc7fade@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b5dba106-e7ed-4aa9-ea44-19adacc7fade@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8479:EE_
X-MS-Office365-Filtering-Correlation-Id: f6fbfbca-aaf2-45a5-afa1-08db0513b555
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FWTOmDo3EVC14jLf82xDdIMfkgjWPCAVa3V1fv7F3pOsuPrvQ3xchaJv/hrHpOd63swv07L4RlBQ6NrL0flEKpqeC7jhm8K7KhXdRF6kppyPGTBYVBX+Nuln5rwMFlWSdJ4W2D724T4UWW+l1tH23Zqu4k7k8ABdOs62F0VMw2cfW9Ca2d7b5K1DS4LH03e0O2gCj+k96LLQGFlv5iJ/VFUFm0Zm5UCrEjmBIZf5wn7hgDAkxdPIqvGHdXRz5XcTIAboGrAvVs+YNVwS6v9Q/FfPwlD2wXnIHXJNMQvNbNYtWI3FUDxPgTW25zMDZzSU5Jukj0d3AKgH4a00HatH6aulTriH1JOMO/V6hgG0K3l9ypGSSnDzbUZC6tIpPyn+KWDgJ6tTwJAenVRJARJ3HUHminwhEVqr/7s+doUuRdpTdtIZBdSwzuQN9iSZUNYuox7NNbnkwuuA/BsXq8xjvyQZ6kMNgCir6ssSKYJy+jHG5negr5qE0R6BnQfSXOkOQknDLzizmOdZLA7098YBSIrujMFLfOGtGwY4/0PzWeFemLb6pqy6+0yaLwg1ohHTwiALU+ZGZcifxCf6Xw5aCh+0L4sdrxyujHvnl6b8ijFsTtyEJ2JTx77bGtKWvsvl2XSysgMsNmQS9pHDo+8GefW9Dma4TcvIYOiJsmbvnYXMiUgIJTHWrHtzYF42uKLBs7vts+iF7hy1+K/cOgA5PfxYKMAw6ksLEbrfUded4k8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(366004)(136003)(376002)(39860400002)(451199018)(36756003)(66556008)(66476007)(66946007)(38100700002)(4326008)(83380400001)(8676002)(6916009)(54906003)(316002)(53546011)(478600001)(26005)(186003)(6512007)(6666004)(6506007)(6486002)(5660300002)(86362001)(41300700001)(31696002)(2616005)(8936002)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlNaSU9BWjVSSTAyZ21GeUpZV0VTRWpOeXlsTkFDNSs5Wkdra2NLY21Pa2Vr?=
 =?utf-8?B?bjM3d3RYZ0l4U0k3eHQrTEI2VSt2OHNpZWlvb3M0OWtxS0pDV09nN0xJUFJx?=
 =?utf-8?B?cVpUR2tubTdWVjY0SGttaEtZMURuQ0RaQVdIK05FR2J6SDlNMlB2VjJRWDgz?=
 =?utf-8?B?NmtUZ0VXVW85ZG9waDJwNTNGcUtZaHdHQlZaRUlBb252V3Z4T2RjblBkMUVW?=
 =?utf-8?B?R2dqc240a1Z3MHFZaWV3Q2d5T2xEZXBORk5qdU5jbUpDejR0YWI1MHVCRm5R?=
 =?utf-8?B?SXpaTlg1M0lpY2dHUHBIRktNa3NMQnl4dzhyYll1N3BuTnFZeG5UbHhNWnU5?=
 =?utf-8?B?eEJZZDN1TTluVGhNbWpPTDRsL3NHZWptaXIwVDlPQTZWMENZeDNyY2t2ODlw?=
 =?utf-8?B?YmJwajRXQVNieEFnWUtLdmFBdUZ5aUZCZUtHZ3lTbWxZVnJod1Mxc3VsdEtX?=
 =?utf-8?B?K0ZJS2NaRHBFRGJSVFpRR1lUc2VWMkF5bG01ZVBjNXh5bFRPWVZsc09ENy96?=
 =?utf-8?B?NUNybVhXTkY2MXlFMmhQbjMxKzJxc2pFa214TGhPbGljVzlhV0xDbHpVdmtT?=
 =?utf-8?B?dEtiSmN1MnZTSkYya2VLU0VQQW8zemJ6QVE0dk53TFNxNzhCZHQ0TUIzK1NV?=
 =?utf-8?B?VmF3bzZldEdZUHB4VGEzRWRmRTJDMytGK0FwaFRzTkptRHkvWnVYcFBiK1Ez?=
 =?utf-8?B?UnJ1Z0RpQVhURWtNcWpDSlg1bWZKb3RSbmg3dFBkNHRJSjdvak5IUElSbyts?=
 =?utf-8?B?a0pEUEx1bnNQc3FORWRJdmM0cjlkREttMTZKRE05N3VZTzVKRWdJb0NydS9q?=
 =?utf-8?B?QVJvdFI1SW9keXlkYXNTWTNOT3hoa0s0VGgxdnZpZlc4cEt3c2dLSGhJSXk1?=
 =?utf-8?B?SXV5VSt5cDBOM1l1UGhKVlFYT3hRSnAwaWpvQzk2OUJNK0liM2NSN2EzYnFr?=
 =?utf-8?B?ZEQrUHpRblkyZE1OMDFsUjlWb2VKbWhOOHNIQ2pEd3NKSGRYWFpmczJrU3FS?=
 =?utf-8?B?eFNSWXN3WkVNZGxoN2Fjc3FRSzQrODAyS1NEb2x6NStQVHNwZDJvOTVRWk1C?=
 =?utf-8?B?ZUdkeTc5ZER6eElhRlU2WVV1SXEvcUNTRzFRMGNSMVRYdFQ2Q2N4bHZzYlJi?=
 =?utf-8?B?ODBWdno1WGdkQndxS2hzeGxYTTdBL080dTJsWnd3dWExbmNlTlZ4OWhVb1dm?=
 =?utf-8?B?Q2NzN0loaHdvRU9HMXVJR3VQMU8vSFFnRk5sMkZZZjYyb0ZiV2VxRzVKTUp3?=
 =?utf-8?B?N3l1WFRTc0lUbDhSUG0xQmQwVlZyMFBEZ0NBcktmbmtPUnd1MXd1UE1jb2R6?=
 =?utf-8?B?ak5LWjhaNVlpOXRuYWp4U0dSZmlmaDVRaFJqNW8xVWE5amo4aGVVQTdEV3lG?=
 =?utf-8?B?TWZnMHNUTUVkOGRLQkI0SU9MZ0x3bXZoL2p4OXhqNy9Ca0xXanIxSEJtNy9K?=
 =?utf-8?B?VTFMdkZNWGt3dWF0WWx1N052bVp2NFY4TUIyNEo4WDRYeUFPYzVXYjY1ckw1?=
 =?utf-8?B?bEhEQ0M5NWVPa1lXOGRtd2F2L1JjSWliVHlSSDBpakFnQzRheHNpTDdOaDF4?=
 =?utf-8?B?bTN3WWVIL0hqdTZqSlMwbng5VVJTLzl2ZEJRK2U5TVUvYnh0VWZOUXdrU204?=
 =?utf-8?B?TDNUemZ2ZG5iOGlLQjZQNzB4U1RTNXdmK281R1BCek9uZEVkTDhiQ0szQ2Vk?=
 =?utf-8?B?YWV2UkNPT1N4dHMwVFJvTnVOS0pOTTkrUE9XeGZxV0U2ckVLMExQaVl2Zm9W?=
 =?utf-8?B?b1ZxWlN3RlBwblh3aWdZUTh1OUpjWjRxK05VOSsyM240QXZqYkpsT1l2bXN4?=
 =?utf-8?B?Zy8rd096MkJ1RkQwSGg2SE40T2xQNFEyVE1GMkgzZHFZTVdPci9BTkNZWkRO?=
 =?utf-8?B?cXgxa2xnei9mWkd2Sm0zT3NCNEtHMXZiVjN2UVBMdDdpcDVCOTY2QmNocWxY?=
 =?utf-8?B?ZzRyakJycndMOGhXV3JxRUFDSFQxSlBoYlN4ekY4ZmdtYWtGaDRHdDdjSzRu?=
 =?utf-8?B?SjF5UzdVanlKN3ArRVVsK0VrbnA3dW4vbnRGOHRLZmkrUk5NTUNiTTFTY3Zl?=
 =?utf-8?B?UDAwdTBORGJjKzFVYko5dERQL05oVFgya0FxZlhVY1Z6QnFyYzhPU2VqVjFN?=
 =?utf-8?Q?pcfLZJplPx5R+nM/jl6GH+vWl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6fbfbca-aaf2-45a5-afa1-08db0513b555
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 11:50:40.9428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWN17cggRfpWcM+koCFUHryNEb3TqFuxQeCoLd3cZPpXd2gD61ADN0CxR5B2C8ha7D3ksxyR0F7y/00QGNOBQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8479

On 01.02.2023 23:11, Julien Grall wrote:
> On 01/02/2023 17:40, Oleksii wrote:
>> I wrote the following macros and they have been compiled without any
>> errors:
>>                          .....
>> #define _ASM_BUGFRAME_TEXT(second_frame)                       \
>>      ".Lbug%=: ebreak\n"                                        \
>>      ".pushsection .bug_frames.%c[bf_type], \"a\", @progbits\n" \
>>      ".p2align 2\n"                                             \
>>      ".Lfrm%=:\n"                                               \
>>      ".long (.Lfrm%=)\n"                                        \
>>      ".long (0x55555555)\n"                                     \
>>      ".long (.Lbug%=)\n"                                        \
>>      ".long (0x55555555)\n"                                     \
>>      ".long %c[bf_line_hi]\n"                                   \
>>      ".long (0x55555555)\n"                                     \
>>      ".long %[bf_line_hi]\n"                                    \
>>      ".long (0x55555555)\n"                                     \
>>      ".long %[bf_line_lo]\n"                                    \
>>      ".long (0x55555555)\n"                                     \
>>      ".long %[bf_ptr]\n"                                        \
>>      ".long (0x55555555)\n"                                     \
>>      ".long (.Lbug%= - .Lfrm%=) + %c[bf_line_hi]\n"             \
>>      ".popsection\n"                                            \
>>
>> #define _ASM_BUGFRAME_INFO(type, line, ptr, msg)               \
>>      [bf_type]    "i" (type),                                   \
>>      [bf_ptr]     "i" (ptr),                                    \
>>      [bf_msg]     "i" (msg),                                    \
>>      [bf_line_lo] "i" ((line & ((1 << BUG_LINE_LO_WIDTH) - 1))  \
>>                        << BUG_DISP_WIDTH),                      \
>>      [bf_line_hi] "i" (((line) >> BUG_LINE_LO_WIDTH) << BUG_DISP_WIDTH)
>>
>> #define BUG_FRAME(type, line, ptr, second_frame, msg) do {     \
>>      __asm__ __volatile__ ( _ASM_BUGFRAME_TEXT(second_frame)    \
>>                     :: _ASM_BUGFRAME_INFO(type, line, ptr, msg) ); \
>> } while (0)
>>                            ....
>>
>>
>> But if add ".long %c[bf_ptr]\n" then the following compilation error
>> will occur: [ error: invalid 'asm': invalid use of '%c'. ]
>>
>> If you look at the dissembler of _bug_frames_...
>>                                 ......
>>      80201010:   1010                    addi    a2,sp,32   # .Lfrm%=
>>      80201012:   8020                    .2byte  0x8020
>>      80201014:   5555                    li      a0,-11
>>      80201016:   5555                    li      a0,-11
>>      80201018:   3022                    .2byte  0x3022  # .Lbug%=
>>      8020101a:   8020                    .2byte  0x8020
>>      8020101c:   5555                    li      a0,-11
>>      8020101e:   5555                    li      a0,-11
>>      80201020:   0000                    unimp          # %c[bf_line_hi]
>>      80201022:   0000                    unimp
>>      80201024:   5555                    li      a0,-11
>>      80201026:   5555                    li      a0,-11
>>      80201028:   0000                    unimp           # %[bf_line_hi]
>>      8020102a:   0000                    unimp
>>      8020102c:   5555                    li      a0,-11
>>      8020102e:   5555                    li      a0,-11
>>      80201030:   0000                    unimp           # %[bf_line_lo]
>>      80201032:   1600                    addi    s0,sp,800
>>      80201034:   5555                    li      a0,-11
>>      80201036:   5555                    li      a0,-11
>>      80201038:   10b8                    addi    a4,sp,104   # %[bf_ptr]
>>      8020103a:   8020                    .2byte  0x8020
>>      8020103c:   5555                    li      a0,-11
>>      8020103e:   5555                    li      a0,-11
>>      80201040:   2012                    .2byte  0x2012   # (.Lbug%= -
>> .Lfrm%=) + %c[bf_line_hi]
>>                                 .....
>> ... it looks like the error will be generated if the name in %c[name]
>> isn't equal to 0.
>>
>> Another thing I noticed is that %[name] can be used instead of %c[name]
>> for RISC-V ( i did a quick check and it works) so it is still possible
>> to follow Intel implementation but required a redefinition of
>> _ASM_BUGFRAME_TEXT where %c[...] won't be used. All the rest will be
>> the same as in x86 implementation:
>>                                  .....
>> #define _ASM_BUGFRAME_TEXT(second_frame)                      \
>>      ".Lbug%=: ebreak\n"                                       \
>>      ".pushsection .bug_frames.%[bf_type], \"a\", @progbits\n" \
>>      ".p2align 2\n"                                            \
>>      ".Lfrm%=:\n"                                              \
>>      ".long (.Lbug%= - .Lfrm%=) + %[bf_line_hi]\n"             \
>>      ".long (%[bf_ptr] - .Lfrm%=) + %[bf_line_lo]\n"           \
>>      ".if " #second_frame "\n"                                 \
>>      ".long 0, %[bf_msg] - .Lfrm%=\n"                          \
>>      ".endif\n"                                                \
>>      ".popsection\n"                                           \
>>                                   .....
>>
>> One thing I would like to ask you is why it's better to follow/use x86
>> implementation instead of ARM?
> 
> IMHO, the x86 version is cleaner. But...
> 
>> It seems that "%c[...]" has the best support only for Intel GCC and
>> thereby ARM implementation looks more universal, doesn't it?
> 
> ... you are right, the Arm version is more portable. Although, I do 
> wonder how GCC managed to have a different behavior between architecture 
> as I would have expected %c to be a generic implementation.

While the implementation is common, the condition when 'c' is legitimate
can be customized by arch-specific code. While all code for all of the
four architectures does so, perhaps x86'es goes farther with what it
permits.

Jan

