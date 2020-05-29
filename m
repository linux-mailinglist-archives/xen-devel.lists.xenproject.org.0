Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 567ED1E7D5C
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 14:37:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeeFX-0003BP-Gy; Fri, 29 May 2020 12:36:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mKAR=7L=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jeeFW-0003BI-1T
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 12:36:34 +0000
X-Inumbo-ID: 07365766-a1a9-11ea-9dbe-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07365766-a1a9-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 12:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wvhyX9H0v12XqSGol0PuAHrmfn/99YqXvqO85qcjzS4=; b=40HT0c4zpNUrylEpbgKlPdi3gO
 W95SoA/0JCiRYRLbkNT6JbU2vp5K3PR/Cv1IvnpvjZDmLJ+8oMIxEW7qM7zcwbgbhENN8N1d9He7+
 VJ6ncXJFQVsTJUiDoWAoC+8QnicHQ7AKKFLaC6cDr6OpcPc7UVGKP3WwROscuLbm4Tmc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jeeFQ-00049J-JQ; Fri, 29 May 2020 12:36:28 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jeeFQ-0003uC-CR; Fri, 29 May 2020 12:36:28 +0000
Subject: Re: [PATCH v2 3/3] clang: don't define nocall
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger@xen.org>
References: <20200528144023.10814-1-roger.pau@citrix.com>
 <20200528144023.10814-4-roger.pau@citrix.com>
 <8aa8d35f-2928-2096-a47c-26659c5a43a2@xen.org>
 <20200529083122.GJ1195@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <4164d344-5670-565c-6c3a-d9fe40f76ed8@xen.org>
Date: Fri, 29 May 2020 13:36:26 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200529083122.GJ1195@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 29/05/2020 09:31, Roger Pau Monné wrote:
> On Fri, May 29, 2020 at 08:25:44AM +0100, Julien Grall wrote:
>> Hi Roger,
>>
>> On 28/05/2020 15:40, Roger Pau Monne wrote:
>>> Clang doesn't support attribute error, and the possible equivalents
>>> like diagnose_if don't seem to work well in this case as they trigger
>>> when when the function is not called (just by being used by the
>>> APPEND_CALL macro).
>>
>> OOI, could you share the diagnose_if change you tried?
> 
> I've sent a reduced version to the llvm-dev mailing list, because I
> think the documentation should be fixed for diagnose_if. The email
> with the example is at:
> 
> http://lists.llvm.org/pipermail/llvm-dev/2020-May/141908.html

Thanks!

> 
> FWIW, using the deprecated attribute will also trigger the same
> error/warning even when not calling the function from C.

I read the documentation before asking the code and I did wonder why 
diagnose_if wouldn't work.

I am guessing the behavior wasn't intended.

Cheers,

-- 
Julien Grall

