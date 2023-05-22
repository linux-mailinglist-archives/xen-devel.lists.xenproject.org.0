Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E125770B7B0
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 10:33:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537803.837325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q10yC-0004Pw-5r; Mon, 22 May 2023 08:32:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537803.837325; Mon, 22 May 2023 08:32:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q10yC-0004NQ-30; Mon, 22 May 2023 08:32:44 +0000
Received: by outflank-mailman (input) for mailman id 537803;
 Mon, 22 May 2023 08:32:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DxKA=BL=bounce.vates.fr=bounce-md_30504962.646b28a6.v1-48590a49bbd54d81a738e5d7d69af5dd@srs-se1.protection.inumbo.net>)
 id 1q10yB-0004NJ-1R
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 08:32:43 +0000
Received: from mail180-5.suw31.mandrillapp.com
 (mail180-5.suw31.mandrillapp.com [198.2.180.5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 358f5920-f87b-11ed-8611-37d641c3527e;
 Mon, 22 May 2023 10:32:38 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-5.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4QPrKy2NhzzG0CBWK
 for <xen-devel@lists.xenproject.org>; Mon, 22 May 2023 08:32:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 48590a49bbd54d81a738e5d7d69af5dd; Mon, 22 May 2023 08:32:38 +0000
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
X-Inumbo-ID: 358f5920-f87b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1684744358; x=1685004858; i=yann.dirson@vates.fr;
	bh=5ZA08ivYkpiAmPEWMcPTL2Cj/1pwkC/WlHb0/EmOyLI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=PSE81vvQ/lABa/82Jx1ImzCi3GgEpblToN9kGvj3nbM+f2fIiWBil6vl28NUOrXk/
	 xFVxXzB1NfE7tM8QrZtK0ysAHcvdhahAZWQL4VaeBGGdEKbOYDdT/JiBCxCRUhEd44
	 G+DKUidt98xfr1oYaGL46R7GZWMhaad2s5GLMMrg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1684744358; h=From : 
 Subject : Message-Id : To : Cc : References : In-Reply-To : Date : 
 MIME-Version : Content-Type : Content-Transfer-Encoding : From : 
 Subject : Date : X-Mandrill-User : List-Unsubscribe; 
 bh=5ZA08ivYkpiAmPEWMcPTL2Cj/1pwkC/WlHb0/EmOyLI=; 
 b=Nu0PL0HEFubr6IB6CEeU9xAnoiCyM5b5d32KXMwjEkzUahpmFCtrlM4Z/tMXl7cdbQSshZ
 fGwg6cE85cNget1LXBKR9LkRPhF9UX0/cx1Q7J0OCdmRZgzCFTU6Vr8bdzB3niws6OjM388P
 r4dwoCh2cSpJoZtyD+8Ff5SUrSav4=
From: Yann Dirson <yann.dirson@vates.fr>
Subject: =?utf-8?Q?Re:=20[PATCH=202/3]=20docs:=20document=20~/control/feature-balloon?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 9f954236-9dc1-4070-9d34-807dea7ccea1
X-Bm-Transport-Timestamp: 1684744355983
Message-Id: <46399590-322d-c66d-9917-2a55e97de2dc@vates.fr>
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xihuan.yang@citrix.com, min.li1@citrix.com
References: <20230510142011.1120417-1-yann.dirson@vates.fr> <20230510142011.1120417-3-yann.dirson@vates.fr> <bb215c55-5064-7f48-820c-bf41d01529bd@suse.com>
In-Reply-To: <bb215c55-5064-7f48-820c-bf41d01529bd@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.48590a49bbd54d81a738e5d7d69af5dd?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20230522:md
Date: Mon, 22 May 2023 08:32:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 5/11/23 11:21, Jan Beulich wrote:
> On 10.05.2023 16:20, Yann Dirson wrote:
>> --- a/docs/misc/xenstore-paths.pandoc
>> +++ b/docs/misc/xenstore-paths.pandoc
>> @@ -509,6 +509,12 @@ This may be initialized to "" by the toolstack and may then be set
>>   to 0 or 1 by a guest to indicate whether it is capable of responding
>>   to a mode value written to ~/control/laptop-slate-mode.
>>   
>> +#### ~/control/feature-balloon
>> +
>> +This may be initialized to "" by the toolstack and may then be set to
>> +0 or 1 by a guest to indicate whether it is capable of memory
>> +ballooning, and responds to values written to ~/memory/target.
> 
> Besides correctly saying "may", I guess this wants to go further and also
> clarify what the (intended) behavior is when the node is absent. Aiui PV
> guests are always expected to have a balloon driver, so the assumed
> value likely needs to be "1" there. Furthermore I'm afraid it doesn't
> really become clear what value this node is if it's only optionally
> present, while its absence doesn't really allow uniform assumptions
> towards a default value.


Things are indeed more complicated than I originally identified,
the way this xenstore entry is used currently seems to make it difficult 
to introduce it in a backward-compatible manner

I guess this and a number of details ought to be discussed at the XAPI
level first.

Details: the squeezed assumption [1] is that a domain which has not set 
this to 1 is not ready yet to get ballooned, which implies the default 
has to be 0 whatever the guest type, as it requires to know the total 
number of pages used by the domain to be stable.  So I guess we can see 
it as not being "not just a feature flag".


[1] 
https://github.com/xapi-project/xen-api/tree/master/ocaml/squeezed/doc/design#environmental-assumptions


-- 
Yann Dirson | Vates Platform Developer
XCP-ng & Xen Orchestra - Vates solutions
w: vates.tech | xcp-ng.org | xen-orchestra.com


Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions
w: vates.fr | xcp-ng.org | xen-orchestra.com

