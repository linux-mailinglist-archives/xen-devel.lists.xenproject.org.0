Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A104A302691
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 15:58:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74127.133221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l43Jp-0000Ey-K8; Mon, 25 Jan 2021 14:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74127.133221; Mon, 25 Jan 2021 14:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l43Jp-0000Ec-Gn; Mon, 25 Jan 2021 14:58:17 +0000
Received: by outflank-mailman (input) for mailman id 74127;
 Mon, 25 Jan 2021 14:58:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F5Bc=G4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l43Jo-0000EX-DK
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 14:58:16 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80ff9beb-7b82-427d-b5ff-9307b6d0f24b;
 Mon, 25 Jan 2021 14:58:15 +0000 (UTC)
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
X-Inumbo-ID: 80ff9beb-7b82-427d-b5ff-9307b6d0f24b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611586695;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8ved9U7F4RQ+K7LN/Y9dhpRGeyn5lMe++vwxRS8RMYk=;
  b=O7NTPNyCyoe89bu1eVNwLivdYR/nG3zFvVO5cMZbwO8NpgN2zHa477Zo
   pvZGhEZYT3Y3P/SZzr0bIYXMUIi/GL3kENav2tZf3sb5Ul+tJrbLu6xpX
   sTFfuWvczxddTARzxxAeB2zu64h0OqCztW6lpjwvmxcaiZitcxqRO163X
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LUzPTAh50JTmU2R4z541FpLx1E3n3fh7A2ru9j58D0o0fKG1cxO9HA7UGdn8qRqpJwlGVbhR49
 QuZpafdd3WiDH3mn78Do7tB8DQfbHuqVXzioVEsrKVNAj2Pun5deoRhmXKYqRQ35P0q8tpsPEg
 97X9BIgjfabWsczvhWfnhcVk+Nh4ok3zNYizGa/BJtYd2eIk8hGyvsPpIdJXWxzKL733yqp/e/
 N6nWdNgLMPvEi0NuoFc0H9Ul4OYqHg8myDYh0o1J467wp9NZPTuvmoocb/O8l/66pcg9lxWeJ5
 FgA=
X-SBRS: 5.2
X-MesageID: 35837243
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,373,1602561600"; 
   d="scan'208";a="35837243"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XnjhdX4v3jVj2qiVxKOqkfjsQox09iuJreVudI4dmeFQahBzEfGIcv0kGlHpTRnwKsRivldT76IKuhiLiMb05itcNpYt6nHIngW+CpHZJxLN+DaubguqT0+NqQIY7WeHAcGh1LWX/u54uUtO0drETQpFMfPmOkNw+KVo8LQw4cMuXTBI0f9cb+5SqEGxapWFDrdKPfjLbMyhSGaz2p6DThe7O++kblMYQF6LCroQuBarcVdswUKCA2YOc14T/rssY3/M9rtWZg3kyjGgqBj4fW864YI5CCOy0+Gu/xy1gmd4RNCu2ggO4I++1AxNeC+YCUG9cDamHVK9QvyJzy0e5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ved9U7F4RQ+K7LN/Y9dhpRGeyn5lMe++vwxRS8RMYk=;
 b=YLTLq8qoyb+Nu0TP6EH/1NC0JtJPa6AF5K8CXheCIw2i1HabJIIwd9UtYVfGKAYOtoO+iXrxUFDHN4d8GwSw4KztqKi3O2hX0AWl3IPEgxmhirBMBSdlilGEVSN8MPXbZdkz+TNE4RKsof3usfOPupyUUfpPOdKwJQFF+yupaB2SnnNqiEiz9cVdPtAUxJypBic5ka5Lk11R/9ppQXsv/QRzjUY/z9mKsVkl7QyL+dmRSbNBkRYtWXyEaa/w/j8gGcspVfBmw98Q9UkgpCey2oGtmkFOKVbbS3Xjny7ZrPEZ5HzBPC/U4idWtnJAbdmIWF4rnDmLrQ2MZTqptax/tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ved9U7F4RQ+K7LN/Y9dhpRGeyn5lMe++vwxRS8RMYk=;
 b=W034aUDkDy0qRdJwNrDNZJifQxvrlPGOqEXVBsZ0lfAf69BP8B/XWZ+HoCL+CpntrwobxWVBNEKYfVtlYOA2Cbf7Q1bEMBxkS2Jg/gpVTHd/9gnzj6GojBYQ+ybh1o+crbWeKceylSeoAAEHN5+ANdrqvJ7oqw/aCWYAUS3E/ps=
