Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8377B09B4
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 18:13:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609130.948020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlX94-0002WY-Bs; Wed, 27 Sep 2023 16:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609130.948020; Wed, 27 Sep 2023 16:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlX94-0002UW-8m; Wed, 27 Sep 2023 16:12:14 +0000
Received: by outflank-mailman (input) for mailman id 609130;
 Wed, 27 Sep 2023 16:12:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlX92-0002Sn-Fi
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 16:12:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cffc6f9-5d50-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 18:12:11 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PA4PR04MB9712.eurprd04.prod.outlook.com (2603:10a6:102:26d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 16:12:08 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc%7]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 16:12:08 +0000
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
X-Inumbo-ID: 9cffc6f9-5d50-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPb0yfjJAUOkzA0r2wcL+gR5C1pBX7FewIZFxB6UZHw8bIMgv1Xi4qDJvZHymTP31c6cWdbhTcCo1sCx8P+c3kJxzvhPs6lAFqnxC/wqtq58TiOW3eam/MNXnzXV1dzsOT9OrBtZ6cTR9jmzPMdpu8gztBiVTYp6nnLUQYX4yw9LArusDCCqRjeas6SnALTKJyWXgcdjOlW3XDI7KkQdAiFV0ycoEj4D6Vx5aw3cErNPX25gN/l09frzzb1sXOmHlLyGdIS1ufBzBbZWm0/BCIvqjFdnxm8u0Q0+c7MB8fhtwnFD3OV/jVX3DcukMPfjOmjZcayU4NqgD+17Jrvr6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGt2db/I8ZsdiyoeoQKfOki2MrPy/3s5vKobaQ+Y+v8=;
 b=HauAKhTTAjSN3F7IvmZQhZSSw7Oi2yXseqZeVn7R0sJq4UEiLhNyEqEgAm1letZeBNU6nxqaUXgoITCupbDr2zavAO4v9xmsUmeQD2y5LkBCJFY3hQ5lvlCaMCJZ37zO766+xwRM+x/ofDW0qgZA1GuvEOCU7f7Zi3n6lMIy6wbQ35yKkm3t/ZAnR1AARsevv8R/4qeGUHcbr4TtQzYhxBWD+2YUGitTqAp5fh6VHkwbkwGeNOI7WyTNziU/iLBJJ469EcdpVd0iZJPHBFjrbxQBoDTjkcnkbgNGLoLn8O5313TjnitXsQP+PFRy9XiXOo6C10t9/3edTLd4Zu8tzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGt2db/I8ZsdiyoeoQKfOki2MrPy/3s5vKobaQ+Y+v8=;
 b=3LZWnfy0eb+tEWht09nVLA3/P8UTM2YN4mJiQzUHkvqGyRPw5Z/weB66a7kNFY92DIDin4LkBNljce7GDqK5WiyCmIwIEMyx0ofQ9ACQl1w2/6UI5XWOrzb07ENFyyk16+cT3l2GWLsmq3m9lHBVD8UgPkFVt8SzZeukNhIkN8aJtzICmCwPsPTLt8v3taYG+2b05oeTMnxCMJAaC4XIbMLIIGqOK1D38oP0eo81B1FgCVWISRe+IJppnWg/j8GLDOKYKMOvA6FEbFYxG32WTyIaqCG937Ns3YY9uFFaiH9ib9CO/ORj5Lfjs8PNBiX2R8C4l0Ob4ZdTjaSP0nGvEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4f3a6728-bd4c-715c-a822-4e8f3db447ad@suse.com>
Date: Wed, 27 Sep 2023 18:12:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 7/8] x86: introduce GADDR based secondary time area
 registration alternative
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <77218fb0-5e96-4ecb-c2b0-4fe8c3ba683f@suse.com>
 <ZRRPMAxlpB03_GMJ@MacBookPdeRoger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZRRPMAxlpB03_GMJ@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PA4PR04MB9712:EE_
