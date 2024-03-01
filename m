Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C763D86DFD5
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 12:09:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687608.1071273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg0ki-0002G1-E2; Fri, 01 Mar 2024 11:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687608.1071273; Fri, 01 Mar 2024 11:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg0ki-0002Dx-BG; Fri, 01 Mar 2024 11:08:32 +0000
Received: by outflank-mailman (input) for mailman id 687608;
 Fri, 01 Mar 2024 11:08:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rg0kh-0002Dr-9d
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 11:08:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rg0kd-0001dY-Kb; Fri, 01 Mar 2024 11:08:27 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rg0kd-00057f-8A; Fri, 01 Mar 2024 11:08:27 +0000
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
	bh=GRAgjK5TgjtLOPiI+Ga1BztGBXU/zSnBXDU/85DUmME=; b=KsTLfLtsOTbly7k4wE4DAarbg0
	QxI33RVVYlDO5wtcaWyYVGa4TJgBe/8lrwwdhh2qPPkXJbIVHrjXzW41jQS2SwY9mJnI/C+en3FCo
	0FdQGWPKUhFKoIlm96rZ/BkcrXj3ggN2IT+7QVvzvsB4PONaKdc2IxE15KVDoIQTgulU=;
Message-ID: <a1927669-caa6-4ca1-a4c8-f7dedbe54de1@xen.org>
Date: Fri, 1 Mar 2024 11:08:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: preparations for 4.18.1
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Kelly Choi <kelly.choi@cloud.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 michal.orzel@amd.com
References: <7dc621a0-924c-499c-86c1-c35ec1f34ec2@suse.com>
 <1f251f2e-91de-4f81-a93c-dcb95746d2e5@xen.org>
 <5a4e8583-7747-4f24-94f0-d040dabb5b04@suse.com>
 <521a4d3b-8ef1-4449-97bd-1a3d3e0e35ec@xen.org>
 <alpine.DEB.2.22.394.2402281445450.575685@ubuntu-linux-20-04-desktop>
 <00881c6e-22a5-4283-b071-a9b92fbaf89a@suse.com>
 <alpine.DEB.2.22.394.2402290945210.853156@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2402290945210.853156@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 29/02/2024 17:47, Stefano Stabellini wrote:
> On Thu, 29 Feb 2024, Jan Beulich wrote:
>> On 28.02.2024 23:45, Stefano Stabellini wrote:
>>> On Wed, 28 Feb 2024, Julien Grall wrote:
>>>> On 28/02/2024 12:58, Jan Beulich wrote:
>>>>> On 28.02.2024 12:50, Julien Grall wrote:
>>>>>> On 27/02/2024 13:19, Jan Beulich wrote:
>>>>>>> the release is due in two to three weeks. Please point out backports you
>>>>>>> find
>>>>>>> missing from the respective staging branch, but which you consider
>>>>>>> relevant.
>>>>>>
>>>>>> For Arm:
>>>>>>
>>>>>> e11f576650 ("xen/arm: Fix UBSAN failure in start_xen()")
>>>>>
>>>>> Which I assume you or Stefano will take care of?
>>>>
>>>> I was expecting Stefano would do it as he did the backports in the past.
>>
>> Was it deliberate that you did not also put it on the 4.17 branch?
> 
> Yes, I wasn't sure how far back we want to backport so I thought it
> would be better to check with Julien and Michal.

I think this wants to be backported to xen 4.17 as well.

Cheers,

-- 
Julien Grall

