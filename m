Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 740FF3496B1
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 17:21:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101461.194122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPSj0-0004kp-3H; Thu, 25 Mar 2021 16:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101461.194122; Thu, 25 Mar 2021 16:20:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPSiz-0004kQ-Vu; Thu, 25 Mar 2021 16:20:45 +0000
Received: by outflank-mailman (input) for mailman id 101461;
 Thu, 25 Mar 2021 16:20:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WusM=IX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lPSiz-0004kL-4F
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 16:20:45 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54d18269-edb5-4d6f-ba11-82c744430e67;
 Thu, 25 Mar 2021 16:20:43 +0000 (UTC)
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
X-Inumbo-ID: 54d18269-edb5-4d6f-ba11-82c744430e67
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616689243;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=SRio+ouD/J/8qqd4JCo6USuG039b/y2Jr8XVxQfiXd4=;
  b=PGDP9liHpGRO90sTD3AkzxCfcKSckpuS3kVhDIdY0hpPt3rHtSP3EwLT
   RATNe5ea4dzQnfzUqdZXWWvyyfdsbUsJKDGfbVsS8JtCtJutRC+02RNIv
   sYHiT8FB+SUpcyYGMxD1PcNCZ+FxAuQDRkgJGPoW4AaR4BMR003zro/Uz
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +EndgC990oaN6A/g5OLIgePKlC3cq0Ej8hvIhB2QawnJU4eTAd2MCp1dGwm/EXuAXreXSOFQdg
 8oDFWwJfD8HcBfvszliNB/s3W2SuX9EgBTRH6Tc9q5Z/8cH7TwyOzv5WYhsDgrgRiNY/6vyj3p
 dxh7pzX82uIODoR7ywE8j5+5Cagk4RDlLXLOgmSDi3yTyizLILSVMGWAD9ujhOWDEcAllQ2pZ3
 ZmU+SEkF9JQ+1nRC7I3ZBfS+dK+AUDxyowdX+PpR8FxHfhKrBCvMCyRN8sxH/2Qs9dd60ygD8N
 8+M=
X-SBRS: 5.2
X-MesageID: 40021481
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:mWQexqpEr4gcFofSLTW+Hp4aV5v5L9V00zAX/kB9WHVpW+SFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex7h3LR+iLNwAZ6JWg76tGy0aLxz9IeK+UyFJwTS1M54kZ
 1hfa93FcHqATFB5/rSzQGkH78br+Wv37uvgY7loUtFaSFPR+Ve4xxiCgCde3cGITVuIZYiDp
 KT6o5milObCBcqR/+2DHUEQOTPzuej/P7bSCULGgI97022hS6ogYSQLzGjwhwcXzlTqI1Sk1
 TtrgqR3MSemsD+8DDw/Sv575NamNzuo+EzefCku4wuBRjHziqtbIRlcbWesD4yu/HH0idXrP
 D85y0OEu42x3TNfnykgRaF4Xie7B8er0XM5HXdoXz/rdf3TDg3YvAx+75xQ1/ixGcL+PRfuZ
 g7uF6xht5sIj7r2BnZ3ZzuUSpnk0KlyEBS6tI7vjhkfqY1LINKoZd3xjIyLL4wWBjUxaoAC+
 dUAMTV9J9tACmnRkGchGVpzdC2N05DZyuucwwHssyR5TBcgGp0+Use3NAehXcN7vsGOuF529
 g=
X-IronPort-AV: E=Sophos;i="5.81,277,1610427600"; 
   d="scan'208";a="40021481"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIkeLsnwx/l44vB8fVfYSVsAh5NVUjdWNHRdymFdCgVQEPJuTZXsToom9LMmgZcetYrFxwBwGyaImCaHW4J05lPOldp5fg2Lm8azaQNLoMhplu7hc6KqFXQ4PoNW72zugppzUR/QC8he/dWr6RWHCvYy7Dqh8IPxNIyMzZN+/GigA08ZzseGvci3v0OmHP5u/HU4amuQH1CvlgCjjWoHE0KILYS4I+goDQF986Ll3l+DpOj0ns9iaNE7hK7gMHI9ZUNCUf+o3hVNfe65E1+Ropn29BAegZLEXSmAsbmu6fjWY4cAdS0FJeFXPL6HcHgImS2B97yloR9I232vEDprTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03hxk7nGfa7YTzHZH1OqOJstaFaWx7HjGHCjOy8o4vg=;
 b=P3tjFr6XaUrHdGGp8BAMblI21y0ohBM/RrlYEymkHqHh21PeQPg2moDy/ebr9m3W5CbcmUcbrfMtIC1hH8G3kKwtZUVW3zfK4A9Lb20ret/N3OrwO2PMUL1QLvaqHjpxrjGmJX2kyJD90r0nq897CrAM+QfLjkNGgBt6kyyz69cYTmNskfZT9pc5PSB742fDFwpswgG/u/ssdtvunLGf1bzIoELfEb/JqpajV5fbcRuIYjml1EdIvdfKmMxColCtvlbZyOMPVmMcO8bVoZJI+QXjb9iBElYr+QRuBy/C3lRzjBWXj/avXZoxXB0dFL6BqybUDnMFVANv1Cof5SU/4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03hxk7nGfa7YTzHZH1OqOJstaFaWx7HjGHCjOy8o4vg=;
 b=rwugx8XvcBRJKD7SZ830gYLxlB46z4SxUvAqq33xKldRH48QtXlh0UqZ0VhjcPCTpDqLWafv4wJBbJujWE9xH16x4B0QQFD3fachn0C3JaWFgaHYbyjdJKwdPtIiK4lA3tAbuk00unKpZJfZoMXH/9H/0UNOdztX6KYhd4rZIfY=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH for-4.15] changelog: note MSR access change
