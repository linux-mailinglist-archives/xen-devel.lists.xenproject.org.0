Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8B731B739
	for <lists+xen-devel@lfdr.de>; Mon, 15 Feb 2021 11:36:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85133.159623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBbEM-0001Bg-00; Mon, 15 Feb 2021 10:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85133.159623; Mon, 15 Feb 2021 10:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBbEL-0001BH-TD; Mon, 15 Feb 2021 10:35:49 +0000
Received: by outflank-mailman (input) for mailman id 85133;
 Mon, 15 Feb 2021 10:35:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lBbEK-0001B9-6S
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 10:35:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lBbEJ-0003qE-C1; Mon, 15 Feb 2021 10:35:47 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lBbEJ-00019S-54; Mon, 15 Feb 2021 10:35:47 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=xG2ulb23qHt4SiokEosUYzaGqt7iLv3eJrf7QlH12Wo=; b=G1+S7yf9BSS/i8UWIUPl+Qtiao
	NiDMscxGT7w01va+6sL0TtctGcYJ02XICfIBuJXC3jvIDvfyNmjYtvTMcPqlUMjGB2SjJ7WVdROPn
	dQZiiiTFDYn1korrfK1cMXypRZcY2W30u7t2FxQBahVDjnSh9oPpollOjIO03QFmrEd4=;
Subject: Re: Boot time and 3 sec in warning_print
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, =?UTF-8?Q?Anders_T=c3=b6rnqvist?=
 <anders.tornqvist@codiax.se>
Cc: xen-devel@lists.xenproject.org
References: <fcc14668-b07d-aec8-1587-bc2d7add84da@codiax.se>
 <4f256544-7e1a-1a65-4942-04b3bc00e373@suse.com>
 <d9d4ebf7-09b3-29f2-1359-cd9db73f9c94@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <84a8cc60-e63d-24db-750c-39bb6049c045@xen.org>
Date: Mon, 15 Feb 2021 10:35:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d9d4ebf7-09b3-29f2-1359-cd9db73f9c94@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Jan,

On 15/02/2021 08:38, Jan Beulich wrote:
> On 15.02.2021 09:13, Jürgen Groß wrote:
>> On 15.02.21 08:37, Anders Törnqvist wrote:
>>> I would like to shorten the boot time in our system if possible.
>>>
>>> In xen/common/warning.c there is warning_print() which contains a 3
>>> seconds loop that calls  process_pending_softirqs().
>>>
>>> What would the potential problems be if that loop is radically shortened?
>>
>> A user might not notice the warning(s) printed.
>>
>> But I can see your point. I think adding a boot option for setting
>> another timeout value (e.g. 0) would do the job without compromising
>> the default case.
> 
> I don't think I agree - the solution to this is to eliminate the
> reason leading to the warning. 
 >
> The delay is intentionally this way
> to annoy the admin and force them to take measures.
Given they are warning, an admin may have assessed them and considered 
there is no remediation necessary.

We encountered the same problem with LiveUpdate. If you happen to have a 
warning (e.g. sync_console for debugging), then you are adding 3s in 
your downtime (this can more than double-up the actual one).

What was just an "annoyance" for boot can now completely wreck your 
guests and system (not many software can tolerate large downtime).

So I think we either want to drop the 3s pause completely or allow the 
user to decide whether he/she cares about it via a command line option.

I am leaning towards the former at the moment.

Cheers,

-- 
Julien Grall

