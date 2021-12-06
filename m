Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8624692E1
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 10:43:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238772.413828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muAWD-00019a-Mw; Mon, 06 Dec 2021 09:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238772.413828; Mon, 06 Dec 2021 09:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muAWD-000167-JY; Mon, 06 Dec 2021 09:42:45 +0000
Received: by outflank-mailman (input) for mailman id 238772;
 Mon, 06 Dec 2021 09:42:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muAWC-000161-5T
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 09:42:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db8c2fdf-5678-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 10:42:42 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-HTbxj_4rNw2fo1am_lrOlQ-1; Mon, 06 Dec 2021 10:42:41 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4845.eurprd04.prod.outlook.com (2603:10a6:803:51::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 09:42:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 09:42:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0063.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Mon, 6 Dec 2021 09:42:39 +0000
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
X-Inumbo-ID: db8c2fdf-5678-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638783762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OIrDnTas8zwAPPDeyyTSIXpj1SlL3QBX2vGbydk8SGY=;
	b=Fp1rfMKQL3h1IJQYBn6pmNpgEIwpCsfy8e43vafEGfyQWzDwmVFz7W/c8XgJze6b9+5sGB
	mRjp1VomEjM5HEUOxLTGNuES/c2KWTWKvat+JuIUYFjiFbryxPxBv57HrrXaT+GrnTwhmh
	UrpgGe+TgojtTQUkpViZFqs59g5v4JM=
X-MC-Unique: HTbxj_4rNw2fo1am_lrOlQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgmLJK/XSq6A9xO5arv/61CX8kQMEKM9NOlibOsv88l+lTHfRbd0u39rzGxGb7vrO/KPtpfJM9boL79ILGOd54oETqoe/JlPlK4zUytYGz7MBbA6V4U5mp17INQMEekMHqz6pOlTdAEodYo7JDZNT4q63Cqzt3gmRKLR7XrOJ8DuLBeXgVQEpc5ABMiwGe91cn5vIHZfiCcrtockIq1zlTvm59PMJbCH1X2GT43KE8OSn0NdmEmLfeQVocLxf02wAWxp/VT3ff79jMCQpY+C4U0Gf02Ht4t2klIARDWHNFcmbv+4AeYyrftSstrDtHsh5v0ejfzL/vz4g2q0rhGhoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIrDnTas8zwAPPDeyyTSIXpj1SlL3QBX2vGbydk8SGY=;
 b=D531wMv5ELd3+dB1yZv7vu6YYah6Oa6XAWaoZFTygxw4pLDscBzz0SBrZRKkfjL36FcQyzmJKp5ln2atiWM66bwIRrJdBJTdaFMvx1utm/hc06DeViBB5As4LrN2Uon9A9JlgpNMRrLhwIek43Tj2taFism95lFJxGolABJlpEeOHr0QJzErjyE0Npb7SvyIXKJC5KRTDzPipwjsSFZPXE0mVPbQSdVxUR+yrguef6zsN9DNSszqRcJdSFTTMEO19IzmKpYCtJl6v12uO89+y/Ev3JfjGAs6OofgS9qna5uXugHc3z2Ov9HB23f3XYJIWj8bTw72f3a32Wban8TNvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <22317ebe-4e21-5515-9061-33b21eefd4ae@suse.com>
Date: Mon, 6 Dec 2021 10:42:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 62/65] x86/entry: Make IDT entrypoints CET-IBT compatible
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-63-andrew.cooper3@citrix.com>
 <a64a40ef-82f7-2264-5656-aaa5c94384f1@suse.com>
 <a96abdb7-cdf7-2b24-d293-d3d2c6c77c78@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a96abdb7-cdf7-2b24-d293-d3d2c6c77c78@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0063.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19f53c71-d1c0-42ab-11d5-08d9b89cbe3e
