Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2B4327A70
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 10:08:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91367.172693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGeWy-0005Kn-T2; Mon, 01 Mar 2021 09:07:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91367.172693; Mon, 01 Mar 2021 09:07:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGeWy-0005KO-Pg; Mon, 01 Mar 2021 09:07:56 +0000
Received: by outflank-mailman (input) for mailman id 91367;
 Mon, 01 Mar 2021 09:07:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RrjX=H7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lGeWw-0005KJ-VJ
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 09:07:55 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ddd0361-8489-406e-adf6-5bede8c625ca;
 Mon, 01 Mar 2021 09:07:53 +0000 (UTC)
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
X-Inumbo-ID: 5ddd0361-8489-406e-adf6-5bede8c625ca
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614589673;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=IO4TRb+8qfDaDAfoFZmZvmFo6hAgK+6Iksy+OSUbW6g=;
  b=eeR39tNvrDmodWew+uyfTU0mi/sgicMlWrBKsDHr7g8rHZ2GUMjcvshl
   900ckXzWpmhvIgb8QqKz0aNDxLJAvZ+Sd6Os4W0WGj79t6eJGHP9L7JkE
   OJSE2eTHHWWr1/ITtXMPLv/f2JtvCquevhyDeEojojmaamlClXHqHusYl
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: CUTbo1FkNWhhsV4REikeTX72b65wm72oHsRW/5hwGSQQoSU517uM1KPEkIK0IxEIBfehc1M+ZG
 HUDBrYpbfawKQFWrNj295vIqu5WaOZBq6cRkVBYpmAiX5rTuaPeO5lrjGWL6j7bua4fwLTkTc8
 SBau1zkBhYor7iCrKxz/TPqAaCkQL6Cdw4a/Nu75jTvwdj6lmlkqWBhE09TqfeHdawIvlUqO5X
 rsvdZSMTKb+wOFJkwEgbAWF/WvlveNP3LGufwo96RWKmhTUnu05No/MasYTY3/w0TwLILcdt/T
 nX0=
X-SBRS: 5.2
X-MesageID: 39616653
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,215,1610427600"; 
   d="scan'208";a="39616653"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YV/SKS32bhDCJZQNxltk65WMV397fBMfk5D/HQJlX2+AnSpfmDVb2GuhrIm3I/4KBATvOeppHiaAHjghzZZ/IzdkVnrzV9eRjmISSL7Ys5oYi9UYb6hFvEjPaFUqOw7A6Ujdqmg7CbmuqgKu+CtRAuVj4hoZmfZPCc6NJ0an2XSSxJvnnQWp3durtRfyxR7ciCB3pTRLGuqjXZW0rn8Guiq2Lgdq/Oq2U6biYTZZxaz8gZhLBjKoIfQxY2Kh+5JOImeVfNdVmWT4uUtvUEyerJeMlbjs9UseSaB7Y84/87xKVp8A9SptYSSAtHRcwA0v8xyf24ttLb9psXunPcAtJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5huOBLLy9OiE8vIPLa7AJ5tUwdEztGNpNWZRhLiB8KA=;
 b=CYKgDrnysqKO09Ibtd4ekhjSL787kXaV/4M1oe4TqznQVptRbHmDFWGQW6XtWqWKsg3efyU+SFdHcJKPqwog0KkMfKMufxROOvhV7fnhaUOIqg0sVaNgYLdoIXuN91QkFR8PY474sAy+thbV2qeX9phyDFBaoDIkqbovP+S+uI7Ggo1kLhcOc9rWG0H7wg/0pBK1tU8mqp80uC+FBXzUIrzK+9b8RHsIQoyG8OxDoX19DD5Uy3as06oZqfrAP9AF2eGjBg4sQchsQYUcyzingNGJ6XOrzpz3iTQVcc1BN8di/vCVBN6f5tpPaRX5ByWYMgUKWvFBw1i5siUu6JqYyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5huOBLLy9OiE8vIPLa7AJ5tUwdEztGNpNWZRhLiB8KA=;
 b=DsoHogaurcVtbwX6G7E8Xmck3Ul+AgDtVUXbhXvpsIeVaxqGWDpxFomXK/yMA6MHJ1KXxy9hh6wUSJIGoDWQxENERYIGVpe7H2SGpv8Pn6KJ8pMgILf462M5ytsONj2Mjcq3KF3EByB2+axfER07hvycRZp6pR/afyd9qYWVN50=
