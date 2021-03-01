Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC6E327B28
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 10:51:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91396.172780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGfCM-0002H2-QK; Mon, 01 Mar 2021 09:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91396.172780; Mon, 01 Mar 2021 09:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGfCM-0002Gd-N7; Mon, 01 Mar 2021 09:50:42 +0000
Received: by outflank-mailman (input) for mailman id 91396;
 Mon, 01 Mar 2021 09:50:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RrjX=H7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lGfCL-0002GY-GZ
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 09:50:41 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae3df5c9-f3ee-47b0-bef5-8595ba7f5e39;
 Mon, 01 Mar 2021 09:50:39 +0000 (UTC)
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
X-Inumbo-ID: ae3df5c9-f3ee-47b0-bef5-8595ba7f5e39
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614592239;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=70/vg9076WuDhTUnCoiX9kM0gFDuP5EJBWi+Dr4MbAw=;
  b=f7j1W3aMYhOcHAclF1ChZUB8EYU8y+bQew3BzDQU+L82QsJqjgfSSR3L
   mEXmuPp9/ikGR4o6vsyuKva/kKhATQppgk4XbIqbXem/jYTOWv9ObG2cD
   V9N0mBDr8ejH9S/gS3+eSPZDszEVZAXpexG5YKrFCuhlwb5AB/bcqm7CT
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HoVcazeYWRLOLRplX2SVyrVk0x8ncm5VHw1sVDibmZxJTeIc0k2mqoP9AdLYD8JO5AqKVTzCov
 xrKWsYZTPLqtNhTqqSgQjIc5vADSuLmNbYbx+C8w7WGOmqi9TRjzRmQUWTVG/jepIygZ5PIkDp
 rqGrETIHTaqHqLCtt6olO4QXh8GbWrtOjjcx/CKe1GAk1Yw50rlWbPoSATeFnxJ6v0z3dZOJxG
 mPUel0/syoi2WTY/3v/zgikLafVaj61pFkEkxarhHRPF0vuzehxvOJb67UNbB1rddYaOB6iwQ8
 t7U=
X-SBRS: 5.2
X-MesageID: 38217057
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,215,1610427600"; 
   d="scan'208";a="38217057"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hiduWv9fLHGZRgvhcL6hHSAF3dxFT3SZcfnJXaVlevwHWGE3GbmFYJ3keTKbG67hxzTJzdMBoHZokRU0Epq0HSMaM3TprxxHBdlYdYdDL9QHeUam4DMZMlk+5w47Rq9pQGtzy4FA1Ug53IYpnflpp3imLO0ADJTFchzZM85a37z3GSav4aAJ8k8FoI91WzSybGGbud8sNmhEFrOkG6Mk59MwBOKeNCf3r8/3MDtFIJm3AtEizpC46RmokB3PJC5en7ZIejamBuBfB84MK//EGEgceV99k9JaLxaA1xAL3tqZJys9s9SYNk2OF8UZM+9SKbkazurrojTeqrxlbtnH2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bj0A3XNBNmYfiUFJWf2oZqZXqotWiR9g5xoLgr/pom8=;
 b=FTaqp89N2ZmfIXGJgDRwSj01e9OkBwjXbgDOwSX5XAiEjH1famGlkdqoew1ejmy5fa3gaiLtd/ZoWp3d95KtwF8/ndQjAPt3up6iGWkvewHmkm7f5HhlWOBHD2nOkBcvmb7nZqbmWA9jHjk9AV8sNf4I9pJCxGVmMew3YBK6Z68sKuauR43KVWLd6AhY2L7nf2E3dcilgtl0UV3IoYG7KiARzUf7tp2etXuaXcgwR4qLDAus/EBct2rFTPfIry9dMEqvxEo8X6YiiTo0OaqXwmo5ozgIaWXT3XEiaOAVAT7dcYwyN1Ca5Fa/zGNjR78P5HqUH5GJTCeYJzM/1QVKmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bj0A3XNBNmYfiUFJWf2oZqZXqotWiR9g5xoLgr/pom8=;
 b=aBJN0kKHGAeXOLKH1ioadbvO/RbeZ1We/qTenMiVgMBmqg75l/T3wwe0QOUMqwGWfULTNiokplV4aLYIRFpeGN0bXVGUCGMg66bHzgoCPtkNV1imylkDkqacsJrOQClcV2SRox2S8mKuhkj6TlH25HME5wQ/r/6z9gcekdMn7CM=
