Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 172BE43C669
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 11:25:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216781.376518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mffB4-0005Ur-2w; Wed, 27 Oct 2021 09:24:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216781.376518; Wed, 27 Oct 2021 09:24:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mffB3-0005Rn-Uh; Wed, 27 Oct 2021 09:24:57 +0000
Received: by outflank-mailman (input) for mailman id 216781;
 Wed, 27 Oct 2021 09:24:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ie0f=PP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mffB2-0005RZ-2y
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 09:24:56 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be88b84c-3707-11ec-8458-12813bfff9fa;
 Wed, 27 Oct 2021 09:24:54 +0000 (UTC)
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
X-Inumbo-ID: be88b84c-3707-11ec-8458-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635326694;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=11GGaEddtHy7gl+GmoJsuUS9EKnxMwJyj6L3b0aiG/Y=;
  b=OTwlPrut0ptmi4SZ2JWxzwC3Li8eiS53HU2BAi+7/W9jsX00G8YcHkKz
   SfyV3vj+0gOr20P2qFAHkx9heRT61sNrYRX51L+eHKRHWm55CVZHfLqA9
   LLlEZmBVKEK9XcRS1CZSU68W4T3F3tubc1nWPR1djeXTx3WyNwtResGBw
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jajpmi9XpV3kCblhCV/013KNh/NqOsrKsXCTYhNX1lvBJaxw/F/MJPZ12JoPvz2/J+2VISKQcJ
 QEkEemXCXdaReCQ4wmdJs+Zs9atIZYvzKF+EQQVZkOB70Y5mQ5DRY7R/5rTYMoWovd+02sL+3Z
 IZUhC06PsAaPPUSpDs+CqxJP6ge5Q1ndJNbo0UPVwmLAhy1QZRPyuOw2eEDktoUn21sUbyv6E3
 nqE28o5ZwX0brwkdqLBjVmn59gBqO7QxzKpWUNj7FvlDutwUbn/C7ydjb7Z3h4/tRS4A7w7LD4
 H/SiQoOJDXTNgsk+X9It31HX
X-SBRS: 5.1
X-MesageID: 56361501
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GfDF56s8Cik9ZVIGFIej1steCOfnVGZYMUV32f8akzHdYApBsoF/q
 tZmKWzQP/uNZTGgKIwkPNjn9UsGuMDSnNBmHgdvqHthEHgU+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cw24fhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplp7zsSAEXYaL2qcscTSUICX1FAZVZ0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY254VQ6+DP
 5NxhTxHMTeZaTd9AkYtV5Mcs/m5jSD6XRh7kQfAzUYwyzeKl1EguFT3C/LXcNGXQcRenm6Du
 3nLuW/+B3kyHcaDxD+y12Ojj+7Cgwv2QIsXUra/85ZCilCJ2nYaDhFQUFKhuOS4kWa3QdcZI
 EsRkgIrrKMy/UjtScPvUhmQqWSB+BUbXrJ4CeQ69QXL0avS7AaxD3IBCDVGbbQOisgyQjA70
 06TqPngDzdvrb69RGqU8/GfqjbaETgYKyoOaDEJSSMB4sL/u8cjgxTXVNFhHaWpyNrvFlnY5
 DSHrzM3gbkJuucN27+m5lDMgz+qpZ/hQxY840PcWWfNxgFkYI+oYaS45F6d6uxPRK6+SlSCp
 3ECl9Kp0PEVDZqNmSqOR80ABLisof2CNVX0mkVzFpMs8zCs/X+Lfo1K5jx6YkBzPa45lSTBO
 RGJ/1kLvdkKYSXsPfQfj5+N59oC34i8FNLbCf/uX/VPfKQhblO8wBlxTBvFt4zyq3QEnaY6M
 JadVM+jC3cGFKhqpAaLq/chPawDnX9mmzuCLXzv51H+i+DGPS/KIVsQGALWNrhR0U+SnOnCH
 z+z3eOxwBJDTPa2XCDT9YMCRbzhBSlmXc6owyC7m+jqH+aHJI3DI6OOqV/CU9Y890iwqgsu1
 ivlMqO/4AGm7UAr0S3QNhhehErHBP6TV04TMy02JkqP0HM+e4up56p3X8JpJuR9q7czl6YtF
 6RtlyC87hJnEGyvF9M1NsCVkWCfXE7z2VLm09SNOWBXk2Fcq/zhpYa/I1qHGNgmBSurr8ouy
 4BMJSuAKafvsz9KVZ6MANr2lgvZlSFExIpaAhuZSvEOKR6E2NU7dETMYgoffphkxePrnWDBi
 W57wH4w+IHwnmPC2IOW2vnU/t3wSroW84gzNzCz0Ita/BLypwKL6YRBTPyJbXbaUmb187+lf
 uJb07f3N/hvobqAm9AU/29Dwf1s6t3xiaVdywg4TnzHY07yUuFrI2Wc3NkJvapIn+cLtQyzU
 0OJ299bJbTWZ5+1TA9PfFIoPraZyPUZujjO9vBpck/00zB6oeicWkJIMhjS1CEEdOlpMJkoy
 PsKsdIN71DtkQIjN9uL13gG92mFInEafb8gs5UWXN3ihgYxkwkQap3AEC7mppqIbowUYEUtJ
 zaVgovEhqhdmRWeIyZiSyCV0LME15oUuR1MwFsTHHizm4LI1q0twRlc0TUrVQAJnB9J5P1+Z
 zpwPEpvKKTQozox3JpfX3qhEh1qDQGC/hCj0EMAkWDUQhX6VmHJK2Fha++B8FpArjBZdzlfu
 rqZ1HzkQXDhe8Sohnk+XktsqvrCS91t91KdxJD7TprdR5RqMyD4hqKOZHYTr0q1CMw8s0TLu
 O128bsicqb8LyMR//U2BoTyOW78k/xYyLiumc1cwZ4=
