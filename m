Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2DC51152D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 12:51:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314877.533157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njfGO-0005Mp-C0; Wed, 27 Apr 2022 10:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314877.533157; Wed, 27 Apr 2022 10:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njfGO-0005JW-7y; Wed, 27 Apr 2022 10:51:16 +0000
Received: by outflank-mailman (input) for mailman id 314877;
 Wed, 27 Apr 2022 10:51:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ll0K=VF=citrix.com=prvs=1097e264f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1njfGM-0005JQ-G8
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 10:51:14 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f38f1fa4-c617-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 12:51:13 +0200 (CEST)
Received: from mail-sn1anam02lp2048.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 06:50:58 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM5PR03MB3403.namprd03.prod.outlook.com (2603:10b6:4:43::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 27 Apr
 2022 10:50:56 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 10:50:56 +0000
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
X-Inumbo-ID: f38f1fa4-c617-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651056673;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=T9+Eru50HHTCFWqklLKuhnB31us5TFNPWKeGPeRMmzk=;
  b=a94xqBx6xId2GwLI15bO3apIO9ciA1G03nVF/voclQ4vJrNMysI+KPvG
   K9Z4SD7jNTkewDLrvkHDQr60f2ukQIsgExfcox8nbwGOoasIEtPzyUKcR
   E1ZmP0jQdU6/OkphTfN4iCLD4yMBiEDqVa1WB9NPMsvoCLcxFBqx4MdOw
   8=;
X-IronPort-RemoteIP: 104.47.57.48
X-IronPort-MID: 70435113
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:DHGppKuYeVxn8pP+69O9Y9QBpufnVChfMUV32f8akzHdYApBsoF/q
 tZmKWGAOviMMWqnftx1PNy2pk8A6JPTyNRqT1dp+S00F34S+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1/X5
 4upyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8UGLCXxuBGaiV1TSBeL5F48rLGDyOw5Jn7I03uKxMAwt1IJWRuZ8gj3L8yBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4IHmmtg7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9wrJ/vduujO7IApZjYXyF8vfRNezeeptol+ev
 CHCol7VK0RPXDCY4X/fmp62vcffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWc9BVJ
 lEQ+yEuhbMv70HtRd74NzW7rWCFuFgAWtNWO+w89AyJjKHT5m6k6nMsSzdAbJk9spY/QzUvj
 gWNh4mxWWwpt6CJQ3WA8LvStSm1JSUeMW4FY2kDUBcB5N7g5oo0i3ojU+peLUJ8tfWtcRmY/
 txAhHZWa2k75SLT65iGwA==
IronPort-HdrOrdr: A9a23:9YB6h650I9JgHDxumAPXwUGBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcT2/hrAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCZSWa+eAcmSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AXV0gK1XYcNu/0KDwVeOEQbqBJaa
 Z0q/A37wZJPh8sH7eGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 L4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR0Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqVneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpb1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY7hDc5tABOnhk3izypSKITGZAVwIv7GeDlPhiWt6UkWoJgjpHFogfD2nR87heYAotd/lq
 D5259T5cBzp/8tHNxA7dg6MLuK40z2MGTx2TGpUB3a/J9uAQO+l7fHpJMI2cqNRLskiLMPpb
 WpaiIsiYd1QTOiNfGz
X-IronPort-AV: E=Sophos;i="5.90,292,1643691600"; 
   d="scan'208";a="70435113"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+uWBHemHiZ/gq4fGVvJs3oplT8PHz1EHBBQY6xuvbeQn4xtRe17oSbKHAy3z3h1jSYU6rK+9hJPJgoC1CsBo1zWbk7ztUpM+IeKjstEGI4Fx7vR5Hib1vgRj79j4uRZksJeWejyJU1Tc4a0y8mO5dPKOf5er9Nu7yi3vZMmlFklHyQUQ5xmYcWeDe9xgBjKpLsnVd1ICtwNqcenq/jy2J4zLwXlDTzk1F7BOvd/0aeJfkBWVvMcUFHwuBMbsCqi1psq9ffpKDHEFO1ZLGVw0J5PYDLHLJETcGSMP7Xttj9TzCd81p0dKQ4Uux3u4S5l4lBXlxC3/9UDBbpFtgxFBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjnXHUcCFjxyuujOHquhftOVGMvvskz6Ww51NGPCPos=;
 b=aUEFA31WHgIVw+1/8Igq8B+DMMtguELR/zE9rKXurD9WRsdsavcnsoL0LVloq9kmjuDd9u7zpMvJ3T/7VmM3yUwLnKU5oWqecg+FcEnC6ZaXAAFJf1Hsuqcx+Xa09XYdnq1rlkQ39HkcGb5AtLrHPVc4ErAL0PfMk9SJqetzwiqIdCkO7BCn7cBv/dddJVYR8UG961RGgKUD5qpGXGrfT1plfGPeMVCBNpDtmyyDDx3RiPhdIorjN3O3HKz6bJEAYgAr+NSfAcw9CYDyEEZowQ6M5dgnzQHz6XqvfjONikSAqhAA4h/RY/K94oTYEgVHRIuSejPppNKqwmS4OCWOKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjnXHUcCFjxyuujOHquhftOVGMvvskz6Ww51NGPCPos=;
 b=gBKkJwpUezU7p4NTjLyLvO4ReBAh7kIRMgKosSiZUB+O9EGZpORHFY7Uq4OwmhZqagu12vQvJGa984f52Efb/poLoqJtvtnEv3jpjFGsaUbQXAAjg7k8FVnYOSFDF6byKGyTqRnerBRurOGsb5C9y/2zWKjfu9YxXTEmK9kt79w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 27 Apr 2022 12:50:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Kevin Tian <kevin.tian@intel.com>,
	Edwin Torok <edvin.torok@citrix.com>
Subject: Re: RMRRs and Phantom Functions
Message-ID: <YmkgDSXYaQMbDOv/@Air-de-Roger>
References: <5364e8de-9c45-41d1-abbf-8be70c524e72@citrix.com>
 <Ymj435hWOcY9BK36@Air-de-Roger>
 <c3c83d6d-dc84-bd81-4087-1eece1acb18a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3c83d6d-dc84-bd81-4087-1eece1acb18a@citrix.com>
X-ClientProxiedBy: LO2P265CA0516.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdc42b61-82b7-4cfe-0180-08da283bceef
X-MS-TrafficTypeDiagnostic: DM5PR03MB3403:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<DM5PR03MB3403DC9EE8112F7020CBBCE48FFA9@DM5PR03MB3403.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VVwZeinj+Y/peMJGRcan/mQIgTy6MJcHYwg6tOt4jekaD3M0F17wHCw/65vo8bNuu3JffhBeGgqPLg4YNkQbYM0Ivn8y5Fe6FfBhQqpX+7P3vsCWT8hW60hsuOB8sr5QU9zDJ7hi8Ij8vQgF9GHfAepNqV8FUvxUC+VGGCHCFgHS9frVR+VdsAyQBLE4P0E2EOUkUEh1uryqOFUtnTKtpEjdHpsFg+AUR2+vRYz33WBLJ/bmm51zBQXnIDm8Psm3EGyeig+DD0iOjr7GdxED7HSM1EAtBZcRF0XJivWkf0GbAXmt0km+Kk6jDa+bJWtvTSf2j+msygMvMUFGRqgYSXuD+fsp8P6HfNpmwaDh33Lj9vEuypma923cY8xHhJPfdF0+Dq0PJXFpuoW7N5OOu0q6e34zHOnvlMET9tWkzTBFx71s4MiVound6E41Nnvt4fgW6+s0ilqjv/ogjyHBegwJk0Uhi1FNBEyRwRD3dmfVCUBAWGMmfw8mIlabwmDJroPs/67IAVMRs7bF6c/w8+O2mz+cVgNIuG3AUZTgC7/rZYsLpQbHuD/ORka1cy8qQ2ft6z5cWWN7LLz55cM/j5AgjQqQYX0v1PVaJG6b2EWepmRwqsnVWgC/xewPgrHU6IVHv6JrWtKfCnyV5R/IXZ+McSSFtW9kMDJd/WixuQWda7Xl2cM3Ktpb3GVotSpm/0CThp4YimHpKmUwxg+Jzg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(508600001)(6486002)(33716001)(6666004)(8676002)(66476007)(66946007)(86362001)(4326008)(66556008)(85182001)(54906003)(6636002)(38100700002)(6862004)(82960400001)(3480700007)(9686003)(107886003)(6506007)(6512007)(316002)(53546011)(2906002)(26005)(186003)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K21EQk8zZ1puSnQrdFBwcDVXeTJ0N2lJTklRQ3VMeDQ0SjVQNHdWYndDWmtU?=
 =?utf-8?B?Nks1a0RVVDRtN2J6YUJDeTJhTE5rVUs4NWp3VmFQdmMyUDFzbkQ4eVNrclpL?=
 =?utf-8?B?WDhQNGlvUkYrVFY1aXk5YW9pWHN1MUNDK2cybW1CYVN0N2FWZHZodnl6U1Bs?=
 =?utf-8?B?THltTTVRcmExNnhoenorVVJyb2twZmwwNm1ZUmtQTjFoNVhma3VqemJGNk5W?=
 =?utf-8?B?K1ZjaEpsM1B5Rk1ydS9KRzZDSFM4UHd0dTNzS01WT1Z4NFQ1ZjZrSjkrbGlM?=
 =?utf-8?B?L0Q3cW4xK2grQWE3Tjk3UDlwWHZ2Z3RjQjlUY2dsQ2JHSGxsWXZydXVLOXB2?=
 =?utf-8?B?R0lJYmhvYTNUeERxeUx1L3FGT2FRWkphTFhRL29aRzU5cFNuVFpyb09FMDlJ?=
 =?utf-8?B?WkZ4dGhYK1hTK3hyc2lyMk11dDdyYWdsb0t4YWVvdEliWnZlcU5VNWxXNDB0?=
 =?utf-8?B?NGtMTVljN00zdkhzVkZxSnN4K2xqV1lSWG11R3piUXVHRWc5eWNCN1AyZWJB?=
 =?utf-8?B?YkgrVDYzZHJzQ2ZnRlYrc3dGUXhmZktkbjVKbEcyZTdoZS9SMEdoQjZadmdJ?=
 =?utf-8?B?MlFBd0toVFRGTjZjV01XQzk2UGlrYjdCbnBieGxlYTNGeCtUUlBHdExwVllQ?=
 =?utf-8?B?cUtWM0NWRzVQQTQ2NzFBMXF0cE42RHNpNFUySVduN2tzNnB3ZmJVYjREelZG?=
 =?utf-8?B?Ky9TMDltRE04MVNvN0MxYlJwZ3VtQXpGRUl3a3Q1eW1tS01yY2t0dWpOTXlZ?=
 =?utf-8?B?ZnhJYnZKV24yVUNtSS9LdFVtM08vYjRXYnhYb1BNTTcxeUhkaGlJN0xXL21k?=
 =?utf-8?B?UjUrZGYrN0V1QnB0dzlCM1c3TUxHa0UvNzhVZWlKQ1VWaXFMdkcydDVXUDMy?=
 =?utf-8?B?QVB3SVRLaGU5aVZWU1RZUHdCOGhPaVZKSFBpZ2xpenVLbU1FL1A1QUZZTWVj?=
 =?utf-8?B?cnQ3WGZCdHlRSlM4bFdVdHlNekNUemhXK1Jad0hDRkxjMDNQSzJTRHRCNzZO?=
 =?utf-8?B?QU1Ic01uVk1VUk9TT1F5NWVQaE53TXJ4L3R2Sk9Lb1FzMlV0aExhZmR2cEJK?=
 =?utf-8?B?MCtJV3dMcExVZWZqYU8ybXpXd25EUHJiRmdFbDBGZk5OWnNyMkdacnJwOUt4?=
 =?utf-8?B?dEFWd3FmZDJVMEtFRno5NmhDeWNTV1BYL0tEN0Y4blB4cm1zdFNLby9xcmFS?=
 =?utf-8?B?VksrRmFCUGRBbklPaUNVSXg4VVhkaldHdGhyN3h2N1BCVlhCaGR2d1NyMlRq?=
 =?utf-8?B?RWZYM2lJNDBuQlRCVUZlcTlsdWQ3VFhQNWh2WnZvems3ZGRlQkF0aDY1S3NF?=
 =?utf-8?B?ZUNZK0c3aUg4NW1rbzJkMEU0TDJWWC9LNklLTjBwSyt1RkNiZkNzaHFVSmZ1?=
 =?utf-8?B?M0Zmc1liSVMyckxVU1J1dlBueDYyRlNMSUh0RTBGOStwQTU3cVQ2QlBVaHc3?=
 =?utf-8?B?bm1DcCtkd2VkMmJYdjVab2d3bFZqeFlvL3Y4QzBHcEdBeG9FMDM3dEpiRUp2?=
 =?utf-8?B?enRBT0pRTEUvcEFJRW9RSDNaOEJHMkFZd0tXNTRHNjRocUt1cVF0SDlWVXNH?=
 =?utf-8?B?a1NnNnp3U1ZKTFhONjhxUXNnYXhuS05NcHMxc2tHTEl0UXYrUlM2ejVKWk00?=
 =?utf-8?B?cm83eEdxT09UZ2YwYnRNSEhLMkxXWVk5aXI1T0JjNTV2VXBRRmU3YjFjTU9W?=
 =?utf-8?B?M3FjVnk3aU53U0czMzhrZlhpZHVkNWxWeFNtVDRDcjY1RTlNRDdVM1FPLzBh?=
 =?utf-8?B?Mm80bWRhaG9lQmVGQnowekk3OUg0TThKTzhYYWJ3clZIUW9nZnAzZ0V2MHRV?=
 =?utf-8?B?eEJ6ZnZkUGY5WmllWTFWUG9NYWdMdy9CTk5lNXBwWnd5K1RUMWJIczNvUStk?=
 =?utf-8?B?NXBNYjJJQklGek5BN1pHNTAyOFlJeHZ1NHZMYy9tbnJOeW5FZnlPREF4cTRu?=
 =?utf-8?B?ajB3Z3ZJZmx2TTB1b3lhaVlodXphMHl0cXJLbnY2SGQyb3RHMmtncTFlUmlR?=
 =?utf-8?B?eStrVUJGSlA2N0huWU90VldJNXVla1NvSHRNdUx1MS9qZUF4TVZPL3M3SEVh?=
 =?utf-8?B?ajQ0MFlNL1lpc0puQ3RxQ2ZubFZWUXpPbFFYbkhsNFhpQXEwV3BaSW1tenQ0?=
 =?utf-8?B?OGd5N0tVS3hWTkcyRTMrdkRvU2xpK3VZQlpCY0lCTTh3bWprTVhVanNXakZG?=
 =?utf-8?B?Q2NnSTBoVldLeXoybkpWb0JwaG5nYWwvZDdoVHEybXpzR2lCclF2Z3lNQ09k?=
 =?utf-8?B?VWRiaDFWaUdTbXkzM2ZITzJlalZuOU9icGRoaWY3bjhSYWR3djgzTll5Vktn?=
 =?utf-8?B?SWpneEpDL0hZL0x4V3hLZkJiOXhKL1RxcEVOYWxYU1dOWWVmQ1hPSW9zVEJN?=
 =?utf-8?Q?n4kxBUVbMezZeeDA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc42b61-82b7-4cfe-0180-08da283bceef
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 10:50:56.8172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zGQ5Z3aR3pKH942Vqt4CJJe5oe4+7Yi9xgej6FfVHLzZV8DtZD4LNMketThdocqKLGYHSVwXtfsAgBREF0aL1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3403

On Wed, Apr 27, 2022 at 10:17:49AM +0000, Andrew Cooper wrote:
> On 27/04/2022 09:03, Roger Pau Monne wrote:
> > On Tue, Apr 26, 2022 at 05:51:32PM +0000, Andrew Cooper wrote:
> >> Specifying pci-phantom=04:00,1 does appear to work around the faults,
> >> but it's not right, because functions 1 thru 3 aren't actually phantom.
> >>
> >> Also, I don't see any logic which actually wires up phantom functions
> >> like this to share RMRRs/IVMDs in IO contexts.  The faults only
> >> disappear as a side effect of 04:00.0 and 04:00.4 being in dom0, as far
> >> as I can tell.
> > I think I'm slightly confused, so those faults only happen when the
> > devices are assigned to domains different than dom0?
> >
> > It would seem to me that functions 4 to 7 not being recognized by Xen
> > should also lead to their context entries not being setup in the dom0
> > case, and thus the faults should also happen.
> 
> Functions 4 thru 7 do not exist in the system.  Their config space is
> all ~0's.

Yup.

> As they appear to be non-existent, no IOMMU context is set up for them,
> hence the DMA faults when their source id is actually used.

Right, somehow I read your initial description as the faults only
happening when the devices are assigned to guest, but not when in
dom0.

Thanks, Roger.

