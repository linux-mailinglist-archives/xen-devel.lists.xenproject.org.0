Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD0B355AD9
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 19:55:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106180.203072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTpvA-0003Mx-1A; Tue, 06 Apr 2021 17:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106180.203072; Tue, 06 Apr 2021 17:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTpv9-0003MY-Ts; Tue, 06 Apr 2021 17:55:23 +0000
Received: by outflank-mailman (input) for mailman id 106180;
 Tue, 06 Apr 2021 17:55:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTpv8-0003MT-Gs
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 17:55:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTpv1-00044z-TG; Tue, 06 Apr 2021 17:55:15 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTpv1-0001bz-JK; Tue, 06 Apr 2021 17:55:15 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=xaC+xy9yh3LS4OxykfvNmLZtQc53CzZmLbDal2CL+qo=; b=AsI8fkv3YOKU31hqf/APGHXN5K
	d9nl3WPN9NRiJGXMRvr1BHR1XV3DbwRYT2dz5MVUyc3DPAFpjFz+2VGZS6V6oyBjKIaz3f/IYjhSk
	AcwLn1fP88WSDCWX/yKSZ079k14nT0c3m6lWXqiSFY+gg2//Mt51YDIO0m7lLw2UFgQY=;
Subject: Re: [PATCH 00/14] Use const whether we point to literal strings (take
 1)
To: Elliott Mitchell <ehem+xen@m5p.com>, Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Tim Deegan <tim@xen.org>,
 Roger Pau Monn?? <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20210405155713.29754-1-julien@xen.org>
 <YGtCTfw7WmOJPaa/@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2e51a7e5-404f-fd2e-90cb-c4d94c4d807b@xen.org>
Date: Tue, 6 Apr 2021 18:55:12 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YGtCTfw7WmOJPaa/@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Elliott,

Thanks for the input!

On 05/04/2021 18:01, Elliott Mitchell wrote:
> On Mon, Apr 05, 2021 at 04:56:59PM +0100, Julien Grall wrote:
>> I am not aware of code trying to modify literal strings in Xen.
>> However, there is a frequent use of non-const char * to point to
>> literal strings. Given the size of the codebase, there is a risk
>> to involuntarily introduce code that will modify literal strings.
>>
>> Therefore it would be better to enforce using const when pointing
>> to such strings. Both GCC and Clang provide an option to warn
>> for such case (see -Wwrite-strings) and therefore could be used
>> by Xen.
>>
>> This series doesn't yet make use of -Wwrite-strings because
>> the tree is not fully converted. Instead, it contains some easy
>> and likely non-controversial use const in the code.
>>
>> The major blockers to enable -Wwrite-strings are the following:
>>      - xen/common/efi: union string is used in both const and
>>      non-const situation. It doesn't feel right to specific one member
>>      const and the other non-const.
>>      - libxl: the major block is the flexarray framework as we would use
>>      it with string (now const char*). I thought it would be possible to
>>      make the interface const, but it looks like there are a couple of
>>      places where we need to modify the content (such as in
>>      libxl_json.c).
>>
>> Ideally, I would like to have -Wwrite-strings unconditionally used
>> tree-wide. But, some of the area may required some heavy refactoring.
>>
>> One solution would be to enable it tree-wide but turned it off at a
>> directroy/file level.
>>
>> Any opinions?
> 
> I think doing such is a Good Idea(tm).  Adding consts adds opportunities
> for greater optimization.  Both by compilers which can avoid extra
> copies, and developers who then know they don't need to generate extra
> copies to sacrific them to an API.  In particular the consts also
> function as documentation.
> 
> So you're certainly not the only person who thinks additional consts
> would be a good thing:
> 
> https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg00132.html
> 
> 
> Alas merely getting the two const patches into the latest release
> apparently wasn't even worthy of response:
> 
> https://lists.xenproject.org/archives/html/xen-devel/2021-02/msg01040.html

Sory to hear you had no response. Would you be able to give a nudge to 
the maintainers?

> 
> 
> I agree this should be done, though I'm aware many developers hate
> bothering with constants.
> 
> 

Cheers,

-- 
Julien Grall

