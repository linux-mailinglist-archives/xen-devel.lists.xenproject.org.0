Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 102548A6E1C
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 16:26:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707010.1104469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwjks-0003H3-Ox; Tue, 16 Apr 2024 14:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707010.1104469; Tue, 16 Apr 2024 14:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwjks-0003FW-M7; Tue, 16 Apr 2024 14:25:50 +0000
Received: by outflank-mailman (input) for mailman id 707010;
 Tue, 16 Apr 2024 14:25:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ytx6=LV=bounce.vates.tech=bounce-md_30504962.661e8a69.v1-a1c6ba1cc8c44f229e43f8f82cd71b5c@srs-se1.protection.inumbo.net>)
 id 1rwjkr-0003FQ-Cp
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 14:25:49 +0000
Received: from mail5.us4.mandrillapp.com (mail5.us4.mandrillapp.com
 [205.201.136.5]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36f99cc0-fbfd-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 16:25:47 +0200 (CEST)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail5.us4.mandrillapp.com (Mailchimp) with ESMTP id 4VJmY54WshzDRHxKk
 for <xen-devel@lists.xenproject.org>; Tue, 16 Apr 2024 14:25:45 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a1c6ba1cc8c44f229e43f8f82cd71b5c; Tue, 16 Apr 2024 14:25:45 +0000
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
X-Inumbo-ID: 36f99cc0-fbfd-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1713277545; x=1713538045;
	bh=I82avowjjNYaV+5Rc+1Ax5qld7iXqNtcj1EjzZ/hq60=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Ca07lirUaIKnT1d7qQ7Mla2zz5Mg+W/RwsYdsboOcehn02q2w2smHbbN4UwpYG47+
	 ayBMMwYtGMXHgZr+/GBrOqK9qglN2Iebphtq0wU5mh9RpkboPHDp1C37H7bjzWmYJb
	 jRwJknCmhnDTbuZu9iKS5iqkiX1N2RMn/AGsCvFvCy3+ouWafyXC+lnInt988VYAoS
	 LRRgynDZUfzKR2Eb+PhmxCTazc47Ea/BHvd8EyP8YauGth8MHsV1NyOUBKjA02Qf1p
	 j+U5iORfnBx0RJYtnTNDQafOw+ZtgQr7MyaC8R0h9xrOak0Tr8VhQW5n+0VFrq6ZO+
	 ySOBXIFf1hWDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1713277545; x=1713538045; i=vaishali.thakkar@vates.tech;
	bh=I82avowjjNYaV+5Rc+1Ax5qld7iXqNtcj1EjzZ/hq60=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=S5HaZJ2cyM2JRodKrUQzQ/Q+QZahTb+1GVifTwYgcKHMincuXAoUG5vI6FYpvj9eW
	 64aGuKkjTMvwwXDociBhdEXGzMyv6dBWgaspshJc2krBqWeWvN1Um1Y8gh/o+gXYeW
	 ddzeHqBpCGY2bhc+Wat3M+IIdAn8Kon2p7MtLXLXZM0YD91ePfQvAnwS918bz9wt1T
	 S+lOQgSgAxts9MmvaTy/1caUlacSSgadLoW9Dh+F4bbb7jHgKldIxINPq/DF/+H8zG
	 ph8B66AJCXJNe+Q84Tafan6ErHkNCpEKamuNatW3HQZEuOvoPBNSmGFzzecmlmx907
	 A8IAJLaPV2aOQ==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86/hvm:=20Allow=20supplying=20a=20dynamic=20start=20ASID?=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1713277544363
Message-Id: <61871a46-255e-44a5-ab48-0d40c4d24e33@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, roger.pau@citrix.com
References: <0d4ef987825080715873360c8b41ebb467b7dfdf.1713257278.git.vaishali.thakkar@vates.tech> <4915dde3-e798-4eb8-addd-b65a417cf3de@citrix.com>
In-Reply-To: <4915dde3-e798-4eb8-addd-b65a417cf3de@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a1c6ba1cc8c44f229e43f8f82cd71b5c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240416:md
Date: Tue, 16 Apr 2024 14:25:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 4/16/24 4:12 PM, Andrew Cooper wrote:
> On 16/04/2024 9:54 am, Vaishali Thakkar wrote:
>> Currently, Xen always starts the ASID allocation at 1. But
>> for SEV technologies the ASID space is divided. This is
>> because it's a security issue if a guest is started as
>> ES/SNP and is migrated to SEV-only. So, the types are
>> tracked explicitly.
>>
>> Thus, in preparation of SEV support in Xen, add min_asid
>> to allow supplying the dynamic start ASID during the
>> allocation process.
>>
>> Signed-off-by: Vaishali Thakkar <vaishali.thakkar@vates.tech>
> 
> Mechanically, this is fine, but is it going to be useful in the long term=
?
> 
> For SEV and SEV-ES/SNP, we must run the VM in the single fixed ASID
> negotiated with the ASP.=C2=A0 This is not not optional.
> 
> For non-encrypted VMs, we are free to choose between using the remaining
> ASID space as we used to (i.e. run it per-pCPU and tick it over to flush
> the TLBs), or to run it in a fixed ASID per guest too.
> 
> The latter lets us use INVLPGB, and would avoid maintaining two
> different TLB-tagging schemes.
> 
> 
> I'd say that we absolutely do want INVLPGB support for managing
> non-encrypted VMs, and we cannot mix both fixed and floating ASIDs at
> the same time.

I agree that having a both schemes at the time is not practical. And I've 
some RFC patches in work to propose fixed ASID scheme for all domains 
(encrypted or not) to start a discussion regarding that.

IMO, this patch is still useful because my idea was to then use min_asid
as a holder to separate out the non-encrypted, encrypted space and SEV ES/
SNP ASID space. If it's more easier to see the usefulness of this patch
along with other asid fixes, I'm fine with putting it in that RFC patchset.
But I thought that this change was independent enough to be sent by
itself.

> We should seriously consider whether it's worth maintaining two schemes,
> or just switching wholesale to a fixed ASID scheme.
> 
> I don't have a good answer here...=C2=A0 If it where anything but TLB
> flushing, it would be an obvious choice, but TLB handling bugs are some
> of the nastiest to show up.
> 
> ~Andrew


