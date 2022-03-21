Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADE64E30DA
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 20:39:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293182.497959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWNs7-0003wi-Dc; Mon, 21 Mar 2022 19:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293182.497959; Mon, 21 Mar 2022 19:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWNs7-0003u4-AW; Mon, 21 Mar 2022 19:39:19 +0000
Received: by outflank-mailman (input) for mailman id 293182;
 Mon, 21 Mar 2022 19:39:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nWNs6-0003ty-9h
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 19:39:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWNry-000610-IB; Mon, 21 Mar 2022 19:39:10 +0000
Received: from [54.239.6.185] (helo=[192.168.25.135])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWNry-0006g9-BG; Mon, 21 Mar 2022 19:39:10 +0000
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
	bh=JLKIfciC9iPoqeblrLuo5Sef61/6SOcqi35akwVPCy4=; b=04Kbusa0ty8lH0ncvvys+wPxTR
	XlsqJIgOQeVmyXzPD5zdt07Z6vr/E4J+PCfHe/ws8xa3G3cPStu/Ee795nyxioHLx4oFL77ieX+2S
	X/+kWfqAlNX8ePl0QgB0koVJtomaIjKZauAhqO85kvH+DVfDYeEsEk5J267Ylyjx1f/c=;
Message-ID: <6fd422b6-db1f-094e-2529-341974cf537a@xen.org>
Date: Mon, 21 Mar 2022 19:39:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] xen/arm: Add i.MX lpuart driver
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
 <20220228010711.11566-2-peng.fan@oss.nxp.com>
 <5fc8a6a2-450a-d9c3-b241-e1a950ac2933@xen.org>
 <DU0PR04MB9417AF562F57364C0051D42088139@DU0PR04MB9417.eurprd04.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DU0PR04MB9417AF562F57364C0051D42088139@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Peng,

On 18/03/2022 05:23, Peng Fan wrote:
>> Subject: Re: [PATCH 1/3] xen/arm: Add i.MX lpuart driver
>> On 28/02/2022 01:07, Peng Fan (OSS) wrote:
>>> From: Peng Fan <peng.fan@nxp.com>
>>> +
>>> +    imx_lpuart_write(uart, UARTDATA, c); }
>>> +
>>> +static int imx_lpuart_getc(struct serial_port *port, char *pc) {
>>> +    struct imx_lpuart *uart = port->uart;
>>> +    int ch;
>>> +
>>> +    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_RDRF))
>>> +        barrier();
>>
>> Same remark about the barrier.
>>
>> However, rather than waiting, shouldn't we check the watermark instead and
>> return 0 if there are no character to read?
> 
> We normally check status bit to check whether there are data to read.

I guess by "we", you mean the caller. In which case, there is at least 
one (i.e. serial_getc()) that will not check the status before calling 
getc(). Instead, it will wait if the helper returns 0.

Looking at the other UART driver, none of them seem to busy loop. So, at 
least for consistency, we should avoid the busy loop here.

Cheers,

-- 
Julien Grall

