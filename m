Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AADE4377DA
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 15:26:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215088.374052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mduYH-0004fO-Cb; Fri, 22 Oct 2021 13:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215088.374052; Fri, 22 Oct 2021 13:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mduYH-0004dR-9Z; Fri, 22 Oct 2021 13:25:41 +0000
Received: by outflank-mailman (input) for mailman id 215088;
 Fri, 22 Oct 2021 13:25:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fDp0=PK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mduYG-0004dL-8w
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 13:25:40 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8bf2a96c-333b-11ec-83bd-12813bfff9fa;
 Fri, 22 Oct 2021 13:25:39 +0000 (UTC)
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
X-Inumbo-ID: 8bf2a96c-333b-11ec-83bd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634909138;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=3OhnVogEZ9DREjff4q/jbUTUQC22RXlS8PJxdLEABVA=;
  b=ePje5r9yhTtX+ezaTEWuKvNQ3qwSWQ1TI4cFbIJxD/JqZiQkXVia94Rh
   OaAMPFhjhaZy3Ggvp2+9Y+c0IBrsVdCJ4yOM7xmFTuWpmKzw6cFiVk0B1
   lA9cEJt2wGQOWE8n1nU776u7ntYazl/b3gioJ7PtU1SYIV6OhPypXgyw4
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: BYHZkNO79BEQs5tsZgV5nLF06L1CvqoC/I39Dnm+1k9GlnyJY8fFX9GF/Pz0d6BRg3XB/e11nI
 s59K8UAewWadZkxUFBMDpO/QikOPUEkw5d49NSxaTPrkjEMNwVcK3ES4rB2gbpc6i6FJpZi9lG
 8oucgKMkRoAiSO+CfhT/Ibqw3yAK3pJIw7oirJkN4ftGz9faoO1ZzMHU/7IQ7/KveX9iTO15+K
 GUfr1bZFxduHSOSANLK0ZuSXhrEDlF4q9pD3dbajGV9hkIrHUrL69HJ7MbP8YjrfbuP6LW3SLS
 CpMQSoAPvaggRK+joJQxUJoF
X-SBRS: 5.1
X-MesageID: 56220844
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:cIvE66AVNV5YqBVW//Lkw5YqxClBgxIJ4kV8jS/XYbTApDsmhDADz
 DMaCDzSMv7YYjH8Ko13b4myoUgBuZ7Rztc3QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX5500g7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/qgqWtMsvy
 o906J3hcQM0N4TQwuI2ekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHvuQv4cIgGtYasZmTanue
 pUrYjxVSwmRex1GBhBNFs4Pg7L97pX4W2IB8w/EzUYt2EDMyCRh3b6rN8DaEvSaSMMQkkuGq
 2bu+2XiHgpcJNGZ0SCC8H+nmqnIhyyTcIAYGaC89/VqqEaO3WFVAxoTPWZXutHg1BT4AYgGb
 RVJpGx+9sDe6XBHUPHcYAKTuyCG5CdBWotoF/AzwR3XzIH9tlPx6nc/chZNb9kvtckTTDMs1
 0OUk96BOQGDoIF5WlrGqe/K9WLa1Tw9aDZYP3ddHFRtD8zL+dlr1nryosBf/LlZZzEfMQr7x
 CyWt2AAjrEXgN9jO06TrA2f3WzESnQkSGcICuTrsoCNslwRiG2NPdXABb3nARBodtrxor6p5
 yBspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD4IdAMuW4ufBw0Y67onAMFh
 meJ5Wu9A7cIZBOXgVJfOdrtW6zGM4CwfTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ7l0gWmDKILbimnkvP7FZrTCPMIVvzGADVNb5RAWLtiFi9z
 uuzwOPTmkwBCrWnP3GLmWPRRHhTRUUG6VnNg5U/XsaIIxZ8GXFnDPnUwLg7fJdikbgTneDNl
 kxRkGcBoLYmrXGYewiMdF55b7bjAcR2oX4hZHR+Nle0wXkzJ42o6f5HJZcweLAm8s1lzOJ1E
 KZZK5nRXKwXR2SV4SkZYLn8sJdmKEahizWRMnf3ezM4ZZNhGVDEo4e2Ygv1+SASJSOrrs9i8
 aa43wbWTMNbFQRvBcrbcty1yFa1sSRPke5+RRKQcNJSZF/t4M5hLCmo1q07JMQFKBPiwDqG1
 lnJXUdE9LeV+4JsqYvHn6GJqYutAtBSJEsCEjmJ96uyOAnb4nGnnd1KXtGXcG2PT2jz4qijO
 7lYlqmuLP0dkV9WmINgCLI3n7km7t7iqrIGnARpGHLHMwaiBr96eyTU2MBOsutGx6NDuBvwU
 UWKo4EINbKMMcLjMVgQOAt6MbjTiaBKwmHfvaYvPUH3xC5r577WA0xdMi6FhDFZMLYoYpgux
 v0suZJO5gGy4vbw3g1qUsyAG7ywE0E9
