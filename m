Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D0E63A51F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 10:32:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448834.705391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozaTy-0004R9-Ml; Mon, 28 Nov 2022 09:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448834.705391; Mon, 28 Nov 2022 09:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozaTy-0004O6-JD; Mon, 28 Nov 2022 09:31:22 +0000
Received: by outflank-mailman (input) for mailman id 448834;
 Mon, 28 Nov 2022 09:31:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DmVB=34=xen.org=julien@srs-se1.protection.inumbo.net>)
 id 1ozaTx-0004O0-Gv
 for xen-devel@lists.xen.org; Mon, 28 Nov 2022 09:31:21 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68cfd881-6eff-11ed-91b6-6bf2151ebd3b;
 Mon, 28 Nov 2022 10:31:20 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ozaTs-0002yr-Ap; Mon, 28 Nov 2022 09:31:16 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[10.95.125.41])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ozaTs-0003Bw-1t; Mon, 28 Nov 2022 09:31:16 +0000
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
X-Inumbo-ID: 68cfd881-6eff-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=IGDiv+c+ACuI3R0Wyevr4mlLXEorQrRhTV1QEf/bils=; b=JR+vHUo985mOVrZovUmoColc7t
	UiPpK1eHiMRHPqMp/ZonrB9QJp3utiot6OoumhDNEot42NI5ntetPRaM/alm0ehNBMcX83Eifgokd
	5oDURGFBbkxuV9bv40lLtRwTat+TabwglL5f4gUcHDlO6JUoTdyzjWjGHBip+EuIPDQE=;
Message-ID: <abf0983d-572b-98de-bfa6-41668b19b103@xen.org>
Date: Mon, 28 Nov 2022 09:31:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH V6.1 3/3] libxl: arm: make creation of iommu node
 independent of disk device
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xen.org,
 Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <099616e1092409fceea4eb30590215310f8c091c.1662626550.git.viresh.kumar@linaro.org>
 <ebcf40f0d5dfe6bfa27c11dc2fe3e65df48772fe.1662734469.git.viresh.kumar@linaro.org>
 <YxtVjpDU1HOrhiAE@perard.uk.xensource.com>
 <20220920102915.p55lt4ee5hbxiun2@vireshk-i7>
 <a4907928-d3a2-f555-c30d-66aee18b2a62@xen.org>
 <4bb29058-3133-bc66-ea33-8077f91a473b@xen.org>
 <20221125054522.wjsv3lcb5tdk2dd5@vireshk-i7>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221125054522.wjsv3lcb5tdk2dd5@vireshk-i7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Viresh,

On 25/11/2022 06:45, Viresh Kumar wrote:
> On 24-11-22, 20:19, Julien Grall wrote:
>> Unfortunately, we had some delay for releasing 4.17. So I have pushed this
>> series in a branch for-next/4.18.
> 
> Thanks.
> 
>> This will be applied to staging once the
>> tree has re-opened.
> 
> I don't see the branch here though. Is it not public yet ? Or should I be
> looking at a different tree ?

The branch has been created in my personal tree for now:

https://xenbits.xen.org/gitweb/?p=people/julieng/xen-unstable.git;a=shortlog;h=refs/heads/for-next/4.18

Sorry I should have been clearer.

Cheers,

-- 
Julien Grall

