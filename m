Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D949586F9
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 14:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780362.1189983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgO0D-00061X-8e; Tue, 20 Aug 2024 12:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780362.1189983; Tue, 20 Aug 2024 12:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgO0D-0005zD-5S; Tue, 20 Aug 2024 12:30:21 +0000
Received: by outflank-mailman (input) for mailman id 780362;
 Tue, 20 Aug 2024 12:30:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0AKo=PT=bounce.vates.tech=bounce-md_30504962.66c48c57.v1-a8fcbd40c50a4322a4c37c8dee78cac8@srs-se1.protection.inumbo.net>)
 id 1sgO0B-0005z7-BZ
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 12:30:19 +0000
Received: from mail137-17.atl71.mandrillapp.com
 (mail137-17.atl71.mandrillapp.com [198.2.137.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4818ce4-5eef-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 14:30:17 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-17.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4Wp81g4DVyzPm0ST8
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 12:30:15 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a8fcbd40c50a4322a4c37c8dee78cac8; Tue, 20 Aug 2024 12:30:15 +0000
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
X-Inumbo-ID: f4818ce4-5eef-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1724157015; x=1724417515;
	bh=qR7Xy2ItWL4/6otJdOB50BG1by0/yUDqn9vMIS+HepQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=VLjOZ1JEoXDjfPaM1fpIu88QaWMpqLWF0aSPE1Hd/V5Nl1W7AHVKZpxg+UqdIG9kC
	 9VGcs5u5t1HM0FDAMBoZsCRsybf/7ocMIsD9bbLkxUNSff58VL+apndv6Z3H8bWkBT
	 zSIk+qKu5foyrIkHIeZ+WaFg70CXPr5U4CC1JyZUDOUuTAnf0eij6GGhE7Z2iQRj1h
	 SFxWigInw5YffGS1K/7O8VRCI6f4U7OBRfcB8mViuNu4HinYE9RCOz9a3yr1N6bwu4
	 ovYSL3Wn33SHerIqOnWYhlmYMsaFr7as6dnwYgW9iYlVmKb6LHi66GzawvmS5qa1PO
	 lj+ZJROVw91+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1724157015; x=1724417515; i=anthony.perard@vates.tech;
	bh=qR7Xy2ItWL4/6otJdOB50BG1by0/yUDqn9vMIS+HepQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=IEbyXgHCb7g7q+qlYLJLF2rvp2GXLHB/nP3cbxTUodKCFgNmKw0IglGO6YCJmmpkA
	 w6R57x14L4NBXiERFvxmTCoT9RRY2IqcJ++F4X7CWZ1QAse8dUKF/dXp1GhXgahhHN
	 ap6Wv+uddFBDNzUiKMcYZZEy5duvehl/sM62CEyOvAf6Nk3BlnXMdQBNFIxD2oXohD
	 sWxzdgA784idCbB7N6Fk7mkE172PZlJCw1R1juu5aUYX6r9AZobTliJpvh5MNIK3Ad
	 H/BohsFtBe18esh64Jxe+hkZYIqc3dfCfIP+Pag+WtN/a5PQKVtul4zSGYZsjj+EpB
	 M1pGL6NZuyMIA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20automation:=20restore=20CR=20filtering?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1724157014219
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Message-Id: <ZsSMVaoJlR4mn7Ig@l14>
References: <alpine.DEB.2.22.394.2408161642220.298534@ubuntu-linux-20-04-desktop> <6d2fbe22-8866-4769-95d0-a5a8613a5936@amd.com> <ZsNl7S1JOYQgQx87@l14> <alpine.DEB.2.22.394.2408191819580.298534@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2408191819580.298534@ubuntu-linux-20-04-desktop>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a8fcbd40c50a4322a4c37c8dee78cac8?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240820:md
Date: Tue, 20 Aug 2024 12:30:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Aug 19, 2024 at 06:56:47PM -0700, Stefano Stabellini wrote:
> On Mon, 19 Aug 2024, Anthony PERARD wrote:
> > On Mon, Aug 19, 2024 at 09:21:22AM +0200, Michal Orzel wrote:
> > > On 17/08/2024 01:46, Stefano Stabellini wrote:
> > > > diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
> > > > index 0666f6363e..ed44aab0f0 100755
> > > > --- a/automation/scripts/qemu-xtf-dom0less-arm64.sh
> > > > +++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
> > > > @@ -65,4 +65,4 @@ export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x4000000
> > > >  export QEMU_LOG="smoke.serial"
> > > >  export PASSED="${passed}"
> > > > 
> > > > -./automation/scripts/qemu-key.exp
> > > > +./automation/scripts/qemu-key.exp | sed 's/\r//'
> > > 
> > > I compared 3 pipelines:
> > > 1) one before c36efb7fcea6 (https://gitlab.com/xen-project/hardware/xen/-/jobs/7566986885)
> > > 2) one after c36efb7fcea6 (https://gitlab.com/xen-project/hardware/xen/-/jobs/7603830706)
> > > 3) one with this fix (https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/7603783403)
> > > 
> > > In 1), there is Xen log + Linux log in Gitlab web page
> > > In 2), there is no log at all
> > > In 3), there is only Xen log visible
> > 
> > It's nice that you can select uboot/Xen logs or Linux logs based on the
> > number of '\r' at the end of a line (output cat -A):
> >     U-Boot 2023.01+dfsg-2+deb12u1 (Apr 18 2024 - 22:00:21 +0000)^M^M$
> >     (XEN) [    0.013864] Xen version 4.20-unstable (root@) (gcc (Alpine 12.2.1_git20220924-r10) 12.2.1 20220924) debug=n Sat Aug 17 00:54:57 UTC 2024^M^M$
> >     [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x411fd070]^M^M^M$
> > 
> > But to display to GitLab's job logs, we want: sed 's/\r\+$//'
> > 
> > Also, do you have to edit every single script to overcome a shortcoming
> > from the "expect" script? Can't you write a bit of Tcl and edit the line
> > in the script instead?
> 
> The sed route is not perfect but it works :-)
> 
> I did try using expect but the logs were mangled. I think I missed that
> there can be multilple \r. I managed to get close to the wanted behavior
> with the below, but the Xen logs are still missing and I don't know why. 
> 
> https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/7617161552

Well, it just looks like the output is duplicated, if you look at the
raw output:
https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/7617161552/raw

So I don't know if it's possible to edit the output before `expect`
prints it. It probably is, but not easy to do.

I did try to edit the command line to change QEMU's output:
    -eval spawn $env(QEMU_CMD)
    +spawn sh -c "$env(QEMU_CMD) | sed s/\\\\r\\\\+//"

But then many failure, probably because expect can't interact with qemu
anymore.

So I guess `sed` the output of `expect` will do. Maybe put that in a
script that also call the expect script? (To avoid duplication, and help
with maintainability of the whole thing.)

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

