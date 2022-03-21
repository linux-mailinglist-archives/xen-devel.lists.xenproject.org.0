Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D58854E30DB
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 20:41:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293185.497972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWNtv-0005N2-RT; Mon, 21 Mar 2022 19:41:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293185.497972; Mon, 21 Mar 2022 19:41:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWNtv-0005Jg-MP; Mon, 21 Mar 2022 19:41:11 +0000
Received: by outflank-mailman (input) for mailman id 293185;
 Mon, 21 Mar 2022 19:41:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nWNtu-0005JW-P2
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 19:41:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWNtm-00064U-U9; Mon, 21 Mar 2022 19:41:02 +0000
Received: from [54.239.6.185] (helo=[192.168.25.135])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWNtm-0006j3-Nj; Mon, 21 Mar 2022 19:41:02 +0000
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
	bh=Lwb+Ud3rxoFVzhlAe7JZt98Dev9ugj1ZkrtGoWn9cMQ=; b=B5mEm0pWKYIJOFDtRjuINKOqaR
	GTsAkqNYp3liMtJma56GpwcLO7YlUNPeMm5eIJelflhXuDfdjSlsjDuOFDZDHfmNg8mCpZdpC3v1c
	jTU+HYlNneGdOVurWt5aHN85DPIunqe5ITt55Ouysuiye3+HPM667iO7sILcCyCLpjjI=;
Message-ID: <e32d757b-e14d-51e2-d621-8c67990e19f6@xen.org>
Date: Mon, 21 Mar 2022 19:41:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] xen/arm: Add i.MX8QM platform support
To: Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>, "wl@xen.org" <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "van.freenix@gmail.com" <van.freenix@gmail.com>
References: <20220228010711.11566-1-peng.fan@oss.nxp.com>
 <20220228010711.11566-4-peng.fan@oss.nxp.com>
 <e55f32f9-4d24-77a9-026b-201536c73708@xen.org>
 <DU0PR04MB9417B86346491B63442D234D88139@DU0PR04MB9417.eurprd04.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DU0PR04MB9417B86346491B63442D234D88139@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Peng,

On 18/03/2022 05:24, Peng Fan wrote:
>> Subject: Re: [PATCH 3/3] xen/arm: Add i.MX8QM platform support
>> On 28/02/2022 01:07, Peng Fan (OSS) wrote:
>>> +static const char * const imx8qm_dt_compat[] __initconst = {
>>> +    "fsl,imx8qm",
>>> +    NULL
>>> +};
>>> +
>>> +PLATFORM_START(imx8qm, "i.MX 8")
>>> +    .compatible = imx8qm_dt_compat,
>>> +PLATFORM_END
>>
>> We are only adding new platform definition when quirks are necessary. Do
>> you need specific quirks for the i.MX8QM?
>>
>> A somewhat related question, is this series enough to boot Xen upstream on
>> the board?
> 
> Boot xen upstream, no need specific quirk.

That's great to hear! Then this file should not be necessary at all. 
Please drop it.

Cheers,

-- 
Julien Grall

