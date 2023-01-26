Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ABE67C961
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 12:04:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484949.751857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL038-0007PX-Mu; Thu, 26 Jan 2023 11:04:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484949.751857; Thu, 26 Jan 2023 11:04:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL038-0007Nj-JC; Thu, 26 Jan 2023 11:04:10 +0000
Received: by outflank-mailman (input) for mailman id 484949;
 Thu, 26 Jan 2023 11:04:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q9FD=5X=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1pL037-0007Nd-AP
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 11:04:09 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 275f1ab9-9d69-11ed-a5d9-ddcf98b90cbd;
 Thu, 26 Jan 2023 12:04:08 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id vw16so3979166ejc.12
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jan 2023 03:04:07 -0800 (PST)
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
X-Inumbo-ID: 275f1ab9-9d69-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9zSsK+5GG+agbABRpBeWbZ7QWbfd2vhT5X+daJUi+BI=;
        b=oG4jAzvi/710hiyV0GGd3BTGR5Xuu4RBc60L8xZm/sDv7kNJlcjEy5Ou1slimPRkCQ
         SWB7DWFdH7r8EUIbyLac3XiwU/TztgXAF+HNtG1twQVs/L0KSSXNMFL1tgROt3idA/S2
         ZF4vF8nTZfn4J869qqYabtCQLuZiGa9f57PB+gkK1P1WMKdZizC6Nw1KHesZC883R/C7
         gVV50kNe692nIkMWbBNM1Lj6cty+a2wFHzstBA9DmfsbmI5sMujkpbqa6m/Mj3BEr1/o
         mHdqDcBUt183tFBdSBpMBYAoQ+nSAE683oubTys2YwEQWlPD2ROTxlLeE/iyiJyf7DZe
         RAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9zSsK+5GG+agbABRpBeWbZ7QWbfd2vhT5X+daJUi+BI=;
        b=uPBn2jtFJGcPyTIGBJRAiDulbSV+3/XCCcJjHgCC9sA6afdiwidltG+3B2rIq/u1Ii
         jdWUL/rf9EFa1d7MrspR4Zq0JB6aoNQzsOw+yordDnQVIqACh8HGgsKQ0ThMtMGJdiST
         zF8h8dTvV0i4oslsuFCOmDFT6JNWMZZC4jlRU0NILrAIQCSgSh5Reyq2WV76rIRIjAYx
         SVYzzvtUDA4Uo+V7CY1DK0XggNf9XJ09a9/nu7q77jeV++Qo8IfcVdVyXrZurqQn5EO9
         ciu2jbxytrf9jmqzqqKXZvrTP57EGu/PYEWVtcO1aEWJH2djzo7aABSOqi42zjNj4ra6
         b5QQ==
X-Gm-Message-State: AO0yUKUmeUwvQIECu7r8QD9xvc6VsQ23y0EhXyh/IcO4/raWyAnRlx+K
	YXokvY1CaJTnZRbFATzaF0fw/rItXfvQR4ug9N8i0A==
X-Google-Smtp-Source: AK7set+514+TaqtoKcnp+ViRTk2/O6lah9EyL8DwLrPpnQKH/aYB3lOSIK24xOE2Qjiie2drX1VImsPXR8agHjVqm74=
X-Received: by 2002:a17:906:308b:b0:878:42af:c614 with SMTP id
 11-20020a170906308b00b0087842afc614mr913745ejv.149.1674731047361; Thu, 26 Jan
 2023 03:04:07 -0800 (PST)
MIME-Version: 1.0
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-2-carlo.nonato@minervasys.tech> <a470be46-ab6e-3970-2b04-6f4035adf1cb@suse.com>
 <CAG+AhRX9DVW5EfXKQoDG9hmcE0FORydTZd0pNm-0uqwddaN9NQ@mail.gmail.com>
 <6c952571-6a8d-e4fc-36ec-b5b79dac40f6@suse.com> <CAG+AhRUOBgPsT9yU3EtqSPj5VX70H1DsUL_dOWguapC+u3iSvw@mail.gmail.com>
 <bececcba-7606-924d-aba1-f51134414fd0@suse.com> <2be0aa77-3381-8552-a6e3-917e9005cdc2@xen.org>
