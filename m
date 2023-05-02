Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8D26F4D96
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 01:31:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528848.822498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzRy-0004Ff-NF; Tue, 02 May 2023 23:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528848.822498; Tue, 02 May 2023 23:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzRy-0004CO-Jm; Tue, 02 May 2023 23:30:26 +0000
Received: by outflank-mailman (input) for mailman id 528848;
 Tue, 02 May 2023 23:30:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sTLj=AX=citrix.com=prvs=479cfccc8=jennifer.herbert@srs-se1.protection.inumbo.net>)
 id 1ptzRx-0004CI-E6
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 23:30:25 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4db69382-e941-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 01:30:22 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 19:29:57 -0400
Received: from DS7PR03MB5414.namprd03.prod.outlook.com (2603:10b6:5:2c2::6) by
 BN9PR03MB5964.namprd03.prod.outlook.com (2603:10b6:408:135::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.31; Tue, 2 May 2023 23:29:55 +0000
Received: from DS7PR03MB5414.namprd03.prod.outlook.com
 ([fe80::fdfd:97e5:7c55:82d]) by DS7PR03MB5414.namprd03.prod.outlook.com
 ([fe80::fdfd:97e5:7c55:82d%6]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 23:29:54 +0000
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
X-Inumbo-ID: 4db69382-e941-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683070222;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PtilvS3couIDxORSsS51S+eP1j16D5Wq5MhXfN+iXfo=;
  b=Lx8o6MI/Vzba/YAdSME1pyYFWG7PjLC0flO/KbpQFrzgcy3POk8TS0Fk
   0/rDZKQXJRMDebzEHec5wuVekf3Opbr8jaLu7f5ZQ8ru6sh1L/WEwLuzP
   Tj++4d+Gn9FCOb68m9RIIfwNfI3cGGAtFH8JdUH6K49F8MjJfOfv4Mr8c
   k=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 108052479
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Da4lkqMDv4yCtgrvrR2/lsFynXyQoLVcMsEvi/4bfWQNrUp20mQHy
 GBOCmjQPfuIamL8ctEkYdyy8EoHu5WBzdRqHgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tF5gZmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0ttUAkpi1
 +wfEwFOfgKkvO2c76i8FfY506zPLOGzVG8ekldJ6GiASNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PpxujaCpOBy+OGF3N79eNGMQ8Rbk1zep
 m/c9WnjHjkRNcCFyCrD+XWp7gPKtXqjCNpPTuHnp5aGhnW8nn04GDE8b2KrsMGQm0jhBYldA
 G0br39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9dJ6G3rKdrDf3My5FK2YHPHYAVVFcvYilp5wvhBXSSNolCLSyktD+BTD3x
 XaNsTQ6gLIQy8UM0s1X4Gz6vt5lnbCRJiZd2+kddjv+hu+lTOZJv7CV1GU=
IronPort-HdrOrdr: A9a23:dAQUaq19z5GohPKf+9JByQqjBdVxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjmfZq6z+8O3WBxB8bYYOCCggeVxe5ZnOjfKlHbalTDH6tmpN
 9dmstFeaLN5DpB7foSiTPQe7hA/DDEytHPuQ639QYQcegAUdAE0+4WMHf+LqQ7fnglOXJvf6
 Dsm/av6gDQMEj+Ka+Adwo4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/PwmE0gwYWzZvx65n1W
 TeiQT26oiqrvn+k3bnpiLuxqUTvOGk5spIBcSKhMRQAjLwijywbIAkd6yesCszqOSP7k9vtN
 XXuR8vM+l69nuUVGCophnG3RXmzV8VmjXf4G7dpUGmjd3yRTo8BcYErYVFciHB405lmN1nyq
 pE00+QqpISVHr77W/AzumNcysvulu/oHIkn+JWp3tDUbEGYLsUiYAE5ktaHLoJASq/woE6F+
 tFCt3a+Z9tABunRkGcmlMq7M2nX3w1EBvDak8euvaN2zwTp3x9x1tw/r1qol4wsLYGD7VU7e
 XNNapl0JtUSNUNUK57DOAdBeOqF23kW3v3QSOvCGWiMJtCF2PGqpbx7rlwzvqtYoY0wJw7n4
 mEeE9EtFQ1Z1nlBaS1rdN2Gyj2MSaAtAnWu4NjD8ATgMy4eFOrC1zNdLkWqbrhnx1FaferH8
 paO/ptcorexCXVaMF0NjbFKulvwEklIbMoU+kAKiOzS+LwW/rXX7/gAYDuDYuoNwoYcUXCJV
 ZGdATPBax7nzKWsznD8VTsZ08=
X-Talos-CUID: 9a23:cVMy3GMVvauN2+5DZQpk32I2CsceQz7N3lDrLGWXE2E2V+jA
X-Talos-MUID: 9a23:eJxp7wroHYq6VhtgiZgezx46Jex4z46UMVAcqbwXvZbabi5bGjjI2Q==
X-IronPort-AV: E=Sophos;i="5.99,245,1677560400"; 
   d="scan'208";a="108052479"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVR4DddfZ3VJmR/6dMjgtHSn1mo4zeA5vuSO0NwBDd0InMmvuZ7pCLPvzUynRO8Waqr0EWQZx53EV6C46UsPKJyOvdblBJfuWlm9zBm9jkMeYyNh1MUkkstTiudunpBKdbc1WfJkGdiIDOo2e5sqEtK71JTgO6aqZ0HzVNM9FDwdZooYxzM67NibvQvV+05/9ZMFk3KiN37R12dKM4PAlTTi7sGh7+pUCOrzaHxsUO/DOrl+V5tWo7IQFaNhbpFXYRBiyNJamJ64n98m36tJBfxBBpJCWe/IPeKwuDOs4fDs+I40+YOkOEmAmK2uiBTjnXafqnh3bVxGZRined8d1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnOUfgqG72GzlNLoWtCu9JubUWnp35TFYzuwlitj5yg=;
 b=YuIuVMJWsBt5FmpTJVbUB4jUYSLJQ8sC+1doBAs0Mzlq45fs15kgqxMo04iz5usFdwzM1sb6yaXFJtf0Ug04RzJnkNsjLGZ5MLTgEvN4ED6Gr7+UQLzgpP39y63xta8A+wPvJvEfyGSvsUisALGw9o9Zol/ezOzM/atyP6Ze7KScrLANM041MbVRJnQW/HGPV1zoa7V+HpjjzN/8ThsWbiceDO27mHOg3bgTBXbc8IysSh0n+PFcIrbW8uRq1TDnH+iFMpdujMTDSmwn2HNwz68wgybunU4+sx7hQRjmD3MOf4nbScyKn6xOtQWd6F9oegPJZ5/LJkWC39F5BpfVKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnOUfgqG72GzlNLoWtCu9JubUWnp35TFYzuwlitj5yg=;
 b=KDIgP2XvydV+vk5M8aLAtUYvKsWuTQ0u3F2Hn+hAQBGSzH0wixzx1v+1mDs2A0osC+IOCjQnhuZCVnEZw1hIFibiMR+PLtGMQBAqOXiOad7PQtzZH+VlFfRY14SDws9rFwTgsOGhxuKr7EfdV08qvjtFomToh9dEbnit8rMnlSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <91620112-039e-9e8b-9bac-452ea9ecddaf@citrix.com>
Date: Wed, 3 May 2023 00:29:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 2/2] acpi: Add TPM2 interface definition.
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230425174733.795961-1-jennifer.herbert@citrix.com>
 <20230425174733.795961-3-jennifer.herbert@citrix.com>
 <f9e72c6c-9915-9995-06c0-0a0ac037bde1@suse.com>
From: Jennifer Herbert <jennifer.herbert@citrix.com>
In-Reply-To: <f9e72c6c-9915-9995-06c0-0a0ac037bde1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0417.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::8) To DS7PR03MB5414.namprd03.prod.outlook.com
 (2603:10b6:5:2c2::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB5414:EE_|BN9PR03MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: 99b355db-cd5a-4766-ac4b-08db4b652284
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p9Zr2Wz0k+9oM26q2yO3LI+jZNdYZ1KAukRtO0O4X5pwY4hUUPrN3l9Na6ircHiE5y41jorQ5smd/U7lIzfGeH3ggia9vlERZSm1JwziagJUTqvFMaTmyX3TmicjThTX89yjnyyhGYwiw4WDZKvfv95JNmWLGqE7VusmM+uqUtAIXG4JQdGUijRvRBLJ4FyykP8dNKKeJ5D2+yV2k40R7g/C1yR2pqx7wd/WYe+WCm6TUY4H4uwte0DhpUOg7XPrdM/6xC0Zwj7GZYlmOHyANcf8enqd3o3z5IjRsrUlJDtC51brnFea+RYDM0kBMkbGtes/XWp0p1CxdSKAkN2gYiF8qeU88ilhu/kGK+QD8b0MxfHslhlf+BsNuVlQj1stmkQbuLK673lSt7mVwPFQ9vgN7KyrRw4KWb/OyBh0wClwSfUT/EDSkIu3Wq4MiB4xsMyetuElgp2jNocl3YKmPJ0gydPOqXzCvCzVKsG6xrorHeq6hPZjPy+gBw5Yh5BF2Juj2Ch/a+NVqXTtCIjzaye7YXXhdIbKDmSAx4oulaVbTQKieyFtme2imVhwBGNS8RwcblgPUV1/YxQkjxd6We5pdWThLj8y9UPa9lWhjJ1Vnd97WVcBdEAMD3QoLj78WGW0jFkj2CJ35PW4C3o3ZS1FzRPVIvM5jk3GuPGOxVQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5414.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(136003)(366004)(376002)(451199021)(6666004)(6486002)(2906002)(6512007)(6506007)(26005)(53546011)(186003)(54906003)(2616005)(31686004)(36756003)(478600001)(41300700001)(66946007)(44832011)(82960400001)(316002)(8936002)(38100700002)(8676002)(5660300002)(86362001)(66476007)(66556008)(6916009)(4326008)(31696002)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkVKMVZqakFwS202ajVMQUEvbGZ4VzEwbGt4RWhJVWE5eUozOUJVazI0Wklx?=
 =?utf-8?B?TnJPWG1wNEQ1VzN4MUJ4Q2lUMldvTEUvRFh6REoyeElSeXp0UW4ybmh1cUhT?=
 =?utf-8?B?cFh3Zmt4OGcwQWpBS2ROZk16VUZsWGNEL2hRK0Y1YzRqWDBsYXBwNmlzaEZK?=
 =?utf-8?B?MkpSeHRzT09JWUx3a3ZaUmM5WEYyMERVZ0V4ZXdrc3JOSkRZNUQ3NkFvMnVs?=
 =?utf-8?B?NW9MWElTWTJkZmF1UmdGQk95dUpOMUJablQrcEVsZlFSMGQ0Y2hCVm5oN0pl?=
 =?utf-8?B?Rm5TSHVoRGZLUkF6cGJaeURaNklSOFg2djBaaFBhNjhLZmZFN0pwbEczUkFH?=
 =?utf-8?B?Um4vR1pYTjdtZEUyN0pSdWxxM3B5aEZrejZxTkJoQk13NzBVSTF6T3B2d29W?=
 =?utf-8?B?aXpuN2xMNGl6UFlHbVZIRHdwc21xb1hhbUdKL3h2cmdkM3crSSs0YUNKVmNQ?=
 =?utf-8?B?UWpYOStTT05RSG94ai9xcTcwK2RGdDRRR2JVYUY3Z1RTazluMWoyWG92aHFZ?=
 =?utf-8?B?QzFvR0ZOU2NBWlBVSmlhdThNZkl3aUIvMnhrYjd0V2lQOGtEUHhBbmkzRVNl?=
 =?utf-8?B?MkU1YVFTRnNzMDFGQjRiMXFUKy9oM09SNFcwRUhaM216SCtVeUNWaEpxMHNj?=
 =?utf-8?B?eTlSVmp3QjVTNStUOWhCYnllSlBKaVZCc1lFeUE5b3hPcHpxR3Bqd2FHdjBO?=
 =?utf-8?B?OEl4OWJOOUh2aDZjbVBwRmdNTUZ3SFcwNSswLzNINkYwTG5qRFA1Nk1WWnBQ?=
 =?utf-8?B?c2VkbjNMOXZRMmNUbi9iK1BkOUVpckxKcmR6WGQ1Tms3Vys0NDAvVHJxanp5?=
 =?utf-8?B?emQ3akNxM3o0aG52OWxxbGJGMFhzQWtMNHZ1dEwxU1lDTW9DVzdUNUNUY2Nw?=
 =?utf-8?B?SjBYd2paU1JQU1BHa1B0enYvUEFrQ3M4RmNhUklxSXlTRk9xdFUvbGo1Z0xE?=
 =?utf-8?B?MzlDKzc5Z1ZueW84amJBZmxqdEI4VDNKNmcxVSswa01RNnNqc1R0UmpvQVF3?=
 =?utf-8?B?UDJsK09hYmRNa293dHM2cWdLSTd2d0Z2cm9kNUJyWTdoM05OSVpqNU01akV3?=
 =?utf-8?B?MXpmTU1GTzIyNWt5K1A1QWlBTSt6NDhtdzBLUXpkVEg5ZDRxbWpEckgrTVhm?=
 =?utf-8?B?ejE5Ymc1T0lDWTZCUDFsemtrQzBsWTF3MmRqa2lyc292SlFUeTgrNnFlVW8z?=
 =?utf-8?B?QWpXejFoWjQvTGU5QS8wWmxMam8vNHIzU2Z6QjVKRU1kTlF0RkZkS0hIejN3?=
 =?utf-8?B?NHkycGsvNU1UQW56NklUd2JoazR0T0dxRDhsMGQ3RG5mLzNYeFltaXMvT0lD?=
 =?utf-8?B?ZGs0R0NPSUVwSG1qenhMT3RxKy9QQzV3bUxQamRDb2FNd21NaC9meS9kZG40?=
 =?utf-8?B?Ky9nOVNuUEtKTlB4RmJxeXlSYTE3WThLbGxZWkkrV3VabkFwbi9tbHJaZUk4?=
 =?utf-8?B?aVo5MEZNZFVYaDJsTTJ3ODZNd2FWTHcwcUZSajU2aHBCR0xLVlcwSnZkQWxG?=
 =?utf-8?B?TzNRb1FCZFdId2RBTUoycUVESnFiNGN5Z3phYVh6MXpkeFlLRENXY2ZSL1h4?=
 =?utf-8?B?T2wweXMvemtJdHZJRU1NZGpLWDE2L2tlV210L1M2L3BCOTVYd2lPRGZYaHdv?=
 =?utf-8?B?TnlOdm5sS2dkaXVVTGo2Y1ArV1pTK1FOaE14MHdHYjMxU3JsdjdXV3hrNVVE?=
 =?utf-8?B?OWhyRXVyb1c4TWxsRXJmbitma2hpY2hkRTFOakpmd3d3Q1lMNElwUzJwcEdS?=
 =?utf-8?B?dnRLOWRUeHlmbjBiRTh0OWRFT0NqZDRQNm1KK1JwNG5mVSt3R2RVa0pRaG1z?=
 =?utf-8?B?WlpEL0hCMHFobjFybVdRMVdTb3Ryd3dLdzRPWnM3aHpjd3RDOTV0Tm1mQ0dI?=
 =?utf-8?B?NkVFOHRoYS90UGlyaFlxODllSEpZc1UrSmJxdVBETGhJRUdxOTQ4YVUveHBp?=
 =?utf-8?B?dlU1L3g1enUyYzZSdUhuT0xXVFhRanpjN09OL0xwTHdqQlBiY2xQcGJDWCt3?=
 =?utf-8?B?OStseEZJaVNPd0tDcy9aZk14endOcExGWkE5QmZ0c1QzU1NxVFVUaXlxa1h2?=
 =?utf-8?B?OHRzUFp0TEl4RDFoNlVTbVQ3OUxBOXZ0UmwzTVlNa1lBaTA1dUNrQnRyT1JT?=
 =?utf-8?B?aGRKdEpBZlJoeDgrU3Ria2w0UWNTa3JGWkJMZDR1bE4xalFWV3o2d0pQOVJF?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9ycWrDL90mzr8SruEvNFf8nhroJMOFLF4OjtW1G79tupabDWwN43LJDGU+toDFIm4Mtf5iMoLv6GIL3oTwMiDTc7K2b6GBieWZqnIeIkNAn1/SZxvUD+E3+d0hQV+Ob0P6dCPqdUtQf2gQ0ixUXMbMXDBm7ysEKLYYG64iDJUPvTOlKJDm7G9fqnBsqnZhLiE4l+Q7fd5PlLLimtTc1E26oLfLNdRhh2tkhwEWKcgNPq+3beDVQQjMz3otWT4rHexEF5UzLLtr5QoYron2beqhhtOqRokRGwmSScokJoS+OTBPX38DXJ2owT3jkapn4tH7vEizahntowOY54iElN7aOu2H6zJdwzrdxVD20CdPwVgxBB7feJwt5hEAa17UZpuG6ZaEFpevvhNyAvSTi5Vd9SQyprwMK9wo/QBcGQEJoVzND/kpH56RZHc+oXyFWFfdR1NRhGb+8Z98VKXBKrF9O8nEQLPayO+wPI5ArBqusgkbQygl45duIBXEUZ/VOSLpKGEOb3a3yJwI5hhpFSqNwJTvvueVE8DGw4umx5NxwWsbPzsIkdL29r/rOC/yavk7O0ZuwFcBS/6JeY5/glIbWfev0tQuFmJ47oWVMCGDl2FZwIPRJO0blwl0/mJ+XdkVuX7UNtCzDVCqA0UhEceFPfP4aBQxny4UNV4IgTfg4S3P0i0v20huOHxZTmMiTaQUXQb98oI7cz4/O3CFnVIIti2ZbfIY9XfmloSTbcZLc85w0wv6UNME/aTsU74XJwoh/PYhA+jsULEKNwW2c10QWM3NHBvuvoSBykfWAXca4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b355db-cd5a-4766-ac4b-08db4b652284
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5414.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 23:29:54.8173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: boBBs/8emxpfjGyoMwtLTTdC+jqCJvh5hIZlQcXr9EBSuADaQ6m3FNu8sTFEvw40t4iUcdVXqsLj3bmldDtmNIDyo4KJCfXX1bluOszZ1/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5964

On 02/05/2023 14:41, Jan Beulich wrote:
> On 25.04.2023 19:47, Jennifer Herbert wrote:
>> --- a/tools/libacpi/acpi2_0.h
>> +++ b/tools/libacpi/acpi2_0.h
>> @@ -121,6 +121,36 @@ struct acpi_20_tcpa {
>>   };
>>   #define ACPI_2_0_TCPA_LAML_SIZE (64*1024)
>>   
>> +/*
>> + * TPM2
>> + */
> Nit: While I'm willing to accept the comment style violation here as
> (apparently) intentional, ...

Well, I was trying to keep the file consistant.   As far as I can tell, 
this styling is used thoughout the file - unless I'm misunderstanding 
your 'Nit'. (You object to a multi-line coment used for a single line? )
But I'm codes style blind, so just say how you want it.


>> +struct acpi_20_tpm2 {
>> +    struct acpi_header header;
>> +    uint16_t platform_class;
>> +    uint16_t reserved;
>> +    uint64_t control_area_address;
>> +    uint32_t start_method;
>> +    uint8_t start_method_params[12];
>> +    uint32_t log_area_minimum_length;
>> +    uint64_t log_area_start_address;
>> +};
>> +#define TPM2_ACPI_CLASS_CLIENT      0
>> +#define TPM2_START_METHOD_CRB       7
>> +
>> +/* TPM register I/O Mapped region, location of which defined in the
>> + * TCG PC Client Platform TPM Profile Specification for TPM 2.0.
>> + * See table 9 - Only Locality 0 is used here. This is emulated by QEMU.
>> + * Definition of Register space is found in table 12.
>> + */
> ... this comment wants adjusting to hypervisor style (/* on its own line),
> as that looks to be the aimed-at style in this file.

Will do.


>> @@ -352,6 +353,7 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
>>       struct acpi_20_tcpa *tcpa;
>>       unsigned char *ssdt;
>>       void *lasa;
>> +    struct acpi_20_tpm2 *tpm2;
> Could I talk you into moving this up by two lines, such that it'll be
> adjacent to "tcpa"?


No problem.


>> @@ -450,6 +452,43 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
>>                                tcpa->header.length);
>>               }
>>               break;
>> +
>> +        case 2:
>> +            /* Check VID stored in bits 37:32 (3rd 16 bit word) of CRB
>> +             * identifier register.  See table 16 of TCG PC client platform
>> +             * TPM profile specification for TPM 2.0.
>> +             */
> Nit: This comment again wants a style adjustment.

ok


>> --- /dev/null
>> +++ b/tools/libacpi/ssdt_tpm2.asl
>> @@ -0,0 +1,36 @@
>> +/*
>> + * ssdt_tpm2.asl
>> + *
>> + * Copyright (c) 2018-2022, Citrix Systems, Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU Lesser General Public License as published
>> + * by the Free Software Foundation; version 2.1 only. with the special
>> + * exception on linking described in file LICENSE.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU Lesser General Public License for more details.
>> + */
> While the full conversion to SPDX was done in the hypervisor only so far,
> I think new tool stack source files would better use the much shorter
> SPDX equivalent, too.

OK, this is where I get a bit confused.  I belive I copied the licence 
from ssdt_tpm.asl, for consistancy.

So I think i need to use a 'LGPL-2.1-only' but then it says its using 
exceptions on linking as discribed in LICENSE, but um, which LICENSE 
file?  So i'm not sure what exception I should be adding. Do you know?


> Then on top of Jason's R-b,
> Acked-by: Jan Beulich <jbeulich@suse.com>
>
> Jan


Thanks,

-jenny


