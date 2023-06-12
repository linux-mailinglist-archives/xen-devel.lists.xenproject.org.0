Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7210E72CA48
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 17:35:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547338.854668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8jZN-0004MT-8b; Mon, 12 Jun 2023 15:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547338.854668; Mon, 12 Jun 2023 15:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8jZN-0004KS-4S; Mon, 12 Jun 2023 15:35:01 +0000
Received: by outflank-mailman (input) for mailman id 547338;
 Mon, 12 Jun 2023 15:34:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FBfH=CA=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1q8jZL-0004KM-Dd
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 15:34:59 +0000
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a89836dd-0936-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 17:34:54 +0200 (CEST)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 08:34:43 -0700
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga004.fm.intel.com with ESMTP; 12 Jun 2023 08:34:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1q8jYy-0039IC-2J; Mon, 12 Jun 2023 18:34:36 +0300
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
X-Inumbo-ID: a89836dd-0936-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686584094; x=1718120094;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Eb3Mm09adN6K9gUBCgKSk4MjwnPUfaI+/HnXTw8x3W4=;
  b=Yi7aAOvBdu+fLnX7OcJUsShZ54QuI/9r3B30Ol2xSYDqQZ4g+ccYbnJM
   WoAUDo0L6FwPZAbZ9YNU7kkZWgn03lSD7StRuCO3EjB6fzAUpe+4vwaQg
   dGqoNdL+YN0Dhf0Xp9Yy15MMzpK3ARMsJ8nOP7AXGmc5vv8lVSxRKIO+X
   9+t7C73jFWIv3a62S+GiAAaZyFn0tNh9hKQUDiiApzB/8QAuhd7s+KsvE
   ZYfsTZf/ekRthCqGunzfPBk+Rsrx8JCApTpD7eT/C4EB6tCuWX0JAEQKb
   BDG6ohUqxQR8Xf4uKRSpWNAsrwE0SA/3I5XOvLkOz0YvmxJgUJB/ijXO9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="337712744"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="337712744"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="781252297"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="781252297"
Date: Mon, 12 Jun 2023 18:34:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Lee Jones <lee@kernel.org>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 0/4] Make sscanf() stricter
Message-ID: <ZIc7DJME7yDfrOf+@smile.fi.intel.com>
References: <20230610204044.3653-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230610204044.3653-1-demi@invisiblethingslab.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Jun 10, 2023 at 04:40:40PM -0400, Demi Marie Obenour wrote:
> Roger Pau Monné suggested making xenbus_scanf() stricter instead of
> using a custom parser.  Christoph Hellwig asked why the normal vsscanf()
> cannot be made stricter.  Richard Weinberger mentioned Linus Torvalds’s
> suggestion of using ! to allow overflow.

As Rasmus articulated, NAK w.o. test cases being added to all parts where your
changes touch.

-- 
With Best Regards,
Andy Shevchenko



