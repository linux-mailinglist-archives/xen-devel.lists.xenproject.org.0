Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BB18C4CAD
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 09:14:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721154.1124315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6mMT-0002K7-CY; Tue, 14 May 2024 07:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721154.1124315; Tue, 14 May 2024 07:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6mMT-0002HL-9S; Tue, 14 May 2024 07:14:09 +0000
Received: by outflank-mailman (input) for mailman id 721154;
 Tue, 14 May 2024 07:14:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE3g=MR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6mMS-0002HB-1Y
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 07:14:08 +0000
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [2607:f8b0:4864:20::a2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d2ceef4-11c1-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 09:14:07 +0200 (CEST)
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-4df2d7dca64so1814223e0c.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 00:14:07 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf27519esm537383085a.1.2024.05.14.00.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 00:14:05 -0700 (PDT)
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
X-Inumbo-ID: 8d2ceef4-11c1-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715670846; x=1716275646; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zh1RffHNa9wwlkrdpu7DnVE6Qo+VeFhaWR5xsFAQZaI=;
        b=MCHg5V/+IR9/RY8ha3LcKyDI11TjswT4ZAJZJiWU5I1RK4IMEuWATq4KO0v6+LZJ51
         WRW71diUlv9HG14cvyw2o8iyK4xs0maz3ZueGVMr8E/u9jxN5Aq8nRCxseQQnYVGaTni
         jm9oyX9mthyZKtXmmQ+Ulh1RL/ef4VweatKbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715670846; x=1716275646;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zh1RffHNa9wwlkrdpu7DnVE6Qo+VeFhaWR5xsFAQZaI=;
        b=vF9SVR3zgefKNZ0vCC6ZUoycdN7H/de/vytN+6Cj8QS9avo5H98y4r+1lbRNTJm6Q2
         UqfDR0AzkxNqH8amXvWgaWZRoQgL/QHBxn3XRJyleBJnIxVEEy2PyFVagY6Lmn2oRHy2
         nJjXSNottNMkjQizsbRued4O1FkIPsbwwp0NoIolvPhaIKORAzXMiy7Sr7eHMEwbSu6h
         rtWY08iGoJRCPKbNkSL5Dvsvr/EtezoAcYgMxyB8LAb44bSNxrvAuZe4hqmcZJKG2Eje
         x8+Rr7FHBQal9rDiv8RPRt1CMZmCrcPBcI2W3xlAlhgsaB9jB9MaQHFL7Oo6BtREDTmx
         XP3g==
X-Gm-Message-State: AOJu0YwZ7Y8Vbxt9wM4ZeAZcfXdgXfanP6WudwZ3svdeP0jX+NLNOQXi
	04iwPAEEQa2oiDfSJMAuvzn6pJYvFa+8Jy4eGq3RruFI62Yd6lWQzamgKyDdLRc=
X-Google-Smtp-Source: AGHT+IE6zKyOOEa4jemmAxyAmUQImoNPSLLz+QQK2RoExEXXd4YpR78cj5OTGjMXPuL3P7qpXT0GgA==
X-Received: by 2002:a05:6122:178f:b0:4cd:20ea:35aa with SMTP id 71dfb90a1353d-4df882d442cmr9958340e0c.8.1715670845954;
        Tue, 14 May 2024 00:14:05 -0700 (PDT)
Date: Tue, 14 May 2024 09:14:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH 1/4] x86/gen-cpuid: Minor cleanup
Message-ID: <ZkMPOxF2aR6wp1Vj@macbook>
References: <20240510224002.2324578-1-andrew.cooper3@citrix.com>
 <20240510224002.2324578-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240510224002.2324578-2-andrew.cooper3@citrix.com>

On Fri, May 10, 2024 at 11:39:59PM +0100, Andrew Cooper wrote:
> Rename INIT_FEATURE_NAMES to INIT_FEATURE_NAME_TO_VAL as we're about to gain a
> inverse mapping of the same thing.
> 
> Use dict.items() unconditionally.  iteritems() is a marginal perf optimsiation
> for Python2 only, and simply not worth the effort on a script this small.

My understanding is that what used to be iteritems() in Python 2 is
the behavior of items() in Python 3 (return a generator instead of a
copy of the dictionary list).

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

