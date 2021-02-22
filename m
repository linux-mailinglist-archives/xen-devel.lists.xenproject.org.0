Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D64B3215F5
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 13:16:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88025.165350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEA7O-0004dU-Qb; Mon, 22 Feb 2021 12:15:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88025.165350; Mon, 22 Feb 2021 12:15:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEA7O-0004d5-MC; Mon, 22 Feb 2021 12:15:14 +0000
Received: by outflank-mailman (input) for mailman id 88025;
 Mon, 22 Feb 2021 12:15:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w45/=HY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lEA7M-0004d0-IR
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 12:15:12 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7f909cc-ad91-4d6e-941f-4bc55c792288;
 Mon, 22 Feb 2021 12:15:10 +0000 (UTC)
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
X-Inumbo-ID: e7f909cc-ad91-4d6e-941f-4bc55c792288
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613996110;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=m1zTxuVTQpSQbr2cd8ZAo3Lkj50KlDQoCgbQFNWD+k0=;
  b=gfmXmwJAt5e+hGZxG94N5Jc+BrUXftdX/3jhN1rfMZFWZHabhNqO2aod
   cX/qslRJVmE6MEUWbvHJEeK8mJTZtI4aidkAWH/QZObt9q4iC4dZQ3OL3
   T7JAIFgkCyJhcO0EWFXYykATlcFa5pBPiobNXQqO2JC+8GnxFEoMbhgMU
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5Na/BLDdQGfXeaOVFk8BXLcvjtdqEGT61z7wx5j33B25YX5WwpwZD5ejKXqtHN8zBT+wD0ouTu
 PFImEiXm3gpVnvfubbLYToqbydZXqT6Nc5ZSgH97CYF5EEZA5Ckjoglik327M6yrPyhsCOKgze
 qArrBUSz+ZZbDSeprQGkYeMyha27n3KHBYYIT5LxNod8iasf2c7Wwmb/onU0IjIyjJbukM2SxA
 HolUu7yyEU4h5ha+oZrA1UhmZr5XWTRRtzQWTkz13t8uQ1uPBinJuor8b+x9flNicjo0h6+kUK
 wW0=
X-SBRS: 5.2
X-MesageID: 37659351
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,197,1610427600"; 
   d="scan'208";a="37659351"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMnVkIcF6qydhK2kimYdPKcekMeeaU7n5YswLs5H6eFBWcFGPMi7q2OTZVWm72gNbm48q8MGnJy83jBKrFKe+vNpTw+n+SqJWRf0RFtidRwQ7NcoklkMbpBShgUokQjT43dRN63WYw889nAuAmW07jmfnfpB9nnu83qgZkBlieeuDR0YO3XXKvGcq69CJgUN//Q5gPx+0ma6u0mOb1NM8WImiJCbG9VGgZxJBEGomlYPZ9BRaZIoUvBlPSif4+eDYnI9YYBN63ZZhiBW4zDOBDfZwQl1IvDn9gizg/GwWDrIKPtG0x1VcFOkJAQSt/LlU4Ql/IoB0e/PkbreoNr+6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qa3uRHj4XKIDzMx71uwje1sb6P0VBoR6WHFb8GYPcGU=;
 b=HiIJGuh0qcdaK2W7nSUykIix/JHwUSNBe9AqafW47UKQTC4j2YkBd7cGY77I0i1mhYuA4HBoWWvLZi0zCGR+q1rwSX0ae4cCBL+aXRYcYcSMx6EYttE/5/3FqqtIbu0vzHIHKBEdwS05eanRAwNcKvDmueKfibPx/JX4B7CMt8Ez6ZJ/eRUrazEWXCcyS60TdHiJMEvrnyXaangy7Iva1uRe9zquZD1K2K7lZQuDNm94C9np4Vh6bvUTnH1ddgSTyJmLLU05ad/k1R10MgsSv+Ukh7qikohIsGAMMZTZ5HF0RkpiZq09ef/stbYHjlnBRc3vOpxiXe0FlvHKx+qiTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qa3uRHj4XKIDzMx71uwje1sb6P0VBoR6WHFb8GYPcGU=;
 b=BOCLlZl6EQoBGJDiSSvbpoitLDPmfvCa057hnpqBdvouBLUq8o3fe2nC8UW/KOetJSFmOhyUlR8MsCs4S/818iDKvrQ77eoikUYUTdgbuzV3+od4egNAnQ5CGHYYxK65T2vuFFkKtFXKxZex7wUf3+GiAPoO2YuUZ7hyrUf9nl8=
