Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7662A1C5EB6
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 19:23:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jW1GK-0003mx-T1; Tue, 05 May 2020 17:21:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZEp/=6T=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jW1GJ-0003ms-86
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 17:21:43 +0000
X-Inumbo-ID: e271c531-8ef4-11ea-9ddc-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e271c531-8ef4-11ea-9ddc-12813bfff9fa;
 Tue, 05 May 2020 17:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nL2MO+nQpNNpHXiaN/n7s+tnvyO+S+JUbNAor9wMmAU=; b=NLGcLMI2o9Z6phESRAHMx8j7kN
 bku6HR7z6vLzKALp8T4XxbVPENL2adiHE5AZ5HQlWs5+ywWcDPBCaKHFwYSgHUOknVSr4MPJNt5P1
 0KFaKiJTtFKlELarHMsQufn3EcylMg2jlhQjBGxHnazGigXQS8BHdJ4miVzstLAfQnBQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jW1GG-0008IE-OY; Tue, 05 May 2020 17:21:40 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jW1GG-0005hD-Hb; Tue, 05 May 2020 17:21:40 +0000
Subject: Re: [PATCH v3] tools/xenstore: don't store domU's mfn of ring page in
 xenstored
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20200430053842.4376-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <419d1386-a634-60e2-5d5b-e90c9300dd3f@xen.org>
Date: Tue, 5 May 2020 18:21:38 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430053842.4376-1-jgross@suse.com>
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Juergen,

On 30/04/2020 06:38, Juergen Gross wrote:
> The XS_INTRODUCE command has two parameters: the mfn (or better: gfn)
> of the domain's xenstore ring page and the event channel of the
> domain for communicating with Xenstore.
> 
> The gfn is not really needed. It is stored in the per-domain struct
> in xenstored and in case of another XS_INTRODUCE for the domain it
> is tested to match the original value. If it doesn't match the
> command is aborted via EINVAL, otherwise the event channel to the
> domain is recreated.
> 
> As XS_INTRODUCE is limited to dom0 and there is no real downside of
> recreating the event channel just omit the test for the gfn to
> match and don't return EINVAL for multiple XS_INTRODUCE calls.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

