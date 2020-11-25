Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 922B62C3A41
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 08:45:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37375.69706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khpUT-0004xR-Vh; Wed, 25 Nov 2020 07:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37375.69706; Wed, 25 Nov 2020 07:45:25 +0000
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
	id 1khpUT-0004x2-Sa; Wed, 25 Nov 2020 07:45:25 +0000
Received: by outflank-mailman (input) for mailman id 37375;
 Wed, 25 Nov 2020 07:45:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khpUS-0004wx-6C
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 07:45:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1569f378-2059-4e41-ba46-dc7c740523d5;
 Wed, 25 Nov 2020 07:45:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AAD57ABD7;
 Wed, 25 Nov 2020 07:45:22 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khpUS-0004wx-6C
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 07:45:24 +0000
X-Inumbo-ID: 1569f378-2059-4e41-ba46-dc7c740523d5
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1569f378-2059-4e41-ba46-dc7c740523d5;
	Wed, 25 Nov 2020 07:45:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606290322; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oP6blpcuK+VPVi3IG6ixxt3sFGZ4bfXvaJa2qLjbkAk=;
	b=B9WJ2juBejK8pywfUlhDzCD9SUBgQ4qEoc3Z/Fz1LPhpjGxgX28+2O/XXPzQn5SXKUedqc
	Me9QYiQtnWeBkczrSq1JEXoKflEqj8VaR0vqnriTep5cqWPvNRoL5fcG/RiUAqJwQA+/Vw
	EOyn/X46wm3LH5w2MgNyMw9qGGrvQzc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AAD57ABD7;
	Wed, 25 Nov 2020 07:45:22 +0000 (UTC)
Subject: Re: [PATCH v3 13/13] x86: replace open-coded occurrences of
 sizeof_field()...
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>, Jun Nakajima
 <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201124190744.11343-1-paul@xen.org>
 <20201124190744.11343-14-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <262181c2-3a08-8b6d-5644-5a57fd4f46a1@suse.com>
Date: Wed, 25 Nov 2020 08:45:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201124190744.11343-14-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.11.2020 20:07, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ... with macro evaluations, now that it is available.
> 
> A recent patch imported the sizeof_field() macro from Linux. This patch makes
> use of it in places where the construct is currently open-coded.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

