Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9969A688317
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 16:52:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488845.757112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNbs8-0005kc-4j; Thu, 02 Feb 2023 15:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488845.757112; Thu, 02 Feb 2023 15:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNbs8-0005ig-1g; Thu, 02 Feb 2023 15:51:36 +0000
Received: by outflank-mailman (input) for mailman id 488845;
 Thu, 02 Feb 2023 15:51:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LChx=56=citrix.com=prvs=3900541de=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pNbs6-0005ia-Nq
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 15:51:35 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73df9ac3-a311-11ed-b63b-5f92e7d2e73a;
 Thu, 02 Feb 2023 16:51:31 +0100 (CET)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Feb 2023 10:51:26 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6008.namprd03.prod.outlook.com (2603:10b6:208:30a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Thu, 2 Feb
 2023 15:51:22 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6043.038; Thu, 2 Feb 2023
 15:51:21 +0000
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
X-Inumbo-ID: 73df9ac3-a311-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675353091;
  h=message-id:date:from:to:cc:references:subject:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IIh3rOzHrWbMRQwF6khqiAhmlTKEMfgvvlBC2BHiQ6A=;
  b=LzZnQBRI4IaW/yq97GTXoJvOjPE5kfdCpbUqqw7c/Ux98M+T4pdk5+LL
   39vRvLiTEgccY8xj7e6imhK8MbirjiajnkUwZn6RxwMyv0+nJ+2Vfae1i
   gsp/7hLb2zvmYMLluyoHA32QZPRPvHDR2pYNTKAGMGPmcRcFur1lM92Jr
   w=;
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 95402703
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:F9L4pKtmCR/dZptNgoE52UNaXufnVJxfMUV32f8akzHdYApBsoF/q
 tZmKTqAOf7eZzCnKIggaYvk9B9TvJWAztBhQAFkrCk0FS4W+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj51v0gnRkPaoQ5AWGzSFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwE3cmdw+j29yKxuineLU1rcoxPOq3BdZK0p1g5Wmx4fcOZ7nmGv+PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgf60bou9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOzlqqYw3wXIroAVIB0pa0Pmmf+ysFe/CtREI
 E8Q03VtlpFnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8ry62OCUTBX8PY2kDVwRty8L4vIg5gxbLT9BiOK24lNv4HXf32
 T/ihDc6r6Uei4gMzarTwLzcqzelp5yMQgtr4AzSBzih9lkgOt/jYJG041/G6/oGNJyeUlSKo
 HkDnY6Z8fwKCpaO0ieKRY3hAY2U2hpMCxWE6XYHInXr32/FF6KLFWyI3AxDGQ==
IronPort-HdrOrdr: A9a23:LeZi/q2lwWLftGmDQsu4wAqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-IronPort-AV: E=Sophos;i="5.97,267,1669093200"; 
   d="scan'208";a="95402703"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2S+lt0o7rkZ7WZcr7KvrXJenaPyUhHiTpanwrvjB4hT9arm/FtKbVoppWBNAp5j20awxsC1hJ4UU4WZxzYRN86EbCFRtj400gyOBmddjpwOS8WzK3C6Lhj9TrXlY2+bOsK3jAFBh5Ou1uCRvx6ayNAGpW8HiRA8Tup8NbevEQ+xYK79kCwwsjtQKSJpVUsWipbWpFvsL9P9xvWDh503X0lri87W0wz9fqjrxwCejYvbtm0xx9Zf0ngO0y44aeAxctwBvTPGl4MSLDDlj+2FQkXPNRcgwDF9xUX99+AzCQZGpNALWGJXiJtwKN0Q6YkIGM3i97WRr4QJ6EfnycHe8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZqStkqnQ+mR7F3QJ1g3SimZ7kMr6Edjvzbno+Xi1kE=;
 b=MBmaazjReMnVZ9iN9bQtAvKGCwZkGoJYb5DacjEwCsLvKScICmAamwEGKxqRsfD/6ek6MlQmkTnxiznXdKzuXBKyYH9BZUFR7bNIBgOvxHE+TmFBtCuP3T/Cml4Ff6ydehSKI5qBmJs4TWAbkvBFmBUZOga5RUSHAowGDF3OitT+t2rFEMiBhQDYvOuQfPzVpIA22vf8UoRlvK523qiKPGKKqjVVaaFhsQgUHte/mQGiVoQiKeYAVwHPX3nUcRP6JEWvwGyoK5IiMphLUEp6rjM8pBU/eJLfsrx0vRupNnr1DiOfuk/5f3FfVj3OAyan37dhgee0DkAbIJXOOnBFtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZqStkqnQ+mR7F3QJ1g3SimZ7kMr6Edjvzbno+Xi1kE=;
 b=UIabk9xBnENaiYWhfqIAoFCxChTl/tYkn/QKpC3byAsZoBdZ1p9YZN6sFHDIU302g7grU2eRZLzIAgND2psYbMQ2E7ovSSGkKcWQIKc/GU+rkMIR7qRRM2ATbJDuGltVZlzTBMCUxlclKn5cUyyQFKNu66DgsVywSFgdixJqrGc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <906028ef-b9cd-93bd-8ee2-f263851496f5@citrix.com>
Date: Thu, 2 Feb 2023 15:51:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <d77c1a7a-9d15-491d-38fa-99739f20bebd@suse.com>
Content-Language: en-US, en-GB
Subject: Re: Proposal for consistent Kconfig usage by the hypervisor build
 system
In-Reply-To: <d77c1a7a-9d15-491d-38fa-99739f20bebd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0170.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BL1PR03MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d93dea6-73d9-490c-538b-08db05355446
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YQsZ915/QPu9AR4AQ6ar+5hSnUfhR0OhVfGRMf4YPriTbINAEfCp6k4l5Sz47Gnz5fFD0CPcDtTsHx/43Hg3XazgCjHN22DoTfVJONC+NXBzEikbeYJeyfN0Bk1g7e8Qsw8Jv4o/Pp09dK8tvNDyXiiU0Fk8yY4J3Drlx5L0IKGYoMEwQzRZu0XosGFACYQkPH8wbalg04swY43rdPNYxy4FYSWxx5yozphKxGF4M22d+ADv6oTGpGuH4HIWc0sjJAEY/cY5ck36lrbu+c87krtve/TXfg4T4fI0zOsk13yGrUtVzVg8wvu6z9XV9ZFM9ivAflNThWMlzKxHhqwyWdJ+P1/KBvSSbmXCxLJMs+zMOKZ7nY48NvlxqA/DRraC52JRu6ysVnGF4ibFlENVIh5Hvon6Zro+Lter99tCTqUQEuST0tBalKRPDChwHJcTpyT36XNlblNsRId1H1CgjXlzY4sLkeMEQ/+VksG4zVv0BMS2eKXOGWXMlPNUamRanL1WNf/VHILiTstKE4S4wlIR6dU0cFcpjLLkmtPV7BGG+EcXzIgM8d99GZGh6G85KV28a72wGQrVwTjlP/ZkUIZ3vYSn/BVGhB8gOrO5LrP2nzfPuZ1T+hlrObWaehUxJu9hh5yj/XbnSewISZxQTmZL9de/4W4tAy0vlh7G0llacvGXUNxxqoDB2AELsFlb/Tyv5JZOPhSPcEDCZjn0nFUovVfcKuV9wpHrLnAUCM8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199018)(2906002)(6512007)(38100700002)(186003)(5660300002)(26005)(82960400001)(6666004)(66946007)(31696002)(8676002)(4326008)(83380400001)(41300700001)(8936002)(66476007)(6506007)(54906003)(110136005)(316002)(66556008)(478600001)(53546011)(66899018)(86362001)(6486002)(36756003)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0RLYUE1UDBMZWdMNVROOUdGamhyd2ZmdEJaRkoxak02Vm5kNjMyQU9jNkkx?=
 =?utf-8?B?azNpSUFmenVNSDBwVUZxWWlZcU00Ung2U2lEeGU4NzQrb0xCUXZ5MEpDZk9V?=
 =?utf-8?B?WVJRR3VYcjRHRW0yYVhjSHQxOGRmZWdxQnBOLzlmZVBBb2xmcUlNQ2lzamVG?=
 =?utf-8?B?SHlHSGlMSnE5UkxrWjRZSlZPK0ZwYzAyMGJ5ZzNSY2J4M083dFBFSjVTcWdr?=
 =?utf-8?B?S0p6TVdrSWlpT3RoakZyQ2tPL3BUaWE5SktWRUovbWJvSktlYnNacEx6bHI3?=
 =?utf-8?B?Tkhwa1cxeDZjSnF0Q1ZKaVBoNXpWajVJa1p6Y1hDeE81VE4wQnI0WU5EZVdy?=
 =?utf-8?B?OUx1eUxKVGtNN0xhbDBUTjJ4SUlBQzBRVFRhZmZvNGVwdGlLOVo1dDIxSTJY?=
 =?utf-8?B?L0VKRzBwcGl3cW9OckdiaUoxelltYjlvK25PaXN1ZUFhOUVVWHNQTjFKRmJv?=
 =?utf-8?B?NnRLN25MQlYrY0RCaFhjSFRIcDAzYllZZ1BkNWhJSk9pY09MK0ZxcmJ1TE1m?=
 =?utf-8?B?NjFmcHBzemdXRjFmTXZYMGlFSkx1djB3ZDhJQ2lubWVBcnlRQXZ0U0NsMkYv?=
 =?utf-8?B?d0QwYXY0ZUg2eUdtS3VreWNRZHBvbDhPd2JJZGFVeUgvVTJhZ0kxeXJySW15?=
 =?utf-8?B?ZENtYWN5c1ZJcURtTTBkU1JWbVdSd0cxL28xaGVvVWFNRG5FRldOM2xLQTJO?=
 =?utf-8?B?YWNsSExod0lTMkM3WHZyYVZZajhSZ2Fqa29ReUNKcWpYRGdVMkhOR0Q1V2dZ?=
 =?utf-8?B?MHRZQUNCY203RWZrWEx3YXFGbC9YWjhHdkgyaFBPbTRMVHhXY1BmMG1JWVlx?=
 =?utf-8?B?VElhNlcyTVc2WVRYZEhwblFqU2hIbVk2VU9GNmlyeXhhMjRWUnorWXlWOWsr?=
 =?utf-8?B?bSt4ZzFPTkp1SjJ0eGdOblZLWVdhVER4UU95VHBxSHdpeVNsRGFvaGRSUkdz?=
 =?utf-8?B?VTlPWEJVeE1lcm1kT0ZGMHhoT29xUi9yOHlSWVVsUVdLTlUxOFllMmpiaS9j?=
 =?utf-8?B?Sy93SXVGNGdkYmVuMXR0NWhjSlpVaG9CUTgzaHU1V25QVzZXZWErNkt2S3Nl?=
 =?utf-8?B?aXg1RjNPanNCOUprMEYrdVpzcXJNaENCSnBwNkZCRGFHajlVT2gyMVRibVdL?=
 =?utf-8?B?K2oyS0pDS0h1QWxBTkswUkhndHY1T0R4MVFUK2Vqb0x2NHJDdmtORVhCajFG?=
 =?utf-8?B?UVRwTy9Demg2bE9tZmlCdDBpU1l4d1A0Z0duVVBISzEwaDZuR0xRbjVFbmtt?=
 =?utf-8?B?d0VCcm16YU1DY0hEMmpONzhSNUloL3h1Q25FQkZUQTQrcG9URzFKUndnRFQv?=
 =?utf-8?B?RFRmZEc3Q3VqRGI0ZWRpVVRITzhwdFdVczhPUTR3V1JyNnc3UU5qK09KK1Ji?=
 =?utf-8?B?dmt4UlVRRHQreUZTQkVjQ3g4QzRoSDN2d0VzdnQ1bVFXd1JvYW9Kb0VXQVBn?=
 =?utf-8?B?aGY4UmZ2NmN6K2VPem9hTExuMjlzT0FHTUFUT0d1bVB1MTZiRE9sRGo0L1ZZ?=
 =?utf-8?B?SDU3d1dVMTlpM1RDVVlaNXB4bnQxN1l0Y21iTklZdVkrNWt6ZldKUWRVdHFR?=
 =?utf-8?B?NjFxQ3FUV2d4TElhRjFlV2JyYW5abFVpVS9jYzJSeitQSFFVZEJuWGtHaTcw?=
 =?utf-8?B?RzcwVkhQVHdPVFpxUE5uVTFHbnZQNUNiWUJhU0FSdGo4Z0d4c1owTGFhbERV?=
 =?utf-8?B?SGJRQXdQTEFMTWlIbTJuN1NSRWplOSs4QU9IenVhSWdnNWNPaCtBcWd1S3o1?=
 =?utf-8?B?OWo2emdXNlREeWUraUJRYnExVHZ4V2F0QURlL3Q2eDZyMFdNMEw0anN2RzZF?=
 =?utf-8?B?d3c0UTdtWEVldmMrR01oNUlkZ2szNitIcmEwakxtc2l4QXQzN2FKN1pYdEll?=
 =?utf-8?B?Y1ZBUks2TWN0QUNaWWpzdlc0TGhlbFNDZ25EYitEeEdYV1UwSENmNFQwNzll?=
 =?utf-8?B?OFNxNXl2M09ZYVVRS09UbDBTU2EweEZHLzJNWTFRb2V6ZHo0M2JuUGdMUENH?=
 =?utf-8?B?bEY1NVlYQmZDQjI2NkpJb09EcTNYTGk4ZEwxZy9UOW90cXJCTUdyQWF1Y2xB?=
 =?utf-8?B?Rk4wZC9iNTRzMy9MVnNmb3ZMMWZZMW16Yy85ZXJFTXRBT1hIcnBwdnpEWlda?=
 =?utf-8?B?VVNsbU44RktocVVnWFovVnVJNitKMVFSNVZ0SFpvVXoyRjl0cVJvbFUzM0lT?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Cvh4TvivdRo/jZkbTbTgxht4J2EMF8ks4U+s54++VvOdipROvnUFs1C/Pu/5u+8xGIKD/enMkJiRUXR1+b9CC7MmYB+2E+ZFh3hSi9mfkuZGsy32P8n6aUfXE4qNjbTMeMAWw86VtvRlPbEOmr1OpZall1i7sDdu3fqJp2ldEJrLo7ReZy3e6SwTN4QhtmreTgvaNSOm6et8/HOpdIBW/L9UWHfoRQU6nBMY3ec0WOpBDMHkpJ1Tha4NlGrfAADn/IN+Y2LF84RqjwJ3yqONi1gMSpcHM9MemikEmx+1Gw+8GuTzRBESdDTntntErqGvXwHsD9TzPj8zdL0mdIFoO7Kha9Vv/xUJmLkzSRaICC6qLbK322DeC/RTZ90BAZA8zVC9braOJ8qz4ZpIhd4AUT9QP/Pp5WJdGSRFzS3yL/QwD9DLdvLX/UYvvQoT00pnbrpka+4/4/05LDc2FnHjeGNxsjhKwv0vDN2h7HlOtWeyqQ7ldYH12Xs3S2NzeTmboJzt6vg26IFOrBjTG/1qYGhu4Rt8osiZ5emAQas8NHib5IXgEVbeFS0nXEgRCBXE6m99lx8mK0q+3H78/ULqpfXyAdhvJM0OJ1AoHSYVqHQmOH8LUSw7RwtS9P2XTJDmPDMTCbAAo52MVU41BomHpL6TiRdICBlzlItpe1cJqD97fm7Ek/KbZv68m2MD7pEe8SFQmekI1NHKHbLRv+yZPebYRKXJn0o+oJGKJn36kCzobQtvOaTgHNRhzrtg2hxVkoCo3LljAyIgj12WZXhpNqO+1pXKVe2UP55GdnjIQEVinbDcPf2aTpgZyx2g/vqysd7yUB7BQxMkNPLnzjLB0VDZCcbqsi1/9fVcciGdcmw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d93dea6-73d9-490c-538b-08db05355446
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 15:51:21.1482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2qeDWBm9jzhLkxFKZmCKL3xI8ZahwYBoeyAG46nB8lvc7LzK9smz5LhisUPEpojm28Ddbyc5BypRzA93RC0emPTxjs1Us8EfLvUNXJ/Fv+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6008

