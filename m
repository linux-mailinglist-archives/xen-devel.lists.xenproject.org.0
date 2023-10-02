Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2160C7B5544
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 16:35:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611595.951105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnK0f-0005EV-RD; Mon, 02 Oct 2023 14:34:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611595.951105; Mon, 02 Oct 2023 14:34:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnK0f-0005CZ-Nu; Mon, 02 Oct 2023 14:34:57 +0000
Received: by outflank-mailman (input) for mailman id 611595;
 Mon, 02 Oct 2023 14:34:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Urm/=FQ=hpe.com=steve.wahl@srs-se1.protection.inumbo.net>)
 id 1qnK0e-0005CT-2M
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 14:34:56 +0000
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8d7bf7b-6130-11ee-98d2-6d05b1d4d9a1;
 Mon, 02 Oct 2023 16:34:53 +0200 (CEST)
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
 by mx0a-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 392ENRAq010318; Mon, 2 Oct 2023 14:33:28 GMT
Received: from p1lg14881.it.hpe.com ([16.230.97.202])
 by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 3tfyk4g34b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Oct 2023 14:33:28 +0000
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 20CF0804DF1;
 Mon,  2 Oct 2023 14:33:14 +0000 (UTC)
Received: from swahl-home.5wahls.com (unknown [16.231.227.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTPS id 1031080139E;
 Mon,  2 Oct 2023 14:33:05 +0000 (UTC)
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
X-Inumbo-ID: d8d7bf7b-6130-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pps0720; bh=8kcAx3CglGRn94aeo1HK8iAjrJB5McccnOtaRuGBhlE=;
 b=UDDV9blwhOqG6lS3UsYzzUODsb3/Jv7uk7fyfcblbVHD3X/OLXl4ruM75aG/o029gXU4
 wZf0e0FS+UT7qSUuJhyOAyZlj0F1UOHpXDeBwm3+RPme4yGaLrJ9gQFKalvxH7zeW0Q2
 9Wal0xHDrZAv4zZfk2yPVG5x6KKVR+62Inf2e5CoAJFSvGqa9XRuymOmZ+CVSG7WUZ0j
 MfjwZN1qCeG6CzxC3CgEIgBeZqSkhI/EtLkuSZrJ0vADwcdmTnlSr+XumB84vemz7JXe
 W34mDYx8DuQrTdltPS/YsslQCZKNQYb9m+YSqJL+3jk+uYK+YsSwbmURt2WthssC/6Wq Jw== 
Date: Mon, 2 Oct 2023 09:33:04 -0500
From: Steve Wahl <steve.wahl@hpe.com>
To: j.granados@samsung.com
Cc: Luis Chamberlain <mcgrof@kernel.org>, willy@infradead.org,
        josh@joshtriplett.org, Kees Cook <keescook@chromium.org>,
        Phillip Potter <phil@philpotter.co.uk>,
        Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Doug Gilbert <dgilbert@interlog.com>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
        Corey Minyard <minyard@acm.org>, Theodore Ts'o <tytso@mit.edu>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        David Ahern <dsahern@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Robin Holt <robinmholt@gmail.com>,
        Steve Wahl <steve.wahl@hpe.com>,
        Russ Weight <russell.h.weight@intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Song Liu <song@kernel.org>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
        Dexuan Cui <decui@microsoft.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-serial@vger.kernel.org, linux-scsi@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-rdma@vger.kernel.org,
        openipmi-developer@lists.sourceforge.net, netdev@vger.kernel.org,
        linux-raid@vger.kernel.org, linux-hyperv@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 11/15] sgi-xp: Remove the now superfluous sentinel
 element from ctl_table array
Message-ID: <ZRrUoISghotzEeu/@swahl-home.5wahls.com>
References: <20231002-jag-sysctl_remove_empty_elem_drivers-v2-0-02dd0d46f71e@samsung.com>
 <=?utf-8?q?=3C20231002-jag-sysctl=5Fremove=5Fempty=5Felem=5Fdrive?=>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <=?utf-8?q?=3C20231002-jag-sysctl=5Fremove=5Fempty=5Felem=5Fdrive?=>
X-Proofpoint-ORIG-GUID: FvQlGBIC2T_f8YdHb4chZeOBKZ5wjbmW
X-Proofpoint-GUID: FvQlGBIC2T_f8YdHb4chZeOBKZ5wjbmW
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-02_09,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310020109

On Mon, Oct 02, 2023 at 10:55:28AM +0200, Joel Granados via B4 Relay wrote:
> From: Joel Granados <j.granados@samsung.com>
> 
> This commit comes at the tail end of a greater effort to remove the
> empty elements at the end of the ctl_table arrays (sentinels) which
> will reduce the overall build time size of the kernel and run time
> memory bloat by ~64 bytes per sentinel (further information Link :
> https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
> 
> Remove sentinel from xpc_sys_xpc_hb and xpc_sys_xpc
> 
> Signed-off-by: Joel Granados <j.granados@samsung.com>
> ---
>  drivers/misc/sgi-xp/xpc_main.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/misc/sgi-xp/xpc_main.c b/drivers/misc/sgi-xp/xpc_main.c
> index 6da509d692bb..3186421e82c3 100644
> --- a/drivers/misc/sgi-xp/xpc_main.c
> +++ b/drivers/misc/sgi-xp/xpc_main.c
> @@ -110,7 +110,6 @@ static struct ctl_table xpc_sys_xpc_hb[] = {
>  	 .proc_handler = proc_dointvec_minmax,
>  	 .extra1 = &xpc_hb_check_min_interval,
>  	 .extra2 = &xpc_hb_check_max_interval},
> -	{}
>  };
>  static struct ctl_table xpc_sys_xpc[] = {
>  	{
> @@ -121,7 +120,6 @@ static struct ctl_table xpc_sys_xpc[] = {
>  	 .proc_handler = proc_dointvec_minmax,
>  	 .extra1 = &xpc_disengage_min_timelimit,
>  	 .extra2 = &xpc_disengage_max_timelimit},
> -	{}
>  };
>  
>  static struct ctl_table_header *xpc_sysctl;
> 
> -- 
> 2.30.2
> 

Reviewed-by: Steve Wahl <steve.wahl@hpe.com>

-- 
Steve Wahl, Hewlett Packard Enterprise

