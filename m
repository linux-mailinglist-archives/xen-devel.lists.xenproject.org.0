Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 809B230A6C1
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 12:45:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79797.145373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6XdJ-0005FO-1z; Mon, 01 Feb 2021 11:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79797.145373; Mon, 01 Feb 2021 11:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6XdI-0005Ez-Uv; Mon, 01 Feb 2021 11:44:40 +0000
Received: by outflank-mailman (input) for mailman id 79797;
 Mon, 01 Feb 2021 11:44:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWGu=HD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6XdG-0005Eu-KK
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 11:44:38 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3161d6f3-d6e8-405d-82fc-442175c42a7f;
 Mon, 01 Feb 2021 11:44:36 +0000 (UTC)
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
X-Inumbo-ID: 3161d6f3-d6e8-405d-82fc-442175c42a7f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612179876;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YgIge87ZuT3IZ6iE+AIvwtfW82mSyzQ6YJNFZJEA54Q=;
  b=F1DIcH5Up63iWY5imj1x0tNmhT3jZaTXyPmlAT4GXM7BFCGrZQu9MQnh
   e08MziCDAoIkUMKB54SZwhLzvyeRuIZsp4fL4FXTxiCgMWrpRyfcKwrmR
   KzTctY9dA1jv9pSJze5kAE5+hMkIUj3KQj0bQpf6yBy/OP2mIWWLtEzUA
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: IRsV8HB/g9BkcdiSK0fXUJyaaqJtJvPuP4ne1wrbQc8Bpcfy/Y33tKLQANZ/V+yBXZRXqjzME+
 pyCfEfau+lhiVd4IlDv7QXKvtjIsihiXwI1DnKsG0tgsNWQsEbjfswyBLg9PAkzc7FPf1+EYzN
 z4kLVlO4MIBUlczYseJr0prv27VqY6qge/Dn3/AZr4id37FPrCEtYCqxxAjjL08wkcHuqKTzDb
 DPQc3s6k6AUIA/5cPD5GGuaEn5icWmvJrdtvw+issQt0GurOLTiZ6R5uuhGSvQy1ScepIf2Eiy
 iI8=
X-SBRS: 5.2
X-MesageID: 36466009
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,392,1602561600"; 
   d="scan'208";a="36466009"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAfBeRAMMb4HfZASJj3yf/KcUtwyemr9LxvBE6sVwd+VwhQb2TBIwPCsvRfGTycY8yGEMwWKrxa5ipb1WsRp1e9M11tAdZGT4HslR5I/c/SG0RXX2TvFzRhnRrCxB2UnibQI0CdaMhIp+zH1CDM9mASfdmX2MBhUbtUYpT7VY/cbB8tf2h4/a2sxeU+dgeIKClf38aqxdReWhGUq9lc9dDh0HQZaNHyG2n0/eC31G2Yt9zDJqdgbQotHbFiIO8V5PwIRnyI9VMJj5jzAa9ihwayGqcO41HthZBSzirOMm0Knh7UcTEVZ/CbHKGg7mwJYY/0PuHjbX7MZyFIyaVRSyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XeDDXN3b8M4c3Yv0nWTnGkViWyT0skuZLqvFA+Wkgk=;
 b=ItjCNjy6Ehj9eHTrfwVBxqRF2RKYnaLgNFOtaqAxOesjsq56j5k1yG/sD7L+6PWFfEXBvPDygoaC4xsY9HD77ZjQyyHz5g7DvvOBK4lLrmOcIwvIygNPvDoFQnDbNnKB4/lkiCdNK02HRxk/HqHlOjdtUr/EvZJitBrqojlzFBTFBOc1jHGcbw+H2MOd4zHqkL2K718HYaEWTlDm1sTqQKggWiEJndAToaLODXYdlhkJlrUAOX++SUvrlv8inuhIcgD72k/BcvyxLL6Tu76xuKtZaPGpU/IPjpqJtXsKHtC0ylVCWhIraaWk0Fprwz1lXT3/lzGVaQd652r9VIEqJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XeDDXN3b8M4c3Yv0nWTnGkViWyT0skuZLqvFA+Wkgk=;
 b=f4qK2skZJQdQv2kea3oA3qGSbVWgvgyX23h+D2LwLCCF1W26lnfAZtAIx2TAgvYm9zXjRwlfR1cSDjWoJJakOro3HdDJoT0dh1CNcj5JkWhfiz4pJjJ10gaEwFW3YjsEOlCFmcdDpR+A9GfWMn+j6PvhyOH9XJwzTwybQ8d1o00=
