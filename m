Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA559321DC3
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 18:12:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88283.165866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEEkk-0003tV-Kl; Mon, 22 Feb 2021 17:12:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88283.165866; Mon, 22 Feb 2021 17:12:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEEkk-0003t8-HU; Mon, 22 Feb 2021 17:12:10 +0000
Received: by outflank-mailman (input) for mailman id 88283;
 Mon, 22 Feb 2021 17:12:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rhT=HY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lEEkj-0003t3-M8
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 17:12:09 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3dc3b59e-bf3d-4eb5-b76c-828cbd628a9b;
 Mon, 22 Feb 2021 17:12:08 +0000 (UTC)
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
X-Inumbo-ID: 3dc3b59e-bf3d-4eb5-b76c-828cbd628a9b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614013928;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ds1cMi/eMDqkf5hlS1IB0OeIlq9uralr44dx+zsfPQE=;
  b=KYHrkKS8EhwtFa05NJW2DZWxXj/HVkcISqNwPbagyrNUDjwH/6dnEbbn
   drUiVosFYW4iKxZRjrNK3Urrl59n3oZvoITc9plFXLZhyDCauTfCxIr44
   TpzUPhXtrPoGnpa8TVQr+8utdxhZQcqjM4ENH3lZ9ZL/FA8kMEyBfxtVN
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ca+iF0xMLVRcZwaHeV+gjGhVEzzkIQ20M6WgDmDsgJKdbCGhg8Fb3bbT70FeUNcVo7dMCaW+Tg
 NQbmoAWKkecDTzXTxQKk3vclibmmYH0aOXTR7Dwv/IxLTqo3QJbvxgEy+7VprYh4AHlHIwNOi9
 JtWTi69cqxBH6+8hDqHTbCWfVV0Po/NCPVb45Zmi23czsCBHhYRL54KiWXp9Vt7n6Qtt5P7HsO
 uMsQSAuFRf53EAiNNoCFlYmeWtUv5vMZsZM7ttn67JrmhHznLMrHm/qfGzqgeLYHBQiF1RTEAa
 kfw=
X-SBRS: 5.2
X-MesageID: 37688133
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,197,1610427600"; 
   d="scan'208";a="37688133"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ialnecX72XViOO3FJWCixyflgi2q24tygirmwPzTX48wzqpipdIw/CVH8DQ2igUCsEJtrtr8cf4uUAXhCseFebKiMRoVd4C/EgcxVtk5qHyGmSnjEUMdkqEMAuYY0POs2/q4weyOeVLeRNJV3SZ+H5sn7iTIuouSyB6nbfmeV4khV7XVqatJrv0NgZUyeBhda1H+QpkQlp7ALnMBc+MxqGSTYuNsCXymjevyHzZ3WYz+xfcgu3fN92TjCg4GnqzCVYQCI88rFo/ptkUGXeoH7LOmLMZboNx6Knzwey6IWdJlnvx8jcPzJU3mWXazxWstjC2u8nU4Ref9qHxgd41yqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekn/jOu948u5aKc9artCXz4sJqW/I5i8Z8FdNCAhuwA=;
 b=LzD1t1isVsUzgyyeuXQAej/h1tv+/DNMR11LwAlsW8lZQXKKD0Tpwr6zbQEG53aEFI71CVJR/Gin4garvdizY1x6sBhmfPzGMuzFT4/D40BhB8UyBZZStSje+gz+9mbWdP+RFw3YKL4evRcM3pno/0pgIcO2DM+KeApOid2yY8yS328JHcpHqt3WtJhZ3CguxQRbOKXXYCrW8Se35CnPuXZXQnRFhI7NQL0ww8Nc2XOCu91UQN2eQ75gtBSNEhW14Z9lxsRTD0q8i8Iv1Ayj+uTjNH3ognhkFaFz5qlCjjMwZ3t5kYjwjedqlyHLLldX3UR9p05MKQiIf69NMgt8Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekn/jOu948u5aKc9artCXz4sJqW/I5i8Z8FdNCAhuwA=;
 b=tVii/anEc87Bp1ECSOBgX3UM4C19f4BGby6HZtizN1rwJqc//wX1YC5w11JeSY5BfoRJOXA+LTgmGhmmtgsPkwgqX4NwkSptZxXk4EoPV1StHpaRUvuYYkqMx5N+0bfHKMnO75PwJmihZRymN/F9H6uM9R5iKpOFOlOmy7Ni3tU=
