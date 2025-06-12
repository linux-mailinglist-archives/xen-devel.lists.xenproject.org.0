Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FF7AD71EE
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 15:29:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013096.1391641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPhzR-0008Vw-Iu; Thu, 12 Jun 2025 13:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013096.1391641; Thu, 12 Jun 2025 13:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPhzR-0008Tz-Fg; Thu, 12 Jun 2025 13:29:09 +0000
Received: by outflank-mailman (input) for mailman id 1013096;
 Thu, 12 Jun 2025 13:29:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xtgf=Y3=bounce.vates.tech=bounce-md_30504962.684ad61f.v1-12da2aeb48284cfca2696e3222faaa34@srs-se1.protection.inumbo.net>)
 id 1uPhzQ-0008Tr-4z
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 13:29:08 +0000
Received: from mail187-14.suw11.mandrillapp.com
 (mail187-14.suw11.mandrillapp.com [198.2.187.14])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 354e1fea-4791-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 15:29:04 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-14.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4bJ3Jv3lQDz8XRql9
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 13:29:03 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 12da2aeb48284cfca2696e3222faaa34; Thu, 12 Jun 2025 13:29:03 +0000
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
X-Inumbo-ID: 354e1fea-4791-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1749734943; x=1750004943;
	bh=HCCC2WMnOuHQR2vZ/NmiQkkCDP/l5lJNiSzzhcJK0mc=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mq2S1xMKoJEObOqop8FXMH7LCUXI6tW7mo7uJGM0BOzLW01amdO9whrGLjhVYFdyw
	 NIIcz6MCv+NWSVq7zxzo4zkG5NaXVJ6As/1yAJ0jM//y8hBabs2hTqnsdMYQUr5o8P
	 bcSU/o1FZNLfNMjJ6s/aFawRlNlKiqhsXqCaAZyPd4DJyD0dfNH9mhKSJG8LUyjA/m
	 oX7L2ciTzlqNOG5Y4Juec58zUgUeV8pH0NBDoDPrQ40IOOsG4FvSCoZvxYIeRLwozm
	 zeIMjpHroJdqTmgJvxO8jiD5SkKZklbLj06+ty8KcfjxvBAoVvXK5LHwwkeEUSwHXa
	 unqQgtB0mS8pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1749734943; x=1749995443; i=ngoc-tu.dinh@vates.tech;
	bh=HCCC2WMnOuHQR2vZ/NmiQkkCDP/l5lJNiSzzhcJK0mc=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=fElo6skgI7iic7d4XIg6H2UuwzcNHOubJHXenKv+QoY5YEUL2JTyJbxB6xK9bKlBD
	 sIUKu+4TtfETYRy8MC0wHhxgTWNk6LHxPFk/V1U/qLQW51ksj5X/m5qalz4Txr5HlW
	 VatsSkk7sEYYOXvYonMl3jY+VR3OG3VqCMRL4SbVvlw4sCKkoj47u75TqKcgz79iKS
	 TyDH8TVNV8a6thBUt+8ttQyCOjLIEi57vG/N1NHr79IC+xCoN0xvBJvd01nA+JfZfF
	 7MGHg7xQ8rn/wxoKQPcbQD95Y6E7PpsSH/lmL/2vtzIBfVteyPXc3Rs1eaBDxPJ6be
	 cB7jCOZV5oGbQ==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20docs:=20UEFI=20Secure=20Boot=20security=20policy?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1749734941416
Message-Id: <fcfe3696-a56d-46da-a1a1-806934ba4fed@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Juergen Gross" <jgross@suse.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>, "Trammell Hudson" <hudson@trmm.net>, "Ross Lagerwall" <ross.lagerwall@cloud.com>, "Frediano Ziglio" <frediano.ziglio@cloud.com>, "Gerald Elder-Vass" <gerald.elder-vass@cloud.com>, "Kevin Lampis" <kevin.lampis@cloud.com>, Xen-devel <xen-devel@lists.xenproject.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <20250611235851.167385-1-andrew.cooper3@citrix.com> <4226d6ef-a1eb-4210-8cae-2b9b2d906d1c@vates.tech> <53e8cacd-e035-47ca-906e-35f748559328@suse.com>
In-Reply-To: <53e8cacd-e035-47ca-906e-35f748559328@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.12da2aeb48284cfca2696e3222faaa34?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250612:md
Date: Thu, 12 Jun 2025 13:29:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 12/06/2025 15:22, Jan Beulich wrote:
> On 12.06.2025 15:15, Tu Dinh wrote:
>> On 12/06/2025 02:03, Andrew Cooper wrote:
>>> +Secure Boot Advanced Targeting
>>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>> +
>>> +SBAT is a recovation scheme for Secure Boot enabled components, using a
>>> +generation based scheme.  See `Shim SBAT.md
>>> +<https://github.com/rhboot/shim/blob/main/SBAT.md>`_ for full details.
>>> +
>>> +Upstream Xen provides the infrastructure to embed SBAT metadata in
>>> +``xen.efi``, but does not maintain a generation number itself.  Downstreams
>>> +are expected to maintain their own generation numbers.
>>> +
>>
>> Why would Xen not maintain its own SBAT generation? An upstream SBAT
>> incremented for every Secure Boot bypass XSA would make it far easier to
>> block vulnerable variants and help downstreams coordinate fixes.
> 
> Quoting from the SBAT patch that was submitted a little while ago:
> 
> "The SBAT section provides a way for the binary to declare a generation
>   id for its upstream source and any vendor changes applied."
> 
> That is, the generation ID is per-vendor. Upstream incrementing whatever
> ID would be meaningless to downstreams then. Hence we can as well not do
> so in the first place.
> 
> Jan

Don't Shim, Grub and Linux all have their own upstream SBAT generation? 
The Shim SBAT documentation explicitly pointed this out:

 > Each component is assigned a minimum global generation number. 
Vendors signing component binary artifacts with a specific global 
generation number are required to include fixes for any public or 
pre-disclosed issue required for that generation. Additionally, in the 
event that a bypass only manifests in a specific product's component, 
vendors may ask for a product-specific generation number to be published 
for one of their product's components. This avoids triggering an 
industry wide re-publishing of otherwise safe components.

IOW Xen should have its own upstream generation ID for any vulnerability 
that leads to a Secure Boot bypass. Any vendor that patches such a 
vulnerability can simply increase the upstream generation ID it carries 
in its SBAT to that of the latest Xen. Then any inferior upstream 
generation can simply be revoked to cover all vendors at once.

Best regards,


Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


