Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5F93559EC
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 19:03:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106133.202956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTp6w-0006l2-K4; Tue, 06 Apr 2021 17:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106133.202956; Tue, 06 Apr 2021 17:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTp6w-0006kd-Gi; Tue, 06 Apr 2021 17:03:30 +0000
Received: by outflank-mailman (input) for mailman id 106133;
 Tue, 06 Apr 2021 17:03:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JduZ=JD=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1lTp6v-0006kY-HN
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 17:03:29 +0000
Received: from mail-wm1-f51.google.com (unknown [209.85.128.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a3a62b1-9ba2-4896-80ad-441169306344;
 Tue, 06 Apr 2021 17:03:28 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5-20020a05600c0245b029011a8273f85eso3552332wmj.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Apr 2021 10:03:28 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id x1sm22493803wro.66.2021.04.06.10.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 10:03:26 -0700 (PDT)
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
X-Inumbo-ID: 7a3a62b1-9ba2-4896-80ad-441169306344
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pxsRGRXuq7g/dkwJ7vIPMwU96/PBZY5+iN2Z8OE85GE=;
        b=LwwJmCePApOyR16kHSPeXQzdlI32vcLIrUDPPiaQS2TJiFgBF/rKslvNxQhPXHLute
         4BB/cBGttKIPbbiMyxER7IL1z9PBb4mLwqZ1AsvYgsV4LQsq7Apmh06jTKBVOAtUn2Hu
         aptQf48gX2entEm00Sy06kfCIo0bNYEDiJvEJyWweVg9vuhS87zJ2nCrY0jIVWvNSajS
         WuwZqaUTQ/lfBrl6xXwCuo2UMUcsq9xyQdsmTEw7GPar6s9cfzCDqlbxlEPwmPfkdZyP
         ErjRCgMvhscTlbCwVW3YUjTfVsU7t2MNeH5tQ56A/5lxBQnqmtEhoF47LNhK7SX5EnQ8
         AjZA==
X-Gm-Message-State: AOAM5321ZkjAmOLEZ/T7jPCBX9xyjwOE/Q1RG3E3EO0TJCFce61vLhoS
	P2ytZ/kHUBvaZkLxhAkh23Q=
X-Google-Smtp-Source: ABdhPJyXHWRoD4nIO7as+YiNZpE6wzgJ2pSm6y7kYol8Vce8954eG1Smn1/yekCh7NzoNoZwTuQs3A==
X-Received: by 2002:a1c:ed05:: with SMTP id l5mr3367013wmh.154.1617728607231;
        Tue, 06 Apr 2021 10:03:27 -0700 (PDT)
Date: Tue, 6 Apr 2021 17:03:25 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 3/3] x86: avoid building COMPAT code when !HVM && !PV32
Message-ID: <20210406170325.wn3odtj5pqd2xxu2@liuwe-devbox-debian-v2>
References: <bf79f745-078b-071d-cf01-dfede456041a@suse.com>
 <85b6edfc-9756-9dd0-c90f-f46dc120dade@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85b6edfc-9756-9dd0-c90f-f46dc120dade@suse.com>

On Tue, Apr 06, 2021 at 04:02:08PM +0200, Jan Beulich wrote:
> It was probably a mistake to, over time, drop various CONFIG_COMPAT
> conditionals from x86-specific code, as we now have a build
> configuration again where we'd prefer this to be unset. Arrange for
> CONFIG_COMPAT to actually be off in this case, dealing with fallout.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Wei Liu <wl@xen.org>

