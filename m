Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7B87E9730
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 09:01:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631358.984615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2RsF-0003oF-2A; Mon, 13 Nov 2023 08:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631358.984615; Mon, 13 Nov 2023 08:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2RsE-0003lT-VA; Mon, 13 Nov 2023 08:00:46 +0000
Received: by outflank-mailman (input) for mailman id 631358;
 Mon, 13 Nov 2023 08:00:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OC0U=G2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2RsD-0003lN-Fy
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 08:00:45 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bed614c4-81fa-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 09:00:44 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8590.eurprd04.prod.outlook.com (2603:10a6:102:219::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.16; Mon, 13 Nov
 2023 08:00:41 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 08:00:41 +0000
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
X-Inumbo-ID: bed614c4-81fa-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6jgKyb7YPE0shmVeaf1n0qOS/YXloKjGSgvHIbtxJWVJoMbZ5Z5q7VxIoTJ+ruQU4TrwQPis+KgBhe0oY1/FDP+UBGlfgV88FC7+eqzgAasr6T875dTZ6MpLs6iBET3lJ63XHqZeWt3dhn5uub750LBqIUf1YcnafPTKEBqtcIlrMe65YkkX71uCoQpqSZOPFh1fmRmuK6o0TgkCyeEHr/BfFl1pxwH/OaYPJlaRO3kpoU3A7XAAiB29b4XnQGmye/JcVl5YhJAvsAfPlbAXp0V33ScHEMr/KUaEdskemrEMuMDQeXUqoE7UKYVXK0z9KqZzBYgJrw37F1nTrXyzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgNqUJK+kOn7pwQRrVNvuhy02zvzw0/fdgVXwQqXjfg=;
 b=eFEvhTgPR6dcgp1HdD8Pwav44E1PG8Cq6VtaTAz+60SZDicZzrlmy0G48JNx+gJUCt6GACoJcRSAmoc0cexDI3zKF124vM92BEDY8rENdCpTrGfY7mNvkO4Obz8AKIaDjS/8+hMtikBare+6Ov+PpnreX6Be62DG6sq92PumUsrGXObjcvoi5wie4DHfSUa8+50W+EFa/Sx0HtIFstplbnGTuEYW59dqh5gRT6sp3YIUzq/sm3MFcoW0SIar46PGfbis16YVTFZ61jVD4X7L0Ed4JnQr4ZTW3A3tCBeR4m4tBOP9kNCFE7jykt+dXhcrV5GHBBacYDuZiSghVlx/1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgNqUJK+kOn7pwQRrVNvuhy02zvzw0/fdgVXwQqXjfg=;
 b=zxdbOldNPyXza0aLVjrWbMTtKxdD6QhXgg3G3j43lehHbVq/B2zMTBhnLl2ykvKBOWIJRlGyr0CcU62zaGz7lGm3VzlZGTUk+Ct0bxO1ltkMnApW/asm5HQARh7sb3q6OojbhrrIVwpWHjBNQfcnBDHTwlxl0wCG6ZsPwUJL42XzhmBFjz3fEGWgBGO2O2eWoWZbeyRIVID09mfckNLInu/Z0gmfTOErEby9llA+i+CFY1Wa+259rckJTx5LRi49UYCUY4P5Cj6CxtY63nwCPDiQ2pPxF4w5r5jmziSlgqrgTvI7CvtnoYuvRBLpsR0yaadi4zN98WeGClTUOOnmwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b020592a-d528-d420-9eb2-7b6e39ea1cad@suse.com>
Date: Mon, 13 Nov 2023 09:00:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Faking the number of CPUs for dom0 with dom0_max_vcpus
Content-Language: en-US
To: Jimmy Lee <jimmylee4930@gmail.com>
References: <CAFyR2DVCuDyufB-EWHTSurQ69Dc7PZ9CQZdN_T-Ym2rjVaRPNw@mail.gmail.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAFyR2DVCuDyufB-EWHTSurQ69Dc7PZ9CQZdN_T-Ym2rjVaRPNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8590:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a105740-e93a-434e-596a-08dbe41ea16c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zY3/AQwhHl/PI4xmfQx9mHkHtfpvkgpeGlMzw02twOgSmh7U4ZzJI2UqEoO4pSGtM7v1L25YzrJ1vYgNdPPttMQ+P9Nrw/uTgSBat3sOpZPsDQ85nWF4GmsVlE8Q89ZzD6DsaS2ofNk46tkFTgOqeEfY2jHeg9Sdqq7nlHG/XZocM91M4f1Rpt291S2jxTsOkN8Lyu5SE0wMNBVvy0bkb5XuM0mkE1t+THKxPcR7YNlQpE94/5ZEGjVQ62tFU+72Qop3cscKeCoABmT9x3XRweQ30+ovoknu8PYEHWm0Y40BGUzfMxVxHAhxloU0++m0/hw/ZV7agTVQeWmuZ3vzgNcIue8iBfD3bN/y1SHGJLGUcNwTJZksnkSyPNbEKQGlLZHMk8L2fBXDVVD/biRs3ySUsWdy368LbEjmzoVBcgu7QuqoZ1+fMRojdx1kxxxRsaNGg2BuMq5Jb8u2iYyd0WmYC/NNPnAoUWyDAKGm2tRCg+vUWUeznqCwuPnXJN8AkI06CWNTexvKfE6EPx7pUwczeE/YzOwxd1D1Z4XIpHNp6rB62nmdhGS+SKANFU/P/A+tnvRqptHdtVUC+Oc+VoIK5aKcRjG9rYDXMrND2e0pGn9S7B3QF0sCRMw95VnzzKfciBvAJ9YB847iC/TB2Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(366004)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(4326008)(8936002)(8676002)(38100700002)(66946007)(6506007)(53546011)(66556008)(66476007)(478600001)(6486002)(26005)(83380400001)(6512007)(6916009)(316002)(2616005)(36756003)(41300700001)(5660300002)(86362001)(2906002)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cE5SckNSTWtTbFprUkxBNjBycWpCaEcxR2FiSUh1eW01cEkzb0hYTkc2Tkdl?=
 =?utf-8?B?aXNTSklVb09WK0ZaZ1YwbExSa0owZXJYUVpTLzFudWs0MXBNYVB5Yjk2dzBJ?=
 =?utf-8?B?bks1cm1aWjBQRlpHQ1pkZXJUcnZ6ZXR1ODgxd2tyYTd2M2ZZVmUvZUV4cHcv?=
 =?utf-8?B?c1pBVWN1cEFqU3hmYUFhRUxWcDBtVmlBd2xZMm1YS0l3Q0RPenVkNHhmd2FW?=
 =?utf-8?B?NGNrL0VkSHlFdFRTbnJGeHBRZmhBL29lbmJPTFRGOXQrWGx1ZVVHZ3BjVDlV?=
 =?utf-8?B?MitKWElUMU5HZXRjUVBhR29LSldYR2ozRXg4RkhVbFJ2VzduT01XQ1hlazdl?=
 =?utf-8?B?MXN4OTBtRjZ1Und4LzIwQmk1d3VNQWJTbXFtNTM5bG5yNEtlMk9xalFvVENn?=
 =?utf-8?B?TlJ5Tk9ZaFZ4MFNBY0FHeHI5dVBROE01RWg2T1V2eWJpRUwvY1NRc0NYZjdn?=
 =?utf-8?B?TDlWcjZCckNKQndpQkZ2bmQxSUZ0dUJGR2U4dXpMejJxT1ZKeEpnVDc5WmRE?=
 =?utf-8?B?Z2lzSm9JalRhbm9xd1ozQUZWOU92U011S0FaTk5YV0ZMUysrUjg0ZHk5WUF6?=
 =?utf-8?B?bysveUI0ZURYd1E3UjBQckhob2R6cGQ5RWFqeTNtbnNuaGNzdkQ4MWpVOTRu?=
 =?utf-8?B?MDBFVldlWkFDdFVpTnJhdk9hRW8vTEg0NFNGaDZSQWF1N2M1SVgzeURVQXpM?=
 =?utf-8?B?QVFVM3ZKYkVkeUlVV2NLNno0UWw1SVYxRnJhSE5MalNLeWwwdEgxQ3pBaTdU?=
 =?utf-8?B?SUhmUERhSkFDL1RURm4wa0xSUW1rQ0x3Nk8yY2RtNTZQaXFEL1hNRXVDeHZQ?=
 =?utf-8?B?S1BoakI5WEFydnEwRXdvRnhOemNuZGQrRllqdUtVT1dPbmluREQ3NlpWL3Fa?=
 =?utf-8?B?N1RyMUtWMlRZVDgzYzNkMk9EVVV2MzdhUnZjdFRLWjdOYVlYTTA1azBOM2N0?=
 =?utf-8?B?TnlWaVM3Z0hYZlRGOWkzZWdjU3FrL0Q4ZWsxUFpmQzMyNFVud2xYRUJIdlBS?=
 =?utf-8?B?NGR5MW5OemtYWmR2eXZ2R0d6NHAraGhHd1pRREpEeDdXbHBlbk9GZGxkdWFv?=
 =?utf-8?B?aU92UnlMc0dNSzlqK0l3a2tMTkFVV3kxY3VuVXU0Sk5Mb3FIWlFmdUhnS1BE?=
 =?utf-8?B?OTBiWUxXMXNXOXI0VGNtdGdGbFZtcEJ3dWc5K2dBckw5RGZKNk5EREF3SWdM?=
 =?utf-8?B?N0EyQ2RkTmMrc0JwN0c3WjM5cTM4YTNLendjdUZkc1pvK0I4YTFrc2RDUEhH?=
 =?utf-8?B?OWthOXdVUXo4eUpNVzhlMXZFY3V5NW5DQVBoYUk1MGFwMmgvWVVVT00vMmNi?=
 =?utf-8?B?ZXZUUWdKd3Y5dTF2cmNpL2pnUjNVTVBGcHk4cStrbXRaem1zTi82TGtTL3RF?=
 =?utf-8?B?c21TT2VNcFYwLzF2VVZaREpwQysrazR3S3pNN0hrQlpvc0E1WGZtVEtId08w?=
 =?utf-8?B?SGtaM1ZWcTNSWi9IZUtEdkFjL2l0VjlUbExUZ2t5MDEyU0E4a3I2bHo1c0Rt?=
 =?utf-8?B?bjlCOEJZdGdOS29aT0dPeUczaHdldTFVUXZncWpNbXI1Smo1ZUdaSENSM3lX?=
 =?utf-8?B?UzJWdmlaVVkrbis4ZllBamU2NFAvcUtEeVNmZURBQzRyTEIwUGYybGZCa2JL?=
 =?utf-8?B?aC9SWHVkaEZPcldlR3NtZTJtUWhLZkh6K1pIVEtkS1pFa1dRN3pIVDVycDV1?=
 =?utf-8?B?VDN6eldEaE04VEZaaFZkcnh4ajhDdHEwMk1jNk5FUnFZRG1janNyR2dWQWFN?=
 =?utf-8?B?ZmFUaThzL2hnSkcxYkxIQjJVd2JKTC8vekt0ME56WGpEZ1FyNjcvRFZLSDRF?=
 =?utf-8?B?VXRzSTJCelh1bUlZaWlSR09HTWRIL2lIVU02RVRTSHV2bUozVnFNdENnYzZo?=
 =?utf-8?B?a1R0TmxCL3hQN2tBSTVLV1dNVURxTm5SaHRyRHZKaXFTUVczajArWE11WXEy?=
 =?utf-8?B?Z0w4dFRaREJKcXZDVDBuQnRZbVlxbXN6TjZkNDBHaWhFN2tqT0RDS0tRMGdp?=
 =?utf-8?B?MmRQSlEzb2RlaFZFOWNKOExTMkVsRmI1bFcyTXY3d2RXdXJHVUd5dkY5M1pS?=
 =?utf-8?B?bTlib2tKTkduSWRFOUJmUUhkcFVvb252alpsMDRMYlo1eDVZekI2MFM4Q2Jj?=
 =?utf-8?Q?T4fffObUrqCPy8Iz8ByAAopM2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a105740-e93a-434e-596a-08dbe41ea16c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 08:00:41.3014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/aDEnFcU90URLd8ZgZyGOQqPIfgx0w0y8EGbAzJSq+7rn8ywD+Uhdbw+T+Xt9fVN0lbiO17sfetml1ysHJFlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8590

On 12.11.2023 21:28, Jimmy Lee wrote:
> Hello Xen experts, I am trying to set dom0_max_vcpus to a number that is
> larger than the number of pcpus. For example, I have a 4-CPU machine but I
> want applications in dom0 to have an illusion that they are running on a
> 64-cpu machine. However, it seems that dom0 will always recognize the
> number of pcpus. I can see the vcpus in the output of "xl vcpu-list" but
> most of them are not online. How can I achieve my goal? Thanks!

Even if I was to assume the Dom0 kernel is Linux, it would still remain
unclear what Linux version you use. Generally with recent Linux kernels
this has been working for me (albeit I didn't try in a while, after
putting together what has become e25a8d959992 ["x86/Xen: streamline (and
fix) PV CPU enumeration"]). If despite having this in your Linux you
still don't see this working, you will want to supply applicable logs.

As an aside - 64 vCPU-s on a 4-pCPU system looks excessive to me.

Jan

> [root@ip-10-0-131-61 cpu3]# xl vcpu-list
>> Name                                ID  VCPU   CPU State   Time(s)
>> Affinity (Hard / Soft)
>> Domain-0                             0     0    0   r--      15.9  all /
>> all
>> Domain-0                             0     1    3   -b-      11.9  all /
>> all
>> Domain-0                             0     2    1   -b-      11.2  all /
>> all
>> Domain-0                             0     3    2   -b-      12.4  all /
>> all
>> Domain-0                             0     4    -   --p       0.0  all /
>> all
>> Domain-0                             0     5    -   --p       0.0  all /
>> all
>> Domain-0                             0     6    -   --p       0.0  all /
>> all
>> Domain-0                             0     7    -   --p       0.0  all /
>> all
>> Domain-0                             0     8    -   --p       0.0  all /
>> all
>> ....
>>
> 
> [root@ip-10-0-131-61 cpu3]# lscpu
> Architecture:          x86_64
> CPU op-mode(s):        32-bit, 64-bit
> Byte Order:            Little Endian
> CPU(s):                4
> On-line CPU(s) list:   0-3
> Thread(s) per core:    4
> Core(s) per socket:    1
> Socket(s):             1
> NUMA node(s):          1
> ...
> 
> [root@ip-10-0-131-61 cpu3]# xl info
> ...
> xen_commandline        : placeholder dom0_mem=3%,min:2G,max:4G
> com1=115200,8n1 console=com1,tty,vga dom0_max_vcpus=64 spec-ctrl=no
> sched=credit vcpu_migration_delay=1000 allowsuperpage ioapic_ack=new
> ...
> 


