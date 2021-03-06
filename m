Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F2532F920
	for <lists+xen-devel@lfdr.de>; Sat,  6 Mar 2021 10:25:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94193.177685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIT9z-00056B-Er; Sat, 06 Mar 2021 09:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94193.177685; Sat, 06 Mar 2021 09:23:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIT9z-00055m-BX; Sat, 06 Mar 2021 09:23:43 +0000
Received: by outflank-mailman (input) for mailman id 94193;
 Sat, 06 Mar 2021 09:23:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q0Tq=IE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lIT9w-00055h-Pn
 for xen-devel@lists.xenproject.org; Sat, 06 Mar 2021 09:23:41 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ac7bbc6-1467-4920-9e6f-ab8cf3a1d243;
 Sat, 06 Mar 2021 09:23:38 +0000 (UTC)
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
X-Inumbo-ID: 8ac7bbc6-1467-4920-9e6f-ab8cf3a1d243
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615022618;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/CR+4IGwP3Q/UGGFSO04+uFKth4+7rdiuS7zh5x3k7g=;
  b=IP/BYXLv11tMrUJjZE21ygycGmVBe2HhwYflnv2B+NVeXKMqRiFzEPq+
   IUJ0TyHqlHviaUOjiqLyyc85kI18zN6iURRfD+H59C5kFRFYy+VugiZIy
   wKqoaHfhv6yFP7pdTV/iHvtSj667YwgXsWLdSc02pcjMeZYbT2PPO4Q3B
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: s3r3AwYv7BNW+/pKFXq+BOCtnbd6PKANZsXUK5dPkX8xmjxtenSXTI35xJZCcqbf7EqcXV8ZWZ
 9g9HavGyPoDR63MGbYVyRL3thOgEwb7b84HROojXDu5qm2AxbiM5zonU5XIUZosN87RzdgMujW
 5Sd59Mf+pgl0ro6T5UflPGTaVLu12SyLvdPx6tdxUJ7socQ5eSDRyOq+u+QrPjlJS4DVyAk8sx
 0Q6o/lPEJ8lsdreneCPh9hvlJFufEQP1vIYb2HeyLxcopB2BVkQIX3YbLYZTm7E+zKZGto59sk
 NvM=
X-SBRS: 5.2
X-MesageID: 38873525
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,227,1610427600"; 
   d="scan'208";a="38873525"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSEZzr1RFzvj4WuFNh9gn3uqcDklN4dAT51LF7iEJjXT41+vJtLtbXPBoW32DmKNsANhVQ8bt2ubmStx5P4kHKetDfPeBJrNAwgF10Q2o+JcSCGzd1f9dBz+OzC9trjJoj+IYbfxMTSjY9F90dspW/ByoleVHzsLbdilNjTp9HYcBptJBV38HQbFotUtgnffWiv5NafzT3NvyYUOjX+a2nhq6M8AYPrYttO212IONACHWJZjFF8M/KddB0Q8TaOQZWpBS02UnDkU1/zFKLEnjS9pHrN7zFC5ayXH5V81SWk0HQYKX8LU1w1WDDP8Xz3dRXDXQLaTWETRR/0T0DDHkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RAbokgouAJiZok99t77IvB48sf4WX3fJDAvRp5ALggo=;
 b=Bc0QlrNZ4tL98YjWmpi+PpuQZstOaaquwWjfgCSaL0ha/y4tl8DClN0xCF6XzI76LREuyJByeif0KThHpIHBx/XQBp3uDb6bvO3QHZfQ0jtzViSUClMdOIJ/nXwQ27LZfai54Dz/eZLw8KFZZJywqg/iHt9Nx8dKynTnFqoSotuAr7EjMO0CApzi7D188oqJxi6bE8G6uruJ3x0gKSZvTBqdbyaE1/29N4ERI+/JsJe47uhpKS2iWAdzLZYvi29ati2D7sAlNBiuIi+U5Ij/uL6yHlIGzziWTIENWFIfXkYLlx6AUKx3kkk9trKw3NMhU0nCwJUSIyGIAIUvyqStfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RAbokgouAJiZok99t77IvB48sf4WX3fJDAvRp5ALggo=;
 b=nSilKT1uR0b0c3N58F4q+5RtM2q6e/Z7FUuGKyrYjHn5ylEFNJxtl2673QKIf5WFPiA04iyNxKVrs81P4u9NRlVaqzlKRFJgRDgDVGfXc6n9P7uL5cusiJfwRITxO4GM5NfYMCdxAEu/KLtiOoG2fNfKnIVdDEXYb528xK8C3Is=
