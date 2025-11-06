Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA74EC3CD3B
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 18:28:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157203.1486091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH3m9-0007OR-1F; Thu, 06 Nov 2025 17:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157203.1486091; Thu, 06 Nov 2025 17:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH3m8-0007LY-Um; Thu, 06 Nov 2025 17:27:56 +0000
Received: by outflank-mailman (input) for mailman id 1157203;
 Thu, 06 Nov 2025 17:27:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UYg1=5O=bounce.vates.tech=bounce-md_30504962.690cda96.v1-90cbc83fec594b17bba6f1470717002b@srs-se1.protection.inumbo.net>)
 id 1vH3m7-0007LP-AU
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 17:27:55 +0000
Received: from mail136-17.atl41.mandrillapp.com
 (mail136-17.atl41.mandrillapp.com [198.2.136.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec253853-bb35-11f0-9d17-b5c5bf9af7f9;
 Thu, 06 Nov 2025 18:27:52 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4d2TfZ4zsmzPm0Pbn
 for <xen-devel@lists.xenproject.org>; Thu,  6 Nov 2025 17:27:50 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 90cbc83fec594b17bba6f1470717002b; Thu, 06 Nov 2025 17:27:50 +0000
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
X-Inumbo-ID: ec253853-bb35-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1762450070; x=1762720070;
	bh=9daqLaAcXd7L3W3YEvEXe+f6WgQKerpTeM25B4WAubM=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=nLGFI+iKAhwkX/6OBsS4+g4zVBscW4btXb/+6Mifcr8q3Fk0TZVXInC6Dyk/hulna
	 ek497/HoeWPJ3bFxQ96j0wAUi2J2NGF6b1Oj4pyBKleaNClXtut8hcRcwje7x5rppr
	 CeoqnWbEbFaUSQQ23IX1aMHhvJYuNm6KuKzWK90RdZI8P2srLDBi3OInCL2M8gaieH
	 FyhZ1yK0VM1+4XfQbQB/4GzTGwgIkOrNIN4Tx9jaVCBoTYNgO88I9jqn2RFGE50emr
	 uAIQJJWUuQn6HO/a+RNTYIdeqUeWwGYxi6lCps7YyP7CHOLtXMk1tzQ0iSi/nPwn3b
	 l7tnHfT959SZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1762450070; x=1762710570; i=teddy.astie@vates.tech;
	bh=9daqLaAcXd7L3W3YEvEXe+f6WgQKerpTeM25B4WAubM=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=WZbnf0Tq89BsmlIwZl9tsNDodN/u7DZUqSJeCK4zuyDlwGnsd2jwhycnb9Jy8lfiC
	 4G8VnrY87TcGVDj+r5sxupslFUTYK7Mrq41NXYaflQGOqAaBCWNnFabKGpK0kQJT7U
	 7WdgwrCf+L/F+uPYcE0zPDlcGJPjVTIHHy28vKHNL7JE9qAVLe9hbYIZh8G/3RL1BO
	 ZCRxXbBUP0PFBgF5huomWMBDNqo3vPgZWuj37gBPB2MqaFVHfQJUU5ePcdKhKXp438
	 CogIdcX4AsRmCO8jD3/C2pz++aR2x24Demykyt1TgqA7D7uJ65tm2BtjrkpSemFfsf
	 7QyOOlKwRWGhA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN][PATCH]=20xen/x86:=20guest=5Faccess:=20optimize=20raw=5Fx=5Fguest()=20for=20PV=20and=20HVM=20combinations?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1762450068806
Message-Id: <ffb2ad53-c150-44e3-a0b8-7ed3473886f6@vates.tech>
To: "Jason Andryuk" <jason.andryuk@amd.com>, "Grygorii Strashko" <grygorii_strashko@epam.com>, xen-devel@lists.xenproject.org, "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
References: <20251031212058.1338332-1-grygorii_strashko@epam.com> <434d9ce4-e5e1-453d-84b7-e21e66d0c5a3@vates.tech> <b012c6c3-fb8d-4336-922f-f40bc43eb2b5@epam.com> <0217b1ff-2c33-43ae-adbc-d665c881473d@amd.com>
In-Reply-To: <0217b1ff-2c33-43ae-adbc-d665c881473d@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.90cbc83fec594b17bba6f1470717002b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251106:md
Date: Thu, 06 Nov 2025 17:27:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 06/11/2025 =C3=A0 18:00, Jason Andryuk a =C3=A9crit=C2=A0:
> On 2025-11-06 11:33, Grygorii Strashko wrote:
>> Hi Teddy, Jan,
>>
>> On 06.11.25 17:57, Teddy Astie wrote:
>>> Le 31/10/2025 =C3=A0 22:25, Grygorii Strashko a =C3=A9crit=C2=A0:
>> Can try.
> 
> Yes, I was thinking something like Teddy suggested:
> 
> #define raw_copy_to_guest(dst, src, len)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (is_hvm_vcpu(current) ? copy_=
to_user_hvm(dst, src, len) :
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is_pv_vcpu(current) ? c=
opy_to_guest_pv(dst, src, len) :
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fail_copy(dst, src, len=
))
> 
> But that made the think the is_{hvm,pv}_{vcpu,domain}() could be 
> optimized for when only 1 of HVM or PV is enabled.
> 
> Regards,
> Jason
> 
> xen: Optimize is_hvm/pv_domain() for single domain type
> 
> is_hvm_domain() and is_pv_domain() hardcode the false conditions for
> HVM=3Dn and PV=3Dn, but they still leave the XEN_DOMCTL_CDF_hvm flag
> checking.=C2=A0 When only one of PV or HVM is set, the result can be hard
> coded since the other is impossible.=C2=A0 Notably, this removes the
> evaluate_nospec() lfences.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> Untested.
> 
> HVM=3Dy PV=3Dn bloat-o-meter:
> 
> add/remove: 3/6 grow/shrink: 19/212 up/down: 3060/-60349 (-57289)
> 
> Full bloat-o-meter below.
> ---
>  =C2=A0xen/include/xen/sched.h | 18 ++++++++++++++----
>  =C2=A01 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index f680fb4fa1..12f10d9cc8 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1176,8 +1176,13 @@ static always_inline bool 
> is_hypercall_target(const struct domain *d)
> 
>  =C2=A0static always_inline bool is_pv_domain(const struct domain *d)
>  =C2=A0{
> -=C2=A0=C2=A0=C2=A0 return IS_ENABLED(CONFIG_PV) &&
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 evaluate_nospec(!(d->options =
& XEN_DOMCTL_CDF_hvm));
> +=C2=A0=C2=A0=C2=A0 if ( !IS_ENABLED(CONFIG_PV) )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
> +
> +=C2=A0=C2=A0=C2=A0 if ( IS_ENABLED(CONFIG_HVM) )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return evaluate_nospec(!(d->o=
ptions & XEN_DOMCTL_CDF_hvm));
> +
> +=C2=A0=C2=A0=C2=A0 return true;
>  =C2=A0}
> 
>  =C2=A0static always_inline bool is_pv_vcpu(const struct vcpu *v)
> @@ -1218,8 +1223,13 @@ static always_inline bool is_pv_64bit_vcpu(const 
> struct vcpu *v)
> 
>  =C2=A0static always_inline bool is_hvm_domain(const struct domain *d)
>  =C2=A0{
> -=C2=A0=C2=A0=C2=A0 return IS_ENABLED(CONFIG_HVM) &&
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 evaluate_nospec(d->options & =
XEN_DOMCTL_CDF_hvm);
> +=C2=A0=C2=A0=C2=A0 if ( !IS_ENABLED(CONFIG_HVM) )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
> +
> +=C2=A0=C2=A0=C2=A0 if ( IS_ENABLED(CONFIG_PV) )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return evaluate_nospec(d->opt=
ions & XEN_DOMCTL_CDF_hvm);
> +
> +=C2=A0=C2=A0=C2=A0 return true;
>  =C2=A0}
> 
>  =C2=A0static always_inline bool is_hvm_vcpu(const struct vcpu *v)

While I like the idea, it may slightly impact some logic as special 
domains (dom_xen and dom_io) are now considered HVM domains (when !PV && 
HVM) instead of "neither PV nor HVM".
We want at least to make sure we're not silently breaking something 
elsewhere.

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



