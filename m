Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBB9785A06
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 16:07:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589303.921169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYoW6-0002xq-S7; Wed, 23 Aug 2023 14:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589303.921169; Wed, 23 Aug 2023 14:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYoW6-0002wB-Op; Wed, 23 Aug 2023 14:07:26 +0000
Received: by outflank-mailman (input) for mailman id 589303;
 Wed, 23 Aug 2023 14:07:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iSH1=EI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYoW5-0002w3-JA
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 14:07:25 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe02::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 620d08c5-41be-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 16:07:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7640.eurprd04.prod.outlook.com (2603:10a6:20b:297::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 14:07:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 14:07:22 +0000
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
X-Inumbo-ID: 620d08c5-41be-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWFCFMicWTaFSfMo+LYWlI8JvUCSyhF3FpCENvYXEL80IK5JVCur0yMWbV952GWS/k4JPf/MI/P0XMqzSJyDdNEKR9Zt+q2jIC8zCdrIuqp2ouozgDs7cFajsY/9RTiNhK/f1bXyBwkHmfD36ldoK4KGnbRAI00lpaGKbNGEaa5S5iIflKH0IB+HuPgZC4wSAkl5TtBQq4+dBBiiXTylyYIPVNsuksP4e20OszbL/bcrYo/cg8yiBhJ0NhDLxxr+oUYr5hrjs4YjDy7kX2hYOE10QgBtaFVRxYdgG+qAxCAnByMfXJPYFFfk5MK01OquLSzLdnxE6wG60rVZ9lbPcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BluEsgde5iQVwCaqHqou98H9ocXrZ5rnSh9sqHpwZtM=;
 b=HmWvRMIBbUB4u7FUBXoT1YtD6pmOdQvGMRHpGfaK9eSVIyUKlKYoVbw4xBOhVSLQ4xRwIEHNyVK9TmuJWQX9bYeqr2tRjmVaMzySEjxGsFgAaYjgIaR2B+WIxPTJoz8WcKrs7Q6aHHxEu7eSJXnpQEwAA/7qsj+NokcuCYlOuVBChNTgAoenJu4K1UNG7RAiy/Sagb0cj1IQwzXh0XHYkZdQZQGubs6SKdtbdEa5/LoDQAfWW2y8RGZnTOXUFZCJI1ungobwjmkULTqgo8RS4f/tJimwMqdQSBmhcLcA8lz+HotJWXIR7dJ1ZBZqy23eAcrLm+rYYatP29KQeS0xNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BluEsgde5iQVwCaqHqou98H9ocXrZ5rnSh9sqHpwZtM=;
 b=eHwZYYKHKlstP6Kx1MWBWpTbE7WKECh3iDfWa849aTYRji2wzeJon6Oy8rQUMawE+lLL+XS37OdLUyaMlYFB/moiRr7LFdLUuWASUsHYGfpY7boPSwpAsYtARFecC69BLHj9E3BduiIMD7x+4kPpM7Qm+Mv34JUH1ArS/HPGnIG2h0siP/6WS8btQAZtZEhV5iBajQgyxP7FEm6gnBfqfdkmMeYBO8iCrzfrLt018GMCQLop0DF+eADP8bNhYHF2DT+kndGOm8L+fcwe0rASpE+YHOSRoMSIfEe92PY04Z8jwieit6W+lg4uOb2RR75STCmsNOWtkidvnp9lu7u4Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d6022d27-b38c-f41c-7725-60434691de0c@suse.com>
Date: Wed, 23 Aug 2023 16:07:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] libxc: remove / adjust xc_get_cpufreq_para()'s
 BUILD_BUG_ON()s
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <91bb3d4e-46e6-c210-2610-c4771996adfb@suse.com>
 <CAKf6xpvZ4JBEmp0tL4vQgjbEo2uB-nYp8-_dUoQo26x+sfHtKg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpvZ4JBEmp0tL4vQgjbEo2uB-nYp8-_dUoQo26x+sfHtKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7640:EE_
