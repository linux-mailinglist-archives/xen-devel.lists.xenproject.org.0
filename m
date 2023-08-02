Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E2376D0AF
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 16:56:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575055.900787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRDGf-0000n6-NZ; Wed, 02 Aug 2023 14:56:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575055.900787; Wed, 02 Aug 2023 14:56:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRDGf-0000lS-Kp; Wed, 02 Aug 2023 14:56:05 +0000
Received: by outflank-mailman (input) for mailman id 575055;
 Wed, 02 Aug 2023 14:56:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/vke=DT=citrix.com=prvs=571ca8ae6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qRDGe-0000lM-Mi
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 14:56:04 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2202a1f-3144-11ee-b262-6b7b168915f2;
 Wed, 02 Aug 2023 16:56:02 +0200 (CEST)
Received: from mail-dm6nam04lp2047.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Aug 2023 10:55:59 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5502.namprd03.prod.outlook.com (2603:10b6:a03:279::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19; Wed, 2 Aug
 2023 14:55:58 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::9410:217b:251f:2a98]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::9410:217b:251f:2a98%4]) with mapi id 15.20.6631.043; Wed, 2 Aug 2023
 14:55:58 +0000
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
X-Inumbo-ID: b2202a1f-3144-11ee-b262-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690988162;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5uhLGxYOXyEg7PZAexzzZHJMpwmhbJYFsqRd8ABdZtU=;
  b=U3rYQ20Gw+LClCxEsfvQRoWJmKQb0k1QpJpiq/mf6gTe4+uh7By5K6hA
   Lf4a4a8J3QUrIvCYBdP5o6D4dkJWtVJ0+WjlF+7x3UfKxV8bz/cvjRTmG
   TrFWd6o0T7pbFgJ0c87E+p0wvVFyKWWpHXQHlAR15porYK0mKmxJ+QMny
   A=;
X-IronPort-RemoteIP: 104.47.73.47
X-IronPort-MID: 118281120
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:S2SaLaNK9Lapc5DvrR1AlsFynXyQoLVcMsEvi/4bfWQNrUp30zEPn
 GEYCm+PafyJMGukc98jYd/g8xkPuMKGzNBiQQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tI5gZmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0qFrXD986
 MEJEz0Qf0iZgrzv+7u5auY506zPLOGzVG8ekldJ6GmFSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vFxvze7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraWzXmrAdtITNVU8NZt0XGemVUoDyQOTECKjfOYjUi3VtZmf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZbb9YrrtMxAzYj2
 VmAhdrBDyFgq7CTRjSW8bL8hTWzMi8RJCkcaDMeTA0Ey9P+r5o+iB2JRdFmeIalg9uwFTzuz
 jSiqCklm65VncMNz7+8/13Mn3SrvJehc+IuzgDeX2bg4gYnYoegP9Cs8QKDsakGK5uFRF6cu
 nRCg9KZ8O0FEZCKkmqKXfkJG7aqof2CNVUwnGJSInXozBz1k1bLQGyayGgWyJtBWircRQLUX
 Q==
IronPort-HdrOrdr: A9a23:Ka7lMKGGmRCvUiedpLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-Talos-CUID: 9a23:8dW3W2DMB7Kh0m36E257qRAmB/00SXDA3S/KJhHhMm9raLLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AIgWOrA0BaLbR3EGOXBXPIDDYkjUj5PWCBR80qpI?=
 =?us-ascii?q?/o9CfBAB6GjCbhTmze9py?=
