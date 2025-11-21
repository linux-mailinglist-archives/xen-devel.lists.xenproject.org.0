Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8196CC777D1
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 06:59:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168194.1494270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMKAY-00043g-Ue; Fri, 21 Nov 2025 05:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168194.1494270; Fri, 21 Nov 2025 05:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMKAY-00041A-Rn; Fri, 21 Nov 2025 05:58:54 +0000
Received: by outflank-mailman (input) for mailman id 1168194;
 Fri, 21 Nov 2025 05:58:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VODq=55=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1vMKAX-000414-Tj
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 05:58:53 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 257009b1-c69f-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 06:58:48 +0100 (CET)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-540-gnVpiT2lMau2bDq3UAQfEg-1; Fri,
 21 Nov 2025 00:58:43 -0500
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1718F180057A; Fri, 21 Nov 2025 05:58:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.3])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F30B218004A3; Fri, 21 Nov 2025 05:58:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9FDDF21E6A27; Fri, 21 Nov 2025 06:58:33 +0100 (CET)
Resent-To: michael.roth@amd.com, qemu_oss@crudebyte.com, palmer@dabbelt.com,
 samuel.thibault@ens-lyon.org, fam@euphon.net, lizhijian@fujitsu.com,
 edgar.iglesias@gmail.com, liwei1518@gmail.com, npiggin@gmail.com,
 shentey@gmail.com, arei.gonglei@huawei.com, zhao1.liu@intel.com,
 groug@kaod.org, sstabellini@kernel.org, philmd@linaro.org,
 zhiwei_liu@linux.alibaba.com, harshpb@linux.ibm.com, rathc@linux.ibm.com,
 stefanb@linux.vnet.ibm.com, xen-devel@lists.xenproject.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, elena.ufimtseva@oracle.com, jag.raman@oracle.com,
 alex@shazbot.org, farosas@suse.de, dave@treblig.org,
 dbarboza@ventanamicro.com, kvm@vger.kernel.org, alistair.francis@wdc.com,
 sw@weilnetz.de, paul@xen.org, anthony@xenproject.org
Resent-From: Markus Armbruster <armbru@redhat.com>
Resent-Date: Fri, 21 Nov 2025 06:58:33 +0100
Resent-Message-ID: <87wm3korjq.fsf@pond.sub.org>
Received: from imap.gmail.com ([2a00:1450:400c:c07::6d]:993) by
 dusky.pond.sub.org with IMAP4-SSL getmail6 msgid:11/376136; 21 Nov 2025
 05:55:24 -0000
Received: from blackfin.pond.sub.org
 (p200300d36f125200d4b07119e720e6da.dip0.t-ipconnect.de.
 [2003:d3:6f12:5200:d4b0:7119:e720:e6da])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fd8e54sm9034202f8f.40.2025.11.20.21.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Nov 2025 21:47:19 -0800 (PST)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E659421E6A27; Fri, 21 Nov 2025 06:47:18 +0100 (CET)
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
X-Inumbo-ID: 257009b1-c69f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763704727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 resent-to:resent-from:resent-message-id:in-reply-to:in-reply-to:
	 references:references; bh=KxWPyWlvO0rezo2o1B/UY81NZvVMPhvZc/dOplcdSKY=;
	b=LI8cRzPH4HkOKLEuPSmJDPH6LDRrbHHgwdmPK8fgmIkENwWmHsZaIRekCBnKAYeQK+Sm6D
	5o7NZfzTkjwqkK94etFZo11e9u4w2RVXMCwOexcFpyi9EUjRKGJoFwP+mwgjQWfLmviOxa
	8JTB073GCrNjeV+CJYjMZEDZER3fnPM=
X-MC-Unique: gnVpiT2lMau2bDq3UAQfEg-1
X-Mimecast-MFC-AGG-ID: gnVpiT2lMau2bDq3UAQfEg_1763704719
X-From-Line: armbru@redhat.com Fri Nov 21 06:55:24 2025
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
Subject: Re: [PATCH 12/14] error: Use error_setg_errno() for simplicity and
 consistency
In-Reply-To: <aR-vExiomEe9jUNN@gallifrey> (David Alan Gilbert's message of
	"Fri, 21 Nov 2025 00:15:15 +0000")
References: <20251120191339.756429-1-armbru@redhat.com>
	<20251120191339.756429-13-armbru@redhat.com>
	<aR-vExiomEe9jUNN@gallifrey>
Date: Fri, 21 Nov 2025 06:47:18 +0100
Message-ID: <87jyzkq6mx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-getmail-retrieved-from-mailbox: [Gmail]/All Mail
X-GMAIL-LABELS: "\\Sent"
X-GMAIL-THRID: 1849337867389441729
X-GMAIL-MSGID: 1849377727029175239
Lines: 45
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

"Dr. David Alan Gilbert" <dave@treblig.org> writes:

> * Markus Armbruster (armbru@redhat.com) wrote:
>> Use error_setg_errno() instead of passing the value of strerror() or
>> g_strerror() to error_setg().
>> 
>> The separator between the error message proper and the value of
>> strerror() changes from " : ", "", " - ", "- " to ": " in places.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
>> @@ -792,9 +792,9 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
>>                             VFU_REGION_FLAG_RW | VFU_REGION_FLAG_ALWAYS_CB,
>>                             NULL, 0, -1, 0);
>>      if (ret < 0) {
>> -        error_setg(errp,
>> -                   "vfu: Failed to setup config space handlers for %s- %s",
>> -                   o->device, strerror(errno));
>> +        error_setg_errno(errp,
>> +                         "vfu: Failed to setup config space handlers for %s",
>> +                         o->device);
>
> missing errno.

Yes.

>>          goto fail;
>>      }
>>  
>> @@ -822,8 +822,8 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
>>  
>>      ret = vfu_realize_ctx(o->vfu_ctx);
>>      if (ret < 0) {
>> -        error_setg(errp, "vfu: Failed to realize device %s- %s",
>> -                   o->device, strerror(errno));
>> +        error_setg_errno(errp, "vfu: Failed to realize device %s",
>> +                         o->device);
>
> missing errno.

Yes.  Another file my build tree doesn't compile anymore.  Will fix,
thanks!

[...]


