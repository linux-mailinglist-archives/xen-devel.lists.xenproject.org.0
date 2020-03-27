Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2980195AF3
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 17:20:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHrcC-0002Pe-BE; Fri, 27 Mar 2020 16:13:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xJX5=5M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHrcA-0002PZ-Ai
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 16:13:46 +0000
X-Inumbo-ID: eef092c8-7045-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eef092c8-7045-11ea-a6c1-bc764e2007e4;
 Fri, 27 Mar 2020 16:13:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9CC99AD86;
 Fri, 27 Mar 2020 16:13:44 +0000 (UTC)
To: Olaf Hering <olaf@aepfle.de>
References: <20200327142256.3256-1-olaf@aepfle.de>
 <24190.3426.470473.335250@mariner.uk.xensource.com>
 <20200327143735.GA4443@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <22c71b18-f049-4962-536e-cd8845149188@suse.com>
Date: Fri, 27 Mar 2020 17:13:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327143735.GA4443@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH v1] libxl: remove limit for default number
 of event channels
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.03.2020 15:37, Olaf Hering wrote:
> On Fri, Mar 27, Ian Jackson wrote:
> 
>> This seems likely to be right, but: what is the default in Xen ?  Is
>> it sufficiently tight to stop a guest using too many resources ?
> 
> The value of d->max_evtchns will be either 4k or 128k.
> AFAICS no extra resources are allocated with the changed value.

Of course there are, as soon as the guest uses the event channels.
Did you see Jürgen's patch sent earlier this week, aiming to
address the same issue of larger vCPU counts being a problem
("tools/libxl: make default of max event channels dependant on
vcpus")? See the discussion there.

Jan

