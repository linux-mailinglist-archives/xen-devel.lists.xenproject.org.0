Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E18A0C776DF
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 06:47:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168178.1494259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMJyq-00029T-Qy; Fri, 21 Nov 2025 05:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168178.1494259; Fri, 21 Nov 2025 05:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMJyq-00027r-Nv; Fri, 21 Nov 2025 05:46:48 +0000
Received: by outflank-mailman (input) for mailman id 1168178;
 Fri, 21 Nov 2025 05:46:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VODq=55=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1vMJyp-00027h-8q
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 05:46:47 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 763bd017-c69d-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 06:46:45 +0100 (CET)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-265-dw4h8ppxNGOwFwV5lUYlYA-1; Fri,
 21 Nov 2025 00:46:38 -0500
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DBBCD1956050; Fri, 21 Nov 2025 05:46:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.18])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DF8A430044DC; Fri, 21 Nov 2025 05:46:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6FAF521E6A27; Fri, 21 Nov 2025 06:46:28 +0100 (CET)
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
X-Inumbo-ID: 763bd017-c69d-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763704004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PL3yXLCkMFHCIh38uQXNnEtvLjSg5S3Sh+k5cm/3Mtg=;
	b=WW1LD/V/RH2jcYEKLedhau2+sqd4G03RPfiOJC3Fmbzz73T2NDqduqlIIEwo5Ib/oltYJZ
	wEcxOokDEV7HTSiv5/CBCOnr0Vv/0HXqAop8yF6Wa5A/zu4P0RpwT8LwwtV0OpDCwH8c+5
	Ywusifi1CLI+GJVAPGTVsxmFPN7vBNQ=
X-MC-Unique: dw4h8ppxNGOwFwV5lUYlYA-1
X-Mimecast-MFC-AGG-ID: dw4h8ppxNGOwFwV5lUYlYA_1763703994
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dave@treblig.org>
Cc: qemu-devel@nongnu.org,  arei.gonglei@huawei.com,
  pizhenwei@bytedance.com,  alistair.francis@wdc.com,
  stefanb@linux.vnet.ibm.com,  kwolf@redhat.com,  hreitz@redhat.com,
  sw@weilnetz.de,  qemu_oss@crudebyte.com,  groug@kaod.org,
  mst@redhat.com,  imammedo@redhat.com,  anisinha@redhat.com,
  kraxel@redhat.com,  shentey@gmail.com,  npiggin@gmail.com,
  harshpb@linux.ibm.com,  sstabellini@kernel.org,  anthony@xenproject.org,
  paul@xen.org,  edgar.iglesias@gmail.com,  elena.ufimtseva@oracle.com,
  jag.raman@oracle.com,  sgarzare@redhat.com,  pbonzini@redhat.com,
  fam@euphon.net,  philmd@linaro.org,  alex@shazbot.org,  clg@redhat.com,
  peterx@redhat.com,  farosas@suse.de,  lizhijian@fujitsu.com,
  jasowang@redhat.com,  samuel.thibault@ens-lyon.org,
  michael.roth@amd.com,  kkostiuk@redhat.com,  zhao1.liu@intel.com,
  mtosatti@redhat.com,  rathc@linux.ibm.com,  palmer@dabbelt.com,
  liwei1518@gmail.com,  dbarboza@ventanamicro.com,
  zhiwei_liu@linux.alibaba.com,  marcandre.lureau@redhat.com,
  qemu-block@nongnu.org,  qemu-ppc@nongnu.org,
  xen-devel@lists.xenproject.org,  kvm@vger.kernel.org,
  qemu-riscv@nongnu.org
Subject: Re: [PATCH 11/14] error: Use error_setg_errno() to improve error
 messages
In-Reply-To: <aR-t5SzR2AdqlJtq@gallifrey> (David Alan Gilbert's message of
	"Fri, 21 Nov 2025 00:10:13 +0000")
References: <20251120191339.756429-1-armbru@redhat.com>
	<20251120191339.756429-12-armbru@redhat.com>
	<aR-t5SzR2AdqlJtq@gallifrey>
Date: Fri, 21 Nov 2025 06:46:28 +0100
Message-ID: <87o6owq6ob.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

"Dr. David Alan Gilbert" <dave@treblig.org> writes:

> * Markus Armbruster (armbru@redhat.com) wrote:
>> A few error messages show numeric errno codes.  Use error_setg_errno()
>> to show human-readable text instead.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> ...
>
>> diff --git a/migration/rdma.c b/migration/rdma.c
>> index 337b415889..ef4885ef5f 100644
>> --- a/migration/rdma.c
>> +++ b/migration/rdma.c
>> @@ -2349,8 +2349,7 @@ static int qemu_get_cm_event_timeout(RDMAContext *rdma,
>>          error_setg(errp, "RDMA ERROR: poll cm event timeout");
>>          return -1;
>>      } else if (ret < 0) {
>> -        error_setg(errp, "RDMA ERROR: failed to poll cm event, errno=%i",
>> -                   errno);
>> +        error_setg_errno(errp, "RDMA ERROR: failed to poll cm event");
>
> Hasn't that lost the errno ?

Yes.  My build tree must have lost the ability to compile this file.  I
need to fix that.

Thanks!