Date: Mon, 22 Feb 2021 13:15:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, George Dunlap <george.dunlap@citrix.com>, Kevin Tian
	<kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH v3 1/2][4.15] VMX: delay p2m insertion of APIC access page
Message-ID: <YDOgRZoD46xrMlRP@Air-de-Roger>
References: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
 <90271e69-c07e-a32c-5531-a79b10ef03dd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90271e69-c07e-a32c-5531-a79b10ef03dd@suse.com>
X-ClientProxiedBy: PR2P264CA0008.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::20)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 028031e4-460b-4d2c-da81-08d8d72b7dc7
X-MS-TrafficTypeDiagnostic: DM6PR03MB3740:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3740B4F965F1C7076AB7B4C98F819@DM6PR03MB3740.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +91O/DjU+ytCLct8hpjJ8CY4U7T5twlbYype7uvQHdSbq65Sx2Z7VUu6Nllgv8IiLN7HIgtY3eDkiOlbVjCMhcanFkmfnfQwatEBmH/ThbP03SU4twHKd2jq9jxrN2HhTYTazFvI/3DIffPMfei+zNzohhI7xZASCr7VG+29Hp3DfFRhJ/qvYqQAkUELf9A7SwBwHUi6ItKrFLPH9s6Qcsz90a8RJSAJI3tSK4plN0/gnJ4gfjJhzFJiXVHOVKfBdEySCJvvkuwYH+DpzgoIAZEOOnU6Ukovg9QyiqSH721qTAwhcBBxyP2ZXg3nIrDZAAjAcPdjPbzjB/yeO+BGh7bqOr437pbDTFoWQCJFEGb0FGX5ey2cjwMNi5XSsS8czXFJIz75tiRq78hJwnPxpB/EozrWiXSORjrUBfIVKSpjVOIKrMALKvurEMPexAd13NelJnpIPqtwkWXK5pvRxYwmXWGfqqEqXsh8nB9JMMRma8++1POhYF4csouiAwaEU3a4nbPRWMvyU3zLdYAKnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(6666004)(54906003)(66946007)(478600001)(16526019)(9686003)(85182001)(66556008)(8936002)(66476007)(316002)(86362001)(4326008)(8676002)(6916009)(6496006)(26005)(2906002)(6486002)(186003)(33716001)(5660300002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dTFIcWdGbXhTcnNSbldVVFZLSS9tYzc1SXk0dmpoRDIwU1JVV0JWb3A2RDVU?=
 =?utf-8?B?OFh4cHJYRXkyYnBzV25YeXZKelpKTHQrd2syR1VUSi9BaHYzaTVzN2FwMWE3?=
 =?utf-8?B?dWhiM0ZHaVlKV0ZpakwxaDM5WTFpZ29waUdwcnpSTTFhMGRrZjZTRytuZ2Ev?=
 =?utf-8?B?UXdWL2dEZkZuRHRCQkhwSXpMNHpYR1YveUlSVUgwVStSM0RHd1czV1ZFZE1V?=
 =?utf-8?B?NERidm1Od1hNL3FPS1NLbTVyWFRyQ3dqUlV0cHBYZmJOekRjdUVRSmpTY0NR?=
 =?utf-8?B?U3dFZFpyT1lmOFRIOXd3R3dDWVNuOEJ0TlN0Ny9mdzNtY3AxeFc1SHJ0Smpx?=
 =?utf-8?B?WXgvMVVCV0gvd1U5REpSK1BPV0EyeU9BRUJ1V1BHYnFtS2hxdE45WVFSemU4?=
 =?utf-8?B?NlNNMDdjSWY5V2hkNldjanFZVlJ5SkJkamZyNjEzUGtJSklEMmYvYjJIZ3lv?=
 =?utf-8?B?WmR2OERvSDRVWUU3MmJYcE9xbCtBUFJVOVBmbGtXWXRxYlJSSWdIb052bzUr?=
 =?utf-8?B?V3dmaXRRdjJGTncwSlF4anpwV0FNbkVqK21UMi8zMnRXeUlWc3ZJNDUySEUw?=
 =?utf-8?B?cVFkVkRua1hqOHR2M2MrYkg0c3pId0M5ODlKaVVxVW0vZUJZeFdVZlBvV29Y?=
 =?utf-8?B?bkhUOTV3VHpneHFsNFBYTjRMdzMzeGNYakVDSW9IN2pjTG8yU21iUktJbEl6?=
 =?utf-8?B?M0pOY3lkWlE2Sjh2VmZTYzNvODNUWFovU3JYbkRDNjgvelRGZUo4VDFVOGYz?=
 =?utf-8?B?bFZBb1VZcEkyN1VQdHVxODk1UHNjZW5sSitjajJjSXBLNjFBQjZ3Q3ZaaGNC?=
 =?utf-8?B?WURIcjYreGI3N0N5amZoazNydGg4czNrdnBOK3ptV2RVdFBnQkdyU1FGcGlv?=
 =?utf-8?B?dDRISDNlNnBJeWxka0hiTnFzME1wUGE4YWFNM05xdHdQUnJQOVFUTjFVRW9y?=
 =?utf-8?B?elpaT2VSUjJJVkZ0bjdsSnZVVDV6aG16Ti8reHN5ZTJRMG5BTVRxTlBqMGt5?=
 =?utf-8?B?SG5CQVhlL0pwK1NUajNJMm91OC9yN3F6azM3bk5yVVZGMG90WTRRMllIRy9w?=
 =?utf-8?B?UXNLQm9WSEpIbHViNFM4LzFhN0wwOE1NSDZqSWlkamRxTEM0VUlOYUZta29Y?=
 =?utf-8?B?eVJidHJ6dlBReWUrbUFYQmNVWHB4aVR4Wlk4UnVaOHVEVVpDQ3p5YjNxQlZu?=
 =?utf-8?B?djZsNzgxTTYrenIrbms1ZUlHNFE0M3pVVWg2VWcyRktMSWE2Skt2RXpVNmJM?=
 =?utf-8?B?Ni9NSEVLeGx1TnlBYjUvMmRZZVZ4VDdkU1JNdE1ZTHU0bGxvU3F3bHE5MG5w?=
 =?utf-8?B?d3hVR3ZRMlRLUXc3RktDZlZhbTRidWRJTEx1OEhqNmprM3dMd0U4NFUyM3Nw?=
 =?utf-8?B?QUd4R3NaWmxoUm1oZlcxVzAzOG5qUG9iazRkQ3RDVjl2enRrS2dKcnpEK2dC?=
 =?utf-8?B?NEpUaTNXMDl1b05OOHo5RDdTUkttdXF3ZXptdkRZV2hFRDd4bzFOYTZnV0VJ?=
 =?utf-8?B?RkV3enlsQkxNWmprdVFucnF4d2cxa05DR2NNbW85M0xDNXNrL25VakE5bVhM?=
 =?utf-8?B?cVJhNU1PVURDaTYwMmxsUmJBaFVZMVBBVTBidGRNU1hoMzNCVmZTbmNWYTli?=
 =?utf-8?B?cTEwTnlvQ0pocThxRHlYOG9NK3FvVFZCeDZ2b1RKL3AwV3I4eHJKTDloZUhx?=
 =?utf-8?B?Vm41T0l5RmRQeUt0NGtJMlV0cEZlVzNqMXJMMWZLWVlwY2ZMelBrM1F5M0Rh?=
 =?utf-8?Q?bSnPLOUrraWEb9CmWGQp252gc0Z7sJnG755CNOJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 028031e4-460b-4d2c-da81-08d8d72b7dc7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 12:15:06.8681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yLKWV8d6FqBkUYa2DTuvqdFaD5sNGIGx2+xF779ZH+NdBxgitVm919rM3B24wReJqhpAGYR6Qlr5aFz24yQSBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3740
X-OriginatorOrg: citrix.com

On Mon, Feb 22, 2021 at 11:56:58AM +0100, Jan Beulich wrote:
> Inserting the mapping at domain creation time leads to a memory leak
> when the creation fails later on and the domain uses separate CPU and
> IOMMU page tables - the latter requires intermediate page tables to be
> allocated, but there's no freeing of them at present in this case. Since
> we don't need the p2m insertion to happen this early, avoid the problem
> altogether by deferring it until the last possible point. This comes at
> the price of not being able to handle an error other than by crashing
> the domain.
> 
> Reported-by: Julien Grall <julien@xen.org>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v3: New (split out).
> ---
> Hooking p2m insertion onto arch_domain_creation_finished() isn't very
> nice, but I couldn't find any better hook (nor a good place where to
> introduce a new one). In particular there look to be no hvm_funcs hooks
> being used on a domain-wide basis (except for init/destroy of course).
> I did consider connecting this to the setting of HVM_PARAM_IDENT_PT, but
> considered this no better, the more that the tool stack could be smarter
> and avoid setting that param when not needed.

I'm not specially found of allocating the page in one hook, mapping it
into the p2m in another hook and finally setting up the vmcs fields in
yet another hook.

I would rather prefer to have a single place where for the BSP the
page is allocated and mapped into the p2m, while for APs just the vmcs
fields are set. It's IMO slightly difficult to follow the setup when
it's split into so many different places.

Thanks, Roger.

