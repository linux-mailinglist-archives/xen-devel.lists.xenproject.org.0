Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CC780F624
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 20:10:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653409.1019904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD88q-0006Kl-5z; Tue, 12 Dec 2023 19:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653409.1019904; Tue, 12 Dec 2023 19:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD88q-0006I5-2O; Tue, 12 Dec 2023 19:10:04 +0000
Received: by outflank-mailman (input) for mailman id 653409;
 Tue, 12 Dec 2023 19:10:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rD88o-00060j-ED
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 19:10:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD88o-0006A2-9h; Tue, 12 Dec 2023 19:10:02 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD88o-0002I6-49; Tue, 12 Dec 2023 19:10:02 +0000
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
	bh=+XQ6KnlVYNDALtnIzN/lzBgk8lYuxWwVr4C58l30SeM=; b=TGucZz5qEsDQQSqi5Cj9QeQqrg
	k4be7B2qMJAkCrsbkgMNKcW+jbwkNEcwQpoNxPmzt+OLbPMUMcDbbUIi+0sj4SVRWig3+XuVhOs6l
	k7xGjQ5B/Kr90SdEnDA4gWNaJmiUifITaZUMF4Gj2CI+1EzqZN65vxN3BfC6f7MLpC+M=;
Message-ID: <bee4d33a-1120-4389-a83d-4d2b91c5611d@xen.org>
Date: Tue, 12 Dec 2023 19:10:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/12] xen/spinlock: add another function level
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-9-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231212094725.22184-9-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 12/12/2023 09:47, Juergen Gross wrote:
> Add another function level in spinlock.c hiding the spinlock_t layout
> from the low level locking code.
> 
> This is done in preparation of introducing rspinlock_t for recursive
> locks without having to duplicate all of the locking code.

So all the fields you pass are the one from spinlock.

Looking at pahole after this series is applid, we have:

==== Debug + Lock profile ====

struct spinlock {
         spinlock_tickets_t         tickets;              /*     0     4 */
         union lock_debug           debug;                /*     4     4 */
         struct lock_profile *      profile;              /*     8     8 */

         /* size: 16, cachelines: 1, members: 3 */
         /* last cacheline: 16 bytes */
};
struct rspinlock {
         spinlock_tickets_t         tickets;              /*     0     4 */
         uint16_t                   recurse_cpu;          /*     4     2 */
         uint8_t                    recurse_cnt;          /*     6     1 */

         /* XXX 1 byte hole, try to pack */

         union lock_debug           debug;                /*     8     4 */

         /* XXX 4 bytes hole, try to pack */

         struct lock_profile *      profile;              /*    16     8 */

         /* size: 24, cachelines: 1, members: 5 */
         /* sum members: 19, holes: 2, sum holes: 5 */
         /* last cacheline: 24 bytes */
};


==== Debug ====

struct spinlock {
         spinlock_tickets_t         tickets;              /*     0     4 */
         union lock_debug           debug;                /*     4     4 */

         /* size: 8, cachelines: 1, members: 2 */
         /* last cacheline: 8 bytes */
};
struct rspinlock {
         spinlock_tickets_t         tickets;              /*     0     4 */
         uint16_t                   recurse_cpu;          /*     4     2 */
         uint8_t                    recurse_cnt;          /*     6     1 */

         /* XXX 1 byte hole, try to pack */

         union lock_debug           debug;                /*     8     4 */

         /* size: 12, cachelines: 1, members: 4 */
         /* sum members: 11, holes: 1, sum holes: 1 */
         /* last cacheline: 12 bytes */
};

==== Prod ====

struct spinlock {
         spinlock_tickets_t         tickets;              /*     0     4 */
         union lock_debug           debug;                /*     4     0 */

         /* size: 4, cachelines: 1, members: 2 */
         /* last cacheline: 4 bytes */
};
struct rspinlock {
         spinlock_tickets_t         tickets;              /*     0     4 */
         uint16_t                   recurse_cpu;          /*     4     2 */
         uint8_t                    recurse_cnt;          /*     6     1 */
         union lock_debug           debug;                /*     7     0 */

         /* size: 8, cachelines: 1, members: 4 */
         /* padding: 1 */
         /* last cacheline: 8 bytes */
};


I think we could embed spinlock_t in rspinlock_t without increasing 
rspinlock_t. Have you considered it? This could reduce the number of 
function level introduced in this series.

Cheers,

-- 
Julien Grall