X-IronPort-AV: E=Sophos;i="6.01,249,1684814400"; 
   d="scan'208";a="118281120"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hmu68aQHVMB+x0EuiRIUAIVpI+UInhJ18s8KHabBK2c2DI5i0EPdt7ip8r/v0SHA4T/lVHob3w+1nwSdHjz7BkmohlV8LrvwWqtGqTWFdq3mDj04qYWbzCy8UnMdVH7UNdQ1PV/WyNHBCuaeMudpsnQ02awoBoP6ByUF5/qovxFkvTA961ATHYV9SoLAGJVUeHOaK0C2LqAjkB6KKwJP+9w7ppBWolTA7+NoQNK95dK1qqCr3v6WjPptZBYniAUgPb1s0kgXKnQ1zZe0hGzAN6l8nkXO8UXTjQM+MT/SKub/XsGQ45gl4leTWFTSlPW5sFlL3LvUdJoGEeMkFA5XEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uhLGxYOXyEg7PZAexzzZHJMpwmhbJYFsqRd8ABdZtU=;
 b=LYf2HkYKRDN6Ex/8cm6m83x256zIBznAc+Ru4L4kZzP8qosF7kv8jicQ77c6KoWqC3DaODDp1/CZaWp5/f2nWl8Rc69tV+kcpk8xuj5Be2m7lH/Eg7vr5Gsr021mv+OyFlGhwJvjgoH8F4s4DSVtguq6tL/xxHeb/4B0eeCvBvD7BRvO3XqSFAeuINmf9DeYCCtK8l1d/pK8TmZ/8VZOZiQQp/w4eOD+YIJMf3LRkBWD64zV3DqzVeHgdCtGfBMijRYRgr4B4ZzMturoYkcDBz4pcGrOK7DI9smZqRyYOzgnbqDGdbqgRof3YGAWJt7Q84FPEEg49YZ3v4pz3tQl6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uhLGxYOXyEg7PZAexzzZHJMpwmhbJYFsqRd8ABdZtU=;
 b=mabKcbfUaGR9XjNNk+rkVgzLhex9X33E/EpQUmSxhvq1qGYdl7lf5d3ywmSCJequsPMOtS1f7UVYg1eRTQppIDJGfBKmSRXmHTyNdgND2iYmbbhHUmbSVCOT6cHCXP5RwipHQnZbU3QrqIV9awzWACPt1qkCxmmyOC2XbBdpNp8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <366d308a-92c2-bb7f-3c93-c1fdb23c2e68@citrix.com>
Date: Wed, 2 Aug 2023 15:55:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/3] x86: Delete str()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230728194320.3082120-1-andrew.cooper3@citrix.com>
 <20230728194320.3082120-4-andrew.cooper3@citrix.com>
 <88fc0c4d-de8c-73ae-93ea-5df60a30493d@suse.com>
