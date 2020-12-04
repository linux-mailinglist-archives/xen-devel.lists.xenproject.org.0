Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1944B2CED44
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:41:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44606.79933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9SR-0005bP-Fl; Fri, 04 Dec 2020 11:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44606.79933; Fri, 04 Dec 2020 11:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9SR-0005az-C4; Fri, 04 Dec 2020 11:41:03 +0000
Received: by outflank-mailman (input) for mailman id 44606;
 Fri, 04 Dec 2020 11:41:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl9SP-0005au-Aa
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:41:01 +0000
Received: from mail-wr1-f43.google.com (unknown [209.85.221.43])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eef73eb3-f2d6-4b9c-a7c5-f9b187ec382e;
 Fri, 04 Dec 2020 11:41:00 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id s8so5005884wrw.10
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:41:00 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id t188sm2789666wmf.9.2020.12.04.03.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:40:58 -0800 (PST)
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
X-Inumbo-ID: eef73eb3-f2d6-4b9c-a7c5-f9b187ec382e
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hzURqLkexr9QsxLSKy90LiXlEh0rMjx1e/YuOmeVHZE=;
        b=sYqTo93p8UDY9X3qvJ6gYQH0jK3EbhSRmnHqX0bZmUBYKeKYNSvS8h5mM8Zm8EXhzd
         shoRRzJ03ayeILDKxduX6RSFz9E73NThgwQ2R2wuxkE07oFZpB1bx1fxYnT8I/7Frdjn
         +iTcAzUSNioxoJx0y43rBJhN+hy7/EVtKen8i9VaZ2A1Ot1ROxtAPBa46iFw4SBT5cQg
         w1DmAZlztBFzdVzDF/A28TDS6Psni2Nkd6qgjidd5FtbtwOEnbM7NXb3T2KgMfg3LgdP
         fKzFZEuhWAT136E+T2jGcY9GPMmQ1JGbcAb8urRj5O3yGRyIpHy63JoZ1xF3ND4XvDMC
         6u3g==
X-Gm-Message-State: AOAM5313yRKATLWjsfOFq3RUjKRQozAo8p74XrfcXdkswORaHPbzqKXw
	CNI4b4DbBhO5O0KoRHISmQo=
X-Google-Smtp-Source: ABdhPJzDp+Dqyvxb1je0hUMJvNBegKZWZJ4miZvAVCjSI5t39FScVoboUwqfFNyVk9IJGIUoBd6k/A==
X-Received: by 2002:a5d:634d:: with SMTP id b13mr4552273wrw.310.1607082059502;
        Fri, 04 Dec 2020 03:40:59 -0800 (PST)
Date: Fri, 4 Dec 2020 11:40:57 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 0/2] x86/IRQ: a little bit of tidying
Message-ID: <20201204114057.lyywlve3gibc7vwn@liuwe-devbox-debian-v2>
References: <935d31ab-cb65-02d7-a624-d5e047316389@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <935d31ab-cb65-02d7-a624-d5e047316389@suse.com>
User-Agent: NeoMutt/20180716

On Mon, Nov 23, 2020 at 04:00:50PM +0100, Jan Beulich wrote:
> 1: drop three unused variables
> 2: reduce casting involved in guest action retrieval

Reviewed-by: Wei Liu <wl@xen.org>

