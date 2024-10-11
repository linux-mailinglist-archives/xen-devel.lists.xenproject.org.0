Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFC099A0BE
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 12:05:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816888.1230984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szCVQ-0000En-S3; Fri, 11 Oct 2024 10:04:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816888.1230984; Fri, 11 Oct 2024 10:04:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szCVQ-0000D8-P5; Fri, 11 Oct 2024 10:04:20 +0000
Received: by outflank-mailman (input) for mailman id 816888;
 Fri, 11 Oct 2024 10:04:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p70Z=RH=bounce.vates.tech=bounce-md_30504962.6708f81e.v1-8efad8fb96864b5d971e2d7ded9f7285@srs-se1.protection.inumbo.net>)
 id 1szCVO-0000D2-Lq
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 10:04:18 +0000
Received: from mail136-14.atl41.mandrillapp.com
 (mail136-14.atl41.mandrillapp.com [198.2.136.14])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c06b5cf-87b8-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 12:04:16 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-14.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4XQ2KB4GNXz705lrH
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 10:04:14 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8efad8fb96864b5d971e2d7ded9f7285; Fri, 11 Oct 2024 10:04:14 +0000
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
X-Inumbo-ID: 2c06b5cf-87b8-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1728641054; x=1728901554;
	bh=tL325rHXc3QBdrp62haOYIHGJ43zT5LOupfREdCNw44=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Cw/ECgc1NdXl9aqftamyZNm/E2CXB38hYg3utntH4I0dpdnklVyZStgEqdfykippj
	 a8SznWfFjCq9vd2slJN2vTA6BmEKCAl/8372zyPFe/Pay96SCuZLajYgrUtyihom0i
	 /R7bEs0RJB2jjrOVUnzm/rD7vByBxg/nctc2ZL1jK1mlItjfSaZmU6WpEY31nqvbRj
	 6MaGlE/BWHjtiY9G3/yVSUGOD+4woBLmjH8WeudltUCTfuHXPOUrjXK+BwLDjksJyB
	 ZGC693CrhEfyV2jbvl81aIVV/dobc2D5KfsgKqH/gBm7diZS8oy2WQGPoprvL/Lx1b
	 MK0syqDw6g45g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1728641054; x=1728901554; i=anthony.perard@vates.tech;
	bh=tL325rHXc3QBdrp62haOYIHGJ43zT5LOupfREdCNw44=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=P1k7H323+EqpIJSHqv91W315FBCZYv339uMfnm4qNqHdMvSR1890XrZ7lgWmnjqKA
	 tclkq34AiHFtHZqmXRuElN7WXwoG2me+qyc2l4nMZabl0CC7kmAIsy7B3Qdi2ogzLT
	 iPODxv4EvMd21Z8NMAVtlsWtx1qxDw0qD1jpyy9Oe9mmxCr6n/75cZBouhE9VQooJM
	 A8pIa3I7qt5UzFm0A58+coqYORqsfbhhF6EIdrG0YFiIThOavbF4iJqZZp+y5TfrYE
	 XlkvLn5aB3pRXd6XEW0APQ7auTpLv74i8i03lN1nZoq6zyVjMNZqgh5kV8vwMT5k3V
	 kUwJvdaOsLL9w==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=202/3]=20tools/xenstored:=20remove=20unneeded=20libxenguest=20reference?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1728641053928
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
Message-Id: <Zwj4HdtLD1sVDhNB@l14>
References: <20241010155459.22389-1-jgross@suse.com> <20241010155459.22389-3-jgross@suse.com>
In-Reply-To: <20241010155459.22389-3-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8efad8fb96864b5d971e2d7ded9f7285?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241011:md
Date: Fri, 11 Oct 2024 10:04:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Oct 10, 2024 at 05:54:58PM +0200, Juergen Gross wrote:
> Today the xenstored Makefile contains an unneeded reference to the
> not used libxenguest library.
> 
> Remove it.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

