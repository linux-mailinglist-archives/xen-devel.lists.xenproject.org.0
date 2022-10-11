Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5552C5FB052
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 12:21:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419518.664296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiCNK-00038v-U1; Tue, 11 Oct 2022 10:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419518.664296; Tue, 11 Oct 2022 10:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiCNK-000378-R6; Tue, 11 Oct 2022 10:20:38 +0000
Received: by outflank-mailman (input) for mailman id 419518;
 Tue, 11 Oct 2022 10:20:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiCNJ-000372-6R
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 10:20:37 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140073.outbound.protection.outlook.com [40.107.14.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 583b7658-494e-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 12:20:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8997.eurprd04.prod.outlook.com (2603:10a6:10:2e0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Tue, 11 Oct
 2022 10:20:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Tue, 11 Oct 2022
 10:20:33 +0000
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
X-Inumbo-ID: 583b7658-494e-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKRIOFcung8purjBz+ylm+c9qMxg7eJlyzDYB1lhOAUyqoGfp2AQ7tPFuQr6HaghpnZjytaEL8KAwrJfB06JRzchgXv7Z3+SViwzuf3+kVgsaHpJn9X7gz+eFxiTN4stjv8ae5bBD8Ge+9FVuu8ex5c9GW5+g21N6Ek7Wr3GRzx/nKP9uHgMCaZVJjmrM3VqWwwTht3/WvOoe3wrs+1a/Dm13OxaPyi1XepaP67ckyLyZQ3W98KGneybIkaIPRcOgQH3ns0kSxQHklxWL0tHyuC6V7cveAr9mbha2DXlNim4BwhK5VfpcXrCNKsdMThe2MwbylEwWkmq3OyXJ+RjPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8WS9LAcEqfvEKpatDzokNE1RHUHaEmluWzzsaBKdys=;
 b=hIjX06cZuYlMLk097TxgWPslaMWdGf1R/M/+WHXfTfOKOvKrVxuvi/qEz/4GRLB3LkBGnPgq9NarmPMQ3IfYmuGsW9BXU7SqjWPSVgcrSnK8wN8g123SOmGH77v0VHWn/aqGNoQKku6iBZngajh7D/nq+/0o0QIOmzRNde9ZPlmKRnL9d+YZjHlGkNn/Gb1Nelv5JShBWk868LNmV5ZPNA55Ip86nCyh8kC4wANB5izYrFbkDevm7rdMkd/Tumn+5eKOtR7UeEQXlKhe9g5vZ3DhP86BzjdDjQL2sMNElFWl2/kkFTGSwfrlnN4BTJlge14sh7idLbGPwXeRfR3oVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8WS9LAcEqfvEKpatDzokNE1RHUHaEmluWzzsaBKdys=;
 b=w/QeKJWmhLytvqLPjnMJsg7M2WhgslpvkusSaxh5iTOV3NOvuFNrDhTnodLENvrNSeCd8owTNQN1NAo3jBOZnuZhOsKN2EOHB+CrwTuSpt4la7a2c8wgs4E0HSJDEs5VLpePvOFURDZQo12GqzDHhcI3y8z+0zAwijlmZdvqnQQ+87E0LOYBHZWhDOrI1zQj9BUBBHOKXJYv9VycaMEOWrDTYOaWITPKUBk440y4WVK0HyRqK+DA5IbefX6OTvg+SXJnSHCm92L+AuR1qZodnnSBTJq4o7SO0BI5KFzuBaGaKPoHRjuIZCNVOQvPPxksX0g19KO46EH1cmdZnPw/FA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0fe3af83-a743-5edd-1c83-921f5e666039@suse.com>
Date: Tue, 11 Oct 2022 12:20:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 2/2][4.17] x86emul: pull permission check ahead for REP
 INS/OUTS
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4ca86bb6-ca6e-0c6f-448a-55fb73a3c02a@suse.com>
 <4d01771c-fd02-b607-c480-04bcb11fa7b3@suse.com>
 <2dc898c0-b42a-28d7-7126-9379f03119f3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2dc898c0-b42a-28d7-7126-9379f03119f3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8997:EE_
X-MS-Office365-Filtering-Correlation-Id: 2414ac20-2191-4eff-35e0-08daab723afc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MTlCnHPyRWTOgUkblXdlemyBYiwcByY93nEoeF5+FMN2u0Hrln5nRm1lmAOnRSHnGHjZ/GUqvQyvQBUBsP8HiVwEWkkefFcwjHXYeuo/szAXXrvrIatb08Sk7/QhinhsAir+AuUgmmizp6VMKqcu3/pk3toIShdGCG9VUsk0KtdfWPwp7QUz5ZqduPM2k4nlsWfaEe+BDS9Ln1E2R2ZTnmMAUSBtIvpwGf4xFOLbNZKgInjRxDWUObzKrvkMjb2TI9EsJF9XMuIy6WlVZHOXnqF8qMGUSl0f6lr4lIGSFV2UW4E53tRPsRwY5eDsqyA/MdzuR6sd/lyYqG+IB7hSOes7+EXC9StiUU/5+e7o65jySMsYx2CN4a8KQPclKx5G9zjTWGiUj6rfYPOTre/6bKdPNd5ivSFafuhkp/w0TAVC8QYxQeZyogOLQeUtBkmHfuVCQ2AgNg165uk0jAzeLV4a0+N8/khYrGAkiWGcnE//X/PHuq5VFDX8A22tFSql9wpiOH9YEggntVueZ5wCJGbnaEWsoWrVLt2Yw8nijjd0QKogzGZjyeN9APYUJdnAPFi250Xjq+OGYHHj0AMHwuS+OxyeDfc7NcRap2AjSEHQjvrhYRs/B4NqHVCaff2z+XIfCDFQE+1jJtiovp+pXlFZ86XU92c+ZNwtrUYIhaV4bTXE0blOq1oVhtkDlBxZFXt2eDW78MYVzm4YGa4grbVBgX4uDD3WyYzxYL9GTAYL+T1Ca0paaVT8BpZwUPylp0z8PO9zZ+ITUshJiEW2Zo1GzGrLaxmbC6QNoa4lwZ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199015)(31686004)(36756003)(8936002)(2906002)(5660300002)(31696002)(66556008)(41300700001)(66476007)(4326008)(8676002)(186003)(66946007)(86362001)(83380400001)(2616005)(54906003)(6916009)(316002)(6512007)(26005)(53546011)(478600001)(6506007)(6486002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkFJdmNzOVBHU0lRTENsdlVpOW9UaHNBZDdqYThrTDh3aGE1aTY4UTlDU3lD?=
 =?utf-8?B?U3VUN2JlNVpQVEpFODZxOUtHTlVoWjlYNk5TM1FxYit2TnNFQzZBMmUzeSsy?=
 =?utf-8?B?MldpSXdwQk5IVEQ3RmJTL2s1ZktEaERhR1YzMDgxU1ZqR3VlZVhUMmtCR25C?=
 =?utf-8?B?QXpVSkVBMGlTekcvNjNFckJSWlVSckRHdXpyNUlKSmREKzhzaU8xMzFSVVRi?=
 =?utf-8?B?MXV6YXN0YklIS2JXVFB4NFIydUxWZGxsZG5OekhLbGVndjVBQkZ1QzVUVmlz?=
 =?utf-8?B?NTdxbGZaZTdweVZueVBWbHRKaXZRV2YyZkFCK1g5ZTc5eDBBemFBbGhIbURJ?=
 =?utf-8?B?aThVSFRvU3VtSEUzSnF5OHo3dWtNMFFGR2VwQVdPbVphWlBoVzdmMFo5Ujd1?=
 =?utf-8?B?Y21VZm5aZC8zY1dvMDRWRm5CVENKMHQ0M3EwZHJQd3FabWtxeVA4SElFVkZo?=
 =?utf-8?B?djBKUm0rK1RmNnQvSW41RGk3dVgxR0ttU1lTZ3hNVjlHMHBDdnhGVUR2c2RT?=
 =?utf-8?B?S3NVSXdZRnJhRDZHN2oxVGxnL2k3M1lvbUNWNWtnTGZBcXkxNCt5YzRzc3ZR?=
 =?utf-8?B?bEt6OXQ0UWYySDkvK0RmekZKNUlPWnVQclRVZ1IyTG0vYllEM296a1hGK0hi?=
 =?utf-8?B?WlRzaklJNVphRVdyUWlibkxFTUVaM2RXRnp0eXBRc2NMT01kSVZGNWtpNWts?=
 =?utf-8?B?OUNWQXFjL1dOOHFDRHBHT204R2N6NzhNUWJ4OTliOExKR3JHRURQOURFdWZH?=
 =?utf-8?B?WUZZVVZTOXl0VU5iMWxnTTgyRE9QVU1kUllqcUJiMGdodUVPNjczUUJEa0ZZ?=
 =?utf-8?B?aWtBQlJqek52R2R5L1hlSWJBaE9lMmUrY2FMSmhSdkZTZG5IdDdWT3NRcFFj?=
 =?utf-8?B?TDVlaCsyNXJUaUozaFRVeVhjUDBRT2dOOW1NTHZGbXVIMytnMCtOTDZtSThq?=
 =?utf-8?B?dE9jUXI3SkxMN0VFMGxTNzZyNXNKKzRUTEI5M2o0TG40YUpOek41ME0vTEVF?=
 =?utf-8?B?YndHOUpBWXk1TDFJUEVmeHB5aVhxc0pvdnZreG9vV2ltbEk3THBlbm9HY3Av?=
 =?utf-8?B?WXpWZWxHQ1ZFTDJWVThTVU1wRm91WkN1ZVpIRHBxY0E1dzh2d2QvR2NENUZI?=
 =?utf-8?B?TWFWdzdnRDE3RnhQbEp1SGZzQlc2QWtaQjF3cUdtMzBkRTFLWGRyb1p1Y2xt?=
 =?utf-8?B?Sk1NS3hRQVd5RUl2S3l6MGdkenRZWjJEOVJjNE5XV2srN0ZuSzFoTUI5ek1n?=
 =?utf-8?B?eGhPcVNuNlZHMW4wTVh1KzB1Q2lWRkxlVkV2aDhVdUF6UXh6aDhxOUZJWUJN?=
 =?utf-8?B?eUorbUFDSTVBcVNBRDVHY2pkcjdpNWpTUkJmZVhJcmRSa2dwQ2dwdm90eW1G?=
 =?utf-8?B?V0s3Yy9LbURnaDl0cHVVZ3hnQWRNZ3I4SG1TT01wQUY4dzN2RmVpZEpuMWF5?=
 =?utf-8?B?WWQ1OWNoTlFqeERmR0pBUC9DUk9UMzFoRmZPbnhtMEtwZjZZS0dDQ2RqNlp1?=
 =?utf-8?B?VmhIZktYc0NENDlYbGV1Z2FvTEh2VFl5THFjQ2tuSStmNllIbFRJY0tCV3pL?=
 =?utf-8?B?QlF6SFhEVTYvMTVDaUZUWkVlaEw0blo2d3ZvcjQyb3grbDROOW1WQlozQnVR?=
 =?utf-8?B?c2NVZStHako2aHBhUHFrQTlZMnpOUDFGTUpWQ1QwVE54a2pUTlRzWU9HVlRW?=
 =?utf-8?B?NCttZnM5aFNhRHJhWDc4RW9uL3FPUGxaT0FoWkZXU1ZHT21Wa01Ed3lzbXBq?=
 =?utf-8?B?OEs1NHphK0ExeFVFcGRUR01CUlRyMWcvZFJSbkJFdk5kQ0pvTFgyZG5haVoy?=
 =?utf-8?B?M25ZbXlXZHRhZ2NrcEFXdWJJekRWWG5VVnRVb3grODhNdmlkOFdBOVMwY3Vv?=
 =?utf-8?B?ZUVKTWk0UzdBdE5NVllQUmF6Z0EwR204RVlycDAyaEhtbjZlRm1iNlk2UUtY?=
 =?utf-8?B?NStTbnNkZmVWdUlrbXlzd3hhaFBlb0N1VWJPRFpwUHpvcFhWREI0czFidGJ6?=
 =?utf-8?B?c1NRSGtvSnEya1RaZVJEWk0zaHJYK3VQc3pIMTBBYzVxK2syZ1hONmc3dzNT?=
 =?utf-8?B?dUlKckEraEt0Y1dtM014blpLTEh4ZGlvaEZXejdqOVNXZ2F4cXdYUWh4aEZS?=
 =?utf-8?Q?iF2dLBwJVdGqjCmkPMVDqdvVh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2414ac20-2191-4eff-35e0-08daab723afc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 10:20:33.1825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGL2g4HUFDYCmm3obzdanrW/HOoQDlqX0/gIoEMEt2JKTTPr2D4/nTpXEqj8dmjNxZvVjZmcObqqJlMfLZKSBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8997

On 10.10.2022 20:08, Andrew Cooper wrote:
> On 06/10/2022 14:11, Jan Beulich wrote:
>> Based on observations on a fair range of hardware from both primary
>> vendors even zero-iteration-count instances of these insns perform the
>> port related permission checking first.
>>
>> Fixes: fe300600464c ("x86: Fix emulation of REP prefix")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Partly RFC for this not being documented anywhere; inquiry pending.
> 
> Intel do actually document this in two roundabout ways.
> 
> 1) The order of checks in the pseudocode.  Multiple times in the past,
> Intel have said that the order of checks in pseudocode is authoritative.

