Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A3E58112B
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 12:30:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375127.607434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGHp2-0003Ji-TL; Tue, 26 Jul 2022 10:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375127.607434; Tue, 26 Jul 2022 10:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGHp2-0003Gd-Px; Tue, 26 Jul 2022 10:29:52 +0000
Received: by outflank-mailman (input) for mailman id 375127;
 Tue, 26 Jul 2022 10:29:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGHp0-0003GX-R1
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 10:29:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60074.outbound.protection.outlook.com [40.107.6.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfd39807-0ccd-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 12:29:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR04MB3222.eurprd04.prod.outlook.com (2603:10a6:6:6::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.24; Tue, 26 Jul 2022 10:29:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Tue, 26 Jul 2022
 10:29:45 +0000
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
X-Inumbo-ID: dfd39807-0ccd-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kc6kvMyfxHwEf9wB40gGX+fFzqV2l4FIiMfONskT8uQ/s+V4OGuZYxw40a3itSUMjVcRIFkaIm8a7MWVgSMNIjIbE6AAJ3mG48FX/fKZI4SRW3MZGTy9/ig/7sAuqsqDJ3hhldBKOhUg9+8cMibyPr12TJH9JpGcR38N9B6hSq7KZyNejuwL7N7W+uAqTUzk/Zf2Czmnv3Yg2MSH4aadAtZsc7aoaNZzPBPdbuDvZSLwyZo/pwobEsC8gDelHEvRWA9QYS/4/0r7z8wBGqt37c2EBzuVLhpIzPmFfqe6EnOlsJh20r41I7IzPcO+6ZPy0BkGfMR/gQoHSsluGdZG/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49ZnBPgO9dXMGmbO6aviSQ5MQWRp+CWRettBFSUT1kY=;
 b=J4gr54AfkCK0IEvLn+7gyQPjt8+i8vNPMLDOxUqDYCtDGj/P0q3kMuCBbOERnB95H5zL+FAcA51FOexxsGq/VNZeWVrKxjSoNnEKfr0l7DYDfe27TsupZGcg+8HZ6fYN2KgyDT4iVCHHcsPtN+HD06pLk505eHS7t5eSkUicsC839xyJ4fbtPDsa1F19x+Cy3tCMu3c0bREpzLfdB9ZTy3g6Z9VjfAYLJ6Ws/OzmJ4yYMDzb/RJx2JquukmANcxgGlahWGT+gtvkDTfsm84CzGAC4mTSCMhHyTa9ot2yiLVryLvbONJpVH/fLZCEXP+7AK3M0gnbfgR5qpz4AqsQUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49ZnBPgO9dXMGmbO6aviSQ5MQWRp+CWRettBFSUT1kY=;
 b=y0Uku5OvRgxpQpzsl+L3EWNgtIzO0xG6n/8xb+xqr/5DezEBXv9EjRd4D3L/6EEpFATYNQeuzEgqPNPKegVlGjA0wnBSSN44P9gCWgi2j+BvIjPk0IgDVaJPByDVQq8hkKMukA/KGhAxtqBhsfBQoI4s4VlVICZ5Pj4ak3D/pgmW2/e+6zLvfV7a5KJ0BJTgiv80Y4/gmD+Blbn7GHSCbRMGHdawETxb4Rl1nxjz9b/P/yGYqnwn1P+uXzuq8hshfHKuqOr8q6hNJNJ4nphn1cQXe+5j+V+ttLaVN7nwU0uifv5qD6znLHUkp7h17DupX96tG0P9Fjbc2BLlBp1qiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <194eaccc-b05f-c1f2-d861-737f3a881966@suse.com>
Date: Tue, 26 Jul 2022 12:29:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Random crash during guest start on x86
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <65C0A220-EC7E-4915-AC45-77D87F4E411E@arm.com>
 <7d816c9d-412a-bcee-f1ab-3b4b46051b8a@suse.com>
 <880625A9-C3C8-4D45-A4E8-BB443E9D4CEF@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <880625A9-C3C8-4D45-A4E8-BB443E9D4CEF@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0747.eurprd06.prod.outlook.com
 (2603:10a6:20b:487::27) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7732877-06ae-438a-f1f3-08da6ef1c215
X-MS-TrafficTypeDiagnostic: DB6PR04MB3222:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jb+O/36WtRqSXiXmam9ci/yZsjXYND/fMXKMhADfuuPSucD4Vgm7PJvpnOxCwuU+FKgUSV6/fgwJBZ3RlGCfSk6QSVJcZQfiRLerAYvEPx5gutZz5jyMoWlX4oebuZ9OigwF0ZxZq5JIEjIyxLSHTtUunplBZ6V+arOAw1bIsVES2/F6Hut+BNUNYY1e0Cjq5TSyQb4zZf3tzFWba1kdZpfC6DE4nx3QElajtp/2cRo57f9W8yg+KkqGmoZUEWMxkbDAWhXplmpmzIFd3x1iMNTT3ZEzyjiJY6iEWxQQhZgsviri1E13P7hepsBNrDHEPUTz3vy3bCSp1soLdF/ynDS+qlbnKQxqCWhXHE4PIkobRIDj8thjyTUfJAp8/cZ858wSbySADHXI6aQqeggpv20ue5XGD8nkoZhqeBHtXMusutBGP47GMB5tN+JgJONoa5xDwmB9e0AtPQVWD0YTycyivctdrHfI3ikshUFYaRz7a6EgY2fOCer2WeDWw9i16mNjAdRPdh+Z/yXycqaZGL2S7NpsmCnRc+eqRJyqDdsguLn2TGzRKCMsTU2tsYyx2Tl0hB5JlZgcez7D30dAfPKvqAKe5hAbQmJi6ia5nng8F4nYF1vMd/pn66ZqZCLrXLK8FtYkQtK5aU3nnNmwLbtTChNXQOAnSuMbsNFhuontJpG82ZTm7tGyHCJ/D3iLTc0cZMrIUY9+hueAhOuZ3HKDL4Lduec3iRcT0P3422hQ0Xi8aRlBFs6c+Z/hB42eGsNAvdupqQdpnqRggKJ3N6A7L0eafAMjUIxL559r02ECHrCAmuUvMYMbrNj8G1Jfqxd0YhZt3iVgT/6cyefRwA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(136003)(396003)(346002)(376002)(38100700002)(478600001)(186003)(66946007)(4326008)(8676002)(31686004)(6916009)(316002)(66556008)(36756003)(66476007)(54906003)(6486002)(6506007)(31696002)(2906002)(41300700001)(86362001)(6512007)(26005)(8936002)(2616005)(5660300002)(83380400001)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1E5NEJHR0RoK0VoNkdlQjBVUjJlK2cyVVBObjRyUGFUYWxrVjd1TzJUTXFL?=
 =?utf-8?B?QXlxVStpQzFjMTlFdmZVc2M1bDQ1MjYycVhpU0NDR3dobXlHN1NJakUzWXRu?=
 =?utf-8?B?TFVmemsyMjJScUFMYXc3V2hoT0tybzJONXZmZVU2QmgzNnp4blJadjBjUWlL?=
 =?utf-8?B?T04wVkVpWm1meWtUMXJ3WDRXRCtjbUs0QnZwSmdsZkdia05aaXFUV2VMSnhS?=
 =?utf-8?B?em53RGQ3d2p3MXZKZzFxN2dqWTN4U0lUTWlCMXFTc09lMzQ3R2doQXpOTW9E?=
 =?utf-8?B?L2VmUWtRc3Y3NlYvRGlrTEJkbHJzMUhOeHpNaFRoKzRWa0ppUDZiVXZIV3d1?=
 =?utf-8?B?Qy9HWXFaS2xRL0ZSRlpub0pIQ0I0ODlmUXdvUnFySkJ2UjYyTTNPZUkyZGd5?=
 =?utf-8?B?eDdqNlZsWW5ITkJ0b0RHaEZ4a0dYZ2o3Tmc1Qi9ETGtJbHBQUUNsOURabkZD?=
 =?utf-8?B?Ym5DZmVxKzJoWk9LZ2hoUjJNNjhaM3pUaXRxZUNCNmxMSzAvcG1NeFNiVUlM?=
 =?utf-8?B?N3pvazRhK3hzMzRmYTluazgxMlpPcUVDT1p6WXlhTHZCZWtLUVFjeXcvc2Ja?=
 =?utf-8?B?bHAvZUI1ckNYTVAwSlk5NVdCQVRWTlZjRVgyc3h5UkdQMmhYNFhKcDNMQXl0?=
 =?utf-8?B?Yk1pVGcveC8vanpObkVXVWtpNFhJeUQ2clJyMFdDeTRtRDkxeTNqS3FEYi9L?=
 =?utf-8?B?a0JPK3VMeE9GaWlJbmZKZnFEamh4YWxYeDNmb3JWVnJRQXJjN2RMRU42K1ZT?=
 =?utf-8?B?UVppSVZsWXZyMXdiMUhGdjRTTWVkTHdMaEJYNlN0MTZLc0gvb0I5SHRPbXVM?=
 =?utf-8?B?MXByclhpU0JZblk1UU9lenRYeEwwU1VhM1l3OTJMd3BraCtkdWlTR0U1Tnhw?=
 =?utf-8?B?MVJnOFJYNjkwWEtObTc4WVRzK2lCczZiU0dEZ2dQTFlUdDVLL3d5bTBSVFNS?=
 =?utf-8?B?TXhJRHhReUl1ZTBoTHFaRHlKb2Z0QjVTMkpRUjRkcUtScTdQWUN6eVdDVDI4?=
 =?utf-8?B?cjYzK2R6R2xGTkErWG16VVBwemczUEtURUhMVndkS0MzZHk4Wjh6OUw1S20x?=
 =?utf-8?B?ZUgveU9EeEh4SWc0S09oVlM1UGVuVEZHQ0NhVlFYbTBPeVFXRDFZQVpmaEsr?=
 =?utf-8?B?SGZ0aEM5Y0FDWVVnMm1YVWRuK053cEJVTTdNeXY2QVBEMjhyRy9xeEJOTDh3?=
 =?utf-8?B?YTk4c1ppQ3VKaDdvM0VFT2FPTkJkNXRYc092ZmdUd3c0YU9DdEpQSUxsYmhn?=
 =?utf-8?B?T0FGamlMMFFCSlRINFZhS04ybmdseGdwWW5vWUNCUWtsbXhFYzlaK2kvVy96?=
 =?utf-8?B?amRqelRmQW5NTXhtcUd5ZDRvUXk2MzlLYlBhTWZHL1hRNllvUlFkVFJlNGNK?=
 =?utf-8?B?cGlzQTVuQUExYWF2bVBEL2plcEdMQ1phRVBYc1V6QWJSbGVrbnRnTEtON3ZJ?=
 =?utf-8?B?Uy84UjBqRHJRWnZmelhpVG9BbVliM1Q1dVNNVloxbWFlQlNlNzdmNVlIbE8x?=
 =?utf-8?B?Z2ZZVlV6OTlaY1VCQ0k1SVNlUWNWbjFtQ2xrYlFPSlZlSFhOOHE5Nkt6UmV5?=
 =?utf-8?B?ZERWV0JMMTJTOTdDdWFyTTN1N1Z2QWxKYlJmQUprMDlHVkM2Q0xsOTYrTEdJ?=
 =?utf-8?B?S1pmOG1pV2EyYUI5dDhUTWlBZFpvbTdFbjZGSk9HOXlxemdZaG5GRFYwUys1?=
 =?utf-8?B?c29FZ2VDMlZoR3ZzckNiS0NkRlBBMkdrdXV6bkpXT05IK3hMcmhrTnRYNm92?=
 =?utf-8?B?RW1NVjhjRlpKakpSZHMzcVQ4bDBuSEMrVzQvZkc3RDNvL0FlbG0yOEg0QmVz?=
 =?utf-8?B?Q2ltUzFrZGIrZ0dHd2E0VWc2YmZUbGVWWGx1bEFqdzhvVG42UzlidEtzeFVN?=
 =?utf-8?B?Tjd3NEU1OHFaOGZ0K251eHNlL0Fad083SkVtK20vTTlDbVVkR2FXd2V1V3d2?=
 =?utf-8?B?T3E2cElkb2xvb251NlJaZjk5V3BkWFBDZGVtRi9mWUlYSm9ERVFHQ1RpTkxX?=
 =?utf-8?B?V3R4RUFzTmF0eXpTMnEyangxYUUxWmFSWmJXTmRnYW9zV2xEOC9JZU1BNEc3?=
 =?utf-8?B?dHltQ2k5NmRrZzcrU0U4aGRnZmc0TWtEN2Y3NllWZmE4U2lpTVU5Z2tMV0VP?=
 =?utf-8?Q?B6gKRgxDpp8MKPWqTcB/98oeD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7732877-06ae-438a-f1f3-08da6ef1c215
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 10:29:45.0456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQzqwIK+9dciBfLkkCF7F98Q6ImejRcxgof8kEazQYxBvFFDdtg/DipmDtI2+NLmysEp2KtoVxBWJ+srC+Irbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3222

On 26.07.2022 09:51, Bertrand Marquis wrote:
> 
> 
>> On 25 Jul 2022, at 17:16, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 25.07.2022 17:51, Bertrand Marquis wrote:
>>> On our CI we have randomly a crash during guest boot on x86.
>>
>> Afaict of a PV guest.
>>
>>> We are running on qemu x86_64 using Xen staging.
>>
>> Which may introduce unusual timing. An issue never hit on actual hardware
>> _may_ (but doesn't have to be) one in qemu itself.
>>
>>> The crash is happening randomly (something like 1 out of 20 times).
>>>
>>> This is always happening on the first guest we start, we never got it after first guest was successfully started.
>>>
>>> Please tell me if you need any other info.
>>>
>>> Here is the guest kernel log:
>>> [...]
>>> [ 6.679020] general protection fault, maybe for address 0x8800: 0000 [#1] PREEMPT SMP NOPTI
>>> [ 6.679020] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.17.6 #1
>>> [ 6.679020] RIP: e030:error_entry+0xaf/0xe0
>>> [ 6.679020] Code: 29 89 c8 48 39 84 24 88 00 00 00 74 15 48 81 bc 24 88 00 00 00 63 10 e0 81 75 03 0f 01 f8 90 90 90 c3 48 89 8c 24 88 00 00 00 <0f> 01 f8 90 90 90 eb 11 0f 20 d8 90 90 90 90 90 48 25 ff e7 ff ff
>>
>> This is SWAPGS, which supposedly a PV guest should never hit. Data further
>> down suggests the kernel is still in the process of patching alternatives,
>> which may be the reason for the insn to still be there (being at a point
>> where exceptions are still unexpected).
> 
> So the exception path is using alternative code ? Sounds logic with the error output.
> But does explain the original error.

SWAPGS sits pretty early on all kernel entry paths. If any instance of it
is subject to alternatives patching, then prior to patching such paths
may not be taken when running as PV guest under Xen.

>>> [ 6.679020] RSP: e02b:ffffffff82803a90 EFLAGS: 00000046
>>> [ 6.679020] RAX: 0000000000008800 RBX: 0000000000000000 RCX: ffffffff81e00fa7
>>> [ 6.679020] RDX: 0000000000000000 RSI: ffffffff81e009f8 RDI: 00000000000000eb
>>> [ 6.679020] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
>>> [ 6.679020] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
>>> [ 6.679020] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>>> [ 6.679020] FS: 0000000000000000(0000) GS:ffff88801f200000(0000) knlGS:0000000000000000
>>> [ 6.679020] CS: 10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [ 6.679020] CR2: 0000000000000000 CR3: 000000000280c000 CR4: 0000000000050660
>>> [ 6.679020] Call Trace:
>>> [ 6.679020] <TASK>
>>> [ 6.679020] RIP: e030:native_irq_return_iret+0x0/0x2
>>> [ 6.679020] Code: 41 5d 41 5c 5d 5b 41 5b 41 5a 41 59 41 58 58 59 5a 5e 5f 48 83 c4 08 eb 0a 0f 1f 00 90 66 0f 1f 44 00 00 f6 44 24 20 04 75 02 <48> cf 57 0f 01 f8 eb 12 0f 20 df 90 90 90 90 90 48 81 e7 ff e7 ff
>>> [ 6.679020] RSP: e02b:ffffffff82803b48 EFLAGS: 00000046 ORIG_RAX: 000000000000e030
>>> [ 6.679020] RAX: 0000000000008800 RBX: ffffffff82803be0 RCX: ffffffff81e00f95
>>> [ 6.679020] RDX: ffffffff81e00f94 RSI: ffffffff81e00f95 RDI: 00000000000000eb
>>> [ 6.679020] RBP: 00000000000000eb R08: 0000000090001f0f R09: 0000000000000007
>>> [ 6.679020] R10: ffffffff81e00f94 R11: ffffffff8285a6c0 R12: 0000000000000000
>>> [ 6.679020] R13: ffffffff81e00f94 R14: 0000000000000006 R15: 0000000000000006
>>> [ 6.679020] ? asm_exc_general_protection+0x8/0x30
>>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1b/0x27
>>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1b/0x27
>>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1c/0x27
>>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1b/0x27
>>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1c/0x27
>>> [ 6.679020] RIP: e030:insn_get_opcode.part.0+0xab/0x180
>>> [ 6.679020] Code: 00 00 8b 43 4c a9 c0 07 08 00 0f 84 bf 00 00 00 c6 43 1c 01 31 c0 5b 5d c3 83 e2 03 be 01 00 00 00 eb b7 89 ef e8 65 e4 ff ff <89> 43 4c a8 30 75 21 e9 8e 00 00 00 0f b6 7b 03 40 84 ff 75 73 8b
>>> [ 6.679020] RSP: e02b:ffffffff82803b70 EFLAGS: 00000246
>>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1b/0x27
>>> [ 6.679020] insn_get_modrm+0x6c/0x120
>>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1b/0x27
>>> [ 6.679020] insn_get_sib+0x40/0x80
>>> [ 6.679020] insn_get_displacement+0x82/0x100
>>> [ 6.679020] insn_decode+0xf8/0x100
>>> [ 6.679020] optimize_nops+0x60/0x1e0
>>> [ 6.679020] ? rcu_nmi_exit+0x2b/0x140
>>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1b/0x27
>>> [ 6.679020] ? native_iret+0x3/0x7
>>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1c/0x27
>>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1b/0x27
>>> [ 6.679020] apply_alternatives+0x165/0x2e0
>>
>> I have to admit that I'm a little lost with these "modern" stack traces,
>> where contexts apparently switch without being clearly annotated. It is
>> looking a little as if a #GP fault was happening somewhere here (hence
>> the asm_exc_general_protection further up), but I cannot work out where
>> (what insn) that would have come from.
>>
>> You may want to add some debugging code to the hypervisor to tell you
>> where exactly that #GP (if there is one in the first place) originates
>> from. With that it may then become a little more clear what's actually
>> going on (and why the behavior is random).
> 
> I will check what I can do there but as the crash is very random and only
> happening during our CI tests, this is not really easy to reproduce.
> If you have any example of code to do the debugging, I could run some
> tests with it.

Well, you want to show_execution_state() on the guest registers in
do_general_protection() or perhaps pv_emulate_privileged_op(), but
only for the first (or first few) #GP for every guest (or else things
likely get too noisy), and presumably also only when the guest is in
kernel mode.

The resulting (guest) stack trace then would need taking apart, with
the guest kernel binary on the side.

>> As a final remark - you've Cc-ed the x86 hypervisor maintainers, but at
>> least from the data which is available so far this is more likely a
>> kernel issue. So kernel folks might be of more help ...
> 
> I wanted to check if this could be a know issue first. The problem is
> happening in the kernel, I agree, but only when it started as a Xen guest
> so I assumed it could be related to Xen.

It is quite likely related to Xen, yes, but then still quite likely
to the Xen-specific parts in the kernel. In the end it all boils
down to where the first (suspected) #GP is coming from.

Jan

