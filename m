Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 758FA2AF2C4
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 14:59:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24825.52268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcqeD-0005au-Sh; Wed, 11 Nov 2020 13:58:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24825.52268; Wed, 11 Nov 2020 13:58:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcqeD-0005aV-PE; Wed, 11 Nov 2020 13:58:53 +0000
Received: by outflank-mailman (input) for mailman id 24825;
 Wed, 11 Nov 2020 13:58:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kcqeC-0005aP-FA
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 13:58:52 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffb27dc9-86d4-4db1-9d1b-fb4f5e92096c;
 Wed, 11 Nov 2020 13:58:51 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kcqeC-0005aP-FA
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 13:58:52 +0000
X-Inumbo-ID: ffb27dc9-86d4-4db1-9d1b-fb4f5e92096c
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ffb27dc9-86d4-4db1-9d1b-fb4f5e92096c;
	Wed, 11 Nov 2020 13:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605103131;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=KEssnSMgi0i12KyQ34fC0O47K4B/pRvdF15SlXvmMgQ=;
  b=RitsR+ySbZqQ9RGZBh1ggcIWnZwpG4qGZK3/bwa3nBTquAqRvCkCwZBB
   OwekhtomtVnuoGIMH0b49wrAHhGVAuYI8qF04ZS01d1YDJu7zwyl3Iys0
   7LAeAO4/BGlSddPaZdj6AHntv+HH/+Wrana/aFVnQp/xKTRsfiQcc69Ki
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 9OB6vcaYkHJY69CdRfIycjwBN0oL6WiZfGnGI3yTnORwvOrc1SrOLM7xAhiuiFds81gUVfegil
 HglMpde/eAtjAtwKBd8eGtqDW7WVGC8dtUkuQjL9ULbX4bdETqkNGEmgXnoD4SBwNl0J2zYfqL
 QXYEhHLF9IclFzsAMxJHfXF0vN2uQcaCzl29lHvCJHZZ/4kWxDk6fc1cbMvxlYtZUaaJ2l3PyZ
 Z7Sjbc6YnxQ/WGCk7hWNen+csuI3M6X+KjjBSvdQTg1Dfd3VVyBnogDgr2yL3+MMBZ/vH1DfIM
 r0w=
X-SBRS: None
X-MesageID: 31289205
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,469,1596513600"; 
   d="scan'208";a="31289205"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWNwso7HdU5Zhug5kFQitMu68kAVIiWwMC+NkZuBzbuuQ9ZNMcbcodeEVGXhuO7I/Q9Ozp7S3rU/KfXjY2upSR2Oej3CT5YKLNA1hxhS2QdNz8E0e2ykaiG7MXX4/tqJ3qLnI7PxFxiek1oDts9ZrDRIqt8MIk76wlRj2B3IkTJIm7uAnxgAGGmpzyFYUqWJV6lIhka4I0G5Rb6E9eXltQqNoOKeok5/32T3KTynvug4wOahdJZ7viKkRdhx21aJ2govSVcfgC8luLzmrKR9WSNIFKDAts3dAGLTZMV/M4GeKLrzz2z2X+MAQmbdlPMiWF54uWFYPSoyr8PVzxCV5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSpNNaLXyuqiFYcmfB9iAlMpva/Dy6v5KrqoG81RS+E=;
 b=jS9JE30tcCGhs1ILKOVQuN8X0U+jY916yN7i8Nj/Sjh2H9pukBgWhzC6vUKtIyOOZoPY0YbD3tK3IwF/GFNQLcZhBbFefpMNt3YN03QPOGqH8dU5MOWOPDkiEYbHWKs0GW9rIfxPE+qaGXy5o0YCV2i7eUS4g+1f2kSszabx0EfVNVwrUv1EEB6s+InRl2oJ/fS4Ler+HPOpSyfzfM/P7d6o1TwVOTxoZOSHoVmHRtQFh1D9mJEAcvr7zaIWb+PnTw8uuUB+j59FTK1P1saJP/fTmjhbH4+GmHYAGEWYLs/T8k87l5XhpAKYKLAZ4LmWKm1TxiLa5jOkkuoBGH/svg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSpNNaLXyuqiFYcmfB9iAlMpva/Dy6v5KrqoG81RS+E=;
 b=ZEUA2k9hb8Uc+zeGsKqsrCNUmx3ptxgfpMMywKgTO0Sg6PoLhIxBvALX2kCvr/GFU3yJjlePSr4rTlj9Ibjejn1aAeJbOkVYPUoisMMfQxSYPrqZs1SrabEYf6C86AByAvNq9LBLtSv7b1gEBOEsBXBd7Qv0ApdrORsNvpcDci4=
