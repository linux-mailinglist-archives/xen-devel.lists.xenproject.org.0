Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7697120AFFA
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 12:44:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jolqZ-0004eK-88; Fri, 26 Jun 2020 10:44:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azve=AH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jolqX-0004eE-Ic
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 10:44:37 +0000
X-Inumbo-ID: 077726f4-b79a-11ea-8496-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 077726f4-b79a-11ea-8496-bc764e2007e4;
 Fri, 26 Jun 2020 10:44:37 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id h5so9017500wrc.7
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2020 03:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0tX4dZH8P8w6nTw31UlgtFloieHoONE4phc8XP5+2FI=;
 b=ksE9J+qLw4Twp89ck2K6vdhnOX7JxRtIUeGJl49vh4r8ymQXroC+J+kTzS/d9Bl6ge
 a4bM+Sc3RHkJdZUPN8ZoqK6ljTn7V2mx3u7P9M+U9uM/LvXlN+wEJRk/PS0Af6MCyErj
 jZFWqvl4hMeCpED1UHk7r9pzIJCZkc6yVM/B/3PFTFmY0Xu8ve85j7LMgAAuicxwxoTD
 cft5GGBzBE/f2Tf+ayoY/k/JwqSKYW/AdyOFpvfkmBGI1k0z11+o5/RoopmIyRhOfnxw
 0KMHIX/DuaBrOsbKk9PEsaKh2+1ZxoUAh4W03vKlPK9XRPWg2FvjjHfqsijmVJZzRt0p
 0cJA==
X-Gm-Message-State: AOAM532Su/B4W5YOd1CCdmuR1HoRdAhrwJ8YjMxonpZsZiAHoJaSoCRS
 G7093vmQcLzerfgMKAkx2FE=
X-Google-Smtp-Source: ABdhPJy6wwCKObrqB99PkW8bKZqK4xO3CDcOxQhCt6zMulfjrUmptrlZcA7thEoNoExnRRHe1lddlA==
X-Received: by 2002:a5d:6a46:: with SMTP id t6mr3138942wrw.374.1593168276368; 
 Fri, 26 Jun 2020 03:44:36 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id b62sm6365307wmh.38.2020.06.26.03.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 03:44:35 -0700 (PDT)
Date: Fri, 26 Jun 2020 10:44:34 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.14 v2 2/2] x86/passthrough: introduce a flag for
 GSIs not requiring an EOI or unmask
Message-ID: <20200626104434.yd6lplwcwpclli2n@liuwe-devbox-debian-v2>
References: <20200610142923.9074-1-roger.pau@citrix.com>
 <20200610142923.9074-3-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200610142923.9074-3-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 10, 2020 at 04:29:23PM +0200, Roger Pau Monne wrote:
> There's no need to setup a timer for GSIs that are edge triggered,
> since those don't require any EIO or unmask, and hence couldn't block

One small nit. I think you meant "EOI" here.