X-MS-Office365-Filtering-Correlation-Id: 02572f42-7e3f-4c2b-766c-08dba3e2453f
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ly5MblZ0H2L8ZdrNRqBPXaFYE8tS4+O7f+uAamW4/76m2wjppV6XAhYRcFzP+Bz3Uls1XWmJblrygZkpeWn1IJXUTU/v0XQChFg3kO6KFPki58mvjsF6Ucdh1+DITlaDI78wHkJ3Z2q5GNMrt/gBplJNWG0+wjVky/23yqP9+bVD5Jcv7osa5P8u+vMzqt39eq91bmqQs48gzo1pe61paTns0s0RNTjeXX9B7xrDKw8+w50DF/L+xt4U9CrzLA7aepBda/GC760G65Lq/L7b+hYoZVrBzEebIKNlvw9dBIqtsic5QOqP+Xx48NDpG9eLTwE4b1dFUED0kEHEz7ygyWnSuGd+gKjvjSV+5LuiDWIVHRBjmmaPobrsSshloxb1Y6kM9abepIVIS+++nxc0H/pqU9DND4b7lLbQjTWDlOHIgaDwOVIqg+kF0zzGzmALqN/WHNdEhZrxoWNQyusYhWB5ZfwlsFDaCPQkBBMJxr30Sz0tUMezjCHt+NBgwbE+UNVnfLv5Nc4T09sEUKAASqBz/FiCpCaYypnXpXxdmeOGMIXg6LL/kwoAt33mOA+9sCaSnpeNBummGosYKnQpkwE/rxPhiRDYR3AxCuuptbhgirLKpErPXgOCw1jOBQrHrqGeQSjInTRO9usk1vGUgg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(396003)(136003)(39850400004)(1800799009)(186009)(451199024)(83380400001)(36756003)(2906002)(38100700002)(86362001)(31696002)(6512007)(41300700001)(54906003)(66476007)(66556008)(66946007)(6506007)(6486002)(6916009)(316002)(53546011)(2616005)(8936002)(4326008)(8676002)(478600001)(31686004)(26005)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnZta01FWjV2SnNtWTBTSndMQ1ZldngrMzhiaFhyaUxoaFo4SkJkdlY1NW9l?=
 =?utf-8?B?VWV2MkMvKyt2MkJZSG9jOWlWajdwN2VFMEx1Z0VHNHVEWWRsdEcwVTZ2VHdy?=
 =?utf-8?B?dFV3WE5aRHkyekxaeUV2Qi9wUWNLbW1aSGY4SllIalVCWnlUejQ0REk0M0Nh?=
 =?utf-8?B?Z0RSN1RxQkFqN0tlYno4ZjlIVmN0MlUwbm5tb2xvb09JR3VjUWFENTN6Z0lh?=
 =?utf-8?B?b3o0R255OUhRTUM1VkVoeC8yY1cydzAvVjdHMmdJbHFQazRBNk5YV3VJdm1q?=
 =?utf-8?B?czBGSzBQWnZ4b0xPejFxYmp4VnhlT2wzcXg3cVFQM3E4Qzd3SEZYc1BRZ3Fi?=
 =?utf-8?B?OVMvRkFNMnVXRzlRdERHNDBHVCsxalMxenpPOVRhMzdmcUo5cWZ0elZkNVlQ?=
 =?utf-8?B?K2VsK2JpVUdyNnAxNG1SRHpoRk45WEhzZUR6RE8xQ05DMTljYVU3cWhESlFF?=
 =?utf-8?B?MUlnWWp3VHpkc1ZkVlB1T3ZtbzliU0hjUlRiZXBEV2dGSDcrT2piNGlyV1M0?=
 =?utf-8?B?ZGg3KzJmRnd1NGVNVld5bzdPMHJ2bUdxcE1mOWsvdGlaWDBUY0dkc2RFZVBJ?=
 =?utf-8?B?bFpJZjQxT1NtcFhrTUxielhFMDNXZ1l6NW1qTWdzQVFlKzArRXdxTGthYkMr?=
 =?utf-8?B?UTFnRjBBZVVDTFI1QW9HSHVuQlp1RnRmczh3cmt0ZGh6ZS9jMnQ2eDVEZi92?=
 =?utf-8?B?dzZIeGU4cTJVMDkvUnk4WitlVkdHWEFOdTl0SGpwcGNPcWYxSGpNNVExbjF1?=
 =?utf-8?B?R3YrTHRzaWN3UnhIcFNaOFRSZlFGY3h3enBJL2FoV2JXZWxid3ptbjNGV2Q4?=
 =?utf-8?B?TlJHODk4Q0xKRjhXUWo3VUNpZGdBVTI1bWZLUGJjTmJLMC9iUDZ1WXNiakor?=
 =?utf-8?B?RktuSmo5MDZzWGNRc2EvRWN6ZlBRdDhRVnQ0SkxqUzBRLzY0RldsSmdCcUhr?=
 =?utf-8?B?Q2plaTNOTlJYRlY4RVU3eWpGSGo0VnhCWW53MzhDb2ZLN0ZtVkZvUXRGN1Qx?=
 =?utf-8?B?eXhWazIvcWxQVUl0a3NsY253UlEzbDRKVm4yN1ZkeVN4WDFhL2JDSWxsQUds?=
 =?utf-8?B?S0ZabEtDSDQrTnV1YmZqSjJoN1l0bTV1ZFEvS1ZYcThvWlZHdjdDL1ZIT0M3?=
 =?utf-8?B?Y1dJbHY2cVhWbTdqNjhia3RzQzYxYkNuUVZyRENKUVJIN05CSFlCT05WYnIw?=
 =?utf-8?B?WVN3aTNIeUhSaVp1b2ttVHEwN2tkK0s1Ri9zdG9hVTNPWSs5RDFmcWRQWHdt?=
 =?utf-8?B?SFhTU0tnYVNPd3B4QjBQbUZXdFUzUXN6T2E3dm1UYzFKT3J3Vm9JakdWblRx?=
 =?utf-8?B?UDB6aDRPMldwMTd6cTBoT21jdTREUTZkQitpUTBiOGVwTHBPemNNR1RiSkJK?=
 =?utf-8?B?ajBPelljQ2xJWWpBVW9USEZkTlViK3BWUmN2RG43WExITXZrVXh2OEZiU0NC?=
 =?utf-8?B?NHdkWlloQW12c0lCbXltYk13Yjl4N3pSYWdlMndlWUtzd3B0Q0IxdUY3NHd4?=
 =?utf-8?B?czdHYndqQ2ZkOUtrS3ZpR3pUNVdBaGJmWWJRclBSVDRlTEwvMS9YQTJhV01u?=
 =?utf-8?B?YkNOellHM2Y2RHdPaXUvdlVZUDVkOTcrb2RBd1J1RVZVcEtwKzA5c3VYcnpB?=
 =?utf-8?B?QXVKNlRJbGRoOHNYZzZhL0NLNnVMN0hpMzVtRlo1THpSc29zRDBzNG9SYmY2?=
 =?utf-8?B?bDFNWnJrRjJUNUpPOFpabE1LcGJrN3o5YnZ6NkFxSHBFUXVmbFBLeC9Rbmox?=
 =?utf-8?B?NHBLSmFLWWJ4ZmdQRUlxWmxtMlFNMFVxR3NsaDRRTWxvbDlheVdMM3NQc0Z4?=
 =?utf-8?B?T2U2WUE2VTlmS21rVHZSSGgrOXpZR0E0Y3l5WE9IS2piSTR6VWZNN0E3QmZj?=
 =?utf-8?B?Nld5Vk9WbUxCOTNmRUh5WWVmTm1TMGgvTE40QjRUZlhiYzc4YXR6akxnb1Vu?=
 =?utf-8?B?SU43cFR2NW03STQ5ZnQ5a3ZwVFFXTEF0QVpKK1ZJUXRPa3J6YVBBVDF5cnZY?=
 =?utf-8?B?YyszRW5nM0g5YjNLNkR0c3JGeTlsUXFIc2Jxd0l3MkRNZ3hUUGUwTHhZWUkw?=
 =?utf-8?B?dXhTVk1ZR1BUWXZhSEZXN3kzQllIaDdoZG16aDlBRU1nQk03VmxBeUREZGRH?=
 =?utf-8?Q?6jvsoQV1/J68r5pDMzaFiRvKg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02572f42-7e3f-4c2b-766c-08dba3e2453f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 14:07:22.4157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmmTSk43BENlnJX1y4evsu/edh5YHfav6HHsw7HlScqpEkyeVNHNbJXjHQmq/LlLqEV0xl19jQ1pEfm8gWa/qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7640

