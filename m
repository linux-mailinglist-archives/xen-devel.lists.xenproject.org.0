Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1BE367F1D
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 12:56:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115276.219834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZX0b-0003ns-O2; Thu, 22 Apr 2021 10:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115276.219834; Thu, 22 Apr 2021 10:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZX0b-0003nW-L1; Thu, 22 Apr 2021 10:56:33 +0000
Received: by outflank-mailman (input) for mailman id 115276;
 Thu, 22 Apr 2021 10:56:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=96sM=JT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZX0a-0003nR-45
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 10:56:32 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e094bf6-d8d3-4f2d-b57b-69a63962f0af;
 Thu, 22 Apr 2021 10:56:30 +0000 (UTC)
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
X-Inumbo-ID: 6e094bf6-d8d3-4f2d-b57b-69a63962f0af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619088990;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Hs35y0nADG6TeJZLae6gjxeKQasxWRdUbP4ZnqJtXd8=;
  b=fa0FPH3VCVV7gBhI1jmMsXmhqDyOJocH+kROafFp+4BUj5ztz2ou5oC/
   dCS6MYPME14FCihf+trFfMrhZAUi2fzMijm+vfkX7a/KEk1XyA5k4amzB
   Qb6I8MB7wa7eaWlDF7HAL0e66BgVwYi05l2kG1j0tdUN6Pm3SGEcJ7oJp
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +pybSbNFVq13Z8U8rb9yqsOA01kn8sfMXu71gH2ywU08PBfZsOyeF4Dh3zpPAoubXsnvM4Hqip
 1Bb8bfa86TndogkzKaDl9sKe3lR5d6TgbWKOLBSLMvu2j8hbJHJa4eqxtYV3L/vRIooFVPZDVp
 nyJJWjFJVkKAGE6IzSF/eXjUA0KxOODzEjdyRcYzRkxwIEhSMwJFrQJ2zoceIXi0Yo/Uvx80Jz
 wVJulUwIpoixFhLECWBLj458Jia+gcIFNIfHVGrWk26CP2TQFx0APMyFjMADp0VcFrhYJYa6E9
 YVQ=
X-SBRS: 5.2
X-MesageID: 42165823
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:nzI1HK7VdgDdRouBLAPXwXqEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex3h3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdBHW3tV2kZ
 1te60WMrHNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2FXQotLhj0JbDqzOEtwWQVAGN4VFI
 CE4NBGujqnfh0sH7mGL1MCWPXOoMCOqYnvZgQICwVixA6Fiz6p77CSKWnl4j41VTRTzbA+tV
 XUigCR3NTYj9iX6D/5k1XS4ZNfhcf7xrJ4ZfCkp8AJJlzX+2OVTat7XbnqhkFQnMiO7xIQnM
 DIs1McOa1ImgzsV0WUhTeo5AX6yjYp7BbZuCylqF/uu9bwSj5/K+cpv/MgTjLj50AtvM5x3c
 twtgrz3fcnbmKj7VHAzuPFWB1wmk2/rWBKq59ps1VlXZYDc7gUlIQD/SpuYec9NRjn44MqGv
 QGNrCk2N9qdzqhHhfkl1gq6tmtUnMvJwyBU0gPt+eEugIm7UxR/g82wtcSkWwH8494Y55Y5/
 7cOqAtr71WSNQKBJgNS9spcI+SMCjgUBjMOGWdLRDOE7wGAWvEr9rS7K8u7O+nVZQUxPIJ6d
 r8eWIdkVR3V1PlCMWI0pEO2AvKWn+BUTPkzdwbz4Rlu5XnLYCbchGreRQLqY+Nsv8fCsrUV7
 KYI5RNGcLuKmPoBMJgwxD+YZ9PMnMTOfdl+uoTaharmIbmO4fqvuvUfLL4P7z2CwspXWv5Hz
 8tRz72CMJc7l26e3PxjRTLMkmdP3DXzNZVKuz37uITwI8COslnqQ4Ok2m04cmNNHljv8UNDQ
 9DCYKitpn+iXi9/G7O4WksEAFaFFxp7LLpVG4PgQcLNkjzYIsSotn3QxEU4FK3YjtEC+/GGg
 9WoFp6vYitKYaL+CwkA9W7dkWXkmUUv3DPa5sHgKWM6YPEd/oDf9cbcZ00MT+OOw1+mA5spm
 sGQhQDXFXjGjTnjrjgqocVCuHZf9xVmxyqPsZQlHLauSyn1IMSb0peewTrfd+cgA4oSTYRrE
 Z26bUjjL2JnivqFXEym90iMFpHaH2eBZVPCAjtXvQTppnbPCVLCUuajz2TjB8+Pk7n7V8biG
 DaISqIQv3TGVZGtndE0qHlzUNsegymDjBNQ0E/lbc4OXXNu3513+POXKa13meLQnYpw+0WMl
 j+EHEvCzIr4+ry+A+emT6EG3lj+44nOfbFCq8/N5vJ3Gm2FYGOnaYaPvNd8Zp/LuryuusTXe
 /3QX7NEBrIT8cSnyCFrHcsPyd57EQ+mfTzwRv/8SyW2mU8Dfe6GiUue5grZ/Wnq07qSPaD3M
 8n0ZYbve6sPn7wbdDD46fNdDJHIg7Sp2nzb+xAk+EigYsC8J9IW7/cWn/08VsC+jMUBsL9jl
 kfT6R2+6qpAP4lQ+UiPwZiumM0n9GOJnYxugP4AuUCbUgg5kWrS++h0v7tk/4TGUWPqwv7BE
 mH/wBc9/nDWTGf1bRyMdNHHU1mLGw94m9l5uWMasn5DxirbfhK+DOBQzKAWY4YbKiOArMLqB
 lmp/mOgu+MbiL9nCTdpyFyLK4L02GpR6qJcU6xMN8N19yxIlKXhKS2pOa1kTfsUDO+L30iur
 ctTz1ZUu1zzh84jIM21SCuSqv45mId+mEunw1PpxrKwYip4GDSAEdcFxbW668mBQVuDg==
