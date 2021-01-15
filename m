Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7622F7E22
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 15:27:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68144.121918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Q43-0000lL-Df; Fri, 15 Jan 2021 14:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68144.121918; Fri, 15 Jan 2021 14:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Q43-0000kw-AD; Fri, 15 Jan 2021 14:26:59 +0000
Received: by outflank-mailman (input) for mailman id 68144;
 Fri, 15 Jan 2021 14:26:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+hG6=GS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l0Q41-0000kb-TW
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 14:26:58 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91fe45a1-f6df-4319-855c-817b9f5c5891;
 Fri, 15 Jan 2021 14:26:56 +0000 (UTC)
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
X-Inumbo-ID: 91fe45a1-f6df-4319-855c-817b9f5c5891
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610720816;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Csaos1LT904bvySWGF31zjTU6964WhEV91dtbD1uEEY=;
  b=eMVkW/b7BwPypAiZYCo5schA2ifufGlQSJEfn4QPeF71+1UuQ6eA1RMH
   EHs+hLzKoW4JvOELfShaZJpR+VuXqG2xAmbpJmx1LHBpnrHqU3NhlJEKN
   BGX4Mo0QSDgtstS3LUhAKF1woKfx1mXO/3ht7Ibh0XNjc9uxpsTnuD0KM
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: I3HwSakoEXx2Qz7PI40Nv7+b8H+yUHXoyNu+aMFhs1wW6u3YlbFTZDbXt/AzZeFqt1QzBNvn9/
 UmC665C0YtmVO+0djjzgvAgJlDQ5FH53YtssSpmmIXzOpMmpYRobRyy88mv+evLV0CGhdt+iVO
 7w2H3ifHRtX7MLRXw0C90ZyFJejV8rmTCVQfuGd6tHVmEyXETPngp9b8dKlo4IIiQbnLaqvpIR
 LsJYpyTkXBmmkmU4JKOv4d4hOxDGgFpn5gtJsYsQ0UcvFVKoFWMQMmMLJtbC7yC6RDoJHes3fA
 OxQ=
X-SBRS: 5.2
X-MesageID: 35392772
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="35392772"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQczv/k36Itan4PM62fxFQH2MWnVcQOlL/B3uxA1StKLVnn26JjdRMxXirr/VWRgcsu+Md1Ha3u12Y6p+Oer4P6gWfm6TJo/ntoKpHO/8Yn2hV9wfa+NIPmc4Fz5ezhLa+L5kOJnh8KEmDS5qbieS053ox9sks2owK2fXy48NfSeaBSaZsrOcCUCjLqeMKEW70EmWajHZJjTQEP4crKyMwBVZqinazeiEzP7c0pAOgIi/cqLGYMeCkWJmcoIroRReF5G381bJp97LCYGT94CsCiu0yvlKgHoTH0QxlSjqxRvfvezUoorGW43NKSN4bk9oezxa6p5+Zqk2ce8XVYIug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICUvZtjDqtpibEfBWO1fKJyyaw+aNbSXYbWF73FoXeo=;
 b=frR5BMZpHi3c9QyFeW7GlcXxtIb6zKZ9ZVp5gGlklNiT9hZIZER4uRfVV2b5WE0k4Nse5Luab84eH54oNpse1tDHLB+ddmcChs239q0w2GUdwmcAf+cvVCfNpK6QM/BmPn/TGWpiMK2JzJHX9UFI6TYygxnBo449IsY3iJ21TfNynHyHa5EZdHV9c4vPlxh7Qs+xn49MkISicPQOzcOnaKSIiU7lPeXS6ghZXoCFk9wX4/htSl9FNobMdkIGJGoABOFUR7mx1cBWFVODXyiNwe0Yi7zkK8PfDFOOH/DI3Uy8z9CPsnAbHoHvANKkAg2OXqRpmWzHi/LdCJZBVnIfUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICUvZtjDqtpibEfBWO1fKJyyaw+aNbSXYbWF73FoXeo=;
 b=YF/fBvqKkzJnxaX/DNVXOIBrkLy6O+Pl3mjkLTseREQWDMk2G6dezbmPIpuH735x3yMg831atEXGXHGzmQ1eb7PgVbjG4EfHny50XVrsjbWX8cRa+DTttgeyYNAx/BPZo5WIv6VG+05XO+jAvuv2OBCPnNRxvhXcIet4LxbBTfw=
Subject: Re: [PATCH 1/3] gnttab: adjust pin count overflow checks
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <556c42fd-d7f8-f09f-eb3a-6b724d2b467d@suse.com>
 <38331526-5c24-08d4-b1b6-9baa16251c1d@suse.com>
 <fb12277c-beaf-2058-69ce-0c7c14bce56c@citrix.com>
 <cea405c4-354d-307a-4465-a9a59b1a5696@suse.com>
 <ab7cbe24-8a05-203d-175a-9e85d3ed1ee1@citrix.com>
 <54c340a9-4515-e79c-84b7-44431c481fba@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <66766f05-cbd3-1a1f-d3a8-db9c02961529@citrix.com>
