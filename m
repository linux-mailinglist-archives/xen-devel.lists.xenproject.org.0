Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72202402358
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 08:21:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180406.327057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNUT8-0004Sk-78; Tue, 07 Sep 2021 06:20:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180406.327057; Tue, 07 Sep 2021 06:20:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNUT8-0004QW-3u; Tue, 07 Sep 2021 06:20:30 +0000
Received: by outflank-mailman (input) for mailman id 180406;
 Tue, 07 Sep 2021 06:20:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNUT6-0004QQ-Qo
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 06:20:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b10da5b4-0fa3-11ec-b0d5-12813bfff9fa;
 Tue, 07 Sep 2021 06:20:27 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-uqOFY_bUNVGWqceMPrDZlQ-1; Tue, 07 Sep 2021 08:20:25 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM8PR04MB8002.eurprd04.prod.outlook.com (2603:10a6:20b:247::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Tue, 7 Sep
 2021 06:20:23 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::ac:a0be:c26c:908b]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::ac:a0be:c26c:908b%5]) with mapi id 15.20.4478.026; Tue, 7 Sep 2021
 06:20:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0082.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.6 via Frontend Transport; Tue, 7 Sep 2021 06:20:23 +0000
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
X-Inumbo-ID: b10da5b4-0fa3-11ec-b0d5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630995626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TSFfFqofenQbMlBfkKFanf9ysGnmn1I9sU3PxpTZ6YM=;
	b=SIszgxswv6zVjENgiiLb2JiRBX8Hr8gEME5U+xuIbY1bSgXHrnBBiLGfn9PersrzGjS0oz
	1XjPeOR9UZr+x/0KkBSWQj1/RQZX4MzEL5z7SKuA5LQYFrXuSgz0TdNIQbCKFKVEqAPS/u
	hsbQJjzieW0CRPxL6vVBstqxPw6cThs=
