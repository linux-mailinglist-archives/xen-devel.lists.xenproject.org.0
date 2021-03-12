Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7133390E9
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 16:13:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97179.184451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKjSp-000640-Qa; Fri, 12 Mar 2021 15:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97179.184451; Fri, 12 Mar 2021 15:12:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKjSp-00063e-Mz; Fri, 12 Mar 2021 15:12:31 +0000
Received: by outflank-mailman (input) for mailman id 97179;
 Fri, 12 Mar 2021 15:12:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qc+n=IK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lKjSo-00063Z-9S
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 15:12:30 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c91658fe-70f3-424d-b9e7-13fd40dca776;
 Fri, 12 Mar 2021 15:12:29 +0000 (UTC)
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
X-Inumbo-ID: c91658fe-70f3-424d-b9e7-13fd40dca776
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615561948;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Szvwm68z069ddCDHJd9X5X0XnfwkZeFepUpGbh/uU2k=;
  b=YigOqeV8XD8LYQkxxgI9fB326Z7tpVoqYc9iOSFXmSbI7UC8/n+Rma7p
   3/mS3Ke7fCOcXzZtMdCJHwYiudMBQ7PQ22t0i2iwwmEyXd38m0NxI0NRe
   xhvHQ4OYCedPdM1Vdk16XsAxLGmKgbZ+Tk28wakhRMjsCUAIoIrAAwOBb
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jdBUaSxV4KDSvVN9ShbE4iDlU0z3LyG6iyIS54CGYGyCE0OrLsAhlHMjfEnpT6EelKDFc4NEkb
 hn6znnPQ0aBlDozTW0QECap3B0p9q/PzlC6seEZQMyn399t3jsNDKf0VpjXovOFMSxZGxKFecg
 gz+NiriHnCS0DCzLN0hsVX3WI4v/SXTHW8qhDf7cC8/CdCve411bxRlPomjjraVVG4BJXSXq2e
 alzqSLlENSAeqon+rIT1RhyQjNemEEMIT6SMw6Mf9vFaLl/U5POLmgJCAp00ce7c/t2oRHjzuA
 sXU=
X-SBRS: 5.2
X-MesageID: 39153835
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Pmldb6mTbIqaulcREzO46x9bEObpDfOBj2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN/AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 tdWoBEIpnLAVB+5PyW3CCRD8sgzN6b8KqhmOfZyDNXQRt3brx7hj0ZNi+wOCRNNW17LLA+E4
 eR4dcCgjKmd2geYMjTPAh7Y8HoodrXmJX6JSMcDxk85wWUyR+u4rj2Ex+Xty1uLw9n67Ek7G
 TDjkjF9ryu2svLtyP0+k3yy9BtmNXnwsZeH8DksKYoAxjllwrAXvUYZ5SspzYwydvfjmoCsN
 6JmBs4OtQ21nW5RBDOnTLI+y3NlAkj8GXjz1jwuwqRneXcSCghA8RMwaJ1GyGpknYIh9133K
 JV02/xjfM+Znmh7UeNkuTgbB1kmlG5pnAvi4co/htieLATdaNLqsgn9F5Vea1wbB7S0pwtE+
 VlEajnlZRrWG6dBkqp21VH/MahRTAaEBuAXyE5y7eo+gkTtnV4w0wE/dcYj3cN+bksIqM0lt
 jsA+BGkqpDQdQRar84LOAdQdGvAmiIeh7UNnmOSG6XW50vCjbokdra8b817OaldNghy4Yzoo
 3IVBd9uXQpc0zjJMWS1PRwg17waVT4eQ6o5tBV5pB/tLG5bqHsKze/RFcnlNbli+kDA+XAMs
 zDe65+MrvGFy/DCIxJ1wrxV915Mn8FSvAYvd49Rhanvt/LEIv3rebWGcyjZIbFIHIBYCfSE3
 EDVD/8KIFr9UawQEL1hxDXRjfDYUr60ZVsELXL3uQaxYQXX7c89zQ9uBCc3IWmODdCuqs5cA
 9VO7X8iJ62omGw4CLp4gxSS15gJ3cQxI+lf2JBpAcMPU+xW60Eoc+jdWdb22bCAhd+SsjRAT
 NOvlgfw9PxE7WggQQZT/63OGOTiHUe4FiQSY0Hp6GF7cD5PrQ1E4ghQ640MQnQDRR6lUJLpQ
 54GU45b36aMgmrpbSujZQSCu2aXcJ7mh2XLcldrm+ak16dq8EpTn4yRCWvTsaTvAYrS1Nv9x
 9M2p5apIDFtSekKGM5juh9GkZLcn6rDLVPCxnAWJ9ZgYnxeAZ7TX6DgBuTjx1bQButy2wiwk
 jaaQGEc/DCBVRQ/lRVyLzj/l9PemKBRE5ocXxhvYphFWPJh2Zr3YawF9iO+lrUTmFH7vAWMT
 nDbzdXGA9oytyt/DO+mTqJFxwdt98TF92YKI5mX6DY23urJoHNqLoPGOVM+o15cPr0tPUQbO
 6ZcwiJDT/xBu8zwTaJrnI9NCQckgh8rdrYnDneqESo1n82BvTfZGl8T7YAOteG8izKQe2L3J
 gRt6N9gcKAdkHKLviIxqHcY2Qddlf9oWuqQ/oprp4Rl6Qor7d3F4TaVzyN9Hwv5mRIEO7E0G
 clBIJ86/T9H6UqWeo4USdQ5EAom9SCN1FDiH28PsYOOXUWy0bGNNaI6YfSobUhAke9tBL9UG
 PvhxF1zrPgZW+/zrYUBKI7HHROZGU94Hpk+vmed4e4MnTdS8hzuH67OGS6arlTVeysHqgRtA
 9z57iz7qKqXhu9/ADbpj1gJK1St06hXMOpGQqJXcpF6cazN1jJoqyk5qeI/XvKYAr+T0QTno
 tec0MMKuxFlzk5lYUylhGIdZafmDNsr3JupRd9llDs3YC64GDUWWF+WDep/Kl+bH10KXiHjc
 PM7O6C8m/yiQI1gaX+KA==
