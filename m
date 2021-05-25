Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC9238FFD5
	for <lists+xen-devel@lfdr.de>; Tue, 25 May 2021 13:14:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132166.246634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llV0a-0001uM-O4; Tue, 25 May 2021 11:14:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132166.246634; Tue, 25 May 2021 11:14:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llV0a-0001sT-Kk; Tue, 25 May 2021 11:14:00 +0000
Received: by outflank-mailman (input) for mailman id 132166;
 Tue, 25 May 2021 11:13:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1llV0Z-0001sN-8i
 for xen-devel@lists.xenproject.org; Tue, 25 May 2021 11:13:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 78aa0667-91da-408f-a020-b12d293453ee;
 Tue, 25 May 2021 11:13:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 606F4AEA6;
 Tue, 25 May 2021 11:13:57 +0000 (UTC)
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
X-Inumbo-ID: 78aa0667-91da-408f-a020-b12d293453ee
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621941237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rv207fLaLWRJKi9gCOwrDZlK6sibJ4OFHXI9bbsEKFQ=;
	b=S37P6LAf0YxBNH5mUXNJEGRt3kEYs2VbCzq4W72pj6cny2HFdgC4X2/0N0m8QYHjsuvYCt
	t/BvAu1gTanJJDbmrvl9ts9JMUgme9Duu0kgPJBkkfVkzb7xJiRdV9fplTEazS0UIleagF
	wMUj6zM5Cph6InvMSo80pqyqAG4QMqU=
From: Jan Beulich <jbeulich@suse.com>
Subject: =?UTF-8?Q?Ping=c2=b2=3a_=5bPATCH=5d_x86=3a_fix_build_race_when_gene?=
 =?UTF-8?Q?rating_temporary_object_files_=28take_2=29?=
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c35ad629-0dea-688a-199d-895186aeffb2@suse.com>
Message-ID: <9c132221-74ba-8f18-3c89-3fbbdb3c58b5@suse.com>
Date: Tue, 25 May 2021 13:13:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <c35ad629-0dea-688a-199d-895186aeffb2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.04.2021 11:54, Jan Beulich wrote:
> The original commit wasn't quite sufficient: Emptying DEPS is helpful
> only when nothing will get added to it subsequently. xen/Rules.mk will,
> after including the local Makefile, amend DEPS by dependencies for
> objects living in sub-directories though. For the purpose of suppressing
> dependencies of the makefiles on the .*.d2 files (and thus to avoid
> their re-generation) it is, however, not necessary at all to play with
> DEPS. Instead we can override DEPS_INCLUDE (which generally is a late-
> expansion variable).
> 
> Fixes: 761bb575ce97 ("x86: fix build race when generating temporary object files")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Ping (again)? I'll give it till Wednesday, and if I don't hear back,
I'll commit without any acks.

Ian, I'm also including you here because iirc the .*.d2 thing was an
invention of yours, so you may have an opinion.

Jan

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -314,5 +314,5 @@ clean::
>  # Suppress loading of DEPS files for internal, temporary target files.  This
>  # then also suppresses re-generation of the respective .*.d2 files.
>  ifeq ($(filter-out .xen%.o,$(notdir $(MAKECMDGOALS))),)
> -DEPS:=
> +DEPS_INCLUDE:=
>  endif
> 


