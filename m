Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 896BB6F419C
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 12:29:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528461.821638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnFx-0007gT-J2; Tue, 02 May 2023 10:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528461.821638; Tue, 02 May 2023 10:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnFx-0007do-Fn; Tue, 02 May 2023 10:29:13 +0000
Received: by outflank-mailman (input) for mailman id 528461;
 Tue, 02 May 2023 10:29:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OyLC=AX=citrix.com=prvs=47975177b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ptnFv-0007Hj-DG
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 10:29:11 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b7768d7-e8d4-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 12:29:09 +0200 (CEST)
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 06:29:06 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA0PR03MB5530.namprd03.prod.outlook.com (2603:10b6:806:b0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 10:29:04 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%3]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 10:29:04 +0000
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
X-Inumbo-ID: 2b7768d7-e8d4-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683023349;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8fmYAgrEMm4z+FHSmfluJMGF/rFQW2JxGHZQEALI2hg=;
  b=TdIWjUBCna7B1s+3QV4maPQZQEA5HvBxanqufrT34dbWavHVwoDMZwCn
   C0KfIXttbKTJiHX3bVP1+OYP+cGMW95i5VGSEYLfwc5sN5e8qqWalLIjm
   n8u6FfmodbFZhpuigTCkLKap0dFSQtKYfcK0FaewysY2pxzURGlrY3Dsv
   I=;
X-IronPort-RemoteIP: 104.47.56.177
X-IronPort-MID: 107442572
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ale0mqsSZ4l6+kTeBhpRhgUl7OfnVHBfMUV32f8akzHdYApBsoF/q
 tZmKWjUO/6CZjD0c4glPY638UwGu8eHn95jGlY6+31jEypB+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AKGzSFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwOhUIfwCEpuSNx+jjTOB3lvUOBcayFdZK0p1g5Wmx4fcOZ7nmGvyPzvgBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjv60b4W9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAN1OSOflqaQCbFu7ynAwNgE6VWuCivTnrVXuQv1uL
 0YP0397xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnM08SCEu1
 1SJt8j0HjEpu7qQIVqC8p+EoDX0PjIaRVLufgcBRAoBptLk+Yc6i0uWSs45SfHqyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CChRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:Jf1pnqn68euzSUMd4jJGcpYeqnXpDfIr3DAbv31ZSRFFG/Fw8P
 rCoB1773PJYVMqMk3I9erwW5Voa0msk6KdmLNhWotKPzOGhILLFu9fBOLZqlXd8kvFh4pgPM
 xbAs1D4bPLYmSS3fyQ3OTwKadD/DDCysCVuds=
X-Talos-CUID: 9a23:mavgv24NbRUrpm7lttss5msRC9AiU3vmyy2IJUajGVdEYbLMYArF
X-Talos-MUID: 9a23:q8v03Qlu5JV3EUPmpQszdnpuKORW/4iuOHkmnMshoJmdGh10MSy02WE=
X-IronPort-AV: E=Sophos;i="5.99,244,1677560400"; 
   d="scan'208";a="107442572"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ci5HwaCdi1MYSVaArKKLV6hxicU4oOU3bf5K2x9/uyi6sTdaezodSiLEDOSnEEO8CREiCC+YLS2pjViJ8eMYTXzIAY5NO2dA7voqKuP718MIbJzf1pdW3tNx2Al8cf9vKNAyeHuONjaNUPDLzj8xSUB7Vpz8kGZCMGxyV/w/yOdWpjL2+oFCDtwuU4gDtCpfIUaIZ04urAoGdrESQ9LLK/LKGC37b7G8+xA3ljIKKCPLqbYu4JG6IN42K1fly1KfeUDKKWnUDTmSwNxdDK7SPiWFbF3hPmtqxdcEC1acA1X3r3+WsvEs/ipwzkV7bwCkQ7QEJEbuKB7v762sc4Iq/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZZalwAl4VL+hS2tkqb5oYm/g4u5h2Oc8shmcdV5Itc=;
 b=ksSQXNChNb5EjG80RlLdeX4kewkaYWefWOof/CGBXUwnAlRiwLpxnsWsYr/HgpnmfxJeocbUoJMl3I5Cih45MKTg+KMMgelaGMZZjq0x5zPgBJzCLQpF2j5WbILfjkG6FFqmslGfyz+Da12077lJmGHbjuKdsEZT2LLsIBZu1VRib7yj6lsiK4GT2KF3c1GHUAREdLTmll05u4T7mqvO5oAjQY0u3WgB+UtrmoKrWb61gvt9jCFY8QzgFmUIpAkQK0Qi/rPBfx5WXSPAYPb2J1QrQzWW2lJXV5siIWs87bhqgDyCUdyF1/mudwHJ3tgGpmJWXPHfOL2QlSOcMwofcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZZalwAl4VL+hS2tkqb5oYm/g4u5h2Oc8shmcdV5Itc=;
 b=umlBnlMJ3Tq6wJXVJcrzAblP7y7JGH0Y1WcL+89fL53RstrMGgPXcIg6ZJA6Z8PGcT0rUcSLIONtlUOGQh78onp4msG/yy7i7AUIVfQbSE6Gk3+mG6NfXxJfhjf8WNzG+wONlDnk4WgWwpVXoaHeXNpjYsshd1K8oTr/LJyEcu0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 2 May 2023 12:28:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86/head: check base address alignment
Message-ID: <ZFDl6rSYRzNEoVX6@Air-de-Roger>
References: <20230502092224.52265-1-roger.pau@citrix.com>
 <20230502092224.52265-2-roger.pau@citrix.com>
 <89389465-f32c-7dfe-f62b-b957e2543cb8@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89389465-f32c-7dfe-f62b-b957e2543cb8@citrix.com>
X-ClientProxiedBy: LO2P265CA0259.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::31) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA0PR03MB5530:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c802f13-7004-4efc-e13b-08db4af80da4
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BhsQKmzbsBf3y0qroIA8DKBLJSVH7hn2THFLpZiypSSZIdn49PYWoinukvRuUCORzBPBC0LBSfgkjwLA+C8ESrW+fPDzRcET6Zx9pCPH4dOBW3qiSjulGT0PYLSHH5IPpR6brnjXlSFvfPOVprlLGShLp/vjeBLt7ytVtfJTjziQ6JDovnJgu8w3DbAw33tMbdNSRNEqKHgoq3CTZuxFDOD/WwTsrsFPNb9PmiQzC8XSyitZXH43sAWHmMcR4jRYdGLKBPt+ecCMhyahwQ8p9yu9PcSJvsP9acTYHyRAioT/Ntrb8Lh3pr6Nt9DuQXZSTimfP08X+2867a+xr++7vbbCffj03nnYuttG/on8ZnKVaSYzki7h4jVGlF1vOJWUcuiDZe6GSuAIx3mrkAEB+wTKjNd/3JZSPWpsfFePp3vDpEx9e/2jHUZ9z0X6wI0cgkwB4ZY50b0I4KMosSmTi7KyqVeN4ZlLfmSk4aOnDsgVqKiLn6xJljI7aBHLKLiiI4s2tNes4fnpjLE1pd4B7rEzuud28We2wfQcAN2Uh1zGm/3P1naRv9KwJEbpVccE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199021)(85182001)(86362001)(83380400001)(41300700001)(4326008)(5660300002)(66946007)(316002)(2906002)(6862004)(8936002)(8676002)(6636002)(54906003)(38100700002)(82960400001)(478600001)(6666004)(33716001)(186003)(6486002)(66476007)(66556008)(6512007)(9686003)(26005)(53546011)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TS85b0g5MXltQXNLMGJzcENLdTdVRHh6Q205bnMvU0RXV2p6Zkp6MW5TUzBQ?=
 =?utf-8?B?YTNna2UyYldwZWc0dzNtTGVwTlJDOUhwYUo3OU1qWXB0ZjNuVHU0S3hLNXlF?=
 =?utf-8?B?Sk1iOFl6VDlaemFESmxlbkFmdTBQNXNXUWFtY1dDN0F3SCsvVXN1N1ZiUjF2?=
 =?utf-8?B?cmNFdCtlRW9GcW1PQy9iNFBmc1k4WnN5WWcvL2lhM2tVbUZ1cEZjSDAwYk10?=
 =?utf-8?B?cFYza2xaQVI0MWtSanhqd1JkZVVyQ29zd2ZTaDVxbFFDRld2cldpRjR3YWsx?=
 =?utf-8?B?WTJKTTVhSjJMeWRvSk0wb0dQZWkrYkZGYW5zRXRLb0RZSEFWczBlaGFtUFkx?=
 =?utf-8?B?QTNDZjViSXJTSVY3QXNsZU1tclVla3hacTlTQ21Xb2lER3BOMzQ3eHJhUWlF?=
 =?utf-8?B?SXErUXR1bFVkRnJZa1BQTHZGbVNramt1TFE0Z1QzcXhFVzh5WThFL1pOWDZJ?=
 =?utf-8?B?UTJCaUk0RlN5QlB1MHY1TGxtK2NkS21CT2Iwc2hLNmRBUVZuYmJLS2JZNHYr?=
 =?utf-8?B?WGIxYWlhWWc1ejladzZGajJET0VIUUxOR1EzRVhlcnBpbEtRUVJ4OCtlT1pJ?=
 =?utf-8?B?NUJWRFlkUkJ4NVpqVlA1MTBuM01zM25pV0ZlUVlYa1hJZHlsZGlMb2FoZHpS?=
 =?utf-8?B?blhlOTdXUmozVjVVZWhQZDh2ZDZqMHhVKzdZRTZCRjhUVS9UZk1VVXdVK2lU?=
 =?utf-8?B?bFl0SWhBak9KYzh6ZlJ2RWRuVXZLQytIbjlrVmJQdWtXNlQwWFZDcWpuTGJC?=
 =?utf-8?B?eUJuTUJGMkpwUTZTV3l4SWNTUmZrRnc2WjFKZlJQcjBHWDRFVFpWczYycVMr?=
 =?utf-8?B?aW1PTlpueWFEeFN0UG85aGxLNU9iNkIxRkFRWjltKzd2VHFxSjVuV1BaOWZX?=
 =?utf-8?B?eVdYMzNGbnk1eXIvcXFXV0lDZnNiRERMVytsbGpobjMrNzNNVnJMMWxJc3Zq?=
 =?utf-8?B?SUxmektMaUJLRzQwVVIvNWt4VE9CTjlFL0prSDliSlgvWTJrdzl3anA1ZUR2?=
 =?utf-8?B?NU4weGVVUm9nODl1VGhObGhzVXBSa2k4cll1eUd2a09Kc3VmVWFwbnIyZDRq?=
 =?utf-8?B?b1dCTkkyelN0V3A5ZW5NS3hOd0R3WDlDYzZ5ZDlWOSt3anBxcWxQZjZDSlJO?=
 =?utf-8?B?TUtObUhYc3dSU3o4L0NNYWF6THlLa1RKZkU5alBwTzltczU1d1pZLzhNalZy?=
 =?utf-8?B?WFVMd3V0eTZPQUxOWllvV2psQkgwUlYvOVBhQWdKSUhyUjloYklxL1RjQVZP?=
 =?utf-8?B?RWtyL1pvUFNLZmRaWEFOaEk0bnR0cHhac29adWVEMHhhRGRBc210Z0ZKZDZk?=
 =?utf-8?B?TThEQXlML0VSdWZZc0J4RGFIUXJuZVhSQ0ZGSkhWNFBaWnJRWUFoNVJZNjhk?=
 =?utf-8?B?QlpOM2E4eWM0T3dTdGlxcE5QaHNWTkNtc0R3K25OR2VKNWVlVDY5azdyWTh4?=
 =?utf-8?B?Y25YL0NiOVhoUXllNGxFKzJxankzT1ZURjl5STRXYk81SURxZWVMTUZrdlR2?=
 =?utf-8?B?L0hGSUpUNVZIeVZaUXB4aGg2TGRRY21qKzJuNFFMZVdySStRVGpXby9pcHph?=
 =?utf-8?B?aGY4dFo2QzZHUWtoTTB1N3F6b1F3enI0NWpLK1FNNG1RZGltVVpDQ0ZZSDQy?=
 =?utf-8?B?Nkp6blFvNjRhNzk5V1BPY2MrZWcyWGxkUlROYmxPSlRYd2xzcXNsNWQwbFZW?=
 =?utf-8?B?UkVhMkxOZ1hHaFBsRithOXAvdWpJb0EzNTc1K2pTZDRSa3d1NmxNUzRVQVZ6?=
 =?utf-8?B?TlZDd25MMHRzYkVxakNYcmNSTGwxSmt5WGJmRE12QUYxSCtoZVE2OG1LbTRn?=
 =?utf-8?B?YS9qazVta2RSblVwNzRJY1dkS1VEQ21CaWc2elVWRWNkQzRyMkU3aTJ1K01q?=
 =?utf-8?B?STZNTVFvNzNhR1ZsblBsNk9TOFlJZUUwcTdCbW5kbTJjRyswbDZReW1rT0Y4?=
 =?utf-8?B?eWlKZDdjZGVlamV4TDZtVExOdzVSTmtDYUJWSEh6aFViZGV3dTRab1JOUW9n?=
 =?utf-8?B?K2ZzRE9jOGZqREFSNmpITFlLNjFjVUNtdDcvTWZKb0R5Qko3Z2JrTEYyYVRQ?=
 =?utf-8?B?bXRwN0k0WHhodi9wOGM0WmNiUTJ1ZWVmQTdCVVZsMXhsZG1oTzVaODF3bHJs?=
 =?utf-8?B?cTFlRHBnTmxNYmFwSmJkTjFUd1pRbUFMY0FiZkNDZDE1eVZwL2ZaUDRrUm5z?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iozp4iqZpBo3UlqpNqOBZQ6i7wXPwa0kI2n4FoL+/D1iwDu6Om2/li0dqMMEyk41Pga2XlIstHUpQf5XgVcCm8zNxuUlbRS1UTCI8AHQW72q31XGPo6O4n+zAYUzXrFYbE5XEZKzjfgwGHJUwDDl1rbydJV7kwGRPNVb+Duk6kWqWqc0+30sgtDGnSo6NI7SlbtKIw8rD5l5f81NXCDA6AEGqmO90Q4SQBn6xHOB7Sm9nwr9c7IkI/6bza9+CgwwYll7IQV/3FeWOj7TWCZTQ8hLlmA8k6xdPkIjbHamXPTfcbXDhj+VM3EahfIUQBnbdJeka3K45+dKGGeKaqongLjjcckkUIo73hWePZ+7C+NF/orjNEtjRdEt1tmEp+ET1/dELtTOBoZBXgKzFDAFGpXZk7GLUuoA6OXrIJSynjTsAo07mPVt7SbH3BYTd0YnzK2wtLvNnlLM+ICzrJE9U93Rz6NKPUV1ZNNv0QfYWkIdlfwozhzxcYmw2of+iN2FduxLXxO4OQJYu6R3bWnww9Jrj/d7zC3SPSKuqzAv4lVBrMgqPjqMRtZxgagE83mcipk3gUy704ovMTl7/84yLipE6dUo2ldv3+fgwO8oViRQJsFHYQQLeoAe5lPmvt/BhL5oymnizhrl1IID1WtzG9yvls5tkwZZATURE7Vbwufcy57v9vfkCkGe2EMBc5ARH0JgUo+56jpaBZTJYKDz6BcJQHs+Yzm/Gw+AOY3zh/qP4kzd2swGHXazbPRzN5jk8l0xzscOQ6KWAHYpDRSpxdnhpRs8PiekRvqQ4cU7POC6oOBvjcLYlaA/SGFLVkJZ
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c802f13-7004-4efc-e13b-08db4af80da4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 10:29:04.6859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BNoxJP+5MtsGHUbVmMtY0KvvCAw8yKiRrWEP8DlOygN0WJMZEW7T+dcSGpKfQYkMVte4NLP5se7TQROjm+gnvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5530

On Tue, May 02, 2023 at 10:54:55AM +0100, Andrew Cooper wrote:
> On 02/05/2023 10:22 am, Roger Pau Monne wrote:
> > Ensure that the base address is 2M aligned, or else the page table
> > entries created would be corrupt as reserved bits on the PDE end up
> > set.
> >
> > We have found a broken firmware where the loader would end up loading
> > Xen at a non 2M aligned region, and that caused a very difficult to
> > debug triple fault.
> 
> It's probably worth saying that in this case, the OEM has fixed their
> firmware.
> 
> >
> > If the alignment is not as required by the page tables print an error
> > message and stop the boot.
> >
> > The check could be performed earlier, but so far the alignment is
> > required by the page tables, and hence feels more natural that the
> > check lives near to the piece of code that requires it.
> >
> > Note that when booted as an EFI application from the PE entry point
> > the alignment check is already performed by
> > efi_arch_load_addr_check(), and hence there's no need to add another
> > check at the point where page tables get built in
> > efi_arch_memory_setup().
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/boot/head.S | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> > index 0fb7dd3029f2..ff73c1d274c4 100644
> > --- a/xen/arch/x86/boot/head.S
> > +++ b/xen/arch/x86/boot/head.S
> > @@ -121,6 +121,7 @@ multiboot2_header:
> >  .Lbad_ldr_nst: .asciz "ERR: EFI SystemTable is not provided by bootloader!"
> >  .Lbad_ldr_nih: .asciz "ERR: EFI ImageHandle is not provided by bootloader!"
> >  .Lbad_efi_msg: .asciz "ERR: EFI IA-32 platforms are not supported!"
> > +.Lbag_alg_msg: .asciz "ERR: Xen must be loaded at a 2Mb boundary!"
> >  
> >          .section .init.data, "aw", @progbits
> >          .align 4
> > @@ -146,6 +147,9 @@ bad_cpu:
> >  not_multiboot:
> >          add     $sym_offs(.Lbad_ldr_msg),%esi   # Error message
> >          jmp     .Lget_vtb
> > +not_aligned:
> > +        add     $sym_offs(.Lbag_alg_msg),%esi   # Error message
> > +        jmp     .Lget_vtb
> >  .Lmb2_no_st:
> >          /*
> >           * Here we are on EFI platform. vga_text_buffer was zapped earlier
> > @@ -670,6 +674,11 @@ trampoline_setup:
> >          cmp     %edi, %eax
> >          jb      1b
> >  
> > +        /* Check that the image base is aligned. */
> > +        lea     sym_esi(_start), %eax
> > +        and     $(1 << L2_PAGETABLE_SHIFT) - 1, %eax
> > +        jnz     not_aligned
> 
> You just want to check the value in %esi, which is the base of the Xen
> image.  Something like:
> 
> mov %esi, %eax
> and ...
> jnz
> 
> No need to reference the _start label, or use sym_esi().

The reason for using sym_esi(_start) is because that's exactly the
address used when building the PDE, so it's clearer to keep those in
sync IMO.

That's also the reason for doing the check here rather than earlier,
so it's closer to the point where the value is used and not being
aligned would lead to corrupt entries.

Thanks, Roger.

