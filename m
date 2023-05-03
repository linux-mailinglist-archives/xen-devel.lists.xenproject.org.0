Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 215816F5ABF
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 17:15:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529298.823550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puECX-0002zs-PS; Wed, 03 May 2023 15:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529298.823550; Wed, 03 May 2023 15:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puECX-0002xR-Lg; Wed, 03 May 2023 15:15:29 +0000
Received: by outflank-mailman (input) for mailman id 529298;
 Wed, 03 May 2023 15:15:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1puECV-0002wu-Lv
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 15:15:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puECR-0005qG-T8; Wed, 03 May 2023 15:15:23 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.7.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puECR-0001Ng-KE; Wed, 03 May 2023 15:15:23 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=nIC/YWeeZCwRzdVGnmO3ranVa2mAyxX8vWqqRl7z65g=; b=ZoinoO1kru205KIRLGGkkYOr05
	mgcw4CV/vDzgUVEGElf4q9zwXk6Rty5M8N7GijXNoGiHYtriNOkJXMpnMDhfa6PjlOOg5a4t05Wup
	0aTzZikFJTod+pR/ETpK/WZC9uZoO9jEFIfAlc+h1v1PseVv/05G7yCxqdchNV6dsxoQ=;
Message-ID: <28235d38-ad7f-f1bd-f093-bd83f9fd6589@xen.org>
Date: Wed, 3 May 2023 16:15:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: dom0less vs xenstored setup race Was: xen | Failed pipeline for
 staging | 6a47ba2f
Content-Language: en-US
To: andrew.cooper3@citrix.com, Stefano Stabellini <sstabellini@kernel.org>,
 alejandro.vallejo@cloud.com
Cc: committers@xenproject.org, michal.orzel@amd.com,
 xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
References: <644bfbc6939d8_2a49bbb403253f4@gitlab-sidekiq-catchall-v2-78885c497-qxnp2.mail>
 <alpine.DEB.2.22.394.2304281905020.974517@ubuntu-linux-20-04-desktop>
 <c74d231f-75e2-a26d-f2c4-3a135cc1ac10@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c74d231f-75e2-a26d-f2c4-3a135cc1ac10@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 03/05/2023 15:38, andrew.cooper3@citrix.com wrote:
> Hello,
> 
> After what seems like an unreasonable amount of debugging, we've tracked
> down exactly what is going wrong here.
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/4219721944
> 
> Of note is the smoke.serial log around:
> 
> io: IN 0xffff90fec250 d0 20230503 14:20:42 INTRODUCE (1 233473 1 )
> obj: CREATE connection 0xffff90fff1f0
> *** d1 CONN RESET req_cons 00000000, req_prod 0000003a rsp_cons
> 00000000, rsp_prod 00000000
> io: OUT 0xffff9105cef0 d0 20230503 14:20:42 WATCH_EVENT
> (@introduceDomain domlist )
> 
> XS_INTRODUCE (in C xenstored at least, not checked O yet) always
> clobbers the ring pointers.  The added pressure on dom0 that the
> xensconsoled adds with it's 4M hypercall bounce buffer occasionally
> defers xenstored long enough that the XS_INTRODUCE clobbers the first
> message that dom1 wrote into the ring.
> 
> The other behaviour seen was xenstored observing a header looking like this:
> 
> *** d1 HDR { ty 0x746e6f63, rqid 0x2f6c6f72, txid 0x74616c70, len
> 0x6d726f66 }
> 
> which was rejected as being too long.  That's "control/platform" in
> ASCII, so the XS_INTRODUCE intersected dom1 between writing the header
> and writing the payload.
> 
> 
> Anyway, it is buggy for XS_INTRODUCE to be called on a live an
> unsuspecting connection.  It is ultimately init-dom0less's fault for
> telling dom1 it's good to go before having waited for XS_INTRODUCE to
> complete.

So the problem is xenstored will set interface->connection to 
XENSTORE_CONNECTED before finalizing the connection. Caqn you try the 
following, for now, very hackish patch:

diff --git a/tools/xenstore/xenstored_domain.c 
b/tools/xenstore/xenstored_domain.c
index f62be2245c42..bbf85bbbea3b 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -688,6 +688,7 @@ static struct domain *introduce_domain(const void *ctx,
                 talloc_steal(domain->conn, domain);

                 if (!restore) {
+                       domain_conn_reset(domain);
                         /* Notify the domain that xenstore is available */
                         interface->connection = XENSTORE_CONNECTED;
                         xenevtchn_notify(xce_handle, domain->port);
@@ -730,8 +731,6 @@ int do_introduce(const void *ctx, struct connection 
*conn,
         if (!domain)
                 return errno;

-       domain_conn_reset(domain);
-
         send_ack(conn, XS_INTRODUCE);

         return 0;

Cheers,

-- 
Julien Grall

