Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3698F27CA7E
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 14:19:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148.315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNEbY-0006IY-IK; Tue, 29 Sep 2020 12:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148.315; Tue, 29 Sep 2020 12:19:36 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNEbY-0006I9-Em; Tue, 29 Sep 2020 12:19:36 +0000
Received: by outflank-mailman (input) for mailman id 148;
 Tue, 29 Sep 2020 12:19:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pXYx=DG=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kNEbW-0006I4-29
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 12:19:34 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 693f9dcd-d698-4844-8abf-766b8e54c60a;
 Tue, 29 Sep 2020 12:19:32 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNEbR-0001QM-VN; Tue, 29 Sep 2020 12:19:29 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNEbR-0007l0-OS; Tue, 29 Sep 2020 12:19:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pXYx=DG=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kNEbW-0006I4-29
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 12:19:34 +0000
X-Inumbo-ID: 693f9dcd-d698-4844-8abf-766b8e54c60a
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 693f9dcd-d698-4844-8abf-766b8e54c60a;
	Tue, 29 Sep 2020 12:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=eGikPUWF7DcDmGLKLH6md6YK49T/I44oZOL9/souxCQ=; b=2NNj9DX9Xw5SnFZR8v9d6J+3ox
	naYLxI7zHwhRrMu+yRteRzcOPeTFhmmnvJN8GPAf/XXFcqbGHNANQA2SjY060vzFCWsNa5ghiFM2W
	2Z6UfVdWOGIpGggKwUSjiUPYbxVYxeByxRwyAhL6dz3zD5GZYbO0iXzmJRV9MR+ZgLsc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNEbR-0001QM-VN; Tue, 29 Sep 2020 12:19:29 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNEbR-0007l0-OS; Tue, 29 Sep 2020 12:19:29 +0000
Subject: Re: [PATCH 08/12] evtchn: ECS_CLOSED => ECS_FREE
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <eeb0f674-1eb5-85a2-70b2-42041588e3d9@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <54423e7a-f7e2-5550-55bd-d47f1a41bf60@xen.org>
Date: Tue, 29 Sep 2020 13:19:27 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <eeb0f674-1eb5-85a2-70b2-42041588e3d9@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 28/09/2020 12:00, Jan Beulich wrote:
> There's no ECS_CLOSED; correct a comment naming it.
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

