Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB12F9881A8
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 11:46:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806185.1217534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su7Y9-00063m-FL; Fri, 27 Sep 2024 09:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806185.1217534; Fri, 27 Sep 2024 09:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su7Y9-00061I-Ck; Fri, 27 Sep 2024 09:46:09 +0000
Received: by outflank-mailman (input) for mailman id 806185;
 Fri, 27 Sep 2024 09:46:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wYFD=QZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1su7Y8-00061C-Ot
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 09:46:08 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f4b862e-7cb5-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 11:46:03 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a8a6d1766a7so249593466b.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 02:46:03 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2777214sm110811866b.36.2024.09.27.02.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 02:46:02 -0700 (PDT)
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
X-Inumbo-ID: 4f4b862e-7cb5-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727430363; x=1728035163; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wKkmpdxyCD/kGB5RbbxBO1xx2S5PshYKqNzT9T91YPk=;
        b=Ol+tOEU7C3kDkdFzAn+ufLj6Qfnh190rD9Lq4f6isX7PDcNw+MAMVBqtu5rjCoxrQk
         ziVr3uIUbOpXOc2Twx2n9Bjh7yCoDqYmHFIh8K+VWGXY6ALPSyZLhuipS4MYlwPpVQie
         L6S93sGaJoveXOdp5GKQx8UWwe9cWHjITmTT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727430363; x=1728035163;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wKkmpdxyCD/kGB5RbbxBO1xx2S5PshYKqNzT9T91YPk=;
        b=ug8dfh0lGMy8ZVh7aYak1SXjM1S+HPzGvryIchQIJWVkpBDlMVjwQTc67VD74BVoim
         W0C9kkZ4VgFOVzZORzHxvNwUfvnrgt71kRqvXBFfWzYzhMXk1dOw5ZAzqS9t6fW3TBNV
         1cRNzKknF7vKMRLFN0jZ6bNM5fNYUeXPYilpbST3yjhDBkPmIawdbv4cxfHm4JcUfUnk
         NVFGEhnUVuyCCYCWK6ERI81LQi5jpjsMxJOhNSQImT3DHd9TIExJ/76O2I9caGsCFvIS
         HhGv5V7ZjYKV467wrxjg7/+1yhAKQS1F3frxB8HqLuA5sLA/Yu2vc2La5khaNfhhK7vR
         ro0w==
X-Gm-Message-State: AOJu0Ywy8fsDK3U2K+YpvLryY0I98qFYjID8GUQWdjOwm6KWSfjtATJu
	Wtm/iv4czE26nhFsCuO6hjzbVzWEDSFbIr14k0idSPdFGmJIdiUD/mWTJxjkUwVAUOfyTBfeGcu
	j
X-Google-Smtp-Source: AGHT+IHuR3Eo29tOM+vFsMSIEsCj9qFo2sDkI71rHQzduLwDSawjapOKG32ctbedKhuSoRA1ZU1o2Q==
X-Received: by 2002:a17:906:7946:b0:a8a:7897:c043 with SMTP id a640c23a62f3a-a93c4ae12c7mr241455266b.43.1727430362865;
        Fri, 27 Sep 2024 02:46:02 -0700 (PDT)
Date: Fri, 27 Sep 2024 11:46:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 16/22] x86/mm: introduce a per-CPU L3 table for the
 per-domain slot
Message-ID: <ZvZ-2WWXtQqu-zRY@macbook.local>
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-17-roger.pau@citrix.com>
 <D3HK0XQWARJS.F66A01YC9WXY@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D3HK0XQWARJS.F66A01YC9WXY@cloud.com>

On Fri, Aug 16, 2024 at 07:40:40PM +0100, Alejandro Vallejo wrote:
> On Fri Jul 26, 2024 at 4:22 PM BST, Roger Pau Monne wrote:
> > So far L4 slot 260 has always been per-domain, in other words: all vCPUs of a
> > domain share the same L3 entry.  Currently only 3 slots are used in that L3
> > table, which leaves plenty of room.
> >
> > Introduce a per-CPU L3 that's used the the domain has Address Space Isolation
> > enabled.  Such per-CPU L3 gets currently populated using the same L3 entries
> > present on the per-domain L3 (d->arch.perdomain_l3_pg).
> >
> > No functional change expected, as the per-CPU L3 is always a copy of the
> > contents of d->arch.perdomain_l3_pg.
> >
> > Note that all the per-domain L3 entries are populated at domain create, and
> > hence there's no need to sync the state of the per-CPU L3 as the domain won't
> > yet be running when the L3 is modified.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Still scratching my head with the details on this, but in general I'm utterly
> confused whenever I read per-CPU in the series because it's not obvious which
> CPU (p or v) I should be thinking about. A general change that would help a lot
> is to replace every instance of per-CPU with per-vCPU or per-pCPU as needed.

per-CPU is always per-pCPU, as CPU without any prefix should always
refer to a physical CPU.  I think it's only recently that we have
started using pCPU vs vCPU, in the past it always was CPU vs vCPU.

I will attempt to be better at explicitly using pCPU instead of CPU in
the commit messages, sorry.

Thanks, Roger.

