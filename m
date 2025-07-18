Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE379B09B0F
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 08:00:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047977.1418294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uce8k-0002SU-Vz; Fri, 18 Jul 2025 06:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047977.1418294; Fri, 18 Jul 2025 06:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uce8k-0002R3-Sq; Fri, 18 Jul 2025 06:00:14 +0000
Received: by outflank-mailman (input) for mailman id 1047977;
 Fri, 18 Jul 2025 06:00:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BvrW=Z7=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1uce8X-0001Qr-SC
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 06:00:01 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fd2f499-639c-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 07:59:59 +0200 (CEST)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-164-grsRW010NZSypg8DjlPwxA-1; Fri,
 18 Jul 2025 01:59:54 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5C4961800282; Fri, 18 Jul 2025 05:59:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.6])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A55DB196664F; Fri, 18 Jul 2025 05:59:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1BEF021E6A27; Fri, 18 Jul 2025 07:59:50 +0200 (CEST)
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
X-Inumbo-ID: 6fd2f499-639c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752818398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/mEqaLDr/H+9nu0IwwfKNIFjiN3TR7SoKZq7aIz8ozc=;
	b=MvD998ssyelIQKFXLN7HxeNCtxfOzz6zOJNdcXqU4U329EhDU2RHG9bMzNCmaDXP7cnQOh
	rhlg9N0yFFHFP47gNKrxODfbYuwlzIn2D8LAVUshXkLltqZQ2csQg1bHsfV7Mc8ia44xEU
	Ik1HXJe9SxGi3aY1hwkEIgReHK53FvM=
X-MC-Unique: grsRW010NZSypg8DjlPwxA-1
X-Mimecast-MFC-AGG-ID: grsRW010NZSypg8DjlPwxA_1752818393
From: Markus Armbruster <armbru@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Adam Williamson <awilliam@redhat.com>,  qemu-devel@nongnu.org,  Paul
 Durrant <paul@xen.org>,  xen-devel@lists.xenproject.org,  Stefano
 Stabellini <sstabellini@kernel.org>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Anthony PERARD <anthony@xenproject.org>
Subject: Re: [PATCH] xen/passthrough: add missing error-report include
In-Reply-To: <87v7nqgk21.fsf@pond.sub.org> (Markus Armbruster's message of
	"Fri, 18 Jul 2025 07:11:18 +0200")
References: <20250717220207.171040-1-awilliam@redhat.com>
	<87v7nqgk21.fsf@pond.sub.org>
Date: Fri, 18 Jul 2025 07:59:50 +0200
Message-ID: <87ikjqght5.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Markus Armbruster <armbru@redhat.com> writes:

> Adam Williamson <awilliam@redhat.com> writes:
>
>> In cfcacba an `error_report` was added to this file, but the
>> corresponding include of `qemu/error-report.h` was missed. This
>> only becomes apparent when building against Xen 4.20+.
>>
>> Signed-off-by: Adam Williamson <awilliam@redhat.com>
>> ---
>>  hw/xen/xen_pt.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
>> index 9d16644d82..006b5b55f2 100644
>> --- a/hw/xen/xen_pt.c
>> +++ b/hw/xen/xen_pt.c
>> @@ -54,6 +54,7 @@
>>  
>>  #include "qemu/osdep.h"
>>  #include "qapi/error.h"
>> +#include "qemu/error-report.h"
>>  #include <sys/ioctl.h>
>>  
>>  #include "hw/pci/pci.h"
>
> Uh, error-report.h is included without this for me.  To see, build with
> -H:
>
> . /work/armbru/qemu/hw/xen/xen_pt.h
> .. /work/armbru/qemu/include/hw/xen/xen_native.h
> ... /work/armbru/qemu/hw/xen/trace.h
> .... ./trace/trace-hw_xen.h
> ..... /work/armbru/qemu/include/qemu/error-report.h

Just remembered: the generated trace header includes error-report.h only
when trace's log backend is enabled.

Suggested commit message:

  In commit cfcacba an `error_report` was added to this file, but the
  corresponding include of `qemu/error-report.h` was missed. This
  only becomes apparent when building against Xen 4.20+ with trace
  backend log disabled.

  Fixes: cfcacbab38e4 (xen/passthrough: use gsi to map pirq when dom0 is PVH)

With something like that
Reviewed-by: Markus Armbruster <armbru@redhat.com>

> Code smell: header in include/... includes header from hw/.  Not this
> patch's concern.


