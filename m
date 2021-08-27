Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFE83F9665
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 10:46:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173485.316536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJXUf-0005s7-Oy; Fri, 27 Aug 2021 08:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173485.316536; Fri, 27 Aug 2021 08:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJXUf-0005q1-Ld; Fri, 27 Aug 2021 08:45:45 +0000
Received: by outflank-mailman (input) for mailman id 173485;
 Fri, 27 Aug 2021 08:45:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B4Ba=NS=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mJXUe-0005pv-8h
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 08:45:44 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 297f4a15-0713-11ec-aa95-12813bfff9fa;
 Fri, 27 Aug 2021 08:45:43 +0000 (UTC)
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
X-Inumbo-ID: 297f4a15-0713-11ec-aa95-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630053942;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6nz7NnaI/sVa+PPsW9gJKpBw+SgFi8WizR8QQzCzYZU=;
  b=gCfWgniRJ6/P8OlGp9NqTML+xJq0IOvj6LUCjk+O2FZCwsUXWdkxxvMH
   q0QFcrnha/2R5Pa9bOutNXOC8v85c+mfbnr5neKDK+RyAxO/Gdw2JHbJT
   aDwYwBSqR24qi+wjBwAHhaNgjwulnHNvoRlTPSu0C2I3sq14w2lJJEr3z
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0G8RABUrA6Sg0qJVOh7KnYGXGu2eQoARN6sVp1NFwSop/GwB+82Co9uAKg9muANKXQoVVnV0uR
 qjOiR4Zs2DpDw+23jrLx74/Gip/ekZ6a+vYUoudoC+16XbQz3cSUSiAZaEioI8s2nEzRUwAlAc
 nQQLMqMc1jnO+R2h/XhZqonaK8xzC4ZL0q9vDyStg6EQvqt7zcjto3zrv/qqr6um+YelZUh1pN
 3DrzesaHOBkT2afP9a1uQXLQEKRYFvgFQqeWi3UDJKrbbqLI8sRNtnnezjT1937kiHsZwi3Gro
 U+h9SDXuOw/F8+IZzxyiADjT
X-SBRS: 5.1
X-MesageID: 51445973
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:2c2OWaD15m4VyPflHegpsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U4ssQIb6Ku90ci7MDnhHPtOjbX5Uo3SODUO1FHIEGgm1/qa/9SCIVyyygc+79
 YGT0EWMrSZYjZHZITBkW+F+r0bsbq6GdWT9ILjJgBWPGNXgs9bjztRO0K+KAlbVQNGDZ02GN
 63/cxcvQetfnwRc4CSGmQFd/KrnayFqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 n+lRDj7KnLiYD09vac7R6T031loqqj9jJxPr3PtiHTEESotu+cXvUgZ1RFhkFwnAjg0idsrD
 CGmWZbAy060QKtQojym2qg5+Co6kdT11byjVCfmnftusr/WXYzDNdAn5tQdl/D51Mnp8wU6t
 M844u1jesiMfr7plWL2zEIbWAbqmOk5X451eIDhX1WVoUTLLdXsIwE5UtQVJMNBjjz5owrGP
 RnSJi03ocfTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2n0A6JU+QZ9Z4P
 msCNUgqJheCssNKa5tDuYIRsW6TmTLXBLXKWqXZU/qEakWUki93qIfII9Flt1CXaZ4h6fatK
 6xLm+whFRCCH4GU/f+o6Gj2iq9MVmAYQ==
