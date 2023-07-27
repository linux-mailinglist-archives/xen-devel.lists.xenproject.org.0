Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EE27655CE
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 16:20:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571131.894236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP1py-0002BP-IE; Thu, 27 Jul 2023 14:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571131.894236; Thu, 27 Jul 2023 14:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP1py-00028d-Dv; Thu, 27 Jul 2023 14:19:30 +0000
Received: by outflank-mailman (input) for mailman id 571131;
 Thu, 27 Jul 2023 14:19:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Us1z=DN=citrix.com=prvs=565118259=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qP1pw-00028X-SD
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 14:19:29 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96d6640a-2c88-11ee-b248-6b7b168915f2;
 Thu, 27 Jul 2023 16:19:27 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jul 2023 10:19:24 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BN9PR03MB6073.namprd03.prod.outlook.com (2603:10b6:408:136::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 14:19:21 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 14:19:21 +0000
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
X-Inumbo-ID: 96d6640a-2c88-11ee-b248-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690467567;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=9WjXrcRmfMv116yU7xIlm0tWeCzly68594VploG+xww=;
  b=bX1tUKKnC8cokE3BvnUN4yDWPw2zVkJxPLlWMo0fHgUJkwqIlRxLmolO
   VN04BpFmfaAEN8WgW/MU/ZM7yzx2jThdcr2tDx3Olsdo7USNYaDlm40pH
   sE7+ODVr6Hx5VC5QoIuP0viNxs8CeUIJZUh8d18p/RcHibZLBvIVBExO0
   Y=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 118089751
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6C0KIKOPXCXAbYnvrR1nlsFynXyQoLVcMsEvi/4bfWQNrUoi3zMOn
 TdLDG+BPaqPYWunfNh1bovk90IAvZ+ByoVmQQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tH5ANmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uNuO19i9
 /AiETsUYym/1r2WxKOZe8A506zPLOGzVG8ekldJ6GiASNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PpxujaDpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyv83r+ewn6iMG4UPLmby8BInGLD/XAKCiNOTQbqgPCgp1HrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/I+wBGAzOzT+QnxLmsJUD9HLsAnvckeRDo22
 1vPlNTsbRR3uaCRYWKQ8PGTtzzaETgYKyoOaDEJSSMB4sL/u8cjgxTXVNFhHaWpyNrvFlnNL
 yuiqSE/g/AZi54N3qDipFTf2Wvy9t7OUxI/4RjRUiS99ARlaYW5Zouur1/G8fJHK4XfRV6E1
 JQZp/WjACk1JcnlvESwrC8lRdlFO97t3OXgvGNS
IronPort-HdrOrdr: A9a23:nuMLfK2DaJS1mX3DfR/l/gqjBJAkLtp133Aq2lEZdPU1SL38qy
 nKpp536faaslossR0b9uxoQZPwJk80lqQFg7X5X43DYOCOggLBEGgF1+XfKlbbak7DH4BmtJ
 uIRJIObOEYXWIQsS8j2njDLz/7+qj+zEl0v5a5856wd3AQV0i/1XYFNu71encGPTV7OQ==
X-Talos-CUID: =?us-ascii?q?9a23=3A0gcZz2gEJkSkpw1hVmyaD904JjJud2Tn8lvSL3W?=
 =?us-ascii?q?BAn9kcYHEFn+U6YFVup87?=
X-Talos-MUID: 9a23:/EE9HwqcAsOF+iXy6nAezzVBCflK/5v+M1wUk6teo5TVFCVpFijI2Q==
X-IronPort-AV: E=Sophos;i="6.01,235,1684814400"; 
   d="scan'208";a="118089751"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eoix8PqLt9REgjF+hiKxHQhJn8qHPtswmU6YGetmVjJ7LE2JtK/4qnldrkBMEnAVQafLoW5KTtiVKmOz4srqiJqZchOzy3DiFt+Ny64Cxa5n3HJ/YzkS/pos0r3BLmGeUkYnciIsPjRwxszXD45xGIw+VEF5LhVvKJJ2Hs5MBjgCN34XTu83YqtTjPGlPGxuW9K7KU2CmSi94PgVX99qM4TtghfPESnGuz81Pe8COFCbgcP36kzr9DACqbPffHDGhsoKyr+vU0H2wM/SaWBcnyt1bBlBvWtPsVTEVqIvRhDH1G/zZMF4135Msixb4X3RZKkwGRVHddOsa0kqSul5HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJXkHpHAk1rR5kktsJKiq/Dpntj8OpcKOqnnMgYJ2OU=;
 b=BAuq7Tanrzx6MSGRYbOFmFnFuwbfXNjzjrGMDW0wB+VwZM694d8/FhZ5ncdKjx3rNmIN15WAroCKyk/XfymTx9F4bnpY9WMr9uyXlQ+taV6pS/JK2yTP4EMRHnn+TdpG3hSO0/M9hoYOeUOKm0egacMnJV6Mi/gnlVmJQ44ODA3wm/nD7SZbthLK8rcSh0ec/rHuMLMQ/N9fE0MJ+dYaSqYmAkcE+LCEryN06ObSb0/fQLdf+WIoQL3MDCrVxAinHmFOsYyLZd+o2hcrHLJX88mofjrDevMhydVXrp0zjXL6e39YOm47CDRDWWHqJzEjLK/KuEFe7M9HEUnGO5aXrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJXkHpHAk1rR5kktsJKiq/Dpntj8OpcKOqnnMgYJ2OU=;
 b=gX34IoBlLt3AEQGC3mkpNhPBGXnulYhaH1Z7czExB+8K4a7eFdlDE1qOUMdls8gzHKOVYfK5K4twVH8g4FDglBJquU2uNWysGhwn4YbhU/3PyInshPVdgyHqsgtDih+2m7E/mTypjBXQn7gM7ctRbPb20UVovP3FZV98WDeM0mw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 27 Jul 2023 16:19:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 4/4] x86/iommu: pass full IO-APIC RTE for remapping
 table update
