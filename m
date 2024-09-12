Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4FC976738
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 13:12:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797301.1207211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sohjj-0005Gt-HW; Thu, 12 Sep 2024 11:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797301.1207211; Thu, 12 Sep 2024 11:11:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sohjj-0005Fo-E8; Thu, 12 Sep 2024 11:11:43 +0000
Received: by outflank-mailman (input) for mailman id 797301;
 Thu, 12 Sep 2024 11:11:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HbDX=QK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sohji-0005Fi-A6
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 11:11:42 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c93fbf27-70f7-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 13:11:40 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8d4093722bso112352366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 04:11:40 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c73c00sm730150866b.101.2024.09.12.04.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 04:11:39 -0700 (PDT)
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
X-Inumbo-ID: c93fbf27-70f7-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726139500; x=1726744300; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rGiXrAa/3lXUHRrF9+WAZKQCnUGwlVoQfhHssSdmEr0=;
        b=GJV6GF2IJfBfVg6csdsxnpwzxKPkl0odVEm/M8/dIIKpm53UCjPwOu2gik4f9u98ky
         nwbc4ruiNO+dV4I3oiU8bcGyO1HD2psRno+Paty5DtPQrp+/ghebG5547TqB+867FN01
         nZ8l7R5q/uFwfeGUiaCrk0n7a+TmWYIygfqQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726139500; x=1726744300;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rGiXrAa/3lXUHRrF9+WAZKQCnUGwlVoQfhHssSdmEr0=;
        b=sDQtveIuY4BxryVTSvOQinGCJf75bgq7IlwEHyZlIJWaOX7WnnyDkN5aL81sppIqVB
         dDSW+T8fPjGuuJvQGUK1o6pKKh+2n41zPQWlwBT0kDwj0cXirHC+3m2faZUiSkyQ4o03
         WM8tdyoxwwL6my42CQrpWQrJy7VTtxGVconBGm7iti8hxVBQYSnOH1Z4OKOzy6XEUGYL
         rhunYUh/X6B75zSfpSC9q88ZSeaSYqym1fqQrbYUSntCR97bOqc/28inyVRm2o/3o4RW
         c96RhZHqX9195fCyUwcQv8HzIyavAMqqjwbKfuPsTJXEvKYacjd3vFVL/jcm5FFatulL
         Rm4Q==
X-Gm-Message-State: AOJu0Yw/sThuzT7jj+wh3I254v8oaToJg6aLrZGvt+woywWESLlf+8rg
	zmLRdtt4ZzA9MKp5TO32DEUTOJ+oAC4Ezpaxd83rVLzWpw6y7PF5QiLOc4hHW9s=
X-Google-Smtp-Source: AGHT+IFw81o7ftEX3Q3EgO1t5H2ALHVbNnkj8QV7l7xQeDUsOJIdrujOXVaWQa2eqKkB/YRYGtnKKg==
X-Received: by 2002:a17:907:3f91:b0:a8d:1284:6de5 with SMTP id a640c23a62f3a-a9029431a00mr244891466b.14.1726139499741;
        Thu, 12 Sep 2024 04:11:39 -0700 (PDT)
Date: Thu, 12 Sep 2024 13:11:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 4/5] types: replace remaining uses of s32
Message-ID: <ZuLMav741CIM6uC1@macbook.local>
References: <b1ded557-63b8-4999-98ca-de80488ebad1@suse.com>
 <0e6b7685-e061-4ace-88fd-86728d765e5a@suse.com>
 <ZuK50VAqUCfX29pt@macbook.local>
 <22e4c432-71c9-4d93-adc6-01136d71a093@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <22e4c432-71c9-4d93-adc6-01136d71a093@suse.com>

On Thu, Sep 12, 2024 at 12:05:23PM +0200, Jan Beulich wrote:
> On 12.09.2024 11:52, Roger Pau Monné wrote:
> > On Thu, Aug 29, 2024 at 02:01:16PM +0200, Jan Beulich wrote:
> >> ... and move the type itself to linux-compat.h.
> >>
> >> While doing so switch a few adjacent types as well, for (a little bit
> >> of) consistency.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks. Andrew asked for a style adjustment, which I wasn't sure about.
> I'd like to follow whatever maintainers prefer, so could you clarify
> that please?

Oh, sorry, I would prefer with the alignment added, as suggested by
Andrew.

Thanks, Roger.

