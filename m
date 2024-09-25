Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35619985EA5
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 15:39:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803983.1214837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stSEv-0001Q0-C8; Wed, 25 Sep 2024 13:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803983.1214837; Wed, 25 Sep 2024 13:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stSEv-0001O4-9F; Wed, 25 Sep 2024 13:39:33 +0000
Received: by outflank-mailman (input) for mailman id 803983;
 Wed, 25 Sep 2024 13:39:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBXn=QX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stSEu-0001Ni-0H
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 13:39:32 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97055ea8-7b43-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 15:39:30 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8d51a7d6f5so1001951666b.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 06:39:30 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f3490csm209700766b.21.2024.09.25.06.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 06:39:29 -0700 (PDT)
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
X-Inumbo-ID: 97055ea8-7b43-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727271569; x=1727876369; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ep0RdwOkYUMgJGE4N+0f/QxluvohdFfKuem/MgOz9/M=;
        b=KC6BKPV5kjvhYFhXvmrqZZo5UcQX2nuG1JqxZQwab0PUAa2Kg+k86opUYk3d5mRI3K
         6wFRRT7asokVHPOfGOWnOANF3OoEQR8xPcz2gKr7InIeltVrQVn+D8ofHfofwhMKDKug
         qQawXfBKuhCDuGdrMm15irhrfsOO4qt3hXfMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727271569; x=1727876369;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ep0RdwOkYUMgJGE4N+0f/QxluvohdFfKuem/MgOz9/M=;
        b=c8Zd8vF8wrI/VSt8jIWUtEXTpMUKezp3BQfurYzPk4Zun3KRmKdliomubtpXsEBqaP
         xNTFeXvI73+uwz6/sLDXJpEwS8nHkZ2PHv9lhsqlJZYY7bqv0KyvKeqP+OW/UO+xt6W9
         JW/rwcHXOzxJolDkUllWTqDypyceDdTCOkga4pWz3PJp7nFm3vomuChWVq09rDNhXTaJ
         FeQ6TMVVfPjFEf+mIlot5dYgc2I0mqYme4LhBhnh62+LhKuKX7G3ALauLBeQGQsNWvbV
         bNPf5xnmmMV6CnD0kLdi+vn/QbQNJ2NF+4iZmlkb8oCIlPhFt6BzHUma76Y/hCvybuJZ
         n50A==
X-Gm-Message-State: AOJu0YxBWjUxzSh39DLOzwhyycYxkHkamf/1rFt+5xnqmcAXP4gjcYdD
	zAemAZiI4slr7kJOHipKPbWdaB349J6/wxzk3aGP03+oJDuwSzdfvuBslzJxiNs=
X-Google-Smtp-Source: AGHT+IF5rojT9mLmnI6J3gNaVmcXM+Jm4S2mzn5S5FHFamYZ3NZTSo9Y+1/VDudjt653wQd4xcPlRA==
X-Received: by 2002:a17:907:7fa4:b0:a7d:e956:ad51 with SMTP id a640c23a62f3a-a93a036a6ccmr288911766b.21.1727271569316;
        Wed, 25 Sep 2024 06:39:29 -0700 (PDT)
Date: Wed, 25 Sep 2024 15:39:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v2 4/6] xen/livepatch: do Xen build-id check earlier
Message-ID: <ZvQSkDv1rrASCsSu@macbook.local>
References: <20240925084239.85649-1-roger.pau@citrix.com>
 <20240925084239.85649-5-roger.pau@citrix.com>
 <eaa4a524-fd12-4716-9d9f-cff25a4c9bbf@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eaa4a524-fd12-4716-9d9f-cff25a4c9bbf@citrix.com>