Date: Fri, 15 Jan 2021 14:26:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <54c340a9-4515-e79c-84b7-44431c481fba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0508.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::15) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1155ccd7-f38b-4473-8371-08d8b961995c
X-MS-TrafficTypeDiagnostic: BYAPR03MB4774:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB47743649710045ED267887D4BAA70@BYAPR03MB4774.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EkgwMPUQ7I9eLAsYO5ed7yHV6SOZov7B/PtJAAD49tCEZtwQ2o0bu40JPd4EEu5gp8pw5IxYqsjvxxq/yQzZUu6Qcd/bFihfl/dWLsxgTzlb4cCuN6SeI5WNiu2P8vcIGVcp8cwg5FFO0wgpuf1dGD3e5F2YBhKFanRIN0AbO05ddzajn5bHnOj7bIaR3rwVwRAe+STay30IsjILdJMMFIGBTy6f7A6V9pUSivelVQMRr/eiooPa8Tq6cDzSMFAp8IOKokhXib2Y106r+I3d6e5Xqw2xl7vsxHaFi0uj20AkxASfBjCHUkFTD/EtGANUMbV3mupp9Yrc1IJfMeBVa+cpZAdveqxAANrBt3Bi8xBzhXsRc3BxACoLchwb+MNpcAmcEWYQoCY+AMN0zVQnETbALi7P6NE+BrW3O86CsRd0KEaGDEK5PMbHtP5xT7eWnST+KaCZ6Nybhntbg5B/4Invz/r4urrzSWooWGLbubM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(316002)(6486002)(2906002)(6666004)(31686004)(8936002)(31696002)(478600001)(66946007)(5660300002)(54906003)(26005)(36756003)(66556008)(66476007)(8676002)(6916009)(956004)(4326008)(2616005)(16526019)(186003)(53546011)(16576012)(83380400001)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aGFMRm1XMnRScmZodDNpMTRMQk13QVcyYVByNmRNV2svUStzS0dqcEpVcnhj?=
 =?utf-8?B?bGw5SC84NWZhUVIzanIyWkJSaGhJdE5yWkxrNk0zaW5pR1lYVWhXNis4c1lC?=
 =?utf-8?B?b3RZK1I3aTZlMUpLb3hZVTNLcExxQmZLSkJTbENWRExFYnNPUThORUVLY0c4?=
 =?utf-8?B?Z0dnVWlPVDFSOWJicEFsZ2Y0bjNVL3RSWDhZSmVJSTdHajRwMnFPSTNYNlFD?=
 =?utf-8?B?OEpCMFNReGxkN3RldHJlMGJoSG9Dci8vK1A1c1JyRkhXTnhRQWhycEk5TCtC?=
 =?utf-8?B?QVJRcE1zOTI2SUZCczIvekd3anRsaThSQ3liTUt3SFJMcHp4UndSc2c1MUMx?=
 =?utf-8?B?UmVEb0o4K3M2TGIrbXpLTG5KTUZsNUZLT2xkTlNUZkQ4Rnp6aGVhK0ZtYWRp?=
 =?utf-8?B?QllTRU5GT0ZyeWJRbXBpbVZlTStjaHR5VWpZaUczSGxHbGZucWRuZjZmQjVu?=
 =?utf-8?B?VkZkR3U1ck1qaXF4UFFrc1JiMEVjSFhrNlMzelVxZTBHRys0T3J4OTFNV2sz?=
 =?utf-8?B?alBsZk5DUEdhZk40aDVpekVlWVRUUFZhanJMZkk3QXNXZW96ZitDckJ1TlBI?=
 =?utf-8?B?TXhpSVlWZXk1NC9jSkdZcGFxcVd2NHVZTHczc0hiYzlhckI1R2pLLzd3aTBP?=
 =?utf-8?B?MXhUWEdNaVNOc2t5d3FJekxGcWFDSlhQUldCVzNJZG1VaEk1Kzh2bjhnQjVx?=
 =?utf-8?B?a2txb3d4NzVTTGd4cE11aTdGR0R2M2NUT1J5eVo1NUNpYXVjZHFsTnpuMjZX?=
 =?utf-8?B?VFpVWHBSUnFkOWg2SHRidmtqMy9CbFBDT09hV0hjaS9UbVhzMlNqbkp5ZFA0?=
 =?utf-8?B?M0hlRWhQZlhSRnkvMWtGd3BXM1JGVHpKd0p6S2FZdUxNMDZpbk5oeWFVdis2?=
 =?utf-8?B?KzlsbzBqTGRGWFpIUEFBcHk5L0cvclRPTUNhSTFRdlZ2Q05FUTVlaE5acW1R?=
 =?utf-8?B?dHMvYkQ5bXFXSGMrTWd6NFo5SnFBTTFSQmRrWHdjRENwNFZPaERpZVFmRWFt?=
 =?utf-8?B?YUVRZWJnbjdIS3JnSjl3NG82amJNV1FLS1ROelVkejNaU3NMWWNDRjFNblZz?=
 =?utf-8?B?RFd2aXlDS0hBamhSdktUZk9VUmE0SitOUlo1cnlsRWF4dFRNMDNGc0FwaFZl?=
 =?utf-8?B?cHBEMmorNWR1aVl4LzduamRXb2wrdnl3WXF2aSsxdVY5ODcweGtpS0h0MmxK?=
 =?utf-8?B?aGhiNVEzcW1LZU5JdjVHMUEvYzRaWnZya2hxYTJUYkRVdlJXVWRkNVp5NE9v?=
 =?utf-8?B?WTJDdlNMUHhMRXhPMllSNnpOcC9ZeE5CSXozNGlvZkVQSXNnbEgxLzRkMTRy?=
 =?utf-8?Q?wXdK5u2AcMaNXtBRV0SLanXC50mKaaZglh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1155ccd7-f38b-4473-8371-08d8b961995c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 14:26:51.1536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qNbuePcmsWlbJPQbU8HLvhhKuCO5W8CD1s66YCPXfO+oDgQ/Q7kg5JxL+2fDAV55K7nbX8uN6HtWT9qFu7yeV5TuaPMPGhArDDdXSVdGdf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4774
