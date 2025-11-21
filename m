Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5089C775F6
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 06:29:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168143.1494230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMJhO-0006nP-1L; Fri, 21 Nov 2025 05:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168143.1494230; Fri, 21 Nov 2025 05:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMJhN-0006ko-V2; Fri, 21 Nov 2025 05:28:45 +0000
Received: by outflank-mailman (input) for mailman id 1168143;
 Fri, 21 Nov 2025 05:28:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VODq=55=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1vMJhM-0006ki-AY
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 05:28:44 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea4f7eb9-c69a-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 06:28:31 +0100 (CET)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-387-m_eSFKIbNuOvbL9nfv2Tzg-1; Fri,
 21 Nov 2025 00:28:26 -0500
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5C049180049F; Fri, 21 Nov 2025 05:28:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.18])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 58D431940E82; Fri, 21 Nov 2025 05:28:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DF74721E6A27; Fri, 21 Nov 2025 06:28:14 +0100 (CET)
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
X-Inumbo-ID: ea4f7eb9-c69a-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763702910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BEd9KlDvB7GskRmSaCjimoNXVvT4vORaDdSrmiFotWU=;
	b=M4F3qqlqt1BYZrpWb+2tq0StDy4E1jqayehDr5lTVhVt8OUcjzlLU5j9+neKyRGfWsijEG
	8CQHEo8HdRSR6wXb+dI/nTIeRLJh4iR5bkAsPr1dxSIR8aHgKKbKOkfHEzI0fI55YP/CJX
	s2GSw8nwSWXPxFreNtlBB2GkXuCrMUU=
X-MC-Unique: m_eSFKIbNuOvbL9nfv2Tzg-1
X-Mimecast-MFC-AGG-ID: m_eSFKIbNuOvbL9nfv2Tzg_1763702902
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dave@treblig.org>
Cc: qemu-devel@nongnu.org,  arei.gonglei@huawei.com,
  alistair.francis@wdc.com,  stefanb@linux.vnet.ibm.com,  kwolf@redhat.com,
  hreitz@redhat.com,  sw@weilnetz.de,  qemu_oss@crudebyte.com,
  groug@kaod.org,  mst@redhat.com,  imammedo@redhat.com,
  anisinha@redhat.com,  kraxel@redhat.com,  shentey@gmail.com,
  npiggin@gmail.com,  harshpb@linux.ibm.com,  sstabellini@kernel.org,
  anthony@xenproject.org,  paul@xen.org,  edgar.iglesias@gmail.com,
  elena.ufimtseva@oracle.com,  jag.raman@oracle.com,  sgarzare@redhat.com,
  pbonzini@redhat.com,  fam@euphon.net,  philmd@linaro.org,
  alex@shazbot.org,  clg@redhat.com,  peterx@redhat.com,  farosas@suse.de,
  lizhijian@fujitsu.com,  jasowang@redhat.com,
  samuel.thibault@ens-lyon.org,  michael.roth@amd.com,
  kkostiuk@redhat.com,  zhao1.liu@intel.com,  mtosatti@redhat.com,
  rathc@linux.ibm.com,  palmer@dabbelt.com,  liwei1518@gmail.com,
  dbarboza@ventanamicro.com,  zhiwei_liu@linux.alibaba.com,
  marcandre.lureau@redhat.com,  qemu-block@nongnu.org,
  qemu-ppc@nongnu.org,  xen-devel@lists.xenproject.org,
  kvm@vger.kernel.org,  qemu-riscv@nongnu.org
Subject: Re: [PATCH 02/14] hw/usb: Use error_setg_file_open() for a better
 error message
In-Reply-To: <aR-1jGX4Ck0f69zG@gallifrey> (David Alan Gilbert's message of
	"Fri, 21 Nov 2025 00:42:52 +0000")
References: <20251120191339.756429-1-armbru@redhat.com>
	<20251120191339.756429-3-armbru@redhat.com>
	<aR-1jGX4Ck0f69zG@gallifrey>
Date: Fri, 21 Nov 2025 06:28:14 +0100
Message-ID: <873468rm35.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

"Dr. David Alan Gilbert" <dave@treblig.org> writes:

> * Markus Armbruster (armbru@redhat.com) wrote:
>> The error message changes from
>> 
>>     open FILENAME failed
>> 
>> to
>> 
>>     Could not open 'FILENAME': REASON
>> 
>> where REASON is the value of strerror(errno).
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  hw/usb/bus.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/hw/usb/bus.c b/hw/usb/bus.c
>> index 8dd2ce415e..47d42ca3c1 100644
>> --- a/hw/usb/bus.c
>> +++ b/hw/usb/bus.c
>> @@ -262,7 +262,7 @@ static void usb_qdev_realize(DeviceState *qdev, Error **errp)
>>          int fd = qemu_open_old(dev->pcap_filename,
>>                                 O_CREAT | O_WRONLY | O_TRUNC | O_BINARY, 0666);
>>          if (fd < 0) {
>> -            error_setg(errp, "open %s failed", dev->pcap_filename);
>> +            error_setg_file_open(errp, errno, dev->pcap_filename);
>
> Wouldn't it be easier to flip it to use qemu_open() ?

Mechanical change; I missed the obvious :)

I'll give it a try, along with the call in ui/ui-qmp-cmd.c [PATCH 09].
Thanks!

>
> Dave
>
>>              usb_qdev_unrealize(qdev);
>>              return;
>>          }
>> -- 
>> 2.49.0
>> 


