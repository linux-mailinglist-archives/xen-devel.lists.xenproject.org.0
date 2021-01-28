Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C03D3307F35
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 21:10:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77447.140262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Dcf-0005BT-S3; Thu, 28 Jan 2021 20:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77447.140262; Thu, 28 Jan 2021 20:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Dcf-0005B4-Of; Thu, 28 Jan 2021 20:10:33 +0000
Received: by outflank-mailman (input) for mailman id 77447;
 Thu, 28 Jan 2021 20:10:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0GBf=G7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5Dcd-0005Az-Vv
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 20:10:32 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24155b8a-62e3-4aad-b479-432cbdb1abb9;
 Thu, 28 Jan 2021 20:10:30 +0000 (UTC)
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
X-Inumbo-ID: 24155b8a-62e3-4aad-b479-432cbdb1abb9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611864630;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sAKv26QV9GxPFLhT/hWdtPSRoZI1RuO9lVHK04vtwrw=;
  b=ERr+3+OnTBQ90Bftj4ydGwRV9+lQH1TgtX8OTEqolWjm0jcIekHMVsh6
   UBauEz+jrvxHyquq/W6lqwI7t6E0DeXrzhQfuPLwtAmeJ/54G7vvX02E4
   xhs0BYT5f0PVz8BxWZuxr2iUi+NFKw4sUHxer+t8IlW+TFDjKouHACskC
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vqAf0e4FNZub/ri8UM8EW3xxT7ogxZRTEWwFHZnpJ+SbIzVZ7SyfeEd3NxvldjioIUN5/eEr8m
 Zyi97ocxiJvw538524/uo+zmRpN7hXsUe4fkhwlSlc5DV2LzUBICDIgYAQ8zV5+i+9lBQNwb7w
 brZf0TT6+vymUnXGJ1qfGcPOlFe/RACg5knV/cDVlKihF5agnOISz4BgGrjREndfObGQhp8WcQ
 u/KmOuJ6mu84b6Tfh56cIEsh+8W277J9Ud+zkQH2KEnHt6WFX9InDClft+QkqHjsL0XaKAFpO4
 1+o=
X-SBRS: 5.2
X-MesageID: 37420714
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,383,1602561600"; 
   d="scan'208";a="37420714"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G9p6+Dcio/MRWYzbC8ixRkLXfF4J8UUfiSbYMEyaoK9TPEeSYVK/pdkyAUwOrIfqvqimge0IBuk8N1GDqw34UuOSpdC4/I7LJT244W9MBZftcnkbxYj21FwdnvM4n3t52othnQnnMQnzwhDWEjjW436ydNrd3UUl4oNI32jKU6Hzpdzh1V3UFntyKFRE4QdwhylrA33OBKtVaiVGKL6kI13aHZjtGOkyo1k7/nTWuLmCZf3gKUmnlKqPQS6oHht0/T9XGGgmC/z1gv+7Nt39t8gakFqqsYGUqx/0/kpBG99GoCJ1Mv5G5fvYeW46NgcN1JnlC6Ko+QVFE3RXepiJCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAKv26QV9GxPFLhT/hWdtPSRoZI1RuO9lVHK04vtwrw=;
 b=cT52E6PhdMxJYkySDMbYCUvqfjB9CNbovApJxCklLJGFXmyB05G9R0R0hCk5HZ2YuzGTovUIu7PIfN1mfeByIFdjzHVhqhbw6TsWAldaJ9DQwWwDLcQ58RA3vArb5iPutv+SjlPqu8IEkrjZS0qNxbhl+9dDxzSrCsMrwZNxGYX+BxfQxOxoznorTI2dBisCQ1DWi8vjriVwR7BEmDB4+fkRuDCdoO/gh7EFIaRWQHuaqC2kTMhn6YnbCITC1k9vKVX5mxyIMkZc7IBd8IY96QI99SHFYALIz88gnnN3ibyJiAEySLrulA8rzD0Wh1bz0nCoVbAFJzF2OCimXlDjLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAKv26QV9GxPFLhT/hWdtPSRoZI1RuO9lVHK04vtwrw=;
 b=axmVH7ixRjVLQITWq3/PlMSjjKG3LenG5YmhAo+C/LAhndXl2sIn2pRREw7Vmbq8q3owTyuFhaqlc/oCCMGbsL6NUslRgzAkU4u+02sZYBC130OgSpCOgcMAz46KbUVduwbZ0HXxtJ1KNsLA+Hix5uTd+DPWq9+LOMqn48dETTw=
