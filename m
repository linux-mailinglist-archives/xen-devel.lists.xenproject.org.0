Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D45483E94
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 09:58:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253062.434047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4fe5-0002tc-Gv; Tue, 04 Jan 2022 08:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253062.434047; Tue, 04 Jan 2022 08:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4fe5-0002qs-Cz; Tue, 04 Jan 2022 08:58:17 +0000
Received: by outflank-mailman (input) for mailman id 253062;
 Tue, 04 Jan 2022 08:58:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JPIW=RU=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n4fe4-0002qm-1W
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 08:58:16 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7243106e-6d3c-11ec-9ce5-af14b9085ebd;
 Tue, 04 Jan 2022 09:58:13 +0100 (CET)
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
X-Inumbo-ID: 7243106e-6d3c-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641286694;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=SOoWQ356EQU771MnuWqNAAehX7dlLboMtDNUuskMcV4=;
  b=F9JIkbt/7SaqqYV12X01Fg/eUqEqNSG7foEvZbzeswTJ6MtxERAKYneh
   Mt0qesfAvI69V4bcUIhPeJHwR7yAwAajYt1wWJBUqCTSXjH2vdlWegnrG
   QKSXQNocnE3WoPE9/5B3CPIwCx62i6O60Xc73aNOgwcrR11OAAX6vbCg3
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HKSW5DSVJVjKlU7FZdYR+RB007vYsBn2YtsvyjOgkl9wRymFKzjHIo62oYgfQ1qyppzwllcvDR
 MgaLdNV1ZSe+WT8ZhO3TX2+a1AxUIy5oLwRA2oYvSS/AovyqSiH4q5quNeWrGjcHQOZb73jU7d
 XcE0CzFPjqxs58kkLBE/ZoR/wV3BBxE0Jiu/3O2OtM59aojRg9DjvzDFVSZVyHCmpg8Njs7On1
 pkhxNR8+0Ow6cJXqA5kr86vtBw7ub4PfOM+taZxYa4p4pXBS1HZKICY/dCJROsKPYYjL3miGcB
 9Ibg5MGy/5ZW/eJL8ROjnhLb
X-SBRS: 5.1
X-MesageID: 61246014
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HxvrH6w7xyoC+tNdFW96t+fowSrEfRIJ4+MujC+fZmUNrF6WrkVSx
 jQfWmmCb6qLYWLxKdl1aIW0p0kHu8TRz4M2SAo6qiAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wrZl2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt44s9
 cRSqa63dTskBLLJgOEXFAhhEhgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYEBhmtu3pkSdRrYT
 +4JNDAocQryWQRgJXgtFbZl28zxmFCqJlW0r3rK/PFqsgA/1jdZyLHwNPLFd9rMQt9a9m6Ho
 krW8mK/BQsVXPSdwzeY9nOnhsfUgDj2HokVEdWQ5vNsxVGe2GEXIBkXTkeg5+m0jFakXNBSI
 FBS/TAhxZXe72TyEIO7BUfh5ifZ4FhMALK8DtHW9inTl5fF/BqrAVQ4QwRebcQjvognfD0Tg
 wrhc8zSORRjt7icSHS4/7iSrC+vNSV9EVLudRPoXiNevYC9/dhbYgbnC486TfXr1oGd9STYn
 mjikcQou1kEYSfnPY2f9EuPvT+jr4OhouUdtlSOBTLNAu+UieeYi22UBbrzsacowGWxFADpU
 J04dy+2trpmMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8ifR0yb5teJWGyO
 Cc/XD+9A7cJZxOXgVJfOdrtW6zGM4C9fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ7l0gWmDKILbimnkvP7FZrTCPMIVvzGADVNb5RAWLtiFi9z
 uuzwOPWkUgCC7OnPXGMmWPRRHhTRUUG6VnNg5U/XsaIIxZ8GXFnDPnUwLg7fJdikbgTneDNl
 kxRkGcCoLYmrXGYewiMdF55b7bjAcR2oX4hZHR+Nle0wXkzJ42o6f5HJZcweLAm8s1lzOJ1E
 KZZK5nRXKwXR2SV4SkZYLn8sJdmKEahizWRMnf3ezM4ZZNhGVDEo4e2Ygv1+SASJSOrrs9i8
 aa43wbWTMNbFQRvBcrbcty1yFa1sSRPke5+RRKQcNJSZF/t4M5hLCmo1q07JMQFKBPiwDqG1
 lnJXUdE9LeV+4JsqYvHn6GJqYutAtBSJEsCEjmJ96uyOAnb4nGnnd1KXtGXcG2PT2jz4qijO
 7lYlqmuLP0dkV9WmINgCLI3n7km7t7iqrIGnARpGHLHMwaiBr96eyTU2MBOsutGx6NDuBvwU
 UWKo4EINbKMMcLjMVgQOAt6MbjTiaBKwmHfvaYvPUH3xC5r577WA0xdMi6FhDFZMLYoYpgux
 v0suZJO5gGy4vbw3g1qUsyAG7ywE0E9
