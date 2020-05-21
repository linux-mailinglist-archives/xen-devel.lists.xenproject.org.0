Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E75E1DD099
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 16:59:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbmej-00014g-Pm; Thu, 21 May 2020 14:58:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VGGW=7D=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jbmei-00014b-O6
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 14:58:44 +0000
X-Inumbo-ID: 90e4335c-9b73-11ea-b9cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90e4335c-9b73-11ea-b9cf-bc764e2007e4;
 Thu, 21 May 2020 14:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jw7tDixVzzdfXbWQISf1SWJhIzBqcoa+jzKwO76v2e0=; b=d+y5+NmlhiaU7WLBO5VPqwaP1Y
 Wq8LItwcU/D4NuFd8GhMV+YB7se8AAV0ZbwI2d6Fe0byTYgjjPj2WZ2NPD++XFGhHKZM6h8DzjxvE
 TVNWHTG04BXzJuyGdRF9YBogaggvi906qz7j0T6B7cNxgv1VCz9nfXU7mNSsCR67anN0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jbmed-0004ZQ-Ry; Thu, 21 May 2020 14:58:39 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jbmed-0003P7-Jm; Thu, 21 May 2020 14:58:39 +0000
Subject: Re: [PATCH v4 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20200521085932.10508-1-paul@xen.org>
 <20200521085932.10508-2-paul@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <fd51463d-b656-44ca-d795-1cfe786d943d@xen.org>
Date: Thu, 21 May 2020 15:58:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521085932.10508-2-paul@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 21/05/2020 09:59, Paul Durrant wrote:
> To allow enlightened HVM guests (i.e. those that have PV drivers) to be
> migrated without their co-operation it will be necessary to transfer 'PV'
> state such as event channel state, grant entry state, etc.
> 
> Currently there is a framework (entered via the hvm_save/load() functions)
> that allows a domain's 'HVM' (architectural) state to be transferred but
> 'PV' state is also common with pure PV guests and so this framework is not
> really suitable.
> 
> This patch adds the new public header and low level implementation of a new
> common framework, entered via the domain_save/load() functions. Subsequent
> patches will introduce other parts of the framework, and code that will
> make use of it within the current version of the libxc migration stream.
> 
> This patch also marks the HVM-only framework as deprecated in favour of the
> new framework.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

