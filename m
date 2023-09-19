Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA827A5975
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 07:40:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604338.941650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiTTJ-0002Zr-AG; Tue, 19 Sep 2023 05:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604338.941650; Tue, 19 Sep 2023 05:40:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiTTJ-0002X0-7A; Tue, 19 Sep 2023 05:40:29 +0000
Received: by outflank-mailman (input) for mailman id 604338;
 Tue, 19 Sep 2023 05:40:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L0bg=FD=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1qiTTH-0002WC-Hw
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 05:40:27 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07f3d513-56af-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 07:40:25 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-vA5vnuYKMPGzn5wULdrNyg-1; Tue, 19 Sep 2023 01:40:20 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06EC1185A79B;
 Tue, 19 Sep 2023 05:40:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9ECB2140E950;
 Tue, 19 Sep 2023 05:40:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8BE0821E6900; Tue, 19 Sep 2023 07:40:18 +0200 (CEST)
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
X-Inumbo-ID: 07f3d513-56af-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695102024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eCtoW5YmugRAOgCVYwI8LazpWJuSKfz0/Y0RnlW+RR8=;
	b=QqmIHdaTOR7CpBCeidedeeHXCkayzW3F0FfUOKKwfSKxYySukDxYQu6K033g3Jx1oexMm/
	/VIyS9GRdX/8abLCy5dzghVIfR//oCPSz2j7m0Qn8+8EEFy9bwH+G8uiyna1XG7P2HAqUv
	eooFxoQ3OqTwN1zH1wlNf07fueHuu1U=
X-MC-Unique: vA5vnuYKMPGzn5wULdrNyg-1
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org,  kwolf@redhat.com,  hreitz@redhat.com,
  vsementsov@yandex-team.ru,  jsnow@redhat.com,  idryomov@gmail.com,
  pl@kamp.de,  sw@weilnetz.de,  sstabellini@kernel.org,
  anthony.perard@citrix.com,  paul@xen.org,  pbonzini@redhat.com,
  marcandre.lureau@redhat.com,  berrange@redhat.com,  thuth@redhat.com,
  philmd@linaro.org,  stefanha@redhat.com,  fam@euphon.net,
  quintela@redhat.com,  peterx@redhat.com,  leobras@redhat.com,
  kraxel@redhat.com,  qemu-block@nongnu.org,
  xen-devel@lists.xenproject.org,  alex.bennee@linaro.org,
  peter.maydell@linaro.org
Subject: Re: [PATCH 1/7] migration/rdma: Fix save_page method to fail on
 polling error
References: <20230831132546.3525721-1-armbru@redhat.com>
	<20230831132546.3525721-2-armbru@redhat.com>
	<npnhurzixjae6schhran3dnicpwozrhkaan5sxcf3gyxviam5y@ofklh25a6wlc>
Date: Tue, 19 Sep 2023 07:40:18 +0200
In-Reply-To: <npnhurzixjae6schhran3dnicpwozrhkaan5sxcf3gyxviam5y@ofklh25a6wlc>
	(Eric Blake's message of "Thu, 31 Aug 2023 08:38:09 -0500")
Message-ID: <87a5ti4t6l.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7

Eric Blake <eblake@redhat.com> writes:

> On Thu, Aug 31, 2023 at 03:25:40PM +0200, Markus Armbruster wrote:
>> qemu_rdma_save_page() reports polling error with error_report(), then
>> succeeds anyway.  This is because the variable holding the polling
>> status *shadows* the variable the function returns.  The latter
>> remains zero.
>> 
>> Broken since day one, and duplicated more recently.
>> 
>> Fixes: 2da776db4846 (rdma: core logic)
>> Fixes: b390afd8c50b (migration/rdma: Fix out of order wrid)
>
> Alas, the curse of immutable git history preserving typos in commit
> subjects ;)

"wrid" is short for "work request ID", actually.

>             The alternative of rewriting history and breaking SHA
> references is worse.

Rewriting master is a big no-no.

git-note can be used to correct the record, but it has its usability
issues.

>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  migration/rdma.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!


