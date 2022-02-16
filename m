Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B644B936A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 23:00:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274427.469893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKSL5-0001HA-En; Wed, 16 Feb 2022 21:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274427.469893; Wed, 16 Feb 2022 21:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKSL5-0001EV-Bk; Wed, 16 Feb 2022 21:59:55 +0000
Received: by outflank-mailman (input) for mailman id 274427;
 Wed, 16 Feb 2022 21:59:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6VyC=S7=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nKSL4-0001EN-Fi
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 21:59:54 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c43f96eb-8f73-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 22:59:53 +0100 (CET)
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
X-Inumbo-ID: c43f96eb-8f73-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645048793;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=lz7K2ltQNzFGFu55w3iG0G/eidwsqwDIT34Zd0SFUIE=;
  b=CKf1Lyql0A2WzH+1Noto7ymS+P+rTX4t4LSA+Uiqp1Jy32dZWxD07r2m
   sr302EqlrcrXv8eXL/SOGcUaDwba4lEU0I2ZgUn9hI4L3IdiLqIUl4vfi
   tjodv7jnHmIbCq6i5eVjPicVnxQQ0XvzjfcKKyMDCKTPr6gGbDNHSxNjO
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /zBoNJfBC5Po0FR/6Tg+YuXKwf6kwPlJMOBbtRMHHzV/b5iy7r8ngpA4xlrGmpgxf/owLY1Ngq
 Cn7DABKDjmnYoxTdBFGgFrlO/ex1QKWNqNCvZ1o8GTyus3qbYCaWEqpMNfPRrZwcEEAH6XMDzV
 fzYL1r2X38++KNCXxCAGorZ2K89SxJEtSTQowEHg10LL+qPJTmxc+Bx235/t2QnXCc7taTpGCI
 EFNKHARObsTW3wmz/Q3uln7JkHt8Im06mEQsTpGJ52G7+jkdqWIA5gQTv4C2pm9iluXICpfuVG
 T20w5vGksgJgMFPlrdMK3rHV
X-SBRS: 5.1
X-MesageID: 64283660
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:g5okI6M7HeVs5MPvrR32kcFynXyQoLVcMsEvi/4bfWQNrUoh0WAGn
 WJJUWrUP//bM2X8LYtzao+x9UpVvpCHnd5nTAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500s9w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxqTpY5p5
 fZSj7mbeCQ1M7LLk8Y5SjANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgmtq1psQQ662i
 8wxOTZTZyzKUhN1Ig1IEo0Dp+frm1LBSmgNwL6SjfVuuDWCpOBr65DhKMHQe8CKbcxNk1yEu
 3nd+GDkHhAdMsfZwj2AmlquifXIhjjTQ58JGfuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDS9DnWhSirX2svxgCWsFRGek39AGMzKXP5w+TQGMDS1Zpd9gOpMIwAzsw2
 TehndnkGDhuu729Um+G+/GfqjbaESoIKW4PYwcUQA1D5MPsyKkolQ7GRNtnFK+zj/X2FCv2z
 jTMqzIx74j/luZSif/9pwqexWvx+N6ZFWbZ+zk7QEqK9DknfKOGeLaNwmn48ftfK427akCo6
 S1sd9el0MgCCpSElSqoSeoLHa206/vtDAAwkWKDDLF6qW3zpifLkZR4pWgneRw3appslSrBP
 ReL0T698qO/K5dDgUVfR4uqQ/onwqH7fTgOfqCFN4EeCnSdmeLuwc2PWaJy9z21+KTPuftmU
 Xt+TSpKJSxHYUiA5GDrL9rxKZdxmkgDKZr7HPgXNSiP37uEf2KyQrwYKlaIZe1RxPra/FmEr
 o8FZprbkk83vAjCjs//q9N7wbcidyZTOHwLg5YPKr7rzvRORAnN9MM9MZt+Itc4zsy5Z8/D/
 22nW18w9bYMrSavFOl+UVg6MOmHdc8m9RoTZHVwVX71iylLSdv+t883KspoFYTLAcQ+lJaYu
 dFeIJ7eahmOIxyakwkggW7V9twyLk/62ljXYkJIolEXJvZdeuAAwfe9FiPH/ygSFCun88w4p
 ryrzATARpQfAQ9lCa7rhDiHljtdZFARx7B/WVXmON5WdBm++YRmMXWp3PQ2P9sNOVPIwT7Dj
 1SaBhIRpO/spY4p8YaW2fDY/tnxS+YuTFBHG2T77KqtMXWI9GSU3oIdAv2DeirQVT2o9fz6N
 /lV1fz1LNYOgE1O79hnC79uwK9nv4nvqrZWwx5KBnLOa1j3WLpsLmPfhZtEt7FXx68fsgyzA
 xrd9t5fMLSPGcXkDF9Oe1Z1MrXdjakZw2CA4+40LUP24D5M0ICGCUgCbQORjCF9LaduNN93y
 +kWp8NLuRe0jQAnM4jag3kMpXiMNHEJT44uqooeXN3wkgMux1xPPc7cByvx7M3dYtlAKBB3c
 Dqdha6EjLVA3EvSNXE0ECGVj+ZagJ0PvjFMzUMDeAvVyoaU2Kdv0U0D6ykzQyRU0g5DgrB6N
 WVcPkFoIbmDomVzj89ZUmHwQwxMCXV1IKAqJ4flQIEBc3SVaw==
