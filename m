Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B378F36940F
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 15:51:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116389.222166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZwDP-0000RZ-HP; Fri, 23 Apr 2021 13:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116389.222166; Fri, 23 Apr 2021 13:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZwDP-0000R8-E8; Fri, 23 Apr 2021 13:51:27 +0000
Received: by outflank-mailman (input) for mailman id 116389;
 Fri, 23 Apr 2021 13:51:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zio3=JU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZwDO-0000R0-4n
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 13:51:26 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8eb185c-81d9-4d34-9ff1-49d23c057518;
 Fri, 23 Apr 2021 13:51:24 +0000 (UTC)
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
X-Inumbo-ID: a8eb185c-81d9-4d34-9ff1-49d23c057518
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619185884;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=SGiwg/T7XJuysignCfskqqQXoUQWM7Fdgk5SpfAekOI=;
  b=WS+W9ici4PuBGYuRaI1sMPsgPvDB0MIA37cxGxly0U9kup7HmHAIfdqu
   ZtAdtpg+LjdrgEUTbu8N8cbwpull7R0oi3o6PyPl0K9lwRoSd8G6V+cqZ
   IpC9ipEGDaSpAUHG5jm9c5dWuAOejVYlcrzTFwHeF4qfMvzu4igIabmD2
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +8tgCfwlES+dhLKNE6QFYglt205fRmPGyOucG3OC9aQy3A94rEx8a4KzucpEMeH8ELbn94iRdQ
 7erKGsS6BKnW5c0xy6z3ppiiS91ToP7AUN7bQyjX5Z+yBqZnUM15+kakCiqv3/rEpWVvnIqe2v
 EHw52s/ik+Dk/vYpBWjaUTGQRIRLCTeWmhAB5IY2YAMTrlpyCvLXHrNTAM/krDfaxPOTEx3VvP
 RlXLF+0fZQvY30UyZmqjZwvrywXaEnPWo917T8pGO2sVM2fWbfJzqY2StPjtwsiWbcB2NQEK/l
 MAg=
X-SBRS: 5.2
X-MesageID: 42659258
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:LahlBaDnOm+fJMblHej3sceALOonbusQ8zAX/mpaICY1TuWzkc
 eykPMHkSLugDEKV3063fyGMq+MQXTTnKQFhLU5F7GkQQXgpS+UPJhvhLGSoQHINiXi+odmtZ
 tIXLN5DLTLYmRSqebfzE2GH807wN+BmZrFuc77w212RQ9nL4FMhj0JbjqzKUF9SAlYCZdRLv
 P1jKd6jgGtZGgNaYCDDmQFNtKzwOHjro7sYhINGnccmWqzpA6vgYSVLzGomj0EVSlU+Kwv9W
 jenxbZ6q2vv+qg5R/YymPJ45l8iOHszdZoAsuKhsIJLC6EsG2VTbUkfaaNtDc0s+mz6FAssd
 XFrhs6Jf1p52ncZX64rHLWqm/d7Ao=
