Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2581726A043
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 09:56:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kI5nv-0001g8-N7; Tue, 15 Sep 2020 07:55:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kI5nu-0001g3-3Y
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 07:55:06 +0000
X-Inumbo-ID: 2a392e45-7bd9-40f9-86e0-a3504b70857e
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a392e45-7bd9-40f9-86e0-a3504b70857e;
 Tue, 15 Sep 2020 07:55:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A4BC4AD08;
 Tue, 15 Sep 2020 07:55:19 +0000 (UTC)
Subject: Re: libxenguest and xenguest.h
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
References: <7995d80f-336a-90a3-f431-b18748fbcff5@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1d4fb223-0800-452b-54fc-5db1db74be2f@suse.com>
Date: Tue, 15 Sep 2020 09:55:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7995d80f-336a-90a3-f431-b18748fbcff5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.09.2020 07:18, Jürgen Groß wrote:
> Andy has reported a libxenguest related build failure of qemu when
> building qemu outside the Xen build environment. Problem is xenguest.h
> now including xenctrl_dom.h, which is including xen/libelf/libelf.h.
> 
> The underlying problem is that libxenguest is basically offering some
> "official" functions via xenguest.h, while some other functions are
> only Xen internally usable and are defined in xenctrl_dom.h.
> 
> This is a rather weird construction and I'm seeing the following
> solutions:
> 
> 1. Make xen/include/xen/libelf.h a public header (or split the parts
>     needed by xenguest.h into a public header)

Besides being conceptually wrong imo, this could (afaict) cause name
space issues to consumers. This definitely gets a -1 from me, if not
a -2.

> 2. Reflect the two parts of libxenguest by carving out the xenctrl_dom.h
>     defined parts into a new library not made public
> 
> 3. Make the xenctrl_dom.h interfaces internal again by not adding it to
>     the installed headers

This option would seem to imply that qemu has no real need to include
this header, as otherwise how would this address the build issue?

Jan

