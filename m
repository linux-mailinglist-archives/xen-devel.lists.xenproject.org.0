Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B64D7D5B98
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 21:38:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622581.969551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvNDo-0002cM-Cz; Tue, 24 Oct 2023 19:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622581.969551; Tue, 24 Oct 2023 19:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvNDo-0002aG-AE; Tue, 24 Oct 2023 19:37:48 +0000
Received: by outflank-mailman (input) for mailman id 622581;
 Tue, 24 Oct 2023 19:37:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gl3Y=GG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qvNDm-0002aA-L6
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 19:37:46 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc8a670a-72a4-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 21:37:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 59752CE3217;
 Tue, 24 Oct 2023 19:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE587C433C7;
 Tue, 24 Oct 2023 19:37:36 +0000 (UTC)
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
X-Inumbo-ID: cc8a670a-72a4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698176257;
	bh=e/eSZEg9BV9LnmEvjGQqc6ZSj8gRfnuncwrlp+xGSKA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mgnGYZe/AywodPxzMEolPQnr4rWHgDtpH6KCOJGkHzV9F5gzIMJf3bQB4PdIy3XLX
	 O5i6D/Laqv1hkZdE6TxyoVEWalNwLhCg480of6RLWWblqKvCjv/sV0KqXfpizGUz5q
	 HOEzJ39/Fw/4HF/HsadnVULe7IKRXOTciHo5G9nERVBwBVZPhmHzqkkI0D0D74Ldia
	 9s13MttMR06d4IvFoE2+KTxQKJkNvzf8aZ8NnE6fNQZcg7+o3nDVvlpr1nszsxNiW2
	 osqdElTixuJU+UAhfAESROASAP9y7HgeZzEDVtt1v2RLpqN6LWxkWT228WNrPPxxKz
	 GeQ6RkP4/SB0g==
Date: Tue, 24 Oct 2023 12:37:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <jgrall@amazon.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH for-4.19] xen/arm64: domctl: Avoid unreachable code in
 subarch_do_domctl()
In-Reply-To: <12FE5EA7-34F4-4FB4-A822-2AB5FCB0F2C7@arm.com>
Message-ID: <alpine.DEB.2.22.394.2310241236580.271731@ubuntu-linux-20-04-desktop>
References: <20231023175220.42781-1-julien@xen.org> <12FE5EA7-34F4-4FB4-A822-2AB5FCB0F2C7@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Oct 2023, Bertrand Marquis wrote:
> Hi Julien,
> 
> > On 23 Oct 2023, at 19:52, Julien Grall <julien@xen.org> wrote:
> > 
> > From: Julien Grall <jgrall@amazon.com>
> > 
> > The 'break' the XEN_DOMCTL_set_address_size is unreachable and tools
> > like Eclair will report as a violation of Misra Rule 2.1.
> > 
> > Furthermore, the nested switch is not very easy to read. So move
> > out the nested switch in a separate function to improve the
> > readability and hopefully address the MISRA violation.
> > 
> > Reported-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

I added the patch to my for-4.19 branch

