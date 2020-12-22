Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCEC2E06E0
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 08:43:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57654.100955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krcK1-0002nH-B6; Tue, 22 Dec 2020 07:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57654.100955; Tue, 22 Dec 2020 07:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krcK1-0002ms-7S; Tue, 22 Dec 2020 07:43:05 +0000
Received: by outflank-mailman (input) for mailman id 57654;
 Tue, 22 Dec 2020 07:43:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9/vU=F2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krcK0-0002mn-5b
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 07:43:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43cda4db-44d2-4cb0-9aef-07c158ec9da8;
 Tue, 22 Dec 2020 07:42:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ABB3EB254;
 Tue, 22 Dec 2020 07:42:57 +0000 (UTC)
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
X-Inumbo-ID: 43cda4db-44d2-4cb0-9aef-07c158ec9da8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608622977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h4SDJ1hDwltEadftpbcQCThLndQ9yZCoKfWzK7gYyII=;
	b=te9RXrPhO3dr8DWke3ttBIXSoHIF6i3AtylaxPwTC8Az04wGZvdaiI635fgT5a17iqBiQF
	9r6zl5AN+HwPCu1un+anRobRYcWxpbWZp3AnT3vUsLjHs6HXULt7s/epyklbJeMSYa8n0o
	frtm4nSTsP58hIwrWFCqRB3TEpIcH0c=
Subject: Re: [PATCH] lib: drop debug_build()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <143333c9-154b-77c3-a66a-6b81696ecded@suse.com>
 <2575d75a-ce1d-c725-4f37-b7c9c10a2ecd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <266f673e-0158-13fe-9ea7-69a3c5dc2903@suse.com>
Date: Tue, 22 Dec 2020 08:42:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <2575d75a-ce1d-c725-4f37-b7c9c10a2ecd@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.12.2020 19:07, Andrew Cooper wrote:
> On 21/12/2020 16:50, Jan Beulich wrote:
>> Its expansion shouldn't be tied to NDEBUG - down the road we may want to
>> allow enabling assertions independently of CONFIG_DEBUG.
> 
> I'm not sure I agree that we'll ever want to do this, but...

Didn't you once say XenServer keeps (or kept) assertions enabled
even in release builds? In any event, having such an option may
e.g. help diagnose issues from mis-optimization (no matter
whether because of mis-compilation or because of subtly broken
sources).

>>  Replace the few uses by IS_ENABLED(CONFIG_DEBUG).
> 
> ... we should be aligning on CONFIG_DEBUG.
> 
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I wonder whether we shouldn't further abstract this into, say, a
>> xen_build_info() helper, seeing that all use sites want "debug=[yn]".
>> This could then also include gcov_string right away.
> 
> I think that would be a nicer way of doing it.  It should probably also
> have some trace of CONFIG_UBSAN in the resulting string.

Okay, will do.

Jan