In-Reply-To: <2be0aa77-3381-8552-a6e3-917e9005cdc2@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 26 Jan 2023 12:03:56 +0100
Message-ID: <CAG+AhRWZkrRkm12r+P2hUXAGELXVpu=2Fqpk7mO3q=+RPt9vyQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] xen/common: add cache coloring common code
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Julien and Jan,

On Thu, Jan 26, 2023 at 11:16 AM Julien Grall <julien@xen.org> wrote:
>
> Hi Jan,
>
> On 26/01/2023 08:06, Jan Beulich wrote:
> > On 25.01.2023 17:18, Carlo Nonato wrote:
> >> On Wed, Jan 25, 2023 at 2:10 PM Jan Beulich <jbeulich@suse.com> wrote:
> >>> On 25.01.2023 12:18, Carlo Nonato wrote:
> >>>> On Tue, Jan 24, 2023 at 5:37 PM Jan Beulich <jbeulich@suse.com> wrote:
> >>>>> On 23.01.2023 16:47, Carlo Nonato wrote:
> >>>>>> --- a/xen/include/xen/sched.h
> >>>>>> +++ b/xen/include/xen/sched.h
> >>>>>> @@ -602,6 +602,9 @@ struct domain
> >>>>>>
> >>>>>>       /* Holding CDF_* constant. Internal flags for domain creation. */
> >>>>>>       unsigned int cdf;
> >>>>>> +
> >>>>>> +    unsigned int *llc_colors;
> >>>>>> +    unsigned int num_llc_colors;
> >>>>>>   };
> >>>>>
> >>>>> Why outside of any #ifdef, and why not in struct arch_domain?
> >>>>
> >>>> Moving this in sched.h seemed like the natural continuation of the common +
> >>>> arch specific split. Notice that this split is also because Julien pointed
> >>>> out (as you did in some earlier revision) that cache coloring can be used
> >>>> by other arch in the future (even if x86 is excluded). Having two maintainers
> >>>> saying the same thing sounded like a good reason to do that.
> >>>
> >>> If you mean this to be usable by other arch-es as well (which I would
> >>> welcome, as I think I had expressed on an earlier version), then I think
> >>> more pieces want to be in common code. But putting the fields here and all
> >>> users of them in arch-specific code (which I think is the way I saw it)
> >>> doesn't look very logical to me. IOW to me there exist only two possible
> >>> approaches: As much as possible in common code, or common code being
> >>> disturbed as little as possible.
> >>
> >> This means having a llc-coloring.c in common where to put the common
> >> implementation, right?
> >
> > Likely, yes.
> >
> >> Anyway right now there is also another user of such fields in common:
> >> page_alloc.c.
> >
> > Yet hopefully all inside suitable #ifdef.
> >
> >>>> The missing #ifdef comes from a discussion I had with Julien in v2 about
> >>>> domctl interface where he suggested removing it
> >>>> (https://marc.info/?l=xen-devel&m=166151802002263).
> >>>
> >>> I went about five levels deep in the replies, without finding any such reply
> >>> from Julien. Can you please be more specific with the link, so readers don't
> >>> need to endlessly dig?
> >>
> >> https://marc.info/?l=xen-devel&m=166669617917298
> >>
> >> quote (me and then Julien):
> >>>> We can also think of moving the coloring fields from this
> >>>> struct to the common one (xen_domctl_createdomain) protecting them with
> >>>> the proper #ifdef (but we are targeting only arm64...).
> >>
> >>> Your code is targeting arm64 but fundamentally this is an arm64 specific
> >>> feature. IOW, this could be used in the future on other arch. So I think
> >>> it would make sense to define it in common without the #ifdef.
> >
> > I'm inclined to read this as a dislike for "#ifdef CONFIG_ARM64", not for
> > "#ifdef CONFIG_LLC_COLORING" (or whatever the name of the option was). But
> > I guess only Julien can clarify this ...
> Your interpretation is correct. I would prefer if the fields are
> protected with #ifdef CONFIG_LLC_COLORING.

Understood. Thanks to both.

> Cheers,
>
> --
> Julien Grall