IronPort-HdrOrdr: A9a23:kVBsaaoX2U/AQj+oAVx6sqEaV5uPL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssSkb6K290KnpewK4yXbsibNhc4tKLzOWxFdAS7sSrLcKogeQVBEWk9Qy6U
 4OSdkGNDSdNykYsS++2njDLz9C+qjGzEnLv5an854Fd2gDAMsAjzuRSDzraXGeLDM2X6bRf6
 Dsgvav0gDQH0j/Gf7LYUXtMdKzxeHjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoi2X
 KtqX272oyT99WAjjPM3W7a6Jpb3PH7zMFYOcCKgs8Jbh3xlweTYph7UbHqhkF2nAjv0idurD
 D/mWZmAy1B0QKWQohzm2q15+DU6kdr15Yl8y7BvZKsm72jeNtwMbs/uWsQSGqm16NnhqAg7E
 sD5RPoi3IcZymw7RjV9pzGUQpnmVGzpmdnmekPj2ZHWY9bc7NJq5cDlXklWqvoMRiKoLzPKt
 MeR/00JcwmBW+yfjTcpC1i0dasVnM8ElOPRVUDoNWc13xTkGpix0UVycQDljNYnahNB6Vs9q
 DBKOBlhbtORsgZYeZ0A/oAW9K+DijITQjXOGyfLFz7HOUMOm7LqZTw/LIpjdvaNaAg3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTXTGC0TV3Wu4hjDlhCy8vBrZbQQF++oWEV4rydSq8kc77mst
 6ISedrP8M=
