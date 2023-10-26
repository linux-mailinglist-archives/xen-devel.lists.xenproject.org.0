Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFE37D7F3F
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 11:04:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623611.971612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvwHM-0003ty-RX; Thu, 26 Oct 2023 09:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623611.971612; Thu, 26 Oct 2023 09:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvwHM-0003rg-OV; Thu, 26 Oct 2023 09:03:48 +0000
Received: by outflank-mailman (input) for mailman id 623611;
 Thu, 26 Oct 2023 09:03:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvwHL-0003Vj-Np
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 09:03:47 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9206e7b3-73de-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 11:03:46 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS5PR04MB10041.eurprd04.prod.outlook.com (2603:10a6:20b:67c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.9; Thu, 26 Oct
 2023 09:03:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Thu, 26 Oct 2023
 09:03:44 +0000
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
X-Inumbo-ID: 9206e7b3-73de-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsPwiyJAElC6MgRlJUqO0OS3rznWx/ClUfydfSq2hB/Jyoj4gRtxd2hhFhBcmDWzXsi6blmtt3OxcNue1c3ni4lXVmWZQNnkeAo2kIyqaYBz8+T1FlH7sodC4XASYQOEDk6gK2kZHy3i7798qQS1ghyIjEm8PBE4qGb6ixbobu7ugeJ/jIxe/9aXvdW3duQYbESTa5gIFGUAcatCfmTD1ZOHAWkAPh+3a5+vMkXZG5HAip9fD7xLAq8+3C+KVHgwTtT0HtXnz3e+gpKNgNskEWBbJcf4h8AZb+08zTK9s4ITwHV5UHx6T8L6M7YXh+aY+b4FqViIAcFa+alTnwUA3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5QgYbpBBue3Yadlx/v9/dTlTtBu5H3ZK12TTCvQj+U=;
 b=Gavtsl1gMst1TuUCcHFPd4vB2HESecFf4Rv/j1SNW4zhtEeHvgnX7RrGSks+eQOtAgzFvLuJIeicmDe/8qinQ9I3XXEu70u1NUrp0nBX1tOhz9EVfDZitH/Fwg6Evlki+EECV5VE/1GXdlKpLB2NvHCpVpEQTHXeuXwwyntvW39ZTnPwS7i/1ygKLNedAhQH4fg9FWjBeErTwzL8wvzhm+d+6T9pajRaDypBqIgJHxYSyj/jb9nRmB/BzkP2PUd2O+bH5qf/hhRdxdQSh+hrp+VNFSLYZ6QRytmd88F141jrqMH0ckbQDmvVVFT2Gp2Xgow2R9OWHNU8b7Yez3u/9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5QgYbpBBue3Yadlx/v9/dTlTtBu5H3ZK12TTCvQj+U=;
 b=DV7nyBJofg4nfzw8wR36k3slht9O2z9iRLW5nXKn7ilSUgI2pSbZJBbwfEhd1W3QcUwf+BcDLAWeZyw39gBbo6NmP2BzrvON1cyxxNMdIy3KkUyMpHRbQGILBd2r/lhA74f6PLlOiVwJ1WKRdiCvMiL6hQNQKgbBK5qh73KxSsWWx8Przlr4rCeXWfGoluJfj0a8dKmJVtJreA6TlA94D2y/U9u4i3IGgezM9OXO0QubSACsT7BdUMFVhhJ5F6Rz6xdDxDOEkQu5EDyWiaPogGiG03bT/TuWRf25LWAGNNrfIU1MWLftQJC8cWiA/O3+zvM28RYXk+qXsfCpqT8KJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <86eb1c0d-ac95-247b-16c3-9c4871398082@suse.com>
Date: Thu, 26 Oct 2023 11:03:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 4/7] x86: detect PIC aliasing on ports other than
 0x[2A][01]
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
 <27dd8f40-1ea6-1e7e-49c2-31936a17e9d7@suse.com> <ZToksEP1Fg8MscdK@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZToksEP1Fg8MscdK@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS5PR04MB10041:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f35d3b-1fa7-4c81-2ef2-08dbd60274c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gQnw2blaCWa22FKPqY0qpbyY++yv24s3YuPA+xW2wQw04rqSxB1PyYjILj4OT/B23H2WinDz7G2ej/rgA4yfjxoCUTg9MORVy4GT1+HAzE103Wi6MmEh/cl84iQnjkL/Ebza0ZT7vAAmbE4R8cLb8rIQ9ZsH25Rxh2GWdFqSJucdZJuHYEHVV6E1Y/75ZguuC0/E/CvEK7rl/spdW4aVH3qwCmonpvQVlI6ZKko7ogQ+e5lA2XeqgZBDcnw/+HMHCu9JM+4eJ+kFNAfh4c2hTyNWZybfa6aO8JhlhdCVrH6loCh8ZWXyAk7Y6y4Us624+eMM7J3uDUj/MmaoFosCmX89zFE12FuD2Wg6fRZQSJkyVp3ODeKTE/2CnBioKcpkM2miGo9i2ca6j+zcVFTrbgHhr61HTzwgIMUZgCK3YbUjI2HUH0XGFXVXYLKHEo/HvlOpg9xJC23Jgir19HT2lvrPYTO+lc+DAVM/ec9/DuP5dfG2teJQTkSzHXLXe7Ebzdo/Nd84W5DysuAxmxwFJzb21VQdEVTgThDdwvjv/fn8wtf6LkA8zDqyyk3IyCFACvwuVS3aM4mVCjvnSaXTzfNz3d71ONj8XJmW5V259cyKSRJw5y+ot4MiIHrt4d2CB1MtfMm6+zwdbnCwtyinuw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(376002)(396003)(39860400002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(31686004)(26005)(38100700002)(31696002)(2616005)(6512007)(6506007)(36756003)(86362001)(83380400001)(41300700001)(4326008)(53546011)(5660300002)(478600001)(316002)(66476007)(6916009)(2906002)(8936002)(6486002)(8676002)(66946007)(66556008)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NS9pbnVoMWNhU1BuOUl4cUNRVmtSQnJUd2xhclpQMjAyNDhRd2k1ejB1MElx?=
 =?utf-8?B?dXpqT2E1UEY4dXp4SytQOE9YeEZGTFM4OFIveWtYOExvd1l3b0FyQjZvNm5H?=
 =?utf-8?B?SHFlUjlOM2ZKNi9ObTlMeWNiWHVMMEdwSkp1NEZOTkdNU1QvS1RrNTFGQjVQ?=
 =?utf-8?B?bTMzc3NDemxzcEhnMGQzWlErRDltNk4vcFo2b1JEOTdmZmVpYUJZSkZMUzZp?=
 =?utf-8?B?MWpXSVpVSHBaREc1TTVOeVhmZE4zZk5SNHhmQ2ZQbXBXdEhZaU9ULzdOSTRF?=
 =?utf-8?B?UXMrZyttVWJiOXFtQTdaVnE2R2dXamk3aWRYVXoyUHpzWHdTN2JDR2NCUFNj?=
 =?utf-8?B?Z3lUaWlBY1dzampacExZT2JYaFMrWUkrUUZRVFgrMGtoNG5SY1pIMjVBc1di?=
 =?utf-8?B?ZEdVWjFpMU14SVlSejFZK09CYkViMmlqeDN4Ri9WM01oYlAvWFUrcU0xVFpi?=
 =?utf-8?B?SmE5RGhmRWx5NTJKRXh5T1VBZWtqWENJRnllSWtkM2Y4RDVYZ0xmVklXMi93?=
 =?utf-8?B?RjFpcnhsMFBZYnZuZTNKeFF0cmVocGxnUHU2VzJlSEdQWXJoWWlBMmh3aXBh?=
 =?utf-8?B?VjYweUQrbWJRaE1VKzNSME9SQlQ2WmFGc0ZUZnkzMkFTRDFhejZveEpXZnJP?=
 =?utf-8?B?VVZzTkVwekpKSXppMGkxVGJVdEV2WWRBVElUZDQ2ZW9ITWN3OGE3WithOTN0?=
 =?utf-8?B?ZkpicXVYNTdZZFFiLy9oSjFiYURIRW4rWDBJVnF5VnIrMzdVN01nM1dlV1FI?=
 =?utf-8?B?K2FUL0NKclgxa0tnWjFmRzk5Q2syeDZ5WVVlVXFGSEtsZ0xnU1lvcDJnT0hm?=
 =?utf-8?B?cjFUZktweTYra1ArbVdvOUZpa1VvTTlYN3hCMHdWTW5JSTVzS1JGeXhaSG9G?=
 =?utf-8?B?TFBOZWRvOU5YV0RraGVsSHVra1pINUl4MC9ObUwzdWVad0lhYm5QZkZ2NzhQ?=
 =?utf-8?B?VDNYQkEvaUFpUnA1SjBCdnIyZFZlMDlZcGVhZjR2bUx5WDBDRFU1SG9QR1dI?=
 =?utf-8?B?S0NuY1Z3RWVJdmFkOExLOHlzQytuVUZ1aExFanVHZTk2MWQvb1dza3VnS1dB?=
 =?utf-8?B?ZS82WExTVzRxcWl2QUdlbDRSS1Y5cjJ1YlZweWFYZ1hWSWEwazRseWsrUUpq?=
 =?utf-8?B?RFpGRXJXZFRvSEVrK0MxWjVqcmd2TWI3Q2VmWkU2a0NpM2xpSDhmdUNYRXRE?=
 =?utf-8?B?ZXBpMlNITnBLMTNBRjNkWlExdEZ2Y2lpODN2NGIyU1puZ3lwNkZkTDZ1cVIx?=
 =?utf-8?B?dkFHUHE0YytlVkdZdk1IczV5NDRNYU5CVXZkVnNxRnIwUnh2WTMrUDN4NHc1?=
 =?utf-8?B?VnIrS0pjZW5SeFVSOUlIUjR4NXhienBsYjk1eDh6NnVvZ2s3UFNQNDh3ZWI4?=
 =?utf-8?B?RFVBbm91eUUrZWxSeUdRbkh6YUN1SjlVM2pvbUpGM0dQYk02Rll3R3VrNEQ2?=
 =?utf-8?B?SW5PZzB3dVJpS3VhMURTYUhxeWJCTzlYWTJkNm8vVDQzMVo4bFplelFsTml3?=
 =?utf-8?B?VldaVFlpOFlhZXEvSTVGUjVuQkkvNzMyOHFBK2pBRlhIRHJsUmR5aWsrOXhD?=
 =?utf-8?B?dzVrU0YzM0RmNitZV0s2YmMwSUV3L0pIa3JyblhSdncyNVUzeWVKYjhhTDhY?=
 =?utf-8?B?SFlzZmVGS28wZkhQSW9GNjJyQnhHcDlrbGVWMVQvK3I2QjlwYU56MmRBNyta?=
 =?utf-8?B?Tm5BTThqU2NhelBXTHZ3QU5Tc0lmR1J3cXE5d2ZuK1Y5eHVEWGs5SU9nNFFH?=
 =?utf-8?B?d1gxTldGR3grdEFJTmNJZ1dBR1prZmRDUGcyWjZHMlNNV25lejNLb214Q1ZB?=
 =?utf-8?B?RmoxUTdBMlNiNm9YenBIbVdBTWZsZi8vcDRRNkZ4UlY3RU5zNUQ4U0YxSlJs?=
 =?utf-8?B?TXBxUk1MdUg3VVpwaHpRNXBWbFZtMUNGZStuY3dYbFZ4THRzR0ZHZUwrRE9C?=
 =?utf-8?B?dGRnZnhaOWpXMGpzUWlQVzNOWTd5OHVkL1lYaTJZN29mMFJCQ1c3c1IyWWlR?=
 =?utf-8?B?eG9ONWxaZ3ZpckpqMDdjMXd2N3NpSGZNZzdCck9sNGF1VEFvbm1NVmpXdGNN?=
 =?utf-8?B?bkkvOUhra2tNSXlidW94RHNWc25GNnlTOWVKcS9JMEFaWXFJZlFUY0JNNWRD?=
 =?utf-8?Q?7g4b1sGeFicRzQuDSUfd0IxZJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f35d3b-1fa7-4c81-2ef2-08dbd60274c8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 09:03:44.1670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +NHnJuS7BcMnZkddJfFH1pcKAD72x4CbrFgK95FsN0eNdJeo4rb8KfHJWTZ3J+bDRT7mynwFNnUqmR77LgKU1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10041

On 26.10.2023 10:34, Roger Pau Monné wrote:
> On Thu, May 11, 2023 at 02:06:46PM +0200, Jan Beulich wrote:
>> ... in order to also deny Dom0 access through the alias ports. Without
>> this it is only giving the impression of denying access to both PICs.
>> Unlike for CMOS/RTC, do detection very early, to avoid disturbing normal
>> operation later on.
>>
>> Like for CMOS/RTC a fundamental assumption of the probing is that reads
>> from the probed alias port won't have side effects in case it does not
>> alias the respective PIC's one.
> 
> I'm slightly concerned about this probing.
> 
> Also I'm unsure we can fully isolate the hardware domain like this.
> Preventing access to the non-aliased ports is IMO helpful for domains
> to realize the PIT is not available, but in any case such accesses
> shouldn't happen in the first place, as dom0 must be modified to run
> in such mode.

That's true for PV Dom0, but not necessarily for PVH. Plus by denying
access to the aliases we also guard against bugs in Dom0, if some
component thinks there's something else at those ports (as they
indeed were used for other purposes by various vendors).