IronPort-HdrOrdr: A9a23:QGPQzqxSXlufT/BONjMdKrPxtOskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjmfZr5z+8O3WB3B8beYOCGghrSEGgG1+XfKlLbak/DH4JmpM
 Jdmu1FeaHN5DtB/LfHCWuDYq8dKbC8mcjC74eurEuFDzsaE52Ihz0JdDpzeXcGIjWua6BJcK
 Z1saF81kWdkDksH4+GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 X4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRwXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqUneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpb1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY7hDc5tABOnhk3izypSKITGZAVwIv7GeDlPhiWt6UkWoJgjpHFogfD2nR87heUAotd/lq
 D5259T5cJzp/ktHNZA7dc6MLuK41P2MGDx2UKpUB3a/fI8SjrwQ6Ce2sRB2AjtQu1O8KcP
X-IronPort-AV: E=Sophos;i="5.88,260,1635220800"; 
   d="scan'208";a="61246014"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMDmDjOsqqEGCe1oy3paCei54BbmxUOmEdEPGjIWbziXsEGDRwS+cW/w9eV1INBtEV5eLaTOCERHclglVbdeY3koeLaf0nKHgHT7vLoCkNbaE2n4vLMh2FfSuHDFf+wtDC7XWaU+Pry+BorWCqyD/MowwqIzkuoFLowOhSCxGiDpTqqxEZ1chvb10F0MjJKis3pZJpTwl4pF01hpBMMStQ8i8ZP9kUBHavel/WFMfb/jRYng+2HYdpKhtHxO1Rmh+suvXK01T6vOH8reHw+zrmDaDpzobgNhpQ8//+ZpeFGTdOfzhwiKUrzyQjby2z8w4FLCioq/qVJyFKcAgltqDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4PiulLQySHBEey5EYICd2Kk4uZhn81jQFy7AseADVU=;
 b=GzaTCdEFBCmbM0c2ciJeBI8tB9DtXA7vUDHbbBey8Aaq1hFBEh/YeCOH7ic1SXIoKlV8FhABGEpe5/RY/LhMHGDtrKH6t+lhN9PHBpfWnkGK9oglI4VYdtjWijzvKO9GWCnl4/Wj4jor4XfryLWsBl5Fz5hz+TRYtYWdygp9tvXh24u2RoHEEyVuaybIs0DZzhZdLMcCS7kYgrgkw5tTkDdIWbBq4Yt267ObSygps0wVPaX9orOxzJP7Ym2oe5MAxTMBtOhh9KB6oNk7O0oRttL2FhYlo7NpsFItlui8tQXIs1DqAueVLnmmUtONBXur6V/pky9W3YwgnMRC3558mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4PiulLQySHBEey5EYICd2Kk4uZhn81jQFy7AseADVU=;
 b=BtOMgyGBQx38RFceSn3VCar8Vc+oHuzndBZUesWm1Mj7WnRP28h0hu+3U84nH4+QRB/j2HOXcJ1y6TtcR+jRo/CLJkNYgG+WGXts4jUfaAuDS7dqQuIjB85DNEp30azyt2SURW7YCIiRDioFK8yS20BUBXJ6FtACrgtPLwTKSuQ=
Date: Tue, 4 Jan 2022 09:57:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 16/18] x86: introduce helper for recording degree of
 contiguity in page tables
Message-ID: <YdQMDnfxQd3QforT@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <aab0b88b-7643-cc08-756b-0684f93be257@suse.com>
 <Ybn0LaRuFpUfcmoU@Air-de-Roger>
 <bbcbd938-170d-94dc-4fa3-49766fb2a9c3@suse.com>
 <YcCgV/o+1I0qry+q@Air-de-Roger>
 <d85733fe-2ab1-086e-15cc-e4ef68be4596@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d85733fe-2ab1-086e-15cc-e4ef68be4596@suse.com>
