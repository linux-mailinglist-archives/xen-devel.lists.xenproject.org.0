Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8473C9B2C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 11:11:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156520.288865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3xO5-0001Ue-BS; Thu, 15 Jul 2021 09:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156520.288865; Thu, 15 Jul 2021 09:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3xO5-0001S6-8C; Thu, 15 Jul 2021 09:10:33 +0000
Received: by outflank-mailman (input) for mailman id 156520;
 Thu, 15 Jul 2021 09:10:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m3xO4-0001Ru-1k
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 09:10:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3xO0-00012W-M0; Thu, 15 Jul 2021 09:10:28 +0000
Received: from [54.239.6.184] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3xO0-0006kZ-FU; Thu, 15 Jul 2021 09:10:28 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=3VpwnA7N1alMfr8qHWgGgPzsnqkGYoQ2phRHSIBRvWA=; b=fr1jAxmMqA6LoKF39iNjTa605P
	x/XLsYl7+PZ5mct9d2iI+zjHcRGzCnc/OlJ60BGImt1FOyvGEyHNi2Ia8wJ1z+LvB1ni+8OJkncpj
	dPZjY8Cj5iWll9OUKwtGXWJOKDCAyYjPB3dGA8XPHWEhhamFHpDMjnDaxsKGAY4FbrDs=;
Subject: Re: [PATCH v2] SUPPORT.md: add Dom0less as Supported
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 iwj@xenproject.org, wl@xen.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210714234809.30483-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <04d06f53-4489-1a08-e744-fa36679a2287@xen.org>
Date: Thu, 15 Jul 2021 10:10:26 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714234809.30483-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 15/07/2021 00:48, Stefano Stabellini wrote:
> Add Dom0less to SUPPORT.md to clarify its support status. The feature is
> mature enough and small enough to make it security supported.

I would suggest to explain the restriction in the commit message (and 
give a link to XSA-372 commit).

> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
> Changes in v2:
> - clarify memory scrubbing
> ---
>   SUPPORT.md | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 317392d8f3..524cab9c8d 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -832,6 +832,15 @@ OVMF firmware implements the UEFI boot protocol.
>   
>       Status, qemu-xen: Supported
>   
> +## Dom0less
> +
> +Guest creation from the hypervisor at boot without Dom0 intervention.
> +
> +    Status, ARM: Supported
> +
> +Memory of dom0less DomUs is not scrubbed at boot (even with
> +bootscrub=on); no XSAs will be issues due to unscrubbed memory.

The memory will not be scrubbed for bootscrub=on and bootscrub=off. 
However, it should be scrubbed for bootscrub=idle (the default).

Cheers,

-- 
Julien Grall

