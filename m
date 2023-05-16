Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10134705725
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 21:33:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535556.833391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0PR-000178-H4; Tue, 16 May 2023 19:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535556.833391; Tue, 16 May 2023 19:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0PR-000155-Ba; Tue, 16 May 2023 19:32:33 +0000
Received: by outflank-mailman (input) for mailman id 535556;
 Tue, 16 May 2023 19:32:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7WEk=BF=citrix.com=prvs=493b78b38=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pz0PP-00014z-Ni
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 19:32:32 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63691252-f420-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 21:32:28 +0200 (CEST)
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2023 15:31:53 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB4921.namprd03.prod.outlook.com (2603:10b6:5:1ea::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 19:31:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 19:31:51 +0000
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
X-Inumbo-ID: 63691252-f420-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684265548;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UEOWwoXYmogg+FZr/nvtAjUiGOViDPxhO8690y9mbV4=;
  b=YgYPzcIJOq+R1qSWephDgt8ucMshLTlNxYL4x8XdGLe07Ji5qbY+rG2Q
   VeG3E+Wa2kgUsSIrbNiWf/WxXjZiamRqE7V330JxBtpVq04hGmfHj1F5U
   uC51cHjkKh6SB6iEsj4qwetRI+8tDmcPZ5IJCcGwAtstb7oiiUFAFos2q
   8=;
X-IronPort-RemoteIP: 104.47.55.169
X-IronPort-MID: 108601033
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:yJMOgq8iFdYn0RRUlMnoDrUDrX+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 mdOXmGPMqzZajTzfIh/b9y08klQsZWEnNcwQAJpqCg8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOKkV5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkT5
 KI2NhInQyvdgui74Zy/cc9FuO88eZyD0IM34hmMzBn/JNN/G9XpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUvgdABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpCSuXhrqUx6LGV7mceCEUddViDm/e40EODA/EFK
 hU4xBN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxmdLngJSHhGctNOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgc/iTQsSAIE55zpptE1hxeWFNJ7Svfr35vyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLzsZ6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:nsa0aK1Eyl5mqdvTTJeRSQqjBa9xeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtj4fZquz+8T3WB3B8beYOCGghrTEGgG1+ffKlLbak7DH4JmpM
 Jdmu1FeabN5DtB/LjHCWuDc+rIqePvmM7IuQ6d9QYUcegDUdAe0+4TMHf+LqQZfnghOXN0Lu
 v/2iIRzADQBUj/I/7LTkXsGIP41q/2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbfyJTzawk+W
 3llRW8wqm4qfm0xjLVymeWtv1t6Zfc4+oGIPbJptkeKz3qhArtTIN9W4eatDRwjPCz5E0smN
 zspQ5lG8ho8Xvecky8vBOo8Qj91zQF7WPk1Daj8DbeiP28YAh/J9tKhIpffBecw008vOtk2K
 YO+26CrZJYAT7JgSy4vrHzJltXv3vxhUBnvf8YjnRZX4dbQLhNrbYH9EcQNJsbBir15K0uDe
 ErJsDB4/R9d0+cchnizyJS6e3pek52MgaNQ0AEtMDQ+z9KnEphx09d/8AblmdozuNLd7B0o8
 D/doh4nrBHScEbKYhnAv0afMexAmvRBTrRLWO7Oz3cZeE6EkOIj6SyzKQ+5emsdpBN5oA1go
 79XFRRsnN3U17yCPeJwIZA/nn2MSSAtAzWu4NjDqVCy/jBrOKBC1zGdLluqbrvnxwnOLyZZx
 7pU6gmRMMKLgPVaPJ0NkPFKt9vwEIlIb4oU+YAKiOzS/3wW/3XX8zgAYDuzenWYH8Zc1K6JE
 c/dx7OA+gFxnyXexbD8W3ssjXWCwPCwa4=
X-Talos-CUID: 9a23:zEEdK2BOVRKxksD6E3R2qmAKOOoISSPYxnrxDUuDL09XY6LAHA==
X-Talos-MUID: 9a23:gwKcTQqD1iSftHhXLLkezzpvNJ9jw6eWMk4My5g74+reNHVcBQ7I2Q==
X-IronPort-AV: E=Sophos;i="5.99,278,1677560400"; 
   d="scan'208";a="108601033"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWvqAQYG3jPrIMtH8YDOjD9H9jvWxyNnk1N2t4ZYBxrOLKG9b+KzRvzJhBhSMSwFEnYQXIQd31cZBtT0PneHcS28IPxkz97QKLrztt+LcugZWrOj3ADrw5L2zPF7whul3U9OcuCVST65PaxXbgP8fOr/ir98+efXS7ZbM5/1XSoEayaIDwNCvbtNHMWFfJaOaz2DNM0CZUt32WT6hwgzsS33umZBySwm7VuddgHxb/StnsQHrwM6Fj1Prpg/QVTrRkppkMguojfcQwu8rXecHfwr/BNHLflBDd44QCJ/N98/rldnV0qLph5Q2KgNOA+sukbeAb+X+p3g8E8/MzHYSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEOWwoXYmogg+FZr/nvtAjUiGOViDPxhO8690y9mbV4=;
 b=OdeYB8WTDE35NwvGs3o6P9lL0OY5IKieN2HOyOEOxhLavTEpXHGDkaE1skeOGLt83gvdZu2dEIxe1irB55cg9k9uIha5J6zopwRfwLDLwx0c1+4o6b2GbT3N1qxka8JSVhavSq/+SyDCAqGM/AFcOIXpoiAZPYH/6/GksePTLWONXb54xEk3+kVpYykkT76AomzfxYqzeSh27GxfOpZb1KMO1s15XQeMSHQ7NimL1s3yo4i9rpBhpKAvnpxJk1YI/xDgWLICEjS4fTXwEW9vNnkMv8nkVW+11cKBuQ90GxkArEIRJ4UXdJ0PXLsILpOxcSlLrTJBq/NUp9RKTv5wDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEOWwoXYmogg+FZr/nvtAjUiGOViDPxhO8690y9mbV4=;
 b=cGPV/89WpJZMJBnn4zWxJLTGPjeAIZfUw1ePPf5bEwzP3FdbltaiOuGOTHI7PHv5dWpDY4ZVuEVWyi65DK1KU8dDODYiHOjTE9kuxssv+UmwZ63bqBIZVDKmjon2h9GAHhlBVGiD2k5Zcae5U8dnwUEsfCf4xsvpNhdUoitsOJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <54b35fa0-160e-3035-6c22-65a791ed2f84@citrix.com>
Date: Tue, 16 May 2023 20:31:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/6] x86/boot: Expose MSR_ARCH_CAPS data in guest max
 policies
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
 <20230515144259.1009245-7-andrew.cooper3@citrix.com>
 <a545a6c9-db48-9d91-c23b-59ea97def769@suse.com>
 <25421dbc-5889-a33c-37dd-d82476d56ce4@citrix.com>
 <1bef2b0e-04e8-2ca0-cf03-f61cdae484a9@suse.com>
 <b1c56e56-90cc-0f37-4c8a-df1217339e59@citrix.com>
 <22a6bd70-887e-da72-ccff-16b3627463c3@suse.com>
