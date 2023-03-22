Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB566C4688
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 10:35:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513241.793985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peurz-0002Al-1h; Wed, 22 Mar 2023 09:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513241.793985; Wed, 22 Mar 2023 09:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peury-00027b-Tv; Wed, 22 Mar 2023 09:34:58 +0000
Received: by outflank-mailman (input) for mailman id 513241;
 Wed, 22 Mar 2023 09:34:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5r5y=7O=citrix.com=prvs=438090303=roger.pau@srs-se1.protection.inumbo.net>)
 id 1peurx-0001G9-Nx
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 09:34:57 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccf78c72-c894-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 10:34:55 +0100 (CET)
Received: from mail-sn1nam02lp2042.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Mar 2023 05:34:52 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN8PR03MB5044.namprd03.prod.outlook.com (2603:10b6:408:7e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:34:49 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:34:48 +0000
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
X-Inumbo-ID: ccf78c72-c894-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679477695;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=no9732AzL5BGhsoSs+k9xphdFEc0l3EhL2CHEfEQAp8=;
  b=GUZKGvksXsXr+2cPb8EA/LDlZMnkAXTlxsguc63NUa4HCnzNq7dg5smr
   nzfzOay61UJd+pqSc8a/XnGfaBrGTJQFZkfhtG5cOHHrN8l3uJdkFwkVz
   o4qHjPB7I/rslxp3oCXXZ4ViekPHxsDiDnOBK5HE76lev5JsVhCG05KVO
   s=;
X-IronPort-RemoteIP: 104.47.57.42
X-IronPort-MID: 102250420
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KZBG0q8ySvdtzEo9fjVCDrUD7n6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 TcYCG+BPa7YYTT1Ldx0OY+3pB4PvsfVx9IyT1RkqX88E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqoR5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklcy
 vgTNR4zVimFgr/szOr8TbFVqc48eZyD0IM34hmMzBn/JNN+G9X4ZfyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWMilAruFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37eVx36jBNhKfFG+3vByu1OCxjERNDwfX2Oj8Py/px+6A+sKf
 iT4/QJr98De7neDVNDsGR2lqXiLlhcZV5xbFOhSwAOHx7fQ4g2ZLnMZVTMHY9sj3OcfQTE63
 1mFksmvKTFyu72YU1qU87vSpjS3UQA+LXUDfjMFRA1DwN7upoA8phvKQpBoF6vdpubpFC752
 SzMjCk6i7gZl8cN242y+FyBiDWpzrDDUxQn7wHQUmW65yt2YYekY8qj7l2zxdZHKomdQ1jY+
 lgZks6RxOkLAdeGkynlaMcQGLCgocSFOTvTqVdqE98q8DHF01yiZIFZ5ndVJEpvGs8BdXniZ
 0q7kRhK+JZZMX+ubKl2S4G8EcInye7nD9uNfuDZaJ9Cb4Z8cCeD/TpyfgiA0mb1ik8unKojf
 5CBfq6R4W0yDK1myH+tQb4b2LpznCQmnzuPH9b80git1qeYaDiNU7AZPVCSb+c/qqSZvAHS9
 NUZPMyPo/lCbNDDjuDs2dZ7BTg3wbITXPgad+Q/mja/Hzdb
IronPort-HdrOrdr: A9a23:gBYt4KqtRrHDcav1pBrhfdwaV5oweYIsimQD101hICG9Ffb5qy
 nOppUmPHDP4gr5NEtQ++xoW5PvfZqjz+8X3WB5B97LNzUO01HFEGgN1+bfKnHbdBHDyg==
X-IronPort-AV: E=Sophos;i="5.98,281,1673931600"; 
   d="scan'208";a="102250420"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kyckhysUhQAfgupQsvwX4dbaKVsxBxRoIoEAwpgtsDlCkVyUY6RKvo5TGHu51ea6fBQUngT1oct3NJ7YiuEQG6qT+Uzc8abulo2Ld2eBcWl+KbR6QEu9ftCNrkwmEw4fv1t4B8UMc08RDdT5f3nQ6gDh0+iTfZyX9NQsyzFW3/CCGhA2DIdER4DmZHYUm+XIf6impddPlzwKXUrEcJTxQU8ZguN8Z0vF+NYr91urHGxdNOke/mMzny7Q+OwxeIyqt+DWbhJLwdT8Xuv7MUzBL0hMv3nVnh7JprIs56HMCsUWTMw0Q1sPUCRjxjjzML/C2I0ZQxr6GEsMcgSZjzIx5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7xqh63bCaTRE0eq1c50jvKiZ2O6K9g7Y+pvXhGKmZE=;
 b=YNHWv9FXLrj2+s67UHljSYpRC1qozk4UTrR5HcJGGVqegrJ1vD+h4St9bLgHcRn4tNMJTSIW1dGivm3ZirkFFpFs8EshAm6n2x3ILTto0Db0gRUAdHE1aX7NMUOeuHHi06pey68ftYx+yc56NDDNDbPd7PtAACC06ByKA6joWQ53n/7ONC4HZQvO09RuPxucbCqjgBBDfLBwqSzFPhyPPV4e5Mq5OnWtw2fShLahWj8NRL8OgjIwCHeTwWD0ckSgKu42gu1xaKp3EQ9E3lYJ1FjWWFNZEGeRLodTggFPFmRzZEFAbJzaPfgjmuAUe2M1yTprY52a+cfZMZu1ZaefBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7xqh63bCaTRE0eq1c50jvKiZ2O6K9g7Y+pvXhGKmZE=;
 b=jpji5Qpm+bnChyOburo1gLYA/RfGEhnZ+2/J4M4dC+SjyIzA4wVXesra7aOnrIIDs1Un5ZljgUCPIq6ZDoiiJ49djX9TQ7CC24R1wJXlFtJEG9q7ikciDxvwoWPRIWW/QWOa4H0/G2Psr6Ixhcn/wdU4gT3Hgyr0pUc+nrJtBmg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 22 Mar 2023 10:34:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Huang Rui <ray.huang@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC XEN PATCH 2/6] vpci: accept BAR writes if dom0 is PVH
