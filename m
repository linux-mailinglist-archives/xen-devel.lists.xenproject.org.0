Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B216F37BCFB
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 14:52:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126235.237599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgoKq-00033r-Ds; Wed, 12 May 2021 12:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126235.237599; Wed, 12 May 2021 12:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgoKq-00031h-AW; Wed, 12 May 2021 12:51:32 +0000
Received: by outflank-mailman (input) for mailman id 126235;
 Wed, 12 May 2021 12:51:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XikZ=KH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lgoKn-00031b-UG
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 12:51:30 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75f38085-516e-462b-ab77-33d7bee06155;
 Wed, 12 May 2021 12:51:29 +0000 (UTC)
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
X-Inumbo-ID: 75f38085-516e-462b-ab77-33d7bee06155
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620823889;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GmIYeagrbCa9LzpYAjfr5Enj0SQ41za5jf/Y4KY2MjI=;
  b=Llr6XrrH/qt16s2QOKnEF4MbPFo58C1F7I5SWXU9gNF7X0DxN1Pn6v58
   Vd30m8vk7OYfIlvXLlnakZ2AtoRl7OROvqJ6quGrmZqeJl3+qzfsinf7B
   YYbGWu7GBdMormAAU/CoMivIZRbSpbXZmdzS+mvLcX3O5Bxqn1t3qFDkd
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3J0ZSg6+jFenAhaRdBCjW3+9nzknH5gW1oxtPXyvpvXny7WMDHepCMOIHhEXMp7rA8bQd/CeuC
 DZuGinbIS1xOmiBtJt2E4TryRtXRp3Utaqzgp1rF+c5hLiAXjk9zLKhImeTqJbCTawrMJOMtnd
 1cC+TtZC2mNlTDF1/1rZoXmFZBra12fKFtj+wvHdcKMfYd7o1dRHOMnTD5MyvILXpKJxxpP9xs
 2BvC1nxIog3Bku/a1FnB0TJKJvwm5xC/DYWBA15coY0s7XJ15K/oogttabSBg11elnWEyglaTO
 9Kw=
X-SBRS: 5.1
X-MesageID: 44014494
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:QpMxqq01DWKjeyP8oKEFAAqjBGMkLtp133Aq2lEZdPUMSL39qy
 nPpoVh6ff14Ax/ZJhSo6H9BEDgewKiyXcb2/hzAV7PZmTbUQiTXflfBOnZsl/d8kTFn4Y36U
 4jSdkaNDSaNzZHZLPBgDVQZOxA/DDoysyVbUq09R1QpEpRGsZdBk9Ce2Cm+socfng6OXLsf6
 DsnPaviQDQAEgqUg==
X-IronPort-AV: E=Sophos;i="5.82,293,1613451600"; 
   d="scan'208";a="44014494"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EH89SEomS4TbD6R0oQ1+ZKeTWOhQzUs3FxijGObGiyWorCHGq+NOlyas93Nt+WUTEsg/3u76AI68noQvdsKUvEv6mxrbHm3Ii90e+0k1+OHXSemMlIGqBZUnupMprr9VVnD0iiAA0ItC4cc9/SccHEUTkt9k/ojQ5t/2vehev0E+epH023QhHfWEdDziZHDq0z2C7SnGKKb3Y5KDmuTlNdGGsniEMtl+17YCzx20JzeCYhwShQx235Gle2LQC2MRscDkE/tpnS56jD+q8fuDnnO66Jd+XMfHMPspDdoth94Qbxk18nF3sO4O/mxukcQGpF9SL/ulvsPti8xJ9cZYsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9XRHFJhm1Osb5CRcWolVihP5HVv2ZIiPvyfR+Wyu9M=;
 b=hVRMgEX8fGr0IE56E+/wirb/VjGeVqbCC6zUht+j10MHNyqPmFyY0KvwwNACghHzhH1Sg6hDmu2uHV1D/3ty5Cllz/QlfX5C70ODuO35bEUVi9si8yxvEX+EfpxKTVwBBS275JyeKgMfI6mrYEsZ3a+7kUw7ba27Ox4wOryRNy4Lp1AqCHSL2ON+bizAJjm8u1TwD4mVYgrplVClMBOK1GPFqZMLHTX3AVWh+UVY3qpcbIjjYSve+jIEOUv9YuurcedlGTFJ2+kX2bOer6nn2eCy3rC6vJ38we39R7tHpZcaGh0XHbCnxRqjwxrSWifzdrh1QfyxIVxVjQfvipGe1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9XRHFJhm1Osb5CRcWolVihP5HVv2ZIiPvyfR+Wyu9M=;
 b=SLQdOEx65rw+JKW0DLV42B2XdojSJatiM7kp7dZeFzZPz+WRgjOfzX/HXzner0ROtipFOIYCVd2SelRx5kRhtVO4dNvaiyDE2XPoi8YV1Oz8nqTYvpQf0+eDHbgncacp9YQyGJYEbJYWCoWYqHnNlG9lm0DRGL2FEaFsOqQdJao=
