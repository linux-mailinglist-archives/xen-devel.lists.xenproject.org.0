Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3886B36FE23
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 17:55:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120642.228205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVTf-0001al-CO; Fri, 30 Apr 2021 15:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120642.228205; Fri, 30 Apr 2021 15:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVTf-0001a1-7Y; Fri, 30 Apr 2021 15:54:51 +0000
Received: by outflank-mailman (input) for mailman id 120642;
 Fri, 30 Apr 2021 15:54:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jCGG=J3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lcVTd-0001HD-6r
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 15:54:49 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29d17a9e-6d03-4399-8ff1-4f1fadecb34e;
 Fri, 30 Apr 2021 15:54:41 +0000 (UTC)
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
X-Inumbo-ID: 29d17a9e-6d03-4399-8ff1-4f1fadecb34e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619798080;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=6KYEvnOb+R8RyMpBSvOpf5DodPRKSrhAh2PIRCR9EUU=;
  b=HjEkDUWsNx4XbkoAumS/HFtRtVXpd9oYpJKyvbgAxROOVsNWWFnrwmKl
   zktO0Rk4dX9ebSp//cHbV6Pji9c2UiTOlt5QH3/2Qt6Qni6jwIfewmvzj
   VEw5QaxJFsxyrdIdLm5ssw8mcaz0MYZ/Zo/FY/oIG0DBi75RRLAxVO+6u
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: c8XXl83P3HhuQChV5RhRl69Ri+TU+KIdATO8t100zCY/t29fDzmz5Eomlqparv7K/5B5tAVt/d
 tKA0jmQpvzHetQRq0URJbvJcujpH0GzQkpdlU3lqtBodkPZHllqN+qWV6PlGoc6aTFWJNutrDQ
 oflyXgY+AFDqylKWxheoGu5je2sWLeAbBJyxi5cPJ91uBcCrusArKMwrcCnMO7wLpfnnuIlqsR
 wK+j6XQ8ZKjSs+Tb4ngzVflzn9FjneWz/yo2DmoK9MzB9qfYyuYXSO56zktGVWIIgB+KwevOZz
 lv4=
X-SBRS: 5.1
X-MesageID: 42810498
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:qQR6t60fTFxk1sdjP4I+XwqjBTV3eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/BIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFmdJ1/Z
 xLN5JzANiYNzRHpO7n/Qi1FMshytGb8KauwdzT1WtpUBsCUcFdxi1SYzzrdXFebg9AGJY/Cd
 6g/cJBvTWtYjA6ac68C3kDUYH41qL2vbjhZgMLAANi1RmWgVqTmcLHOjW7/jNbaTNAxr8+7X
 PI+jaZ2oyPu+y2oyWsrlP7wI9RnLLau75+LeyKzvMYMzD9zjuvDb4RIYGqmBAQjKWR5E0xkN
 /Kyi1QTPhbz3/KZGm6rV/M9mDboU4TwkTvw1OZnnfvyPaRLFlRZrsj9OApByfx0EYusMpx16
 hGxQuixudqJCjNgTjn4JzwXwxq/3DE0UYKq/IZjHBUTOIlGdlshLEYlXkldKsoLWbR7YAqF/
 RWF8fM5PpaWkPyVQGpgkBfhPOrRXg9BRGAXwwrvdGUySFfmDRDw1If39F3pAZOyLsND71/o8
 jUOKVhk79DCucQcKJGHe8EBe+6EHbETx7gOH+bSG6XWp0vCjbokdra8b817OaldNgj150pgq
 nMV1teqCobZ1/uIdfm5uwJzjn9BEGGGRj9wMBX4JZ0/pfmQqDwDCGFQFcy1+O9vvQkBNHBUf
 rbAuMXP9bTaU/VXapZ1Qz3XJdfbVMEVtcOh9o9U1WS5u3RLInHsfHabebzKLLhHS1MYBK7Pl
 IzGBzIYOlQ5EGiXXH1xDLLXWn2R0D59ZVsVIjWltJjjLQlB8lpiEw4mF657saEJXlpqaotZn
 ZzJ7vhj+eerWmy9mDY0nVxNnNmfwFoyYSld0kPiR4BMkvyf7pGkc6YY3pu0HyOIQI6aM/KDg
 hFpRBS9bisJ5KdgQAuYujXc16yvj82njanXp0ckqqM6YPOYZUjFKsrX6R3CEHsDBx6mQFjrU
 9Zcw8aTkrjFjfj4J/VzqA8NaX6TZ1RkQ2rKclbpTb0rkOHv/wiQXMdQnqTS8KNuB0vQDBVn1
 V11KcajNO76HCSAFp6pN59HExHaWyRDr4DKAiefo1blormfxxKQX6QiSaXjAwyfWTW51wf71
 aRXxG8SLXuOB5wq3pY2qHl/BdPemKRc1lZR1p6vYd+fF628Epb4KuuXO6ewmGRYlwNzqUhKz
 nDeyIVOR4r7cuwzgSplDGLEmgGyp0iMvfGNqkqd6je1xqWWdS1vJBDO8UR0IduNdjovONObP
 mWfBWNKijkT8wuwA6Yqx8eSWBJgUhhtcmt/hLr7GK1hiFiRdXTJUlrXLEdLZW36XP+S/OBzZ
 V+ipYUsIKLQxLMQ+/D7ZuSSThJbi73iyqRacoDrJhPp6I8tLdpBfDgIHD1/UAC+C97Fdv+kU
 MVfb9y77/AMLJ+ZsB6QVMswnMZ0PC0aHYxugP4AuUCbUggon/SMdSO+afJo9MUczu8jTq1HV
 Ge9iFHls21JBer5Po/C6gqJ35RZ1V5wHN+/Pmaf4m4MnTmS8hzuH67OGS6arlTVeysHqgRtA
 9z55Wtk/WMfyT1nCDWsj0TGNMDz0+XBeezChmLA+hG7piTPkmNmLKj5IqLtwjMIAHLI3gwtM
 libkwfbsNKlzkkgskW60GJO9LKi3NgtUBf7zFhnkPqwa687g7gbBl7DTE=