X-IronPort-AV: E=Sophos;i="5.84,356,1620705600"; 
   d="scan'208";a="51445973"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6dQGfZitZhjRnGQ8UN6uvCV76GXYHP8d99wBoliQsCF/XGJ3cwl7aBT1+c8+IyV2qP/B+TxKhCr+0K9FM0gEhwfgkQsgRZqzvOUTYR4nKM/WoSTntEnvsR4cYHBn5cC3Exx4RvI1zDLWfzN4nu0A+H5wwTep0Pi38sWSjdb1UDz8e1h7TAKUB8O3jsDz6jHRmIc2wIei1lXmPequ87BPSH7XMUZKH9Rgl+3pSIAEWt3qHbvuSLA8j1zQzkF//1mAxo05nuhBOYwoSigneds8648mIrYih2quqBwCc0BXoH5asVFzw4A+WZF7egbXjvSxdV1h1PZoOPkCSxxncwErQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zszDnhp2mtb+TX6xKAVeTyCFLf/tdg0sNoESyqAx2U=;
 b=QhpA79t6C1uxToof4BNHW32zu0QXyo7jYIdRgrG/WgIg2wP0uMNrf+MEXP/Rii+/43BpIjCeIRgHjhB1ZgQc4Hax1j07ZONPj21E6O23pj9YrzpgLPlgKuJBbFsqFOBPKs5HGMzro6jRqA2owWYmaW/3DwI4tjF6gx4nj8y6DhDc2vGQ17uE8NiciOPisd6paZF2ToCXRMa8NPGDGfv9c43mxo0+cBkeEBf6cRtH/mmnzmnel58sS0iNFo2Bgz15IEhFz63kVf1HpgDwRd17RfpPpPoGk0bCbtxmMsykpQWrGi3CE0PHBLITfygjj3AIYSzYaZPhHJztYwOsn1AUOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zszDnhp2mtb+TX6xKAVeTyCFLf/tdg0sNoESyqAx2U=;
 b=NkShVCPcV1J4aCLQbFzqbVo1WhVKoPurApyc5RTCUZ7aTVK6B2XtyJBkHh/nFyrA7bOjicW4WnWJPYQ59CB/Ke8MtRtWzzehr5HWgl89bAQP7aGTbRKg5RJsmOtPJj6tfAYbSSaXmgTK+eicceAIeU1do5v8mfLNIJYMzsyhXJ8=
Subject: Re: [PATCH] gnttab: avoid triggering assertion in
 radix_tree_ulong_to_ptr()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <257a7e00-9bdc-0f1f-fc64-a5147ac4157c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1c90ba5d-5346-d5e9-ad9f-24152cc9de7d@citrix.com>
