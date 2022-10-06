Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0B85F6335
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 11:02:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416767.661448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogMm6-0007Ss-Q0; Thu, 06 Oct 2022 09:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416767.661448; Thu, 06 Oct 2022 09:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogMm6-0007QD-Lh; Thu, 06 Oct 2022 09:02:38 +0000
Received: by outflank-mailman (input) for mailman id 416767;
 Thu, 06 Oct 2022 09:02:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fMX9=2H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ogMm4-0007Q0-Sl
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 09:02:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80070.outbound.protection.outlook.com [40.107.8.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ea1cffc-4555-11ed-964a-05401a9f4f97;
 Thu, 06 Oct 2022 11:02:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7839.eurprd04.prod.outlook.com (2603:10a6:102:c9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Thu, 6 Oct
 2022 09:02:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Thu, 6 Oct 2022
 09:02:33 +0000
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
X-Inumbo-ID: 9ea1cffc-4555-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqSJ8cB8zT1aw4SOJkZEXjJLOruDn6bOZcKf3YPoIT2Y45K3AxRqrLeNsmRkGlvUSItwTYTY+YDwJBD3nlZX9Y9mH/Sxx9+8Mg/GqCv+RuToHSXScoQpiANOIDnUZkO8ifc25PMvgL8pO88OJ4Ncy+brr/7Dlc8AkV9eaXBtTgesiPkG//7gDIEpgO1vGFt4qQ40uFw1y9W29/DBRmObVZ3NbgCGdvooQ1sFL5PUkWPb5HjLSBVJAdpUMv5fnTyC0bN/phhlh95urT3VPKvwxSmPMCkyPpiZ35BhA6Qaq8KcU5e/ANAn6lGfgqW4VNbM6I1cFJ4yUAuW5OJNl1olDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1N/oetchr9EAiJHbhtg/0EHZ25bitIjIo2cbe/JMQBk=;
 b=RbxLCbqxrpWmiysM2tfKFN6nr8auPhzJco+wMQ2qDktsG/H7ouCIYJBxdfqfeOXTxN4gtFQxUflf8E9EFWTauLtKHaTxuRcyi+kTuZObdKJv1+k5Hx0VV6LfEI9igsEsOacw84juicwFfeDVbkbf0ZVmDnZdV8xATk2lvb9o6jKf1eC8GRePeTqsHE6tomZJT2hKhJh6HX5ivUl1Xt0PiHdcgCrg3he4krWvzwsWqCT2SND8Xhuv05MQcBA8brRnmw8Ckua1SFgwe1hNVQ6q8MjPqM5pAZ0PV1Mkj/djpbz4lRPu5ni94BosI5rjCokyHUoFdGwg4kHfqlrRoedYxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1N/oetchr9EAiJHbhtg/0EHZ25bitIjIo2cbe/JMQBk=;
 b=pV3HN6st8VUdAnOHiU+VTs4HeZXjnIGRNPBIBFLaR8fNn3+EA7lMp/x1HiYq5Sd7aZWS5kDeRf3mNUAmeecLH6yXwLLh7d9rGr2aZgzSai8qGTSsVvz0YUTuhXgEJGTg0w3G2Lm2pHTKhyuB/d9OQ3tl6bTpMNvvv2TpeCrAB+N/3RGNwILXe/XsmwvvZw2wwwu3EvRfUD4EC1dMTQnOLwhlFfKGCReASyBXT8wvDzzZm35DVrVeeE36YDiRHnYoD2iPEwtr+d6N3fR0CJBHYlUD61xp5QxQ4yzFumoGGtXuIhB0KQt+Tuy4lvKNmKoOSpLEqkPennddyvYjGbK5bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c041b9b8-6354-53ce-ea6f-d19ee328e346@suse.com>
Date: Thu, 6 Oct 2022 11:02:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH for-4.17] x86/pci: allow BARs to be positioned on e820
 reserved regions
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221004153645.3686-1-roger.pau@citrix.com>
 <4c1ce9fc-7501-89c9-f66a-9b6671d98302@suse.com>
 <Yz1CPNwo1hiWZTw2@Air-de-Roger>
 <e38bae0c-c0ce-4953-2813-0d03bd3effbc@suse.com>
 <Yz2Q1C7Z2zolHAvK@Air-de-Roger>
 <544a7408-ea02-db17-39d7-82b7a1f56622@suse.com>
 <Yz6WWYn5uO4R3zNg@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yz6WWYn5uO4R3zNg@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7839:EE_
X-MS-Office365-Filtering-Correlation-Id: b08bfb70-08a6-4f17-1763-08daa77981d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	frNDlv/n+0EW1m0GcBzchtvudNFRGXUwY32GpWn7gZzlW4EYBAFV/LfSN79Rn5Lfd2dNKTJcbcoGbXh45Or4xF96049tG9c2wygijzJIqKbBSbYC1Us3IvUVOULmtHH5SLxFj/7GlC7MG3TByJTMtMPV3aRIpOM9DdC2RvaXH6MzWF8vuV1hA81c687KSYoFefYbzuoKaNNjFucWjOvyDECeEzRuRaeJF7WtSs44sV9yir2UN6V2o2TiDw7Bg5SlvZ42KcPhBLu7gipymZ92kATYNTyw3u2ACy3gKAMdXHBk/IQTtM+4Fb2ZIUSqbw2Bt2znX+1SFzRAPM7+pTFW33hcbYigVqkZ+mnCXnItuIWEdQQa4nEU37IUXe2Q7pE/prtOAT+c36ApxfGLhUBrwsQc/Q+FRHO8/jQpGztzLJXa4d0yYLkIY5SzM6Eqrum+BbyubvERJQJ8Bh49/E+JTm5Sc4e1Xksy7c5ytnZbasixrgDhwkTxZwo3KYekRFLfRX2l1OX1zHTNCJsCsUdRBm8L0syLmOfp44DJetrViTaXuVpfJpMBwPTZcEltGoW8819CO6NzGumpwhu34AEGUCtcV9vYk8oTBObdg3RWmsXHtrVoMiUB2gbvGDE+pUuo/SscM8v5kbBpR8b5gzOIGj18kVWJioElYhIPRvJlLBSIcI8YculmGQfL83Truul3TvT5XLFar9AT9eLPaMTQ96txiP95GKj0swAcrC7DvfdJ/fbOIimLeTxFCq4lLTdyW1yLBDLDGu4s3p0H/cqdsRxBmf9nEIqWhdXu1hkXuRk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199015)(66899015)(54906003)(478600001)(31686004)(6916009)(316002)(66476007)(4326008)(66946007)(66556008)(8676002)(6486002)(2906002)(6512007)(26005)(6506007)(38100700002)(186003)(5660300002)(8936002)(41300700001)(53546011)(86362001)(2616005)(31696002)(36756003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V09iWHNpUHYxaHFDNXFjckYwUVIxMlh2Q1pDTVJXY2pQekNJQ1VEYUwyNWhM?=
 =?utf-8?B?N3Zyam5sT2JKekUxSGtZa2hWSHNORUNhMVZWTGMyd2ZzaGcyMGNFTC9KTEZj?=
 =?utf-8?B?L1dQSWdaaUJNcmVnQTY3MmZjSzBJQUVUTjFER1F3MXBOaUMwQ0dKcDJiVVVv?=
 =?utf-8?B?RjcyU3FZRUplSytibnE0U1REaFl2RlNtK0RTd0dwQlBuZXZtNUp2RW1oSWxY?=
 =?utf-8?B?dHRROWpReWNDY3ArSUZWQlRieXVWcm54NEhLQmdmY05XcjFVUEVuSTRRS0tV?=
 =?utf-8?B?SmpQYVlYUjM4TGVsQlQwVUh2bGpNMWdYR3hoaW1pbmZpOUZ4ZEhVUkE2eUVR?=
 =?utf-8?B?Q1BQdXAzOGFVWDlDeWxQS2ZHcURLM3JjK0xoRXlZbk1WNkZkQ3ZQWXBlbGRv?=
 =?utf-8?B?d0hWa2I2d1hneDJwUmZJSHRVY0hrbjVRdnJ0NTJBTTB3dnB2cGpoWWlzVHRn?=
 =?utf-8?B?WjhsWEtHejZGUXlDL24zQVl1S290TGpHN0tYa2lUVHlyQ2NHeUFXNHlEYWJy?=
 =?utf-8?B?dDJmSUdXRExtd2JsOUxTSHdkUHRsWjNFaHIyaDBzMHBxaVhTOTlIZnJzVzlz?=
 =?utf-8?B?V0ptZ25GcUhTbzNFbjFXVnNCNkxaT25wQlVEQ3hNRG13NFN3WnNkdk80Tlkv?=
 =?utf-8?B?eUQ5SG9CalA3a2ZsV1VQRzMrVGJMaFpnUlJ3eG9LRGxoNXBFbE1pYnZGeDF2?=
 =?utf-8?B?RER2dXBqY3VTTHlFVm13dENpS2lBSWJRamh0dlBVVlhmN1F1SHlpWlZVcW9H?=
 =?utf-8?B?b2NQdDl5bG04S2VZemVQVmlpYmpRdUIxWDlGV3lyM1E1bEY1OFVyWEVkV3Jv?=
 =?utf-8?B?ekpRMkhiTG1uUXk0eC9HZjJDbVlIaXVIVWhSWENDZ1NmUmNtQWtJNDZLeXVW?=
 =?utf-8?B?Qm5qUUpuTzNMeWhUTDF5TmFMcjk4MzZkZDV1OUduTTNQRzVHVDMvRkJIenNK?=
 =?utf-8?B?eFVFeVg5TGF3NTJLRE0yOWVmUWUzQmU5aVFuZytDUWQzbkZEaWJLR3A5NUZN?=
 =?utf-8?B?YUFiMHZkUHVONHZVaWdYWnFzYjZ4Q3UvRzliNkZjSWxuMXdULys5bXZTSkY2?=
 =?utf-8?B?QUsrMHRnc2JKTGVNNkJHM24wdlhVZ09EbTJiYS9YcXhOS0l2a1hncExUSlpO?=
 =?utf-8?B?L0JVY2dqb2tuRmk5ZThKRjUyM2ZTUFlBbkhBYjVpcVZJMC9iMTE5ZmJXNUF2?=
 =?utf-8?B?WGM1NjJaL3JNQm5zUlFwUUFCTG8wMHk1d2xVV0FRWjZMV01OTnBHenZyemdR?=
 =?utf-8?B?UGcwVU04MEtabjZiWDNDQ3ZnTEQrWkNMLzRtcGVQcFg5NVpkSHQ3ZENlRW5Q?=
 =?utf-8?B?aGpCVDV0ZUdYRlFCZGZoek1KYU0xUlZwejc2YURuZmE2eW5rRnczOGJXOTdn?=
 =?utf-8?B?SHdCbDdYeEo2RnpEZ3g3UzNEalRpb0FudE1FemtEN1BQTTZZRC9NbmxleWJP?=
 =?utf-8?B?TFd1aVVlNHQrdi9NWXBsUGRRRUhwNEdGL29KamtvWlhKSUNqcCtHczZCbWM5?=
 =?utf-8?B?dEh3Nkk4YWZZK2NtbHdRWEs3UUtZaWc0VDdQMU1UL3ZLTk1LNmRzQ0N6VER1?=
 =?utf-8?B?cDdDYkY5Nnd3anpMNklzMzdqL1dYc3RSWEQvSjRZZ214SHgzWklUVW9Fa01w?=
 =?utf-8?B?QkFmczRZc2k2SUJFSDNDbkhLT0F2UnExcXZjMnpSWHZoQ2VwTFBOckFQOHdj?=
 =?utf-8?B?NmkwcFhOc1ZJaDJVL0QyUXQ4VFltaXR6a1drTkplZXpBemVnZTJyV2dpMXZJ?=
 =?utf-8?B?WjVHV25pRzFvbmd2a1lybDhOWUZoTm9SUms2WGpqWU9RWGd2L2tZWitKU0VE?=
 =?utf-8?B?S3N5anM0d0JRK2djOUNwbDBodjdmNHQ1cEttMHErbUVrTUNPYkFyaTVmOVEv?=
 =?utf-8?B?VGZ0amdiYjVkcyt1cGd1MXBqRzM2L1JkVVdoL2NjQ2RkQjE3ZlNRMFpCdm0w?=
 =?utf-8?B?VlFIYjlYMGcwK2R3Z0gyNFBrb21XNVFKRzh1V3NtRHJGa3c4OVdEWGlrbEZo?=
 =?utf-8?B?bTN6NWkzWDlhbHBVRDVXVWJ2NTNGclZndmczTXk4elpwbU9pWDc2Y1dHTUtB?=
 =?utf-8?B?dVpaNXNTRjI2RlFYUWlNbVVsT05SOWhJYm1jUGhqRnlDd1dwb0NIelZGb1M5?=
 =?utf-8?Q?RIMwJOQfQW/LFSS7t9ds44Oi+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b08bfb70-08a6-4f17-1763-08daa77981d5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 09:02:33.8703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N57VTo76hKWwWm+37SiLD4nIDeHYk/chm9ZQxompoO9atHI1SczqZ4ip1Q0C26I/bK5+c+DPJ0fSIDcQ7et2ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7839

On 06.10.2022 10:48, Roger Pau Monné wrote:
> On Wed, Oct 05, 2022 at 05:42:08PM +0200, Jan Beulich wrote:
>> On 05.10.2022 16:12, Roger Pau Monné wrote:
>>> Hm, I have the following diff attached below which is more limited,
>>> and not so bad I think.  Initially I wanted to introduce an
>>> efi_all_mapped() helper, but that would require exposing EFI_MEMORY_TYPE
>>> which is quite intrusive.
>>>
>>> Let me know if you think the proposal below is better and I will
>>> formally send a patch with it.
>>
>> Hmm, personally I like this slightly better for, as you say, its more
>> limited effect. Objectively, however, I'm still unconvinced of making
>> this an EFI special case. How would non-EFI firmware go about
>> communicating that it is going to access a device at runtime (which,
>> as said before, I consider a no-go in the first place)? Likely by
>> putting its BAR range(s) in an E820_RESERVED region.
> 
> I've never encountered a non-EFI firmware that attempts to access the
> BAR of a device so far (or at least none that caused problems with
> Xen I should say), so I would worry about such use-case when we find
> one.
> 
>> Plus the MMIO range covered on the system in question is pretty large.
>> That way we're still allowing pretty wide an abuse by the firmware.
>> Furthermore the MCFG range would also be covered by an
>> EfiMemoryMappedIO descriptor (in fact that's the only use of the type
>> I had been aware of so far). IOW the change specifically permits an
>> overlap of a BAR with an MCFG range.
> 
> Additionally I could check if the device overlaps with any known MCFG
> regions in pci_check_bar(), again not sure if that's more fine grained
> than needed.
> 
>>
>> Who's the manufacturer of the system?
> 
> It's from Supermicro: "Supermicro X11DPU BIOS"
> 
>> Or put in different words - how
>> likely is it that we could first gain understanding on their
>> intentions with this region? You did say the system hangs hard without
>> some kind of workaround, but that doesn't clarify to me in how far a
>> use of the device by the firmware was actually involved there.
> 
> It's a black box to me, so I have no idea what the firmware attempts
> to do.

Right - I don't expect there's a realistic chance of getting hold of a
firmware person of theirs.

>  It looks like that BAR is used to store some information
> related to the boot sequence, the hang happened when trying to create
> a new variable bootnum using efibootmgr (that's just a guess
> really).
> 
>> Have you considered other routes towards dealing with the issue? One
>> approach coming to mind would build on top of what you've been doing
>> so far (either variant): Besides avoiding the turning off of memory
>> decode, also invoke pci_ro_device(), thus protecting it from having
>> its BARs relocated, and also preventing any driver in Dom0 to gain
>> control of it, thus avoiding two parties competing for the device.
> 
> IMO using pci_ro_device() would be going too far here - it's not Xen
> the entity using the device, so Xen doesn't really know whether
> there's already some interface between the firmware and the OS driver
> (or just OS) in order to signal that the device is being used by the
> firmware.

Fair point (I did think of that, but ended up not spelling it out).

Jan

