Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E57B1C11F2
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 14:16:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUUaA-0003wa-Lr; Fri, 01 May 2020 12:15:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UQub=6P=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jUUa8-0003wV-Tb
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 12:15:52 +0000
X-Inumbo-ID: 7f437b54-8ba5-11ea-9b01-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f437b54-8ba5-11ea-9b01-12813bfff9fa;
 Fri, 01 May 2020 12:15:51 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v4so9676367wme.1
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2020 05:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vICyT7apXMYKPCbuxxQqROkSh5+Ohp8a/LbOd+8OaeQ=;
 b=jJ/SUTEeHeEfVCU5SwLt8MCoTGl+JN4CyxkxtiHb2l3r5/XfKz+8oF5omdqda33cUj
 ypayty3SvbS0yQ9r4Ibtn0sPTiqbfisVTfhpcTs6ig1TJKP8gswOY0VmjN5cFQBV9jvf
 DxJMZ1XTNezRU3iks0lDPBLZRUQQl4rWDb6smjJmb8tBDoLBa5NAmFec7ebWSQurSqJ4
 oIQ2Zi0tzqRGMVfCESwxNsJxL6FuttmC+71ZM7C5t53TeXUm0pT+bhiJDHKRUvQClca7
 Bnu0hS+lvQoGsE7ki1jy/U9S3NpPuAFaMiwIWiPdaiZp/u+YagcS1yt70Gliw5cvtXve
 A6lw==
X-Gm-Message-State: AGi0PubgLwkGh5kIaGRPRpUeNfecLmWMqRArPbXHgL72toZHqkLjeuTN
 c+iD6b91iYCXTUWXFksjZqY=
X-Google-Smtp-Source: APiQypIUZJI4F6AZaaYtMHcvccg6xv8A60GVGB38/2fKc50ytb5V2ZuNf/Ma/ky8r3SzOqKqlsEbhg==
X-Received: by 2002:a7b:c156:: with SMTP id z22mr3973885wmi.51.1588335350613; 
 Fri, 01 May 2020 05:15:50 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id a24sm3644621wmb.24.2020.05.01.05.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 05:15:50 -0700 (PDT)
Date: Fri, 1 May 2020 12:15:48 +0000
From: Wei Liu <wl@xen.org>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] tools/xl: vcpu-pin: Skip global affinity when the hard
 affinity is not changed
Message-ID: <20200501121548.2iv5hbztxmcsxjwa@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20200430110051.8965-1-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430110051.8965-1-julien@xen.org>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 30, 2020 at 12:00:51PM +0100, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> After XSA-273, it is not possible to modify the vCPU soft affinity using
> xl vcpu-pin without modifying the hard affinity. Instead the command
> will crash.
> 
> 42sh> gdb /usr/local/sbin/xl
> (gdb) r vcpu-pin 0 0 - 10
> [...]
> Program received signal SIGSEGV, Segmentation fault.
> [...]
> (gdb) bt
> 
> This is happening because 'xl' will use NULL when an affinity doesn't
> need to be modified. However, we will still try to apply the global
> affinity in the this case.
> 
> As the hard affinity is not changed, then we don't need to apply the
> global affinity. So skip it when hard is NULL.
> 
> Backport: 4.6+ # Any release with XSA-273
> Fixes: aa67b97ed342 ("xl.conf: Add global affinity masks")
> Reported-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Wei Liu <wl@xen.org>

> ---
>  tools/xl/xl_vcpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/xl/xl_vcpu.c b/tools/xl/xl_vcpu.c
> index 9ff5354f749b..66877a57dee4 100644
> --- a/tools/xl/xl_vcpu.c
> +++ b/tools/xl/xl_vcpu.c
> @@ -283,7 +283,7 @@ int main_vcpupin(int argc, char **argv)
>      }
>  
>      /* Only hard affinity matters here */
> -    if (!ignore_masks) {
> +    if (!ignore_masks && hard) {
>          libxl_dominfo dominfo;
>  
>          if (libxl_domain_info(ctx, &dominfo, domid)) {
> -- 
> 2.17.1
> 

