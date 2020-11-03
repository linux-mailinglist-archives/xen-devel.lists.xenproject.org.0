Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A0D2A3FBB
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 10:10:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18037.42776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZsKx-0000xj-5a; Tue, 03 Nov 2020 09:10:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18037.42776; Tue, 03 Nov 2020 09:10:43 +0000
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
	id 1kZsKx-0000xK-2a; Tue, 03 Nov 2020 09:10:43 +0000
Received: by outflank-mailman (input) for mailman id 18037;
 Tue, 03 Nov 2020 09:10:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kZsKv-0000xF-Vg
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 09:10:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a5d943b6-1b37-4ab5-8941-afedee81f72d;
 Tue, 03 Nov 2020 09:10:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8AB51B135;
 Tue,  3 Nov 2020 09:10:40 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kZsKv-0000xF-Vg
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 09:10:42 +0000
X-Inumbo-ID: a5d943b6-1b37-4ab5-8941-afedee81f72d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id a5d943b6-1b37-4ab5-8941-afedee81f72d;
	Tue, 03 Nov 2020 09:10:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604394640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BO8z69KtKlnocrm4zZqoiLQXhMRld82wUq4xgkLjsbc=;
	b=YUXncDl6NIMMWYqCEQxJfb39CCvV/+YXKxYKZtKQqYfuI1Ttdh8Y6C8I/I0OmShQ7D5qTc
	QCyy3k1GzkGdBF7txgXpvaNpkJ9/kNyq9dEpTs4P35NiW4jar9UrafRDbv8XKjcusx8p+2
	v7R0MU6BifArWQwllP8m5M4vN+aVcIA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8AB51B135;
	Tue,  3 Nov 2020 09:10:40 +0000 (UTC)
Subject: Re: [PATCH v1 1/2] Define build dates/time based on SOURCE_DATE_EPOCH
To: =?UTF-8?Q?Fr=c3=a9d=c3=a9ric_Pierret_=28fepitre=29?=
 <frederic.pierret@qubes-os.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1604156731.git.frederic.pierret@qubes-os.org>
 <57423c6627e00fbc3f41d3f6be6ba1e15abb96fc.1604156731.git.frederic.pierret@qubes-os.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <68db059e-bc65-ee1a-ac3c-004b4552133a@suse.com>
Date: Tue, 3 Nov 2020 10:10:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <57423c6627e00fbc3f41d3f6be6ba1e15abb96fc.1604156731.git.frederic.pierret@qubes-os.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 31.10.2020 16:14, Frédéric Pierret (fepitre) wrote:
> --- a/tools/firmware/hvmloader/Makefile
> +++ b/tools/firmware/hvmloader/Makefile
> @@ -21,7 +21,11 @@ XEN_ROOT = $(CURDIR)/../../..
>  include $(XEN_ROOT)/tools/firmware/Rules.mk
>  
>  # SMBIOS spec requires format mm/dd/yyyy
> +ifneq ($(SOURCE_DATE_EPOCH),)
> +SMBIOS_REL_DATE ?= $(shell date -u -d "@$(SOURCE_DATE_EPOCH)" "+%m/%d/%Y" 2>/dev/null)
> +else
>  SMBIOS_REL_DATE ?= $(shell date +%m/%d/%Y)
> +endif

As this pattern recurs, how about abstracting it away via a
definition (perhaps to be placed in ./Config.mk) along the
lines of (variable name subject to improvement)

DATE_EPOCH_OPTS := $(if $(SOURCE_DATE_EPOCH),-u -d "@$(SOURCE_DATE_EPOCH)")

and then here simply

SMBIOS_REL_DATE ?= $(shell date $(DATE_EPOCH_OPTS) +%m/%d/%Y)

(i.e. in particular also without any "ifneq()")?

Jan