X-MC-Unique: uqOFY_bUNVGWqceMPrDZlQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTpj4yYzUJYGIZnUY8JOmKpSLkb4CFZSAEteaYSVJJfw5W6a87NlYpB+5CKP9eeng++dJYux5BROo6iXNZv249NLbee233dRCsorY1sTYpc6+4x6sDL2QtAhjYQMdueuL6UvU9Q/vlsDHvOXs9bECVIykE2n4dzO6sDGCdBEoDE1Mp5DqqotERzHz49L5E4BYk1OFI5aK1BFaEY9r4o7RU8wlcnq/ruF7MvC9eUc0C4DXLb9pkVgqHOlJbK0yxqAT8hNNYcFXpvNjoFXK8IBjD1krcLcynidS2BLGAeoago+fkGhyW6G+0LYjsLOuHXzrZtfQFutFjDAFsRYf/J1Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=TSFfFqofenQbMlBfkKFanf9ysGnmn1I9sU3PxpTZ6YM=;
 b=DoZNcrW0AKbLpwpZhBnfeScXCMMbfylW0e0JiTecqpKji29aL0eNqiTp7Gj6vdomVUfPnsGZaSBLMqTB7aY7bAwzI54WQUxRmTi6x+WHEjbOA2SIPTobapef5q4MCbVJfzbNg6KtDKvYuNpb+X7+E3DoYA/rNKZ/aw4J0JgIzdidiEMoo2hegY+sis44o34HEhyys/6SF81oJNfyhXwuSK9b0uDJ8pxHHy2AabrOHOa/tTUtscsqMduUhEac/YmpV2tsz9SB7aVMYP7VGCmgHIt2glMcaQv5ZHqP9DOG6j08/bphzAGExP6cG3j5qfj9c6xJoXIStTNfocIHyahIdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 00/51] xen: Build system improvements, now with
 out-of-tree build!
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <YTY+PNBccQYPhX0a@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ffcd6c45-62df-18a2-74e0-8fc121ad9f6e@suse.com>
Date: Tue, 7 Sep 2021 08:20:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YTY+PNBccQYPhX0a@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::21) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e6a8f8a-ff46-406d-3fdb-08d971c79337
X-MS-TrafficTypeDiagnostic: AM8PR04MB8002:
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB80023D2C8D23DB775C1B30DEB3D39@AM8PR04MB8002.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8nkkzatVohMxafv5zc5UYs4lvChbT6NKCleWNeENzySayD0QTr1glm6ts291ZDOVc6OYmz12HPl6hoBFpzpipjgslU+tPqfl4fPFOn+oNQLmpmSNUDKAMmv6BiPYKB0d9jjm1k27zqu/hRRhQSZj6vdxZSaJbuyFFwmLFM+0WB5JiKBj+umJmr9+bMAHDsIEbGAIYo+GM3/+y4FHnSqfqYiGZhginphavw2GH/kY0fIPPv7f1TPNsTfmED7eU8gjobKM7qIx9KVz5X6/pkSIgn9+FiU2IimfhRXs7Ob3aXRSqL6ku/7WH9pLBsBqHzPkfOTvs13Yyyub9YmsnLZ6U354dUwOzyftZyFsRdE4EQwb4pzSmBf+Mm2GxtWXVE8Kb0E13NTQQn0TYESNVvnwjKZnP42cuGOL9wmK/RVSZ/lQtDEmRfc/IFhKo9cGFBgZe8snZNUGN2XsbE912I3OBU9USb8ci25cALr7ENzkIcOiYO5douZNzu/lu4loyDTtihhi46BEqQxrTWobAtrL0yd88mOfW2obb5qzLNb/VZP0AZ9ghvT5PWwyM4XFgrhPHvRprgKMJpzuJQ2S/oR2+ogURaYLv16TXOEGvQUkkQIpwtx5iKcInwvaWqXf/Pa9lNyN5dQSckzKRshTOjo0GTf9kr3dBINruJIp3vLlWl8RbA7Vq1QS2x7NS7n6eurqdHvk2hjcVHP7Bmn+On9svI1CK2MFWPxaXaZW3TLWvCk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(39860400002)(376002)(366004)(346002)(316002)(4326008)(83380400001)(16576012)(478600001)(5660300002)(6916009)(26005)(66476007)(66556008)(53546011)(66946007)(186003)(31696002)(38100700002)(86362001)(6486002)(2616005)(956004)(36756003)(8936002)(2906002)(31686004)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHNBOFRQVGVUd2Vlc2tPT0JtT29HYjF4U0N4MVlVNlBFbmJxRTBOTDltZFE0?=
 =?utf-8?B?c1JUMmZENy94ZHllK0VnUnM1L0wzdXVFd21CUFhJSlprK3ppUEVTejZNeDVY?=
 =?utf-8?B?Q091bGgwRkdKSmh5cEdwUVhUMUJqTXpjOUxhNUJGeWJKbGJaNHZFY2IreTRR?=
 =?utf-8?B?WEhoV1grUXFBUVhVeG10MVlDQjYyU3QxNGQ1ODQ0U2hrVS9lWVRidURoWlJ4?=
 =?utf-8?B?dkJpS0NjU1R0K0luaHpBbmlFRUkyVjU1Ly9HMjlkZXR5djg5RWtaKzQ1ZGpJ?=
 =?utf-8?B?UGRYdDRvbEZFK2lTOVF1dnFoZWNXbmk1TkhibEZtN2dzWHF2cEkrRjBaWWIx?=
 =?utf-8?B?c2JkbU8reXpQZytnWEozU2Q2UEVHVWFBWEMzZEdESm5yRVFKbGh1QmZQYm1v?=
 =?utf-8?B?VXJzZlJGN09tblVzMHdvd1lqRWRucWpza3BLaHIxRmMvdW1SVU0zYjV6SnZE?=
 =?utf-8?B?VjF1bk1lL0ZDaUEyL1ZlZExYN1VIU0lFNlZ6UTJFbTZMSWtaRmFpNGhNcnpG?=
 =?utf-8?B?cEpvUW52MTVYMERBM3Q4NFdUVjZzanp4bDNSWlF4QS9SMUxOWFZ4SVROcHpm?=
 =?utf-8?B?cEQvMDlSZ0xMYkIyMWVwTTh0RENLTkI2KzQ4QUwyUkNFVDJ4YzN6QlZCVEw4?=
 =?utf-8?B?aFF0cHlhOEdRNkNyWGQwUjFrRFY4S1FxRUdOVVo3ZFFwanNhMEJpaTR1Sjc2?=
 =?utf-8?B?d2k0QTlJTVdVQUJrMGJHRkE4TWtwSlIvS211aGRvbDBFdkQ2YW5RcHZNV1o4?=
 =?utf-8?B?QTcveWtVb3RQaVlSUmRBYm5ZN253T2MzTVg1L2VpTGRjdVE2b3FQR3V6T0FC?=
 =?utf-8?B?TzhPQXJrT3lzVDgxd0tSMW04b1FlNmd5MGl6NEdzRmdIOVVWRzlqTGhUUFRu?=
 =?utf-8?B?S3l3THRlOGd6ZER4RUREOStiL1F3VWltSnlmcEJzNVRlUTJGQ3UwSGxRL09L?=
 =?utf-8?B?S2pxdGtFU0Q1bThaNGVQVXVXVGRGd2ZkOGdGSnJiU2M2VWwrdTRMT28zSkUv?=
 =?utf-8?B?aEJXWXRIZXpOSVJ1SDZha0cyM3RGdk9PQk93M3FIMVRETEc0a0V3bVptOHNm?=
 =?utf-8?B?MmdoUFYwV0M1ZWpnQ0hYZ1Y5RkhwR0ZHcVdLN1BFUzJBa3A4bXZPak1mc2dv?=
 =?utf-8?B?OWo4OTJuRTIrSTAvYm8vMk1vTUF0OHAwaDk5d29EQk9kanpVWWFyT0xJMlNj?=
 =?utf-8?B?d2VLTE92aSsxZlY4UDJjV1BVRGh0dWtVaWY5bXVJYTlZbXcyeHJlREtFUjZ0?=
 =?utf-8?B?WnB3Z3hyTy9UREp1VDRCNGdSUkpwdDhiYjl6ejdpZU9MMUdOY3Npck5VaGRu?=
 =?utf-8?B?cmlLWDNJcllBZUJ1SFVId296NU5pS2ZaYUhINTBwdWc2UzRFc2R4K0xaMWJr?=
 =?utf-8?B?aGRvblkrcHE3c0lLVXlwaDZDWmRQUzBTUW1ya2hjR0dQZFRwMUhpZis0VmY5?=
 =?utf-8?B?YXBHbHhmZGNYM2tvY3hXdzJRV0lnNHRuL1lyamxTYTg4cEp3MlVFZWF5bmZl?=
 =?utf-8?B?T2NMdFVPYTdxd0NJLzg5blpuYUx3blUvcnBSTVBZTlFsOEcvbVpmV2RzdG8r?=
 =?utf-8?B?TkF5ZmdKbGx4TUpZeno2OVFzaHFnWXZiMzdxbS9OU0xWQTZZbmdETzM2Ukd0?=
 =?utf-8?B?WXcrRGxaRTlkd09ZS3hkOXg2ZXRXTnhWN01ZMmpPdmJYVFVKRWkwWlYyMXd6?=
 =?utf-8?B?OGNWZ0RCcGtmM2pUSmhLYk1Jc3NvSkFrekk3YjVLSCtiUzZIb3ZkQk5MQ1ow?=
 =?utf-8?Q?v/Schfsc8f4Ejl3CFoj0d2lu4X55njg1puBQZBb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6a8f8a-ff46-406d-3fdb-08d971c79337
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 06:20:23.3177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkCqiiGJ2wYU4lIOUUaqZqN0svwuA1DbSbT6kSOC/As43UeWDtpSwaTFSA6DQ2MV5H/ug1eVwvsNm65C5Jo6wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8002

