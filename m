Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8545F43F7
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 15:11:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415539.660138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofhhP-0004pc-V5; Tue, 04 Oct 2022 13:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415539.660138; Tue, 04 Oct 2022 13:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofhhP-0004nq-RQ; Tue, 04 Oct 2022 13:11:03 +0000
Received: by outflank-mailman (input) for mailman id 415539;
 Tue, 04 Oct 2022 13:11:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ofhhO-0004nk-BG
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 13:11:02 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80054.outbound.protection.outlook.com [40.107.8.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe0f2cbf-43e5-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 15:11:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7925.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Tue, 4 Oct
 2022 13:10:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 13:10:59 +0000
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
X-Inumbo-ID: fe0f2cbf-43e5-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1foz828fUT1zsvaLP44FetUcxNUHXtgkwRsnWZKRfUkj9ebQ7xP/J5qS7DeXes6OcqdBJ+LgXfMLwTamHKXYuo7oq5stRZMaMidrlRQ+j2iHTpxEySj+k4m3T2dKpaO0DHY21PbUpLjjkjpYMswiPeEyg+Ctu/pg2CxbJcEiWg9ng48Ys1l704li4+vPI4HD+6fPVp2Xn7LK6Big5uDpFWg7EldRbUXzNXHiyquq4GtKGf4he0s/RRLhgy0kerV02l/Ly6fA23CYPaLBWgYsSJStHMph4UALrg23Y9/mWRFKIyG61XvfvHUk0G1GPegK9qU/RPa05qr6J7Ko2vjHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aeroNwdPfID6ObM/qORVsJlYmc80Fon0mC8/OrHoBCI=;
 b=iSnoVuDQmafcCoFGpBmMb7KCMdQdHOaDbmmTEEzuZHBAXaMouGvMpC24Ymgr7wWI3/kw12RfkFtqdNFcrYK6B4hW61Qy83NzBpffmGMqhhm6EYDa2S4+UsONhsMBWDeEc0uWdsikbZ9x+3WTbwlV3LEP22oAmDYSe4SUnkmeKv/Q44czgRQJ/zPnaLQVVwWK/FefcosKbTPeKGxB9Jsf0MDG3fXNX6byghY5T2XRQCI9d8N1JoD5n1Syxac9RA3FC5R01I5uOcR9sk91TvPbpDPyLQDgmx/sHYuusWdh6vKrI+d8QiGNqTi75xuecCdcMEqvi21Hp3Y5yMqP9kTByg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aeroNwdPfID6ObM/qORVsJlYmc80Fon0mC8/OrHoBCI=;
 b=AS4H3DLZDjsiUSqmF0UxidTtynOp2WafEYPHGApyr6uOZ6x5rFFNW71vGEDrCJ3BWliB4DA7aUoDlFLuNt1WvfbDJVhq4SGQPizueO8gVBI7E42LzIWNGFFixVfwuIB9yJTSiARr5H1Mm9+l/7J4swtGtYkeRYHhmsjKN1JAllhVzk7wso/GZNTF0KesY8lXAvd2n4XGq2Usie10YhUkEi9XgJ3f3HGINgGqpm1rprvZ8qfgeaaxDnhggK2oa/g8he17xWv2IeJYppQ8atLUqS4JuEW9AL+xf/5vP5Gl0asCZ7lR7DE9ZAEXBnbgkHGU4PETjlmEeHGwvvtqQ35ZWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8fcb15bf-4477-78f4-f8ee-33603ef20995@suse.com>
Date: Tue, 4 Oct 2022 15:10:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
 <Yzb9BDGc45OshRZN@MacBook-Air-de-Roger.local>
 <df0dc3e1-da12-9d42-b652-e33419134d38@suse.com>
 <Yzv92zTdfG748MXO@MacBook-Air-de-Roger.local>
 <19befbce-ac16-19fe-25a0-73678ce440c0@suse.com>
 <YzwNGd0wiAbhDR9e@MacBook-Air-de-Roger.local>
 <db9856f9-1777-8fe5-5b5a-ef3f132193dc@suse.com>
 <YzwQymW3jkfzUQrI@MacBook-Air-de-Roger.local>
 <9aa0569a-bc18-9480-c86a-817222d4fea1@suse.com>
 <Yzwsq/LL/i9ARxiJ@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yzwsq/LL/i9ARxiJ@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: f264ba5d-c537-49ae-d11e-08daa609e11e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tO02Kr7dJAah9bWyr5ABt4XG1FyrAJlDflHCwQ6PWAGZGrZl3ES6NqUbbULXhNk1QgRSWulWqGEL2yBBSIWiMnrHbU4oYZhmmqR8EYZZfMfICHmM8nZJ+sBxbG2PMSM6qI1UTi0MfTp8JuhLcWBYsaJXONQgIW2qJZ3uhx+gX/6S4z0923atHnjB24GLA8EZskjwuokDwLIpO/g1KpBgQDZGMYW778v+gAxXvzx84IG6DdcwjJGAQzHf2qG+b6bhy6rqbiGaeAb66s91AsmEeDY8JfG23ozmgkpS1Oa1FfnPaIdOC5ouPE5ZMGKSYizOmJjr23PkwV9IPLPQRZBk1hlm7HwosOY45ghIK259dUu7KdtHebxeJoIaR4cfI08qfDnor3uiyEKWOnIS8RqVbOETqJCX9pz4JCDt9+mHahGhdqcf218g2+PHA2M5Ch7pnpShavTbJcgauNRPs5qdF4IctZGBUe8aOM1r/LRObc34jbGtAkVBfkeQaEIGNUrp4HwB0jHo0GRBqvry0CbXL4wgHiLuVINf/pkRWsFWxQOkFqbLI6t1c8lbtYeAO9Y00NA9OLg2hxMlmPjpDRugfeQHlblqYg7rDRVgu4RZztnJUH2ocJUsKv6gMnkcRP3SWLhRbkbungaOHWG5vYhQeUo5T+aSYPCZzaNl+uKLlz8p4uhTa0W9qWFkMoK+aSPcyb3H2D2WQD9oVpirkgpTrK/6QOADU9pD5A9qXsPFN1E0GDhqSj4eetGnVsSR/kfuwemp/9yuTHX5cKF3EWwZm/WZyPiZzaTNMLpHqFBk/L0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199015)(31686004)(26005)(6512007)(66476007)(316002)(6916009)(54906003)(31696002)(38100700002)(6486002)(8676002)(86362001)(36756003)(2616005)(6506007)(53546011)(66556008)(4326008)(5660300002)(66946007)(8936002)(186003)(2906002)(478600001)(83380400001)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGRxdmtwc0R4Z3lvdmZWb3IzM0h6NUZSMFV0TERzYVZVbXMzb1pjMldkWHpK?=
 =?utf-8?B?U3VEaUxGQUI1MjFjU2tJbGxPcTRVaWlMNThnTmJDWjIwV2t2UVhFL2U5eG1j?=
 =?utf-8?B?UUt2QUt0SGVVeVM4NTFXSkpmZHNzYUdMMkpOSVJ0SEtXay9jUi9RZlFIRU94?=
 =?utf-8?B?dnFtRE5OeFVncEp1L1pVOVF4Y0gvS1Y3L05aV2RGWW5ScUttUjV6b0ZCei9B?=
 =?utf-8?B?MkFNSHo4clJqd0I5bmU5VG9EaUFlVDBsVml0UlhQTkhwdEtnSVRTNm5ka0pv?=
 =?utf-8?B?S3d0Nzk3TGxWWTVGdFNSaWhnOTFJQ3M3V0p2QWtVSEV6R3NyVXRhaGU4clpI?=
 =?utf-8?B?MDlKQUtDbVVzZjBaS1JEaFpFTFFUVHFlUVhlVDhzNWp6WDQ3dmRPbGs5czl2?=
 =?utf-8?B?Z2lhdXBpNkQ4dnJ3VHdGNWIraXdWay95NkdlcTR1d2NEa1BJaHVDOGZXM0tQ?=
 =?utf-8?B?L3c1ZlFRODlCRnVnb21JTmNTdXl3MkZMUXhWYkFPenBHUmhHbzRteTN5QzU0?=
 =?utf-8?B?K1l2M3JSTDJtZzlPRmpTYWFNL2NyOGxkcnM5b2RXZ1pLQWcxSVhjTkJwOG1Q?=
 =?utf-8?B?akZ3dHNVNFErNHJVVDZhZjNLbjVZR01hNmkra3hnZnlldGx4ZGtCTXBFck4y?=
 =?utf-8?B?UXFwNm53dURFblAxd0djZWtmVTViMzVGR1pKRmVVdnVkUEdrS0IxSXFkWVBG?=
 =?utf-8?B?aGRoQU40TDZ3eTh4alE3SnVzK1JsdlloYWRZRkF4VXpXWUpvZXk4RE94UkJ6?=
 =?utf-8?B?YzgvaEVCb2RnT0I5TGlWUVBsZ3RuY3lSNnpqS3JTWmtQdFVkR2lSN25YZ3pU?=
 =?utf-8?B?UlNIcytOVDJ1MmhMRWdQdXpVVU1zUHNRVmw2cWVtOWVuWUNKUjFNSUNPTncw?=
 =?utf-8?B?YkVQYk5zQ1I3c1lLWk9RYzFRdjFucitOdkhoREtkRXp3cTdRS1JsU3VNc0tI?=
 =?utf-8?B?RnNZQnViellHR1V3YXU3bm5wZ0xHcmc4U2ptc0s3ZGNENmxYcDVmYzRaVG1t?=
 =?utf-8?B?VUJveFhrdFBxTklVSXZzRGVvS2xDQlE5ZlRvbEJJb2ZjMFNSRzhxVFhabGdr?=
 =?utf-8?B?TlA3TEpmbHZGbVl2RUJRU3FFWk90YTQyN2o0cDA3UElUYkhJWEhucVlBbTAw?=
 =?utf-8?B?Wm1JRnI2ZnFEakxDU3U0S01leWNrMU0vZlhIYklqVzdqV1kyK2dscVRRSmNU?=
 =?utf-8?B?aXBwZFJVZ09MV0xCbVlENHdZbldSVGNpQ3FzalBmcjNiOXRrNDAreS9aRHMx?=
 =?utf-8?B?aEQ0RmdvUTNIZlNrcXdHY015UjJUSmU1YVpWWWhJMjUwLzBweWlOYTJFWi8r?=
 =?utf-8?B?OURXelZPbS9oblFlVXllVHdDbmUzZzBnekdZYWpoUjN6MlR0RndMemhJOXlO?=
 =?utf-8?B?a3hYbW5nYkJNL0IyZDk2N2Fzdlg3ak1aNWRzNFUyVGhEQnlwSnlTejJvNURq?=
 =?utf-8?B?cXRwWm5JRmNGemZwZWh6NHROZDJ0N3M0Qm5ITVBpWkdPTXpWWTB4d1gzRy8x?=
 =?utf-8?B?NS9yVU9rVTFvZnIwdjNRenlQOGhaNlBmbWtMMkVrT0pYZG1Fc0d4elVCOEhq?=
 =?utf-8?B?WGVCeWpacm9SOU9JS0t2TlFmNW83bmtTekg5MzdPUmhxbW9hTHBsTC9iM2Ux?=
 =?utf-8?B?SjhtaWFKNnBiT2dTTnlvSTlnUTIzWTdMMkxjYzZObnl4L2x0UWhxdG1GMFRP?=
 =?utf-8?B?NHNZaW5LRzJ4MWZwR2NUQVRoRzhSenhmOGRnU050dHV2LzNIWGFkSllkOWJu?=
 =?utf-8?B?V3ZZZGJQeGpPU0Q4TWRHTG9IY3BNV2ZLL0JJZ21oeVY4MHFTS2RnSXFhYVl0?=
 =?utf-8?B?aWtFZlVPbXZXVGRreEQwdVJRVUl2bzQ0MDd3UUN5U2NRd3R1VmczSWE1U0JO?=
 =?utf-8?B?cWUzZkpUbGhUUkNKNnpzTXFCSFU0a0RoMzQ2VGtHckZ3Z2RyV3hCcnk4bHEy?=
 =?utf-8?B?V284RHpTMUxYQTlGdGh1a0lxendFV1lYY3gyZTQ0ajhoUVdVSE5Idys2cnA5?=
 =?utf-8?B?Rnl1eG1NbVRvQVZEVzFtYUxiYnlLQ1dFM3R4enQzMFJadmxUMTBVU0dZSzJY?=
 =?utf-8?B?eHhjbzRta3BhV1JxYVhiZ0RXTmZUbm1HSzBIMVc5V3EraW5LbU43cjN4czh2?=
 =?utf-8?Q?0YHmZllszjeHUaOTJsnCLkrVm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f264ba5d-c537-49ae-d11e-08daa609e11e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 13:10:58.9562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mfMgm8ZHwaGQNP1O13kTUiQhvhCKPIz68KwB30Ft+JkRzOJA0jsBx2UwOqx0oyDLZ/eWgC6wGUSsgYwseWPpTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7925

