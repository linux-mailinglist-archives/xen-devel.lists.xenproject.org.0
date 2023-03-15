Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 033CF6BBC7A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 19:41:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510179.787458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcW3t-00034D-CH; Wed, 15 Mar 2023 18:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510179.787458; Wed, 15 Mar 2023 18:41:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcW3t-00032R-8M; Wed, 15 Mar 2023 18:41:21 +0000
Received: by outflank-mailman (input) for mailman id 510179;
 Wed, 15 Mar 2023 18:41:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DN/u=7H=citrix.com=prvs=431ad58dd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pcW3r-00032L-JH
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 18:41:19 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f66218b9-c360-11ed-87f5-c1b5be75604c;
 Wed, 15 Mar 2023 19:41:15 +0100 (CET)
Received: from mail-bn8nam04lp2044.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Mar 2023 14:41:07 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6070.namprd03.prod.outlook.com (2603:10b6:208:312::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Wed, 15 Mar
 2023 18:41:04 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.029; Wed, 15 Mar 2023
 18:41:04 +0000
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
X-Inumbo-ID: f66218b9-c360-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678905675;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=00Rg361BpeiXLQpXPiAiJlP7aID/29YHtKEL+ydg9Tc=;
  b=NLYbycpACAlx+VHg0/BMZO5Lc4ixSd7F/NmkWtFTbdedQtjQcIN9R5j4
   WYMVrwKXfRClIxfefpDF2PASEb75Imk7i/OPIeVdmHhvj9T0+110uKvlb
   wdfnhUwSsKpMk3wSQEoyAps71ZSs/KNepqyDniNQpLXOVZj1PUFBBAad3
   c=;
X-IronPort-RemoteIP: 104.47.74.44
X-IronPort-MID: 100372384
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:cZNPrKsrjZUpzJNmYWvmpPYIsOfnVJxfMUV32f8akzHdYApBsoF/q
 tZmKTjQbP6MY2b3KdAnad7l/U4HvsXWnIVhTwY9pX83FiND+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASHyiFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwNRRVMB7cqsKK7ejmUspymPUFM9LyM9ZK0p1g5Wmx4fcOZ7nmG/mPz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0oujP6xbLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeXgraEw2w3ProAVIBMpC3qCm6aasUOzevB0L
 koJ+RgTqLdnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLmoZSj9MbvQ2uclwQiYlv
 neShM/gDzFrtLyTSFqe+62SoDf0PjIaRUcdYQcUQA1D5MPsyKkjgxSKQtt9HaqditzuBSq20
 z2MtDI5hbgYkYgMzarTwLzcqzelp5yMRAhl4AzSBj6h9lkhONLjYJG041/G6/oGNJyeUlSKo
 HkDnY6Z8fwKCpaO0ieKRY3hAY2U2hpMCxWE6XYHInXr327FF6KLFWyI3AxDGQ==
IronPort-HdrOrdr: A9a23:r3qLzal2nvD9e1vKMlLnkyJLhTbpDfIG3DAbv31ZSRFFG/Fw9v
 re58jzsCWe5Qr5N0tQ4OxoR5PwJk80maQY3WBzB8bbYOCZghrPEGgK1+KLqVPd8kvFl9K1vp
 0OT0ERMr3N5RkRt7ef3CCIV/Ep3dmZ/OSFgu3ZwnthJDsaCJ2IGD0JaHf/LnFL
X-IronPort-AV: E=Sophos;i="5.98,262,1673931600"; 
   d="scan'208";a="100372384"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgUxwsJQ1+6oK4UTh3gdzbiHr2MhkwclTb/x5Ys2eYvvqvg+lZMX5yjMl+36WYivUMZa5YZcCQnCl2Ii5y0MzF8f/JXC9zzhMjFFYKvEyaIijY4q+S566+hg0UOWyDinvoZZuhawnkbM7I5Jq0Gz00MLviz16WQDF/4EWR0pDBb1q9MwDWC55Jf+TAbrmI9xvhCdsIJShUw2dXDiO57nvG8trM63Wfa5660mz8s7JoIqjg7fXg9ZwH5ONqGUHrqaBM4GyuNWIfbGEGrYP4TgcoILmZHd6lC6zEiQQtzknwGPIgrKQFsgTUamCD/N3tLC5l9eTdUHyj1ioJS4YHnffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlixwiDJyXjY137k/WVjRo3z4/rUDmXUeHkqUU+U1f8=;
 b=WO41YRclB+AJQlU6FkeXj4fGjtTqJzsGD7yYrD9cwpFSa/K95+DRS5aQ2/ePM6UK4toWzx/tz2jG5f2NyF7pZozc6lSJBNIHeQ8StuDof+b5V7VrGvnyeUGTYnPoY/3qBjmpLT1iob5Q/emhG2Jvk3t7IZew4G2IgHwtnllu/7RVfAab2J95jBgGAor9VM3oCJQGqJ1EhBUBaLAE7Elis/DdHCvdsnMNa1+JAYZ6ELMSYlizv07lLcHc5fw18rf63+6CPVXWGSWoYot2IKbRIyWxmBFeVBZ84bv3MUfSJ/bhJ1uiGCochC0m7M0seOn42/aRwPNDZ6ra00QcaO6vGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlixwiDJyXjY137k/WVjRo3z4/rUDmXUeHkqUU+U1f8=;
 b=haX76pP8LRQe0mo0OfJin7F5N+kLN8vEnHfyPOz3xCpak0KCAvyke2ahm9dcVkQeZQETaZ11CIFQwha7c747xuhgiH08AD0gvjOdKsUkkpM1jjbcsmBj6/B6G9djYy1zI/uiL5oF5L4RCkcYmOowLubp/LPMC1EDkaioeG4GIsM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <68302943-4d12-ff48-bc60-2c63781f67d9@citrix.com>
Date: Wed, 15 Mar 2023 18:40:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] xen/grants: repurpose command line max options
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230314144553.8248-1-roger.pau@citrix.com>
 <7db90f7f-3344-75bf-120e-2113908adfb4@suse.com>
 <ZBCV4Y6Cz91eypUN@Air-de-Roger>
