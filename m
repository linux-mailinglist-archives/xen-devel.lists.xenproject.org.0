Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C8D9856D3
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 12:03:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803774.1214586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOrP-0000m5-N6; Wed, 25 Sep 2024 10:03:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803774.1214586; Wed, 25 Sep 2024 10:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOrP-0000jZ-KG; Wed, 25 Sep 2024 10:03:03 +0000
Received: by outflank-mailman (input) for mailman id 803774;
 Wed, 25 Sep 2024 10:03:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBXn=QX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stOrO-0000J7-1u
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 10:03:02 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 591d3205-7b25-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 12:03:01 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8b155b5e9eso959035466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 03:03:01 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f541c3sm191322566b.69.2024.09.25.03.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 03:03:00 -0700 (PDT)
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
X-Inumbo-ID: 591d3205-7b25-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727258581; x=1727863381; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l34AsP2RCcPJIICmvnQBN1rnCuDiEWBR/lmz+rdL6FI=;
        b=RSnFXzmmBO4R0iol0QhbYBZXiqnaZx2Yww2QHUgwAzXAlQbGf5lAjUwvuLkp9jmTQl
         T8Bwsp6LAanwGSn8bXMx3fuSj3w9dHbNmpoxDEwAUR/RnBqv8JWbWFzcSppil6PiJiJT
         s3YItZ0qaLIJjVY/2bJtt1ifJ+hqc9cbYoMak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727258581; x=1727863381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l34AsP2RCcPJIICmvnQBN1rnCuDiEWBR/lmz+rdL6FI=;
        b=LuW9GRjE0N+/46U3Vxt7siAOVrnvaLsFuYlxPs5TG4/3XNru/z3MGEsY+ZU8uBsSuI
         S1CZdtN78EWV6ni1yeQWsofpCYbKpDvxzHITCKHG6luvS5ZVsw4wjdjWvD/4eftlnMzE
         83xPpFLa8RNcKgoCg0KPM6qpw09Ka9erApqX2Z7cZeglcW5N8xV5WFR2/mCXWeNqFlAq
         8hrw56C61cIPdT+D9cUA6byHwqITDp90Yger0Yb5pH+qWc24/jjB1wawzfyFeyGvUAHt
         7Lzn476osH+5SZ8siXowBrq2nRO/1uJyrxpaMrOmZlBTr72wC+Ff1dzLWD0OymycxFjm
         4Ucg==
X-Gm-Message-State: AOJu0YwigxmydWnNJsiD9U66pm5Zqk8KhuKjIeGS2C31zqz4YsxqbiN0
	Kiqx6KGUohcXSXSJTsKAsk3McRtqZwrn9XRNqdldUiWJv8nXo1I+6nK9Jys/43Vf8s1PfsQP9iH
	j
X-Google-Smtp-Source: AGHT+IExqZ33JOTQTS643xrMj4gH97jaheELWC4dIJh0XGBL9MF/Y4TY/tyOzYa4f5N5xXPk6me6RA==
X-Received: by 2002:a17:907:7e8d:b0:a8d:250a:52b2 with SMTP id a640c23a62f3a-a93a0341a30mr189407166b.6.1727258580614;
        Wed, 25 Sep 2024 03:03:00 -0700 (PDT)
Date: Wed, 25 Sep 2024 12:02:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v2 3/6] xen/livepatch: simplify and unify logic in
 prepare_payload()
Message-ID: <ZvPf0wqL7cpLzf5i@macbook.local>
References: <20240925084239.85649-1-roger.pau@citrix.com>
 <20240925084239.85649-4-roger.pau@citrix.com>
 <c2009427-f284-4cd2-b704-f5afc563f324@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c2009427-f284-4cd2-b704-f5afc563f324@citrix.com>

On Wed, Sep 25, 2024 at 10:37:56AM +0100, Andrew Cooper wrote:
> On 25/09/2024 9:42 am, Roger Pau Monne wrote:
> > diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> > index 87b3db03e26d..8e61083f23a7 100644
> > --- a/xen/common/livepatch.c
> > +++ b/xen/common/livepatch.c
> > @@ -470,6 +470,31 @@ static int xen_build_id_dep(const struct payload *payload)
> >      return 0;
> >  }
> >  
> > +/* Parses build-id sections into the given destination. */
> > +static int parse_buildid(const struct livepatch_elf_sec *sec,
> > +                         struct livepatch_build_id *id)
> > +{
> > +    const Elf_Note *n;
> > +    int rc;
> > +
> > +    /* Presence of the sections is ensured by check_special_sections(). */
> > +    ASSERT(sec);
> > +
> > +    n = sec->load_addr;
> > +
> > +    if ( sec->sec->sh_size <= sizeof(*n) )
> > +        return -EINVAL;
> > +
> > +    rc = xen_build_id_check(n, sec->sec->sh_size, &id->p, &id->len);
> 
> I've just realised what is so confusing.
> 
> This function is not a Xen buildid check, it's an ELF buildid note check.
> 
> I'll do a followup patch after yours goes in renaming it.
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Yeah, the naming of xen_build_id_check is confusing, as it's not just
a check, it also populates livepatch_build_id fields.  Thought about
renaming it, but the series was already long enough...

Thanks, Roger.

