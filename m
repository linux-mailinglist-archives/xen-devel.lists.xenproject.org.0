Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE66C3AD2C
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 13:13:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156853.1485824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGyry-0006kY-Id; Thu, 06 Nov 2025 12:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156853.1485824; Thu, 06 Nov 2025 12:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGyry-0006i8-Fa; Thu, 06 Nov 2025 12:13:38 +0000
Received: by outflank-mailman (input) for mailman id 1156853;
 Thu, 06 Nov 2025 12:13:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJ4h=5O=bounce.vates.tech=bounce-md_30504962.690c90e9.v1-d6ce765204354a948c0d9e2caf16a0be@srs-se1.protection.inumbo.net>)
 id 1vGyrx-0006i2-Ja
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 12:13:37 +0000
Received: from mail180-3.suw31.mandrillapp.com
 (mail180-3.suw31.mandrillapp.com [198.2.180.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01e7be5f-bb0a-11f0-980a-7dc792cee155;
 Thu, 06 Nov 2025 13:13:31 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-3.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4d2Lgs4KjyzDRJBZK
 for <xen-devel@lists.xenproject.org>; Thu,  6 Nov 2025 12:13:29 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d6ce765204354a948c0d9e2caf16a0be; Thu, 06 Nov 2025 12:13:29 +0000
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
X-Inumbo-ID: 01e7be5f-bb0a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1762431209; x=1762701209;
	bh=q/F5YpCmmdV33F13faW5XH1C9OtX3cyGzeYv1jtr4PU=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GW94OZl/q+w0u9HQdftcbmkcYgvZsFLmAVOsF1dYLWURo1T023qdXz/M1MkTEuHwC
	 wX4ho3vXv3kDOvcY89SYvf6YSlLkEpJahMcvVKJ+tROIhcr7noNEhxM+5pvKDxD5kf
	 viXxGOiri9lRZsLwqsI7paoN1TLHH7adYyUNyvdJvw+mgYWypFSRkixQ5jc0J/8iYT
	 0yCWJxE0jUO8T7o+JpcBPsq+tAmxNfnJMrjnNUL7VpmKKfGMTU8i8MjWHDkRY6EPfy
	 MO11pqJa0biGVKuxSlbi6m/bDFUXLLHzRiyRSJxiAYZlNsRNCJYx8wWMZ+hcFyHbXb
	 J/fk5CrPaKGcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1762431209; x=1762691709; i=ngoc-tu.dinh@vates.tech;
	bh=q/F5YpCmmdV33F13faW5XH1C9OtX3cyGzeYv1jtr4PU=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Hwji8ifV4NUi6ncVRB9dsZBHBRSIWs3LwLlSjAzDz7UrMdxSZa1/ZC9no7bjzbI8+
	 jE7w6OR+OLNnlAh8BqZE4kKhXW8lBsLmGz4ABFwsQcLt5aea/vpPSpmYvMYLvAJKh1
	 r0LsRewzucM7epGl0QWzseoyrt7s/TONceWRq9Uk8R8UGVCiywf/04owBSOf1Q5dLE
	 fn2JRN47vjqHbdQr9R6tERad+4N6k1qdrxqjTwtxd97mbsXaurDyM0CDlgDQitunp/
	 Zg+axJSMZ3d9h3UDMQ8InGSoJt59eBkelIR+od7PyIERtDVHTndydE5NLcFhwAYZvC
	 A6khBYGjzubdQ==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20for-4.22=20v2]=20acpi:=20Set=20TPM2=20LAML=20to=20actual=20log=20area=20size?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1762431208538
Message-Id: <e3e182f1-8566-4fe5-b599-3b2f6c582782@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Daniel Smith" <dpsmith@apertussolutions.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20251105000310.690-1-ngoc-tu.dinh@vates.tech> <58064c07-4182-48d8-9479-7b9f8e9a06cd@suse.com>
In-Reply-To: <58064c07-4182-48d8-9479-7b9f8e9a06cd@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d6ce765204354a948c0d9e2caf16a0be?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251106:md
Date: Thu, 06 Nov 2025 12:13:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/11/2025 13:10, Jan Beulich wrote:
> On 05.11.2025 01:03, Tu Dinh wrote:
>> The LAML field should follow the TCG PFP specification:
>>
>> The TCG ACPI specification uses the field name "Log Area Minimum
>> Length", but the field value is the actual log area length reserved by
>> Platform Firmware, not a lower bound.
> 
> And this is said where? Even the field description (ACPI 6.5) reads "Iden=
tifies
> the minimum length (in bytes) of the system=E2=80=99s preboot CC event lo=
g area." (I
> agree it makes little sense that way, but the change still needs proper
> explanation.)
> 
> Jan

The above is an exact quote from the "TCG PC Client Platform Firmware 
Profile Specification Version 1.06 Revision 52".


--
Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



