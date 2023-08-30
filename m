Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F071478D390
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 09:22:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592700.925496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbFVc-0004Zc-Eh; Wed, 30 Aug 2023 07:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592700.925496; Wed, 30 Aug 2023 07:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbFVc-0004WU-Aq; Wed, 30 Aug 2023 07:21:00 +0000
Received: by outflank-mailman (input) for mailman id 592700;
 Wed, 30 Aug 2023 07:20:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbFVb-0004WO-QI
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 07:20:59 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2a07ded-4705-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 09:20:56 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9938.eurprd04.prod.outlook.com (2603:10a6:10:4ee::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 07:20:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 07:20:53 +0000
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
X-Inumbo-ID: c2a07ded-4705-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LkdiRu1DnSPtCXoz6ykq+lJUmGRI27voXrfQQew69MCz4pFWm13YmS5bVICjUnEUghDSJfhep+sFf1vTE1NEPLIAhEHp9GtNrn9NsOZmj0ZVr9B4mbzGqbsGvCzDXxmf9bRQbp9YlKDPnPPeMDvLnMskXw4qjb5hjmsbd8BxltVhNlbtGcIcoSZSfNe1jSISO+NQ26BcOYlP+sLmdZ4Qq8BZtCdywJlSS+x9AiUqpyOblSO8GueOHzqpKxopONRXNWRDgff99PVJE/slVG3XQtBGU8W81JWdeHpF6lGlacrAdjr0ZOx9UWeyV+yms15cuvao/JtTfFG49C1F9BmsKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8xikLozo+7jTLL5GRwKkON2a/poF1hPHswhlWDXt0A=;
 b=if/0yd2x4JJtZIDxg7RGLKYbDOJmuOyVrPX+POQ6t/t+2/m/OFa5z6SxRWEtlvksFusaOpu/IHRt4CcdXHh26nLzaTLdKoepnl0hpZd95i/06MjdJbjq9xoAP+OeQd1asKHA/jb58eSF8SvFKlwYq3UK7IOs+FdjZHDxdoOiX1KA0mPQpwi8P70EZIe5FF+RNHGDCtJOyWk4s1lnFXT6XQvW3KZXJZxf+t6rRlhIBRoUjfzJTBuUdgMaZ7WW1oQjZ5G/4jHZyU2r4OVhWZN6v31ps1QM3qT+Uc0FH4yklzCuePTeJHSxjExxRHtH/tj3eiYOD0OXyHiEthLZayddDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8xikLozo+7jTLL5GRwKkON2a/poF1hPHswhlWDXt0A=;
 b=kKSYtY7Y00lCo5Iv2NcLa9tPwhLEUiHtfAbUvEx/6SlsFAHiDpmxPELATeQj3hMHVV81IGQ8wk9xV3ZmOxi/oinme8x1WJ4rWskbjADpqneEgRtm3M507gT65UpuukXuZYLW58m6aGggRLuSA3pfhQPU3j57lmLVMEvOa2uwaeBvQUzfd/oLO0MpmJeyJibN9PF+UqvTyPB1zkNwmO+CbWCuVpClFw8DUgy9L05NgLvxBD6mdIhkWTWIquSRGSn8qdfJUf8aNZ9YPFvhdfv/vO3nys5pstKlT6HcycDxUgU2j1xKq5iipr9p2zTQW0RA4w7+jlce/C08laNDXOKv+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <05d7f850-3d56-4a5b-1e0f-ef0f2a7e5a07@suse.com>
Date: Wed, 30 Aug 2023 09:20:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Simon Gaiser <simon@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <0bd3583c-a55d-9a68-55b1-c383499d46d8@suse.com>
 <2c97ff5b-03b0-3c17-c7f0-9bc8c9317762@invisiblethingslab.com>
 <cecbeec3-57cb-c8de-be06-bf8f6e9cc5f5@suse.com>
 <298af911-f4f0-165d-c493-90407d649945@citrix.com>
 <cfc853dc-0512-da20-5bf3-968a38d7a759@suse.com>
 <635f0055-7001-f68c-9274-6c078d07a22a@citrix.com>
 <26c50dc7-adf3-dbf1-253b-ce333d31911c@suse.com> <87jztga3sg.ffs@tglx>
 <ZO3_0GKvEk-qoaoa@MacBook-Air-de-Roger.local> <874jkh7942.ffs@tglx>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <874jkh7942.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9938:EE_
X-MS-Office365-Filtering-Correlation-Id: 93471b81-6250-4bc1-dc7c-08dba929a546
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XioI1ack5a/Pq6yoZXH7+o7wiFLFsSjxjSPYNFlCrqvSpTEa0aAYklWDWkyOQqaLWXSDGgZku/Q7kt0cZWsLfe9a7qwhIxNcI/rSkX7QFS89OwEjz5Jn3ddKq/0VNF1umvreX7Ju/xuYQwDwPhXUaqng5IfhfZeYvOO363egTEXhpPekk+shRJ3x+Rvm8TyQtLnwc07M5X4AT1JcKDo3i+9O0RmfQhf0ti6v5/yhfp8CRc8XO54cFdp8DROWYvJHG4jfwzxp504k+ZYFO7sJV1tq5nlOf7wBQ3ihvu99uweZmk1bUZajW/ipJb5C780Hny+4W7e5QPKmIi0cxOOjOi4Z+BIqQy6ntXjciZfa7bs5t5ifEeGZuF/+HrKhROMNaGo3gMD7lExG8ifCnmnS1VvEkINO0Oncaro51abqL1gJlVxRCaa/MYdZ+fkA17Hd0ElgBmB0BfIYtCBQ7gbyYhv0vGzTg5TL0e61hf5wuvgbuug0G8CoTPP5G/kT+Qk6yfK2mdplF+E0cUZrzWtQFqtZBiy4z9BFYAxiwM1FHKb0qUib1WpKCEUurgSqqGzbaYP22mBY06/e6PrZ5W9bG3T5RHvF+xMpOVTYtHi9IFjCVkfJQzbovwdrhc1XPJxN25bzmWkzVyKNyvPLBdcV+A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(346002)(39860400002)(366004)(451199024)(1800799009)(186009)(31686004)(6486002)(6506007)(6512007)(66476007)(36756003)(86362001)(38100700002)(31696002)(6916009)(478600001)(26005)(83380400001)(53546011)(2906002)(66556008)(4326008)(5660300002)(8936002)(41300700001)(2616005)(8676002)(54906003)(316002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmNidUJHcDBSRWtpNi94QXRyZzArM0xkWTVQcjNQVWxCSTFsWTdjQWwrdStC?=
 =?utf-8?B?c3JDZXdHY3pXY0ZYZk9Ba3lCRWFVbitWS1V3c1lYK0JZUjg1M0VxdE1DOC8z?=
 =?utf-8?B?YlA3OTc4SVBFTmZVRXR3Zzd2WTVsQXo5MlJNd2JGY2hoVjNOMW5DWWlFOGNn?=
 =?utf-8?B?SHdHTlNLL1dpMFhrazFTQWllNVZoZ3JmZmJ2c05GcHhxKzFWbklXenlwZmNm?=
 =?utf-8?B?cVRYeE1rU0pTNU9ubS9MOTVVTW95R0MycGVSdXpmcWhLeTZ0NlZMTmxmcHNG?=
 =?utf-8?B?NFE3Rk13OHdPMHV5UnAwSDcrWW53WjlwRnQ5MUhPeUZKSVUzdTNhVjdLT1hn?=
 =?utf-8?B?RU9KV3NleG85Y1BLeUszUzlqajB3MmozSjY0U2lwUEpPYlpyNFE4UFZnSGEv?=
 =?utf-8?B?QXkybjdJZUxKTmZBZDRkU3gwZHREWUQ2aUlxb3RJVTc1MXpMUDhWYldJVUJI?=
 =?utf-8?B?ZGk0Z0NYTll4U2ZTNlhOQ1BlbC8xOUFvNXI5djJ2a1NtSS83M1ZvV2RjSHRz?=
 =?utf-8?B?dExXVlpkRVFOK2JMZG1vSndyYTQ5WVZmclEvOEVwMGtBT3pUU3dzc1Z5NE1w?=
 =?utf-8?B?UDZLaTNjcDRrWndRaDdXekQwbE9uUnZxeTNqam10OHBKWmgva0l3bTFiZ0lZ?=
 =?utf-8?B?NHR5RllCczBJTWpVRnd0aUNtWGVwQmNsM241M3h0S091aUpLSy9rZE1UU3ky?=
 =?utf-8?B?Sjh2RmRCalE4UDlIOVhXWnd1czZiK0xNL0JPSFdEK3RKcGNJVVhPNFlZZGtV?=
 =?utf-8?B?dWZGOG1QRThWT2RwQUwwS3RXM1lSOXhUYWY4dUhEVk9CY3hWNURSTzduN2k1?=
 =?utf-8?B?ZnppcWVqT29ldEdnbTVvWHF1ZnlNSkhXTlZONGNXVERocE1ETGFlYThrZFFp?=
 =?utf-8?B?QVpZSjFyWlNrUmNrdWl5Z3ZscHFPT2pMRzFEY3VwYkJucHU1cTZSTUhrUTcz?=
 =?utf-8?B?Y00xbUF5cmFXclUycmc1RE5oU0lBckc2Z3B5Tk90d2x0eVNkN082UnJGNytw?=
 =?utf-8?B?MU5mdmtuKzcyR2V1cEFqMG1aZDFZT2ZJbklxaGhLSmdZbVR5OXBOMVBadmhm?=
 =?utf-8?B?MSthUUJzNDhIWTllcGxNZGRtR1kvU3VKc3Z2b0tTQ3RQZFJ3aUJ1SGYxUzhi?=
 =?utf-8?B?ZDlPeFhhb1Y0amE2U0t1VTloUEV4NTgydjd0S09yTSt5U3NwQmd3ZG5yUEpB?=
 =?utf-8?B?bDV5ZWpoNjhvNldwVDRKeGVsV3pkR0M3QWZlNVFzSng1dWMyYjdSUm4vRlpF?=
 =?utf-8?B?YzRUN2xSU1k0NTFoMTBQMGtjSWtiV1htWkJGS05HQ0dzSkZPRHptUzM3dTJp?=
 =?utf-8?B?K2prTy9xS25pc3YvUytyYjFoN01QVndIRk1tQ3dxU3lYc1dlNVhJN3pYVk5Z?=
 =?utf-8?B?Um9MV2h5Um91TXJCUlh0ZGtIa0dCSTgybUJVYmJMVktKVHBJbWlJcTRzZVBK?=
 =?utf-8?B?YlBYSGlRRFduZUN1R3ljMVlGaEQ4MFlqV2ZIME5sZi82RjM5RWs1SDZsNFg1?=
 =?utf-8?B?ZitJTnhMbWxTVzJKejBpNzIxTW5wdkRGdWpGZFc0d3I4a0xBZjUwZnRtbHov?=
 =?utf-8?B?K0RvSzNTOC9DK3VDeHM4SmVROWVlditaVGVCam92aFExRCt2RUk5U1U2a1Vo?=
 =?utf-8?B?RkovVHltM0RLVTNPOHVHYVR4VEJ6dWFzL2JvV3U0U2dySHErcWJucTVsYjZN?=
 =?utf-8?B?cEdnR1JmYnV2bHFwMDZmU2MvK3dhTUEvSHFsRHpTN3FHTDFVd3ZWaGRDSThR?=
 =?utf-8?B?ZzdNeFBReDdIelU0SmZYZ2swdk04WGdXNHVEVkUrUmwzeGRKdHVNOTNFUndu?=
 =?utf-8?B?WUJSZjl1akJJMlUyYkZVWFZHalNoRHJnTktDd3NkUUY3MmRQaWR1dHdxSFlQ?=
 =?utf-8?B?WW1uLzFTY0NLRThHcDA3VFNaNkZhaWErS0h6Um9pQjF4QzY4VmJHOUI5Nkk5?=
 =?utf-8?B?SUpCV2d6eFlINEJTSCtxdXpHb3ZOT0xtUXUzeTNqbFNjQU9aMEp4VnhoVi9j?=
 =?utf-8?B?TWtHRkE2VGczb3NxQmM1ZE9rTWRoR2JRME92Sk5RSHRJREczUHFad203eU9E?=
 =?utf-8?B?QzZobmxXamJEdEdCb2I5eVUwU0l6UE0wRTV1V1ErSE5UZmJaOStQOEQvbFg0?=
 =?utf-8?Q?dnE/giZTPiW3Bu/kvsSShzzY0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93471b81-6250-4bc1-dc7c-08dba929a546
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 07:20:53.6653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FIZIxApP1WDrgtAE1J4fpIxM1I0nyWpiKk7uMr+BqWG5/p0ExGQtZb5cTnbaVYjKb/WFpLXlr17CvIOCbkLTyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9938

On 30.08.2023 00:54, Thomas Gleixner wrote:
> On Tue, Aug 29 2023 at 16:25, Roger Pau Monné wrote:
>> On Sun, Aug 27, 2023 at 05:44:15PM +0200, Thomas Gleixner wrote:
>>> The APIC/X2APIC description of MADT specifies flags:
>>>
>>> Enabled        	If this bit is set the processor is ready for use. If
>>> 		this bit is clear and the Online Capable bit is set,
>>> 		system hardware supports enabling this processor during
>>> 		OS runtime. If this bit is clear and the Online Capable
>>> 		bit is also clear, this processor is unusable, and OSPM
>>> 		shall ignore the contents of the Processor Local APIC
>>> 		Structure.
>>>
>>> Online Capable	The information conveyed by this bit depends on the
>>> 		value of the Enabled bit. If the Enabled bit is set,
>>> 		this bit is reserved and must be zero. Otherwise, if
>>> 		this this bit is set, system hardware supports enabling
>>> 		this processor during OS runtime.
>>
>> Sadly this flag is only present starting with MADT v5.
> 
> Correct. The difference between pre v5 MADT and v5+ is that the latter
> allows the OS to make more informed decisions, but the lack of this flag
> does not make the claim that randomly assigning APIC IDs after the
> initial parsing is a valid approach any more correct. Why?
> 
> Simply because the other relationships vs. processor UIDs and SRAT/SLIT
> are not magically going away due to the lack of that flag.
> 
>>> Otherwise you'd end up with a CPU hotplugged which is outside of the
>>> resource space allocated during init.
>>
>> It's my understating that ACPI UIDs 0xff and 0xfffffff for local ACPI
>> and x2APIC structures respectively are invalid, as that's the
>> broadcast value used by the local (x2)APIC NMI Structures.
> 
> Correct. These IDs are invalid independent of any flag value. 

What we apparently agree on is these special UID values to be invalid,
and that UIDs can't change. But that's not the same for the APIC IDs;
see below. (As a side note, Xen range-checks UID against its
implementation limit MAX_MADT_ENTRIES, so it's more than just the
all-ones values which we'd reject. Not really correct, I know. Looks
like Linux has done away with the simple x86_acpiid_to_apicid[]
translation mechanism. This being a statically sized array requires
this restriction in Xen, for the time being.)

>> I think Jan's point (if I understood correctly) is that Processor or
>> Device objects can have a _MAT method that returns updated MADT
>> entries, and some ACPI implementations might modify the original
>> entries on the MADT and return them from that method when CPU
>> hotplug takes place.

Just to mention it: It's not just "might". I've seen DSDT code doing
so on more than one occasion.

>>  The spec notes that "OSPM does not expect the
>> information provided in this table to be updated if the processor
>> information changes during the lifespan of an OS boot." so that the
>> MADT doesn't need to be updated when CPU hotplug happens, but I don't
>> see that sentence as preventing the MADT to be updated if CPU hotplug
>> takes place, it's just not required.
> 
> Right. But if you read carefully what I wrote then you will figure out
> that any randomly made up APIC ID post MADT enumeration cannot work.

I just went back and re-read your earlier reply. I can't see such
following from what you wrote.

>> I don't see anywhere in the spec that states that APIC IDs 0xff and
>> 0xffffffff are invalid and entries using those IDs should be ignored,
>> but I do think that any system that supports CPU hotplug better has
>> those IDs defined since boot.  Also it seems vendors have started
>> relying on using 0xff and 0xffffffff APIC IDs to signal non-present
>> CPUs, and Linux has been ignoring such entries for quite some time
>> already  without reported issues.
> 
> There is no requirement for the ACPI spec to state this simply because
> these APIC IDs are invalid to address a processor at the architectural
> level. ACPI does not care about architectural restrictions unless really
> required, e.g. like the LAPIC vs. X2APIC exclusiveness.

Correct, active processors can't use such APIC IDs. But placeholder
MADT entries can, so long as valid APIC IDs are put in place by
firmware (and announced via _MAT) at the time a socket is newly
populated. They'll be uniquely identified by their UID, so the OS very
well knows which originally parsed (from MADT) entries are affected.

As stated before, unless putting in place extra restrictions, I can't
even see how firmware would be able to up front determine APIC IDs for
unpopulated sockets: It simply can't know the topology of a package
that's not there yet. Requiring all packages to have identical
topology might be a restriction OSes put in place, but I'd be inclined
to call firmware buggy if it did (short of me being aware of there
being anything in the spec putting in place such a restriction).

Jan

