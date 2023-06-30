Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D71F27437A4
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 10:41:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557367.870649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF9gj-0000oh-B6; Fri, 30 Jun 2023 08:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557367.870649; Fri, 30 Jun 2023 08:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF9gj-0000mN-7k; Fri, 30 Jun 2023 08:41:09 +0000
Received: by outflank-mailman (input) for mailman id 557367;
 Fri, 30 Jun 2023 08:41:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uggq=CS=xen.org=julien@srs-se1.protection.inumbo.net>)
 id 1qF9gh-0000mH-AO
 for xen-devel@lists.xen.org; Fri, 30 Jun 2023 08:41:07 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d726ee15-1721-11ee-b237-6b7b168915f2;
 Fri, 30 Jun 2023 10:41:02 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qF9gZ-0000X0-Rn; Fri, 30 Jun 2023 08:40:59 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qF9gZ-0008E8-MP; Fri, 30 Jun 2023 08:40:59 +0000
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
X-Inumbo-ID: d726ee15-1721-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=6qmLfzdkFbxGd/LRfKo9vStPeWLAt4sETm0prF4+BbE=; b=uncwWRiCUUOkFIccckQC52DfBS
	V+F2OalNQSTuwfPcFfqml8/JjWyAb7MoQgKop+Rg1v9phvYCigpG3Y2R2HizHtECl6IHR59f+Ldgl
	Yt3iTad0tcRUSwTE0GRnNJBRVs+r55HzqzT6eDsVa3R/hTTS1aSJsjwyCIikgJvF3P20=;
Message-ID: <8c0a5345-833c-281b-b4f5-59b335e730ab@xen.org>
Date: Fri, 30 Jun 2023 09:40:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH V3.1] libxl: arm: Add grant_usage parameter for virtio
 devices
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>
Cc: xen-devel@lists.xen.org, Juergen Gross <jgross@suse.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Erik Schilling <erik.schilling@linaro.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <0e347b2f4817cc578a5f8e41bf70503ae8cf69e3.1685684586.git.viresh.kumar@linaro.org>
 <7a0afe5aebba4c0b5be43a517dedf41d4e4ddd57.1686636036.git.viresh.kumar@linaro.org>
 <ecf753b0-3ccd-461a-925a-f3bac49dd269@perard>
 <20230630044032.khorme7rnlgzvl2u@vireshk-i7>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230630044032.khorme7rnlgzvl2u@vireshk-i7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/06/2023 05:40, Viresh Kumar wrote:
> On 13-06-23, 11:48, Anthony PERARD wrote:
>> On Tue, Jun 13, 2023 at 11:32:16AM +0530, Viresh Kumar wrote:
>>> Currently, the grant mapping related device tree properties are added if
>>> the backend domain is not Dom0. While Dom0 is privileged and can do
>>> foreign mapping for the entire guest memory, it is still desired for
>>> Dom0 to access guest's memory via grant mappings and hence map only what
>>> is required.
>>>
>>> This commit adds the "grant_usage" parameter for virtio devices, which
>>> provides better control over the functionality.
>>>
>>> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>>> ---
>>> V3->V3.1:
>>> - Print "0" or "1" in xenstore instead of "True" or "False" for grant_usage.
>>
>> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Hi,
> 
> I still don't see this patch pushed upstream. Are we waiting for some
> release to happen ?

The patch is missing an ack from the golang maintainers. I noticed you 
didn't CC them (done now).

In the future, I would suggest to use one of the scripts in the repo to 
find the appropriate maintainers:
  * scripts/get_maintainers.pl: It will output the list of maintainers
  * scripts/add_maintainers.pl: It will add the maintainers for each
    patch files in a given directory.

Cheers,

-- 
Julien Grall

