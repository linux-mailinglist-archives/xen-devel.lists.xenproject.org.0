Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CA128120A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 14:12:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2007.5954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOJvD-00005N-71; Fri, 02 Oct 2020 12:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2007.5954; Fri, 02 Oct 2020 12:12:23 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOJvD-00004r-3b; Fri, 02 Oct 2020 12:12:23 +0000
Received: by outflank-mailman (input) for mailman id 2007;
 Fri, 02 Oct 2020 12:12:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kOJvA-0008WQ-VX
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 12:12:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b17feca-028a-4d5d-9935-fb823db06c4d;
 Fri, 02 Oct 2020 12:12:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 11793B3E7;
 Fri,  2 Oct 2020 12:12:19 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kOJvA-0008WQ-VX
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 12:12:21 +0000
X-Inumbo-ID: 0b17feca-028a-4d5d-9935-fb823db06c4d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0b17feca-028a-4d5d-9935-fb823db06c4d;
	Fri, 02 Oct 2020 12:12:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601640739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9hl3nd521JQPp97b9xvIAPpFbab/f8AzmjO/a/iZmWA=;
	b=aAYZgnyxulPkJdZy44OygSw59IafJTrP/8M3HYo+pa+geTaUVCTOHXD9ZqyT3fsl+rof7j
	h8gkz1WK6Cr3DecBNV/Z9575hAfLOQEnD1osovz9kFITE4E2vCqYPyGKFbjX5PW52v+D1V
	CkbCeaePRIOyKmUHvdxECw0177B5WDc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 11793B3E7;
	Fri,  2 Oct 2020 12:12:19 +0000 (UTC)
Subject: Re: [PATCH] build: always use BASEDIR for xen sub-directory
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <556f6327acea2d0343c93da28f1fc17591afd402.1601564274.git.bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <706afc44-a414-33ff-da94-b92f7a96f1fc@suse.com>
Date: Fri, 2 Oct 2020 14:12:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <556f6327acea2d0343c93da28f1fc17591afd402.1601564274.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02.10.2020 12:42, Bertrand Marquis wrote:
> Modify Makefiles using $(XEN_ROOT)/xen to use $(BASEDIR) instead.
> 
> This is removing the dependency to xen subdirectory preventing using a
> wrong configuration file when xen subdirectory is duplicated for
> compilation tests.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

(but more for the slight tidying than the purpose you name)

Jan