IronPort-HdrOrdr: A9a23:F2Btlqt+uAgRkOFdwrfsGy+O7skDjNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd0ZJhEo7q90ca7Lk80maQa3WBzB8bGYOCFghrKEGgK1+KLrwEIcxeUygc379
 YDT0ERMrzN5VgRt7eG3OG7eexQvOVuJsqT9JjjJ3QGd3AVV0l5hT0JbTpyiidNNXJ77ZxSLu
 v72uN34wCOVF4wdcqBCnwMT4H41qf2fMKPW29+O/Y/gjP+9Q+V1A==
X-IronPort-AV: E=Sophos;i="5.87,186,1631592000"; 
   d="scan'208";a="56361501"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAU1XJhJ11R8Oh1gTfhUGqgSkZQf+IyBIxpiZQWwECuKgiaIM7DyNCUDPktg+2aX8DYkzdhQYlRiFGk4kjRhQTzTNdOGgS1D85jBaw6/yrv8auPnIXsLN523680SBA3TmXitC5A4ws3Q1A7jyie5TcrqZOJ2N6Qk9PgTQdRjopj9YOBZQfdbayzG3lWpKF0lAL5Jz5f3G7mbjzOHWX2RC0DulUjxkewVODsFjcG2zLWhkhw5Hbp+fY2KHB2K/QOCeO8gXrqs4luI3cN9GVhbw1lfFF1DZ8HXISbwmKk0T9f8EToeYxteIssn/JMSqOwHPFQLc9RB7rpufqMka+GJpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=De6mRbBeaXJ5hE46PFVc15Mw24RA1tA2s9Bo9yHTTdo=;
 b=UgF5fuxfbt3B2qV2Nh40J+gDjBCeXQOQUOXo8dKbN88izl/4k0DZUg2SgTJaYXrHXXv8tN+NyWzL9558qa77a1lB9YdgYgMApAyWFQPd+e/r0ukMxQcVks5b/OxWVj8Xnojejum6jxfZTUn6tZLBbTWa+MpxEheEYZRZZ9zZBW8gjDzVDAqhbL3g1JZSQc5m/lV1V9gJ265VHTF4Q+IltxkYjedoTd02PK68ASW3RI7XoQ3J9LbAmOSSWkXB2gS/Xngpd31wacgI2+LZXAGd+zpTBSG8sMIN/HH5UAlceCA1N4y5OYOQpif4pLpy7dlO5CRLbwzWLPEM30Ab5SDkhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=De6mRbBeaXJ5hE46PFVc15Mw24RA1tA2s9Bo9yHTTdo=;
 b=rHI06oer5CH3oLzaR8LDPYKCdSljnW19OIfKWlt4yeGo62KFCKZPsEBFSC+XzsBQTchJnzvpvwCk0Bsau40sxfdr9fNTUoYl9LRLyRJqQfQwMepa3SaiKO8XbmxjcKZe/Sxy9n5oLkMTHZi5vuoioDcc89Ti8PnS16zqYgzPf24=