Message-ID: <ZBrLsRebAYaspHrK@Air-de-Roger>
References: <20230312075455.450187-3-ray.huang@amd.com>
 <8adfeb57-1ddd-255d-6d93-24a74b463f59@suse.com>
 <ZBl6iU6T1CsWqVx9@amd.com>
 <ace92506-fd86-9da4-aeb2-37a80094d02a@suse.com>
 <ZBmDl8XjIos57EIy@amd.com>
 <cae4e673-65d8-273b-66b8-08d374797da2@suse.com>
 <ZBmZxnyZWrni57Ry@amd.com>
 <f5634fb6-fd41-6d42-603a-4df69adb929a@suse.com>
 <ZBmrI3wrrwsK5Q+0@amd.com>
 <ZBquOn8x7IyI33Pj@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZBquOn8x7IyI33Pj@amd.com>
X-ClientProxiedBy: LO4P123CA0359.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::22) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN8PR03MB5044:EE_
X-MS-Office365-Filtering-Correlation-Id: 37ed72af-726d-4cd1-910d-08db2ab8adcc
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fzqUMtGdXgBMl9lq4kQCHQol//iUJqb1FxL0utux8TeP8ZnaKvCDUhhh6iBRynyrzmmg6CAqaOhdAvH/Fe1sEptf8KQ0xksy6kDmn+otsQ+kMDW5hadUrW+JW8DF8CAW8dFvlNc2sR0poMExVib5+Mf4Cu+2Br5RJIg1+WHDOZdMIe1Vhd1Y++MqQC530HrKAxePAoqXUgMOjM9lYC0xTwhPV4K9k7xBLfLxUHJzZdPmXtzYA8b0gbGL6WjTZvBns/HOgUAEysRP3f9DJkZA5oZBHbISIET2T3T3WNrgp19Dvrf+ljXvXGdf5YDJ0mLo+qdE4jDqnuY/tv+QvgSGm657kpgW3uBULRB46kS7eI2cKpMmm6K26cnANGtw6mDQKoUCKiUl+MBgfOKSK9Ifb0yShgJGD7GIqdLb1GtycJF5Qz0SM3zCs6yrlqRn0LmYWMAyCzcA/+IDEP+E6VKXIlYFT0dNOR1Xw89DZx03xVw3jTOaP6/EjBx2/WB3nUI+6zIoOhmhlHiuFcpd3OB09CO7TrfpGPWtsOjse9jN3ks1W11PxYR637LLrzeTYeZJ25ft2sETRkfqTtaEf8ln16JUeofQKU8wT0P9uk+lWmoBu0C1pwDNT4YRQc3PUxuN7Cflgoi3ZISoEaLImF34bA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(451199018)(316002)(33716001)(38100700002)(7416002)(85182001)(54906003)(66476007)(8676002)(66946007)(6916009)(5660300002)(4326008)(41300700001)(8936002)(66556008)(86362001)(2906002)(478600001)(83380400001)(82960400001)(9686003)(6666004)(53546011)(186003)(26005)(6512007)(6506007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0QrNk1iODAzZTcveS9CNEM3MlNsYThlTkhmdFFtZldzeEp1WXFNT3EyMFNE?=
 =?utf-8?B?UmR5QWVScFAvK2pncU9GMmVSZlVDU0NQeWJWTXJWVW02dUVZcTlMNjExQ1ln?=
 =?utf-8?B?MmJHdmhoQXdGLzhuS2RSSWZ4Ulk3TnBvUTNXWHZUUU9WcVpFTUtqUnFWWStL?=
 =?utf-8?B?UHNVR0hUdG9sSjZCTEpmb0hEN1JXQzI1ZHExSnllQ05OYmJmaUNxVEtLT1JK?=
 =?utf-8?B?RTFJRW92Z1JMcE1GdUNqamFWZXNVdVBubEkvYjFyVVVYbEJPT3dRazBIWDZB?=
 =?utf-8?B?LzZIaGdKUEJTaTVDM3p0RjdacVkza05xNGZpbURzRVpNK0hLdThsUkl0R3FZ?=
 =?utf-8?B?MFN1TWNWUm1tbm5aL2tkVU5MZHExa0UxQTFLMXM0TzA1WG9CSldtRVlHYzNq?=
 =?utf-8?B?N013ODFrQVArMVdXNU9TY3pDczkxekJXOGJBeVpDN29GU2dBcktndlpMUGZ0?=
 =?utf-8?B?TjVvcHNlTnhubllFdHQwNy93SmlPR0ZkN1dVdjRsRGlJQ2l4OEVadnJGaHhC?=
 =?utf-8?B?MFpZVE1KSUpTZnNXQ0hFdmUzM3NscUZSclJyRHJrQnBDN1JRNDZScG9palQr?=
 =?utf-8?B?UEJ5WU9wYnNCZ0ZUbTZBbXUxYk1teUFlT21KZjFjdjNkczdRQ3dZZWM0T215?=
 =?utf-8?B?Z0MvbERneDhKcTgxYWQwK2JhZWlNU2pLRmFlbCtyTmJUdHEvdm1zZjEyalhh?=
 =?utf-8?B?SkdxRFdYTGIwcHBIaVF5M0JDNGxYR240TVRrdm9QL1Y2KzZIZGxybENXcFZU?=
 =?utf-8?B?YmtiUm5WLzVqcnpNYmcwQWRjbEwxK0k3THVJSXNQeWFMdW50ajlIdHpyV2Z2?=
 =?utf-8?B?VlNkbmNhRnBiWjNGbnJvTWVXeUtrNXBVVThNWjNnS09ScVZkZExyNnhabHdZ?=
 =?utf-8?B?SXhEc1JLeFdVVXRwdVg1QXR3S3R6UTFBaGJRS3hNTXQ1WnFtWVo2cHhjdDVO?=
 =?utf-8?B?UWRkL000aGIyZTNWd0owb0hqM25qL2dyMEhycFk4TlRuSkw0TEVueVJNc25L?=
 =?utf-8?B?cTZ2bm9iWlFpbzBaN3dTa3ZEMUxDTDlwdFcxNTVwYlpzaUc2VnBVbXZVMWZs?=
 =?utf-8?B?bWd4ZXp0cnZxWGJ0MFUwTDNYZkdzNlBSZTgvWitidEFSYlZPQXFEL1VHcTd3?=
 =?utf-8?B?VTdnOWplQXg4QlFBOTVFcVczcndQQVE2Q0xYNkloS0NkcGxhc1laN3BXQnl6?=
 =?utf-8?B?bWhOdUFyT0ZrV0tKNEIzRnBZN1dGNVpwVFBQTU1udUgrVmplNGpnQWRob0VM?=
 =?utf-8?B?dFR6TzNrZ3ZBRi96dXczS0RrTWRBKzlxdHZVRXVUaXRBWDFsWEkwMGYySXMw?=
 =?utf-8?B?aEl1VURsVWFjNzFkeVREUlFJUy9SRWJYa3E2WG9lVmYrV0dxTnhiVG95dHZ5?=
 =?utf-8?B?YXRSemJ5cU82Vm4xMEFDY1JoVXRVMnp6YmtkdEI0UndrN3hYMTFFbGlYU0t0?=
 =?utf-8?B?akxBQmNwbnVsanhtN0w1VkE2cjh0aFR5NnYwT2hmeFBNYW0zbVZITjBzQ0JQ?=
 =?utf-8?B?d0k5Q3owTmNXMVVYR2JYQmFIUU1oSHN1eWwySWV0MXBMTS9RWXpOcGprelBQ?=
 =?utf-8?B?V3NiZndrc3NVTHhWMkxIK2w2SEdjTWNoYm8vOG5YVGxtL1d3K21kSHJCQmVj?=
 =?utf-8?B?QnJybzJQOUJ0cEl2RzZhVUV1a09qbFM1endUQ2hFYXVOQmxCZzN6Z3VPQWlW?=
 =?utf-8?B?T3Z6N3NEYXByWDQvdyt2YmlrWjJzdnR6Z1ovbW5hQWg5bTA2UXhUaWdPWW5F?=
 =?utf-8?B?V0h6OWZETEdDRVVFUnNiejQ3VkczMElOZ3JraWc4RjFKQnFNampQc0dmOUlY?=
 =?utf-8?B?eFMxb2lUTDBMeWlibm9JaHVGRWwyeDc4OGJyTGxtSjdINzUxTzVXeEtCVFRQ?=
 =?utf-8?B?Vis5V25tN1dKaGMzQzF6enIrVGtkZGw2eW9OWlR5c2w3USt5bHM4b0JzY0RZ?=
 =?utf-8?B?RXdHeGVERnpHbWUwaHZaZUxxeTM5M0xsL0hMMk5JazVvbDA0TmxuUytqMHZU?=
 =?utf-8?B?cCtRUWdiY3VXbFlPbmlmaUwzSDFRNi9GMFB3cVd2dlpZYm84NFB5UmxkUVBp?=
 =?utf-8?B?OW9vb3pMRCt6L3ptRjdmcUo3OVMrR0FpbWVHcXRLOTJkVzVhYlBtMWxmS0RP?=
 =?utf-8?B?eHJKYkpVUDlwSGdxUktQZnJIK1pmaUZzeDZVaWVjcTRiSjRRL3ptOThBejZG?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jHpSFM0eqgQW7O/zAR3S0ScFUXnxd5UBkhUeQqWLe9FERl4EzcuirDChKeEVMpbmHhXESsf6AYVP1UCXcfO0Lagp97KnQ12zE6a2LWmiOSmTj8aXBQYp9djolboSM2YUNNqsYpdS0AIdVZFmLAiZSEHr4paOffYq8PykRNSj+y5ekyMty4tYHSWIt2dD2/zId6Z9x6AiXM23pRedrOQuKkvXXwm5Iuw60itVUeZhtS01oJcyWsSatVEX4eoXkhYteNyt/yV2tt/IV02bywK6y1VXxQOrW+0o2Q3bSnQlas2sbt3T1qYMVMQyr3sAXeqfocR8B7HrYifQotqYOGj1/yFi9cj0+jA7vJL/rLyrX8m1r5AeAClS1jJGO04EPjY0l0ls/RUX7wGFA2p5ACgFpvSm2zJAOcYATykzTWCRESKyqsMOoWuKVg5dwdEdGAJp7+ikJxGURl5PkyPCcFa/g2dkGWcFr8oGlJBx7R3WIEPFjjRTlYskimzO3HLeyKQd4LPQW5yoEKXxmn4PAjAtZ6wh4mSyCMnbCswvcF6wMVKH2gg6plSJcoKXNciq9swxF9Ku7UuNXyhkNV3dpzFYdJ+AeeALLDDul0689K+STGTwjTHVvku3gkSTt+LY9hj5OPI8esJ07N6a6WXNE1jdy0GahhCZMS+bHGy15qpVomTohVmq5xWavKLg+Zp/rkCLivAxto8sPTYhuVUsu++QmtucvUrcN9cI30BYBadUew0/qt47bFe8E1WNFAikdwKGyEAa0uwDa8nmRqPWL+MAsry7+HOKlzT3aOdDH0s3EWMErPH45zefjr8mqNur1uDWPbNjev316xQ9gw+PIYY5Bi+tq+YwZjS1jLcVfcnPL9B7RbkKDKYTxuXx4GmM2M7m
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ed72af-726d-4cd1-910d-08db2ab8adcc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:34:48.4707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dduH48hGZbIuqc9eF410T9X/dYc6W6f1kLpLm8KV5oV5npzcszF9lfDhFTrZGiAX87bgeN5kPyRCuBZ1duaMWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5044

