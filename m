Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29547C77635
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 06:35:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168155.1494240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMJnn-0008P9-MW; Fri, 21 Nov 2025 05:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168155.1494240; Fri, 21 Nov 2025 05:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMJnn-0008Mj-JW; Fri, 21 Nov 2025 05:35:23 +0000
Received: by outflank-mailman (input) for mailman id 1168155;
 Fri, 21 Nov 2025 05:35:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VODq=55=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1vMJnl-0008Md-O1
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 05:35:21 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd637c77-c69b-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 06:35:19 +0100 (CET)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-447-YELbPn2YM7-MEnuiDffihA-1; Fri,
 21 Nov 2025 00:35:13 -0500
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BD5B11956060; Fri, 21 Nov 2025 05:35:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.18])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 810F430044DB; Fri, 21 Nov 2025 05:35:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0CA9D21E6A27; Fri, 21 Nov 2025 06:35:03 +0100 (CET)
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
X-Inumbo-ID: dd637c77-c69b-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763703318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GjNOwtR9Z6IKyvsldJuL+qO2CUUAzUivSxONBT+whyk=;
	b=G4yoqeoHNbpHXLTpjXDBvZ31aEbe7/dvy81kvVUjasNWFG1kj2y5dNpa2q4tB+WxaPH7Us
	dRsAoEhm8S93zkF1mr2OQlu8FU0KVpVfjEVFw+9+1/Fg4YEYgGRoVpElt3Mqrfg+g7c/ey
	LNuIIcykQGo58fB8o1bFiE3D2FEToKA=
X-MC-Unique: YELbPn2YM7-MEnuiDffihA-1
X-Mimecast-MFC-AGG-ID: YELbPn2YM7-MEnuiDffihA_1763703309
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
Subject: Re: [PATCH 03/14] tap-solaris: Use error_setg_file_open() for
 better error messages
In-Reply-To: <aR-xJgDErvQaN600@gallifrey> (David Alan Gilbert's message of
	"Fri, 21 Nov 2025 00:24:06 +0000")
References: <20251120191339.756429-1-armbru@redhat.com>
	<20251120191339.756429-4-armbru@redhat.com>
	<aR-xJgDErvQaN600@gallifrey>
Date: Fri, 21 Nov 2025 06:35:03 +0100
Message-ID: <87wm3kq77c.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

"Dr. David Alan Gilbert" <dave@treblig.org> writes:

> * Markus Armbruster (armbru@redhat.com) wrote:
>> Error messages change from
>> 
>>     Can't open /dev/ip (actually /dev/udp)
>>     Can't open /dev/tap
>>     Can't open /dev/tap (2)
>> 
>> to
>> 
>>     Could not open '/dev/udp': REASON
>>     Could not open '/dev/tap': REASON
>> 
>> where REASON is the value of strerror(errno).
>
> I guess the new macro has a __LINE__ so the (2) is redundant.

It does capture __FILE__, __LINE__, and __func__, but they're only
printed for &error_abort.

How likely is it that the first open of /dev/tap succeeds, and the
second fails?

Do users users then need to know that the second failed?  If yes, then
" (2)" is a terrible way to tell them.

>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Reviewed-by: Dr. David Alan Gilbert <dave@treblig.org>

Thanks!