To: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "julien@xen.org" <julien@xen.org>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "jgross@suse.com" <jgross@suse.com>, "wl@xen.org"
	<wl@xen.org>, "iwj@xenproject.org" <iwj@xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "dave@recoil.org"
	<dave@recoil.org>, George Dunlap <George.Dunlap@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>
References: <cover.1620755942.git.edvin.torok@citrix.com>
 <c744d834-659a-e361-df97-128032402950@citrix.com>
 <7c1a9a8b317fcbc778acaa218ee96e01d15b98d5.camel@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 00/17] live update and gnttab patches
Message-ID: <bbd8ccf8-6bb4-7cc0-515d-1f14cd4404b7@citrix.com>
Date: Wed, 12 May 2021 13:51:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <7c1a9a8b317fcbc778acaa218ee96e01d15b98d5.camel@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0240.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92d6c1bd-4791-4320-288d-08d91544a6bc
X-MS-TrafficTypeDiagnostic: BYAPR03MB4872:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB487294BE9765F73A9E093A4FBA529@BYAPR03MB4872.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rMIV/IM6t5hjmcBUapHtIObRGVAtU0hbO9nuOThuHsR3lGc4bp8GOZWToRRCDw0LO6r/20NPAKNblK3vUTEGzbwQC1VOzueZ0ZBpwPCJKLjeE4m+dc9fQOODAUaGIMSNmeq8CkbKbIxXLWIu7fo9xOpY90DbF22OJqvZOZkazfjWZLX5uNfx13YTRKmRSDJyANNRdZ0NGcHWy4Yr7ryewczpkqMwwLDGsLQSygGyPw/47YetwZTSDZQRvarqKpNP0+W3kE6jIAJ4ThAqSpjGzl5qm9JvD3QgT+H6GNrlIWFouBkvRWgWNHef+0aFZL6/s1kn4oGeU2FbAvtBtie9GJjr5EDIPKX3PBQTBR/4fcQ8SNyfeprMLVdCKGjY127ocrOGFzuOnt6XMufU5w3RmJC8+wimcC95DsqWuKf8+g4HbeJFbXhTMEZeCjfe1R1bHMMixV9b/nv3FEgujDVhaEUOv+KdZ4o4zxtN9bVmMpFb6dpPtNPDJnN/keZJ+xSMi7Ac8hF56lyRNcoQM6k7u0KYmdL67bfEnWWzmenMYjCyYMW7p9yyFoN84DLHXI9xyehI64i5o9e2L2biCO2rze2sf7SDv6oKlT8djxE6aXDF1Vl1fpwxqDxcsQzjaakxchac1MKxvuZyqE2K+Wuj+CrjBCcW9F92AXnbKay8iaOk3fcqh3wJ+aab5Ga/XW3dmoeCVnCC++dFzHpmVczFiiKvnbmz4a5sH3MCY2Whl0/J209KmLF/4rwa+dfuZtnWGoVjWzatSH6PpJNWP9d/Bw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39850400004)(396003)(346002)(376002)(15650500001)(66574015)(478600001)(8676002)(110136005)(316002)(6486002)(38100700002)(31686004)(54906003)(86362001)(2616005)(66946007)(66476007)(26005)(956004)(16526019)(186003)(16576012)(53546011)(36756003)(2906002)(31696002)(83380400001)(107886003)(5660300002)(8936002)(966005)(4326008)(6666004)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MjVMQ0FjbVV4VlhyYmFxRi9BMU9LYlFSSmdSM3dzeVV1dStZenY0Z29TUXVl?=
 =?utf-8?B?czBTbWdZYmoydm85bllpY0p2N2g1LzJhLzcxQWRrTlZ2emdKSmRxMS82aTZN?=
 =?utf-8?B?S082ekVVcXhpelkxMG02bTBYWG1JTXBWc2FBMjRRSmk4MTlEeDVUVVErUDhy?=
 =?utf-8?B?UWxCbDU3aERILzRLMDZLVFdpTXUrdWE3dVIxY1FPL2d4UzFjTHNBcXpsWDFY?=
 =?utf-8?B?eEVubm1hTzVNSDh4UzN6ZGRwemsrUFErWGZvamkyT3kxaERjVDhYOVgza0NF?=
 =?utf-8?B?alBoSS9KckJKRmY0L0JtQmRabUxFRGpaZmtBMytOUk43N1ZMcjRhRG5VandK?=
 =?utf-8?B?MklFbDJ2cGJFU0tLMzVTdlNZTnhwcENYZlFQVDgyd3VUSlRENkhyTXhpV0Rr?=
 =?utf-8?B?MXR6OWcxcnRYcTBwbHIyTFRhN1ljSmtLVVlRSmpJUjMvMWJTOHlmRzVUQ3hi?=
 =?utf-8?B?em1pNkNWWWZSdjJuRXVUcFN1R1ZCK1NXSW9DZkl0dGtmQmNPZDJMVmdCNFh0?=
 =?utf-8?B?OEJ5cEdTVzB5Kzk4QzhmeGt0MW85MHBiVFFaV0JkUGw1bzJYdU8wZ0lQcUZt?=
 =?utf-8?B?YTA1RnVpQjdUaGo3eHl5Vk1Yd3RtaGtQeWcxQWJlRXVGemM0b3ZlQzVZOEgw?=
 =?utf-8?B?U0VXeWY5NDZUME5CUUg3UCtORFBCbktkYlBOSmEwMXFnU3pUMnppdGM4ejZy?=
 =?utf-8?B?bGErK0xZclJMVFNjUmFkZzFBUFAyOTZlcmZjc3lDQkxwYksxMzRNQjZtbTVZ?=
 =?utf-8?B?UDBYVFdiQVN1UkZNcGxtcldsZHQzaEdVQisvWVZBdDdCK2hVNzhEZXpuY2t4?=
 =?utf-8?B?YW9vNDRpR0hiSVlXNDhrQ0g3aUJrOWlmdy8xdUJjWmhtSFluSHVHcnRWbGF6?=
 =?utf-8?B?dzlDbm1EVU9LRlpwY1hFM0hhUUFiK1NIZTl3UFVaZFIrY1lqR0VwWHVyWkha?=
 =?utf-8?B?RnhlNXhhTFFDSVFNU0YyWXNKbUo0UWo5WlpmbXNPSklKQlVUaGVkdXVmclRs?=
 =?utf-8?B?alBVUHZEQUEzRjVzWFhyWVNVak45YnJwK2lGc1N4WVB3NHNhOHRScVNhdFpZ?=
 =?utf-8?B?L0hHbkFCZklUR0ZGOW1vd1VOeEgwdjJxRUo1TjNoUytQbVZrM3plMzFsb3hL?=
 =?utf-8?B?dVFXK0t0dG14TkZXaHVDbHNIS3FUQU9qNmVuUC92RFQxaW13MlhSUENCN042?=
 =?utf-8?B?THo4T2RkNC9RNzkxb0I5c2FXdHgyMlR2SjBhM2p6VFFvTld2WS9GODQxTHMx?=
 =?utf-8?B?SkFnOC96RU5MeUw2dEdFaDVyaU9TUmZmeTJ3QTBydHFkeFVGckRoTlkyYWVD?=
 =?utf-8?B?c0tUcmpKaUwyUDRSUzdIMXprVWtub0d2NE5idFV5RDc3emxZOWpsL3htQ0dj?=
 =?utf-8?B?SmsxM1FTOWVYUzZnL1NVd2gwQ2R4QVBYM0ZEUTNZSmJHakorcWJXbWRDS29v?=
 =?utf-8?B?dDEvQ3VaMWs4c25yTGV0L2M1eWN4UlAvWHAra0lKVkFLbmt0M2NzaUZNTXVK?=
 =?utf-8?B?RXZoQ1doVDVBUnNrZCtCMXppRnhUUXFpU3MzTUpKbitycU41MGQ5M2tkQkg5?=
 =?utf-8?B?MkpiU0gyRmRnV0NNSDhTcU1SUGRxZWdFZXdONVYvNlFyVThzbXY1bFE2ZFJ0?=
 =?utf-8?B?RDI1dm04YUJNTkdtbnRxNVBrdHZzOUpKN1NjRjc1Wm9jR05UcVNmdm5veHho?=
 =?utf-8?B?RnpIdlhpVkhTZWYreDdMWGI4Z21JTVNOS3U5aWRXQlpXUHVCMGdEaldQOHUv?=
 =?utf-8?Q?F3QXMBmewWzJO4XADBINhlBnJP3eXfjqllmO05g?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d6c1bd-4791-4320-288d-08d91544a6bc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 12:51:25.1023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +7xCzu7POMF222C0JuhvvjbFA4oXMZ4PhkexWexG/JbTIYD+J/x925HcMIpSH0tLSrsM31MkVqmHbTUijvB1ew8JjnGr15l+UsoZr36jmpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4872
