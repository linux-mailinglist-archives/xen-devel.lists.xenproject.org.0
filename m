Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF6B7065AC
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 12:53:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535869.833936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzEmB-0007pS-Aw; Wed, 17 May 2023 10:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535869.833936; Wed, 17 May 2023 10:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzEmB-0007nm-7T; Wed, 17 May 2023 10:52:59 +0000
Received: by outflank-mailman (input) for mailman id 535869;
 Wed, 17 May 2023 10:52:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ws97=BG=tls.msk.ru=mjt@srs-se1.protection.inumbo.net>)
 id 1pzEm9-0007nS-6u
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 10:52:57 +0000
Received: from isrv.corpit.ru (isrv.corpit.ru [86.62.121.231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa4abd12-f4a0-11ed-b229-6b7b168915f2;
 Wed, 17 May 2023 12:52:55 +0200 (CEST)
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 7584E696D;
 Wed, 17 May 2023 13:52:54 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id B170C5FCC;
 Wed, 17 May 2023 13:52:53 +0300 (MSK)
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
X-Inumbo-ID: fa4abd12-f4a0-11ed-b229-6b7b168915f2
Message-ID: <2b07603f-6623-9fbf-15df-a86849d9aca3@msgid.tls.msk.ru>
Date: Wed, 17 May 2023 13:52:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] xen/pt: fix igd passthrough for pc machine with xen
 accelerator
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@aol.com>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, xen-devel@lists.xenproject.org,
 qemu-stable@nongnu.org
References: <a304213d26506b066021f803c39b87f6a262ed86.1675820085.git.brchuckz.ref@aol.com>
 <a304213d26506b066021f803c39b87f6a262ed86.1675820085.git.brchuckz@aol.com>
 <986d9eca-5fab-cacb-05c7-b85e4d58665b@msgid.tls.msk.ru>
 <47ed3568-2127-a865-4e4f-ff5902484231@aol.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <47ed3568-2127-a865-4e4f-ff5902484231@aol.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

17.05.2023 12:47, Chuck Zmudzinski wrote:
> On 5/17/2023 2:39 AM, Michael Tokarev wrote:
>> 08.02.2023 05:03, Chuck Zmudzinski wrote:...
>>> Fixes: 998250e97661 ("xen, gfx passthrough: register host bridge specific to passthrough")
>>> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>>
>> Has this change been forgotten?  Is it not needed anymore?
> 
> Short answer:
> 
> After 4f67543b ("xen/pt: reserve PCI slot 2 for Intel igd-passthru ") was
> applied, I was inclined to think this change is not needed anymore, but
> it would not hurt to add this change also, and now I think it might be
> more correct to also add this change.
...

Well, there were two machines with broken IDG passthrough in xen, now
there's one machine with broken IDG passthrough. Let's fix them all :)
Note this patch is tagged -stable as well.

> If you want to add this change also, let's make sure recent changes to the
> xen header files do not require the patch to be rebased before committing
> it.

It doesn't require rebasing, it looks like, - just built 8.0 and current master
qemu with it applied.  I haven't tried the actual IDG passthrough, though.

It just neeeds to be picked up the usual way as all other qemu changes goes in.

Thanks,

/mjt

