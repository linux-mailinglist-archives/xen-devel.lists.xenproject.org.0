Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 300A131B5AA
	for <lists+xen-devel@lfdr.de>; Mon, 15 Feb 2021 08:38:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85068.159473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBYS0-0000nz-S6; Mon, 15 Feb 2021 07:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85068.159473; Mon, 15 Feb 2021 07:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBYS0-0000nc-Nt; Mon, 15 Feb 2021 07:37:44 +0000
Received: by outflank-mailman (input) for mailman id 85068;
 Mon, 15 Feb 2021 07:37:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dghk=HR=codiax.se=anders.tornqvist@srs-us1.protection.inumbo.net>)
 id 1lBYRz-0000nH-Di
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 07:37:43 +0000
Received: from mailrelay1-3.pub.mailoutpod1-cph3.one.com (unknown
 [46.30.212.10]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20ed8bb5-fa94-4ab7-9243-5538a7f83d63;
 Mon, 15 Feb 2021 07:37:41 +0000 (UTC)
Received: from [192.168.101.129] (h87-96-135-119.cust.a3fiber.se
 [87.96.135.119])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id ae742993-6f60-11eb-9248-d0431ea8a283;
 Mon, 15 Feb 2021 07:37:40 +0000 (UTC)
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
X-Inumbo-ID: 20ed8bb5-fa94-4ab7-9243-5538a7f83d63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codiax.se; s=20191106;
	h=content-transfer-encoding:content-type:mime-version:date:message-id:to:
	 subject:from:from;
	bh=nRwWovs734qaKdA60euEkY5q39AlOcB9TXQaCO+vki4=;
	b=VFDfkwvhUV5LPl2bPLPCwWV4mwlaqetBAeAGGOc5AmxFDg9euYUN176JdReBU4GbSXk7E5hRiKQ9h
	 AEwjkmzzj3BFhJNzWekC8/6vV98DQG91jPbILul+Y/1CvgzsqYzTDJvp3ULq1KqD1j7y0phB/eSKRQ
	 k415zNSCg7rXKYHzgh7yqmByrtkpz75ZhK6zF9g8zvlDELel7lvzDgZC4WHpdUM5s0wyGYFS1PKkas
	 DOvOZi6utKH1yR+3jQlG5h11PEXoPYrcLs3yBRjjTHdXS3jyqn59Jh0ak8oSGK5j+ncfBUW/SD/hHy
	 YY1fh7rRDDLeTJTezATkZX3CwJMFuGQ==
X-HalOne-Cookie: 7dc683fc829a40dbfc6b6ccd077c5325c7ceba05
X-HalOne-ID: ae742993-6f60-11eb-9248-d0431ea8a283
From: =?UTF-8?Q?Anders_T=c3=b6rnqvist?= <anders.tornqvist@codiax.se>
Subject: Boot time and 3 sec in warning_print
To: xen-devel@lists.xenproject.org
Message-ID: <fcc14668-b07d-aec8-1587-bc2d7add84da@codiax.se>
Date: Mon, 15 Feb 2021 08:37:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

Hi,

I would like to shorten the boot time in our system if possible.

In xen/common/warning.c there is warning_print() which contains a 3 
seconds loop that calls  process_pending_softirqs().

What would the potential problems be if that loop is radically shortened?

/Anders


