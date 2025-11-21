Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BFEC76CB3
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 01:43:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168088.1494201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMFF0-0005Ls-GI; Fri, 21 Nov 2025 00:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168088.1494201; Fri, 21 Nov 2025 00:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMFF0-0005Il-DP; Fri, 21 Nov 2025 00:43:10 +0000
Received: by outflank-mailman (input) for mailman id 1168088;
 Fri, 21 Nov 2025 00:43:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZKoZ=55=treblig.org=dg@srs-se1.protection.inumbo.net>)
 id 1vMFEz-0005If-EE
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 00:43:09 +0000
Received: from mx.treblig.org (mx.treblig.org [2a00:1098:5b::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0848aa04-c673-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 01:43:01 +0100 (CET)
Received: from dg by mx.treblig.org with local (Exim 4.98.2)
 (envelope-from <dg@treblig.org>) id 1vMFEi-00000005d8M-37pF;
 Fri, 21 Nov 2025 00:42:52 +0000
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
X-Inumbo-ID: 0848aa04-c673-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=2lQMqxTn4BDPqEuJHUsXNxZ6n7/HofNAtadPoRD5+7A=; b=Qf7O3sUMLMEvDppF
	qQS46KXVaYPyHAaU1CV6kQ3Zac1Bsl979tFpEKhucfRVImUbbRbQAkvH/J6e1RkwbIJ9ER9wzz6QN
	RH8AcCtZaVM3MsUhggZi8wPrN5NFCfg0uNr7O160etRomxsSa0Jh4M+pvJIiG63p3ncXU94kqOzWr
	jXgZWgi/P/gswYRUiVLOtFw1NDiXKw1dgi42YCoknL0Gp2dYCm6LqmlqsV+qycQ6UsUfNDqp1LmBX
	pkhtExl893Wi0Ca9f3caRkQI/N2V6wf2WvNWVwxV9VtNbVMCeGGp26Nsw/jhOgF1sZTbaeYLH0Stz
	GqEA+p/C4lktH6mnRg==;
Date: Fri, 21 Nov 2025 00:42:52 +0000
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
Subject: Re: [PATCH 02/14] hw/usb: Use error_setg_file_open() for a better
 error message
Message-ID: <aR-1jGX4Ck0f69zG@gallifrey>
References: <20251120191339.756429-1-armbru@redhat.com>
 <20251120191339.756429-3-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20251120191339.756429-3-armbru@redhat.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.12.48+deb13-amd64 (x86_64)
X-Uptime: 00:41:22 up 25 days, 17 min,  2 users,  load average: 0.01, 0.02,
 0.00
User-Agent: Mutt/2.2.13 (2024-03-09)

* Markus Armbruster (armbru@redhat.com) wrote:
> The error message changes from
> 
>     open FILENAME failed
> 
> to
> 
>     Could not open 'FILENAME': REASON
> 
> where REASON is the value of strerror(errno).
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/usb/bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/usb/bus.c b/hw/usb/bus.c
> index 8dd2ce415e..47d42ca3c1 100644
> --- a/hw/usb/bus.c
> +++ b/hw/usb/bus.c
> @@ -262,7 +262,7 @@ static void usb_qdev_realize(DeviceState *qdev, Error **errp)
>          int fd = qemu_open_old(dev->pcap_filename,
>                                 O_CREAT | O_WRONLY | O_TRUNC | O_BINARY, 0666);
>          if (fd < 0) {
> -            error_setg(errp, "open %s failed", dev->pcap_filename);
> +            error_setg_file_open(errp, errno, dev->pcap_filename);

Wouldn't it be easier to flip it to use qemu_open() ?

Dave

>              usb_qdev_unrealize(qdev);
>              return;
>          }
> -- 
> 2.49.0
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

