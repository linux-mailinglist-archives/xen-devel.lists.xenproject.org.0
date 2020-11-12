Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 367272B0694
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 14:37:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25885.53934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdCmH-00006g-E7; Thu, 12 Nov 2020 13:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25885.53934; Thu, 12 Nov 2020 13:36:41 +0000
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
	id 1kdCmH-00006H-Ad; Thu, 12 Nov 2020 13:36:41 +0000
Received: by outflank-mailman (input) for mailman id 25885;
 Thu, 12 Nov 2020 13:36:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kdCmF-00006B-H8
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 13:36:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5aa64e5-00a3-494f-b249-0df3906d1c62;
 Thu, 12 Nov 2020 13:36:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 817D5AC1D;
 Thu, 12 Nov 2020 13:36:37 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kdCmF-00006B-H8
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 13:36:39 +0000
X-Inumbo-ID: e5aa64e5-00a3-494f-b249-0df3906d1c62
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e5aa64e5-00a3-494f-b249-0df3906d1c62;
	Thu, 12 Nov 2020 13:36:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605188197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eteJ9ZJIDiBWg8uBlb3V3zK8fFf5uEU0SVmhkBGLvcE=;
	b=BmOM3kqJkSOZ+py8vNn+1hoaz0S0QA8ilx13aKeQ5K1iJ+GRZi0OGJ2qN9f7NVWuXH90p3
	dyLzrdNqWJeocQpR5feNm40vwRBYZH8FhG4VzfgkDBJJvVs54jHXOp/pyd8LvWrZM1eet4
	3PEwWZpAagOVVp9PoKm29SJxKx7CLRo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 817D5AC1D;
	Thu, 12 Nov 2020 13:36:37 +0000 (UTC)
Subject: Re: [PATCH] xen: add support for automatic debug key actions in case
 of crash
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201022143905.11032-1-jgross@suse.com>
 <977bab69-892c-d94d-d952-1a748f69d0b6@suse.com>
 <53732f8f-fe6d-91bd-4100-4b4d904a4073@suse.com>
 <ed2f73e7-04cc-f568-f0b7-19c843a8d31b@suse.com>
 <8c77ff71-a14e-7cf7-5f27-c7c152ace240@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3e2132c9-2ab3-7bfb-656b-2cab58a53342@suse.com>
Date: Thu, 12 Nov 2020 14:36:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <8c77ff71-a14e-7cf7-5f27-c7c152ace240@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12.11.2020 13:50, Jürgen Groß wrote:
> Any further comments, or even better, Acks?

To be honest I'd prefer to have at least one of the people Cc-ed
minimally indicate they consider this a good idea. No need for a
close review or such, just a basic opinion. Anyone?

Jan

