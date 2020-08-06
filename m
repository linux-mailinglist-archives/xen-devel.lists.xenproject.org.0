Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A3023D8DF
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 11:46:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3cS1-0004Xg-GA; Thu, 06 Aug 2020 09:44:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dZxa=BQ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k3cS0-0004Xa-Lm
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 09:44:40 +0000
X-Inumbo-ID: ff8ff1f7-4cd1-4e94-9072-722a1face18c
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff8ff1f7-4cd1-4e94-9072-722a1face18c;
 Thu, 06 Aug 2020 09:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vuPhnUSIT7TQpzuqweSrTCzl/IuMTfJWC4ovwxhQBoU=; b=q3j+oj4rwH/7acxpKboudYJhG+
 gBPVElmAzQCb3NmBxvzY3wtrekNZin5gkt0GeUuNS8v4cWF+PxdLeGEMPlheXBMm5Uz6DBUEKu+Ud
 I0/vUhb253hxeDz22uuKy6JOHMx8RbdauTHKZJ1XM7kdEhpkGDzsD+qm+lhWc+Qr5+cs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k3cRx-0006m5-EB; Thu, 06 Aug 2020 09:44:37 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k3cRx-0005Si-5w; Thu, 06 Aug 2020 09:44:37 +0000
Subject: Re: [PATCH 1/4] build: work around bash issue
To: Jan Beulich <jbeulich@suse.com>
References: <305c2532-408a-9f78-61fe-c90a2e86eb8e@suse.com>
 <b427e8e6-b9ff-65d2-074b-19439a2e3d02@suse.com>
 <e8006147-31e5-d4c5-8c13-74250f267c0c@xen.org>
 <df45f8af-a32b-67cf-2f56-4761ce263a28@suse.com>
 <1a3325a8-a59a-7759-b7a9-9263652b429c@xen.org>
 <0f853234-3f62-de82-d083-3c0cfc285c20@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9dea7b27-f97e-45c3-30ae-66e85d9eda87@xen.org>
Date: Thu, 6 Aug 2020 10:44:34 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <0f853234-3f62-de82-d083-3c0cfc285c20@suse.com>
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06/08/2020 10:25, Jan Beulich wrote:
> On 06.08.2020 11:20, Julien Grall wrote:
>> On 06/08/2020 10:14, Jan Beulich wrote:
>>> I've observed it with 3.2.57(2).
>>
>> Thank you. Please mention it in the commit message.
> 
> Well, added. If I had seen any use of the precise version, I would
> have done so right away. Would you mind educating me how knowing
> the precise version is useful, without knowing up to which version
> the issue exists?

Indeed, this wouldn't tell us whether other bash versions are affected.

However, as a reviewer, I need to be able to verify what you wrote is 
correct and that your patch is the correct way to solve it.

So providing the bash version where you observed the issue will at least 
fulfill this part.

Cheers,

-- 
Julien Grall

