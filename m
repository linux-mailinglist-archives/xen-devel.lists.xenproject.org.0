Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6783D82B35D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 17:54:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666448.1037096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNyJL-000380-EU; Thu, 11 Jan 2024 16:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666448.1037096; Thu, 11 Jan 2024 16:53:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNyJL-000363-Ae; Thu, 11 Jan 2024 16:53:43 +0000
Received: by outflank-mailman (input) for mailman id 666448;
 Thu, 11 Jan 2024 16:53:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4+ne=IV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rNyJJ-00035x-U6
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 16:53:41 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8e3347f-b0a1-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 17:53:40 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40e6296636fso4330375e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 08:53:40 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 jb13-20020a05600c54ed00b0040e418494absm2491749wmb.46.2024.01.11.08.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 08:53:40 -0800 (PST)
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
X-Inumbo-ID: f8e3347f-b0a1-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704992020; x=1705596820; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Y63HNWbXp0WPXkJdm6CyIz3HW69obhkMP5jTMus/hs=;
        b=SpAIksWbwLFl4NDkRsvpbZW5AL07O3V+ABypIvvF/Mdfd9BUYrjBEqhTypYUcZ7uTI
         9cksCWuIhm/CPVSXqHurls6pCyQ9T3rFHrUzKZbteQec4yHLJchJKkyJFBGdfpQA1tV1
         hGxJqzMDu5gC9kegs3IKsNNLp/HwqkYocslgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704992020; x=1705596820;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Y63HNWbXp0WPXkJdm6CyIz3HW69obhkMP5jTMus/hs=;
        b=jI8REOj7M76D4vfFXhfKetzluCV5rgM81e1eXTl7CnNeGlEhxGM2jQITtDOW+vsk0U
         VBHRddFib4awaJfAi2MAFq5nAZs/9NAVUV9SiankezMTNKBQ4hDS6av5f+gCYvo300wo
         xiL6evW5RRnzQ035Zd/EnS9dFWK0NIWhyNET7XhxZfO/xRAQTwafzSQoUujS7qPZq9lO
         i+wF4uutmUzzwYXd0lBT47RdzjmPb9NdCpgr+Hs9YAg7FDTftEauvFXWvzaG3MCa6Oj/
         fw6dqTZRd0Ayha6Oj8+HeBZNm/y/Ubf2CkUxSFMAKN35oKlYR23N30wdu5PFME3KAJ+p
         Odzg==
X-Gm-Message-State: AOJu0YwGGeSHsiLyDGZHStbSRfQ6OKEbFy9OTo0yt86TeM5u600RAh0N
	BXCIN5sckrXoWmRUtNzoNU0/Ed2tvytqwg==
X-Google-Smtp-Source: AGHT+IESeu49k3kHCvgnEkzb/p7Fo/q62OOjnSaelkC4AR4xxZK29BexBckurgMzcsvLZPCfDElinw==
X-Received: by 2002:a7b:c846:0:b0:40d:8cd1:16dd with SMTP id c6-20020a7bc846000000b0040d8cd116ddmr53543wml.248.1704992020360;
        Thu, 11 Jan 2024 08:53:40 -0800 (PST)
Date: Thu, 11 Jan 2024 17:53:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/intel: ensure Global Performance Counter Control
 is setup correctly
Message-ID: <ZaAdEqHzbD8L_mRo@macbook>
References: <20240111090821.67594-1-roger.pau@citrix.com>
 <3428928a-42d0-4e4b-9607-c184968c309d@suse.com>
 <ZZ_FjFa9mILtDZgv@macbook>
 <645e0c95-5a12-4202-8da6-3cc789a9e5c7@suse.com>
 <ZZ_di8pZB8bWtBuX@macbook>
 <b1e76a5f-297b-4030-a69e-33cdf179c0ce@suse.com>
 <ZZ_4HSvdg0R9Dv1Y@macbook>
 <4574c9d6-eb6d-4b73-a9e1-20b5635b32db@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4574c9d6-eb6d-4b73-a9e1-20b5635b32db@suse.com>

On Thu, Jan 11, 2024 at 04:52:04PM +0100, Jan Beulich wrote:
> On 11.01.2024 15:15, Roger Pau Monné wrote:
> > On Thu, Jan 11, 2024 at 03:01:01PM +0100, Jan Beulich wrote:
> >> On 11.01.2024 13:22, Roger Pau Monné wrote:
> >>> Oh, indeed, can adjust on this same patch if that's OK (seeing as the
> >>> issue was already there previous to my change).
> >>
> >> Well, I'm getting the impression that it was deliberate there, i.e. set
> >> setting of the feature flag may want to remain thus constrained.
> > 
> > Hm, I find it weird, but the original commit message doesn't help at
> > all.  Xen itself only uses PMC0, and I don't find any other
> > justification in the current code to require at least 2 counters in
> > order to expose arch performance monitoring to be present.
> > 
> > Looking at the SDM vol3, the figures there only contain PMC0 and PMC1,
> > so someone only reading that manual might assume there must always be
> > 2 global PMCs?
> 
> That may have been the impression at the time. It may have been wrong
> already back then, or ...
> 
> > (vol4 clarifies the that the number of global PMCs is variable).
> 
> ... it may have been clarified in the SDM later on. My vague guess is
> that the > 1 check was to skip what may have been "obviously buggy"
> back at the time.

Let me know if you are OK with the adjustment in v3, or whether you
would rather leave the > 1 check as-is (or maybe adjust in a different
patch).

Thanks, Roger.

