Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16221956ED9
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 17:34:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779827.1189507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg4Oc-0002y4-HS; Mon, 19 Aug 2024 15:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779827.1189507; Mon, 19 Aug 2024 15:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg4Oc-0002vj-ER; Mon, 19 Aug 2024 15:34:14 +0000
Received: by outflank-mailman (input) for mailman id 779827;
 Mon, 19 Aug 2024 15:34:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=63V5=PS=bounce.vates.tech=bounce-md_30504962.66c365f0.v1-927d9a4b488847bd8c2040660a139536@srs-se1.protection.inumbo.net>)
 id 1sg4Oa-0002ug-QD
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 15:34:12 +0000
Received: from mail186-11.suw21.mandrillapp.com
 (mail186-11.suw21.mandrillapp.com [198.2.186.11])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79dfda96-5e40-11ef-8776-851b0ebba9a2;
 Mon, 19 Aug 2024 17:34:09 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-11.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4Wnc8J0N5czLfH5w0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 15:34:08 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 927d9a4b488847bd8c2040660a139536; Mon, 19 Aug 2024 15:34:08 +0000
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
X-Inumbo-ID: 79dfda96-5e40-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1724081648; x=1724342148;
	bh=qAEVet5HRYVWUvU+lssCbbDMvc9C+3fZjVAjx03oKKY=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=V7FJ4wL1bYKIPyVh4FYCkG2iLCH5JORlu+IeGSk3t8zeV4H6z/rRkB2vnBfAvZb7K
	 KylXPr6WL1DJVRznDkOJezw4InHuRm+H04uMzaPeVTC4sorreaIUIcUCC/jAKZjc38
	 FRKA2YqwYw1YE+ml4vblHIM3AEaW3etFx1UQSIVCL7ey5rILDgR28luFsBsb3zxhPk
	 oVs488dZnb5xuwcBdBITV88HT5aazS6zEuH1TIS2EqjdDOn0g9qNHYhcMKRHM45P4X
	 4rCG7uNvyGvjZdrPta0tUCK1lhpYALXO/BAZHKiduuPoM64SFSDMt/G1KK2hQ41xzZ
	 AZojU6UYT0GNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1724081648; x=1724342148; i=anthony.perard@vates.tech;
	bh=qAEVet5HRYVWUvU+lssCbbDMvc9C+3fZjVAjx03oKKY=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=16phHpn25UTD7JszPFJs2NQHw5QxKZgdi5s8cONIgxx5ePm9mNa2m+4iV3R5R8WX9
	 pHNRAd9S/nBbb+ed7WrBlxERPL4sW2l4G8LKyb54lI+EUPVNlM7mQnhagj/CIojJOw
	 LTyeyp6b+TwDLMmyx9bEsAaqVnsCsAuboJ4dAFBXuovbcO5mkdc+Wh3C4jp92wctej
	 gfgkbnqA1DmqMTt2tJN2Dpc/fmbwIIxrO7LiNil7VmGzORYg7mphzNrUXJ26xbVduF
	 zMyMmPdr5nCV50l40Y50BS+tMsl8yTfkVGN1BzTtGcNX0Pc6kIFY9Sh0v9IWkW07gD
	 wsdXqBHVuNAVg==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20automation:=20restore=20CR=20filtering?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1724081646457
To: Michal Orzel <michal.orzel@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Message-Id: <ZsNl7S1JOYQgQx87@l14>
References: <alpine.DEB.2.22.394.2408161642220.298534@ubuntu-linux-20-04-desktop> <6d2fbe22-8866-4769-95d0-a5a8613a5936@amd.com>
In-Reply-To: <6d2fbe22-8866-4769-95d0-a5a8613a5936@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.927d9a4b488847bd8c2040660a139536?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240819:md
Date: Mon, 19 Aug 2024 15:34:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Aug 19, 2024 at 09:21:22AM +0200, Michal Orzel wrote:
> On 17/08/2024 01:46, Stefano Stabellini wrote:
> > diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
> > index 0666f6363e..ed44aab0f0 100755
> > --- a/automation/scripts/qemu-xtf-dom0less-arm64.sh
> > +++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
> > @@ -65,4 +65,4 @@ export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x4000000
> >  export QEMU_LOG="smoke.serial"
> >  export PASSED="${passed}"
> > 
> > -./automation/scripts/qemu-key.exp
> > +./automation/scripts/qemu-key.exp | sed 's/\r//'
> 
> I compared 3 pipelines:
> 1) one before c36efb7fcea6 (https://gitlab.com/xen-project/hardware/xen/-/jobs/7566986885)
> 2) one after c36efb7fcea6 (https://gitlab.com/xen-project/hardware/xen/-/jobs/7603830706)
> 3) one with this fix (https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/7603783403)
> 
> In 1), there is Xen log + Linux log in Gitlab web page
> In 2), there is no log at all
> In 3), there is only Xen log visible

It's nice that you can select uboot/Xen logs or Linux logs based on the
number of '\r' at the end of a line (output cat -A):
    U-Boot 2023.01+dfsg-2+deb12u1 (Apr 18 2024 - 22:00:21 +0000)^M^M$
    (XEN) [    0.013864] Xen version 4.20-unstable (root@) (gcc (Alpine 12.2.1_git20220924-r10) 12.2.1 20220924) debug=n Sat Aug 17 00:54:57 UTC 2024^M^M$
    [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x411fd070]^M^M^M$

But to display to GitLab's job logs, we want: sed 's/\r\+$//'

Also, do you have to edit every single script to overcome a shortcoming
from the "expect" script? Can't you write a bit of Tcl and edit the line
in the script instead?

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

