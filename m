Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D37787D5121
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 15:12:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621943.968910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvHCk-0003lo-VC; Tue, 24 Oct 2023 13:12:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621943.968910; Tue, 24 Oct 2023 13:12:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvHCk-0003k8-SR; Tue, 24 Oct 2023 13:12:18 +0000
Received: by outflank-mailman (input) for mailman id 621943;
 Tue, 24 Oct 2023 13:12:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JtWs=GG=citrix.com=prvs=654e64a5b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qvHCj-0003ga-DV
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 13:12:17 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f192a6f9-726e-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 15:12:14 +0200 (CEST)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2023 09:12:06 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6526.namprd03.prod.outlook.com (2603:10b6:510:b6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Tue, 24 Oct
 2023 13:12:02 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 13:12:02 +0000
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
X-Inumbo-ID: f192a6f9-726e-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698153134;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=cyy9HceQ8ZD/gvFKkRpJ3J7rKRpQ7pOzO3S+231ADYY=;
  b=FHGQvSfpkgr5R3xvInMOL0G9QKUDC5o83YePjZ5R1W1NZZuB6kv6phFY
   dqdBDCwdE2wcvXH2hgWN1BXkzy3BrQXWEHIRGYLAz+4qquuYlMneijz57
   K39HAACHZdYKNyDOXmNd/14kSIGwE5jY9oQUO/JEGbwU5aA+rTegcvSLC
   M=;
X-CSE-ConnectionGUID: BOPujnbHQASbuTJ/i5t0xw==
X-CSE-MsgGUID: bD6iHXFlSFGkYguuZ4j4iQ==
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 129266431
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:mzxwV6u4JJsJcGd0VxCSeiGPCufnVHBfMUV32f8akzHdYApBsoF/q
 tZmKWqDM/feYDHxc9x3Odu/ox5UvZCEmt5mS1Bpryg9FyIb+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq41v0gnRkPaoQ5QeEyyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwAhc1cxKFjcKP6YmxV9VOwcV+MJH7I9ZK0p1g5Wmx4fcOZ7nmGvyPyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osj/60bou9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAtNISuPkracCbFu7zEBNCT0me1+Aj9a6u0GjRuADK
 RAVw397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L8/AKxFmUCCDlbZ7QOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRVLufgcBRAoBptXm/oc6i0uWSs45SfDkyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CChRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:LpBY7aA7FSHq4enlHela55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZImPHrP4gr5N0tOpTntAse9qDbnhPxICOoqTNCftWvdyQiVxehZhOOP/9SjIVyaygc078
 xdmsNFebnN5DZB7PoT4GODYqkdKNvsytHXuQ8JpU0dPD2DaMtbnndE4h7wKDwOeOHfb6BJaa
 Z14KB81kKdUEVSVOuXLF8fUdPOotXa/aiWHSLvV3YcmXKzZSrD0s+BLySl
X-Talos-CUID: 9a23:D1z61GzawPtsz/4fqVP9BgU+Pfg4cHvX7E75GEWlNUQuSeCJEU+PrfY=
X-Talos-MUID: 9a23:BYYUxwX1hPlrbM3q/DXA2jBCBOls2IqBC3ECjIg058vYNBUlbg==
X-IronPort-AV: E=Sophos;i="6.03,247,1694750400"; 
   d="scan'208";a="129266431"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VjXXslDTGGofjR3mzdoclNkeyi5ADWV9AfzYPOmxp0o98metT2M0f81Fvxq+KqH2w/Olpg1K9bAXlbBpq8Lxi1sKq03VEVffw1LGZ8s7PNYJMYjt+lCPdANIr+OJ0jZLgVK4BfGBpogU7P1o6fJgFvcxnImxsThTz4pLIk2+QHmxNoFp151OOxal9NL5OauUznWyvPLDVB8ABNu5mQFwKrSQluERst6BE1oaasZq2Y/BGngtQuZqebxpvqabMu7ZeacPacK+ilV2RYb8aCLdVmUnBlP5Cu3u4D1zE3tNsgW/2C7X9SP6nVfJyduTLenzg+CsR/1QGz7bVjBAMUs/QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=saZVC/6Vw8v4dE76WXhpe7fw/ov4sSCfoCLR6/1spmM=;
 b=WzCF/p0QZl4yUFg4oGQigCJ5zs71/mvnh5SafLIRdel6wIm14tWX6K7pCf1Z/dezyMJmZvIYOBpTC6gyUlexCRmNvBv5htI0zu9e/pmd8wGtJRk5ppPuSGDo6Tp6hD/1P4mm1BySwMLdpiMGcYM/sDpc+Lwom8xVg0oIxWSujtk6P4SOvLnaLwg93IH+r0oGaZdBNrdBVWpXlqi36GC82QJ/pu2GO+mXFjISoNcOGED1ynNPP07jYukUX/FsBb12hvqyFTsRjCaEODqPwbVXrvR6Bn4rXP45amkRAo/hXpWDqMifCW8tyRzJL7NBLIqn6mZEm5R4W729Xb1yB3/7xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=saZVC/6Vw8v4dE76WXhpe7fw/ov4sSCfoCLR6/1spmM=;
 b=WRG1UtvHTEPxVrPwm8dOm8uOH70Z/Pj1wRlo3ZbLdvF2sythuFL9osSuie9qxmCKSn0MSjY8lOSzHT4DZb/41zxN0t1YskaMWIB8cITI/i8CtUL05DjYJXFiogQWYEt5T59vorL8E0nhCYPEehk3soGpDfSvruiaI8NFrzd8jQ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 24 Oct 2023 15:11:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/i8259: do not assume interrupts always target CPU0
Message-ID: <ZTfCnbkvyO39GXS5@macbook>
References: <20231023124635.44266-1-roger.pau@citrix.com>
 <a525cc49-69e7-c509-61d4-a2456b3fdbcc@suse.com>
 <ZTeY6JNbNfTVCpib@macbook>
 <2c5a5b6f-5c67-e46c-765c-81999ac1e11b@suse.com>
 <ZTesLTIulycE1s5d@macbook>
 <c11b0ace-f2b7-8d59-0112-fed6a5de0d03@suse.com>
 <36e76621-01ac-d5a1-9359-30544bb916ef@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36e76621-01ac-d5a1-9359-30544bb916ef@suse.com>
X-ClientProxiedBy: LNXP265CA0044.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::32) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6526:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c544d5-e3e8-4245-8cf7-08dbd492cfaa
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E1rEsjezREuS9RS+Wn8j+nyEDW+Cx9vANEjvhDI5VuxodYcj/3crI0ACOZexrYn4Ozy0ly/HU2LZy1KI0C7YP1BShiQwDqOhbmsK8xlOi6AuAqb3jM2YuZPF/Ez2WY3wuQvwybnh7zSLJoulgmtmIJqYcG4YqtgH+HOvLJ1Bd56pYDmEyVQQFAIyoZKS29/eabt+qUHqP/W5Q5wVVBVymCmIc2wdEbBG0YHldVCtkeg05YgomWjm3A2I2rxSY1ogBm19bJqre96Z95/okF1wWsGXvOeFNKYjF5httE8bmTEOBzc4sI4YYcGU6Sb9YgetVs8FXc0076CJqDjibvIRjz+Z85RPFcAIZBx1IoV53aovmK5T0+WIxe99RmDYvb8Pg62TfACLH4AFFl7d/TKHC8hgK9HLRsXmgBcsFsv7D9tbEUUgt2FPRIgA7nOinfG4PoIS4e8uCiCbIqgrslDmPLCVxV2WT2OImxaHUZV9OTFQVhdGAyQGHyYdtcAHvOsO/UGk12qgh+7CXPpLNFuZqX32JyN0IzKeO+t94LlHVQE93KbOvEMN9y9ttQ0NE3MW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(346002)(376002)(366004)(39860400002)(136003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(4326008)(8936002)(8676002)(41300700001)(2906002)(5660300002)(33716001)(66899024)(83380400001)(53546011)(6512007)(6666004)(9686003)(6506007)(86362001)(38100700002)(85182001)(82960400001)(26005)(6486002)(478600001)(66556008)(316002)(54906003)(66946007)(6916009)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVZRNjFLbzg2YTBndnBYZmgyZVArNEpZYlJ4V2t6WFZ4eCtKRmRCQjZDVUJz?=
 =?utf-8?B?YnhWeVdpYWt1OHdDUTF5U3N0R3hhdndZS0VlZ2MvU0JjeExiUkFsL25wTERB?=
 =?utf-8?B?ODVWSWdjTUFMSG5zRFZlNHoxaEZ1M1c0NVJ6NFV4a04xQ1phM1NyNlR1ZklZ?=
 =?utf-8?B?NnhoUi9ZLzZXRTg2SWZ0bU9nOExodS95MW5VREhsK05ka2ZHL1VQTjdNNHJw?=
 =?utf-8?B?aFhiTE9zVmpoRW5QSzBLR3RLVUpzVUNtN2VrekZERGk5VVZoeHNXRkJrcG4z?=
 =?utf-8?B?YVhxcFJoUm5PZDVpVWQ4ZEFLalorWXRrUzJLSE1DVk81aHBHM1N4QkJUa1dv?=
 =?utf-8?B?UEM2eUtFQjJ6NFk0SlhkVXdFN204VEV1bjZqUUVtZGRtcU5WdTIyVVZteEl2?=
 =?utf-8?B?RlRUMVp0QmkxNGdvbVcxOFdaYlhMVG1FY2thMWdOL1FSSUIyVW1GbFVnNzlu?=
 =?utf-8?B?VzN0ZHNjTmVlSEhxMmNBa0lwZmltamxUN0lSSmp4NjllTTJZN0lwdDNPam9S?=
 =?utf-8?B?NC9HeEZtNCtXVU5ZV1lGSTl3R28ybGx2dCtzd2hWRzR5bEtLdlYvUHZOOGhm?=
 =?utf-8?B?MmRBREMwZXczWFgwVEg5MndFYmJiK2xkVXQvdUx5S21xZExZcDFqd3RWOHRE?=
 =?utf-8?B?bFVTZzdNWE1POFJOeFh4WjV2SFp0Z24rL1UrZzdPcmZnZStrL3lXTXRReThn?=
 =?utf-8?B?amxqMXgyZm1OSndpdm53SjFsbTVqSEVkK3BjT2g2bzdpenBkeXV6OHJIQVAy?=
 =?utf-8?B?OTUzWVN5TWRNNnJDbEhyT3ZWSU5hczJVY0lGWHRORkNLRjJQWFBUbk1JeFVK?=
 =?utf-8?B?RGIzUndrSUxEcFl6Y3ZwNk5BRWZaSWUyYUJOY24vRzBqcjFpdDlvMFA5M3Vn?=
 =?utf-8?B?eXRQeTFIaGhFeVpYemkwL1NVQlJQYnd2SXVGSXhXSVVhMDU0TjJBbHphNEdG?=
 =?utf-8?B?eG5wWmNBTDNrUHpvOCszaUFkWGY2c25pVy9RcHQraXVUZnpubisyWm4vc1NM?=
 =?utf-8?B?UVowdzdYS2llUm05S0JaQTVXWDkzaG9EVEJheEYvcE9HNzJ6dCtacVBVWTYw?=
 =?utf-8?B?WEtpRXo3YmJDa1dnNDE3NnRhalQ2YW94VUUwa0RzbHdLelZNSWlrdi8yTkNi?=
 =?utf-8?B?QmNUVFR1OGpQL2NMZkxjU2dYcEtyR1dna2RxeEFtMGlvdVJud3htUDZjV3Rl?=
 =?utf-8?B?TGFCeStyM3VTYVJ5SnhOYkh6dzlIc29UM1RoV0F3cmtLbE0vYXZrSHEwTlZH?=
 =?utf-8?B?alFqaTFqS2RsNlkvUjI2M0d3QzgvYnZkcWQvdHppbEtQV1hJTGZGWVJxOGFV?=
 =?utf-8?B?dXRJeGllcjBUREF5M2ZMYjd6emY3YXppWFBOamwwdmpXa1FwSTlPb2VFNHJl?=
 =?utf-8?B?Y3RBWmV5eU1NMjVvdmFDVG1hUG52M09DeEMwOWptTkxlZ2pIVCs3a2swcU5z?=
 =?utf-8?B?WEdhQ0hyeFpKbHFLUEdodUZpazZrWjM0L2dmUDNSME9Vakhic2RRdFpMb3Ba?=
 =?utf-8?B?dDBSaXk5dVBLMHJvWEM1MnJ3UHVrNW5SVFYxMzNYbmk1dWJaUlZWM3hOb1JY?=
 =?utf-8?B?dnQ0KzVPblBaZVR6VzFLYmtRMlAwSFA3MDdwTk91dXd1ZGQ0WnpucHVhcXNp?=
 =?utf-8?B?a3pyNXhIWFBtVWE3OEEycmtkS1BkZWVNWlgvYnhIY0JpOTh3SklCMXZIMTF4?=
 =?utf-8?B?RlNTU2x1RmhweThFTVFUUzBzY0tVUmhSTVJ1Uk5sbk5GQkN1enpvV05MTkgz?=
 =?utf-8?B?MGxMQmgwRGVvUzl1ZWxaN0ExR2hpekdSYXh2S3pHYXo1dTFpenAzUXUzdFNN?=
 =?utf-8?B?TGhZRE5MSUg1ampLbDNCQks1cHNkeFVROUtxM1dpQktnUGdEeTYwck0wMGhZ?=
 =?utf-8?B?c3dwcXJtRWN1OEo5aEZldkNBRkZnNWlEVitsaFJNRjRCdXowZ2loVVk4ampr?=
 =?utf-8?B?N0Y2UGhWTHVvZ2xiaW40V3ArbHNKVXRub0hJK3gybVZwZURFcVhXOE1yL3lG?=
 =?utf-8?B?OW51VW4vU0JOcEgra1FQcmRpOFFJdXBGamFya0pQN2M3UEtvNE9iMkZtSTZr?=
 =?utf-8?B?RG5hZ3FkbnUzR2VIeVBJVGZNTjkreU8xNkFEeG9uQmdjRjJScnB6VGlTZjd5?=
 =?utf-8?Q?KfKTrZd9JIJ9CewUWBauAwsBy?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ur04v42DCZ4Rc+lG7hcuoS45cvW1jr+NWcb3sXfaGrH7YixadRsXEO3CYzvk0dpS3BezBPpSW7Vqxu4kw66eGSJ9eXBE77Xf3BATzvwaw7kUtzUzF1FmY+aMNQdeptTIzeo1bcB4m0keflYSxA5iTRGjoDscO0SGPKmQZ7LJwNDMk27usQTrs9Pn8D9Bhex5GXRuY1+HZCiXOPIkNTslHhV0RqsKW1rnQDvwwAF/wj1nPnAQTegK3F7CAWIy53taAdM/h6I3u82z1l4z9yLxF76WkzHMz+kz92R6walTA6uQvW77FOer4Fw3v4IqtNh5Qfz91Zis0qjp1UkEnjaVFuxqAte5h4gC28TGHAqlJPfc5NyUAnorYAzVSZqtdHlmmYwC4XSKTHv7Irb3zdKKd/LeEBJWoaU9A0tR0GgniJFit8t5WpSXniT91TYX1pmZwU1QM1kVSiaphZFfxR5n965nkEomUGX8D1SkouhD1W/WSqvhXbwCe1AuyoFP4hHpQnAu6fVhPkNw069XYERz1UL3WWStAwU8+opTuONonnSdJundZqce79ZwXC9iylbODGr94tAwBiEll9jesbVloevcuv1o4vfGom+rv54TQVtHhAi2+h9Jj8ZZQ6TRqTWy2kI3Ns+ZY3Fn6KAUmJvoD+VXTNSqLkSKEtQOkzGf0T7XO3E8PQjAzc7udA8P6cPTxg2oTjhkXz2p37AExtqAltpukWJnLBCF8Oc52xatneorRE71mLK2soPd3ChMAuPLF7UeDNH+tBE1BP3UejxwOl4hsXDktG0uyrA7pSBLwp4Pg1qQQXxnqUeGzbWU4vrRcXv/AciwmJIRO6hPVeme4g==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c544d5-e3e8-4245-8cf7-08dbd492cfaa
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 13:12:02.0801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cUWiJwl1IKK6C9PVwpiU0UvDb9lb9qMjgJ4OH0aCqOe263057JnEwD6Wh+Ztqc22W8TmZd7wejlSBhohiVAnEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6526

On Tue, Oct 24, 2023 at 02:08:42PM +0200, Jan Beulich wrote:
> On 24.10.2023 14:06, Jan Beulich wrote:
> > On 24.10.2023 13:36, Roger Pau Monné wrote:
> >> What is your reasoning for wanting the smp_processor_id() check in
> >> the caller rather than bogus_8259A_irq()?  It does seem fine to me to
> >> do such check in bogus_8259A_irq(), as whether the IRQ is bogus also
> >> depends on whether it fired on the BSP or any of the APs.
> > 
> > bogus_8259A_irq() shouldn't be concerned about the CPU it runs on; it
> > should solely deal with 8259A aspects.
> 
> Or to put it differently: The function is supposed to tell whether an
> IRQ is bogus from the pov of the PIC. The caller decides under what
> conditions to actually invoke this checking.

I understand that the PIC itself is agnostic as to which the CPU the
irq (vector) has been injected, but the added CPU vendor checks are
there to deal with possibly a bogus PIC implementation, and hence
doesn't feel that off place IMO.

Anyway, will adjust as requested, albeit I think it hampers
readability and that's more valuable than whether the check is
contextually better fit in do_IRQ() or bogus_8259A_irq().

Thanks, Roger.