>> @@ -492,10 +492,17 @@ int __init dom0_setup_permissions(struct
>>  
>>      /* Modify I/O port access permissions. */
>>  
>> -    /* Master Interrupt Controller (PIC). */
>> -    rc |= ioports_deny_access(d, 0x20, 0x21);
>> -    /* Slave Interrupt Controller (PIC). */
>> -    rc |= ioports_deny_access(d, 0xA0, 0xA1);
>> +    for ( offs = 0, i = pic_alias_mask & -pic_alias_mask ?: 2;
>> +          offs <= pic_alias_mask; offs += i )
> 
> I'm a bit lost with this, specifically:
> 
> i = pic_alias_mask & -pic_alias_mask ?: 2
> 
> Which is then used as the increment step in
> 
> offs += i
> 
> I could see the usage of pic_alias_mask & -pic_alias_mask in order to
> find the first offset, but afterwards don't you need to increment at
> single bit left shifts in order to test all possibly set bits in
> pic_alias_mask?

No, the smallest sensible increment is the lowest bit set in
pic_alias_mask. There's specifically no shifting involved here (just
mentioning it because you use the word). E.g. if the aliasing was at
bits 2 and 3 (pic_alias_mask=0x0c), we'd need to deny access to 20/21,
24/25, 28/29, and 2C/2D, i.e. at an increment of 4.