Date: Thu, 25 Mar 2021 17:20:32 +0100
Message-ID: <20210325162032.81348-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0186.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::25)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9331bf25-2678-4611-4b19-08d8efa9ee93
X-MS-TrafficTypeDiagnostic: DM5PR03MB2489:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB24890C72A46101F95DD380B98F629@DM5PR03MB2489.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hPrJYDUZnzclq9s3LuzdtrcJbh09MKtaaqoyu5MbTlhgR52QO1aOPFw/FdWhiAWChM7MqRiVUpvG4qWTOyAq0lJd/my1npN7rNBdh2jw8hpXL0LYJYVvrlkCa1/s/gcHeTMZU504lQLoNVxzBiLyDQJBSCuyE7PkD+BdoRPmUiqhEnmpAYKyQkqJP9eGBf442y15JmrILsRw0SBo0xGqsNjWbQE03WA8bAmBFsikcBqhGywaBkHY9Dtluxt4RNZk13qpr03zF0alnV9edoKiID0NdoXJMCF6rXDSYGIfrH2NinHkjteeUDk8LbSe+8ZhbGlKuxhTr+/HRFBXnC1WHXJpt7vkgu9hIBtiDoNVQO1WzEc4No0HCV23phVJRG1k4UtxjSQLkkd0JehD4mQP2ldiBd6NbcBe/KAPGDZddEaxiLn1yThzMkDUvvHLf2JIP7YTGT01W3zsFvSjAOduvVfiv2AEmP73bOAAxzMoORvnoZe55kCplf4ad4xVaWO+XwWTwbmfKUhavtnC1ohxfIbAP4T0QkiWtn6CTvCwAYWT3hpt8gMGJ6m3pMF5CiezcxH+rbsggnBeHpshYFJdshE6BQfahOvD/ZXULLfhjRCwAqZ0Rkw4Wv7sxIqYIZIjKOxyVZhueadDy3ItThwNKZ62rFgo1XZUdujj9IhHNcdjrzUx9NqPLn0SY0pHiHcm1IHFJrsFmtH1Niwg4HFw1wOMB65Nnk+9DWiFapmMLzGXfBBha9kFdLbuvc0TdiovvETxOkh6hiLAHc3OM8yBy690tMARfCvR4GxGrlOPN00=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(956004)(6496006)(6666004)(6486002)(316002)(8676002)(4326008)(6916009)(8936002)(2616005)(1076003)(36756003)(478600001)(86362001)(186003)(4744005)(38100700001)(83380400001)(66476007)(66556008)(66946007)(26005)(5660300002)(2906002)(16526019)(54906003)(219803003)(207903002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YUUxRW15UllpY1pzSHNvU285R0RFY3I3WktPSjFmeVJwOWY3Z05qcW5zN2Nr?=
 =?utf-8?B?NU9uTjVCUXRXcG5PeWZPL3JwTE1JTFVNWk9EaGhYMG5vamhNbTFscjV5ZEwz?=
 =?utf-8?B?TWtDQzVUMEs1UFdWT0l4TjF6dk5uTjAzdGNMTW9yQWV0TVAvcU5tQWczcTRB?=
 =?utf-8?B?cy9oUFg0UGpXTW9xd3haNjZ2OHJ2S2FuazV4MHVRQ0dYRmNpV0ZRSnZsVEN0?=
 =?utf-8?B?N2c0NVVFWlExR3JxSFFHSHVMZm45K3VIVE9TTDZCQ3lzdnFOQnNlVkhzNFBI?=
 =?utf-8?B?cVlLNDYyQyt4RlZ0VHViRjBwTEJlRktna3JLWmVqbE9rMnBqVk95clE3djhC?=
 =?utf-8?B?NnFKUGFycEZyQ0VwWkF0QUovSUVEOUlXYXNSaDVuL3puVjJBNzZ3bmVQYlFm?=
 =?utf-8?B?Y3k4YnZ3eHN3OGJhaDJRUi93Q3k3dkhhQi9yK3B5V3FUWW9ZTWNTOVo0USsz?=
 =?utf-8?B?STNZdTN6SFdWb3dCelJ1eU9SNXU0SnNFNWJEdHlrUGlYY1BJUDQwQ29IZUJN?=
 =?utf-8?B?ZzNYZk9qcDkvMmQ4SjlvbUxYVWJ0RlQ1bG5wbWpQRXJ3d1NkN1dzQ0FONm1L?=
 =?utf-8?B?Q2VIcmtNM00va2prN04vZlFVVU92NENjdGora1A0WGFMejQ5dHZpVmh3eWdF?=
 =?utf-8?B?ZVplY2JvRUdWTzVodjhHTm55NEhXUUFWYSszbm1mRHowcHJGSlcwUXk5SVBv?=
 =?utf-8?B?TjJDRXVUZk9RdStPbVlhUE9SWi9iOGNweXFhU2lVODNwUlRRajAwbDZRL0Vj?=
 =?utf-8?B?SkhodFRTNDRZbVdTZUl3UEZ1dnBSdUpqRWtLYWN0alllRWNaOERjaTJmNnFZ?=
 =?utf-8?B?TEduVFJZOHVteDQraG84NmlMWlZDVjJHdWZ5WC9kZGlGbGRKT3V1NC9CQkJ5?=
 =?utf-8?B?SGVpa0Z3d2VUZWFuSnZMY1lQUmtqVGlKdVVWd3ZIVmJ2U0puMUVMN0h2Mksx?=
 =?utf-8?B?YjJ3dEQxUDhrZGh4TUg3ZStMOEx1a2ZTTEJuNkMxOHBzZHlVNXpyQU9RbDU4?=
 =?utf-8?B?bFRCb2JCT2JTNmVpcHp0NkQ5MEErenBqbWFqOVB3VDZXcXFOMmMvLzR1bjI3?=
 =?utf-8?B?dDUrS3dWTG10WEpKWjNkWVJSZlJlc0tFQTg0eWFmclhlVnhVSTFKZEFlMHl4?=
 =?utf-8?B?V3pHdFlhaUEvZWl5NVhBTlpsWGdobmJiKzgxME10VEJRN2MzKzNPVE1LWlk5?=
 =?utf-8?B?M2Y4QUN0RS8rRlN1YXhkd1htaXE2c211U1JvV21ZZ1dZanhFd1dRQ3NuRlNI?=
 =?utf-8?B?ejVOSklFSmJMSXc2emZ4M0tIZzAxdGlGdUk0VzJqSlhLSlAzY3BYeDdqY2JO?=
 =?utf-8?B?QlN5U1NiaU9GQVFrRnZPY3duYmNwaFRHV2hIVm4xK2xMenJYUE1EbWtsNVRm?=
 =?utf-8?B?eUVCWkcwTDZUbFltRzl2VnhJN3pxTzgxd2Fhd2xlbHIvbkozVzVuYkJvWmRi?=
 =?utf-8?B?dDFvZnRTNy9ieldPM01VempTN1lqNnB1N3IxVnJuMU5OdktVeHVDdzRHL3Zm?=
 =?utf-8?B?NlNSeFBjKzI2WUZ3NklKbEZpemh3K1FIKzMxUmVWTTVXcnUvb1BZQWZLUVNS?=
 =?utf-8?B?Tlk1aXJSYjZrOFZHWE9KWFpKOFlSVTZ2RHRSVjBPUnBoSHRqSTJrNTMrQ1Ft?=
 =?utf-8?B?bGZEUkl3dFR3NkltdURXOHpWbVdwUDA1TG9VQWxMa0c5VEVCV3hhOEY4Vmpv?=
 =?utf-8?B?TzJlM2t6dmppUmkrazJDWlYxMEc1bHZ1RG8ydVhyd0F1SXA2VTQ3ZWNPKzE5?=
 =?utf-8?Q?YFt5v7sx1LzUQereGnkv+j/AFLe+yjN03ZmI5Px?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9331bf25-2678-4611-4b19-08d8efa9ee93
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 16:20:40.5122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SfTRAGLm7O5VTpTaXndFn5aIephoEWrePR08ltBgyRa6tklJqL4xM5MFffy8jUAgh10dP3tJkeuGz6RfvqyATQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2489
X-OriginatorOrg: citrix.com

The change to deny all accesses to MSRs indexes not explicitly handled
prevents leaking unwanted data into guests.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index f76fadf8c73..d81608af4de 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - ARM IOREQ servers (device emulation etc.) (Tech Preview)
  - Renesas IPMMU-VMSA (Supported, not security supported; was Tech Preview)
  - ARM SMMUv3 (Tech Preview)
+ - Switched MSR accesses to deny by default policy.
 
 ## Removed / support downgraded
 
-- 
2.30.1


