Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C544748B1
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 18:00:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246921.425854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxB9b-0001bU-7V; Tue, 14 Dec 2021 16:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246921.425854; Tue, 14 Dec 2021 16:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxB9b-0001YO-3t; Tue, 14 Dec 2021 16:59:51 +0000
Received: by outflank-mailman (input) for mailman id 246921;
 Tue, 14 Dec 2021 16:59:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mxB9Z-0001YI-LI
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 16:59:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxB9W-0004QF-7S; Tue, 14 Dec 2021 16:59:46 +0000
Received: from [54.239.6.190] (helo=[192.168.26.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxB9V-0003yy-Vv; Tue, 14 Dec 2021 16:59:46 +0000
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
	bh=cl2qNmg6npQtF8aRqXB+zmRxOSPTK7igbUJLpSCkCLw=; b=HrOGGQMWbAmHX2JpjeDG0RIMiq
	9YC17B4Ot8m3Y34LAJEhdRzttNVRhdpCwuv1/WbiCdL+8c1LHXyNVgupG3bGRE9QPxEijv7I961wa
	5qTo2d+dQecokCSFSCv43KYvHLCl5cE76Lv21RPThm74QVdVCxoZX+5PoAwH6ihgxFCE=;
Message-ID: <ac4b071c-3177-e23d-b656-fd9988ccab89@xen.org>
Date: Tue, 14 Dec 2021 16:59:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [XEN PATCH v8 02/47] xen: move include/asm-* to
 arch/*/include/asm
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-3-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211125134006.1076646-3-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/11/2021 13:39, Anthony PERARD wrote:
> This avoid the need to create the symbolic link "include/asm".
> 
> Whenever a comment refer to an "asm" headers, this patch avoid
> spelling the arch when not needed to avoid some code churn.
> 
> One unrelated change is to sort entries in MAINTAINERS for "INTEL(R)
> VT FOR X86 (VT-X)"
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Acked-by: Paul Durrant <paul@xen.org>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

