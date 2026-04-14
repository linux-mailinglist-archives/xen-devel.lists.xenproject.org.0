Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBTfFNik3Wl8hAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 04:22:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F12FD3F4FF0
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 04:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281425.1564333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCTPc-0002Qj-Qa; Tue, 14 Apr 2026 02:22:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281425.1564333; Tue, 14 Apr 2026 02:22:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCTPc-0002O8-NT; Tue, 14 Apr 2026 02:22:00 +0000
Received: by outflank-mailman (input) for mailman id 1281425;
 Tue, 14 Apr 2026 02:21:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wCTPb-0002O0-4y
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 02:21:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCTPa-001RpZ-0B;
 Tue, 14 Apr 2026 02:21:58 +0000
Received: from [116.84.110.196] (helo=[10.158.125.74])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCTPZ-001WFu-2S;
 Tue, 14 Apr 2026 02:21:57 +0000
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
	bh=/mKi+oHOvJtVh86QkdJWZmXPzkAj7tH9N7+wbcpLyCQ=; b=c1IFRaEjqGaw8efOCAalfg8Fag
	7ZXSAog3x4dTqYNAaDoLFm7FhVGohBwKhtMqFlcCLehItr8NNaTI+DQNxXsXqbE2/RAJ5u0Q2UmzL
	9pprwm2sutNSOt2vj3HTdN3IoLwL2wdI8FCOCD697ZeI3zof5qBTlHE7y90unyYoE3JM=;
Message-ID: <e1d5c911-6bd4-455b-9a3d-8505285f69b8@xen.org>
Date: Tue, 14 Apr 2026 11:21:52 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/23] Add SMMUv3 Stage 1 Support for Xen guests
Content-Language: en-GB
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nick Rosbrook <enr0n@ubuntu.com>, George Dunlap <gwd@xenproject.org>,
 Juergen Gross <jgross@suse.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
 <cover.1774918270.git.milan_djokic@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cover.1774918270.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,xen.org:dkim,xen.org:mid];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:bertrand.marquis@arm.com,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:enr0n@ubuntu.com,m:gwd@xenproject.org,m:jgross@suse.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[xen.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F12FD3F4FF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Milan,

On 31/03/2026 10:51, Milan Djokic wrote:
> This patch series provides emulated SMMUv3 support in Xen, enabling stage-1
> translation for the guest OS.
> 
> Stage 1 translation support is required to provide isolation between different
> devices within OS. Xen already supports Stage 2 translation but there is no
> support for Stage 1 translation. The goal of this work is to support Stage 1
> translation for Xen guests.
> 
> This patch series represents a continuation of work from Rahul Singh:
> https://patchwork.kernel.org/project/xen-devel/cover/cover.1669888522.git.rahul.singh@arm.com/
> Original patch series is aligned with the newest Xen structure, with the addition
> of translation layer which provides 1:N vIOMMU->pIOMMU mapping, in order to
> support passthrough of the devices attached to different physical IOMMUs.
> 
> We cannot trust the guest OS to control the SMMUv3 hardware directly as
> compromised guest OS can corrupt the SMMUv3 configuration and make the system
> vulnerable. The guest gets the ownership of the stage 1 page tables and also
> owns stage 1 configuration structures. The Xen handles the root configuration
> structure (for security reasons), including the stage 2 configuration.
> 
> XEN will emulate the SMMUv3 hardware and expose the virtual SMMUv3 to the
> guest. Guest can use the native SMMUv3 driver to configure the stage 1
> translation. When the guest configures the SMMUv3 for Stage 1, XEN will trap
> the access and configure hardware.
> 
> SMMUv3 Driver(Guest OS) -> Configure the Stage-1 translation ->
> XEN trap access -> XEN SMMUv3 driver configure the HW.
> 
> The final patch series commit provides a design document for the emulated
> IOMMU (arm-viommu.rst), which was previously discussed with the maintainers.
> Details regarding implementation, future work and security risks are outlined
> in this document.
> 
> ---
> Changes in v2:
>   - Updated design and implementation with vIOMMU->pIOMMU mapping layer
>   - Addressed security risks in the design, provided initial performance
>     measurements
>   - Addressed comments from previous version
>   - Tested on Renesas R-Car platform, initial performance measurements for
>     stage-1 vs stage-1-less guests
> ---
> 
> ---
> Changes in v3:
>   - Bump domctl version, added explicit padding for the new domctl structures
>   - Remove unnecessary changes according to review comments
>   - Add "ARM" prefix for vIOMMU Kconfig options, since only ARM architecture is
>     supported at this point
>   - Re-generate go code
>   - Add missing commit sign-off tags

Can you please avoid posting new revision in reply-to a previous one? 
This makes tracking quite difficult on the reviewer side. So I ended up 
starting to post comments on v2. Please have a look at them.

Cheers,

-- 
Julien Grall


