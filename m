Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C035FC70BDA
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 20:12:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166314.1492877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLnaF-0006ou-HZ; Wed, 19 Nov 2025 19:11:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166314.1492877; Wed, 19 Nov 2025 19:11:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLnaF-0006nQ-Ev; Wed, 19 Nov 2025 19:11:15 +0000
Received: by outflank-mailman (input) for mailman id 1166314;
 Wed, 19 Nov 2025 19:11:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aBqX=53=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1vLnaE-0006nK-JS
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 19:11:14 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e4c1206-c57b-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 20:11:04 +0100 (CET)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-111-yNpZLchdNUuuTavbCUxFWQ-1; Wed,
 19 Nov 2025 14:10:59 -0500
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 96A13195608F; Wed, 19 Nov 2025 19:10:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.18])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9B530180047F; Wed, 19 Nov 2025 19:10:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E69F421E6A27; Wed, 19 Nov 2025 20:10:49 +0100 (CET)
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
X-Inumbo-ID: 7e4c1206-c57b-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763579463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wt/fub6z3HxiVa5B4/hE5RzRQKQVhOj7h1C0uZV+h1o=;
	b=fMShJisjfib4WijbCPZ7VXxKyPY5XaEQR/g2zxX9htbFCBmBLtph0cmuv49g2W6+j8vHXW
	ht3YpMYQ6Hy/AA+4BhaSjnvvXLX8A/Phv+Oog3RAIRlEVcCOKNWRxjQhiO7ZFQcHHgR2F9
	8eq0OpQ/XHM917cj9ODBdzLBVUMpV0Q=
X-MC-Unique: yNpZLchdNUuuTavbCUxFWQ-1
X-Mimecast-MFC-AGG-ID: yNpZLchdNUuuTavbCUxFWQ_1763579455
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  kwolf@redhat.com,  hreitz@redhat.com,
  mst@redhat.com,  imammedo@redhat.com,  anisinha@redhat.com,
  gengdongjiu1@gmail.com,  peter.maydell@linaro.org,
  alistair@alistair23.me,  edgar.iglesias@gmail.com,  npiggin@gmail.com,
  harshpb@linux.ibm.com,  palmer@dabbelt.com,  liwei1518@gmail.com,
  dbarboza@ventanamicro.com,  zhiwei_liu@linux.alibaba.com,
  sstabellini@kernel.org,  anthony@xenproject.org,  paul@xen.org,
  berrange@redhat.com,  peterx@redhat.com,  farosas@suse.de,
  eblake@redhat.com,  eduardo@habkost.net,  marcel.apfelbaum@gmail.com,
  philmd@linaro.org,  wangyanan55@huawei.com,  zhao1.liu@intel.com,
  qemu-block@nongnu.org,  qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,
  qemu-riscv@nongnu.org,  xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/5] hw/nvram/xlnx-bbram: More idiomatic and simpler
 error reporting
In-Reply-To: <a36f938d-b35a-4605-ab77-6ed7dd419945@yandex-team.ru> (Vladimir
	Sementsov-Ogievskiy's message of "Wed, 19 Nov 2025 19:39:14 +0300")
References: <20251119130855.105479-1-armbru@redhat.com>
	<20251119130855.105479-3-armbru@redhat.com>
	<a36f938d-b35a-4605-ab77-6ed7dd419945@yandex-team.ru>
Date: Wed, 19 Nov 2025 20:10:49 +0100
Message-ID: <87a50hx2h2.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> writes:

> On 19.11.25 16:08, Markus Armbruster wrote:
>> bbram_bdrv_error() interpolates a "detail" string into a template with
>> error_setg_errno(), then reports the result with error_report().
>> Produces error messages with an unwanted '.':
>>
>>      BLK-NAME: BBRAM backstore DETAIL failed.: STERROR
>>
>> Replace both calls of bbram_bdrv_error() by straightforward
>> error_report(), and drop the function.  This is less code, easier to
>> read, and the error message is more greppable.
>>
>> Also delete the unwanted '.'.
>
> Also, using "errp" name for local "Error *" (one star) variable is a bit misleading.

True.  I don't mention it, because I delete the variable.

My search for misleading uses of @errp led me here.

>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Thanks!


