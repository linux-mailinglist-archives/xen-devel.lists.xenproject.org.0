Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C02F48D8CB
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 14:24:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257206.441899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n804z-0000ZH-E3; Thu, 13 Jan 2022 13:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257206.441899; Thu, 13 Jan 2022 13:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n804z-0000Wp-An; Thu, 13 Jan 2022 13:23:49 +0000
Received: by outflank-mailman (input) for mailman id 257206;
 Thu, 13 Jan 2022 13:23:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=64pG=R5=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n804x-0000Wj-I2
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 13:23:47 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 072a488e-7474-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 14:23:44 +0100 (CET)
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
X-Inumbo-ID: 072a488e-7474-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642080224;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=m2mlqkhL/Ft2hYIbftJbNT3RuWzo0IAs2Y6nJ7Ttcxg=;
  b=Qr+q/8pNP5KHSa4mvqFVQamB9zhS6gfPrG/XacCMUPAXwyS2iAXNk1vX
   ob08pSyMK4qHBA66whrZfM+h2Gljkn2q9cD0psT3H4y5XYe2a7tAQ9OVq
   b2lAK+Ivsmnrei3rXDkp7kgbVFsZ/qmLHZwc/OKpBtiuA1vOFVkuenad3
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8Kq0PuB4vCOSkQ6goXTbk1rY14SWPpa/Fj1Ady0Y//EusLXRDycfjbT6Jsew6X84jPzFHJnnZS
 xHiVt+bnkBsTr8lJOnTizjy3bV1PoKllXOKdoeLFkry1SNYS4oACU3Ejku96/TEMa0NvM1HBOW
 u44T0aX7cKPkGei4q484/Qz3h0zboiMhWX68VEH3GO2KHZuP7Imb0VLZkfvOByCXea7SVOHhcZ
 tPzABi6TNPIoDW+slsHpzwsUyx7STonvjKQjf5n7fvblY2WIVP1GUbu2I0/5vKj5+XcZ48/sls
 czmEM7Y/6N4KJRh2fdJdg4kZ
X-SBRS: 5.2
X-MesageID: 61919179
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LX/5LaCPLvchxhVW/+nlw5YqxClBgxIJ4kV8jS/XYbTApDtz1DEHm
 jEaXGDUbP6MYDPyf95wbI+2oUIB7JPTyIM2QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En940Ek7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/uTmnlcFL5
 +R2lYG8VTokJZ/xv7kBekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHfybvI4Bg2ZYasZmF+3EN
 vAedBFUYhmefTNGB10YMc47pbL97pX4W2IB8w/EzUYt2EDLxRF1+KjgNpzSYNPibcdfk1ucp
 2nG13/kGRxcP9uaoRKs6G6hg9jqjCzyWY8MPLCg//ssi1qWrkQUDBAVTlK9reOOg0iyQc9EK
 0cU9ywtqoA/7EWuCNL6WnWQuneEoxpaQNtWHO0S4RuIjKHT5m6xDGUeUiRIbtBgscYsXCErz
 XeAhdavDjtq2JWXVHac+7G8vT60fy8PIgcqdSICCAcI/dTniIUylQ7UCMZuFravid/4Ei22x
 CqFxAA3gbkJ15ZTj420+FnGh3SnoZ2hZhAy4gLbT2e09DRzbYSuZ5GrwVXD5PMGJ4GcJnGGu
 HUHgMGY4Po5EYCWlCeNTeMOG5mk//+AdjbbhDZHBII9/j6g/3qie4F44zxkIkptdMEedlfUj
 FT74F0LosUJZT3zMPExM9nZ59kWIbbIJ9jLXOHuQet1QoV9aDKK5xNTQhOM9jW4+KQzqp0XN
 ZCeeMeqKH8VD6V70Ta7L9sgPa8XKjMWnj2KG82ip/iz+f/HPSPOF+9ZWLebRr1htMu5TBPpH
 8Gz3idg4zFWS6XAbybe6ub/xnhafCFgVfgaRyG6H9NvwzaK+kl9Wpc9Ipt7IuSJepi5cM+Sr
 hlRvWcCmTLCaYXvc1niV5yaQOqHsWxDhXw6JzcwGl2jxmIuZ42ihI9GKcdtJeB8rLI/naUuJ
 xXgRylmKq4fItgg025MBaQRUaQ4LEj77e5wF3fNjMcDk25IGFWSp46MkvrH/ygSFCun3fbSU
 JX7vj43taErHlw4ZO6PMarH5wro4RA1xbwuN2OVfIg7UBi8oeBCdn2q5tdqcp5kFPk27mbAv
 +pgKU1G9bClTk5c2IShuJ1oWK/yQrQuRRQLTjCLhVt0XAGDlleeLUZ7eL/gVRjWVX/u+bXkY
 uNQzvrmN+YAkkoMuI15e4uHB4pnjzc2j7MFnAliAlvRaFGnVuFpLnWchJEdvaxR3L5J/wCxX
 xvXqNVdPLyIPuLjEUIQe1V5PrjSi6lMl2mA9+kxLWX7+DRzoOiNX3JNMkTekydaNrZ0bt8om
 L9zpM4M5gWjoRM2KdLa3DtM/mGBIyVYAaUqv50XGqHxjQ8vxg0QaJDQEHauspqOd89NIg8hJ
 TrN3PjOgLFVx0zjdXsvFCeSgboB1MpW4B0TlQ0MPVWEnNbBl8Qb5hwJ/GRlVBlRwzVGz/l3Z
 jphOXpqKPjc5DxvnsVCATyhQlkTGB2D90Xt4FIVj2mFHVKwX2nAIWBha+aA+EcVrzBVcjRBp
 ezKzW/kVXDhfd3r3zt0Uklg8qSxQdt0/wzEucamA8XaQMVqPWu72vejNTgSth/qIcItn0mW9
 +Bl8dF5ZbD/KSNN8bYwDJOX1OhIRR2JTICYrSqNIE/d8bngRQyP
