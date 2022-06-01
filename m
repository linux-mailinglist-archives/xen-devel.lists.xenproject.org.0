Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF2B53ABAF
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 19:18:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340628.565702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwRyb-0005CB-Fd; Wed, 01 Jun 2022 17:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340628.565702; Wed, 01 Jun 2022 17:17:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwRyb-00058p-Cf; Wed, 01 Jun 2022 17:17:45 +0000
Received: by outflank-mailman (input) for mailman id 340628;
 Wed, 01 Jun 2022 17:17:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UpDj=WI=citrix.com=prvs=144fbc88a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nwRyZ-00058j-ID
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 17:17:43 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bda60623-e1ce-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 19:17:42 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jun 2022 13:17:38 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN4PR03MB6718.namprd03.prod.outlook.com (2603:10b6:806:1ed::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 1 Jun
 2022 17:17:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb%5]) with mapi id 15.20.5293.019; Wed, 1 Jun 2022
 17:17:36 +0000
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
X-Inumbo-ID: bda60623-e1ce-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654103862;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=i3YrQFEUT1vDBhQnJgFaO4yKn/IKEH7GluQ0X6ZOKKg=;
  b=E2ZQZ5UdNezew+sjFmEN/MXRZ3u9gwJoSmuSAYnKI+Ot8qZMBvoG9wHo
   1C6JjCSxX5qL/2P3oQgd6PTVW26BCaR+Bu6//DPw8DRBcXJoRAvUZk4rw
   ANIoKztpqvMAbGRgozwyMLapO82q4PB8IEmQlfQDoVd3YwaZ/XUqv7Ska
   M=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 72649710
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:041Nk6oAenV+PhRmp8jhGLlZ+F5eBmIDZBIvgKrLsJaIsI4StFCzt
 garIBmEOquKZGLyLdh2YIq/p0xVvsLdm9RrTlA4+3szRSwb8ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrdRbrJA24DjWVvT4
 Yqq+KUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBHKnskcIEVR9hDR5hJJ9MpLDOMSPirpnGp6HGWyOEL/RGKmgTZNRd0MAnRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkFjHFp2JEm8fX2P
 qL1bRJGahjabgIJEVAQEJ8kx8+jh2Xlci0eo1WQzUYyyzeJklAgj+G1WDbTUuWSQ5h5rBa4n
 VLfr2WnAikdZcST1jXQpxpAgceKx0sXQrk6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkgIssKwz+UqDXtT7GRqirxasvBQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBebScxy
 laDktftBDpumL6YU3SQ8vGTtzzaBMQOBWoLZCtBRw1V5dDm+dg3lkiWEIclF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9bABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:TaQWnqHttr1Ry+RKpLqFsZLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNJICPoqTM2ftW7dySSVxeBZnMbfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj3Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnZ4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlXFtyssHfrWG1SYczHgNkHmpDp1L/sqq
 iLn/4UBbU315oWRBDtnfKi4Xi57N9k0Q6e9bbRuwqenSW+fkN6NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjx0C3fLFuHoO5l7ZvtX+90a1wbh7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0AesojNugIm1kxR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY+8C3DLQxjLLGWOSG6XX50vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdCuWs7ayvVeLqzNV1wg2TwqUmGLETQI5tllulEU5XHNcnWGDzGTkwymM29pPhaCtHHWp
 +ISedrP8M=
