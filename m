Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1F63A7E9B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jun 2021 15:04:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142001.262129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lt8iV-0003w0-Ay; Tue, 15 Jun 2021 13:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142001.262129; Tue, 15 Jun 2021 13:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lt8iV-0003uE-73; Tue, 15 Jun 2021 13:02:55 +0000
Received: by outflank-mailman (input) for mailman id 142001;
 Tue, 15 Jun 2021 13:02:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lt8iT-0003u4-Pu
 for xen-devel@lists.xenproject.org; Tue, 15 Jun 2021 13:02:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lt8iS-00035Z-Be; Tue, 15 Jun 2021 13:02:52 +0000
Received: from [54.239.6.184] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lt8iS-00044l-2s; Tue, 15 Jun 2021 13:02:52 +0000
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
	bh=m1jyjRgu2Dt6wTFkFiDBGeSzM27snggXNYe3KLa+a1E=; b=OiTpbn1rDvAT6ARZPu/UoanYeM
	GRNPf+92Gnn9w9hwTJY5o07PA37t3EJzUih0kWfLhLcdMGjyb5yqD3TtvMnr787FeKBm5Q0/El5jr
	rGDF1SEzm5JIHDVoPggGCzs5HeOnxX1VuTs5iNSi9SClkyZWYobPnHRMM4Mivu0I4qGo=;
Subject: Re: [XEN PATCH v2 0/8] Fix libxl with QEMU 6.0 + remove some more
 deprecated usages.
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210511092810.13759-1-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <402a865e-972f-d0c4-78af-4be32894bfe9@xen.org>
Date: Tue, 15 Jun 2021 15:02:49 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210511092810.13759-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 11/05/2021 11:28, Anthony PERARD wrote:
> Patch series available in this git branch:
> https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.deprecated-qemu-qmp-and-cmd-v2
> 
> v2:
> - fix coding style in patch 3
> - all reviewed
> 
> The Xen 4.15 release that went out just before QEMU 6.0 won't be compaptible
> with the latter. This patch series fixes libxl to replace use of QMP commands
> that have been removed from QEMU and to fix usage of deprecated command and
> parameters that well be remove from QEMU in the future.
> 
> All of the series should be backported to at least Xen 4.15 or it won't be
> possible to migrate, hotplug cpu or change cdrom on HVM guest when QEMU 6.0 and
> newer is used. QEMU 6.0 is about to be release, within a week.
> 
> Backport: 4.15
> 
> Anthony PERARD (8):
>    libxl: Replace deprecated QMP command by "query-cpus-fast"
>    libxl: Replace QEMU's command line short-form boolean option
>    libxl: Replace deprecated "cpu-add" QMP command by "device_add"
>    libxl: Use -device for cd-rom drives
>    libxl: Assert qmp_ev's state in qmp_ev_qemu_compare_version
>    libxl: Export libxl__qmp_ev_qemu_compare_version
>    libxl: Use `id` with the "eject" QMP command
>    libxl: Replace QMP command "change" by "blockdev-change-media"

I have committed the series.

Cheers,

-- 
Julien Grall

