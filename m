Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD0A372EF0
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 19:29:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122636.231324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldyri-0003dK-F4; Tue, 04 May 2021 17:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122636.231324; Tue, 04 May 2021 17:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldyri-0003cv-C7; Tue, 04 May 2021 17:29:46 +0000
Received: by outflank-mailman (input) for mailman id 122636;
 Tue, 04 May 2021 17:29:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E2aX=J7=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1ldyrg-0003cq-FZ
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 17:29:44 +0000
Received: from mail-qv1-xf34.google.com (unknown [2607:f8b0:4864:20::f34])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56b1b6b4-cd4e-4bdd-b672-162de0ee2689;
 Tue, 04 May 2021 17:29:43 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id i8so4865560qvv.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 May 2021 10:29:43 -0700 (PDT)
Received: from six (c-73-89-138-5.hsd1.vt.comcast.net. [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id k1sm11377700qkh.5.2021.05.04.10.29.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 May 2021 10:29:42 -0700 (PDT)
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
X-Inumbo-ID: 56b1b6b4-cd4e-4bdd-b672-162de0ee2689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=prttDhQN8uYHL1d//3odkJa/kJ4jXGOhgl6bvJXgbHY=;
        b=DhCgFeoAclfq0YjXw1hYxIsPOp2pDIupFTeD2pHMwoxAnH/zrq+TEFQ692aue3f2fV
         gjwlE0reGloapoj69Varw9Pb+cMGKvMENoaJ6/KtpI1zzCONbpsXqOgWDpHJue4JODUN
         diTVGM86yHH5YHVN4acVhQK7GEuyJaoOmHtUQL99AFQeZJZ08RC4CblXNvmgUkqslAlk
         Hr0sLt2yWEGp2JnPyTRKe3I8mDwHDgGhBbcEoo6XqMLewNzIiX1uwTE5cgG2p06NJQCn
         EqNmqzccnXeqMoy0c2AzHYGa0rrYK8HoQhMVySl66gj5T1VMnoBaYg79f5RE984lXv+5
         y4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=prttDhQN8uYHL1d//3odkJa/kJ4jXGOhgl6bvJXgbHY=;
        b=eKyo3EOAoXYQREl8BllL6peyu9CWuOGoJRCre5huqRZ6Ec2Q9WYNkE2YlYB+sZHwev
         ntW/KqmFmxbLQnkl+OWHXuEVqGQki1JkOWebQkbwFKInlyLmR3m4cT/inZvfzAp+tMtN
         d9pwS4uoqdKZsm3xIT/B3N+2OmTGmTzpCSWI5/EUczXc1SiamRt45ymRRxr++jbqSfAA
         wRiisg/9CNGEAl6a/g1LzPzVprvxb8zf4RKII/YrnkUt6gZlaCnqlh4ynmonXEcfT3eD
         f/dnYqeRdZs9cGHDc9n4N6R6+vFxfCbidbtdoGFTjlCvJxVIcJO4oOWLUW3e/lvv/s2w
         foXg==
X-Gm-Message-State: AOAM5320QBOelO0xahEPswWItpOmjCuakkaZeJnboA1GIYhPpI80pXuI
	dWoJ4sB5E8fzmsX12OP99AA=
X-Google-Smtp-Source: ABdhPJye0JTFhTt9LWMNpuVfSlGSvKsk+xrKtYLXt26swZoAikXcO41OUe3nq9BsySCzhOYuvfrx7Q==
X-Received: by 2002:ad4:54c5:: with SMTP id j5mr27393657qvx.4.1620149383222;
        Tue, 04 May 2021 10:29:43 -0700 (PDT)
Date: Tue, 4 May 2021 13:29:40 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, george.dunlap@citrix.com,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [RFC v2 6/7] libxl: implement device add/remove/destroy
 functions generation
Message-ID: <20210504172940.GB7941@six>
References: <cover.1614734296.git.rosbrookn@ainfosec.com>
 <5986715fe1d677533b67c06e9561cd716716d46a.1614734296.git.rosbrookn@ainfosec.com>
 <YJFiH9dFdlq2l87k@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJFiH9dFdlq2l87k@perard>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Tue, May 04, 2021 at 04:02:55PM +0100, Anthony PERARD wrote:
> On Tue, Mar 02, 2021 at 08:46:18PM -0500, Nick Rosbrook wrote:
> > +def libxl_func_define_device_add(func):
> > +    s = ''
> > +
> > +    return_type = func.return_type.typename
> > +    if isinstance(func.return_type, idl.Enumeration):
> > +        return_type = idl.integer.typename
> > +
> > +    params = ', '.join([ ty.make_arg(name) for (name,ty) in func.params ])
> > +
> > +    s += '{0} {1}({2})\n'.format(return_type, func.name, params)
> > +    s += '{\n'
> > +    s += '\tAO_CREATE(ctx, domid, ao_how);\n'
> > +    s += '\tlibxl__ao_device *aodev;\n\n'
> > +    s += '\tGCNEW(aodev);\n'
> > +    s += '\tlibxl__prepare_ao_device(ao, aodev);\n'
> > +    s += '\taodev->action = LIBXL__DEVICE_ACTION_ADD;\n'
> > +    s += '\taodev->callback = device_addrm_aocomplete;\n'
> > +    s += '\taodev->update_json = true;\n'
> > +    s += '\tlibxl__{0}(egc, domid, type, aodev);\n\n'.format(func.rawname)
> > +    s += '\treturn AO_INPROGRESS;\n'
> > +    s += '}\n'
> 
> That's kind of hard to read, I think we could use python's triple-quote
> (or triple double-quote) ''' or """ to have a multi-line string and
> remove all those \t \n
> Something like:
> 
>     s = '''
>     {ret} {func}({params})
>     {{
>         return ERROR_FAIL;
>         libxl__{rawname}(gc);
>     }}
>     '''.format(ret=return_type, func=func.name, params=params,
>                rawname=func.rawname)
> 
> That would produce some extra indentation in the generated C file, but
> that doesn't matter to me. They could be removed with textwrap.dedent()
> if needed.
> 
That sounds good to me.

Thanks,
NR

