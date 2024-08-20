Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B92C958D6A
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 19:30:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780692.1190324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgSfJ-00037b-Pd; Tue, 20 Aug 2024 17:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780692.1190324; Tue, 20 Aug 2024 17:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgSfJ-00035C-N2; Tue, 20 Aug 2024 17:29:05 +0000
Received: by outflank-mailman (input) for mailman id 780692;
 Tue, 20 Aug 2024 17:29:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eMuN=PT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sgSfI-000356-Ba
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 17:29:04 +0000
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [2607:f8b0:4864:20::f2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b08f9caa-5f19-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 19:29:01 +0200 (CEST)
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-6bf9081b650so16967816d6.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 10:29:02 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bf6ff0feeesm53268776d6.145.2024.08.20.10.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 10:28:59 -0700 (PDT)
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
X-Inumbo-ID: b08f9caa-5f19-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724174941; x=1724779741; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UVLafZDf3VHIP7JQuhcXbfCo2OH33JivxKX+lEXhcnU=;
        b=Dsm9tQzFPdsGTuFCjRXvMaupFSOXTb9IMxozqpeNnbZZVbeoVieAOUd1F5rbuk+qZG
         MzFDWiPvtg2MY/Wbn5RYVGNUuBy6GamQo2ZN82HJozIBvYcQqIqUVHBRLAwO0PJ+Y1VD
         khtD46O392zFtxSkOjYWpo2OhzdS/AYHwAAsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724174941; x=1724779741;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVLafZDf3VHIP7JQuhcXbfCo2OH33JivxKX+lEXhcnU=;
        b=SPnzxNYBdYH+RWK0ZMsYBIu/NQcXC7kFNjdy0OPMUsqAF1iFILZngbmekhB4lgm+X3
         24POC3dkcSswoY+rBLaw4hIWpyDkrs1vImClbgW72pMILKOcnUVcFQF4WTFeobjuE9Dp
         k3+A4FwHKiiq5Zmwg5x6Q6NRxgCFaV7IzyxzUbeQWYsjDbApBBt+6k9bvyPxY+RtdJkm
         ry4ziu8VUbr/OG7jSNAGXzJzKFW7Tli1hxhzPQZ5AjsFnhj7yVuj5sLS/60ifx6zL8qv
         J7pg3PrmUfDP1pVICxr4m1HgfwKF/H3ReamftRqjmmAwCuBxqkSPgw51zQyQqSZDdksi
         Fz/A==
X-Forwarded-Encrypted: i=1; AJvYcCU+uM+ZPNe039zHiWtBl2HUEVkmJJxjfUSzpahRrMPii+8EOa03JqPzl+rkk3twFdTNEo81lXvYUwU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybLFpBNcQKXcTzVoPA/QHYcFR2o9xjTve5SltByhBJXb3uvVvR
	Yr4pa79bqoTHGDfhH3Z4SrpWgcWXFVP7juovq1MqhxNC0w92M34KhmzagyHJH/Mt66hDRt1CX3J
	T
X-Google-Smtp-Source: AGHT+IHHa7XnHEm7g/Dh6RbdUKzrHJ1J3QgaDx0wqBH3K8Hd3AM6O9n9zcl2by93qudIC/4vTzR5Wg==
X-Received: by 2002:a05:6214:5547:b0:6b7:aed6:8470 with SMTP id 6a1803df08f44-6bfa9f9de42mr25766376d6.28.1724174940774;
        Tue, 20 Aug 2024 10:29:00 -0700 (PDT)
Message-ID: <bd7c7155-4eae-4e3a-a0d2-dec48d8d94f7@citrix.com>
Date: Tue, 20 Aug 2024 18:28:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86/pv: Introduce x86_merge_dr6() and fix
 do_debug()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240815131600.4037415-1-andrew.cooper3@citrix.com>
 <20240815131600.4037415-2-andrew.cooper3@citrix.com>
 <82f78de2-3d93-4e51-a845-5bb96559a4cf@suse.com>
 <c02c15d6-9f59-41ff-aaf5-499bfffe4b8e@citrix.com>
 <89137a5a-4d7d-469e-a60c-3c6f649ee4f5@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <89137a5a-4d7d-469e-a60c-3c6f649ee4f5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/08/2024 7:11 am, Jan Beulich wrote:
> On 15.08.2024 18:34, Andrew Cooper wrote:
>> On 15/08/2024 4:41 pm, Jan Beulich wrote:
>>> On 15.08.2024 15:15, Andrew Cooper wrote:
>>>> Pretty much everywhere in Xen the logic to update %dr6 when injecting #DB is
>>>> buggy.  The architectural behaviour is to overwrite B{0..3} (rather than
>>>> accumulate) and accumulate all other bits.
>>> Just to double check (after 6 years I clearly don't recall anything that isn't
>>> written down in the description): The SDM pretty vaguely says "Certain debug
>>> exceptions may clear bits 0-3." What other information sources are there to
>>> make this less uncertain? (Picking an old hardcopy from the shelf, that
>>> confirms that long ago DR6 was indeed documented as all sticky.)
>> Well, "talking with the architects", but as always "it's complicated".
>>
>> The debug infrastructure has had several breaking changes in it over the
>> years (e.g. the reserved bits didn't use to be f's), and this one
>> probably changed with the introduction of superscalar pipelines.  That
>> said, I don't think I've ever found a Spec Update / Revision Guide that
>> doesn't have one "oops we don't do breakpoints properly in this case"
>> erratum listed.
>>
>> I'm informed it's "most going on all exceptions" these days, and the
>> behaviour here did come mostly from my discussions about XSA-308 (or
>> rather, the pre-security angle where it was just a bugfix) with Intel.
>>
>> A guest that does clear the status bits every #DB won't notice, and one
>> that doesn't will have problems on real hardware.
>>
>> But I can reword if if you'd prefer?
> If I may ask, I'd like it to at least be clarified that documentation isn't
> quite precise here. Kind of to soften "architectural behaviour" a little.

I've done some experimenting by pre/reloading %dr6 with ~DR6_DEFAULT
(i.e. all sticky bits asserted).

The only debug event I can find which does not clear breakpoints is
ICEBP on AMD.

ICEBP on Intel, and all combinations of singlestep/breakpoint/general
detect including SS-delayed on both Intel and AMD clear the breakpoint bits.

I'll note this, but given how broken ICEBP virt is on AMD (i.e. not
virtualised at all), I'm not inclined to special case it.


Also, I've found
https://lore.kernel.org/xen-devel/20230915203628.837732-1-andrew.cooper3@citrix.com/
which I'd totally forgotten about, which is mostly better
reviewed/acked, and contains some fixes that I'd missed when (re)doing
this part.

I'm going to pick out what I can from both of these series, because
there's still some breaking errors found in a Linux HVM VM which I was
trying to fix for 4.18 that are still not addressed...

~Andrew

