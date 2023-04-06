Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C25E6D9C79
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 17:34:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518929.805950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkRcQ-0001f2-59; Thu, 06 Apr 2023 15:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518929.805950; Thu, 06 Apr 2023 15:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkRcQ-0001dE-2L; Thu, 06 Apr 2023 15:33:46 +0000
Received: by outflank-mailman (input) for mailman id 518929;
 Thu, 06 Apr 2023 15:33:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3yY=75=citrix.com=prvs=453e3c94d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pkRcN-0001d8-TA
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 15:33:44 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67a483bb-d490-11ed-85db-49a42c6b2330;
 Thu, 06 Apr 2023 17:33:42 +0200 (CEST)
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2023 11:33:38 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN4PR03MB6768.namprd03.prod.outlook.com (2603:10b6:806:214::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 15:33:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 15:33:36 +0000
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
X-Inumbo-ID: 67a483bb-d490-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680795221;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BAvJtl8D8wnOaRJr6oR7rTwaR89LKmeaTPG9kn5YroU=;
  b=PJMFBwaEyvX5mQy4QiEWUZcp0gNbLZo4NfbXl1vJe3eSBaGhFNgK5pEH
   5sglr00sqSCci+0AO0UYtlKLThwwviN2GRszLdOv6+GVsEV2aoac9s1Vo
   uj0ZDYtJ2H6b7jyTl5hZvtPLGsJZRgNeqUAc0lB7Jb6tzvnCaax8xV41e
   Q=;
X-IronPort-RemoteIP: 104.47.59.172
X-IronPort-MID: 104498459
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:sDCqw6OL+tNknYnvrR2IlsFynXyQoLVcMsEvi/4bfWQNrUp00DQBn
 WEaDWuHa67bZDfyf493a9+yo00DsZHXn9AySwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tE5gJmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0thsHWFi+
 6EeFG4yfhODuumzypS6Y9A506zPLOGzVG8ekldJ6GiDSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PtxujeJpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxX+nCdJOSezQGvhCkG2z/E0xWQAqCniF/+KTzXybXfxNA
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWKTVqN+7HSqim9URX5NkcHbC4ACAcAvd/qpdhpigqVF4k5VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTzgbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:ht85cKvHnzKYUtHPS3ka1WSK7skDp9V00zEX/kB9WHVpmwKj5q
 KTddAgpGfJYVcqKQgdcLW7VpVoLkm8yXcY2+ks1PKZLXLbUSiTXf5fBOjZslvd8k/Fh4pgPP
 xbAtRD4bTLZDAQ56uXjzVQUexQp+Vvm5rY4Ns2oU0dLj1CWuVF5wd9CgGUVmh3XhQuP+tGKH
 OF3Ls7m9O/QwVsUviG
X-IronPort-AV: E=Sophos;i="5.98,323,1673931600"; 
   d="scan'208";a="104498459"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jk8sq1R7IOBpxOMsa3cjL6R/waHwiG51bfOF9HEPca/tYEC3+v+iJ9eO30QrD4TKsJXyTg1QbbkEPM7fukg7PELHCdjT/b03WRc14EjQr2Hnm36rnYnMiImrM1wBA8jjJbYRRVGPZeSHiZv1hpoUqd7LsMtLGZv6IKO8ixyGwGuUmp8FXorWMxsgJZXt6eqAHS8KJFNDKNRUh+qgd+kEJpNF+Vdj6poMSq0Ix5sX/3ANGovVUKNzgN0kiVLpayz/McJpa75ThIa0MGj1dzZz66mbmhtsv0AiQepYZa1xmgxCXL6mbL4Bx7IJ+9PZFivDeDRg8KjqQ1vX5MM/iJ72GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Mfne7y8aweDKenSHNw4RzZCfFt4bGVZDOLeZa41Gvw=;
 b=ayOto2LOQc9204BfQIkSK2zCUlBls4PThcFA78KAFVgkDl9fFBWpw0E8cJDDsaG6lZ/9GviOhsx6cmdc6qsEx4/iDqc/6qpPWxhRQcoyXw7l309sYvV81wHGUPemy5fQx+3J60txSPSdY4vOvTKMLdKWoptD7+zwXcsG3C2WF5Wo4PwPUvrij5vZdz+gx2x3tAdgDArs1ZFH/ux7kXRHgKzfv/61d1ccaBco/tEGnO3hyrHKP9LeJGnEq/wvMDnkG1t6YffX8pXp0JKWKzkCZzI0jq+U2cBBe1q3JX/Ws9Sz+p2imq8RIf9uu+pWAkfE+il+40wmUzFMTTNNAkxfJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Mfne7y8aweDKenSHNw4RzZCfFt4bGVZDOLeZa41Gvw=;
 b=IF3PTjbZGh3nO875qGvIrxSKDJn/XMA9iT9r7rP6yzwogIwJuaSNKXn6GtjjUlHfZu1U8eAESeG+KuJICSgK31UQLXm/6epqF6JdXdSb18wDWzbciUBenm8+13O4UD7sxQf+Ymhg/+BfPPW/Fkquw2PAXrWyJr0p7NCNBhVUKrU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4fc4f5a9-0b9e-bb30-df32-09b5e9e63a57@citrix.com>
Date: Thu, 6 Apr 2023 16:33:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: avoid triggering event related assertions
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <e79b3b8e-666e-b94f-d2c8-1ec2f6f5453f@suse.com>
In-Reply-To: <e79b3b8e-666e-b94f-d2c8-1ec2f6f5453f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0164.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SN4PR03MB6768:EE_
X-MS-Office365-Filtering-Correlation-Id: 716c6c66-42bb-4f2f-8be2-08db36b449b5
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yufdyamwhPkGxL3mdxhoHtTluSuBBDvb4Ka+JJ8jDg9E7A5bniQDrwG7ABF2TP0Z8tFknJXGq2CxH/4Gw1dmIe1dZqY8zvj1F5xi7KAmFfYnku+cFUZ/zbSUVxTqNu4qkcKIiRLPMFxSN2V3tyGau849g/y9PikwYGXyGmNcMOJlJomnAtjQPT7KjzmIaoMyBf7dnNgS9hTHtWTt1RgfXiq+AUpb5nXgeUOjPDoocHq9TOkfjlT0klY1CPIcS1T0Z6TKZXqiX6a/u+WDdX371DL4dZMdAveXqmhRpaGLpuo1tt5Lo+xvAvNor4C4zt2kikZ44qHcSVavw96Q7jSqyscepWMoHXECZLcbjbv3EdAullW1TQMBcvLxPSRWeKYWnkbUC++qQz2upKhUNR79KzsznyHAZqq2v7Natf0auhZl3SF9/WUW0HYmkoypUXfp2ECD2f/SEAbqZ82EJ4eq/DwlPrLPndXt7a3L1UFzZlq9eFfiX//ntZvkjjRDQdcmY8iHtciMUtHX50zrvlPkkSJ5QkNlhrqtrVWaxhgfBqHELr3xkUElsO1G3dFkw7V3T00f5OlG0OvQn39QHnWch7c9Ug2nerNoSUCmxQJ+9N0eMz/dAdVrgH8xCURxrIS/dOGvGE4CYR2k7AkMgHDWwg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199021)(86362001)(31696002)(36756003)(316002)(110136005)(66946007)(41300700001)(4326008)(66476007)(6486002)(6666004)(478600001)(66556008)(54906003)(8676002)(8936002)(2906002)(5660300002)(82960400001)(38100700002)(186003)(53546011)(6506007)(26005)(107886003)(2616005)(6512007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1dyK0U0cWo1Qmkra1ZoSUFKSnZYL1U3UExFblpncmk4ako0bUZLNmdHNWwv?=
 =?utf-8?B?ZnMzUE95b213cFpGV1QvT0prSS9CN2xYNUpwTEQzZjcyK2NqdjB6QzdtNjU1?=
 =?utf-8?B?dzJ2M1IvRzhxSHh2YlNOU3YwWC8wSk83bkFOaE8zOVBoYjdSdkJKU29qSlFp?=
 =?utf-8?B?YkFRQjRtaXZUV2J4cE15SU5DanZaeERUUlJXZ2RyY1k3UTh5dUZMWXh5ZnpC?=
 =?utf-8?B?R2xPdzlIaEFpYkcwUGIxWEx1a01lcHdhOTdja0hzK0wwMGVzV3h1N2NJbDVN?=
 =?utf-8?B?TnJ1Y0pNbVhidmsxNmQzN3VLOXVHNHkzNUpIMFVrdVFaU3V4V1FNd2t4Um9H?=
 =?utf-8?B?Um91MXBvL2FNTU9QVzU4VGFwdnN2MTdlcEt2M2VYVzNMSTNsWEd0aUNFd2ZG?=
 =?utf-8?B?RTdjMzh4TVNDVjg0YnM0Qk4ybjAxQU1JZ0VROEtneFRmdFNFK3VxMkVDVGRj?=
 =?utf-8?B?d3dHZmUyN3luQmI2NW4wdzRSek84VDhOdmVvWE8yNS8wYS9PdVZkNCszd2FJ?=
 =?utf-8?B?dEFldmJQVkxJZnh0eWsrTSsvYjluUkt3bk1Dci9KYnZlV0FsQUVUNVo5QzdQ?=
 =?utf-8?B?MmZad284UytNMXJOWnMzdGp0UlFKTVE4dXh6OFdkUCtQNG4yOGJsYzFCenM2?=
 =?utf-8?B?clBmbUxrb0t6OW0yNWdwR1FobHcrWWhMdHp5bndwd1d6K0NuaVF4QkxteUxq?=
 =?utf-8?B?TCtFME00QkFmRTg0S1QvV3dNQ0xQWmNseXR5SVRTRWM2Q2lINHVWUTc3dkNa?=
 =?utf-8?B?bWJhZ1ozWFlUYVVQRkxpYkVOeldPUStWK3k2Zlp2ckJlWXJvTEN0U2xhNzB2?=
 =?utf-8?B?OGZQMlp2eEpkT2dlQm9GVWZXd0luRDNlSFA4K1lXODZvVWp3Z2lwOUUzeDd5?=
 =?utf-8?B?VmhIZXE1ekw1bnNTeVBkU2E3MnpJbE4xYmUxR1c4d3B1K3h5dEczcXNpYWsz?=
 =?utf-8?B?WGRjVmRWTTFkQlgxOTJNMFJ6cUpHeWdYMGc3SWtJWmlRU2hLYlhZdG9EbE12?=
 =?utf-8?B?NUJyQ2JXeFNXeWJCSzZ5Z2JyVkROcmtTeWo3OWwxU2ZUcHNrWW5rY3lwakYv?=
 =?utf-8?B?RmFSQUZyV3o2elR0RFR6SFRaZ0JCdWFhM1VTWExuWW5hWEwrMWlYaVl6cGI5?=
 =?utf-8?B?OWlxYUttbThrMjF6ZlorMFJiMXN6M2x3dWZFa3ZYMUVBaGViWmc0UEhSdlFm?=
 =?utf-8?B?UDZCTkF5ZmFvOXVIUXR6dW1KWEdFNHFkdUFPY0p2UnBwTjYyT1VoR1U1V3E5?=
 =?utf-8?B?K3hGeVpGcHBWSTNHUCsxeTE1cGEzUkZGVnVrc0tNQWNnUkVZemk3RUQ3OWc1?=
 =?utf-8?B?bmdKYUhRbGpENGR1aU4xWCtrb0U1dW9nME5xdXNONE9aVW5VRXc0TktpRm5S?=
 =?utf-8?B?NmRXY3BvNXNUWGQxaStRWEhvTUNwNVQ5eG9nTFNXbE05cUdJaE13Vm1BYXUx?=
 =?utf-8?B?RC9XeWdOVHc2WEZiQnhwaDBQQ3UrakNmVUFMdzBRZkJFYjhSZ3lTZHdzU1ZB?=
 =?utf-8?B?L0pzbkl4WDZHZmlzb0l1TmJiTjRlUDl2TUVhbmhtTlpYU0ZwRlpmZHF6NEMv?=
 =?utf-8?B?VHIxQjZRV2F1WXp1UTFiSk5NVzVGMlVRWkJTbFliQlc0RExKV09WQ3BtRTN6?=
 =?utf-8?B?Vk1vVTNEczk0a1kzS1oyWGJjRHV5TUxRVkVlS3FOWVE0NUthSGRwUGJvUEVp?=
 =?utf-8?B?MC9IemNwY21WQ0hWSG01SFhpbFY2V3NkdW1WQW5JcTNoR3RscklvK2pPOTA5?=
 =?utf-8?B?QStJeVZ4cjFKQUJLYlIvR2pNb0Q3c3FtbW1TZGpwbzhkODJIeVJqRk1IRWg4?=
 =?utf-8?B?SzdWZmhkZWVGbFNBK0w0c1ByNnphdWdEK3kxa2Vnd1RKNUJpVzhEbC91VUN3?=
 =?utf-8?B?N1dXN052dTUyVmQ2VVdBbmhhK1hzMWxlZTZxYURmV3BkTEh0K0JRR2FnTVdn?=
 =?utf-8?B?c25MMEdGVEF1UWg4eEFhZ3VFVXB1dDFuR2EvWmh2VTFKTTVkRE5uV3U3TWxy?=
 =?utf-8?B?bThkcWY0V240WlEyN3ZQRzZSa2V0ajR0VmRMWnRrUWRpOEwva2R1Y2dnQ2ZH?=
 =?utf-8?B?TGRET1hvUlo1cHdhWHpoalE0ZGc1czRZeHdrOFY0T1RhNG91eW4vY0hXb2Yz?=
 =?utf-8?B?UXNsK20wQTB4UlVLQllJQUVvdmthbkNPMVk5UVRjZUhzWENEWkJuc3BsTjdM?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xUomECeXBtq+WFmCfpv4zrD+GjCWFVP/mBJtFcKw+xMpGbPRyCC34tQkdB0tT7taj2GWBlcHBNRLPyba8bQ009ZEBe7JpyMdhHPldjOs0eoAkdiK4Nonx1DRb1vebrdWMKqOd3/YJYFNwJzdpJZ/KGPnsQ9EXVD53+o+KWHGIC+kX9QlHhnRRjJnKEfgrM9n48gsUedtVLsnZwcaYMOn3pAl51h2rm+WeAr+t55GzVJsLj7ojT4tXIEa4CWTza7j3XP8LABkq5koyie9binPr1Fpnnkr44XauBHBhekHSX+nrDcWox1z+cd9knXPnUE/w5+EZfl3343fv/cYssUulvKSYT7J+h9UacMfHf2gRoiqezS/e/z0U6PxnDSA28hhtQrXAptj0WYZJ67Z/4ZAV6tv68ZMRk66IoaQF61MZuC7caXsoyBgU9UercwrT94CvtSRRaxp4+AahkaDU/tODeAtlqKOciXmqffPaWr2CqB/n4hXWLcfqR+r0nhlq5nkoPHMK5kcUc/UYQ5aizZFcsEmjtoCpkXcONtPoFFr9trM1/uencf9vH+uF5zbH7zxhrqCmMTBnPdcAQi6Q9FH+jHrFfeXPIAG8+izbO19S7gmXEbvb8WB/8dGeAVen9JUpg6khRzVJu7ZhzFKVtV3JzNJJ9qJhZPYXmQUG+dmbUqJ+U8wG19zNELJDwo/NPCM1KmxHGlYWMR2oMR067BiWhlx6N3REKKNUjQ8rXYp697BxqJFJl5W7IECy1P0pgOGUp31WZCwzX7iB0CsgJf9YQGi4VYu3lGUhMkxzGwkgZQ5AKIeqBl1ZsMQ89JkLYZ9
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 716c6c66-42bb-4f2f-8be2-08db36b449b5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 15:33:36.4315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mPaaEM+aXghqzfcT+fXTdwN++BFvDbj0JB5xk+JfTynfAvkAkvktnxMB22Jii8e7qo9JWDhhoHsq4ge+6XmlsAKiej63FJjt98S2iyLJXz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6768

On 06/04/2023 3:15 pm, Jan Beulich wrote:
> The assertion at the end of x86_emulate_wrapper() as well as the ones
> in x86_emul_{hw_exception,pagefault}() can trigger if we ignore
> X86EMUL_EXCEPTION coming back from certain hook functions.

Looking at the comment I wrote back then, I don't think I'd considered
this case.

What I was fixing at the time was the case where
hvm_inject_hw_exception() had raised an exception behind the back of the
emulator, and any subsequent exception escalates to #DF.

I guess the comment wants updating to discuss this problem too, where
the hook queued an exception but we didn't squash it properly when
deciding to ignore it.

As it's debugging-only anyway, it might be worth rearranging the
expression to be

if ( ctxt->event_pending )
    ASSERT(rc == X86EMUL_EXCEPTION);
else
    ASSERT(rc != X86EMUL_EXCEPTION);

because it distinguishes the two cases without an intermediate round of
debugging.

>  Squash
> exceptions when merely probing MSRs, plus on SWAPGS'es "best effort"
> error handling path.
>
> In adjust_bnd() add another assertion after the read_xcr(0, ...)
> invocation, paralleling the one in x86emul_get_fpu() - XCR0 reads should
> never fault when XSAVE is (implicitly) known to be available.
>
> Fixes: 14a6be89ec04 ("x86emul: correct EFLAGS.TF handling")
> Fixes: cb2626c75813 ("x86emul: conditionally clear BNDn for branches")
> Fixes: 6eb43fcf8a0b ("x86emul: support SWAPGS")
> Reported-by: AFL
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> EFER reads won't fault in any of the handlers we have, so in principle
> the respective check could be omitted (and hence has no Fixes: tag).
> Thoughts?

We already require LMA as input state, and don't have an execution model
where EFER is actually absent in the first place, so passing the whole
thing wouldn't really be an issue.

I have previously considered doing the same for CR0 too, but at best
it's marginal so I haven't got around to trying it.

> --- a/xen/arch/x86/x86_emulate/0fae.c
> +++ b/xen/arch/x86/x86_emulate/0fae.c
> @@ -67,7 +67,10 @@ int x86emul_0fae(struct x86_emulate_stat
>                      cr4 = X86_CR4_OSFXSR;
>                  if ( !ops->read_msr ||
>                       ops->read_msr(MSR_EFER, &msr_val, ctxt) != X86EMUL_OKAY )
> +                {
> +                    x86_emul_reset_event(ctxt);

This is the only path you've introduced that doesn't restrict the reset
to the X86EMUL_EXCEPTION case.

In principle you can get things like RETRY for introspection. 
Internally, UNHANDLEABLE is used but I hope that never escapes from
guest_{rd,wr}msr().

~Andrew

