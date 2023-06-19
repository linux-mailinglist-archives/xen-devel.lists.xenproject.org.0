Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B12734CF8
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 10:03:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550843.860023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qB9ql-0005ao-Iu; Mon, 19 Jun 2023 08:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550843.860023; Mon, 19 Jun 2023 08:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qB9ql-0005Xq-FX; Mon, 19 Jun 2023 08:02:59 +0000
Received: by outflank-mailman (input) for mailman id 550843;
 Mon, 19 Jun 2023 08:02:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qB9qk-0005Ru-1O
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 08:02:58 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe13::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2d90311-0e77-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 10:02:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9425.eurprd04.prod.outlook.com (2603:10a6:10:36b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 08:02:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 08:02:53 +0000
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
X-Inumbo-ID: b2d90311-0e77-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNL2bOaaJDy+6bkDR2GgYizsVwZB02My2SsxsIvnd5J3qusT1J4mOJZlVEooDvf0OSoL/gi8ZW8MiajpN3zgNTGKOJSY1hEV7BlepWnpXa3oEF5yTsnWx2E33Ns+GaVMoef/fyDtedYV84ueR6LIG975AbTs4NCBu0NvYvgkWTFHl4kbvtgXsVsCwyqpE4x4wesUNLtnZ8dEMgtMNSyBFIY7okIsWa3KSUh2mpZhXmdP0za3GFbfBy6rLtySBcuEyRZczD9gmyZHBHm7BmkcI/EcEZceqD96LvAvNA+VAw8CqdGopWaGUdNM5a7IE9I7XRYSadWDeTtauhvPL5PRbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFLs2u+MvIE0Y53QNtOLCyCeJWpX9UpW9vCkROIod50=;
 b=cz42zEgHlDj0gND76CMvQhNRcTEuXeK/ycJ52VlTE20QEdUbicuI5dWNRzHcs6uLUPe2BmduuI+Kq0dd9+4Xh3wYQWqpVA/bB4mAfs0web9jc0cPWV4oZsSj4jLcWch81OUIRJttCkDfixbIfWgB4utHH7xlNR9rkFOJBCnFCyVhWVGJe1sVIVyYDmMv7yIIijhxA8/HL9KG+7lZ1J4RrX/8Y2f6Q9uNR13z4VQRqyinXja6TqTcSMSIkKBOvIHwKYUoDIVt+/3bX9uKRStCkabzaCaCEp1qx402Xv8NlqI55k/i1rG0X99rmxoc9aRJwfUqUl5+3Tzs7LHWX3wEOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFLs2u+MvIE0Y53QNtOLCyCeJWpX9UpW9vCkROIod50=;
 b=FGQvu3jLP+Oj1XS64qWKXdG3UOjea4Q4dFrCDkFRXMdy1ocnaQ12RU4uJa+fRjxH5HxT+XHKk9/e0meC1NMx41g4cEpkmhjvqDLRfaju+MIvG7ads4IbHut9g5vq5Fk0VXe58cESedqvX7Hu21osboXOqtfnk92o1U2WgqIfKmAfA527w7Fog3PP17sK9SB0Kdp+shKy0HKo9Lj4+MpkbST/517oyY3dASI9O5Ou7qx252P26UBMawmjtzv27N2sywxki8bJW/PEDt9LNxQ2+lLi9qpd+l4YZ5930a2tBOl0+GqXexMqtWL3G7gzUgAGoJVZTpX8TkYT+DGyYWYwfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ab3c7243-d812-c5f5-7c02-e585c6990bd3@suse.com>
Date: Mon, 19 Jun 2023 10:02:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 2/4] xen: Add files needed for minimal ppc64le build
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: tpearson@raptorengineering.com, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1686936278.git.sanastasio@raptorengineering.com>
 <97a72e26edafb1d7b3a583755f015d04066c1e53.1686936278.git.sanastasio@raptorengineering.com>
 <33c8e11f-c561-3dcf-e08f-0ea19b34f89e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <33c8e11f-c561-3dcf-e08f-0ea19b34f89e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9425:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ddd022a-610b-41c8-31eb-08db709b957d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4BYrPj+zje1D6xQ7r3OIL1vC16haDqFc1ICNT/QK2rQwCMjOSU56XqyM+DJpnkshd2/I9lb2O5TtKiYgWhsqG0y/c3KnxZPz/5M8pvP7htZhCug6y7YKkNPiYfbvaHpONRmbyLcdoADH4WzUg6MGT0bG20hy81Zdw4SHAnhzUoMnD5dDu/UlRPQTROOTXmArLLnvPFfRvHOSU5gxlH2B+m/wgm/soc9tZIwFzjPzKPhLgGpMdOV+hbeLk/abra8C2mtAKJySmbbAJuLCoNDSJGrn58qD67Idev/z0Kh9wplbd8L0WJ3K0QRFIJHkmEL26RKkG2BTc5j6Bhh6M0nyXqxVeCpPxzx6wYg/FadqnsXMc1nU+/5MEqgDreV1on9+GsiS7IpiilnITgWXfH2Ne98RYZkSu0ioudH02BPcql2f3m3jjdgA58Dj8gjCYSIzu9u0Wzry/PPI/mBgHJnTplA3koZyJX97rCcqmrfgi4Q4iZpdwPaZ3Gw32tXRU7eiUbduLDz7Hh2+0qsi2x8Ts5MCaHStZmqu60tWLvW94eWPuPi2JPGUb4QyoBjQGlmz4II/RNFiFGo9ZWQDLGjWS3bP97DtAZ7NtEZYNhFT+y/rK2n0Jza2ILrsOnlZ16DlaI/pKWHN9zA7RRNAGo6mIg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199021)(478600001)(31696002)(86362001)(6486002)(316002)(38100700002)(66946007)(4326008)(66476007)(66556008)(6916009)(26005)(6506007)(6512007)(53546011)(186003)(54906003)(31686004)(2616005)(41300700001)(5660300002)(8676002)(8936002)(2906002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YktaZHBzWTNCT2NWdlBFbXpkL01QcGZzRWp5ZVh4Q2JQMFppR1VBZWpLR0tL?=
 =?utf-8?B?Slp6U2FnUy8zY0JMazR2YkhOYXBOajgwT0FHR2cwZG5VSHJUNWk0K1JPTXZx?=
 =?utf-8?B?Z2pFMkt6T0ZCemdmVDdtcWZoNE5HMFlYcGNEL3NmMlloV0dxSG9ZTyttcDhS?=
 =?utf-8?B?MGFmK09XNVhENEZFRUhncFBhVmhrZERZMFMxZExaZ3lRbzUrU21KNzV5a0Uy?=
 =?utf-8?B?Zk5hTWlLMW9PR3BKRXlLYzJyNSs1dW9xMTJtUzdqM0JrMjFRRGUybGN2RUNP?=
 =?utf-8?B?UnZrbWdha1Fkc0txRGlka3N5SFFkZFVjT0NBZVNtZ1pZRmNRVkpUbkM4aUNN?=
 =?utf-8?B?LzZRcUNXUUVhR29CMURGQit3clhUaUxvVjlJVUQyZHFsWDRvVk5RVWxRMXNH?=
 =?utf-8?B?ZGQyZnk2WUhwaHhNTEF3TWxza2VBZXJoRkRMQVpMSkxsWTd4Y3Jwc0F1R3dx?=
 =?utf-8?B?aHcvdEorc0QyN3NtVUN3a1diLytXdDI2S2hlVXliUmszT2l4dHU1YjlFbGRs?=
 =?utf-8?B?enUzVVRub3I4aFc3Nkl2WEJpOWR4MjZsa1hTRHVIdXFGTGlVU0JXenZlcVF1?=
 =?utf-8?B?a1cvTzgxTmxMcGd4RkdkZ3dhVFl5WTNHckVLNzBkWHJ3a2lvSk5OblJyL2Vh?=
 =?utf-8?B?TEdWSXZTNzJUMU9QbDZTNlBpbzZDV2UvUXpIUXVSMDBodUtLaVI1Uk1iOTJ5?=
 =?utf-8?B?anphYU9DS0cvMFkyb1MrTmVHTnh6cmNUcHYzRTBZeGlkNUFFZTQ5dFJ2dDBD?=
 =?utf-8?B?N1ZmTk9sUGZ6MG1sQSsyUm9ZVUpzYkhKMUNPaG00d1EzYVFLT1MwZDZGUTFX?=
 =?utf-8?B?ZG1STDIzTDN6bnRLdVJocS9jU3hCelJSQnV1M0lvR1h3aXVUcXczOWdaTmYr?=
 =?utf-8?B?VzVXamUvaWQ3TE81cnRCWkVXdkZkSktvOFpwTG5CaHdoSGtUeUR6VHJYaTdS?=
 =?utf-8?B?UUF6V2JDVjExZWtOVkN3UHNaWm9vK1o2di96T0NIVTk5RmtmZG9SSUpIOEtT?=
 =?utf-8?B?MmJIVTd0eUNyRmhWLzhnYWJMN1FBMHBIbEJlVi9zTmxVZkpBbFdyZTF0Vjgz?=
 =?utf-8?B?aGV2YWxMb0JyV0xaa1FvWXNXRFZOZzB2ZytjbGt3ZlpJMDJkSDIwVlpwYnpt?=
 =?utf-8?B?eWZ4a1cxaWhiS3dBL240WWwwU1daT1RIeWNrcXFNMXBpSkFVSE9HVUVMRGtq?=
 =?utf-8?B?RFNFTWcwa0FuYzhCTUJaWnhCZGNOVEpsWG8rdm9JRG5aM2svNVdUUFlWSTFB?=
 =?utf-8?B?a2tXc25OYnpZbEpuUTl0K1hmTDNUUzg5b0FWWXhGV2dlUzlZcCtRaHZJUXZq?=
 =?utf-8?B?dk9rekk1WlBZWmcxU1JZVFVYMTY5NFNIa3RtYng2eEUyUG9mKzBwZmtlUWtR?=
 =?utf-8?B?VzYyaXlZWnZ2UlplYkoxZ2RUUngxUlpZZ1F0VkZpOUtrYlpJaG4vVk5Pc2hm?=
 =?utf-8?B?aWVqbEluWGk0Q2xJWEtITkl3eFVSV085RzVkY3BrZWtiY1FMTkpMRldpd2Rj?=
 =?utf-8?B?VGxUZ0NJdTFoaDY1c0c5ZlFlZFUwRlBRWnlUTFZhMGVGTUliS0VaM2p4cmcz?=
 =?utf-8?B?eWdlaDB2elgzZ01RRXlCTk5IbGNkeVBacWxieUR4bTFXUU8yeGdnT1JXTkhz?=
 =?utf-8?B?OHRObTQwT01KZDJjQ0t3cXBvczVlVUY2Q2xUYU9PYnBnalRjQVRpNUNFTjdS?=
 =?utf-8?B?RTg1SXlmVFM3ZG1mbkVzYUdTWmsvRVlDWFNBbGJtYmlyMUpwcUNKT3lDNmxC?=
 =?utf-8?B?R0dHUXB6d3FFM25CQmlaNGU1YnVmUjY4SzVKVFNmcm1kWnpmRUdiNGhUZDVp?=
 =?utf-8?B?MTdxYXl6OHZpYjk2M2kvRXVBU1NyNGJlcVlGMmN4VXdqTUdMQ3ZkbXpZYXNK?=
 =?utf-8?B?NXI5YmllSm5UK1NUWTluMWVub0R2TFpnOUJYNTdjLzAxR3BBWjFRL05qcHVD?=
 =?utf-8?B?L0dDbHI2RjBjMjVyZlZwQVFBbGxoNnpiZjlWc2hobzVNY1FaV1puZ3ZkK0Ny?=
 =?utf-8?B?S2YzUk9iY3FYUEIwKytuaVFyQk1yWjlEK01TcEpBTk5PQ2ZlcUg0QncwRnRt?=
 =?utf-8?B?VEEwTVZFYm5FaDhzVWF2WGdKd2ZqOXFRMklSR1BXcFh3bk1TMGVCVHZ1M0Ev?=
 =?utf-8?Q?OFfa1dZbAWxDvtTH3ENWVi+I8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ddd022a-610b-41c8-31eb-08db709b957d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 08:02:53.4422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pOj8otKzq/cghGC076DNbydHmTBpJBJdBpwdSmAFci7BkmO6OULB3bWqR/3iyEmo7PRFPYmg7MOK/ilrjQWa8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9425

On 16.06.2023 22:27, Andrew Cooper wrote:
> On 16/06/2023 6:48 pm, Shawn Anastasio wrote:
>> diff --git a/xen/arch/ppc/ppc64/head.S b/xen/arch/ppc/ppc64/head.S
>> new file mode 100644
>> index 0000000000..0b289c713a
>> --- /dev/null
>> +++ b/xen/arch/ppc/ppc64/head.S
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +.section .text.header, "ax", %progbits
>> +
>> +ENTRY(start)
>> +    /*
>> +     * Depending on how we were booted, the CPU could be running in either
>> +     * Little Endian or Big Endian mode. The following trampoline from Linux
>> +     * cleverly uses an instruction that encodes to a NOP if the CPU's
>> +     * endianness matches the assumption of the assembler (LE, in our case)
>> +     * or a branch to code that performs the endian switch in the other case.
>> +     */
> 
> Sorry, I also meant to ask.  How prevalent is Big Endian in practice in
> the Power world?
> 
> It's another area (like 4k pages) where I expect there to be plenty of
> fun to be had with the codebase.

Why? I'd expect "fun" if ppc was meaning to run in big-endian mode.

Jan

