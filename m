Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F71B174D1
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 18:18:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066086.1431445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVys-0002xu-UE; Thu, 31 Jul 2025 16:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066086.1431445; Thu, 31 Jul 2025 16:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVys-0002vf-R1; Thu, 31 Jul 2025 16:18:10 +0000
Received: by outflank-mailman (input) for mailman id 1066086;
 Thu, 31 Jul 2025 16:18:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LCFA=2M=bounce.vates.tech=bounce-md_30504962.688b973e.v1-12a418eb9f704c799364c85f07ee5704@srs-se1.protection.inumbo.net>)
 id 1uhVyr-0002vT-QB
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 16:18:09 +0000
Received: from mail177-1.suw61.mandrillapp.com
 (mail177-1.suw61.mandrillapp.com [198.2.177.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1bc4dcb-6e29-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 18:18:08 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-1.suw61.mandrillapp.com (Mailchimp) with ESMTP id 4btDlL6wtBzBsTl6y
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 16:18:06 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 12a418eb9f704c799364c85f07ee5704; Thu, 31 Jul 2025 16:18:06 +0000
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
X-Inumbo-ID: f1bc4dcb-6e29-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1753978687; x=1754248687;
	bh=In68QF8AC5eVmlBRmYtpjDBXinLoEg0XMrcqDzHD26g=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=nFN1eLgXg3Gx13R/HTUyJ+LgXpTvyJXbmwqJlpQyBoKjd34nv/a3fOIWxRJa/YQ+g
	 oENyCATcjSXBYTplGxOE/benG2j7hfKWZgFQy1xzzKrcJx/+hwntf0JqqfeHuUewq3
	 rziYGoBSzXjzuyx46AYprBGzGzf/X9h2iksCGITnPNeeDuTd2di9a4Asc0e8Ck4NeY
	 6OUKe4HjBWhYYQi0NU3jgzTfzfauZjauQRU+aKOe6uZwcVuPjH9kIooy4TmnxXX4HT
	 mijaRawf9pm1YFJWT7DMctJrsvmYAtbFI/TGz4aD4W7YoB2mDbFp3T0YHvJ/8Cudtp
	 rj5z1vPUlUauw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1753978687; x=1754239187; i=teddy.astie@vates.tech;
	bh=In68QF8AC5eVmlBRmYtpjDBXinLoEg0XMrcqDzHD26g=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=LNm6a7AYGL8/VdQd40JwKZciKJTXzE4bqjTXa3jXwW36oWrn/ZUxXQdEIxJmv0jpH
	 uB3XJLSSFXo59pWn1lC2aXRIdbt2EVzyiFWU+rqvLFF5SPIAMTIC0bkyzjit2QgU53
	 87AZsUSRVjtOoIE1HgOMst2EKgUdXx8I3dUPnoS/4nqTYe1fGc3OT5MpdOYyc4VCYe
	 6vhlPyzENubGxxVfBOJD9JB13GR+sAjd4Jdq6g1AObOu4AJh2Nuzf5Df3ix9OVQ6V0
	 kwelTrlS2tf5o/yc/Dx2jlrDw2fazhgRsQpQYNayIL8Dl49f18pzg1L90B3CMDg7vB
	 DYXUFfdSaw+ew==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=20v3=201/3]=20vmx:=20Rewrite=20vpid=5Fsync=5Fvcpu=5Fgva?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1753978685063
Message-Id: <b708c59f-353a-418a-a859-c8b0aef428eb@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1750770621.git.teddy.astie@vates.tech> <f92b18bd9ec6b5b83a4b8a66dea2440b65060c27.1750770621.git.teddy.astie@vates.tech> <edb8bd9d-e5ca-42ad-a551-b7162d5e0f80@suse.com>
In-Reply-To: <edb8bd9d-e5ca-42ad-a551-b7162d5e0f80@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.12a418eb9f704c799364c85f07ee5704?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250731:md
Date: Thu, 31 Jul 2025 16:18:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 31/07/2025 =C3=A0 17:54, Jan Beulich a =C3=A9crit=C2=A0:
> On 26.06.2025 16:01, Teddy Astie wrote:
>> Rewrite this function such as it doesn't rely on goto, also change the
>> type of "type" to match the __invvpid function call.
> 
> While this type change is probably okay (and benign to code generation), =
...
> 
>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>> @@ -287,10 +287,10 @@ extern uint8_t posted_intr_vector;
>>   #define cpu_has_vmx_vpid_invvpid_single_context_retaining_global    \
>>       (vmx_caps.vpid & VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL)
>>   
>> -#define INVVPID_INDIVIDUAL_ADDR                 0
>> -#define INVVPID_SINGLE_CONTEXT                  1
>> -#define INVVPID_ALL_CONTEXT                     2
>> -#define INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 3
>> +#define INVVPID_INDIVIDUAL_ADDR                 0UL
>> +#define INVVPID_SINGLE_CONTEXT                  1UL
>> +#define INVVPID_ALL_CONTEXT                     2UL
>> +#define INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 3UL
> 
> ... I don't follow the need for these extra adjustments. Preferably with
> them dropped

With the type change from int to unsigned long to match __invvpid() 
parameter, IIUC MISRA rule 7.2 requires that integer literals that are 
used for unsigned must have the proper suffix.

> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Jan
> 

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



