Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EBA875DDA
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 07:02:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690110.1075818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riTJ5-0002Ky-FR; Fri, 08 Mar 2024 06:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690110.1075818; Fri, 08 Mar 2024 06:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riTJ5-0002J6-CA; Fri, 08 Mar 2024 06:02:11 +0000
Received: by outflank-mailman (input) for mailman id 690110;
 Fri, 08 Mar 2024 06:02:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3oDN=KO=bounce.vates.tech=bounce-md_30504962.65eaa9df.v1-706fbfc849da40c79c75a6093f27b8d5@srs-se1.protection.inumbo.net>)
 id 1riTJ4-0002Iw-3H
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 06:02:10 +0000
Received: from mail133-16.atl131.mandrillapp.com
 (mail133-16.atl131.mandrillapp.com [198.2.133.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 654c649d-dd11-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 07:02:08 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-16.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4TrbCz4kHBzB5p8ZB
 for <xen-devel@lists.xenproject.org>; Fri,  8 Mar 2024 06:02:07 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 706fbfc849da40c79c75a6093f27b8d5; Fri, 08 Mar 2024 06:02:07 +0000
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
X-Inumbo-ID: 654c649d-dd11-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1709877727; x=1710138227;
	bh=dAk+YeuwyP3EIAncoXFv7ngd3uVTOT0U1ZgR+Pf70fE=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=dsdU7Viqtr9zRJ3TFQOSecIGDKjWDikqVvzf0QmBGMEK0EF6s33XoE5x7WDT8Fesg
	 s5Oepjo4ptxSSuFdHC7hP3b3eIanqT7/D5BxtGG2aqBc/gEXyiiJGMtj/lNF+3IwNF
	 no3wcZ/IrH7Wx7kVmCvttJZiJl2ZWUOZ1sfUw9nbHGXu9oafdhx4L1ZLuCcgmuIvbd
	 4OOx0tG+fltitEVi1/Y/eLd8dpVL1FRXUiJspeC8DSqdEfm5h1kE2L3Pkpp0Q9NZe7
	 4O5JfY+p0oxQ7/tojYrDz6d4B8WQXuztGYcjDlxhczdAiIGA7UmrK8X4F3/AG4hJex
	 /Huwnk4pQLR9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1709877727; x=1710138227; i=vaishali.thakkar@vates.tech;
	bh=dAk+YeuwyP3EIAncoXFv7ngd3uVTOT0U1ZgR+Pf70fE=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Xq8vUWoN/K+R3BWUSq6qu0wfy3avsrLbj4asr3kXPBv+FV20hN3Bvi6ErYpaT3dng
	 KXr7GS+42IyVpNUG/umW8iKUcD07OSan7bxHPZmpJVnntvpmXanQP5jV01YRr19DgJ
	 ajrBEkNhdYXT5N1mMgYy/iJk9ERfYTzSq5XroPYFyultBCoQssCPoTTPAKRjsR+dDQ
	 3f8sFnou4mdWmzA30Mv5jATc2s9G2MoKj6CPTPddS72bHuTr/5Oy8Qs83jdQ9Oo3Fp
	 OMtUbARq/hA4veNTKq1iwdrvG8H4LTjFm8bGvx2P6BkAH3WdgSy51h4U/vCY0E0YtZ
	 0KByedCVFG6pA==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=202/2]=20x86/svmdebug:=20Print=20sev=20and=20sev=5Fes=20vmcb=20bits?=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1709877726549
Message-Id: <1df84eaf-0a7b-4e35-b0ce-05989393e671@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, roger.pau@citrix.com, wl@xen.org
References: <cover.1709846387.git.vaishali.thakkar@vates.tech> <9cc6b407ec3b45f034b7deb6f5f44a561eecca47.1709846387.git.vaishali.thakkar@vates.tech> <715771bb-bff4-46d7-82b0-d0ad6d7a33ae@citrix.com>
In-Reply-To: <715771bb-bff4-46d7-82b0-d0ad6d7a33ae@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.706fbfc849da40c79c75a6093f27b8d5?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240308:md
Date: Fri, 08 Mar 2024 06:02:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 3/8/24 00:34, Andrew Cooper wrote:
> On 07/03/2024 9:40 pm, Vaishali Thakkar wrote:
>> diff --git a/xen/arch/x86/hvm/svm/svmdebug.c b/xen/arch/x86/hvm/svm/svmd=
ebug.c
>> index 24358c6eea..f54b426fb3 100644
>> --- a/xen/arch/x86/hvm/svm/svmdebug.c
>> +++ b/xen/arch/x86/hvm/svm/svmdebug.c
>> @@ -53,6 +53,8 @@ void svm_vmcb_dump(const char *from, const struct vmcb=
_struct *vmcb)
>>              vmcb->exitinfo1, vmcb->exitinfo2);
>>       printk("np_ctrl =3D %#"PRIx64" guest_asid =3D %#x\n",
>>              vmcb_get_np_ctrl(vmcb), vmcb_get_guest_asid(vmcb));
>> +    printk("sev =3D %d sev_es =3D %d\n",
>> +           vmcb_get_sev(vmcb), vmcb_get_sev_es(vmcb));
> 
> Hmm.=C2=A0 These are covered by the previous line printing all of np_ctrl=
.
> What about rearranging the previous line to be something like:
> 
> printk("asid: %#x, np_ctrl: %#"PRIx64" -%s%s%s\n",
>  =C2=A0=C2=A0=C2=A0 vmcb->_asid, vmcb->_np_ctrl,
>  =C2=A0=C2=A0=C2=A0 vmcb->_np ? " NP" : "",
>  =C2=A0=C2=A0=C2=A0 vmcb->_sev ? " SEV" : "",
>  =C2=A0=C2=A0=C2=A0 ...);
> 
> This is more compact (things like "guest" in "guest asid" is entirely
> redundant), and provides both the raw _np_ctrl field and a bit-by-bit
> decode on the same line, rather than having different parts of the info
> on different lines and bools written out in longhand?

Good point. Will change it in the revised v2.

> See xen/arch/x86/spec_ctrl.c: print_details() for a rather more complete
> example of this style of printk() rendering for bits, including how to
> tabulate it for better readability.

Thanks for pointing to the reference.

> ~Andrew


