Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9BB83DEA2
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 17:26:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672209.1045961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTP1Y-0001Zy-1D; Fri, 26 Jan 2024 16:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672209.1045961; Fri, 26 Jan 2024 16:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTP1X-0001YM-Ut; Fri, 26 Jan 2024 16:25:47 +0000
Received: by outflank-mailman (input) for mailman id 672209;
 Fri, 26 Jan 2024 16:25:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rTP1W-0001YG-G3
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 16:25:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rTP1V-0008BC-MS; Fri, 26 Jan 2024 16:25:45 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[10.95.150.130]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rTP1V-0003dP-HB; Fri, 26 Jan 2024 16:25:45 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=cauZwwELulWy2Y9mGSzTSjJO8JjS63NT8NhM5i3xACQ=; b=e7ylTZU9l8aphIwAhsEmpBGiJ8
	UXlct+dg3G1X3S4znmibIygmw65gH53ohxHE8ThKoX9RmG3wghrxFdVf8acvIm4ZAlPx1DDaMjsLv
	jXHyjA9AdK8oQpBwjH3HUovpYgvUzrfOp2IMKGkClhxrnl3Hyha+VunnoVN7L2L0NYtQ=;
Message-ID: <ef91f9c3-7323-4685-9905-71e8f202a921@xen.org>
Date: Fri, 26 Jan 2024 16:25:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 28/33] tools/xenstored: split domain_init()
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-29-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240104090055.27323-29-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 04/01/2024 09:00, Juergen Gross wrote:
> Today domain_init() is called either just before calling dom0_init()
> in case no live update is being performed, or it is called after
> reading the global state from read_state_global(), as the event
> channel fd is needed.
> 
> Split up domain_init() into a preparation part which can be called
> unconditionally, and in a part setting up the event channel handle.
> 
> Note that there is no chance that chk_domain_generation() can be
> called now before xc_handle has been setup, so there is no need for
> the related special case anymore.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

