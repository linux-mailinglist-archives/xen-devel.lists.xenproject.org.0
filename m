Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CADB5A56E2A
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 17:45:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905213.1313062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqap3-0007gN-Sy; Fri, 07 Mar 2025 16:45:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905213.1313062; Fri, 07 Mar 2025 16:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqap3-0007fW-Pj; Fri, 07 Mar 2025 16:45:17 +0000
Received: by outflank-mailman (input) for mailman id 905213;
 Fri, 07 Mar 2025 16:45:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=69sh=V2=bounce.vates.tech=bounce-md_30504962.67cb2296.v1-3e956771535c4e7eb16e1461b3eb5378@srs-se1.protection.inumbo.net>)
 id 1tqap2-0007fQ-PJ
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 16:45:16 +0000
Received: from mail186-3.suw21.mandrillapp.com
 (mail186-3.suw21.mandrillapp.com [198.2.186.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88c953de-fb73-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 17:45:11 +0100 (CET)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-3.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4Z8XFy0gbmzDRHyyN
 for <xen-devel@lists.xenproject.org>; Fri,  7 Mar 2025 16:45:10 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 3e956771535c4e7eb16e1461b3eb5378; Fri, 07 Mar 2025 16:45:10 +0000
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
X-Inumbo-ID: 88c953de-fb73-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1741365910; x=1741635910;
	bh=/qKMcF5yj94w1xzhbL/50AX7Q/0LRAM+o5099XQD54o=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=nQoKXhSqcAA71er83RYzWYiForULuLH0290vd5uGRqFrp0CbJ3p7Xu1BerVKpnxwb
	 EVVbqzez8mr9AfLRJigHlK7qemNMp2rXTqQIsyguNEBEtKuiBIXIyN32DMXFjAfHTi
	 rdLMxBsEGHViPIiVidgEfYMK7QDJDCNOSS+0kggQmu7C4ANhJ9ZpAtX4w6aMYd7Rct
	 cQWhewNUWEpGVCH/OMR2kg4kp1U5xX8lcTPEvL7NA3EivYn6ZvqxbUAlTYtTgHcPID
	 /gFVg0DH8yfSF4GXB2i07QvKdhkShkjqfoHxfTVy6zcZf3R9ItY6nEEPwaqxEvAEc/
	 XCI2L3BgOUfDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1741365910; x=1741626410; i=anthony.perard@vates.tech;
	bh=/qKMcF5yj94w1xzhbL/50AX7Q/0LRAM+o5099XQD54o=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=z7QcKPmtPe8RiD+q+1MjTU7Y+AYt7syg1YhCsnzdg7ZgmR8uRy4XrdZQZe7bLv7wo
	 d5D7I0REC0OMtKKIZvH6bBTQ21w3s5wpzrV2sujEhSaIKCoL7cfnozdp21fD2mMqbv
	 gqvmQjsAANBZ3wZqvuzdlNH++jF685G5lvPLfnWg9KxK0C3aiSe9KOpcAyDbwdqVi1
	 Gl5sSiy9zSBwgeMpt3cMRi7ECkKpgRkKLaAoMjl7lSBU+yWpkkA3iRiZQfy9+jKAo1
	 hNVIzVYMkE2fjg9wf55QYEMXVpC9JZNFOo7Qk++AEqDYkujHIPMW+PqNq5syiN424v
	 4Z9SGzzCHX4Uw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20tools/libs:=20Make=20uselibs.mk=20more=20legible?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1741365909210
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, "Juergen Gross" <jgross@suse.com>
Message-Id: <Z8silEX4FYkFg6RV@l14>
References: <20250307133342.3057009-1-andrew.cooper3@citrix.com>
In-Reply-To: <20250307133342.3057009-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.3e956771535c4e7eb16e1461b3eb5378?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250307:md
Date: Fri, 07 Mar 2025 16:45:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Mar 07, 2025 at 01:33:42PM +0000, Andrew Cooper wrote:
> A few blank lines go a very long way.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

