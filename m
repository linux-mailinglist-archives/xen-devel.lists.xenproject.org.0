Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4839F2DB164
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:29:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54485.94696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDCo-0004SY-O8; Tue, 15 Dec 2020 16:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54485.94696; Tue, 15 Dec 2020 16:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDCo-0004Rt-KG; Tue, 15 Dec 2020 16:29:42 +0000
Received: by outflank-mailman (input) for mailman id 54485;
 Tue, 15 Dec 2020 16:29:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SBK9=FT=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kpDCn-0004Ow-LM
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:29:41 +0000
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69d3f5d6-df17-4451-ba3b-4abd5894ee80;
 Tue, 15 Dec 2020 16:29:38 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r7so20488577wrc.5
 for <xen-devel@lists.xenproject.org>; Tue, 15 Dec 2020 08:29:38 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id h29sm26837793wrc.68.2020.12.15.08.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 08:29:37 -0800 (PST)
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
X-Inumbo-ID: 69d3f5d6-df17-4451-ba3b-4abd5894ee80
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uOABWkSAvdD198SSsGdA5XhgKek8Zb4ci4zIBiaJPzE=;
        b=RCaAmS47yMmtfJ7GC3ssy5sp4kiMjAX2MGAF8540gioQ64+XH8WToqNMyxaUDl8vZQ
         8NcIe8KkkNFbI3sRcFgUlmMaFUBI26CSo4S8X1q40fRcS6lAXst2KSg3d4hFIpFwmB2r
         NuwQ1kQIV5amHKn2EJviqGN/BBh9MCb9cgXBrnzLQ0an4ku2c4SdwQaTsb/F4+Q9ommn
         iWYEexUCA1/CpVVEICuh0lodF2TukUL+LIzUO6nF6gLU3PqarmFtJGxg5KYQOf6E7JVq
         auGDXuUpk9Yai/h4+w+eY9jTgcXwFz79AwZH5ehBRA4SqRLkwl0VkQVADVWHf4AOqFhO
         Pwhg==
X-Gm-Message-State: AOAM531eFacCytgVy24y8eD3EF8NUjTJJjWI7GoR/lXTZ4hk670PANwv
	jKMVHRMdThq8GcnFUOhpAXI=
X-Google-Smtp-Source: ABdhPJzt0bdUPI5AlsVeen9j9jU1OdH+99+4LMPrnhLYVuL8ETKWJwu3VPm7TAFLUDvP1SKuxN9nNw==
X-Received: by 2002:adf:e590:: with SMTP id l16mr35018336wrm.294.1608049778235;
        Tue, 15 Dec 2020 08:29:38 -0800 (PST)
Date: Tue, 15 Dec 2020 16:29:36 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 3/4] x86/PV: avoid double stack reset during schedule
 tail handling
Message-ID: <20201215162936.vwex5yvwzg6nsi7u@liuwe-devbox-debian-v2>
References: <f4179ee3-56e4-ab18-7aae-55281c4d4412@suse.com>
 <00befc54-58f7-1891-031e-cdb848fb5787@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00befc54-58f7-1891-031e-cdb848fb5787@suse.com>
User-Agent: NeoMutt/20180716

On Tue, Dec 15, 2020 at 05:12:36PM +0100, Jan Beulich wrote:
> Invoking check_wakeup_from_wait() from assembly allows the new
> continue_pv_domain() to replace the prior continue_nonidle_domain() as
> the tail hook, eliminating an extra reset_stack_and_jump().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Wei Liu <wl@xen.org>

