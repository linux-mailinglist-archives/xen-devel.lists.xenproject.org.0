Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED50B92ECD1
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 18:34:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757638.1166694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRwkT-00089u-Jq; Thu, 11 Jul 2024 16:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757638.1166694; Thu, 11 Jul 2024 16:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRwkT-000886-H9; Thu, 11 Jul 2024 16:34:25 +0000
Received: by outflank-mailman (input) for mailman id 757638;
 Thu, 11 Jul 2024 16:34:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iO7O=OL=bounce.vates.tech=bounce-md_30504962.6690098d.v1-42450922ea1b4c68908d6b9d62e9d22e@srs-se1.protection.inumbo.net>)
 id 1sRwkS-000880-20
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 16:34:24 +0000
Received: from mail186-27.suw21.mandrillapp.com
 (mail186-27.suw21.mandrillapp.com [198.2.186.27])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d8a7eed-3fa3-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 18:34:22 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-27.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4WKgKn3kJ1z6CPyJx
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 16:34:21 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 42450922ea1b4c68908d6b9d62e9d22e; Thu, 11 Jul 2024 16:34:21 +0000
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
X-Inumbo-ID: 6d8a7eed-3fa3-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720715661; x=1720976161;
	bh=EvtTzIn5q0oTzXNlweEG4iXM9N9rKdgB51Xtb/vvlxA=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=EABYThh+eyYjxyjNmQYXStD2NFsV9PRDKR0zGesAhMFRUNj4P454JAZsy30OpnJGj
	 kzJaTSTSWGqenFydT1a7S0sI/mBaostqKVKJF8iHvCS9MyaEeyD8PT01hQZp4TnCOv
	 hVwhErywa+KG/bD8QGObWN6BVEn9xOWPxtYQvBNq4XEXQlfBoMiLZKQFzApeCRj/s5
	 afs0XOC4jitlEDY6GQ8zljBXqJwsgfbKFe6BbYp6piMJkKoKIvaML6fpgWwlEmK4oC
	 FUNAWWfs4zcjTwJeeiN67Eyce18zh8f9lhKzLWq9TrdUGNa27c7nqgCAOuW6Z8JqKB
	 BRfPDoESkmWTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720715661; x=1720976161; i=anthony.perard@vates.tech;
	bh=EvtTzIn5q0oTzXNlweEG4iXM9N9rKdgB51Xtb/vvlxA=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=OQt4nwkAZ34tUtfeQfzzQOxo79O1XqwHdSaUpgGPDZbMkKwStLTFdRZzvOazWI4bE
	 6vTE39sk2YwXnPSI6eALvx+GmYtUXmUntAwhfayAoHO7GSOvtIFJXp/R1xpLVcaHUx
	 vtqq79xzlZX/pZa26JuC4Zw8dBmiCxAy0jJUW+mMUL6isyFP+BIUbWgPOq8xfF1DAg
	 soY8xv9/JNMqpOcToPwMZLIhpmJTlMWsl7jzHipxE4PNk0BNbe2PVmlXRyvO+RN2m1
	 6Y5vVrYuPyNQ0PsnyK5Yy5LW2nU/xmEiou6oOhR9JJ0O0oIMQSaK2JIcyMegdyV/HJ
	 nD62qcS1ayf8A==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2010/12]=20CI:=20Introduce=20debian:11/12-riscv64=20containers?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720715660137
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio <sanastasio@raptorengineering.com>
Message-Id: <ZpAJi0za2Pc3t9DX@l14>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com> <20240711111517.3064810-11-andrew.cooper3@citrix.com>
In-Reply-To: <20240711111517.3064810-11-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.42450922ea1b4c68908d6b9d62e9d22e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240711:md
Date: Thu, 11 Jul 2024 16:34:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Jul 11, 2024 at 12:15:15PM +0100, Andrew Cooper wrote:
> For starters, they're slightly smaller:
> 
>   $ docker image list <snip>
>   registry.gitlab.com/xen-project/xen/debian      12-riscv64         772MB
>   registry.gitlab.com/xen-project/xen/debian      11-riscv64         422MB
>   registry.gitlab.com/xen-project/xen/archlinux   current-riscv64    2.32GB
> 
> They also not rolling distros, so will be more predicatable testing for the
> stable trees in the future.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

