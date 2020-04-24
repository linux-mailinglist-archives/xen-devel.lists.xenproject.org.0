Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 033141B70D6
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 11:30:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRueQ-0002HO-0z; Fri, 24 Apr 2020 09:29:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WQMg=6I=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jRueP-0002HJ-E2
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 09:29:37 +0000
X-Inumbo-ID: 1d834a8a-860e-11ea-9476-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d834a8a-860e-11ea-9476-12813bfff9fa;
 Fri, 24 Apr 2020 09:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uYIYVyMpz7VE/0wf/jfBuIvSFVFnXx5caLjyxt1mOnk=; b=oTZQS5SpCfTc02yc8/Qp224uHr
 y8Bh9oB2QEZKI1bv6v06BJKK+1LhC2srZ7ZpGrnrt3b3PCBuVdTMX+7Qq6w0Kyo3PowFyyavYuplA
 /OoPcnwrWiXqEt5dvIVoy8uELxBvVNiC55Spr0+C0l0C+AKoQRu9fVEgioUiLQhkH0fY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jRueM-00044y-Gc; Fri, 24 Apr 2020 09:29:34 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jRueM-00065L-9J; Fri, 24 Apr 2020 09:29:34 +0000
Subject: Re: [XEN PATCH v5 11/16] xen/build: factorise generation of the
 linker scripts
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20200421161208.2429539-1-anthony.perard@citrix.com>
 <20200421161208.2429539-12-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0410adc3-f694-1acd-2f75-d53507617bb9@xen.org>
Date: Fri, 24 Apr 2020 10:29:31 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421161208.2429539-12-anthony.perard@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 21/04/2020 17:12, Anthony PERARD wrote:
> In Arm and X86 makefile, generating the linker script is the same, so
> we can simply have both call the same macro.
> 
> We need to add *.lds files into extra-y so that Rules.mk can find the
> .*.cmd dependency file and load it.
> 
> Change made to the command line:
> - Use of $(CPP) instead of $(CC) -E
> - Remove -Ui386.
>    We don't compile Xen for i386 anymore, so that macro is never
>    defined. Also it doesn't make sense on Arm.
> - Use $(cpp_flags) which simply filter -Wa,% options from $(a_flags).
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

For the Arm bits:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