X-IronPort-AV: E=Sophos;i="5.81,243,1610427600"; 
   d="scan'208";a="39153835"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qq7pQcKKEvuQ5De2TEsW+pKtolnf4IkLDhrdAr1f9rXNbep6AU7kIg181ysLciwBhbYVXY4WsS4FQ5+lL8HNgnZjSR2z0RqyECekGylKiOWixiW80TUuKN/OVXpweRkRniAaA8bLQMwicem6H+Ehpdr9jNBmkzDKxlifJg6t21K/QmmVhLqu4Q1fDF8L0aT50zHqrVjNtqRGHrcGQsP3z67YuXdIMsHxdY5LweuzfUo3WXIFkn1qYTs7vKUJTDpTExeBYPleLdfqnhNBCwnpWCmeC6qgNyYd7H8etvaKJYsm9m7XjSYeU6ejUeiPOdV+gBc9oIM44Q2NO2r1Wp0/gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnjvWAL84YNJo6CW6NB//XIqNn1d9e6sefYi5QjcG08=;
 b=NA6Eaa4a2C44WufLjyYF9gsb/unwYf6YHkU7r0R+6YELv9cchqu8FA65YE7JXeS6og/SzcZu8wuSLNVLpUJ+q1g5oVsOC/umnUoIxtzScJh69b6rnEWpGz+OS2wakIb0OlUZcG9LnOsvCPqa4jmaI6nUflBKWwg1y4ELa9kuWvCgLWCG+SBeBjZ/yUPq6SP8+gBa+Mkbcn13Kh760xpiZhZDVmPzsT7a3XoJKGtou56GYz2lGHG6YmLmuyiSz+AyyePhM/MiAguqLdFLAHhJ5FiIM+G2hJXIR4AdB0kTjx76WBiLRasD8muYAqxHku2KAgIiHrqoNUAhv3tb46BZhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnjvWAL84YNJo6CW6NB//XIqNn1d9e6sefYi5QjcG08=;
 b=AD6/U2HS9GxNKrF3maDuf9tvlRhu89TKC0hTVoKeCftx1zhbJoOAXKZ6MgRRmw6o0NfF+i9iUjClSMTd9NHmAGVTuWrckqn1CRPquM4SyuZnK/MBVn66cNArf/0epdEL5jCSqb66l2O4oJB8SDoJXAgtChJixuT6fRUGc12p0Wo=
Subject: Re: Working Group for Secure Boot
To: Bob Eshleman <bobbyeshleman@gmail.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, <piotr.krol@3mdeb.com>, Olivier
 Lambert <olivier.lambert@vates.fr>
References: <9280f0d0-e994-71c1-9482-63f97296acb7@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ba3d8fe4-1f24-76c1-6c9f-a80b268efb08@citrix.com>
Date: Fri, 12 Mar 2021 15:12:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <9280f0d0-e994-71c1-9482-63f97296acb7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0029.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::17)
 To BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec490510-c5d8-4812-821e-08d8e5693b0e
X-MS-TrafficTypeDiagnostic: BN9PR03MB6025:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR03MB60256CE2BD58B268A6C39690BA6F9@BN9PR03MB6025.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v3E+TyTVOMutbY80IS2P+OM/lIAJ2rBcmCrvkUeYQgzGbyq1EO4uMtqxC3WiPOLT4GE49496zitXduBhCL0aw0ZyyAzHBP+tfGLigxe/Lo9o6uaH4L3wbArQO+2XqDRdy8hCxPHMvjnSLtJwzclX+w+AijbXa/pVuu1Z8p2UVieWUrleZ4HpB4nrlTqpyzCJx0OK1xw8SlKiTmRtO8i8NF1lHaWbVW79VXym/czmx3qNQP6tPmZfDJpIOIioxQue272Ir8v59HWoWWJW642x0Gl2OFZzArz/Bf4bY/aYOBZDLjUiVsf6l9J1sWXEg2LIHO68IVvnvPOhgfsGLH5nssW0BMwdWZ3tIEf0k28cs7/JywTOQn9TDSXRk+94p6KRLAF8C9I72gPIPT/nJBKDKiXE23hivNdGx26p61PjTrbI5KojiBzX2i/pCr0YuvsUZ4NwkLOjBsjbTrNrt5hVatpc7rCn+3hFUw6vTugnPETBYykh91gRewsQWCZ8QNJavevTIGkPMs/jltyZHavht8W05pQLjhg+oMwANQ2l/R9Sl+wSKOK5ckf3mv0pK4NJPi6FAvG2kLBsgZVCpNpMs+zdPr6FbbcrwIrC7qA7PWo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(31696002)(83380400001)(186003)(16526019)(36756003)(2616005)(5660300002)(110136005)(4744005)(26005)(6486002)(54906003)(66946007)(956004)(478600001)(66476007)(16576012)(8676002)(8936002)(316002)(31686004)(53546011)(4326008)(66556008)(6666004)(86362001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Rk5kMERiQlJNQS9wVURXTnAxWTM1cXVLMkg1bnY2Rit1VDBQUTNuTjlORFBM?=
 =?utf-8?B?Y0tlaDF3bmZDOUYvcUErMnVNdnk0VXZuRVllNGZoeDRMNW9sY2dSaGluTFBm?=
 =?utf-8?B?UHdRdCs3UGtmcUpLVmU2WGs5bWtRbmlhRkdqZjFtRnJaSlJIdXpLVUVwNENo?=
 =?utf-8?B?YXhxWEpPenpXR2RRQ0tWdHdLNjNtaHV2Ri9HSGFEekhkejhraVFmVERmbGFY?=
 =?utf-8?B?cmlDMWdIcVc5Qy9aY1lDUUZCbVZRbDNpemErMmRZeitzMlJ4U1BpanVtZDVs?=
 =?utf-8?B?NFY3Vk82elQrbjBXeDEwZjhWbVFydW1ad2hjZU9QMGdnUEg2YXdHQ2ljZG9I?=
 =?utf-8?B?ZVZ6UzZYZFVkVHVpS3NzbDYxUlhSV0dUTHYxRnVMNkdFVW1xYjZVMlN3SEo1?=
 =?utf-8?B?dDBBVGRLbkJ4QXM2dGxFQk9IbVlYT3pQRHRyblRSRVlCUmVJbEZMQmt6bFlT?=
 =?utf-8?B?Ym1UclovY2YwNVVFWUxYcGJoaWUrZ1BObFo1VjRlMWlhTVl0LzRHNTNQVjZi?=
 =?utf-8?B?L2hybnRUUXpXdmxFalN2SmF6bU9JYTdGemUxMUJ5bjZaUkswOURvRW9NSlVH?=
 =?utf-8?B?MFZUZUw3Z0hNUzBSbStQeklMUmtWKzcxVHFIWGpUc2F0ckRJS0M4OXBYTGNR?=
 =?utf-8?B?bzhOVlBWTDB5T0J0Q0w1aGRweE5GQWZzMkp1NTN5T1hjYkxpeldYRHFDS2JI?=
 =?utf-8?B?L1hxR2x1MXFIWnJMRmVZc0U0VWRycXpOdGZJbHRwQTRXNm5pMElDVkJuMWZm?=
 =?utf-8?B?YjdTcUlTY0k1TjNZZlMwdTJWak1iNDhNenh3RjNxTm1mMWpHQS9DemhNT3FT?=
 =?utf-8?B?OEsvaEtSa09aV3RwYkFhcUxWd0oxQkpQSnpyY2lLZHVydHpzQVVpOHR1SHRG?=
 =?utf-8?B?ZEU5dXprcTVtNmJTWElpQ3p1QjhkMzVBdCtIUHNsS3pVM3JIU1VmR1NEZlpP?=
 =?utf-8?B?NFJYZzlEbUUxWmF1MmpBODdLdHVWUzhmRnVvREJnNGNvbTJodFNkL0lEakJa?=
 =?utf-8?B?T1lHVDhDMVRRRDkvTjRwMDRycDJzc2pubWpBZlMwTHlUWHNiaUdkeVFOL1Zu?=
 =?utf-8?B?Um1ZTmtLL2RSYkNteGZLUmFRZlhNUU5CaEdNTVhmL3h6Z3pMZFpPNHdWL2dW?=
 =?utf-8?B?YXBMcEVxZXk2RlAvRS91YTJIOU1CSUZvMkZTUzBGT2ovZVk2czBmQnN0TUJs?=
 =?utf-8?B?THZsRkZENzQ3NFZCamIwVTlScU5IbVlWNG9VZmdkRjJMZnAyL0ZMUUxDRUZy?=
 =?utf-8?B?RG0wbzI0dVRJSE5ydGQ1ZmNnSFB6THFGL0F5QmpvdkRBOG1GUG1KUDlaN01w?=
 =?utf-8?B?dGE2cTNiTDZlVzhXb0dCaVo3UUE5V3dybXNFWWJoM2krZWdBUnhheFA0c3dE?=
 =?utf-8?B?UlkrcEZFRHM5RExZMGVJQ3VsM1RPNFdtWEdUTDBOcDFNVXRJQ3JaMXdrSGVG?=
 =?utf-8?B?SURGaXZBM3UvVDdIREYveTJ6RVVDdHlDMmsyMXExOWI0M2grbjZvRjdQZkV2?=
 =?utf-8?B?ZVVuTXc2SE53UExXcG1odnBlZWRkb0Rtekt6eldGRVZLbUh2SWpldFNDeXJV?=
 =?utf-8?B?Q1IxbXRuN3E3aGJMUXl3MG9OMWpSN1JVdFJoVUlobmtLUlJ6OG41MXZ4ZjI3?=
 =?utf-8?B?WE12blNySTlIWUhlYzhRV2FhT0VjeTZEUlJ5RHFoT0R4cEpBcWZxSFZwL0Iv?=
 =?utf-8?B?UDVma3VKWlBIN1JmY1N5OXNmK0VjeERMbk5DVjMxV2s3c01odXZ2TWhya2ZC?=
 =?utf-8?Q?Fau+fIWQkjR0dSoz2Tp+LW+TnglL02CjP3G6f65?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec490510-c5d8-4812-821e-08d8e5693b0e
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 15:12:20.0657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S7qX2o/TPExoB/5z9c9lhrWoEv3dtFFQMWCP2oTQ2N3MhLuFLedsRpOOJpZIFiOUVBDnufEOtbOZekk+EZviqokCeVNM0xAWcnCuyNpUhbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6025
X-OriginatorOrg: citrix.com

On 11/03/2021 18:34, Bob Eshleman wrote:
> Hey all,
>
> We would like to start a working group for secure boot support in Xen
> to coordinate the various interested parties and set out a plan for
> the feature and its implications for the whole Xen system.
>
> The end goal is a full implementation that restricts the interfaces
> dom0 has to affect Xen, akin to Linux's lockdown LSM.  This implicates
> important parts of the ABI (e.g., /dev/xen/privcmd/) and so will
> require input from the greater community.
>
> I'm not familiar with how working groups function in the Xen project,
> so this email also opens the floor for suggestions as to how this might
> be managed.
>
> We'd love to hear from anyone interested in such a group and how the
> community as a whole feels about such an effort.

Count me in.  This is years and years overdue.

~Andrew

