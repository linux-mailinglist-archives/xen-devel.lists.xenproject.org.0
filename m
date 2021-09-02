Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6B33FED44
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 13:56:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177266.322605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLlJy-0006ZM-LA; Thu, 02 Sep 2021 11:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177266.322605; Thu, 02 Sep 2021 11:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLlJy-0006XL-Gq; Thu, 02 Sep 2021 11:55:54 +0000
Received: by outflank-mailman (input) for mailman id 177266;
 Thu, 02 Sep 2021 11:55:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K8X1=NY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLlJx-0006XF-4F
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 11:55:53 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8275c86-0be4-11ec-ae59-12813bfff9fa;
 Thu, 02 Sep 2021 11:55:51 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-RYp2SUa4Ou-VaJC3qdMmzA-1; Thu, 02 Sep 2021 13:55:50 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2957.eurprd04.prod.outlook.com (2603:10a6:802:4::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Thu, 2 Sep
 2021 11:55:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 11:55:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0175.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 11:55:47 +0000
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
X-Inumbo-ID: b8275c86-0be4-11ec-ae59-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630583751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=418HGwJdiDk5kaVjZbCAcJQlFgBBx59CLraGTj8kY8c=;
	b=O4o1b04w8Scij33BkNOESN6cWKf9fTcu6WIVZer4PBC9ypjhbGxONSvEctwhztHVsvT8Jf
	PEMxT0ECM/Ib9aCr1gsV62T8xVlZNv53AJj5Fakbq5mR0OBICXnZZsWvcExv4mgtjqWmL8
	TOtvfKS2f3Xpc/Rke+7ZeBPMAapJk/8=
X-MC-Unique: RYp2SUa4Ou-VaJC3qdMmzA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFGRxR7iaqRPWBLUmJ5rm3tv8OOSUL5kCbziQHwnDLcgFFsOhRIus7T2K9jfZzdDbbNPk8BLE7uBXcCbcOT5v2Fd3yvpF4w6EkGEL31Fke5AqYOd3YarUOlHcTE5v049AOK9cqLVGhVOOZzGYFknvwmbFTJyg618n6SV+gtjD3aXhDz0Tm3/pbDu+zL88RKmyxF3WOUubxnMaIrm048E2bZCR7ugCg4PgjlmnREnctsjpVgdFPQr3x1HFRc09slFS35QjbDro+hjaJQkvYfxuLP88Jm1oXo66AvM1qxohC55Fo8oz/4a0yiKGvO3MtlWml5i79Wi0+sWijqgabuysQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=418HGwJdiDk5kaVjZbCAcJQlFgBBx59CLraGTj8kY8c=;
 b=RkTumLLJ/5Gwjhl6PpE3OZL2+P1ex7wrU+hsi/Kle2d6nNw//5sSwGvr+L8UUjmTNRToeoa/D5BrfdKwwWnORzimetg5Lmhx7+z97+/0iv5UxLzTY62W+oRr0bhZ3ed06vCgu+cWwhuNr0VQNhRdX0Y+yzYkk87lfnahkkd/42hs65TSHVQjM4/fFaHm1al6oounc1nLi/xD46DhIJuo5AveBaD7AmhlXvab4oNsQDyedA0EQS/1SkxSHtj0vvEgTdRtz2MOPhp2DvGecwkhausvSIMCw/kLXP5Md9Y/TWB/hRPGmMD7wZkEn009M1g+IWEqKbI5bmucIrpwxrM9/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=suse.com;
Subject: Re: vcpu_show_execution_state() difference between Arm and x86
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <85dc06ff-04df-2148-81c5-26bd25d1142f@suse.com>
 <8f295eeb-e8f2-a115-3f83-60922d0fe5f9@xen.org>
 <00457189-6ab5-24e4-b2ec-1050ebec67eb@suse.com>
 <ed59ccdc-5ac0-3b9a-eb4c-33499a316a34@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cd73d34a-5517-d608-bad2-1d06dfdd6900@suse.com>
Date: Thu, 2 Sep 2021 13:55:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <ed59ccdc-5ac0-3b9a-eb4c-33499a316a34@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0175.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4b381b0-ea66-45ae-9969-08d96e089a4f
X-MS-TrafficTypeDiagnostic: VI1PR04MB2957:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2957A826083E424892D20EADB3CE9@VI1PR04MB2957.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	36UspjKN61wDRsP5MhevNPA13Fytw4OlwbhzrQhHOHoEelmsYTi4wV470Rj0A/maTgHB+JaO98SFarzANhclKEGn10BZ2s+SNeC5GWWUsQpeDynZk54/kVxZtWt6/rJuwZ4Nr8xmDWdImzZjSdpuumSTGiT3LgLyDevAVXJQW0BflnVnvHRGlFTyQIKWcdoRa34Kdh0F9E3oIH4VUkcZdHnJychzgJAWE5JY2kMyHJsyBIp8xpUAL2kUCT0VnXToKcgEjLwDtSiOvpBSbXu3svsqiF6E8sHT20ODZeIS1YYxlCGma5imJxM0YwSt7B08CrPJ6BkDw+m+2illOGgh39TbK7sbEBaM4eq/uphccxWYgIphZzcSUX9BCAlMSHQVWSg+yWeCR4wfWHRwrMtfw1kJa68rBGXLUXO0k8b5DWoNYrdb1oAgmWOBotAKo7mHoOHj8UW+Yex0ey8O4YZ9K1IHQ55kPCMa3VOGcfuQnIx4FtB3IpS8DErDm7X6Nuv2nHq9Ou7xSyJdlYrCndoVvmTYljc59aoD+oIXfg41DalCd9uVG9YUeeVUej5KCVw2IY1YuiuyAt3R5pzCGwzOTfSlE2DUa74vEy9WP7GoZ+T9ub37fdJm02YV6EZbbSSmiYBL5/99qNZQOGC/FEqyQJtiyWJkwv4U/1Mse9snS+vdRm3HNJCHTyy/qgZM9G8wwrM4mpwAU4V91XR+qjVT4/LfHXOMv3Y4M/0ApwoPvIE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(38100700002)(6486002)(8676002)(31686004)(66946007)(8936002)(4326008)(26005)(186003)(66476007)(66556008)(53546011)(86362001)(5660300002)(83380400001)(508600001)(16576012)(316002)(6916009)(956004)(36756003)(2616005)(31696002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWczWklPSExhMEQyTm84YXFNMFJTalIwU3FPMjJvNU5kalVDWkpzTFlhMGRH?=
 =?utf-8?B?NE9RdklDZnZMUUFEZ1RaRU5lYkdPNGJObmc3Q1k1L0tGTHNIOE1UY1BseUlG?=
 =?utf-8?B?ZXl3Y1dvaS9nOXRvRW02ODBHNmh6MVF2SUVtOFFVcGZqZ0R3Y05oazkvOHkv?=
 =?utf-8?B?eEk2ei9nWjZiRENMWXYzbHdvR3JKWk1VOXVISER3MFZMRnRyY0pmeUtlY1RF?=
 =?utf-8?B?NzB1NDQ0dkZCZnN6WU9GQ3ZweS94WkxENU9OdngyUkRYOGM1UlZibzhBSlJ0?=
 =?utf-8?B?a2hlVnBpby9jbGd2NnJ1RDYwUytzRjkrazVET0dWZ1V1M0ZacmtSQU52d1ZD?=
 =?utf-8?B?ZVFKYXNaRWJqQVFnL29xbTBmRUpPOTlkekI4dEE3OWdrcThKMnVQVFZaclZW?=
 =?utf-8?B?TmlHOFlpb3BXUWpNeVBuS2l4aEsrUmxPRVRZL0F0NjVNOHZPMk5EK2tDQjJG?=
 =?utf-8?B?MlRxZWRvT3VxeWtyR3lmQnpwSkpKd1dQZm5oY1FMUU51OTBMTEVBcGtjM2dm?=
 =?utf-8?B?WCtVVG1oZzJvR1Ird1paaCtQaE5hRGFGdG9lSXpybEhVTjA5Y1J4SS90dnkz?=
 =?utf-8?B?LzRsUlF0OSt2bnFjTmNZUDd4SnBleEFTQUZjbWNaSG85MTErNVFzUDR1Smsx?=
 =?utf-8?B?dlMvcTF0dHRTdVBBR1BrV2xQYkVuK1dGM3hxZlNjQ1MvZGlITFZtSTVmc2Fw?=
 =?utf-8?B?SUp1bmNiTEtIUTl1d2pyZXZoL3NuZGo3bUE2WlkrcjFndjJ0UG1PaXZWdmpm?=
 =?utf-8?B?b25lWXVVRlBUaW9QVXRJUy85L3NvSWd5R0Z4WkxYU1dzWWNDMXgvSlZHSEdl?=
 =?utf-8?B?V1FST2NXWS96RndiN1hhUkVycTdZelIrOTlHOFJvNGlYVWVYVjQ1TVdaRlZB?=
 =?utf-8?B?TkIvTW5ObjVNK1dUYWh1eThtd215ajNzd2xFUnJUcEtkdWNSL05VUVlQYkYx?=
 =?utf-8?B?Q0xQallMUno5ak4vZDFWUzJGajhaMmx0Y3pWUC9nemRnVjFlQXJzd1g3Y3Fy?=
 =?utf-8?B?OTFNdDNKUno4cDJlVU1XNExVdFdIckFFNTFtQ1A0eTQyWjlvRkY3WWtXRFg5?=
 =?utf-8?B?dzN3dWJuemFkWUl0NUFOYk9RS3ViS0oxRE1KUjNzTzNMejBNYmsxQjhHMFRY?=
 =?utf-8?B?S0xuWmhqN0Q2NFJWUHhXQ0lGYTJIc1hBaHdtY3dRdzhsU1R3RndXaXUzcHpQ?=
 =?utf-8?B?a2lHT1dFcTJXMXpWYmVrcHNYWHYvVzVSL1U1MnlndWtxVVF0R1NUZ0NucHVm?=
 =?utf-8?B?NW5XUGxIcm9obE9BUVVhWjE3TXRQNm1VNHptOSt6blF5Y1FpZ1NQc2NzOVRB?=
 =?utf-8?B?bGowN0pBem1LSnZ4RU5LYVExcHQ0K2xZNkIrMUJZL1JCNU1yNmo1WFZNby90?=
 =?utf-8?B?bTVGcmpESkc4cEVZT256cW10cXhjNlRzOUhKd1hLVHJWUTNXNGlBakhWWTJl?=
 =?utf-8?B?ZTNEVmlzWlNQV0x2WnkvTVZidDdrems4Y3FhQkVxU0FjVkZvVnNqeGlVTXlX?=
 =?utf-8?B?MWw3RVg0ZlRKVTloREQyRTNMOWtMN0dxMksxdUpqNy9PaUkyQlVPVHJid3FJ?=
 =?utf-8?B?ZG40NFJ1Q3hRWUEzZGJhTWlBT2hYKzh1NEdOeVpCNGNELzlMSkpwVUZIN3pm?=
 =?utf-8?B?SUJOSTJoajFkWEJiN0RtMFBQV1hyV0xaK0o0RWd2NkgvcVZidVREdjdaZmhJ?=
 =?utf-8?B?NDN4L1BZTUdxd3draHZZdXErSjZsNGxXSWU0b0E0VE5PVWE0OXVXMHRIVVVj?=
 =?utf-8?Q?4k5g4Y07Tmz5Idic8B6TzOTu8SUayNWPfmUAFxp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b381b0-ea66-45ae-9969-08d96e089a4f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 11:55:47.9506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvfWUH1MUpTW2a9121SkwGm4b1y+LTfkMh4i/kyLAplYJKa5vlAbZhHZ+N5ArkjEjmTZljSYvfncpo5Z+4TGPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2957

On 02.09.2021 13:48, Julien Grall wrote:
> On 02/09/2021 07:45, Jan Beulich wrote:
>> On 01.09.2021 20:11, Julien Grall wrote:
>>> I looked at the original commit to find out the reason to use the
>>> console lock. AFAICT, this was to allow console_force_unlock() to work
>>> properly. But it is not entirely clear why we couldn't get a new lock
>>> (with IRQ enabled) that could be forced unlocked in that function.
>>>
>>> Can either you or Andrew clarify it?
>>
>> AIUI any new lock would need to be IRQ-safe as well, as the lock
>> would be on paths taken to output stuff when the system crashed.
> 
> Hmmm... Just to confirm, what you are saying is some of the callers of 
> vcpu_show_execution_state() & co may do it with IRQ-disabled. Is that 
> correct?

No, that's not what I was saying. What I was saying is that crash-
safety requires an IRQ-safe lock, because the approach taken here
should imo match that in show_execution_state(). And _that_
function can be called with IRQs in either state.

> I have tried to play with it on Arm but then I realized that 
> check_lock() is not properly working on Arm because we don't call 
> spin_debug_enable() at boot. :/ So it would make sense why we never saw 
> any issue there...

Oops.

>> Hence it would be pointless to introduce yet another lock when the
>> one we have is already good enough. But I may be missing aspects,
>> in which case I'd have to defer to Andrew.
>>
>>> The other solution I can think off is buffering the output for
>>> show_registers and only print it once at the end. The downside is we may
>>> not get any output if there is an issue in the middle of the dump.
>>
>> Indeed; I'd prefer to avoid that, the more that it may be hard to
>> predict how much output there's going to be.
> 
> And it is not going to work as we couldn't grab the P2M lock with IRQ 
> disabled.
> 
> On Arm, the only problem is going to be the P2M lock for dump the guest 
> trace. A possible controversial approach for Arm is to just not dump the 
> guest stack or move it outside of the new lock and dump when IRQ is 
> enabled (I am not aware of any places where the guest stack will be 
> dumped and we have IRQ disabled).

Well, you could certainly omit the stack dump on Arm. I for one find
it quite useful every now and then. On x86, that is.

Jan


