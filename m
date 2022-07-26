Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7965818B1
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 19:40:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375622.608064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGOXF-000569-8D; Tue, 26 Jul 2022 17:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375622.608064; Tue, 26 Jul 2022 17:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGOXF-00054L-5U; Tue, 26 Jul 2022 17:39:57 +0000
Received: by outflank-mailman (input) for mailman id 375622;
 Tue, 26 Jul 2022 17:39:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=43g4=X7=computer.org=sarah.newman@srs-se1.protection.inumbo.net>)
 id 1oGOXE-00054D-1x
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 17:39:56 +0000
Received: from d.mail.sonic.net (d.mail.sonic.net [64.142.111.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f386a02d-0d09-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 19:39:52 +0200 (CEST)
Received: from [192.168.2.47] (c-174-62-72-237.hsd1.ca.comcast.net
 [174.62.72.237]) (authenticated bits=0)
 by d.mail.sonic.net (8.16.1/8.16.1) with ESMTPSA id 26QHdm9u012338
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 26 Jul 2022 10:39:49 -0700
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
X-Inumbo-ID: f386a02d-0d09-11ed-924f-1f966e50362f
Message-ID: <e719534f-6da4-d92a-c2d3-2d46b517b342@computer.org>
Date: Tue, 26 Jul 2022 10:39:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] livepatch: create-diff-object: Check that the section
 has a secsym
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: konrad.wilk@oracle.com, ross.lagerwall@citrix.com,
        xen-devel@lists.xenproject.org
References: <d45c75a2-81ae-7061-6f75-ed8378fc6d16@suse.com>
 <20220725171302.25910-1-sarah.newman@computer.org>
 <bbdcb776-804e-a27e-5849-b3664e2208ec@suse.com>
From: Sarah Newman <sarah.newman@computer.org>
In-Reply-To: <bbdcb776-804e-a27e-5849-b3664e2208ec@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Sonic-CAuth: UmFuZG9tSVapvIjvXbpgdhFjSWO0QIOseVs+z6nG1rfRK/ZBWSzD9sPxSkZb9O5WkJmReVZe2a1qaF0U4xdHGjXYnKGkEqlN
X-Sonic-ID: C;DmBY8gkN7RGrCbBQfcNRkQ== M;JMql8gkN7RGrCbBQfcNRkQ==
X-Spam-Flag: No
X-Sonic-Spam-Details: 0.0/5.0 by cerberusd

On 7/25/22 23:25, Jan Beulich wrote:
> On 25.07.2022 19:13, Sarah Newman wrote:
>> A STT_SECTION symbol is not needed if if it is not used as a relocation
>> target. Therefore, a section, in this case a debug section, may not have
>> a secsym associated with it.
>>
>> Signed-off-by: Bill Wendling <morbo@google.com>
> 
> Hmm - this wasn't here before. Does this then suggest the patch also
> wants to be marked From: Bill?

I don't know what the etiquette is here since this was a commit originally committed to kpatch, I just added that back because the xen patch 
submission guidelines said to preserve original tags.

> 
>> Origin: https://github.com/dynup/kpatch.git ba3defa06073
>> Signed-off-by: Sarah Newman <sarah.newman@computer.org>
>> Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> Sigh. I had given R-b on v1 as well. Actually I had meant to commit this
> yesterday (with all adjustments made), but as it turns out committers
> can't commit to that tree. So it'll be up to Ross or Konrad to actually
> take care of this.
> 
> Jan
> 

My apologies, I simply missed that.

I am doing this in my spare time. This is the first time I've gone through this process in a couple of years and have only done it a few times total.

Thanks, Sarah