X-IronPort-AV: E=Sophos;i="5.91,269,1647316800"; 
   d="scan'208";a="72649710"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLRQdw9WkIuM8mbPPh9G3Iq5sdbYwk3B8rhBMFDBraxj0S05CqWuihXkZsLVb+41C+06gD0j7RscKeQ7bvBtTnBAx7HWcBZv2Ei5rNXBoHhT1WxSE20K+a65V5awutr9+ila7r4z9+BzJvIgQLO3B6pANnG1QxEstd3+lEBe0Aofz25ynSNGxyajSM2EnIhQwnPc08GpAJRje9VPADt8GzTl651vFc9RU8p0yKhhbMnyt8Q+4wm8V3tOszhXIv9EdxtkIi+DkDR0VcsyAfDH0a9Pi0wGc12pAmBF3u3ONQDQqTFW0SbPZK7rjqjkIcGWs+wdrCRY0/TtTgP2U2q0aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3YrQFEUT1vDBhQnJgFaO4yKn/IKEH7GluQ0X6ZOKKg=;
 b=Smqf9MEkvrA2ijaEynQ2oMvFxJ3z2Oe4pRmB1Jv43Fc2Td/mYA+lScdj9GTageDeII35x/Eyvy1Z0SZ9M1ELJq/f+DI2USlv/jbIKkJTRyjXzRI2RMw7EQV3ZgRQ+c6myNSkAPiZ65JyBaFzlQOanMiIQElLMq9l1gCCcnfS0AdV/zDNLzvwvX7SP3DS+IdJXiI6zmyLMZ5jbciIn/QK+i5zPA3CzKPKV++F8RaX5rLsFad8xaM1nisGOWod3KbGpn5t3WepkMRXZMgnPNdOBv1REgQmf+EhH5skGFoASoCBRbaRmVPEP8mh9XuxK+9gKM0Ryuy4A3WXStKfgA34iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3YrQFEUT1vDBhQnJgFaO4yKn/IKEH7GluQ0X6ZOKKg=;
 b=vWWrfwAPrvYvo1ZZOquSjevI8HgOTjFDCskU5SSBF+nyAbmviDxkIbShw0QISz55/4eI6pkjz2MeC5V1CNJ6aRklufskJnUQsFZPp9r0tUwLuJXD3kszMTNMM2qOCofwo2pEjjfdJTVxKSP0/5XNQgaeaxBjIjYsbNRSv8danFE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [XEN PATCH 0/4] xen: rework compat headers generation
