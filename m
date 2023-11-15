Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5EF7EA5A7
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 23:00:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632019.985875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2eyE-0003ur-4E; Mon, 13 Nov 2023 21:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632019.985875; Mon, 13 Nov 2023 21:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2eyE-0003t7-15; Mon, 13 Nov 2023 21:59:50 +0000
Received: by outflank-mailman (input) for mailman id 632019;
 Mon, 13 Nov 2023 21:59:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r2eyB-0003si-Ua
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 21:59:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r2eyB-0002XA-5D; Mon, 13 Nov 2023 21:59:47 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r2eyB-0002hg-04; Mon, 13 Nov 2023 21:59:47 +0000
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
	bh=yF9heh1d2M/1XiSSjXZ8IP279IMbzxETsOcJvW6JBTI=; b=FEqT3ordQ0FoR1zpth0faJepqQ
	F6Y43K37QI/I+tz+lmy0+9p2mBCbpfSWh2ZzM43hmr0cblDXAmnMNLBeZHeqrtMb8MdIO2ucymVcK
	XOHj3Gk75/8Gk36gpH2LO3m3d81rmn4q3e9Y5r+ZAb2qKOfns9b79UksPouyIvtijCvw=;
Message-ID: <7799347c-c78c-4d5e-a908-b78c026b6b17@xen.org>
Date: Mon, 13 Nov 2023 21:59:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/29] tools/xenstored: get own domid in stubdom case
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-23-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231110160804.29021-23-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 10/11/2023 16:07, Juergen Gross wrote:
> Obtain the own domid from the Xenstore special grant entry when running
> as stubdom.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - replacement of V1 patch (ANdrew Cooper)
> ---
>   tools/xenstored/core.c   | 1 +
>   tools/xenstored/core.h   | 1 +
>   tools/xenstored/minios.c | 5 +++++
>   3 files changed, 7 insertions(+)
> 
> diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
> index 0c14823fb0..8e271e31f9 100644
> --- a/tools/xenstored/core.c
> +++ b/tools/xenstored/core.c
> @@ -2738,6 +2738,7 @@ static struct option options[] = {
>   int dom0_domid = 0;
>   int dom0_event = 0;
>   int priv_domid = 0;
> +int stub_domid = -1;

After looking at partch #25, I feel that it would make more sense if 
stub_domid is a domid_t and initialized to DOMID_INVALID.

At least this makes clearer that initial value is not supported to be a 
valid domid.

Cheers,

-- 
Julien Grall