X-MS-TrafficTypeDiagnostic: VI1PR04MB4845:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4845BEDBF8F3DB559F1F6A24B36D9@VI1PR04MB4845.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oz9SXZyWpfnNvMzmPv0FteR0Ul2IZXAOAK/3kFa5NDZQu2H4u1Y73eumhnvr5gYzcoOtqRddFgAfTfFKSBM7DbFuhCajz3K+hwuvtPGMZaP+UKXJi5zuzg2sb0jxEx7PAPGlwH1jKbdMEAedWCFsbz8jXJCjj65adUV0QqgrUTPO5YFDeSzcHNSmiZYpb6xkyWsHBn6Ka9l8Yy2jk79cz0CTgbtFQa/dUPpG7dZ4cqg/zt+GoQT3wHictWgexouwenCtwwuCyMfqOqzNxPy2VFKu3QxSc16ArrlrvGhKgCTF2pLeVQNxYdDdmzoFtsX+o5kInstIgeGdd9tw17BJklkfT3fZK7FoXFbDVwtHrBBMQJc+bKghO+YYkV05a9HDujlqFfFy33BedtrPKtM7C2ocborx3bQtmhHH8GXMgO/cjwI05jsP2trm4rJWncUnhAXQtI7hj6r+/MI6YDtNVH6byZsMReiDMovat8RAYc+aZ/nebm1fM4crJvXB1z4sCW18+KGzzqwCoQiKg6DpBgu4xze6IkiBN8hUP/YVR8UFPi7jBj2oqMFbR6q7/MIPwefABjaPGW8gwSwu9vi28rpn3aLBohk+aFvJRD/f1rjZEATpfamqu3rAUEgWp/0jCLy+kqbc4v34m5FoCb4BxhYOC9aPywNMvrCK1ZKMHNiS6dBV5EyYwwieF65bg70PCa2HcXss426gnjz/FS1q7VoylJzkXyO13xMxEw/+qek=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(110136005)(16576012)(316002)(8936002)(54906003)(31686004)(4326008)(53546011)(8676002)(956004)(2616005)(508600001)(83380400001)(26005)(186003)(5660300002)(66556008)(38100700002)(6486002)(36756003)(2906002)(66946007)(66476007)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHpHV2crL1VOVmM4dk1JMEU0WVk3VG16NXpOWWFlZnZXNzhmcXpCSlRUSDVk?=
 =?utf-8?B?NURWWHRURXFHTy9uZHl1VGdhczJHRi9xRkxjL2oxc2xaOXp6K0EvYWRXMVJ4?=
 =?utf-8?B?a0Mrd2YzNzZRWHIrMHFwNU8xUG1oM1ZpRHN6ckdITTRLVmxvVVRwMEZXanRw?=
 =?utf-8?B?T2diS3lldmlYQ0EvaUVlV3pKVmJkeEhKQTNtNjB1dGtpaDRwRmovTjMwTmdt?=
 =?utf-8?B?eHBNd1hBL01yVWh4WDlRcGJqU0VPa200aTFYRjFzTVh4SHFjMUljQk9GZ2Nk?=
 =?utf-8?B?NFFObExDd1VOVjNQM0d2Rkthd3dpeTV2R21qS1A0M1JMSitrN0FFc29oeGVZ?=
 =?utf-8?B?Mk9sa3R1T1h6b3JJTjdEYUhUamdvWXZ3bUQzYlZlOVBHY0JMSWhEelNOUGVJ?=
 =?utf-8?B?UXBrZHB0VTRlSWdLN2JPZldWbXJsa3htZk1INHNIME8wRXpudFhBSzhYRWlv?=
 =?utf-8?B?d3FHTGFsYVlXTlJJQVllNVhQMWcvMVVpdDVoK3V1dXkrMnlTZytsbWVSMWRz?=
 =?utf-8?B?d2NBaUwwQjNPZHhPRVlBb21UZFd3amVZZ3M0UDRYN0VxUnJVdTNRZTJkbU9T?=
 =?utf-8?B?YnVPU1VWYkdSSkUrclNIc2I4MUYvdTZZUm9uS2ppK3FKQkVMZEk2VXlMUldK?=
 =?utf-8?B?b3BNSE5tT2FUWkNKMFgzYTFCVG5XeXVRVGwxdW4rQUgrck9CbDliOXBSTm9H?=
 =?utf-8?B?L3kvNU14cTRUTVlFc0g3N0JkQjdMYzVsUkZuRU5SaW5FYUVWTjFRNnA4c1FX?=
 =?utf-8?B?d3dFcmpyeHdMai81K1JNKytyVnFkUmRqeXVWcEVKNTg3KzlhSjFTUTFTM1ll?=
 =?utf-8?B?YjByaUVMM2lnYU9KWHV1SW5nNzhvV3RNQVkzVnJmR0tOQzlXWWFDR1doRmVp?=
 =?utf-8?B?aXhIOGMyaUFYUys4S2FvTDJldEVReW5GODBiODk1ZklFaGRZQVZvU1ExbHM3?=
 =?utf-8?B?ZitPWU5tNVJOV1hLYWVjeUZ6TFZXTWRVYitKdXRjeEtyTlNHeHR3TjhHdFlL?=
 =?utf-8?B?UEE5alVtNGFxSHZLYXd1NVY2SmZSRG1odDRIZk1TT3MrenlWa3F5bnVjSzdW?=
 =?utf-8?B?ZU1MR3NmMTRlV2hQaHB2WUxVemRFVnZnbGRWVzFVeUo1M3lRQ0oxTlJsek9m?=
 =?utf-8?B?ckhWc3ladWlnSDFTL01zVHJLdE10VHZqQTVUZVpLQkk2YmVna2U2TkdYUFlS?=
 =?utf-8?B?ZUVmenEyMXkxeGFyT2Z5YzJBckpMK3BtaG9meHh6aHJDbWlEMm54cDJmTGNU?=
 =?utf-8?B?dUdBeWh4allQRGtvTkNzbG9JZ0dvYmRqT3JEZGVGd2MzTzJKc2dLaWhRWkNR?=
 =?utf-8?B?MFNuUVRaYVVGank0dGc0c2ZSY3BjdVo2bmc3TmRDaWhnQ2hoWlBuanlUOFpC?=
 =?utf-8?B?OEdlSWQ3ckk4aEZxUktCWVVmRXdnUmF4WStTRVB0c0hocWZWTXlJZjRIemMz?=
 =?utf-8?B?M2ZqRlpRdHdsZTQ0NnpsOGM3bU4wVG80WmZiK1BxUVUzU2RMMVpKWUpZWGRU?=
 =?utf-8?B?b2JiWEZKdW43V3dtV2NEVkxhOFJOMVRFMndXOHVBSTlYSkNocEdoL0ZQREZj?=
 =?utf-8?B?N044K2FpeS8xRyttNW9WT2lrSndEZVFqUG9TM1loZlIwWGUxU1RLWWY5WjF0?=
 =?utf-8?B?LzhYalFZeGg5c3p2S0N4NzZnc1p2USszMkxaa2NTV0twYnBNbEtTbHlKVEJR?=
 =?utf-8?B?NjhCT242enJtRWQ2ZndhNndDaDJhQzAxeDUyZWthcEN4bXBJMWZRSU1kM1FS?=
 =?utf-8?B?RTVZZGE4b3B3UFh1bUVoTHdOZHVmZXpkcXBlNlliSDk5QjFwcURnNzUyU3hT?=
 =?utf-8?B?RG5nQzNBTFdtY0dmSEVqM2hRV1JpLzI0bUdpRWRMK0tMdXNpMmV6V2NXUDkx?=
 =?utf-8?B?TmxqN0NQMnNENkFZTFhTUHY0a0pSam5HYU9oTDZMbkpYUm1ROWc5clZlOXhU?=
 =?utf-8?B?dkJtR0crRU9zVjdpa0VlU3kwMldmNGEzcWJXemtKeUEyelhVWm1BT1FFNjVK?=
 =?utf-8?B?eGl0VTAvcTJIMmpmRHV0eG1jNE80WlM1cmdmU3FwUGVZOENHOHNXUkxzN0NR?=
 =?utf-8?B?ajZHejJZai9sd1k5eGM1OG4veE81Q3BPdzNpTHFsaWkrUjg1TE9sVEI0aHZu?=
 =?utf-8?B?WkpzQ2w4Q2NVZVFiYUlzMXJ2ZkJIaXNwNld0bmxWVHBsV2Nkem9YOThIYjN1?=
 =?utf-8?Q?QyT+Xd/cNBUxeGtRxC05FNg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19f53c71-d1c0-42ab-11d5-08d9b89cbe3e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 09:42:39.7282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ef/uI9QsSKegkMLH4FLK/YXHapdaVFWmeKxfGpsSKx6kT3HlEL6jH+KLj1TyOOOjIm6GQ99RMxABuK1TH+SsSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4845

