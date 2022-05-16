Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA671527F1E
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 10:02:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329668.552917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqVfe-0002ih-8u; Mon, 16 May 2022 08:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329668.552917; Mon, 16 May 2022 08:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqVfe-0002fs-54; Mon, 16 May 2022 08:01:38 +0000
Received: by outflank-mailman (input) for mailman id 329668;
 Mon, 16 May 2022 08:01:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1taX=VY=citrix.com=prvs=128915162=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nqVfc-0002fj-Mc
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 08:01:37 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 656e320e-d4ee-11ec-aa76-f101dd46aeb6;
 Mon, 16 May 2022 10:01:34 +0200 (CEST)
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2022 04:01:27 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN7PR03MB4562.namprd03.prod.outlook.com (2603:10b6:408:c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Mon, 16 May
 2022 08:01:25 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 08:01:25 +0000
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
X-Inumbo-ID: 656e320e-d4ee-11ec-aa76-f101dd46aeb6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652688093;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=QuJUObv6EO2DGUUORLVUsY6Cio9YAWLre9+7S/B2InE=;
  b=XD9GJtOohch2xModnO93VxgK46Mqbcs/yy1KHK0podD9AN1Uhcm60HaZ
   4SYFeUoPGkTRWpZ73L16nQGlHe3oGofM1r1RqBG7ipK6q4Laep4gvohaa
   eGX2r0vLOxVyZE/8OB1Y8JNHAtAgyA/LkzgoweRwoxFld4nRVW5cuDv8G
   I=;
X-IronPort-RemoteIP: 104.47.58.108
X-IronPort-MID: 71367930
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:O9AEUq1RXM9KHupSH/bD5c9wkn2cJEfYwER7XKvMYLTBsI5bp2NTy
 GMcWT3Vb6uDYmrwctF+OY+zpkNUupfWzINmGgZqpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMx3IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0OkJuZZBU3D5fVgcc3dDxzGS9sI5NvreqvzXiX6aR/zmXgWl61m7BCKR9zOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82TBfyStbe03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutriamKGMH+QnNzUYxy1btkR549bv0DNvIfY2uHcd7l2Ofu
 H2TqgwVBTlfbrRz0wGt8Hihm+vOliPTQ58JGfuz8fsCqF+Owm0eDjUGWF39puO24malQM5WI
 UEQ/isorIAx+VatQ927WAe3yFabujYMVtwWFPc1gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHjVGOYXeU97PRoTbsPyEQdDcGfXVdFVtD5MT/qoYuiB6JVsxkDKO+ktzyH3f33
 iyOqy89wb4UiKbnypmGwLwOuBr0zrChc+L/zlm/sr6Nhu+hWLOYWg==
IronPort-HdrOrdr: A9a23:MrgIb6H4pJdKoVx0pLqFepHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHPlOkPIs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YbT0EcMqyOMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPH1XgspbnmNE42igYy9LrF4sP+tFKH
 PQ3LsPmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczLgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxen0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tps+CVQpAZEyHsHceg02w
 31CNUXqFhwdL5nUUtcPpZ3fSLlMB26ffrzWFjiUmjPJeUgB0/njaLRzfEc2NyKEaZ4vqfa3q
 6xGm9liQ==
X-IronPort-AV: E=Sophos;i="5.91,229,1647316800"; 
   d="scan'208";a="71367930"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKZTd+O0cVsP/DuBofYaui54oNSuAkVEYND+1YpAsdAxaXud6ci6yvlFi7rSaz/vRP/wcWTqPCKK9P5kwFTHzByFUGdEacihTI1V8PPQx0I+Mz7NpXOnl6i+HRbRTew2A7FEtzOialAKOPuZVgoe+FXkb5lnxq8PZOzC6o0NxMvOfbVoI1Xe3sIfJjNOopl/AH2WmS/SZxochha9PQibgtokz33Wr9jCjjXuwcweLGWuFwUTsgohQnkpjp9ToHLyiDzhXHPb7FdJiGa/DrmSUzgfbSNedBKlFLawgapBGhDdR4yXNiW6KromSA1jDASd/zejHbdavC8NxUaS2WLL1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3v/XY/s4YhK9eCx7T5dR+Sa7+2kz9kcTtexHu8OqOzs=;
 b=RrDq1UaG7pbvFdCfQ5IqR74NX/90MBAu2HXxNRSUHa8fqXB7MIoWTVa92+V8gwP1bNbS9LUESst3vlqDWh9tJyXO8TB6dEJnUG4643nvQUIOXR19NKi1XbmKuy9dM4fdQt4Cc39iXhpKT9sDaQN4yUc+ifpe+lIx5o+0y18z/klBl+RfMBzZcbWA+Q3+TvJgAdlAlT4a6RmKdDsCbcBe/iP3rpYPY1QdNseRIKyIh0uj3gD7USnFAmXaK1yF8oJgMnpxSxNViujpspabqNo+5FWMYkLg+9F0p9w5WrZC3ybfKyZ9nvfAYRXBiuzEvqCnx08zOrI8OQIGgmi3jiJFow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3v/XY/s4YhK9eCx7T5dR+Sa7+2kz9kcTtexHu8OqOzs=;
 b=tndwhVd4e+NC1LJs2GPL9CpRVfNjf9gTtIpWUciU2mLFuTNd9Ta5Z9njCPjosg6hdctpCR0xClPq7ua1EcwQRzMs+SbW9yk0O5RGI1M7dDwCbeOScYxIFl/vNLrL7paO8IWPfLinusZn7eWJs0gLR23haUBHkOpk6DqpRPmz7gU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 16 May 2022 10:01:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] build/xen: fix symbol generation with LLVM LD
