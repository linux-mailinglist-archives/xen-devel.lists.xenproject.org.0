Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0261C77695
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 06:45:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168167.1494249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMJxV-0001fb-Hl; Fri, 21 Nov 2025 05:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168167.1494249; Fri, 21 Nov 2025 05:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMJxV-0001cr-Ey; Fri, 21 Nov 2025 05:45:25 +0000
Received: by outflank-mailman (input) for mailman id 1168167;
 Fri, 21 Nov 2025 05:45:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VODq=55=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1vMJxT-0001cl-Sm
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 05:45:23 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44d56088-c69d-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 06:45:22 +0100 (CET)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-556-QWRSdU85PZOwmsuMAg_68Q-1; Fri,
 21 Nov 2025 00:45:17 -0500
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 70BB31956072; Fri, 21 Nov 2025 05:45:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.18])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E836F1956045; Fri, 21 Nov 2025 05:45:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7D61821E6A27; Fri, 21 Nov 2025 06:45:06 +0100 (CET)
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
X-Inumbo-ID: 44d56088-c69d-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763703921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M/iAoWDs3TI1i4yv2SFCc8BQMzVF2ZzwOWLNv6dOrLw=;
	b=dPuUiVzcItqEkVc33qcVPiGl9obOZtW5PRCXKQ2bL8/8nsqMC7r1S0/2Y7xwUEK5Ryb1fX
	iNqUmNpr0RrFkBk8Z0KRWwSUMWChHjml79IeRXsbHNq5hPz267FwbFwsjw9mpYrjH7yYSh
	KhOF8MSfCur7uXR82/Wl0zo0wVLO3aM=
X-MC-Unique: QWRSdU85PZOwmsuMAg_68Q-1
X-Mimecast-MFC-AGG-ID: QWRSdU85PZOwmsuMAg_68Q_1763703913
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
Subject: Re: [PATCH 09/14] error: Use error_setg_file_open() for simplicity
 and consistency
In-Reply-To: <aR-q2YeegIEPmk2R@gallifrey> (David Alan Gilbert's message of
	"Thu, 20 Nov 2025 23:57:13 +0000")
References: <20251120191339.756429-1-armbru@redhat.com>
	<20251120191339.756429-10-armbru@redhat.com>
	<aR-q2YeegIEPmk2R@gallifrey>
Date: Fri, 21 Nov 2025 06:45:05 +0100
Message-ID: <87see8q6qm.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

"Dr. David Alan Gilbert" <dave@treblig.org> writes:

> * Markus Armbruster (armbru@redhat.com) wrote:
>> Replace
>> 
>>     error_setg_errno(errp, errno, MSG, FNAME);
>> 
>> by
>> 
>>     error_setg_file_open(errp, errno, FNAME);
>> 
>> where MSG is "Could not open '%s'" or similar.
>> 
>> Also replace equivalent uses of error_setg().
>> 
>> A few messages lose prefixes ("net dump: ", "SEV: ", __func__ ": ").
>> We could put them back with error_prepend().  Not worth the bother.
>
> Yeh, I guess you could just do it with another macro using
> the same internal function just with string concatenation.

I'm no fan of such prefixes.  A sign of developers not caring enough to
craft a good error message for *users*.  *Especially* in the case of
__func__.

The error messages changes in question are:

    net dump: can't open DUMP-FILE: REASON
    Could not open 'DUMP-FILE': REASON

    SEV: Failed to open SEV-DEVICE: REASON
    Could not open 'SEV-DEVICE': REASON

    sev_common_kvm_init: Failed to open SEV_DEVICE 'REASON'
    Could not open 'SEV-DEVICE': REASON

I think these are all improvements, and the loss of the prefix is fine.

>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Reviewed-by: Dr. David Alan Gilbert <dave@treblig.org>

Thanks!