X-IronPort-AV: E=Sophos;i="5.82,245,1613451600"; 
   d="scan'208";a="42659258"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dM8kMuS7bzYZpQLZ5YPuVXddZQWXHB3DiCnoBTJFsInhoSU7mJuqahauKOwdq/WarziR2wiJ3Ce7GdspbNuHjh1/f3JKfrkbmt2oFqw/9DkXZR/Lqobnr+4tPIj3FNawwbwfme4I/1+nJwcOIYOVv6n6/HicDTRLjqBeZotoa++ijrzqvS1ir0ye0kyclybdQ+IZfKR63pkALuqTJ5U5kcvj7zCH5n5+8kKojAv/Y/p9MyUuXuPZs4TkIzHq7eV1U1gXT1zEdaPducAAXz764G1eiYYyKifNg4H34Uazhxc04Fva7KocwxUKeB2kkqUwtf1YmDujI7XMUP3yxXGTpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmFvbmj2re7gSkY5LQiY53/AQqEKEF1QrBZ/XaB/qpw=;
 b=oPU1fJl/EMRqNQ4onICUmR3T0IWgsoC9/a8I0IQJwS6QVN0ioRXPRnVfgcNmBrdxeOY4eVTjcwj+m9qICmqBHQdR5g7syJ6SD36gdBluUYasObInRNcYPHexkDmY+56G128WaIKZs3HKitAh7pNM9506mehVnUFA7opkL8MTMpv5okbwiEjsaZ6qbBSJXvqyvtvYHuD8pImEjOFctyc3/YXjqGab64NYr1KDaoWrJ0nsq/PPTNOcN85efwLzL6obQRKCp8tJazba1HJuv3PqV896GrV9Z6cAq4stVnHsrvLJhSXUtH8e8nDQSsZ9ueBfQEyioq5Gpl5Yh/W14GRx6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmFvbmj2re7gSkY5LQiY53/AQqEKEF1QrBZ/XaB/qpw=;
 b=iw7bOEb5gNcbs4cqqD8WFdP24mbejra+qMRl/xTWt5w5NgNGYdahub6bV29C6HL7TuWHJYrnRuv5zjP8JcgYyTSQgMK1Qekkkub5vSWJiUyij0QvnlNa0RqFxeoQ2n8lQlm2/swA4QTQFWHJFIQ3ULj+7AMX2I7Yy8Cb9RUyEs4=
Date: Fri, 23 Apr 2021 15:51:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/oprofile: remove compat accessors usage from
 backtrace
Message-ID: <YILQ0tj8QceN1jaB@Air-de-Roger>
References: <20210423123509.9354-1-roger.pau@citrix.com>
 <7d77cd67-5866-9d58-b2d0-b8d28b827084@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d77cd67-5866-9d58-b2d0-b8d28b827084@suse.com>
