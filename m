Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3978637AC37
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 18:43:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125817.236830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgVSU-0001Ef-Gq; Tue, 11 May 2021 16:42:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125817.236830; Tue, 11 May 2021 16:42:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgVSU-0001BT-De; Tue, 11 May 2021 16:42:10 +0000
Received: by outflank-mailman (input) for mailman id 125817;
 Tue, 11 May 2021 16:42:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tq61=KG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lgVSS-0001BN-5l
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 16:42:08 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06c0b46c-34c5-4b8b-bfda-6575d2e01023;
 Tue, 11 May 2021 16:42:07 +0000 (UTC)
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
X-Inumbo-ID: 06c0b46c-34c5-4b8b-bfda-6575d2e01023
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620751327;
  h=from:to:cc:references:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=J34mvslvyE2BkQ5cxj3q/tvzkRJ4tyApqnGhdsNAF4Q=;
  b=cflONfX42DAdlJPdCYmiSzLw2UL7zDNuNcdKQE3hFcNGcD7dOOUnby+b
   0fEdO25akGseyCPSWJ9vkCaDJBsN3b1zqvAspAYgKNAKVpPTrOOXj8W53
   YhskXznInLWD77ay3yGvzmLCLUfOirTkX1ER56epJIw19QTSNA7vakndu
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LsL6Xre9yOcBUpJlBxEOY4eXtl+UUyTpxDAyLpN8uRdntYUqWlHKLe8nn6F+CN2eBiN9rSr42a
 ERDqUtwX9AB1xaAxYFARXOSK4c4JFXmH/dnwWV2iTnyz4katlLAkyCLo3yoA9K6L9ArT+Rd1RT
 1Bu9+kzu88eeIVYZxgAcqKrFilYpPAvOUhpziLocRPQCygOWf6HChMskR463KNj468sFrMP3cg
 5yA8gSuZG7qM70lmF+l5+4A+L65BGyqxFqr+cy/OEn01964nZWEGmVmXddFTqg0khV27EBPeFo
 STQ=
X-SBRS: 5.1
X-MesageID: 43667177
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:uC2XXqh1J0EeZJod35JZP/AJ0nBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-IronPort-AV: E=Sophos;i="5.82,291,1613451600"; 
   d="scan'208";a="43667177"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNlbpEYNq+rAjKMCq+smjMd8B29YnWxAgqbQU3wKlMrJHAdBvkY1U+p61edCY50C8FSubAS6CwY96xyeQirdX46R9q9oSdOYPqDB7KrPODzsxLhxDmzbsMBWLMjWTgVLJRrzOH0489FlWvtSF93EoJ/UWCQJ0ZIjzI3dLQ5x3NHWDWX0K0MEQG3IuFxNiQbBNCUIg9Kk270ALARyY1HG4HFslnX1kzVxbeLanZefjOBSvzaljotChbXfYmciuIbGlt8hDSctC9aHYCC9mM7Qb0dMb84aHKKXoIcjI1kffLMI6dCn9yUpU8Ds9XvUh7RNC27NyfnCbVSAS2FVGloOqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J34mvslvyE2BkQ5cxj3q/tvzkRJ4tyApqnGhdsNAF4Q=;
 b=fu3M7EJguc1+X7hCpi0s/nPF4wINxDM87NNeigH74whNBZ5/OhuG0azDF8o6ibl+9DOs6m8vxkdF/FqoViabnaKRxn5mlJY4ab8laZDSJkZQA56/V7FdKsVzuVG4qIERR24eEOoH+2NkXjcbDy1ps1IXsP9NrN+0xGu1LObG3yvtBh4Eyshv0gTxsf3dlXsFpxyWPUyb14U4O6ChlM1EbgZCILyTwh8YnQaBWmKA6jIhM8uN5AdgxVjB3MJYbuhwmTeCVNyfQ1bWaDtOHZyfAB0arcbK4fzA29EbbuU8yJCy/X22whopBr0uE+eCrDSW3BckVpIRnPkGKR7OaBY+zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J34mvslvyE2BkQ5cxj3q/tvzkRJ4tyApqnGhdsNAF4Q=;
 b=hBlAbWBPktfba4aOKtdqTgg6O3ybrD7QUOFw8GYiaEWBcgmXQP+rsLjxxek2NcRMCJ5OeLEg5ms36+waI0uVbfaz3TENLikW4PX3h4gKSt7qn2xnCUtczNFcVbPHgwbOXYtWJqELaN2cQjdMUd/pLl60WFJqpWi3pA0+4IwIs2s=
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
 <8ba8f016-0aed-277b-bbea-80022d057791@suse.com>
 <5a954be8-e213-36d8-27da-4c51243dc280@citrix.com>
 <f515fdfb-d1a6-56d8-5db3-ebddeed23806@suse.com>
Subject: Re: [PATCH v3 03/22] x86/xstate: re-size save area when CPUID policy
 changes
