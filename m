Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66903814040
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 03:52:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654834.1022250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDyJQ-00030S-Q1; Fri, 15 Dec 2023 02:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654834.1022250; Fri, 15 Dec 2023 02:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDyJQ-0002yp-My; Fri, 15 Dec 2023 02:52:28 +0000
Received: by outflank-mailman (input) for mailman id 654834;
 Fri, 15 Dec 2023 02:52:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onWf=H2=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rDyJP-0002yh-RP
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 02:52:27 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9f7ef5c-9af4-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 03:52:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DDBC58285463;
 Thu, 14 Dec 2023 20:52:24 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id PB9qqedX0N4j; Thu, 14 Dec 2023 20:52:24 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5AD1A8285558;
 Thu, 14 Dec 2023 20:52:24 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id qnhnRQcWb2BQ; Thu, 14 Dec 2023 20:52:24 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id E83A58285463;
 Thu, 14 Dec 2023 20:52:23 -0600 (CST)
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
X-Inumbo-ID: f9f7ef5c-9af4-11ee-98ea-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 5AD1A8285558
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1702608744; bh=je1/038gDPWcBkKuI2BLJBDrybC8NWy5sL6lNWqQTtI=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=AziBbRlAoB05qdJoPatF0fMQRqkNFOzKoA769y786Wvm4DscIdppSZkdvqKL8P6cX
	 898dzV2MbVHELiD5McUXayQ7g0v3sadBlx6u6wz71doy+85JtT7tAtXlFzeyCY68cm
	 owxDd8nDEtM1OiPX/uoDeU0Eq/4tUo1G1FXx9r+k=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <838f9aaf-a5ef-44f7-945a-7ea682cd6f0f@raptorengineering.com>
Date: Thu, 14 Dec 2023 20:52:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Early Boot Allocation on Power
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1701384928.git.sanastasio@raptorengineering.com>
 <be3936a2-22e6-4528-90f3-a5a5629754ba@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <be3936a2-22e6-4528-90f3-a5a5629754ba@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jan,

On 12/4/23 1:58 AM, Jan Beulich wrote:
> A standalone patch with this title was sent earlier. What's their
> interrelation?
> 

I had intended to prefix this patch with 'RESEND' to clarify that it is
the same as the one previously sent, but seem to have forgotten. My
apologies! In any case, this patch will be superseded in v2 of the
series.

> Jan
>

Thanks,
Shawn