Date: Mon, 1 Mar 2021 10:50:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.15 2/3] firmware: provide a stand alone set of
 headers
Message-ID: <YDy45rEl5sqv2eqk@Air-de-Roger>
References: <20210226085908.21254-1-roger.pau@citrix.com>
 <20210226085908.21254-3-roger.pau@citrix.com>
 <2133ba4c-5120-30ca-1328-c8700fd2db94@suse.com>
 <YDyu3mWSgIIB6s91@Air-de-Roger>
 <445b205b-0a0b-da53-b7ba-98a1ac51aab4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <445b205b-0a0b-da53-b7ba-98a1ac51aab4@suse.com>
X-ClientProxiedBy: MR2P264CA0094.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e527ea1c-dad9-4362-733e-08d8dc977636
X-MS-TrafficTypeDiagnostic: DM6PR03MB3483:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB34835E4B92DCFCDBB2BA0D298F9A9@DM6PR03MB3483.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FfAYJgK207WKKI6CQABrtl4aUn1bXFe9EZz03hoXy7j6+m2BKo2BjIkI6gilzpOcIqdW2f6mOvMb7ljJCHUNwVoC58rOodcswI7qysaULicW7ItTvOsXbfyNPQTbkf8NNOcRp8qru/FCrSPfq9JGjdBscGDiXbdbq9ET5EplU5T3nIPWeYyV5C8lUEA1hFebj/qt5oD8bsJB6y6+pfEHbVu+6jJaxaLJDkUJDtPL/gnNKDOz/ymoRkkZ6Mdw/FrccTKIaGLQ+YXXJ1cjVEn8qd7WatN1FBzxaC0m9kRfB+ZcluYC4Oir4NqJiO/XycbmwZL4J0HtxKiRYgXEg/HgIsZ/MSGHdkA6vwgxOWjBwn3kHAATIfx5M7WC/g4OQScc1G6cisDppa2bDT4r07UuENA9hnIDmcdd8wjZ1NoyuPZyc6H6Zad4qCEejisp2m3UQgHl567yiuYS1fn6aPR1Ca+9d3BC5WX7oikJzZBwOqoYTLWRNoXpyKoJJ2Ky9jpk6Xsl5I81bCsHzAlrBeG5rw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(366004)(136003)(346002)(396003)(39850400004)(6666004)(8936002)(66946007)(54906003)(8676002)(186003)(316002)(5660300002)(16526019)(26005)(4326008)(86362001)(66556008)(66476007)(33716001)(6486002)(6496006)(478600001)(85182001)(83380400001)(6916009)(53546011)(9686003)(2906002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S2ZuYjFtVDQrUVc0b2cyUG9sVjgySDEzNkkwN3lWRk50bWE5NHBFM0pMT2ZD?=
 =?utf-8?B?UHdmWFdXajljZkk3K3ZJN05NVVNCZmZnVWpuU2taanFCT3Q0QnMxQ2t2QzBW?=
 =?utf-8?B?ZENsZkZyU21mV0FJdDlzdHgrRU0yRkY2SFFxc0NIc3lBNExQRWpqaTlCempE?=
 =?utf-8?B?alg3ZlVNZU4zNUVNWll6MjY0SnEvb1ZXRDJPU0lQankxbWMrV0YvOHRNK1lB?=
 =?utf-8?B?ZnFiMlA5dE1RMTFmcFNMTm56VGZQZmlseHF4S2dWZ3VqeGVmNThoODlKU05s?=
 =?utf-8?B?azBpeFBPQmNLbElLNUFlaXVCZDdjVXZSV1p2d2FUZ204bkxudHQ5NTBJMzVW?=
 =?utf-8?B?QkRDNHlUNEFqNW9qaXAzck5CdktVVHVPMCtHM280NnlGeUtBNzNHYnZDMkFz?=
 =?utf-8?B?dEZWUmEycjE4NWtMcTFtMzhwam9rSzV3cDNYck9QYW9CbldZdnBzMzVMSFZC?=
 =?utf-8?B?eEtFUFlmUWJ6M3VRSFVOalBYVFdna2hsUHlTRkdFaWQ1aUNLOW1pYlVGbEhk?=
 =?utf-8?B?cjVWNDJkYTZlUjJTeFFlKzQ3WStBV0N0UnRVdmpQWWZaWWFISGZSNnRCODZM?=
 =?utf-8?B?MTlKYjNyZkhqekNOc3V6Y1YvYXZrR2RzUGtUQW5MRC9hK0JES0JDQVhoVXFR?=
 =?utf-8?B?OEh0cTBNSlhPT1JPd1JuVzAvUXRwZC9LQ1pVdkIyMGxoQ3BsK1puQmd0Nlhi?=
 =?utf-8?B?VFM0T3RST283NVlLMWxseDRRQ2xBeW0vYXorTHJmdklLSy9MUG94UVBRNXZL?=
 =?utf-8?B?em55U1FzemJyOERkVXdXSHJ3ZUhuQ0M4eXZvSjEzbUdveEJpeGx2bEhuY2FZ?=
 =?utf-8?B?T3VKdFh0MWxaUTRaa1lESE8yVFUrS3VnZEFMaXl1NVd2dks3RXQ4UWdGeWV5?=
 =?utf-8?B?SEFyMTcwd0FWSFlOdjRpRGJOWGllQitHVklONVVqRExNLzBodFI4ZnRzd3pX?=
 =?utf-8?B?NDRqMDVvbWVmL2hGNElhdlpyUU9YMG5yaDJBdVlUY2FjQ2ZQVGJ0Sjh1M0Y5?=
 =?utf-8?B?RExOa1BHSkFLSFZ0dEZMV3ZkNmxWNjJvRTNnT0xQbXEzZmFLYSt0a0VDUUpC?=
 =?utf-8?B?VGlxRTI3cUJBTzV4cXpvZktZemlWSEFia2dQc2l2aVE2eERNcyt2cVhxTk5U?=
 =?utf-8?B?Z0VvNVZzQVNMdW1OV2VLY29lNE1ReVZDN0wwREhtblNFQkU4bGJiTjlnZlh2?=
 =?utf-8?B?VDNzMVExdUYyTmUxaVpvcjVvUGRhZ09aZ2dGSEZWTkU0dWlHbE51VEMxZExG?=
 =?utf-8?B?RDE5K1R3dWtCbXhmdkRxajFtaElLd0lMNURaMUhVclE0N1dvUlFUclFDV3l1?=
 =?utf-8?B?SmlCaUZocGxaVWwwUEFGanRFcEZndzBucHJBeVE4blczdzJpdVNnUGRqb3FH?=
 =?utf-8?B?czcyNnVEM2JEcjVQQXMwSzcwc21OdFM0VklTZDJTK2dJakRnVWh6TEdoTWVP?=
 =?utf-8?B?dHorV1JwelBhV094dmhjSkhseFV2dERxQkwwV2hGaGR0bDViS2V5Rm1hbUZa?=
 =?utf-8?B?b2RWUXV5bFNSc1IyYUlaSk9vWWtaMEVsME9UQXZkMHNqZ1dKUkw1WWV1UUd6?=
 =?utf-8?B?bkZUVjJxWk1NRnhhV1JaWkV1S05DMEFNWVNkNGtKOGRQa2hoR1cxOTJ6Wm81?=
 =?utf-8?B?QUxNT2FQdUp5L3JQaXVSb2RVMTlFTWs5SG5GLzVuaUFPN0xIaVY3RWh0cmxa?=
 =?utf-8?B?UllPbHpHUEUwQS9UN3NodkQ3MlRZY1RsSjlmU2RXa2pWTWV2a2hxdWVJcU11?=
 =?utf-8?Q?GUSN2Wnl+Zb5UoVCmqwCne2yYtrGoFH1RNQ8AD6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e527ea1c-dad9-4362-733e-08d8dc977636
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 09:50:35.6358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +FOWAfF8Xh1kiVWIWR0u0CESI5C4mcC6hPZvD9QecIgFYchomj/cC2oCY5U32LgtQb42wmHd11li6vj9/kv2aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3483
X-OriginatorOrg: citrix.com

On Mon, Mar 01, 2021 at 10:17:32AM +0100, Jan Beulich wrote:
> On 01.03.2021 10:07, Roger Pau Monné wrote:
> > On Fri, Feb 26, 2021 at 02:24:43PM +0100, Jan Beulich wrote:
> >> On 26.02.2021 09:59, Roger Pau Monne wrote:
> >>> The current build of the firmware relies on having 32bit compatible
> >>> headers installed in order to build some of the 32bit firmware, but
> >>> that usually requires multilib support and installing a i386 libc when
> >>> building from an amd64 environment which is cumbersome just to get
> >>> some headers.
> >>>
> >>> Usually this could be solved by using the -ffreestanding compiler
> >>> option which drops the usage of the system headers in favor of a
> >>> private set of freestanding headers provided by the compiler itself
> >>> that are not tied to libc. However such option is broken at least
> >>> in the gcc compiler provided in Alpine Linux, as the system include
> >>> path (ie: /usr/include) takes precedence over the gcc private include
> >>> path:
> >>>
> >>> #include <...> search starts here:
> >>>  /usr/include
> >>>  /usr/lib/gcc/x86_64-alpine-linux-musl/10.2.1/include
> >>>
> >>> Since -ffreestanding is currently broken on at least that distro, and
> >>> for resilience against future compilers also having the option broken
> >>> provide a set of stand alone 32bit headers required for the firmware
> >>> build.
> >>>
> >>> This allows to drop the build time dependency on having a i386
> >>> compatible set of libc headers on amd64.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >> with possibly small adjustments:
> >>
> >>> ---
> >>> There's the argument of fixing gcc in Alpine and instead just use
> >>> -ffreestanding. I think that's more fragile than providing our own set
> >>> of stand alone headers for the firmware bits. Having the include paths
> >>> wrongly sorted can easily make the system headers being picked up
> >>> instead of the gcc ones, and then building can randomly fail because
> >>> the system headers could be amd64 only (like the musl ones).
> >>>
> >>> I've also seen clang-9 on Debian with the following include paths:
> >>>
> >>> #include "..." search starts here:
> >>> #include <...> search starts here:
> >>>  /usr/local/include
> >>>  /usr/lib/llvm-9/lib/clang/9.0.1/include
> >>>  /usr/include/x86_64-linux-gnu
> >>>  /usr/include
> >>>
> >>> Which also seems slightly dangerous as local comes before the compiler
> >>> private path.
> >>>
> >>> IMO using our own set of stand alone headers is more resilient.
> >>
> >> I agree (in particular given the observations), but I don't view
> >> this as an argument against use of -ffreestanding. In fact I'd
> >> rather see this change re-based on top of Andrew's changes. Then ...
> > 
> > But doesn't using -nostdinc kind of defeats the purpose of
> > -ffreestanding, as it would remove all default paths from the include
> > search, and thus prevent using the gcc private headers?
> 
> I guess I don't understand: It is the purpose of this change here to
> not use compiler provided headers (nor libc provided ones), so why
> would it matter to retain any kind of built-in include paths?

Sorry, I'm also confused.

It's my understanding that the point of using -ffreestanding is that
the compiler will set __STDC_HOSTED__ == 0, and then the built in
compiler headers will be used to provide a freestanding environment
instead of the libc ones.

However if -nostdinc is used the header search path becomes:

#include <...> search starts here:
End of search list.

At which point setting __STDC_HOSTED__ == 0 is pointless as the built
in compiler headers are not used, and hence the compiler will always
resort to the stand alone environment provided in this patch.

-ffreestanding also allows the program to have a non-standard main,
but I don't think we care much about that since we already use a custom
linker script.

Thanks, Roger.