In-Reply-To: <ZBCV4Y6Cz91eypUN@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0487.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BL1PR03MB6070:EE_
X-MS-Office365-Filtering-Correlation-Id: 36a9446b-af8a-4b4c-9d62-08db2584d4af
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3kvXcA/885xw7xtBDPwMZ1hWz0m1tuCIFZqgMFRshuVD6PFSIcE55YU00G6+locZKJvpyyet1u+hmvjmhPFo7yAKuEgBJykbusA/Z4MtRaAJJm1H86g6QtKXT19z1pO2vJkMZGYJXmzNeBBhoxF0QGKeKieA2F44ckxy6IVAsO8mQQBfFYFaFgbDZ/gDUU7Xhrl9YGK35J6qCk6iJtuoY4EI69D2GNBPEkyKXIRAHQ32fdfPwkK461rjZu0T4yyd2Kv5HyMeYYlfd1IaVZSUBMbciFlMyXf8+3VKdNSrh2oCCZec1ILLMuRTK+OEGcfcAN3oSNrqC8oiynucYyJYBw1VcduMYy3x3tvwG7qfV2hqtp02cG+ZdGskI22iC7feEWOWxwsZhTOyvdP1RbV5HZ0RW+8KkkMKmHViU8pwGFjdbXMcc2zgS71Cdc6gbQ/rLdB+bjJ+wYMohcczF3TlRAj1Cr/Bu0EEYQqp+UHhy6n5RFWSTLeLupAdeUyqDBsPoPosRPqsIyTxuhkFoVqhmoapAgBahpSCg5Bb9ug0MsJkKBGEkKQ2AmjkPDVdSvtF6cEeIj4IptHoQjlKIyrVu2sbyyCxOq1czBUWgSyQsKClPATOC+rKqRzVtdlkWm+4I8OFYSmfgE1ODYTICJW6F+8lcD1sMc6uY/YxdWReZqa+PzBgNVUl4MxaJO3ZJxKxKkvqrTv8mv5bsEs1KAIA/L68miPXc1sngAJ6ePt+wa8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199018)(6486002)(83380400001)(186003)(6666004)(26005)(478600001)(2616005)(31686004)(53546011)(316002)(66476007)(8676002)(66946007)(66556008)(54906003)(110136005)(6512007)(6506007)(4326008)(41300700001)(8936002)(5660300002)(38100700002)(2906002)(82960400001)(36756003)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDczY3Z0SlhONGZpU3U5MG13SGJMdEhLbjRYRlpsbTU1cTNzZkcwZUJjZ0Vj?=
 =?utf-8?B?VENiK09WNndYWU15aEYrZUFvTGVJTTRLc2lKQWZxUmRZMVQ5V0ZFUFBNejRh?=
 =?utf-8?B?Lzh1N3llK0wrRVlKRkVTK3VibFBmQ3RtUDdRdlVFd0RTMjgzUEhOU3NLUzJU?=
 =?utf-8?B?bkZ3MW5jbTdCOG5qQlNVamxxbVZPMjhUV09lb0ZSa3ROdDhUSFZFSlFnZFdD?=
 =?utf-8?B?VmJmYW5QSDNYWXJFWEJUMmdPamxWQ05HZlZwb1BkS3dYVHo1T1N4aWtlelUr?=
 =?utf-8?B?WktBMnNpV3RaRWJkQzlvVUtlTFpGTnZPWGRXWGMvZVZkdDZKM05hVmxYNnVs?=
 =?utf-8?B?UmIxUlpPaENUTVpPOHhUbkFySXdkU2J6NXgvR0NFS1ArSVJIR3FUMFhwT2N0?=
 =?utf-8?B?T1ozaDFFL25nekwwbkdLaUlNbENlME5ONURQUk5YWWswSWlHYzRFNXVkQlQ4?=
 =?utf-8?B?VTBDanh3Z0k2QVVBb2pVUCs0MDB3TzVyVHdzSjRSSXVXM254Y1dlb1lxUEcy?=
 =?utf-8?B?cDFEL2cvKzFCenpFZ2VHU3RKdkFvYjRTeU16alE3YnZZS3lCRll5MG04dC9K?=
 =?utf-8?B?NG5nMUp4SnZadUZ0OEd1azFHWE1UMUxyVDZ0MWM2SHNpWWNxSEplYllvK1BD?=
 =?utf-8?B?K1dwQlFiNmIwazYzL0thaFZ4dEVyTXRqWEFSbC80L1NSTkdONng0dXl4Q0Nq?=
 =?utf-8?B?VzcxNWkzTmV2VEM2NWFmR05HQ2dRdVUyeEE3amFzR3NyTEZ6Rzh4eHBnR25N?=
 =?utf-8?B?TThkcytRaEMwZk1kNW5QRUdoWlYvSFJtbmNZR0ZleXhuMFdENVRRVURuc0JG?=
 =?utf-8?B?UCtnNU43UXVtTUNEeHZNRlJZRUxWSy81SVI0bm5IQ1FTK1hZR3dPbWJ2MVBX?=
 =?utf-8?B?UHlMSmc0V2pTcGt4TEJEZE5WL3BZWndnNEprWjRkUUI4dTdaYVUvUTJweSsx?=
 =?utf-8?B?aVFRaWd2N1FEYy9MWGM2V1pDcVlEMCt1TjVtWEw3bzZSZnhqUkdyNlpZeVgy?=
 =?utf-8?B?cFZBMWhFMHNLVlp4T3RreUlZY1pQcHprUGJSckFYS2RMZXB4dmMwUHBwRDVC?=
 =?utf-8?B?aUYwU2hKZkZ0b3lTdkZxOGNLQ3ZtRThiNFZqMzJIRjlkalc3T3J2NVRqVGtN?=
 =?utf-8?B?c1Y4L1owTHRIUTBJeUlCcHRna1pCbFBzQWsvcWozWnkwS0hCOGwwaGZFYWJH?=
 =?utf-8?B?eVBpZzY2dUEwUHJubnd1ZC9UZ0lrU29aV2h0WC9uL1FCSnRYbUsvTlFtTkR3?=
 =?utf-8?B?MmlSSkJuazZMZXZKSnNQRDJFQlJqbzhHVkFCdlFuTTN1YnJRMWlDWFdRZmNO?=
 =?utf-8?B?R2JHeEF1SWJzQTI2ZlJVZEIyOStZSEY3eDRGSWJaWTdERkVYdnF5K3dBbW12?=
 =?utf-8?B?YXp3a2FJd2ZSbkFBNkRPc1FxK1J1MTBsOE5mN3JWdGlkTzVhRE5iVWFjaWd6?=
 =?utf-8?B?a3U4cTlCWks4c3J2Y2pKQ2dvOUI5VXg4Z0JLL3RjV0hGZnFuNm96bnpTaW5J?=
 =?utf-8?B?ZXNGWU00TnZkNXdMcCtXMkpyY3NveEhReWJ2Mzh2TU42SUFEL2lXUFdXcUVw?=
 =?utf-8?B?d3hjNllCQWpseldLcmE4ckwzQnpRaUpqMTBsdDNyakVMNDd4QzIwSDFMWFBN?=
 =?utf-8?B?YlBQWXk0RkdsdnFQRzkvYWh1OUl0K2toSU9uNy8waXNKOHVzUEpwL1JZbUNR?=
 =?utf-8?B?QWx6VENsZkFwTEMrcDJIb2dxZmtXZ0FMbm5nZVQwNVRURGJQdEpLQmdWSWMy?=
 =?utf-8?B?bTY4N1BqNTNGalJ1VmxtSzE0RGFjWklmeDFFcFlFYXBQRklBMXM2RUxZVHll?=
 =?utf-8?B?bCtNL2ExaHRyNEYzczdPdlV0NlN6MW12TkZObUIzWEJGbThSRC9DRWY0ZzRF?=
 =?utf-8?B?ejJQMFlyMGwwNUZnVFM5MEFjMXdvNGc2NW5iSEJVZlp2cVl1Wk9SUDBKL2NF?=
 =?utf-8?B?Y2RGc3hKNVloTU0wVm80aG5ITW94b2hUVG1XczlNbi9MMnFBZ1NzODYwaTMy?=
 =?utf-8?B?L0o3eEFCdGppNFNWemtNQklwK2xQbVpTRjJrVW9aNmx5QzdTZVFOQ0RBUmpY?=
 =?utf-8?B?MVRNMmZqRjk1MlMydy94RWJSYlU4RjcxZms3SHFvZnU0K3JBYzZUbTZCcHg0?=
 =?utf-8?B?a3ZDRCt2U056d0IxTzZ0ZGhWZTlRZXdOeXpEaU1teG5nbEdwTjA3R0plQ3hH?=
 =?utf-8?B?Rnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IBc/+cHdwsHVZSJSrDpy56f8svsXV0pdn7ZcH/a9mKJfk0SY8LCtYouQca1e6DDBowGj91so1pIDnItvXDnhvOAAl1ZYct9f2yyWZPlu0W28cWY8JYHLbrZ8lvvYMpHWV9verLd0JEdH7/A+nnRkSshP0DmzZ02STvJv9pE3H7OdHbyG8fe1bOLrIm1+H+28qk8+75cOpYO3By84OEJ7lCr11Y1pQlXTZW+iW5LcXOiiOtTAhpWnR8gUxtBI4ghfATH/Q8C0oSmSTX7+bJgXLBH4mEh0aqQPTlMsbNFGJ7dQ2NLPal3/Fv5yn/Al5J4YHyA3kmELxu3jEl+T3TA6gvrm9vIkbdHGT7/P+ggsVOApqE8G4/ntnVni6Lsm830A6j1yCY8k41zmMfHDP/hsgnOOga9mRVfkgbGirx145p3+ICIZs5OMzs+6z9MoLRms2rpe6kADPrJreWSehfU6Th0AcnRNWWiRXjD33Dw4PoSsBhtcb7vUw/PrJ2chqvxSCdQeDHCoDl58rLwPLO92ChRKy+XRVrEP+ctt+kNzMmjchzCxeVVh858LQJDsb2ydjp1DP9yjJWhuwkdXWGXO0kY0f6WF9miMCqqrQLQhmFEGMc4xYLk3vfZf5uXczqvMbL71qpgtPh7WLjAnNTuDCT+9uDuTyu0DMOFOdqpx8llXK1MDcqXVTqKJQKhQmYe12wh9qg0wLyKGunpvvfYzCcT9hRzNQmbjb7HA6kRyzC0JZDR2F68t8U2ghrqS/CbAzUxvmO4wm4Mr8KawD4Tbx6ztzg1gwRi1/L7TeUNsWpZhyQoVSNBuHED5+hTfWShuLWCioWyyBVECa2w+WqVHNEvlWl0hSXboYlPxbojXjAE=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a9446b-af8a-4b4c-9d62-08db2584d4af
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 18:41:04.0840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: stAk0oJp7ITPvi4PC4KooZfLEmKRJ5gdCXQLU7IC4fbkFMwCRjhNhVzR9lMbd0GgZByaexNPMSA7akuxOcm4uKwvw8lJrzEDNK+1FPh/0sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6070

