Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E3C6D0890
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 16:44:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516770.801419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phtVQ-0005Pc-9k; Thu, 30 Mar 2023 14:44:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516770.801419; Thu, 30 Mar 2023 14:44:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phtVQ-0005NX-62; Thu, 30 Mar 2023 14:44:00 +0000
Received: by outflank-mailman (input) for mailman id 516770;
 Thu, 30 Mar 2023 14:43:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fiWc=7W=citrix.com=prvs=446b09b9a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1phtVO-0005NR-O3
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 14:43:58 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4aab0742-cf09-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 16:43:55 +0200 (CEST)
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2023 10:43:52 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BL1PR03MB6184.namprd03.prod.outlook.com (2603:10b6:208:319::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Thu, 30 Mar
 2023 14:43:49 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Thu, 30 Mar 2023
 14:43:49 +0000
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
X-Inumbo-ID: 4aab0742-cf09-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680187435;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Fz+xn4mLsHIv6fC3aB6/JxLx7esqtEHvF8seELfnPSA=;
  b=Z7DIxJGtFE5rMw8gwqOp5xgLVH0IpLDkA2dlDnCsFqolph6sDDolKe5A
   sGmwx5LZ3J81IDwvO9sLDwmJzIY+29vqw8CzM6UbGa1B0Fg/b5i46aFfY
   AiYUB0G7X3LvxJp8wuY1ZzSIq4oOZL9BISsagMODB9MV33XFxe+cwXFnp
   A=;
X-IronPort-RemoteIP: 104.47.59.173
X-IronPort-MID: 103722116
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:t65HPqAahRrkNBVW/w/iw5YqxClBgxIJ4kV8jS/XYbTApD4h1zYBm
 mFMUG2BO6mDajH8L9skYNzkpEgOvsDVm4UyQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhD5gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwwblTMVhs+
 NokDi0payHcmfyqwu6qc7w57igjBJGD0II3nFhFlGucIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9OxuvDO7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqinz3LWWxH2TtIQ6SJin/9pQnwWvmWUoAgYGcGCjq8CAoxvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLkouQyNFadcmnNQrXjFs3
 ViM9/v2ARR/vbvTTmiSnop4thu3MCkRaGMHOykNSFJf58G5+d5oyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsgDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:MAhplKB4v0Pp1OnlHemh55DYdb4zR+YMi2TDtnoBLiC9F/bzqy
 nApoV56faZslYssRIb+OxoWpPwI080nKQdieIs1NyZLWzbUQWTXeVfBEjZrwEI2ReSygeQ78
 hdmmFFZuHNMQ==
X-IronPort-AV: E=Sophos;i="5.98,303,1673931600"; 
   d="scan'208";a="103722116"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsluwsBEHm318guvOkyAYFdqnCqiZua/xbfwpsMrl+6gzmyvPNRLpLMJNZmfUQ9MWIAJMCCfrxCNSzQ7LhgREmQ21H3yqfCvrUib9v7K8SRqMNSFWAck5YItAWBoKuSvO+2x7ZtTC9tx9T+i1h1+k3tVIjPr+4yRHKc773yWGH0BIT2TXzuVAGwWeIXhaQcYGJ6Ni0QjZJUOw6srZdKkdr17YV8rYTLXZu3wtHyIu5JnROCF9jESfwKCxfhLtEcQpGuTWtZWa1NrSKjGFYHVwUcFpu6by3WEcfe4KzvMi7pQ+kv4KaebABOCPG4mLlk2AEPUzD7qHTjK9NmRUn1udg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBmGcunSnTSN+LCjGzQyIiwP8JZ3jQ2WREZ87h1YaHI=;
 b=AdnB9Se7Kv0hx6R+gxwUGHHKEqgbRiF0wi3t1eTtji01UkEipmbT531ffcztlTOewtkEh35VCaJsms/8Xg+zSuz7AiEbIKOTlOFYCnxu+S074pG8emCw5sOvMMuN61WlIWcWMhusxnKnJ1tcDBgI4hNW7vZCe5BBDqsmURo63MrWF04CWQ9h3prYscKwdi07+Ryimh4A9n2m98TzhW773RJJfVuP+uvLKUTUePsXwltVOHu4ph4XI93w895ztk0hUpKes3ogXzfPoqJtsZsr/BAfzMCISkF3VpoBMkFykqsJjIeUm8fxZtHItK6gfrispX8JvE3doj6PsdgausUraw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBmGcunSnTSN+LCjGzQyIiwP8JZ3jQ2WREZ87h1YaHI=;
 b=UHWL4M+t3/n6pLsfFMFK8l56mR3fSJcBVdNXGjZzxKG655osYOFbDgv5JQ1+i23sLPrWygtNCoUPsL4WpGgVbLzJiFna1Er3aFgsknewv691pYO2M7/DmRP1rYPz6oKuknZNme+dNuFshbl7/Hg/5FtC1enZ6RL+8FKxNsp+z5s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 30 Mar 2023 16:43:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH RFC 0/9] x86: Merge cpuid and msr policy