Date: Sat, 6 Mar 2021 10:22:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Ian Jackson <iwj@xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.15] automation/alpine: add g++ to the list of build
 depends
Message-ID: <YENJ80+I/0c9dZq+@Air-de-Roger>
References: <20210301095806.68518-1-roger.pau@citrix.com>
 <a1d8e537-af33-3ef8-412a-6422fb4cf4ea@citrix.com>
 <27ec9db0-69bc-df9a-8511-109f57972046@citrix.com>
 <YD3z9LNpzbOfqmpu@Air-de-Roger>
 <b3912fde-165c-b404-bf1c-46189d0ce766@suse.com>
 <YD4HM9+IEZKIq/SQ@Air-de-Roger>
 <77e7004f-8a73-e868-1ccd-318de5886f4a@suse.com>
 <alpine.DEB.2.21.2103021139380.2682@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2103051739350.14213@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.21.2103051739350.14213@sstabellini-ThinkPad-T480s>
X-ClientProxiedBy: LO2P265CA0308.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8910a1bb-fd1f-47aa-ae6b-08d8e0817259
X-MS-TrafficTypeDiagnostic: DM4PR03MB6047:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB60474117383CC108C37632648F959@DM4PR03MB6047.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N7Dgn/BSCMq7SZP9Q357L+e2oJpfCTfNqXxaBgdOJnqSBp2UCLq8JDQkuMZWd1LdOlKMqVEECcpITqDHBaobRn2JUmPhetWLuwfLFpwFbum3aI+gOovviqmig3QlQCrmjfBzEImFcrI6cHLsH1Ff0qrTUmQ5Fj/7nuWeRZDmZsV5gXmBtIbQ+RVKWgO6QbpxTfaHY+q2T6xrkxXUfwJm5Inm+5uxsJo/qatcVm47yQXzIZ5ULJztP2qXwxy6Qoq3v/kyEQGXfuUgVATQFCxllTDvHPB4DIRtG4Kw738AY9pGdjyQfAXeCJnUamTzAVVVSQcjkevn77eHb/MTz3cNe/7DeIrNgtXadMmz04K7lDlIx1dOLiMNvNDGoIrNKmnkV1njKTQ0dbTCzsE/A1BmyaC8KsD940l65K/RtNYc9325PXjQ2XWdqlmWg2P+i/unc7jrfQnPVNer9UJDcS8C2SeKUhsi2tcSrTjAgwil4aHI404jgh4AUmERHP8I3mVofQDBdXQtoyiyXb4mdhuFHEZ54W2xd+87uNZ85qMZyiRmxs7jhMFwcZleU0d6VkdCQeLg02QKczGjllYvGaigjUDUJnprkoaPaAfx63Z8HIWdKqGJ77NL1r1MBxBwk/0y8pp59Mdahtv+dB3r+lt1kQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(396003)(136003)(346002)(366004)(376002)(966005)(33716001)(107886003)(5660300002)(66476007)(66556008)(186003)(956004)(66946007)(8936002)(26005)(53546011)(2906002)(16526019)(8676002)(86362001)(316002)(6666004)(54906003)(9686003)(478600001)(6496006)(85182001)(6486002)(6916009)(4326008)(83380400001)(6606295002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eXVCeHlQYTF5K3pLNVVVeFNsME5SaTlKb2RDVE0vSlpjOFlqNmdxUkxzeU14?=
 =?utf-8?B?dnA1WTNiOUtXMjJOTUFKeUhCcVkzcXVOOXl1azhlK3VDSWtWRSszUkZHS2hR?=
 =?utf-8?B?d3FOVmdJTzluSHhWRHVubXpLbXNGRGwzZWVXY2lZNGtybXFKQVRRWGtpdDhC?=
 =?utf-8?B?MHFlVys4K0JDOHVBSzh3TExFRDVhNVZYVXFVMUtvQWRPZEJWQUxYa3BLc2Jr?=
 =?utf-8?B?YkNLNktNUFQva25BL3NsZytyR1A2dnRGUXdVUWR4N080ekZnTTVSTVR0S1Zu?=
 =?utf-8?B?SklPQ3pIc2JYYkJUMkE3NXAya2RJRkVHQVNxbkxEZVY1dTRrc21TaTZZSkZl?=
 =?utf-8?B?b05CK0x6V1pCNmxXb2txZG1lOVh1QkxjRHZjM2dDdm44bkxrdEF1bmVLdzZV?=
 =?utf-8?B?SFB2b2tVNWhER3F6WHFYMG8wczYxcFREOUpxUVFkNTNKVU84VXRmNUx5OTE1?=
 =?utf-8?B?TGdyY0RGTlBVeHdNbmM5aDdvYWFVLzdGZ2pidUFVWkRvTEdJV1h4KzA5TFA3?=
 =?utf-8?B?VE9SSkFoTGtSbFFQMGJuL1RFTEFjTG4wYWo1ZmZualN1MVRqUmszSnZjSkta?=
 =?utf-8?B?aDJkOFVvdVBrNTltaE1KU2xKNjdBSVdFUURLekZsOWZrUmpLM243Z1l2eHpK?=
 =?utf-8?B?NFhsWUlDbHowSkFpakw4blZ3VDBWblpnbXdYRkNxR2wzaWpDbi9LSkhzOWtS?=
 =?utf-8?B?NHlWQzJjU2lKanVyTk00RlpOcndRMmVqKzIrTXRnay93aERRSGs2MkttSUJR?=
 =?utf-8?B?VWJOSXphWGFWemZucmdEYkQwTUxaQ3ZsSUxzVnNBOUJNWFF5cU5KY3Z5cHF2?=
 =?utf-8?B?SEZPQXVpR2kwNTR0clJKUnprTG82Y1RvNGRIY05WZ21hUGdqbEJQcWlHdUpt?=
 =?utf-8?B?R1RSSy9PNExhemJ1anExaEhaeWk0ZjZkWllSaG5iT3BJYUNiS3dxZEVwQzYz?=
 =?utf-8?B?ZWhuaUxPQ1MyVWNnS2UrQTI2dUxYYnh6SEdpK2RWV2t1WVUxQ3VMRkYrUDBl?=
 =?utf-8?B?N01UN3ZiVVFKd2VWdXdkamhubmFsazh4RkFvbzU0WWhIVEtkSGF6VjY1REla?=
 =?utf-8?B?ZVpwUzdYRVE0aURnTUIzMThMYlRpcktSK2xRUnFvcTUxN1dyUGJwUi9pS08z?=
 =?utf-8?B?SkZaWUpIRUtQQjRKaTlpeWl5TmEvYURPRTFXOCtuWUp2bjhiR1FEam4vY2JF?=
 =?utf-8?B?blZnVFNVcUxvYUFuamh1d3REQnNpWi9zYnVYeS9zZ1B5T1lVWWJzODJkSG10?=
 =?utf-8?B?REVZY2lJd1puNFFyN1ZmMGVLTGVsSExRZHZFNmFtb3E4YXJFYklROW9xYm82?=
 =?utf-8?B?TGUxVE5OUFNvNzZFclp5ejhIanBaWnlrbkdrYWpDUlRYb3hiTXNUOWtUTkgy?=
 =?utf-8?B?anpzRDFWcTUydFgwQkkwTTZ5WG4vZmtPNDlaQW9UZFlLSXlycGRKZFFwYUJt?=
 =?utf-8?B?REpuMHFrQnJmR3VNQjRuY2d3Y1hxd0FydmYzMVhjRmIrdS9WZ1ZKYjBkZlN5?=
 =?utf-8?B?dzR0YXFRbkszTVV3THZWTzQyTTNZNHFHTEgrQU9Ibi96OUloeFYrcy9jR3cw?=
 =?utf-8?B?eVBIajBvT2k3RFhXc2pMZExsWUczNDNSRmIrSUlObmdWMVFvN1FDWTZpUnVV?=
 =?utf-8?B?TGhwUEVVSUFMZEswcjJSSnlEa1ZwUU54dERQVFZTNWhyQlEwa3oyV1BWZWVm?=
 =?utf-8?B?UWFJcFdvT1lpcXU0amtwZk1Lb0NHdnh1bHBsb3pkQVArd05PWG5qbUN1Tkhu?=
 =?utf-8?Q?76kON72lutbvKCW8DVfAB7Amv490cA/eLYcs/8q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8910a1bb-fd1f-47aa-ae6b-08d8e0817259
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2021 09:23:04.8401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LeNfpSxiumu2FOu7Zx0oH/rfDSblWXkcNApq0uzOPb7yQCt9B0FNk4V9kbxw5WHoQEQZR3ELFx0chwmxt6JWCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6047
X-OriginatorOrg: citrix.com

On Fri, Mar 05, 2021 at 05:40:51PM -0800, Stefano Stabellini wrote:
> On Tue, 2 Mar 2021, Stefano Stabellini wrote:
> > On Tue, 2 Mar 2021, Jan Beulich wrote:
> > > On 02.03.2021 10:36, Roger Pau Monné wrote:
> > > > On Tue, Mar 02, 2021 at 09:53:41AM +0100, Jan Beulich wrote:
> > > >> On 02.03.2021 09:14, Roger Pau Monné wrote:
> > > >>> On Mon, Mar 01, 2021 at 06:01:36PM +0000, Andrew Cooper wrote:
> > > >>>> On 01/03/2021 17:59, Andrew Cooper wrote:
> > > >>>>> On 01/03/2021 09:58, Roger Pau Monne wrote:
> > > >>>>>> clang++ relies on the C++ headers installed by g++, or else a clang
> > > >>>>>> build will hit the following error:
> > > >>>>>>
> > > >>>>>> <built-in>:3:10: fatal error: 'cstring' file not found
> > > >>>>>> #include "cstring"
> > > >>>>>>          ^~~~~~~~~
> > > >>>>>> 1 error generated.
> > > >>>>>> make[10]: *** [Makefile:120: headers++.chk] Error 1
> > > >>>>>>
> > > >>>>>> Reported-by: Stefano Stabellini <sstabellini@kernel.org>
> > > >>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > >>>>>> ---
> > > >>>>>> Cc: Ian Jackson <iwj@xenproject.org>
> > > >>>>>> No real risk here from a release PoV, it's just pulling a package
> > > >>>>>> required for the Alpine clang build. Worse that cold happen is that
> > > >>>>>> the Alpine clang build broke, but it's already broken.
> > > >>>>> Shouldn't this be fixed upstream in Alpine?  Its clearly a packaging bug.
> > > >>>>
> > > >>>> Or (thinking about it), we've got a build system bug using g++ when it
> > > >>>> should be using clang++.
> > > >>>
> > > >>> No, the check is using clang++, the issue is that clang++ doesn't
> > > >>> install the standard c++ headers, and thus trying to use them (cstring
> > > >>> in this case) fails. Installing the g++ package solves the issue
> > > >>> because it installs the headers.
> > > >>
> > > >> I have to admit that I consider this odd. The g++ package should
> > > >> neither provide nor depend on the headers. It may recommend their
> > > >> installation. On my distro (SLES) the headers come from the
> > > >> libstdc++-devel package, as I would have expected. There
> > > >> additionally is a dependency of libclang5 (no -devel suffix!) on
> > > >> libstdc++-devel (I suppose this is an indication that things
> > > >> aren't quite right here either; I haven't checked an up-to-date
> > > >> version of the distro yet, though).
> > > > 
> > > > Yes, that was indeed my first attempt as I've tried to install
> > > > libstdc++, but there's no -devel counterpart for the package, and it
> > > > only installs the libraries but not the headers.
> > > > 
> > > > Then if I list the contents of the g++ package, I do see:
> > > > 
> > > > ...
> > > > usr/include/c++/10.2.1/cstring
> > > > ...
> > > > 
> > > > And clang++'s include path is:
> > > > 
> > > > #include <...> search starts here:
> > > >  /usr/bin/../lib/gcc/x86_64-alpine-linux-musl/10.2.1/../../../../include/c++/10.2.1
> > > >  /usr/bin/../lib/gcc/x86_64-alpine-linux-musl/10.2.1/../../../../include/c++/10.2.1/x86_64-alpine-linux-musl
> > > >  /usr/bin/../lib/gcc/x86_64-alpine-linux-musl/10.2.1/../../../../include/c++/10.2.1/backward
> > > >  /usr/include
> > > >  /usr/lib/clang/10.0.1/include
> > > > 
> > > > So it does seem clang depends on the gcc c++ headers, I assume this is
> > > > done in order to avoid having a duplicate set of c++ headers for clang
> > > > and gcc? I really have no idea, but I do think clang package should
> > > > depend on g++.
> > > 
> > > As long as the g++ package is what provides the headers (i.e. if that's
> > > their concept), I agree.
> > 
> > That makes sense to me too.
> > 
> > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> If nobody speaks up, I'll commit this patch and this patch:
> 
> https://marc.info/?l=xen-devel&m=161433737432684
> 
> (both of them already acked by Ian and only affecting automation/)
> within the next day or two.

I've reported the missing c++ headers with clang++ upstream, would you
mind adding this link:

https://gitlab.alpinelinux.org/alpine/aports/-/issues/12492

To the commit message here?

Thanks, Roger.

