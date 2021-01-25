Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9C1302510
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 13:45:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74070.133123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l41F7-0004nT-Vk; Mon, 25 Jan 2021 12:45:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74070.133123; Mon, 25 Jan 2021 12:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l41F7-0004n4-SK; Mon, 25 Jan 2021 12:45:17 +0000
Received: by outflank-mailman (input) for mailman id 74070;
 Mon, 25 Jan 2021 12:45:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l41F6-0004mz-Ql
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 12:45:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc4b30da-0d03-4186-9967-7dcb48933421;
 Mon, 25 Jan 2021 12:45:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E4C1CB2D1;
 Mon, 25 Jan 2021 12:45:14 +0000 (UTC)
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
X-Inumbo-ID: dc4b30da-0d03-4186-9967-7dcb48933421
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611578715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TJUCC5XhTSbGIH256MmJn8Yx7ZgMKHL96MhxGnRIaLo=;
	b=ZF2hbPEP+h/J97vqiEyvG1mP1wS1i6ARHPiRAbBKfbC3bFTeL4P5ECMkCzKabY5f0ZX43O
	zKq+N+n4d7qlp0xOkzPN6u1KzLcfTPWo4sVLOlteU0mgwAjHebh8IQxl9z5Oa/bFh6mJfH
	n/pB920rIagesAmDxSkb8+sa16T7YCE=
Subject: Re: [PATCH v2 3/5] libxenguest: "standardize" LZO kernel
 decompression code
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <aab9e3e6-5125-6b0a-6cd4-960fd783b1b2@suse.com>
 <4fb01879-4b9c-e711-ecd0-39b0e4d50878@suse.com>
 <20210121150233.elijzzfud3cftrjm@liuwe-devbox-debian-v2>
 <24590.45734.945505.310666@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <95a3532c-20b3-1e9d-a316-7b20b8473622@suse.com>
Date: Mon, 25 Jan 2021 13:45:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <24590.45734.945505.310666@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.01.2021 12:59, Ian Jackson wrote:
> Wei Liu writes ("Re: [PATCH v2 3/5] libxenguest: "standardize" LZO kernel decompression code"):
>> On Tue, Jan 19, 2021 at 04:16:35PM +0100, Jan Beulich wrote:
>>> Add a DOMPRINTF() other methods have, indicating success. To facilitate
>>> this, introduce an "outsize" local variable and update *size as well as
>>> *blob only once done. The latter then also avoids leaving a pointer to
>>> freed memory in dom->kernel_blob in case of a decompression error.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Acked-by: Wei Liu <wl@xen.org>
> 
> The latter part of this is a bugfix which ought to go into 4.15, I
> think, and be backported.
> 
> I don't mind throwing in the DOMPRINTF too.

Am I fine to transliterate this into R-a-b?

Jan

