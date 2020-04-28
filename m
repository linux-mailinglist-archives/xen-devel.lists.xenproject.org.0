Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF691BBB63
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 12:40:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTNeW-0007tC-0I; Tue, 28 Apr 2020 10:39:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVBP=6M=puzio.waw.pl=artur@srs-us1.protection.inumbo.net>)
 id 1jTMjF-0002M8-8j
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 09:40:38 +0000
X-Inumbo-ID: 4eea4bcc-8934-11ea-ae69-bc764e2007e4
Received: from puzio.waw.pl (unknown [2001:41d0:401:3100::3f29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4eea4bcc-8934-11ea-ae69-bc764e2007e4;
 Tue, 28 Apr 2020 09:40:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by puzio.waw.pl (Postfix) with ESMTP id E4B4F1C492;
 Tue, 28 Apr 2020 11:40:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=puzio.waw.pl;
 s=default; t=1588066846;
 bh=JkOniP87jULWq0LQ3Z7u0q7SiZfMusLTsWD8rZJuaqs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To;
 b=vSNw6kM11+eO/ZFLrZw/9SUpJepaNyK2VBwUFEBG5g5Pm7I+TZPVYuyfyGRW7pWpi
 CkIv0StlHxScBGYAJbx2FQq4o9jGRGVPciTiU6pw+u/vrnAzegj2y4rnmSwQr0ri8w
 W0Pgi3HWdn6c48E/q093H8spQ3hjf/weanLIUubkKj6FcOfmdcohRHO6FFNjA+DgQG
 oSWhjVvP2JQsWjBG20Ftba4JOHTiP8IGeHmMjyjFXxN9JptIrXO3wi87xCsjM1J0dP
 4UL1aJcJyWrxPeIbR5hb3ld2ph9rMDX+22yv7/nFAeKsyuNWqlV/jrO8kWx5LE1WM1
 6Fz6iuHRwCxmA==
X-Fuglu-Suspect: b4cc723c9a65426cad6da44d8fdc13c1
X-Fuglu-Spamstatus: NO
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on vps345931.ovh.net
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=ham autolearn_force=no
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: artur@puzio.waw.pl)
 by puzio.waw.pl (Postfix) with ESMTPSA;
 Tue, 28 Apr 2020 11:40:41 +0200 (CEST)
Subject: Re: [PATCH 1/2] Fix undefined behaviour
To: paul@xen.org, 'Grzegorz Uriasz' <gorbak25@gmail.com>, qemu-devel@nongnu.org
References: <20200428062847.7764-1-gorbak25@gmail.com>
 <20200428062847.7764-2-gorbak25@gmail.com>
 <000001d61d34$6c0218f0$44064ad0$@xen.org>
From: Artur Puzio <artur@puzio.waw.pl>
Message-ID: <90a8b709-c506-92e2-800c-e1558f18df94@puzio.waw.pl>
Date: Tue, 28 Apr 2020 11:40:46 +0200
MIME-Version: 1.0
In-Reply-To: <000001d61d34$6c0218f0$44064ad0$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large
X-Mailman-Approved-At: Tue, 28 Apr 2020 10:39:46 +0000
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, jakub@bartmin.ski,
 marmarek@invisiblethingslab.com, 'Anthony Perard' <anthony.perard@citrix.com>,
 j.nowak26@student.uw.edu.pl, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.04.2020 10:10, Paul Durrant wrote:
>> -----Original Message-----
>> From: Grzegorz Uriasz <gorbak25@gmail.com>
>> Sent: 28 April 2020 07:29
>> To: qemu-devel@nongnu.org
>> Cc: Grzegorz Uriasz <gorbak25@gmail.com>; marmarek@invisiblethingslab.com; artur@puzio.waw.pl;
>> jakub@bartmin.ski; j.nowak26@student.uw.edu.pl; Stefano Stabellini <sstabellini@kernel.org>; Anthony
>> Perard <anthony.perard@citrix.com>; Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
>> Subject: [PATCH 1/2] Fix undefined behaviour
>>
>> Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
> I think we need more of a commit comment for both this and patch #2 to explain why you are making the changes.
>
>   Paul 

I agree Grzegorz should improve the commit messages. In the mean time
see email with subject "[PATCH 0/2] Fix QEMU crashes when passing IGD to
a guest VM under XEN", it contains quite detailed explanation for both
"Fix undefined behaviour" and "Improve legacy vbios handling" patches.

Artur Puzio


