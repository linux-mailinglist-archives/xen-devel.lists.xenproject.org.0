Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D600E49B65C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 15:36:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260396.449796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCMvr-0001F3-TW; Tue, 25 Jan 2022 14:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260396.449796; Tue, 25 Jan 2022 14:36:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCMvr-0001C5-Ps; Tue, 25 Jan 2022 14:36:27 +0000
Received: by outflank-mailman (input) for mailman id 260396;
 Tue, 25 Jan 2022 14:36:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUgY=SJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nCMvq-0001Bx-QU
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 14:36:26 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12b5784d-7dec-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 15:35:44 +0100 (CET)
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
X-Inumbo-ID: 12b5784d-7dec-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643121385;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=+MOmdCdKcp8FV+YZLmQesk8vHT0DzBzcBxZAGY/CLRI=;
  b=Xx22P2FmmXy0Mu9fBki7Qqp/Gzpa3FfkUIw7IJ30zb7ixZoC9En4KDQh
   xUIP43bCUyXiBmLJbMJsqV8c+DNo2Z0mfjjSXum9owhIpILOr/lufgk6K
   qYfQw12L/RlIxbVOeQ2/gfGzcY1WR7tdsQdCj06di1noFlKZqGbdohtNs
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: gxxWkUsWrfMzhAgXnZC7C2my7h2bttfefnqosc2y+DVeUfJmZrwe5bRFMQWNh7YACoFaTjLPws
 L1kkHa/9/oiBTOr7wcI2ckpwupN+OadYf69C5+bPPN57kj9fYvkj2AsDnMq/tSmjBBzmlvizJz
 ui0kfZKqKghSeE/6S0fvoy7kl6AABT6SaxeuKvdLAFr1d656J0RurijB47NAhYXzPCpe5PTwez
 5xgMel5G1KqKteFd7XsS8bQf3ErF4A+fZ4ocZMXmxf4aB+MKUb5kBHqtCNsWej32QTchd0Atrh
 H8AZMgwZXg0SRhtLuMe8NZS6
X-SBRS: 5.2
X-MesageID: 64878722
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:h+4c6K7T/A/EsXJIXxT9ygxRtN7AchMFZxGqfqrLsTDasY5as4F+v
 mJLWG+FOfyDYWLxLtpxYIm+9UoDvJGEm9Q2GgM+qnwwHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZg2NMw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zw
 9lUjM2/ShYSHoLip+hGaTpmSgteBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmtg2ZARR6y2i
 8wxVxg2YT7fbAR1ZV4zMJB5zd2tm3LzWmgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6Iq
 2SD82nnDxUyMN2E1SHD4n+qnvXIny7wRMQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlaPsgclCtVTAtYaxy+yxvHuwDjALEg9G2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnE447eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl4hDGJGT9bxgbQ+0RqmBNzFJrVml
 CNc8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9IdsIvGAhexk4Y55sldrVj
 Kn74185CHh7ZyPCUEOKS9jpV5RCIVbIS7wJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2mHxW7T6NFPjTkkT2uZLDNSX9YepUbzOzghURsfnsTPP9q
 YgPbqNnCnx3DYXDX8Ug2ddDdA9RdSliW8meRg4+XrfrHzeK0VoJUpf56bggZ5Zkj+JSkOLJ9
 Wu6QUhW1Bz0gnivFOlAQiwLhGrHUcktoHQlEzYrOFr0iXEvbZz2tPUUdoctfKlh/+tmlKYmQ
 /4AcsSGI/JOVjWYpGhNMcij9NRvJEaxmAaDHyu5ezxjLZRucBPEp43/dQz1+ShQUifu7Zkio
 6et3x/wSIYYQ1gwF97fbf+ilgvjvXUUlO9ocVHPJ91fJBfl/IRwcnSjhf4rOcAcbx7Ew2LCh
 QqRBB4Zo8jLopM0r4aV1fzV8d/xHrInTERAHmTd4bKnDgXg/zKukd1aTeKFXTHBT2eoqq+sU
 vpYkqPnO/odkVcU74clS+R3zbgz7sfErqNBylg2B23CalmmB+8yInSC2sUT5KRByqUA5FmzU
 0OLvNJbJa+IKIXuF1tIfFgpaeGK1Pc1nDjO7KtqfBWmtXEvpLfXA19POxSsiTBGKOonOYwo9
 u4tpcoK5lHtkREtKNuH0nhZ+mnkwqbsiEn7WkX22LPWtzc=