Message-ID: <ZMJ84u9_tDBcc5xN@MacBook-Air-de-Roger.local>
References: <20230726125508.78704-1-roger.pau@citrix.com>
 <20230726125508.78704-5-roger.pau@citrix.com>
 <4e9681c7-472e-ee6b-38e7-fc7fb28a2b07@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4e9681c7-472e-ee6b-38e7-fc7fb28a2b07@suse.com>
X-ClientProxiedBy: LO4P265CA0286.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::13) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BN9PR03MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: adf47f6d-9685-4e64-6efe-08db8eac7856
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PApk3cqul/qcV6CPzkX/EBE7BrBT5V76edLSVbZDx8l48tgyB15ujKXtImo7GC1ZDcYokR9BUdkUOo+xgeRkGylrqs0IAeYc+zehu7BaIg1j1DR0O7gnQcA+zOZkUSWXoTyGyIin5X2KugKcKHAJnAhizc09l+Q39HZGpdf3EYyGFaWxNTqK2y+iwvdEHVYCtoRTIRkZte0RJndfQzlFM2L/GFNKGw1mkrZ/P2i94qUHhXCmOVBXtQV5R8rqwjDUtYjyRVytHCqB3USAdpVkVhAmf5tUHv3qQGBhvSM9r21o1qyIfEh9sJdIBg7wM6jQ3YMOvIpr33/NmtLw0BZ1Vqf2AcS0HxbS1PXhH6OKDP9mVEytr6TTBzHEFSFXjr1/qyW4cH1fU6QTzg/TCLEogwRmYmOHS9KAEwRCbJH/mixWvBA1TA9IYfWu/BrGX81XM23VOWdyW77ZlBWmeTP7qFoDP6O2yFK9EyAv6Yt53wATwNkDsuzLGmByqtUD+W5VeFgJ3yB8c5d/5TOdoORJRVkYZ9utpPSr7xszFvMA6KgFrGSVurV53RV5YrVMXvfa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(366004)(451199021)(9686003)(6666004)(54906003)(6512007)(6486002)(478600001)(66556008)(53546011)(186003)(26005)(6506007)(15650500001)(66476007)(2906002)(4326008)(316002)(5660300002)(8676002)(8936002)(41300700001)(66946007)(82960400001)(6916009)(38100700002)(85182001)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVcrWTB0cEpLVmRVdjhVZ2lDS3lQL0tkdVJ3OXA4UHhoWis1MWx4UnVhV014?=
 =?utf-8?B?NzhxSUcxK1YycEtuQVVINllKR3BuQVpyYUJLMkYxbWYxREN5dzlUZ2g5RVFS?=
 =?utf-8?B?dm9nVyttMEtwdG5BVmJFdzFSMSt3UzNVWlZiZFBYdm8wYkVHYW9WU2xSMVJO?=
 =?utf-8?B?NWlpaEN2OUdPZkcxSm5leEQ1VEhYQ1RrSnBHQWc2QW41NEtBSnpuS05uY2Rj?=
 =?utf-8?B?ejZmNGZEQ2VLdHpDQzdqOFJjTVFNU2ZMTWwyMk9EVHZQZnZVY2dFTFlBSVJN?=
 =?utf-8?B?eWZrUXBHVlF1Q2wwY3JkZnZLaWtlV001N1hSUmsxQlZWbDNxakxSSjJqTHNH?=
 =?utf-8?B?NWwwLzFHOGlHUVR3RUxZTGxVa21jWGNJUTA1d1ZLVFhZK3V0cGdnbnlFMTFC?=
 =?utf-8?B?REIzL0xFSEUwb082WXpBcWNrdlMzcmlTUzFieEo4dm5qSExJY3hhNjBkb1lB?=
 =?utf-8?B?bklyQStQdkZwNkZRcEF4QVU0SEpuTGdESE9pS3piL3FUeHJmV0JCS2Iwa05x?=
 =?utf-8?B?RUV1bXZQUXNqRGo3aERsdUNyV3BoNHN5TUtUdUFBZTFlSXBIcm5yNzhnZC9C?=
 =?utf-8?B?bWZHQUptQUxRNHNEYk1SdE1xbmJpTW5NL2xYWENmOS92RHZBU2RueVNBK1F0?=
 =?utf-8?B?TTViQldzejhmR2FjUG5jcXZQdUxhL28veWpiQjdwM2VqcjVDNmFSM29yby96?=
 =?utf-8?B?MHhXQ3h4UWxiOTR1ZzV0ZHJ6RFprMVV5OWFtNytIWFZKQVBCRXNLWExWVCti?=
 =?utf-8?B?U002aDdTdVlZR3dqVFBqbnJyZEhvOFp2YUdOM3MrSGdpRGczVzRndnM3VFVa?=
 =?utf-8?B?ZmlPSGlmbFFpUEFMU2QrdG8xNFBoZmhqdDROYVFhMDF0cmxLWWlMV2V3ek56?=
 =?utf-8?B?a2hBd0dBRlB3dzR4NWFnWDlCR3A0UE5qdk9XRVREWUo2K24zY0xZRjRHNGE1?=
 =?utf-8?B?QkF1RE1LbWM1V2xCR0xuMEVDdUNrQ1dKL0t6T1lJczNaOG1ETXJ4MUZBRFZ5?=
 =?utf-8?B?TUJkYnlmOGhVWlhhYVlXcEVieFkxNkJXd0d5eUJNRGVKZVloeU5ZU3cwNUdn?=
 =?utf-8?B?T1VFeWRMbjhJdXFHZElXUTZHalhzTzVvWm5NRDFNV28yTFZPUHRPY2NmYVFZ?=
 =?utf-8?B?NXBEWnJLRmJJOHl6bGthZzg0OEdtTURmcEdpRHp0b2NOdmYvK3lHSmFvTWc0?=
 =?utf-8?B?Zy9IejYrOXRrNGc4SGxRaUdNWkN4NllVRzNiL3lQamkrc1lDZ2hxdUdyZFV3?=
 =?utf-8?B?bUxSYjd1Y3M2V0FBQmFaeGhNbGVJY1g2MTB3a3puNzVvazFjT1lDa1cwNUFJ?=
 =?utf-8?B?aGVLU0x5Z29iVml4Zk1KaU50dFlEdnM4TmZEU0QvUTlzUUV0ZTRvTzV2Z2cw?=
 =?utf-8?B?SFJRNUU2bXFZUStURTZkejN0Uk9DTjAxcjQrTFpKNkwvdUtZL1J3SGpQSmhT?=
 =?utf-8?B?RHovVjVYWUhVQ2R4M1lwQlp4Q1ZxY0drUkw5bko2c2c3RFVrd3prNEp1R2Vj?=
 =?utf-8?B?aWl2NG5BTkZDcDVwbHNzSUhuSTBPaXRsbEliRlJxcEV3eFR3c3BuTXRaVGRo?=
 =?utf-8?B?cTMrYkNWTUZiSkh0RUIxQzBlcHpKVEh5TUtVZDN5UkhrUlNhcHhCSXR1b2dI?=
 =?utf-8?B?UEtGa0hMZlI3SGptL2JFSmJ6bW5DYVVNNGRkOG9HTFkzMVZ5VE84Wk04eWhG?=
 =?utf-8?B?M2lKK01kWkJYcW5oWlF4VlhMZ2VUV2tGMG9XUnZkL2MxbThsSjlvOTFRRWRV?=
 =?utf-8?B?KzB0T01PNjlpc0o3K2dXdXdzKzJGQ1dtdjZFSDZsN3ZUdkRkeDV0QzlqTjAy?=
 =?utf-8?B?Nnp0U2tiRXdPVnc1UUtmaE9ZNEZoUlFtM3lRQ2V3akx6TmIyTkdKdXRoaVd1?=
 =?utf-8?B?NGNaUEV4azFac3B0NUUzZjVwdktpaUR1UFl0dk5zZitHdmhFeVFvaGppUlo2?=
 =?utf-8?B?Y3VMSnJjaHh3U2RQTU5BcUp0K0owYThRU1JuYjhHUWpvYUxDMjc3T1hYQUdR?=
 =?utf-8?B?VWxMK25LRE51cGhPTXJ5NEJJb2hRYXQrSWp5aDJvMDlISGJCSk83cTNsTTJK?=
 =?utf-8?B?ZUZTenZwNkdDbWV5eWxncTliVENGM2Y1T3VwMEZheGRhejVKMDUzMVcxR25W?=
 =?utf-8?Q?FoZpwi+Y3M3RnX3v18y9o7DW1?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	x7rS+tB8bpCFyT7ugqw0x8zyAKU2g8LkGbXGx27oS97oBoItMjYCdErO91A8G5B2x9T+rVQfiwAXerqKNgM47KrZtOfK19t0NN3KAlZn3BiV9VXjn7bEkEXk5XCBvhcMR6grGFYD/QUDznX489u/ohLtV6TMEu4p5n8RBZ9hZOAOKSpRjV3eTYrrQ3BFygirMzo/4SQh2cCzkuPzmLQOVyEK4l6OZuij8Km9/me0wfpfYjziHaMBsRVA1K8nQ42bCHp5vOz3Z7ueNnUG7vMg/UeNxNN9fCboOShUjpwNJYsZttx7jAGIVm3IfUAKCwawb4UDvIygSyJ4dDyLOjR4mhcTXMwcyMXaA7lhmFcmJDMOIHBQbVFPb7YU4jGE4YsoAKXGOEdlZpvQJxkpNaeLZjYZomQ0toUHq+jaAjRqgZ4zSw46l33r226FzJ2h3C8gpLh0GSkVyZ/I8kbTRLEVq7xFnlsHbnXWE7RLkP7QEfdgo5zRSWZdWsfyBHDl5z3hfkFg1TC8K7FGKlWpU636ZW8arjHgnyNkoKp2pz8aAw/5TnQ5DKPVSNxO0zu0M4mmz6wP9UD7qU+RY9C8N0DTb3F648VD/KGF1NI4jquAYeIbH3c/U2z/B2i60Jce9d0UMjOEj5RnK+QlJgF6MCFSIgYG4BuZ4NzcwpWJoozUKEHQO62bSX2OBTyeDO4ekvafrGmgOJf2m8L6VqmugR1dpztBzreUSa6BMJYQzH2BqSUnnyM8DmHViLYqVodX/t+1scjst82o+Y2aW/SF3vBlAQlQJY5SPFj9ZDn8eODiTkp5cc0VkUiuT54fMS9t/tuaPK11dy34qwDhU19VcQd07MjI5i2WkDaB+FMV2JiWrXQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adf47f6d-9685-4e64-6efe-08db8eac7856
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 14:19:21.1556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JpEQ/P72HX2gZsLZXAZhp8Yfm+tt5kx+v7EnElx57QQ9qeJQvyx2vBquZ2cVZafkL+Fp3zUYFpPkHEDD7mu04w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6073