Message-ID: <f16afc8a-ccd4-7e5e-e08d-d96597c6e8ab@citrix.com>
Date: Tue, 11 May 2021 17:41:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <f515fdfb-d1a6-56d8-5db3-ebddeed23806@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0396.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::24) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 640a0976-1a9b-452f-1601-08d9149bb3f1
X-MS-TrafficTypeDiagnostic: BYAPR03MB3429:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB34294EADB389D9D45BA7475ABA539@BYAPR03MB3429.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gbwht9Do6uZsRm1pN5qwG2yjoXtgCv6qizCE7jhNtkv+RRmCcKB1uQFcG5IYna9fSyUj5V4I2q9UdqFtKt3doSHL7xX+E/k+5KVd2ejuD+hFIrFNc6EFiEzd4gRQBhTRld/pncKdgwHd0D74UDrOupf2gt6GDpb0/YtSgNXKVH/Ba5fv99iJ8bE+Q9+6a7IO1rXL3NmEfIYrqsoJwjJQAWo01oBJNDULgoyaqzK3X3tCrqgdLHf4iOGnTsbG5ubp3/DDwTRHhHUICnteR7X4t+GK5xA2/FkPP4huy1BiBq4cX2/uCWAKNlnPpcKQ5cEDltfpx9lWt3jfDcp+tbbaZR6+We/HhKyyGhRVvxWWO/Td3AEMgnF3O+s1GOH45SN1wyo6aZhNYaBCpbnGTRLlMYFpyfkZYGsxXD0iM9XYC6XsgMRfyYq4RnEXz7fxx0MNOpthZgv2MN8iwqbReBbicDIWcGaYjKCbOsW39sm0eJW1Nf5UoMyzaRhmK7+10lJY4Lnzhopts3i36Dqq94Zl03o7jT/ZkvRdEFX+tq5nZYtwbatPbxvLlXZZ9lGYVBGccFxJNe8EiIwP021lwXhr62uQ1QP33jq60LNTkNn4icD6UxT52bT8c5pe/myT3UbNjUegVe0vH75aZIEo9M874cWEGgJqW6+HYFO+cGtj9jIAvScWVU8Vxvpm7rvYc0c3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(316002)(16576012)(186003)(36756003)(6666004)(83380400001)(4326008)(8676002)(2616005)(54906003)(8936002)(5660300002)(16526019)(2906002)(31686004)(956004)(478600001)(26005)(66946007)(53546011)(66476007)(38100700002)(66556008)(86362001)(31696002)(6486002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N0tFeldZZ2N5cVZOYnFXdkJobW9vRHhjTVFFUjVvR2NFTVd0NE9GNXBKVFBD?=
 =?utf-8?B?aGphV0p2bjV0UEYzTnZOamdpM0szMDBoK2RQbFJCZEp1YnlLbGdFQ2dTZGk3?=
 =?utf-8?B?NElheHRJZ3J5QmUvNTcrT2FzMldYblhRazcxQldCUWUrUmxxQ2p4R0kzcVAr?=
 =?utf-8?B?UmNFdnhZUytncXAvUldEcjI4MEtyOGkwNTRic0NFbkZNdXdOUFAwZEkzbFN5?=
 =?utf-8?B?TDE0MjY5WEFRaTV5NEdSaWNZZnZVbGpscWptSk0rOEVvUVlQcFNSU0RoKzRP?=
 =?utf-8?B?bzZkL2lNZklkWEE1SGVZMWVZMnlocUliTVd1UVo3SWV6Ni9KVnNjejVPQk54?=
 =?utf-8?B?UGFLUlhyWFpBN3lDS2JweXprdldVdGxQMlhiSVlNOXRNM2RBQVFzVUpLRk51?=
 =?utf-8?B?VnFpUkhoUm5VdDJiVWRka1BCWlhRdElxY21CK2YrUzU1alMyOW9BeWpiTTFk?=
 =?utf-8?B?YWRQK1JFdStPcnB3c0V1ZDVPZkpST1Z0UXdld2pYWmc0Q20weWF1b1Z6c0Jv?=
 =?utf-8?B?K2ZNdklTOFBpNGpMYUIxU05YeGQ2WmJ5TzBrUEx1VWZXRXhEZUNsTVNDNEsz?=
 =?utf-8?B?VmU4ZytITzRDYXlrQnYyUUNHVjhBRDBqMEc0ZmEvYk1wMlZDRk1uWlZRS0VX?=
 =?utf-8?B?UlM2VndaUjUxSndzSk04OXppL2ZJVGZHVmJjVjU5Yk9WMUFGMWtORmlYWk54?=
 =?utf-8?B?c0FZUXZ5K0ZwVFNoTWlSdzExWEtWSmJZZ1NpTWdjOCthc3MwMG1kVE9FaGlB?=
 =?utf-8?B?NzY1Y3FMWE9xRHY5cGswZjhBSHpCNEFTZ1c0akk3clN4TkJlNXVDckd6M1E1?=
 =?utf-8?B?ajFtTW1JR094WFgrYjE0ejIxbzNoKzNwVk1hR3pJNGwxcmZvSjN3RzFRT1pX?=
 =?utf-8?B?ZGRGS3VDcVptbmpwTkcyS1FIaitSMkNGVWFVbVVwMzdSWjl3Z1NaR3BPdkQ3?=
 =?utf-8?B?N3pxa2VBcTVHdDBrcFN5dThEdWFZZDNibzBVS0t0SnRUSlBHbjJTNGE1SGFT?=
 =?utf-8?B?ZGRINFN2bko4UXBWVVZicWNBZWJBdjI3UUl4RW9VazFnOVJ6dk85UEpEeEth?=
 =?utf-8?B?b3FOTzMzZ3FBT2ZVVWh5WEVId0F1L3U5OEc4UWJUYjYwM3Z3d1hNUWk3Z0JP?=
 =?utf-8?B?SWRCUSt5ZFFEQk1XZkE0eGU5N2pDTEwxUVZEeUJ3VHpnUzUzYjV1MkJzYkFE?=
 =?utf-8?B?VGhUMmozK3g2eE1tRU9wWFJWeG1LUEd2bVdKVVVZTmdhbE16ZU8rOEVXVkw1?=
 =?utf-8?B?WmJXWkx6MGxEeUViQTBwTERYU1Y5VnB4Szk3bVlsalk3TGlBTnI2RU44aFBz?=
 =?utf-8?B?bmsvK2FGTXQ0dGpzcEk1QlBGa0xDMFUwU1JScldFdWN1ZHVuMXBRWk9vNmgy?=
 =?utf-8?B?V0VKQlRRczhkcmZhVlFPVTJac0JyenhMVGNQbDQ2Y2NTNlIwWCtBcW1kbDYr?=
 =?utf-8?B?dHZwYWlCdXNXeEhmTGhNY2UvUC83bTNOQWM4bWl1NGl4MkhYcHVWblQxUHFS?=
 =?utf-8?B?bHdqVTBGVlhOV3JzUlI4L2FJbWhmVEwrdlBJc3ZWc3YzL0ErNWdjNHFJVFpj?=
 =?utf-8?B?R0hidlBuN1g0MGh4U1FJam50aEl6V1F3eFZHVm9VaXR0VE1ET3JzNlYxcUx5?=
 =?utf-8?B?MnVyckw3RlM2ZEFXMnUxMzhtME5LdDhwZTRxTHVZclZaK0MzUFBVb21HQi9Z?=
 =?utf-8?B?S2hTTGVwaDJZY1ZUM3YwR3Fmc0JCUUhMQW1LV2FWbWtaYnB1c2ptdTU4VjBK?=
 =?utf-8?Q?qbnY5+lTdyonQjsB17geFzsff1ZnH7G4PVlZn4B?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 640a0976-1a9b-452f-1601-08d9149bb3f1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 16:42:02.3442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+t4vTlRn1J3TswnQviXoioibxoaID57WhNtVQBh8iLN5rb//KpAFwofinYtohIoFJoxsPR97UjJWJmds/RketuSOwlWEXqep/dcVqvO89c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3429
X-OriginatorOrg: citrix.com

On 03/05/2021 15:22, Jan Beulich wrote:
>> Another consequence is that we need to rethink our hypercall behaviour.=
=C2=A0
>> There is no such thing as supervisor states in an uncompressed XSAVE
>> image, which means we can't continue with that being the ABI.
> I don't think the hypercall input / output blob needs to follow any
> specific hardware layout.

Currently, the blob is { xcr0, xcr0_accum, uncompressed image }.

As we haven't supported any compressed states yet, we are at liberty to
create a forward compatible change by logically s/xcr0/xstate/ and
permitting an uncompressed image.

Irritatingly, we have xcr0=3D0 as a permitted state and out in the field,
for "no xsave state".=C2=A0 This contributes a substantial quantity of
complexity in our xstate logic, and invalidates the easy fix I had for
not letting the HVM initpath explode.

The first task is to untangle the non-architectural xcr0=3D0 case, and to
support compressed images.=C2=A0 Size parsing needs to be split into two, a=
s
for compressed images, we need to consume XSTATE_BV and XCOMP_BV to
cross-check the size.

I think we also want a rule that Xen will always send compressed if it
is using XSAVES (/XSAVEC in the interim?)=C2=A0 We do not want to be workin=
g
with uncompressed images at all, now that MPX is a reasonable sized hole
in the middle.

Cleaning this up will then unblock v2 of the existing xstate cleanup
series I posted.

>> In terms of actual context switching, we want to be using XSAVES/XRSTORS
>> whenever it is available, even if we're not using supervisor states.=C2=
=A0
>> XSAVES has both the inuse and modified optimisations, without the broken
>> consequence of XSAVEOPT (which is firmly in the "don't ever use this"
>> bucket now).
> The XSAVEOPT anomaly is affecting user mode only, isn't it? Or are
> you talking of something I have forgot about?

It's not safe to use at all in L1 xen, because the tracking leaks
between non-root contexts.=C2=A0 I can't remember if there are further
problems for an L0 xen, but I have a nagging feeling that there is.

~Andrew