IronPort-HdrOrdr: A9a23:W4qFDq7kG95ut8jtnwPXwSyBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc6AxwZJkh8erwXpVoZUmsiKKdgLNhR4tKOTOGhILGFvAG0WKP+UyFJ8S6zJ8g6U
 4CSdkONDSTNykDsS+S2mDReLxMsbr3kpxAx92utEuFJTsaFZ2IhD0JczpzfHcGIzWvUvECZe
 WhD4d81nGdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lIn5y6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXoIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6V9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF39tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc8a+d
 FVfYHhDcttABCnhyizhBgs/DXsZAV+Iv6+eDlChiTPuAIm2UyQzCMjtbsidzk7hdYAoqJ/lp
 f525JT5cVzp/8tHNJA7dg6MLmK40z2MFvx2TGpUBza/J9uAQO5l3ew2sRz2N2X
X-IronPort-AV: E=Sophos;i="5.88,315,1635220800"; 
   d="scan'208";a="64878722"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqKzL4lOQ0lJIVn0ibqFZA/9F1ZS2IO8woLAojJ0jMML3T2o99weVU6pVqksGZCRij316Lb9/qu7+syeqKGOP0KqBJhNM3db1wGb/KoQlDkQGDHnde5XSqoj3GSHJdrBHDrtNgJv460POrX18AmKrSAiu01gEAgzKT8cj+L9zaiA/RW+2I1i47UuU1h4ZBvcDgnT1tkjRU/Vd0RVzW0RlBBvEGSBFP3YskYOVF2QLslhhIJqqjqOSkfKTATcG/AdBeZ/IDFadcLzePeZnvAxb1QHhdhT8DnwMPLOYGCwcBV9oBODvmxiku+p7igEoknss/5JAjHTlE1QXZJXEVdDCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZuHOmjuRJ7LVEPOKb7OCO65RnBMkUFp8aDB2S5upjg=;
 b=VRqx1oOQaWK6LTLWYcsJSgXu7PniHw69ixs47kLZe8sCxEhseVgX6vHKFQjJq/MX08DwyTC/bEZpGSNPIMVwk7qbE37kYVGmb9TwIjc/MFrsvHvSJlddDUOHxcYFtj9NUOS09pYd4t/+I5lpMUu0kWNKX+gBqeb2gqRMWkWRTQ6UtVjymS85skk7VNA1hd6NfxpwLc5XcqiluK6ksuqOseWGxofMCxvp+TJ9WJ6CWnkb3oqU+7K6YW+qXXBa+Og4VkueOs349i6iC8UmS1BWIMAx2zG92pK1gEKBH3+0mvWmm3wQju3faKuFQ0ifJ4fBag0heLauTs01Yj226JOebA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZuHOmjuRJ7LVEPOKb7OCO65RnBMkUFp8aDB2S5upjg=;
 b=CwXcvp01S0gVy5QgSHuqR1vgHoD4SSQP4VefTbEUDSds0VyRygvC4cgf2lN45XIN6ArpcA4sf6TpHARvc/MkcY/gPXorD2h+KAv0QMN9hbV7r8t1qpvRCB8iZ31RrKa9ROoCG1vUmX9OE+YZWqrfi9xrMGAKFRyO/JJoudqeZ1o=
