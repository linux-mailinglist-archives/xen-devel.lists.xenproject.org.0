Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D59C76B65
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 01:10:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168048.1494170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMEjQ-0008JY-O0; Fri, 21 Nov 2025 00:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168048.1494170; Fri, 21 Nov 2025 00:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMEjQ-0008HH-LA; Fri, 21 Nov 2025 00:10:32 +0000
Received: by outflank-mailman (input) for mailman id 1168048;
 Fri, 21 Nov 2025 00:10:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZKoZ=55=treblig.org=dg@srs-se1.protection.inumbo.net>)
 id 1vMEjO-0008HB-Uj
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 00:10:30 +0000
Received: from mx.treblig.org (mx.treblig.org [2a00:1098:5b::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 783dbe68-c66e-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 01:10:23 +0100 (CET)
Received: from dg by mx.treblig.org with local (Exim 4.98.2)
 (envelope-from <dg@treblig.org>) id 1vMEj7-00000005csx-0Lk8;
 Fri, 21 Nov 2025 00:10:13 +0000
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
X-Inumbo-ID: 783dbe68-c66e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=4YAcbiarbzQHvhEzZ63n6RkH46R+BEUGak5gqn7DS+0=; b=ilbUYMN0rKRC6nJC
	AjVUwVMVW7944N9SN4N3h+IDCtzr87WMNXUIjULXle6L7f2jIHRXFfSFJOhAvPsDh+Z0MgdXaqFzH
	xtlyavuW6OwPf2BO03CsvX0Ryu0GPXNoJeLboZkxtZVm6GJSOHN/CzhKQQpMqsdK6HpavN34jWfZZ
	Kt1+prB3CLGVGdrqi5ZXeOePqoNkHL74MhrVFb1qWAECOoiXvaAqik3S9zDCGG3ogy18MMD4PBfRk
	VNgLVDGImyGZWGiBa95qzFc+pyTfzMMKtajdwOWnCMLk2vMLrIgLH4H3PxDBorM9KvZw7GDP0Hojb
	9PgYJe97XoKoacFcHw==;
Date: Fri, 21 Nov 2025 00:10:13 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, arei.gonglei@huawei.com, pizhenwei@bytedance.com,
	alistair.francis@wdc.com, stefanb@linux.vnet.ibm.com,
	kwolf@redhat.com, hreitz@redhat.com, sw@weilnetz.de,
	qemu_oss@crudebyte.com, groug@kaod.org, mst@redhat.com,
	imammedo@redhat.com, anisinha@redhat.com, kraxel@redhat.com,
	shentey@gmail.com, npiggin@gmail.com, harshpb@linux.ibm.com,
	sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
	edgar.iglesias@gmail.com, elena.ufimtseva@oracle.com,
	jag.raman@oracle.com, sgarzare@redhat.com, pbonzini@redhat.com,
	fam@euphon.net, philmd@linaro.org, alex@shazbot.org, clg@redhat.com,
	peterx@redhat.com, farosas@suse.de, lizhijian@fujitsu.com,
	jasowang@redhat.com, samuel.thibault@ens-lyon.org,
	michael.roth@amd.com, kkostiuk@redhat.com, zhao1.liu@intel.com,
	mtosatti@redhat.com, rathc@linux.ibm.com, palmer@dabbelt.com,
	liwei1518@gmail.com, dbarboza@ventanamicro.com,
	zhiwei_liu@linux.alibaba.com, marcandre.lureau@redhat.com,
	qemu-block@nongnu.org, qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	qemu-riscv@nongnu.org
Subject: Re: [PATCH 11/14] error: Use error_setg_errno() to improve error
 messages
Message-ID: <aR-t5SzR2AdqlJtq@gallifrey>
References: <20251120191339.756429-1-armbru@redhat.com>
 <20251120191339.756429-12-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20251120191339.756429-12-armbru@redhat.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.12.48+deb13-amd64 (x86_64)
X-Uptime: 00:09:12 up 24 days, 23:45,  2 users,  load average: 0.03, 0.03,
 0.00
User-Agent: Mutt/2.2.13 (2024-03-09)

* Markus Armbruster (armbru@redhat.com) wrote:
> A few error messages show numeric errno codes.  Use error_setg_errno()
> to show human-readable text instead.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

...

> diff --git a/migration/rdma.c b/migration/rdma.c
> index 337b415889..ef4885ef5f 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -2349,8 +2349,7 @@ static int qemu_get_cm_event_timeout(RDMAContext *rdma,
>          error_setg(errp, "RDMA ERROR: poll cm event timeout");
>          return -1;
>      } else if (ret < 0) {
> -        error_setg(errp, "RDMA ERROR: failed to poll cm event, errno=%i",
> -                   errno);
> +        error_setg_errno(errp, "RDMA ERROR: failed to poll cm event");

Hasn't that lost the errno ?

Dave

-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