In-Reply-To: <22a6bd70-887e-da72-ccff-16b3627463c3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0277.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB4921:EE_
X-MS-Office365-Filtering-Correlation-Id: efd76ccc-54a8-42e4-18aa-08db56443228
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l0XhRj8IwHRdIK2QFOmBRM1liy/+/qBi8hjiR5iKVsmK8WUzAQpExJZBUIoS1uljF+p8xFDMc2NMU4Yv+B579UWBPgIkI7o2nSHYhCa5RNWxUxC9AUfkf2aQjkw/cNAZ9LctrTm98Disqn0O5siOKWe4zG3aezFFlrHhqb6Ycn5VM0ysgoOHK7pW7L4IFCo8IwVHydJTaqB8dKJTHsXCqJLAbtrY59F8zs/PU6HSfchjlXX0gtOWSr7jI++rZkIoCYiOg8PTuCo/em57cRdXpO1OV8BhabOiek39fGI9HqJrkLnjxPu39Nhn2ArCzEz8vDoeOv66cm+49+UyNVFVaTag00bTfH4LweT76d1cn2EC0cSmOS94yJzQqih3z80r8rrN04NjVm6HPa+08yunAnIYr8ccQBRSS4L43BR0BZo7PFH+lQT8yBHKV1gC901UyjHeA0sZgBAYqSN/wfvBRP8rkoADsUW0K15oJGbYImuhCvpXLUk0ScU7IyL2LRPzNDOC6etR2V+1Cv0smdUhxPvL48GhhvKf5t3q2lpYhnANE/l2AbPqZn55aRxUPCWeD9DX6mUchUL5aNEbv9jqAXx670DwPVrLVjvZ5hOxAt6GrrsmY4D51MRXbt3V20ZM+vBYJibAlrcwz4JBe5BluQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199021)(31686004)(38100700002)(82960400001)(31696002)(36756003)(86362001)(8676002)(8936002)(478600001)(5660300002)(6506007)(6512007)(26005)(186003)(41300700001)(2616005)(2906002)(83380400001)(316002)(6666004)(66556008)(66946007)(66476007)(54906003)(6486002)(53546011)(4326008)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elMrelp1WU8vS1lEU3RpbE9FNEs4ZFRuL0d2eVUremVYNjRzMGhZQ1lEdlB5?=
 =?utf-8?B?ZSt2WklWT0Nxb243bSsxZmpVYnRyc2kwNmhIald6S2srR1kyQ2FNcGF0a3Jn?=
 =?utf-8?B?U05weVI1RGVmdUZpWTl4Q2k5My8wWWtiUk5SN291UUlGbmljMXZIblRrYjhC?=
 =?utf-8?B?b2l6OFMwbElBUmVZNGE4Z3RWalBrUWFqcDRHUnZOd0ViZXhoZWlKRDFQOGZ0?=
 =?utf-8?B?bWNkbDlIeTBwRzNsNzdCSlhobWdFeno0UGFpUkdsT29hZXlDWXRKa0czQlNv?=
 =?utf-8?B?dzQ2dlBrWlE0WFhjYi8yRDNZVVo1VXF0ODVhQlQ5VVlHSndiaG9uU0h6c01W?=
 =?utf-8?B?UUxsYnNwQ1JrWkkwaHlSSVVRZ1ZKc3hjaVROVUJINEQ2RVM0cTNnYVNtT3pm?=
 =?utf-8?B?K3pGZlUxSlo4angvYVVwM3hnWVBDM08wQlFFUEZZeGRZQU11RWtqcTRqL2xU?=
 =?utf-8?B?V1QrUysrcDlXYkEzTEhYTmdsbnNNYjZmU2hhRzMxQ0VLSlFZRi9oLzFpQ3lG?=
 =?utf-8?B?azZpcnpuaVVnVmJzbWVjd1pSRmNlNVc3dDFxcmpoYnAxaVVDNEE4dFowOGN3?=
 =?utf-8?B?c29mdmNBczJmQmcxOXpheHcvczVidWhwUW5zV0hIZVRxdmgzMnZIRGxxajRa?=
 =?utf-8?B?UUlHTU9KdTMvM3RScmZYNXNSdGFwZXJjYWVhekhEUzBkOTQxTVhRY2QzODc0?=
 =?utf-8?B?Mjl6M1BQNzY2RnowZ3pCYmF0OEo5Q2tQaWkwRUtOMDRGYTJqMk9HQm5jMm5m?=
 =?utf-8?B?NSs4SEdSWUNERVlrYUNCOVVqYVllVEw1K3dWS1Q3R2ZIdHhvSzJCNHp1WStr?=
 =?utf-8?B?eXFRNHd3dnA3YUVISHdEVk1RWVBlR1NjOG5WMFRlUjZ1c3dtck5iUlU1bDBV?=
 =?utf-8?B?MGR5UHFiQVJ2VUh6cG9MMXEzVXV3V1l0cjE3S3NtTk1VOENqZ1l2WERJN0dZ?=
 =?utf-8?B?Nm1sdHVSZGRRU1lzYSt6WUwwVVhONmRaVmdQT3kzbjJyTERicE9NcXB0REtZ?=
 =?utf-8?B?UCsvcGdEWFZXdjZDUll4S1RoNjcyaVBJWjNvdDg2eFRCc2ZTZ0hXeWJvSE14?=
 =?utf-8?B?eFBkMHVXUVVHQkxabDhLa3lxeVZNaHVZc1ZlS3RsQ2U2aVE5eHdoSVloY2gr?=
 =?utf-8?B?UW52dXVFcm1ZMVhYWUNQMFNReFJMY0c5SEZMeG5LdSt5ZEdsVGJGSlF4c3Az?=
 =?utf-8?B?ZmlWRXNGVkRiL3dYNXFlbTIvU0tPZnZGK2NoTFg3TjNRWmNyQ0hqWHRkaGRG?=
 =?utf-8?B?R2UwellaSXVpZVI1TWNMRjg2WnVrWXBmczlBVVg3bzhvMFVuZm5KMjBGeGhk?=
 =?utf-8?B?clE2aDZsMDhWNkVHaDIyczcrelJsZDJyRXBENVdDZmt3M2RVRUpIaU9wQkJp?=
 =?utf-8?B?Ri81cTNLVCtPbEI0VTVqTVpQUDZYd0lNQVgyL25WUjhTeHk3U29wOVdNbEs1?=
 =?utf-8?B?eU5oUEExV1pCSmZTR0xwVjZxdnV6Zm8xWStxaHdTWVNzRjRhNWFtTlRvcjJw?=
 =?utf-8?B?YnY0T0YzYzhOeGliSGtlaUVEbUhLdEFwa0ZJMXh3S0dJN3I5b0E0SExGVmJH?=
 =?utf-8?B?dzR0OVJZcnpod0wzMklGSXduYXZ2SDh4TFpBdXgxUEJ0Wm9RWEVKeDNMK0lQ?=
 =?utf-8?B?OHU5bVZDSWg4VnVOLzg5L291enMyMDYyYU0va1FXYjJHb2Z2cTNLaWhqSmh0?=
 =?utf-8?B?RFlLYUhadW5Ba21zWnNKaDloR0lrVWZ2Tk1NWVh5YStOL2pxcHYxdHlhVjBz?=
 =?utf-8?B?SlR0RVNFTlFrdHprTmNGNUlsRTlpNDlCY3FObU0ybnpEWlFkMGRxUTFmcUhx?=
 =?utf-8?B?c282SmkyK1ViMlZvVlNSODNvSm1oY2NXOFRUbEhHSFovSTVRZ0p0ZVNNaldn?=
 =?utf-8?B?RWx3Y2hXdkwvNzV4NmliQlhqdjhacVlMNXE1NUM3TDJYRGZTUDB1Njg5ZVhU?=
 =?utf-8?B?dnV6dHdxQmg0V29pVFhyTGJLL2x4dVZ2MEtWWEtwbUFlUW5LZ3dXdDViMU9V?=
 =?utf-8?B?WkExTThqRGVtdkRQcCtSaUkyUzFDc3N0REJtSnFoNDg3VFhrSkZRSWkyQ3Jp?=
 =?utf-8?B?a3U0dTVjL2piSUZ4anRHMFkvWHVJRHAwL0VqSjFwc1NnZUFkaWNmQzAvU2lD?=
 =?utf-8?B?RHVmMk5lYXduWEc0WmhRalNNZS9YcVpyZFNnVHJTZUhMUzRjVGxMcUZZYWxV?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/HYUyUQ3wUQIoeK1OScXzgQg+iVKi7NaqveuuaFl33Vpo6uI9B8E3bWXgJmeoc4RPTDzlKSy8TfwHcsRoqVJlGrlkVdm5nFuQ4kIXP02Q6iCJXp0OiKIVA0TPbfjvuPxBYnuljX2xUq1xInDoKShLfmnrstszpPTXcwR+3Nk/A27WKhK7EkFofmf0ol8C32o30wt9NKcSPp+uJnF2QgBYwa+sHZVoxogyS3eI+WH4z/9H4DMQ7ybewu3HFCkvtnv5WphT5n6YrBVATiJ7TBE7uoO/jxCqFRHAwR9CNEyB0TI9SNKSO/bQ8I1K2M43hPXZCii008W3o0EzRklPi1VYx34RwcmRnWbT0obGsTBHfzX9jTM280m/Qd8CjxScrKJnlK4tAyuP7eyLLhu4XCQ0EzcwTPdNjGnJ/CZqyL01HaEgA/9vDJMu+puXNkii5seo9+7n8hOnNbNlSMaDAxmDI1U14tXEh5KuMWBOgQ9uLDca1oV1lVjOqwFCKcGStK0cfq0nGSZMkz5YsPpGzY5YVIbZApy5uRaNzPK5E4MEvxVxL+bbhbGvDyMqhafK+IFYO8GANq4uer3N1mMIYexG3OmOJFH2GnfmFSP/Qgz9m+7/GVctpFkvsM6Q5wWtS571ptiYLTwQT5Ne0SIscuYiea7ZRyR0TMnD+4Z6Oab+lYbNQx9H322MrE1o8eCgR3GqoFaQOE0bz4sTByxe3qE6Xd4VaPEmn4Gsm1kl+QgSLKf6idlaz0Q99eY4WN3a487EokxdxN3Znqw2BWDnldAER1BzCO8VjQqcFo9cQXw/m8nHVyyjCp7RbAiPQIeeaKb
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efd76ccc-54a8-42e4-18aa-08db56443228
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 19:31:50.6613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ooAvVmsJCeWVFBSJPIcSEtCjdd8VowQwkKVWj4f4y/lIK2x3PpaS1Hy35Jwa19Hnvil8oYo6RI0H4Fs80/eYXE9oqvOg8qAvGS5xGG69xNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4921