On 12/01/2023 4:52 pm, Jan Beulich wrote:
> (re-sending with REST on Cc, as requested at the community call)
>
> At present we use a mix of Makefile and Kconfig driven capability checks for
> tool chain components involved in the building of the hypervisor.  What approach
> is used where is in some part a result of the relatively late introduction of
> Kconfig into the build system, but in other places also simply a result of
> different taste of different contributors.  Switching to a uniform model,
> however, has drawbacks as well:
>  - A uniformly Makefile based model is not in line with Linux, where Kconfig is
>    actually coming from (at least as far as we're concerned; there may be
>    earlier origins).  This model is also being disliked by some community
>    members.
>  - A uniformly Kconfig based model suffers from a weakness of Kconfig in that
>    dependent options are silently turned off when dependencies aren't met.

This is deliberate behaviour of Kconfig, and not related to toolchain
dependences.

Exactly the same thing happens for a change that edits a regular
dependency, or inserts/removes an option.

>   This
>    has the undesirable effect that a carefully crafted .config may be silently
>    converted to one with features turned off which were intended to be on.

The Makefile model does exactly the same.  It *will* check feature
availability of the toolchain, and *will* modify code generation as a
result.

The programmer just doesn't get to see this because there's no written
record of it happening when it's not encoded in Kconfig.

