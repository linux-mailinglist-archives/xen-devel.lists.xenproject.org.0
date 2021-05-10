Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5566E379064
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 16:13:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125272.235786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg6dd-00076A-6P; Mon, 10 May 2021 14:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125272.235786; Mon, 10 May 2021 14:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg6dd-00073M-2c; Mon, 10 May 2021 14:12:01 +0000
Received: by outflank-mailman (input) for mailman id 125272;
 Mon, 10 May 2021 14:11:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wdO=KF=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lg6db-00073G-S9
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 14:11:59 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a278634-3e30-46e3-ad3b-900ca43f19bc;
 Mon, 10 May 2021 14:11:58 +0000 (UTC)
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
X-Inumbo-ID: 2a278634-3e30-46e3-ad3b-900ca43f19bc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620655918;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5JQ+vXUtDbtQP8ztvtmnQ5r5Ya7aAPV1uZp31rhiqTE=;
  b=Z+F5qNRyr9wX/Av0OplO/lHw977eQUMHdUUCkXHSCU4XfKExLKL8jMv5
   oHDawSwo8OcM9bHUduDdDQzbrAhJG6m42l5Alhyh5r9JbeZm1ia/m30qz
   9v4LX9hbsGilwqaEGnblQ8U9IwIsAivBeUYRUqUBGUVaOevBq/T3n8ygV
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: n7bSBdCyQwfHk/3PDV3oYgiLJyW8IXSq9kHfA3ZhtULPEr7h4erOPB3JU3iMAcmdltBXWJjZMV
 oDingFHCqkM5cEAXQKBS+AYi2addZi48M/QePn33E4snwTgzG3/Vp4xrz2xnFi5Eu28qiYv4Hh
 8SXr8T06kTjZ2AJcbcUb3fb6IOcB4RtihBYHDxGIFpoyLeVN+gZhJBzil9tXS4oShTLU5dGHkO
 j4QuldtMLMVEfJ0IvHVDlB5PBnQQVfvklYss7f0ji+iPCvat3xbfCuY5Jxn2dEpt1yGMJ8OxOw
 gV0=
X-SBRS: 5.1
X-MesageID: 43831601
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:JXJ6iKON47aMQ8BcT+j155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90dq7MAnhHP9OkMMs1NKZMDUO11HYS72KgbGC/9SkIVyHygc/79
 YsT0EdMqyXMbESt6+Tj2eF+pQbsaC6GcuT9IXjJgJWPGVXgtZbnmJE42igcnFedU1jP94UBZ
 Cc7s1Iq36LYnIMdPm2AXEDQqzqu8DLvIiOW29IOzcXrC21yR+44r/zFBaVmj0EVSlU/Lsk+W
 /Z1yTk+6SYte2hwBO07R6c030Woqqh9jJwPr3OtiEnEESvtu9uXvUlZ1S2hkF0nAho0idvrD
 CDmWZmAy050QKtQoj8m2qQ5+Cn6kdj15aq8y7mvVLz5cP+Xz40EMxHmMZQdQbY8VMpuJVm3L
 tMxH/xjeseMfrsplWK2zHzbWAiqqN0mwtWrQcZtQ0VbWLfUs4nkWU7xjImLH4tJlOL1GkXKp
 gbMCiH3ocmTbqzVQGrgoBA+q3TYkgO
X-IronPort-AV: E=Sophos;i="5.82,287,1613451600"; 
   d="scan'208";a="43831601"
Date: Mon, 10 May 2021 15:11:51 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 1/8] libxl: Replace deprecated QMP command by
 "query-cpus-fast"
Message-ID: <YJk/J/iOC4122jzu@perard>
References: <20210423161558.224367-1-anthony.perard@citrix.com>
 <20210423161558.224367-2-anthony.perard@citrix.com>
 <CAKf6xpuDQuUbJ+Gn9OHNU6BXb2Rm+Bdv7hPNtMxcX1CA4d_aYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAKf6xpuDQuUbJ+Gn9OHNU6BXb2Rm+Bdv7hPNtMxcX1CA4d_aYA@mail.gmail.com>

On Wed, Apr 28, 2021 at 12:53:12PM -0400, Jason Andryuk wrote:
> On Fri, Apr 23, 2021 at 12:16 PM Anthony PERARD <anthony.perard@citrix.com> wrote:
> > +static int qmp_parse_query_cpus_fast(libxl__gc *gc,
> > +                                     libxl_domid domid,
> > +                                     const libxl__json_object *response,
> > +                                     libxl_bitmap *const map)
> > +{
> > +    int i;
> > +    const libxl__json_object *cpu;
> > +
> > +    libxl_bitmap_set_none(map);
> > +    /* Parse response to QMP command "query-cpus-fast":
> > +     * [ { 'cpu-index': 'int',...} ]
> > +     */
> > +    for (i = 0; (cpu = libxl__json_array_get(response, i)); i++) {
> > +        unsigned int cpu_index;
> > +        const libxl__json_object *o;
> > +
> > +        o = libxl__json_map_get("cpu-index", cpu, JSON_INTEGER);
> 
> Looks like qmp_parse_query_cpus_fast and qmp_parse_query_cpus just
> differ by the key string.  So you could pass it in as an argument -
> maybe with qmp_parse_query_cpus_fast and qmp_parse_query_cpus as
> wrappers around a common implementation?
> 
> But if you prefer this separate function, it's fine.

I think it's better to have two different functions because we are
parsing two different commands, even if they are very similar.

> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,

-- 
Anthony PERARD