X-IronPort-AV: E=Sophos;i="5.82,263,1613451600"; 
   d="scan'208";a="42810498"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdnJhT2J92B9GqnWddqUg69BaP7eiOvqRLUY8P8HxD8rBjL7e6vHR8YVUPB/nQiR+vqmYYarvDMIZWjnmPF21DtIT/TEqTb/hP9Zx52VncJmPAl/yX/xWErKAFm2o5wWy+SmaJC3CMC6lvTJeVUR3B+LwpAaHioW7ENmHadcRsBfSawb3az9zZ4cOAp7XcIndrtDoM59cqb4VwU8SX0N4qGLeNQPU1LDDqh2jdoyZLrt2gqLjitcRYKfnNRS/TbgtwN7FBwaZjciI35TmdNgcbSZCxpbwnvtF/MqsGijJWxEwbVhJ1hPjEh1NK3OGlcYQKfSriQCDiteyXtZYszZqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OI1adWYY6QWjkd1MdeyydMXNw87PB1TRtgvlJoP2W4k=;
 b=S+3lUaT7Gael4mYTXpOl0Pet7YyHf/HrrexAQHaFUx7mW/SAkNB1Y6318xX2Hyq/vMuFEpgFTSC5fHnJyenP5S2pREAwr30zpqkfrg8+2X/fMYwnBWTTxDdsHfj7p40YHh2otEiOdLzu0Wj5zDMKT9exElgi3eHEB+vUOj8NSxElSKXgv1NZoS1vizkOLCDRUsZ/WpLSGwpfeMCCY9vAyqyU6kyHYKgFtbemdZrbFH2xNscUhkUAMU5d7wjjRLE7tpj+VJ9cuZ60m64vCFSno6QL610lbxRjBaTa+eMFEpXmQzwyUochhK7GhLjw4/oc1hNM+PysQLhbtUhpkI40fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OI1adWYY6QWjkd1MdeyydMXNw87PB1TRtgvlJoP2W4k=;
 b=fPGU4FyzAljAgz1Q9kLHHWy7JPURE7UXwcuw9E5zeaWRcFB/YzYwNOic92ru5DhNt2NPwSwojSEjon88xHEY/ddZlV8tb3A5sp0PO587HfYfZfSdUfS+19lWHC7j8epSmZmG+ZjGSwjduGNCyIUtgQkErJwnMdOit+lYcMsNf6U=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v3 11/13] libs/guest: apply a featureset into a cpu policy