IronPort-HdrOrdr: A9a23:blyIT6kKrNSHzwuLsdZ73jISURfpDfPIimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdeEYbmIK8/oSgjPIaurIqePvmMvD5Za8vgZQpENRGtldBm9Ce3mm+yZNNW977PQCZf
 6hDp0tnUvdRZ1bVLXxOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mJryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idhrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT1/DRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amHazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCS2B9vSyLbU5nlhBgt/DT1NU5DXCtuA3Jy9vB96gIm3UyQlCAjtYkidnRpzuNLd3AL3Z
 WBDk1SrsA8ciYhV9MIOA4we7rGNoXze2O/DIuzGyWvKEhVAQOEl3bIiI9Fkd1CPqZ4i6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.87,172,1631592000"; 
   d="scan'208";a="56220844"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoFRsktqz50/DNmkdtfsrVtiYEHFANjs80TLHkQUl9Oz7Ou1bf9KAAUOv+wAfZ26bPPIj2+ti0TktjJB45TrXAjy8Jukk86q2tDrxm6V1Pdn8mt1NoEWdb9PWuDXaC7pdTeFjWpqNTuoJb5d23h4Vaaz8ZUuTn/NWg6XHtPo/C2aTXfyPwRNBt9JH/099v/OWAx3JWpnS7+7BkJVFNWus7MYyoqIcLDperqGVAdJVmnv1moAsSWFyGWR60sI6wWUu9xJ2p5XqkwrE7qFt/UeABjIQZsDtWBIeuy0782qBFEwiPk8OJ6eg6x8I0LutF1nJH50783xD5AIUjseGW+kWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OhnVogEZ9DREjff4q/jbUTUQC22RXlS8PJxdLEABVA=;
 b=SmXT65/TmQZV2EcUWp2WQS3KxSm3BLQyIt8zK4SpL3nqYvJLNrTIyL7mi0K82noNjFc8acGT5RQOal7HK/CjzXZoTXcnLKMiF2Y0fYSE7aS4w2ivuqaW9xsJpIbZFeeeeGk6FTymkpGvhPzbLZTmi9bFRILSF4jq0LxHc3M3itCEhp2T2E2dpFmtp9/ci41ZxXpmYw4F7B/ln32fjqZDIJbk+0K+kVGN8jdV9zFOx/i2pu5CKafpvGCmANJ9quychzihIO6UJgoWbEZL/uJQo3qjdfVvpYn61C9cenmNl9Vv3xu9V05by8i+joUeVZ4K/fSDfPVUugkMbA2y05EpFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OhnVogEZ9DREjff4q/jbUTUQC22RXlS8PJxdLEABVA=;
 b=MJVrAQiHzCzeEJ+T6ip0IF7bmJfQT2vIJjpI3crMYF9YmjGInOQhgPk/2i83CgMEueZ0p1ioveUiXFS99zTw2T11BIgpiICFuwPa9VjQgrW7qvz8W8eneInzOQo7Z0eMh0VV1uXCAZh+pmEOXyxnwGO8waI04CStrFJL/sLN1ow=
Date: Fri, 22 Oct 2021 15:25:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
Subject: Re: [PATCH v4 6/6] x86/P2M: relax permissions of PVH Dom0's MMIO
 entries
Message-ID: <YXK7ySGvgTvN8GPR@MacBook-Air-de-Roger.local>
References: <cbdc93a6-e675-420c-f7e8-53aa407766ba@suse.com>
 <4b8c48ba-a563-d036-d4bf-f4f8bdf0efb1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4b8c48ba-a563-d036-d4bf-f4f8bdf0efb1@suse.com>