In-Reply-To: <88fc0c4d-de8c-73ae-93ea-5df60a30493d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0470.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::26) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5502:EE_
X-MS-Office365-Filtering-Correlation-Id: fa3c94b5-dd4f-422c-f617-08db93689444
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y1sBtBBQh8qCU7x9UsvL6MYwN3RD98U6GytfHseI2dZRzGN++vNFNYHCO+s0/SzrfqDvObK895T+UfCXD7YGRLxiodCg6l211gqiljvlpc1wteWCkFqSW8bA1gkos10RVc81FtaqA1Q/S8EL2LGhHgrIetIS7fCdLcTanDqN8s3oa/48BYqRLzDtBnORFST5d/ec40BJZYgPXyuzYNuemSjP13sqLbJofq4/65fr2iA6oFtnOF3oxQdmMCBy716peLdR+o67FPV7xSS8912qSUrl1yNrbnOtcmw5VXRaCwwXIa0iwcRPQUl0JWiv2Di2Lojs6LjLJrahJI/fGpsRdP7GtcJc7BJX3DU5Auq9ZkLh0L+ul54HsfXz6X/woz4EgunXYkvTwx79zxpHB07HBjQ+/FfnQUQkNV3KDISZhBsH7ZxOHDxRmM13hS1MrhExZqozxfF7q8lq8drLbaKOvs7S3Q/xsFFjmgu2y2OLdsLr2GVJPd++wQ49Nfxc5veoL3zmEsu9Hb7RN5HQMF+71/xIeIZAoyiGurAEgGd78IvbbNsBe2fuUx+ds7q3yckZ7eiRZjau4V5fvS18At3VdhQqX5ksUkbkr6BcZLazYynxTIPSoEazscdRKXkliLHR5Rmv05QyCp1Bivkz7FKccQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(451199021)(66556008)(66476007)(6916009)(4326008)(66946007)(2906002)(38100700002)(2616005)(82960400001)(53546011)(186003)(6506007)(26005)(83380400001)(54906003)(86362001)(31696002)(36756003)(478600001)(6512007)(6666004)(6486002)(4744005)(41300700001)(8936002)(8676002)(5660300002)(31686004)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUNEanptMlNLVi9STlJDazZvanM5U2paaUNtbnBNZE05ZzMwMFFyTlBHSG9o?=
 =?utf-8?B?UnBxYTMyUWhTNnYxcHpobzJzY1RkUUs3OVBoNmtKWjAzaHhnbDV1cFpZc1hU?=
 =?utf-8?B?SEU3OXoxZk1Rb1Z2WHRsVXc2bUZ5NFRKV0g1emxCU2h2UHlXREtaSTVQSVY3?=
 =?utf-8?B?bTNrNmYyZFd3dG1RcDdUMnRwbzBYRVgrNFdnV3hFM3dVczcxZlBPcUdUNkNk?=
 =?utf-8?B?NlI5aHJCWlFMUmtzZElyRCtRc3J1Snd4bU9vaFBOc0pPaUhnT3dZamhDVlJG?=
 =?utf-8?B?NkVBcVh5UGQ0ejdiM0tEYk16UnRab0FNQUpQTFpBNEFNNnhJdG1aMHd6SHdr?=
 =?utf-8?B?SkR3dmRwNHJ1NEp0OVNTUVRCamlPWktaTUxBV1dlQVFKOHFEWm5VZU1EaGVv?=
 =?utf-8?B?ZGxiUjFBMThJVmlNOXJPajZ5UlVLYXcvWEc1N0tDQlpLYVFzQ2VKeHNrM3Ay?=
 =?utf-8?B?VmdxS3RZaFZRRjFzRVdLWjR3RkltdFYwY2tCZWVhd1hCNzlMUWliKzJzRk0y?=
 =?utf-8?B?bnN4M29BM0ZqcGg1aytPd2d6TWZXcHZvK2JadFY4OHpIUWQ2SVlKaC9tR3NU?=
 =?utf-8?B?MlBmaG5wRVVtandrNVZmVEY5L2tZUUpqbmNCYms3ejlIRWxNamxsbXpqQVhI?=
 =?utf-8?B?ZFJTTVdlYThtWlRBbE5FbE5aQ2NsdTZ6bjBrblF4aExTTjdJak8wbDlySy91?=
 =?utf-8?B?Q204dzk4em9pZDJkdTVwNjF2cy9STUFMQVl6cVRhZG9Jdjc1c2Z5L014bHU5?=
 =?utf-8?B?UURSbHg1TGFYVkMwekRGenlrNjQxeEVQdVQ5MXlPOHBpcyt0L0dVZy83MmI4?=
 =?utf-8?B?VmRUcU1PNHhWeGpVeXJ1ZGZYaTNjcXlLV2d4WDNCK1NlQ0MrTzVuRjZBVmk2?=
 =?utf-8?B?T3F5RWJYOVprazhScjRsNzdWS1RmRGx3dTJkMEp0Sy9HNXc4OHdnRVBJbldu?=
 =?utf-8?B?R3AxZXdSM2tTUDlHcnNtbTJSM2tsUENHUUFuVVdlR1BxSU5VUHloRjRtbFdP?=
 =?utf-8?B?S0ZISFF1WitRSTlvMWRLY3VlNmRwZWdXazRSOEtmcy9GUUI3cnBwbUNGMFZn?=
 =?utf-8?B?Z0NtZUl1TTNTL2VKQ0Q0NGkwdVNqM0tpWnpmWEpaRXR5dHR2RkxFK1F4SnVS?=
 =?utf-8?B?M0toSjQvVXJHaFF6WFp2SVhhTHM4YzV3aHVQVTJPdHV3L25PTDFaTGRPYm1u?=
 =?utf-8?B?UUpablJZcHVISXZ1SnpRenBYY3cxSlhSYnVUVkNVeWMwTVQ3N2JjSEF6K3Zv?=
 =?utf-8?B?bkNyMkFIdUFEZGsxQXgyOUhGVXJSYzQvSWIyV2FpKzFWWTlkU2tSdjdDcVly?=
 =?utf-8?B?aDIzME9WYUlpNHNpazJnV0Rpdzk4UVVVbjQ2eXAzTFJKQ2JHV0tMQllKLy8x?=
 =?utf-8?B?cGlhUkVJVEpmcWZDTFFHUDNPM1dYWE9BaklSUm9yZzIwRmhLS0U5QkNta0h1?=
 =?utf-8?B?d1pZMHZCM09lVE9pcnhCWEVBSDg4dEUvZjgxWTg0SFBmcWtLSFhnRmJUa082?=
 =?utf-8?B?dSs0clNBT29tWnF6Nk4vWDBvMEZlZkRjNEdpa3pGYUdYdEpaTTVBM2lyRXpi?=
 =?utf-8?B?MWdCaGhKQm9YbCtWUHk5aWF5V3k1T1ZwZXFPY2FLSHRYZUh5RGg3bTFoZ3pu?=
 =?utf-8?B?VmNpazNaRnRxQzRQa3htaXFMcVdESUNjMmd0aXZVWnNWWmFEUC81T2FvZ1dw?=
 =?utf-8?B?bXM2eFUzUlVBUkFwMURpNVFvTk9obE8yMjBzMHNPNWlrWjJvK285MFFRMHZp?=
 =?utf-8?B?YmZnNGMxdllZem8vZVd4bHVYd2JwMURadzF5Q09hSVVKVzJXL3BIUzNhY3VF?=
 =?utf-8?B?WXl4dE00UmpIZmw4NWNISnp4OU1KMVJxWW9GME9LOGdnNFZUcmo4UUZUcCtu?=
 =?utf-8?B?NW4yMkk3U2VWeFlWYU14N3IrVVhyemRUT2s0MHkrb0t4emJ2TFN2K1BUQVk2?=
 =?utf-8?B?YnRsNFJ2YXVGSFZ5SjNMY3ZUSEw0aDJ3TnF3c2xwV0wweUExTW43bU9OdThQ?=
 =?utf-8?B?eXo3ZndBSDRpc0xQbGlpV0tZMVFzcDdMYVNocDFVN1N5dW1YWVc2ZThGdHBz?=
 =?utf-8?B?SXRYRGpKRzB0MkQ4SUtOZnA3R2VoYTVXT3JtcTJmYVJ6S25qZlo3MjNuSmJq?=
 =?utf-8?B?MjlSVjFvZ1RzSHczM0FXS0haWjVlZlM2cll5ejcvSmZ3WmVrTTNTNnZFU1hk?=
 =?utf-8?B?ZEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QnWXo44RahUYBqkgu/P2elM1Q9oCnQaS6lF1DaxaoMx5T6ZOuDQWxVMVJGd/44qe3emQ3oFMfX1sbHgj/aoC/Kfgqcysj8GDKF2f1N+UEx5FSR3zwMhWZYqkZgHGZ85RPA8iUSJXU+RjL81x3DpiS5JjxrNA3juDVLyKThbKB+CqYwEs2oZQ2gvvQw3D9hLzUUatqFfF5+A8ePtYoNHn376xEl4f595g6lc59Fg7cCwZIq2m9JHMRzH4x5f2JnegPTY9C1yiMCx/IYWxrpBwvce1UyiT5ANHfbGED+Ufw/EAgwHu8ntEWOWJ/8rpplPt0pR/TGdlmCtIKN9jMd605gUEds0hhkGR7MxYaJqJKE09Lpx1ESErG0dSlmTOKcEnUfbcHlr8RxDVAQjIvs0rfy7ixq1PeEseeytMhmwZj7WctCY+2lA0Pw00uGAhcsVYU9nHszdBLgVaKQty5/lSP1x5OgBBFN6ed5mEWRZ5xsFCVNolR7v29hGOAgtpOQ1upiaZi09aY63GNDwcaoFIRbdXHIrAU4EVNGbZDntX8exx8MBRJP4XqrBNReBkqkVVod3Hdn4WqMHvgaIOsvnsYgs7tHBeaNLC/sUfpjl7u8yXNM4ktJPDcfxZ5IhX5nSiHc1FOqXM1RIpZ96ys/+y6ke1qF0KOgDR+UtFPnq/1jSEe/zFbKF/hAoFnBb0t/7Xb3H6dTijEypGbQSAmCb9ncW909tKIuIUgDCZKKEu+H+9xMo5hhEGdqGVHJD6CmK3MksTMtlZ0BiBOcC+5ut97JBppZkjMZ44WOkFwBhjaUa+0DrhhsEzzwvGlC1GQq8IrhPrHsBhSa2W7Ruc1AMnEcyhVwY10gSi46ddFo3VLDM=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3c94b5-dd4f-422c-f617-08db93689444
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 14:55:57.9859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPiIyrBzxz8XAzWX4nOuOWCf0l63DK5Q33gSFtK/F3SGTQjXmLp0jeNhgZCqQmZl+oo5a54KT8bER785jqJUNcEWKy8bQ5lQ01pt8IkMRlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5502

On 31/07/2023 9:25 am, Jan Beulich wrote:
> On 28.07.2023 21:43, Andrew Cooper wrote:
>> This is used in an assertion only, which is somewhat dubious to begin with and
>> won't surivive the x86-S work (where TR will become be a NUL selector).
> I'm kind of okay with the removal, but I can't read anything like the
> above out of the doc. Can you point me at where this is said?

A future draft of the spec.

FRED removes the IDT completely, most of the TSS, and can let you get
away with GDT/LDT limits of 0.

x86-S removes the final aspects of the TSS (the IO perm bitmap, and PVI).

Intel have agreed that being able to (effectively) `ltr $0x0000` to set
the TSS invalid (like NULL selectors do for all other segments) would be
useful, as it means you don't need to have a transiently non-empty GDT
just to load an empty TR.

~Andrew

