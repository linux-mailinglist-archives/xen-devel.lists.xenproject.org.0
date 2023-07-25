Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CD0761C0A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 16:42:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569741.890758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJEL-0007iY-FT; Tue, 25 Jul 2023 14:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569741.890758; Tue, 25 Jul 2023 14:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJEL-0007gE-Ck; Tue, 25 Jul 2023 14:41:41 +0000
Received: by outflank-mailman (input) for mailman id 569741;
 Tue, 25 Jul 2023 14:41:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nivo=DL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOJEK-0007g6-3z
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 14:41:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7d00::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bc8052d-2af9-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 16:41:37 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB9904.eurprd04.prod.outlook.com (2603:10a6:150:119::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Tue, 25 Jul
 2023 14:41:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 14:41:32 +0000
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
X-Inumbo-ID: 5bc8052d-2af9-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLXB+vOFOxSjtCmvfF+kzlyBaKOQX8fr0Lv3cyLCuldBKMtaUyku1Gwl4c6dvNl2bfczEi7JMXLrtYt1ygGN66glj3IoHhr1a4ugW/Dd6YUJHP/X50Cwtdxdi6ks8aonPS9WyjrpS0GuUcXyEkpj+HeC8gxRBpBYI9Z4ZMYs+7POtVHj+eMAgcRcg0LfNuQg/Qt4GTT2RklT6ks4c1I5XscOHlpq1vxK7wae392roVZoTOlRgfsje9AWkxEQMNssjCBHxQPox3k/WRqlpgZKcncDed3prRaOKkgFpThisMs5PpugeQQQodZQRjM8E3v6dP/6bZaLCyPy9PMkuIW4QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fCKgd6sLYBCLQCXDyjAJHBrOzBlbkU4oitvYVu7UgE=;
 b=Yo7uN+u+9ztZy1Vykf3Iv28ufvHjfJqJKM/T+q582iYP2Pdgv8wuiDJu4yiVNMgdXGJqHCXQLp78liz+HSFDP7aXJawhKJkgMvnShmx7jnqTIPjRgBWEC7KEHF0kQb6l7wXTLEcsu96Rx5iOE4J0UcnYu3Jt+KMv/mxmlMZIPvz+NA+4xfuii8iPrjZa87l9FavG/mpdxSTTUw/uL4rF3/2ymgMXUy9hgGaE4rPjGFggxwQXlm4//kJ10iTIjtPcI9/7PKPcG6K+8lnax0bLF3bmqv+GDUcF1OvFhimizpV4E6FMSiGFxIET97LAxvhqmJZUdUKMi8JWioozF1qvrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fCKgd6sLYBCLQCXDyjAJHBrOzBlbkU4oitvYVu7UgE=;
 b=468j5D92J/Rj2JAccocy3NU1DKFYhj4jYgRNDV1RYordtIdL43w2BUJLw3PJOVKng6K6oT1KcAKQK81GBdCKdT7FC0OVu8uxOlnUGYhlGHKATuQGtXSixDwmxM0bRMR+15l0I0upjD/ALLOvRoQ3AtE0jzgx3SQ0uxWUVWTZg/GZ/GOKdSOuhP8FZewbENU8hdW0bK1VR/FhEO4ZSRCDhDMFiwr0AaIhVnezWQP4ytgWWSxUNlLpu4IX6RpJIX/HGmgXUs7yMoORpvvi72alFyUDEXV4LSImsVqsNyVZ57Rdr5/YyOXoosDGkWkjogC0AdGa2B/cnEcHLVInjFcHrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <50ae6411-704c-60fa-e61b-0800f3a346c4@suse.com>
Date: Tue, 25 Jul 2023 16:41:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/5] x86/ioapic: RTE modifications must use
 ioapic_write_entry
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230718124334.36548-1-roger.pau@citrix.com>
 <20230718124334.36548-3-roger.pau@citrix.com>
 <1bc67bb2-9b01-eb18-eb6a-741067a9b35c@suse.com>
 <ZL_Oh6S8mbNan-s-@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZL_Oh6S8mbNan-s-@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB9904:EE_