X-ClientProxiedBy: LO4P123CA0287.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f514f942-ea93-4768-d060-08d9955f6e71
X-MS-TrafficTypeDiagnostic: DM6PR03MB4218:
X-Microsoft-Antispam-PRVS: <DM6PR03MB421812288195A4AF4E20B9DE8F809@DM6PR03MB4218.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JdWKFB7+PJXGKOUMxwLKdecL8vHFbvB+HDE08q5XVdnENlzaGJ4Ij08h3yZyhdOG4r6Y9TH7Y41l+5wOSJoZMH12Sng5150hO0bmDLb/SCq1hTEZPXHu88oUDDuok8DPI3nIHN29Mj8GU680H7OvD9NCMXL/SvKJBJgFjGPRPzqZXMhRsMlv4epvJBZO+Fp9t/UjrRLNbUIkBvqt2eKU6gtPNVlh99kLbBV1McJ2LEgupnbtBprx8YBDGjLGJ4nEi7AFC2INNHnQWx1okk/OL7FbXoglgJQY20ORXUDLYHkhrddFzpUfgPlf+ESYA6i1GioIAHKarD7Fmx9himZKdTGPiWQjECj1K0TjOtDRXqxiUp1LtLvrhHMBkqmV2cx2fwMZeCUSYV9OX86y8FsiVW6J9vrO4GMvYR5fJ6WP3ay3tKyrmz+0tn+aQ1+a8nGN6oy0rVri8l0LhgqiScJTU/9OgyVs6RJiP7kEp7rQUsg793IL3b/mAHtydiYCYKVLgNdMtncnGUnAmICxavrHZABo4Ri308EK52FErLK7CBDcKAKuDxzte1iQOTPUPqLGWzwpc3hSm+qirYr2R+psbm0aAoAwqRk6gsRouQpkyZDCaYgf94qc/dzOU5/nYNaszXqz/WNQ3DnfKN9iZnBWpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(316002)(5660300002)(82960400001)(6916009)(8936002)(6496006)(86362001)(83380400001)(508600001)(8676002)(26005)(85182001)(66946007)(66476007)(66556008)(4744005)(6666004)(186003)(9686003)(4326008)(956004)(107886003)(54906003)(6486002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0dEZm5TSmh1M1NBSGlvN3oxS2Mwalg4QSs3YkZ0SkFKTkFVNm1LRSsvWk9P?=
 =?utf-8?B?ZUVlcjlURGd0TTNOUGtBczFMVFMyQUNMakFUbmh4UDZlYnRqYldOT1dZdFJa?=
 =?utf-8?B?dHNqSWY0TksvVjBRSGhaWUNoa2V0Z1g3TnR1VUFQdXpyNG1vUFVaVFUrM1JC?=
 =?utf-8?B?RlRxSHBwdDAwbVNxemNVZDBRNWpEV2dWQlJvK3BtTGQrR3hvYjJLTnpHeDha?=
 =?utf-8?B?NTkzYks1UDV2T2lKWjN6L2lkdVdHbldNN1hOUjJKZUwyOUZtOUxaOG5YMWJT?=
 =?utf-8?B?V2JqUGVmelQxMnBkK2xoQVNrNFdpcUc3cUVKTnJpYW5vdzZMWjFBNTBIblEw?=
 =?utf-8?B?a296SjRSSG10RzZMc1JKamh4dUlwNytQc0FQSXdoaVNDMkZVVWNuRldDTkNW?=
 =?utf-8?B?c2pQck9jaCtKeXdwOWhLblVzSlgyQS9UeGdyMDVmdkg3NlJERmJiM1VNeE5Y?=
 =?utf-8?B?aVB1UzYxbFUybzhaVnpvbjBGWjE2a2lEeWlySkdYRDRiR1Q1S3N0SnBLUkdu?=
 =?utf-8?B?RlZFcnc3TG9qN2o2bkxib1lEeGVjWXN5aDM0ZGN1anVLbUkwZWloc1ljWm1Y?=
 =?utf-8?B?OGVQQnpLY21IZFZUemxLNlNmV2RRYk9EWUYrV3VIUmwxcUJ1MzdGdCtvWEZn?=
 =?utf-8?B?MXRGY3UvRE1CUC9md2hKQ05oOE5Zblp0YmZFVG9sc252Qkl4QjhZT09Ibktp?=
 =?utf-8?B?Sk9oRXFUU2dOMS9ucHVHQ1JSdEs3bTFxMVAxU1dXcU5tY3ZJUW1CZWFLbFdx?=
 =?utf-8?B?Q3dGRHk5dFEwZXgwS3BwcjAveUt2MFZ4c3pOUDdTRGxhb0VZczRET1hOQ3R2?=
 =?utf-8?B?UHlNRFQ0WGVVekd1c0s5RlM3SWtnaDNGZUppM1RWSU84bjJ1bnBUbVhWdmsv?=
 =?utf-8?B?aDFpc2pFeTdMM3hqQTBCbk9WRytCNW1rcVlVbDg0bDRmY2QrN2NHTkdwU0xY?=
 =?utf-8?B?VU5oY1BRR25JamdCeEJIeC9sZXRWU0ZmV0llcDlGV1FmLzcwSzNtMWg2dGRU?=
 =?utf-8?B?cHkwTFlYUUpnVjZkY2JjZHNUdnBDVms5V3Y2Y3NJSmxqWStkcjlQSFhkSzdX?=
 =?utf-8?B?VkQwV2U5SC96OWVBd0RWQ3hyTGxsVEpYUzNNamJQS0tGQ25oYzdSdFN0M20w?=
 =?utf-8?B?U1I1Q0dEazJEQWxEQ01icVNBcndGRlBzREtIdGxYd0lKdVh5MC9RN202RnZ2?=
 =?utf-8?B?SVpkQUM1bkthTUYyeFkzbjh3QkVVSnZsaW42bXJwUnBka0E0aTcyR2M0M1hQ?=
 =?utf-8?B?cGJhK3YybHlPWkNxNEM3dm1sNVA4WjcvNmhWdFV1cEdVTVJPRXBkcDVIWXNm?=
 =?utf-8?B?UXc5aEk3Y3RpUTJPQmQ1OWNUeS9YSnVWL3VvTEc5emdYK0pRbjZUVkU4WWNi?=
 =?utf-8?B?RnVRVGdOZFNoOVl1Tk5DK3BQdFpwallMN3Nxem5vOU1JenBoR1lsZ01RcTFn?=
 =?utf-8?B?TDBjNStwLzcrSXplcENBTWZaa0d5WlJjeHhzZjgrM0M5VUdDY2l4ZW0zbkhx?=
 =?utf-8?B?TXFLdGNtUWI3MktEUTFpakhVR0FwclhTaVJjVjhudGhMV3Y5cXROblp5MlBl?=
 =?utf-8?B?WjJVajFuaDU1VGR6Q2Z6bWpmeXAzcmszV01sdE1hSDdabkdjZCtiQmdiZHlz?=
 =?utf-8?B?YllIRmo3bzdReDlTb3Z3WG5xMzJTdUxVRXhBYy9BeW5Sb3c0VlJtU1R3d3pX?=
 =?utf-8?B?aFRzeWh2L3cvekVlVG9sUGNuUFQwUFBKanBzYkVIbkhMZnFUUWtjcUNKc3JH?=
 =?utf-8?B?TVdmVHdxTUtvOFRIWGpiTmxiTHg0LytXNEprKzFZQjBROWwvbStRSjVCaW1r?=
 =?utf-8?B?b1lMWG0rTCtkdDRjZEU1ZHJiRFQyU3NYYVZ3WDFYMzhhQmNYektOVzNWTXRw?=
 =?utf-8?B?aFNNYTRxVnNSV291SzdFeEpidDlNWDZNY2JxMGpWcGJmRFZOeWVtVitsQW5s?=
 =?utf-8?Q?Kf09NacT7JE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f514f942-ea93-4768-d060-08d9955f6e71
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 13:25:35.8364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roger.pau@citrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4218
X-OriginatorOrg: citrix.com

On Wed, Sep 29, 2021 at 03:15:48PM +0200, Jan Beulich wrote:
> To become independent of the sequence of mapping operations, permit
> "access" to accumulate for Dom0, noting that there's not going to be an
> introspection agent for it which this might interfere with. While e.g.
> ideally only ROM regions would get mapped with X set, getting there is
> quite a bit of work. Plus the use of p2m_access_* here is abusive in the
> first place.

While doing this might be fine on Intel hardware, AMD hardware can
specify strict mapping access requirements from the IVMD flags, and
hence we should enforce those.

I think a better solution would be to not return error if the only
divergence between the current mapping and the requested one is the
access flag. We could log a message in that case about being unable to
change the access for the gfn.

This relies on the RMRR/IVMD regions being setup before any other MMIO
region, or else Xen would have to clear existing entries on that case.

Thanks, Roger.

