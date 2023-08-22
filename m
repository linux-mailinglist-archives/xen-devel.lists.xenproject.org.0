Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CE6784482
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 16:39:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588519.920034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYSXA-0003zu-Ji; Tue, 22 Aug 2023 14:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588519.920034; Tue, 22 Aug 2023 14:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYSXA-0003xQ-GH; Tue, 22 Aug 2023 14:39:04 +0000
Received: by outflank-mailman (input) for mailman id 588519;
 Tue, 22 Aug 2023 14:39:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0QVw=EH=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qYSX8-0003xK-Qy
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 14:39:03 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1fe5897-40f9-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 16:39:00 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fef2f05356so18543145e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Aug 2023 07:39:00 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 m7-20020a5d6247000000b00317f29ad113sm16076223wrv.32.2023.08.22.07.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 07:38:59 -0700 (PDT)
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
X-Inumbo-ID: a1fe5897-40f9-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1692715140; x=1693319940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2nsSNRBvkBaamjaYyJnaTiWuBSsisszAikLeLc6+clU=;
        b=M7IimoSKmFBUmWXhAlms5NmBgOb+OhvWhn4Mg0A9+8a+i7GSXl59iyl5g+nnTye8W1
         qq2Qunk5tjPyDN5brXLMNgwCLRhiDPNgZPK9GDQiB1zIjPCcbf4hehXxQbiQED0gC5Tw
         CNo33tXvDpBYKxa28F5SdraU8kApYR/J7ga94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692715140; x=1693319940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nsSNRBvkBaamjaYyJnaTiWuBSsisszAikLeLc6+clU=;
        b=PtJF36yjFwJEGGq/+gYSZPwS6BjU/4tug6k/ZBQVbIN2sEmOPHuyEE6A9WqmjGug2s
         U29JRD8w3G8i+p3z9W8nVpT5UCOTH2yl0Wt6YWUWPI0glH+3350CMtaGCWfUwB7vId9x
         Lw6F0P+k1TPO6pPfVbPriiqZ/qKRh5EKG1xKOwWuX0Txx5bCXWh+c/YpvBa0fuMyASsZ
         HGnDZsBqXwRDJTm6cPXaS7VLNW2+4sVfsfBiYOsgGd60LTsCOtn2licoMRAR8fRR9UtE
         8t40fPBYIkbAg4UPlvZPLebmiPVGSZvicoySBC+Cin1AGscn4s3DpCK5Mb81oepQlCgr
         56pg==
X-Gm-Message-State: AOJu0Yz5s8xQNY40WaNI+YDOqelAYW1QPx1NhwA37huWNrWYO/DgVlKY
	z/l0hcbs9JixCJVafvJuyCHYiQ==
X-Google-Smtp-Source: AGHT+IGddo3xctG6R8/6dfFIkR2CSFLaVLQL03W/a7ewlYuof6jACon3Gp5r1aMRru09ry3aJvZR5A==
X-Received: by 2002:a5d:6308:0:b0:313:e953:65d0 with SMTP id i8-20020a5d6308000000b00313e95365d0mr7653541wru.28.1692715139871;
        Tue, 22 Aug 2023 07:38:59 -0700 (PDT)
Date: Tue, 22 Aug 2023 15:38:59 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 2/3] docs: make the docs for MISRA C:2012 Dir 4.1
 visible to ECLAIR
Message-ID: <c5aeffbb-8383-4fc0-9cc5-180586d36fb5@perard>
References: <cover.1692636338.git.nicola.vetrini@bugseng.com>
 <857dd398240accabea73e5660ae77f3925727ee9.1692636338.git.nicola.vetrini@bugseng.com>
 <eaef1c3f-490d-a21d-92d1-cfbee50dbdd9@suse.com>
 <bc278b7fbc9d3cb85ac2dd44088ab818@bugseng.com>
 <a7c22fd2-4a5a-3987-1dfe-691107790c87@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7c22fd2-4a5a-3987-1dfe-691107790c87@suse.com>

On Tue, Aug 22, 2023 at 12:10:28PM +0200, Jan Beulich wrote:
> On 22.08.2023 10:27, Nicola Vetrini wrote:
> >>> +C-runtime-failures.c: C-runtime-failures.rst
> >>> +# sed is used in place of cat to prevent occurrences of '*/'
> >>> +# in the .rst from breaking the compilation
> >>> +	( \
> >>> +	  echo "$${MISRA_HEADER}"; \
> >>> +	  sed -e 's|*/|*//*|' $<; \
> >>> +	  echo "$${MISRA_FOOTER}" \
> >>> +	) > $@
> >>
> >> The rule of thumb is to generate into a temporary file (then you also
> >> don't need to wrap everything in parentheses [or braces]), and then
> >> use mv to produce the final output. This escapes anomalies with failed
> >> or interrupted commands.
> >>
> > 
> > I do see your point for temporary files, though wrapping commands with 
> > parentheses is a
> > fairly common pattern in Xen Makefiles afaict.
> 
> Now I'm curious: Grepping for ') >' underneath xen/ I couldn't find a
> single instance in any makefile. (I'm not going to exclude there are a
> few uses, but then likely not merely to combine multiple commands'
> output.)

Maybe using `{ } > out` might be better that using `( ) > out`. I think
it would result in one less fork of the shell, without changing the
resulting file, so always good to take.

You should add also `set -e` at the beginning, to take care of the `sed`
command failing.

Or just use a temporary file.


-- 
Anthony PERARD

