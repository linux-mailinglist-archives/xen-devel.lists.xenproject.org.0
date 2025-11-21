Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E57C77B6D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 08:37:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168220.1494289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLiA-0000MG-1F; Fri, 21 Nov 2025 07:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168220.1494289; Fri, 21 Nov 2025 07:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLi9-0000KK-Uv; Fri, 21 Nov 2025 07:37:41 +0000
Received: by outflank-mailman (input) for mailman id 1168220;
 Fri, 21 Nov 2025 07:37:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VODq=55=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1vMLi8-0000KE-GG
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 07:37:40 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3f0d521-c6ac-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 08:37:38 +0100 (CET)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-145-4S8p1gJgOD2z9prdQBzToA-1; Fri,
 21 Nov 2025 02:37:32 -0500
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A617B1956061; Fri, 21 Nov 2025 07:37:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.3])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 23A9E1800877; Fri, 21 Nov 2025 07:37:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ADAC221E6A27; Fri, 21 Nov 2025 08:37:21 +0100 (CET)
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
X-Inumbo-ID: f3f0d521-c6ac-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763710657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=igDlYyRnPCE7UGrSaq2pRsy2AoYFeSBXmKnGZzjhM+c=;
	b=T/7e/eEoH6tK6Z6PkSNQOrFuKDSOUOWK05pa2NnadVYhMyvmB9x4c455isesYBscibvHeS
	jc52ZOeU39Rt8sFzel/M2NCGK9VOL3CMSD8aOD9YbmIuyaQ6kKDjejKOL8+azH6soNwblv
	U672nkQO1mSd01eygoNRMVPozJaQMX4=
X-MC-Unique: 4S8p1gJgOD2z9prdQBzToA-1
X-Mimecast-MFC-AGG-ID: 4S8p1gJgOD2z9prdQBzToA_1763710648
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
In-Reply-To: <87o6owq6ob.fsf@pond.sub.org> (Markus Armbruster's message of
	"Fri, 21 Nov 2025 06:46:28 +0100")
References: <20251120191339.756429-1-armbru@redhat.com>
	<20251120191339.756429-12-armbru@redhat.com>
	<aR-t5SzR2AdqlJtq@gallifrey> <87o6owq6ob.fsf@pond.sub.org>
Date: Fri, 21 Nov 2025 08:37:21 +0100
Message-ID: <87a50fq1ji.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Markus Armbruster <armbru@redhat.com> writes:

> "Dr. David Alan Gilbert" <dave@treblig.org> writes:
>
>> * Markus Armbruster (armbru@redhat.com) wrote:
>>> A few error messages show numeric errno codes.  Use error_setg_errno()
>>> to show human-readable text instead.
>>> 
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>
>> ...
>>
>>> diff --git a/migration/rdma.c b/migration/rdma.c
>>> index 337b415889..ef4885ef5f 100644
>>> --- a/migration/rdma.c
>>> +++ b/migration/rdma.c
>>> @@ -2349,8 +2349,7 @@ static int qemu_get_cm_event_timeout(RDMAContext *rdma,
>>>          error_setg(errp, "RDMA ERROR: poll cm event timeout");
>>>          return -1;
>>>      } else if (ret < 0) {
>>> -        error_setg(errp, "RDMA ERROR: failed to poll cm event, errno=%i",
>>> -                   errno);
>>> +        error_setg_errno(errp, "RDMA ERROR: failed to poll cm event");
>>
>> Hasn't that lost the errno ?
>
> Yes.  My build tree must have lost the ability to compile this file.  I
> need to fix that.

Actually a patch splitting accident.  Fixed.

[...]


