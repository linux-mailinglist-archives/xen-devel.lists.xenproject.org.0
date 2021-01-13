Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B183E2F530C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 20:08:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66724.118627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzlV9-0005Jo-C6; Wed, 13 Jan 2021 19:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66724.118627; Wed, 13 Jan 2021 19:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzlV9-0005JP-9C; Wed, 13 Jan 2021 19:08:15 +0000
Received: by outflank-mailman (input) for mailman id 66724;
 Wed, 13 Jan 2021 19:08:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdpw=GQ=cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1kzlV6-0005JK-GD
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 19:08:13 +0000
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fc52e12-10d7-431c-ac43-10164c0b6d96;
 Wed, 13 Jan 2021 19:08:10 +0000 (UTC)
Received: from 88-111-100-194.dynamic.dsl.as9105.com ([88.111.100.194]:35986
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1kzlV3-000AmM-Lb (Exim 4.92.3)
 (return-path <amc96@cam.ac.uk>); Wed, 13 Jan 2021 19:08:09 +0000
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
X-Inumbo-ID: 2fc52e12-10d7-431c-ac43-10164c0b6d96
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cam.ac.uk;
	 s=20180806.ppsw; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bzwPzdsypEdwwIopWhUEHlvVB2EuVaqKXfioFHBs2ug=; b=yqtGbfRg0cTZevR9HpE+G2H1Bu
	mECVn07tbAonxA12JFGCBAH1yid2CraBMjF9o0VwKP2p71O9SpUoOAIPK0g+ycqEjVHMKiOiwazUN
	J2lckYe/dI1BP89wj3KhP09BKYJSsv49vrj7sF+BIe8Y3KVkuiUnwzF454rPZ7ODajKs=;
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Subject: Re: [PATCH 2/3] tools: Move xen-access from tests/ to misc/
To: Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
References: <20210113123455.23209-1-andrew.cooper3@citrix.com>
 <20210113123455.23209-3-andrew.cooper3@citrix.com>
 <CABfawhmiD-UXRBvPd-6=OayvkMf0G6pZZFawasuWiv7DNN937A@mail.gmail.com>
From: Andrew Cooper <amc96@cam.ac.uk>
Message-ID: <44cfc9a7-4b73-b23f-4faf-9eef0659b570@cam.ac.uk>
Date: Wed, 13 Jan 2021 19:08:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CABfawhmiD-UXRBvPd-6=OayvkMf0G6pZZFawasuWiv7DNN937A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 13/01/2021 18:50, Tamas K Lengyel wrote:
> On Wed, Jan 13, 2021 at 7:35 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> xen-access is a tool for a human to use, rather than a test.  Move it
>> into misc/ as a more appropriate location to live.
>>
>> Move the -DXC_WANT_COMPAT_DEVICEMODEL_API from CFLAGS into xen-access.c itself
>> to avoid adding Makefile complexity.
> Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

Thanks.  I'll also update the MAINTAINERs path, which I forgot to do.

~Andrew