Message-ID: <ZCWgHxCL4yXD6CxC@Air-de-Roger>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
 <ZCVtcR5u/14/WmCU@Air-de-Roger>
 <9108a58f-da8f-14e4-de88-a7c8c8abb0f7@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9108a58f-da8f-14e4-de88-a7c8c8abb0f7@citrix.com>
X-ClientProxiedBy: LO4P123CA0286.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::21) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BL1PR03MB6184:EE_
X-MS-Office365-Filtering-Correlation-Id: 34a4c611-2075-42ba-2d64-08db312d2c49
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kbjw4q++cENjDLnHcfKElw9HmGH2+2CjuGPLm6HfD2+Cvgk2jIcZE4J0/r37Hvw7lEiAMXph0m0/49Zxm+0FcVMMQWIWxsDlBSWRNaHB+oqp10s1ARqt9t6EJ7z4egAB5LPCCEwKNFzEV3qcr2jIXuBOFXjL70S6LThZmKbEEJ9A5s6bVJ2zCGLGnBW4qpb8PkKlEshbTL7ynjYXuajy63DJO9qX+ObTV7TUdb6LhUnmcRfrI8DBuXpC546YR6a5HYFMj5IeCIO8SNusSXO6CmU7j4miIXsYMSwXmXpFjpLrwZQSSYtW/zUngugn+A/kY1RBW1VkAQ5tZecHnP8vNF5954oy6DmFaLLfO5/JZHHdWjHTSdyXwPbaxPTkolvbO8B2pkPAR08JX2LdPSFp+PCQpa47JJhk42cN5yQOp9MDtJO6xhQr/OCJ+zQm0Y2xU68SxQpPlea6uWYcZWa5N7rfioqGELW5Yr1ZhHAAr6dkn7LIWSOmDgm4AhWwmgjZ7ZFaxF3u23o3bc2sL+fWZLvCikGF1hyypRhwk21PfZw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199021)(4326008)(6486002)(316002)(66946007)(66556008)(966005)(8676002)(66476007)(41300700001)(85182001)(86362001)(53546011)(186003)(54906003)(6506007)(6666004)(26005)(9686003)(6512007)(5660300002)(33716001)(8936002)(6636002)(478600001)(82960400001)(38100700002)(6862004)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zm1BUDR1aWJFLzlhUUlHU05XdlI1UzA5VTVCZ2s1cDlLU3lyRkZ3Vk5qOFp5?=
 =?utf-8?B?SlgwVkFyUlRMZU91ZFMxK2gzSndBYVcvblhhMmZFWW5oRzZlaWwzby9CbUF1?=
 =?utf-8?B?YlVDWlpGZmZsSXFEL2dnRmRQNVREczJER3FZOCs3ZWxUU0YyRXZPKzV6bm9o?=
 =?utf-8?B?YlYzK0FuY0UyV3RlZmRzbHdIY0VmSkVSR3JLc2hvL0V6WE8yQVdWNERkN1Ry?=
 =?utf-8?B?Zm5GRk52TlUrQU9ydGxSeW9ta3V0dEt5YkdFWGc4aU40dnRkak1lY1RRQlAr?=
 =?utf-8?B?TUZiVnl2Ykd4SlR5N0dQVk1vc3hSTHcxaDhoYUtGUzdTbWpqSlBscllnMVRL?=
 =?utf-8?B?UUlvQk5Sd2lGS1NhY3Btc2NyVU9GWnJYa3k2SHRyK01USXBzVDY0WXllaVRN?=
 =?utf-8?B?S3pYRW85YWhQc0xoMk1tMkxaV3FQYXAzYXdYNGdPNEh4NnJEYzNkRHZCam1j?=
 =?utf-8?B?Q2JnaUQwa1VvZGJKVHJ5SHpYenR1M1IrN25ESDJqTFZIbXlTdjJBRUJZUVFK?=
 =?utf-8?B?L0NIcmJOSkQvVTgxYWhBODA0aStOdFV3RENCZk4zK2hVWHdESjVOUVl5SVJo?=
 =?utf-8?B?bnZHckJJMU9Uc3hWRHNaVTV1TmJCcDNXb20vNDFhQ1U0Wk9iVWdZY2hsQ3BT?=
 =?utf-8?B?a2hQVjYvUnd3K0NNeXRpWW81ZEFnNnJweU9CV2R2OXZEU0hEUnMzdCtVc01n?=
 =?utf-8?B?dGd6VTZRcjQ3TE1NNXhjY1NmTHA3RGJzNVhtelhFQkRrOXhFN1V0Y3lSMC9S?=
 =?utf-8?B?NDJpMDlIY3d3Q0lxRW05RHNabEdFSDhIVWR5MTAxOFRQODY3a3dWTkRmRnZn?=
 =?utf-8?B?YzczU3UyNzdMaktQU0gzQlFmTGpBZ0s0NXY3N2RHcTRlNkZRbWR5eFp0dGth?=
 =?utf-8?B?TmRGdEJrYXJheHc1V3NLUmFwVWtQalJDVG1MdHByT3h4QklaSXovZldKTEJT?=
 =?utf-8?B?ZUJnMGIxYnNsZ0RlbmVnR3RoUytxdDhBTGRPREpuSi9nOXJQMFEwMEJ6VnI0?=
 =?utf-8?B?bUhOV3ordzBweXJ1VGpHa2F0U2U2MVF1NGVTaVJER2lIVFJIQ24yT1FtUEty?=
 =?utf-8?B?V0xieHNCeDFkNGRpT0hFZCsxME4zTDZOOS9TUFFGL09MQmQ5RXFTb015MzJ6?=
 =?utf-8?B?OCtvb3Z6SFl1eFB3M2pYWTFrQUo0ZzZvOUtLd0l1dGVyTGE3REZnTi96b2d3?=
 =?utf-8?B?YlUxK0twTzRUdllTZ1ozaklpRHgvNlgyU3Q2WFp1dG5lWWkybDRJZ2poWXlx?=
 =?utf-8?B?SWZaa1NTYVY0eG1qYmIzRENSUTZoT1lGOGJ5NkdkUUMzc1oyZk5ZWHBmWVo0?=
 =?utf-8?B?a3J6TURaNHBFSDNCVlpxQnFCQWVVZzMyajRNOUVWTWU2em8rcjNvcWpjeHB1?=
 =?utf-8?B?N1lXQ3dBa1JESGRNSXB6ZW1aRVAzUFZreTlvaXN5M3dmZXF2MTBNV2NvVlRK?=
 =?utf-8?B?by9KQnc3QWdNbHFxRERiV0YrNExYRUthQkV0emhqbUIrYzY5aHIyRERCQWZQ?=
 =?utf-8?B?VHpsTUdNdEpmc0F2dDl2aXR5WG01SldrbnhKbFU1OUhnbmhka3hUN1ZTUjVm?=
 =?utf-8?B?aDhsOCt0ZTJZbEQzWEtUeUZ1RmZqWWdmT3EwMFR2c21OdWRoVmY3bFVwUmpy?=
 =?utf-8?B?REdWMUt5bnBJWVZhazlFTHRBMlU5M0YzcStNc1ozZ2g4eHJEeDdINHk0a1lz?=
 =?utf-8?B?YXlVVEZjaWRqZDF2emkxQjhjWHZiWjVGWEY4Zy9uNWlwdURUb3BsT2w5cG40?=
 =?utf-8?B?bmF6MlFuWXhPSUNYNW1haVQ1RlpXai9qNFFJTDMvN2Z6TGNwNWErbEpVU3JT?=
 =?utf-8?B?ZnJhUnFKOEVMRkdzc0dScVNoS2hrWCtBQy9XcEoxMmhsYkxPMXpLK2I3cUsw?=
 =?utf-8?B?cHkvbFl0QWhSYjBaYU9QMWxtUUY3UU1sRjAySlhXUGpYTzU0Ylg4ODNZL3hW?=
 =?utf-8?B?WlRGeWluN29KNnhHckRXN2VNMTZuVEJOcE5MZm1PT3FSVitOWGZocVZwY1Vk?=
 =?utf-8?B?TTZ2bzVVNUQwVkJNUlJxUjZiZDlLQ0VpM1ZEZmxwZmVETHlCVUkwMEhwQ1NR?=
 =?utf-8?B?ZHFuby84ZXR5TVNvMDE5MU80UU9uZ2ZxNWVIUzBCdDRLTHJoNEhnbGxuRjIx?=
 =?utf-8?Q?vHcTeV8KEAY/EgkY5yUeOCuYe?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	S2MD+X60k1qiTwHbQpZKxTAIbtHoWExEHZVAKcuY031j5pLEq1SUx9+E63Hhcp+5Jxj1YDOI4SKJXqhks01JedPq9A2N32kuNsGuI/mUs5CNmnBXbM5Z4dpXXwufRy/nvDPMXszNTkXmSJO+s1Vt0tETuw5S2/Agud4P3iowY5MvhHKQawDK+OBPe3qwakA832XdanAXVUeljIOyo9azab9ZPsjQHWtete55TnsVMOfxetW61zkPVYbcfWyv3D9qvoy+C1QJJMwj7T+GeM5YYckpUIHqJTt7gm7GrIi+H12qBp7SEjvrSfpQVg2hoN6r1Fgiy2Nqq8JVlHovlkgHQJ/twdmRjC55Oz1Z4ow2p+bt1f94rWI+x+cKpAysmz7fyGTdQ/hgomumIT2XIE13AVv1Okb6bsHwvIGbpdmSF8+3wG23hZR9+GEmNr5g78Tpg4qMxuHkmRenRpZC71lo+SmYDiMN8QPg+xnDXGAdMzoRTF+S9JL/uxLP0A421BSIYUE8HBVS4ojpa2Lod2iFlLAzDtxrt0+emyh3+L8DcFbF7UnPyMCBbtOkkcMvxnalkXY5ph66mm20WK4Yq/d7WEidkiwUoBA2rZi+RglCwpSX4MBv9YCXTSDP6ppTfkjFK37Tg5OSHRYLczSP5sqkzH59AznZAiUl6FR6gXxguah9WdnWxVS8W35thKkwqClDgfE4ncCdAWp8nsdcm2qLHkt2vRbuTKNAY/EzwTsAaq9+H0A6Mu0XqrC/pDp/BxRWN97xb05srNtHs5kUNdAYBzeU9P7GWYd9IOUnhgMQLLS3EiS6WTxMb0LoZSsDY9ST
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a4c611-2075-42ba-2d64-08db312d2c49
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 14:43:49.2932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vltPmXgu32ITyLvoYSJhea0Mcq2K6lAad+dO8ZcuZRvNVvwGokF1cYTcLDy70gtuhG0p7cfCsifyRdUkTnAnJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6184

