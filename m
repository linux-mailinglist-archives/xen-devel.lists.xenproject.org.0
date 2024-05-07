Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4628BE65B
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 16:47:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718251.1120826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4M4y-00052c-Cy; Tue, 07 May 2024 14:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718251.1120826; Tue, 07 May 2024 14:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4M4y-0004zf-9R; Tue, 07 May 2024 14:46:04 +0000
Received: by outflank-mailman (input) for mailman id 718251;
 Tue, 07 May 2024 14:46:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J4VX=MK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s4M4w-0004yM-HD
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 14:46:02 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 855de1ab-0c80-11ef-909c-e314d9c70b13;
 Tue, 07 May 2024 16:46:01 +0200 (CEST)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-78f04924a96so280884285a.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 May 2024 07:46:01 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 j10-20020a0cf9ca000000b006a105b217b5sm4713072qvo.112.2024.05.07.07.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 07:45:59 -0700 (PDT)
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
X-Inumbo-ID: 855de1ab-0c80-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715093160; x=1715697960; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gc4LwRfvx8MFYxJkMuKFV+WreREFsbPeRoETwV9Pld8=;
        b=tLvr3C10pqONFhlPtDnGXMDShWPiqyEyzgzhuALOwzjkklF5wZMgApcL/ovrnHGvwe
         azZTW9HaM9tllE6aN8vAld95CxwKAIJ/6pN706TPzA3t25ivhe5rnMq+PUsyjo+BZeIK
         up97xwNg0Fw8r3pOWShqAt8OAutccho7PeMYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715093160; x=1715697960;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gc4LwRfvx8MFYxJkMuKFV+WreREFsbPeRoETwV9Pld8=;
        b=N7pthbMa2+zFRYwTnGjAWqxSoaX2lRkGboFJjqB3QlA4paaJIhTnOltR7j6VCjuCwd
         Iy5wwvhkx+MvOyUjGHiX4hhBWGDCDocHS21SCJwGdco70nQaucjTKwsKSzaxdauMvRt2
         9bgDppmjFI8s6ndddZYmpFn9e0WrT+TdikIu6WHOcWgz1iS5sHG09UU7umzuMhcEYKU+
         +CJbTFPAGGegd/XccEDdNbmIE+u1WbPqttqZPQ1jB0f1MuAc7jEe2jf8pLc6m4YWTEf1
         t0cVXm26HJca0+JFfP4/5zUngP6BnNa41HJ+AKnKwBKQjxvHreL/EFN4ZUeMCvhkKexF
         MMeg==
X-Gm-Message-State: AOJu0YyezYHCrwYoq2q0QPd/VtBS221LjhLoItTpDmaJB3nQENCxseVK
	bb3kIYcwkXwtBhXyGEicZw3FAaIwEU4vp3ERAFDlpQ5K8CO2npJw0QaMreZwtYk=
X-Google-Smtp-Source: AGHT+IEHSJmsIeqE4A9Ovx26s4fzTti3J56PWp6L7ISnazuu6Be0YFvO68bdbFHjr36dC3fs6D0lGg==
X-Received: by 2002:a05:6214:1c84:b0:6a0:b594:1744 with SMTP id 6a1803df08f44-6a1514e8bb7mr123666d6.62.1715093160064;
        Tue, 07 May 2024 07:46:00 -0700 (PDT)
Date: Tue, 7 May 2024 16:45:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/cpu-policy: Fix migration from Ice Lake to
 Cascade Lake
Message-ID: <Zjo-pWunEGru6Z_K@macbook>
References: <20240507112957.1701824-1-andrew.cooper3@citrix.com>
 <20240507134540.1714274-1-andrew.cooper3@citrix.com>
 <Zjo5iwmEvD3RWtsx@macbook>
 <f0272d79-7c59-42b2-b185-2aaf84f1b196@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0272d79-7c59-42b2-b185-2aaf84f1b196@citrix.com>

On Tue, May 07, 2024 at 03:31:19PM +0100, Andrew Cooper wrote:
> On 07/05/2024 3:24 pm, Roger Pau Monné wrote:
> > On Tue, May 07, 2024 at 02:45:40PM +0100, Andrew Cooper wrote:
> >> Ever since Xen 4.14, there has been a latent bug with migration.
> >>
> >> While some toolstacks can level the features properly, they don't shink
> >> feat.max_subleaf when all features have been dropped.  This is because
> >> we *still* have not completed the toolstack side work for full CPU Policy
> >> objects.
> >>
> >> As a consequence, even when properly feature levelled, VMs can't migrate
> >> "backwards" across hardware which reduces feat.max_subleaf.  One such example
> >> is Ice Lake (max_subleaf=2 for INTEL_PSFD) to Cascade Lake (max_subleaf=0).
> >>
> >> Extend the max policies feat.max_subleaf to the hightest number Xen knows
> >> about, but leave the default policies matching the host.  This will allow VMs
> >> with a higher feat.max_subleaf than strictly necessary to migrate in.
> >>
> >> Eventually we'll manage to teach the toolstack how to avoid creating such VMs
> >> in the first place, but there's still more work to do there.
> >>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >
> > Even if we have just found one glitch with PSFD and Ice Lake vs
> > Cascade Lack, wouldn't it be safer to always extend the max policies
> > max leafs and subleafs to match the known array sizes?
> 
> This is the final max leaf (containing feature information) to gain
> custom handling, I think?

Couldn't the same happen with extended leaves?  Some of the extended
leaves contain features, and hence for policy leveling toolstack might
decide to zero them, yet extd.max_leaf won't be adjusted.

Thanks, Roger.