On 04.10.2022 14:52, Roger Pau Monné wrote:
> On Tue, Oct 04, 2022 at 02:18:31PM +0200, Jan Beulich wrote:
>> On 04.10.2022 12:54, Roger Pau Monné wrote:
>>> On Tue, Oct 04, 2022 at 12:44:16PM +0200, Jan Beulich wrote:
>>>> On 04.10.2022 12:38, Roger Pau Monné wrote:
>>>>> On Tue, Oct 04, 2022 at 12:23:23PM +0200, Jan Beulich wrote:
>>>>>> On 04.10.2022 11:33, Roger Pau Monné wrote:
>>>>>>> On Tue, Oct 04, 2022 at 10:06:36AM +0200, Jan Beulich wrote:
>>>>>>>> On 30.09.2022 16:28, Roger Pau Monné wrote:
>>>>>>>>> On Fri, Sep 30, 2022 at 09:50:40AM +0200, Jan Beulich wrote:
>>>>>>>>>> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
>>>>>>>>>> higher priority than the type of the range. To avoid accessing memory at
>>>>>>>>>> runtime which was re-used for other purposes, make
>>>>>>>>>> efi_arch_process_memory_map() follow suit. While on x86 in theory the
>>>>>>>>>> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
>>>>>>>>>> E820_ACPI memory there and hence that type's handling can be left alone.
>>>>>>>>>
>>>>>>>>> What about dom0?  Should it be translated to E820_RESERVED so that
>>>>>>>>> dom0 doesn't try to use it either?
>>>>>>>>
>>>>>>>> I'm afraid I don't understand the questions. Not the least because I
>>>>>>>> think "it" can't really mean "dom0" from the earlier sentence.
>>>>>>>
>>>>>>> Sorry, let me try again:
>>>>>>>
>>>>>>> The memory map provided to dom0 will contain E820_ACPI entries for
>>>>>>> memory ranges with the EFI_MEMORY_RUNTIME attributes in the EFI memory
>>>>>>> map.  Is there a risk from dom0 reclaiming such E820_ACPI ranges,
>>>>>>> overwriting the data needed for runtime services?
>>>>>>
>>>>>> How would Dom0 go about doing so? It has no control over what we hand
>>>>>> to the page allocator - it can only free pages which were actually
>>>>>> allocated to it. E820_ACPI and E820_RESERVED pages are assigned to
>>>>>> DomIO - Dom0 can map and access them, but it cannot free them.
>>>>>
>>>>> Maybe I'm very confused, but what about dom0 overwriting the data
>>>>> there, won't it cause issues to runtime services?
>>>>
>>>> If it overwrites it, of course there are going to be issues. Just like
>>>> there are going to be problems from anything else Dom0 does wrong.
>>>
>>> But would dom0 know it's doing something wrong?
>>
>> Yes. Please also see my reply to Andrew.
>>
>>> The region is just marked as E820_ACPI from dom0 PoV, so it doesn't
>>> know it's required by EFI runtime services, and dom0 could
>>> legitimately overwrite the region once it considers all ACPI parsing
>>> done from it's side.
>>
>> PV Dom0 won't ever see E820_ACPI in the relevant E820 map; this type can
>> only appear in the machine E820. In how far PVH Dom0 might need to take
>> special care I can't tell right now (but at least for kexec purposes I
>> expect Linux isn't going to recycle E820_ACPI regions even going forward).
> 
> Even if unlikely, couldn't some dom0 OS look at the machine map after
> processing ACPI and just decide to overwrite the ACPI regions?
> 
> Not that it's useful from an OS PoV, but also we have no statement
> saying that E820_ACPI in the machine memory map shouldn't be
> overwritten.

There are many things we have no statements for, yet we imply certain
behavior or restrictions. The machine memory map, imo, clearly isn't
intended for this kind of use.

Jan

