Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDE72325E4
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jul 2020 22:09:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0sNw-00014Z-8c; Wed, 29 Jul 2020 20:09:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TMQ+=BI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k0sNu-00014U-FM
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 20:09:06 +0000
X-Inumbo-ID: 5a5e63b2-d1d7-11ea-aa56-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a5e63b2-d1d7-11ea-aa56-12813bfff9fa;
 Wed, 29 Jul 2020 20:09:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C2198AB55;
 Wed, 29 Jul 2020 20:09:16 +0000 (UTC)
Subject: Re: [PATCH 3/5] xen/memory: Fix compat XENMEM_acquire_resource for
 size requests
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0c275cb5-55ec-b0b0-6ba8-cfa7ca23978b@suse.com>
Date: Wed, 29 Jul 2020 22:09:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728113712.22966-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.07.2020 13:37, Andrew Cooper wrote:
> Copy the nr_frames from the correct structure, so the caller doesn't
> unconditionally receive 0.

Well, no - it does get copied from the correct structure. It's just
that the field doesn't get set properly up front. Otherwise you'll
(a) build in an unchecked assumption that the native and compat
fields match in type and (b) set a bad example for people looking
here and then cloning this code in perhaps a case where (a) is not
even true. If you agree, the alternative change of setting
cmp.mar.nr_frames from nat.mar->nr_frames before the call is

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

