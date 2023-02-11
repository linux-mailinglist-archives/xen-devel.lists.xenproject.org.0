Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E76692FF2
	for <lists+xen-devel@lfdr.de>; Sat, 11 Feb 2023 11:22:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493869.763920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQn1A-0002JD-By; Sat, 11 Feb 2023 10:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493869.763920; Sat, 11 Feb 2023 10:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQn1A-0002H8-8V; Sat, 11 Feb 2023 10:22:04 +0000
Received: by outflank-mailman (input) for mailman id 493869;
 Sat, 11 Feb 2023 10:22:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQn18-0002H2-Cu
 for xen-devel@lists.xenproject.org; Sat, 11 Feb 2023 10:22:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQn17-00046t-Rz; Sat, 11 Feb 2023 10:22:01 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQn17-0004wm-LW; Sat, 11 Feb 2023 10:22:01 +0000
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
	bh=RkylwcnVRQ8Ks7T/orrI2njcPI5xZg9nC77qmsjPHUU=; b=MyaV0RsgWBqN9zjl5gFxk4z7Ev
	ktX4HP8rg8tku+nTm81Y4VqJouA+o9bVE4k4Ua6cuBQTyd7ilmUoUNxUV3+6rRFkmxGPbj/6Yz0p9
	aRYRMgkZMClG4cTmCWwxKkMBxE7vDlFs9LP7OSpY65w8LlvA4QnAp8YfE6HzpjbBdgRI=;
Message-ID: <0a532421-60b4-5b9b-31a6-24ffafbe1870@xen.org>
Date: Sat, 11 Feb 2023 10:21:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v3 9/9] xen/arm: p2m: Enable support for 32bit IPA
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
 <20230208120529.22313-10-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230208120529.22313-10-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 08/02/2023 12:05, Ayan Kumar Halder wrote:
> VTCR.T0SZ should be set as 0x20 to support 32bit IPA.
> Refer ARM DDI 0487I.a ID081822, G8-9824, G8.2.171, VTCR,
> "Virtualization Translation Control Register" for the bit descriptions.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

This will need a respin based on the discussion we had in v2. The main 
things are:
    - 32-bit IPA will be using one page at the root (not 2 like for 
40-bit IPA)
    - the code should be consolidate with arm64 as the logic is mainly 
the same.

Cheers,

-- 
Julien Grall

