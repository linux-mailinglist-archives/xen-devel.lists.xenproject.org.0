Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 689783E50DF
	for <lists+xen-devel@lfdr.de>; Tue, 10 Aug 2021 04:06:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165247.302004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDH95-0004El-Vz; Tue, 10 Aug 2021 02:05:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165247.302004; Tue, 10 Aug 2021 02:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDH95-0004CX-Rv; Tue, 10 Aug 2021 02:05:35 +0000
Received: by outflank-mailman (input) for mailman id 165247;
 Tue, 10 Aug 2021 02:05:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2wAU=NB=kernel.dk=axboe@srs-us1.protection.inumbo.net>)
 id 1mDH94-0004CR-OB
 for xen-devel@lists.xenproject.org; Tue, 10 Aug 2021 02:05:34 +0000
Received: from mail-pj1-x1035.google.com (unknown [2607:f8b0:4864:20::1035])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d9e1b91-72e5-454f-986e-aa580cde29dc;
 Tue, 10 Aug 2021 02:05:33 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 pj14-20020a17090b4f4eb029017786cf98f9so3016808pjb.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Aug 2021 19:05:33 -0700 (PDT)
Received: from [192.168.1.116] ([198.8.77.61])
 by smtp.gmail.com with ESMTPSA id u3sm18289827pfn.76.2021.08.09.19.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 19:05:32 -0700 (PDT)
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
X-Inumbo-ID: 0d9e1b91-72e5-454f-986e-aa580cde29dc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4obz9WkqAEaS3SU/Ft8ZVbZx29A5UvHIZHpNuPkmvSk=;
        b=kZGou/+ar6VkGad2l0SxaqeFt1SKZRIzP9scQKzNs4UWQkTcp9RFq2j7DzVxV5KgyK
         5TlRRQZiF84syxutswoRu9al2wgA6RIdYNPOBxcnTDzmobwr5KimozZFSDPrq4diHXeX
         ipKAui0LFbQLJxIpk5KS/wFGdunbQWFii1rXT4wS1I8XQZsesNjv4HPv3iAD3ea+upBS
         JSg6AlDBdu61OSsdQuXUhveKPb1AmEK5XcKA36O+/DwyPCvucbwUCa4b3wIe+ypj3GQo
         a62adTZ9xmyyPOvuM6rVkvObTb2FdTjAK6ijP2kom0N55yhlEBTjNlqSbSS+QSc+1saE
         805Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4obz9WkqAEaS3SU/Ft8ZVbZx29A5UvHIZHpNuPkmvSk=;
        b=QXJCnCioXzNmO66HVI0a1kWEatLA8SJbrq9gQTWVVjBc+oTHKeGAw0vyN3G20/4uD6
         wW+//GoJ2xTbWCvrraoWUVz92OetIH17CygULPJBi44IMhFhHMA7qrNOC9PupZdpOmFV
         aXQhN+cm70PMXbDnvIddaJ/TZk5Dj2xPIVQTmLHgBpBSRPw9iqurB6WMelH9ym3OVSK2
         UOyIaJ6j5JrORkhjVm3RQHhcUoIZWFMx/TE3qAxvvGPXq5VObUg4JxGVCFV7YP4xcooy
         d7+NObklX5jwOXWIMUxaMBc5XWLGuMjlZ2wDSz/QkSnYFZoAQyJIPvtSc4SYNrwqKzYo
         RPpg==
X-Gm-Message-State: AOAM532ygwXSzQgywyJ/7ZbtIr3ATJPaCUAR4kwlpF6a8cui08fHyKpx
	wu8hJXBug6ZK+7XN1SJlscrYxA==
X-Google-Smtp-Source: ABdhPJwMjMG5NuvlBdsJwiOAWKSMNKV4GrcOGftPPG58i6c5kNWYn1StXNhVEiq6b+QLIyTgFs/jww==
X-Received: by 2002:a17:90b:17c3:: with SMTP id me3mr2143130pjb.203.1628561132632;
        Mon, 09 Aug 2021 19:05:32 -0700 (PDT)
Subject: Re: [PATCH] xen-blkfront: Remove redundant assignment to variable err
To: Colin King <colin.king@canonical.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210806110601.11386-1-colin.king@canonical.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <f87ecb57-12f7-71cd-29a7-9cecd6605c88@kernel.dk>
Date: Mon, 9 Aug 2021 20:05:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210806110601.11386-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/6/21 5:06 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being assigned a value that is never read, the
> assignment is redundant and can be removed.

Added for 5.15, thanks.

-- 
Jens Axboe


