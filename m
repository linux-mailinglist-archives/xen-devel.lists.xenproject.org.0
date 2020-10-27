Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9532C29AA41
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 12:07:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12795.33153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXMof-000406-Bw; Tue, 27 Oct 2020 11:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12795.33153; Tue, 27 Oct 2020 11:07:01 +0000
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
	id 1kXMof-0003zh-8k; Tue, 27 Oct 2020 11:07:01 +0000
Received: by outflank-mailman (input) for mailman id 12795;
 Tue, 27 Oct 2020 11:06:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXMod-0003zc-Lu
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 11:06:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a73f9991-0bcc-47ee-9c75-ebaf74384797;
 Tue, 27 Oct 2020 11:06:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 93E2BACA1;
 Tue, 27 Oct 2020 11:06:56 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aH5n=EC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXMod-0003zc-Lu
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 11:06:59 +0000
X-Inumbo-ID: a73f9991-0bcc-47ee-9c75-ebaf74384797
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a73f9991-0bcc-47ee-9c75-ebaf74384797;
	Tue, 27 Oct 2020 11:06:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603796816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O0vZw6E2rOMF4o+87GRNkEoLA4lfUr9gQhXHGUHdeYI=;
	b=Ji6bb8JUusQWqBIx/eSXOimBnC7S20LYf2EokjdqUzuQ3OYBtpT7QgX6DSGWGvfF0HdAkC
	bfvqPvE+LIz+oxtIVakZqzGeTxnGSTNJOthYQjwv1/tEOum5o/e0YerRsaa0evfYB3M7Vd
	kZ4sYg0BrtxCDzC2XFq4fvyuW1WA3pU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 93E2BACA1;
	Tue, 27 Oct 2020 11:06:56 +0000 (UTC)
Subject: Re: [PATCH v1] libacpi: use temporary files for generated files
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Olaf Hering <olaf@aepfle.de>
References: <20201026204151.23459-1-olaf@aepfle.de>
 <68312718-c8ad-040b-be45-192d2c91ba8f@suse.com>
 <20201027112703.24d55a50.olaf@aepfle.de>
 <bc7a5e73-af27-45ae-5d82-f53176cd43a9@suse.com>
 <24025dd2-2c61-7e92-a9b1-2433eea2e909@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3880bcbd-9281-10a5-7de5-f73bcf74557a@suse.com>
Date: Tue, 27 Oct 2020 12:06:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <24025dd2-2c61-7e92-a9b1-2433eea2e909@citrix.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.10.2020 11:57, Andrew Cooper wrote:
> On 27/10/2020 10:37, Jan Beulich wrote:
>> On 27.10.2020 11:27, Olaf Hering wrote:
>>> Am Tue, 27 Oct 2020 11:16:04 +0100
>>> schrieb Jan Beulich <jbeulich@suse.com>:
>>>
>>>> This pattern is used when a rule consists of multiple commands
>>>> having their output appended to one another's.
>>> My understanding is: a rule is satisfied as soon as the file exists.
>> No - once make has found that a rule's commands need running, it'll
>> run the full set and only check again afterwards.
> 
> It stops at the first command which fails.
> 
> Olaf is correct, but the problem here is an incremental build issue, not
> a parallel build issue.
> 
> Intermediate files must not use the name of the target, or a failure and
> re-build will use the (bogus) intermediate state rather than rebuilding it.

But there's no intermediate file here - the file gets created in one
go. Furthermore doesn't make delete the target file(s) when a rule
fails? (One may not want to rely on this, and hence indeed keep multi-
part rules update intermediate files of different names.)

Jan

