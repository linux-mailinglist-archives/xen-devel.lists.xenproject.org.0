Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEB548B57D
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 19:12:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255992.439036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Lch-00014M-84; Tue, 11 Jan 2022 18:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255992.439036; Tue, 11 Jan 2022 18:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Lch-00012U-4i; Tue, 11 Jan 2022 18:11:55 +0000
Received: by outflank-mailman (input) for mailman id 255992;
 Tue, 11 Jan 2022 18:11:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JwWh=R3=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n7Lcf-00012C-UC
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 18:11:54 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f37d81d2-7309-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 19:11:52 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:46994)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n7Lcd-000ZEL-8F (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 11 Jan 2022 18:11:51 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 4DAA91FBFC;
 Tue, 11 Jan 2022 18:11:51 +0000 (GMT)
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
X-Inumbo-ID: f37d81d2-7309-11ec-9ce5-af14b9085ebd
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <d70d8cb3-c34f-23f5-840c-c85a90547924@srcf.net>
Date: Tue, 11 Jan 2022 18:11:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 16/18] mini-os: reset file type in close() in one place
 only
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220111145817.22170-1-jgross@suse.com>
 <20220111145817.22170-17-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20220111145817.22170-17-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/01/2022 14:58, Juergen Gross wrote:
> diff --git a/lib/sys.c b/lib/sys.c
> index 0e6fe5d..323a7cd 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -424,87 +424,82 @@ int fsync(int fd) {
>  
>  int close(int fd)
>  {
> +    int res = 0;
> +
>      printk("close(%d)\n", fd);
>      switch (files[fd].type) {
>          default:
> -	    files[fd].type = FTYPE_NONE;
> -	    return 0;
> +            break;
>  #ifdef CONFIG_XENBUS
>  	case FTYPE_XENBUS:
>              xs_daemon_close((void*)(intptr_t) fd);
> -            return 0;
> +            break;
>  #endif
>  #ifdef HAVE_LWIP
> -	case FTYPE_SOCKET: {
> -	    int res = lwip_close(files[fd].fd);
> -	    files[fd].type = FTYPE_NONE;
> -	    return res;
> -	}
> +	case FTYPE_SOCKET:
> +	    res = lwip_close(files[fd].fd);

Hard tabs.

> +            break;
>  #endif
>  #ifdef CONFIG_LIBXENCTRL
>  	case FTYPE_XC:
>  	    minios_interface_close_fd(fd);
> -	    return 0;
> +            break;
>  #endif
>  #ifdef CONFIG_LIBXENEVTCHN
>  	case FTYPE_EVTCHN:
>  	    minios_evtchn_close_fd(fd);
> -            return 0;
> +            break;
>  #endif
>  #ifdef CONFIG_LIBXENGNTTAB
>  	case FTYPE_GNTMAP:
>  	    minios_gnttab_close_fd(fd);
> -	    return 0;
> +            break;
>  #endif
>  #ifdef CONFIG_NETFRONT
>  	case FTYPE_TAP:
>  	    shutdown_netfront(files[fd].dev);
> -	    files[fd].type = FTYPE_NONE;
> -	    return 0;
> +            break;
>  #endif
>  #ifdef CONFIG_BLKFRONT
>  	case FTYPE_BLK:
>              shutdown_blkfront(files[fd].dev);
> -	    files[fd].type = FTYPE_NONE;
> -	    return 0;
> +            break;
>  #endif
>  #ifdef CONFIG_TPMFRONT
>  	case FTYPE_TPMFRONT:
>              shutdown_tpmfront(files[fd].dev);
> -	    files[fd].type = FTYPE_NONE;
> -	    return 0;
> +            break;
>  #endif
>  #ifdef CONFIG_TPM_TIS
>  	case FTYPE_TPM_TIS:
>              shutdown_tpm_tis(files[fd].dev);
> -	    files[fd].type = FTYPE_NONE;
> -	    return 0;
> +            break;
>  #endif
>  #ifdef CONFIG_KBDFRONT
>  	case FTYPE_KBD:
>              shutdown_kbdfront(files[fd].dev);
> -            files[fd].type = FTYPE_NONE;
> -            return 0;
> +            break;
>  #endif
>  #ifdef CONFIG_FBFRONT
>  	case FTYPE_FB:
>              shutdown_fbfront(files[fd].dev);
> -            files[fd].type = FTYPE_NONE;
> -            return 0;
> +            break;
>  #endif
>  #ifdef CONFIG_CONSFRONT
>          case FTYPE_SAVEFILE:
>          case FTYPE_CONSOLE:
>              fini_consfront(files[fd].dev);
> -            files[fd].type = FTYPE_NONE;
> -            return 0;
> +            break;
>  #endif
>  	case FTYPE_NONE:
> -	    break;
> +            printk("close(%d): Bad descriptor\n", fd);
> +            errno = EBADF;
> +            return -1;
>      }
> -    printk("close(%d): Bad descriptor\n", fd);
> -    errno = EBADF;
> -    return -1;
> +
> +    memset(files + fd, 0, sizeof(struct file));
> +    files[fd].type = FTYPE_NONE;

BUILD_BUG_ON(FTYPE_NONE != 0);

Life's too short to deal with a theoretical (and short sighted) future
where someone might want to change FTYPE_NONE away from being 0.

~Andrew

