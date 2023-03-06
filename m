Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A82AF6AC4D2
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 16:27:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507013.780248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZCk4-0003z6-PW; Mon, 06 Mar 2023 15:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507013.780248; Mon, 06 Mar 2023 15:27:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZCk4-0003wp-MO; Mon, 06 Mar 2023 15:27:12 +0000
Received: by outflank-mailman (input) for mailman id 507013;
 Mon, 06 Mar 2023 15:27:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aUxP=66=gmail.com=wei.liu.linux@srs-se1.protection.inumbo.net>)
 id 1pZCk3-0003wj-53
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 15:27:11 +0000
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c675a78-bc33-11ed-96b5-2f268f93b82a;
 Mon, 06 Mar 2023 16:27:10 +0100 (CET)
Received: by mail-wr1-f51.google.com with SMTP id v16so9286988wrn.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Mar 2023 07:27:10 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a056000014100b002c5534db60bsm10414947wrx.71.2023.03.06.07.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:27:08 -0800 (PST)
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
X-Inumbo-ID: 5c675a78-bc33-11ed-96b5-2f268f93b82a
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678116429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjzbTdN7CLD76LwUYgSQFGlrkv+uCLMJlqFIMmRORpA=;
        b=4cdzewtHR1wPXl4evobT8E1MmtldqxsY+6nyVzADysCNxPDfxPpx8bwch4Pblt7cuF
         EIs/w5oYEVZGvbTI5oFwfCWupIT4ac8GburVWOPV55e1TWWHriG+vvwd4B/67nhtcgAW
         ofrkNapXxSEEb+R5pFHTnfd3WTkAYBi5ygnMr+1hFJe7cNNwa8jDn7PL7DpIW+PzBtTo
         rH/EEmkBwiKkeJ2dueISm3CIrI3bJTRnKahUfYywe+kLIChVqQEU9QlcAlsiXX0sP+Fi
         iVPasksnfGqUa11BKgnb7keTHzJn9+7U4H+iMnOQa5kPfRgVYVj+oo1w8L2LHBtTUima
         rhzg==
X-Gm-Message-State: AO0yUKVgrZj4PUtAmGvVa2ZbzvtyQ9SS2my1hnlQIABzDLFDEX7X3Nqf
	aLhxha5YbXF889q0v4arRFs=
X-Google-Smtp-Source: AK7set8sLVDUwT8GQGScn0gVSp+FOGcmG6WKTOjmYMNL/6orgxuEwPFL/9jsyQwuVKKF6cXajJRglg==
X-Received: by 2002:adf:eb4b:0:b0:2c6:e744:cf71 with SMTP id u11-20020adfeb4b000000b002c6e744cf71mr6185222wrn.52.1678116429360;
        Mon, 06 Mar 2023 07:27:09 -0800 (PST)
Date: Mon, 6 Mar 2023 15:27:03 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: ebiederm@xmission.com, keescook@chromium.org, yzaikin@google.com,
	jejb@linux.ibm.com, martin.petersen@oracle.com, minyard@acm.org,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, song@kernel.org, robinmholt@gmail.com,
	steve.wahl@hpe.com, mike.travis@hpe.com, arnd@arndb.de,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, jgross@suse.com,
	sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org, j.granados@samsung.com,
	zhangpeng362@huawei.com, tangmeng@uniontech.com,
	willy@infradead.org, nixiaoming@huawei.com, sujiaxun@uniontech.com,
	patches@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	apparmor@lists.ubuntu.com, linux-raid@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-hyperv@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] hv: simplify sysctl registration
Message-ID: <ZAYGR4DFQrjZVpC5@liuwe-devbox-debian-v2>
References: <20230302204612.782387-1-mcgrof@kernel.org>
 <20230302204612.782387-4-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302204612.782387-4-mcgrof@kernel.org>

On Thu, Mar 02, 2023 at 12:46:08PM -0800, Luis Chamberlain wrote:
> register_sysctl_table() is a deprecated compatibility wrapper.
> register_sysctl() can do the directory creation for you so just use
> that.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

Reviewed-by: Wei Liu <wei.liu@kernel.org>

