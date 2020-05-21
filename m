Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 474FD1DCD52
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 14:52:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbkgt-000648-S6; Thu, 21 May 2020 12:52:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VGGW=7D=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jbkgr-000640-Se
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 12:52:49 +0000
X-Inumbo-ID: f9471c50-9b61-11ea-aafe-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9471c50-9b61-11ea-aafe-12813bfff9fa;
 Thu, 21 May 2020 12:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GHqK/6rEcspyvA2fOvyIWaP4KczkSAzGrqmCF/pcafQ=; b=bt1gMVivDPWmAtfFYTolRw6U1L
 JHXlTrI0Qj/CkK6gi5dS1unxEWyXPFj9opMF1QO32U26IgrFz6VuyYm6PEhpOmjiHTgW6RFsQVMJ4
 sc8IWsfWWeq9w1QEaQXUH7Am3Z4VG2mvR04jt7/x0TiR3bsV0XmFfyBSq4PdX/Hfrfdg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jbkgk-0001to-HH; Thu, 21 May 2020 12:52:42 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jbkgk-0004wa-AJ; Thu, 21 May 2020 12:52:42 +0000
Subject: Re: [PATCH v10 09/12] xen: add runtime parameter access support to
 hypfs
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20200519072106.26894-1-jgross@suse.com>
 <20200519072106.26894-10-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <fcc51570-cbfe-4fca-42d9-2b684f52e651@xen.org>
Date: Thu, 21 May 2020 13:52:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519072106.26894-10-jgross@suse.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Juergen,

On 19/05/2020 08:21, Juergen Gross wrote:
> Add support to read and modify values of hypervisor runtime parameters
> via the hypervisor file system.
> 
> As runtime parameters can be modified via a sysctl, too, this path has
> to take the hypfs rw_lock as writer.
> 
> For custom runtime parameters the connection between the parameter
> value and the file system is done via an init function which will set
> the initial value (if needed) and the leaf properties.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