Date: Wed, 27 Oct 2021 11:24:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, Michal Orzel
	<michal.orzel@arm.com>
Subject: Re: [PATCH v3 01/11] vpci: Make vpci registers removal a dedicated
 function
Message-ID: <YXka3C3x2ixNyrFE@Air-de-Roger>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-2-andr2000@gmail.com>
 <YWa+4hsaOxuX4tWJ@MacBook-Air-de-Roger.local>
 <387d3729-b182-1aaf-870e-505e90141606@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <387d3729-b182-1aaf-870e-505e90141606@epam.com>
X-ClientProxiedBy: MR1P264CA0076.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcd6eb02-2c85-4fe2-2874-08d9992b9fbb
X-MS-TrafficTypeDiagnostic: DM6PR03MB4684:
X-Microsoft-Antispam-PRVS: <DM6PR03MB46840BDB8A41E54EB3C5847A8F859@DM6PR03MB4684.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mijOUz2+lApp1ZvhghCaNXcweWHdVBrAaRI/FrU3WZNU1k1BKSMj0KbdHVesnBoANXA9wiEImbtyMTfa68LlD9TwUbM05zirHCbYP0z+tzgtHNiqd9ujpCaOr+wPNcFgEq/Kz+jcdMuz/rvtEI3ZBmPC5KJXbOg70EGHyUlCSV0DdC4mfKVTDuYtbqdJEpo33DC7lxymUV929S18GtHAiMULTJa+BXA8X4I5Cod2VDLrJIB24hJ7tNU4239kuueZfC3xAUYC9ZMm3NA8aVR3RTxWi1N5QP7t+u893ZHnEhjVFuqfVh/CqF447p3MGXpjPLSuEb0EV+QCeA8wyNRlbVWfVW7KTTcJSfhPkJ+V3EAr+iCbpSd+grRVD54mdBATf2D3RlDHjd3sgBIVNQcM0sCudgwpBdGrZEQQrD5439XEbSgtAUlJYN6jYRynhalun+do2DTBai5N88Eh14lA0vJbn3R0GQagAv6IotQQ+zGVSm6JvGt2S2Y8OUPRuVzOyTpy1HNYMI8Co0ZAuu/iIxyLfc8sKF6V29exwm/DaJ7R1zZo0HV3Wkwyau4sUPBdOEfxNWL+ldUnCUlXCzFVNoRMXTFfBP2UIkUNeS5sHaZwbWMEavXvb096kZ0WqjbOoJJiBASvfmEFCV2ME70xfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(85182001)(66946007)(54906003)(6486002)(66556008)(7416002)(66476007)(9686003)(956004)(6666004)(53546011)(6496006)(316002)(83380400001)(8676002)(6916009)(2906002)(38100700002)(186003)(26005)(5660300002)(4326008)(33716001)(8936002)(82960400001)(86362001)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVREUmtMRWo2WFhtN3Nyc2JPL2ZZK0xoa1QrMGpxY2FqVG1PRjVPQWtQOWtM?=
 =?utf-8?B?T1cvNTRGSEdOam1VZ21jV2h5Slo5c1BVN01vNlQ4M0F0WHY0SzZoMnBhbGc5?=
 =?utf-8?B?RGt3bDY1Y2syV0xpL1pqYXRwdUNzR01SbUFSUGNBNDl1b0l6d0Q3Nlk5dktm?=
 =?utf-8?B?R05VZEN1K1h6UjBVRzRVV0VwS21aOWdEOUVKMitMZ3dWMXcwYndwRW44NUNs?=
 =?utf-8?B?V2VqVExjL2FvVHIrSFFLYmpZU1dmSkh3TkR3KzJWV3JDVElpdUdJSUdTNlg4?=
 =?utf-8?B?R2xXNGs4TStuRXJWMlhENExuNEJOeUt4K0ZjdmVxNS80dHlYQ0R2QzZJRzRx?=
 =?utf-8?B?QXNXdndKVFh0elN1TTdrWGdMMVFNK05ybkJiMDRlMHVPRlVZdVk5V3BpZ1RN?=
 =?utf-8?B?ZGczek5mSW1iNDFhWnh4cjQxTVZxUG5GKzY1Q29aU2lpSm5jUDhKZ2hGL21l?=
 =?utf-8?B?aVdRREhTSkQxajdaV3AyQ09BM083NW1mUExCU2RnUFU1MlJ1ZHpJa2t1YzFO?=
 =?utf-8?B?cEVmdGQxSjBWa2d6Sm9xaGJZS2FJYkVJT0ExZEprcVpsZHpZdVFiQkNueCtz?=
 =?utf-8?B?dEQ4S09SaDVSVVh5QjVNdzdHajIwalRsYXFxOUhTdmE3aGZHSkM0K0x4djVp?=
 =?utf-8?B?azZ1ME9TOUtRaHpaZTdPNnM3aEpsVGxXcitYTUNYdlM0eGlmSXlWQW9yVkg3?=
 =?utf-8?B?Mjdwa2RCdDNBZVhjZG8yNmhRMkh0anB3OGlEcS9qbVNXQi9Nc3pyUTJrN0Y1?=
 =?utf-8?B?bDBpc28xcXdZdUZxeGpSdzNqSnIvcENjcHhIQ3NBM0V5dXgwMHRWNEt0a2Nx?=
 =?utf-8?B?cUI4aHc4RUw2T0U5azdPdFg3SWc3Nk5rQ21STGJiL3lwLzhTeUg4a1lGdUF0?=
 =?utf-8?B?N0ZST21vdFh2Q3Nib2ppdGFwejZKL2lvZ0NjMUtwRkxQWncxQ1N5aUFEbE1E?=
 =?utf-8?B?SkFsRjV5Sk04dWlMTmM4SW1SWkgvZDhPdXZXNEhDSGNMM1VhVHEvMzFhYWdM?=
 =?utf-8?B?RGErV3VSVmQ3NGJBQnhMZ2ZtTStPMXBQZjBGVmZkZzBCNFVJOENETzd0cmk5?=
 =?utf-8?B?RTJJQ3V5enZ6UEpHaTlzZElOM2h5MlZOckxmT2lLMUFPY3F5alZvbU9iUW55?=
 =?utf-8?B?RE16MkFHZmE1UzE5Z2Q2VDVQaXAveUpWZlhkV3FRWW9maTBWL1pmNmtCcVVj?=
 =?utf-8?B?UmZDT0FNN3B3ZEVzNExtUHFmSlZIK3pyR05VVHg3NTBZbENGazRBeWVHN2NC?=
 =?utf-8?B?ZG02RE93MSt3NVZ1bnBoZ1ZPMHJmZmdmNGErNmk1eXlBSlNQL24wWUxLZity?=
 =?utf-8?B?eXFCbHVBWFV5aFRROWRjT3VJV1Q0MURFYVZCR3JaaU1oRWpPSnA0bys0S3lj?=
 =?utf-8?B?Q1RSNkRMTndYRUthSWc5eG4yVzl6bjhveGxINVNMSUltOFpGbTRvSDEzdFg2?=
 =?utf-8?B?eTFpdUdiZE1VenFOejJJYVZiQjErcXNHaXg2SmkxLzlyVEM0K2FMNUdDendC?=
 =?utf-8?B?TDRUUGVJaUlNOU8xdEVhQitDWFFKdm05bW5IV0RXOVh3NHZYYTRnVzZCWitX?=
 =?utf-8?B?djVuVkU4ZnNuTUZ4Zml1SmpxVnpENGp2c1ZYRkVmRXhRdnlyTUxLaWFaVExz?=
 =?utf-8?B?VWR5TExTUXp2cUpFQkxUWG9OT0pDQnluNTBjQ0wyVWZ4MnY5eFh0WmdHL1Rj?=
 =?utf-8?B?dHdvMnplZEFwRUdxS21Na1UyWVlmc2k2TmZiS2hqdTBMems4cGpDYWMyS2JG?=
 =?utf-8?B?YWJZbFRzcnIwczQxMStPL2dkZG50cGNSRXhycU1Lem0xMUVhN1RrZVpucXgv?=
 =?utf-8?B?WWhQQjFkR0w0Q043WUhPdFg1MnltOW8vOG5uUDNpaVlKa204K1BReU0rb1Fa?=
 =?utf-8?B?bW1CYmRQN1lkWEp1OFByUFVxNTBCOTZKQlNtd09oK0NCclRnaXFYc25xaDBk?=
 =?utf-8?B?NXpwaGMyRkIzVzk5bWpIYTk0Z1dTKzJvVGRuYTltdzhXMXJBQjdRM1NQOVJv?=
 =?utf-8?B?Sit1S3g4NjFBUENuRGIyRU1sMDE4YWQwR2RBdkRvam51cEluYWtOa0Vsd3Zo?=
 =?utf-8?B?MUg1UlpsWXVRbE5PeGdVR0NXT0J6M2o0NE50eHNsZ0w5NWtrRnBBM3FSUUdq?=
 =?utf-8?B?TEMzTDNQSVZxMTcreG1UaWtORldBQWZYbEFuSGRta2NtSnNhdzZqVS9PODll?=
 =?utf-8?Q?0eTNhHTqZeRq5mlbGApzb0U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd6eb02-2c85-4fe2-2874-08d9992b9fbb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 09:24:49.4382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JgMdK8p2PH/4nQE+bhmLFLhxF8/Jj/FEcYmCl0q0mPGlA4OPD8RhDJjXOVMZMiKpR2gHfSN3ATJLweHOTNNHaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4684
