Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 002108856FB
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 10:59:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696290.1087097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnFBI-0000Z0-Dd; Thu, 21 Mar 2024 09:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696290.1087097; Thu, 21 Mar 2024 09:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnFBI-0000Wo-AK; Thu, 21 Mar 2024 09:57:52 +0000
Received: by outflank-mailman (input) for mailman id 696290;
 Thu, 21 Mar 2024 09:57:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbdV=K3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rnFBG-0000Wf-2N
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 09:57:50 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7863af2e-e769-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 10:57:47 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-513dc99b709so1009294e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 02:57:47 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 by1-20020a056000098100b0033e18421618sm13383647wrb.17.2024.03.21.02.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 02:57:46 -0700 (PDT)
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
X-Inumbo-ID: 7863af2e-e769-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711015067; x=1711619867; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+v2WOPdak9UU9ZOKqEI45K4ZzSE8WyWyHQsVBt7X5E0=;
        b=GbLsJSWEqitrpbRBshwCPCikGaP+22j74c0ATmt2DBCmZWiwIc44SGaXramI+DO+R5
         Doim3cx7WhAqgKSvFXK/Nq/RjCrGjsQgnaPeQlI4HsQ9PhAgr+uE7S1dhNtMtraOtIvK
         5jCAXdai3UIaDErh7mRy7uwDVQMTwrgeRbxP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711015067; x=1711619867;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+v2WOPdak9UU9ZOKqEI45K4ZzSE8WyWyHQsVBt7X5E0=;
        b=B3DiOxwPDOm5zEV0yYVh4xf77uBSFhcEIiBTnctCdIy5P9g3mJD4AUrhqIdcoI5yt8
         Wf0UBvmsasZBNoq/E1D3pmdpltL/8jiKfMFR7SqyL9cx0i//VUBZGbzVR1LTIpP4haRy
         +WapMGWHcnzfBDfqVuWH9iDnCz2bk2aHG6EWVb/V5vnZyipPMxBOruz3B+nsC4fRlHAb
         kwOHnAf+6YIicSGqrSxm6pw/H8c0sfSgp/XBlMYdIpoLKrA3mGUp8Twc5tfZh/KQYXk5
         paKWBwYYldzmGniPMBU4j21R8WHY7bhHjR17wtKJPofk1Z2G7PMpt/8/S5xRVbqDfS08
         uOeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbLhbzaU6UTKCFewkybZxct2D+aHviRt5wX9RtyMIlBd+ZzqDYgMyJAH0rYHomde2ychcEM2pZqyf+zHmQaWui/8w/NlQz4ofxs5UF3yM=
X-Gm-Message-State: AOJu0Yy6J52RClLIe6t33W6Nq+CCp/EZu4veliN7VnvkS5T0b5T3QjbX
	vsIluo7EkzjPKngfLedA8xWtRtP2hEXOwMCxTWm2QexGI5ISMgWSHQ4ULf3XGXA=
X-Google-Smtp-Source: AGHT+IH4iw4RRHUWsRvOGdW/NxJ5854srPaJIEkTxL5ssqge8CceIds5J1pGKYhOKJbR9IDFHupKwg==
X-Received: by 2002:a05:6512:328d:b0:513:177e:4254 with SMTP id p13-20020a056512328d00b00513177e4254mr6085054lfe.14.1711015066839;
        Thu, 21 Mar 2024 02:57:46 -0700 (PDT)
Date: Thu, 21 Mar 2024 10:57:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/vcpu: relax VCPUOP_initialise restriction for non-PV
 vCPUs
Message-ID: <ZfwEmVmNmF-TOdxe@macbook>
References: <20240320135720.68894-1-roger.pau@citrix.com>
 <73314dc5-0145-4aa7-a3cd-23c943235392@suse.com>
 <ZfsPAj-ggY6unQef@macbook>
 <4cc5d746-a50c-4819-a56e-512abf797ef2@suse.com>
 <Zfv5k8jt0k7QHFxM@macbook>
 <c0aa957a-8a19-4fda-ae04-ce962fde6767@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0aa957a-8a19-4fda-ae04-ce962fde6767@suse.com>

