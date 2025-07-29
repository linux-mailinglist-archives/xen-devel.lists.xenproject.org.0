Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C296B14E0A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 15:02:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062646.1428368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugjyj-0007WH-7e; Tue, 29 Jul 2025 13:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062646.1428368; Tue, 29 Jul 2025 13:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugjyj-0007Tx-3x; Tue, 29 Jul 2025 13:02:49 +0000
Received: by outflank-mailman (input) for mailman id 1062646;
 Tue, 29 Jul 2025 13:02:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AlSl=2K=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ugjyh-0007Ti-AX
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 13:02:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51db4eb9-6c7c-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 15:02:45 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id E5D014EE3C20;
 Tue, 29 Jul 2025 15:02:43 +0200 (CEST)
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
X-Inumbo-ID: 51db4eb9-6c7c-11f0-a31e-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1753794164;
	b=AGi2TwbtOXnVg4fURPcFeV5c4ywA3gJguvP7mrQUC+wngQvowXTSjI5hJqaGRMiC5Tn4
	 EOTe6nFW3+nFOzJk2tDqlqtTBfLjlysTkfJoVATBCzfe2ldVG6QH5CjpEx4IPmgSTCZ4S
	 iUy6BShpQV/sEbsZiESmL3t66TDiwI/x1+dJQSvu/N70a/54M2LbO0PeN0clgxPfUqpAg
	 twtASeEUpNftNF8N4HCDngvCDqIGi59IKMw3IGbWI6T0AZrnkGIWS8euZMilbnsVVcBIm
	 dbNB1wFTYzYXvd/HxRQZH5lKZSSF3jf9RJH/oSenYROdjxAMbIU1RqzR0JG0C1glPBO0p
	 vHTSuBSAo/DiAOukVB/3Vv1ydcrL9/igkZpDaTAX0B1Y+A2061BuJhk50qlCBPG69ZD8g
	 gvYl5+aOzcYAI64sKUrFCPl+MLH/qEdfGcbVhcJv5S20erTmoYTLRukscohMamqa+S8Q/
	 j8C/w3GhyXlr49QH4PxX/1UtSTZMP1OFjgRZu3Fkr8CHDVXPvOJCbTCcS3eNqhEBtQRTv
	 0qpvt5pP/cxfVT+F1Ml0YBglLn2J3AgsQHFPGDZrHK+FF1x8ab+FlizHOklF5a5fl9O09
	 K9oLE1Nul9rrElS4ZPsJSDvZhrNplG85TsGHNPjGe0F4A1ZRNsW0sAfa9TNnz0g=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1753794164;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=4x7kZmD8/8RXCFkSz1lcauJjWRGUZwXkIhIHA2aIHCI=;
	b=IjLIV+Iph5BmivjD4csrKK9XbrODNVoxB+/SGcpbZJWgLBvaPIngt6MqLx0ricaTBvW1
	 74Cb6KTFJXpKrUg9A49fek44k1Dgv+2UCuYmPIFB9lOnlcgwg4kvu7JXrSFXcH9+bFnXQ
	 aUmgAAaBq1g33nq5aC634X1a2P6ovaPenDRq8SDQORcyFNePrwjGSbutdi6Z5KlpY3HH8
	 /XHWDHEMcx/Po3jv9nxEvU1CINd/EX6sRAuxmh5lTC2YJGBELv7OZm633GQQBMeKWfe6c
	 OvXTCmtllHESaUGu53VaFCodorFPIut5vBg23Nef5LWmOyvCSXkyP/hKtdkcKbTNUwCJr
	 srjWD1nsIRMsHZh2kxyNP1HoNdX2GaRMXVieiwaf6gz1B6UTHJHheBp+4MWLNGmVqEDYi
	 uwxZqqyndlWXrCojS5ehMu6yKpoXuVhg4hQDuXco0otQZQNTDP2ELL1iMUuYGRK1Gweab
	 GQJ5ai1sqb6j4MS7Og25665ZYY3EHo978mAaaX804C29kuEvNGg+ORpDFKTK7ujhfr+ki
	 PO3Cc9xo5gH3UMEU+B+55oi87VFbylGMsePcITgjQNimwd1ZlQNETlrWXq+DX24In7m+Y
	 8Ugxaci2vmYQzSGAyZbcGWM+fdq05CAmX/J6Lj9cSIg+2nCHA0H80fYOWrtiLQM=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1753794164; bh=NsQHhJx+/HvfcN9A14hkUoX7e2rBzxdbf45bVCy/Dk4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mvaIqBD2jMN9lDJW58aePYwSGqL0pxDvB7iRO/fM6EscdGlU/4ntL715voD+Azm+C
	 RV1IG3hFA943EB3Ziasy53fgdJPzCOpEHUGrRU/zVl7A75bXiMnS9r06Ca02nEs2mt
	 78jvaaqqpmEiPlh9/OspsB9doqPF6iQpmygmBpV1mDQRi+ctYSQLC8WdWeZFYt87sE
	 0jfwg/SIYb5BHQn4+HrrgHxB+a+fLKeVja3ggfcs1M3oSTdJ5sn6CX8ZvnRKyh9QhA
	 ENLmJaMrTewJVAhDMLMwZG2MV33aQr37jfbmDwz1oOqEMWjvDTiFRkXF0ombC9nDO/
	 O1VTbCYRgMsyQ==
MIME-Version: 1.0
Date: Tue, 29 Jul 2025 15:02:43 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Doug Goldstein
 <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] misra: allow 'noreturn' as safe for function pointer
 conversions
In-Reply-To: <2ef0d0a9-065c-4288-badd-21de4cfc5d14@suse.com>
References: <3b821bc506b04bf7ff8bf5a3712449d45429dc90.1753791398.git.dmytro_prokopchuk1@epam.com>
 <2ef0d0a9-065c-4288-badd-21de4cfc5d14@suse.com>
Message-ID: <029ca331fd380a855aff95ae9cae799e@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-29 14:39, Jan Beulich wrote:
> On 29.07.2025 14:21, Dmytro Prokopchuk1 wrote:
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -367,6 +367,13 @@ constant expressions are required.\""
>>  }
>>  -doc_end
>> 
>> +-doc_begin="The conversion from 'void noreturn (*)(void *)' to 'void 
>> (*)(void *)' is safe
>> +because the semantics of the 'noreturn' attribute do not alter the 
>> calling convention or behavior of the resulting code."
>> +-config=MC3A2.R11.1,casts+={safe,
>> +  
>> "kind(bitcast)&&to(type(pointer(inner(return(builtin(void))&&all_param(1, 
>> pointer(builtin(void)))))))&&from(expr(skip(!syntactic(),
>> +   ref(property(noreturn)))))"}
>> +-doc_end
> 
> As I understand it, this is about any function, not just void (void *) 
> ones.
> Hence throughout anything textual in this patch, may I ask that this be 
> made
> explicit by inserting e.g. "e.g." everywhere?
> 

Technically yes, in practice other implicit function pointer conversions 
would be caught by -Wincompatible-pointer-types and similar flags so 
they don't even come into play. However I agree that adding that is 
clearer.

> I'm also on the edge of complaining again about the patch subject, as 
> that's
> still not quite accurate: It's only one direction in which things are 
> safe.
> 
> Jan

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

