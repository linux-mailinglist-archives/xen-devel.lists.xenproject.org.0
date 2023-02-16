Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8911699601
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 14:42:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496554.767355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSeWK-0004s4-4x; Thu, 16 Feb 2023 13:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496554.767355; Thu, 16 Feb 2023 13:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSeWK-0004qN-2E; Thu, 16 Feb 2023 13:41:56 +0000
Received: by outflank-mailman (input) for mailman id 496554;
 Thu, 16 Feb 2023 13:41:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntZu=6M=citrix.com=prvs=404d376a6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSeWI-0004qD-C9
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 13:41:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa8bdbd0-adff-11ed-933c-83870f6b2ba8;
 Thu, 16 Feb 2023 14:41:52 +0100 (CET)
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 08:41:49 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5568.namprd03.prod.outlook.com (2603:10b6:a03:288::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 13:41:45 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Thu, 16 Feb 2023
 13:41:45 +0000
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
X-Inumbo-ID: aa8bdbd0-adff-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676554912;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xullL6mmEq5Zh1V0uDrUXzaBP0z22BEXpyXiGPSkOKw=;
  b=JSq1ZKBi4GmwqWbIY3JR5n00fO706ghwb0wnJ+BgQCUfIt8YnI1l1crT
   6AhaKynrrZ5JDdLWEOh8yP3X7qXh2aodHIR36OYdj/9vYJ2MArJcLUECb
   sr9AiGOT+My+Eulm6e4bMT3imroQNnb+4TNEnaWQUgGA+K6uG8O+6JuBc
   o=;
X-IronPort-RemoteIP: 104.47.58.101
X-IronPort-MID: 97221700
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:J8vxuK8PQlF66Hf+I2LEDrUDaX+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 zEXD2yBPPmOZzamc991Pt+yoEwDvpLXnd5jTQFvqC08E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmP6kV5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklNz
 sAJBBcQTyrEgvvmkKq/Rs0838k8eZyD0IM34hmMzBn/JNN/GdXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUpidABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCd1ITuTnrqYCbFu76zFJVwEHbXKBrKf+rE2BHOttD
 3ZP0397xUQ13AnxJjXnZDWyvWSWtxobV91PGsU17QiMzuzf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8rzm/JCwUJm8qfjIfQE0O5NyLiJ43pgLCSJBkCqHdpt/oH3f2y
 jODrik7jp0Si9IG0+Ow+lWvqzGhuJnPCBI07wP/X2S54wc/b4mgD7FE8nDe5PdEaYqcEF+Iu
 SFcn9DEtbhXS5aQiCaKXeMBWqmz4OqIOyHdhlgpGIQ98zOq+DioeoU4DCxCGXqF+/0sIVfBC
 HI/cysLjHOPFBNGtZNKXr8=
IronPort-HdrOrdr: A9a23:Dk7Z4aDrX5r6q8rlHemE55DYdb4zR+YMi2QD/Ep6ICYlCfBwWf
 re5cjztCWE8Ar5PUtLpTnuAtjkfZqxz+8W3WBVB8bAYOCEggqVxeNZnO/fKlTbckWUygce78
 ddmsNFebrN5DZB/KDHCcqDf+rIAuPrzEllv4jjJr5WIz1XVw==
X-IronPort-AV: E=Sophos;i="5.97,302,1669093200"; 
   d="scan'208";a="97221700"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LuKfsn9+3IphsrzVm1t4xlZQr6lD5THRNqr8cAzxjaekPNnJ2pOmcJNGKFuJ1eX5YsaIVMXhWhtw56Odx2Iw+KelInWpE21sgBFoM7svHRbAPp9x81tCaXjRdRW1WsVvpdsUrezThth9hFw1SFdKRAHsg45yDXYCiIRI9NX8uBZbeqcvnxwB4TONXGn2/JlasR3yU4XLA2H2N7XUmMhCkXJ1QFhsFef4IYGAy6eo2ifuyX0Ehg6wxsPWFwoTGvS/2kJZWkK8cmEnGunJ8+KTscTs44c9fh5u4FxQCZAUdqd+0u9/y19nPut9cLjUZeL+O4h7Npcb1G3mF2gn4JT1Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xullL6mmEq5Zh1V0uDrUXzaBP0z22BEXpyXiGPSkOKw=;
 b=BBTkPhh5hpzh0Hbcft0YG+cWBZNIaeHrORJsgpIUCaR44iXCfx1zqVIj6iATQj4Gl3Azoj34BP1EgU/Vt5Xn7x0jT/GVpM6KRmSUBR8SyXk6tnMY2tJ9iQXrmUeMbLD8jJj72Z8ocMQ5kX8rDKZ4Ol1Xw5y31SgnjTMjTTn3wtcPkj+Z1v3SM79NAwzY1PsnOhGUO8yowXSK86Bu/xbIPq7yuIQ5UieZjAN5TuGQeKZmR8uq0hpgn1HkswiagGCAqLgIUceAews1s9pcBxXZbo0orFP9hID4FbuQS3f0ypyyH+g2HmUy3nfK8HXyZPxZ/n1re9SUMPBIpnjA/cKsYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xullL6mmEq5Zh1V0uDrUXzaBP0z22BEXpyXiGPSkOKw=;
 b=sUOm8xkhTFt31RoDiTtrionf348jZnoXWB++EA9UvvWxVV0afKvXvwvHwyPvB90dtgCDXy4x83OXhUbayHMLpRVRy/OJNrPAdIHOBLm4z3H0u24sN+ALtH+Csv1vlix1IFNfT42z4MIlgSNOf3kD2aZ2kqh6buAsOnmAzye/jB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <71f28ef4-ad44-dc9b-705e-528bf239b162@citrix.com>
Date: Thu, 16 Feb 2023 13:41:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3] x86/vlapic: call vmx_vlapic_msr_changed through an
 hvm_function callback