Thread-Topic: [XEN PATCH 0/4] xen: rework compat headers generation
Thread-Index: AQHYddjyz0tXrY3j20Cs3apay7U+za06y0cA
Date: Wed, 1 Jun 2022 17:17:36 +0000
Message-ID: <5e94648f-ba89-3691-0d80-1a8cca588ca6@citrix.com>
References: <20220601165909.46588-1-anthony.perard@citrix.com>
In-Reply-To: <20220601165909.46588-1-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5417750f-851c-43fd-5a76-08da43f29f95
x-ms-traffictypediagnostic: SN4PR03MB6718:EE_
x-microsoft-antispam-prvs:
 <SN4PR03MB67183FF4316CA1BFF32341C6BADF9@SN4PR03MB6718.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hh++QGynYEilWUtYNKLBYFeqcun91OTokEqK8gIR3CaIGUOr3JuhMH9rRLRmW8nRsLDY1fBkmdBUNoW8uSBZqBjRj7pp2TtaekML6MCEOdcQ9Wi46YkK9vjJzT/sMIb24Id7+VTlnLj2Y0t8qwOVdEvJhwOQ1Pk513uYmeGAinv9q483VY7luqyQTSj+h68ARDJlXd4b/e+WPyDMO6w3fIhVRbYKSsGWkQa9tc5fqya08u4Iqm7wN/EMoF7YURa3+r+9D78dG55NZBsDXr5mAO1bBHWjWjiJ3OiJXiMdESLb9Z5j3yAhByZ0oWVZzGtrU8i895FGe4Onnq9hgINvBBbI3Ns5xISsD+BeuNBLdA0v21kg3sWunRmimvXjMm5QUJeEvke0grTJanlTyeaFHMUqb2q4cDbWXQ1GEzukM+NJvWdleCIhiwr6s8MPArYBPMITo8pDrOjwjSG5Z4W9+qV8w+G1PT9yZrJXKXwgGZKSl47P0GVRrWZMEYqRZf0myuOaQDqPGtvUNyqyrY0pgJLQNxSz/gixn9F5b9EVmuj/j/wSooCaIaXIqDJth2iWXg77NyBbxoZYupx28NcLvenVEpiSfY83nG5ccmzJLn2OB2qLbeZw9SAv3Rm9NT7A6ZPWqIRBLOcureD3lV+Yw0V2VsYNXRNze93CHG41Xkm2CSM/5PwXGASZ83Q5faXwWd/k82bXAvFTKyGr4TGK1sX8gMDdYdhLFPThpnVMFeZmhp8/zgLKcxIVqbjvRxvDKYZNikwdg//HEaLgWez5g1wMYBqvotiGYrRas4gWQCd1ECBuDoBNSlMOxj3oSWCfnrS80hwYC3Ul9CKtPs1A7u7EsnE8orMiXebPLRwJHHo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(966005)(2906002)(316002)(6506007)(6512007)(26005)(53546011)(54906003)(508600001)(38100700002)(8676002)(64756008)(66476007)(4326008)(8936002)(66946007)(66446008)(76116006)(66556008)(91956017)(31696002)(86362001)(82960400001)(71200400001)(110136005)(6486002)(2616005)(5660300002)(38070700005)(122000001)(31686004)(186003)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R1Z1dEtVU01XeThabGFJdHlBeXVrbE41WEpvQ1JnVXZvNTdXVE9ZcVA2MnIz?=
 =?utf-8?B?a1VOZzA1bS9aR3J6ckJva0dOL1I3YkJ2aEtLWDZuZ2JXNjJpWS90NGNGSWl4?=
 =?utf-8?B?QnBUTll5enRpWGlCWGx3NlQzTFZYRWMrZmk4N3BPRDk2OFVXV25qVHh2Ri9r?=
 =?utf-8?B?UDh6RERQWG5DMnp2WXJZNUl1N05TOFVUdE1xelIwcDJjUG5pT2NuK2ZZc1Q5?=
 =?utf-8?B?cGNtKzVaTzdUOHgwUms3c3Y1MHdoREl6aDMyZUFXeENIYUxiNE81MjhmWVhk?=
 =?utf-8?B?dlhsTEFFN293cHVlYm9PdVJVUVBXZVVGZ2JUQmw5RGlMMU5sWFpsY3J4ZFg1?=
 =?utf-8?B?MjY1Ry9BbllGM0tjUzNTZno0RTRLWUJpTzkxdFZSdmhDY1FHckdPZE04ejZM?=
 =?utf-8?B?SHY4UXl5WCttNUlFeWZGT00vTEpVTFlSS0crS1ZHRDFXNmxpaS9IcGNnUTZD?=
 =?utf-8?B?KzJQVHpZVEZHWElES2tIdWh4T3FIT2ZURjF4SzdKSmFEU0VJcnRBYzJ0MjVw?=
 =?utf-8?B?cGQyczMvd011SUE2N3gyOUl6NlI1ZEpSbzE1QkNUbHp5UFhvNFJQNFhuMjVT?=
 =?utf-8?B?a1NudWpTTmVDaVVYQXBSbzhmZGpKMTZKZkxRNDhyQ1kvSHZWWll2SGdjc0lB?=
 =?utf-8?B?Smk0TWxoZ3BQakN6L29IMmswOVAvV08rRllaQmYvd0UyMkxvUFcwWHdLa2tJ?=
 =?utf-8?B?bHBwZU82K3hsYjY0UWFPUEV3RHZEWnRrR0poaXRQbzJ4WnJIRVFmbnp6aERP?=
 =?utf-8?B?WkJnQXNUWDQySFB1U2ZmZjVVMWw2OEFRSkpuc2NxZmh3aGVwbzVaMEU1emVT?=
 =?utf-8?B?T0pTaEhLTmxqTDlnbXlobkJEd1VmOFphUHdoK0JNL3ZDUzMvdzNtc0JvVWZy?=
 =?utf-8?B?Uk44cTJHbkNSdEM1ZFpTSXVBWVp6TUN4Tm9NWGF3a0RHdTBoZkpDbDd5YlpC?=
 =?utf-8?B?S1Z1MjFsTytuNkx3VWNncS9DVFoyZDVBMHltNk9mbjR1VnRFWWpYVUVOVmVy?=
 =?utf-8?B?MHc5ek9KLytaU29SaGZveC9aOThhRW5IOGxBRXowa2R6MWh1SGVDdldsWTBk?=
 =?utf-8?B?elhjLzFtbVVyd3lNblQ3QklSSUpIb0dlOVZaT1lZWVpHMkpzc1RPMjJKcHlk?=
 =?utf-8?B?ZVd6SXZRSk9IMXVBODRFQnV4cENhRTZDWXg1dlR4RXVUNHROdXhPdGpxcDBZ?=
 =?utf-8?B?VkMwNWlnZ1BZd3dRMnd2aDFkZFdsTDJnVVBzOElpeHpaRUVEYkVWZnByNVlM?=
 =?utf-8?B?Zk4rMUxBTGpyZDN1cFN5cnNyc1IwVlZISlUzaFNHWEpLQmpxelkzWE9hcUFz?=
 =?utf-8?B?NWNjdWlnVVBRRzl0RjdsWTlTSjVzd1R2ZThveHZRWHZBemZRK04zTTlFTk1S?=
 =?utf-8?B?L2l5bXZiemlncjk0b0VZZ2lvbTl4QlZ2bld3UWV3djZRc2diS2xlVmJ0Q2VJ?=
 =?utf-8?B?dGtPNnFOVmFIWTZaOTVqRDJCTXBCTWkwem8zOGk4N0hyRForWGF4eWhTZG1q?=
 =?utf-8?B?enYwQVZ5ZzR5QUFGTXljejRqT2xSMjhSS0E2OVJTeVUwdHhxMjc0UFRZYWdx?=
 =?utf-8?B?ajdsdUdqNTVpTm5OeEtyRkI2bGl1cExJK1ZDTm13OGwyQ3g5dGQ5bUdMZFhm?=
 =?utf-8?B?dU1maEFHK1p6Qy9sbVgySnBEdXN4aGpRNXdRSFZzdTVCSXhOa0Fodk1QMUs0?=
 =?utf-8?B?Zi9jSUNXSzlhemhpNkF3Z0RQRXFWOEFjbHlUOEJrM2Ezc2x2SkVyQ0JzQlpj?=
 =?utf-8?B?ZVU0aEUwaGJxVjZaOXp5dElQMk5GTklDVDB6ZzNYc2dKTDlHTk03SHRKT1Y3?=
 =?utf-8?B?WDlvcXJBVFlkTXNpMFd2N3RVL0VaOW1kRWp0YTJtZ2FXZGhKQkNXZ2J1Q3Q5?=
 =?utf-8?B?Z0Vqd1hUaC9yWWQxZTdqcUEyUS9YcU8vMGZlUFVRNzd1YXJxMk0rM1BJaE9q?=
 =?utf-8?B?cTlQOW5LKzJ4TnZqRzUySHpZWlNYUXBVVzlSOCtPTFlCWHJ6cDdwWnc5c3dY?=
 =?utf-8?B?aWdGMVd4Rng5Wm04NWJHUnJJSWFXV01RVG5vQzU0S0xDeFk4Wm44SFNsL1Bl?=
 =?utf-8?B?MVVva3lNNk5yczdCd1hheEU4Smw2TW1iQjFDTDVYK3FORTdJTkx1NXdWRHBi?=
 =?utf-8?B?OUxDYUdrUUduelpxcHBwdE9YK2UyalkrTkRYREpUak1jU3lWY01XZWJlSDR6?=
 =?utf-8?B?MXIwUm95MFl0MEJHd2FhdTFkazY4Q2RyRHpHSjEwK3czUVVFVlZYYURacFhv?=
 =?utf-8?B?TkpQZmdLa0N1ZHA5RG1lMTdHL0RibG91UVRoTGIyazZWTkZiZ1d3V3hteEdo?=
 =?utf-8?B?QzcrVEJQMW5oYWRLb1ZJMVdwRHJseVpORFVQV1V5dUlkR05SMUxQcWJDRkdq?=
 =?utf-8?Q?uTEKfjc1PrScar4Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2BAF9D909864254B90248DD87456FDD9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5417750f-851c-43fd-5a76-08da43f29f95
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 17:17:36.4389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v8S3Hj6RCKhpWdTNHQjRiEsTnaEr/5ciVD9BQH0OQi+lLnWiBgVaY/aFsGTfr+timEGcvYz3InJQg9DWfERCUWtJDl0Zd9c94wzhatPVneY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6718