X-IronPort-AV: E=Sophos;i="5.88,374,1635220800"; 
   d="scan'208";a="64283660"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPaAFVqsPrBekjiCiEEIfL0ppY+3vfS5vzNOMyIzMwF3t4KHdF/HjiYxQBu1ROVBKlQXpYRKaCfnVxRbXQbpIKI2y3q7j1RMI6EmUKCg+YHrljmruXjKtOlU5zNr5KOVdrPLI+9I4uV5G4+nELHbVSQY9qBi6tSJBdyi1LVtEWbyuKDxOc1Fhg/MxtoOQ4ljFc6ockT4R5RHi6Dk5zHnljfCyQ/5j59wMjMmy6gNtSebTvL/AFE9CAP+SImuWbrBWcMFX0PSLJzoiWRcqeKjwST75lAb1asz68WoMYRSQKeTosximY5b3+rx7V37Hxa7lI0jvVe/5uB1wf+ZAnG90A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lz7K2ltQNzFGFu55w3iG0G/eidwsqwDIT34Zd0SFUIE=;
 b=c1Dixyo7HBcYOI3s62cxskry01BLbsddT1JHDhJS8ODLDIRqRJK0rp0lug707C3weqrHnlKzej0OnRYoeiDScTcKkhYTt+A3oMykGKzvxcyH+K4WJ4ycI5E4xMwOstb0Ryh15lXRwivtLjSWo/KLBuJOXxRX1ioipsZ6mzsZ9bbtlj8SWPGg3qh2eAr1c0kxLRSfifMtSAzO3V3eWuope5dx/xpAUN+Ey72YMd6iS+MNxPLvn+7g6I6GgPanacAy9UMJjvjSmE3FAEJRipqJgVKoGKJMTm+FvF3USNJ18oGzvExgCKhHZuylTI1uAIlG+gyLEV5tv6hra09UCiXnnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lz7K2ltQNzFGFu55w3iG0G/eidwsqwDIT34Zd0SFUIE=;
 b=S+uNRrO2vXlddlH68cMOZB+Xzeoigbsu1+3zO8t0jL+9m7KhhkzpN/3ExZzt2zYJqPTFA+JdoUrHqC+NtCA99Tbqg3UTsUlQ6t5gRJPNNSLBQaYARudFq+EZ4EU3t84q2hqBgU6VhsmZ/p+VQyOETB3BikMVsYK71TAdpZEzRKo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Juergen Gross <jgross@suse.com>, Daniel Smith
	<dpsmith@apertussolutions.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 00/70] x86: Support for CET Indirect Branch Tracking
Thread-Topic: [PATCH v2 00/70] x86: Support for CET Indirect Branch Tracking
Thread-Index: AQHYIaGi+1XAXGQfKUGTLygtpBu/SKyTBUWAgAAJC4CAAAkaAIAABn4AgAOf2oA=
Date: Wed, 16 Feb 2022 21:59:47 +0000
Message-ID: <9bcbd2f9-f713-cb56-abdd-baef5180a964@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <c471dcc2-8a91-60b8-ba5d-58874752e4d7@citrix.com>
 <218de2dc-6dd8-4e13-3288-36448e47de7f@suse.com>
 <8c6dd7d0-11e6-9b8a-66fc-f1a4998c074b@citrix.com>
 <83e15c5d-f48b-a6f2-ebca-e416bdef1093@suse.com>