Date: Fri, 30 Apr 2021 17:52:09 +0200
Message-ID: <20210430155211.3709-12-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430155211.3709-1-roger.pau@citrix.com>
References: <20210430155211.3709-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0002.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92d9fa90-5073-409d-3659-08d90bf041e5
X-MS-TrafficTypeDiagnostic: DM5PR03MB2923:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB292314A8F0E885B99D813F268F5E9@DM5PR03MB2923.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bOY9qY+wwNnt5l7QDQcYVH0XHBAIqyU/Dx+UTXKp4G0hBuCTnRyaf/O0xTmi6KVdPCj0rZ0mjy4jBR+8kI1UeoXE5Pv2XHhUJnuyb0vhZ8B22lZbEXfdnRBCyZ0oeltCL8eEAI3Mz8e1ArNY666qqcpu2V1luxPuCXn19fZkEhAP6WHEJgsRxO/ITv1CR3XQtX6+bb79o1Bparv7qJaz6Q2M5dJk0YZIt/1qS8wMCE85IX1ui4l21rWVR9+YXOHr81hhYUUiORf/YYGAiAKPQDkila9LW9UAleOnB1aD2ITj9mQGXEUkDjQMqMq4P3LUWSyZrdRrHiOfyZlLD+D9MdFWSKhHmK6ns3SVZWX/pma/1m/10k8JjlXhGNRa67CW0oCdUqzlzUNbEJ8vMHaJGrD4s8IxC0Ap3TMqPJBjxUh7w25/bwVw4A7NASpLSMqrfqBYiTrw7qaLgKogKy0adOUwBOj+y6KJ154DM/sKJpk3/49guZ1+/S9S/WscddoubuQ1Rl6xBOlBkXm8AtsqZz0hq1AcsQsDbW7BuDsAMMOxAC1uOWxUQ28ScUbHgLWZy0IOGMukgQRRKHI6+uHPhjlez2+pMuk7LXL7OK9gDS0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(956004)(186003)(16526019)(86362001)(4326008)(8936002)(1076003)(6486002)(2906002)(5660300002)(26005)(66946007)(316002)(2616005)(38100700002)(66476007)(478600001)(83380400001)(6496006)(66556008)(6916009)(36756003)(6666004)(54906003)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WjVyeGwxNERHYTA0VGNvNlZqL2RhMXl1YzVxbXRXYzFPTDVydnlxblNTa0Rk?=
 =?utf-8?B?WmtUSHp2aEdQQWNhV25MV2d4eTlWV2d2N3orZlYwSjA5amIwZUZEM2QvdFhu?=
 =?utf-8?B?Rkt4endjYXNrU3NlVzh1ZXFPZklvNjFIUzZDN0srYmlyTmkyMzFvWUVlZjJI?=
 =?utf-8?B?d1dCQjJHamVnN29kVkJFME93b1B3ejRMUDBZenJvSlNpNHJBWnRkS21CMXp5?=
 =?utf-8?B?K1RWYjZNM1ZXd2RtTTRaeUl1SG5hcUYzVVVNby9YRWl1ZXVkMmdOSmpRM0J5?=
 =?utf-8?B?N0hCdENveVhBdk01eGdQazlyYVdLMmpzVXZ6Z0xBMlFySThtZTNVN0pKMEZH?=
 =?utf-8?B?TklQNkZvd3VybmpRWW5kUCtrK2xiMDNqU3VhY2kxZGlLcCtheGFRWTNLYjg3?=
 =?utf-8?B?WjBhNlZRdkFTUDlGOVZRcHdIaVBHZTI4NXhENTl3bEY1U1pqbm93QTRGcG54?=
 =?utf-8?B?Q2duR1NheDhMSHNtYURhNEtTb3lvTnA0UWVPV3hiK2xic050WmNBSS9rZkVk?=
 =?utf-8?B?UHFwcXZhWks1dFdTUTN0NFZROXJBS2l2YW5DeEN6cFgxYStPNUVyaldheTJV?=
 =?utf-8?B?RnZaZm5UYWZQdlRPMW1jTDRwdXBkdkFKMEl5Ync2cHIvRVpERXVqUHNINXQy?=
 =?utf-8?B?OC9KWUZDOEV5S0dFV3JMRGc1czZUejVUaVBGSHpCdmdsMFh5MHArbnBvR0dO?=
 =?utf-8?B?OHhERnlGQmxSV3pSWDBwMlRFUkR6Nk0wYmJrL2hmK05RVWw0eDg2SkF5Uk1o?=
 =?utf-8?B?VkFvSHh0c2hHc3hqb0NoMlZjVmV0VzREdHd2MlJZZFpjQ0FRMTlndm1yQ0kr?=
 =?utf-8?B?eDZVMVFzZjByQXJjU3hLc25tU0RqSXpuMExYR25saWlQWmk1RU5VN3BQT0Rq?=
 =?utf-8?B?RW9HREpaTGVwQ0h5M2wyQ2MxL1J2WEtoOCtlOWpKMTJHU1RqZjJwZEpjWFlM?=
 =?utf-8?B?WEtSNGFjaUtMdlFjSHJuS3N5eHUzWVhjdVJQRUppNktNRnJURE5CdU12NGIy?=
 =?utf-8?B?QUxkQldjVmdXTFFKV2xOZ216UDB0UE9DM2o2TW9rYVNiTlVaUzVWd0N3Z2Rv?=
 =?utf-8?B?ck1wR3VRRTRLT2ZZZVl2QndZNmh2U256YmlQam5DemZlNiszazQ1NGZKRmN5?=
 =?utf-8?B?OExpNFpIeGNWRjcrR0lRTVdoVVpqeGIxeTl4R2dVNHBSOU90bnBSTlArY1F2?=
 =?utf-8?B?M1k2K2ZRaDV3bTlYZVppNDRuQ05pVmx0aHFna3ZTLzYwZnVWY3R0RjIvSlZo?=
 =?utf-8?B?d3pUeXp4TU1BS29tSXJPT0s1ZXVQMVFGTWV6cVdLNUpBTXRraktLY3ZWTGxt?=
 =?utf-8?B?THp6bW1LT0YvS1g5TzdJS3pYY0hzemNvY2cxaXBBcjBSbWNvb1hEUk5yQUZi?=
 =?utf-8?B?NFdtSkhRU2pDaDlEeDlmNERyRnZ2ZFlWTWJkdXN2WVN6WFV0aWJpNTVNRk1n?=
 =?utf-8?B?R2Rxa0ttb2l2eHMvVUxZNW4wUEY0clg5Y0FSc09UNGhIeGVMeFBHcmtpbDRI?=
 =?utf-8?B?U21VUGVvWDM3ejh5akJtc0szeGFpTUVRazdVa2Jjam1wc3FMbVpsSVJycU8x?=
 =?utf-8?B?Q0EzNkFkdysvOGJwZDJFQTJ2Ty9Nd1ZPZUFpVkllSEY2ZDZsM2ZISTFJRlE3?=
 =?utf-8?B?SFdKY1U5UFhlNmVvN2ppOVFYc0xzQXZ4Z1FTbnJtQ000WXVISTlEY2R0SFB5?=
 =?utf-8?B?azUrL09ONXVhUytpZ2JIYytSL0d1N3FHWTc2VXp3ejVhbGhXR2t2QlEvWlB0?=
 =?utf-8?Q?lspAbA4xcG+MRHvMkl+D8O4TTRLfvctisIIIPkh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d9fa90-5073-409d-3659-08d90bf041e5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 15:54:37.6646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TwPfHngVCo3JTo1R24hiY0Io+yoWp8eamHGMG2C2+Bh5nC1hFfBJV4qXgbu9UZj8huKQjY3U/sQY6RDiM99Nig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2923
