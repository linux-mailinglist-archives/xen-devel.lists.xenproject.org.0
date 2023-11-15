Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C91257EC203
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 13:17:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633605.988592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3EpI-0005GV-If; Wed, 15 Nov 2023 12:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633605.988592; Wed, 15 Nov 2023 12:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3EpI-0005DE-FW; Wed, 15 Nov 2023 12:17:00 +0000
Received: by outflank-mailman (input) for mailman id 633605;
 Wed, 15 Nov 2023 12:16:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q1lS=G4=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r3EpH-00058s-1I
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 12:16:59 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de9049ac-83b0-11ee-9b0e-b553b5be7939;
 Wed, 15 Nov 2023 13:16:56 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4084b0223ccso52415125e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 Nov 2023 04:16:56 -0800 (PST)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 o11-20020adfcf0b000000b0032d9f32b96csm10381648wrj.62.2023.11.15.04.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 04:16:55 -0800 (PST)
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
X-Inumbo-ID: de9049ac-83b0-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700050616; x=1700655416; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EtkCYdz+w+FkZn6yC5vYWDEyAR0+dL+QSw4hEJLIrm8=;
        b=f93BKY1Zark7sMLoS4/JB5eLv9CjNHZQk5AgAvyCOPj2CgY/Y7hIrllS8PtdQ2+e1S
         OmxlMf1sr7eprWhtSivslhy7cvuEmp1mPJc0OaqLDcNPc7UN3E+EbRdigyyfdn0GFw13
         PZlZ3hrFNAWn8Gz0r40Fol8Mgps7kqnj//bbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700050616; x=1700655416;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtkCYdz+w+FkZn6yC5vYWDEyAR0+dL+QSw4hEJLIrm8=;
        b=eJgizRW3xbcGtA9mo2L6x8PznPt/ZpX0imijLJJALFYzrHUY1Uhm0B57Ok+GNbs3cH
         YJxIveasU54xq8EXYaYWGjZm4+EPJQuxreNG2tJ5yqOPFvpI99vU+gyjc4vUM4BkVIHz
         +O1/Qoz+2JnrjDggDDrscAyjPGsqqCJjUSH/gPOLSHAEV7IFn1mJN/eC03a9STxgpxrF
         sMVq8InKNEmoPw9eOAjrK9Hnar8/Brdes73y9+BAniJWhmstJUSsGMx4xZluhsYIOC+z
         cXSiNS+Bk3RoFidNuQZR0PuM77m55sIuHK+CuSXZidFft+U45sk4PCEcc9U0znQN4cpf
         QYNg==
X-Gm-Message-State: AOJu0YxHFb16iR+qfTfYiYnmW8uOEKXrfPWHeNU9eSkm1uLzNCk7lh0c
	Yp0UFX+7asDqUpDovjcQQwBz0Q==
X-Google-Smtp-Source: AGHT+IG5aMgsMuWhxdJqFAex2lUmSqivWxR5j+v/iKyJCBpPK+7MQ0gTiMl/pfsxr6O8okjCNTpSdg==
X-Received: by 2002:a05:600c:1ca3:b0:408:3d91:8251 with SMTP id k35-20020a05600c1ca300b004083d918251mr9516368wms.5.1700050616232;
        Wed, 15 Nov 2023 04:16:56 -0800 (PST)
Message-ID: <6554b6b7.df0a0220.412e6.4a71@mx.google.com>
X-Google-Original-Message-ID: <ZVS2thPtvBDoStZI@EMEAENGAAD19049.>
Date: Wed, 15 Nov 2023 12:16:54 +0000
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Kelly Choi <kelly.choi@cloud.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: Important - Documentation Discussion
References: <CAO-mL=wq2_gtE224RfavM3o6mhEASwygN6-fnKEP1YNUiuWEig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO-mL=wq2_gtE224RfavM3o6mhEASwygN6-fnKEP1YNUiuWEig@mail.gmail.com>

Hi,

On Wed, Nov 15, 2023 at 11:43:46AM +0000, Kelly Choi wrote:
> Hi all,
> 
> As you may be aware, we are in the process of reviewing our existing
> documentation platform and content. In order to meet the requirements of
> the community and project, I need your input and feedback.
> 
> The aim of the new documentation is to encourage community members to
> collaborate in updating content (where possible) and educate users on how
> the project works. The updated documentation will be hosted on our new
> upcoming website.
> 
> *Suggestion for user-orientated documentation:*
> 
>    - git - for hosting (gitlab recommended)
>    - RST - for the format of the documentation
>    - Sphynx - to generate web pages and PDF and other formats from RST
In my experience Sphinx's strength is in its ability to cross-reference the
code. That isn't something terribly helpful for user documentation, and it
makes the whole thing harder to set up for no clear benefit.

For user-facing docs I'd propose `mkdocs` instead, which is a lot more
focused and simpler to set up (can be done literally in a couple of
minutes). The main difference would be that it takes Markdown rather than
RST[1]. It trivially supports plugins for interesting things, like mermaid
(for sequence/block diagrams or FSMs) 

Main website: https://www.mkdocs.org/
Plugin catalog: https://github.com/mkdocs/catalog
    * mermaid plugin: https://github.com/fralau/mkdocs-mermaid2-plugin
    * kroki plugin: https://kroki.io/

[1] I happen to prefer Markdown, as I find it easier to read and write, but
    that's just personal preference

> 
> *Suggestion for developer reference documentation:*
> 
>    - Doxygen
>    - Kerneldoc
>    - Open to other suggestions here
There's 2 areas here. The format for the annotations, and the visualization
frontend. They need not be the same. Using Doxygen seems the less
"not-invented-here" approach, while kerneldoc would 

As for the frontend I would suggest to _not_ use Doxygen itself as the
generated websites are hideous to look at. Sphinx (through Breathe) or any
other Doxygen-database parse wouldr do the job as well providing a much
(much) better output.

> 
> Example of how documentation will be split:
> 
>    1. Getting started/beginner user guides
>    2. Learning orientated tutorials
>    3. Goal-orientated how-to guides
>    4. Developer related documentation
(1-3) seem like pretty much the same thing. Guides of increasing complexity
meant to train a new user/admin. Dividing such a section in those 3 blocks
seems sensible.

(4) could be split in a "Developer Manual", which would contain plain
explanation for dev-heavy concepts, and a "Reference Manual" with links to
the Doxygen-esque websites and a higher focus on implementation details.

> 
> Side note: Whilst I appreciate everyone has a different vision of what
> ideal documentation looks like, please be mindful that not everyone's
> thought processes or depth of knowledge are the same. All ideas are
> welcome, and decisions made will always reflect community needs.
> 
> Many thanks,
> Kelly Choi
> 
> Open Source Community Manager
> XenServer, Cloud Software Group

Cheers,
Alejandro