X-IronPort-AV: E=Sophos;i="5.82,242,1613451600"; 
   d="scan'208";a="42165823"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XILLV7JXe+BqA38Y1+30WmOhh9sFlQii+QvtAOnw5PAJzFJzlEpkbtbchD7y5w8Da+PffvtEJ8fs0sgoD/CxphCRDijixqsVSqGhsUkf7Ccw3qLHIaaY19bbzNlrldig7z11rbM65pkfeja/orgIFpq+wWPFGR8GfgruZUMCpPs+mLV/RZHKhHRuop3/N5WqCIup9U/uAN/398/DvWaqWIM7AWyWNKM8aV7tTq4P3EJ5likRvYgfVuwaO+bpFSZ1XjIQj3AjqNi8nn9LtdaA4DBjXee/15rS3grkVWACcnHW7cRX9Xb2hc6N6NfgiFTm0znMLZ0hYDdZ2N4A5y9SgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b605RN8JIIFLEBxtm9Y/iFQiowI32YEdALrDHV9GPSY=;
 b=afcOc4Ui8L22mOUWf7Tbjh7zjVox+wOtXPqDirmMmiXGv0X9h+yOC8PpDomqgZqN18nB7HpLla9FApvv0G6VBVmWfkGpWSb7qg/USFN1WPBjNod8Jdsa42+/7td+WdRxX/zYUBfUZTT1RV+vC6tCv7OhEEz3eeHiH38iiQ38gapWSoE6OBowi+/yOr8RT+4DrMYhwpJ1j6Dg+sYqJ7CNh2Br6U2vx1524kooT3qVzShTqf/q3r4u2vZNTw0M24j1RkHfYCDxA2+FJ6cS3iaTBm2QBQA2/2fL+nWs4AaqS/XR0G6V4N6wbnhf57y7xlHK1+wz4dhFYdg0THKMQKyNvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b605RN8JIIFLEBxtm9Y/iFQiowI32YEdALrDHV9GPSY=;
 b=QPwUmRjwVsBZKDauVDgLwPSVZ79QwDTZzL9TGGEjrx9QvRiq10CgCP2Ly1IOTdJC6vMq/HiAZWorSUpUxxkCJfKyQMKTjvNLZAwwIxOgb8N5g0kvUhyR2egmPwdzI4A3u6JjqHCd+97I4/4CknQMlbJ4atGVhAr+hl+JbxXmASk=
Date: Thu, 22 Apr 2021 12:56:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 15/21] libs/guest: obtain a compatible cpu policy from
 two input ones
Message-ID: <YIFWUnQ6d4Pk7nf4@Air-de-Roger>
References: <20210413140140.73690-1-roger.pau@citrix.com>
 <20210413140140.73690-16-roger.pau@citrix.com>
 <391b56d0-bb4d-8d3c-231c-e2e3ad7e2f42@suse.com>
 <YIFFBEhPYSYQhycf@Air-de-Roger>
 <c692e77f-1a9a-ea1d-e029-2a8f62ee0e35@suse.com>
 <YIFRQu/CLEId2uMi@Air-de-Roger>
 <d877502d-9c18-6ff3-6e01-ee997c9f196a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d877502d-9c18-6ff3-6e01-ee997c9f196a@suse.com>