Subject: Re: Domain reference counting breakage
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Ian Jackson
	<iwj@xenproject.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210222152617.16382-1-andrew.cooper3@citrix.com>
 <90be630d-dccf-f63f-8419-dc583204b3a9@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f32e70fc-ad67-836e-5181-5d9d2dd9cd7a@citrix.com>
Date: Mon, 22 Feb 2021 17:11:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <90be630d-dccf-f63f-8419-dc583204b3a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0389.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a901f65-5f9c-4763-fa69-08d8d754f9ed
X-MS-TrafficTypeDiagnostic: BY5PR03MB4965:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB49658BCD636EF6271C30BA76BA819@BY5PR03MB4965.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /3xYG8/ShVuQb4uWMxC16XkFUmcNR20RJADfvo7mqAArBWfKnNuyvQLV57jdjyMWLuhJLwciGg8LeAvfXAiVhwLSujj70XJqK1SpGkFIGiK3wTXaNSKv0gUfIZe3JKEIyo4TGaRE03UDnQApyZdaMPxysKFWMBqr03Y8gG3pw/6f1Gj4fVj00KB4PrFyUBw9UbQ6/U9E6Eg+8xUwAVcWOK3lGXlF1I94KI/tvJOjLgAtbF1Lz/Qy8kfcQB9Pe1JHQ9MgSZ9X5Di7s/jICWjJgV7BfG4O7X/OKGkpKiMf7ElbKJ1ngVsr44ex07JSWprEbncWRkp+WjMKEnr4aRr/yJpk7xw61NCzAo0v64R6MhfsO/M+fpcVmKj1/d+DHho5Xzpr10FOg7nSskV2KbXk3RGCPHNGaG5QO/LpuVp4b4gKSHSnD6C7m82S0fKnhAYC1UP+jlBBqhKThZxF3E5DpXURdRwVCicokDlfyTzXEHfpfjpcmeoqHXptLjbfzAm9oqcXW8c2HtYr9GtOt/F8Z4VF0uvjW/p1ScvZDjf80eNGsSCXUnCW/XGZMVHHjrP0UiPQ91JJPzscs7yQavPlTI0bW1gafvNYIMpDSpQhw5g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(6666004)(36756003)(8676002)(3480700007)(4326008)(31686004)(66946007)(2906002)(6486002)(83380400001)(2616005)(8936002)(16576012)(316002)(86362001)(31696002)(6916009)(66476007)(53546011)(478600001)(66556008)(5660300002)(956004)(186003)(26005)(16526019)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dHlFdGZ1SHJhK2lxNE1uWVl6OS9NNmlRS2dlY25ENFZmcFZvWG9SM25KdkMx?=
 =?utf-8?B?U1JWNmFSNW40R3FKeVcyNEk2cjJvUFF2YkdsN1RIc1huNERWWGpqNXYyOXpj?=
 =?utf-8?B?S1JKUkFDcWd2a2kxdmcwMWRGKzVweVM2bnR1SlNUVkVFd1hNSG9hOUpWaEdl?=
 =?utf-8?B?NnJzWUczVU1yczIyRnd6VGRsam1PSUVsUkFVVTlmUnlRNWNoT1kyTW9VUENJ?=
 =?utf-8?B?cFpiQWM5RWRuOTFiTHp6eWtDSG5CYlJMb1FQOGVYOEV6UFpiSGFrZzFWdmVF?=
 =?utf-8?B?eTJGS0xYQUhrenFaSUtMUkxTSVZRR3dNbDNWcVBQRGhMekUrOVA5ZDhXK01L?=
 =?utf-8?B?cjhidnpuOTJUT0hDYVlRQ1NPTVhZRW8vTEdmZS8zMFpldFVxQ09TNGZuOWUx?=
 =?utf-8?B?cWEyVWVKWHczMXZIOWdDM05VZ29kRXVEMkEyNzR1eDR4S3FySUJlVERad2Qz?=
 =?utf-8?B?eHpEOFk1RGFMb25JRzdnb1FsajRvZ09xR2J0VE9jZXRja3Y0YXBJU1JYaEYx?=
 =?utf-8?B?K1REMU9PZjR0VThIdkViR0RhY3V5L0ZpcjcvTTdvUWFwVklzVnBDZng4a0E3?=
 =?utf-8?B?aTBxM3RIQjAvbDlxYjIyQkRYYVR3TkxFZ3VpV3d1cFR1bUxWdHM0WmhVbm5N?=
 =?utf-8?B?a3JhelhQZ0NSaTBEOUg0alRkWnpkcWRnQkMrc3JGM0Q2Yk5yUnhSbzZpNGJ3?=
 =?utf-8?B?WXhoNUErb1dvN1lRTlMzb25KbXQvdnVWdUNWQmdhMnl0WFRuaHIrakhzbzB5?=
 =?utf-8?B?UlBKRzlLazBmWXhYazhtOVhUV2lOUFlYNXZpSDNHK2NWQmE5SjhyaE9Banhl?=
 =?utf-8?B?KzhZbFJMQVh4SXMzbEJKSVJEUW04Tlg2Z3hCblkzejZURzFXSHlQNC82VWFL?=
 =?utf-8?B?WGgwMjhWSG93cHMwa013c05VRjFLYXVIWFJnemxkNkJRNUx1R01TWW1PMmsr?=
 =?utf-8?B?R25Zci9JaXhTMVhsSmtiSlRtYUczNGYxbWdNLy81VXJaaGFEMlhtYTVHMEk5?=
 =?utf-8?B?anZySUFzUFFFOGNPK2ZFTkYzNkhYYXRVWHlFSE1KMHRubXo5NE5hOGhoMkpC?=
 =?utf-8?B?SmRhck5OeVNvL3NSQ3E2d3dwb1E2MTU2MjFxOVlxdTNqeTZEb3RnMnY4UmNB?=
 =?utf-8?B?Ujd3L0U4NlZ1UlNCOWNGNjVkakc1dllTK2p1QU1udWpSaDVFQlc1UUFQTTRP?=
 =?utf-8?B?NU9FSzZVQnpCY3UzcFo0UHRZRXpObzFmbGNiSk9kUnVQMFJXenRrVk5leTlS?=
 =?utf-8?B?WDUwZDdFOHNUUXNUbWZWaWdKRXVUbitjdHBzbU40cEpTRWNsWlJnRVRjOUE0?=
 =?utf-8?B?S1JvQXB6MjBMRFo2dHZMZ2k1dEp1S3BTN0NzVE9ybjNWQWxCM3BrWFdEOXBG?=
 =?utf-8?B?L3ZVOStuWG1uQzB0cmtrZjJhNjNISU40MEJzZzRkRjhTTm5iS0tReVZ5ZktB?=
 =?utf-8?B?d2k2Vndlb2hhcklWblZRcWZtNTNNNzFWdmtWQ2ovTkxIbDd1Z2FabUwzQndD?=
 =?utf-8?B?SXVub3MzdDN6b0ZEaURWc0tzMEFhSVBETUhXMVo5cDA1SVZmbVRLZUI1Nk9Q?=
 =?utf-8?B?MTZoWGF6QjlNN2J2OXlDbGhkbmFwZTk1cXdQWmZCbUJjRzg4S0tzajBGNjh4?=
 =?utf-8?B?aExmN3laait3bTdodmN4YlU5cWFoZVZaOHF0NVAxSllBa2UyRDBoL1QwNkt6?=
 =?utf-8?B?Vzh2ek5NVytqYndBMWtzbEtGQUZ5bUs1ZlgvdmxWNGlyeGh0TzdHVGZWUjJP?=
 =?utf-8?Q?4foNkumqdGIj2Uqp1UibATC79uqr/SZqkSlwrPB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a901f65-5f9c-4763-fa69-08d8d754f9ed
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 17:12:04.4881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BuU42QyKatDgIeDie2usS2etKhk9N3tg6o/umL14NA7oyrn98XwKyqQexBFRu5CRBcl6BF3ou45WIYwDOhemanMhyhNBR1HmHzHWERasEWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4965
X-OriginatorOrg: citrix.com