Content-Language: en-GB
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20230213115017.902037-1-burzalodowa@gmail.com>
 <b6d1089a-f2e5-1441-2662-3f4974830586@citrix.com>
 <91601284-d648-39bc-2c8f-8e739a44a038@gmail.com>
In-Reply-To: <91601284-d648-39bc-2c8f-8e739a44a038@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0569.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5568:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d9a70bb-6fa1-4f26-0927-08db10238b66
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W4heQS+dQOTIhH90dBf0al3b3wGPzvPQygx+sVNT4FDb7YuryGwU06+Y6afpKFpWFkNt1AS6iYUgUwXcBLFH8pEzUsEkwHLf5qIndKPwVQpG0aU9sZdIb8ILH1sc/3OTStkdlN3D/LHZPgQqAYhk74yq4NOnrosYLKiUGcXYZ6GUstITWEa/b1iMnCsiKyX0yK8de1WbVTDhR7Kc1POhx5tyLF+CK+6+IXpS2V30Zd3ysYKqQkCkWHq9s6U4G+Q4TUGKu9f72LtcyUHJyy2QyJnzSQeVcEQIygRU5ezLTvZ/AIJTJytKHwrUcDNYYcRxgxCd1vw9pPQyFPD4ovMTxUx24rum4MJbtbckwxTSDDztRJZ3kh2MEKBGW/UgiY9hlEKBOsqg+BD8ZwrqEQIZ+cbr2Cv+xsVo7TJZKZu15w/46Y4eEYftpBTf/QFD92F+JtcXCjH5D8k06yk/pwispynTQHDQuV526YpifqCIEEZ0jBDhCHs9udkRFSbZfgHPCFq5SmokhOfMjPPfIjcnfn6NEkJcf7ny2430rGv+drKAqEaZpByLOrz53CVqXFLb1g/1uf4k6Df0pU1WxCwx9HSTEcrk4VPSsUjxUWOv5Ljwgb+Jt9lUsll8mny8eliMGnZd8VZHd6afn+tg5Ym2booqUhbb1vT9vM5A4M/W4rIjzheGEFcX7wGUK1RSDpQijzJx4rVivFieaQXE7arBXrS613A7L2J/WsszzN5WUnY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(451199018)(36756003)(2906002)(83380400001)(86362001)(31696002)(2616005)(82960400001)(38100700002)(66556008)(8676002)(66476007)(66946007)(54906003)(316002)(8936002)(4326008)(5660300002)(41300700001)(6506007)(6666004)(6512007)(53546011)(26005)(186003)(478600001)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVEyVVd4cXRQMTdkV043WWh2aFdqZWNxd0VDSjgxT041SHRkSml3YTMvQXk5?=
 =?utf-8?B?QU9TNnhOZFJxdWtDT2pDV29UZm1iMHNJUHdaU1EwK1hzbkZEMGFveDlvekxJ?=
 =?utf-8?B?WTVEdDJpZmNQOUdXWm9YQTNVTytlSVhnTmpZN0pWNWRxNTlVOVVYb3FGWmJ3?=
 =?utf-8?B?VExwYnpZbnFzV0ZCeTFsd2l3dnA1MHU5c1E4NzhNdXZwV1NkSnVBbnpUMXVS?=
 =?utf-8?B?aGszVEVNb3YycEJ0ZnoyVCs5ME9wcWU4Ri80eDloaklaSk50SmtjMXdickVE?=
 =?utf-8?B?dk8vMHNkUTd2aHhCcG9LdGJDN3V4OUxCM0NtT2pxR1AxbXg2UDlXaFRHbVRq?=
 =?utf-8?B?R3hGMlRWOWlHL3Q5Tko3YkRvVjJ4M3pZdTkyNFhpS1hMYXpveWQxNnBHdmJs?=
 =?utf-8?B?TGRDemUxZEtSKzNHUDdXVzRNSFptQ2ZHK3F3b2xUL2RjaU1MNkVodktCYnVF?=
 =?utf-8?B?cHpTWDN3aHpxbHJmSS93M3p6V21iS1ZHSFJkVkxYTTdIVndVSkp3MzFiSnp3?=
 =?utf-8?B?cnZwblhPQ0tabGovdm1Sd1pYc3Vlb25mbnJ3emM4THRPd2pPcVVMUk4zTDRi?=
 =?utf-8?B?MVRBQ0hGNW56QU9PcS9mR3RuT2hwYkVDcFZlS3J0UEdrbTVXbnVINzJacWFQ?=
 =?utf-8?B?UldjQTM3OUhtQVU3bTQwN0JEMm0zbmZWZVBIdE5GeWVMOGJEcVlyYkR6UHl2?=
 =?utf-8?B?anJwa2xwMG16RmZheFh1Ly9oZkxKaDY3V3ppa0g4OVFGTVJrY0M5V2hpZjFW?=
 =?utf-8?B?MTU3NU9kTk1yN3YyNEpaTXBUNDZ2SWdtL1ZEeUlZTEVXNkdMVXRTWXlWcXdO?=
 =?utf-8?B?MW9KWmdCWkRRcWZwTGdMY2RZWkJvWXJwWkE4WStVazFiMHJpNFRYbUJjQmYw?=
 =?utf-8?B?V3IzWS9IMDdueWhYTFFOSUgzQ2dsQkRPSWZVSG8zMm9ZOFp0aStHMEhpblhH?=
 =?utf-8?B?MHh0MmlzOVQzZy96djhWU2M4R0w0aW9jZEMvSFFEWkswODFVZFpwSFlQZzBG?=
 =?utf-8?B?bzdycG5laXVJMkhCQTQ0ejNVb2pBMDVNdWpqM3ArNWozcytFL0V0N2FVTldq?=
 =?utf-8?B?OXIvWHFYaXdMOUsxVW1wTUZ3dWt5QkxGLzlEWjlNTS9yKzRvYkV3SmVMWG1O?=
 =?utf-8?B?ZWJ4R21idXhFYm13dS9qRENjOXFrcUN0NDlEc1NudXdtdW5QYkt4RUtVbWk5?=
 =?utf-8?B?MHk4N25jMEM4aW9vV0xCZkFUMDNabENEM20zS2J5RCtNVXhEbFZJNUFtNCtQ?=
 =?utf-8?B?c21lTzNkQWUvSkhCSGF2NmsvbmMwR3MwNG9YcjExU0Q0UUx6ZWRZN3JseTVD?=
 =?utf-8?B?Q055bU1hbS9hNmVzVCtraUtsMjRIa0VzQjdkaHA1U0t0TUpzWFlFb1VwcWVk?=
 =?utf-8?B?b2xGYmNmV3lnNXN6YmwwNXV6SzlYOWltL1hOcGh4NFJRbldsVStrRithZGtx?=
 =?utf-8?B?NFJYbUJlKzFubmVybkRnYlRKVDVyczR1elpNMTA3dDlYWXFCVGdrKzByMk05?=
 =?utf-8?B?UHZFNTlVQ2toMjd6N1dIdzhkckNOR1lrRGN5Yytucitla1lHQXpIRjdTZDA5?=
 =?utf-8?B?cDZETlcxTU5vZENIb2ZtMnUwUUZINTNHT2pKdUo4TVBISThzcmVEWmkyM3Ay?=
 =?utf-8?B?NE1Cbi9keWd2NFlGY3Q4TEFVUXZnUTJCblRMK3NSWXVYU0YvZTd0RFIzell6?=
 =?utf-8?B?akNFQmdXVlV3TForYzlzbEtkZmJNRWh4SW84b2lRd3ZlN1E4eW5pU0FNZCtS?=
 =?utf-8?B?R2pGbkZ2dGhBTGJtT2dlRElZWll0T2pjODcyMHE2UVFOa0FzWkJ0THRIRmVK?=
 =?utf-8?B?RElybE5LTWhKalpzRDJUOVEwNHkwZVl5dnVZUlB4ckNCZkk5VjRKNGg3eFYr?=
 =?utf-8?B?Vy9mNW5scjZncUNUZUtSczFlOEJ3UGVrdUZSWkFieHFUbVJNek4rSytrVlh4?=
 =?utf-8?B?ZDZnb1ZYQ1dPeTBzandVSTFEc09rYXlrUFBUT2ZoNnBkUys1T2NySWt0KzAx?=
 =?utf-8?B?bG04TjZTTWtrc0lsbVpIcHdtbGRWQkJTTDBSSjVSVEJGWnBXb05vN1dVSTFu?=
 =?utf-8?B?VVVMTVdldS8zeHBaK29hMERMbUR1WXVGb3hiRmVGblQweWIyU2VzWXRVOGJ2?=
 =?utf-8?B?eW9US1UzNytCalRaSndPOElNeHF6c2pmbFFsYUsyUTk3c1lnYVlWekdnaTkz?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	a0YHHjqxWj17M3+t9lwCstDGxoc+h1kozQEz85QIpAnH3K9cR+Y3lhvqFNX65sVXrt/z+LiED5yszneggST/32BQBQmzM5UkO2i/+QSW1qc+OEahVe4ndwF063jiHErGmbpbOyc6SlQHL//qOEgXpb7s8+imA+PFkSkMFS6BWBDbioFfZOtlqH6mSjWEBZPLE9TX+sG1IAjjFxN8Fl5xgb6dOItkFX43Ba95Kx3M6UweFRmSUyAiP5V8P1OVNm5mH+u1FiqR08UVOAP9kyvFMowRr/JxPgegrB7Bh7nm37R0999EkCeQs/7idY2xM5U5AuxcPfxY8ZGkN9rLGRJq5fnZzBQ7fw4YNqP8cQ+2A9S51B/86H9wf1R86xGAXGezFsO9SburKOTQhfWDXJa34HE4A2I6t3rMTmABDGGMmq+Nco7NNnxxo2At1i2f+Ukw+WEIp8KO0SQ1lPss0nTjXKmVZW0ScLf4gejGBdiQewumSWvjCea6+SBEe79R2Vh26G0scys64rWuyRSgdoEm5RFluoeVcsosEZsIOUoUTcrdvlUcB5kv83C/zO3Y+93ZWs+YVK7cWFAg43c6/esni0sB5Y88H6Uk3Xy3QzLS6UPE8CEzonj3mq9EpGk5Lud68CPnuhxCa3iedEoxb86a4g5c8lzmNNX9KUduaBHPs4WZqIiKi4AvV+ra3qJCZvWIbD6J5+7PzLeiGXsoUJ4jKjpXViBFFhxPH1OQv7jlVgUqvU8l+8FEbd7Zu7GfZCFjZR+GqA2ijbQ47gRph1X3MO7w8bESUDimsfjsfhoqZE3hmnJ0F3SBhuNUTefHqM7V2Grv3sfAp1JhLvzd4lIj0Vlo8LXOuHxkEEBNyswaA1KVsK04GkvI6+X1EukFFD5g
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9a70bb-6fa1-4f26-0927-08db10238b66
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 13:41:45.4645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+XQmkouldZHng/gY8iVCQY+GfFr7y5svLm/Mq6ixNRTncF+uRIAzozeUYPfrnNSh5YDDtBvdGKW6zRYPeiet7Tvlom22u3zY5oYW2DZhL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5568

