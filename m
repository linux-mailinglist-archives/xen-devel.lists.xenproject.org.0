Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9A65931B1
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 17:21:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387610.623927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNbta-00072y-K7; Mon, 15 Aug 2022 15:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387610.623927; Mon, 15 Aug 2022 15:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNbta-00071B-H3; Mon, 15 Aug 2022 15:20:50 +0000
Received: by outflank-mailman (input) for mailman id 387610;
 Mon, 15 Aug 2022 15:20:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNbtZ-000715-EC
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 15:20:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062.outbound.protection.outlook.com [40.107.21.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d70b0dec-1cad-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 17:20:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4286.eurprd04.prod.outlook.com (2603:10a6:803:46::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.27; Mon, 15 Aug
 2022 15:20:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 15:20:40 +0000
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
X-Inumbo-ID: d70b0dec-1cad-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQmkGzEk2HhQT0cNOcQ7WYuq14U/wq9DckSGp97p+J3iMzQu/WmfQdmrxdAxbUM5k47JkK3ln92XoJX/JDGxVXA0fqgbb/DjiQlAtX1NWPRAC1mtz7SMikakW5y3V8d3MP1urBZml9XzSC5eSDsDLtZtuwtiTKieECJ2Ugt4Zl5Bm3OJj/U96VaAK3VKbXIcDiGtOgvoVypmgCeMn1tsOC9fh6toStjP2ZAx1FxaV1iW8CdW1Y9ec/quIm0HcMOQ++VVhwF5JY+dqLiLeKif2oHsYECBg/gprOBPYEN3GpSDAU8n5kQ+4sHvWx+Ye1Ps79oiCOg5/9aYkFtR0D0PTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bc+BFnwA3IuzyJsXn1v064viyfz5y/UXnPnqicZ8sT0=;
 b=f63W1R59P3Y9V3WfckvtECUd7sMaulKW+TFAKmpxeqVlUwXfaQOHK98a6HQFsbmfTjF646xrpMI4kCWXKHTUXAxQKJ3Ii6FcujuTiOqJU/DtiRMvsPkIQ6RzFgZFMX+Bd6UVYWa3EdqkW8ZbW7/mwSYS6h5xFHAnMwY3oCuy+TPheAI/U7Mmvy9AjN65F/hc8+nbR6ItORxwRddxxKq/+IRlFt6OpJPEOz9YtkIclZYhKqZMiYf76sLIX4OEHqbeFafP7tgcJ/rWqSFMwkmyGYlTgK8snMDe5Pog9u3eyZKh8ZT9ohOrvIucKk+7uzPotH/zIrTY7ZKgfBtubmDSJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bc+BFnwA3IuzyJsXn1v064viyfz5y/UXnPnqicZ8sT0=;
 b=QHBIak+jPgkT98PlQmhsFS+3eggKUlPOa1KCBjwNmWm/L2vSA1gbPCwr/yBrbai9CD4bSsed3NQwTw2Lfnfa+GtaCiNjMzif3Q5+4IuaM/erb0FpBdzczpvAEJTY0IWG19adzcxqSwNMAMixJ34+qrAqzrjTCZmLmASWMjI8yaMtA956TnRwW67bn+z7OfZJfW6oJ3gAQ+YFwBNYUj13qiiVZPP5HUKTzKkjuSuLWu9nK5WdWL/0tArBt6jkzWHQ2mJMHzc7N1V6ns+tjfWryCVzYBveK1oqDGtFZG5nryHA9L4QRcAOp7UZx5Pt9Gyr09xYnH/qvpreGLSMkORRTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <63d22c68-6a0e-b135-67fa-23d067bebafc@suse.com>
Date: Mon, 15 Aug 2022 17:20:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] x86: rework hypercall argument count table instantiation
 & use
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cc65eb5f-310e-b51b-71c6-17b93cbe7d0d@suse.com>
 <caea2bb5-a37b-8660-4a8a-03aa7476af35@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <caea2bb5-a37b-8660-4a8a-03aa7476af35@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0122.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b106c78a-e14e-4bbc-925d-08da7ed1b688
X-MS-TrafficTypeDiagnostic: VI1PR04MB4286:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LZdzUbIbUuhXYnQttjtf6BLUkh5xDwNHuMjfNgqLe9A6HQHPbEaBIfXGH8lET0mKUuCNp6e2gH23kpl/9dQXRM4ew3y953SG+hYxzypRXyj2smv/0xlvOcM+23YwNnwq5uc8H/Cy/804TeF7LomfxPAqyrICpKJPcILFgiMYq93nPGiNbL/JUXaoC8b7RsIInsAU78GJdWkj0IhsOtVCRYxAWF4MzKdlemZMVbDWYO0Wv5f7C74iKlJ48+x/nqGr6320hOR4IdyOSWx+/Vm70CIhZJO9x8uI9D+19Dj7X0yGcK6suBt7zrF4TpVW4yn3I5sEMBS4y0cPF4dNnxgQN0EwTOp8Vd0vtf3y1R29GFLHmQ7wCAvh7wBtfnAx6BjUH9NhegxcH6fb48Czb/Pu03FfgzL5xhZ8N4VavRrFq+J5JckNpNXVlDlxqCtsX0hYC97GZ8+hOH0Wr8tfjYtF6W6bQMqZTxsht1o3aplRTJ5LqoXnBSIOWZbnzy2wtlTzqHq/l7fIRM54InO78fWUQ3evKLSuEVLXZfk0yR1USmuuKXKcC8VlUwBg8MUiTcuUNm3kL3vKDx2n/T9GLqf+sbMrK4wc9LxJY41SxPRF6mI1qxs6NI/c6QXXAF9L+BYAfr3kNCAAqT/w+rs2JND9DGZgp8darSwzIy9f4DdvdXrrZnAg6u8j/l/aT260PqH+DxS7TQ8O2dKprJi0a4H8LRsUEfKQvRbdLMHHvMbJGDEhWgHb+SY78tTf5o1vITq4EbXeDbZyFfnj75n7QWrrxeJwzuBWW1WaVo6qTM+p7K3zIDVErEDYfV2mV/w3w4OIJ33k/D02tmeVb3sck90HlA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(39860400002)(346002)(136003)(366004)(478600001)(5660300002)(41300700001)(83380400001)(186003)(53546011)(6506007)(26005)(2616005)(6512007)(38100700002)(86362001)(6862004)(31686004)(8936002)(31696002)(36756003)(66946007)(66556008)(66476007)(8676002)(4326008)(2906002)(37006003)(6486002)(54906003)(316002)(6636002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDlDbnlLb29Zdktad0hCS0NuY05aeWxvSGdJdUN2MzFsemhTUTVJZHBHZVkz?=
 =?utf-8?B?NHdRY0J5N0hmNWhmL2VVTmZFaXpxVFBFek5oM3g1aXpmZllubUI0VHlkUzlR?=
 =?utf-8?B?NWI0Rkh2bVo1d0lrRnhZVDNlanlhOG5hb2pYUm10QkdRVlR1eEM3REhxMVpY?=
 =?utf-8?B?OUJrd1BLZUdNOVZ3bExrcmRkWERwR0dJR1F0ekR4bVFiZjQ4ejVNTnB3aTI2?=
 =?utf-8?B?dkk0UGhRU3VCY2VzUjBrVWZ6SzFNSU1KTUJxQlIxYlY3SmR2OGdWRVBLdVRp?=
 =?utf-8?B?Y1QwNmRwbm9EdU5SMnlDNXJ4a010aUhSaGU0RGE0MUNYNVFzczZlZGJZczV2?=
 =?utf-8?B?VmtadjBFaXdrWW5EQmNoRU92dEVGZVlHZTlBKzNRU21YNkwwV3BPTnRSZFUw?=
 =?utf-8?B?M056RkxkdlRzRkdmT0ZXZUhJbFNIT2N4SHlDNFRGSjJEdnQ2M2QvY3VOK3dY?=
 =?utf-8?B?QWdMOHQrM0p4bG96OENKZDFWUlM2Vlo2dDhWRUd1L245SE82NmozbjRUb2lI?=
 =?utf-8?B?STdIMWY3ZUphYmpGTzdPTnVzSndJTno4cXVTbmxJaXdDQzNUVGh5T0Z1RWd2?=
 =?utf-8?B?SGpkMTBCaDI4WnY3UUpYeHNhWHBTeUZrYklCVUpTZ0JKdzR5MS9EQ2xpN25o?=
 =?utf-8?B?MFFITWpweENFbFlDRnA0bGZPMkFPdkZNMm9oWkE5TUk0SHE0NEptRkZDV21a?=
 =?utf-8?B?MHlqcjdobHNvcy9mb3M2Z01iZlNGcys1NG9Gc0hQd1EzTTVqZm1oeXY5eVVt?=
 =?utf-8?B?UE41NUg0ODd0THRUVm5YS1AvZER4aTU1UGJnV1h2b0c2UkxZbDZTYXgzUnA0?=
 =?utf-8?B?QXNqV0drcHBMeXNNcVd4KzNxb2ZETU9vckUrZ2NWYURNWVQrMWhiYzdpNXY5?=
 =?utf-8?B?KzBvbFVxdWF0N29PVzM3K0NLL3AyZlkxTjJWbXFSU3RDTHRNUUgzQzZTb1la?=
 =?utf-8?B?eDRFcGQwdkdHdFcyTUZtV3F6OXlVL3dGd25wWWNOK2xpYjFadjNINjVCOFBC?=
 =?utf-8?B?MThUNE12MzczT1lPQ01JSVgzMXhnT0d3V2Q5NHhQT3JKTW15dXBsaFFGVThE?=
 =?utf-8?B?Sk1rNEcwREdpaG5QZjFoVTYzbXViT3dwMkRqcnVialh0MmFjbG5McjgrVHo3?=
 =?utf-8?B?OGk1ZVcvdmltQkRMeWtob1BxNVRObURrMkZpc2RwQlZCbGxZMCszUWxVc2Yy?=
 =?utf-8?B?NXpNbWlGRmNnSWJwd0dSNnZqaTBTU3ROQXV1NkFZcWRZTDh0M2QxVkgwTVh4?=
 =?utf-8?B?TXBEdUJsaU5UOTlnYitaTE11RitpRExtajkxZjloMlV1Q2VBc0tXNmxMUkEr?=
 =?utf-8?B?ZVNHQjBuYm96cEFFTHFXZXJuTk5Ic2JGSm9sbDM2UUxCeFpZWVJxYlhJbGhs?=
 =?utf-8?B?K2FrNlg2UGtHVUVXZ1BHaHg5dHhpMmdMV3ZkVlg4WmZBSXR0TFRTL1ZZekU3?=
 =?utf-8?B?RnlNcTdwZFVCcWMwZ1Nwb05XajRiTCs3bHh5YXdkcUZFaUVHZWVqTDVsRktt?=
 =?utf-8?B?QTkrTHFoYWdlQ2VscWhSQms4RzdSVlN2elB1WFFZWUszanFUYlhjdlFzalpE?=
 =?utf-8?B?c2dzT2JiMGxXdmR6Sm9SMDlCZm1XU1M1NzBqa21iRWVVU2JYRktsemlST1Ra?=
 =?utf-8?B?clUrQSs2YUJBN3JjT3ZlTll3Y0JHWWxIeVVLK3FOQmRiVWxRVU9EdVRHWWdq?=
 =?utf-8?B?SndEbm5RMVpoUFRzdWNkM3lFaUxMUi9XZEJWYkFFMzFDbUVpd1NXbEgzbnZz?=
 =?utf-8?B?RDNzQm80Wi9OOGlWeGFhUnBvcG9NNjI0RWpDZDZLSk10TWdhWmNRc25lbjBP?=
 =?utf-8?B?S0FGMzJRUC9IeTRtVTFwNEh6Q0RBY0t0a3BoZEJseEFGTm93eFIyWnhLSGJC?=
 =?utf-8?B?b3BWYkNXZDFjeUFaZEgyNGFHcWx0Vk8wNnZQYTdmaysxdDFvbm5nL1pTM1Jj?=
 =?utf-8?B?YUNtWTlPdkNmRlJhTmxMbDI0YXhjL2hsNFprd3IvQk9HaFk1UEVBeXovSXUz?=
 =?utf-8?B?VG1Mc1oxTWJXZkVoT0Y1SGwxQXRoTE5ldUw0V1gvcVpMekk1WFQzbnRqQkh6?=
 =?utf-8?B?amw4NXM4OHdrcDEvdUgrblpodElJSEtZR2pVUGhqeGkyRG9BM1BnZUVrTyt6?=
 =?utf-8?Q?N/igUWFRHgf6THVNW7ynS00mq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b106c78a-e14e-4bbc-925d-08da7ed1b688
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 15:20:40.3108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1C5DuMgI17VN6WXqAQPHmerCDd9ms1eZf99sVc4iQbNEJUt+Dp5rR+L8zVIdojByJpAXje51Lm9UZNsOga9kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4286

On 15.08.2022 17:13, Juergen Gross wrote:
> On 27.07.22 18:00, Jan Beulich wrote:
>> The initial observation were duplicate symbols that our checking warns
>> about. Instead of merely renaming one or both pair(s) of symbols,
>> reduce #ifdef-ary at the same time by moving the instantiation of the
>> arrays into macros (a native and a 32-bit one each, where likely more
>> redundancy could be eliminated, if we really wanted to). While doing the
>> conversion also stop open-coding array_access_nospec().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks.

> With one small nit ...
> 
>> --- a/xen/arch/x86/include/asm/hypercall.h
>> +++ b/xen/arch/x86/include/asm/hypercall.h
>> @@ -43,16 +43,6 @@ compat_common_vcpu_op(
>>   
>>   #endif /* CONFIG_COMPAT */
>>   
>> -#ifndef NDEBUG
>> -static inline unsigned int _get_nargs(const unsigned char *tbl, unsigned int c)
>> -{
>> -    return tbl[c];
>> -}
>> -#define get_nargs(t, c) _get_nargs(t, array_index_nospec(c, ARRAY_SIZE(t)))
>> -#else
>> -#define get_nargs(tbl, c) 0
>> -#endif
>> -
>>   static inline void clobber_regs(struct cpu_user_regs *regs,
>>                                   unsigned int nargs)
>>   {
>> @@ -69,6 +59,11 @@ static inline void clobber_regs(struct c
>>   #endif
>>   }
>>   
>> +#define clobber_regs(r, n, t) ({ \
>> +    static const unsigned char t[] = hypercall_args_ ## t; \
>> +    clobber_regs(r, array_access_nospec(t, n)); \
>> +})
>> +
> 
> ... could I talk you into not overloading the names of the inline
> functions with macros? You are changing all the call sites anyway.

I do, but the call sites should use the present name, so if anything
it would be the inline function that gets renamed. Yet I'm
deliberately using the same name, to kind of "hide" the actual
function (like we do elsewhere in a few cases). The effect you're
after would be implicitly had by going the route described in the
post-commit-message remark. I'd be happy to switch to that model, if
that suites you better.

Jan

