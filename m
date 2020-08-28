Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EA92556E7
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 10:52:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBa72-0003Yx-IX; Fri, 28 Aug 2020 08:51:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8pf4=CG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kBa71-0003Ys-8i
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 08:51:55 +0000
X-Inumbo-ID: dca72243-b438-4ba6-af63-91b4d82bda17
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dca72243-b438-4ba6-af63-91b4d82bda17;
 Fri, 28 Aug 2020 08:51:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 33722B649;
 Fri, 28 Aug 2020 08:52:26 +0000 (UTC)
Subject: Re: [PATCH v2 7/8] x86/hvm: Disallow access to unknown MSRs
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20200820150835.27440-1-roger.pau@citrix.com>
 <20200820150835.27440-8-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2ffb53cf-8b62-141e-5fc9-1de38137721a@suse.com>
Date: Fri, 28 Aug 2020 10:51:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200820150835.27440-8-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.08.2020 17:08, Roger Pau Monne wrote:
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Change the catch-all behavior for MSR not explicitly handled. Instead
> of allow full read-access to the MSR space and silently dropping
> writes return an exception when the MSR is not explicitly handled.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> [remove rdmsr_safe from default case in svm_msr_read_intercept]
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

While within this patch use of 0x in log messages is consistent,
ultimately this one wants to follow whatever gets done in patch 6.

Jan