Subject: Re: [PATCH] xen/include: compat/xlat.h may change with .config
 changes
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <2bd62f36-e878-8a0b-6e64-d25f5818331c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b6907246-caa5-964c-ed46-fb896952ffc1@citrix.com>
Date: Mon, 25 Jan 2021 14:58:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <2bd62f36-e878-8a0b-6e64-d25f5818331c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0203.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::23) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcaae962-e80c-4625-c2b7-08d8c141a22d
X-MS-TrafficTypeDiagnostic: BYAPR03MB4277:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB427735E8F8209D14D775970EBABD9@BYAPR03MB4277.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7TXvvD7l+SX1WVHEeZSl6L241HBAVQqVXqLQKO9PdtvRw9DvAa5JxHgPZ0DNpDvpzSq4mf3wX3dZM3+USJiCT1CAkLoUrSK2w5bz8Reh+o1SP0G5SquU6I0weud+oBBrmNGSKtEvcOnOxfS4W3BStA4Oz+YfYoNzFCqOBt/HyGtgrS3c2/Nqjm23nsiGAUchThv7cassVMiksFpYNYPdm+772SGmQ60cNwn07yJoD8ofSkaSiZoQgNpmYcbfRFiXrOI1A4rzVzJdsp7t2Ewt0V/fyYxcjex51p3cNy2qXRSyaoPVZHz3m07MHPNEZNESWZaKBByU7+g6DUKWzKu7uV07NvlTE87UdIVj92a4zrue73VEodRwt0+LXUXSQsMIfg7wovflDsYCd8/A1Oupy9TUTl5RaaC4umuU1lvpKK1zDdKNUyLGbyw/hzEaQ0f/tYUb229pKiOSP0xtH1ehJRcUAh/6Rio+/KZfNURZ5aV+FSUprS/Jcp5PO1+FOsOa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(8936002)(2906002)(5660300002)(4744005)(4326008)(83380400001)(53546011)(31686004)(6666004)(6486002)(186003)(2616005)(54906003)(316002)(956004)(110136005)(8676002)(31696002)(86362001)(36756003)(26005)(478600001)(66946007)(66476007)(66556008)(16576012)(16526019)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UXhndFRQQ3ZmMnc1ZGlMUWptRVp4cHRWOXpqYlhhS3NaNGVweEw0UEw3TjRh?=
 =?utf-8?B?MTNidFQyaVBUUDVMcmNONUVRRm9mRlVCb1BqYWNSUFlteDJ5RW1YbE83Rm5l?=
 =?utf-8?B?eDFiNG5SbXBVbTBwdVVVT29nMkY1ajlYSm5WRm9kVnNibDk2ZTRhUFVzTjlh?=
 =?utf-8?B?MGJ0MkM1NEJjOE5PcE5JK3NlRTJwNFk3OStRU1Bab05rVnNYaEdMZkhjYURZ?=
 =?utf-8?B?MUhRSVp2dnMwM0MrellMeGJzditXUGdpZmh5VVpqN3loZW83aVpNbkF0bEx0?=
 =?utf-8?B?bmYwamRNdWp4UjhhaWQyeUs3ZmkwV2VFVmF3UFZrUDJLaCthdVVFQXBoMnFu?=
 =?utf-8?B?T3BDQmtuNzV2MTRqVGZpNUNub1UwUkwySy9TOFpETENEWDJFcW1YbWZEeFlT?=
 =?utf-8?B?VHAwcy9kZmlablNsaXJVeldVYUk3bm9DNGtFY1Y2TnU3MkdIVjBZZThtbDkr?=
 =?utf-8?B?YlJCek43WXJ2ZFhNSEpscnpGd0ovdXBVNXVyc0ZCYTVlaUMwazRBTG5JZG00?=
 =?utf-8?B?T1h0ZGxzYUxZaVFwcEd0dDJKRWNOZ0tTbVMxcE1rc0oxYmZpdkJCWGdKUnJa?=
 =?utf-8?B?a0xjWTkxWWQ2SFBsRUdEWlpjRnVweUhZSjYrVWFWeER3RGQzR3Jrd3BNSFJv?=
 =?utf-8?B?WU5vQ0p5VTgyLzJDNGwzQysxS1NZZm1pOHpZdmxISnJySWFmSUVOVE9tWkQv?=
 =?utf-8?B?a00yQ2xLVjF3ck1lV1pjVnBrYjRXdGNQWCtpclIwTExIWVdZaWI4Y2oxc2Fm?=
 =?utf-8?B?b3lvaEFYS0E4WUlWNGp0dHU2Tk5zckJ0djNHNFZ4M3hhbVptbWx3dW9WdjNt?=
 =?utf-8?B?b2liNEpZNG5Ta0w5cVBxS2lTbnJuNXNmT2Vhdnl2bzN2SjQvMkp1WHhIUGdI?=
 =?utf-8?B?Ri85NmIvUUNtRm9jaHFqMWpXWis4cEZNclJRTFFUeE5INlVEWVJhMU5GcWpP?=
 =?utf-8?B?bkhFY1ZpNkl6Y0h6K3hVQVNuVmVxSlYzOFgwODUydkc5aXIxWlFObzJGWkhM?=
 =?utf-8?B?RU1BN2dsZmE4YW5QclQ5c3pqTVBERkhuV3M2MndkQVhkSUtPb2JKWXNuRzhZ?=
 =?utf-8?B?V2Ztd2lKTmliRGljZUNUNnF4NENYUnF1Umorekx0QTFLSDltTnMwcXRzdWty?=
 =?utf-8?B?WlRTblhKZ002dEVobklTd3BZRWh5TWR0MHpHMUtyWEhiWURuUHNvcHNWRnR3?=
 =?utf-8?B?WHM3QVp6REtYMUFUMkkxT1pyVUE2WnR4QjF0R1lPV2xKUGliS2M1eXRhdE5K?=
 =?utf-8?B?TEhsUWVRMmFJbFowQ2xmMHB3QjY3dmoyOW9LNFZ1ZnpWOTJ0STFOVU9MemJM?=
 =?utf-8?Q?R+PDQwqf3ai1hfBRpS5/HMUsENMHMVuQzD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcaae962-e80c-4625-c2b7-08d8c141a22d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 14:58:11.2117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c28Vu1ckiETLYpoQevzGpLhLXYGfpj636phsH/SDuWB1ny9K5BASjyLjZNiBUGIIpJ4tryga0CPeQ/lU5IoKcObrcyUjcP1TkEGQGrPg2A8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4277
X-OriginatorOrg: citrix.com

On 25/01/2021 11:03, Jan Beulich wrote:
> $(xlat-y) getting derived from $(headers-y) means its contents may
> change with changes to .config. The individual files $(xlat-y) refers
> to, otoh, may not change, and hence not trigger rebuilding of xlat.h.
> (Note that the issue was already present before the commit referred to
> below, but it was far more limited in affecting only changes to
> CONFIG_XSM_FLASK.)
>
> Fixes: 2c8fabb2232d ("x86: only generate compat headers actually needed")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