On 23.08.2023 15:57, Jason Andryuk wrote:
> On Wed, Aug 23, 2023 at 9:47 AM Jan Beulich <jbeulich@suse.com> wrote:
>> @@ -316,6 +277,22 @@ int xc_get_cpufreq_para(xc_interface *xc
>>          BUILD_BUG_ON(sizeof(((struct xc_get_cpufreq_para *)0)->u) !=
>>                      sizeof(((struct xen_get_cpufreq_para *)0)->u));
> 
> This check...
> 
>> +        /* Sanity check layout of the union subject to memcpy() below. */
>> +        BUILD_BUG_ON(sizeof(user_para->u) != sizeof(sys_para->u));
> 
> And this check are the same?  Your newer one is nicer, so maybe drop the first?

Oh, indeed. Will do (and Jürgen, I'll assume this won't invalidate your
R-b).

>> +#define CHK_FIELD(fld) \
>> +        BUILD_BUG_ON(offsetof(typeof(user_para->u), fld) != \
>> +                     offsetof(typeof(sys_para->u),  fld))
>> +
>> +        CHK_FIELD(s.scaling_cur_freq);
>> +        CHK_FIELD(s.scaling_governor);
>> +        CHK_FIELD(s.scaling_max_freq);
>> +        CHK_FIELD(s.scaling_min_freq);
>> +        CHK_FIELD(s.u.userspace);
>> +        CHK_FIELD(s.u.ondemand);
>> +        CHK_FIELD(cppc_para);
>> +
>> +#undef CHK_FIELD
>> +
>>          memcpy(&user_para->u, &sys_para->u, sizeof(sys_para->u));
>>      }
>>
> 
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks.

Jan