X-OriginatorOrg: citrix.com

Pull out the code from xc_cpuid_apply_policy that applies a featureset
to a cpu policy and place it on it's own standalone function that's
part of the public interface.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h         |  5 ++
 tools/libs/guest/xg_cpuid_x86.c | 95 ++++++++++++++++++++-------------
 2 files changed, 62 insertions(+), 38 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index ce0785f7654..3fef954d1d1 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2639,6 +2639,11 @@ int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t policy,
 int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
                               const struct xc_xend_cpuid *cpuid, bool hvm);
 
+/* Apply a featureset to the policy. */
+int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t policy,
+                                   const uint32_t *featureset,
+                                   unsigned int nr_features);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index d313a093af6..e2237e33709 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -477,46 +477,15 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 
     if ( featureset )
     {
-        uint32_t disabled_features[FEATURESET_NR_ENTRIES],
-            feat[FEATURESET_NR_ENTRIES] = {};
-        static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
-        unsigned int i, b;
-
-        /*
-         * The user supplied featureset may be shorter or longer than
-         * FEATURESET_NR_ENTRIES.  Shorter is fine, and we will zero-extend.
-         * Longer is fine, so long as it only padded with zeros.
-         */
-        unsigned int user_len = min(FEATURESET_NR_ENTRIES + 0u, nr_features);
-
-        /* Check for truncated set bits. */
-        rc = -EOPNOTSUPP;
-        for ( i = user_len; i < nr_features; ++i )
-            if ( featureset[i] != 0 )
-                goto out;
-
-        memcpy(feat, featureset, sizeof(*featureset) * user_len);
-
-        /* Disable deep dependencies of disabled features. */
-        for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
-            disabled_features[i] = ~feat[i] & deep_features[i];
-
-        for ( b = 0; b < sizeof(disabled_features) * CHAR_BIT; ++b )
+        policy.cpuid = *p;
+        rc = xc_cpu_policy_apply_featureset(xch, &policy, featureset,
+                                            nr_features);
+        if ( rc )
         {
-            const uint32_t *dfs;
-
-            if ( !test_bit(b, disabled_features) ||
-                 !(dfs = x86_cpuid_lookup_deep_deps(b)) )
-                continue;
-
-            for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
-            {
-                feat[i] &= ~dfs[i];
-                disabled_features[i] &= ~dfs[i];
-            }
+            ERROR("Failed to apply featureset to policy");
+            goto out;
         }
-
-        cpuid_featureset_to_policy(feat, p);
+        *p = policy.cpuid;
     }
     else
     {
@@ -1108,3 +1077,53 @@ int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t policy,
 
     return 0;
 }
