Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E25C6AFE23
	for <lists+xen-devel@lfdr.de>; Wed,  8 Mar 2023 06:13:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507916.782182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZm7M-0007JH-9T; Wed, 08 Mar 2023 05:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507916.782182; Wed, 08 Mar 2023 05:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZm7M-0007Gx-6I; Wed, 08 Mar 2023 05:13:36 +0000
Received: by outflank-mailman (input) for mailman id 507916;
 Tue, 07 Mar 2023 22:27:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=urvN=67=hpe.com=prvs=0430120c81=steve.wahl@srs-se1.protection.inumbo.net>)
 id 1pZfmD-0007wD-No
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 22:27:21 +0000
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36dbcb4f-bd37-11ed-956e-85ef70e17bfa;
 Tue, 07 Mar 2023 23:27:17 +0100 (CET)
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
 by mx0a-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 327L5gJ4028321; Tue, 7 Mar 2023 22:24:18 GMT
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
 by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 3p6bu8114b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 22:24:17 +0000
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by p1lg14878.it.hpe.com (Postfix) with ESMTPS id CBB17130A9;
 Tue,  7 Mar 2023 22:24:16 +0000 (UTC)
Received: from swahl-home.5wahls.com (unknown [16.231.227.36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTPS id 9C74F80AD9E;
 Tue,  7 Mar 2023 22:24:12 +0000 (UTC)
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
X-Inumbo-ID: 36dbcb4f-bd37-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pps0720; bh=LaaPqV7Flc0GLDHQpIpi/BIcyjij0wSdtMhbcCHYsgA=;
 b=KucE5UTqJQpxT11mxXz+EBR8v0tavcjUv9Ui2FHab40WoQiuV3yFIDgqKk3q5kcdvuwo
 drWjaXC7Yx+uiwl1OenpwWu47udmJqwKjE9dILefQUZGqLmGaEP1NLYCkNLYgQXE55IH
 pJ+yRhi5GSJ5jKQ8RWB3Nr3EtesnmJ05hdKeHlS8cBLT36zWyHn3FQ9/R6GqQyfwyefx
 YeGHnWIch0H3I5hz2qQ78crYlcNTY741RdGLewUR/aekyotj3MBUgHiSeyPnIKvgWPEK
 jg+AIfQknv6WWMr+5LSHk3ZVcc7cEeQsQPCw1ideabEOY7fb99n90BFJHjYRpVRpYa7A Vw== 
Date: Tue, 7 Mar 2023 16:24:10 -0600
From: Steve Wahl <steve.wahl@hpe.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: ebiederm@xmission.com, keescook@chromium.org, yzaikin@google.com,
        jejb@linux.ibm.com, martin.petersen@oracle.com, minyard@acm.org,
        kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
        decui@microsoft.com, song@kernel.org, robinmholt@gmail.com,
        steve.wahl@hpe.com, arnd@arndb.de, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, jgross@suse.com, sstabellini@kernel.org,
        oleksandr_tyshchenko@epam.com, xen-devel@lists.xenproject.org,
        j.granados@samsung.com, zhangpeng362@huawei.com,
        tangmeng@uniontech.com, willy@infradead.org, nixiaoming@huawei.com,
        sujiaxun@uniontech.com, patches@lists.linux.dev,
        linux-fsdevel@vger.kernel.org, apparmor@lists.ubuntu.com,
        linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-hyperv@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] sgi-xp: simplify sysctl registration
Message-ID: <ZAe5batlkUwlKoxx@swahl-home.5wahls.com>
References: <20230302204612.782387-1-mcgrof@kernel.org>
 <20230302204612.782387-6-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302204612.782387-6-mcgrof@kernel.org>
X-Proofpoint-GUID: -gScpSVwE5aPWwo4gsaN-rEbeWVyAJK_
X-Proofpoint-ORIG-GUID: -gScpSVwE5aPWwo4gsaN-rEbeWVyAJK_
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_16,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070197

On Thu, Mar 02, 2023 at 12:46:10PM -0800, Luis Chamberlain wrote:
> Although this driver is a good use case for having a directory
> that is not other directories and then subdirectories with more
> entries, the usage of register_sysctl_table() can recurse and
> increases complexity so to avoid that just split out the
> registration to each directory with its own entries.
> 
> register_sysctl_table() is a deprecated compatibility wrapper.
> register_sysctl() can do the directory creation for you so just use
> that.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

Reviewed-by: Steve Wahl <steve.wahl@hpe.com>

> ---
>  drivers/misc/sgi-xp/xpc_main.c | 24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/misc/sgi-xp/xpc_main.c b/drivers/misc/sgi-xp/xpc_main.c
> index b2c3c22fc13c..6da509d692bb 100644
> --- a/drivers/misc/sgi-xp/xpc_main.c
> +++ b/drivers/misc/sgi-xp/xpc_main.c
> @@ -93,7 +93,7 @@ int xpc_disengage_timelimit = XPC_DISENGAGE_DEFAULT_TIMELIMIT;
>  static int xpc_disengage_min_timelimit;	/* = 0 */
>  static int xpc_disengage_max_timelimit = 120;
>  
> -static struct ctl_table xpc_sys_xpc_hb_dir[] = {
> +static struct ctl_table xpc_sys_xpc_hb[] = {
>  	{
>  	 .procname = "hb_interval",
>  	 .data = &xpc_hb_interval,
> @@ -112,11 +112,7 @@ static struct ctl_table xpc_sys_xpc_hb_dir[] = {
>  	 .extra2 = &xpc_hb_check_max_interval},
>  	{}
>  };
> -static struct ctl_table xpc_sys_xpc_dir[] = {
> -	{
> -	 .procname = "hb",
> -	 .mode = 0555,
> -	 .child = xpc_sys_xpc_hb_dir},
> +static struct ctl_table xpc_sys_xpc[] = {
>  	{
>  	 .procname = "disengage_timelimit",
>  	 .data = &xpc_disengage_timelimit,
> @@ -127,14 +123,9 @@ static struct ctl_table xpc_sys_xpc_dir[] = {
>  	 .extra2 = &xpc_disengage_max_timelimit},
>  	{}
>  };
> -static struct ctl_table xpc_sys_dir[] = {
> -	{
> -	 .procname = "xpc",
> -	 .mode = 0555,
> -	 .child = xpc_sys_xpc_dir},
> -	{}
> -};
> +
>  static struct ctl_table_header *xpc_sysctl;
> +static struct ctl_table_header *xpc_sysctl_hb;
>  
>  /* non-zero if any remote partition disengage was timed out */
>  int xpc_disengage_timedout;
> @@ -1041,6 +1032,8 @@ xpc_do_exit(enum xp_retval reason)
>  
>  	if (xpc_sysctl)
>  		unregister_sysctl_table(xpc_sysctl);
> +	if (xpc_sysctl_hb)
> +		unregister_sysctl_table(xpc_sysctl_hb);
>  
>  	xpc_teardown_partitions();
>  
> @@ -1243,7 +1236,8 @@ xpc_init(void)
>  		goto out_1;
>  	}
>  
> -	xpc_sysctl = register_sysctl_table(xpc_sys_dir);
> +	xpc_sysctl = register_sysctl("xpc", xpc_sys_xpc);
> +	xpc_sysctl_hb = register_sysctl("xpc/hb", xpc_sys_xpc_hb);
>  
>  	/*
>  	 * Fill the partition reserved page with the information needed by
> @@ -1308,6 +1302,8 @@ xpc_init(void)
>  	(void)unregister_die_notifier(&xpc_die_notifier);
>  	(void)unregister_reboot_notifier(&xpc_reboot_notifier);
>  out_2:
> +	if (xpc_sysctl_hb)
> +		unregister_sysctl_table(xpc_sysctl_hb);
>  	if (xpc_sysctl)
>  		unregister_sysctl_table(xpc_sysctl);
>  
> -- 
> 2.39.1
> 

-- 
Steve Wahl, Hewlett Packard Enterprise