Date: Mon, 1 Mar 2021 10:07:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.15 2/3] firmware: provide a stand alone set of
 headers
Message-ID: <YDyu3mWSgIIB6s91@Air-de-Roger>
References: <20210226085908.21254-1-roger.pau@citrix.com>
 <20210226085908.21254-3-roger.pau@citrix.com>
 <2133ba4c-5120-30ca-1328-c8700fd2db94@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2133ba4c-5120-30ca-1328-c8700fd2db94@suse.com>
X-ClientProxiedBy: PR0P264CA0251.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::23)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc731300-ec97-4522-6915-08d8dc917cb4
X-MS-TrafficTypeDiagnostic: DM6PR03MB3578:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB35781DC81B8EC65BFD9CCDBE8F9A9@DM6PR03MB3578.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4QRNpPKxHOSCu1K/RWx/mAwCwxRH7uKAIamH2KCVMzeCjs2Byck/gluS3x6tnvqxEb5sfzEXuzBCCaXXTRX/5cgtM3KhTKcXzYgltl+44A5NV8i8TmCciaGhBYXsQj3ymcH+dwVITyLR8jPGKI9+S31glFmwl4sWWUPMseZU8IDzKrS8b1I97CxuxUwjj6wO2+wbq4xhZzU6wrVIVywoezMj2f+/O2+PeDy4lGUN2dgGJsuJVgO2R7cH9Pq43olfV0J0e5MUGBwhacuuNKHtjIuZNWDQgUFMwg0vMJ4+scOCxkpP5Rdma5P/ysLn/8LUc/oDp5bAME5hpPQRQ65ry79ReiHNufWKO2JrwQZm+13Gu50C8ehi54I+7e8jPlMU8w0iU4cI7OO/bHHWOBeELXlmMEl8+nqLFmY3pYa1XUW6O86TyLXVpKonPHDUKCi6HpO9MvWBMwYEVQw1iLwVgD/phIqd7larXbA4udSuKcq8L2k4xGAqG3LToFSaSFGAwdowktuC43vmgd5o3ye9og==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(376002)(346002)(136003)(366004)(39850400004)(186003)(16526019)(6496006)(54906003)(478600001)(9686003)(4326008)(6666004)(85182001)(6916009)(316002)(26005)(86362001)(6486002)(53546011)(33716001)(5660300002)(66946007)(66556008)(66476007)(8676002)(2906002)(8936002)(956004)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UGxkZDNZalRseUp3d0FTRE9XZStHMmQrcmprMGZLdm9RZ2hzeDIwbUdLdWdQ?=
 =?utf-8?B?RUhMYVc1Q2EwUzhxWDUzZWdpdk92QXk1a2xIS0ZKS2VHbEtXY1FacUYvT3Y0?=
 =?utf-8?B?U00xTlhuSkhFQnl3NW4vUVFrNkNKTFdZWVVhMWFIMU5JTVlhWkxKQ2NoN2l5?=
 =?utf-8?B?eXV1KzBBZ1dBU3FHR0NkdUR0Sld3ZzRGZ0JjcW01Q3dwMm50TVlOUklZOFB6?=
 =?utf-8?B?Q0FVSkJqVEx4aHJQbXZqQzluS1ZSTEs1N0V5bENzOVo3S2xSZDZ3UXVBbGRO?=
 =?utf-8?B?MTgwWkw3R1V0aEJRQStySXQ4a0dQVmtTZkRMUEJLcGwwZW5aZGxqd2FYaDJk?=
 =?utf-8?B?RHcvVkFUWTZkR1AyTldRU3pNMjluUkRZK3FPa0lCVUg3NUJjYXMzR3F0amFa?=
 =?utf-8?B?d3k2WnJMZGpyWW01ZnJ1cEJtQzlTMlVRa3l1Vkl4RnhzNk16aGRGUERiK3d4?=
 =?utf-8?B?cTdkWHh1R1FkYTZ0OEw3K1Z3OFFWeVlsbFdHVTNDbllIVFJYeWs0ZVNrZm1a?=
 =?utf-8?B?N3FCbk5GTExsS2pxbFRDL2p5YXd2bnkvOUVuOW0waHUzNkFKZnV4c1dqK3dS?=
 =?utf-8?B?SmR1eSsrU3dBRVJGQXlLTWgySVFVUEVpMWIzWnU2elZGamhuM1F4UDhvc0NF?=
 =?utf-8?B?cG9ZR1UvYWE5Vy9sQXNzRG11L1p5VFlQdThPeHIwcDMxRGY3SU1ZRFBsRkJZ?=
 =?utf-8?B?V093dTVaQU5QWUFLVWJSU2NQekkwaEhibmwzeTJVOCtMcktpSEQ0dE9WWXRS?=
 =?utf-8?B?LzIzYTF0MVgvL25IOTk4dTNOc1BnN1IzUVpRUUM5VGladGprdTIyUTlMeXFr?=
 =?utf-8?B?cHNIZTUwMlBlU2tFNzV1TkxTSHhtOVNxRCtaNUlxQWdjT09ZUjRacTU1eTgy?=
 =?utf-8?B?QXlDN0RsL1RiYU94clBHOGYzUC9LZkU2TkhsdE5VNGFHbUxHNzVZRWhscTJR?=
 =?utf-8?B?cVZiNExXbDJQaGtUbTZZbDFpbXBveDNrd2ZSM05pOWlDTU9IbXpnNGg1a2hH?=
 =?utf-8?B?M3BoVVovTWh3czNDMEFNRjI5K21EVERKZ3RlVWFpV2hacnVGU21zbGlkQTBo?=
 =?utf-8?B?WmtBeXUzMy9LSTFYTk15Y3FQakI2OVNzam5SWTVuL2VHV1JicEIzaWhWaDFF?=
 =?utf-8?B?MHNKblcwRTI0eEZ5UTZnOG9icDdENWZpNGZlTmFpYlU2Q1cxNXM2cFc2YXN2?=
 =?utf-8?B?M0Vsd3JoSzBzNzBOZ29HazM1bis0Wk91UW9zUXJxdFFMQ0pQTENDeWZBd1dK?=
 =?utf-8?B?bncva1FadVpsTXphb3FjMUx4RFV2VzJZZFcyM2VEYkRkTDJqdFJrZjhrN3Zx?=
 =?utf-8?B?OHhIaURqY2NjSnJMQ0V0dEVUNW9acFN2WXgwNitBT2x1NnZDYmtyVEREZjN5?=
 =?utf-8?B?ai9LNlp3cURTQTRHQ2o5Rnh2a0VLdUdGSFZUeWh5b3N4YWkwZElQNDhpUUFo?=
 =?utf-8?B?aVJpUDMrWUNlSVA0ZWtZcjZBWkkrVVpEcmtmdCtZWEc2MVI1cXFKbE9oamJB?=
 =?utf-8?B?d1VRY1dHbWM2b2hWc1FWUUNZTE9INDQ1TWdza3EwRXI1ZjhwdlhJYVMrUWNB?=
 =?utf-8?B?ZjBBV2ZsWVZPTWIxdUUzN2IwMmx5NGlhOThhekx1TS8rVlltdlRtM3Z1bzZw?=
 =?utf-8?B?V293WlBQdU83L3ZOQU9jOExRNDB4dlREWFBnc3pnb2V0amc2eEFaSDBQNDhJ?=
 =?utf-8?B?Rm4vVjQzdWgwSmV3N2FZTGx1c1RPRFVndXZUeE1iRTBXa0MxaVk5TlIvVW95?=
 =?utf-8?Q?GLd2ARg6pGTczF2ncjJ9IIZhOlXk20j44KXtIe9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc731300-ec97-4522-6915-08d8dc917cb4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 09:07:49.5991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +b4iHx1vC6IhH6GyHw1rfL3xj9SRhOhnaCohl7zbwTQT9Ou/2M5S4du0CuCyS3W+IFmGdtxD8w0T7jFmWnLdKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3578
