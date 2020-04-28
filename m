Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA8E1BC02D
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 15:51:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTQdQ-0002ov-AO; Tue, 28 Apr 2020 13:50:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTQdO-0002oq-Nm
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 13:50:50 +0000
X-Inumbo-ID: 44d6c6ec-8957-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44d6c6ec-8957-11ea-b07b-bc764e2007e4;
 Tue, 28 Apr 2020 13:50:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0789BAC64;
 Tue, 28 Apr 2020 13:50:47 +0000 (UTC)
Subject: Re: [XEN PATCH v5 11/16] xen/build: factorise generation of the
 linker scripts
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200421161208.2429539-1-anthony.perard@citrix.com>
 <20200421161208.2429539-12-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5b2caf05-506d-7d61-cd41-375c069a0433@suse.com>
Date: Tue, 28 Apr 2020 15:50:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421161208.2429539-12-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21.04.2020 18:12, Anthony PERARD wrote:
> In Arm and X86 makefile, generating the linker script is the same, so
> we can simply have both call the same macro.
> 
> We need to add *.lds files into extra-y so that Rules.mk can find the
> .*.cmd dependency file and load it.
> 
> Change made to the command line:
> - Use of $(CPP) instead of $(CC) -E
> - Remove -Ui386.
>   We don't compile Xen for i386 anymore, so that macro is never
>   defined. Also it doesn't make sense on Arm.
> - Use $(cpp_flags) which simply filter -Wa,% options from $(a_flags).
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

For the non-Arm bits
Acked-by: Jan Beulich <jbeulich@suse.com>


