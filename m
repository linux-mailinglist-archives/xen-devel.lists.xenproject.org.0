Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ADA2F2E7F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 12:59:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65650.116341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzIJp-0000TS-49; Tue, 12 Jan 2021 11:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65650.116341; Tue, 12 Jan 2021 11:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzIJp-0000T3-0w; Tue, 12 Jan 2021 11:58:37 +0000
Received: by outflank-mailman (input) for mailman id 65650;
 Tue, 12 Jan 2021 11:58:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5SK+=GP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kzIJn-0000Sx-Bn
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 11:58:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4aa8bfbe-eb39-44b5-a632-b1d236157777;
 Tue, 12 Jan 2021 11:58:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CD5B4AD1E;
 Tue, 12 Jan 2021 11:58:33 +0000 (UTC)
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
X-Inumbo-ID: 4aa8bfbe-eb39-44b5-a632-b1d236157777
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610452713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=24WTEqhvoXhvdaUUNKP/ICq63f/IHvQX9uZYLiNYUx4=;
	b=cmvsbd3Qm1y5wByi+caZ+yobbk1Yhp0YEMiby3vEWLekPTaf68s+mypRMh66ud+XO4bEqo
	1Fh0q/163j2M4CcAJj0idYkGOiWRW04NWVRoabWXcmLvu/AsddGWNVlayOKBPowcISOBmg
	22KgHGSJ/mTn/jMtxWw68SbH+Oyc4nI=
Subject: Re: [PATCH 2/6] x86/mm: p2m_add_foreign() is HVM-only
To: Oleksandr <olekstysh@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
 <cf4569c5-a9c5-7b4b-d576-d1521c369418@suse.com>
 <f736244b-ece7-af35-1517-2e5fdd9705c7@citrix.com>
 <e2ee99fc-e3f8-bdaf-fe4a-d048da34731a@suse.com>
 <b4abbe2f-5e3d-5f43-80b8-cfa3fd97061e@citrix.com>
 <CAPD2p-nZyf_i_bGh5sSs2fC4S7nxB1Mk_zbSKtqF=zvBOp3X+Q@mail.gmail.com>
 <2dcbe286-4112-e4b3-dc12-9691154365b3@suse.com>
 <448a6ef3-2cbd-da9c-e4ef-88122d246833@gmail.com>
 <18c21c64-d350-482a-c778-c8478d3daf2c@suse.com>
 <c8315e16-6130-e990-3d16-d0d42b2f92c4@gmail.com>
 <ec041f81-4b80-5ffb-8219-6732f50bef36@suse.com>
 <f6f1ffdd-619d-017e-6820-276814056845@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <257224ea-4ba3-302e-e198-e92c8c1036b3@suse.com>
Date: Tue, 12 Jan 2021 12:58:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f6f1ffdd-619d-017e-6820-276814056845@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.01.2021 09:23, Oleksandr wrote:
> On 11.01.21 09:41, Jan Beulich wrote:
>> If you could also provide your exact .config, I could see whether I
>> can repro here with some of the gcc5 versions I have laying around.
> 
> Please see attached

Builds perfectly fine with 5.4.0 here.

Jan