In-Reply-To: <83e15c5d-f48b-a6f2-ebca-e416bdef1093@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 846026e6-20a3-4c16-0dd4-08d9f197a5f5
x-ms-traffictypediagnostic: BN6PR03MB3233:EE_
x-microsoft-antispam-prvs: <BN6PR03MB3233E5FA193BC0B166A9C855BA359@BN6PR03MB3233.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qW7/N7yEe+1gzx+iqkYjj3/HoE1i/2Y+QHKRWdxvVMZP271t8uU7gVqgQ15Yw7bJewGvAdaN19BMENnbxY2mro83ZFG0emkw4gQ/QEcDORk/FkCj8f3pg1g+/Kuctw/CPzDYjPO0p3D9EWb8IbkpamH55aW7Kcv7o1Lo45+OIOfF7mAFYOTxZQiOb7voQAyCH/x5MvM/crjm4PKHenr0YJzoMuTw3RSPGj5DwMC1wiF56JnkVuperR47YJokrBOWQyFAvhhFIAwdMjjHeG9t7B3Sbmt5cnvgW/1QwnzCQoONIvibDGPD3qu4D0ywQzr6nEe91vIFGc7QugGBnhg+Jax/UTPsrHWozMQaVdIORTwvp5me4IA7pBBfKPXET7LojkGHz01sXWJ/Sr65rDc2VqOmo4EDZmwGN+eL8iBuPUwog7ft+Q9l8PByHT7iVQGezm8w18b1mTnnIaa4W2UTkvPhheeoL49zXQ6BrDlGwbUaDK6hZLsbSSwfMr+m0F/4+aikFyCqP7xDjBmDRHf0pDRgD5g0xen1sNLYhKswtTgPlosFVGhMguttXo3jAbruACSX0oQ0pCbAko/E+Wv1iA2siNz6NNzKRN3kWrOORfvowmkEzUnyGBUWt7gbgQ5N1IS5L2ZflOWu7lvuZSJ/q+xWull7xiF2BCaHR07blV5uadziZiGVjy80TBdyyS5g2EeT8rcICSdLpLfjYm5JY5+TL1dGYtzIF9R9/KAQzwpoPSSYfkPNyZc48bt8LAS32yuwnUyxfmpvXDSXOMlcdR87NN/ilYLtZ+pTDU/pyIfmIqSuQGPE+jcxQG2XqapJcUyilM2tg+LWKnp3bPMc1jIOrygFVr/otM/oRfxT6B8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(82960400001)(8936002)(5660300002)(54906003)(122000001)(38100700002)(6486002)(26005)(186003)(966005)(71200400001)(6512007)(6506007)(53546011)(2616005)(508600001)(66476007)(66446008)(8676002)(38070700005)(316002)(4326008)(64756008)(66556008)(91956017)(66946007)(76116006)(110136005)(31696002)(31686004)(2906002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0dxY2VpY2Y5UnZKQ2NBZmtVb1pBMXc5YVRJc05RL0dRNTAzTkFXakFZSG83?=
 =?utf-8?B?MUR5ZlRWdHppTm9pcjlrSkVIWmhmc0h3aklhcXg4NGYvVWtLTC9kWWRCS2Vy?=
 =?utf-8?B?SkloMUxidGFHbkxrNzgwcWd3RXdRM2t6Z3lNbWsxSFJKSytFaERjWGFzOUFW?=
 =?utf-8?B?dTJKSlFKTHRadlZ2VXNwMU11Vk9ydHFXUFBXUlpqaFEycVNwRVVUYmE3MGFr?=
 =?utf-8?B?Z2dHQ0UxUGVuN2Rtd0NHMStMckVyN3RocDhLaUJXaGtXcXk5QTJNZUxIZHRH?=
 =?utf-8?B?b1pENnY0U3BXeis1eHo5QkxvbnNFSUx4cW9pWGhpT2V3VWlZeElBQjBBWHRn?=
 =?utf-8?B?WFBTbzI5ZWVmM2VzN1JTbWpyVE9zS3g2TGhVd1pYMFh2RFJZN0c3cXZJelM5?=
 =?utf-8?B?cllvQ25RLy9OTklPcG16VXNyWnREOUUzL3MzaDl2SVFmSzIvTVk4dGRsS3ND?=
 =?utf-8?B?WEs5Q09CdzZsd0Rob3VhOHdITGc4UmF0YWtsODViNmtGb2c2QlJMU0p2NTFr?=
 =?utf-8?B?dnFiMy8rS0FDYmRpZWJHNTl6U25BVzV2MDZ3NUt3cU9QdU5VeTBaaHk5Vkpw?=
 =?utf-8?B?YTNhVXdDcjVaaG5LVm5JTXk0aFRXaE9jbms2MzhoRUhoZlpMb2dkYlR4WjNh?=
 =?utf-8?B?TDNkRWhkVVp3cEdxM1paQ3VxbFhXa2VCNW00K3Z5Uml2YlpHVEVaVkp2ZktP?=
 =?utf-8?B?MkluRk9nNXhQdXlKUFhrNGxWUE1mcmZLbHRUczFJT2c4RUs1MDFBaDdjenRG?=
 =?utf-8?B?Y3dIVVJXYTkwaStqeGVPRVB3TG1mZVR6cE55NFA0KzI5OCtvK1MrR3A1SGho?=
 =?utf-8?B?cE5YMWdvV3ovQ0NxRnFQQ3Vpa3ZjZ2hjQ1NNbGZVSDdVQWZhMS9ndXlhSmNk?=
 =?utf-8?B?NkM0TFdVcm1QdGNDbUlDbVNRckFQUUFNWUtJMDNpQ1k3bnJnL3RpZEF2M0VW?=
 =?utf-8?B?SDJZazJWWHBBNURDeXRoNlU0VEtNUXZYVFFidkd2YjljTDFqckhjVkpSc0tp?=
 =?utf-8?B?OERmSkI3eEwycXY1ZDArTXhGL0ZiNHplQUtyZlRqTGhoRjRHWGltclZxNEVx?=
 =?utf-8?B?dDJvNzVobU9IeTVRY0huOVBWK1UwanhBd1VvKzR4eE02bU94NkdEcUxVbHVK?=
 =?utf-8?B?Z1FUSDZlWlFUUHpwcDB2K3pBNHV4YXkyOEQ3K1BwU1UrL1pZVlFIenBuZHRP?=
 =?utf-8?B?YysyaVN2eTFIQzBFclNITTFHazEySW5VRHF6ZGJtd1h6Vy9sdHlseHA5SDlw?=
 =?utf-8?B?Qlp3REFCdVN3RXZYNGw4TG0zTytXNTc1ZzdjSVZhdURaYjdwZUQrVjZYdGpZ?=
 =?utf-8?B?VDkrNG0wUHBIdHJQOG5GMDlqUTFGSFZGZm53UzF1OU5kbkx1RENxZmo5TGRR?=
 =?utf-8?B?VExDMjVnSWxuUEJ4Vlp3UkxmRFVDSTdIRXpLc0xMNGtPdkNOdUtlSzNGaDN2?=
 =?utf-8?B?MlEwWWc3c21qcVAwWmxpWU1pTURzdG1NOHU2N0phdTFxMTBYZzV1RmIxOGJo?=
 =?utf-8?B?dUthS2J3ZjV4SEt0ODhCZWxKbkVNdFMycmhDUTFWbEVUY3ZZVXJTcmRXeGhx?=
 =?utf-8?B?L25QSGxSRVlIOVFIVkhSMUMwRjAxdXlEM0F4cGZGT2JuT05FVTF6b1ZTMXRo?=
 =?utf-8?B?Rm9sSlE2UW8xRGsra01DTlZXK3BRdENHRjdYWjRzYjN0YU1WcStTZ2V2N1Bq?=
 =?utf-8?B?ak5QWFUrbW1pU2NFNHZGcmFwMWlwbjJXclZHazRaOFFWRjhidVdqWFlteUlt?=
 =?utf-8?B?Sk0yNWthaDhOSDdRSkx4b0JBUnpPaFZkUkgxWWNid1dqWXJGWU5sRTlPWHVD?=
 =?utf-8?B?SUJTbjQwMzBOeHNpc0tqWTQ5Wk9uZFR5cTl2Szk3TUR3NTYxRjhTQnZDUXFI?=
 =?utf-8?B?OUZLbStwK0tQVHE5MHR3ZXhmMTI1aDlXV2xVQTQ4TzJrK21aYmxOeGJQZmlO?=
 =?utf-8?B?QjZWbUd0N3BFL1A2S0Z4czNsVjl3L0tjRSs5TmFZeWROU0ZLTkJiVGRKVmUv?=
 =?utf-8?B?WDk1bnRzNnRyL25MbEJvQjBDbnlzNUtRdjZrbWduL3BWQnJYRHAvRkJQNlJB?=
 =?utf-8?B?Z1Z6Zm9QNituQklTMVhiV3dpV0ZZU2ZuL2V5SDZyL0pnNTRZZEFCVUMwMlQx?=
 =?utf-8?B?Ui9rRXhKQTFON3h1QUsxU3VLTnpiWitiWi9FWkk4VWprdEN2THVGcVJsSkh1?=
 =?utf-8?B?MnIzZVExTkhvc1R2QjJkaUphQW5NclU3dWR6WnRCNThUWEFQQUhPRGdJbmMz?=
 =?utf-8?B?MytqNFFSbVdHaGZwVFBIQ2pPTVd3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9B3641339785F4D82765FA4A10175EE@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 846026e6-20a3-4c16-0dd4-08d9f197a5f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2022 21:59:47.5510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Bzu9LZvS5gjtqb0DXAhjJWtAgziLBAYe1T6Xrp7qE9X3CgwKcC524usMYzp4ukIAJC7g6N9PeMqJokbewWLgL1sQV2BSVau0FWAutc8b54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3233
X-OriginatorOrg: citrix.com

T24gMTQvMDIvMjAyMiAxNDozOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE0LjAyLjIwMjIg
MTU6MTUsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxNC8wMi8yMDIyIDEzOjQzLCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAxNC4wMi4yMDIyIDE0OjEwLCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4+PiBPbiAxNC8wMi8yMDIyIDEyOjUwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+
Pj4gQ0VUIEluZGlyZWN0IEJyYW5jaCBUcmFja2luZyBpcyBhIGhhcmR3YXJlIGZlYXR1cmUgZGVz
aWduZWQgdG8gcHJvdGVjdCBhZ2FpbnN0DQo+Pj4+PiBmb3J3YXJkLWVkZ2UgY29udHJvbCBmbG93
IGhpamFja2luZyAoQ2FsbC9KdW1wIG9yaWVudGVkIHByb2dyYW1taW5nKSwgYW5kIGlzIGENCj4+
Pj4+IGNvbXBhbmlvbiBmZWF0dXJlIHRvIENFVCBTaGFkb3cgU3RhY2tzIGFkZGVkIGluIFhlbiA0
LjE0Lg0KPj4+Pj4NCj4+Pj4+IFBhdGNoZXMgMSB0aHJ1IDUgYXJlIHByZXJlcXVpc2l0ZXMuICBQ
YXRjaGVzIDYgdGhydSA2MCBhcmUgZmFpcmx5IG1lY2hhbmljYWwNCj4+Pj4+IGFubm90YXRpb25z
IG9mIGZ1bmN0aW9uIHBvaW50ZXIgdGFyZ2V0cy4gIFBhdGNoZXMgNjEgdGhydSA3MCBhcmUgdGhl
IGZpbmFsDQo+Pj4+PiBlbmFibGVtZW50IG9mIENFVC1JQlQuDQo+Pj4+Pg0KPj4+Pj4gVGhpcyBz
ZXJpZXMgZnVuY3Rpb25zIGNvcnJlY3RseSB3aXRoIEdDQyA5IGFuZCBsYXRlciwgYWx0aG91Z2gg
YW4gZXhwZXJpbWVudGFsDQo+Pj4+PiBHQ0MgcGF0Y2ggaXMgcmVxdWlyZWQgdG8gZ2V0IG1vcmUg
aGVscGZ1bCB0eXBlY2hlY2tpbmcgYXQgYnVpbGQgdGltZS4NCj4+Pj4+DQo+Pj4+PiBUZXN0ZWQg
b24gYSBUaWdlckxha2UgTlVDLg0KPj4+Pj4NCj4+Pj4+IENJIHBpcGVsaW5lczoNCj4+Pj4+ICAg
aHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3Blb3BsZS9hbmR5aGhwL3hlbi8tL3BpcGVs
aW5lcy80NzA0NTM2NTINCj4+Pj4+ICAgaHR0cHM6Ly9jaXJydXMtY2kuY29tL2J1aWxkLzQ5NjIz
MDgzNjIzMzgzMDQNCj4+Pj4+DQo+Pj4+PiBNYWpvciBjaGFuZ2VzIGZyb20gdjE6DQo+Pj4+PiAg
KiBCb2lsZXJwbGF0ZSBmb3IgbWVjaGFuaWNhbCBjb21taXRzDQo+Pj4+PiAgKiBVRUZJIHJ1bnRp
bWUgc2VydmljZXMgdW5jb25kaXRpb25hbGx5IGRpc2FibGUgSUJUDQo+Pj4+PiAgKiBDb21wcmVo
ZW5zaXZlIGJ1aWxkIHRpbWUgY2hlY2sgZm9yIGVtYmVkZGVkIGVuZGJyJ3MNCj4+Pj4gVGhlcmUn
cyBvbmUgdGhpbmcgSSBjb25zaWRlcmVkLCBhbmQgd2FudGVkIHRvIGRpc2N1c3MuDQo+Pj4+DQo+
Pj4+IEknbSB0ZW1wdGVkIHRvIHJlbmFtZSBjZl9jaGVjayB0byBjZmkgZm9yIHRoZSBmdW5jdGlv
biBhbm5vdGF0aW9uLCBhcw0KPj4+PiBpdCdzIHNob3J0ZXIgd2l0aG91dCByZWR1Y2luZyBjbGFy
aXR5Lg0KPj4+IFdoYXQgd291bGQgdGhlICdpJyBzdGFuZCBmb3IgaW4gdGhpcyBhY3JvbnltPw0K
Pj4gVGhlIGNsYXNzIG9mIHRlY2huaXF1ZXMgaXMgY2FsbGVkIENvbnRyb2wgRmxvdyBJbnRlZ3Jp
dHkuDQo+Pg0KPj4+ICBJcnJlc3BlY3RpdmUgb2YgdGhlIGFuc3dlcg0KPj4+IEknZCBsaWtlIHRv
IHBvaW50IG91dCB0aGUgbmFtZSBjb2xsaXNpb24gd2l0aCB0aGUgQ0ZJIGRpcmVjdGl2ZXMgYXQN
Cj4+PiBhc3NlbWJsZXIgbGV2ZWwuIFRoaXMgaXNuJ3QgbmVjZXNzYXJpbHkgYW4gb2JqZWN0aW9u
IChJJ20gY2VydGFpbmx5IGZvcg0KPj4+IHNob3J0ZW5pbmcpLCBidXQgd2Ugd2FudCB0byBhdm9p
ZCBpbnRyb2R1Y2luZyBjb25mdXNpb24uDQo+PiBJIGRvdWJ0IHRoZXJlIGlzIGNvbmZ1c2lvbiB0
byBiZSBoYWQgaGVyZS7CoCBPbmUgaXMgZW50aXJlbHkgYSBjb21waWxlcg0KPj4gY29uc3RydWN0
IHdoaWNoIHR1cm5zIGludG8gRU5EQlI2NCBpbnN0cnVjdGlvbnMgaW4gdGhlIGFzc2VtYmxlciwg
YW5kDQo+PiBvbmUgaXMgYSBnZW5lcmFsIHRvb2xjaGFpbiBjb25zdHJ1Y3Qgd2UgZXhwbGljaXRs
eSBkaXNhYmxlLg0KPiBIbW0uIEknbSBzdGlsbCBhdCBiZXN0IGhhbGYgY29udmluY2VkLiBQbHVz
IHdlIGdlbmVyYWxseSBoYXZlIGJlZW4NCj4gbmFtaW5nIG91ciBzaG9ydGhhbmRzIGFmdGVyIHRo
ZSBhY3R1YWwgYXR0cmlidXRlIG5hbWVzLiBCeSB1c2luZw0KPiAiY2ZpIiBzdWNoIGEgY29ubmVj
dGlvbiB3b3VsZCBhbHNvIGJlIGxhcmdlbHkgbG9zdC4gUm9nZXIsIFdlaSwNCj4gb3RoZXJzIC0g
ZG8geW91IG9waW5pb25zIGVpdGhlciB3YXk/DQoNCk15IHBvaW50IGlzIHRoaXMuwqAgRG9pbmcg
bm90aGluZyBpcyBteSBlYXNpZXN0IG9wdGlvbi4NCg0KQnV0IGlmIGFueW9uZSBoYXMgbGVuZ3Ro
L2FsdGVybmF0aXZlIHN1Z2dlc3Rpb25zLCBkZWFsaW5nIHdpdGggdGhlbSBub3cNCmlzIGdvaW5n
IHRvIGJlIGluZmluaXRlbHkgZWFzaWVyIHRoYW4gb25jZSB0aGlzIHNlcmllcyBpcyBjb21taXR0
ZWQuDQoNCn5BbmRyZXcNCg==