Date: Fri, 27 Aug 2021 09:45:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <257a7e00-9bdc-0f1f-fc64-a5147ac4157c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0322.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 914e9c09-41aa-4c0f-1707-08d969370c00
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5887:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB588737CEF1B31B853DD2FE6EBAC89@SJ0PR03MB5887.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yaMjZXfmt5jSL1Igxdg44H6OIfkFSZ+INYKrDT9F5mVkkpvi9eyibSKdUSj/6WaQmxTTcwQj2LqwZzXYKGljE1A6nnuwQ+SII6IYYqa89FywnvxXELkXOui9n6AvzBj5QDDKmtBNlPGcJVnteK8y3pqripuUenuHTOYy9uWi/dgfN3W8L/C3JhiYQLEs835G2DtdnITdSMHlTEqut4iZMWj7ocu8sBBYXse4vebhxDUEOTWWxzN3xtMYm2JEeSgJ4oYp5IkfNWFHWvNk1OY6em0jSvpec+6plLQwGwRBsvCywr567IWba9YEEC6+r8KnPtdqiylhoNymfN4hYZcO0/mCqovmBR943LmWmUneaeyPUX0sBQDRVf9wPPrKRph+Eu2fj6gA9EzFA7pdTjHwoYmRSOnDYG8qibAtT22eMRh87tpiAtHHsm4f45+fFmY4gV3pwmf+5DWaKwgtCJursrwUjvw1BXzhiyA2YS4b5NkRqKl2qekoOCTagGgiK3TSIiz+U78uGNli3KS9DgDuMmRMQR01BU9+nlNSBpNJWU4LkwAt4Et2PPwZr6qK61YrFGWEtQYB63sWy7jNzAhi4jCXp7UDWbmr2fMKp2kUjUbCMJf0jQfVOGW8mMjQ7rwS+x4Jg+TtF/AD6Q1S4VZLqyNai5j5O8NxwczU0yctimIFugWQhNtYBbieixl/Ii3izxuhcMraQumV6VttvN1RDKWCh/1JCZoIt8wdFFvNDzA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(86362001)(186003)(53546011)(2616005)(16576012)(8676002)(54906003)(110136005)(55236004)(478600001)(8936002)(316002)(83380400001)(6666004)(4326008)(31696002)(66556008)(26005)(66476007)(31686004)(38100700002)(2906002)(5660300002)(36756003)(66946007)(6486002)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1ZqMXpvRUw3Y3VnYzY0SkZCay9TY255S1YzVlcrdkpnQk41MmhNc2k0c0Vp?=
 =?utf-8?B?ZVE2TVpIUW8zcGxGTVB2MDIrbGdFUGxZQXdlRXE1SGRDNTZOYXdCRUNFL213?=
 =?utf-8?B?Nmx6ZXNjaXpmMFhUOWxEeVk1OGdldTNLbE5lZGlRbW11akZXUklaNjhqRHFP?=
 =?utf-8?B?NGVLQUJHN0tuNitrTzMzUEVFbFFIZWkyUnh4SUZ0UUtDOHFmRTFkTGRzU1F4?=
 =?utf-8?B?VHIvZVFubE1kek1yL1R5ZjFQa2xRL09UeFlIMmlHMXU0Nzc2cldWWmdQVlZ3?=
 =?utf-8?B?dlZEb3ozWTBFbzBFSnJTcTA4dU9ybDFNYktERmMwaVBHM0IzVWpUeFNSSXk0?=
 =?utf-8?B?UUVJL1o2TXhvNHJyM1M2OHlUeU9tL0hkU09vUG53ek5PQ1dFb3ROTFRzc1U4?=
 =?utf-8?B?d2VaMnh6cEhZM1VhZ3VOTENDOEdpSU55V3MzSjRFQ0VoRmE5SWNSOWJUQkE1?=
 =?utf-8?B?eEs1cjJoRGZzOWNCUnJsZUpyZTBoTVFKTklyMk8zTW1FenhYc3E3dlZaY2FN?=
 =?utf-8?B?NzFMMU1TMXZRSVo5cm5naHJsQk1MdnJPUGx6dmNsUmFRazZlUUR3N2s5dmRu?=
 =?utf-8?B?aDNiNDNwZm0ySEFWTFdSNTRuK21vQVlqc2NOOFBtcGJTeVJSRlMwcTVaUWhW?=
 =?utf-8?B?OXpLeVd1RmhnV1FNTjFxQUVETGhreU9leDdIWE1RU1YwbnBTaTVWbTZIaTVm?=
 =?utf-8?B?UlhDaXZ3c0EyWWJHNzVnM3k0TkIydllaMXg2ZEtkdVZETXhlRUhtc2pQVkpH?=
 =?utf-8?B?bGQwcXE0R0dSQmJaODl0NWFTYlhvVmxBeGJSenNDZmVueWo4ZDczYVNoKzYy?=
 =?utf-8?B?NE0wTndRL0M3RCt4bmpiczkrUHl5NENCazhSd2xwOTB2aU9ST0FSdk94dnVn?=
 =?utf-8?B?Zm9mMGpKdXQ5Z3RKU0pXUjRqN3B6dUNXUkNVdlFjdExDWE9hU1pSSjVxNHAr?=
 =?utf-8?B?REtqWjQ5OU5VbytPd05PMjhWRElRajdxd0ZjRmdMM3B6eC96NjcyejI5UFVF?=
 =?utf-8?B?N2ZzcUtRdDdETHBMajZFVHZuUzRvTjRGampxSE52SXFWUUxFQzM4bXZSNGVO?=
 =?utf-8?B?M2cwaHhSOWVmR3lacU9zY21lU0QwMkNSbEZiQjR4R1VQNGFhbWdybkp0UGRL?=
 =?utf-8?B?emxFeXhRek5reVkxNXZvM3VHNGVOdXRWQ0ZBK2tGQi9lYzhBbFZ6S2FtUTh2?=
 =?utf-8?B?MnlxVnNnZXFuQWtOdmpoSHJjSCtvMWYraWNPWWNjWHA2cG4yL0lyOUdFb3lU?=
 =?utf-8?B?Q0Y5T0FPN0tNUTkvczNsS25jK3R6eVhkNVY4VDJiNzdWOWxIUGdpb3JFckN5?=
 =?utf-8?B?OGZJenFsdThkTWpxdGdjR201Uk1hQVJqVTZzU0tQVEVSby9udU1YRnRoeVIr?=
 =?utf-8?B?dnFscmppUE1rS01xM0RySSsyRlhiOTZUYlNhakh6QXpLN3VUN1pxR3Jldllq?=
 =?utf-8?B?d3Q1NER5WkhmdWlua3RJeEh0dG1yQ3dGak0zYVpGbWtBbnhrRDh5eE5TcEZE?=
 =?utf-8?B?NWk0OWFmUzZqbC9SQ3pxLy83SVhQSUlLOXcvYTMyU0R1c2I0Q1F2dHcrenl6?=
 =?utf-8?B?TnVXRy9UcTFFL0Y1ZGNmaUh2OW1rcEI5YmZxdWJqMm1NeWgrREdUZTZtSCtM?=
 =?utf-8?B?dlR2QWlVZWdOUlJuNFRlK0ZOMDA1R3VBK2NUZURtR05xNkp1bWxLcHFSY0pr?=
 =?utf-8?B?ZllHNWVOdWxrQTk3T3FYdFVyd0hpYzFhQTgwS2xpMzFjamFabTBIdFZNSTZ3?=
 =?utf-8?Q?98+Y1XKaPEIPIxrTC7puh2atvxtC5K7/h+rlsEg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 914e9c09-41aa-4c0f-1707-08d969370c00
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 08:45:39.6705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VaobdTxpbiq+njSzLijpcqmxP8UaxB0lJqsOzOtplb6GmpfNGgSVt1sulVtrV5Bw7BL3ZCFoPZsWzQruEDdPNr2nKSiScy3gjbn6kVbMTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5887
X-OriginatorOrg: citrix.com