On Thu, Jul 27, 2023 at 02:39:06PM +0200, Jan Beulich wrote:
> On 26.07.2023 14:55, Roger Pau Monne wrote:
> > @@ -439,36 +430,45 @@ unsigned int cf_check io_apic_read_remap_rte(
> >  }
> >  
> >  void cf_check io_apic_write_remap_rte(
> > -    unsigned int apic, unsigned int reg, unsigned int value)
> > +    unsigned int apic, unsigned int pin, uint64_t rte)
> >  {
> > -    unsigned int pin = (reg - 0x10) / 2;
> > +    struct IO_xAPIC_route_entry new_rte = { .raw = rte };
> >      struct IO_xAPIC_route_entry old_rte = { };
> > -    struct IO_APIC_route_remap_entry *remap_rte;
> > -    unsigned int rte_upper = (reg & 1) ? 1 : 0;
> >      struct vtd_iommu *iommu = ioapic_to_iommu(IO_APIC_ID(apic));
> > -    int saved_mask;
> > -
> > -    old_rte = __ioapic_read_entry(apic, pin, true);
> > +    bool masked = true;
> > +    int rc;
> >  
> > -    remap_rte = (struct IO_APIC_route_remap_entry *) &old_rte;
> > -
> > -    /* mask the interrupt while we change the intremap table */
> > -    saved_mask = remap_rte->mask;
> > -    remap_rte->mask = 1;
> > -    __io_apic_write(apic, reg & ~1, *(u32 *)&old_rte);
> > -    remap_rte->mask = saved_mask;
> > -
> > -    if ( ioapic_rte_to_remap_entry(iommu, apic, pin,
> > -                                   &old_rte, rte_upper, value) )
> > +    if ( !cpu_has_cx16 )
> >      {
> > -        __io_apic_write(apic, reg, value);
> > +       /*
> > +        * Cannot atomically update the IRTE entry: mask the IO-APIC pin to
> > +        * avoid interrupts seeing an inconsistent IRTE entry.
> > +        */
> > +        old_rte = __ioapic_read_entry(apic, pin, true);
> > +        if ( !old_rte.mask )
> > +        {
> > +            masked = false;
> > +            old_rte.mask = 1;
> > +            __ioapic_write_entry(apic, pin, true, old_rte);
> > +        }
> > +    }
> >  
> > -        /* Recover the original value of 'mask' bit */
> > -        if ( rte_upper )
> > -            __io_apic_write(apic, reg & ~1, *(u32 *)&old_rte);
> > +    rc = ioapic_rte_to_remap_entry(iommu, apic, pin, &old_rte, new_rte);
> > +    if ( rc )
> > +    {
> > +        if ( !masked )
> > +        {
> > +            /* Recover the original value of 'mask' bit */
> > +            old_rte.mask = 0;
> > +            __ioapic_write_entry(apic, pin, true, old_rte);
> > +        }
> > +        dprintk(XENLOG_ERR VTDPREFIX,
> > +                "failed to update IRTE for IO-APIC#%u pin %u: %d\n",
> > +                apic, pin, rc);
> 
> Afaics you don't alter the error behavior of ioapic_rte_to_remap_entry(),
> and in the sole (pre-existing) case of an error a debug log message is
> already being issued. Why the addition?

I think I was trying to mimic the behavior of
amd_iommu_ioapic_update_ire(), which does print the errors as opposed
to doing so in update_intremap_entry_from_ioapic().

I've now removed it, and adjusted the code to match the rest of your
comments.  Will post v4 of 4/4 only as a reply to v3, I don't think
there's a need to resend the rest unless you prefer it that way.

Thanks, Roger.

