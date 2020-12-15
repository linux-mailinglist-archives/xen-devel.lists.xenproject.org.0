Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D35AD2DB171
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:30:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54492.94708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDDW-0005Jp-58; Tue, 15 Dec 2020 16:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54492.94708; Tue, 15 Dec 2020 16:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDDW-0005JQ-1q; Tue, 15 Dec 2020 16:30:26 +0000
Received: by outflank-mailman (input) for mailman id 54492;
 Tue, 15 Dec 2020 16:30:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SBK9=FT=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kpDDU-0005JH-Co
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:30:24 +0000
Received: from mail-wm1-f43.google.com (unknown [209.85.128.43])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35d8356b-d5c9-46ab-a378-28ed7d16c5a2;
 Tue, 15 Dec 2020 16:30:23 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id v14so17434642wml.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Dec 2020 08:30:23 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id l16sm39208219wrx.5.2020.12.15.08.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 08:30:21 -0800 (PST)
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
X-Inumbo-ID: 35d8356b-d5c9-46ab-a378-28ed7d16c5a2
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sol3DqdqjvPfzZLv9LxukCVxPxOlrQeDo4/RylqHliE=;
        b=RpDWkijXdZ8/1w8hH+wIgX0B3JQsy9I9e90GEsySZtSWvzXM02a2YLgq+CU+4hmm5S
         Q/S2Er+Y+qtb9xgpagzfMN0OcuFNEchRYnQDc+RH4Um4+rvzhCdkZ2ixZ14O4fbrhhuw
         E2bKy5XuBXSdPXb8DpkjzD6mJ0pp4YHUWcTL5sNG+w++AXJoZ1ByCq+7Zax6A8oNe3xa
         Ee1qu/Cf5xXR0lC+ybDN+G6hman4BrusvtIzhuwAQFqbIFgXbybRe0r7IdYSC+DSp220
         OuxHk/KU1EPnLXPVQwWgYGAxOPYftMb510IW2Hoe4dnVs6t30ffM35HeIoAtZQdP+55B
         EFOw==
X-Gm-Message-State: AOAM530huMcc9otddcdfZWk59PV9am5nwalyB105h8LxTlqvmZV0Q3KM
	TghM5m+4WMItUdCCZxWvTLsOxd75ZYQ=
X-Google-Smtp-Source: ABdhPJyy1umDtSjhcYwHQAtgqDHUbyxRLLaq6ibsWFtTBd0l0QNYKDrpF6dsqvq6zUP4lxvOKM6rXg==
X-Received: by 2002:a1c:9949:: with SMTP id b70mr8154398wme.72.1608049822385;
        Tue, 15 Dec 2020 08:30:22 -0800 (PST)
Date: Tue, 15 Dec 2020 16:30:20 +0000
From: Wei Liu <wl@xen.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
	Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH v1 3/3] tools: add API to work with sevaral bits at once
Message-ID: <20201215163020.tbam3pktisoyksun@liuwe-devbox-debian-v2>
References: <20201209155452.28376-1-olaf@aepfle.de>
 <20201209155452.28376-3-olaf@aepfle.de>
 <20201215162244.mln6xm5qj7pmvauc@liuwe-devbox-debian-v2>
 <20201215172917.556071ff.olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201215172917.556071ff.olaf@aepfle.de>
User-Agent: NeoMutt/20180716

On Tue, Dec 15, 2020 at 05:29:17PM +0100, Olaf Hering wrote:
> Am Tue, 15 Dec 2020 16:22:44 +0000
> schrieb Wei Liu <wl@xen.org>:
> 
> > What's wrong with requiring the input addr be const unsigned long *?
> 
> Probably nothing. In the end I just borrowed the prototypes from the other functions in this file.
> 
> I will resend with this change once I have the consumers ready.

Okay.

I will push the first two shortly.

Wei.

> 
> Olaf



