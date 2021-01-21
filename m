Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC672FEDD6
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 16:01:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72155.129659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bSo-0003R0-FG; Thu, 21 Jan 2021 15:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72155.129659; Thu, 21 Jan 2021 15:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bSo-0003Qe-Bv; Thu, 21 Jan 2021 15:01:34 +0000
Received: by outflank-mailman (input) for mailman id 72155;
 Thu, 21 Jan 2021 15:01:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dq2E=GY=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1l2bSm-0003QW-W7
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 15:01:33 +0000
Received: from mail-wm1-f47.google.com (unknown [209.85.128.47])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d85e010-4fcc-4588-b66e-02fc498b6081;
 Thu, 21 Jan 2021 15:01:32 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id m187so1717684wme.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jan 2021 07:01:32 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id s13sm8796395wra.53.2021.01.21.07.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 07:01:30 -0800 (PST)
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
X-Inumbo-ID: 4d85e010-4fcc-4588-b66e-02fc498b6081
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EaOxZaMZ6h5dQMil82LxJAoXq7ASMZ3nv9ZjRWijtko=;
        b=QUh7G17em2hJN/nR6rbER5pCEBFIRk1NsvAIeTwp4cnM+KovFf3AMU0xz0DM6lkFco
         +RbcxYF7mir9UpTFLY134dVFu7O5JAm2crZsoB48eznpTD1vj7as8eayXEIK0YQ0bQbx
         j2mfNRmgd7Q/pEjWd0gD1ObaJcdXsYpmunEFIinTEKflLxyNmrop7m79XqJhUTwJQva3
         bH/fuSyQGinj/sncGX+LDl2Ye8Io6pik9OYIBqKcP6ELgtwj+HQ0b7GDhW/6UUW9AQ0z
         HlC1k7tpXQ4EMt65MLW1I6VIfZob4aktDWt5pH1zVqs4l/Q/x15nL3g+RxDJzCiOv4v7
         HnJg==
X-Gm-Message-State: AOAM530vRlOe63f9BNN1AzSZ96gRcekY5Hw4ddst/mgW0WgxE16O+36t
	IOjCpOlCxFO/yDZcGf3EwFI=
X-Google-Smtp-Source: ABdhPJwgrsp2cSBk0QFEtz4OUr2XDxPdftUXRs2S9/VmiMNgOYBXNZ4hOlBU35KyiHJcAbNbzMme0w==
X-Received: by 2002:a1c:2905:: with SMTP id p5mr9271646wmp.156.1611241291468;
        Thu, 21 Jan 2021 07:01:31 -0800 (PST)
Date: Thu, 21 Jan 2021 15:01:29 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/5] xen/decompress: make helper symbols static
Message-ID: <20210121150128.6stwa6ezhj3orlfw@liuwe-devbox-debian-v2>
References: <aab9e3e6-5125-6b0a-6cd4-960fd783b1b2@suse.com>
 <80b7e64d-02b3-55c6-1379-4ac9f77d3869@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80b7e64d-02b3-55c6-1379-4ac9f77d3869@suse.com>
User-Agent: NeoMutt/20180716

On Tue, Jan 19, 2021 at 04:15:53PM +0100, Jan Beulich wrote:
> The individual decompression CUs need to only surface their top level
> functions to other code. Arrange for everything else to be static, to
> make sure no undue uses of that code exist or will appear without
> explicitly noticing. (In some cases this also results in code size
> reduction, but since this is all init-only code this probably doesn't
> matter very much.)
> 
> In the LZO case also take the opportunity and convert u8 where lines
> get touched anyway.
> 
> The downside is that the top level functions will now be non-static
> in stubdom builds of libxenguest, but I think that's acceptable. This
> does require declaring them first, though, as the compiler warns about
> the lack of declarations.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Wei Liu <wl@xen.org>