Date: Tue, 25 Jan 2022 15:35:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86emul: recognize CLDEMOTE
Message-ID: <YfAKzvb6QHpIza0p@Air-de-Roger>
References: <5812dc8e-d77d-f9de-4f37-b0ef094c5c09@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5812dc8e-d77d-f9de-4f37-b0ef094c5c09@suse.com>
X-ClientProxiedBy: FR3P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 946fa8cf-c567-4269-cc79-08d9e0100359
X-MS-TrafficTypeDiagnostic: CY4PR03MB3109:EE_
X-Microsoft-Antispam-PRVS: <CY4PR03MB3109484CCEE08E8E68BA6AD88F5F9@CY4PR03MB3109.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hv2eRzMmibzOO/aJ7/cEi30h0V6MnTVzybeeRcM8nkkdqRa4bc0DiW4LdOaG9LTo4DeDzxS86JYQ4jKZM1mZVQha1cJX5cIfEin6sSlq7/bYwZyhBeP/6P6baz0Rs1LzvWxqGiRfjyDuFPkqmmjOTg3qTjmMw/DhPJipLmXJvQBY0YwKHZ1a1l2GFd5Yi4wVB2xGqbCo7L+4nch5hx7lOTXslDyt5Gh8w/6k+gY0YG62dgxi9c6VofG06Q/7lO+KkAEmzok/sHbUhoa2re2fEuAb7+XyvMFBj6/j3tK8KtBp2QGJmEkygZkBOcCQ36MfzXP4ozAkCP7UHM/PeQf7bDHTWkpuWkYDelkW+yK4G6IHVwgOR/uAzq24cSNvqDytqYpf4I943BYF+avzKpEg0D/XpBk4q6o06hXLpSJ0z+gZFIG4Vf0Hvf5r2JSK/NW33FcpJL/521wzHhDeO9q/m4pvrpPIL5opFmBA7NnDoNGP9ObDAtFfWd2SRBY6hbYwcjLniApRDJ8JwqQno+VuJyc3UHbc97iAvx6quFD2Z1Tlq6Kz/EYzILdwkxSQ6At1mRum8ZHe0dgnkoyVz9uGm6gAJ+srAKo2bA/NzhXCarFYN6tyediH7K8vmo3t2UhrXOkMRylLNSpqDq6kSFpCkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6512007)(9686003)(83380400001)(508600001)(8936002)(316002)(5660300002)(6666004)(66946007)(66556008)(66476007)(86362001)(85182001)(54906003)(6916009)(8676002)(82960400001)(2906002)(6486002)(26005)(6506007)(38100700002)(186003)(4326008)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGM4dnRlcjMwUXJrbmRDdkxmNEV6UEVER1NKUXVVeUpGeHpIQ0VQRHpPWURD?=
 =?utf-8?B?WS91aTJFSFZlMzY3aWppTWoyd0x2T0NvRFFWbnlzRWZwMlVJd0RQUWlSMnNV?=
 =?utf-8?B?TTZocEtucEFpaUxyWFYyQlhMbW9NU0RLYUNGVEdkbHFMQ1RyWXlpa2Q3eFZD?=
 =?utf-8?B?Q29kUmwzK1VXdTkvb1VDQ3RuZ2IzMTkvOEZhYlRqbWlLNlhzRHJDNFU2Q0JK?=
 =?utf-8?B?Rk5UdkNENDA4RHczMGdETmdta2RrTGMwT2VXL3R6N1puQ0VscFdubnVwcUNY?=
 =?utf-8?B?aHdFYm5wVnRoamU3N01oN1F5UHNyYXlFQVpVTXRMMTgyZzdXUEM1WGxFUGlI?=
 =?utf-8?B?SVZzODBUSm1GMUFnOVM0aFFncTc5a3F1THhLSjJhVzRVNEJsWkFnTkRSQzFN?=
 =?utf-8?B?eHlzWlltKzd2U2NXSXpPNGpRWERXQ0VDbVY1UHdUeEZJNjBRdGJIUXFUNVp6?=
 =?utf-8?B?cjlTalRvQU5CSGJwWVhSajhWRjVzK0h4RVJ4ajR0QmxuVEZlNkgwaU5XMklt?=
 =?utf-8?B?c1MycXdiWG1YSnFVT2RlaWVua2oybllNaVRRYWlWTEtDek9qenZUWENPOEFa?=
 =?utf-8?B?bWRLc0tZeDIrWCs5NDNTaFplTUZMS0VQVWVISTNzTkdHbDJBQVU5K2d5cFpw?=
 =?utf-8?B?a0hQTjZlemdZU0kyUk9hRnM1d0Rna1cxN3FHSnh4dm5GSzQ5d0h0cnhaUkd2?=
 =?utf-8?B?c3pYdjlRZ3pTNzZyMDdFTVVjTDR0eGxwek8yRGY0TFVHb0toT1VzV2owVjJh?=
 =?utf-8?B?T1NnUkV3dEtGU2NkdmdndnNmVDFiWStKcUdzK0VBYTVYTVI3dUNyd1BBNU5o?=
 =?utf-8?B?cWhBMW5MR1hOQ0llZStVZlc3bk1ITHVva3RBdkVmbXJ0KzFHNnZHTyswVEdk?=
 =?utf-8?B?YmlmR29tUGN4Nkl3aUNicHJicG8rQ1FFSllYWHBFaFYwNUQ2cHEyZDlLbmxS?=
 =?utf-8?B?Q3BORWVMWkFNWTZwd20zT2NMYmEvcGpaN2gxaWVRRGpnb1B0em9OR1lJWERK?=
 =?utf-8?B?VGYwQmVkVnlSN2w0ekJ1eVYrS2V5VEFQa3Z1WkI3L0syUkxQT1RpaCtxQXZn?=
 =?utf-8?B?QnFyUEpVTldvOUdnMjNKeE5lVmxJTkRPYzl5eU1TTkJrblZ5QU4vaXRUbXVM?=
 =?utf-8?B?aTNFY1ZxRmFoQU5oWVpBVW5UclFsNlpxZjdSUkpqb0RMLytKM3FTTWNJVzA0?=
 =?utf-8?B?QWVpdkxPVW9SakNWeXVycmJzbWVPa25TZjhnR2ExeHIzNSt5RUNacTVueGND?=
 =?utf-8?B?dmZTWVRMK2R3d0sreFNIVnQ4cnNJcnEwRGpZWnBLRUxJdW4wb2UxbyszV1ll?=
 =?utf-8?B?WnQ1MUtUTkF0RHMzN0xuUjQyS0ZoUnNQQ2tkSzBlSXBId1gxV1l6VFBMTVVx?=
 =?utf-8?B?eWdibFBDVFdBd0FQdkVISWpHdzhTWEJKZGUzMXRaRENOekpPWXpXdm42TmNH?=
 =?utf-8?B?NG9ucjRYcHh0ZkZ4Ti9jeVVHMExiempnd0ZYODljWmcxbE5xQ0ZMVmFuY0JH?=
 =?utf-8?B?WHlvTTN1NXV0V2FPSytQVnlLZUMvdHFlOTdFSS9ZNitvbndvOUgzbWR5bkpw?=
 =?utf-8?B?R29mVERVK0VxS1ZnZTBPby9iZmRkaXA1V2hNWGYvSDdpWjJHZE4vV3liWlh4?=
 =?utf-8?B?VGJwUytnSTJ0QVUzZktXakJYRmVqdkhJekZaSi9HZG9Gb1ZSLyt2MVpYZkQz?=
 =?utf-8?B?eHdxdjhOMkxjeFRNK0pZZHVld3h5aVhrS0VLSHJQRmxiVUt6ZEVRT0tBckN4?=
 =?utf-8?B?amk2SWE2TFAvSm83RzVjOTdXcXBVaUpQRE8vVDdydkNYQWMzNVFQcG5pS2Fs?=
 =?utf-8?B?TVA1ck1zcXdtQThGNkRveStJaWhMR3dnODQzaDNNb2dHRmlockdtQWRSYkxQ?=
 =?utf-8?B?VEFUaTdwSG5rRFBmUHU3d3hQUXF6QUhMV2ttYks2eUJLR0tSZi9DVXViUTJ5?=
 =?utf-8?B?TEdYOHUzL1pvUTJMSENXeDVnUHBBbG9VLzd0V0d6dStJelZNdlJCazBJaG4y?=
 =?utf-8?B?eEtObkkvVUkvOCtwT3RSVlFjRmdrbGJ0ZElhS2U0U2o4VTF1WUhJckRmckdk?=
 =?utf-8?B?dWkvTGJ0OGdqSGxZZmFJQ2l5S3BhcVhUQTBZeVB6NThDeTVpdkZKbVdRRkFK?=
 =?utf-8?B?Ui90VnY1eGk4TzNzaXRLcUZnaW91b0F5cmdiYXhyOFZEY09pTFQ0R1ROV3Vt?=
 =?utf-8?Q?gRpabQd8r7RWOBROvgg/jZU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 946fa8cf-c567-4269-cc79-08d9e0100359
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 14:36:03.2606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRyHDN9OKHTLW4s9+mB2gQlB40JxaFuu1hjolKpcWIe5g2xPkK12bH5ZFvXQAyHlprcnC1dsvLjyVRMtiGVVzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3109
X-OriginatorOrg: citrix.com

