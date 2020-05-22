Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E30AD1DE79B
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 15:04:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc7Ly-0002hc-VM; Fri, 22 May 2020 13:04:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=knsM=7E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jc7Lx-0002hX-JI
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 13:04:45 +0000
X-Inumbo-ID: ce9ce3ec-9c2c-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce9ce3ec-9c2c-11ea-ae69-bc764e2007e4;
 Fri, 22 May 2020 13:04:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D5DF0AA7C;
 Fri, 22 May 2020 13:04:46 +0000 (UTC)
Subject: Re: [PATCH] x86/svm: retry after unhandled NPT fault if gfn was
 marked for recalculation
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1590097438-28829-1-git-send-email-igor.druzhinin@citrix.com>
 <20200522100846.GV54375@Air-de-Roger>
 <04ec4ab4-a121-c5be-0a65-316e237dd793@citrix.com>
 <20200522102339.GX54375@Air-de-Roger>
 <fe6e5c7f-df0f-5436-a7cd-2949464ab9a7@citrix.com>
 <20200522111146.GZ54375@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4831dc51-cea1-2870-422b-2af7d6d1f2d6@suse.com>
Date: Fri, 22 May 2020 15:04:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522111146.GZ54375@Air-de-Roger>
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, andrew.cooper3@citrix.com,
 wl@xen.org, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.05.2020 13:11, Roger Pau Monné wrote:
> That being said, I also don't like the fact that logdity is handled
> differently between EPT and NPT, as on EPT it's handled as a
> misconfig while on NPT it's handled as a violation.

Because, well, there is no concept of misconfig in NPT.

Jan