On Thu, Mar 30, 2023 at 01:59:37PM +0100, Andrew Cooper wrote:
> On 30/03/2023 12:07 pm, Roger Pau Monné wrote:
> > On Wed, Mar 29, 2023 at 09:51:28PM +0100, Andrew Cooper wrote:
> >> tl;dr to add MSR_ARCH_CAPS features sensibly, cpu_{featureset<->policy}() need
> >> to not operate on objects of differing lifetimes, so structs
> >> {cpuid,msr}_policy need merging and cpu_policy is the obvious name.
> > So the problem is that there's a chance we might get a cpu_policy
> > object that contains a valid (allocated) cpuid object, but not an msr
> > one?
> 
> No - not cpu_policy.  It is that we can get a cpuid_policy and an
> msr_policy that aren't at the same point in their lifecycle.
> 
> ... which is exactly what happens right now for the raw/host msr right
> now if you featureset_to_policy() to include MSR data.

I see, but that's mostly because we handle the featureset_to_policy()
in two different places for CPUID vs MSR, those need to be unified
into a single helper that does both at the same point.

I assume not having such pointers in side of cpu_policy makes it
clearer that both msr and cpuid should be handled at the same time,
but ultimately this would imply passing a cpu_policy object to
featureset_to_policy() so that both CPUID and MSR sub-structs are
filled from the same featureset.

Sorry, maybe I'm being a bit dull here, just would like to understand
the motivation of the change.

> Merging the two together into cpu_policy causes there to be a single
> object lifecycle.
> 
> 
> It's probably worth repeating the advise from the footnote in
> https://lwn.net/Articles/193245/ again.  Get your datastructures right,
> and the code takes care of itself.  Don't get them right, and the code
> tends to be unmaintainable.
> 
> 
> >> But this does mean that we now have
> >>
> >>   cpu_policy->basic.$X
> >>   cpu_policy->feat.$Y
> >>   cpu_policy->arch_caps.$Z
> > I'm not sure I like the fact that we now can't differentiate between
> > policy fields related to MSRs or CPUID leafs.
> >
> > Isn't there a chance we might in the future get some name space
> > collision by us having decided to unify both?
> 
> The names are chosen by me so far, and the compiler will tell us if
> things actually collide.
> 
> And renaming the existing field is a perfectly acceptable way of
> resolving a conflict which arises in the future.
> 
> But yes - this was the whole point of asking the question.

I think I would prefer to keep the cpu_policy->{cpuid,msr}.
distinction if it doesn't interfere with further work.

Thanks, Roger.