X-ClientProxiedBy: AM6PR0202CA0040.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8088c030-05d6-4251-122f-08d9057d45f1
X-MS-TrafficTypeDiagnostic: DM6PR03MB3948:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB39487558893B6BF6DA42A7F68F469@DM6PR03MB3948.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uVeo10zzwGQGln4FcneuzlkaNjwQci7CVqbPUecqcf597FXYuHhWoIjNCOzKe1LI6Rn0ycEvQICRvHGGt4v/rTlar7JIYpkTM82fhB9DZNfXrhiF+LP2aV/bn8SDo4Ab589ye56EfunD/lNAsDo7Lw+bbeJgx2bhGYBHXUOL6V4REAoTIS/UC0yXZo6+8YVJKckjlKxe+ngtlSjKD4cI6FdLJaba3CyiiQ6H35xTZIZEqMMOjd9gRED0rJXIBOEaOSIFWY04LpF9bcn4ewzWghpGH/Pxj0xcGzkuCeTRR2sVuxvQ5vVVsEQg6P/tJFN0bk6igCdwuQJ2d/Luc8MGDyYiHJlPUjPIiMSCHRD78NwvTHCpWaPFSJAuStDr9xnrQVZmZY1C1o7yvtp28PIz9i51I71A7iZxNqCpdCnk2AlN9JoucOz2u0JR8fRqJIE3t2HVfrCBT716Qdzxl1jrZXfuGU+QB5Wi5rCJ2POUixCbUjkdOOsiYVh4LOj75QcOOFXYsJm6/McLpAm+cE3F9Wdzs7HK04yVlVHJOfuc3yVIRm61FuKnb3V+S3XqxlTW18FQKN2nhM5DU+T2ERJtdLECRNZCgB0H+dVr2j8Phvs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(396003)(39860400002)(376002)(136003)(366004)(6486002)(9686003)(6496006)(5660300002)(6666004)(4326008)(38100700002)(66476007)(86362001)(53546011)(8936002)(83380400001)(85182001)(8676002)(66556008)(2906002)(66946007)(316002)(186003)(478600001)(33716001)(6916009)(16526019)(956004)(54906003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eDZVOEYzQmJnV1ZEMUFYUGtiU09sVDQvNjh4WjVoV0dMNnplejBFWDF0TnhZ?=
 =?utf-8?B?ODYyOE9RODNBU0ZJaTZVRGxocUJKcUpSTm9VcThoQjJqaHlKeEJFNGQyeC9I?=
 =?utf-8?B?bmlDSWZRSGNhWUcybkdNbTNuMm9zcFdQVEpkK0YrVm5UV3J5S0dTbzNTSWpj?=
 =?utf-8?B?eFF5a1Nab2xCU000ZXFIWXZUN3MxUkZQWGVDaUtZcmhjVmhSakJMN2U4L3o1?=
 =?utf-8?B?Lzh0N2Q0anhRK0pmUEx3R0FKT3pWeW84T3hnOW5sbGJxczVDNjhiZnV4d0gx?=
 =?utf-8?B?NTFxTnA0dWVGbHNScUU4NDF6UjBiTk5zTDFLcUt6R0FmZ1pIMDBvS1ZiRFpN?=
 =?utf-8?B?OW9Hdmd4SW9FS1lDZ3Mvb3Y3MGYrTGdKMzRnRW9QS3IvMmJrNUhHaXovNUpv?=
 =?utf-8?B?bG1VOU1TUjkyN21ZYmd3bUYxQ1c2N0FuRkJ1OHVhcGFTZ1FER2crbmZrTGo4?=
 =?utf-8?B?MjVjZHlSRjhXQXUybUtGa1VLak9YYkRqNUM4Rno0dmJYb05NTzlya2g5dHEr?=
 =?utf-8?B?OGN2UUYyV3ZzaEpsOTFOMkVHM3p5MHhLNFRLcXB1SW1PR0Y1ekorVTdXVXd0?=
 =?utf-8?B?QzdYZVcrek9JNmI0TGdNWUdOL0p2YzlXRi9pT1FBaWt3MjU1NnRUd1hQdnhh?=
 =?utf-8?B?dTEyZkZkREppamNYM3RVYm5nMGt2OWhITVhxb1A4emFJZi9mMnpwdUhhbGY3?=
 =?utf-8?B?NlgxTDh5ekRsU05ZbFF6cTFtU25LWjZKalMyaUVqMmc4VGsrSzBDWU4vMkpB?=
 =?utf-8?B?QkEyZWVNQ2NwLzYvSS9BanFYbWRtVDV2NXdhemw4UTBXQXhYLzJCdjRSMVRS?=
 =?utf-8?B?cis2aTJic2RPSGJLaE5obktvMlRtVVdUZ2FKaFlBNEJvMGdYeVJ0WjB3aldv?=
 =?utf-8?B?eEI3Z0I2RTA2RWREcm1ZYWdEVzB6ekthelVNeDJhN05oTUFTcTdnQWdUYmxm?=
 =?utf-8?B?a05idEZHS2VPS2RuYTVSeVpXdjl3ZWxCWGUzUW9KVVlTdnlkQURDd0pFaUUw?=
 =?utf-8?B?bVZiWHROZG1VUEVXQ1dJWXNydHhGVC83U1liR3VhZEtYSDZXRHJMdktvQnlk?=
 =?utf-8?B?cVBKdUsyWFlNVUZTWEtTdjlpeXVxUmFoR21IYlVielhqeXBWdWRKWG9WTG1r?=
 =?utf-8?B?Rk83VTJJLzBySHlmS0tycTBNS2JZSXd6QjdYMktEd01VakJ5dWIxRzZmNSt4?=
 =?utf-8?B?K2VNUlJrcTFnWW5uZXNjRjdGejRCK0RLSnBsb1VTaExJTFU5dXlLdUV5ZVhV?=
 =?utf-8?B?WUM5REVNLzlpRldBK1o5b1ZsNXdEUW1HVTM2MkRseWZBZFdCMWxpdC95R0Ru?=
 =?utf-8?B?TEdrWGNTb2tQRnNXZnpMRHBybGRvYmRpM3dHc3o0aEtYbTRSU1R1S1BXRUFS?=
 =?utf-8?B?ZU03aWE1VW9CUUJyL0prYWxIanZSQmtFME1rcFRyOGlSRTgrOWVaQzJtdy80?=
 =?utf-8?B?R2kvR25EZTJMcGNqRDd6eGJQOXhuejhWZGp3ZEQxankwdnhLUE96b2Q0NFEr?=
 =?utf-8?B?dmo2ZEl4Q3hQNlJQZW9SR1Y2QkljemwvSzVuWHMvMjYzOVZCRktuL1J0K2Vl?=
 =?utf-8?B?UGZjMStxbUJXWVJRQ25ReVUrcFpVQktlek1zeUVhck9Dc0FSc0xZaXlQZWhh?=
 =?utf-8?B?alV6Q3R5VkZNMEZydDNLZUQzNk0wYytDcEU0S3RtZllodXp6RVh2WW9EaTNL?=
 =?utf-8?B?UDU4OHdzMjBOWXNVdWI4ak5Vbmk5dmNORmFXRzc4NXFNVk5JMFZ0Qlg4Rzhz?=
 =?utf-8?Q?tJLtxdevRNYJd2Dzs8bnZRfe1RPs0Op+sO89m8U?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8088c030-05d6-4251-122f-08d9057d45f1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 10:56:25.4015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYfyVbzRMmzwjcyFjM1jcSSDe3QiErPwmQ4pn+yJEMo2rYm0Kiw9Pkk/lFRK4Jz4Elqm/GCKlwbk9AX1o3PE0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3948
X-OriginatorOrg: citrix.com

On Thu, Apr 22, 2021 at 12:48:36PM +0200, Jan Beulich wrote:
> On 22.04.2021 12:34, Roger Pau Monné wrote:
> > On Thu, Apr 22, 2021 at 11:58:45AM +0200, Jan Beulich wrote:
> >> On 22.04.2021 11:42, Roger Pau Monné wrote:
> >>> On Wed, Apr 14, 2021 at 03:49:02PM +0200, Jan Beulich wrote:
> >>>> On 13.04.2021 16:01, Roger Pau Monne wrote:
> >>>>> @@ -944,3 +945,130 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
> >>>>>  
> >>>>>      return false;
> >>>>>  }
> >>>>> +
> >>>>> +static uint64_t level_msr(unsigned int index, uint64_t val1, uint64_t val2)
> >>>>> +{
> >>>>> +    uint64_t val = val1 & val2;;
> >>>>
> >>>> For arbitrary MSRs this isn't going to do any good. If only very
> >>>> specific MSRs are assumed to make it here, I think this wants
> >>>> commenting on.
> >>>
> >>> I've added: "MSRs passed to level_msr are expected to be bitmaps of
> >>> features"
> >>
> >> How does such a comment help? I.e. how does the caller tell which MSRs
> >> to pass here and which to deal with anyother way?
> > 
> > All MSRs should be passed to level_msr, but it's handling logic would
> > need to be expanded to support MSRs that are not feature bitmaps.
> > 
> > It might be best to restore the previous switch and handle each MSR
> > specifically?
> 
> I think so, yes. We need to be very careful with what a possible
> default case does there, though.

Maybe it would be better to handle level_msr in a way similar to
level_leaf: return true/false to notice whether the MSR should be
added to the resulting compatible policy?

And then make the default case in level_msr just return false in order
to prevent adding MSRs not properly leveled to the policy?

Thanks, Roger.

