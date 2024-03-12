Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A845879F1E
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 23:55:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692220.1079119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkB1L-00019x-Ji; Tue, 12 Mar 2024 22:54:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692220.1079119; Tue, 12 Mar 2024 22:54:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkB1L-00018R-H0; Tue, 12 Mar 2024 22:54:55 +0000
Received: by outflank-mailman (input) for mailman id 692220;
 Tue, 12 Mar 2024 22:54:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rkB1J-00018L-F8
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 22:54:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rkB1I-0005hm-3K; Tue, 12 Mar 2024 22:54:52 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.154])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rkB1H-0001L0-Rs; Tue, 12 Mar 2024 22:54:51 +0000
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
	bh=+3Plp8OivpTp8tfi0wGJHpcxyXU3r+blrkCifIiIQj4=; b=QacMagjAYTvooNkal8TbaDEWYh
	VxCMKgtIV/4X34c4bMP4Brb6MhosYiIqUF5RM2kVdooGV+HW/WimKtZPdLWDRGwjvI+01eEUFGuWu
	cgwniUQmkMo3N96VFyDUoEYXSFcjjSId3Xnfnt6g0HMBX2vHVpMvqMYMkZKsgkaBsVVM=;
Message-ID: <319d8ffb-624f-43b7-8475-0a8ac93f2f83@xen.org>
Date: Tue, 12 Mar 2024 22:54:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] restrict concept of pIRQ to x86
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <7cb0d24e-2bda-dcda-4874-2c01ba179947@suse.com>
 <e58f365c-13bf-3ad7-cf37-ca1ea043750b@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e58f365c-13bf-3ad7-cf37-ca1ea043750b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 27/07/2023 08:38, Jan Beulich wrote:
> ... by way of a new arch-selectable Kconfig control.
> 
> Note that some smaller pieces of code are left without #ifdef, to keep
> things better readable. Hence items like ECS_PIRQ, nr_static_irqs, or
> domain_pirq_to_irq() remain uniformly.
> 
> As to XEN_DOMCTL_irq_permission - this, despite having a uniformly
> available wrapper in libxc, is unused on Arm: libxl bypasses those
> calls, and the Python and OCamL bindings have no users at all.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Sorry for the late reply:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

