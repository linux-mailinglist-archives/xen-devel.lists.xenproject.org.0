Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77D02CEECF
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 14:35:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44772.80228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klBF8-0002jl-Cz; Fri, 04 Dec 2020 13:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44772.80228; Fri, 04 Dec 2020 13:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klBF8-0002jP-9r; Fri, 04 Dec 2020 13:35:26 +0000
Received: by outflank-mailman (input) for mailman id 44772;
 Fri, 04 Dec 2020 13:35:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1klBF7-0002jK-1x
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 13:35:25 +0000
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a19e2fcd-3131-4979-9bdc-9a9b9714135c;
 Fri, 04 Dec 2020 13:35:23 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id 91so1389521wrj.7
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 05:35:23 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id f14sm3478347wme.14.2020.12.04.05.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 05:35:21 -0800 (PST)
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
X-Inumbo-ID: a19e2fcd-3131-4979-9bdc-9a9b9714135c
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CWUSlRXqW61ZWvUjZrkZz5dn8Il7W0zvyjkznQDqXjw=;
        b=DcnoX9TcQTy6jNERYxw1EKlvvZCZ6pF8zQmDu0L9eRBMPQDfIxx1fPV8dAdtM9eNXK
         AJpgoE07/FoDxTpAlAeCeFclSlI4z53awedvsOyAfW1kZK/9/WGrmxFTNTpf0T7p87Z3
         NeM03Lc5+F91dq+Ff1bAb4Gt006tawOcz8A0Rapg5UyxjicdGKFNN0CZho6mNxyitRr9
         OiixXwb8HJOSySdQnnk3Lcx2By4kK94Ge0ywWtMYejOdZYdB8WD92ixlhkKtL5nkCzYw
         8qqW7z5xLU18pxYq1K8srfAzM+FCs9x2jRa/QnZ3pjW2/PWmI3nz1v/2JcHWVhEDwD6Y
         4YJg==
X-Gm-Message-State: AOAM532zxydWH5rxC0FwF/mH957C/g29j0vj7qy2saA31hi+GyAILBWs
	4EPg/1RZ4+Y4RxklJkvBg+Y=
X-Google-Smtp-Source: ABdhPJwzhCUQ5lJ70g9opzHYZKcA3URKvwdPCp1LIlB4I8dGmK0kl/O+CpSH08NAcMESwehWTOeDUQ==
X-Received: by 2002:adf:a315:: with SMTP id c21mr4931570wrb.272.1607088922338;
        Fri, 04 Dec 2020 05:35:22 -0800 (PST)
Date: Fri, 4 Dec 2020 13:35:20 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] tools/libs/ctrl: fix dumping of ballooned guest
Message-ID: <20201204133520.57v2jjrhdzesaj5a@liuwe-devbox-debian-v2>
References: <20201111100143.13820-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111100143.13820-1-jgross@suse.com>
User-Agent: NeoMutt/20180716

On Wed, Nov 11, 2020 at 11:01:43AM +0100, Juergen Gross wrote:
> A guest with memory < maxmem often can't be dumped via xl dump-core
> without an error message today:
> 
> xc: info: exceeded nr_pages (262144) losing pages
> 
> In case the last page of the guest isn't allocated the loop in
> xc_domain_dumpcore_via_callback() will always spit out this message,
> as the number of already dumped pages is tested before the next page
> is checked to be valid.
> 
> The guest's p2m_size might be lower than expected, so this should be
> tested in order to avoid reading past the end of it.
> 
> The guest might use high bits in p2m entries to flag special cases like
> foreign mappings. Entries with an MFN larger than the highest MFN of
> the host should be skipped.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked + applied.

