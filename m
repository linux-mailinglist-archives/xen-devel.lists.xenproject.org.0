Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D49066A8B96
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 23:18:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505470.778278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXrFQ-0005l8-3T; Thu, 02 Mar 2023 22:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505470.778278; Thu, 02 Mar 2023 22:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXrFQ-0005hk-04; Thu, 02 Mar 2023 22:18:00 +0000
Received: by outflank-mailman (input) for mailman id 505470;
 Thu, 02 Mar 2023 22:17:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=igkB=62=gmail.com=tcminyard@srs-se1.protection.inumbo.net>)
 id 1pXrFP-0005he-73
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 22:17:59 +0000
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [2607:f8b0:4864:20::832])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 160f0efd-b948-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 23:17:58 +0100 (CET)
Received: by mail-qt1-x832.google.com with SMTP id l13so986091qtv.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Mar 2023 14:17:58 -0800 (PST)
Received: from serve.minyard.net ([47.184.176.248])
 by smtp.gmail.com with ESMTPSA id
 w19-20020ac843d3000000b003bfbf3afe51sm468742qtn.93.2023.03.02.14.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 14:17:56 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:9812:99fe:c8aa:e89a])
 by serve.minyard.net (Postfix) with ESMTPSA id 2843A18000C;
 Thu,  2 Mar 2023 22:17:55 +0000 (UTC)
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
X-Inumbo-ID: 160f0efd-b948-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677795477;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0eFa8ILkm7saCjWoXNnQHqm1RHUvtu7xtFURhRmKWU=;
        b=GWIdVRbSbgGAneugFpQgdh5lGR+K1O2RColDxiylPsGvgbxgTi3suTXXA6wFi8OCK0
         VNr55Ah0Gc82W4FpWSTsMpjDZ1Erp/WmIRnZDS0YpniCm5SeKBzDA3FCJ8OcngRfT3am
         LJR4Wv1lndNYH/Q/fwVcsuZerou4gr/yo1YSLP0kQcvMrmf2NmdjcDnwIAjLduXqmPNe
         VlNJuhUG6Jamo98Ukf3GRQnXMF/KhWX9aS1xIH9/YtXknnp6o/3S59Xtp1bxusSnAubi
         fOjhj1lJxSPeHuAjqExElFjdtMpPl+2YjDqfLqGQB/n6i2Ayg1FV3OBABQqVd1q1TZM5
         StNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677795477;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V0eFa8ILkm7saCjWoXNnQHqm1RHUvtu7xtFURhRmKWU=;
        b=oWLkigZ20h7oFypufCMSMye707uipIiKSgrEMM6XlyXCO0/9eBwlGvKTYBcSXXYPfw
         vEV8ipcGGHx9EVD5t4nIzB8XlzrLgqFbF0lyoEDsVPAe1edYJHrTKkVOXkzgiEKWxj2C
         CTc+v0ulTRP8hyHDxQJazFfd2GV1WGzmGOZWtR+zyIyMuyxrFE8TqSy7mxCxJZ9nBIFl
         IHWk/5YqNLJTOXcWnVATkU7GtHiryugaUfafttENzXpCTFtUug75/0vlofzLtQ9Y+CqC
         XuYyoEzwAAYqAyx6W5oYYs+wVUrwvhqQmpGY0xCvjY1r6qYMd8OFp8QF020+ZHlmGBjr
         YiQA==
X-Gm-Message-State: AO0yUKVV0Dq37/Z8tM8cowwFlyyrbLGAKp9dZ0AbIcg7QAiWDtf8UuPo
	PAfITBQdaH+mv1GnYcB/qA==
X-Google-Smtp-Source: AK7set/y+bOjExP+nvbPQ/5QcDoAS99DJhG2vCN39iU8gau82df1z2MZqb9gk8YkNPi+sskmliPrlQ==
X-Received: by 2002:ac8:5f47:0:b0:3bf:dd45:ed68 with SMTP id y7-20020ac85f47000000b003bfdd45ed68mr19008132qta.47.1677795476934;
        Thu, 02 Mar 2023 14:17:56 -0800 (PST)
Sender: Corey Minyard <tcminyard@gmail.com>
Date: Thu, 2 Mar 2023 16:17:53 -0600
From: Corey Minyard <minyard@acm.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: ebiederm@xmission.com, keescook@chromium.org, yzaikin@google.com,
	jejb@linux.ibm.com, martin.petersen@oracle.com, kys@microsoft.com,
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
	song@kernel.org, robinmholt@gmail.com, steve.wahl@hpe.com,
	mike.travis@hpe.com, arnd@arndb.de, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, jgross@suse.com, sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com, xen-devel@lists.xenproject.org,
	j.granados@samsung.com, zhangpeng362@huawei.com,
	tangmeng@uniontech.com, willy@infradead.org, nixiaoming@huawei.com,
	sujiaxun@uniontech.com, patches@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, apparmor@lists.ubuntu.com,
	linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] ipmi: simplify sysctl registration
Message-ID: <ZAEgkeb6E+k8PFZc@minyard.net>
Reply-To: minyard@acm.org
References: <20230302204612.782387-1-mcgrof@kernel.org>
 <20230302204612.782387-3-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302204612.782387-3-mcgrof@kernel.org>

On Thu, Mar 02, 2023 at 12:46:07PM -0800, Luis Chamberlain wrote:
> register_sysctl_table() is a deprecated compatibility wrapper.
> register_sysctl() can do the directory creation for you so just use
> that.

Thanks, I have included this in my tree for the next merge window.

-corey

> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>  drivers/char/ipmi/ipmi_poweroff.c | 16 +---------------
>  1 file changed, 1 insertion(+), 15 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_poweroff.c b/drivers/char/ipmi/ipmi_poweroff.c
> index 163ec9749e55..870659d91db2 100644
> --- a/drivers/char/ipmi/ipmi_poweroff.c
> +++ b/drivers/char/ipmi/ipmi_poweroff.c
> @@ -659,20 +659,6 @@ static struct ctl_table ipmi_table[] = {
>  	{ }
>  };
>  
> -static struct ctl_table ipmi_dir_table[] = {
> -	{ .procname	= "ipmi",
> -	  .mode		= 0555,
> -	  .child	= ipmi_table },
> -	{ }
> -};
> -
> -static struct ctl_table ipmi_root_table[] = {
> -	{ .procname	= "dev",
> -	  .mode		= 0555,
> -	  .child	= ipmi_dir_table },
> -	{ }
> -};
> -
>  static struct ctl_table_header *ipmi_table_header;
>  #endif /* CONFIG_PROC_FS */
>  
> @@ -689,7 +675,7 @@ static int __init ipmi_poweroff_init(void)
>  		pr_info("Power cycle is enabled\n");
>  
>  #ifdef CONFIG_PROC_FS
> -	ipmi_table_header = register_sysctl_table(ipmi_root_table);
> +	ipmi_table_header = register_sysctl("dev/ipmi", ipmi_table);
>  	if (!ipmi_table_header) {
>  		pr_err("Unable to register powercycle sysctl\n");
>  		rv = -ENOMEM;
> -- 
> 2.39.1
> 