X-ClientProxiedBy: MR1P264CA0101.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51ee0ae0-c47c-4fcc-7bc8-08d9cf604cd4
X-MS-TrafficTypeDiagnostic: DM6PR03MB4603:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB46033A3069D6F162CB9AA0F18F4A9@DM6PR03MB4603.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F2b7GYRMm2s0NPBPbiwFM7uPRUDwh+gEzumxQpLZPypNTuE2jqZP4m8Lcck81wVQkjiWQYnbuqaQJQxziue9re6/f1VQzmaP6AV4svPqScGgMvIuyyQnfS6r6jGRiN2GtOuFv5cDPdagpGJb9Iw06Y3kUOc3pfUnO3Pdl2LyhWL+QsxsPfCU+O16mIPta4OmRbReetse4xAICYmiTFkGqnSShkzGDoP7Tnn4Ji1kNPbD5j3tvJYm2NODFay+iIdyYa6jtheYWpq7D59MXjP+wkfpjRzjetLP8t0y7vz8vN8R1pOFNuasMAO0H+xPFkN/fZ8ZBpEeTLlZcZO2rqiUpZOBIEizYGDUaUzMT7Q24xxzNmMfqU7CJpkPbpqDfOij/TEATy8gHlUJ54nTmHdI7IcDImU4bASqfEKCxno7bdEBPMO/SQ24UJmbo/6Lp/zQv2fmRlSbulc+oaGzea+IXKcOtb9DfP4lbc90KpyDQEMl11s4WJHUNwJoR/joKxGifALhDM/CqWeSS41TrQCxeR7eWWZqtTDGSg3SqCx4YKY812ul6kTMkMK1zzZXtPHVRGz7g3kvm1yoefYcTCQQX7mBFZmqcBcVTwOlJWgf1/1zM7orVu+5xF+a/y/gMODyNh69HR9XRg28VIvXh7F/8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(4326008)(6916009)(5660300002)(2906002)(82960400001)(54906003)(38100700002)(66476007)(26005)(66946007)(4744005)(85182001)(66556008)(8676002)(6486002)(6506007)(86362001)(6512007)(186003)(316002)(9686003)(8936002)(6666004)(508600001)(33716001)(53546011)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UloxQVRCNzdMWmdLbEU3U2F6QVZLeW9VNTFPVjFEL3poRUZ6dEQ0SUZaTlpK?=
 =?utf-8?B?WFQyUzkxMmh1dlhGcVlYczg3K25SUGNFL0hSQndDSG5VMWZXOFZBd0Nyek9X?=
 =?utf-8?B?VVhjenVwTXdxaWgxaXgrK25KazQ3eGJQcGV0VXRITVExc3dPOWphT0lINVFn?=
 =?utf-8?B?MlZHVHJGYnJHR2dRVC8ydjYyQ2ZmQ0xUc3BHOWR2cXVjS3NrL2NXRlQ3MzZQ?=
 =?utf-8?B?VDJnN2dIei9weWJZVFNISTN4MmJYMjYvT3NKRzdydE04Zy9sbjRPMzlTNVo5?=
 =?utf-8?B?OE9nTXBwTEtLUnBReVhwekRlQWZXUDVFWFdSK280amJkWUszazZaVVc5WUxK?=
 =?utf-8?B?VU1aVlZUem9vdjNkWXpsT1c3NUYvbFpwWjFsUCtZL0lrMHBMSGF1cVpvS0Y0?=
 =?utf-8?B?dGxqd1ZMdDMwMkwxaGVZM2xHOGNnMnVyTncxcnJTbWlZL1pTaUt1SGZuSlNX?=
 =?utf-8?B?TS8wWkJWemxVS2ZPNHEzWUN5Vkl3MEhCeHV1UFJheEdNODRYYW82TnVPWUNG?=
 =?utf-8?B?NzV5Y09YYUJFNE14ditsVHM1TnhlSFZtVDYzb0RVVjIzUjJ2TEkrdVhFandT?=
 =?utf-8?B?TUFscjhJY0RZNlJkNVVjdlptRmNpWm5QeGgvZmpSUU5zQXlsQkNEaWQ0N1Bv?=
 =?utf-8?B?eGMzanNGMzJRdEh6ZUFmUFk4NlZqT0gvandPVXpDUG9ocjJwZGw0dnF4STlr?=
 =?utf-8?B?Rko4cGZjMTFXdVpXTzNjSWNxT25pNStVYlplQXBRMlhvRDJOWTVITHJlWHVO?=
 =?utf-8?B?eGxTNElwNy9wU2ROc0tQMTZnckVZdjdWdEUvQ1kxWmZsQm84L0QrVUhHaEVj?=
 =?utf-8?B?NlhPd3dKSTZDWGpOazRQUlE5eFM2T29yUHZOaWhOeTFuN3hicGErZEJsYjVi?=
 =?utf-8?B?cnFiYjIrSjlWMUtLaWVGR0o3K0J5bFRKcXRRUVp5MGdaWmQ2QTdYVU9yazR2?=
 =?utf-8?B?YURhWlJiQ1VFbWVhbjUzUEtrYXkxM2JveVlQTXliRTBvc2JrNjB3VkFYejB3?=
 =?utf-8?B?QXFUMFBhOEdDU0lyV3hZdEFFL21FM3dLTUlGSFQ4WTFVNjVXTnZMSHhvNmw0?=
 =?utf-8?B?dGFCdTNTejJwVnVMek5ra2N1cTdncmwreHhvQUtPWDZJRUdsUGM3OHZmRW1o?=
 =?utf-8?B?cUJBWng1OHpaQU1yYkhod3NZUnRmT0ZFUXVsMzgxNE9JWUQ1dEVGdHRBTk5i?=
 =?utf-8?B?djE1dEl3NzJ0K1JOb2lGbmo5eXlkeXRsVnFYaFpxQmQ1WjlnNm50dUoybmJR?=
 =?utf-8?B?QnFJZnNwbkNiZHplZzBQV0ZNSGlGTTlkZFFUMzVGSDduUThtL2tHZEpLeWdD?=
 =?utf-8?B?dmo0bmsvYnkvT0NrajE3RGhUMlNhN09KTzhJemk2bStNNGtBU2I5QVlTSTI4?=
 =?utf-8?B?U0xwdGlNc2lYb0VxSXd6d21GaDRHM1ZSdTJzTmJJOG1qWkt6UmdBcnlJODdw?=
 =?utf-8?B?eW82em9xdDdGSGIwSnZjQ2VhT1VodXVUWjlORGRTdWx4bWk5T1ZZd3kzcnNV?=
 =?utf-8?B?VEV1bUttU0VORit2MG1CUVZKSUlEVi9mSkg2Wno3amRLN3J3d3ZrKzRvZ0RP?=
 =?utf-8?B?azRlOC9YemNWZGNIcE01WmJQZlNEeDZrNEV2WUZwZWhxYXpPbWdnbkNXd0c1?=
 =?utf-8?B?c2ZaYkQwQ2g4WGczaUo3MUM2TTczeXljYTE4ZWd5SGUyVmNCblQzQmdobDhP?=
 =?utf-8?B?eXNsSEgxMXRlbU42dGtlcnJEUWxldUVtcnFkQ004eEJ3ci9wWnd1TDAxaFhO?=
 =?utf-8?B?VTVDSFBXbUpPSXAybDNERUY2OHpxNlRrbUZGQWVHK2tKM1UzdEc0UFlORisy?=
 =?utf-8?B?ckxBRmMwcnB5U004V2VRdFRxc2tUdDg4NWVtcG9HVUdieWdYWTdoUG9RbjE2?=
 =?utf-8?B?S2Q0VWxwaDE0SEcxYjZNV3ZZYzhFQjlLbkNtNElCaTFTV0FMc01waUk4M3Bv?=
 =?utf-8?B?WmhCLzN4UEh5blB1dmxsdlhRV1BGa2NqWTM4TmV0OU8rQmIybWdvTkdramEw?=
 =?utf-8?B?WHZHcU1wTW9qWjJHV1J1bkxxMEFRMnRNSnlZRTFJbmtWRzZtUndNZDlIQ0pv?=
 =?utf-8?B?cFMrTll6RHFrTFYyenBYa3lXZ1FKKzJHY0g2ZGhUWEwxNkttS0ZMLzBvaEVM?=
 =?utf-8?B?UWZ6elhLdW1vUTVVOWF2bEJJWHZZWURGaHRwT1h5SEVaV2lNVDdZSnpVcERl?=
 =?utf-8?Q?cRDjAin02E0R+psQfcpH3YQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ee0ae0-c47c-4fcc-7bc8-08d9cf604cd4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 08:57:56.6813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8u48IFIh1cb97rjiaWYOZVag+VJzOlt1zRSj8ZEwS0wx0g3kajguTkq4fFPXAXRMPC+tIXYgLdqoVe5LsREXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4603
X-OriginatorOrg: citrix.com

On Tue, Dec 21, 2021 at 09:09:45AM +0100, Jan Beulich wrote:
> On 20.12.2021 16:25, Roger Pau Monné wrote:
> > I think it might be interesting to add some kind of unit testing to
> > this code in tools/tests. It's a standalone piece of code that could
> > be easily tested for correct functionality. Not that you should do it
> > here, in fact it might be interesting for me to do so in order to
> > better understand the code.
> 
> Actually I developed this by first having a user space app where I could
> control insertions / removals from the command line. Only once I had it
> working that way was when I converted the helper function to what's now
> in this header. But that user space app wouldn't directly lend itself to
> become an element under tools/tests/, I'm afraid.

Also, I'm curious, did you develop the algorithm yourself, or is there
some prior literature about it? I wonder how other OSes deal with this
problem if they support coalescing contiguous pages.

Thanks, Roger.

