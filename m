Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6D31D91DA
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 10:14:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaxOI-00037c-KT; Tue, 19 May 2020 08:14:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aMO8=7B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jaxOG-00036j-Vy
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 08:14:21 +0000
X-Inumbo-ID: bd615ed6-99a8-11ea-a8e4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd615ed6-99a8-11ea-a8e4-12813bfff9fa;
 Tue, 19 May 2020 08:14:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E41A4AB76;
 Tue, 19 May 2020 08:14:21 +0000 (UTC)
Subject: Re: [PATCH v10 02/12] xen: add a generic way to include binary files
 as variables
To: Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20200519072106.26894-1-jgross@suse.com>
 <20200519072106.26894-3-jgross@suse.com>
 <24d44577-2e59-1428-2b63-08c89a0046d8@suse.com>
 <0a46fa63-5914-8ced-cd38-fa2c938d167b@suse.com>
 <b6b3721c-4317-a3af-3a77-a3a882cc9530@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0c87b35b-801d-1ccc-696c-5d417e564868@suse.com>
Date: Tue, 19 May 2020 10:14:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <b6b3721c-4317-a3af-3a77-a3a882cc9530@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.05.20 09:58, Jan Beulich wrote:
> On 19.05.2020 09:52, Jürgen Groß wrote:
>> On 19.05.20 09:47, Jan Beulich wrote:
>>> On 19.05.2020 09:20, Juergen Gross wrote:
>>>> --- a/xen/xsm/flask/Makefile
>>>> +++ b/xen/xsm/flask/Makefile
>>>> @@ -39,6 +39,9 @@ $(subst include/,%/,$(AV_H_FILES)): $(AV_H_DEPEND) $(mkaccess) FORCE
>>>>    obj-bin-$(CONFIG_XSM_FLASK_POLICY) += flask-policy.o
>>>>    flask-policy.o: policy.bin
>>>>    
>>>> +flask-policy.S: $(XEN_ROOT)/xen/tools/binfile
>>>> +	$(XEN_ROOT)/xen/tools/binfile -i $@ policy.bin xsm_flask_init_policy
>>>
>>> I realize the script gets installed as executable, but such
>>> permissions can get lost. Typically I think we invoke the shell
>>> instead, with the script as first argument. Thoughts? Would
>>> affect patch 8 then as well. Sorry for noticing this only now.
>>
>> Shall I resend or would you do that while committing?
> 
> In patch 8 I'd be fine adding $(SHELL). Here, though, the question is
> whether it should be $(SHELL) or $(CONFIG_SHELL) - I don't have any
> idea why the latter exists in the first place. Daniel?

Why would different shells be needed in the two patches?

The binfile script is rather simple without any bash-isms in it (AFAICT
CONFIG_SHELL seems to prefer bash). So $(SHELL) should be fine IMO.


Juergen

