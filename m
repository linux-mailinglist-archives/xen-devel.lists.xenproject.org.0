Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB45382BE08
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 11:02:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666713.1037529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOEMF-0000gc-Be; Fri, 12 Jan 2024 10:01:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666713.1037529; Fri, 12 Jan 2024 10:01:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOEMF-0000eZ-8e; Fri, 12 Jan 2024 10:01:47 +0000
Received: by outflank-mailman (input) for mailman id 666713;
 Fri, 12 Jan 2024 10:01:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OJSm=IW=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rOEMD-0000eT-TB
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 10:01:45 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 955c8f7b-b131-11ee-9b0f-b553b5be7939;
 Fri, 12 Jan 2024 11:01:41 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-55745901085so7824458a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jan 2024 02:01:41 -0800 (PST)
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
X-Inumbo-ID: 955c8f7b-b131-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1705053701; x=1705658501; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXzBeWK6MOh6MFCMvlg2jq3gV6x6lL9pDwBY1YfITOI=;
        b=xiw+Tcmtbt0LCi/nlNDja6QyoSyeNka9yVBR4XXPfVmosOst4VKuvMjdMBrMXqPVcE
         Y4kE+GO/E8a7TxH5B8h+XSxCPcMhYB3G3VfprTVSNGROltvkqIFQ9/Uhg5yF/XvWA1Do
         r3tBSbRk7HtGt2vnRgA2xokgmIfpo5A3hphRtxFGU+8283BCc3ACwsY0wYPBmtU3lNHV
         Dxo1EvO4BibzFjWxmS7FZdFybGk95cQD5+E8WP/yZWPoO21ntLRKd3+P54Px3ZeE+j4N
         DHPBSjhn18m+E8XieDFIy5kYUQDXGSYZGxS1ftg42fUslIQJurDCHPMW02TOUohJON++
         ip/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705053701; x=1705658501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXzBeWK6MOh6MFCMvlg2jq3gV6x6lL9pDwBY1YfITOI=;
        b=w5FrdaK2RsD3x96ckGrDN8LSwej7BzU6MBEulSHweGkNjeGRyfPLdN06IVn6EgZiz0
         zrd1PITksmkSttDvKsduYzs8d9IHz42nWpP6o7MKLXpuKI+Q77M0iNcpfUlwYsYhCLZ7
         yvjfGQ4xi4xdlGDUvIWMYqCvIAC3S1JSE1kqCrz8GMv3IfINUiUNygOTLuLSKnB7WFKM
         fWoQD3rhfx9anmoH3m0xtMb2nzK5FICjBGTC1QaAgfOq7vC5s36Cd/+gn/9TN3nUm6Bm
         k/KpmI/edHIA1Lfdhh9hIiDes9fHAbx2JKpUPdIM10b5UUos6Nses6z/OJx8298cZ6D2
         35MA==
X-Gm-Message-State: AOJu0YyrTYKHXXopU6pLLA4+1nDaQ2JaaJmdWRp9iTw+R9PZim4BkDN3
	DcbSgPR+m5ijvhTVrzebwvHUM1EYSh4sWoD/uakay08AjYKJ5A==
X-Google-Smtp-Source: AGHT+IFtdQNJnqRbyS27RyrDOU1f8t/2iJT4Mk+bWM7FYtCIpzU76UCemiE5QlCMK8+9qkZMQqZaENLiM4z62Rp08sY=
X-Received: by 2002:a17:906:36d6:b0:a2b:a027:467a with SMTP id
 b22-20020a17090636d600b00a2ba027467amr591618ejc.141.1705053700773; Fri, 12
 Jan 2024 02:01:40 -0800 (PST)
MIME-Version: 1.0
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-9-carlo.nonato@minervasys.tech> <dea5c6bc-e217-4229-9298-74fced9b7439@suse.com>
In-Reply-To: <dea5c6bc-e217-4229-9298-74fced9b7439@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Fri, 12 Jan 2024 11:01:29 +0100
Message-ID: <CAG+AhRWvUipcxzXhKce2pgMYmz039QO_ccWy8fGmcijoYty+-g@mail.gmail.com>
Subject: Re: [PATCH v5 08/13] xen/page_alloc: introduce preserved page flags macro
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Mon, Jan 8, 2024 at 6:08=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 02.01.2024 10:51, Carlo Nonato wrote:
> > PGC_static and PGC_extra are flags that needs to be preserved when assi=
gning
> > a page. Define a new macro that groups those flags and use it instead o=
f
> > or'ing every time.
> >
> > The new macro is used also in free_heap_pages() allowing future commits=
 to
> > extended it with other flags that must stop merging, as it now works fo=
r
> > PGC_static. PGC_extra is no harm here since it's only ever being set on
> > allocated pages.
>
> Is it? I can't see where free_domheap_pages() would clear it before calli=
ng
> free_heap_pages(). Or wait, that may happen in mark_page_free(), but then
> PGC_static would be cleared there, too. I must be missing something.
>
> > --- a/xen/common/page_alloc.c
> > +++ b/xen/common/page_alloc.c
> > @@ -158,6 +158,8 @@
> >  #define PGC_static 0
> >  #endif
> >
> > +#define preserved_flags (PGC_extra | PGC_static)
>
> I think this wants to (a) have a PGC_ prefix and (b) as a #define be all
> capitals.
>
> > @@ -1504,7 +1506,7 @@ static void free_heap_pages(
> >              /* Merge with predecessor block? */
> >              if ( !mfn_valid(page_to_mfn(predecessor)) ||
> >                   !page_state_is(predecessor, free) ||
> > -                 (predecessor->count_info & PGC_static) ||
> > +                 (predecessor->count_info & preserved_flags) ||
> >                   (PFN_ORDER(predecessor) !=3D order) ||
> >                   (page_to_nid(predecessor) !=3D node) )
> >                  break;
> > @@ -1528,7 +1530,7 @@ static void free_heap_pages(
> >              /* Merge with successor block? */
> >              if ( !mfn_valid(page_to_mfn(successor)) ||
> >                   !page_state_is(successor, free) ||
> > -                 (successor->count_info & PGC_static) ||
> > +                 (successor->count_info & preserved_flags) ||
> >                   (PFN_ORDER(successor) !=3D order) ||
> >                   (page_to_nid(successor) !=3D node) )
> >                  break;
>
> Irrespective of the comment at the top, this looks like an abuse of the
> new constant: There's nothing inherently making preserved flags also
> suppress merging (assuming it was properly checked that both sided have
> the same flags set/clear).

Sorry, I may have misinterpreted your comments on the previous version of t=
he
series (I know it was a really long time ago)

https://patchew.org/Xen/20230123154735.74832-1-carlo.nonato@minervasys.tech=
/20230123154735.74832-8-carlo.nonato@minervasys.tech/#c843b031-52f7-056d-e8=
c0-75fe9c426343@suse.com

Anyway, would the solution here be to have two distinct #define? One for
suppress merging and the other for preserved flags. This would probably als=
o
remove any confusion with the usage of PGC_extra.

Thanks.

> Jan

