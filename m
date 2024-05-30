Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE2D8D49FF
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 13:02:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732657.1138669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCdYN-0003w6-5j; Thu, 30 May 2024 11:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732657.1138669; Thu, 30 May 2024 11:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCdYN-0003uJ-1y; Thu, 30 May 2024 11:02:39 +0000
Received: by outflank-mailman (input) for mailman id 732657;
 Thu, 30 May 2024 11:02:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MghO=NB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCdYM-0003uD-1U
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 11:02:38 +0000
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [2001:4860:4864:20::30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f30d0aa-1e74-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 13:02:36 +0200 (CEST)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-24c9f628e71so369593fac.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 04:02:36 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-794abd39f03sm545342985a.123.2024.05.30.04.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 04:02:34 -0700 (PDT)
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
X-Inumbo-ID: 1f30d0aa-1e74-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717066955; x=1717671755; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+MY9kowjPktpaukRFVgqUmVbbj7WrzsZj/2n8vR/SgQ=;
        b=qvhD5z+8wjMECKylnJ6f9BaVCPZauGAepObvMcMFm8cInSGfc6s8B0cB2xo1Dl793u
         yjyN6F10EnjbmcXbOCElChKvsSw4tPeArxVPHRdscADidBUX1HVjBe8rjUqgT7zF4XBB
         qkcXa2h0+yZfVchfjAd1e4Ct03z+Z7xb6zD4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717066955; x=1717671755;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+MY9kowjPktpaukRFVgqUmVbbj7WrzsZj/2n8vR/SgQ=;
        b=GuqZ6fbQJL6jl5bdWWAsCyMhNmq+ulIfY8xwb0jRnTlAnB2N/6MDj958rkZAHN/6bF
         pK5MiTCSIoxezO8nKlmbFd5RsubdGZM7OzHJv7oHom5C7WmQ239jTKTve+Tvxz8aTgAr
         vhnYZYPAkRGCjcQ+dqaWVtGDxQZkFlEnp74OQlwchMinIDROtuzZrnriGzCNb3Ce+Kqu
         x5V/gzKsrjD3I4pQQs9ql3u6tn457ydu83aKegGvG9Qe/7pOKGFh+k52zbx6XdetXwrM
         n6ueFOS8z7YVBbrgiVmjOFCsb1lVr8kQ3FFILs3Mhq4kwbjqqCFV91hLeAeOmtKMcept
         2PgQ==
X-Gm-Message-State: AOJu0Yx6x46frKRiIaYn70NpbGVFLQFY8UIIjhxsMK0mAKR5LOTE9Hyj
	xpBSjo34zxVMSrdQoC9QM5EM8gB8PUrUktne8Ezi2l6b+r1xI8QFYHq/m2Va6aFLzwRYyD86tVk
	6
X-Google-Smtp-Source: AGHT+IGqG4hrRmq7ZsrUUzCmAL7M8TPeSQHtOxD7cumclVXEImEY0j/t0w7P/IrXFsUH/+cuaqbDJQ==
X-Received: by 2002:a05:6870:32c9:b0:24c:ac96:ac72 with SMTP id 586e51a60fabf-25060b76234mr1886703fac.19.1717066955343;
        Thu, 30 May 2024 04:02:35 -0700 (PDT)
Date: Thu, 30 May 2024 13:02:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH] tools: (Actually) drop libsystemd as a dependency
Message-ID: <ZlhcyOmu_Cc92pP5@macbook>
References: <20240530101439.16730-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240530101439.16730-1-andrew.cooper3@citrix.com>

On Thu, May 30, 2024 at 11:14:39AM +0100, Andrew Cooper wrote:
> When reinstating some of systemd.m4 between v1 and v2, I reintroduced a little
> too much.  While {c,o}xenstored are indeed no longer linked against
> libsystemd, ./configure still looks for it.
> 
> Drop this too.
> 
> Fixes: ae26101f6bfc ("tools: Drop libsystemd as a dependency")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

LGTM, but my knowledge of systemd is very limited.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

