Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB62077EBAB
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 23:24:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584932.915840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWNzc-0002bd-3i; Wed, 16 Aug 2023 21:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584932.915840; Wed, 16 Aug 2023 21:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWNzc-0002YT-0c; Wed, 16 Aug 2023 21:23:52 +0000
Received: by outflank-mailman (input) for mailman id 584932;
 Wed, 16 Aug 2023 21:23:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yqiy=EB=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qWNzb-0002Vt-AG
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 21:23:51 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fbe48bc-3c7b-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 23:23:49 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1692221023200672.5864644894833;
 Wed, 16 Aug 2023 14:23:43 -0700 (PDT)
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
X-Inumbo-ID: 2fbe48bc-3c7b-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; t=1692221024; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=m2j4qGffFfONvpN/1R5M6YIG7xiSKQAlLWgUyz090dJq9Xx0BXZIT8Va2lW27P6oIu6BWkZ5L+BbnlayFqHX3W303yjOEXEdjIbwQF/kH60MQTKThJH1iur87f28RIxOwwOETOfqzmfBDJ66lvUIwfRW63EjCV8uClzRRPGdlJk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1692221024; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=KT01mhb799m2k4LZiUVoMF9byp8aBApAOHTsY7m13/U=; 
	b=INQbffp0vfMhJ+8whXSVx/Gr8cyPxDUEYyKsw72kFnpeoIuZksRy22OMw3j60C6g8Qp1XSwsIEn3gr+djuia/PuJKfjkQ89sHpbFrLmSwaKXe29VWwQ992XIfFyMRjCAxOAcvBbKkCg45b1XvpawXkHRYuTHWpPJXkg897yRyvg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1692221024;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:From:From:Subject:Subject:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=KT01mhb799m2k4LZiUVoMF9byp8aBApAOHTsY7m13/U=;
	b=TL3N03PZLVKTUTqXPyrZmildGmf0TAQnHd+DIAK4XcbH2Xo8stiEm0i7IOAS5EWw
	EJgToSuSY2Gz8bCKBAXFQb3kmiGmLHVlpQ0P5enLBD41Mg9MQ1Zqg1Z4viTfnU3vAo8
	vfBWScoy1dGecXHQ+pHnwOXpQyIZjIlr/6Ckiodg=
Message-ID: <5c109314-67ba-d86c-d787-16046fe18e0a@apertussolutions.com>
Date: Wed, 16 Aug 2023 17:23:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Kelly Choi <kelly.choi@cloud.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Xen support in Bootlin Elixir
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Greetings All,

I am sure most are familiar with Bootlin's Elixir code cross-reference 
project[1][2]. I recently submitted a PR[3] that enables indexing all 
Xen release branches from the xen.git repository.

If anyone would like to play with it locally, the branch can be found 
here[4]. If one is going to use the Debian dockerfile to build and run 
it, then you will need to modify the dockerfile as noted in this issue[5].

[1] https://elixir.bootlin.com/
[2] https://github.com/bootlin/elixir
[3] https://github.com/bootlin/elixir/pull/256
[4] https://github.com/apertussolutions/elixir/tree/xen
[5] https://github.com/bootlin/elixir/issues/252

V/r
Daniel P. Smith