+
+int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t policy,
+                                   const uint32_t *featureset,
+                                   unsigned int nr_features)
+{
+    uint32_t disabled_features[FEATURESET_NR_ENTRIES],
+        feat[FEATURESET_NR_ENTRIES] = {};
+    static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
+    unsigned int i, b;
+
+    /*
+     * The user supplied featureset may be shorter or longer than
+     * FEATURESET_NR_ENTRIES.  Shorter is fine, and we will zero-extend.
+     * Longer is fine, so long as it only padded with zeros.
+     */
+    unsigned int user_len = min(FEATURESET_NR_ENTRIES + 0u, nr_features);
+
+    /* Check for truncated set bits. */
+    for ( i = user_len; i < nr_features; ++i )
+        if ( featureset[i] != 0 )
+        {
+            errno = EOPNOTSUPP;
+            return -1;
+        }
+
+    memcpy(feat, featureset, sizeof(*featureset) * user_len);
+
+    /* Disable deep dependencies of disabled features. */
+    for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
+        disabled_features[i] = ~feat[i] & deep_features[i];
+
+    for ( b = 0; b < sizeof(disabled_features) * CHAR_BIT; ++b )
+    {
+        const uint32_t *dfs;
+
+        if ( !test_bit(b, disabled_features) ||
+             !(dfs = x86_cpuid_lookup_deep_deps(b)) )
+            continue;
+
+        for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
+        {
+            feat[i] &= ~dfs[i];
+            disabled_features[i] &= ~dfs[i];
+        }
+    }
+
+    cpuid_featureset_to_policy(feat, &policy->cpuid);
+
+    return 0;
+}
-- 
2.31.1