On 22/02/2021 16:49, Jan Beulich wrote:
> On 22.02.2021 16:26, Andrew Cooper wrote:
>> At the moment, attempting to create an HVM guest with max_gnttab_frames of 0
>> causes Xen to explode on the:
>>
>>   BUG_ON(atomic_read(&d->refcnt) != DOMAIN_DESTROYED);
>>
>> in _domain_destroy().  Intrumenting Xen a little more to highlight where the
>> modifcations to d->refcnt occur:
>>
>>   (d6) --- Xen Test Framework ---
>>   (d6) Environment: PV 64bit (Long mode 4 levels)
>>   (d6) Testing domain create:
>>   (d6) Testing x86 PVH Shadow
>>   (d6) (XEN) d0v0 Hit #DB in Xen context: e008:ffff82d0402046b5 [domain_create+0x1c3/0x7f1], stk e010:ffff83003fea7d58, dr6 ffff0ff1
>>   (d6) (XEN) d0v0 Hit #DB in Xen context: e008:ffff82d040321b11 [share_xen_page_with_guest+0x175/0x190], stk e010:ffff83003fea7ce8, dr6 ffff0ff1
>>   (d6) (XEN) d0v0 Hit #DB in Xen context: e008:ffff82d04022595b [assign_pages+0x223/0x2b7], stk e010:ffff83003fea7c68, dr6 ffff0ff1
>>   (d6) (XEN) grant_table.c:1934: Bad grant table sizes: grant 0, maptrack 0
>>   (d6) (XEN) *** d1 ref 3
>>   (d6) (XEN) d0v0 Hit #DB in Xen context: e008:ffff82d0402048bc [domain_create+0x3ca/0x7f1], stk e010:ffff83003fea7d58, dr6 ffff0ff1
>>   (d6) (XEN) d0v0 Hit #DB in Xen context: e008:ffff82d040225e11 [free_domheap_pages+0x422/0x44a], stk e010:ffff83003fea7c38, dr6 ffff0ff1
>>   (d6) (XEN) Xen BUG at domain.c:450
>>   (d6) (XEN) ----[ Xen-4.15-unstable  x86_64  debug=y  Not tainted ]----
>>   (d6) (XEN) CPU:    0
>>   (d6) (XEN) RIP:    e008:[<ffff82d040204366>] common/domain.c#_domain_destroy+0x69/0x6b
>>
>> the problem becomes apparent.
>>
>> First of all, there is a reference count leak - share_xen_page_with_guest()'s
>> reference isn't freed anywhere.
>>
>> However, the main problem is the 4th #DB above is this atomic_set()
>>
>>   d->is_dying = DOMDYING_dead;
>>   if ( hardware_domain == d )
>>       hardware_domain = old_hwdom;
>>   printk("*** %pd ref %d\n", d, atomic_read(&d->refcnt));
>>   atomic_set(&d->refcnt, DOMAIN_DESTROYED);
>>
>> in the domain_create() error path, which happens before free_domheap_pages()
>> drops the ref acquired assign_pages(), and destroys still-relevant information
>> pertaining to the guest.
> I think the original idea was that by the time of the atomic_set()
> all operations potentially altering the refcount are done. This
> then allowed calling free_xenheap_pages() on e.g. the shared info
> page without regard to whether the page's reference (installed by
> share_xen_page_with_guest()) was actually dropped (i.e.
> regardless of whether it's the domain create error path or proper
> domain cleanup). With this assumption, no actual leak of anything
> would occur, but of course this isn't the "natural" way of how
> things should get cleaned up.
>
> According to this original model, free_domheap_pages() may not be
> called anymore past that point (for domain owned pages, which
> really means put_page() then; anonymous pages are of course fine
> to be freed late).

