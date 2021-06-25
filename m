Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B113B4559
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 16:13:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147265.271320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwmZy-0004pt-K2; Fri, 25 Jun 2021 14:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147265.271320; Fri, 25 Jun 2021 14:13:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwmZy-0004nv-Gn; Fri, 25 Jun 2021 14:13:10 +0000
Received: by outflank-mailman (input) for mailman id 147265;
 Fri, 25 Jun 2021 14:13:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tpuW=LT=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lwmZx-0004np-2O
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 14:13:09 +0000
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ff3ae15-d344-434d-b3ce-931d23368bf2;
 Fri, 25 Jun 2021 14:13:07 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id e22so10782335wrc.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jun 2021 07:13:07 -0700 (PDT)
Received: from ?IPv6:2a00:23c5:5785:9a01:9da4:f15e:5616:d3e5?
 ([2a00:23c5:5785:9a01:9da4:f15e:5616:d3e5])
 by smtp.gmail.com with ESMTPSA id 12sm9532966wme.28.2021.06.25.07.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 07:13:06 -0700 (PDT)
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
X-Inumbo-ID: 7ff3ae15-d344-434d-b3ce-931d23368bf2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kmXKJJsN40CJbASCatuHJEFEeomHLNq1D39cTQAmCAg=;
        b=Kz+a6gBl+d8RQ87xxzczMNIm7rsS77JeyiNr7tWcK/fwlDxbEfCDdEk0nyb49nm/Eb
         oZL6FBnQ7598hZS1fu9RwtWwRcL8cdzdCjluN8oXaulSkE7zmOc7RO7wFMmQkXztHzr9
         tQvfylPHlCYjjZqIm7jCmBm93Ame6w1GQizrQaX2liNbrY0PSJ9FuSoOPzUGYKb6w92x
         Nf9mFqGV62qvMbsHR58iUqPLml5ihPsfqCAdBaVDqZfV/iOIEjTXUQy3FT78FIGDFjPA
         /hcl74KFyUvrpDl85O28SrcqQiX3EA/fvuUV0h7LJBalAVnT09gIAJYY5eCjkBacPlUd
         RmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=kmXKJJsN40CJbASCatuHJEFEeomHLNq1D39cTQAmCAg=;
        b=hOUQ5ui5ae33XY5e0+zL2C/8CW1KlQJFBqPvvZHnUaZBmV3qyaNrb3LouHWVahUrkj
         2ro9YpXFeYg3N+79jTP3f+h4vaNgdwIW9VKHbXHoTj5M8KcADOqB1T13eRH5wkTgK7ZO
         ogA2V3s0u773rQvNtM9l32qIgUzBu/oFpsorx+9xiFmc+QnXG21DZ+nx2g71WXs089C0
         gSE4mHOPqjKFho1KCDlxksEpAUT1px6yd++gqietYu8Pd7Ty3cvlkgCLsOctemR1uwXH
         9D3Zg3Mc8UquGjdeKr8dk0lth2F/jO0jCAsWzx5aijCt43X+50OapU7+rA/qnruXQMfD
         G5Nw==
X-Gm-Message-State: AOAM532F5qklxf/IuyF31nY1rm5axvHlxshBJyKyC4MnpV5LRvcOEyy5
	kpR4r4EzKh5dgFJknjFl6IU=
X-Google-Smtp-Source: ABdhPJz0aIxUGnGk+VQRQXI33YAaJsw35AG50dIliqYjxP+aIoIa6MgNPIAIGBENb424OlrT5RrxcA==
X-Received: by 2002:a5d:4b8d:: with SMTP id b13mr11284117wrt.147.1624630386896;
        Fri, 25 Jun 2021 07:13:06 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 2/2] AMD/IOMMU: re-work locking around sending of
 commands
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
References: <a6e72235-570b-c426-589c-236f37749e1e@suse.com>
 <80f6365d-4f0d-66b5-b0ab-99dfeb40bd31@suse.com>
Message-ID: <9c2c4888-3618-1d55-8283-36e95775ff98@xen.org>
Date: Fri, 25 Jun 2021 15:13:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <80f6365d-4f0d-66b5-b0ab-99dfeb40bd31@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25/06/2021 13:15, Jan Beulich wrote:
> It appears unhelpful to me for flush_command_buffer() to block all
> progress elsewhere for the given IOMMU by holding its lock while waiting
> for command completion. There's no real need for callers of that
> function or of send_iommu_command() to hold the lock. Contain all
> command sending related locking to the latter function.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