On 16/02/2023 1:36 pm, Xenia Ragiadakou wrote:
> Hi Andrew,
>
> On 2/16/23 12:28, Andrew Cooper wrote:
>> On 13/02/2023 11:50 am, Xenia Ragiadakou wrote:
>>> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>>> b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>>> index 234da4a7f4..97d6b810ec 100644
>>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>>> @@ -85,7 +85,7 @@ typedef enum {
>>>   void vmx_asm_vmexit_handler(struct cpu_user_regs);
>>>   void vmx_intr_assist(void);
>>>   void noreturn cf_check vmx_do_resume(void);
>>> -void vmx_vlapic_msr_changed(struct vcpu *v);
>>> +void cf_check vmx_vlapic_msr_changed(struct vcpu *v);
>>
>> Hi,
>>
>> I see this patch has been committed, but this public declaration should
>> deleted, and vmx_vlapic_msr_changed() made static now that it's only
>> referenced in vmx.c.
>
> It is also used in vmcs.c

Oh, so it is.  It just doesn't show up on the patch diff.

That use likely won't survive fixing the Intel APIC-V logic, but I guess
we're stuck with it for now.

Sorry for the noise.

>
>>
>> It needs a forward declaration in vmx.c because of its position relative
>> to the vmx_function_table, but that's fine - we've got plenty of other
>> examples like this.
>>
>> Could I talk you into doing an incremental fix?
>>
>> Alternatively, we could get better cleanup by forward declaring just
>> {vmx,svm}_function_table, then moving the tables to the very bottom of
>> {vmx,svm}.c at which point we can drop all the forward declarations.
>>
>> Oh top of that, I suspect we have other public function definitions
>> which can turn static, if you happen to spot any while doing this.
>
> Sure I could try to cleanup {svm,vmx}.c and the corresponding headers.

Thankyou.

~Andrew