On 16/05/2023 3:53 pm, Jan Beulich wrote:
> On 16.05.2023 16:16, Andrew Cooper wrote:
>> On 16/05/2023 3:06 pm, Jan Beulich wrote:
>>> On 16.05.2023 15:51, Andrew Cooper wrote:
>>>> On 16/05/2023 2:06 pm, Jan Beulich wrote:
>>>>> On 15.05.2023 16:42, Andrew Cooper wrote:
>>>>> Further is even just non-default exposure of all the various bits okay
>>>>> to other than Dom0? IOW is there indeed no further adjustment necessary
>>>>> to guest_rdmsr()?
>>> With your reply further down also sufficiently clarifying things for
>>> me (in particular pointing the one oversight of mine), the question
>>> above is the sole part remaining before I'd be okay giving my R-b here.
>> Oh sorry.  Yes, it is sufficient.  Because VMs (other than dom0) don't
>> get the ARCH_CAPS CPUID bit, reads of MSR_ARCH_CAPS will #GP.
>>
>> Right now, you can set cpuid = "host:arch-caps" in an xl.cfg file.  If
>> you do this, you get to keep both pieces, as you'll end up advertising
>> the MSR but with a value of 0 because of the note in patch 4.  libxl
>> still only understand the xend CPUID format and can't express any MSR
>> data at all.
> Hmm, so the CPUID bit being max only results in all the ARCH_CAPS bits
> getting turned off in the default policy. That is, to enable anything
> you need to not only enable the CPUID bit, but also the ARCH_CAPS bits
> you want enabled (with no presents means to do so).

