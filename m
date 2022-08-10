Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D888B58EC62
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 14:56:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383612.618803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLlEq-0005Zk-FX; Wed, 10 Aug 2022 12:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383612.618803; Wed, 10 Aug 2022 12:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLlEq-0005Xx-Cc; Wed, 10 Aug 2022 12:55:08 +0000
Received: by outflank-mailman (input) for mailman id 383612;
 Wed, 10 Aug 2022 12:55:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0+s=YO=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oLlEo-0005Xr-E3
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 12:55:06 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2058.outbound.protection.outlook.com [40.107.96.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1df12d9-18ab-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 14:54:56 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM6PR12MB4909.namprd12.prod.outlook.com (2603:10b6:5:1ba::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 10 Aug
 2022 12:55:00 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::84ed:932e:f39d:54c7]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::84ed:932e:f39d:54c7%7]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 12:55:00 +0000
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
X-Inumbo-ID: a1df12d9-18ab-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2l4/KYYGK7kHxrBs36SyV2tG+wRrtwa2eLMiNOWLK3w5uf1ah7mKY6jtRYgnxKik0ZmxaLgxBtR+jjr2w61qRyD/v2V5uNhCiKDd5w1Jc5BwCFawjWnat8LuTveE6zmEavrN9hUOPrxwcRqOBPVbDLaCHrr3AMwt+sEy1L6Kvat52qVjTfvubrf7fk/6uI3d3lmXwsGODa8PHpza2/VWBH+g9gv/8YCq154Qvm2U2tX+y7aEyvyREfmRQ4uMmmviBntOBAk/EYrDBpGfmY9BS9xkhHlZ/mdTGsUu2zfiTFo7CJY5wFuIfkSoT4akTCxC9kQMVbx3m1JQBisRKq4nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3cA+KTSXYELMHlA8I7bHiZ4wz5E/mk3H1vEQ3cwKUY=;
 b=h1lp4Fq7aqy+uCxAc7ZJjQwXvE4suf6B2bDzLOX1QjtfB/gfYBEqgUYBASWmHt4DQgdfdTGb9NrzDU2tjqCkyGBNLBxr+MB3ysJ5pXVPs9oxSNrAs26cRHhRHHbMfcKrYNruLwuDvFyjtYkc1+oP5Cys6K4W/qGmbptjYbHZtNMNnmWNFh+CZaNIvjlvefb0aYQgoIqHsx7Ji0SObA0c1l5pTFBsPxZEm+fUKtjEpa2IyOmWRo24HgddCY2rGmkbuuYW8GvrQ7XPJQisVFcVjTKUuh1oH/8rYA/LMWY3wq7MHK3lHj30rieyIv/WHFj2p8chBJ1N1zW6thV6sXANoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3cA+KTSXYELMHlA8I7bHiZ4wz5E/mk3H1vEQ3cwKUY=;
 b=wCWCIwOn/zt+37h2XfEsql9ryOcNg/6cecEVqmYpI71/7s4yt/qgOV1nZg5oq5/7sRtArwGUnHq/NsXvJcL80G7MSXsXdn32CYBdUGaqX+y5Zx3yVjUxlkzBXMbfNK49c0uq6YdZqtBpqRFq9QnGKW3ScCKvQjzFt++tRDogWNY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <6d1ba477-5c15-0fec-b624-96cf00484bbf@amd.com>
Date: Wed, 10 Aug 2022 13:54:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [XEN v1] xen: arm: Check if timer is enabled for timer irq
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "stefanos@amd.com" <stefanos@amd.com>, "julien@xen.org" <julien@xen.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
References: <20220810105822.18404-1-ayankuma@amd.com>
 <1BBF4AC4-6FE0-4CC9-9188-13DE5281275E@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <1BBF4AC4-6FE0-4CC9-9188-13DE5281275E@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DBBPR09CA0024.eurprd09.prod.outlook.com
 (2603:10a6:10:c0::36) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ea5de34-6dc3-40dc-3942-08da7acf892a
