Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE226C702CE
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 17:44:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166153.1492766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLlHf-0006Wu-5f; Wed, 19 Nov 2025 16:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166153.1492766; Wed, 19 Nov 2025 16:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLlHf-0006Tr-38; Wed, 19 Nov 2025 16:43:55 +0000
Received: by outflank-mailman (input) for mailman id 1166153;
 Wed, 19 Nov 2025 16:43:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dri0=53=yandex-team.ru=vsementsov@srs-se1.protection.inumbo.net>)
 id 1vLlHd-0006Tl-Cp
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 16:43:53 +0000
Received: from forwardcorp1a.mail.yandex.net (forwardcorp1a.mail.yandex.net
 [178.154.239.72]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee335859-c566-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 17:43:52 +0100 (CET)
Received: from mail-nwsmtp-smtp-corp-main-69.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-69.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c1f:3a87:0:640:845c:0])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTPS id E53F9C0678;
 Wed, 19 Nov 2025 19:43:51 +0300 (MSK)
Received: from [IPV6:2a02:6bf:8080:d4f::1:a] (unknown [2a02:6bf:8080:d4f::1:a])
 by mail-nwsmtp-smtp-corp-main-69.vla.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id phZGjU1FBqM0-YrNCSosA; Wed, 19 Nov 2025 19:43:51 +0300
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
X-Inumbo-ID: ee335859-c566-11f0-9d18-b5c5bf9af7f9
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; t=1763570631;
	bh=8MHPFc36XmRWLoEylCS+7mscko0S7lVDKgcOSkUaRq8=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=WGbz3m5pVgylCWUF0F7yXY6P1mq/DUxP0B6rUPRLgxlpNN4sMw+uCN5oYPEoz1weL
	 m+DhG/yIsv61AExP9v6dFCYWslHdiqhedix4qeFGaCCN5D/czYjwDaVMig5Ejg93QG
	 +AT5h+gu6ABapeHRV4R1xdXJ1lNH7VT8rDFS41Zs=
Authentication-Results: mail-nwsmtp-smtp-corp-main-69.vla.yp-c.yandex.net; dkim=pass header.i=@yandex-team.ru
Message-ID: <c0b7faef-7c89-49c4-90d6-16da94217db9@yandex-team.ru>
Date: Wed, 19 Nov 2025 19:43:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] nbd/client-connection: Replace error_propagate() by
 assignment
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 alistair@alistair23.me, edgar.iglesias@gmail.com, npiggin@gmail.com,
 harshpb@linux.ibm.com, palmer@dabbelt.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 berrange@redhat.com, peterx@redhat.com, farosas@suse.de, eblake@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, zhao1.liu@intel.com, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 xen-devel@lists.xenproject.org
References: <20251119130855.105479-1-armbru@redhat.com>
 <20251119130855.105479-4-armbru@redhat.com>
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20251119130855.105479-4-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.11.25 16:08, Markus Armbruster wrote:
> connect_thread_func() sets a variable to null, then error_propagate()s
> an Error * to it.  This is a roundabout way to assign the Error * to
> it, so replace it by just that.
> 
> Signed-off-by: Markus Armbruster<armbru@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir

