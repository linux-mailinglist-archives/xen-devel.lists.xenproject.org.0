Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E70F6327BD3
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 11:19:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91423.172855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGfeA-0005Aq-OC; Mon, 01 Mar 2021 10:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91423.172855; Mon, 01 Mar 2021 10:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGfeA-0005AR-K8; Mon, 01 Mar 2021 10:19:26 +0000
Received: by outflank-mailman (input) for mailman id 91423;
 Mon, 01 Mar 2021 10:19:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RrjX=H7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lGfe9-0005AL-Gg
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 10:19:25 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6ca8687-7b72-42a9-a3da-91ecc3a9b6f8;
 Mon, 01 Mar 2021 10:19:24 +0000 (UTC)
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
X-Inumbo-ID: c6ca8687-7b72-42a9-a3da-91ecc3a9b6f8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614593964;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=6gyDb2GchfbEV7JPwhm+tQh8KYUarTuUS3KcD+2MCxk=;
  b=Df2RBqOypSMxBDuoeE36Y7rFRJ0Q56Jdc13mRdVdw3Bjtz5rmnwchUxP
   /7uHCR4En4/f5AghYCcOTnEs8jdTONQLkHH40FhY2PDCHiqlvws6DuGH9
   UWVG92dvwtQwfjDGO33CCTj4+xFo5jEGqSzBfuBzfPj6/SB/HZcJZ5nBO
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 01hj9QZmK1y52vf8FKyJCBpry1/bF8ngdxS71iZsznm4xAr3hrAO8O+n+2YUAQUj+bH1WdZpuc
 ophbVES1s1Ia/a/wYQHJqY4BL7pqlvqNxAwNQE/H11c/DGFq8BXfHVu1QvHyxIlqeBccpQuApO
 MxFXhtxMDWPD82HksclOTVh6YIMToTzUtNpD+rcGBSzeYAaPXhU+E5nWj3TLCg8ZHPjpKOOXnf
 94Ba/AQMkFfkUkwK80rk28bI4tfrpib4nHvuWYml5E6bb+eLVaR63tEqAw4dIB8jVkaNvbLRHB
 fcQ=
X-SBRS: 5.2
X-MesageID: 39620697
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,215,1610427600"; 
   d="scan'208";a="39620697"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=couwiq9NdfdJ6rGeUFVX9gsnZNWLpNa8Gq3Pw8uL08H+ocnABOm89Rsrzony4abE46KzK13AIXspPYcq2+GJIzkt/jZTbvdxsGAMOJBEWfJRGHuPKBiJjMdQM7f7v45dair07zLSOhV/CrPgjymVl+5fe2rym7JYpnxoNXlk0QZhD5wQv/1wJNz4UNgysJPt0U9Wr4g5py8b1XCrMt6DC7Zc6mrusWlxOTU4HtBtVHupxJWKziUMr/JyBugmu1U1lrPp2lqYkPVebWo7NRfJioydpxz6+2iiwaR47Dk/l3vaoQbsqbwFcAbSXS0+IwYbxIrE9ZJrCLEh0KI+V6oKTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3IOzOSEpi6QczcRKspuL6MFgP5LtVvDSMFGKJ7htHw=;
 b=ne2FTqRcg2iIHpn8xyKg3dyFUoAnv4ZuhtaUwwHeilWm6HVfRzfAH6hJ508z+mpflz747Mq2UnZK8gW0btThVcg1fGgt6ZxPan6AxOmRMGXwQkEPPP0jiWZppSpn4p/VwRcbrRhhCohZHv1uJ2erx41f9/uHF6bCgm6CUW9YrypCysEc+1O9DRhuoHvVWRE39E5eX+I11LtAqS/W6w7mfYA3LWz3E4YVGyr1+YzVVLIMLWARVD3tODKYGrHnK5YXaJ+xK3Y5YNRbITgCSSXOmgTWoU2KynWu+w446lUIXiEL6EFWqGswiY16qapt8lfchXmt1CjQmY6u/xT4g5MpTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3IOzOSEpi6QczcRKspuL6MFgP5LtVvDSMFGKJ7htHw=;
 b=eiFCfsRR3DGADPu/gJgBYfJsu0+9t3vKExIbBi+0NrsY+waH3SCFZxvR2J2M9wVdH5bjebySc/xjMnxqKnRHumQQS0tHVP4KzfarMqdNnop4oMqgVYwVsJ3c3MHfzf+QgE8+Bk5PCcBR5NMpti5StEoXGdXcTVadAvPhwisRxsY=