T24gMDEvMDYvMjAyMiAxNzo1OSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IFBhdGNoIHNlcmll
cyBhdmFpbGFibGUgaW4gdGhpcyBnaXQgYnJhbmNoOg0KPiBodHRwczovL3hlbmJpdHMueGVuLm9y
Zy9naXQtaHR0cC9wZW9wbGUvYXBlcmFyZC94ZW4tdW5zdGFibGUuZ2l0IGJyLmJ1aWxkLXN5c3Rl
bS14ZW4taW5jbHVkZS1yZXdvcmstdjENCj4NCj4gSGksDQo+DQo+IFRoaXMgcGF0Y2ggc2VyaWVz
IGlzIGFib3V0IDIgaW1wcm92ZW1lbnQuIEZpcnN0IG9uZSBpcyB0byB1c2UgJChpZl9jaGFuZ2Vk
LCApDQo+IGluICJpbmNsdWRlL01ha2VmaWxlIiB0byBtYWtlIHRoZSBnZW5lcmF0aW9uIG9mIHRo
ZSBjb21wYXQgaGVhZGVycyBsZXNzIHZlcmJvc2UNCj4gYW5kIHRvIGhhdmUgdGhlIGNvbW1hbmQg
bGluZSBwYXJ0IG9mIHRoZSBkZWNpc2lvbiB0byByZWJ1aWxkIHRoZSBoZWFkZXJzLg0KPiBTZWNv
bmQgb25lIGlzIHRvIHJlcGxhY2Ugb25lIHNsb3cgc2NyaXB0IGJ5IGEgbXVjaCBmYXN0ZXIgb25l
LCBhbmQgc2F2ZSB0aW1lDQo+IHdoZW4gZ2VuZXJhdGluZyB0aGUgaGVhZGVycy4NCj4NCj4gVGhh
bmtzLg0KPg0KPiBBbnRob255IFBFUkFSRCAoNCk6DQo+ICAgYnVpbGQ6IHhlbi9pbmNsdWRlOiB1
c2UgaWZfY2hhbmdlZA0KPiAgIGJ1aWxkOiBzZXQgUEVSTA0KPiAgIGJ1aWxkOiByZXBsYWNlIGdl
dC1maWVsZHMuc2ggYnkgYSBwZXJsIHNjcmlwdA0KPiAgIGJ1aWxkOiByZW1vdmUgYXV0by5jb25m
IHByZXJlcXVpc2l0ZSBmcm9tIGNvbXBhdC94bGF0LmggdGFyZ2V0DQo+DQo+ICB4ZW4vTWFrZWZp
bGUgICAgICAgICAgICAgICAgIHwgICAxICsNCj4gIHhlbi9pbmNsdWRlL01ha2VmaWxlICAgICAg
ICAgfCAxMDYgKysrKy0tLQ0KPiAgeGVuL3Rvb2xzL2NvbXBhdC14bGF0LWhlYWRlciB8IDUzOSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgeGVuL3Rvb2xzL2dldC1maWVs
ZHMuc2ggICAgICB8IDUyOCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCkV4
Y2VsbGVudC7CoCBJIHdhcyBwbGFubmluZyB0byBhc2sgeW91IGFib3V0IHRoaXMuwqAgKEkgYWxz
byBuZWVkIHRvDQpyZWZyZXNoaW5nIG15IGhhbGYgc2VyaWVzIGNsZWFuaW5nIHVwIG90aGVyIGJp
dHMgb2YgdGhlIGJ1aWxkLikNCg0KT25lIHRyaXZpYWwgb2JzZXJ2YXRpb24gaXMgdGhhdCBpdCB3
b3VsZCBwcm9iYWJseSBiZSBuaWNlciB0byBuYW1lIHRoZQ0Kc2NyaXB0IHdpdGggYSAucGwgZXh0
ZW5zaW9uLg0KDQpBbnkgbnVtYmVycyBvbiB3aGF0IHRoZSBzcGVlZHVwIGluIHBhdGNoIDMgaXM/
DQoNCkFyZSB0aGUgZ2VuZXJhdGVkIGNvbXBhdCBoZWFkZXJzIGlkZW50aWNhbCBiZWZvcmUgYW5k
IGFmdGVyIHRoaXMNCnNlcmllcz/CoCBJZiB5ZXMsIEknbSB2ZXJ5IHRlbXB0ZWQgdG8gYWNrIGFu
ZCBjb21taXQgaXQgc3RyYWlnaHQgYXdheS4NCg0KfkFuZHJldw0K

