Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1CCB9B432
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 20:11:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129620.1469515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1Tx2-0007md-1s; Wed, 24 Sep 2025 18:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129620.1469515; Wed, 24 Sep 2025 18:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1Tx1-0007kI-VD; Wed, 24 Sep 2025 18:10:47 +0000
Received: by outflank-mailman (input) for mailman id 1129620;
 Wed, 24 Sep 2025 16:24:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dKws=4D=kernel.org=superm1@srs-se1.protection.inumbo.net>)
 id 1v1SIY-0003AP-Fw
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 16:24:54 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff7e5d69-9962-11f0-9d14-b5c5bf9af7f9;
 Wed, 24 Sep 2025 18:24:52 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4E92160205;
 Wed, 24 Sep 2025 16:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629B9C4CEE7;
 Wed, 24 Sep 2025 16:24:50 +0000 (UTC)
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
X-Inumbo-ID: ff7e5d69-9962-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758731091;
	bh=YDQXTVGOYTWva8EDpEwYuBr0RgnUKG4x/JRMrHY45WA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rv4cs34/Qim8+evoo8ovxwouSo7ZGm3TI9LuDHjLvPp+9BNsAW86i5ETDW2z9zgbS
	 t1jCkRpP3DUkUTDh/pkjL6LwA58lCk3aAbmFSPmU+fs70OS8Ja80hE4+ougHuXWAdx
	 a8vFkzPrjcaO1uCAFBl37t3oCls0JUSZ0fuZn0l9N1EV531V1cnesgWHxjrkr1Hao8
	 r9rBsgtCOcl8qT7JR2g8zQ9SMGIHZ3sfQREqWI1i74rpoz0CvMeGDKWf/hLsg7wyNX
	 lpAuzlykFkUGgmFZxwgjHgnBF312aBL288V6fwXbKcCgN4y/GEpY5+nI93lu030Fht
	 FjJ6Fs4CbVVCA==
Message-ID: <38a9db70-c6dc-40f0-a506-942fb799fa86@kernel.org>
Date: Wed, 24 Sep 2025 11:24:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: take system_transition_mutex on suspend
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 "moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
References: <20250921162853.223116-1-marmarek@invisiblethingslab.com>
 <a8d1d076-81b0-424e-b281-dfbd49130d38@suse.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <a8d1d076-81b0-424e-b281-dfbd49130d38@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/22/25 1:06 AM, Jürgen Groß wrote:
> On 21.09.25 18:28, Marek Marczykowski-Górecki wrote:
>> Xen's do_suspend() calls dpm_suspend_start() without taking required
>> system_transition_mutex. Since 12ffc3b1513eb moved the
>> pm_restrict_gfp_mask() call, not taking that mutex results in a WARN.
>>
>> Take the mutex in do_suspend(), and use mutex_trylock() to follow
>> how enter_state() does this.
>>
>> Suggested-by: Jürgen Groß <jgross@suse.com>
>> Fixes: 12ffc3b1513eb "PM: Restrict swap use to later in the suspend 
>> sequence"
>> Link: https://lore.kernel.org/xen-devel/aKiBJeqsYx_4Top5@mail-itl/
>> Signed-off-by: Marek Marczykowski-Górecki 
>> <marmarek@invisiblethingslab.com>
>> Cc: stable@vger.kernel.org # v6.16+
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> 
> Juergen

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

