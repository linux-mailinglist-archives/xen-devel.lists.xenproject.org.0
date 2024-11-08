Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BE79C1BC9
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 12:01:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832451.1247756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9Mjq-0001n3-Vf; Fri, 08 Nov 2024 11:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832451.1247756; Fri, 08 Nov 2024 11:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9Mjq-0001kQ-Sg; Fri, 08 Nov 2024 11:01:14 +0000
Received: by outflank-mailman (input) for mailman id 832451;
 Fri, 08 Nov 2024 11:01:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gwdq=SD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t9Mjp-0001kJ-EG
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 11:01:13 +0000
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [2607:f8b0:4864:20::1033])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1523b9c-9dc0-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 12:01:08 +0100 (CET)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2e2bd0e2c4fso1617102a91.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 03:01:08 -0800 (PST)
Received: from localhost ([213.195.120.105]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e99a541d16sm5152060a91.16.2024.11.08.03.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 03:01:06 -0800 (PST)
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
X-Inumbo-ID: c1523b9c-9dc0-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjoxMDMzIiwiaGVsbyI6Im1haWwtcGoxLXgxMDMzLmdvb2dsZS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6ImMxNTIzYjljLTlkYzAtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDYzNjY4LjQ4NDAwNiwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731063667; x=1731668467; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I3EtV/rR3PMGcpV3wKfTo8n8n1LgMNEzH0HvwGajS6M=;
        b=H9IZOiVkLk7v4Il+okfAWy9p/kOhCucs47JcioBivzVhd22Durx6SXn4j+9BodZGH5
         SY6G/ZDqkqSkpd/8d5uX99oKy2CX6F2zJehnRSykEy7ps4o/kdOEeb4Ne8MJzVzViHVs
         YNf2tSgBerCUgxCwOM7LDlkQZQmylA0izPQ7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063667; x=1731668467;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I3EtV/rR3PMGcpV3wKfTo8n8n1LgMNEzH0HvwGajS6M=;
        b=mY3mNWEVvdMmh0BDrYW7xiBdK7SGRmZhQbxShW5AQUkoUF0DS5YijPQS/WG89hasIU
         sVvwJogp+w/2FKgu6EC8ofjeLqbvsYkBWVVFCsjZSnRj7Alqhnq4xWE/5IfvdWZwXmCH
         Jbl9IHTed07UCDiIcj08EA82sa3wJCFzrx3veCKsfgJLc78K81N6A4cK0J/DusiRV4Vf
         qFNFNGpN1YzSJ1Yn+n789YdauqtVIEo+JZnlyAJl7tOrv3yTbONOQWzdMZe3qC9bbRTO
         CRvzNc0RXIUfxdkKLTylOcrjKovWPQ8O3QDvn7Dt2g3Ln/wZeLWGtZG9In6blVC9CDVR
         4XoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK8qc/rZKfUOh4iPyY1zYIN9nHx0e+FJfcjOqh1eYmWALDbJ5PXNlg025FoGsGE4e/0u92+6H0HYw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFzzmT34oE02gVdmhZQSUfOAEYtYh7OeBlweuEFiXcSt4Gd8WO
	ZhYAXRs1lLaQHzaP0o++HGVZ1655VU4akwpZ/3ViWYKY4+Cmgq7W0Dckmx4eoQA=
X-Google-Smtp-Source: AGHT+IEfzhzjSjv1upQ9Yn2B6zFbK5FyGyUnWs8BlotL2DnDcJ8ufprvbv4DoLh0wWH6D8/8k2l4ig==
X-Received: by 2002:a17:90b:264d:b0:2da:d766:1925 with SMTP id 98e67ed59e1d1-2e9b175575dmr3003505a91.37.1731063666711;
        Fri, 08 Nov 2024 03:01:06 -0800 (PST)
Date: Fri, 8 Nov 2024 12:00:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] xen/Kconfig: livepatch-build-tools requires debug
 information
Message-ID: <Zy3vaVve-Dmhwz4i@macbook>
References: <20241108101025.82228-1-roger.pau@citrix.com>
 <9eb957bb-93a4-4b53-a8bd-20c62b2fe9ff@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9eb957bb-93a4-4b53-a8bd-20c62b2fe9ff@suse.com>

On Fri, Nov 08, 2024 at 11:24:12AM +0100, Jan Beulich wrote:
> On 08.11.2024 11:10, Roger Pau Monne wrote:
> > The tools infrastructure used to build livepatches for Xen
> > (livepatch-build-tools) consumes some DWARF debug information present in
> > xen-syms to generate a livepatch (see livepatch-build script usage of readelf
> > -wi).
> > 
> > The current Kconfig defaults however will enable LIVEPATCH without DEBUG_INFO
> > on release builds, thus providing a default Kconfig selection that's not
> > suitable for livepatch-build-tools even when LIVEPATCH support is enabled,
> > because it's missing the DWARF debug section.
> > 
> > Fix by selecting DEBUG_INFO by default if LIVEPATCH is enabled.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Yet I wonder whether this now faces Andrew's opposition.

You have both options now on the list.  I don't mind that much, just
want to get this sorted.  Either patch is better than the current
situation.

Thanks, Roger.