IronPort-HdrOrdr: A9a23:Lox0LKhORj+1Y/zS6E5KVQ69hXBQXz513DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmsk6KdxbNhQItKPTOWwldASbsC0WKM+UyEJ8STzJ846U
 4kSdkDNDSSNykKsS+Z2njBLz9I+rDum8rE9ISurUuFDzsaEJ2Ihz0JdDpzeXcGPTWua6BJc6
 Z1saF81kWdkDksH4+GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 X4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRwXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqUneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpb1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY7hDc5tABOnhk3izypSKITGZAVwIv7GeDlPhiWt6UkWoJgjpHFogfD2nR87heUAotd/lq
 D5259T5cJzp/ktHNZA7dc6MLuK41P2MGDx2UKpUB3a/fI8SjrwQ6Ce2sRB2AjtQu1O8KcP
X-IronPort-AV: E=Sophos;i="5.88,286,1635220800"; 
   d="scan'208";a="61919179"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCz0Nrja1G8k/koOQdoRZrempm5pb2fVVz3A8p54lpVjed3B/UsCiozWooeGvlyz9f2cSdKNoGTk2yfllR93aIRNjP7i5KCWYhyS6A5ycOZxzQ+lfrzj9Ov7Akdcj1fTBAtuK+mUWFfzyWB4HWKZdGiZnqT4gGHTXvyNikdIhDYPbUw3YBZNoQsAY3gUKijN4evw7w8jHZXIKSwT+LV653DeNNKBTmt7jufJ4PwlKRBPUWPb9VAZG0wFMdb0GNsdiXzP74RK5klz7bIMjapG8VCMkDwW90yy8/b8liscE7/Lush4RufS6se2BocwR6saqeYCwIvpP4sHHGtm2Ewp+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pg1KiyCtYZ3j9EP/NndpzS4A3u+bekw8YCtTpGo4U/4=;
 b=M+TGQA9tedo7aLo+wMsjh6Gxj24gLNbiB7RMCeic9ER6HsfbaieEc4N9nq3fZjAZATyFpGGAZ4Sugn1Io8Auff8EgmF4WAZU1LmOCWXfq+sTwtNqLIM7QKIRaTAUqEpdpSLCtgthhrtYSzPqrPBN7qrRVqwwoR2qJZd0doNoXxvvqredLEoxSv7V809tN4fo+qTkpLvEsYC8cdvpdSp4KHjljQRFrOZ1q6qQx1EfzdqZebhWKluP+Hxle/DuIX0vjzapv7xRAJJH6nYHm3KVUSRxBHpW8dbzr8FZv/qipuQMyM2Dz6KEYYvwUdfwh+1gxUufk22wMOu+Br3HxijP2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pg1KiyCtYZ3j9EP/NndpzS4A3u+bekw8YCtTpGo4U/4=;
 b=wIsJCn8EpBASxn95ISSpukl/Nt+y4kR5KlB35Qd8GelfLj35gbhfPp+O8R9N1Q4YM0qRn37/vzgdi5xZhiTC3OjmOwWa8kZ1ctM0cu1LxfI7ThQeKZgLbSwaJTzcPVAohlFxiEgzBxwyCl29GTvykQJa5xpV1fwqoHzRWhh3k20=
