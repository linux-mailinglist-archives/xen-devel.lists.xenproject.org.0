Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCD5B0F367
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 15:13:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053971.1422737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueZHn-0006Xj-Kv; Wed, 23 Jul 2025 13:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053971.1422737; Wed, 23 Jul 2025 13:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueZHn-0006VR-II; Wed, 23 Jul 2025 13:13:31 +0000
Received: by outflank-mailman (input) for mailman id 1053971;
 Wed, 23 Jul 2025 13:13:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9TKG=2E=bounce.vates.tech=bounce-md_30504962.6880dff1.v1-af2abd65d5ca4f3287bc31d5926289cb@srs-se1.protection.inumbo.net>)
 id 1ueZHm-0006VL-0V
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 13:13:30 +0000
Received: from mail13.wdc04.mandrillapp.com (mail13.wdc04.mandrillapp.com
 [205.201.139.13]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf0fa231-67c6-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 15:13:23 +0200 (CEST)
Received: from pmta16.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail13.wdc04.mandrillapp.com (Mailchimp) with ESMTP id 4bnF1s4SvKzNCd9Sy
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 13:13:21 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 af2abd65d5ca4f3287bc31d5926289cb; Wed, 23 Jul 2025 13:13:21 +0000
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
X-Inumbo-ID: cf0fa231-67c6-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1753276401; x=1753546401;
	bh=5pqinKGC5Z7+v9gU9W+gwKUT6TAI5rGjAOBwy6moWZs=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=V7QG92K2nnGAgl3wJIMrEr7uZ9QqVx4r/SDJR7U5qaLEikMXOXu33G3LlR5rOAVyY
	 6MkG6x9raghBnKZFbXn71kLeqraV1P8K2pzhKWNQwkinucyRkNgSfpQE/G+krCkVLs
	 wYGfFtXgvEg3Kg3CapIAMESUyCypE/qYYCNmb53VnIjiGnN4T3Z3NpqSfp61/hAAS1
	 n9vA10lC18jzCgyake+h2tPe4o9DtlffPiedLWyqLBevsVtYZilLd2BhNDjOuP1x0W
	 A51rXlS5uaaX4fU61zV9WCxc9V5tkCKoYyk76DyI+VjAgSca/lwPiexlZjZqmL4ixl
	 kBZlR0VVTSRYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1753276401; x=1753536901; i=ngoc-tu.dinh@vates.tech;
	bh=5pqinKGC5Z7+v9gU9W+gwKUT6TAI5rGjAOBwy6moWZs=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=jo7tkJ+YzrJr81MMHsbkIpk/rOPBQbLJsqzK1LaMK70uAb90S8SDzwWHIzU4LChX9
	 Dr/8Ljd8bAF+drkZA3KOW7ar81hyZhewwmq8lun0sr3UW4SREp0N9/sCXc39PCv0Gx
	 OzHedKYNKfDMTqg3TRD5r6/zeXofGTZkdK7Ga6707zSwgGdtJS/d2LDcne9/25v00+
	 jHSVOunciqeg1vo15W3AMg6Nq/i9WVceDmdyKvs1ohiGcdbX0yLBgMaTUpMKmFkrA/
	 ceiguFJ/JnaOULrisOhHFaTzNcsg674UDA6RbSfo8j4KMXHc71/x3GNrR+Y/uNsOoo
	 /tZILyNmWv2MA==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20PCI=20passthrough=20of=20XHCI=20on=20Framework=20AMD=20crashes=20the=20host?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1753276400448
Message-Id: <bf842fb8-93b3-4191-b828-93cb77953127@vates.tech>
To: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
References: <aIDXIqA4L7wcJH2T@mail-itl> <f2d125f2-febe-4e92-a7cf-5373b069cd1c@vates.tech> <aIDfM0kTNOWjJiJ3@mail-itl>
In-Reply-To: <aIDfM0kTNOWjJiJ3@mail-itl>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.af2abd65d5ca4f3287bc31d5926289cb?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250723:md
Date: Wed, 23 Jul 2025 13:13:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 23/07/2025 15:10, Marek Marczykowski-G=C3=B3recki wrote:
> On Wed, Jul 23, 2025 at 12:55:53PM +0000, Tu Dinh wrote

[...]

>> I had a similar problem with a Beelink mini PC with the Ryzen 5800U
>> after a recent Qubes upgrade.
>>
>> If the USB controller is passed through to sys-usb then the system
>> simply resets without warning.
> 
> Do you know if that happens also when no USB devices are connected at
> that time? There could be more reasons for similar issue, and a common
> one I've seen is dom0 kernel panic on unbind operation (which would be a
> different issue than the one I have here).
> 

I had an USB mouse and keyboard connected at the time to control the PC. 
I don't think it was dom0 kernel panic, no combination of reboot=3D or 
panic=3D in the Xen and dom0 command line managed to stop the reboot.


Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



