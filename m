Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA59CC80B27
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 14:15:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170888.1495908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNWP1-000217-Gq; Mon, 24 Nov 2025 13:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170888.1495908; Mon, 24 Nov 2025 13:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNWP1-0001zR-Dn; Mon, 24 Nov 2025 13:14:47 +0000
Received: by outflank-mailman (input) for mailman id 1170888;
 Mon, 24 Nov 2025 13:14:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qo8f=6A=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1vNWOz-0001zL-FI
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 13:14:45 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89f77f96-c937-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 14:14:43 +0100 (CET)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-297ef378069so38482735ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 05:14:43 -0800 (PST)
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
X-Inumbo-ID: 89f77f96-c937-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763990082; x=1764594882; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mx0eAVVCawFxxfGf6aZiYlusp7e1swgiJgZ3sDSy6qk=;
        b=kB2JJRujuQTwST9ft9bjpMyL28s367B15UOp/70LzE4kXjMB++H9X3WqFFbg9EH/cC
         ngD1EGNmXXYrROK1wYYHinpQlChDOGMViUEO5ttzgYpdW488V4ZarO/QhVBT2ATq9iA/
         DnRHzqLLU3hisWXSMYkWwwDEQrmgOVIcj/8H7nv9S23JdHZU5FobV4QqC8ieKAnX9f/K
         cnCKfaFpmydzYOMa1MJe3m7C/ldWUtlamW2d73mpnGzJ6Izs7+2fxWSvn9IH80r/MFAU
         i2YMB9VbmeosrEU5cJSbJr663l5BRhRAln1lPZZXiKuVlmrpvu9YDGKbJUOardmd8AKm
         hhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763990082; x=1764594882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mx0eAVVCawFxxfGf6aZiYlusp7e1swgiJgZ3sDSy6qk=;
        b=OsiEG4I0entayUJr9DFHdPuaG5G0vnPLlt3WZj7RaYYbuBJKuEgHlabsQ4IHrbtf2C
         sBW0jEzqzD5bHRyapVXR1WmBNVdXCXytrcP4f9+sTmUb6t1CbKHyVf6wVr3y2Ailats2
         w7o9lng0O5j8lFavv+Yr9XjIZu8bvjLeBE3/df2HvDh/6RlpiMR/edDeAl4zg/g8McUD
         ja5OSG5VhlUGFkOrpaFHTfFzU/AaKwxG5dZTzsjhriQ54nKWf7JmTG4WbwFdPuAEKQVJ
         dxb4eOxclCDHIndyQ606j9wn+eERojgu6+fShNXWZ7GJJ3heTKICrXNkxWYDwYVPtKt4
         y20A==
X-Gm-Message-State: AOJu0YxBDVpfAawjfsN41FDbfX58xCK3xFkQnUDt3aTEhv5voGLh8eTC
	Qc3pn6bLJ25JJ8WClolhtfjCfAmohJOxQxyAEjaxEn9XXMZIemDE9q8wSaI4bOSge16+SJs8T6m
	IOLUjpcyeZ7X/7bNvSc9lbzB0cpjnoA==
X-Gm-Gg: ASbGnctCfr8UqT9OsW/8dW59HAmhPprhtP6pwm/X8cdmcXK0hclxS3vvRw9CAbxxFkQ
	GNi7I16WCMOq76bHdmABN0ZqfIj02H7OslaUJnBvqdu+uITxuWspmjS67StHZ1NcQKVS4h0nW6Y
	7mgFVWmwbMSyBRldgp3+jY962REy+tS0uphTkVWH63YjzPYuVES83GmSQHT44YwgYINaqSNj9AG
	fTf52/WAlUVvkPuvwnISQj2QkDhdwm/jZS7s4IMhDoFHnOP2fAHiHrQ2g1XIYexJRFyCn0yVTKI
	7fcHcsH6n2yiNmvMAnuMQlBK
X-Google-Smtp-Source: AGHT+IG5RyIDZuZeTNoL79WDy1rvhcaHWuJbNrwhEtdNMJg42zM55ZNHIdbS/ZFUer6rXwCGEvSj+71H81ZOtc+SN+k=
X-Received: by 2002:a17:90a:ec8f:b0:340:66f9:381 with SMTP id
 98e67ed59e1d1-34733e59272mr11667808a91.10.1763990081667; Mon, 24 Nov 2025
 05:14:41 -0800 (PST)
MIME-Version: 1.0
References: <3bb418ae6a36a9ac89c697a417fa0745fa9ac702.1763949990.git.samaan.dehghan@gmail.com>
 <9c76a959-51c0-4eb7-9d05-ba4441318faa@citrix.com> <CAHFNDNikjXNHCj2RXMoZPckqaQAy2u-xw-QyCO7nXT3pttp6Hg@mail.gmail.com>
 <fbec7d87-126d-4a0f-bce3-dde76d20433b@suse.com>
In-Reply-To: <fbec7d87-126d-4a0f-bce3-dde76d20433b@suse.com>
From: Saman Dehghan <samaan.dehghan@gmail.com>
Date: Mon, 24 Nov 2025 07:14:30 -0600
X-Gm-Features: AWmQ_bk27olYdM7LJtxgGBgSFT-0W85jHxaa10rLRyZVdEL9EwEhGUwItWulYyQ
Message-ID: <CAHFNDNjxCjcv-pDtgCWH2jm_aWBWvuZY7Z3EWJMk679_ofTdFw@mail.gmail.com>
Subject: Re: [PATCH] XEN: enable MC/DC coverage for Clang
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: multipart/alternative; boundary="00000000000034859f064456f221"

