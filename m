Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EB93559C9
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 18:56:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106123.202931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTp03-0005iX-JK; Tue, 06 Apr 2021 16:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106123.202931; Tue, 06 Apr 2021 16:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTp03-0005iB-Fw; Tue, 06 Apr 2021 16:56:23 +0000
Received: by outflank-mailman (input) for mailman id 106123;
 Tue, 06 Apr 2021 16:56:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JduZ=JD=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1lTp01-0005i3-Gz
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 16:56:21 +0000
Received: from mail-wr1-f53.google.com (unknown [209.85.221.53])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3457f296-f13f-4b20-bd38-3e77af45237a;
 Tue, 06 Apr 2021 16:56:20 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id q26so9288598wrz.9
 for <xen-devel@lists.xenproject.org>; Tue, 06 Apr 2021 09:56:20 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id f24sm3482764wmb.32.2021.04.06.09.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 09:56:19 -0700 (PDT)
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
X-Inumbo-ID: 3457f296-f13f-4b20-bd38-3e77af45237a
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FEAVCo+u2HWRS+XIBEsCGESdrilEgAfIg2k7wEPb9O4=;
        b=Bw7GH+J7jPqzTJb0fV0mpUoZ0YTUkvCSWQHDyjc7PoUptRg6vVq0JJJwYfPwVvknMa
         lXppohQm6AZu/zeOmgylm8KcrmnPrnZMdG24VYOENFKNvPGWdehNNL0R9vNV6z/Smvb1
         1CQaIabTDoJsnWfeSmSfJScW4+mksuEAcRi8SrcRFOFLYAL0FCjnM4cScH5+lpyK/svE
         zj57TFjZ1sMqbM8/ftL/wht4jDTV+8uF9sVkekbSwlamy6a/Y5KozXGZp/dMysNXOCSl
         Ja8HMykgiavrXXxnLA4coeQswWmmYn470s/6JIPelA2vZxi9kjjsk28mTDrb9TxGip61
         AABQ==
X-Gm-Message-State: AOAM531VWVb0/2gI4WQL6+iaRHz1L9D8XE7aY3rszPU77mNmkwtl5J6z
	A+F1FSBysWf+9Qxbbt0+StA=
X-Google-Smtp-Source: ABdhPJwKe5Uj/kPNaz0TDQkuyj26awWLTLYjxg44GY3l4xzikyi9LrV1wUm/FIojKCjKSsPC0eEoNg==
X-Received: by 2002:adf:f143:: with SMTP id y3mr37965915wro.198.1617728180173;
        Tue, 06 Apr 2021 09:56:20 -0700 (PDT)
Date: Tue, 6 Apr 2021 16:56:18 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/3] x86: don't build unused entry code when !PV32
Message-ID: <20210406165618.6vfo4tkqfyyv76sr@liuwe-devbox-debian-v2>
References: <bf79f745-078b-071d-cf01-dfede456041a@suse.com>
 <213007e3-bb4c-a564-ca1d-860283646be4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <213007e3-bb4c-a564-ca1d-860283646be4@suse.com>

On Tue, Apr 06, 2021 at 04:01:22PM +0200, Jan Beulich wrote:
> Except for the initial part of cstar_enter compat/entry.S is all dead
> code in this case. Further, along the lines of the PV conditionals we
> already have in entry.S, make code PV32-conditional there too (to a
> fair part because this code actually references compat/entry.S).
> 
> This has the side effect of moving the tail part (now at compat_syscall)
> of the code out of .text.entry (in line with e.g. compat_sysenter).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Wei Liu <wl@xen.org>

