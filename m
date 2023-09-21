Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F207AA813
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 07:11:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606600.944705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjYQg-0007hv-K0; Fri, 22 Sep 2023 05:10:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606600.944705; Fri, 22 Sep 2023 05:10:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjYQg-0007fV-HK; Fri, 22 Sep 2023 05:10:14 +0000
Received: by outflank-mailman (input) for mailman id 606600;
 Thu, 21 Sep 2023 22:24:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2E1J=FF=ska67.de=stefan.kadow@srs-se1.protection.inumbo.net>)
 id 1qjS65-00056g-St
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 22:24:33 +0000
Received: from mxout2.routing.net (mxout2.routing.net [2a03:2900:1:a::b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a34df443-58cd-11ee-878a-cb3800f73035;
 Fri, 22 Sep 2023 00:24:33 +0200 (CEST)
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
 by mxout2.routing.net (Postfix) with ESMTP id 205545FC6A
 for <xen-devel@lists.xenproject.org>; Thu, 21 Sep 2023 22:24:32 +0000 (UTC)
Received: from naboo.starwars.lan
 (ip-046-223-214-171.um13.pools.vodafone-ip.de [46.223.214.171])
 by mxbox2.masterlogin.de (Postfix) with ESMTPSA id BD8161006B8
 for <xen-devel@lists.xenproject.org>; Thu, 21 Sep 2023 22:24:31 +0000 (UTC)
Received: from [192.168.154.119] (unknown [192.168.154.119])
 by naboo.starwars.lan (Postfix) with ESMTPS id B878C61E37
 for <xen-devel@lists.xenproject.org>; Fri, 22 Sep 2023 00:24:31 +0200 (CEST)
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
X-Inumbo-ID: a34df443-58cd-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1695335072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tRttLqrrOwln5kJL7+JGoLN1Ecl6afl18/1LrECeroo=;
	b=FgCQMIumgw8F+tPmghZds5YoUripUdEjLntNIv8hM5kJriGEVJVxcrFkO3R8rtNDZFV1bV
	nIjg575AH01aVsfoV42GyJHzAyKAbMJpTF2sQJYInUnDW8Lg4gxewU6hOqzpA5WJn73RUN
	VwhyWi685PvMb1+HvmFj7BupPxtZBRI=
Message-ID: <8ed49454-101a-596f-3a26-3e5702a80001@ska67.de>
Date: Fri, 22 Sep 2023 00:24:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Stefan Kadow <stefan.kadow@ska67.de>
Subject: qemu-system-i386 crashes on i9 coffee lake
To: xen-devel@lists.xenproject.org
Content-Language: de-DE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mail-ID: 6e4483b9-a7ff-4f4b-8427-3ad9e214afbb

Hello,

since commit b9ade05c
https://xenbits.xenproject.org/gitweb/?p=xen.git;a=commit;h=b9ade05cbba977673d5a08bc7a5940c5fd8add0e

qemu-system-i386 crashes on my Intel i9 Coffee Lake System.

This does not happen when the system is booted with the latest microcode 
update. So I do not know if this is really a regression.

Please, see the discussion on xen-users mailing list:
https://lists.xenproject.org/archives/html/xen-users/2023-08/msg00014.html

-- 
Thx Stefan