X-OriginatorOrg: citrix.com

On Fri, Feb 26, 2021 at 02:24:43PM +0100, Jan Beulich wrote:
> On 26.02.2021 09:59, Roger Pau Monne wrote:
> > The current build of the firmware relies on having 32bit compatible
> > headers installed in order to build some of the 32bit firmware, but
> > that usually requires multilib support and installing a i386 libc when
> > building from an amd64 environment which is cumbersome just to get
> > some headers.
> > 
> > Usually this could be solved by using the -ffreestanding compiler
> > option which drops the usage of the system headers in favor of a
> > private set of freestanding headers provided by the compiler itself
> > that are not tied to libc. However such option is broken at least
> > in the gcc compiler provided in Alpine Linux, as the system include
> > path (ie: /usr/include) takes precedence over the gcc private include
> > path:
> > 
> > #include <...> search starts here:
> >  /usr/include
> >  /usr/lib/gcc/x86_64-alpine-linux-musl/10.2.1/include
> > 
> > Since -ffreestanding is currently broken on at least that distro, and
> > for resilience against future compilers also having the option broken
> > provide a set of stand alone 32bit headers required for the firmware
> > build.
> > 
> > This allows to drop the build time dependency on having a i386
> > compatible set of libc headers on amd64.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with possibly small adjustments:
> 
> > ---
> > There's the argument of fixing gcc in Alpine and instead just use
> > -ffreestanding. I think that's more fragile than providing our own set
> > of stand alone headers for the firmware bits. Having the include paths
> > wrongly sorted can easily make the system headers being picked up
> > instead of the gcc ones, and then building can randomly fail because
> > the system headers could be amd64 only (like the musl ones).
> > 
> > I've also seen clang-9 on Debian with the following include paths:
> > 
> > #include "..." search starts here:
> > #include <...> search starts here:
> >  /usr/local/include
> >  /usr/lib/llvm-9/lib/clang/9.0.1/include
> >  /usr/include/x86_64-linux-gnu
> >  /usr/include
> > 
> > Which also seems slightly dangerous as local comes before the compiler
> > private path.
> > 
> > IMO using our own set of stand alone headers is more resilient.
> 
> I agree (in particular given the observations), but I don't view
> this as an argument against use of -ffreestanding. In fact I'd
> rather see this change re-based on top of Andrew's changes. Then ...

But doesn't using -nostdinc kind of defeats the purpose of
-ffreestanding, as it would remove all default paths from the include
search, and thus prevent using the gcc private headers?

> > --- /dev/null
> > +++ b/tools/firmware/include/stdint.h
> > @@ -0,0 +1,39 @@
> > +#ifndef _STDINT_H_
> > +#define _STDINT_H_
> > +
> > +#ifdef __LP64__
> > +#error "32bit only header"
> > +#endif
> 
> Could I talk you into extending this to also cover __P64__? (The
> alternative I see would be to omit this altogether.)

Sure. I'm having a hard time finding any documentation for __P64__
however. Does it stand for pointers are 64 bits, while longs are
32bits?

Thanks, Roger.

