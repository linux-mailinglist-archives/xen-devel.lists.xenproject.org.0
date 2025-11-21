Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1CDC76C44
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 01:24:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168074.1494190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMEwp-0002IR-27; Fri, 21 Nov 2025 00:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168074.1494190; Fri, 21 Nov 2025 00:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMEwo-0002Fj-VB; Fri, 21 Nov 2025 00:24:22 +0000
Received: by outflank-mailman (input) for mailman id 1168074;
 Fri, 21 Nov 2025 00:24:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZKoZ=55=treblig.org=dg@srs-se1.protection.inumbo.net>)
 id 1vMEwo-0002FZ-3E
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 00:24:22 +0000
Received: from mx.treblig.org (mx.treblig.org [2a00:1098:5b::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67885fdd-c670-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 01:24:12 +0100 (CET)
Received: from dg by mx.treblig.org with local (Exim 4.98.2)
 (envelope-from <dg@treblig.org>) id 1vMEwY-00000005d06-2W0z;
 Fri, 21 Nov 2025 00:24:06 +0000
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
X-Inumbo-ID: 67885fdd-c670-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=KXXaKr3PtFYh8nhHwgchIQAJ3u9wYBNIFydgNDU6Wo4=; b=eynA8kSmvhNEEgT9
	y0JKtg7iv1DeFQTCEwqE9seSwcVA1Xi7+YLa4mjuKStD0NXdu5S7jQHRij5Rtl9JTltmG+TsTC9Qx
	lOfNhVdI53+2SguooVed7NpK4gfR+2vbhtKFwSkttQDsraFmllf8Mt/0vctal58hWk1BxvQyIuHeu
	yCB3kkv3ZI/sZzZy5wcSXhbCuEAwhWxv94eXCJZ1AjXbelxxGWUGT0Ws5Eu3/gJ8ZSKS1ivDgyD9k
	L2BibqN6dzoj/ed6KSGgmPDpg4ESeaqhl/QfEgTk1Lxhf5r5xJzPuFDmoYjnS5h7I+ddk+xbmKbfj
	WwRB4DRNuEnYvwwalw==;
Date: Fri, 21 Nov 2025 00:24:06 +0000
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
Subject: Re: [PATCH 03/14] tap-solaris: Use error_setg_file_open() for better
 error messages
Message-ID: <aR-xJgDErvQaN600@gallifrey>
References: <20251120191339.756429-1-armbru@redhat.com>
 <20251120191339.756429-4-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20251120191339.756429-4-armbru@redhat.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.12.48+deb13-amd64 (x86_64)
X-Uptime: 00:23:09 up 24 days, 23:59,  2 users,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.13 (2024-03-09)

* Markus Armbruster (armbru@redhat.com) wrote:
> Error messages change from
> 
>     Can't open /dev/ip (actually /dev/udp)
>     Can't open /dev/tap
>     Can't open /dev/tap (2)
> 
> to
> 
>     Could not open '/dev/udp': REASON
>     Could not open '/dev/tap': REASON
> 
> where REASON is the value of strerror(errno).

I guess the new macro has a __LINE__ so the (2) is redundant.

> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dave@treblig.org>

> ---
>  net/tap-solaris.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/net/tap-solaris.c b/net/tap-solaris.c
> index 75397e6c54..faf7922ea8 100644
> --- a/net/tap-solaris.c
> +++ b/net/tap-solaris.c
> @@ -87,13 +87,13 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
>  
>      ip_fd = RETRY_ON_EINTR(open("/dev/udp", O_RDWR, 0));
>      if (ip_fd < 0) {
> -        error_setg(errp, "Can't open /dev/ip (actually /dev/udp)");
> +        error_setg_file_open(errp, errno, "/dev/udp");
>          return -1;
>      }
>  
>      tap_fd = RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
>      if (tap_fd < 0) {
> -        error_setg(errp, "Can't open /dev/tap");
> +        error_setg_file_open(errp, errno, "/dev/tap");
>          return -1;
>      }
>  
> @@ -107,7 +107,7 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
>  
>      if_fd = RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
>      if (if_fd < 0) {
> -        error_setg(errp, "Can't open /dev/tap (2)");
> +        error_setg_file_open(errp, errno, "/dev/tap");
>          return -1;
>      }
>      if(ioctl(if_fd, I_PUSH, "ip") < 0){
> -- 
> 2.49.0
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