Subject: Re: [PATCH] x86/debug: fix page-overflow bug in dbg_rw_guest_mem
To: Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>
CC: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
References: <caba05850df644814d75d5de0574c62ce90e8789.1611971959.git.tamas@tklengyel.com>
 <74f3263a-fe12-d365-ad45-e5556b575539@citrix.com>
 <044823b7-1bbd-6405-7371-2b06e49cc147@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0dc1f3c9-6837-ce12-8826-11354346b3c1@citrix.com>
Date: Mon, 1 Feb 2021 11:44:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <044823b7-1bbd-6405-7371-2b06e49cc147@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::33) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d593044-5f85-4bd4-8dca-08d8c6a6bc9d
X-MS-TrafficTypeDiagnostic: BYAPR03MB4773:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB477366BC4F0F0A298E6C8CDBBAB69@BYAPR03MB4773.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7N+rRp4ZDQG8Gr0qh2m7bUxZTX3U2WQRwOIBe60YLXBOnq0OsIqs/khK6Tx4f+X9zOCWyO4NnHI8PAo6PeFWO4Hcl/Xr7r4clBSLJTdVWXZT2mVuRQu9ZzPtlOcgxv8qYn9BieFPO0zpslESiUFDZhtCimuGdT3Ty9ycQOLYjDSHklBpsGITx6ahtt/5oRyFXyGnvnFlix51DUhsy4wNdFKnb6ZScCmMtwIXCqVi0H3CQqi2vPIeWScTZ6XLVJehqONC+7DcmuPFc7ysK+ySeXo0lwDtsXcRZyNKqFSoSKydRynt+ev3D3fJSqAoeZlpi5cjuGnZnyjpUMI4DtQfYkGTpMC0FCA0EtQGXjYshF1waGiPrD21q3ELferJxFY1XIdV2+WxbeAaEfaxcDxqyyfc27D5sQFBhMEZWbvSxiQTUXE1VPROGBirq1Cd7/PMihAnI/qtaw21UgP2rXYT/mHY7ryUCZ2BWgPzaBQ7/YvNu18bR9E6JNsT2AtnH2vhiyWrt7XySM+EIkmtb6UP22RuMBri3QbQUqH0otz9c8WxhcXZFipGGDdI5OKrw3o1Y3Xcsnm527zO5s4JzLrceB85SgB/DtNrmhP6/mZoBcg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(83380400001)(6486002)(31686004)(53546011)(478600001)(86362001)(5660300002)(26005)(2616005)(4326008)(956004)(31696002)(2906002)(8676002)(36756003)(16526019)(66946007)(16576012)(66476007)(8936002)(66556008)(110136005)(54906003)(6666004)(186003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MlVDU1F5N0x2ZnpVTENuSm5JUGFKUVBURExOY1dRY3R2bmRjZDZTcHpaUEdZ?=
 =?utf-8?B?NnlKcFBHOC90RjRkY2s4eXFkSUdwT21VQ3hNNUFrWE5iTElNNVpma094Ui9R?=
 =?utf-8?B?K2ZRV2czSHBYN25jNDQ2VmdIZVlLWmhpL29uNm04T0dqSW55NnptcSt4WCsx?=
 =?utf-8?B?R2NJMXF5Z0JONTNFbGpKM3hOR0l2VmdhT0xoZ0JUa2E5YkRXWjV2Z0JCZXlB?=
 =?utf-8?B?QWZ1NnNDWEk0NUJXeVcrS3hCNjZtY1I3UTBIc3JFZDR1TWN4ZWxDOEZTRFp3?=
 =?utf-8?B?Uzhoblo1dXRsZVVnWjdKUWw3VWMrSHNoWFd6dnBaVHJmc0IxZG9ySGU4bVRn?=
 =?utf-8?B?dk9mczNKaTllb2xVLzEvcFpDWStVOU0vV1VMTnFpenVGZkcvTkxjWjhhU0NV?=
 =?utf-8?B?UnNTUklIY3pDV2xxLzMzSGM2MnlLNjZxaDIwMzZqeHFrbmRVb0lBSXZXeVFm?=
 =?utf-8?B?b0hWYmVQSkMzR1BYU2U0ejB0QVpJMEhNRXdVSnhzV1FvLzFib3IwVUppaU1q?=
 =?utf-8?B?SjV3R2dPQ0tRemxRaWI0VDJWZlMxckVjV252ZythOG93cG5Hdld2dEFEQnZZ?=
 =?utf-8?B?QjlrdlluQnc5RlorYytqc0hWZytzRFRuTmdDaDkyU2daeTNQNk81ODluc2Y0?=
 =?utf-8?B?VlE0VUNnbXlnV2hnZWtjQXlPSFhxQkJZRnJCVEpBTzFRTktLeFYvZGJJenky?=
 =?utf-8?B?cDZVUVF4VDJpODBDMXlRcHNIVlBKNlNyMlB2VEc0VkdxeS9oay9sRFBTVDRo?=
 =?utf-8?B?T0lVY2lQSU4reVFMUlhFTlBOTFgvRTRlRURjUE9oazZGRUpVWU5xdG42UWV4?=
 =?utf-8?B?aWZIN293QUJiVUJFdVR0eThGZTVDa0xVajZtTXVEalcvUTA3OUhNV3BaWXE5?=
 =?utf-8?B?WmxpcW5wVjVpNzZCdmJZbGhHZ1FYOXlTVlJSVDFYMHp0UTlJWXY5MkdacTgr?=
 =?utf-8?B?bjhuU0duSmFScjBnamp0N0pBUldSS1VRKzBWd1VHZUd6RFlnR2x2aW1PNVU0?=
 =?utf-8?B?ZXk5WUR1bXhhYm14Q0VQVTNFM1MzMUd3ODliL044bkpQM1QwYm5MTnZiTjh2?=
 =?utf-8?B?Z0ZBem9NZ2JTeTZVUHNhd0Z0TzFETmxOVERVcmQwU2RhU1Z5QlBVdmtYMUpL?=
 =?utf-8?B?Vm5HNXRTSlZLTHNFNmxOTjdwcHdteHU0cVhoY1ZMbTZvVDRjbmZtU0VBSzAx?=
 =?utf-8?B?SEJLZFJjZk9hUjUrY2IvOCtDQUpoQlRXUE1ZblRmMHlCVWxmUkFoM3FKbDNT?=
 =?utf-8?B?a3NDUHRSWktPajgvRHJxZHRjUW1XY0I3cTNqKzQ3elRzTzZBRnVTY3BGOEEr?=
 =?utf-8?B?Zzd2dnQ4bFdjNkQxSDRWYmpZaXNrTjRnODBXODllK2VnVmkwVVZPMHNuenMr?=
 =?utf-8?B?WUdCUThTdzlGVWU0N3Q0b0tPRERNbTBEaUdUL0ZxNmp1a3FvNUZZdzZwWE42?=
 =?utf-8?Q?6UCxPfiO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d593044-5f85-4bd4-8dca-08d8c6a6bc9d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 11:44:30.8385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cyn30/T/d6C4iW42uXk7KEieiJMkErhGhvnqZhT1ZvnbPjpJT4wTpdQ+ypCVjLeNmm/GvSmcGbLd3PVuYgLFzQtjvbzJcy5M8ho14EUiu4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4773
X-OriginatorOrg: citrix.com

On 01/02/2021 09:37, Jan Beulich wrote:
> On 30.01.2021 03:59, Andrew Cooper wrote:
>> On 30/01/2021 01:59, Tamas K Lengyel wrote:
>>> When using gdbsx dbg_rw_guest_mem is used to read/write guest memory. When the
>>> buffer being accessed is on a page-boundary, the next page needs to be grabbed
>>> to access the correct memory for the buffer's overflown parts. While
>>> dbg_rw_guest_mem has logic to handle that, it broke with 229492e210a. Instead
>>> of grabbing the next page the code right now is looping back to the
>>> start of the first page. This results in errors like the following while trying
>>> to use gdb with Linux' lx-dmesg:
>>>
>>> [    0.114457] PM: hibernation: Registered nosave memory: [mem
>>> 0xfdfff000-0xffffffff]
>>> [    0.114460] [mem 0x90000000-0xfbffffff] available for PCI demem 0
>>> [    0.114462] f]f]
>>> Python Exception <class 'ValueError'> embedded null character:
>>> Error occurred in Python: embedded null character
>>>
>>> Fixing this bug by taking the variable assignment outside the loop.
>>>
>>> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> I have to admit that I'm irritated: On January 14th I did submit
> a patch ('x86/gdbsx: convert "user" to "guest" accesses') fixing this
> as a side effect. I understand that one was taking care of more
> issues here, but shouldn't that be preferred? Re-basing isn't going
> to be overly difficult, but anyway.

I'm sorry.  That was sent during the period where I had no email access
(hence I wasn't aware of it - I've been focusing on 4.15 work and this
series wasn't pinged.), but it also isn't identified as a bugfix, or
suitable for backporting in that form.

I apologise for the extra work caused unintentionally, but I think this
is the correct way around WRT backports, is it not?

~Andrew

