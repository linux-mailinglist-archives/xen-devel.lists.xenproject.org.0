Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF4F2F3B65
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 21:09:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66000.117032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzPyb-0000ZS-Jl; Tue, 12 Jan 2021 20:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66000.117032; Tue, 12 Jan 2021 20:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzPyb-0000Z3-G6; Tue, 12 Jan 2021 20:09:13 +0000
Received: by outflank-mailman (input) for mailman id 66000;
 Tue, 12 Jan 2021 20:09:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v4LF=GP=cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1kzPya-0000Yx-DP
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 20:09:12 +0000
Received: from ppsw-41.csi.cam.ac.uk (unknown [131.111.8.141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 579e23c9-dd52-4411-8e44-993594fc0344;
 Tue, 12 Jan 2021 20:09:10 +0000 (UTC)
Received: from 88-111-124-141.dynamic.dsl.as9105.com ([88.111.124.141]:57674
 helo=[192.168.1.219])
 by ppsw-41.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.159]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1kzPyX-000gqi-Sf (Exim 4.92.3)
 (return-path <amc96@cam.ac.uk>); Tue, 12 Jan 2021 20:09:09 +0000
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
X-Inumbo-ID: 579e23c9-dd52-4411-8e44-993594fc0344
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cam.ac.uk;
	 s=20180806.ppsw; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tcuG3sRN/KsXd0a/Sta84Ju0lCNgArq53KW18jRGl+E=; b=E/5tUqsz8yVezyP2sX8AeybxeG
	BMrZpRfrFllIXT5nuN7WYeQxQkfBYGEvSrTsLeQQxEWUHFDq0OhSJUxmB4ZvWOOXrCgE74Aq2R3yz
	JbhBZQTjRzCAtORrBaxtu7kakcO0jVgW/HUR7cZGBiPrxs6oW/dTZj1lHuNPgEefwd7s=;
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Subject: Re: [PATCH v2] xen/privcmd: allow fetching resource sizes
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul.durrant@citrix.com>, andrew.cooper3@citrix.com,
 xen-devel@lists.xenproject.org
References: <20210112115358.23346-1-roger.pau@citrix.com>
 <2d853ee1-b671-78ad-f634-0fd1c4f7d2ce@suse.com>
From: Andrew Cooper <amc96@cam.ac.uk>
Message-ID: <c71f63a1-1b5f-f552-d3d2-531a33c087bb@cam.ac.uk>
Date: Tue, 12 Jan 2021 20:09:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <2d853ee1-b671-78ad-f634-0fd1c4f7d2ce@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 12/01/2021 12:17, Jürgen Groß wrote:
> On 12.01.21 12:53, Roger Pau Monne wrote:
>> Allow issuing an IOCTL_PRIVCMD_MMAP_RESOURCE ioctl with num = 0 and
>> addr = 0 in order to fetch the size of a specific resource.
>>
>> Add a shortcut to the default map resource path, since fetching the
>> size requires no address to be passed in, and thus no VMA to setup.
>>
>> This is missing from the initial implementation, and causes issues
>> when mapping resources that don't have fixed or known sizes.
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> Cc: stable@vger.kernel.org # >= 4.18
>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>