Date: Mon, 1 Mar 2021 11:19:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.15 2/3] firmware: provide a stand alone set of
 headers
Message-ID: <YDy/oTnOMXIwFS/D@Air-de-Roger>
References: <20210226085908.21254-1-roger.pau@citrix.com>
 <20210226085908.21254-3-roger.pau@citrix.com>
 <2133ba4c-5120-30ca-1328-c8700fd2db94@suse.com>
 <YDyu3mWSgIIB6s91@Air-de-Roger>
 <445b205b-0a0b-da53-b7ba-98a1ac51aab4@suse.com>
 <YDy45rEl5sqv2eqk@Air-de-Roger>
 <e2f254cf-4726-609e-850d-1c0ea73028b9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e2f254cf-4726-609e-850d-1c0ea73028b9@suse.com>
X-ClientProxiedBy: AM6PR08CA0020.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::32) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d931a6ca-7559-4065-f7af-08d8dc9b7912
X-MS-TrafficTypeDiagnostic: SA2PR03MB5915:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB5915A88998CA253C4704D2678F9A9@SA2PR03MB5915.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SJCiISNQ3UtuNG78BN2pKftbe6j0Y71KraiEteTX/6VFKQ60Q+7rgSKWyhzl26eF5A4A7gm519hf2vjc/aV/wudbHxCyc1KDaQk9FWfFVjxnS6y7RDXlj2TK7q2GKkpva3JLGFImA3odtflEUsIqPt42YNcvq/dAkoXPRoOyPesyfDw2KqScIPr4FmSY6/N50kC14gI4CsZ+liVNzQwGc2ZhFALmkqUMvYk07hg9dMVlyeX2xbbzOYmOIhbiV5+rwpaK4rfH5gLDQ1LuORJ28hdVlVQhw4UNSadhzQbT2Ef3XhSf+HPG5B4i8QHTe6jOypR1Rds9S4UPPgWUuk7qWjFPokvLLOn0woXTf8Vj4mzs8qiyftAUzsQKLy5nEwUI8fqrkXRslA2X3XcHr/dijuykpYaU7P390T6UK4RKIG+F/9Dek39Js27YITx3V65CbkTEd6hOv+SHpzHpWSVzG077EhFtImt5ch0z6i5yxZEDYWbHV1+umnJ5DnxmDLi5Tn+Q8x0ySCzegHs6o+Ok+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(396003)(366004)(346002)(136003)(376002)(66556008)(6496006)(6666004)(53546011)(6916009)(8676002)(186003)(16526019)(956004)(26005)(33716001)(6486002)(83380400001)(8936002)(5660300002)(66476007)(85182001)(54906003)(66946007)(86362001)(478600001)(9686003)(316002)(2906002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RGVBZGNtczZvYUtnSWVMM1ByT1R5WVZmL3MwNnJMV1F6MFNyQ21zSkFTZ1ZU?=
 =?utf-8?B?R2tmSHcxTlc0cXhwd1NBM2ZVeUdyQ2VFYzFTZHFQMjlnZExNVkwwUVNuQjhV?=
 =?utf-8?B?cUdEcjRIemY1SnNYSk9rYnUvc2ZjWEFkSVUyS25qbWZaMS9LUzlqRWo5NkEv?=
 =?utf-8?B?VE56RG1xVkZjZTg5RmJ3N3kwZnlQUHhITTNxVnA0RHJZbDNRZldsYUxHc2g0?=
 =?utf-8?B?Tmsybytyb2VIMTF1NnNQcXRmSW5TcVFGcGRiRzI3RDAxZGlqWElBTlQxdTB1?=
 =?utf-8?B?VzBEc0JJblJjVlh1Y09GNHVyRjBYSlBIVHBYTGNuK2FaUkczaFMrM3c1aHIy?=
 =?utf-8?B?YmZJZzhoSHYrdVp3MmNnODkzb2VKeDdGZzhOeUpzVjBBckptYUpONWFzcUFt?=
 =?utf-8?B?OCsvU09PRHZQaStWdE10c1ZmcnlrQ1BsMWlYNFBNekVIY2t0ZS9qSmxnSHYz?=
 =?utf-8?B?MHdVOVd4MXBDK1lhdHhManA5MkRYdXlRcUl3bFVEeUhkRWpucDhDaTY5djlv?=
 =?utf-8?B?OU90Mk95dTFBNXg3Rm5iWEw5ckJJUzJaL3ZlMWljZzhra044L01HU3g0OE91?=
 =?utf-8?B?UnFBWExlc2I2VGtKWHBoQmZ6b3NpU1dBZDNSMGRuMG55UlhWMVh1RGM0aEFM?=
 =?utf-8?B?a3hBSU5paFZnZFgxWldzeUpabGQ1MHJ3RmwzaVVTQWI0NVR2VVplQVR2Q3di?=
 =?utf-8?B?RDBrUit2RnR1QjZqU0JWZjNGZ2VkUHJndjhhM3JEZkRJWWc0WkRYQ2ZUV1pV?=
 =?utf-8?B?Sk8zMUJpdmNCRmJDYUVVNlM1SVcxTFBRSmJhMWhxUEZCR29tcm8zNUpIeDRJ?=
 =?utf-8?B?a2RqakhZTmR1YVFEWWl0UlgzUEVhZEsxWHBGYnc3QTE0MUNJZ3psZEx5cGdn?=
 =?utf-8?B?aVM3aVVJVVppaGF6cDc4a2xwaHV3eEhFT3lFamRaTlloZC9VUVkzRG8wOEtG?=
 =?utf-8?B?cmVwdURMS01BNWNTTUZFNi9WVFhQMGpVTEo1aHF6dHYrTVl3a1ZnYzcvdTNz?=
 =?utf-8?B?N2lhTEhWeUtxcTVWNG1BbUk5S2pQMW83dy9yUDJXYlNFNzUwTmhiNHEvUHdz?=
 =?utf-8?B?dXRFdjJud096c2hGYUR2SzFZSUVGNXdXU01COFkvV0JlZ0c1YzM3UjdOS3ZD?=
 =?utf-8?B?V09DYXEveDhBdkhpZnVBQTF5SU9Pb0pQbWRxalM1STVyc0JiZDg1ekVadWVm?=
 =?utf-8?B?RWJZTWlHS0FjN3A3ckZOL2pTajREazhHU2pPbUhjL0xiRHFZYXRWYnFIWGtq?=
 =?utf-8?B?akpJNGZhNndNbGFDbmovM3hlZ2l2cFZmUys4ejRYZmZlM1F6dUZwQkcxN3la?=
 =?utf-8?B?cG1oYUpFVlVadHJZR3lQQ3FYcXRaWFMvQVZucURtMllKSUtMZzdMaFhtamNj?=
 =?utf-8?B?R2VqeG4vanljQXBldkxlOFRvck9BNUZTeG5EczZtR3FVdER1UnhSTGg3SzAr?=
 =?utf-8?B?dDJGdGxSNDlQMXdKb2QyeTA5NUM4OHg5K1pZc0w5aXNiazV2ckxGTEJPUVpP?=
 =?utf-8?B?dnRNVVJYZktDb0RMQ2gybmYvRE9NTGJ3SlowbkhwVUJKNkovZUxZNlhyYlhY?=
 =?utf-8?B?SEJKREFXbDJHelV6ejBoNFpsRU5WMExwaFZoZjNlZEZUOG54MC9qbWk1S3Fx?=
 =?utf-8?B?andKV3BwSzRFTktHTGplTXZYajluQmRVVXlwM25iamQ0WlhoQlNGeXpaRm9k?=
 =?utf-8?B?Y0JjTFNvOWVRcStaUkUrVW1IMDJTOGkyRWwwanlqdjJadkhzYXFvaXJjWUJJ?=
 =?utf-8?Q?6acCLREZ5stv4X2ZjcoCTprARQY7wwlaxjJW2Cr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d931a6ca-7559-4065-f7af-08d8dc9b7912
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 10:19:18.3666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RkY4fuOkZDz7avFXFC/BX4+viwqp0RR+JvWgHRRl6PrDm4iti5r1HFZO+dRTcuJQxq2uOFjVqBl9yypekCfXew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5915
X-OriginatorOrg: citrix.com

On Mon, Mar 01, 2021 at 11:05:17AM +0100, Jan Beulich wrote:
> On 01.03.2021 10:50, Roger Pau Monné wrote:
> > On Mon, Mar 01, 2021 at 10:17:32AM +0100, Jan Beulich wrote:
> >> On 01.03.2021 10:07, Roger Pau Monné wrote:
> >>> On Fri, Feb 26, 2021 at 02:24:43PM +0100, Jan Beulich wrote:
> >>>> On 26.02.2021 09:59, Roger Pau Monne wrote:
> >>>>> The current build of the firmware relies on having 32bit compatible
> >>>>> headers installed in order to build some of the 32bit firmware, but
> >>>>> that usually requires multilib support and installing a i386 libc when
> >>>>> building from an amd64 environment which is cumbersome just to get
> >>>>> some headers.
> >>>>>
> >>>>> Usually this could be solved by using the -ffreestanding compiler
> >>>>> option which drops the usage of the system headers in favor of a
> >>>>> private set of freestanding headers provided by the compiler itself
> >>>>> that are not tied to libc. However such option is broken at least
> >>>>> in the gcc compiler provided in Alpine Linux, as the system include
> >>>>> path (ie: /usr/include) takes precedence over the gcc private include
> >>>>> path:
> >>>>>
> >>>>> #include <...> search starts here:
> >>>>>  /usr/include
> >>>>>  /usr/lib/gcc/x86_64-alpine-linux-musl/10.2.1/include
> >>>>>
> >>>>> Since -ffreestanding is currently broken on at least that distro, and
> >>>>> for resilience against future compilers also having the option broken
> >>>>> provide a set of stand alone 32bit headers required for the firmware
> >>>>> build.
> >>>>>
> >>>>> This allows to drop the build time dependency on having a i386
> >>>>> compatible set of libc headers on amd64.
> >>>>>
> >>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>>
> >>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >>>> with possibly small adjustments:
> >>>>
> >>>>> ---
> >>>>> There's the argument of fixing gcc in Alpine and instead just use
> >>>>> -ffreestanding. I think that's more fragile than providing our own set
> >>>>> of stand alone headers for the firmware bits. Having the include paths
> >>>>> wrongly sorted can easily make the system headers being picked up
> >>>>> instead of the gcc ones, and then building can randomly fail because
> >>>>> the system headers could be amd64 only (like the musl ones).
> >>>>>
> >>>>> I've also seen clang-9 on Debian with the following include paths:
> >>>>>
> >>>>> #include "..." search starts here:
> >>>>> #include <...> search starts here:
> >>>>>  /usr/local/include
> >>>>>  /usr/lib/llvm-9/lib/clang/9.0.1/include
> >>>>>  /usr/include/x86_64-linux-gnu
> >>>>>  /usr/include
> >>>>>
> >>>>> Which also seems slightly dangerous as local comes before the compiler
> >>>>> private path.
> >>>>>
> >>>>> IMO using our own set of stand alone headers is more resilient.
> >>>>
> >>>> I agree (in particular given the observations), but I don't view
> >>>> this as an argument against use of -ffreestanding. In fact I'd
> >>>> rather see this change re-based on top of Andrew's changes. Then ...
> >>>
> >>> But doesn't using -nostdinc kind of defeats the purpose of
> >>> -ffreestanding, as it would remove all default paths from the include
> >>> search, and thus prevent using the gcc private headers?
> >>
> >> I guess I don't understand: It is the purpose of this change here to
> >> not use compiler provided headers (nor libc provided ones), so why
> >> would it matter to retain any kind of built-in include paths?
> > 
> > Sorry, I'm also confused.
> > 
> > It's my understanding that the point of using -ffreestanding is that
> > the compiler will set __STDC_HOSTED__ == 0, and then the built in
> > compiler headers will be used to provide a freestanding environment
> > instead of the libc ones.
> > 
> > However if -nostdinc is used the header search path becomes:
> > 
> > #include <...> search starts here:
> > End of search list.
> > 
> > At which point setting __STDC_HOSTED__ == 0 is pointless as the built
> > in compiler headers are not used, and hence the compiler will always
> > resort to the stand alone environment provided in this patch.
> > 
> > -ffreestanding also allows the program to have a non-standard main,
> > but I don't think we care much about that since we already use a custom
> > linker script.
> 
> While indeed we don't care about this specific last aspect, we
> do e.g. care about the implied -fno-builtin (which currently we
> specify explicitly, yes). So while with -nostdinc added we
> _might_ indeed be fine already, I think we're better off going
> the full step and specify what we mean, even if - right now -
> we're unaware of further effects which are relevant to us. (For
> example, I don't see why in principle we couldn't ourselves
> grow a use of __STDC_HOSTED__ somewhere.)

OK I will rebase once Andrew posts an updated version and adjust the
commit message and comment to notice what we have discussed above.

Thanks, Roger.