Which pseudo code are you referring to here? There's none I could find
for REP, and the INS and OUTS pages doesn't describe this specific
behavior for REP INS / REP OUTS. Instead, if the description of REP
was authoritative, then

WHILE CountReg ≠ 0
DO
...
OD;

would mean the entire INS/OUTS operation is contained in the body of
that loop, leading to no possible exceptions when the count is zero.

> 2) This paragraph I've just found at the end of the INS description.
> 
> "These instructions may read from the I/O port without writing to the
> memory location if an exception or VM exit occurs due to the write (e.g.
> #PF). If this would be problematic, for example because the I/O port
> read has side-effects, software should ensure the write to the memory
> location does not cause an exception or VM exit."
> 
> This makes it clear that the IO port is read before the memory operand
> is interpreted.  (As a tangent, while the SDM statement is all true,
> it's entirely useless advice for e.g. a migrating VM.)

I, too, had noticed that paragraph. But as above it adds no clarity
whatsoever for the count == 0 case.

> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, preferably with
> some of ^ discussed in the commit message.

Thanks, I'll apply this provisionally as I'll need to wait for an ack
from Henry anyway. In the meantime you might clarify whether my
responses above (which mean no further discussion in the description
for there being nothing to refer to) don't find your agreement.

>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -4248,14 +4248,15 @@ x86_emulate(
>>          goto imul;
>>  
>>      case 0x6c ... 0x6d: /* ins %dx,%es:%edi */ {
>> -        unsigned long nr_reps = get_rep_prefix(false, false);
>> +        unsigned long nr_reps;
>>          unsigned int port = _regs.dx;
>>  
>>          dst.bytes = !(b & 1) ? 1 : (op_bytes == 8) ? 4 : op_bytes;
>> -        dst.mem.seg = x86_seg_es;
>> -        dst.mem.off = truncate_ea_and_reps(_regs.r(di), nr_reps, dst.bytes);
>>          if ( (rc = ioport_access_check(port, dst.bytes, ctxt, ops)) != 0 )
>>              goto done;
>> +        nr_reps = get_rep_prefix(false, false);
>> +        dst.mem.off = truncate_ea_and_reps(_regs.r(di), nr_reps, dst.bytes);
>> +        dst.mem.seg = x86_seg_es;
> 
> As a further observation, both the Intel and AMD manuals elude to the
> use of unsegmented memory space for the 64bit forms of these.
> 
> However, as both %ds (outs) and %es (ins) ignore their bases in 64bit
> mode, I can't think of any practical consequences of conditionally not
> using x86_seg_none here.

I find "not using" irritating, but perhaps I'm simply not reading this
the way it was meant. I'm convinced the memory accesses by these insns
are normal ones, so using ES: means linear address unconditionally (for
INS) in 64-bit mode. For OUTS, however, I don't think an FS: or GS:
override would be ignored. The SDM text also doesn't read as if it
would, to me at least. What is it that you have derived your reply
from? "In 64-bit mode, ..., and 64-bit address is specified using RSI
by default" (for OUTS) doesn't say anything about the segment override
being ignored, and earlier text actually talks about the possibility of
an override, without restricting that to any subset of modes.

Jan

