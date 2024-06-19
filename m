Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 905A390EB86
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 14:58:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743800.1150782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJusl-0004eO-Ht; Wed, 19 Jun 2024 12:57:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743800.1150782; Wed, 19 Jun 2024 12:57:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJusl-0004ct-FH; Wed, 19 Jun 2024 12:57:47 +0000
Received: by outflank-mailman (input) for mailman id 743800;
 Wed, 19 Jun 2024 12:57:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KjC9=NV=bounce.vates.tech=bounce-md_30504962.6672d5c6.v1-73edaa175ba94638a1fbddc1cbefd527@srs-se1.protection.inumbo.net>)
 id 1sJusj-0004aL-Cv
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 12:57:45 +0000
Received: from mail177-18.suw61.mandrillapp.com
 (mail177-18.suw61.mandrillapp.com [198.2.177.18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8470a2a6-2e3b-11ef-90a3-e314d9c70b13;
 Wed, 19 Jun 2024 14:57:43 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-18.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4W43Yy46kSzCf9KJW
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 12:57:42 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 73edaa175ba94638a1fbddc1cbefd527; Wed, 19 Jun 2024 12:57:42 +0000
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
X-Inumbo-ID: 8470a2a6-2e3b-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1718801862; x=1719062362;
	bh=QAebLaPD8+cupYVRUnIU5BBiafDK5MduiHxYSEAK7j8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=1ip7cld0l3PvvJ2DBuacNyUixIU4aHWFy07QAujXMeQ+xNy7dm8iuq6gIlUTTBrgJ
	 7bWQVPp5bpPSMFipQvRNCnVy+Ry5PR2g5d8wJFNPE3I95lUIxaJF62YNq3BU7KmSdX
	 kPUxdKNVucWT1mjp9vnPdgvCyb6R4Jr9FAR65Yv1/6l36wPwp4yB/z5oQ6VwhMIaJp
	 DC7GQ4l8CBFADvFHhhEd6alx17lprVaEdGbICaTafvOV3YJbS2aSd3/tD5UHT3z3l5
	 frGdoTje0VHn+JSXMviELDu6LZNQnAxPXf0lWD4pwMSStRoi48MPEEuHCAHvpgFk52
	 NPUt+0YJKtHZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1718801862; x=1719062362; i=anthony.perard@vates.tech;
	bh=QAebLaPD8+cupYVRUnIU5BBiafDK5MduiHxYSEAK7j8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=UZuO3lvtfRZ6jcWHx2QKFa3whcv/gcM7hkEdh33iINrgD7PTSQguSf6dRxCexpN6B
	 FJcGiSdHf6Xbsy15ft4lKx7Ak6ieBtcobXXp8VhCu5Yk2Kkej9gVGCl8S4GBkzhD5H
	 uJptj8AYB8H66ozRePlr5O+TEjByi7zEL0a+eosi4WPZmlZAYqnMxHfiz8Zg9ORftx
	 u39137D50c5MKiCMMg9DXXIbkdOVTWAk107jxaMhbNxaaYy4VWjCH079yETr7bIQpp
	 lmCO+T2CF3hG3O1R0LQyB13cx7n1KVKF0Zmn6dDEWNsmPjbhSgM1pUK1kkI7rqvO7p
	 K2GlVGjbT4J9Q==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20tools/libs/light:=20Fix=20nic->vlan=20memory=20allocation?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1718801860969
To: Jason Andryuk <jason.andryuk@amd.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Leigh Brown <leigh@solinno.co.uk>, Xen Devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Jan Beulich <jbeulich@suse.com>
Message-Id: <ZnLVxB2XuWL9UKWI@l14>
References: <20240520164400.15740-1-leigh@solinno.co.uk> <c600e5e8-d169-417c-bc02-d33e84dca0fb@amd.com>
In-Reply-To: <c600e5e8-d169-417c-bc02-d33e84dca0fb@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.73edaa175ba94638a1fbddc1cbefd527?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240619:md
Date: Wed, 19 Jun 2024 12:57:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, May 20, 2024 at 01:08:03PM -0400, Jason Andryuk wrote:
> On 2024-05-20 12:44, Leigh Brown wrote:
> > After the following commit:
> > 3bc14e4fa4b9 ("tools/libs/light: Add vlan field to libxl_device_nic")
> > xl list -l aborts with a double free error if a domain has at least
> > one vif defined:
> > 
> >    $ sudo xl list -l
> >    free(): double free detected in tcache 2
> >    Aborted
> > 
> > Orginally, the vlan field was called vid and was defined as an integer.
> > It was appropriate to call libxl__xs_read_checked() with gc passed as
> > the string data was copied to a different variable.  However, the final
> > version uses a string data type and the call should have been changed
> > to use NOGC instead of gc to allow that data to live past the gc
> > controlled lifetime, in line with the other string fields.
> > 
> > This patch makes the change to pass NOGC instead of gc and moves the
> > new code to be next to the other string fields (fixing a couple of
> > errant tabs along the way), as recommended by Jason.
> > 
> > Fixes: 3bc14e4fa4b9 ("tools/libs/light: Add vlan field to libxl_device_nic")
> > Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

