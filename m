Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4B61DF85B
	for <lists+xen-devel@lfdr.de>; Sat, 23 May 2020 19:01:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jcXVz-00036j-Ju; Sat, 23 May 2020 17:00:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o9iM=7F=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jcXVy-00036c-Aa
 for xen-devel@lists.xenproject.org; Sat, 23 May 2020 17:00:50 +0000
X-Inumbo-ID: f361723e-9d16-11ea-b07b-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f361723e-9d16-11ea-b07b-bc764e2007e4;
 Sat, 23 May 2020 17:00:49 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 202so8300202lfe.5
 for <xen-devel@lists.xenproject.org>; Sat, 23 May 2020 10:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9fDPcNUZbFygQrZ1OlCwnzyfUVPdIJzfte36WKBK3I4=;
 b=UnAzIn+3r9pO5BkhG4ujop/i71xK5SFgkJhBVTLvFzIZI+LJDZUuMJOOCYZDA9Ckxh
 zUcALSWGjDuWCJqWWKHnPtM2CwmEOSpwt9lBmMyVoVS/04cfAongYgqW7k0E5QTVKx8c
 H3qDom1lRp6RCUoxTQpgJ2mitwYaKq134CR80Cbyhb+bwLJk+sV9Jvpnk1M1yA0xxjVr
 M4JqCiv+gr9wc3uwY4L635R6fsrAymiGt+y7ABYWmuWkAqO6E+h8dfOxGWZCrCN1RV0z
 BLzm7djTY9A07SWLsb83SrW49yHtSApLJf9ih7qMi5tSCWQMTg8QHLq90ZicoBWK88Lw
 vtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9fDPcNUZbFygQrZ1OlCwnzyfUVPdIJzfte36WKBK3I4=;
 b=mMSwYYGXtc+oon4EFKDECgG9gB60lLajLW3Uub1JVLDtm6IiRLHMC0ElEjmkb8ylEI
 SIfBk7c+3z3c4+UG/KBEjxcyvK5E/xaRmiJLJ+otoc0mLjw9RUbGOtsrJJqwDpQjg899
 SfN158K/0p5csFuM2QjqRcIRzmsKNWcPZTpMkTlOk/FtJTsM6chj0qj3GjZFQFjBCvZg
 SYMHnal+uBbk6fA3yQ4CX3s6LOrp1CsLNUPfvqRsRe+XhmMo42kB+rBZdxLWmOhdCOGq
 Rtu+DS0DXpkzt4SPHCKrOHgw++is6cIlj9BjOeDaXciJG/H1JZCB0f0TZsqjnzFS9Ewh
 l5VA==
X-Gm-Message-State: AOAM530DZD01D/E9L7P4IuH2KNAXT+nEGdjLiJFUOS0RJ2dQRTnR8eOF
 2q+nNL8w1Q1cwfnAsjAWV9uzyGKJT8LXWfpSJmc=
X-Google-Smtp-Source: ABdhPJxrRCNRvbWb2rqnbtUYaBeJ8YjxU69t2Z41coZBu81PXvf0lJ6v8Uj8COeelWR67dK0nQPDTE5Io3ohqp1Qukw=
X-Received: by 2002:a05:6512:3139:: with SMTP id
 p25mr10336280lfd.214.1590253248070; 
 Sat, 23 May 2020 10:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200522161240.3748320-1-george.dunlap@citrix.com>
 <20200522161240.3748320-4-george.dunlap@citrix.com>
In-Reply-To: <20200522161240.3748320-4-george.dunlap@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Sat, 23 May 2020 13:00:37 -0400
Message-ID: <CAEBZRScr-6Lt29tHFNgOBmZhXBW0oBB-NcoqTBi9xr5GgQaZVQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] libxl: Generate golang bindings in libxl Makefile
To: George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> The generated golang bindings (types.gen.go and helpers.gen.go) are
> left checked in so that they can be fetched from xenbits using the
> golang tooling.  This means that they must be updated whenever
> libxl_types.idl (or other dependencies) are updated.  However, the
> golang bindings are only built optionally; we can't assume that anyone
> updating libxl_types.idl will also descend into the tools/golang tree
> to re-generate the bindings.
>
> Fix this by re-generating the golang bindings from the libxl Makefile
> when the IDL dependencies are updated, so that anyone who updates
> libxl_types.idl will also end up updating the golang generated files
> as well.
>
>  - Make a variable for the generated files, and a target in
>    xenlight/Makefile which will only re-generate the files.
>
>  - Add a target in libxl/Makefile to call external idl generation
>    targets (currently only golang).
>
> For ease of testing, also add a specific target in libxl/Makefile just
> to check and update files generated from the IDL.
>
> This does mean that there are two potential paths for generating the
> files during a parallel build; but that shouldn't be an issue, since
> tools/golang/xenlight should never be built until after tools/libxl
> has completed building anyway.
>
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>

For the golang side:

Reviewed-by: Nick Rosbrook <rosbrookn@ainfosec.com>