On Thu, Mar 21, 2024 at 10:17:25AM +0100, Jan Beulich wrote:
> On 21.03.2024 10:10, Roger Pau Monné wrote:
> > On Thu, Mar 21, 2024 at 09:07:10AM +0100, Jan Beulich wrote:
> >> On 20.03.2024 17:29, Roger Pau Monné wrote:
> >>> On Wed, Mar 20, 2024 at 04:09:33PM +0100, Jan Beulich wrote:
> >>>> On 20.03.2024 14:57, Roger Pau Monne wrote:
> >>>>> There's no reason to force HVM guests to have a valid vcpu_info area when
> >>>>> initializing a vCPU, as the vCPU can also be brought online using the local
> >>>>> APIC, and on that path there's no requirement for vcpu_info to be setup ahead
> >>>>> of the bring up.  Note an HVM vCPU can operate normally without making use of
> >>>>> vcpu_info.
> >>>>
> >>>> While I'd agree if you started with "There's no real need to force ...", I
> >>>> still think there is a reason: If one wants to use paravirt interfaces (i.e.
> >>>> hypercalls), they would better do so consistently. After all there's also
> >>>> no need to use VCPUOP_initialise, yet you're not disabling its use.
> >>>>
> >>>> As said in reply to Andrew's reply, besides acting as a sentinel that
> >>>> structure instance also acts as a sink for Xen accesses to a vCPU's
> >>>> vcpu_info. By removing the check, you switch that from being a safeguard to
> >>>> being something that actually has to be expected to be accessed. Unless
> >>>> you've audited all uses to prove that no such access exists.
> >>>
> >>> I'm kind of lost in this last paragraph, how is that different than
> >>> what currently happens when an HVM vCPU >= 32 is brought up using the
> >>> lapic and has no vpcu_info mapped?
> >>
> >> I think this aspect was simply missed back at the time. And I think it
> >> wants mentioning explicitly to justify the change.
> > 
> > OK, I can add to the commit message:
> > 
> > "Note an HVM vCPU can operate normally without making use of
> > vcpu_info, and in fact does so when brought up from the local APIC."
> 
> I'd be fine adding this (or having this added) while committing.
> 
> >> As said in reply to Andrew, I don't think the dummy structure can be got
> >> rid of. Nor can the checks here be (easily) removed altogether, i.e. your
> >> change cannot (easily) be extended to PV as well. Even conditional removal
> >> of the structure in !PV builds would first require all vcpu_info accesses
> >> to gain a suitable conditional. Which may be undesirable, as some of these
> >> may be deemed fast paths.
> > 
> > I didn't intended to do this here, as replied to Andrew.  If we want
> > to get rid of the check for PV also it needs to be done in a different
> > patch, and with a different justification and analysis.
> > 
> >>> Also, from a quick look it seems like sites do check whether vcpu_info
> >>> == dummy_vcpu_info, otherwise we would already be in trouble.
> >>
> >> Such checks exist in code managing vcpu_info, but not - afaics - in places
> >> actually accessing it.

Is there anything else that needs adjusting then, or are you happy to
pick this up and adjust the commit message?

> > Quite possibly, I didn't look that close TBH, since my intention was
> > not to remove dummy_vcpu_info.  I've noticed however that
> > __update_vcpu_system_time() checks for v->vcpu_info_area.map == NULL,
> > which is fine, but shouldn't it also check for v->vcpu_info_area.map
> > == &dummy_vcpu_info, as it's pointless to update the vcpu system time
> > if pointing to the dummy_vcpu_info?
> 
> The check is there to guard against NULL deref. As said, the aspect of a
> vCPU being brought up the "native" way yet then still using its vCPU info
> was, by mistake, neglected earlier on. So yes, such a check could be
> added here, but it isn't strictly necessary as long as we don't avoid
> accessing the dummy structure uniformly everywhere (which, as said, I'm
> not sure we want to do).

I could add such a check in a separate patch, my main concern with
this is not correctness, it's just that we waste cycles updating the
contents of dummy_vcpu_info which is useless.

Thanks, Roger.

