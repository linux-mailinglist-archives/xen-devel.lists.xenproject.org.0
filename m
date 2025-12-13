Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0FFCBA63C
	for <lists+xen-devel@lfdr.de>; Sat, 13 Dec 2025 07:52:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186166.1507997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUJU9-00025k-Tu; Sat, 13 Dec 2025 06:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186166.1507997; Sat, 13 Dec 2025 06:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUJU9-000243-Qr; Sat, 13 Dec 2025 06:52:09 +0000
Received: by outflank-mailman (input) for mailman id 1186166;
 Sat, 13 Dec 2025 06:52:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q/lp=6T=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vUJU8-00023W-5d
 for xen-devel@lists.xenproject.org; Sat, 13 Dec 2025 06:52:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d4d5365-d7f0-11f0-b15b-2bf370ae4941;
 Sat, 13 Dec 2025 07:52:07 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 72AF04EEBFCB;
 Sat, 13 Dec 2025 07:52:06 +0100 (CET)
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
X-Inumbo-ID: 3d4d5365-d7f0-11f0-b15b-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1765608726;
	b=3xY0sUr0OOhD9U3KEFIP449sBL95zxAPi++AYzcj0hyu/th6oWo/FKdX785q4co15UW+
	 3QHmkwXqP84381cLV+BMBYe+bF4le8jrU0T1MqY7eTdt8ArIW+muDQwXBrGr5zePM68VL
	 dD5Yh7Ah4dNvVwAIhi/E0aMcdbSVJLa83kY4yahBhfwm9P0TlU2lBcB8G0Fc+6DOLIoKm
	 2qgOvf9udJLcKa9V+zoXYmpb6QaIEd1wYqqZ0aw5jvoWNRAmbBLZCJOLLMZ7l79BTywVu
	 RjD00Pg8CPu6NXEsURlBD5Te/dau87YT8nrXHq2UevGsOXbCZ0VmCoAoZZ1cFA1wWjqtN
	 14ZMw7vlwfLPOYCB48j04KR5biCmcRVeGOcHzg1Bp1l4/7RMB/Yd7RpWEbc3B/AJN0Xxd
	 bKfqq7/hLFSzUehXmiBvc4BjZMt6WUjIbi/xFBSJfa6F10+O5C0shttKPlr+eE/SulbrU
	 YhcUrDpVreFeG4uzme3+OK5QWmfhm5UjxDYXp0N4szYnuuheHwfuZ9UI7HRY5d6rCa9D1
	 g0/zjBzWVXfHqxlLmloM3uPCbhlr5Sw9HPcy1LpXxAxubxbgxc1rumprskAq/3+TVf1lM
	 Ysabw54bKVch6tAP42W5BWWA9W+Ev/ME7ymZJCdVP5JEP1bDRWR9vRrsI4E0fP4=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1765608726;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=6B0h6GcE1DzTz+ueOBRGU0cA7XtqcKZu7VR6ldWdmnE=;
	b=47qi4WoPPiv0RE2VmeD8dkeX2GBqCZI+9TSabVZReBg0rjc52j+L0EK4tcqX5t8RUC6L
	 99uT9ehkAp53M8SRLEeq+sfPCK7NFfoY3d3dksw/fCyeze/GFy9ojo7CMNBGUqvelNcL1
	 aujY+pXw8R65xCMtCaLdcB6+Cnbm6B9+nOb5jHeKaNiU/BHj2SLPyyTAGUEnjojFQcdaq
	 ggyUC9X2Dh3JgZ2xfeDkAv7sqPJsNsxI1T30XEohyZT8e9/2+WCN6Lymva3yKx/9bgcRm
	 A7S8fmT/dCHs1LpCX8Z5U/PtzvIxpK33eiA16jFafuC9RSH5iyQY7K95C9YpJM6ff9ETs
	 sNvGDv6lf6TQZ0ivf4aCw721GET9QVxK0/peO8YPFPukRkVTR8nRAnJSFGtFuOi7jA2ez
	 EcfsF1iHDC0Nw0Qty9xpf8gpWjXxS5axnl6THrom9TwqvRtq9DINvPMSNqEXEcdKHLlMa
	 D3gX0UeQFm6teT9xB3qIWewYY5rvbpnt7/1Ld8ighFNVv2h1TJAERJAvAiSp4t9swMxhf
	 CEvT/vjAqI2ca9tJEdUMWSBzoTWfViqTiQcJGf8+1Gb479JW5jUQ4yyf0sppE96hnbAP8
	 lWrCV7ttR5SR4wmc+j5t6nknnatwxznXNsjeAyArhYGKdfbIKZWkhpyGNT8HhqE=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1765608726; bh=J/E5f6JxbhkB6fyiwvQs060/jJRF0mRCGZWa5J5sz1w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LnMwCNfEzBA38Ju6paqn2mQk05O6EugJKFAxWmjnGqbRqF9w5VRniCOra5usu8iUp
	 eO18k2iF4E5d/Q1XCys1bNmvPXRF94Z9xP4gy1ts+ptDWH9ju3WbKMwwd16p7MFvDo
	 0jTca2xba5FYHb3v3sEuokX++t+qQZJSVhhjIGP6jGpp7YxQZGB4/GXIMEstq2+v/v
	 wX/qwdsvN+LidokA/zsETHB8zk1A/mY2Zov1lZB1EXeSNYNZx1fIWhGioooub6Qpnz
	 cvFP1C5REnCjvnAB+2dJ5etywceWg6q1Qoc4iJdwfbTv1ncYvBWArCgWeT9Vczn5dX
	 We1wtPK/vFwyw==
MIME-Version: 1.0
Date: Sat, 13 Dec 2025 07:52:06 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH 1/5] x86/pv: Address MISRA C:2012 Rule 4.1
In-Reply-To: <20251212222032.2640580-2-andrew.cooper3@citrix.com>
References: <20251212222032.2640580-1-andrew.cooper3@citrix.com>
 <20251212222032.2640580-2-andrew.cooper3@citrix.com>
Message-ID: <968b6e74bfd94ad6ad6465f8ef6e8d49@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-12 23:20, Andrew Cooper wrote:
> MISRA doesn't like mixing hexadecimal escape sequences with ASCII text. 
>  Use
> the same workaround as in commit cd5048353725 ("xen: address MISRA 
> C:2012 Rule
> 4.1").
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/arch/x86/pv/emul-inv-op.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/pv/emul-inv-op.c 
> b/xen/arch/x86/pv/emul-inv-op.c
> index 314ebd01cb34..346ac1124d7b 100644
> --- a/xen/arch/x86/pv/emul-inv-op.c
> +++ b/xen/arch/x86/pv/emul-inv-op.c
> @@ -26,7 +26,7 @@ static int emulate_forced_invalid_op(struct 
> cpu_user_regs *regs)
>          pv_inject_page_fault(0, eip + sizeof(sig) - rc);
>          return EXCRET_fault_fixed;
>      }
> -    if ( memcmp(sig, "\xf\xbxen", sizeof(sig)) )
> +    if ( memcmp(sig, "\xf\xb" "xen", sizeof(sig)) )
>          return 0;
>      eip += sizeof(sig);

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

