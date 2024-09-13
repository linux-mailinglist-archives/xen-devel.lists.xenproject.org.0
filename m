Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9B8977AD4
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 10:17:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798067.1208225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp1UE-0001Re-GQ; Fri, 13 Sep 2024 08:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798067.1208225; Fri, 13 Sep 2024 08:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp1UE-0001OT-DJ; Fri, 13 Sep 2024 08:17:02 +0000
Received: by outflank-mailman (input) for mailman id 798067;
 Fri, 13 Sep 2024 08:17:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T2Jz=QL=embeddedor.com=gustavo@srs-se1.protection.inumbo.net>)
 id 1sp1UC-0001N4-LA
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 08:17:00 +0000
Received: from omta38.uswest2.a.cloudfilter.net
 (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b2295ec-71a8-11ef-a0b5-8be0dac302b0;
 Fri, 13 Sep 2024 10:16:58 +0200 (CEST)
Received: from eig-obgw-5009a.ext.cloudfilter.net ([10.0.29.176])
 by cmsmtp with ESMTPS
 id owXTsFeqiumtXp1U8saT5Z; Fri, 13 Sep 2024 08:16:56 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id p1U7s2WVZn3BMp1U7sVadf; Fri, 13 Sep 2024 08:16:55 +0000
Received: from [185.44.53.103] (port=57790 helo=[192.168.1.187])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.2)
 (envelope-from <gustavo@embeddedor.com>) id 1sp1U6-003rlv-2J;
 Fri, 13 Sep 2024 03:16:54 -0500
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
X-Inumbo-ID: 8b2295ec-71a8-11ef-a0b5-8be0dac302b0
X-Authority-Analysis: v=2.4 cv=DY8RqOtW c=1 sm=1 tr=0 ts=66e3f4f7
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=rpUMG24A1zG+UrzXDtAMsg==:17
 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=7T7KSl7uo7wA:10
 a=UWiDY137rChLUBZtjNEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+Sp7eKii8hwE9TMjnTOQoSBvNTxcsXnko4qRV4csTKc=; b=n2lQr8BVcESXKzes5CJ6MPYRWa
	cVimG41wISMNnxtrCH/3aTGe7sQiVgvKUwZZu3R9Ctyb5cKxgX61Lh49By3UmOVHPu/95NEo/nY5h
	E3ovmbx0l1fVJ3ao+Va7ihLsun6sYGbcjbQ72xS163E5MXk2QCxbj6Nt9TFHTlSiRKae8w2Qzyj1j
	As4jd0O80vEmai8wCW8OOawytZBi/raJJZEpZ/7sMXy3XvD2pcfaIV32fFT0H/A3b5m46xGuRQdwO
	nVooGUMyXYdoBMRf5Olr6SdpVvURZ3f0hYqxkAuth56K7yXbxapTm6gQVufcs5AJQnOr2fKeV0GC0
	9nd81otw==;
Message-ID: <ecbcc7d5-7ba1-4d3a-85d5-20c583b59766@embeddedor.com>
Date: Fri, 13 Sep 2024 10:16:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] xen/pci: Avoid -Wflex-array-member-not-at-end
 warning
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <ZsU58MvoYEEqBHZl@elsanto>
 <9fabe73e-23ea-49f2-9c06-17766a07fe9d@embeddedor.com>
 <4b1004d5-a8f6-4f3a-b17d-79d354a23f6a@suse.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <4b1004d5-a8f6-4f3a-b17d-79d354a23f6a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 185.44.53.103
X-Source-L: No
X-Exim-ID: 1sp1U6-003rlv-2J
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.187]) [185.44.53.103]:57790
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 39
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEZXqhjL49P75VUpzXLazkah5pxFhVdDjXMXV6wYSotfFD5tTDPLay5OPoBbPnBSnmlYUjZ6UpBQ70K3b4//HpPeK/cl5gcJvF4/P7e4L7+nZ/vxnVPJ
 NEjrseHuSkLEXyRjz7g+0pJF1NjPDNpFU/0blReXQ7eXM5QNIHB7XDdQ/tpAgYF+YkpasjnToh9UgeQwbaH9d5c5DJ2f8oM6AcnrzRpOnl5R2DJKEirc/dKl



On 13/09/24 10:12, Jürgen Groß wrote:
> On 13.09.24 10:07, Gustavo A. R. Silva wrote:
>> Hi all,
>>
>> Friendly ping: who can take this, please? 🙂
> 
> I can carry it via the Xen tree.

Sounds good. :)

Thank you!
--
Gustavo

