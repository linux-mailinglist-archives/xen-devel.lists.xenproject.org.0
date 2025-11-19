Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E49C702EF
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 17:45:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166165.1492776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLlIn-00070s-F2; Wed, 19 Nov 2025 16:45:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166165.1492776; Wed, 19 Nov 2025 16:45:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLlIn-0006z2-Bd; Wed, 19 Nov 2025 16:45:05 +0000
Received: by outflank-mailman (input) for mailman id 1166165;
 Wed, 19 Nov 2025 16:45:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dri0=53=yandex-team.ru=vsementsov@srs-se1.protection.inumbo.net>)
 id 1vLlIm-0006yw-9L
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 16:45:04 +0000
Received: from forwardcorp1b.mail.yandex.net (forwardcorp1b.mail.yandex.net
 [178.154.239.136]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18533727-c567-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 17:45:03 +0100 (CET)
Received: from mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c10:49f:0:640:b99a:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTPS id F27A3893AA;
 Wed, 19 Nov 2025 19:45:00 +0300 (MSK)
Received: from [IPV6:2a02:6bf:8080:d4f::1:a] (unknown [2a02:6bf:8080:d4f::1:a])
 by mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id uiZX4u1FEiE0-dyR3VX9a; Wed, 19 Nov 2025 19:45:00 +0300
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
X-Inumbo-ID: 18533727-c567-11f0-9d18-b5c5bf9af7f9
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; t=1763570700;
	bh=s5SGDEOXCffdPGa2ExWMjbXnxXE80V2KPR7fbbbsK78=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=oMT+pXOJswxjJJq1zanTvP8KS2EylucYuHPNHD4L6q6KUnf3xGj709hkkW/XV2ahX
	 I/57FU9PC3BrCmtaQu/FF2c0XnjgR2Zdb67j8D18YC3cxQWboyaRHjFJTVx/WeUBJa
	 JsLwq61D96jB+ELIc9XI/coQIf63FBxXzkOXgr2E=
Authentication-Results: mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net; dkim=pass header.i=@yandex-team.ru
Message-ID: <0a07425e-ddee-4942-8ae7-dc8b801b1595@yandex-team.ru>
Date: Wed, 19 Nov 2025 19:44:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] error: error_free(NULL) is safe, drop unnecessary
 conditionals
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
 <20251119130855.105479-5-armbru@redhat.com>
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20251119130855.105479-5-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.11.25 16:08, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster<armbru@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir

