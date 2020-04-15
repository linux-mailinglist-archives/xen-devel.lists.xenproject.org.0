Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8DC1AA96C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 16:11:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOilW-0000T8-H4; Wed, 15 Apr 2020 14:11:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HSXo=57=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jOilU-0000Sp-M9
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 14:11:44 +0000
X-Inumbo-ID: 08f7c1be-7f23-11ea-8a58-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08f7c1be-7f23-11ea-8a58-12813bfff9fa;
 Wed, 15 Apr 2020 14:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=msT6aM2AJ1K6oxv676k39If/2dJKOISIwujnmLA2iCE=; b=At9en+Ra03XHJWhwgHDwc0YlxC
 w/5c70mFXfsUtL4zsCpJwIdKc8a1osaDFY6qL7kv8+pwDb92FcqHiDZLYXS73+WAtfsuBhHWolHpL
 vNNmQn6AvYVEo8k2yMNmOLSi7ZUb+OIpmcX6M+Po26FfV8G3j23AVdFfFytjkdDDoYw8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOilR-0004lM-Oj; Wed, 15 Apr 2020 14:11:41 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOilR-0001wG-IJ; Wed, 15 Apr 2020 14:11:41 +0000
Subject: Re: [PATCH 10/12] xen/arm: if is_domain_direct_mapped use native UART
 address for vPL011
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-10-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <05b46414-12c3-5f79-f4b1-46cf8750d28c@xen.org>
Date: Wed, 15 Apr 2020 15:11:40 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415010255.10081-10-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Stefano,

On 15/04/2020 02:02, Stefano Stabellini wrote:
> We always use a fix address to map the vPL011 to domains. The address
> could be a problem for domains that are directly mapped.
> 
> Instead, for domains that are directly mapped, reuse the address of the
> physical UART on the platform to avoid potential clashes.

How do you know the physical UART MMIO region is big enough to fit the 
PL011?

What if the user want to assign the physical UART to the domain + the 
vpl011?

Cheers,

-- 
Julien Grall

