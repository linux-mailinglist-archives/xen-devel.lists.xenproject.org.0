Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39389265F94
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 14:32:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGiDt-0005c1-2M; Fri, 11 Sep 2020 12:32:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yBET=CU=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kGiDr-0005bw-HF
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 12:32:11 +0000
X-Inumbo-ID: 8f4eb2e1-7e2c-44aa-aba4-fa78d735ee72
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f4eb2e1-7e2c-44aa-aba4-fa78d735ee72;
 Fri, 11 Sep 2020 12:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=bORYZWDf1rffSpwYycjSlG7aQn4NqchvSVlvtWvQo08=; b=7ID9IGCbGY45DsePKUtnYj4w2X
 IBUdcXhL5yVWA1BvQ+uJjU8lUqbel3cuB0Xm3TXLXkzJUss+2AaPyqghcZr29DIuNjDUZWa7SzGgd
 I6yoC0DjzWuAzbdYvDttBnXR3LUF07bvPF2WxZ1qz7GZZ5/+raJHCV/0XQitqBDGdaWc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kGiDq-0008JQ-1Z; Fri, 11 Sep 2020 12:32:10 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kGiDp-0003DV-Qv; Fri, 11 Sep 2020 12:32:09 +0000
Subject: Re: [PATCH v2] Arm64: force gcc 10+ to always inline generic atomics
 helpers
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
References: <0ad3619d-8be9-99bc-552f-675156c47dfe@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bbf3098b-48a9-a698-4a9a-a32ace297892@xen.org>
Date: Fri, 11 Sep 2020 13:32:08 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0ad3619d-8be9-99bc-552f-675156c47dfe@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 11/09/2020 11:45, Jan Beulich wrote:
> Recent versions of gcc (at least 10.x) will not inline generic atomics
> helpers by default. Instead they will expect the software to either link
> with libatomic.so or implement the helpers, which would result in
> 
> undefined reference to `__aarch64_ldadd4_acq_rel'
> 
> for us (not having any local implementation).
> 
> To keep the previous behavior, force gcc to always inline the generic
> atomics helpers.
> 
> Long term we probably want to avoid relying on gcc atomics helpers as
> this doesn't allow us to switch between LSE and LL/SC atomics.
> 
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