On Wed, Sep 25, 2024 at 11:21:01AM +0100, Andrew Cooper wrote:
> On 25/09/2024 9:42 am, Roger Pau Monne wrote:
> > The check against the expected Xen build ID should be done ahead of attempting
> > to apply the alternatives contained in the livepatch.
> >
> > If the CPUID in the alternatives patching data is out of the scope of the
> > running Xen featureset the BUG() in _apply_alternatives() will trigger thus
> > bringing the system down.  Note the layout of struct alt_instr could also
> > change between versions.  It's also possible for struct exception_table_entry
> > to have changed format, hence leading to other kind of errors if parsing of the
> > payload is done ahead of checking if the Xen build-id matches.
> >
> > Move the Xen build ID check as early as possible.  To do so introduce a new
> > check_xen_buildid() function that parses and checks the Xen build-id before
> > moving the payload.  Since the expected Xen build-id is used early to
> > detect whether the livepatch payload could be loaded, there's no reason to
> > store it in the payload struct, as a non-matching Xen build-id won't get the
> > payload populated in the first place.
> >
> > Note parse_buildid() has to be slightly adjusted to allow fetching the section
> > data from the 'data' field instead of the 'load_addr' one: with the Xen build
> > ID moved ahead of move_payload() 'load_addr' is not yet set when the Xen build
> > ID check is performed.  Also printing the expected Xen build ID has part of
> > dumping the payload is no longer done, as all loaded payloads would have Xen
> > build IDs matching the running Xen, otherwise they would have failed to load.
> >
> > Fixes: 879615f5db1d ('livepatch: Always check hypervisor build ID upon livepatch upload')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Much nicer.  A couple of suggestions.
> 
> > ---
> > Changes since v1:
> >  - Do the Xen build-id check even earlier.
> > ---
> >  xen/common/livepatch.c              | 66 +++++++++++++++++++----------
> >  xen/include/xen/livepatch_payload.h |  1 -
> >  2 files changed, 44 insertions(+), 23 deletions(-)
> >
> > diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> > index 8e61083f23a7..895c425cd5ea 100644
> > --- a/xen/common/livepatch.c
> > +++ b/xen/common/livepatch.c
> > @@ -448,24 +448,21 @@ static bool section_ok(const struct livepatch_elf *elf,
> >      return true;
> >  }
> >  
> > -static int xen_build_id_dep(const struct payload *payload)
> > +static int xen_build_id_dep(const struct livepatch_build_id *expected)
> >  {
> >      const void *id = NULL;
> >      unsigned int len = 0;
> >      int rc;
> >  
> > -    ASSERT(payload->xen_dep.len);
> > -    ASSERT(payload->xen_dep.p);
> > +    ASSERT(expected->len);
> > +    ASSERT(expected->p);
> >  
> >      rc = xen_build_id(&id, &len);
> >      if ( rc )
> >          return rc;
> >  
> > -    if ( payload->xen_dep.len != len || memcmp(id, payload->xen_dep.p, len) ) {
> > -        printk(XENLOG_ERR LIVEPATCH "%s: check against hypervisor build-id failed\n",
> > -               payload->name);
> > +    if ( expected->len != len || memcmp(id, expected->p, len) )
> >          return -EINVAL;
> > -    }
> 
> I'd suggest merging this into check_xen_buildid(), which is the single
> caller and serves the same singular purpose.
> 
> It removes the ASSERT() (expected is now a local variable), and it helps
> with some diagnostic improvements.

Sure.

> >  
> >      return 0;
> >  }
> > @@ -495,11 +493,44 @@ static int parse_buildid(const struct livepatch_elf_sec *sec,
> >     return 0;
> >  }
> >  
> > +static int check_xen_buildid(const struct livepatch_elf *elf)
> > +{
> > +    struct livepatch_build_id id;
> > +    const struct livepatch_elf_sec *sec =
> > +        livepatch_elf_sec_by_name(elf, ELF_LIVEPATCH_XEN_DEPENDS);
> > +    int rc;
> > +
> > +    if ( !sec )
> > +    {
> > +        printk(XENLOG_ERR LIVEPATCH "%s: %s is missing\n",
> 
> "%s: Section: '%s' missing\n".
> 
> (Maybe no single quotes around the section as we know it's non-empty.)
> 
> > +               elf->name, ELF_LIVEPATCH_XEN_DEPENDS);
> > +        return -EINVAL;
> > +    }
> > +
> > +    rc = parse_buildid(sec, &id);
> > +    if ( rc )
> > +    {
> > +        printk(XENLOG_ERR LIVEPATCH "%s: failed to parse build-id at %s: %d\n",
> 
> "%s: Failed to parse section '%s' as build id: %d\n".
> 
> > +               elf->name, ELF_LIVEPATCH_XEN_DEPENDS, rc);
> > +        return -EINVAL;
> > +    }
> > +
> > +    rc = xen_build_id_dep(&id);
> > +    if ( rc )
> > +    {
> > +        printk(XENLOG_ERR LIVEPATCH
> > +               "%s: check against hypervisor build-id failed: %d\n",
> 
> "%s: build-id mismatch:\n"
> "  livepatch: %*phN\n"
> "        xen: %*phN\n"
> 
> This needs xen_build_id_dep() inlining in order to have the xen build-id
> string, but the end result is much more informative.
> 
> I think I'm happy doing all of this on commit, but it might be a better
> idea not to.

No problem, I can send a v3.

Thanks, Roger.

