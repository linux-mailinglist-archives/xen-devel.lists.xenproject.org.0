Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F1C962A41
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 16:29:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784908.1194321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjJfV-0006eR-Kg; Wed, 28 Aug 2024 14:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784908.1194321; Wed, 28 Aug 2024 14:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjJfV-0006bn-Hj; Wed, 28 Aug 2024 14:29:05 +0000
Received: by outflank-mailman (input) for mailman id 784908;
 Wed, 28 Aug 2024 14:29:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBH1=P3=bounce.vates.tech=bounce-md_30504962.66cf342c.v1-a0a6dfb6c83541049680e3dfd81c52eb@srs-se1.protection.inumbo.net>)
 id 1sjJfT-0005vz-MC
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 14:29:04 +0000
Received: from mail187-32.suw11.mandrillapp.com
 (mail187-32.suw11.mandrillapp.com [198.2.187.32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de59e257-6549-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 16:29:01 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-32.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4Wv6H01R8JzQXg8kD
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 14:29:00 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a0a6dfb6c83541049680e3dfd81c52eb; Wed, 28 Aug 2024 14:29:00 +0000
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
X-Inumbo-ID: de59e257-6549-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1724855340; x=1725115840;
	bh=HhiV0BNU0RIa9UKRXwsR/IwnP8IZKOE7MjdjteLDQUc=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=bpZeitchsHNxbP6mPNEZnLDqKrIgoKisUsnRce27ClkpZKnihaOwBt6K3EHfILrWn
	 rBCQsO5/oyBTFXhFi0Iq8Mezgpq63Ej3CG6rfRjr8R0qa/99wU1dVCjn/+4u7/zrma
	 m51mHmUjtLyXv0dRaSTAo7bJCQA23o/2ez871wcz2jdoAKXFq/ecDxq8PTrQITqYwp
	 oMTFbPsGcy60f9GK0jLP0ERYftj8gQS4eahFSUgpXRVE9YJywOxrRVMtGcVM0AzOmA
	 GVF5wy7CgGwHGOCSueqfQeADpuXbl0lqaxwHmyNcPJ17Mc9AOGY3Ok45MUBnAxnikB
	 RVNJCep43JNvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1724855340; x=1725115840; i=anthony.perard@vates.tech;
	bh=HhiV0BNU0RIa9UKRXwsR/IwnP8IZKOE7MjdjteLDQUc=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GazoneEVbafukXfRUcEjsjN7vBTL+HZlEl6Ok7NeVgIFQetaU/DMXS5TXz6pYe+iI
	 2S/4xHufSCCMkEtUzhOL1uOW/jWbxZUNE/Hs9NJGL9bQy5J4byhUY4yRQ0N9S1IfIz
	 6h5gJYPKc6dYCLC39irJyFQ2onVb91xn/JdoY4L73YQ5r2UUtZyCf/Jk+K8MqCJgCO
	 M8xgGtAxzl7Qd60rDaHcm1y8MieXNg04H3K/jHojAdeZf3HU8ZoRpgEgRb9qXLmJ3R
	 nxepQdp0S/lKn3N9h8sJVe9S6ap3pGPALUyff/EaOFCr2jf1+UnqsUIszBlTYmx8Ae
	 a3iCGaNP8Emug==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=201/3]=20libxl:=20Implement=20QEMU=20command=20line=20probe?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1724855339193
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Message-Id: <Zs80Ktc/PfSFrmwu@l14>
References: <20240827100328.23216-1-anthony.perard@vates.tech> <20240827100328.23216-2-anthony.perard@vates.tech> <ebef6a88-abae-4e9a-8f9f-56eddb5a569c@amd.com>
In-Reply-To: <ebef6a88-abae-4e9a-8f9f-56eddb5a569c@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a0a6dfb6c83541049680e3dfd81c52eb?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240828:md
Date: Wed, 28 Aug 2024 14:29:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Aug 27, 2024 at 06:17:05PM -0400, Jason Andryuk wrote:
> On 2024-08-27 06:03, Anthony PERARD wrote:
> > From: Anthony PERARD <anthony.perard@citrix.com>
> > 
> > Starting with QEMU 9.0, the option "-chroot", that we use for the
> > "dmrestrict" feature, is removed. We need to find out which to use
> > between "-chroot" and "-run-with chroot=dir".
> > 
> > This patch implement the machinery to spawn QEMU, and to run the QMP
> > command "query-command-line-options" but doesn't yet look at the
> > actual result. Whether or not to use "-run-with chroot=dir" will be
> > implemented in a follow up patch.
> > 
> > The command line used to spawn the qemu we want to probe is mostly
> > similar to the one we already use for the device model, "-machine
> > none" comes from libvirt.
> > 
> > This patch implement the probing on qemu-xen, even if we probably not
> > going to use the result. We could check the feature wanted for the
> > domain been created, but this could get complicated fairly quickly.
> 
> "domain being created"?

Yes.

> > We already need to check the options "b_info->dm_restrict" for
> > "-chroot" and "state->dm_runas" for "-runas" (which is deprecated).
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