>    While this could be deemed expected behavior when a dependency is also an
>    option which was selected by the person configuring the hypervisor, it
>    certainly can be surprising when the dependency is an auto-detected tool
>    chain capability.  Furthermore there's no automatic re-running of kconfig if
>    any part of the tool chain changed.  (Despite knowing of this in principle,
>    I've still been hit by this more than once in the past: If one rebuilds a
>    tree which wasn't touched for a while, and if some time has already passed
>    since the updating to the newer component, one may not immediately make the
>    connection.)
>
> Therefore I'd like to propose that we use an intermediate model: Detected tool
> chain capabilities (and alike) may only be used to control optimization (i.e.
> including their use as dependencies for optimization controls) and to establish
> the defaults of options.  They may not be used to control functionality, i.e.
> they may in particular not be specified as a dependency of an option controlling
> functionality.  This way unless defaults were overridden things will build, and
> non-default settings will be honored (albeit potentially resulting in a build
> failure).
>
> For example
>
> config AS_VMX
> 	def_bool $(as-instr,vmcall)
>
> would be okay (as long as we have fallback code to deal with the case of too
> old an assembler; raising the baseline there is a separate topic), but instead
> of what we have currently
>
> config XEN_SHSTK
> 	bool "Supervisor Shadow Stacks"
> 	default HAS_AS_CET_SS

Yes.  This is very intentional, and is AFAICT an example of something
which cannot be encoded in the existing Makefile scheme.

There is a tonne of stuff we can only do with proper toolchain support. 
CET (both shstk, and ibt) are examples, and plenty more to come, where
playing around with .byte in older toolchains simply will not work.

There are also plenty of cases where it would be technically possible,
but the cost of doing so is so large that it's not going to happen.

> would be the way to go.
>
> It was additionally suggested that, for a better user experience, unmet
> dependencies which are known to result in build failures (which at times may be
> hard to associate back with the original cause) would be re-checked by Makefile
> based logic, leading to an early build failure with a comprehensible error
> message.  Personally I'd prefer this to be just warnings (first and foremost to
> avoid failing the build just because of a broken or stale check), but I can see
> that they might be overlooked when there's a lot of other output.  In any event
> we may want to try to figure an approach which would make sufficiently sure that
> Makefile and Kconfig checks don't go out of sync.

This is a brand new feature request.  But it looks like you're trying to
reinvent ./configure without using ./configure.

~Andrew

