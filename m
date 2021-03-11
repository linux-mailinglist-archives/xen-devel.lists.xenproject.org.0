Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A99413377ED
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 16:36:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96666.183139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKNMB-000596-Pr; Thu, 11 Mar 2021 15:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96666.183139; Thu, 11 Mar 2021 15:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKNMB-00058h-Ma; Thu, 11 Mar 2021 15:36:11 +0000
Received: by outflank-mailman (input) for mailman id 96666;
 Thu, 11 Mar 2021 15:36:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m4nf=IJ=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1lKNMA-00058c-VV
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 15:36:11 +0000
Received: from mail-qk1-x72c.google.com (unknown [2607:f8b0:4864:20::72c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05769cc7-1b17-4eb8-98df-18100affbcb1;
 Thu, 11 Mar 2021 15:36:06 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id l4so21009157qkl.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Mar 2021 07:36:06 -0800 (PST)
Received: from doug-macbook.localdomain
 ([2600:1700:7b90:52f8:18d5:dd06:1f1d:2bc3])
 by smtp.gmail.com with ESMTPSA id z78sm2236981qka.38.2021.03.11.07.36.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 07:36:05 -0800 (PST)
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
X-Inumbo-ID: 05769cc7-1b17-4eb8-98df-18100affbcb1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cardoe.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w0hczY3LkgJQNxgNZ6U/OWoNmbhV17x3WYdNyRJJhBw=;
        b=b2GvqvrjleC4xULgYK/PfgYUd+n0n3S79qbY8+Y/xvpqFkYqwMX7EQAtc0CwK7y5So
         9rX3bv/mkv2Aldisdsa2ohFn3AoexK3kqsbwK26SRizk407KPSaIMLNorbWXmGsVrPD9
         DZ1m2UmNiMOCbKzc68NCKXg9NnprKclm4sGwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w0hczY3LkgJQNxgNZ6U/OWoNmbhV17x3WYdNyRJJhBw=;
        b=fPVPKRO6+/HFMXyN3FL//5ZXYbm0WPgwS7TJSRCPOXlWtez4lJopz6xu4TqORJt6y3
         yFq9wisnCZtgqhdeA9ZtXmI3b9KbnYDPyVAroP13Jj8q28/6sKqULPcCQI6JLYa8/7Z0
         fivuovRr2fDn+8FdIkWAPlit8LOEZe6zGmyleKmk0Rp03jJk0B7yr338mciqY5JOlpqz
         IOPBcduvCa2OnOnzTZdEfvBWdErH6qDXLNEsYdd7f8ojZof8lZDnpWOsJXHbi0W6FhDb
         H1Zrt2fji3j3cGxuYaRtJHWOALlCaI6Skm6DBJ7hIXVC9q1QHCXyGcOfxz+chFCizzhr
         pD/w==
X-Gm-Message-State: AOAM531xw2sfteLlbEy/EbHfUzg8i2JKoesE0LaZ75j7p9Ydb9nbLeWN
	GDp92CtRbIGIPtRI8w5DJ/BiwQ==
X-Google-Smtp-Source: ABdhPJwEYJcOfHKszMAtn0IELmw04x/5oGVu6GDCYtE9mZeq/O1QLu4/ZEjfWfAUnmJhmjW1HaCR5Q==
X-Received: by 2002:a37:2756:: with SMTP id n83mr8029246qkn.70.1615476966438;
        Thu, 11 Mar 2021 07:36:06 -0800 (PST)
Subject: Re: [PATCH for-4.15] automation: allow doing hypervisor only builds
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
References: <20210303143316.16840-1-roger.pau@citrix.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <3652cbaa-a073-feb3-8f2b-94b40e60f098@cardoe.com>
Date: Thu, 11 Mar 2021 09:36:05 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210303143316.16840-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 3/3/21 8:33 AM, Roger Pau Monne wrote:
> For things like randconfig there's no need to do a full Xen build, a
> hypervisor build only will be much faster and will achieve the same
> level of testing, as randconfig only changes the hypervisor build
> options.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
Acked-by: Doug Goldstein <cardoe@cardoe.com>

