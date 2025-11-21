Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FB9C76DB3
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 02:14:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168106.1494210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMFi3-0000bI-Nr; Fri, 21 Nov 2025 01:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168106.1494210; Fri, 21 Nov 2025 01:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMFi3-0000ZO-KM; Fri, 21 Nov 2025 01:13:11 +0000
Received: by outflank-mailman (input) for mailman id 1168106;
 Fri, 21 Nov 2025 01:13:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZKoZ=55=treblig.org=dg@srs-se1.protection.inumbo.net>)
 id 1vMFi2-0000ZF-8u
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 01:13:10 +0000
Received: from mx.treblig.org (mx.treblig.org [2a00:1098:5b::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cef864f-c677-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 02:13:08 +0100 (CET)
Received: from dg by mx.treblig.org with local (Exim 4.98.2)
 (envelope-from <dg@treblig.org>) id 1vMFho-00000005dQh-2cmY;
 Fri, 21 Nov 2025 01:12:56 +0000
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
X-Inumbo-ID: 3cef864f-c677-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=YkcAcM/gBGVrQp+f5sFqb9ygI3lzdlKVWJYNwKoWEWE=; b=TDvy2bE0sCbJMqGR
	6RV+TyLxwmEy+Oyz30kcyWScsmg3kqZ1HYnqmwprl/rnCKams9bOEB3LSH/Akpbrnr2ofs5v/uTGc
	f0Z0rlwOKV6joh0Vy5iuxorodHfXNgMpxdHeZDI5xWGczg0ZiQsLtgLha2rXKgKzRkhOV0q5xRGhu
	QZuUe+F78WpyiyrINkBBn2cMqAlvDfIXl8bTd1oe9wfcjUydY4ZygIcYfKWaaWIJhTOummUCQmzIu
	QFgZ0e7UwZRMbOeB/ohDktlQEp86CO54OhmBDBe3IDmwPu7wcBXoJlpUSJAz3GsGpDs3GGQ7Lw9o1
	EStADm8tf/LhZjsDoQ==;
Date: Fri, 21 Nov 2025 01:12:56 +0000
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
Subject: Re: [PATCH 04/14] qga: Use error_setg_file_open() for better error
 messages
Message-ID: <aR-8mOKG-rYkjyjh@gallifrey>
References: <20251120191339.756429-1-armbru@redhat.com>
 <20251120191339.756429-5-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20251120191339.756429-5-armbru@redhat.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.12.48+deb13-amd64 (x86_64)
X-Uptime: 01:12:53 up 25 days, 49 min,  2 users,  load average: 0.02, 0.01,
 0.00
User-Agent: Mutt/2.2.13 (2024-03-09)

* Markus Armbruster (armbru@redhat.com) wrote:
> Error messages change from
> 
>     open("FNAME"): REASON
> 
> to
> 
>     Could not open 'FNAME': REASON
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dave@treblig.org>

> ---
>  qga/commands-linux.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/qga/commands-linux.c b/qga/commands-linux.c
> index 4a09ddc760..5cf76ca2d9 100644
> --- a/qga/commands-linux.c
> +++ b/qga/commands-linux.c
> @@ -1502,14 +1502,15 @@ static void transfer_vcpu(GuestLogicalProcessor *vcpu, bool sys2vcpu,
>  
>      dirfd = open(dirpath, O_RDONLY | O_DIRECTORY);
>      if (dirfd == -1) {
> -        error_setg_errno(errp, errno, "open(\"%s\")", dirpath);
> +        error_setg_file_open(errp, errno, dirpath);
>          return;
>      }
>  
>      fd = openat(dirfd, fn, sys2vcpu ? O_RDONLY : O_RDWR);
>      if (fd == -1) {
>          if (errno != ENOENT) {
> -            error_setg_errno(errp, errno, "open(\"%s/%s\")", dirpath, fn);
> +            error_setg_errno(errp, errno, "could not open %s/%s",
> +                             dirpath, fn);
>          } else if (sys2vcpu) {
>              vcpu->online = true;
>              vcpu->can_offline = false;
> @@ -1711,7 +1712,7 @@ static void transfer_memory_block(GuestMemoryBlock *mem_blk, bool sys2memblk,
>      dirfd = open(dirpath, O_RDONLY | O_DIRECTORY);
>      if (dirfd == -1) {
>          if (sys2memblk) {
> -            error_setg_errno(errp, errno, "open(\"%s\")", dirpath);
> +            error_setg_file_open(errp, errno, dirpath);
>          } else {
>              if (errno == ENOENT) {
>                  result->response = GUEST_MEMORY_BLOCK_RESPONSE_TYPE_NOT_FOUND;
> @@ -1936,7 +1937,7 @@ static GuestDiskStatsInfoList *guest_get_diskstats(Error **errp)
>  
>      fp = fopen(diskstats, "r");
>      if (fp  == NULL) {
> -        error_setg_errno(errp, errno, "open(\"%s\")", diskstats);
> +        error_setg_file_open(errp, errno, diskstats);
>          return NULL;
>      }
>  
> @@ -2047,7 +2048,7 @@ GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
>  
>      fp = fopen(cpustats, "r");
>      if (fp  == NULL) {
> -        error_setg_errno(errp, errno, "open(\"%s\")", cpustats);
> +        error_setg_file_open(errp, errno, cpustats);
>          return NULL;
>      }
>  
> -- 
> 2.49.0
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

