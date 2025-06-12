Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C55DAD7886
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 18:52:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013317.1391819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPlAG-00029k-8m; Thu, 12 Jun 2025 16:52:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013317.1391819; Thu, 12 Jun 2025 16:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPlAG-00027U-5F; Thu, 12 Jun 2025 16:52:32 +0000
Received: by outflank-mailman (input) for mailman id 1013317;
 Thu, 12 Jun 2025 16:52:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SkTQ=Y3=bounce.vates.tech=bounce-md_30504962.684b05cb.v1-8eae9d8b778e4ead968277f3eba27475@srs-se1.protection.inumbo.net>)
 id 1uPlAF-00027O-0b
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 16:52:31 +0000
Received: from mail145-24.atl61.mandrillapp.com
 (mail145-24.atl61.mandrillapp.com [198.2.145.24])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fb01046-47ad-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 18:52:28 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-24.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4bJ7qb3dd7zGlswCp
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 16:52:27 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8eae9d8b778e4ead968277f3eba27475; Thu, 12 Jun 2025 16:52:27 +0000
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
X-Inumbo-ID: 9fb01046-47ad-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1749747147; x=1750017147;
	bh=oNoDnr693/2fsyY5RAw3rqrVvn9+vSNI7S1Ms4L3gHg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qhSiBuO1rOXqT2CWro2JTr7sVueG7CWK07kvTfxA2U/5lDUqy1OrEbGe/vEKXuB8r
	 OcMLxGA2A6v5P0rwqqvqu7GJP5nCITLrmAq9gMVJhwXS5wIwr7/2TfQlsrTkImDHUa
	 q/40Fs+ksS6E/POT5Q+S57+rFOu4R6phhSdoW46I+JxIUqpnmqiu3zUGRxVXWnzquB
	 ejNrWqdRlH7QPHuuMAWafBOuFJ7pTHA5A3qgqaHfzY+33sOq0FTtLEuscXvhB3QF8D
	 OmJObcNHDadGd2X0s2nk3qH7sSy7O4IBSkHkfdxFTt87PE7l60U2IEjJPwnXjzyAPp
	 yqb7wrdrlcmVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1749747147; x=1750007647; i=ngoc-tu.dinh@vates.tech;
	bh=oNoDnr693/2fsyY5RAw3rqrVvn9+vSNI7S1Ms4L3gHg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ciFDm5KMS6L3T0ERASODxo5r2HaeL8XdGw6U2tcZUXw5fzg+lU8jMe/BDhNPV2APc
	 WTYFrOoJGrQWVzFMUfrx6DAq2ADG9vjRykkj7M+uh9VBLfVK/TlvY2eBi18wJqDRcI
	 P6H79wcFz5RDfvgNNFiVsbRPXfzDXC1SJorLdNHHkZZaI6D0D/e3FnWITYjgIV9s2p
	 PfRsGwouGYR79p6hUH1ZaPUd55VSNnUu2/034eTZUttWoOIrRArZ0CH2DXFZGL5hre
	 XsakQK5C0pEasIt4Upky+VYAb2KpZKuBVStlDo9EEXCx8+q/oaNhjgnbY5bhnl/C2+
	 82UZKR9VeSo9w==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC]=20Proposed=20x86=20shadow=20paging=20changes?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1749747147011
Message-Id: <a39844d2-001d-407c-aec5-83e4ec68853a@vates.tech>
To: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <a769ea0f-84b7-47d0-9a6a-438de98aa0ed@vates.tech> <2274612e-d6cd-402e-9f2c-cefb72422cd7@suse.com> <e8ebc4fa-b478-4634-bcb7-85c9bd07730e@vates.tech>
In-Reply-To: <e8ebc4fa-b478-4634-bcb7-85c9bd07730e@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8eae9d8b778e4ead968277f3eba27475?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250612:md
Date: Thu, 12 Jun 2025 16:52:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/06/2025 18:48, Teddy Astie wrote:
> Le 12/06/2025 =C3=A0 14:12, Jan Beulich a =C3=A9crit=C2=A0:
>> On 12.06.2025 13:45, Teddy Astie wrote:
>>> In Xen x86, there is the shadow paging that could be used in some cases
>>> (notably with HVM), and is used when HAP is not available. It may also
>>> be used in very specific cases for PV guests.
>>>
>>> With the vast majority of hardware supporting HAP (through EPT or NPT),
>>> it's rarely used in practice for HVM, with most downstream projects
>>> (XenServer, XCP-ng, QubesOS) are compiling-out its support by default.
>>> It also performs very significantly worse than HAP.
>>
>> Whenever this argument was made, iirc it was in particular George (who
>> was involved in the original work aiui) who kept pointing that such a
>> statement is not generally true, for numbers being workload dependent.
>>
> 
> I am a bit curious on specific workloads where shadow paging performs
> better than hap. Especially considering that shadow paging doesn't
> support PCID and the existence of ASIDs.
> 

This is quite common in big-memory workloads where you don't touch the 
memory mappings much. With HAP you can lose 5-7% perf due to the impact 
on TLB misses.


Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



