Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A5D1FAA96
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 09:57:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl6T7-0001iB-6J; Tue, 16 Jun 2020 07:57:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jl6T5-0001hz-T7
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 07:57:15 +0000
X-Inumbo-ID: fd4f66a0-afa6-11ea-b893-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd4f66a0-afa6-11ea-b893-12813bfff9fa;
 Tue, 16 Jun 2020 07:57:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 401FCAC53;
 Tue, 16 Jun 2020 07:57:17 +0000 (UTC)
Subject: Re: [PATCH for-4.13] tools/libxl: Fix memory leak in libxl_cpuid_set()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200612173227.4103-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0b7a42e1-23b2-536c-1c08-d2d540d590d0@suse.com>
Date: Tue, 16 Jun 2020 09:57:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200612173227.4103-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12.06.2020 19:32, Andrew Cooper wrote:
> xc_cpuid_set() returns allocated memory via cpuid_res, which libxl needs to
> free() seeing as it discards the results.
> 
> This is logically a backport of c/s b91825f628 "tools/libxc: Drop
> config_transformed parameter from xc_cpuid_set()" but rewritten as one caller
> of xc_cpuid_set() does use returned values.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
in case it helps.

Jan