On Wed, Mar 22, 2023 at 03:28:58PM +0800, Huang Rui wrote:
> On Tue, Mar 21, 2023 at 09:03:58PM +0800, Huang Rui wrote:
> > On Tue, Mar 21, 2023 at 08:27:21PM +0800, Jan Beulich wrote:
> > > On 21.03.2023 12:49, Huang Rui wrote:
> > > > Thanks, but we found if dom0 is PV domain, the passthrough device will
> > > > access this function to write the real bar.
> > > 
> > > Can you please be quite a bit more detailed about this? The specific code
> > > paths taken (in upstream software) to result in such would of of interest.
> > > 
> > 
> > yes, please wait for a moment. let me capture a trace dump in my side.
> > 
> 
> Sorry, we are wrong that if Xen PV dom0, bar_write() won't be called,
> please ignore above information.
> 
> While xen is on initialization on PVH dom0, it will add all PCI devices in
> the real bus including 0000:03:00.0 (VGA device: GPU) and 0000:03:00.1
> (Audio device).
> 
> Audio is another function in the pcie device, but we won't use it here. So
> we will remove it after that.
> 
> Please see below xl dmesg:
> 
> (XEN) PCI add device 0000:03:00.0
> (XEN) d0v0 bar_write Ray line 391 0000:03:00.1 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 406 0000:03:00.1 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 391 0000:03:00.1 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 406 0000:03:00.1 bar->enabled 0
> (XEN) PCI add device 0000:03:00.1
> (XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
> (XEN) PCI add device 0000:04:00.0
> 
> ...
> 
> (XEN) PCI add device 0000:07:00.7
> (XEN) arch/x86/hvm/svm/svm.c:2017:d0v0 RDMSR 0xc0010058 unimplemented
> (XEN) arch/x86/hvm/svm/svm.c:2017:d0v0 RDMSR 0xc0011020 unimplemented
> (XEN) PCI remove device 0000:03:00.1
> 
> We run below script to remove audio
> 
> echo -n "1" > /sys/bus/pci/devices/0000:03:00.1/remove
> 
> (XEN) arch/x86/hvm/svm/svm.c:2017:d0v0 RDMSR 0xc001029b unimplemented
> (XEN) arch/x86/hvm/svm/svm.c:2017:d0v0 RDMSR 0xc001029a unimplemented
> 
> Then we will run "xl pci-assignable-add 03:00.0" to assign GPU as
> passthrough. At this moment, the real bar is trying to be written.
> 
> (XEN) d0v7 bar_write Ray line 391 0000:03:00.0 bar->enabled 1
> (XEN) d0v7 bar_write Ray line 406 0000:03:00.0 bar->enabled 1
> (XEN) Xen WARN at drivers/vpci/header.c:408
> (XEN) ----[ Xen-4.18-unstable  x86_64  debug=y  Not tainted ]----
> (XEN) CPU:    8
> (XEN) RIP:    e008:[<ffff82d040263cb9>] drivers/vpci/header.c#bar_write+0xc0/0x1ce
> (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d0v7)
> (XEN) rax: ffff8303fc36d06c   rbx: ffff8303f90468b0   rcx: 0000000000000010
> (XEN) rdx: 0000000000000002   rsi: ffff8303fc36a020   rdi: ffff8303fc36a018
> (XEN) rbp: ffff8303fc367c18   rsp: ffff8303fc367be8   r8:  0000000000000001
> (XEN) r9:  ffff8303fc36a010   r10: 0000000000000001   r11: 0000000000000001
> (XEN) r12: 00000000d0700000   r13: ffff8303fc6d9230   r14: ffff8303fc6d9270
> (XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 00000000003506e0
> (XEN) cr3: 00000003fc3c4000   cr2: 00007f180f6371e8
> (XEN) fsb: 00007fce655edbc0   gsb: ffff88822f3c0000   gss: 0000000000000000
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> (XEN) Xen code around <ffff82d040263cb9> (drivers/vpci/header.c#bar_write+0xc0/0x1ce):
> (XEN)  b6 53 14 f6 c2 02 74 02 <0f> 0b 48 8b 03 45 84 ff 0f 85 ec 00 00 00 48 b9
> (XEN) Xen stack trace from rsp=ffff8303fc367be8:
> (XEN)    00000024fc367bf8 ffff8303f9046a50 0000000000000000 0000000000000004
> (XEN)    0000000000000004 0000000000000024 ffff8303fc367ca0 ffff82d040263683
> (XEN)    00000300fc367ca0 d070000003003501 00000024d0700000 ffff8303fc6d9230
> (XEN)    0000000000000000 0000000000000000 0000002400000004 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000004 00000000d0700000
> (XEN)    0000000000000024 0000000000000000 ffff82d040404bc0 ffff8303fc367cd0
> (XEN)    ffff82d0402c60a8 0000030000000001 ffff8303fc367d88 0000000000000000
> (XEN)    ffff8303fc610800 ffff8303fc367d30 ffff82d0402c54da ffff8303fc367ce0
> (XEN)    ffff8303fc367fff 0000000000000004 ffff830300000004 00000000d0700000
> (XEN)    ffff8303fc610800 ffff8303fc367d88 0000000000000001 0000000000000000
> (XEN)    0000000000000000 ffff8303fc367d58 ffff82d0402c5570 0000000000000004
> (XEN)    ffff8304065ea000 ffff8303fc367e28 ffff8303fc367dd0 ffff82d0402b5357
> (XEN)    0000000000000cfc ffff8303fc621000 0000000000000000 0000000000000000
> (XEN)    0000000000000cfc 00000000d0700000 0000000400000001 0001000000000000
> (XEN)    0000000000000004 0000000000000004 0000000000000000 ffff8303fc367e44
> (XEN)    ffff8304065ea000 ffff8303fc367e10 ffff82d0402b56d6 0000000000000000
> (XEN)    ffff8303fc367e44 0000000000000004 0000000000000cfc ffff8304065e6000
> (XEN)    0000000000000000 ffff8303fc367e30 ffff82d0402b6bcc ffff8303fc367e44
> (XEN)    0000000000000001 ffff8303fc367e70 ffff82d0402c5e80 d070000040203490
> (XEN)    000000000000007b ffff8303fc367ef8 ffff8304065e6000 ffff8304065ea000
> (XEN) Xen call trace:
> (XEN)    [<ffff82d040263cb9>] R drivers/vpci/header.c#bar_write+0xc0/0x1ce
> (XEN)    [<ffff82d040263683>] F vpci_write+0x123/0x26c
> (XEN)    [<ffff82d0402c60a8>] F arch/x86/hvm/io.c#vpci_portio_write+0xa0/0xa7
> (XEN)    [<ffff82d0402c54da>] F hvm_process_io_intercept+0x203/0x26f
> (XEN)    [<ffff82d0402c5570>] F hvm_io_intercept+0x2a/0x4c
> (XEN)    [<ffff82d0402b5357>] F arch/x86/hvm/emulate.c#hvmemul_do_io+0x29b/0x5eb
> (XEN)    [<ffff82d0402b56d6>] F arch/x86/hvm/emulate.c#hvmemul_do_io_buffer+0x2f/0x6a
> (XEN)    [<ffff82d0402b6bcc>] F hvmemul_do_pio_buffer+0x33/0x35
> (XEN)    [<ffff82d0402c5e80>] F handle_pio+0x70/0x1b7
> (XEN)    [<ffff82d04029dc7f>] F svm_vmexit_handler+0x10ba/0x18aa
> (XEN)    [<ffff82d0402034e5>] F svm_stgi_label+0x8/0x18
> (XEN)
> (XEN) d0v7 bar_write Ray line 391 0000:03:00.0 bar->enabled 1
> (XEN) d0v7 bar_write Ray line 406 0000:03:00.0 bar->enabled 1

As said by Jan, it's hard to figure out where are the printks placed without a
diff of your changes.

So far the above seems to be expected, as we currently don't handle BAR
register writes with memory decoding enabled.

Given the change proposed in this patch, can you check whether `bar->enabled ==
true` but the PCI command register has the memory decoding bit unset?

If so it would mean Xen state got out-of-sync with the hardware state, and we
would need to figure out where it happened.  Is there any backdoor in the AMD
GPU that allows to disable memory decoding without using the PCI command
register?

Regards, Roger.