X-MS-Office365-Filtering-Correlation-Id: 5705a109-0693-4161-3637-08db8d1d3d4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GKbNNLsYK7No1f/50uuAqXrvb7A4K/nOvKNnRpUuryjco5jjlvYO1e70QuEUMFxIABe7RcxYes2K8Wz/+81x+OeHVSfkJYqEJD+W1P8SzicnYE1ShjskQ8nRsE2YH8aNrHnNEFPfyX/FeKhMmq4cY0UTMkz5llRqVjN2Jtsg8rvs/A4d2H22nR5dp+A6Nu6LR6KYKIK04Q1N1yYjdiZK+xSR9Y2JVDXIaJ1qKXvV3BC6ksiaR4LO2knnBPbuOoQYA+7STInCDNeJSa/UmjftKrSyfIRIrGnmQPyGenVSgK6Qu/DtUtWB25FzFJ31AV5e+aKqWblcTNWnE1oWRwZ9rr5WNNSIe87mTwrTtbcu+2NRh04QF01zVRzG8WNRkVpYMWop9v43298aOPnHL5CDVFnRXdSNDWb1nOOdeQhZrcoywQnzyTu/4yA/GverhBWlxN3bQDF3qVaox2quIBUMehKY49VWnamoQW+syzmQSAmvnsGr051nODk5Q/ltf/G9R8LnpFIzeqy2gGrCBqz1FGYsB426c24uzBkvKKJb0LuT+KdepI+4b5SxXdrwRJhAUkTUZ6gO13YbqUF4nRfSUP1zr1qbpiZwo6wjgh7W9UeFBYW/2qZe2azwHtLPcMUblwCslF7r2dt6kd2anxYghA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(396003)(39860400002)(136003)(346002)(451199021)(6512007)(6486002)(54906003)(478600001)(186003)(53546011)(2616005)(6506007)(26005)(2906002)(41300700001)(66556008)(66946007)(5660300002)(8936002)(8676002)(4326008)(66476007)(6916009)(316002)(38100700002)(36756003)(86362001)(31696002)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXdwQ1BoNUZsTXh1d0pkcW1xbXF5dWhUNjhJNEdndDQ0VUJEdzRZUlYyM2N6?=
 =?utf-8?B?Mmsrd01NTzFySCtWTTFxejZKcnZmSDl0dHRiRnVjWHMwM0d1VXd6R3lORktz?=
 =?utf-8?B?S0dIY2F5WXkyOUNOQjJiMjhlMzg5RUFBcXRVZWtXUWY0WHh3UjIvR243ZVFs?=
 =?utf-8?B?ZUxWcWZUMWp5amh2bWFqbGppSDloWjBWbjRGOWZ5MjdLaTMxb1pxY2tZYkFp?=
 =?utf-8?B?YnVzSnBTSTBOdzFxeHJ4cUJhWDZmMkJLVENzeUdlREVXOEQvT1VkbU1xYitT?=
 =?utf-8?B?TDF3czFZNU5qUkQ5ZVpKelVuWU4wdGd2TlZ0VEFtZElWRHpsVkhyL3hrRWR3?=
 =?utf-8?B?eHlWSjloR3NwVkxCbm00aGRqY1doaDlkQjN1MHp4M1YzNDhabHFTY09DSjdT?=
 =?utf-8?B?SW80K2d3bzZGcWNqMFNPUGFkUm00UlR2ZkN4MnM5ejlhQkZMSE85Z20xbWN1?=
 =?utf-8?B?Z3B4VkN3Wmg2YjVDSEhldWdLMjZQSGRicGlYYkRENzRNOXFyZGFMN2I2VEZT?=
 =?utf-8?B?T2NrS0lTUWhWU0xGQkJkQ2hNcVJKV3BIcWU0SnZHdmtOQTZrRmFNZW91aUxC?=
 =?utf-8?B?aWlhSjFFMG5BRnhMcW45STVIN2o1UUdoVEtOQTJMSzAxOVhuVExpelp6Z3RW?=
 =?utf-8?B?QWhSYkEvVzR3aDI2Q3loSnRyRTY5S1g0L09McGwxc3luUUhLdm5KZEc2WnNW?=
 =?utf-8?B?SE5HRTlEMGMvL1JHVG45cVlzUWtKcG5pNXRhMkt6S1FyYkxidVEvdTBFa0VN?=
 =?utf-8?B?R3ZIZm1HL2I2TW42ZjFkcVRXQm91ZU5NUUFMd3R6R0JsZG9qNCttcmw0anZn?=
 =?utf-8?B?bDhSQ3pVV05pdHhyRWorcHBMYWJSVE4vNDB6WmlGYU9YZUg5Ym9lMDVVN1di?=
 =?utf-8?B?bHNkcDdZNmRvbWFTRm5ueEUwNHZHa2pPL24vRTR2SXN0YlhMVU9VZTlTZnY4?=
 =?utf-8?B?Y1U5L1JFK2Y4OU9EWlNGZWhzZzkxUmtrTk1zcG1UeHg5MGYxRjlLRFVCNkNk?=
 =?utf-8?B?d1lnRzRna0w2bElPWFFFbW1YTzdYM012cjNUSHloamxiNjM4c1ZBbWt4VS8y?=
 =?utf-8?B?MWNzcEMvTmk0cnFSeHlKc2tQLy9Jb0tGa1dVVEY0Tnc3VDJocHplbnZYRUEz?=
 =?utf-8?B?NllCUTBsakY1R29HSmhsM2daaFNHazgrYTFJN2NRczlSOVBXaDFBUlVkMTRN?=
 =?utf-8?B?YnZuY0FsRHZGMXVDSGJBb0M4eG1SYXhtZnlDM2lMcksydWhyL09GMmpxanBx?=
 =?utf-8?B?alhnMDlQS2Qva3ZjTDNlL0YxOGRYYnB0cE4wTGhKVjhTNmU1aEZwU3Q5aWVE?=
 =?utf-8?B?S1dmd0U3QktGbXlnMXlQUm11eDBCT3BBdmZhTkQyRzgrUEVVS0FNSzFUSTUz?=
 =?utf-8?B?cGJzOVFWMUVadk9NMTRWMzNIeVZFR3M0Wkx5YWNlaFBVOSs1WHlkUEptSFFB?=
 =?utf-8?B?SzJFQUJ4VWtNWlc4a2l5UEdHYVJSMTFleG9vcGRsMzRxQmh1QXZURGw3SDlP?=
 =?utf-8?B?Zzd0RGQ4Z3FzZWFWYko1VDR0TmFHdDhkWG1pSzVvUFovWUZVQlVpcmlHZTB3?=
 =?utf-8?B?MzJuZFIvcG5qenV4c2xwd2cwVG01SGt3S1BscW5xOEpjRGxXSmx4WW1nU2Jr?=
 =?utf-8?B?NWdFOUNkS2ZjZTBhQmtrZ21abFAzcDhSUUMzZUs4RXJUMUNzd2tFKzN0cCsx?=
 =?utf-8?B?UnF4RFVaUGpxczJ2SmV4RTk2eUtMY29ybHR4VkdIeXZXeTBhZE54QkpqeWNY?=
 =?utf-8?B?RlE5NXhxVkMwRVc5dnYzOEQ5KzYwdFpLK09Hbm9reVNTSTROTXJVVFdGeUdt?=
 =?utf-8?B?Q1EzbnVodDZhSnltdXhCQ29XU0theEhiODk3K0wyT01KazZHUVJkUm5FcmEz?=
 =?utf-8?B?Y0szYVBWNVJnMEUwUVhTZCtkalcxUnlPczg2clBMYzg4VDU4UzBGdkNtWFEr?=
 =?utf-8?B?WmFYdGZtWXYrOTJ6RzNSQzlobXI1bm9tUStzWTlQcTFnaVppbGR1aDdYV25H?=
 =?utf-8?B?RXd3M0RZZFMvWmJ1R28zQUZJTjQ1dGRCZi9Ja0FjemdlUVc2RGlKU0NUKzFi?=
 =?utf-8?B?TFQyNFFKUExVdG55aXFWL0lTakxNbTU2SFY3Q1hHamJuMFd3YlZvRUpUb2Za?=
 =?utf-8?Q?enG+eAkeYLCK8D5Dar8Pjcp2L?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5705a109-0693-4161-3637-08db8d1d3d4b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 14:41:32.6364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uobWFCQyYFwXuhptsvQLhCttRrdVTv0U8/3IFYhQhG8urFguAHKhfmpgrZlxZKZueabHSZOeUN9oPn8MhUiQ/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9904

