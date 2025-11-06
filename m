Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AE5C3ADF5
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 13:24:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156894.1485855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGz21-00019U-VY; Thu, 06 Nov 2025 12:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156894.1485855; Thu, 06 Nov 2025 12:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGz21-00017G-SY; Thu, 06 Nov 2025 12:24:01 +0000
Received: by outflank-mailman (input) for mailman id 1156894;
 Thu, 06 Nov 2025 12:24:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aFeo=5O=bounce.vates.tech=bounce-md_30504962.690c935d.v1-4f161b4070094513b3309dbc08e2e9d4@srs-se1.protection.inumbo.net>)
 id 1vGz1z-000178-Vm
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 12:24:00 +0000
Received: from mail180-3.suw31.mandrillapp.com
 (mail180-3.suw31.mandrillapp.com [198.2.180.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77f9cc95-bb0b-11f0-9d17-b5c5bf9af7f9;
 Thu, 06 Nov 2025 13:23:58 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-3.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4d2Lvx2fx8zDRKpfF
 for <xen-devel@lists.xenproject.org>; Thu,  6 Nov 2025 12:23:57 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4f161b4070094513b3309dbc08e2e9d4; Thu, 06 Nov 2025 12:23:57 +0000
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
X-Inumbo-ID: 77f9cc95-bb0b-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1762431837; x=1762701837;
	bh=FFGej1DKmUsMC9NLzWpWnuGjFkfWH0XoPT3cylMdI98=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FnOC3FaDoQr4BOFe9aJ27K0JPZ1UWXKuCsmNbcRR0cjXnPsnaMa27C1DbbuTG2hy9
	 cqxytq08Z4c5vv5krwWoG799l98SXaQQCknjl+Lvs/pTaMHE22hJfWSvGvCtmuXpXi
	 ogBjlql3qQktXEmufVml8dIsk/layd5BvaYkEBF/JZZutK0fBDyq3XIWrb3CSTJGuC
	 3P5wMUJeQPumtgSkZa277IyZYJL3AJsSeMfsd11bfMlbUVXS3GSNlA4PjiapDq36jh
	 prgX00R/ByC54qEv7gh3oQt+n4w2UjKzw17EAzaUrlXmOBWYOoGNbs1QkTkwX61k8j
	 Tb9BmBxuWL5CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1762431837; x=1762692337; i=ngoc-tu.dinh@vates.tech;
	bh=FFGej1DKmUsMC9NLzWpWnuGjFkfWH0XoPT3cylMdI98=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=urNgwlxYzj0mLGWNWzfSiE1q4UtxZImC8aCxizMDPzkvbqJ4jU8V7dxw+l2oh0cMy
	 YkOK6Vby02XMOHSa0fMgI6nLKM70+WIBTwdXSFZx2HTCRwa/vgdy07B93gxv5fc8k2
	 4RDIPOW+fQTrBmXOTSLaX7KjJ/laWOj3E3i/6omyJZaxWj7XH3EF61qvfamhsCnQUk
	 j82QiXWKsQ9FokUBsphjjyYvRtTDQH3/aqwP91hIZY3Os8kvOblpoWQyr3rpiuGl1e
	 e5bdXawD1nRXQjUyehjCrzEtbeYTajCHqoMcHwfxiOzAYsDLsZ2NHRDmPAWv4hVfah
	 1gZGXOl5cbiNA==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20for-4.22=20v2]=20acpi:=20Set=20TPM2=20LAML=20to=20actual=20log=20area=20size?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1762431836262
Message-Id: <a4a194b5-edab-47e2-9c95-5293e88f6d9b@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Daniel Smith" <dpsmith@apertussolutions.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20251105000310.690-1-ngoc-tu.dinh@vates.tech> <58064c07-4182-48d8-9479-7b9f8e9a06cd@suse.com> <e3e182f1-8566-4fe5-b599-3b2f6c582782@vates.tech> <e66a7724-12d3-42e2-805d-b32febb3d346@suse.com>
In-Reply-To: <e66a7724-12d3-42e2-805d-b32febb3d346@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4f161b4070094513b3309dbc08e2e9d4?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251106:md
Date: Thu, 06 Nov 2025 12:23:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/11/2025 13:19, Jan Beulich wrote:
> On 06.11.2025 13:13, Tu Dinh wrote:
>> On 06/11/2025 13:10, Jan Beulich wrote:
>>> On 05.11.2025 01:03, Tu Dinh wrote:
>>>> The LAML field should follow the TCG PFP specification:
>>>>
>>>> The TCG ACPI specification uses the field name "Log Area Minimum
>>>> Length", but the field value is the actual log area length reserved by
>>>> Platform Firmware, not a lower bound.
>>>
>>> And this is said where? Even the field description (ACPI 6.5) reads "Id=
entifies
>>> the minimum length (in bytes) of the system=E2=80=99s preboot CC event =
log area." (I
>>> agree it makes little sense that way, but the change still needs proper
>>> explanation.)
>>
>> The above is an exact quote from the "TCG PC Client Platform Firmware
>> Profile Specification Version 1.06 Revision 52".
> 
> Interesting. It didn't become clear to me that this actually is a quotati=
on.
> Perhaps:
> 
> The LAML field should follow the TCG PC Client Platform Firmware Profile
> Specification Version. Version 1.06 Revision 52 says:
> 
> 'The TCG ACPI specification uses the field name "Log Area Minimum
>   Length", but the field value is the actual log area length reserved by
>   Platform Firmware, not a lower bound.'
> 
> Remove the now-unused TPM_LOG_AREA_MINIMUM_SIZE.
> 
> ? Then
> Acked-by: Jan Beulich <jbeulich@suse.com>
> and I could make the adjustment while committing (after 4.21 was branched=
 off,
> of course).
> 
> Jan

That's clearer, thanks.


--
Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