Subject: Re: [PATCH V5 00/22] IOREQ feature (+ virtio-mmio) on Arm
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>, Paul Durrant <paul@xen.org>, Jan
 Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<julien.grall@arm.com>, George Dunlap <george.dunlap@citrix.com>, Jun
 Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Tim
 Deegan <tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Kaly Xin
	<Kaly.Xin@arm.com>, Artem Mygaiev <joculator@gmail.com>,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <ca1375c7-852d-fb3a-6895-5ef12ea7a01e@xen.org>
 <alpine.DEB.2.21.2101280919590.9684@sstabellini-ThinkPad-T480s>
 <1bdfda04-5954-a285-db0f-3f1633e5fd2e@xen.org>
 <5fa7024d-b259-3507-c708-676c52c13c68@citrix.com>
 <9d0e2e0a-4409-ee37-636b-a0403e3571fc@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8c980248-f516-b41d-2699-2bc23ba49d53@citrix.com>
Date: Thu, 28 Jan 2021 20:10:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <9d0e2e0a-4409-ee37-636b-a0403e3571fc@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0378.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::30) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1df03e0b-8a29-4ab8-ce33-08d8c3c8c0f4
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5501:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB55015FBA4F8B54B26CD0FD56BABA9@SJ0PR03MB5501.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KbGRf287Ea93hC1I9hl4tdRP/OFdrMfr+x3vn4i1MYKiwi0FcTVAKFc+xzI8hKDLrN+eI9jlzFWK6NlkVTg8jvKAGEBsazGFmNglgiuC1GGXlcbgMIe1T4/wnVCkEpLI6WXtNCjm8QWVe6CjX/q4snAMnPXIZ1MBuv/PXG/iHN/zY7WhwabLDroVaU88X9VkiR1n1hpGBVXtQnFTuWimzVuORVvvXp5gZvmKQ4AfFpAqGfi7s34yGcZW8mycqcZBBhCOzht4e5pT+I46SxuU9VeFUHizBeokD6hO9Fdt8lux4pxm5E14vOvg/twavTehN1hubmlW2q2y1qZyOW8Cv/RGqr5fKFk3V3AMopaMM3TrxKNTAqoQ5qx/xVB8gk10ZwjvnD6fN/JRQl8LtNJUfaL7hewVTRygQlsi2EYOINYt4s6UKxRIhC9DhGTCOeIfz1JO/2Sbs2k9bpu7BOcLVS5vU93ZzGu2x4FGL5ODMo+K7129+WOYJcPrpAGI7Oan0uT6we1sn7QTlwnkgcGlBFcGmHTnxlu1xNPSsTbYa638OBoS54imdbJTfRv/0DICKziU6Ag1pVUad9JtIwuYGLnmQlAk8futKWUtsTcl63k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(86362001)(31696002)(8676002)(16526019)(186003)(5660300002)(6486002)(26005)(478600001)(83380400001)(54906003)(53546011)(36756003)(16576012)(316002)(66556008)(110136005)(8936002)(4326008)(66946007)(66476007)(6666004)(2616005)(956004)(31686004)(7416002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OTNWd0poNHRtOXhDZVU1aDc0VlNPZk4zZGpRdFo2SWxkZ1hMRk1Ub0k0T3BB?=
 =?utf-8?B?eUtVVlpIcVFEeGZBeGp5M0oxb1JaK3QxN3Z4RUhNUjN5N08vMXhzQVZoenYx?=
 =?utf-8?B?KzNhNHNjaWRNeDlsU1Y5OFpNdFhNcWxMeWhFdXZWUkl6S0szZWVON21xaEJz?=
 =?utf-8?B?Q3U1bnhVYmtuQ1VxTkwrNVE5V0F0ZjJud00ybC9PSW9lRjFQRTlINHVNQjFx?=
 =?utf-8?B?RFJ0VFZIem54Zm40MkVYUTR1N1BNWWFHeUw2UkdBMGxMRW9GbGE3eUtYNUly?=
 =?utf-8?B?RzdRaVZwNU40UHl3NFgzTXQzQzJrOGc0RVl5ZjczM3JXeml5TjZvVU1WTlVG?=
 =?utf-8?B?V0FXS3ZRazJGdms0S1ZtOVFoSnFNV3praE1sUGwyWjNieU9yMjlDUGtMc3VL?=
 =?utf-8?B?S3lJQVIwZGZ5ZTFGdEEyVndoblkxYndJeHF3QWhXYW5OTE1BU0NVYzB5RTlP?=
 =?utf-8?B?eUFxaFpheHRIdXAwd3lzeUFISmlBR3VEd1d4Q1p1bHpPVGlycnJaU0MzRjdk?=
 =?utf-8?B?UG55ZGNqSjlneVlQWE4yQW1yYktQNENsemk5MTZNak1Nb05uODRNTHhHNUlT?=
 =?utf-8?B?M2dCTmFVWDk5U05Zc3c1U2pXMjV6eEZ6VS9BMngvSWxrZGt6QXlTUzRYcnV6?=
 =?utf-8?B?b0EzSGJGWTQwa3VwVEhkT0pqSnBiWTB6QkZIS2N3SFh1NXJlOEJpeDNmY2gw?=
 =?utf-8?B?dlc0a0pCZldLZHhTZEQ5RnRUc0hubk1VVDhXWkRyNmZsTE9oZnoxUXdmSlB6?=
 =?utf-8?B?SFc0V3RRVi9JeVV0SWx0MmxrRFpBZDFXaS9QT1lIT21Lc2pidlY3Ni9sZ0Ro?=
 =?utf-8?B?ektpaFVPS1ZFTXdEU3ZBbGZkd1RQSUNITWZjZWRTZk1WV3NhV2NGRElMR0Fz?=
 =?utf-8?B?RWgvQ0g0RFhZZ1NiY3MvTDFSQmR6UGhtU2JJYk1ScTFodTF1a202MWpTblhr?=
 =?utf-8?B?RFMzRmw1N3lsWTRRaVJ4WGd1TzZmWVhPRE1LVEEvWTIyVEpGdTM3NTVGN1F5?=
 =?utf-8?B?cmJzUlJuRllXRHh2cDVtZCtxdk9oRzBLMGl3VG5jdW1uL2krb1pTbk5YVGk3?=
 =?utf-8?B?MDBNekhFcXlONXNBV044LzZ3REMwVXlmdi83Q1ZwaVVEZVN3MHI4M3JQUTRl?=
 =?utf-8?B?ZklyeGJzU2UveDQ2TmMydkdETThPSm1XUjVOVWQrM3JCb1Z2MkxnbG5rdldG?=
 =?utf-8?B?QUt0eTVWWSswN1JkajNjVlNpcVRHQlE1ZVg0Ump0QmxyOXVQbjhWVkVzVFEx?=
 =?utf-8?B?Z2p3ZXUvRVpaVEJjc2lybjFZbWtJeWl1ZFBDZ2IzYkFSZzltcHVadmxTVUg0?=
 =?utf-8?B?MFlBN0NySG1VdDFpdjhpWHBHVFpMc2NubHlzNWZ6MEJpQmlKRThHM212blhh?=
 =?utf-8?B?Wk0zWGlhS3BDSUp1MWZuV1RuVWpDWWlkS1hyb1lNNkF4dnhUQnE2MG1ZR1lt?=
 =?utf-8?B?bGp1ZWZwNHRybnZMaG9UV3ZvVW44L1U3ci9aN05BPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df03e0b-8a29-4ab8-ce33-08d8c3c8c0f4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 20:10:27.4058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8L0QmuLy2A5tBzcdv/ExL4AVRzSgitFe8g3ZHSW7lo9mgxhUB++YgWvM/6/UHQcUuJh/466xPRM7TjGEojxsaID6qJioK/3wL7PPpuApVmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5501
X-OriginatorOrg: citrix.com

On 28/01/2021 18:16, Julien Grall wrote:
> Hi Andrew,
>
> On 28/01/2021 18:10, Andrew Cooper wrote:
>> On 28/01/2021 17:44, Julien Grall wrote:
>>>
>>>
>>> On 28/01/2021 17:24, Stefano Stabellini wrote:
>>>> On Thu, 28 Jan 2021, Julien Grall wrote:
>>>>> On 25/01/2021 19:08, Oleksandr Tyshchenko wrote:
>>>>>    > Patch series [8] was rebased on recent "staging branch"
>>>>>> (5e31789 tools/ocaml/libs/xb: Do not crash after xenbus is
>>>>>> unmapped) and
>>>>>> tested on
>>>>>> Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with virtio-mmio
>>>>>> disk
>>>>>> backend [9]
>>>>>> running in driver domain and unmodified Linux Guest running on
>>>>>> existing
>>>>>> virtio-blk driver (frontend). No issues were observed. Guest domain
>>>>>> 'reboot/destroy'
>>>>>> use-cases work properly. Patch series was only build-tested on x86.
>>>>>
>>>>> I have done basic testing with a Linux guest on x86 and I didn't
>>>>> spot any
>>>>> regression.
>>>>>
>>>>> Unfortunately, I don't have a Windows VM in hand, so I can't confirm
>>>>> if there
>>>>> is no regression there. Can anyone give a try?
>>>>>
>>>>> On a separate topic, Andrew expressed on IRC some concern to
>>>>> expose the
>>>>> bufioreq interface to other arch than x86. I will let him explain
>>>>> his view
>>>>> here.
>>>>>
>>>>> Given that IOREQ will be a tech preview on Arm (this implies the
>>>>> interface is
>>>>> not stable) on Arm, I think we can defer the discussion past the
>>>>> freeze.
>>>>
>>>> Yes, I agree that we can defer the discussion.
>>>>
>>>>
>>>>> For now, I would suggest to check if a Device Model is trying to
>>>>> create an
>>>>> IOREQ server with bufioreq is enabled (see ioreq_server_create()).
>>>>> This would
>>>>> not alleviate Andrew's concern, however it would at allow us to
>>>>> judge whether
>>>>> the buffering concept is going to be used on Arm (I can see some use
>>>>> for the
>>>>> Virtio doorbell).
>>>>>
>>>>> What do others think?
>>>>
>>>> Difficult to say. We don't have any uses today but who knows in the
>>>> future.
>>>
>>> I have some ideas, but Andrew so far objects on using the existing
>>> bufioreq interface for good reasons. It is using guest_cmpxchg() which
>>> is really expensive.
>>
>> Worse.  Patch 5 needs to switch cmpxchg() to guest_cmpxchg() to avoid
>> reintroducing XSA-295, but doesn't.
>
> The memory is only shared with the emulator (we don't allow the legacy
> interface on Arm).

Excellent.

> So why do you think it is re-introducing XSA-295?

Because the Xen security model considers "stubdomain can DoS Xen" a
security issue.

Yes - I know that right now, it will only be the hardware domain which
can use acquire_resource on ARM, but eventually we'll fix the
refcounting bug, and lifting the "translate && !hwdom" restriction would
be the thing that actually reintroduces XSA-295.

~Andrew

