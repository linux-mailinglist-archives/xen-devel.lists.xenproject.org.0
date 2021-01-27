Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D9B306133
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 17:44:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76259.137535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4nvM-0002Rk-0Q; Wed, 27 Jan 2021 16:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76259.137535; Wed, 27 Jan 2021 16:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4nvL-0002RL-TA; Wed, 27 Jan 2021 16:44:07 +0000
Received: by outflank-mailman (input) for mailman id 76259;
 Wed, 27 Jan 2021 16:44:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l4nvK-0002RG-Vs
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 16:44:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l4nul-0002Fx-Ko; Wed, 27 Jan 2021 16:43:31 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l4nul-0006M9-Ca; Wed, 27 Jan 2021 16:43:31 +0000
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
	bh=kqpU83Jkyi116SfAspAFlBJt11xbJOrvdEus+hMIOOI=; b=1nfAwWEGfnAHJeHRXCYLF5e2jq
	9uyWAcM2YxfXMUMVu5D4EHvzyNttKEh5oKSRlJsF0PF8zGV+vXC5YotJ0vd9tKM3yUPCJEQd/yf5g
	oVPoW8JsGWuJgWChdBz5SCovFwWPAFk7S06etuzwZfjnMUJQRNtpHcV+Yln0KUQYFqUM=;
Subject: Re: [PATCH V5 00/22] IOREQ feature (+ virtio-mmio) on Arm
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien.grall@arm.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Kaly Xin <Kaly.Xin@arm.com>, Artem Mygaiev <joculator@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <dc7866fc-5b13-5378-2b22-6475053fd76b@xen.org>
Date: Wed, 27 Jan 2021 16:43:27 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 25/01/2021 19:08, Oleksandr Tyshchenko wrote:
> ***
> 
> Patch series [8] was rebased on recent "staging branch"
> (5e31789 tools/ocaml/libs/xb: Do not crash after xenbus is unmapped) and tested on
> Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with virtio-mmio disk backend [9]
> running in driver domain and unmodified Linux Guest running on existing
> virtio-blk driver (frontend). No issues were observed. Guest domain 'reboot/destroy'
> use-cases work properly. Patch series was only build-tested on x86.
> 
> Please note, build-test passed for the following modes:
> 1. x86: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y (default)
> 2. x86: #CONFIG_HVM is not set / #CONFIG_IOREQ_SERVER is not set
> 3. Arm64: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y
> 4. Arm64: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set  (default)
> 5. Arm32: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y
> 6. Arm32: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set  (default)

I thought I woudl give a try to test the code, but I can't find a way to 
enable CONFIG_IOREQ_SERVER from the UI.

Looking at the Kconfig, it looks like CONFIG_IOREQ_SERVER doesn't have a 
prompt and is not selected by Arm.

Can you provide details how this can be built on Arm?

Cheers,

-- 
Julien Grall

