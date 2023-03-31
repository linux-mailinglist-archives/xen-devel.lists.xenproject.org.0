Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B45DF6D297E
	for <lists+xen-devel@lfdr.de>; Fri, 31 Mar 2023 22:32:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517033.802016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piLPu-0008PY-LZ; Fri, 31 Mar 2023 20:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517033.802016; Fri, 31 Mar 2023 20:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piLPu-0008Mz-IX; Fri, 31 Mar 2023 20:32:10 +0000
Received: by outflank-mailman (input) for mailman id 517033;
 Fri, 31 Mar 2023 20:32:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1piLPt-0008Mt-E9
 for xen-devel@lists.xenproject.org; Fri, 31 Mar 2023 20:32:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1piLPs-00010z-EG; Fri, 31 Mar 2023 20:32:08 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1piLPs-0006Jf-83; Fri, 31 Mar 2023 20:32:08 +0000
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
	bh=1lUAEEHzJeMhHnTcKMdQNylqux/a5cz5lAYUo1yUJxk=; b=XMOAeH7MtiA3ZTRxdNmIiXYCZf
	Yd5SgzwHU/yYTbCNOwpA0E59QVsCOeU4+PdDsCgxqxCJGCAP7MIHNSY+/fE3RDMgg/dzCuWK/MZ1m
	QKxDo1zfVNjFMdvZJdZI+T5aELoqryakvjGOYBi8BmaZ9cv5gann3mx+KL4FmNNN6CEg=;
Message-ID: <381b4622-4da8-a963-4561-ca9931bcfd09@xen.org>
Date: Fri, 31 Mar 2023 21:32:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH v9 1/5] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1680086655.git.oleksii.kurochko@gmail.com>
 <c9fb416c98e023ff3150064222cb42b6c67f37e8.1680086655.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c9fb416c98e023ff3150064222cb42b6c67f37e8.1680086655.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 29/03/2023 11:50, Oleksii Kurochko wrote:
> A large part of the content of the bug.h is repeated among all
> architectures, so it was decided to create a new config
> CONFIG_GENERIC_BUG_FRAME.
> 
> The version of <bug.h> from x86 was taken as the base version.
> 
> The patch introduces the following stuff:
>    * common bug.h header
>    * generic implementation of do_bug_frame
>    * new config CONFIG_GENERIC_BUG_FRAME
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

I have tested the implementation on Arm. So:

Tested-by: Julien Grall <jgrall@amazon.com>
Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