Date: Wed, 11 Nov 2020 14:55:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "Rahul.Singh@arm.com" <Rahul.Singh@arm.com>, "Bertrand.Marquis@arm.com"
	<Bertrand.Marquis@arm.com>, "julien.grall@arm.com" <julien.grall@arm.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "iwj@xenproject.org" <iwj@xenproject.org>,
	"wl@xen.org" <wl@xen.org>, Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [SUSPECTED SPAM][PATCH 01/10] pci/pvh: Allow PCI toolstack code
 run with PVH domains on ARM
Message-ID: <20201111135513.yvqfe4xongnhtjcq@Air-de-Roger>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-2-andr2000@gmail.com>
 <20201111123150.7lkabdo3wix7jkdk@Air-de-Roger>
 <57fefaee-9684-4c67-662e-f4c57313886e@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57fefaee-9684-4c67-662e-f4c57313886e@epam.com>
X-ClientProxiedBy: LO2P265CA0516.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99d6be5d-e16c-4a04-865f-08d886496ce1
X-MS-TrafficTypeDiagnostic: DM5PR03MB2491:
X-Microsoft-Antispam-PRVS: <DM5PR03MB249121C89A474F9AB1A224CF8FE80@DM5PR03MB2491.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tPlVSHVEpgwppCr3Ht0+f6Nfqe51IrbgS3/3bPFuOfGZczfCpWhW1hJLmrXqm3UaxNub/xQBkiOm9TtUeTBqUhxUUhbVq4gj439T1UX0T6WQgiK/kbXjBsSJWWhmrm9lY/Lcr95CO/VGsqorJPmt+BpoCSg7yZ2EfiYV7Zr10uockm6C3MFU7IYPD0d3p6roqu2bR82SNoee+xOo8HphOfhMJ70G81nfAfCc2RUyj4ZQk2LPkqO2bAz7jxzxA0lBLqVFGUNBxbJYwW4202NzkrznL/CsrDBgMkhZGWaCaTpgc2Q3UtK7881nD/+ScCzMVnmHA42xBDYTATwqi0oW+84J2LQEF16JefMdsYDUkhI32sfchhBu3EkOKwzY7u4//hQlkDplcfc5GRZgF31I1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(66946007)(6486002)(956004)(1076003)(83380400001)(316002)(6666004)(4326008)(66556008)(66476007)(478600001)(8936002)(16526019)(53546011)(5660300002)(966005)(8676002)(54906003)(9686003)(186003)(85182001)(86362001)(33716001)(6496006)(6916009)(2906002)(26005)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: uroa5iCP6JeN8fsBrSuJmeLtS2CqD+jM0xJXRTyhZH3npJrwzCxwArY/eT5r2UCB5WQExKyAy6mNlVkj2AXkgvfcsoLTSkD3XPa4cr42XAbA0aS+0k8Ta+BtRjYbwfbqbUcOZHz7XrgfZnCcq1oFt9e8LannnkxNzO8JHB9oM2r0xAFGJ5FvEc20YPiJyvChIQfXTikZXe+6ZEvU1FTbmq14Gk0SoBsIhWR4Vo4xG5I00w5vrLqzczovAi3TlvWhIY4VAgNY1lZGy7iGRfyeaF+NngYsJa0SbA9kQBttjxwTz7J5/SZrp1sTAnmFJiAFgs60y+F1ZakiqDhMc9mNXpCiHCORj7fd5as8CiKqcLnOBXMnQuPgKZy3JslBwCo/awo52EWAH/DD8dgJIhB5igvxw61bNV8pftxPtDaQje7tZsd7/Le2GhKTdvx0g5Ew5fbAgtoSHLN25fce5n9hrnjdGZnRle0OL6oE2Y+cJY8XMQqs4tJ2HORgaLMwFsCh59M4RLO/GFkP/ZI0Slr/f48YlQkIgV/XDE4d3JNmbdobvThgBBZS1ZCepBrMsXubiyRjbViSWGuvnxSLxX7HlnGY7rT3CA89yUf1ciOuFmdmtzsyoKnZY4eXifF9brA45YDSx1MDBKZMWGFtUHQkrQ/qY5nv9TsuA8bXAcnv6e38Fv4gJZUW9m3NzeYG6mbw8Y86a1qECU6zQdqscjD+P8foXwaFek1pauXKu+dIoQFYiM5TNwe8VoofMr6ttm5zYObSDx0+VxrYkUpvvP5e56NbXqdlNX6A81SchCyzwvWThs4yDfB4cbj0bIR23miOwRCg4YmsEvkxLCK2bKHFwJ/Uhn0qkl5UseOUZtlBBUuZpsnPxl8AZ1XqKpWysSYK9+UVr7Vg9eE38VJKQCTdnw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d6be5d-e16c-4a04-865f-08d886496ce1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 13:55:19.2330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ck0wm77rXVOTyPinflbKFsRbHse9uDfqSnjJM1fpihqBt6KtxbrPq71EfscCa7LPfriMLVVwRZto1DoIeI+DCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2491
X-OriginatorOrg: citrix.com

