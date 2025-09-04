Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 212CDB43378
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 09:11:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109653.1459170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu47E-0005la-7Y; Thu, 04 Sep 2025 07:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109653.1459170; Thu, 04 Sep 2025 07:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu47E-0005jO-4d; Thu, 04 Sep 2025 07:10:40 +0000
Received: by outflank-mailman (input) for mailman id 1109653;
 Thu, 04 Sep 2025 07:10:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Smfj=3P=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uu47B-0005jE-AY
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 07:10:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40bccc24-895e-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 09:10:35 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 6B36F4EEBC47;
 Thu,  4 Sep 2025 09:10:34 +0200 (CEST)
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
X-Inumbo-ID: 40bccc24-895e-11f0-9d12-b5c5bf9af7f9
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1756969834;
	b=HAYypZukrbdXY3Bf6igfWgGb475tllQZTgSsRGHIjhE0mW35s+tVXEaSGcxZ7AP7AvKO
	 Btgy8A1+0btm1qJwjqv0/wUKd4OpuXQrJ00OnkArZsQ0ZvZ7XyzbE6T3W/zEfs/KqJrt7
	 IYCk+t3Tp9KYwK+Dl6hnfuvo5QNGeOyyZhM7pESAio2boiws2RhG6AFHCceBoG9aDgK0g
	 ZOQRK94PVfkNSyDanAZEzFHojKcDf3lqdm+XuzTAR6yXO5fk6CoeLFpuQV7mkqjNtCQZV
	 8eVdQpHuhQlKsSz428YtWHUMQHOt7ChyO1R7habM9rq9BPaC5s+dB+XbNiNO1XsXbeurW
	 ADgr5CukXMncz9HHRZLcRDU/ZP9/+y0pyfIrKKNHAMJIwYaeT5hFSbZQ8Lu6CJlnaO0/L
	 pwq6qZhY7QCyiPtwINGi5hK+8mur0b1MY8bAbbbL/1HOyVKHlHth5tvs8soWl/mcnBqNU
	 hbxTYgvjOpw9ScgWxVXKlCxrtUP490xgr+drF1fZVw6pjx4PR3uJr33YiEnp9x+1z9NmO
	 SpdNVjRDQjcuws6ExKuI49s3EE7QTN5jwU8KDmQGsAM3+SbTlMDeynqtatw/zvH/ovqI0
	 W4an5KszCo5tnypWSn+OFxMmVPjvRJwim92aahHsFtPo0v0m2zgA+cqwZXxNhvc=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1756969834;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=XLbOswXUPJg6LIk8TV86ytb6mfJtQ1IBaz1pUak3pAU=;
	b=xms6hGTDVktfoSF43xEK6DApT9DGlzNy6lPu6qfSX2+3PSM3/23a6Hox6V9QHT3OAPQ6
	 XYY0MvwFanDJZet4HMUJbfQBl1yHhUOIHbwEF7XU/phAoJDe4PIX8Fnd9OW+DUTRdgoCv
	 38bN0on/b0DumjPLkcnyNzI6o1i1eOrxfSBWkeiF+YWgQbODFvIo0OFKxiTpS30++IhWB
	 KyEEmo8cp+0PvXsO4/PKz75uAdXZVNtMviGRQI15pVeHvbiXCCFKJsTlzNlaf+F24SqZd
	 iJRphnV4pYtDhOC/J+ZbM8Sur5Xb8cckcqbMuDiFclo9kJXx0X02SO9V3c+X1c16JMtg9
	 ZBV7IrGZthVyYRDiz1BC4LH/wyc/4hJ40+aRAWppI9iHDUyVoRVxiRHFNOxvIEa2PFlXV
	 DLnp7OUt5b5Z2tJ50px1S96/HzI3p7ZMhVguNwOub4pZ39L0O/MHRbTpdbcIiIO1WxYiG
	 N+7LbHNDL0UR7ogzJjY0eLb1hrKzKAc1Nm/gCW6Nk3ywOxohBpV9oOTR8CMI0KbEBqtef
	 C2Ki2TPHOsoANqQ6EfLXSv+qlF1Fz7B5J5KwTiUgvP7zQbBiRMBjaNfrMEbdy/dkWLWF4
	 E40dbGKbGk9SOZXhOp+YlF4CbeLfpaB2+S7ew3c+zFZXPZDXoJwvq38vMMyAFjs=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1756969834; bh=MugVdJV7NDuyuSGlolozR+FQTiAQRtEoFg2kgmNTFIg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=y1g1xmaeNW0k6ihwf+w07eqt/45d7DR1TPR+FsKn6aPzrKF4EKEmwkacex6jnMTcb
	 9O+QBcpe1ppkn+opmm5cuTXPWKR9aWv1jOoc0oaU7kU4XjbBlw48E4K3id6hr4yukF
	 N5EVs5OIeL9lsEDW3dZIcJwEDpYDZj8ryo/cPzZg6xdH7Q5t4t6XaHyYKib9nSM8va
	 PH9RuIr6iyp+X/OOC2W2hnQRNT1QmAINKr7SX8Y/lAKk4Q7BhZ2E2FxvSladJ9siQo
	 4o8NnJtpEHAIKJIXLVSrgtDHCWM3JA2P2bQBB4+jYUvBy+I6AYQfS2T+tsOdlwLpXa
	 JG+dnv6mD6RrQ==
MIME-Version: 1.0
Date: Thu, 04 Sep 2025 09:10:34 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Oleksii Moisieiev
 <Oleksii_Moisieiev@epam.com>, xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger?=
 =?UTF-8?Q?_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Grygorii Strashko
 <grygorii_strashko@epam.com>
Subject: Re: [PATCH v8 0/4] xen/arm: scmi: introduce SCI SCMI SMC single-agent
 support
In-Reply-To: <87bjnrtdh3.fsf@epam.com>
References: <cover.1756905487.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2509031421210.1405870@ubuntu-linux-20-04-desktop>
 <87bjnrtdh3.fsf@epam.com>
Message-ID: <f2d62d2b86aa0c779edbb058b342891d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-09-03 23:47, Volodymyr Babchuk wrote:
> Hi Stefano,
> 
> Stefano Stabellini <sstabellini@kernel.org> writes:
> 
>> Hi Oleksii,
>> 
>> It is still not passing the ci-loop, this time due to MISRA. See the 
>> two
>> new 8.3 and 8.4 violations (previously zero) and also new additional
>> 12.2, 13.1 violations:
>> 
> 
> Is there any way to run this kind of tests locally? (I suppose that
> answer is "no")
> 
> Or at least maybe it is possible to use gitlab CI without sending
> patches to the ML? Maybe via opening MRs at gitlab?

Hi Volodymyr,

you can manually run these on branches in sub-repos after creating the 
pipeline, I believe.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

