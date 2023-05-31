Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1274D717D3D
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 12:36:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541714.844732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4JAc-0007WK-CZ; Wed, 31 May 2023 10:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541714.844732; Wed, 31 May 2023 10:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4JAc-0007Uf-9i; Wed, 31 May 2023 10:35:10 +0000
Received: by outflank-mailman (input) for mailman id 541714;
 Wed, 31 May 2023 10:35:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZHTS=BU=bounce.vates.fr=bounce-md_30504962.647722d9.v1-5d095d79e9f04458b3251c8f8a0efadc@srs-se1.protection.inumbo.net>)
 id 1q4JAb-0007UZ-Bw
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 10:35:09 +0000
Received: from mail5.us4.mandrillapp.com (mail5.us4.mandrillapp.com
 [205.201.136.5]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf0de643-ff9e-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 12:35:07 +0200 (CEST)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail5.us4.mandrillapp.com (Mailchimp) with ESMTP id 4QWQd54qYczDRYW5k
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 10:35:05 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5d095d79e9f04458b3251c8f8a0efadc; Wed, 31 May 2023 10:35:05 +0000
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
X-Inumbo-ID: cf0de643-ff9e-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1685529305; x=1685789805; i=yann.dirson@vates.fr;
	bh=6esGehIgFwWl9LvAG7GFoLkEcUZ39SrurMvnn+v971U=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=BcgoHN3CcLVgwmHQqLVpyZZY5G1VHfCz0PTPQNEIDM10oRevdP73a4KVLxo1xPfkG
	 JiIvGoGbFiJUMunxvD8vPFbc0IZ4dV0sgqLl3D3+H3ZvFWOddtsoZhGVk08deMkCT7
	 w20n84Cs+aJh9HISOy94+oSuDAAJpgrZHaHUYkmQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1685529305; h=From : 
 Subject : To : Cc : Message-Id : Date : MIME-Version : Content-Type : 
 Content-Transfer-Encoding : From : Subject : Date : X-Mandrill-User : 
 List-Unsubscribe; bh=6esGehIgFwWl9LvAG7GFoLkEcUZ39SrurMvnn+v971U=; 
 b=TOY2Gf0rGNuiV6pm5lTIHRqL36lasWRT1NC5JXC6Ni9iV+de2Kq67WDwjlee0K3q95k5Hq
 7kUp6sYFL2629fzxl+eEcLZlC0LgByP8GJ1t1cZVIzY9Fm4jl0hRNTCsU7kNrwZ8Kd5JmxNA
 3X1eYo2Np69aSTpyfV3sCdtoU3KRI=
From: Yann Dirson <yann.dirson@vates.fr>
Subject: =?utf-8?Q?[PATCH=200/1]=20RFC:=20clarify=20intended=20usage=20of=20~/control/=20xentore=20path?=
X-Mailer: git-send-email 2.30.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 9f954236-9dc1-4070-9d34-807dea7ccea1
X-Bm-Transport-Timestamp: 1685529304177
To: xen-devel@lists.xenproject.org
Cc: Yann Dirson <yann.dirson@vates.fr>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-Id: <20230531103427.1551719-1-yann.dirson@vates.fr>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5d095d79e9f04458b3251c8f8a0efadc?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20230531:md
Date: Wed, 31 May 2023 10:35:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This proposal, spurred by a discrepancy between how toolstacks handles
the control nodes, tries to summarize what I understand to be the
spirit of ~/control/, from its children already described in the
xenstore-paths document, and from the libxl behaviour.

Yann Dirson (1):
  doc: clarify intended usage of ~/control/ xentore path

 docs/misc/xenstore-paths.pandoc | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

-- 
2.30.2



Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions
w: vates.fr | xcp-ng.org | xen-orchestra.com