X-MS-Office365-Filtering-Correlation-Id: 550d6693-8cde-4d29-76f7-08dbbf747fd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+L22MgFs25y4Oco+rim7/1soKGtmKqyTB2eCZC0vbAklMsICRURQ1hf6PLdcOAPiFBY4CH8Elp7q4TWRmgLKN8Ex+Ldr85cFgb2pIP5Q4/si5DDMj5HjBD4jL33jDlfXCD9riT9C/7FbDoSi1ofGCRRmN1Zu6QExhX/VhCJWWvHBEQqILR+SM7U9N4HIQtqVvidUif40Fx4T0LiHAGHrh5cSc4HuAEPmMm0EAXnKAPE0sEag93OIv4o5Go7jLAcVNpgBXUObXFzUWMHm98N3pLrIniNLOtkEfcFFgjzdMH5s3c3YeWrZheof6J5kUCBvz9Zf//PN3/Wja14MhJbSr6bmNv66WOyxIjKL8sAn31VVGxU3ZS82fmp3zuRREeMoKUlKhMzTk80ujy+7vtUq8k3+4nzbqIcWWZdYs/zU5XaCQrSMF7jA6VxvUx1xzep12gdOqevNyFIGYCT/60bSTYxqt2cqxm+unge1XeeWB0LCQdeoXqIcDba9STZ/1wVSgE05cSS/ZU0hEB/raX6tTCohkLzdCTCQkriD40Xj5gvQ4T1X/fDJ6Fplz251MhKINXivA77RD5KUel1HuDZxGdIyAm96m974o3gbTXt0qi7tkKskGTCSz4Ri/L6UtkT5lkruSmhtpGUrt4RJ7zjS0Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(136003)(39860400002)(376002)(230922051799003)(451199024)(1800799009)(186009)(66946007)(66476007)(66556008)(5660300002)(31686004)(41300700001)(6916009)(54906003)(316002)(8936002)(8676002)(4326008)(2906002)(478600001)(83380400001)(31696002)(26005)(53546011)(2616005)(86362001)(38100700002)(6506007)(6512007)(6486002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHlVV3pQbEd4Q1BxL3hBUzhqZHJtTU9pRzdGUHIyOVZzR3hYbk1mSVFiSUk0?=
 =?utf-8?B?MnZqSVpGaTJWNTdiOXRiWThOWThiRUhCQ1E0a2czWkdxRnZvS3ZEbWRPdzJn?=
 =?utf-8?B?VjVKYnk0cHA0bURBQ2R4YnltdDFBMTQrQkNjUm9iSWxYTTMyT0RYcENNbFRR?=
 =?utf-8?B?UWFWQ20yWjUvTTFFa1Y4TS9xbU1Xd0NmckEzckdCQS9ZaFI1VGZHc255bzJz?=
 =?utf-8?B?QmtyZytVY2pmZzh0U3lGL29PL3JaYURCU2tjdDk2OGZTcnBFUFVnTlNDVkNG?=
 =?utf-8?B?eWdKWEQxZzYwczYzd0xtbUZ1TUkwZ0hnZ2FJNFl1U1BrQlFqdldWZDVrNklC?=
 =?utf-8?B?WDJWMlg2bTJvMkFIdlNZMEVUcWM1a1ZJNDl4NzRSZTBZMHk3R0c0ck85UDZH?=
 =?utf-8?B?b0RpWkpJU0FqWFltYmZ0TDJoMXVYOHgxWEF2L3FOMUY5MXl2VktmUDd5cVhM?=
 =?utf-8?B?YjByTUhEWTJQWEtVZGJUQStZVGRwb1ZQekovSDBodHc1cXhGVHRUT20xVmhG?=
 =?utf-8?B?eERFenIzRUZCZ3JGM2ZGTWxCbnd2YjJJeWZRL1dpRkdjOTJxM3dXS0taWW8v?=
 =?utf-8?B?K1huWXE1bGc4V3BuQjRXQ2lJTlF4VHh6ejRRd1IzVG14WHM5cXhGZER6cTdt?=
 =?utf-8?B?Q3lBN1F1amZ4dEIvaExuQ212V2dnK3hUcncwdFBaSTc4OTN3emVqNzlZVGdq?=
 =?utf-8?B?M25LSVBWYW96TmJRV1J2bVFpbzYvVWl5eXY5WDExL05ic1dlUUlNdFJ3TU1o?=
 =?utf-8?B?WG9JUTlDZGxmMW9KRUR3enBtVnpRMVZSbjdTeG01Y0pRZmNVUHZqa1NOMGFj?=
 =?utf-8?B?NzFCQ3p0WHppZDRtbHpFOHMwUnkrTVVpMWhZM1NjZ3dVRVN2WmJ1UGNTdTFK?=
 =?utf-8?B?cVhOWGNrM1lMSG43U3NsQXdhaWtNM2R5bXAwSWdFRHNRaXlHOEwyMVFpa3E5?=
 =?utf-8?B?Wk9UcEY4SWZLR1grbFdSTFM3RExKQmxaNkRIRWNaejRtcytKeW92amJBQ05Q?=
 =?utf-8?B?ck52eE9UZU1IUys2MWhpMHR6UG9tT29OZGdEUmN2QnpQem1MQmdqcEw2MjNm?=
 =?utf-8?B?cGEyU2FFaUN1SlEvaTNvU212Qjh4Kzl3Vk1wVzRMVDY4OE80eEU5ckhCSWow?=
 =?utf-8?B?R0tHMThQTlpDZDBzKzJtd25OMkNBNVdJM29abjcyQ2tQaVBFUVJHU3ZId3I1?=
 =?utf-8?B?ZHBiS3dYRGU1OURXa1h3QWEzcDVoWWZGY3gybC9lOFhSb2VmN24xSFFtVDZL?=
 =?utf-8?B?ckdBdVZ3UmdNYlRZbGVrMnhKTjVEQm81Qm53TWNNK1l1L2locGpGMCtFOE9h?=
 =?utf-8?B?WXh5OEZHbmdDc043bEFNMit1VXhPU05LREw5NTdUcW12M1Fac2hFN1R1Vktm?=
 =?utf-8?B?bEVKS2h2aGV1L1RRMnBHSFkzbjVlcVYvcDJyT0hneWtNSnFhQSt0ZTY3YUQ2?=
 =?utf-8?B?ME5oQ1hPQjJSaVRWOExwZmlqNU9VKytsOTVHK3Jla2p3RGgvSDRIaVRyN2hB?=
 =?utf-8?B?MGlJTmJXalkyUDlETGgzbVQyNXNaM2RjSVduanluN051U0ZRTkZ3Ymlla052?=
 =?utf-8?B?c3NHMFVoMlZ6S2wwbjNvTGpENGxoUU1MVkVzRUNzYTIraXozUTlETHpScGJG?=
 =?utf-8?B?aGhZN2FYaUJ1Sitib0ppQ0FzUTA5SzN6cUx6NDJ3b1REb05DL0xUdjNJNWpx?=
 =?utf-8?B?UmRwNmcxcjVnTEdGZzhXdnV5NDZodUN1SWRVOS9CME53MXdGSUw1SXh3bW50?=
 =?utf-8?B?VVJmN3JXR21BUUtIUmJ5ZnJiNW1IQU53NlV6UXVHNlhpVmw1TXc1NEFGWmtk?=
 =?utf-8?B?VFJkV0tOaWJRUjRsbXNhVEN2ZHpUMDZZWXRjLzBvRlZNTTYydFFsU0xldVB4?=
 =?utf-8?B?aE0zczZ0Ujg2bVpuQ3lOczlOK2RheEpUb2E5OHV4OExUVm9QTGROSUFPQTdk?=
 =?utf-8?B?N1Fob0RKU0FnaTR4Zyt0cFFyWldOY2U5c05PbHpBaU1xcVNhc0xlQVU2N2dV?=
 =?utf-8?B?TlUrbVczRlR3L3R3dnhVVE5vSm9qR0t3cXRmTlhyL0xpNnEvRTVGUDZUTTIr?=
 =?utf-8?B?b0lFeVFBWlpnYnpKcWROQTZzNWZPSWhvN3gyZGw1M1NuSUtuVW1Ib20reDA3?=
 =?utf-8?Q?P5xKovVszXaEw826h6kdvMSKP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 550d6693-8cde-4d29-76f7-08dbbf747fd4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 16:12:08.5642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZMvJvwemAUQpnsc43H37ful9iLb6YOzu7V7C+BzPlswnLyfAzplYiJ7MvNHw+bcHoWrQ8Uv+fiti6XV1oGsDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9712

