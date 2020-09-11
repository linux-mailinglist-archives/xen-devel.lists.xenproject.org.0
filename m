Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD662660DC
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 16:02:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGjd2-0007LH-04; Fri, 11 Sep 2020 14:02:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N27I=CU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kGjcz-0007LC-Vj
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 14:02:14 +0000
X-Inumbo-ID: 4a6f574b-3bf2-4834-b9e2-fec856b6bc8c
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a6f574b-3bf2-4834-b9e2-fec856b6bc8c;
 Fri, 11 Sep 2020 14:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599832932;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=xyRNsR0ClldYiQldyh7JFQJMZBDqKG+GZ7HSjQ499Rg=;
 b=I5ClVPCOVfPIPROFsQnzkNDSUvwrE1DhhmTbiWIObih3d0zoZ9CbdWcB
 dxMP9NYybjQycr1vv0t44WmXiZcotIoS42WpxZ0WmO8YjVlSATEcma7te
 LhA4+jdjkLsfRU9IjgyG8uU4c/EMZ1Qv4JvfzTFtbZ7ugPF7BBHMKtltA Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: NvgtSIcY35h8+3qtVZnf5tum/94NwL8TK8Fg4BqP9OBooDfMBSS8sX5kUtS32OOxGn/WVflOmk
 /lOnW7z9WjNeTx5sqX3ko+IqTewkAgBzcmKvHt96Di74AGN0tfaHo8UwFi8+GdLuTt6fATsebC
 i+UqOGgbZKQT4d3IDC5KY591wTVxDV2mqDxs88UBHAK4l2eLNeVc3/72NxaVYYENjWNtw/jHji
 uT2zFAE9MZfu2UKjFWmOjM6YyXS7kfwnYteeI+9f+YlWrfG4Cguyk1YoL7iYJFUMD1PptqyBEm
 r54=
X-SBRS: 2.7
X-MesageID: 27478161
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,415,1592884800"; d="scan'208";a="27478161"
Subject: Re: [PATCH] xen/hypfs: fix writing of custom parameter
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
 <wl@xen.org>
References: <20200911053043.29445-1-jgross@suse.com>
 <77ebc474-966e-885c-a08d-9da538671cb0@citrix.com>
 <6f639c2d-e4d8-3607-e89b-d11ae6c19a05@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <39c1ad46-1f92-2033-f70a-44fdee1cb5f1@citrix.com>
Date: Fri, 11 Sep 2020 15:02:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6f639c2d-e4d8-3607-e89b-d11ae6c19a05@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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

On 11/09/2020 13:28, Jürgen Groß wrote:
> On 11.09.20 14:14, Andrew Cooper wrote:
>> On 11/09/2020 06:30, Juergen Gross wrote:
>>> Today the maximum allowed data length for writing a hypfs node is
>>> tested in the generic hypfs_write() function. For custom runtime
>>> parameters this might be wrong, as the maximum allowed size is derived
>>> from the buffer holding the current setting, while there might be ways
>>> to set the parameter needing more characters than the minimal
>>> representation of that value.
>>>
>>> One example for this is the "ept" parameter. Its value buffer is sized
>>> to be able to hold the string "exec-sp=0" or "exec-sp=1", while it is
>>> allowed to use e.g. "no-exec-sp" or "exec-sp=yes" for setting it.
>>
>> If you're looking for silly examples, exec-sp=disabled is also legal
>> boolean notation for Xen.
>>
>>>
>>> Fix that by moving the length check one level down to the type
>>> specific write function.
>>>
>>> In order to avoid allocation of arbitrary sized buffers use a new
>>> MAX_PARAM_SIZE macro as an upper limit for custom writes. The value
>>> of MAX_PARAM_SIZE is the same as the limit in parse_params() for a
>>> single parameter.
>>>
>>> Fixes: 5b5ccafb0c42 ("xen: add basic hypervisor filesystem support")
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>> This does fix my bug, so Tested-by: Andrew Cooper
>> <andrew.cooper3@citrix.com>
>>
>> This does need backporting to 4.14, so maybe is best to take in this
>> form for now.
>>
>> However, I'm rather uneasy about the approach.
>>
>> Everything here derives from command line semantics, and it's probably
>> not going to be long until we get runtime modification of two sub
>> parameters.
>>
>> In a theoretical world where all the EPT suboptions were runtime
>> modifiable, it would be legal to try and pass
>>
>> ept=exec-sp,pml,no-pml,no-ad,ad,no-ad
>
> Correct.
>
>> While being fairly nonsensical, it is well formed on the command line.
>> We go left to right, and latest takes precedence.
>
> Yes.
>
>> Given that we do have buffer containing everything provided by
>> userspace, and all internal logic organised with const char *, why do we
>> need an intermediate allocation at all?
>
> Which intermediate allocation?

Sorry.  Intermediate buffer.

>
>> Can't we just pass that all the way down, rather than leaving the same
>> bug to hit at some point when we do have a parameter which legitimately
>> takes 128 characters of configuration?
>
> The problem is we can't just set the current value with the string
> passed in from the user.

Why ever not?  It is parsed as per the command line, not taken
verbatim.  It has no bearing on size of the output buffer.

>
> Imagine above example with ept, just two calls with:
>
> ept=exec-sp
> ept=no-pml
>
> Your idea is to return only no-pml, while the truth would be
> exec-sp=1,pml=0 (in the notation produced by the current code).

In this example,

The semantic gap is that "xenhypfs cat /params/ept" doesn't mean "tell
me what the user (last?) put on the command line for ept=".  It means
"tell me the current state of the ept= runtime options".

I agree that reading it should always return something of the form
exec-sp=X,pml=Y.

However, writing it should not require the user to provide both in one
go.  Its a horrible (and racy) interface when you only want to change
one of the options.

Specifically, the following should work:

# xenhypfs cat /params/ept
exec-sp=A,pml=B
# xenhypfs write /params/ept exec-sp=C
# xenhypfs cat /params/ept
exec-sp=C,pml=B
# xenhypfs write /params/ept pml=D
# xenhypfs cat /params/ept
exec-sp=C,pml=D

~Andrew

P.S. What stability guarantees have we made about the structure layout? 
Didn't we agree that a top level /params/ wasn't necessarily the best
hierarchy to turn into an ABI.