Correct.

> I guess that's no
> different from other max-only features with dependents, but I wonder
> whether that's good behavior.

It's not really something you get a choice over.

Default is always less than max, so however you choose to express these
concepts, when you're opting-in you're always having to put information
back in which was previously stripped out.

> Wouldn't it make more sense for the
> individual bits' exposure qualifiers to become meaningful one to
> qualifying feature is enabled? I.e. here this would then mean that
> some ARCH_CAPS bits may become available, while others may require
> explicit turning on (assuming they weren't all 'A').

I'm afraid I don't follow.  You could make some bits of MSR_ARCH_CAPS
itself 'a' vs 'A', and that would have the expected effect (for any VM
where arch_caps was visible).

The thing which is 99% of the complexity with MSR_ARCH_CAPS is getting
RSBA/RRSBA right.  The moment we advertise MSR_ARCH_CAPS to guests,
RSBA/RRSBA must be set appropriately for migrate or we're creating a
security vulnerability in the guest.

If you're wondering about the block disable, that's because MSRs and
CPUID are different.  With CPUID, we have
x86_cpu_policy_clear_out_of_range_leaves() which uses the various
max_leaf.  e.g. a feat.max_leaf=0 is what causes all of subleaf 1 and 2
to be zeroed in a policy.


> But irrespective of that (which is kind of orthogonal) my question was
> rather with already considering the point in time when the CPUID bit
> would become 'A'. IOW I was wondering whether at that point having all
> the individual bits be 'A' is actually going to be correct.

I've chosen all 'A' for these bits because that is what I expect to be
correct in due course.  They're all the simple "you're not vulnerable to
$X" bits, plus eIBRS which in practice is just a qualifying statement on
IBRS (already fully supported in guests).

The rest of MSR_ARCH_CAPS is pretty much a dumping ground for all of the
controls we can't give to guests under any circumstance.  (FB_CLEAR_CTRL
might be an exception - allegedly we might want to give it to guests
which have passthrough and trust their userspace, but I'm unconvinced of
this argument and going to insist on concrete numbers from anyone
wanting to try and implement this usecase.)

But there certainly could be a feature in there in the future where we
leave it at 'a' for a while...  It's just feature bitmap data in a
non-CPUID form factor.

~Andrew