On 27/08/2021 09:21, Jan Beulich wrote:
> Relevant quotes from the C11 standard:
>
> "Except where explicitly stated otherwise, for the purposes of this
>  subclause unnamed members of objects of structure and union type do not
>  participate in initialization. Unnamed members of structure objects
>  have indeterminate value even after initialization."
>
> "If there are fewer initializers in a brace-enclosed list than there are
>  elements or members of an aggregate, [...], the remainder of the
>  aggregate shall be initialized implicitly the same as objects that have
>  static storage duration."
>
> "If an object that has static or thread storage duration is not
>  initialized explicitly, then:
>  [...]
>  — if it is an aggregate, every member is initialized (recursively)
>    according to these rules, and any padding is initialized to zero
>    bits;
>  [...]"
>
> "A bit-field declaration with no declarator, but only a colon and a
>  width, indicates an unnamed bit-field." Footnote: "An unnamed bit-field
>  structure member is useful for padding to conform to externally imposed
>  layouts."
>
> "There may be unnamed padding within a structure object, but not at its
>  beginning."
>
> Which makes me conclude:
> - Whether an unnamed bit-field member is an unnamed member or padding is
>   unclear, and hence also whether the last quote above would render the
>   big endian case of the structure declaration invalid.
> - Whether the number of members of an aggregate includes unnamed ones is
>   also not really clear.
> - The initializer in map_grant_ref() initializes all fields of the "cnt"
>   sub-structure of the union, so assuming the second quote above applies
>   here (indirectly), the compiler isn't required to implicitly
>   initialize the rest (i.e. in particular any padding) like would happen
>   for static storage duration objects.
>
> Gcc 7.4.1 can be observed (apparently in debug builds only) to translate
> aforementioned initializer to a read-modify-write operation of a stack
> variable, leaving unchanged the top two bits of whatever was previously
> in that stack slot. Clearly if either of the two bits were set,
> radix_tree_ulong_to_ptr()'s assertion would trigger.
>
> Therefore, to be on the safe side, add an explicit padding field for the
> non-big-endian-bitfields case and give a dummy name to both padding
> fields.
>
> Fixes: 9781b51efde2 ("gnttab: replace mapkind()")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