X-ClientProxiedBy: PR3P193CA0012.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59589bf1-57c6-43e5-ca19-08d9065edfcd
X-MS-TrafficTypeDiagnostic: DM6PR03MB4218:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4218E848249EFC0C1E0013318F459@DM6PR03MB4218.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ASJPuzquxJsyXCHBplVV0gqQ3QRpzWFTTlRpSE1/Hn013ZhpDZ2SbcWH2R5EpvWaF0OZI76jbraPVgY/E101mu98ijLYPGNB4tjBdV80zzDyh9REd7Re6F4QLzKnLJr+n045TEdliFz5xFgfpBwzfBln6P+lHl+kIuMmkjTaAeh3MY4UUrIMBCemj1ElkTnOWr0/ZN7Ih9YDmXFCLIRsc//tS9eXX1H+IPf/DY41xWYeewzITNZXwJhK/Np6B7oDzYFTig6PaQRWGZjZ617QSswP2LmVNt+/ScwRsU6qQzTTBcEx48MjFIUUK92i7Xg6wStDY5tSHW6QCZtdQOOtxHy+R8S4d/R+hLx3DPvhZDKihCOa5P1CSp5KEguNwlkzyfftDNcpMlejAAui3ua9+1ERw+F5rlLX0tfblHxkI6+k1V3b2A74Uhul0++Vzsuy2jTCfN/mGV491v7ZnAyl2shtXXDrMr9/85iutQe0m32mcUFDC9cR84GHe9LgFUXhP4STEdpYkdk9PWxZrvr3NTyNJGFc64idm/d3sLUuKjLSYkATJ18pC/wxf3IpmB404hpkeP/VRYJ/vHlZ7qV2ZwFzh5NcgE2uQgqPJzxm80c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(376002)(366004)(136003)(396003)(39850400004)(186003)(26005)(6916009)(16526019)(38100700002)(5660300002)(83380400001)(8676002)(54906003)(8936002)(66946007)(4326008)(316002)(478600001)(66476007)(66556008)(86362001)(33716001)(6666004)(9686003)(2906002)(53546011)(85182001)(6496006)(956004)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MUp5SWZXMU01NDcwZ08vQjFHaC82R3l5M0dUREdobTEwckFsUzFVdmJDZ3Z5?=
 =?utf-8?B?dlBjbjhVVmtINU9kQ0ErallzNmowaDNIUnVvRFVqekZoK3hXUmY3QjYwZVJn?=
 =?utf-8?B?QkwrbE42WHFLYmd2TGZsVFJrcFpYWEh3Mmg2dFdRQ053RmJqSGovQk9GRDMr?=
 =?utf-8?B?ZmFkUXFrT2dUR3psOUxrT2lPNEVOc0N1ZEQ1amZ5SDhteTB6T1JKTnN5UDJF?=
 =?utf-8?B?b216MFZGN0dkcWFZTjZqWTNGYnVtcEhvZlpBRXZIdW1vZ0ZqaFdzZ1RwcWJD?=
 =?utf-8?B?OTV6ZmwxbWN0ZWRpSFY5MG9PMlNycWlIRGhyd1hXOWFYS1J3TWpTdFgvbTdC?=
 =?utf-8?B?YXNQaTc3aWxyL1BYRlNQVVRidVkxVmIxa1FhQjU4NUMyWm9aVEQ0b1MxK3Jr?=
 =?utf-8?B?S01pbVN2eGJsMkNMY1AxL1V1UU1aRThuVzBrMERZaEFHblZTVFJWWFg1eHo0?=
 =?utf-8?B?ZDQ4SlRla0RSTVBsMWlmc0FPNXFqZkdIVE11bnpKTnFCdkJHNlNZd0llbC9C?=
 =?utf-8?B?K3NCK2lmb1NyQ2hWTFN3dFp1V3VWNHZ4L1RkRDFIaGNsM0hkbC84b0ZUbEdr?=
 =?utf-8?B?MjI3S2xhdVYvSG9vL3llZkViVHFoeWNBdjFZb011U0ZwWDhJdWJmTFdIOVFG?=
 =?utf-8?B?VHVtaUpWOXpZanhzRXdrM285dzBuS21mb1pDby85MThlYllMaEwvTllVMVVN?=
 =?utf-8?B?RlorazAvdnVra3pRcEF3MG9ZQlhyOHVLR0ZFZktBc2Q3eGRLT0R5U01taGVl?=
 =?utf-8?B?bUpXdkpkclVNS3ZpN3NwTzRKQUt5QkthRVZLQTliY1NJM0hkT2cyMmFESkdP?=
 =?utf-8?B?T2QvQitNb1hVa21XSHJoOVFwTVE2bUlObGRET0g4MCtnRE9temhob0R6a0RR?=
 =?utf-8?B?aEpqWXBtT3oyUUUzNFFCb1hWd3RkektZcHdXTjEvOURWdUhPdURSWlRpbnFv?=
 =?utf-8?B?MWJBaldMUU5zZ2RwUmE2M0Jsc2paTGF6eTl0RElQYlRjY2o2WjlPL3Z4bXRC?=
 =?utf-8?B?Z1lnMFRIWStsOXY3aldFUTFrTGlvdjR3dWhTR241MnY1a09RdWdoRUFGRXJG?=
 =?utf-8?B?K0tJaEsvcHV1UzlXSmFWY1Vpcjhvc3RWNTI3clZxWHlJTGhqV3BnUExtSzd4?=
 =?utf-8?B?Q2RycHVIM3NuM1dydURQUWxoQ2VodFNxT2srUmxjenlscTFlSCt2ZGt3bHpw?=
 =?utf-8?B?YjcwbE56dGNzb1ZwbXZFSjVjZkplZ3BOUlFIUVJJTUREZVQrU1JRWnZJa09s?=
 =?utf-8?B?Yys0c2ZVOFJIeWdKcFB2TjdPUnpXMUI3ZHZXbjJtaFl2dTdZS1VUZ240eG5j?=
 =?utf-8?B?NjZMTTJsOU40ODltK1ptUUE3MVFrc3hCSW5qZytMNEJOYjBtL1JqUGR5ZXRJ?=
 =?utf-8?B?a2FoK1pIS2VoYkpwQkJCYzc3bjJsMDZoQWRVRllWZkd0WHhTU2grelROYktx?=
 =?utf-8?B?RTFiMCtndGpzbVFlbkZIZSt4TWNFWGVBRm40eVRud00velRyNHFYcXdpa28y?=
 =?utf-8?B?YlNUUkFnakZpbEVKTmJhbloxQjZLT041WUFSNW1NeW5JUEI3aVdRY3BoakVp?=
 =?utf-8?B?d2NJbkdJY0lzVUNPRFVVVDl0K3ZQdXV6VW9KMGQ2MFFBWlZYRzc4WFQ1VlY1?=
 =?utf-8?B?TFRmMmdXeWU3bFRHWEp4b0l6dFJhL3BhRlhHb08xbFo5TWVzWmh4RG9JTkRt?=
 =?utf-8?B?cmhKUVUxcFVJVnhzK1JMTWV0VmMyZ3ZXbGZON3V6TnM3YndZbmFiM3pleFJ0?=
 =?utf-8?Q?Gl8ekAdbYHLUpU/tjYYWPbzC90ks75qvWeN3/i2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59589bf1-57c6-43e5-ca19-08d9065edfcd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 13:51:20.4529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Awn9jmXZkXnrnPEjY8Ly45yAmcjlOTVPCcnmsTVCgvGgiOqbx2yfEX3x8XBZryvLtgWxUm1fFZsBjQlUWigEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4218