--00000000000034859f064456f221
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 6:41=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 24.11.2025 13:31, Saman Dehghan wrote:
> > On Mon, Nov 24, 2025 at 5:15=E2=80=AFAM Andrew Cooper <andrew.cooper3@c=
itrix.com>
wrote:
> >> On 24/11/2025 2:18 am, Saman Dehghan wrote:
> >>> @@ -127,16 +131,25 @@ extern uint64_t __stop___llvm_prf_cnts[];
> >>>  #define END_NAMES       ((const void *)__stop___llvm_prf_names)
> >>>  #define START_COUNTERS  ((void *)__start___llvm_prf_cnts)
> >>>  #define END_COUNTERS    ((void *)__stop___llvm_prf_cnts)
> >>> +#define START_BITMAP    ((void *)__start___llvm_prf_bits)
> >>> +#define END_BITMAP      ((void *)__stop___llvm_prf_bits)
> >>>
> >>>  static void cf_check reset_counters(void)
> >>>  {
> >>>      memset(START_COUNTERS, 0, END_COUNTERS - START_COUNTERS);
> >>> +#ifdef CONFIG_CONDITION_COVERAGE
> >>> +    memset(START_BITMAP, 0, END_BITMAP - START_BITMAP);
> >>> +#endif
> >>
> >> ... this:
> >>
> >>     if ( IS_ENABLED(CONFIG_CONDITION_COVERAGE) )
> >>         memset(START_BITMAP, 0, END_BITMAP - START_BITMAP);
> >>
> >>>  }
> >
> > Thanks Andrew.
> >
> > IS_ENABLED(CONFIG_CONDITION_COVERAGE) is not the same as #ifdef
> > CONFIG_CONDITION_COVERAGE.
> > When the option is completely undefined, IS_ENABLED() returns 1
(enabled).
>
> See our many other uses of IS_ENABLED(). If what you say was true, we'd
have
> breakage for every one of those uses.
>

Sorry, my bad. It works.


> Jan

--00000000000034859f064456f221
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Mon, Nov 24, 2025 at 6:41=E2=80=AFAM Jan Beulich &lt;<a=
 href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br>&gt;=
<br>&gt; On 24.11.2025 13:31, Saman Dehghan wrote:<br>&gt; &gt; On Mon, Nov=
 24, 2025 at 5:15=E2=80=AFAM Andrew Cooper &lt;<a href=3D"mailto:andrew.coo=
per3@citrix.com">andrew.cooper3@citrix.com</a>&gt; wrote:<br>&gt; &gt;&gt; =
On 24/11/2025 2:18 am, Saman Dehghan wrote:<br>&gt; &gt;&gt;&gt; @@ -127,16=
 +131,25 @@ extern uint64_t __stop___llvm_prf_cnts[];<br>&gt; &gt;&gt;&gt; =
=C2=A0#define END_NAMES =C2=A0 =C2=A0 =C2=A0 ((const void *)__stop___llvm_p=
rf_names)<br>&gt; &gt;&gt;&gt; =C2=A0#define START_COUNTERS =C2=A0((void *)=
__start___llvm_prf_cnts)<br>&gt; &gt;&gt;&gt; =C2=A0#define END_COUNTERS =
=C2=A0 =C2=A0((void *)__stop___llvm_prf_cnts)<br>&gt; &gt;&gt;&gt; +#define=
 START_BITMAP =C2=A0 =C2=A0((void *)__start___llvm_prf_bits)<br>&gt; &gt;&g=
t;&gt; +#define END_BITMAP =C2=A0 =C2=A0 =C2=A0((void *)__stop___llvm_prf_b=
its)<br>&gt; &gt;&gt;&gt;<br>&gt; &gt;&gt;&gt; =C2=A0static void cf_check r=
eset_counters(void)<br>&gt; &gt;&gt;&gt; =C2=A0{<br>&gt; &gt;&gt;&gt; =C2=
=A0 =C2=A0 =C2=A0memset(START_COUNTERS, 0, END_COUNTERS - START_COUNTERS);<=
br>&gt; &gt;&gt;&gt; +#ifdef CONFIG_CONDITION_COVERAGE<br>&gt; &gt;&gt;&gt;=
 + =C2=A0 =C2=A0memset(START_BITMAP, 0, END_BITMAP - START_BITMAP);<br>&gt;=
 &gt;&gt;&gt; +#endif<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; ... this:<br>&gt; &=
gt;&gt;<br>&gt; &gt;&gt; =C2=A0 =C2=A0 if ( IS_ENABLED(CONFIG_CONDITION_COV=
ERAGE) )<br>&gt; &gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(START_BITMAP, =
0, END_BITMAP - START_BITMAP);<br>&gt; &gt;&gt;<br>&gt; &gt;&gt;&gt; =C2=A0=
}<br>&gt; &gt;<br>&gt; &gt; Thanks Andrew.<br>&gt; &gt;<br>&gt; &gt; IS_ENA=
BLED(CONFIG_CONDITION_COVERAGE) is not the same as #ifdef<br>&gt; &gt; CONF=
IG_CONDITION_COVERAGE.<br>&gt; &gt; When the option is completely undefined=
, IS_ENABLED() returns 1 (enabled).<br>&gt;<br>&gt; See our many other uses=
 of IS_ENABLED(). If what you say was true, we&#39;d have<br>&gt; breakage =
for every one of those uses.<br>&gt;<div><br></div><div><div class=3D"gmail=
_default" style=3D"font-family:georgia,serif">Sorry, my bad. It works.</div=
><br></div><div><br>&gt; Jan</div></div>

--00000000000034859f064456f221--

