Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A9B774BFA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 23:02:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580452.908660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTTpZ-000271-15; Tue, 08 Aug 2023 21:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580452.908660; Tue, 08 Aug 2023 21:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTTpY-00024e-Ud; Tue, 08 Aug 2023 21:01:28 +0000
Received: by outflank-mailman (input) for mailman id 580452;
 Tue, 08 Aug 2023 21:01:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7Ml=DZ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qTTpX-00024Y-IP
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 21:01:27 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb4a5146-362e-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 23:01:24 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691528480253457.4882144624638;
 Tue, 8 Aug 2023 14:01:20 -0700 (PDT)
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
X-Inumbo-ID: bb4a5146-362e-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1691528482; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=oDxGIUnDD2zuyfOt4Zo4f8PqvknzjOvSA5/MM5Y214JiN3//6QyOP9jR6KvaXm2VOMdb4tMUSAN4xXRF6tU4gvPHrsj8KedgKxDKntlTKA0ERyCl31mxReT/XcpTB9z8459f9kaOkdMO29uKIGexncUcqqB1AkWsCx7iy38AoH0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691528482; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=GCt+oDOouAj+Db+dnF97vVixLfO0dNuLruGV9RVi4O0=; 
	b=V7YprwBu/R62Cf3aVCRW/KeZEEl8pKG+6HyANiviIZiP4wEMUd4WHvpiT2zaAOuCdJEM1pA2pOwr53L06z4r8WbGE6Mc77HcmLnuy5ZH+yf6Ky7pICxMFqpTGCjVXtQXxUuvytZeLIzeCiNbTSnZxuDQlNeMZ6bSRbx1WWL28jQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691528482;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=GCt+oDOouAj+Db+dnF97vVixLfO0dNuLruGV9RVi4O0=;
	b=Jv9V/JnYHXU//vGjuG1jRBXPzTGAfEfF3m0PkcC2Axu5lsmJmFJhmZ7GjEV2mcaB
	PkWXHa/DWckgSWfRl6YYwof0VLpzK5xMtxNZAXzcrXsEkCj570fQOzWrfTYwNuKUuaq
	RM74PR9Y7MGVnK9JrZsA6tRgD+zTSTEugRLQ3iFA=
Message-ID: <577f5e19-a54c-955c-581d-ac35145911be@apertussolutions.com>
Date: Tue, 8 Aug 2023 17:01:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 2/2] fdt: make fdt handling reusable across arch
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20230803104438.24720-1-dpsmith@apertussolutions.com>
 <20230803104438.24720-3-dpsmith@apertussolutions.com>
 <CA8E22A7-D7E4-43E8-BE4E-D2C2B41D921C@arm.com>
 <8a51be9e-0131-0590-9aea-bbec146ce239@apertussolutions.com>
 <2E1A5918-A475-4055-A5A5-DE0CE30C061A@arm.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <2E1A5918-A475-4055-A5A5-DE0CE30C061A@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External



On 8/3/23 16:37, Luca Fancellu wrote:
> 
>>
>>> Regarding the coding style, I think it’s better to keep the style you’ve found in the original file,
>>> and change only some bits when the code is not following it.
>>> I know there is nothing enforcing parameters on the same line of the function definition at the
>>> moment, but it is how it’s done from the original file so I would stick with it.
>>> Regarding the u32/u64 types, maybe since you are moving the code it can be the occasion to
>>> convert them, but check with the maintainer before.
>>
>> I can leave the main code as is, but I do think header decl's should be styled correctly as there is no need to have them churn in the future over purely style changes.
> 
> Uhm, when you say “styled correctly” do you mean as below?

I am retracting that after going back to review my notes, see below.

>>>> +bool __init device_tree_node_matches(
>>>> +    const void *fdt, int node, const char *match)
>>>> +{
> 
> 
> If that’s the case, it seems to me that there is nothing like that in the codebase,
> in my work with clang-format I’ve configured it to match as much as I can the
> Xen style and this function would be formatted as the old style that it had.
> 
> Can I ask you where did you find instruction to style in that way?
> 

I went back to my old notes on styling to make sure I was correct. Turns 
out I was incorrect and do apologies. There are two accepted styles for 
function declarations[1] and the one I used in this patch was the one 
that I got a recommendation to use. I have gotten so use to that style, 
that I must have lost track the other was valid. As was pointed out 
elsewhere, I should use the form that the maintainer desires. As XSM 
maintainer, I use the one I submitted here and would ask for a style 
correct if someone submitted a patch using the form that is desired here.

I will roll back the declaration styling for now and per the prior 
guidance[1], I will flip the linux-compat int over C spec fixed width 
int notation, unless there is objection to it happening during the move.

[1] 
https://lists.xenproject.org/archives/html/xen-devel/2021-07/msg01133.html

v/r
dps

