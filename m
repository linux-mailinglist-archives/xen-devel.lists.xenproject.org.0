Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D507195734
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 13:39:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHoFK-0007eQ-Jl; Fri, 27 Mar 2020 12:37:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xJX5=5M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHoFI-0007eH-Al
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 12:37:56 +0000
X-Inumbo-ID: c76e6d11-7027-11ea-896b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c76e6d11-7027-11ea-896b-12813bfff9fa;
 Fri, 27 Mar 2020 12:37:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1A7FEAEF8;
 Fri, 27 Mar 2020 12:37:55 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200327121955.19695-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d118b49f-5aaa-c0a8-a394-99b1f386e5b9@suse.com>
Date: Fri, 27 Mar 2020 13:37:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327121955.19695-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH] x86/ucode: Drop the sanity check for
 interrupts being disabled
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.03.2020 13:19, Andrew Cooper wrote:
> Of the substantial number of things which can go wrong during microcode load,
> this is not one.  Loading occurs entirely within the boundary of a single
> WRMSR instruction.  Its certainly not a BUG()-worthy condition.
> 
> Xen has legitimate reasons to not want interrupts enabled at this point, but
> that is to do with organising the system rendezvous.  As these are private low
> level helpers invoked only from the microcode core logic, forgo the check
> entirely.
> 
> While dropping system.h, clean up the processor.h include which was an
> oversight in the previous header cleanup.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

