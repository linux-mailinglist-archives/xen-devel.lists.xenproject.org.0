Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB42B193C64
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 10:57:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHPDa-00025A-7S; Thu, 26 Mar 2020 09:54:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ColY=5L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHPDY-000255-Ok
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 09:54:28 +0000
X-Inumbo-ID: c804f8ec-6f47-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c804f8ec-6f47-11ea-a6c1-bc764e2007e4;
 Thu, 26 Mar 2020 09:54:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 586F9AB8F;
 Thu, 26 Mar 2020 09:54:27 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200326094557.13822-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <574ad265-7b49-6a60-fa74-655d81593049@suse.com>
Date: Thu, 26 Mar 2020 10:54:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200326094557.13822-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH] tools/libxl: make default of max event
 channels dependant on vcpus
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.03.2020 10:45, Juergen Gross wrote:
> Today the maximum number of event channels for a guest is defaulting
> to 1023. For large guests with lots of vcpus this is not enough, as
> e.g. the Linux kernel uses 7 event channels per vcpu, limiting the
> guest to about 140 vcpus.

I don't think any particular guest OS should "dictate" the default
here. What if another OS (or even a future version of Linux) requires
more than 8? And why would the value depend on number of vCPU-s but
not number and kind of virtual devices?

Jan