X-OriginatorOrg: citrix.com

On Wed, Oct 27, 2021 at 09:12:14AM +0000, Oleksandr Andrushchenko wrote:
> Hi, Roger!
> 
> On 13.10.21 14:11, Roger Pau Monné wrote:
> > On Thu, Sep 30, 2021 at 10:52:13AM +0300, Oleksandr Andrushchenko wrote:
> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>
> >> This is in preparation for dynamic assignment of the vpci register
> >> handlers depending on the domain: hwdom or guest.
> >>
> >> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >> Reviewed-by: Michal Orzel <michal.orzel@arm.com>
> >> ---
> >> Since v1:
> >>   - constify struct pci_dev where possible
> >> ---
> >>   xen/drivers/vpci/vpci.c | 7 ++++++-
> >>   xen/include/xen/vpci.h  | 2 ++
> >>   2 files changed, 8 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> >> index cbd1bac7fc33..1666402d55b8 100644
> >> --- a/xen/drivers/vpci/vpci.c
> >> +++ b/xen/drivers/vpci/vpci.c
> >> @@ -35,7 +35,7 @@ extern vpci_register_init_t *const __start_vpci_array[];
> >>   extern vpci_register_init_t *const __end_vpci_array[];
> >>   #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
> >>   
> >> -void vpci_remove_device(struct pci_dev *pdev)
> >> +void vpci_remove_device_registers(const struct pci_dev *pdev)
> > Making this const is kind of misleading, as you end up modifying
> > contents of the pdev, is just that vpci data is stored as a pointer
> > inside the struct so you avoid the effects of the constification.
> Ok, I will remove const

Jan prefers the const, so please leave it.

Thanks, Roger.