On 03.12.2021 16:30, Andrew Cooper wrote:
> On 03/12/2021 13:32, Jan Beulich wrote:
>> On 26.11.2021 13:34, Andrew Cooper wrote:
>>> Each IDT vector needs to land on an endbr64 instruction.  This is especially
>>> important for the #CP handler, which will escalate to #DF if the endbr64 is
>>> missing.
>> One question here: How does this work?
> 
> Honestly, I'm not sure.
> 
>>  I don't recall there being any "CET
>> shadow" along the lines of "STI shadow" and "SS shadow", yet there's
>> clearly an insn boundary here that gets "skipped" if the 2nd #CP gets
>> converted to #DF. And fetching of the first handler insn also isn't part
>> of exception delivery (and could cause other exceptions first, like #PF).
> 
> I can't make my observations of real hardware behaviour match the
> description in the spec.

I haven't been able to find a description at all of exception behavior
when the exception occurs in wait-for-endbr state. There is text saying
that #BP and #DB can occur this way, but I couldn't find anything about
the tracker state changes in such cases. While I could see the state to
remain engaged (requiring an ENDBR at the handler's entry point), I
cannot see how the state would get re-engaged upon IRET from the
exception handler, unless the return is back to CPL3.

> Given what a mess it all is, I wouldn't be surprised if the exception
> delivery microcode has a special case to escalate this to #DF.

I am meanwhile wondering whether any exception in wait-for-endbr state
at CPL < 3 would promote to #DF, for loss of state. Albeit there must
still be a distinction between CALL/JMP induced state and that
resulting from interrupt or exception delivery. Yet there's no
architectural (or shadow) state expressing "first insn of an exception
handler".

I'm not even convinced the aforementioned statements about #DB and #BP
are actually meant to cover more than just CPL3, or at best ENDBR at
normal CALL/JMP destinations.

While for Xen's own use we may get away without knowing how all of this
actually works (perhaps accepting the fact that one can't set breakpoints
at exception handler entry points, depending on whether their delivery
would promote to #DF), as soon as we were to support CET-IBT for guests
we'd definitely need to know.

Jan

> If it didn't escalate to #DF, then you'd end up with an infinite stream
> of #CP's, which will most likely cause a stack overflow because #CP
> needs to be not-IST for shadow stack reasons.
> 
> ~Andrew
> 