On 06.09.2021 18:13, Anthony PERARD wrote:
> I hope this is useful:
> 
> On Tue, Aug 24, 2021 at 11:49:47AM +0100, Anthony PERARD wrote:
>> Anthony PERARD (51):
>>   build: introduce cpp_flags macro
>>   build: use if_changed on built_in.o
>>   build: use if_changed_rules with %.o:%.c targets
> 
> all 3 ready to commit
> 
>>   build: factorise generation of the linker scripts
> 
> may need a ack from arm maintainers, does it? Otherwise, ready.

Ah yes. Will need to wait. Which is the first place pointing out that
you answer my question only partly: Does "ready to commit" include
"independent of earlier patches in this series"? Same e.g. ...

>>   x86/mm: avoid building multiple .o from a single .c file
>>   build,include: rework compat-build-source.py
>>   build,include: rework compat-build-header.py
>>   build: fix clean targets when subdir-y is used
>>   build: use subdir-y in test/Makefile
> 
> all 5 ready to commit

... here: In my reply to this cover letter I did specifically that
I've skipped patch 5. As said in a reply just sent there, when writing
that I didn't realize I had already given R-b for it.

I intend to put in some of this series in a couple of minutes; I'll
try to judge what is okay to commit independent of earlier skipped
patches.

Thanks for the summary nevertheless,
Jan

>>   build,arm: move LDFLAGS change to arch.mk
> need edit commit description, but otherwise ready
>     not needed before [PATCH 21/51] build: set ALL_OBJS to main Makefile; move prelink.o to main Makefile
> 
>>   build: move make option changes check earlier
>>   build: avoid building arm/arm/*/head.o twice
> both ready
> 
> So up to here (12/51) all patch seems to be ready to commit.
> 
>>   build: convert binfile use to if_changed
>>   xen: move include/asm-* to arch/*/include/asm
> both need a ack
> 
>>   build,riscv: tell the build system about riscv64/head.S
> patch ready
> but depends on "[PATCH 14/51] xen: move include/asm-* to arch/*/include/asm"
>     for the rune written in the commit message to work.
> 
> 
>>   build: generate "include/xen/compile.h" with if_changed
>>   build: set XEN_BUILD_EFI earlier
>>   build: fix $(TARGET).efi creation in arch/arm
> patches needs review
> 
>>   build: fix arch/x86/note.o rule
> ready, standalone
> 
> 
> The rest of the series needs review.
> 
> Cheers,
> 


