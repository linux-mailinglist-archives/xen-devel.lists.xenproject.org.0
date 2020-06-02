Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A13561EB6A6
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 09:41:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg1Y3-0003T8-Iq; Tue, 02 Jun 2020 07:41:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJcj=7P=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jg1Y1-0003T2-Uj
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 07:41:21 +0000
X-Inumbo-ID: 73a4afee-a4a4-11ea-8993-bc764e2007e4
Received: from mail-wr1-x42b.google.com (unknown [2a00:1450:4864:20::42b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73a4afee-a4a4-11ea-8993-bc764e2007e4;
 Tue, 02 Jun 2020 07:41:21 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id l11so2322045wru.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 00:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=J2qzcc0mM6+evxoK3O/eOKWETXObcDS1zCOMTzA+6+8=;
 b=gAL25/v9ExCE1WBka8eJ/dQ2kRbDKpMpYWf7XcKQfCjPIbpNy80IJjPleRH7PdZoXI
 DyJGmY6LOZWC527IMq0w928o5f1Lss0/HIlAwqHdDzqw2e2Ka0+EyORGNC8VHnWfigK8
 Pc33BIhelYqHpPP2vUzy2+rrDUE/VEAi7sbQqZmYZOXea09/s/YTXREbGHabysz62MOY
 B3nu9A/wgy1xeige/D2M3Ej5HBjpOXjpR1IisuBayBvjb2Z9JQ6Xw93U6IOKedjpv9Jy
 E9e0R1Nxd0aHYzCD9u5LmWydfgMrE87ZEsrJD5YRYDMJgzQ/2QDomPwvfe6XpTqgfScE
 9I4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=J2qzcc0mM6+evxoK3O/eOKWETXObcDS1zCOMTzA+6+8=;
 b=UIYi5shuKNoKmzH/L0h4+CXd6ic54RuyxZ8j8LdPmScF8OrpmExhibiIWZxMZn/Yh7
 OSrs8PTRDId00FI+S8PnPRWaOyFk3j64cww5uA10k8TLjJtjU3rjvvp2bZswpeUUSICq
 i8CZgqlZmpoAYCDgERxb6fmyuPKrjaX7pQrrvRsfobB0gwgb3v5Gl3mgOKXhoM0WGxax
 5xrq3NlAo5DoCKDjpox9GBpJEQRc3WFPfZsAZYMusrMqo6ekwF2hKSpGP6JfgAzBM4Dx
 dSVsVtXKAJ0kOFMt4CyV3B3xOWPDLmDb2DW2tOEdibX2UtZMr1jJUjA5g4fz0aPo3Tnj
 objQ==
X-Gm-Message-State: AOAM531WnyMcjTKtSLU2WPgaLTTHGaeazkY9iFnSQbERILbdv7A4B18s
 AdR5PDD/XAWZ/tHqxge1srAy2ExuCKk=
X-Google-Smtp-Source: ABdhPJzF1FLdDbyKjJBq7bScm6ULi33CXiK9QomLLNWD+YhDQDKHooQmgNBcitVJDw5+HFKQ4hrkDA==
X-Received: by 2002:a5d:4d92:: with SMTP id b18mr26664313wru.296.1591083680684; 
 Tue, 02 Jun 2020 00:41:20 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id l5sm2137061wml.27.2020.06.02.00.41.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jun 2020 00:41:20 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Juergen Gross'" <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <20200602060021.23289-1-jgross@suse.com>
In-Reply-To: <20200602060021.23289-1-jgross@suse.com>
Subject: RE: [PATCH-for-4.14 0/2] tools: some fixes for the hypervisor file
 system
Date: Tue, 2 Jun 2020 08:41:19 +0100
Message-ID: <003301d638b1$34e8d7d0$9eba8770$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFvI0wj0/JVpgBgdcOTnMUdilmoB6mTG5Hw
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
Reply-To: paul@xen.org
Cc: 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Juergen Gross
> Sent: 02 June 2020 07:00
> To: xen-devel@lists.xenproject.org
> Cc: Juergen Gross <jgross@suse.com>; Ian Jackson <ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>
> Subject: [PATCH-for-4.14 0/2] tools: some fixes for the hypervisor file system
> 
> Juergen Gross (2):
>   tools: check return value of asprintf() in xenhypfs
>   tools: make libxenhypfs interface more future proof
> 
>  tools/libs/hypfs/core.c             |  2 +-
>  tools/libs/hypfs/include/xenhypfs.h | 31 +++++++++++++++++------------
>  tools/misc/xenhypfs.c               | 10 ++++++++--
>  3 files changed, 27 insertions(+), 16 deletions(-)

Release-acked-by: Paul Durrant <paul@xen.org>

> 
> --
> 2.26.2
> 



