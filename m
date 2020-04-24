Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 360881B70A2
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 11:20:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRuVV-0001ga-Uz; Fri, 24 Apr 2020 09:20:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WQMg=6I=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jRuVU-0001gV-Kc
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 09:20:24 +0000
X-Inumbo-ID: d3f68e64-860c-11ea-9476-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3f68e64-860c-11ea-9476-12813bfff9fa;
 Fri, 24 Apr 2020 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e+Vx3UfGuzVec4LjAQrU71RjeWzo1J/YLdYmSfGODJg=; b=LSqW0fXFixFv+IbFcJpr6ogOUs
 +Im/zgO0ofvAbOcC5SOL3WBCQ5oykQyAGB+DdHOPY/b/cuiej27gEkb+mN3KM4rlF2l88sw3ZKzAW
 RFSnN9ii8KlOGmvJ2hCUnhY2LMqOHKja0bnGzp6v6xGKpzv2V3XMX4eznFdlRxpeVXZ0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jRuVQ-0003s0-EX; Fri, 24 Apr 2020 09:20:20 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jRuVQ-0005Oi-4p; Fri, 24 Apr 2020 09:20:20 +0000
Subject: Re: [XEN PATCH v5 03/16] xen/build: use new $(c_flags) and $(a_flags)
 instead of $(CFLAGS)
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20200421161208.2429539-1-anthony.perard@citrix.com>
 <20200421161208.2429539-4-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <91b44d25-a10e-fdd2-2fbc-84f5ae3e5a36@xen.org>
Date: Fri, 24 Apr 2020 10:20:17 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421161208.2429539-4-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 21/04/2020 17:11, Anthony PERARD wrote:
> In a later patch ("xen/build: have the root Makefile generates the
> CFLAGS), we want to generate the CFLAGS in xen/Makefile, then export
> it and have Rules.mk use a CFLAGS from the environment variables. That
> changes the flavor of the CFLAGS and flags intended for one target
> (like -D__OBJECT_FILE__ and -M%) gets propagated and duplicated. So we
> start by moving such flags out of $(CFLAGS) and into $(c_flags) which
> is to be modified by only Rules.mk.
> 
> __OBJECT_FILE__ is only used by arch/x86/mm/*.c files, so having it in
> $(c_flags) is enough, we don't need it in $(a_flags).
> 
> For include/Makefile and as-insn we can keep using CFLAGS, but since
> it doesn't have -M* flags anymore there is no need to filter them out.
> 
> The XEN_BUILD_EFI tests in arch/x86/Makefile was filtering out
> CFLAGS-y, but according to dd40177c1bc8 ("x86-64/EFI: add CFLAGS to
> check compile"), it was done to filter out -MF. CFLAGS doesn't
> have those flags anymore, so no filtering is needed.
> 
> This is inspired by the way Kbuild generates CFLAGS for each targets.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

For the Arm bits:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