>> --- a/xen/arch/x86/i8259.c
>> +++ b/xen/arch/x86/i8259.c
>> @@ -19,6 +19,7 @@
>>  #include <xen/delay.h>
>>  #include <asm/apic.h>
>>  #include <asm/asm_defns.h>
>> +#include <asm/setup.h>
>>  #include <io_ports.h>
>>  #include <irq_vectors.h>
>>  
>> @@ -332,6 +333,55 @@ void __init make_8259A_irq(unsigned int
>>      irq_to_desc(irq)->handler = &i8259A_irq_type;
>>  }
>>  
>> +unsigned int __initdata pic_alias_mask;
> 
> Should this be __hwdom_initdata?  I see it gets used in an __init
> function, so I guess this all permissions stuff is not really indented
> for a late hardware domain to use?

Late hwdom "inherits" Dom0's permissions (really the permissions of the
two domains are swapped in late_hwdom_init(), leaving Dom0 with no
permissions at all by default).

>> +static void __init probe_pic_alias(void)
>> +{
>> +    unsigned int mask = 0x1e;
>> +    uint8_t val = 0;
>> +
>> +    /*
>> +     * The only properly r/w register is OCW1.  While keeping the master
>> +     * fully masked (thus also masking anything coming through the slave),
>> +     * write all possible 256 values to the slave's base port, and check
>> +     * whether the same value can then be read back through any of the
>> +     * possible alias ports.  Probing just the slave of course builds on the
>> +     * assumption that aliasing is identical for master and slave.
>> +     */
>> +
>> +    outb(0xff, 0x21); /* Fully mask master. */
>> +
>> +    do {
>> +        unsigned int offs;
>> +
>> +        outb(val, 0xa1);
>> +
>> +        /* Try to make sure we're actually having a PIC here. */
>> +        if ( inb(0xa1) != val )
>> +        {
>> +            mask = 0;
>> +            break;
>> +        }
>> +
>> +        for ( offs = mask & -mask; offs <= mask; offs <<= 1 )
>> +        {
>> +            if ( !(mask & offs) )
>> +                continue;
>> +            if ( inb(0xa1 + offs) != val )
>> +                mask &= ~offs;
>> +        }
>> +    } while ( mask && (val += 0x0d) );  /* Arbitrary uneven number. */
>> +
>> +    outb(cached_A1, 0xa1); /* Restore slave IRQ mask. */
>> +    outb(cached_21, 0x21); /* Restore master IRQ mask. */
>> +
>> +    if ( mask )
>> +    {
>> +        dprintk(XENLOG_INFO, "PIC aliasing mask: %02x\n", mask);
>> +        pic_alias_mask = mask;
>> +    }
>> +}
>> +
>>  static struct irqaction __read_mostly cascade = { no_action, "cascade", NULL};
>>  
>>  void __init init_IRQ(void)
>> @@ -342,6 +392,8 @@ void __init init_IRQ(void)
>>  
>>      init_8259A(0);
>>  
>> +    probe_pic_alias();
> 
> Could we use 8259A instead of pic in the function name and mask
> variable?  Just so that it's consistent with how we refer to the PIC
> in other parts of the code.

I can certainly switch, no problem. For the variable it would be i8259A then,
though.

Jan