Date: Thu, 13 Jan 2022 14:23:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <paul@xen.org>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v5 13/14] xen/arm: account IO handlers for emulated PCI
 MSI-X
Message-ID: <YeAn0k1HbYFUGeMj@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-14-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211125110251.2877218-14-andr2000@gmail.com>
X-ClientProxiedBy: MR1P264CA0080.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26ee95a2-f74a-4571-751b-08d9d697e75c
X-MS-TrafficTypeDiagnostic: BY5PR03MB5267:EE_
X-Microsoft-Antispam-PRVS: <BY5PR03MB5267DC58581E8388A7B91C4F8F539@BY5PR03MB5267.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +jcb3JXRSXi1n1f2GFHC5hdiXKIt9LeXNkpXdOVl4kEf2aLPghVxjo/RCiT++H/LdQtcSGp6gFFaxmD9oCrCNDEDC1rwsma3/0ZDNtVge/K8KfOeY2tHsk+E8NiuFOFm2P/RD4zkILE/tXqNi6DDOxAJUFyG1uceCv/FPK93tc6ahuKAxK0OxN3tYjAMeSS35/wiycd3VgeYhIUh8j3MMbDQrjJAb2wXWsL2dcAVCSc1H9uQXuRLQbjpdCq27ImSgk43zp4ADqQOQXhpwmEoaXgG6h4+mqY5D4ijm71rQtPzXq9OqZCCoKvfL4q8gkazvAiOcXlmJ8bWraFGM2/bhjRqxHu4P2bXO+XHMwFamR9mrVWsgUpBsDCDx5GvChoGkbik28BRNS+xpTSbiWvPFmMHCkwKeL52EZNuVNox9CCDNQsGwBVxzFgGnQ3DWGm82y8U/ioHOPFYfIw6WgUTt4Pc3fQdAFXddeMrQQwUpBFNz98RvPcZEFnU2/Hrz4sIGtn7xGF69cjRdKh4xOthtXsQxJwLWBu3paGgaoPdZwVqVvveaSrpdPPAYrMmbP2khx9FEJY9iK2amZHTk9Az/OxrdFUYSKZzPKDO79/LsFrjvpgTPICk1nGndplt+kBGKWGVtt/fdCAhs34X9MTZEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(85182001)(26005)(6512007)(508600001)(6916009)(9686003)(82960400001)(38100700002)(86362001)(33716001)(6506007)(5660300002)(2906002)(7416002)(316002)(6486002)(8676002)(8936002)(66946007)(4326008)(66476007)(66556008)(83380400001)(186003)(6666004)(15650500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmI3ZGthK0EvaW1vUXp5dUY5S3RjWXU5REtIeDRhMmlkaVB3UUJxbHZxR213?=
 =?utf-8?B?OHoyM2VhVWhlanN3RDFmQkJCTlJVODhEVk1QQkJzaUJmR2lDUS8rUlRSZkRM?=
 =?utf-8?B?WncraTc0dXlXL1JPemZFMjJFaWRRSDRoOWttaFZVMVdTZDcreHhFdmhMVDF4?=
 =?utf-8?B?T21scEttVmU2TUlGUktlY2d3TWdjcE1TUTFubGNjQ3kraklwUGNVaXVRdldi?=
 =?utf-8?B?NitzRHF5d3liRWZzYTVnVTluYk5kV2kzdlpTOTVMZHdjR2dnVGx5S3ZqekU1?=
 =?utf-8?B?TWo4K2ptMUk5ZXFQMlJ5ZWo4aXhvM0xhV3Z6M2JyTFlQZWxpU21LSHBkUmZC?=
 =?utf-8?B?bUxFKzExY1VPUk1Gb291QnBQb3hBRmRmVmVhNU9KSnFFeTlHenZMTHh5Lysw?=
 =?utf-8?B?WmU5elp3MTVXYU53dTYxeU5xNjFqSytwVWpuY2FZOHl0VXNzTXF6dVpLUFZU?=
 =?utf-8?B?QXlKRkwzZm5uREZhY2p4c0V0dUJkNFVUaWZRdTg0VGVjRGVoSzRpSWJMT2dJ?=
 =?utf-8?B?SEhORytNQzU2dDJzemVaQmliamp0WG5MTzR2Z1ZFRVY4cWF3Z3dneXJtVXYx?=
 =?utf-8?B?dDJHdWZjYXd3SVptRk00akZmdU5uVHpGc01nb2tHOCszaU5IOWJOWFJmMXFo?=
 =?utf-8?B?dno1Y0lkSnRzR1AyaE1sYW43TldvaWZWKzZ2Y25rSHoydHFRVDh6K29SZnVj?=
 =?utf-8?B?cjNMcDZycC9VWjU4WXZ2Ujlydk8zeTkvNVBKb2tXL0w5TEJrSk1xaXBPaEVD?=
 =?utf-8?B?QWt6bldvN2hpc2JCYXRDY0pWS3EyT3kyLzV4Mm9ZUmNuYUJWZXN0aEdpdmxJ?=
 =?utf-8?B?NzAycmZQbDd5RldXSmtCL2VadDhKQWpnTDdlSXR4R2dqRC9tK3luQUZpN0Fq?=
 =?utf-8?B?T3dhaTl1YTV4ZjdtaGdoZHZhdXdwclRIOU1tMW5DQ0ZCUWgxaFdIZ0UwVk44?=
 =?utf-8?B?ckJEdXpiVXVCczUrZE1xd08wWUVwYWlueDFYM2J5dzlsdlJONllsMWF6MUdD?=
 =?utf-8?B?LzFYaXFXWmhXS2t4U3ZqQXVRL1JsODlJODRjUkV6L1ljYzc0amkwMHlETnQ5?=
 =?utf-8?B?TXI5S0xCRTV1bVFOT0J1VTNNV241UDVvc1pINWxVVWNVWE5JVjFTcFo1MTRw?=
 =?utf-8?B?VnlrMUE1NzEyT3Zta3o1MHppREJaa3FhTStSYWlweXhTZkVwZ2tLcEcxZEVa?=
 =?utf-8?B?Y0FaMCt3MEljaHVPTGw5dlAxOWt0UFEyUlQxK0RkRStFcGFCVjZXYThBcXd2?=
 =?utf-8?B?MkYxU2hncHZwT1RTWldYS1ZWZTdYSk5iMzZkVjUrYkRJRDB3KzgzalhGZ21P?=
 =?utf-8?B?REZWR2tMOWRERlBXWForV3RqYUI3OWlhOEljMnptWTE3eUh2MkxVcW9iSHZJ?=
 =?utf-8?B?eWZkTnhCc0pRdVJISllsemw1UXBJaG5WcXpkNzZOdFFnaGdueUdjMTY4azdl?=
 =?utf-8?B?ODZkemMwQnZlcStnREFjb21xdW5nUUFscGRzdEtmM3NEalM4Ym1scUJEejJU?=
 =?utf-8?B?QXJNYWh2TlR5UTQzVnBWaVR6TlNacjFuMmFUV2ZKYnZHdGJHY2M4S0NKRlBa?=
 =?utf-8?B?S0VjOUkxZGZpOFM0MVNZaGNWYWlaMC9xVFZVQzdEaXFMVTRqeTlveHcyS2Rw?=
 =?utf-8?B?V1I5RGlrVHBiQkpuZ2dlVlBZaklYdTRlcU84aFhMSmo3dm12RTR1STA3WlMr?=
 =?utf-8?B?RThXWUxDWkJTNkxZSkU2aFNVeEI2TTZKYzBsTXl6eS85N0h4NENEa3hCTHVY?=
 =?utf-8?B?QS9lSEtySFBnc2gyNDZWM0tMUlQ5RU9xU2FnQ1dXN0g0cU5JTDhMSFFiMEx0?=
 =?utf-8?B?THYxcTJ1ZVhVbjNGTC8yKy9kaVRMNjk1Q0tlUzRnaFhiZXZIWVBiOXpoVGJN?=
 =?utf-8?B?Sk1DbEdCaEpSRzFDdGdTdk1kRi95UFVHdGs3bWIvckNiamdQQTkwd2VnTVZQ?=
 =?utf-8?B?ZGhoMmxNbzI0R29scUJIc2w3bE1TTldqRGpaNkQ2S2VZTys5UURhYm1TOVU5?=
 =?utf-8?B?ZjhtSi9neHBxY3Z2K3FUWk9nRTJFa2Exc1R2dEFucmUvVzMxNHhVaE9xeEhi?=
 =?utf-8?B?NUhlMkcrZEUvR3QxRm1oM0dsV2hsb0lEU3QyUXBoanZYdGVGeWhUMzVWRXRC?=
 =?utf-8?B?QjBWM0ZRYndPYkNuK3Zod1ZsOVp0TWM3dWFtMFhjTnFYUW52QnE1WWFFREdv?=
 =?utf-8?Q?KoLE6f48IQ8AV+czlEbe6tY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ee95a2-f74a-4571-751b-08d9d697e75c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 13:23:36.2462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SgZ7j69jKBWZpltFf69M+a4RN1FIVWb18nPeO8VQrUhzedKx6IXyb0X3ZOAUllXJ8djQIcwj7yVdabqudHSXTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5267
X-OriginatorOrg: citrix.com

On Thu, Nov 25, 2021 at 01:02:50PM +0200, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> At the moment, we always allocate an extra 16 slots for IO handlers
> (see MAX_IO_HANDLER). So while adding IO trap handlers for the emulated
> MSI-X registers we need to explicitly tell that we have additional IO
> handlers, so those are accounted.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

LGTM, just one comment below. This will require an Ack from the Arm
guys.

> ---
> Cc: Julien Grall <julien@xen.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> ---
> This actually moved here from the part 2 of the prep work for PCI
> passthrough on Arm as it seems to be the proper place for it.
> 
> New in v5
> ---
>  xen/arch/arm/vpci.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index 3d134f42d07e..902f8491e030 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -134,6 +134,8 @@ static int vpci_get_num_handlers_cb(struct domain *d,
>  
>  unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
>  {
> +    unsigned int count;
> +
>      if ( !has_vpci(d) )
>          return 0;
>  
> @@ -145,7 +147,18 @@ unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
>      }
>  
>      /* For a single emulated host bridge's configuration space. */
> -    return 1;
> +    count = 1;
> +
> +#ifdef CONFIG_HAS_PCI_MSI
> +    /*
> +     * There's a single MSI-X MMIO handler that deals with both PBA
> +     * and MSI-X tables per each PCI device being passed through.
> +     * Maximum number of emulated virtual devices is VPCI_MAX_VIRT_DEV.
> +     */
> +    count += VPCI_MAX_VIRT_DEV;

You could also use IS_ENABLED(CONFIG_HAS_PCI_MSI) since
VPCI_MAX_VIRT_DEV is defined unconditionally.

Thanks, Roger.

