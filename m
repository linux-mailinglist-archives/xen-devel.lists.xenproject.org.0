Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D63B95B06FD
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 16:33:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401882.643845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVw7I-0002L7-Jl; Wed, 07 Sep 2022 14:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401882.643845; Wed, 07 Sep 2022 14:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVw7I-0002JK-H7; Wed, 07 Sep 2022 14:33:24 +0000
Received: by outflank-mailman (input) for mailman id 401882;
 Wed, 07 Sep 2022 14:33:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVw7H-0002JE-Fp
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 14:33:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVw7G-0007fr-Hc; Wed, 07 Sep 2022 14:33:22 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVw7G-0006Zf-9S; Wed, 07 Sep 2022 14:33:22 +0000
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
	bh=GzRsaXTSpwLy/Adbvnszg+L9jECCkvffHW40vZ9b+VM=; b=AsNNSX3kQyxMDPk2wdssDr1j8h
	WYyR5GAjDNII4j8BhX1GYcwf3n/vDZoy8YGBf3IoPmyCIhRq5TidHbZ4dnKNSSNj6Ito4ow8BmIXi
	rdVu/C91h4KcJl3yJolwzfUmICHY/BYoiaciPtPMpMPVMIkghUlzn7ZEtj8px749nCLg=;
Message-ID: <bf2cc299-6de5-42c4-2711-c13cf59fcae1@xen.org>
Date: Wed, 7 Sep 2022 15:33:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH] Config.mk: correct PIE-related option(s) in
 EMBEDDED_EXTRA_CFLAGS
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <68173fe3-b3dc-224b-c30f-719efa48fcdf@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <68173fe3-b3dc-224b-c30f-719efa48fcdf@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 25/08/2022 08:17, Jan Beulich wrote:
> I haven't been able to find evidence of "-nopie" ever having been a
> supported compiler option. The correct spelling is "-no-pie".
> Furthermore like "-pie" this is an option which is solely passed to the
> linker. The compiler only recognizes "-fpie" / "-fPIE" / "-fno-pie", and
> it doesn't infer these options from "-pie" / "-no-pie".

OOI, how did you find out this issue?

> 
> Add the compiler recognized form, but for the possible case of the
> variable also being used somewhere for linking keep the linker option as
> well (with corrected spelling).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