On 25.07.2023 15:30, Roger Pau Monné wrote:
> On Tue, Jul 18, 2023 at 05:40:18PM +0200, Jan Beulich wrote:
>> On 18.07.2023 14:43, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/io_apic.c
>>> +++ b/xen/arch/x86/io_apic.c
>>> @@ -584,16 +585,16 @@ set_ioapic_affinity_irq(struct irq_desc *desc, const cpumask_t *mask)
>>>              dest = SET_APIC_LOGICAL_ID(dest);
>>>          entry = irq_2_pin + irq;
>>>          for (;;) {
>>> -            unsigned int data;
>>> +            struct IO_APIC_route_entry rte;
>>> +
>>>              pin = entry->pin;
>>>              if (pin == -1)
>>>                  break;
>>>  
>>> -            io_apic_write(entry->apic, 0x10 + 1 + pin*2, dest);
>>> -            data = io_apic_read(entry->apic, 0x10 + pin*2);
>>> -            data &= ~IO_APIC_REDIR_VECTOR_MASK;
>>> -            data |= MASK_INSR(desc->arch.vector, IO_APIC_REDIR_VECTOR_MASK);
>>> -            io_apic_modify(entry->apic, 0x10 + pin*2, data);
>>> +            rte = __ioapic_read_entry(entry->apic, pin, false);
>>> +            rte.dest.dest32 = dest;
>>> +            rte.vector = desc->arch.vector;
>>> +            __ioapic_write_entry(entry->apic, pin, false, rte);
>>
>> ... this makes me wonder whether there shouldn't be an
>> __ioapic_modify_entry() capable of suppressing one of the two
>> writes (but still being handed the full RTE).
> 
> I've wondered about this, and I'm not sure how often can one of the
> two writes be suppressed here, as we modify both the low (for the
> vector) and the high part of the RTE (for the destination).  It's
> unlikely that the same vector could be used on both destinations, and
> IMO such case doesn't warrant the introduction of the extra logic
> required in order to suppress one of the writes.
> 
> Am I overlooking something?

Oh, no, that was me seeing the io_apic_modify() without paying attention
to the earlier io_apic_write() (both in the code you replace).

Jan