And I presume this is written down in the usual place?  (I.e. nowhere)

>> The best options is probably to use atomic_sub() to subtract (DOMAIN_DESTROYED
>> + 1) from the current refcount, which preserves the extra refs taken by
>> share_xen_page_with_guest() and assign_pages() until they can be freed
>> appropriately.
> First of all - why DOMAIN_DESTROYED+1? There's no extra reference
> you ought to be dropping here. Or else what's the counterpart of
> acquiring the respective reference?

The original atomic_set(1) needs dropping (somewhere around) here.

> And then of course this means Xen heap pages cannot be cleaned up
> anymore by merely calling free_xenheap_pages() - to get rid of
> the associated reference, all of them would need to undergo
> put_page_alloc_ref(), which in turn requires obtaining an extra
> reference, which in turn introduces another of these ugly
> theoretical error cases (because get_page() can in principle fail).
>
> Therefore I wouldn't outright discard the option of sticking to
> the original model. It would then better be properly described
> somewhere, and we would likely want to put some check in place to
> make sure such put_page() can't go unnoticed anymore when sitting
> too late on the cleanup path (which may be difficult to arrange
> for).

I agree that some rules are in desperate need of writing down.

However, given the catastrophic mess that is our reference counting and
cleanup paths, and how easy it is to get things wrong, I'm very
disinclined to permit a rule which forces divergent cleanup logic.

Making the cleanup paths non-divergent is the fix to removing swathes of
dubious/buggy logic, and removing a steady stream of memory leaks, etc.

In particular, I don't think its acceptable to special case the cleanup
rules in the domain_create() error path simply because we blindly reset
the reference count when it still contains real information.

~Andrew

