Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2F1A1A3A1
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 12:55:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876170.1286541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tavnc-0003ob-0O; Thu, 23 Jan 2025 11:55:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876170.1286541; Thu, 23 Jan 2025 11:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tavnb-0003mN-T8; Thu, 23 Jan 2025 11:55:03 +0000
Received: by outflank-mailman (input) for mailman id 876170;
 Thu, 23 Jan 2025 11:55:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lw3w=UP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tavnb-0003mF-0L
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 11:55:03 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfbc24af-d980-11ef-99a4-01e77a169b0f;
 Thu, 23 Jan 2025 12:55:00 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ab39f84cbf1so158812166b.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 03:55:00 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384ce1f71sm1063895966b.61.2025.01.23.03.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 03:54:59 -0800 (PST)
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
X-Inumbo-ID: dfbc24af-d980-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737633300; x=1738238100; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=asFzOIJ6HW15QI2JSh029PiL2Dhl+h9jYjhIOuP0MGo=;
        b=i/oStinnrSqyafQPyqUBasCTa4E8VUQyq5tjLFaXYyXCKtyKky9nJ3TcQ5WpIZHzqf
         ppILrAzD2lGQ88f4FWW2TViWOqiWQzrH3fqiisn2pCu44k8EnzRBH2bN8kPhpGYiyIkf
         +lSnlrkCbMwKUh1/qgcsNLoulhIyM3cyRLL8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737633300; x=1738238100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asFzOIJ6HW15QI2JSh029PiL2Dhl+h9jYjhIOuP0MGo=;
        b=KRjP3yeLclpm6JvmxilCi6WnwIh0km113siFVgX7P/pui4OFdq/e508Yiml8qMqOVD
         Ni585WFNqO0Wsy2IBB0bGI6Ku5M6Lmo9LnG1z/6Zr5xEZVh6N0dumgp2hKTxEusjQfC/
         UyBWLnTkWB1qaFYV9VzuJBmd4GzX1q4bWfloBMRKcT8cXmnXu/Z+k8uQjv9CO4Xo753g
         UadayGOsQWgLpC/Txw7/AC1D0Nu8za/qLEblTfOec6jF7Ncxxt7CuIi6ya+PwavQupl+
         6GAadcMcapyUEt6vU2m44tVCXKTZNjOoWiE4JRe+Kd8T8K8rOwg32Nz9bVdK5hjMaXXL
         R+kw==
X-Gm-Message-State: AOJu0YxtswvLnAd5S8UQeAKcXnX5aUw5hNkhdkZHTIDy0k2w4RRQm2aP
	0KaQT8FyRSz1b0nM1AmphyJWcJO9rvDdM/LgcDdf9wzFVVu0Cdse0rbb9Txant8=
X-Gm-Gg: ASbGncvWrGNVP+U3alUd0kqb5E6vIIhrhl2mbDnSO15u+zRZRR+Ze5jJ8+SrJFmuR7U
	v3MAzq6/KUrATP1kfalSnQMGEIDFFho/CwAeF5gMXc5cq62LPK8eGvHWjOEVYTz3+zdHMzVw/qB
	yqJRZWG4cbY68ZRPjf0HEBDzhS81cXWXq/Z52SRHb58WSpiMJz8byEyeikjaEnsyaRcH2mpuAoW
	edDaDQHYm3RB4NkpEIhbB6dgS2GcIb3Qve/3hA8gHdjTuxmbJ1Pg9vdLxjWV2jDwzyaxDxkx/9Q
	aaOCo2MNWILSjYs=
X-Google-Smtp-Source: AGHT+IFVw0rEpcBDTLfqDv/zd3mDH1uJAooG65ExD3HbcIhYShBBY2A8M/eXm1d+SEGjB0pUo/k/Gw==
X-Received: by 2002:a17:907:930b:b0:aab:c78c:a705 with SMTP id a640c23a62f3a-ab38b3d4253mr2407868366b.52.1737633300026;
        Thu, 23 Jan 2025 03:55:00 -0800 (PST)
Date: Thu, 23 Jan 2025 12:54:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/PV: further harden guest memory accesses against
 speculative abuse
Message-ID: <Z5IuEq9Lauhn8glx@macbook.local>
References: <a537dd1e-bbd3-4ef8-8014-6bb432484c57@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a537dd1e-bbd3-4ef8-8014-6bb432484c57@suse.com>

On Tue, Nov 05, 2024 at 02:56:42PM +0100, Jan Beulich wrote:
> The original implementation has two issues: For one it doesn't preserve
> non-canonical-ness of inputs in the range 0x8000000000000000 through
> 0x80007fffffffffff. Bogus guest pointers in that range would not cause a
> (#GP) fault upon access, when they should.
> 
> And then there is an AMD-specific aspect, where only the low 48 bits of
> an address are used for speculative execution; the architecturally
> mandated #GP for non-canonical addresses would be raised at a later
> execution stage. Therefore to prevent Xen controlled data to make it
> into any of the caches in a guest controllable manner, we need to
> additionally ensure that for non-canonical inputs bit 47 would be clear.
> 
> See the code comment for how addressing both is being achieved.
> 
> Fixes: 4dc181599142 ("x86/PV: harden guest memory accesses against speculative abuse")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: Two variants of part of the logic are being presented, both with
>      certain undesirable aspects: The first form is pretty large and
>      ugly (some improvement may be possible by introducing further
>      helper macros). The alternative form continues to use RCR, which
>      generally would be nice to do away with. Then again that's also
>      slightly smaller generated code.

Oh, I assume that's why there's a hardcoded .if 1, I was wondering
about that.  What's the specific issue with using rcr?  And why is the
more complex set of macros that use setc plus a shl better?

Why not use cmovc:

mov $(1 << 63), \scratch1
cmovc \scratch1, \scratch2

AFAICT \scratch1 is not used past the btr instruction, and hence can
be used for the cmovc?

Thanks, Roger.