On Tue, Jan 25, 2022 at 03:22:25PM +0100, Jan Beulich wrote:
> We claim to support the insn, but so far the emulator has been handling
> it as a NOP.

While not ideal, the SDM mentions that "The CLDEMOTE instruction may
be ignored by hardware in certain cases and is not a guarantee.".

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> While handling x86emul_cldemote separately in hvmemul_cache_op() means
> to carry some redundant code, folding it with CLFLUSH{,OPT} / CLWB
> didn't seem very attractive either.
> 
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -23,6 +23,7 @@ $(call as-option-add,CFLAGS,CC,"xsaveopt
>  $(call as-option-add,CFLAGS,CC,"rdseed %eax",-DHAVE_AS_RDSEED)
>  $(call as-option-add,CFLAGS,CC,"clac",-DHAVE_AS_CLAC_STAC)
>  $(call as-option-add,CFLAGS,CC,"clwb (%rax)",-DHAVE_AS_CLWB)
> +$(call as-option-add,CFLAGS,CC,"cldemote (%rax)",-DHAVE_AS_CLDEMOTE)
>  $(call as-option-add,CFLAGS,CC,".equ \"x\"$$(comma)1",-DHAVE_AS_QUOTED_SYM)
>  $(call as-option-add,CFLAGS,CC,"invpcid (%rax)$$(comma)%rax",-DHAVE_AS_INVPCID)
>  $(call as-option-add,CFLAGS,CC,"movdiri %rax$$(comma)(%rax)",-DHAVE_AS_MOVDIR)
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -2351,6 +2351,28 @@ static int hvmemul_cache_op(
>           * to be sensibly used is in (virtualization unaware) firmware.
>           */
>          break;
> +
> +    case x86emul_cldemote:
> +        ASSERT(!is_x86_system_segment(seg));
> +
> +        if ( !boot_cpu_has(X86_FEATURE_CLDEMOTE) ||
> +             hvmemul_virtual_to_linear(seg, offset, 0, NULL, hvm_access_none,
> +                                       hvmemul_ctxt, &addr) != X86EMUL_OKAY )
> +            break;
> +
> +        if ( hvmemul_ctxt->seg_reg[x86_seg_ss].dpl == 3 )
> +            pfec |= PFEC_user_mode;
> +
> +        mapping = hvmemul_map_linear_addr(addr, 0, pfec, hvmemul_ctxt);

I think the emulator should map the address using the same cache
attributes as the guest, or else the result might be different than
intended?

Thanks, Roger.