X-OriginatorOrg: citrix.com

On Fri, Apr 23, 2021 at 02:53:14PM +0200, Jan Beulich wrote:
> On 23.04.2021 14:35, Roger Pau Monne wrote:
> > Remove the unneeded usage of the compat layer to copy frame pointers
> > from guest address space. Instead just use raw_copy_from_guest.
> > 
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Just build tested. Note sure I'm missing something, since using the
> > compat layer here was IMO much more complicated than just using the
> > raw accessors.
> 
> The main reason, I suppose, was that raw_copy_*() aren't supposed to
> be used directly.
> 
> > @@ -59,34 +56,17 @@ dump_guest_backtrace(struct vcpu *vcpu, const struct frame_head *head,
> >  {
> >      frame_head_t bufhead;
> >  
> > -#ifdef CONFIG_COMPAT
> >      if ( is_32bit_vcpu(vcpu) )
> >      {
> > -        DEFINE_COMPAT_HANDLE(frame_head32_t);
> > -        __compat_handle_const_frame_head32_t guest_head =
> > -            { .c = (unsigned long)head };
> 
> You're losing the truncation to 32 bits here.

I didn't think it was relevant here, as value should already have the
high bits zeroed?

One being the rbp from the guest cpu registers and the other a
recursive call using bufhead.ebp.

> >          frame_head32_t bufhead32;
> >  
> > -        /* Also check accessibility of one struct frame_head beyond */
> > -        if (!compat_handle_okay(guest_head, 2))
> > -            return 0;
> 
> If you intentionally remove this and ...
> 
> > -        if (__copy_from_compat(&bufhead32, guest_head, 1))
> > +        if (raw_copy_from_guest(&bufhead32, head, sizeof(bufhead32)))
> >              return 0;
> >          bufhead.ebp = (struct frame_head *)(unsigned long)bufhead32.ebp;
> >          bufhead.ret = bufhead32.ret;
> >      }
> > -    else
> > -#endif
> > -    {
> > -        XEN_GUEST_HANDLE_PARAM(const_frame_head_t) guest_head =
> > -            const_guest_handle_from_ptr(head, frame_head_t);
> > -
> > -        /* Also check accessibility of one struct frame_head beyond */
> > -        if (!guest_handle_okay(guest_head, 2))
> > -            return 0;
> 
> ... this, then you should justify why these aren't needed anymore
> (or maybe were never really needed). They've been put there for a
> purpose, I'm sure, even if I'm unclear about what one it was/is.

I've been doing some archaeology on Linux and I'm still not sure why
this is required. Linux copies two frame_head{32,}_t elements, so we
could follow suit and do the same - albeit I won't be able to provide
a reasoning myself as to why this is required, the second element
seems to be completely unused.

Thanks, Roger.