Message-ID: <YoIE0eI9vvAHNMlc@Air-de-Roger>
References: <20220505142137.51306-1-roger.pau@citrix.com>
 <cc494c68-787a-3cb9-f192-48511d5577cc@suse.com>
 <YnUjICUinDIiNJ3p@Air-de-Roger>
 <YnVAPMZ0+dd9jLF9@Air-de-Roger>
 <5cb23441-d8c1-5640-d630-30881841db0c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5cb23441-d8c1-5640-d630-30881841db0c@suse.com>
X-ClientProxiedBy: BL1PR13CA0026.namprd13.prod.outlook.com
 (2603:10b6:208:256::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f665eb09-cafb-42f1-8921-08da37124611
X-MS-TrafficTypeDiagnostic: BN7PR03MB4562:EE_
X-Microsoft-Antispam-PRVS:
	<BN7PR03MB4562590B56F45B47060D28C48FCF9@BN7PR03MB4562.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BDj2A3BS0VH6S3kHvXupFnX/SoUhKn7CyldDDPDaMot17kgVxe7TFu3MncQk6qaiotx6Q0u6Eifl08EdBj/50p/Zb/wGR1xh7MeI/BjE00sBbCzwg7oexq02hkDKQq5vW18d0n343ADfJ2EE7WlwTOQAa5/d19b3znbAfHrxsZC6pgetYixgdxJVY6niT253D+x2KHGVbhpjmtMHxbpflVDydaqsG+gGXK247p7bpvuO67h+eA4H7p5QT8R8yfIgracZPsxLyUsVhOWmqspClNnh+6R17oCma7BRWiL6veW7zwZGhqBJMNo7/1xyABvESARDD5b86IpuIKhdR2ce+jdJe0EA+zlonn4m2Ed7SunExFnobW4ymSuoTqovuiBCN//nsVyp+QjUaaEZsV9j5R+wfkBiKytgppabCkFfHcQ/2kj6hwzMmEYITuRseD/udRORkYnYCBqjFAY+EVy8nvvu+/iRdSb8AsRGtxEb8EfmwejD5SOAUM9LvJUvbebUYGML2nBZkA0CdBOEZFcIJlAv9AKj12ALqaufyU91W6NNiFQZmJYWyVlM/EJG0Sv+BUxA02maj98zXarPjnR2TW3kIZcMmscsu3ptkiMslzj+ucnM70Rt+tsyDOc3jHfhaVUsq98htpihLYkDA2Jh0ettbJhebx09TQ2N2ulv296NWSox0tatLu9TL1kIIX+e8HNTzAXiRH8R7yVaiqNAD7KkQikr7wDDI56NUdlfGmw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(66556008)(508600001)(316002)(82960400001)(66476007)(6512007)(86362001)(5660300002)(66946007)(9686003)(6916009)(85182001)(54906003)(33716001)(26005)(38100700002)(966005)(8676002)(6486002)(4326008)(6666004)(2906002)(8936002)(83380400001)(53546011)(6506007)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHdOazd4MzZoQ2lXT1dVTUxhM2RPenR0MmZyQUxZWmNnL2Z4dEdGUEsrL2NB?=
 =?utf-8?B?WmlIK3ZqNzNWK3BleUMrMEZtcndOY1g1am9OOVlHSHB3TlUyelJuOGxFV2ts?=
 =?utf-8?B?T09DSlROd24wNnNRNFRHcEJ6S0U5b2NMWmQwa1pLVXdoZWJyak00OW9QUlJU?=
 =?utf-8?B?Ny9HdmdiNEQxejdSK1o0MENKOWowa2trM3VRTHFxa0JkL3VLVlRnYkNIeUJH?=
 =?utf-8?B?aWc2dUp0UkJDaU96ZXpKaHBIQnVEMHJFYTI2Z1BEaG50VG5nUlpETnNYU0pH?=
 =?utf-8?B?WmhUUExLdVF1VTYrMG5jalZSSjREaThRU3JFRk9UdzNJV20vc2NqQVhvVUQx?=
 =?utf-8?B?Wlk4cnZRdytQakJqN3J2c0dKY1VXaUZqQ0owcDY2WDBTV29SRWFBTWZ2bzlh?=
 =?utf-8?B?eUVVRDI0MUlMek0xdlE5ZUVtRTUvdzFjNzh0S094UEVnT0pIVC9kTW50SDZN?=
 =?utf-8?B?Sno3dkhIZXgxaFc1ZGtnU1lmaTYrRXBLYmRna0d6M2phTmNCd3RKeXhvbzRN?=
 =?utf-8?B?U3dudWtxTU5ob0RiakZRdStBeFV4NEd4TGtrQ3dTVldkRmxVYXFNTWQ4WERu?=
 =?utf-8?B?eE1UeDRiVno0eFZoZFRHZytlV0tDcng0NW9vWG5jVXVxZ3FVSFp1OGtVK2FQ?=
 =?utf-8?B?cE4vL1RTd3htRityaW0wQmk2RlJic2t5eFBMWm9wVkxTOTZFVWxSYUlzR1RD?=
 =?utf-8?B?Y0pDTEdVZjMrcDJqSTRHU1crWGErZmRpVEk3TmY2bnVmZzZQKzdWdHBwQVdV?=
 =?utf-8?B?dDM4aS82Z2hOcm5MWVd0Y0dpZ3Vmb0RGbnFUTlZxcFZPd2dwNDI5QmNnZ1Y1?=
 =?utf-8?B?UnZlTGZQK3V3c29lT0o2eVdXT3JTbkcrOXgzY2MxVmIxVmoyTHBOV2dOcS9r?=
 =?utf-8?B?bXQxZUlvc2NKc3BBbllWMmR3ZUhEWWxJR1k0bkFjMlB0YlhVMWw2SHQ3MENG?=
 =?utf-8?B?K3FybmF1dTZDS1NQWGhOeHRBbGlHT09mTXdLYXFZNUp4V2p5dGZUNGhJdE1n?=
 =?utf-8?B?b1dRcDg0TlRURTdXNmhNdUtLS3dBUDF6T3RzazBOdmVhK3A2TkZxaEFidnJD?=
 =?utf-8?B?dnJNdkNkaS9DOENCbXFVOG1BSUw2andLZlIya0xRbjFNTnptSXYyYTl6eVVr?=
 =?utf-8?B?aktYNXNDWWNmRFdpM2M1UXgzNVZEUUg3WXRLaVlZVUhESnRvc0U0QUx1T1dV?=
 =?utf-8?B?eTlCZnR3Mjhua0hPcjFuVUNOVzRQcUxkREhNL0JVSFgxYml5T1hZZi85QUFH?=
 =?utf-8?B?R0JnZ3o2bklVMDduV1YxVkdRS0FZZXJkcEo0V2NhT0hDSGFxNTdmM0tmdVdW?=
 =?utf-8?B?WU9xR205cDhwNy9lMzd3dnRQREpUUHV5SGNTYklHQjFXYm5uMUdiM21QK2tm?=
 =?utf-8?B?L2FBQUk5TDhQanRiblV2SFpkMGV0LzEwOWN1Z3B6Rm5QZXpCSmdDTGNyempn?=
 =?utf-8?B?V2tKK01makV6MDBWOW5Famo2U0d4K1FPNk1UQ1lwaHljN3BKT3NvZEE1TEZD?=
 =?utf-8?B?QS9kSVRsdUZQWXQ0bEdGM2xqdTRrWjZyN3F2VVMxcW9Dc1Jpc3U1UTBDeUZZ?=
 =?utf-8?B?QXlLNzc1SWVMdGVsc3FQNFFxaUF3L08rUWNyOGpMTjdRTzVrUzV2K3QvZ0JE?=
 =?utf-8?B?YzQwY003Z2RCeG5Dbzg5SUYvODN2dkpKTUgyS1QzWUsvUkFiRjUrR3FGcmxt?=
 =?utf-8?B?Z2JjWTNlcWl1TnlWdUtuZXZUYUtpRGJwOGM2U0x6dkdISkhsZHdybWRrWkFJ?=
 =?utf-8?B?dEdyMUJxbUV4N3UzV0ZkME5GbFo1T2tNMmFsUUJmSTRnOXZNU0N0TmRObjlw?=
 =?utf-8?B?NmxZZldvUDMrM04zM0VWWUNydzJoaU9zWHdHWFJWMkY5OENWTG81L3NJWmZk?=
 =?utf-8?B?Q2NVU2Z0QytoR3V3bk9LNkgwYkhFditPbVNRdjlXeGQ2N0VvMEYxQllmci9K?=
 =?utf-8?B?TlhjSURDSUFhZEtiLytnaHlvQUNYTEdneW9pRFNaL2l5dmhjMWFSL2xSWGp0?=
 =?utf-8?B?T2JPRVdqbWZYMXVLd09WL0dnZlBuK1MzL1hSd08vYVd2UTlxZzJUbG9zaXJm?=
 =?utf-8?B?dENJUU84cE9lWlA5cTRTZnpTaVJad3orRkpGdVdPeDJKRWY4ZWNCaTBZb1lC?=
 =?utf-8?B?Unh3K0NvdFlNNFdGcW9CK3c2V3JzWlhGV0tuYk9yREtXcE9pcStUeWRTTzhO?=
 =?utf-8?B?dlZUQkt4TEdwN3A1SlZ0ZktGRXJXaDM0YVNvcWZqUXpOVHhLWERWQ3l1WTl5?=
 =?utf-8?B?Vy9zVWRvaDBZb1dKaXA3bENiTmtEVldtZURPVGhnT3R0VFI0QkozUUk3M2hI?=
 =?utf-8?B?c0Ezc3d3eFFocnYvaUZCNHpnTFo4S1B4RHRhOUxHRUFmSlRnQmp2Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f665eb09-cafb-42f1-8921-08da37124611
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 08:01:25.3991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5Jwkgd7jrlXxjZOmMdY+mxZdUFN3lUmqKXgm/rIrow1BZjum5HKL3mGg8W/Q2lMNBIEPprqFrnJAJd7T2jBFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4562

On Sun, May 08, 2022 at 10:34:43AM +0200, Jan Beulich wrote:
> On 06.05.2022 17:35, Roger Pau Monné wrote:
> > On Fri, May 06, 2022 at 03:31:12PM +0200, Roger Pau Monné wrote:
> >> On Fri, May 06, 2022 at 02:56:56PM +0200, Jan Beulich wrote:
> >>> On 05.05.2022 16:21, Roger Pau Monne wrote:
> >>>> --- a/xen/include/xen/compiler.h
> >>>> +++ b/xen/include/xen/compiler.h
> >>>> @@ -125,10 +125,11 @@
> >>>>  #define __must_be_array(a) \
> >>>>    BUILD_BUG_ON_ZERO(__builtin_types_compatible_p(typeof(a), typeof(&a[0])))
> >>>>  
> >>>> -#ifdef CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE
> >>>> -/* Results in more efficient PIC code (no indirections through GOT or PLT). */
> >>>> -#pragma GCC visibility push(hidden)
> >>>> -#endif
> >>>> +/*
> >>>> + * Results in more efficient PIC code (no indirections through GOT or PLT)
> >>>> + * and is also required by some of the assembly constructs.
> >>>> + */
> >>>> +#pragma GCC visibility push(protected)
> >>>>  
> >>>>  /* Make the optimizer believe the variable can be manipulated arbitrarily. */
> >>>>  #define OPTIMIZER_HIDE_VAR(var) __asm__ ( "" : "+g" (var) )
> >>>
> >>> This has failed my pre-push build test, with massive amounts of errors
> >>> about asm() constraints in the alternative call infrastructure. This
> >>> was with gcc 11.3.0.
> >>
> >> Hm, great. I guess I will have to use protected with clang and hidden
> >> with gcc then, for lack of a better solution.
> >>
> >> I'm slightly confused as to why my godbolt example:
> >>
> >> https://godbolt.org/z/chTnMWxeP
> >>
> >> Seems to work with gcc 11 then.  I will have to investigate a bit I
> >> think.
> > 
> > So it seems the problem is explicitly with constructs like:
> > 
> > void (*foo)(void);
> > 
> > void test(void)
> > {
> >     asm volatile (".long [addr]" :: [addr] "i" (&(foo)));
> > }
> > 
> > See:
> > 
> > https://godbolt.org/z/TYqeGdWsn
> > 
> > AFAICT gcc will consider the function pointer foo to go through the
> > GOT/PLT redirection table, while clang will not.  I think gcc behavior
> > is correct because in theory foo could be set from a different module?
> > protect only guarantees that references to local functions cannot be
> > overwritten, but not external ones.
> 
> Right, since there's no way to tell the compiler that the symbol will
> be resolved in the same "module".
> 
> > I don't really see a good way to fix this, rather that setting
> > different visibilities based on the compiler.  clang would use
> > protected and gcc would use hidden.
> 
> If gcc's behavior is indeed correct, then moving to protected with
> clang would set us up for going through GOT/PLT there - either right
> away (if the implement this like gcc), or once they correct their
> behavior. I don't think we want that. Therefore I think we want to
> alter visibility between compilation and linking (i.e. presumably
> right in prelink.o), going from compile-time hidden to link-time
> protected. That would likely be closer to what your original patch
> did (sadly there's no "convert <visibility1> to <visibility2> option
> to objcopy, and making it have one wouldn't really help us here;
> it's also not clear to me whether llvm comes with its own objcopy,
> or whether they re-use GNU's).

So I've raised the difference in protected behavior between gcc and
clang:

https://discourse.llvm.org/t/gcc-vs-clang-differences-in-protected-visibility-implementation

It's no clear to me whether clang would switch it's implementation,
but it also seems fragile to rely on global protected function
pointers not going through the GOT.

Do you have any recommendation as to how to change symbol visibility?
I've been looking at objcopy, but I don't seem to find a way to do
it.

Thanks, Roger.