On 27.09.2023 17:50, Roger Pau Monné wrote:
> On Wed, May 03, 2023 at 05:58:01PM +0200, Jan Beulich wrote:
>> The registration by virtual/linear address has downsides: The access is
>> expensive for HVM/PVH domains. Furthermore for 64-bit PV domains the area
>> is inaccessible (and hence cannot be updated by Xen) when in guest-user
>> mode.
>>
>> Introduce a new vCPU operation allowing to register the secondary time
>> area by guest-physical address.
>>
>> An at least theoretical downside to using physically registered areas is
>> that PV then won't see dirty (and perhaps also accessed) bits set in its
>> respective page table entries.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> ---
>> v3: Re-base.
>> v2: Forge version in force_update_secondary_system_time().

For your question below, note this revision log entry. I didn't have the
compensation originally, and my made-up XTF test thus failed.

>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -1633,6 +1633,16 @@ void force_update_vcpu_system_time(struc
>>      __update_vcpu_system_time(v, 1);
>>  }
>>  
>> +void force_update_secondary_system_time(struct vcpu *v,
>> +                                        struct vcpu_time_info *map)
>> +{
>> +    struct vcpu_time_info u;
>> +
>> +    collect_time_info(v, &u);
>> +    u.version = -1; /* Compensate for version_update_end(). */
> 
> Hm, we do not seem to compensate in
> VCPUOP_register_vcpu_time_memory_area, what's more, in that case the
> initial version is picked from the contents of the guest address.
> Hopefully the guest will have zeroed the memory.
> 
> FWIW, I would be fine with leaving this at 0, so the first version
> guest sees is 1.

No, we can't. Odd numbers mean "update in progress". In
__update_vcpu_system_time() we properly use version_update_begin(),
so there's no need for any compensation. If the guest puts a non-zero
value there, that's also fine from the perspective of the protocol.
Just that if the initial value is odd, the guest will mislead itself
into thinking "oh, the hypervisor is updating this right now" until
the first real update has happened. Yet even that is hypothetical,
since upon registration the area is first populated, so upon the
registration hypercall returning the field will already properly have
an even value.

Jan