X-OriginatorOrg: citrix.com

On 12/05/2021 11:10, Edwin Torok wrote:
> On Tue, 2021-05-11 at 21:05 +0100, Andrew Cooper wrote:
>> On 11/05/2021 19:05, Edwin T=C3=B6r=C3=B6k wrote:
>>> These patches have been posted previously.
>>> The gnttab patches (tools/ocaml/libs/mmap) were not applied at the
>>> time
>>> to avoid conflicts with an in-progress XSA.
>>> The binary format live-update and fuzzing patches were not applied
>>> because it was too close to the next Xen release freeze.
>>>
>>> The patches depend on each-other: live-update only works correctly
>>> when the gnttab
>>> patches are taken too (MFN is not part of the binary live-update
>>> stream),
>>> so they are included here as a single series.
>>> The gnttab patches replaces one use of libxenctrl with stable
>>> interfaces, leaving one unstable
>>> libxenctrl interface used by oxenstored.
>>>
>>> The 'vendor external dependencies' may be optional, it is useful to
>>> be part
>>> of a patchqueue in a specfile so that you can build everything
>>> without external dependencies,
>>> but might as well commit it so everyone has it easily available not
>>> just XenServer.
>>>
>>> Note that the live-update fuzz test doesn't yet pass, it is still
>>> able to find bugs.
>>> However the reduced version with a fixed seed used as a unit test
>>> does pass,
>>> so it is useful to have it committed, and further improvements can
>>> be made later
>>> as more bugs are discovered and fixed.
>>>
>>> Edwin T=C3=B6r=C3=B6k (17):
>>>   docs/designs/xenstore-migration.md: clarify that deletes are
>>> recursive
>>>   tools/ocaml: add unit test skeleton with Dune build system
>>>   tools/ocaml: vendor external dependencies for convenience
>>>   tools/ocaml/xenstored: implement the live migration binary format
>>>   tools/ocaml/xenstored: add binary dump format support
>>>   tools/ocaml/xenstored: add support for binary format
>>>   tools/ocaml/xenstored: validate config file before live update
>>>   Add structured fuzzing unit test
>>>   tools/ocaml: use common macros for manipulating mmap_interface
>>>   tools/ocaml/libs/mmap: allocate correct number of bytes
>>>   tools/ocaml/libs/mmap: Expose stub_mmap_alloc
>>>   tools/ocaml/libs/mmap: mark mmap/munmap as blocking
>>>   tools/ocaml/libs/xb: import gnttab stubs from mirage
>>>   tools/ocaml: safer Xenmmap interface
>>>   tools/ocaml/xenstored: use gnttab instead of xenctrl's
>>>     foreign_map_range
>>>   tools/ocaml/xenstored: don't store domU's mfn of ring page
>>>   tools/ocaml/libs/mmap: Clean up unused read/write
>> Gitlab CI reports failures across the board in Debian Stretch 32-bit
>> builds.  All logs
>> https://gitlab.com/xen-project/patchew/xen/-/pipelines/301146112 but
>> the
>> tl;dr seems to be:
>>
>> File "disk.ml", line 179, characters 26-37:
>> Error: Integer literal exceeds the range of representable integers of
>> type int
> Thanks, this should fix it, I refreshed my git tree (there is also a
> fix there for the older version of Make):
> https://gitlab.com/xen-project/patchew/xen/-/pipelines/301146112
>
> Not sure whether it is worth continuing to support 32-bit i686 builds,
> any modern Intel/AMD CPU would be 64-bit capable, but perhaps 32-bit is
> still popular in the ARM world and keeping 32-bit Intel supported is
> the easiest way to build-test it?

Yes - arm32 is very much a thing, and currently 32bit userspace on x86
is a supported configuration.

>
> diff --git a/tools/ocaml/xenstored/disk.ml
> b/tools/ocaml/xenstored/disk.ml
> index 59794324e1..b7678af87f 100644
> --- a/tools/ocaml/xenstored/disk.ml
> +++ b/tools/ocaml/xenstored/disk.ml
> @@ -176,7 +176,7 @@ let write store =3D
>             output_byte ch i
> =20
>         let w32 ch v =3D
> -           assert (v >=3D 0 && v <=3D 0xFFFF_FFFF);
> +           assert (v >=3D 0 && Int64.of_int v <=3D 0xFFFF_FFFFL);

In the case that v is 32 bits wide, it will underflow and fail the v >=3D
0 check, before the upcast to Int64.

~Andrew