X-MS-TrafficTypeDiagnostic: DM6PR12MB4909:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nEjK5HnbqgA0vwKDzSZH9ls95kNvcmoO7vKE9OX1xupbsclnxegAGUoXlgMCIBKcw8HZw8M0Dec9oIycunCoXwN5TMawXOVUuP59pMtTlle2qxH8EBVZDqFGZ2aAms2Ot+RnmKxkIYX96HpMc4ROWue3UyX/iI0VbrIq1rDDKZkFV0YFIb9nAY6r2iop6S61Oa6YNfABJlGXHhhBoXjxxufpBCsRIi8SMRGurA/ID4yByumPRw8rKZWNxU1dUcBOdqHD2DngcL6Y/qqiqNmKFoPCcP7oCXXVNAvFA33h2/FNKiNRajEPAR8DvZjQwDa8jdy9lCnlaTl+gi6ALDRgFeEpOkLrGAunvlXS79rqGAN7Nza2SF0OPdR04j8AIIOuAJ6KpDyazjhZGN5+HlQxqzL6wxQj3GW2xqoSmHmzJO2EyqHnrJpNWQTRacjf3imNKG+8EvB1wrgrFgNLNLPd+ufRSCdjCxTuhZOabVKNgG085QqjJOioaHZhPf6Xtw6UJfng/eSip6WeKb2Zpi9ee0FNxorY4G5VptKPBzSFnSKMGQS7/LRZ7saVjR2msVNHe2zBuY/goYU+tDG8nDc0ERK03osESzlK0tyBRvFZWygNXTJKeFRb48/6viZ15AgGS+1Cp8+Y3WfAp3IRk9vi53Ed9nU8m1jqPK78AM7P/gUpNKl6bG94ok9oDgFJ29i67jN1tgfQx6i9vX3K69HuL0FqDXw3KGDYrIoobeOGTkFmTdP4tQ8Sbi/YC3BN9SujPH9Z+xuwEqelH+xpLwpUfO9ZDxm1rm1vwtoZEv+1R8TdMjGDpnD/bLqRZbw1YIZvSQHYFQ5w2Q0D5D14QrB7tw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(54906003)(36756003)(316002)(6506007)(6512007)(6666004)(53546011)(26005)(6916009)(6486002)(41300700001)(478600001)(31696002)(2906002)(66476007)(66556008)(66946007)(8676002)(4326008)(8936002)(5660300002)(186003)(2616005)(83380400001)(31686004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEZNRmlEaFB0Z2pzWUxUVlBiMUVPOUJTTFVXdDdQMjRTdXhKQ0F3UmY1TnNi?=
 =?utf-8?B?VlhaZVN0TFV3S1NaVmFibTFRSVJKRU16MFJVTkdLMVpWaFQxVjRkcms4M3dH?=
 =?utf-8?B?NUhyOXFKbHVzaWNTRlZvZ3ByN2RYcTQ1TGt6RHNFTmJWK0M1SjIzbjd6aTE0?=
 =?utf-8?B?U3l6aDVwWXE3dDlKSlRoS0hDQ2ZCNkJGblBJd2NOMkZMWlN0QkxKN0tyNVFz?=
 =?utf-8?B?cVRYeUczZTNBZlB5OTlPY0xGWnlrb1JQalJkeVo5a0lEc08yRHd6ZDJ4T2Q5?=
 =?utf-8?B?dnlOc09WUmdmcndxcmJ4eHM1QWJmQ3Fwek1GSU9yWnozeXZGVlF2WXc3NVhr?=
 =?utf-8?B?ak55SnQ1ZjBXZTZsU0ZiV05aM3QvMVkwSHhyWHNzcGhPZ21iS0J1OGdJT29p?=
 =?utf-8?B?d2pkYlZTRlFRbHpweHVzU3JkeG5Ea1lkSlY4SThpeXUzbFBHYWhrd21mdFRN?=
 =?utf-8?B?cDR0NndEODltTjAyWkhnLzUwM2FGRkFuTWt3cFNtRitoT2lud1lVTE1sdGRI?=
 =?utf-8?B?Y0RaOXdrZVhSbUFXNE1QbHlCL0xhb2cwVk45RVo4c2VpVm85TDdlcWJQakx0?=
 =?utf-8?B?SEJ0cFc3RmZ1K1JDV1lFTGRENXkraG85NENsVW13Nkl0dXVRR1pYc1hnRXhR?=
 =?utf-8?B?S0pDUjVRTDdKMEVFMGxXcXl2SWJaSTRleXA0dXZ4SFh5eTYxMGNCNVVmRitG?=
 =?utf-8?B?R2FFZEtyN1VleS9kWHFkZGpPalV0Lzk0SUplS1hkblMwc0M4MjUwc1JtR0Jv?=
 =?utf-8?B?NXVMcUdvRnY3WXk0clFBd0RRUGx4QWN4bU9oT3VwY0RpTmV5YnNHYUJhdVVE?=
 =?utf-8?B?STY1bjhnUlR1OE9YWFZCY1FnTTBqeEhmVEZYOGViRXp5NU9Gd3drNzdXOFl4?=
 =?utf-8?B?K29wQm81SzJLYWxWdHl4RU0vNnVDZlQwN2F0Z2RMa3VGeEZ1NXFsbHMvOVpG?=
 =?utf-8?B?MVhQS083ZnVleE1YUVJ5ZUp2WE45RSsveGM1ak9EK1ZMMWUvbEptWFlqWnBh?=
 =?utf-8?B?RU9NRmxUK2NRRkFvNFU1cXVLZ09sU1l0NUlUazhNMDkvT1EzTk1mRzBIV0RS?=
 =?utf-8?B?eVhsTzk5U213eForaEJqVjluQ21QL2lxaW56L2xyMVFpWWlRd3JRVW1CVk1F?=
 =?utf-8?B?QzRqdVYrSGJzUVE1TmRyY1hVamp6bFB4QWI0UDliL2tUNkwvSzVoQ1ROV3cv?=
 =?utf-8?B?dkJNeGJDdExWM3I0Y3laMElaUFFFa2J4NWtFMWpKaGY2cVJuc2J6RDF5Ukhw?=
 =?utf-8?B?Y1B4VW82dWZ2Z3Z0Y3N5OU80RVJFYldPeWRTTm13dWo4ZWZ4WHhIcGJUVGdW?=
 =?utf-8?B?WDdMaWk1V3hjdmdhZ3hpUmM0SllxS1MycmwvSkhaMnI2QWp2cklReWcvd3lY?=
 =?utf-8?B?d2hSQi9aQTAvZkE3UFFESHVRaVN6Z1dwN1V1dmxHQ1hjWWFZN2JGWkIwSmls?=
 =?utf-8?B?c1V0SDc4bUhLUGRCb28zakNLZG51bGVBZ3U3bFoxd1BaTHdkbVpGblhGSFhQ?=
 =?utf-8?B?T2ZHa2o4L3lXZ0Z3eFlEL2tzT0pZZklRaTJHQXZyaHJOcHgxYlp2bHRtd2Vn?=
 =?utf-8?B?bUxjNVhSc1FkM0FKVGtFVnlWQjJDT1REbDJIQ0dsUGVINlpic0d5TmYydnN2?=
 =?utf-8?B?ZllCbUJvMS9rQ1dibWZTakJmdVh5YXdveGhhb1dqdzRpNDJoUHVuUkJvcEcz?=
 =?utf-8?B?NWRsTkU4cDdZYm8xbFZvL3A1eHY3NlZSY2lDU1Fla0ppSDVhcWg0WHJlM1k2?=
 =?utf-8?B?UnM3OXRxOG5ob3Z5VUp4ME96Z2tQNExDY3lMamZCZGJMbXdyZ2V5Mmp3Q3RS?=
 =?utf-8?B?YlYreGxOY3o3Z2l4YjdUSjI3NEhzOU5Rc2Y0a2tkRGRNbTVGL05WVC8wRStK?=
 =?utf-8?B?WHpFZFhIN0FadXovOXFLRU1SWUJQRW93bzVsTmFpZGNzS080OUkxOHVYcGF3?=
 =?utf-8?B?UzJiZ3VjVU5SSzRSeXo2UEc4dG5waGl3NVRYdDdZbDZENUNxN0MvZitsSHhL?=
 =?utf-8?B?QlVCS0V1L1p5T1d0WTViZ1lMa2xLYUhyRTh0VVIydDFXMkdZc3h3MXIzTThW?=
 =?utf-8?B?SDNtRXF1TDdkQTZkOEM2T1AzN2owT3d0OUJzU2RFckZMZGVvQTNmOGl1Qm5r?=
 =?utf-8?Q?yqS39FqqhJPOJz+D3v72g3UK3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea5de34-6dc3-40dc-3942-08da7acf892a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 12:55:00.6129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yIEbRVE8Jsa7gj/wndzW0JSAS4UIfHE6J3iw92EQG3WCllVhysf+iqTd7YCnLDee9ivyJUKk80mULIDFvbNIkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4909


On 10/08/2022 13:16, Bertrand Marquis wrote:
> Hi Ayan,

Hi Bertrand,

>
>> On 10 Aug 2022, at 11:58, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>
>> Refer "Arm Architecture Registers DDI 0595", AArch32 system registers,
>> CNTHP_CTL :- "When the value of the ENABLE bit is 1, ISTATUS indicates
>> whether the timer condition is met."
>>
>> Also similar description applies to CNTP_CTL as well.
>>
>> One should always check that the timer is enabled and status is set, to
>> determine if the timer interrupt has been generated.
>>
>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>> ---
>> xen/arch/arm/time.c | 12 ++++++++----
>> 1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
>> index dec53b5f7d..f220586c52 100644
>> --- a/xen/arch/arm/time.c
>> +++ b/xen/arch/arm/time.c
>> @@ -222,8 +222,13 @@ int reprogram_timer(s_time_t timeout)
>> /* Handle the firing timer */
>> static void timer_interrupt(int irq, void *dev_id, struct cpu_user_regs *regs)
>> {
>> -    if ( irq == (timer_irq[TIMER_HYP_PPI]) &&
>> -         READ_SYSREG(CNTHP_CTL_EL2) & CNTx_CTL_PENDING )
>> +    uint8_t timer_en_mask = (CNTx_CTL_PENDING | CNTx_CTL_ENABLE);
> This should either be a macro or be added directly into the condition.
>
> But here seeing the rest of the code, I would suggest to create a macro for the
> whole condition and use it directly into the ifs as I find that this solution using
> boolean variable is making the code unclear.
>
> May I suggest the following:
> #define CNTx_CTL_IS_PENDING(reg) (READ_SYSREG(reg) & (CNTx_CTL_PENDING | CNTx_CTL_ENABLE))
This will return true even if either CNTx_CTL_PENDING or CNTx_CTL_ENABLE 
is set.
>
> Or in fact just adding CNTx_CTL_ENABLE in the if directly.
We want to check that both are set.

So this should be :-
#define CNTx_CTL_IS_PENDING(reg) ( (READ_SYSREG(reg) & (CNTx_CTL_PENDING | CNTx_CTL_ENABLE)) ==
(CNTx_CTL_PENDING | CNTx_CTL_ENABLE) )

Let me know if you agree. I will prefer using a macro rather putting this in 'if' condition as it might make readability difficult.

- Ayan
  

>
>> +    bool timer_cond_el2 = (READ_SYSREG(CNTHP_CTL_EL2) & timer_en_mask) ==
>> +        timer_en_mask ? true : false;
> ? True:false is redundant here and not needed.
>
>> +    bool timer_cond_el0 = (READ_SYSREG(CNTP_CTL_EL0) & timer_en_mask) ==
>> +        timer_en_mask ? true : false;
> Same here
>
>> +
>> +    if ( irq == (timer_irq[TIMER_HYP_PPI]) && timer_cond_el2 )
>>      {
>>          perfc_incr(hyp_timer_irqs);
>>          /* Signal the generic timer code to do its work */
>> @@ -232,8 +237,7 @@ static void timer_interrupt(int irq, void *dev_id, struct cpu_user_regs *regs)
>>          WRITE_SYSREG(0, CNTHP_CTL_EL2);
>>      }
>>
>> -    if ( irq == (timer_irq[TIMER_PHYS_NONSECURE_PPI]) &&
>> -         READ_SYSREG(CNTP_CTL_EL0) & CNTx_CTL_PENDING )
>> +    if ( irq == (timer_irq[TIMER_PHYS_NONSECURE_PPI]) && timer_cond_el0 )
>>      {
>>          perfc_incr(phys_timer_irqs);
>>          /* Signal the generic timer code to do its work */
>> -- 
>> 2.17.1
>>
> Cheers
> Bertrand

