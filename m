Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEA43BE861
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 14:52:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152153.281110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m171U-0006dY-9a; Wed, 07 Jul 2021 12:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152153.281110; Wed, 07 Jul 2021 12:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m171U-0006bj-69; Wed, 07 Jul 2021 12:51:28 +0000
Received: by outflank-mailman (input) for mailman id 152153;
 Wed, 07 Jul 2021 12:51:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m171S-0006bd-NY
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 12:51:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m171P-0003dD-MJ; Wed, 07 Jul 2021 12:51:23 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m171P-0006QQ-Fo; Wed, 07 Jul 2021 12:51:23 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=sHg00tgsxIMIF0iMrMMSGHVKukZ//qgU2uFO1GDzcak=; b=bizrwFDZipMkyoVm1csGk1RUYx
	vGhZUYOWjUKPOnrq0zQ98PXdt7ykYt2Jk03hyizFk/hr9zj8zqoR4y/S3H8xErVmKTyuxnBRVaTMx
	Kjj4J/1bnUYcMgQcOiZxhrf4GGuMvdMltSoJab7k4jENvyCH5mAW0CeD2ylSlMXRTbPM=;
Subject: Re: [PATCH] tools/libxc: use uint32_t for pirq in
 xc_domain_irq_permission
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, wl@xen.org, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, sstabellini@kernel.org,
 jgross@suse.com, christian.lindig@citrix.com, dave@recoil.org
References: <1625619764-23537-1-git-send-email-igor.druzhinin@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b1720313-d636-9c8c-3109-748dbe311187@xen.org>
Date: Wed, 7 Jul 2021 13:51:21 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1625619764-23537-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Igor,

On 07/07/2021 02:02, Igor Druzhinin wrote:
> Current unit8_t for pirq argument in this interface is too restrictive
> causing failures on modern hardware with lots of GSIs. That extends down to
> XEN_DOMCTL_irq_permission ABI structure where it needs to be fixed up
> as well. Internal Xen structures appear to be fine. Existing users of
> the interface in tree (libxl, ocaml and python bindings) are already using
> int for pirq representation that should be wide enough.

By "int", I am assuming you imply "signed int", is that correct?

If so, should the function xc_domain_irq_permission() interface take an 
int in parameter and check it is not negative?

Cheers,

-- 
Julien Grall

