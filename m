Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F24CB28C0
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 10:25:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182699.1505543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTGR4-0003R6-7Z; Wed, 10 Dec 2025 09:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182699.1505543; Wed, 10 Dec 2025 09:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTGR4-0003PB-44; Wed, 10 Dec 2025 09:24:38 +0000
Received: by outflank-mailman (input) for mailman id 1182699;
 Wed, 10 Dec 2025 09:24:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XUc7=6Q=bounce.vates.tech=bounce-md_30504962.69393c4f.v1-c29e86d88d2848558ee35332438687fe@srs-se1.protection.inumbo.net>)
 id 1vTGR2-0003P5-45
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 09:24:36 +0000
Received: from mail187-28.suw11.mandrillapp.com
 (mail187-28.suw11.mandrillapp.com [198.2.187.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09823c2f-d5aa-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 10:24:33 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-28.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4dR9KD0cTzzMQxjd6
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 09:24:32 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c29e86d88d2848558ee35332438687fe; Wed, 10 Dec 2025 09:24:31 +0000
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
X-Inumbo-ID: 09823c2f-d5aa-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1765358672; x=1765628672;
	bh=NCK83gBz0IL7Vc7Oj5GbVPeGSyxopPEmPgP348hgmvg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=bSkyFCO1Ww4oPv2LjIAtbCjDQ2pstiKzsgpVoIahx1dOk9Wt8uaGUZG7q5v3SOsHQ
	 GIOLECyYyweXUhv4REU/HEjj96htX0/+zlnUAx2l+G8GiiN0wuL7en3JzJBeMQ/I79
	 g3VU7HXSINUEguMlazWSlgtAzjsHiYaVDeaQlwUKeWbyOQHAYxK3igqsK34BjTZib+
	 7cJLGpv4qxHSkLgFmwzLAjvUG3tqocbJkD4V5SWux9P0jygya8Ub7W0VwH+eDL4Owx
	 m6na7mSUQ6xnQUgk712GwI1EaGR1Ojv4ak5x5oeRBUrbl1h33DHHL+fH/DVevi3vk6
	 VQg4eaORZETag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1765358672; x=1765619172; i=teddy.astie@vates.tech;
	bh=NCK83gBz0IL7Vc7Oj5GbVPeGSyxopPEmPgP348hgmvg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=xvXyJg0B1b/ZxUb/W+HHTprvn/cUr5BxD0MfMaFnyaKbVLJZNHiyvrj9LONuXF/5a
	 lQlMJGPiY3UfqbxgUPwXabmNqq3l+CPOgjd0cmyKah69blLdxHKNT6qRJOo8+eas70
	 7kOLP0893GbWJ4FThc52BmNAuEjMGXnNzSlS+BmkA5tFLTGQvl1ZagyK+iafCNi9Hj
	 aB0bwYgKr5tf5+pzOVYflEHTpHs5x3XL9qil93nrPbkVxEV5BLJ6losCXSBdPSi21s
	 CLVh4B5ajup3U7AfAmwefVVajJNRZHeEVpdGyoUrOAdeTVzPA3/R9DWDsPHX8hqF/T
	 Rbuoc54xxqr2A==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=202/3]=20x86/platform:=20Expose=20DTS=20sensors=20MSR?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1765358671104
Message-Id: <dc211fcd-d0ef-4cc3-8ed7-771d835b6973@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1765300623.git.teddy.astie@vates.tech> <5ae285cb5c494651c1f4842f36891eaf6dc28355.1765300623.git.teddy.astie@vates.tech> <f4855e72-4898-487e-8240-a45c0c845b4c@suse.com>
In-Reply-To: <f4855e72-4898-487e-8240-a45c0c845b4c@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c29e86d88d2848558ee35332438687fe?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251210:md
Date: Wed, 10 Dec 2025 09:24:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 10/12/2025 =C3=A0 09:32, Jan Beulich a =C3=A9crit=C2=A0:
> On 09.12.2025 18:19, Teddy Astie wrote:
>> Intel provide CPU sensors through "DTS" MSRs. As there MSR are core-spec=
ific
> 
> Nit: s/there MSR/these MSRs/ ?
> 

fixed

>> @@ -86,6 +87,11 @@ static bool msr_read_allowed(unsigned int msr)
>>   
>>       case MSR_MCU_OPT_CTRL:
>>           return cpu_has_srbds_ctrl;
>> +
>> +    case MSR_IA32_THERM_STATUS:
>> +    case MSR_TEMPERATURE_TARGET:
>> +    case MSR_PACKAGE_THERM_STATUS:
>> +        return raw_cpu_policy.basic.pm.dts;
> 
> I'm pretty sure it was indicated before that the raw policy is likely wro=
ng to
> use for anything like this. The host policy wants using instead, or else =
specific
> justification should be provided.
> 

Indeed, host_cpu_policy is intended here.

> Jan



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



