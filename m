Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BEB6F6F83
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 18:01:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529836.824693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pubMt-0002lx-DS; Thu, 04 May 2023 15:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529836.824693; Thu, 04 May 2023 15:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pubMt-0002jl-A1; Thu, 04 May 2023 15:59:43 +0000
Received: by outflank-mailman (input) for mailman id 529836;
 Thu, 04 May 2023 15:59:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AIjt=AZ=bounce.vates.fr=bounce-md_30504962.6453d669.v1-89c15dbd916c406d8613d1770bab4013@srs-se1.protection.inumbo.net>)
 id 1pubMs-0002jd-37
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 15:59:42 +0000
Received: from mail179-5.suw41.mandrillapp.com
 (mail179-5.suw41.mandrillapp.com [198.2.179.5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abfc2e99-ea94-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 17:59:38 +0200 (CEST)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-5.suw41.mandrillapp.com (Mailchimp) with ESMTP id 4QBz613lkczG0CJtH
 for <xen-devel@lists.xenproject.org>; Thu,  4 May 2023 15:59:37 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 89c15dbd916c406d8613d1770bab4013; Thu, 04 May 2023 15:59:37 +0000
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
X-Inumbo-ID: abfc2e99-ea94-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1683215977; x=1683476477; i=yann.dirson@vates.fr;
	bh=eLQjcR+VoTsYw7DiK+4fWqcd9Pnvu4j+lbS0pP71BjM=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mNVDxbBRYGjgYdfHwOxyufsixN4lEv/t4B23lWarB7sRI22grC1upb9KQ75xCfC5R
	 wEaAlu9q7w1ZQPwCPGHJkKbd8sd982Tv7IfVVuIWik0X75GmuTwtOu084nnYnCASjE
	 jAylRwOuaR9IWsTM+N/nTUy9LJPfvypWz8gnmNXA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1683215977; h=From : 
 Subject : Message-Id : To : Cc : References : In-Reply-To : Date : 
 MIME-Version : Content-Type : Content-Transfer-Encoding : From : 
 Subject : Date : X-Mandrill-User : List-Unsubscribe; 
 bh=eLQjcR+VoTsYw7DiK+4fWqcd9Pnvu4j+lbS0pP71BjM=; 
 b=pS6x3twT9m+jOK0BmMcIyQy6hyN84tmxRble+tp7zQc7rH0HB3hshTe9ZQOcxPc4x7iB9u
 IQG0P/4dlJr6hoUadFdcrWNbEuAppaGZBIHBnZYYRPq6khhOK803LI4hPpRT4YInu68u4t2k
 vWLfIfURuf8qTO9Z8AWaW0O7jWKJM=
From: Yann Dirson <yann.dirson@vates.fr>
Subject: =?utf-8?Q?Re:=20xenstored:=20EACCESS=20error=20accessing=20control/feature-balloon=201?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 9664e26d-c55d-4176-ac64-680cfb7c5564
X-Bm-Transport-Timestamp: 1683215968933
Message-Id: <f44261a2-df39-f69a-9798-dc1d656e6dac@vates.fr>
To: zithro <slack@rabbit.lu>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, =?utf-8?Q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <3065c524-07c7-6458-ff4c-ba68ff78c946@rabbit.lu> <474b531f-2067-a5d4-8b01-5b8ef1f7061d@citrix.com> <678df1ff-df18-b063-eda3-2a1aed6d40f8@vates.fr> <50bf6b82-965b-d17c-7c5a-49c703991504@rabbit.lu>
In-Reply-To: <50bf6b82-965b-d17c-7c5a-49c703991504@rabbit.lu>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.89c15dbd916c406d8613d1770bab4013?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20230504:md
Date: Thu, 04 May 2023 15:59:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


On 5/4/23 15:58, zithro wrote:
> Hi,
>
> [ snipped for brevity, report summary:
> XAPI daemon in domU tries to write to a non-existent xenstore node in 
> a non-XAPI dom0 ]
>
> On 12 Apr 2023 18:41, Yann Dirson wrote:
>> Is there anything besides XAPI using this node, or the other data
>> published by xe-daemon?
>
> On my vanilla Xen (ie. non-XAPI), I have no node about "balloon"-ing 
> in xenstore (either dom0 or domU nodes, but I'm not using ballooning 
> in both).
>
>> Maybe the original issue is just that there is no reason to have
>> xe-guest-utilities installed in this setup?
>
> That's what I thought as I'm not using XAPI, so maybe the problem 
> should only be addressed to the truenas team ? I posted on their forum 
> but got no answer.
> I killed the 'xe-daemon' in both setups without loss of functionality.
>
> My wild guess is that 'xe-daemon', 'xe-update-guest-attrs' and all 
> 'xenstore* commands' are leftovers from when Xen was working as a dom0 
> under FreeBSD (why would a *domU* have them ?).

That would not be correct: xenstore* are useful in guests, should you 
want to read/write to the XenStore manually or from scripts; xe-deamon 
and xe-update-guest-attrs both come from xe-guest-utilities 6.x, which 
is really a domU tool as well, but is there to support XAPI in dom0.

Best regards,

-- 
Yann Dirson | Vates Platform Developer
XCP-ng & Xen Orchestra - Vates solutions
w: vates.tech | xcp-ng.org | xen-orchestra.com



Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions
w: vates.fr | xcp-ng.org | xen-orchestra.com

