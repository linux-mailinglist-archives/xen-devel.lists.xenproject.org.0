Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 431F2959BF3
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 14:37:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781112.1190678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgkZi-0001GW-VL; Wed, 21 Aug 2024 12:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781112.1190678; Wed, 21 Aug 2024 12:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgkZi-0001EN-QN; Wed, 21 Aug 2024 12:36:30 +0000
Received: by outflank-mailman (input) for mailman id 781112;
 Wed, 21 Aug 2024 12:36:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zhuR=PU=bounce.vates.tech=bounce-md_30504962.66c5df4a.v1-7431de53ceb449429d65e95305e54f00@srs-se1.protection.inumbo.net>)
 id 1sgkZg-00019r-UP
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 12:36:28 +0000
Received: from mail186-11.suw21.mandrillapp.com
 (mail186-11.suw21.mandrillapp.com [198.2.186.11])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbbb97f3-5fb9-11ef-a508-bb4a2ccca743;
 Wed, 21 Aug 2024 14:36:27 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-11.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4Wpm6L2v8yzLfH5Wr
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2024 12:36:26 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7431de53ceb449429d65e95305e54f00; Wed, 21 Aug 2024 12:36:26 +0000
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
X-Inumbo-ID: fbbb97f3-5fb9-11ef-a508-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1724243786; x=1724504286;
	bh=Z+5IsVCfhNP07iFXr4NEdc8vMTe9QKmq6fNdWwknhoQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Gmj5ETu91gsDh2kX/mQM5H+Wfz4cfzQ+rACQCEqgFl/xUImfGDMw5AUILZXGQow79
	 BWDTklowGX2GebA2JEaY8vPG/0r1I3m3rqFNyb7g20eyIJYFemgCRsdmaNxGkE2bwg
	 H+mRhZkTsgHSq9M4KWT4E1SIU+47m+e3LNI7eF8CWbxG09nIE1KSzis0pGdBQgkzAU
	 X1O6td0lp5izy3b7T+TAA2JhsR5VE+8jfMR5nTTJBXkM9wsL5fQ64olZVYDfLxq41G
	 4Rqj+wGtZbiZkXx8wyReYip5AaZClpSRFdzCBgVXGP86jT/NgnGTVmNemxfLH2GsxH
	 pV8j5mtUVSQBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1724243786; x=1724504286; i=anthony.perard@vates.tech;
	bh=Z+5IsVCfhNP07iFXr4NEdc8vMTe9QKmq6fNdWwknhoQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=OJtRR8Jw1gK7lPU+4qVLD2ODWc+JcUFwI/CbB0XERJc81gbASXi8FKCLqwhe9nOGg
	 ZkTCTCzqOZSBAZWMxYhksw1Xlz8MBcRV/iLlAgyuyO1meuKnC0xGPwJOv1Xz6+6N0v
	 IpDW/7AFpTPCX1gej3aNUM4T/i0QA29Hf7epOsLeNbxTB527a/fqRRxRo/oxlS2qg2
	 WNswCRoaaG7ulmZ8Wfuu5YHP/YDPrA/yJnO7DFEWejwMbX/fC9AGhcriBNvF/ONrbk
	 wnOK2MN3jnv11MHOfb+lo+Y1dskPGg7RlF6xx9xZ7qvnXr03//pphLG5W+qTRrw4iy
	 v7ES0O1XesDkQ==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2]=20tools/helpers/init-dom0less:=20fix=20vcpu=20availability?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1724243785920
To: Amneesh Singh <a-singh21@ti.com>
Cc: xen-devel@lists.xenproject.org
Message-Id: <ZsXfSdnbx2qhbuXp@l14>
References: <20240820080416.323725-1-a-singh21@ti.com> <ZsTDJhcfFpm23oHO@l14> <y46y7zqfepuvbw3tniqkr5yepcqbvkbyj6mfj3tj4p3ylo7pg3@23plq2f3jboj>
In-Reply-To: <y46y7zqfepuvbw3tniqkr5yepcqbvkbyj6mfj3tj4p3ylo7pg3@23plq2f3jboj>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7431de53ceb449429d65e95305e54f00?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240821:md
Date: Wed, 21 Aug 2024 12:36:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Wed, Aug 21, 2024 at 11:08:59AM +0530, Amneesh Singh wrote:
> On 16:24-20240820, Anthony PERARD wrote:
> > On Tue, Aug 20, 2024 at 01:34:17PM +0530, Amneesh Singh wrote:
> > > @@ -330,14 +336,24 @@ int main(int argc, char **argv)
> > >
> > >      for (i = 0; i < nb_vm; i++) {
> > >          domid_t domid = info[i].domid;
> > > +        libxl_vcpuinfo *vcpuinfo;
> > > +        int nb_vcpu = 0, nr_cpus = 0;
> > > +
> > >
> > >          /* Don't need to check for Dom0 */
> > >          if (!domid)
> > >              continue;
> > >
> > > +        vcpuinfo = libxl_list_vcpu(ctx, domid, &nb_vcpu, &nr_cpus);
> > > +
> > > +        if (!vcpuinfo) {
> > > +          fprintf(stderr, "libxl_list_vcpu failed.\n");
> > > +          nb_vcpu = 0;
> > 
> > Is there any value to keep going if libxl_list_vcpu() fails?
> > Or is the reasoning is that cpu/*/availability was broken before, so
> > it's not important enough to stop init-dom0less?
> Yes, so missing cpu/*/availability nodes would mean we cannot
> pin/remove/add vcpus using xenlight I believe. However, we can still
> hotplug other stuff like net or block devices. In fact, I was doing
> exactly this when cpu/*/availability was broken.

Without the "availability" nodes, it probably mean that guest (probably
PV ones) will just use all available CPUs, it seems that Linux is doing
that, and only disable CPUs that are explicitly marked as "offline" via
that node.

But I guess it's ok.

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