X-OriginatorOrg: citrix.com

On 15/01/2021 14:21, Jan Beulich wrote:
> On 15.01.2021 14:35, Andrew Cooper wrote:
>> On 15/01/2021 13:26, Jan Beulich wrote:
>>> On 15.01.2021 14:09, Andrew Cooper wrote:
>>>> On 14/01/2021 15:23, Jan Beulich wrote:
>>>>> @@ -1052,19 +1063,19 @@ map_grant_ref(
>>>>>      shah = shared_entry_header(rgt, ref);
>>>>>      act = active_entry_acquire(rgt, ref);
>>>>>  
>>>>> -    /* Make sure we do not access memory speculatively */
>>>>> -    status = evaluate_nospec(rgt->gt_version == 1) ? &shah->flags
>>>>> -                                                 : &status_entry(rgt, ref);
>>>>> -
>>>>>      /* If already pinned, check the active domid and avoid refcnt overflow. */
>>>>>      if ( act->pin &&
>>>>>           ((act->domid != ld->domain_id) ||
>>>>> -          (act->pin & 0x80808080U) != 0 ||
>>>>> +          (act->pin & (pin_incr << (GNTPIN_cntr_width - 1))) ||
>>>> This, I'm afraid, is not an improvement.  What we want is:
>>>>
>>>> #define GNTPIN_overflow_mask 0x80808080U
>>>>
>>>> The reason for checking all at once is defence in depth (not strictly
>>>> necessary, but also not a problem),
>>> How is this not a problem? There is absolutely no reason to
>>> reject a request just because some unrelated field may be
>>> about to overflow. In fact I now think that I didn't even
>>> leverage the full potential - the "act->pin != old_pin" check
>>> could also be relaxed this way, I think. Just that it sits on
>>> a path we probably don't really care about very much.
>> Hmm - I see your point.  I'd missed the fact that a previous operation
>> could leave this timebomb waiting for us.  (Probably wants a note to
>> this effect in the commit message).
> I've added half a sentence.
>
>> However we go about fixing it, "pin_incr << (GNTPIN_cntr_width - 1)" is
>> too obscure IMO.  Perhaps all we need is a
>>
>> #define GNTPIN_overflow_mask(x) ((x) << (GNTPIN_cntr_width - 1))
>>
>> but it does occur to me that this logic only works to being with when
>> pin_incr is strictly 1 in the relevant bytes.
> Perhaps
>
> #define GNTPIN_overflow_mask(x) ({ \
>     ASSERT(!((x) & ~(GNTPIN_hstw_inc | GNTPIN_hstr_inc | \
>                      GNTPIN_devw_inc | GNTPIN_devr_inc))); \
>     (x) << (GNTPIN_cntr_width - 1); \
> })
>
> ? And maybe name the whole thing e.g. GNTPIN_incr2oflow_mask()
> to clarify the input is an increment (which I personally take
> to mean consisting of only values of 1, but I realize views
> may vary)?

Yeah - lets go with this.  Its a massive improvement on the current code.

~Andrew

