Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D53881B0D83
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 15:56:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQWuO-0002uo-Av; Mon, 20 Apr 2020 13:56:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/8R=6E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQWuN-0002uj-1t
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 13:56:23 +0000
X-Inumbo-ID: b76aed36-830e-11ea-9067-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b76aed36-830e-11ea-9067-12813bfff9fa;
 Mon, 20 Apr 2020 13:56:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 47825AAB2;
 Mon, 20 Apr 2020 13:56:20 +0000 (UTC)
Subject: Re: [PATCH v3] Introduce a description of the Backport and Fixes tags
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20200417222430.20480-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5d33d469-9aba-5285-766a-193d7109712d@suse.com>
Date: Mon, 20 Apr 2020 15:56:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417222430.20480-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: lars.kurth@citrix.com, julien@xen.org, Wei Liu <wl@xen.org>,
 konrad.wilk@oracle.com, andrew.cooper3@citrix.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.04.2020 00:24, Stefano Stabellini wrote:
> +Backport Tag
> +------------
> +
> +A backport tag is an optional tag in the commit message to request a
> +given commit to be backported to the stable trees:
> +
> +    Backport: 4.9+
> +
> +It marks a commit for being a candidate for backports to all stable
> +trees from 4.9 onward.

Using the wording "stable trees" may, to some, imply ones still
under maintenance. How about omitting "stable", or replacing it
by "released"?

> +The backport requester is expected to specify which currently supported
> +releases need the backport; but encouraged to specify a release as far
> +back as possible which applies. If the requester doesn't know the oldest
> +affected tree, they are encouraged to append a comment like the
> +following:
> +
> +    Backport: 4.9+ # maybe older
> +
> +Maintainers request the Backport tag to be added on commit. Contributors
> +are welcome to mark their patches with the Backport tag when they deem
> +appropriate. Maintainers will request for it to be removed when that is
> +not the case.
> +
> +Please note that the Backport tag is a **request** for backport, which
> +will still need to be evaluated by the stable tree maintainers.
> +Maintainers might ask the requester to help with the backporting work if
> +it is not trivial.
> +
> +When possible, please use the Fixes tag instead.

Maybe amend with "(or in addition)"? I'm thinking in particular
about a case where a buggy change was already backported, but
didn't show up yet in a release from the respective branch(es).

Previously I did suggest to add an indication that people requesting
backports should also be prepare to actually help with backporting.
I don't recall a verbal reply, and I also don't see any respective
update here. (I'm not fully trusting our mail system, i.e. it may
very well be that I did miss a reply.)

Jan

