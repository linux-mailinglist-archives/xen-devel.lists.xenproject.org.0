Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CC6C76EF6
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 03:05:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168121.1494220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMGWa-0007vQ-6C; Fri, 21 Nov 2025 02:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168121.1494220; Fri, 21 Nov 2025 02:05:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMGWa-0007tz-3U; Fri, 21 Nov 2025 02:05:24 +0000
Received: by outflank-mailman (input) for mailman id 1168121;
 Fri, 21 Nov 2025 02:05:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZKoZ=55=treblig.org=dg@srs-se1.protection.inumbo.net>)
 id 1vMGWY-0007tr-O2
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 02:05:22 +0000
Received: from mx.treblig.org (mx.treblig.org [2a00:1098:5b::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84a2cfd3-c67e-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 03:05:15 +0100 (CET)
Received: from dg by mx.treblig.org with local (Exim 4.98.2)
 (envelope-from <dg@treblig.org>) id 1vMGWK-00000005dm0-1euI;
 Fri, 21 Nov 2025 02:05:08 +0000
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
X-Inumbo-ID: 84a2cfd3-c67e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=Pm4UnpdimlqsbJ4K376o2cJfR1Zky2oPXK2MjIcdLJY=; b=MA2Q9aKaMU1Z17SE
	Jy1K/s9Q2Ui7G0xXYte5iIj7lkeCCWTJlcqzv2legK6cK609mCL7Ok7MYB1Lz09b8y/q2DsX+rTkF
	dHQXIKiI19wjB8DeTNjb+SbaH1zrFUPh1PXNw3GBoZuS9yY8BFPdgr5tJ1U3ixF7i/Tw2tOaxN9si
	FqQmU2Y42S7qsAHDLSwELMBJ2q6MmsOkXA0fdPwwIMASdNHyaT+h0dhMD8C/EGSPU1GHxbITV4cc/
	H3fbq4sEwhBgq4DlXvgpywHAmKtRp6LN3o9vEhODJxZPAg3ASOTdQk06a6GlBHAfIR0sW0jAF8CcS
	ZsEY1K7sjBBktQyQPg==;
Date: Fri, 21 Nov 2025 02:05:08 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, arei.gonglei@huawei.com,
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
Subject: Re: [PATCH 05/14] hw/scsi: Use error_setg_file_open() for a better
 error message
Message-ID: <aR_I1POkMYcdb1LJ@gallifrey>
References: <20251120191339.756429-1-armbru@redhat.com>
 <20251120191339.756429-6-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20251120191339.756429-6-armbru@redhat.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.12.48+deb13-amd64 (x86_64)
X-Uptime: 02:04:59 up 25 days,  1:41,  2 users,  load average: 0.04, 0.04,
 0.00
User-Agent: Mutt/2.2.13 (2024-03-09)

* Markus Armbruster (armbru@redhat.com) wrote:
> The error message changes from
> 
>     vhost-scsi: open vhost char device failed: REASON
> 
> to
> 
>     Could not open '/dev/vhost-scsi': REASON
> 
> I think the exact file name is more useful to know than the file's
> purpose.
> 
> We could put back the "vhost-scsi: " prefix with error_prepend().  Not
> worth the bother.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dave@treblig.org>

> ---
>  hw/scsi/vhost-scsi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
> index cdf405b0f8..239138c931 100644
> --- a/hw/scsi/vhost-scsi.c
> +++ b/hw/scsi/vhost-scsi.c
> @@ -245,8 +245,7 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
>      } else {
>          vhostfd = open("/dev/vhost-scsi", O_RDWR);
>          if (vhostfd < 0) {
> -            error_setg(errp, "vhost-scsi: open vhost char device failed: %s",
> -                       strerror(errno));
> +            error_setg_file_open(errp, errno, "/dev/vhost-scsi");
>              return;
>          }
>      }
> -- 
> 2.49.0
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

