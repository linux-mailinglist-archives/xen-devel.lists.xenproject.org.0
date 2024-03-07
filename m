Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4325E874F94
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 14:05:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689893.1075345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riDQo-0007RF-Nx; Thu, 07 Mar 2024 13:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689893.1075345; Thu, 07 Mar 2024 13:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riDQo-0007PF-Km; Thu, 07 Mar 2024 13:05:06 +0000
Received: by outflank-mailman (input) for mailman id 689893;
 Thu, 07 Mar 2024 13:05:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wkY=KN=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1riDQo-0007P5-2a
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 13:05:06 +0000
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [2607:f8b0:4864:20::102f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50653376-dc83-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 14:05:05 +0100 (CET)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-29954bb87b4so531153a91.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 05:05:05 -0800 (PST)
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
X-Inumbo-ID: 50653376-dc83-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709816704; x=1710421504; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKZLMsjd9ZD8pZaVWQUzyI6GfpWKpoCwubMVbR7UGEc=;
        b=atnyoh9Kq7z93zPR+j+tD5aZ7DMvhOM1yOICun/IgCwUeGwmMtlsKDL92yCiQFYLif
         9papoDT6PsJf+45/T3ZhUQabZ7SkjonOn7sZvvdxOuhVYovJGmQXZnattd+c/ocd4LUH
         eEW2Ys8sHrpTbVka5ZhG3grcPOONhlY9C6L3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709816704; x=1710421504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nKZLMsjd9ZD8pZaVWQUzyI6GfpWKpoCwubMVbR7UGEc=;
        b=PnTbbjZr9Wi/LxzjoIgs/jEgz6y/PhribY+x2H3u7VsHvpFc8+hE8EeINBJzrsfGec
         ytj75Uu08QLpCifUkP7T6HBLRvoU6qYpJA7Mgm+yiVlZU2YMLE1CdKKqBD8u4uZm0MB+
         Cnc+deXPOgXmHVHRWlj/dHXIT23NzEQ3zdy4xeMjL5HdH5gUX+BANn4njUfU4RwNIjuR
         s6U24uHIvByQypwiKgoETYqtQfTIV1XS2cOSL7adheZ9K8BbffEmPX9a4jW6PhRJHPVX
         fbgLAVqdV040kckx/cjzgai9vaEpfoRxvb5VW9GDQcMKMrkmEKnMlYyeOuwmNgNBxfvY
         84jg==
X-Gm-Message-State: AOJu0Yx+9+ObJm52tzA57b4DtswQCge8zTeQy3qf6BCC3X9x1vA04X3o
	4db6+/PFeHxy6NnEVGi7Ml9nTRvUO9/B11J87TlEHvhDw5+dwliKAYm/xRhqBV1e+muqKIOrNuq
	QXaWWDcy+KtlQDh/xO0Nd9a3VddoKG14SVM0K
X-Google-Smtp-Source: AGHT+IE2JQC9swy4Mus2gtg9CMQOzTVy2xa5rsIEBl7jWj+n1lfyqNLmstntW3wrKHi5W/nw2q8q/NHaaPmda1iyQYw=
X-Received: by 2002:a17:90a:4296:b0:299:5b95:cd7d with SMTP id
 p22-20020a17090a429600b002995b95cd7dmr13373916pjg.45.1709816703656; Thu, 07
 Mar 2024 05:05:03 -0800 (PST)
MIME-Version: 1.0
References: <20240305121121.3527944-1-andrew.cooper3@citrix.com>
 <20240305121121.3527944-4-andrew.cooper3@citrix.com> <d6448913-8f22-40ee-b703-4d154906eab7@citrix.com>
In-Reply-To: <d6448913-8f22-40ee-b703-4d154906eab7@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Thu, 7 Mar 2024 13:04:51 +0000
Message-ID: <CAG7k0EoFR1MgTzfyQDZUp2T-Awq4C7a-kM27_EVO7bQD+1uoMw@mail.gmail.com>
Subject: Re: [PATCH 3/3] x86/livepatch: Relax permissions on rodata too
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 1:02=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> On 05/03/2024 12:11 pm, Andrew Cooper wrote:
> > diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
> > index d2efe9e11492..f45812483b8e 100644
> > --- a/xen/common/virtual_region.c
> > +++ b/xen/common/virtual_region.c
> > @@ -91,9 +91,15 @@ void relax_virtual_region_perms(void)
> >
> >      rcu_read_lock(&rcu_virtual_region_lock);
> >      list_for_each_entry_rcu( region, &virtual_region_list, list )
> > +    {
> >          modify_xen_mappings_lite((unsigned long)region->text_start,
> >                                   PAGE_ALIGN((unsigned long)region->tex=
t_end),
> >                                   PAGE_HYPERVISOR_RWX);
> > +        if ( region->rodata_start )
> > +            modify_xen_mappings_lite((unsigned long)region->rodata_sta=
rt,
> > +                                     ROUNDUP((unsigned long)region->ro=
data_end, PAGE_SIZE),
>
> I missed the final refresh to turn this to PAGE_ALIGN().  Fixed locally.

In that case,

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

