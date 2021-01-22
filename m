Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 394C2300573
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 15:32:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72809.131172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2xTj-0003dK-3n; Fri, 22 Jan 2021 14:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72809.131172; Fri, 22 Jan 2021 14:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2xTj-0003cv-0W; Fri, 22 Jan 2021 14:31:59 +0000
Received: by outflank-mailman (input) for mailman id 72809;
 Fri, 22 Jan 2021 14:31:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MnA5=GZ=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1l2xTh-0003cq-Mh
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 14:31:57 +0000
Received: from mail-qt1-x834.google.com (unknown [2607:f8b0:4864:20::834])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a42f0737-8106-447d-845b-b6e20bfe7d37;
 Fri, 22 Jan 2021 14:31:56 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id d15so4159113qtw.12
 for <xen-devel@lists.xenproject.org>; Fri, 22 Jan 2021 06:31:56 -0800 (PST)
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com
 (209-217-208-226.northland.net. [209.217.208.226])
 by smtp.gmail.com with ESMTPSA id 193sm473557qko.5.2021.01.22.06.31.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 06:31:55 -0800 (PST)
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
X-Inumbo-ID: a42f0737-8106-447d-845b-b6e20bfe7d37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xb/NfHwiQDT7NexstTisYv8z4CpjX2s4Jv5RabQVz2s=;
        b=YC28KwFuOJOMz3lBLWvLY2kdxJvX0zbjd2l/90rpeb9FdPEynV65MWvj9pkdI0mpCc
         axjIQcHEbyrJmVZE+9d1X6zcvE7YNa1IrS1H8s6foAKZqG0dYSCxx0UcIkW310Kjw6Wd
         LL8qg5esDDCxqWnTsqR+RqV96Jo8wdVnh3v0RbJUY1YNFH3ZGWt4gI/CI6gJb4YJvy9L
         tHR7VLBYxGCbJRO5/Zn3rMUhI+MLwUPYWKFwnW36nwYERNiswIHc1/Ca0q901CDUlAyr
         unfOpnzzqYHQ21GvNLtDXCxlW0roWgpr4hwY5Kr5cITSFcWXiLUTBNkCSLzs1I/eVvAg
         c7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xb/NfHwiQDT7NexstTisYv8z4CpjX2s4Jv5RabQVz2s=;
        b=M/6Yj7E5pUHfOImAB0JQkZ/W5+DJwblP6yPnt3tUO4JqDdAVXZzOMMgGcCIDSt1n41
         Aisj8t01+hol2o+NY+zqEIsbJJ3iEL+RkadMJIUmQmU7AWR2J8KjPHoscu1NkIWdA9/I
         ojus+F+XeocUUlan0MKx3+sqyzGBYQc+eKvBTkWASFDwKIGdn4Gsqg3jVwAq15+gvnqw
         IQSyL7iKiExBSQ6RC47SGaY7M42DZKe+qvgpSRGGgb1b4aX6cSXnz2mdsuAZTcC1ACcD
         TP2AUEqZWYGf3/o9EUmyuCc/I3ELG9p244Dfq3lPm7rkod2j+kmGPfuayP7EzSQ0WyE4
         MqVg==
X-Gm-Message-State: AOAM532yjN2Z9xfbNuU7sAODWfcsdQqU5jTZaxWfeZakn6Dw+1P7ddyA
	ysbzNvL5Sm06dO13XmXMbV0=
X-Google-Smtp-Source: ABdhPJyE2mgh6lkoSNd/wp27jcN6xObIEDqsSCXAi7ZZYGAqtbOZUHpV1sob6BmnBKckqKP7FG7tmw==
X-Received: by 2002:a05:622a:4d1:: with SMTP id q17mr4588221qtx.272.1611325916502;
        Fri, 22 Jan 2021 06:31:56 -0800 (PST)
Date: Fri, 22 Jan 2021 09:31:48 -0500
From: Nick Rosbrook <rosbrookn@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@eu.citrix.com>
Subject: Re: [PATCH] golang/xenlight: Refresh generated helpers are recent
 libxl changes
Message-ID: <20210122143148.GA138904@FED-nrosbr-BE.crux.rad.ainfosec.com>
References: <20210122131801.32457-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122131801.32457-1-andrew.cooper3@citrix.com>

On Fri, Jan 22, 2021 at 01:18:01PM +0000, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I think you mean "after recent" rather than "are recent" in your commit
message. But otherwise,

Acked-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Thanks,
NR

