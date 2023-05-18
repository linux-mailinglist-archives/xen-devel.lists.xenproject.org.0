Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 098FA708582
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 18:02:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536449.834791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzg4i-0006cC-9h; Thu, 18 May 2023 16:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536449.834791; Thu, 18 May 2023 16:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzg4i-0006aK-6Q; Thu, 18 May 2023 16:01:56 +0000
Received: by outflank-mailman (input) for mailman id 536449;
 Thu, 18 May 2023 16:01:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CvkS=BH=citrix.com=prvs=495754ba3=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pzg4h-0006In-5P
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 16:01:55 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d8768a7-f595-11ed-b22c-6b7b168915f2;
 Thu, 18 May 2023 18:01:53 +0200 (CEST)
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
X-Inumbo-ID: 4d8768a7-f595-11ed-b22c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684425713;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q2xGzEM6PVAM5NYwRSzGWmWCN2ifAS7zDZYHRybU8xs=;
  b=Q0es/77bDluoc6txRTfR6BktLj1m0FkHsI5DuwuuwAbiDY3EAxYNO9py
   SpYTZVXallU18wvi/+LgbsQKls4ohd/Z+sc9ddfE/8e97WKN5nxH9xL+S
   CnEnfCJmbt0cxNDW3cx5Zq39CWBYangy0L/6KaJUYO2yl7dwL5r62TWam
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109940866
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:PSjrz6OlcuU47EbvrR1El8FynXyQoLVcMsEvi/4bfWQNrUomgzUBm
 mUbDzvQOv6La2GnKohwao+0/B4A7JfSytY2GQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tF5wxmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0tp4DFsJ0
 fY2EQImXC6zq+uHn+ilavY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUoXSFJQJxhbG+
 Aoq+UzgJxxFLcCB1wagqEmguuPykX/jXLANQejQGvlC3wTImz175ActfUW6ouOwjwixUshfN
 EUQ0iMroe4580nDZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpc8c6vcU7QTgr0
 F6hnN7zAzFr9rqPRhq187afrTq2fy8PP2IGTSYBQU0O5NyLiJ43pgLCSJBkCqHdpt/6Azbr2
 BiRsTMzwb4UiKYj3r2251ndjxqwp5LCSUg+4QC/Y46+xlonPsj/PdXusAWFq68ad+51U2Vto
 lA4lMWkq8QEI6i/vx6zcMkELe7z+daaZWi0bUFUI7Et8DGk+niGdI9W4S1jKEoBDvvoaQMFc
 2eI51oPucY70G+CKPYuPtnvU5hCIb3IT4yNaxzCUjZZjnGdniej9TomW0Of1nuFfKMEwfBmY
 sfznSpB4B8n5UVbINieHb91PVwDnHpWKYbvqXfTkXyaPUK2PiL9dFv8GALmghoFxK2Fuh7J1
 N1UKtGHzR5SOMWnPHmLqtJDcAlScSFjbXwTlyCwXr/rH+abMDt5V6+5LU0JIOSJYJi5Zs+Xp
 yrgCye0OXL0hGHdKBXiV02PnIjHBM4lxVpiZHxEALpd8yR7CWpZxPtFJsRfkHhO3LAL8MOYu
 NFZIpzaWqwSF2SWk9nfBLGkxLFfmN2QrVrmF0KYjPIXJvaMmyShFgfYQzbS
IronPort-HdrOrdr: A9a23:y23s2a0kIKgLiV8WPZILcwqjBLwkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnO7f6gylNyri9vNMkY
 dMGpIObOEY1GIK7/rH3A==
X-Talos-CUID: 9a23:KOs9lG32l3g5SUZ9amL0sbxfJs8oSDr5xlnpEWSKN1ZFQYzKE0Gw5/Yx
X-Talos-MUID: 9a23:fE1x4wRkyQVTit71RXT1oTw9Ldt2/ZiLUnsBrZk7t5WcMR5vbmI=
X-IronPort-AV: E=Sophos;i="5.99,285,1677560400"; 
   d="scan'208";a="109940866"
Date: Thu, 18 May 2023 17:01:47 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>
CC: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<michal.orzel@amd.com>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [XEN][PATCH v6 18/19] tools/libs/light: Implement new libxl
 functions for device tree overlay ops
Message-ID: <009387b9-4a51-4731-bb13-c1b388860a88@perard>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-19-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230502233650.20121-19-vikram.garhwal@amd.com>

On Tue, May 02, 2023 at 04:36:49PM -0700, Vikram Garhwal wrote:
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

-- 
Anthony PERARD