On 14/03/2023 3:42 pm, Roger Pau Monné wrote:
> On Tue, Mar 14, 2023 at 03:59:22PM +0100, Jan Beulich wrote:
>> On 14.03.2023 15:45, Roger Pau Monne wrote:
>>> Slightly change the meaning of the command line
>>> gnttab_max_{maptrack_,}frames: do not use them as upper bounds for the
>>> passed values at domain creation, instead just use them as defaults
>>> in the absence of any provided value.
>>>
>>> It's not very useful for the options to be used both as defaults and
>>> as capping values for domain creation inputs.  The defaults passed on
>>> the command line are used by dom0 which has a very different grant
>>> requirements than a regular domU.  dom0 usually needs a bigger
>>> maptrack array, while domU usually require a bigger number of grant
>>> frames.
>>>
>>> The relaxation in the logic for the maximum size of the grant and
>>> maptrack table sizes doesn't change the fact that domain creation
>>> hypercall can cause resource exhausting, so disaggregated setups
>>> should take it into account.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> albeit perhaps with yet one more wording change (which I'd be happy to
>> make while committing, provided you agree):
>>
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -1232,11 +1232,11 @@ The usage of gnttab v2 is not security supported on ARM platforms.
>>>  
>>>  > Can be modified at runtime
>>>  
>>> -Specify the maximum number of frames which any domain may use as part
>>> -of its grant table. This value is an upper boundary of the per-domain
>>> -value settable via Xen tools.
>>> +Specify the default upper bound on the number of frames which any domain may
>>> +use as part of its grant table unless a different value is specified at domain
>>> +creation.
>>>  
>>> -Dom0 is using this value for sizing its grant table.
>>> +Note this value is the effective upper bound for dom0.
>> DomU-s created during Xen boot are equally taking this as their effective
>> value, aiui. So I'd be inclined to amend this: "... for dom0, and for
>> any domU created in the course of Xen booting".
> Not really for domUs, as there's a way to pass a different value for
> both options in the dt, see create_domUs().

Correct.  On the ARM side, this is configurable in the for all dom0less
VMs in the device tree.

I've committed the patch as is, seeing as it's fixing a real bug we
currently have.


But, I'd like to point out that there are still some issues which want
fixing.

The /* Apply defaults if no value was specified */ section is pointless
complication.  All callers pass a real number of frames, except for the
dom0 construction paths which pass in -1.

The logic gets smaller and easier to follow if each of the dom0's
dom_cfg's default to the appropriate opt_* value.  Userspace which
really asks for -1 gets a large domain that actually honours the
uint32_t ABI presented.

With that, the writeable hypfs nodes become useless, and can be dropped,
and the opt_* variables become __initdata.


Next, we need to do something about the fact that the number of maptrack
frames has no relationship to the number of entries.  I don't know what,
but the status quo needs changing.

Next we need to confirm that running guests with no maptrack is safe and
security supportable option.  XSM_SILO + 0 maptrack blocks most of the
grant related XSAs we've had.

And in some copious free time, we still need to get to a point where we
can construct a VM without a grant table at all (but this still looks
like a lot of work).

~Andrew

