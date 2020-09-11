Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0902658E6
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 07:40:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGbn8-0000Xh-R4; Fri, 11 Sep 2020 05:40:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DvaW=CU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kGbn7-0000Xc-3I
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 05:40:09 +0000
X-Inumbo-ID: cc26030c-aa45-4b2c-ba35-ccf95c33965c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc26030c-aa45-4b2c-ba35-ccf95c33965c;
 Fri, 11 Sep 2020 05:40:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D4A02B384;
 Fri, 11 Sep 2020 05:40:22 +0000 (UTC)
Subject: Re: Regression: [PATCH v10 10/12] tools/libxl: use libxenhypfs for
 setting xen runtime parameters
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
References: <20200519072106.26894-1-jgross@suse.com>
 <20200519072106.26894-11-jgross@suse.com>
 <b4f66026-67c1-5284-84d7-9d9af1775904@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <c2248b02-ef1b-b6ee-2cbe-c158bd1f7262@suse.com>
Date: Fri, 11 Sep 2020 07:40:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b4f66026-67c1-5284-84d7-9d9af1775904@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10.09.20 22:09, Andrew Cooper wrote:
> On 19/05/2020 08:21, Juergen Gross wrote:
>> Instead of xc_set_parameters() use xenhypfs_write() for setting
>> parameters of the hypervisor.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Something here isn't right.  XenServer's testing for XSA-304 has shown
> the following bizarre behaviour.
> 
> # xl set-parameters ept=
> libxl: error: libxl.c:701:libxl_set_parameters: setting parameters:
> Invalid argument
> cannot set parameters: ept=
> # xl set-parameters ept=exec-sp
> # xl set-parameters ept=no-exec-sp
> libxl: error: libxl.c:701:libxl_set_parameters: setting parameters: No
> space left on device
> cannot set parameters: ept=no-exec-sp
> 
> Instrumentation shows that the first two examples here enter
> parse_ept_param_runtime() with the provided string, while the third
> example doesn't.
> 
> Given the -ENOSPC, I'm guessing there is some overly small internal
> buffer somewhere in the hyperfs infrastructure ?

Not, really, just a bad test for max length. Patch sent.


Juergen

