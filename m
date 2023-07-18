Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98084757A6F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 13:27:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565127.883012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLiqV-0006sa-Gh; Tue, 18 Jul 2023 11:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565127.883012; Tue, 18 Jul 2023 11:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLiqV-0006qW-CZ; Tue, 18 Jul 2023 11:26:23 +0000
Received: by outflank-mailman (input) for mailman id 565127;
 Tue, 18 Jul 2023 11:26:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=agjq=DE=citrix.com=prvs=55665d270=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qLiqU-0006qA-LF
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 11:26:22 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eac72130-255d-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 13:26:21 +0200 (CEST)
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
X-Inumbo-ID: eac72130-255d-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689679580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4gMrvFmGzJbbiK2O12iR5qtLnHaPJ/TowwpBPBFcl7k=;
  b=Qd44ieppTIJEEV5VHYYw+4bU3/0tutsE66wQEMbbHOmFrVgRGF5s3GBZ
   TMut8/QTgCemi/a/mlDWhK0tBiggyQgc2pxo67SEwKHkeAmXihM79MMTz
   xGnU9u+YsnqHMUqoMHhklW6vWRfTCxJVLk5fFXDNr8YirSLTZ4NIrPSMw
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 115285157
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:rVhEVaBrqwYyBBVW/zrjw5YqxClBgxIJ4kV8jS/XYbTApDkl1T1Vx
 msaWziHbqqMY2b1ed5+boS09UxUuZOEmINiQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GxB7gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw/b18J3NJ9
 uMiJG4mLQusne60wLeJc7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4XXH5UIxxvHz
 o7A103YCRIFC8yE8CSu2yicmf/Uvg6lAo1HQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFabujYMVtwWFPc1gCmPxbDT+B2xHXUfQ3hKb9lOnMYuSCYjz
 FOhg9LjDjspu7qQIU9x7Z/N82n0Y3JMazZfO2ldF1BtD8TfTJ8biUnEaMRkE7GPgoPeWirf2
 TyIrC0MvuBG5SIU7JlX7Wwrkhr1+MiYEFBrul2JNo62xlgnPdD4PuRE/XCetK8dd9jBEzFtq
 VBew6CjAPYy4YZhfcBnaMEEB/mX6vmMK1UwanY/TsB6p1xBF5NOFL28AQ2Sx28zaK7ogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKPosQO8guLV7YpHgGiausM4bFyhBEfUYXY
 MrzTCpRJSxCVfQPIMSeHI/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GALmUwzN14vd+F+92
 48GZ6O3J+B3DLWWjt//rdRCcjjn7BETWfjLliCgXrTbclM6RjF8W6G5LHFIU9UNopm5X9zgp
 hmVMnK0AnKm7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:ANeCPKs1lr6m2DAgkcMyampT7skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-Talos-CUID: =?us-ascii?q?9a23=3AUs1Vr2gpawr+TpdR7tujb8bNtjJudSbW6mXXIFC?=
 =?us-ascii?q?CBThCC6a6U1OS+KZWqp87?=
X-Talos-MUID: 9a23:cgQ81gqgLIiit6NHU5MezxhDP8R33LS1MV4muM82pNmfFgEuYTjI2Q==
X-IronPort-AV: E=Sophos;i="6.01,214,1684814400"; 
   d="scan'208";a="115285157"
Date: Tue, 18 Jul 2023 12:26:05 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH v2 6/6] libxl: add support for parsing MSR features
Message-ID: <d9671c90-b787-4839-9b6c-bd79a320d6a4@perard>
References: <20230711092230.15408-1-roger.pau@citrix.com>
 <20230711092230.15408-7-roger.pau@citrix.com>
 <48d5ca83-d14b-44e1-9431-5324118eacb7@perard>
 <ZLVUQdM3XtclUw5l@MacBook-Air-de-Roger.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZLVUQdM3XtclUw5l@MacBook-Air-de-Roger.local>

On Mon, Jul 17, 2023 at 04:46:25PM +0200, Roger Pau Monné wrote:
> On Thu, Jul 13, 2023 at 11:39:53AM +0100, Anthony PERARD wrote:
> > On Tue, Jul 11, 2023 at 11:22:30AM +0200, Roger Pau Monne wrote:
> > > diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
> > > index b1c4f8f2f45b..86a08f29a19c 100644
> > > --- a/tools/libs/light/libxl_cpuid.c
> > > +++ b/tools/libs/light/libxl_cpuid.c
> > > @@ -158,6 +158,57 @@ static int cpuid_add(libxl_cpuid_policy_list *policy,
> > >      return 0;
> > >  }
> > >  
> > > +static struct xc_msr *msr_find_match(libxl_cpuid_policy_list *pl, uint32_t index)
> > > +{
> > > +    unsigned int i = 0;
> > > +    libxl_cpuid_policy_list policy = *pl;
> > > +
> > > +    if (policy == NULL)
> > > +        policy = *pl = calloc(1, sizeof(*policy));
> > > +
> > > +    if (policy->msr != NULL)
> > > +        for (i = 0; policy->msr[i].index != XC_MSR_INPUT_UNUSED; i++)
> > 
> > Could you add { } for this two blocks? One line after a if() without { }
> > is ok, but not more.
> 
> Sure.
> 
> > > +            if (policy->msr[i].index == index)
> > > +                return &policy->msr[i];
> > > +
> > > +    policy->msr = realloc(policy->msr, sizeof(struct xc_msr) * (i + 2));
> > > +    policy->msr[i].index = index;
> > > +    memset(policy->msr[i].policy, 'x', ARRAY_SIZE(policy->msr[0].policy) - 1);
> > 
> > Is this "array_size() - 1" correct? The -1 need to go, right?
> > 
> > > +    policy->msr[i].policy[ARRAY_SIZE(policy->msr[0].policy) - 1] = '\0';
> > 
> > Is it for convenience? Maybe for easier debugging (printf)? Also, I
> > guess having a NUL at the end mean the -1 on the previous statement kind
> > of useful.
> 
> Yes, it's also to match the format of the policy string used by
> xc_xend_cpuid, which also has a terminating zero.
> 
> Are you OK with this?

Yes.

With the other style change done:
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