On Wed, Nov 11, 2020 at 01:10:01PM +0000, Oleksandr Andrushchenko wrote:
> 
> On 11/11/20 2:31 PM, Roger Pau Monné wrote:
> > On Mon, Nov 09, 2020 at 02:50:22PM +0200, Oleksandr Andrushchenko wrote:
> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>
> >> According to https://wiki.xenproject.org/wiki/Linux_PVH:
> >>
> >> Items not supported by PVH
> >>   - PCI pass through (as of Xen 4.10)
> >>
> >> Allow running PCI remove code on ARM and do not assert for PVH domains.
> >>
> >> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >> ---
> >>   tools/libxl/Makefile    | 4 ++++
> >>   tools/libxl/libxl_pci.c | 4 +++-
> >>   2 files changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
> >> index 241da7fff6f4..f3806aafcb4e 100644
> >> --- a/tools/libxl/Makefile
> >> +++ b/tools/libxl/Makefile
> >> @@ -130,6 +130,10 @@ endif
> >>   
> >>   LIBXL_LIBS += -lyajl
> >>   
> >> +ifeq ($(CONFIG_ARM),y)
> >> +CFALGS += -DCONFIG_ARM
> >> +endif
> >> +
> >>   LIBXL_OBJS = flexarray.o libxl.o libxl_create.o libxl_dm.o libxl_pci.o \
> >>   			libxl_dom.o libxl_exec.o libxl_xshelp.o libxl_device.o \
> >>   			libxl_internal.o libxl_utils.o libxl_uuid.o \
> >> diff --git a/tools/libxl/libxl_pci.c b/tools/libxl/libxl_pci.c
> >> index bc5843b13701..b93cf976642b 100644
> >> --- a/tools/libxl/libxl_pci.c
> >> +++ b/tools/libxl/libxl_pci.c
> >> @@ -1915,8 +1915,10 @@ static void do_pci_remove(libxl__egc *egc, uint32_t domid,
> >>               goto out_fail;
> >>           }
> >>       } else {
> >> +        /* PCI passthrough can also run on ARM PVH */
> >> +#ifndef CONFIG_ARM
> >>           assert(type == LIBXL_DOMAIN_TYPE_PV);
> >> -
> >> +#endif
> > I would just remove the assert now if this is to be used by Arm and
> > you don't need to fork the file for Arm.
> 
> Sounds good, I will drop then
> 
> But what would be the right explanation then? I mean why there was an ASSERT
> 
> and now it is safe (for x86) to remove that?

An assert is just a safe belt, the expectation is that it's never hit
by actual code. Given that this path will now also be used by PVH
(even if only on Arm) I don't see the point in keeping the assert, and
making it conditional to != Arm seems worse than just dropping it.

Thanks, Roger.

