Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C1B698306
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 19:16:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496195.766812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSMJk-0006cX-S2; Wed, 15 Feb 2023 18:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496195.766812; Wed, 15 Feb 2023 18:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSMJk-0006Zg-Ow; Wed, 15 Feb 2023 18:15:44 +0000
Received: by outflank-mailman (input) for mailman id 496195;
 Wed, 15 Feb 2023 18:15:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCKc=6L=citrix.com=prvs=4036dcf8d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSMJi-0006Za-Pg
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 18:15:42 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c04313cc-ad5c-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 19:15:40 +0100 (CET)
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Feb 2023 13:15:28 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO3PR03MB6805.namprd03.prod.outlook.com (2603:10b6:303:164::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 18:15:26 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 18:15:26 +0000
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
X-Inumbo-ID: c04313cc-ad5c-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676484940;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fcG3+MKF4j2xX8JhDiHsakixBb+dxaEZQhf/v6T3iek=;
  b=VeTThIM7mjYrr8xZm0zhMAH2hT1jQmZAivZC3eHlK9CVIzpzAYa6KZGW
   3EEGFJvbEKWUr+VKJhZ2MldaRmR+Fp58FGdsjhAYJuWc5EACaEXCcwgEb
   HJpX9ffTNzAUXqrfq6WPGytwGzqkjDJbA6KNOCSsL4fd+dLjwLfj542fc
   8=;
X-IronPort-RemoteIP: 104.47.56.175
X-IronPort-MID: 96025853
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:m+ebVK0sFauqzItCM/bD5Rtwkn2cJEfYwER7XKvMYLTBsI5bpzYBz
 TQcDG2BaamJZWr1ftEgaIWxphlX75fQzNIwSQc/pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZnOKgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfW2MSr
 tUhbxw3XzOqpMSpyeywUrVWmZF2RCXrFNt3VnBI6xj8VK9jareaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvS6Kk1EZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXKlANhPRODjnhJsqACS4U4dUicQaXGyvt6drWr9WtEHI
 lNBr0LCqoB3riRHVOLVVhukoHmCr1gEVsBZCeES5wSEy66S6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hTi7IyQSIEcJbDUISgZD6N7myKkolQ7GRNtnFK+zj/X2FCv2z
 jTMqzIx74j/luYO3qS/uFvA2jSlo8GQShZvv1qKGGW48gl+eYipIZSy7kTW5upBK4DfSUSdu
 H8DmI6V6+Vm4YyxqRFhid4lRNmBj8tp+hWF6bKzN/HNLwiQxkM=
IronPort-HdrOrdr: A9a23:1voBh6p5CuRxSH2/t3Ig/WoaV5o6eYIsimQD101hICG9E/bo9P
 xG+c5xvyMc5wx9ZJheo6HjBEDtex/hHP1OgbX5X43NYOCOggLBEGgI1+rfKlPbdBEW/9QtsJ
 tdTw==
X-IronPort-AV: E=Sophos;i="5.97,300,1669093200"; 
   d="scan'208";a="96025853"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhYLawFfGyGkzHCman9Q8hxPzBhIHMQnKgZmMsBeRiDtnslmQFrd8RIXZdDbT5o+mmBN7knu7SH9iclTHgBCYkJ7/JEXpdAxoYZ/ejQHR3m0dzbRXeKvxMLXAQGBSHtYP7ZZ5CbIzqApqCXAEdnJ1aAvhDyGq9Fp9yGLMIskKETX7R0Tfj3Hz1sd4l/MjlwxTMNVyTqzc9WBYWRgVsxi0mxXj/3mTUQuX9gOU58QXy1BKWQuqmkPpMXEvafnWoDJecG7Lv0zgJk0lzv+gW25mjs828hk8uzsuvjgVh2XKNGdoF37tC4TjiDNVBWcRe1XSsbnvvAOZXdiaY1YOgQL4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGml/FRtRXc79ISGXpgod5+2YxpDDwinJNAZJ/N96xw=;
 b=mgQa2EmKOB0CCWetA/nokzi+aWrDIkO51v1BveziyFSTsqPcBa3zf4FXm9bMeTzfWIJotUNkIs8inDIzkYcQwIJ5Wju95kiWI8cextSu4h5ZNYXPNHpw+p2V3AjkVHIKdLihyjNsgN7E+Q12G5O+pN30RmAeqEy25G2Aam6KlgjWFgsShPMo+3BgmpLJsRrbkxqfqCtz7DYPvdono+UA7sUhhMnfWS/P3zraEXPsGDl5SO8Va/pqVqDk0UI8s9oKsufQaGili1Yrx4Mmu2TpIr/w3NJRmWHuF8n/X6QR5CoLbVlu2UVgIPtSloc634PheAQImklHxRtHj5huym+kOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGml/FRtRXc79ISGXpgod5+2YxpDDwinJNAZJ/N96xw=;
 b=IQYx9iooY7GhrfMQpjwaTGVyO5mP7zkB3Sc1cUbq8WMLPiYx8dMhdQnzFal1MXF2FjDS3OibXE1Mhs7DUlxYDXNuMgOuxtMSKyAegchftmLOePOdRS+CKDKaKkD47bramnD7f0fdUS2gn1qQgYfySyB2zc8dG+DAG+hqUDKriWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1e8ec592-4a5b-4c74-5a0b-dbf3ea60b084@citrix.com>
Date: Wed, 15 Feb 2023 18:15:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [XEN PATCH 1/4] automation: Remove clang-8 from Debian unstable
 container
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: anthony.perard@gmail.com
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230215120208.35807-1-anthony.perard@citrix.com>
 <20230215120208.35807-2-anthony.perard@citrix.com>
 <6fa7fa56-d30a-e66e-b46f-5e7daffeb487@citrix.com> <Y+0ILtUb+yrVWKxf@l14>
 <6c455c45-18d3-584e-bc8a-a1d22a68fcd3@citrix.com>
In-Reply-To: <6c455c45-18d3-584e-bc8a-a1d22a68fcd3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0014.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO3PR03MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: e9dfc96d-c2a7-493d-bf44-08db0f809c5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ElFqkxVmbZlgstKQc9M0/CH3sGgUMMsmWSX2eTKROTWN6Y+wF0P+FOHqPCWewE+xrfzM84hvmec83IwKQCv9JBkF634SKUr8cwhM7EpVWZSH2j47L72P6AIC1zqMrg9u55SOFDRbcml+Ik0gaFS52ObMMK9I6sEmpN/GoSklLl6AQ43Xl4TZYsAqwPJCem6ndyVpLJxEeLW+19ekBmNVk3QnpeSmd9bn+KEfXOoqeqRFfFE61SUhBbqiXT2bMAB25KnF/pc0dENiSNg8OPojQcFruiFagEHB8TyuFi+PBouwFUjKInL9ZoYyGLsVPeONZG+q14VuRHZdp9GLc/aSRPNTwP2Qrhf5SFyRMe6vTvOJYpmn2WCFccZ44PHOrVk5ruxcrUGVU0v8H9ZNCrSmAm/0LMUQEib70Tv3KiVJpkWTSMZ1b0Y7udtKIKMTwBgGSpTIj+WsJV50ltaQn2w8QEMoA0x4Y9sNVngieCfzB8BfsOEIQE9UIyx1oLTXzK6bwx/QP1+5WWleJgyYQhwIHra4frFISeHVKjuCzsYEi5qPsPLOvdfYZYa2XjTNb2zrZzNqY2C6aPjBH1EDX9Qx8c9uEJa7pNLosKVXVZYCsZCrmuNbanXss40TTu/4pU5Ra4gdIAzdfEIqPxNuAbjR3JiYoaAYATAK8YBMx5h5hvCddp2KfrQ+abtbsbT+lLS4vuCEjCCj3olxBy2deDVn46cc2Q4qHTHuv9uoWMhuMjY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199018)(8936002)(41300700001)(36756003)(5660300002)(6512007)(26005)(186003)(53546011)(6506007)(966005)(6666004)(6486002)(478600001)(83380400001)(66476007)(66556008)(66946007)(4326008)(6916009)(8676002)(2616005)(54906003)(316002)(86362001)(31696002)(31686004)(38100700002)(2906002)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWRHQ0VFdW96TUdRdTd5YnBPN0Y4czF4Y2pUYlNKRWc4cFpTMktQb3hKUGg0?=
 =?utf-8?B?R1o5cENEYjFnSlpQbEFBdVF5dVNBNS9vc3Z6L0thdTN2NUtzcldDKy9wMEJx?=
 =?utf-8?B?UlF1ZnZpbElXbTZpZnNua1d3K3F2R2NiSHZFWkpjS0F3cU15S3JicGZad3Jo?=
 =?utf-8?B?ZWtESEdNU2NadFRBczVnbjhDU2RwRlZzcEZFUDVBSFU0VElWVWxIbUREYk1o?=
 =?utf-8?B?WEh3RE54c1VjYkdxZVVXb25pR0U3TWViRWNHcm9EdTJiWE1SdzY2aXNURGpa?=
 =?utf-8?B?Z3p1RzRMYWd5bWhndHYvdGlHNWVVUmd0eTNGOUlwYTByTXpxM0tBdFNtV3pE?=
 =?utf-8?B?aC9LdXR5NU5ENnFSR1dqK2xIeEJ5eVdja0RRZGcrWkY4Vk4vRFQ0eXFmbVVW?=
 =?utf-8?B?WnI4SU94ZzJqMUZsMnROKzNnQ2N1bFlMR3FBSUtOTnNDSGlaUmIvc2NKbVVP?=
 =?utf-8?B?NU9pbllVTmY5MDIwTm84aTFUelZ1cWR2S1ZiT2hieDV5OGFtQ2JiNnNYMHhO?=
 =?utf-8?B?dGJpSXVFUnVUTkJMK3Yzckc0RTNnaFlQbXpRMDlUMDY0WEhtVDRvVnZ5emY2?=
 =?utf-8?B?R3Rmbm5SY0prVE1sQ1ZUNFJQWFlpMGhpS3diMDFybFJ4cXBjL1FMOG4xWjN6?=
 =?utf-8?B?Y2ZHMEFSTUY5eHJKdk1QOWVLRzgrQW42QzQ3ZEJ0NmUrcXc1eVd1a01xa0RP?=
 =?utf-8?B?enl2TGh2ZnZXZFhHT2N3c0lta0ZSNFYyRkpjZ3lCbGF0ZDR0dFNaRXpJWTEv?=
 =?utf-8?B?VWQyRnNxYWJ4Tll6RjBya2VlZzlCdGgzUm1Sd3MrckdQTk5LR01vS3MrWThs?=
 =?utf-8?B?RzI1NXlVcElHaWNIN3o4dzZCZVl5c0pVNENVWjV1RWoyV01JdFVybUMrOXVP?=
 =?utf-8?B?UHhPdmlyRHoxUmFQSGtFMTI1YVhURWt1R3lrYnA1UlRPV0RRRVA0UFpId3VG?=
 =?utf-8?B?OE16VDIrTzl4ZTNVNDZKcmlYTnR4bVRTamF4SFdlc0Rodm9mNlVqWVNhdnF1?=
 =?utf-8?B?UGtWK2cxSENHNW9vOXQzNWJacVU4a0tPVkpwNEdFWHFhc0k1SHlRWG0yVVVr?=
 =?utf-8?B?YTlxSXdqam12aWR3QU9kN3R0QVlKa2pwOERUb2RXWklTdmFYNmpRMnFOcXoy?=
 =?utf-8?B?SVFSVGlKTGtjK2dGQ25zSDRxaDl4dWV4YmhIbWpVblAyUDJOaktUa2lhZnNT?=
 =?utf-8?B?TXdJczdPc3l5eXY5THB1YktLSm5EYkVzcGVRcHJ4UjFvV3R2NGFlamVtdzBy?=
 =?utf-8?B?dzRYbWhOem4zTk1BQnFVUUMwR085MUs1RlV5a2xkbHFGenJSdTN6V2M5Z1pL?=
 =?utf-8?B?QWpwTUpWdVZsblN6Y3VtMm9JL29hdTVKeVZVYXRKNFNEeW1JNFNteEZLUm9s?=
 =?utf-8?B?YXF1Wm5PMmtCM1pWM3dsQVJiVzFDQk9Vb2FWa05ZN2t1ZVFrSS8xbDNuL3k5?=
 =?utf-8?B?YVhnWENmdy8zWWhKTGtub0U4b0VlMWVySG56Y0I1VzYzeTgzY3dyb1dES0pt?=
 =?utf-8?B?QUJxNWVwWTFZWmt3cFkyT1RsZ085SVdGeDFKRmxZMktkUmRObWtlWTVFcDJv?=
 =?utf-8?B?VHlMWWRPRnpISThhbHRlM2R5QU5tazBWdENxVXBlUXVWRS9ZenAxclJ2UnB1?=
 =?utf-8?B?aGM5Uno2L0MrQzMyK0hCZDhWbkhRWU5yUlZqTnJlWGNlQ3g0QnQzUTN6WVpK?=
 =?utf-8?B?RDY2Ykd0UVdvSlJ5WnZVQmd3ZzRyVlVsckUxTVNYSERZRmN0YU81VlJHVGlz?=
 =?utf-8?B?VGE2MnNQaTZ2VkQxejhZcnBpejBQQmRHZlNIUWUrVGgreUZrTmZyQ2p5QytB?=
 =?utf-8?B?cDB3SXNmOFhYbmRicnpJRjNub0dBWEZmYy9RQ1kvM0FRNnowaWNtTnZqajJY?=
 =?utf-8?B?R2gyd2k2cElyRmZUSWN6aXdtdXdEVEk4MThHeTc1NC9FUmpDS2ZMVW1qelZU?=
 =?utf-8?B?b203RzdUM21vL0kvZEV3QWwzVElxU2FER0FiMExKSXdtUzdkbi9ncEkxUTVR?=
 =?utf-8?B?Szc5M1BsdGtjL2poV0F1QlkyNmVqVTdpR0N4SUNTdU5ibTlOeWxmb3lIMGZ1?=
 =?utf-8?B?cUZYM3poYllZQkhlUXVnei9RV09WdmtHcGtsSUpaUi9CKzhyUTFmS3Y3WGVF?=
 =?utf-8?B?d1JYSmQwaG14Ri9rNHRHblFNb2tGckhwTWdyN3d5ZUlPYmRHcHZHS05WYmEv?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5fZ2ORjIiGBePLMwFNkzTJQlnkiDU6bGGzsMGZjsc/DF20kKF3PCdtPoH32SXuBFFXT0COQTrM/IS6gqHaCD9uYR4nHV4rgH+IlSWlNuNLJfvLk3P90OMnPfpsEBEWp3xGbgLu8/VpGsQisZvYoDuwvMypY1sm65sJBaPa5uJ+/He6tB8co4ub7hTUssHTUw1cp++AnWEH9ZsNDeVVPCW9Y7+PddEE+P1S97I7Z0ys9Z6AnBrE96MwzVfQlCba+fIELnDpWuMSBSGIAJutCLxEZ2apk3NiVQ2EtKWiPpygaxHoBCCZn0n0MtbGKdjQfqcQq/2bEPE01CfSM1rEDKjrb69ThyEfeCQkbGYWKB3bMV0OBeZcxvfRX/zWfuJUYsQZ793rNQ2FCHaq3pCOMvzjduD0VzH+sixm8grzfYVWAFSu0GFPjH4Ywpzet0rvCdJ2JpHEc/ADYWYiVgKakbB2SZed7VWJ3d1S5FXLmyAYdXPXPJAdQ5ffZFIlnX8CpgD8jN+eoINdxcxN3+6d0PjHtAs9D5aHXncGGKXwkTe99wjZbEiNdp8NYDOqREA0UHT/rWdWTL4WFQAkb16xj/l8hed5qsavb5TantTw5rg0f1fOi/6mvXs0i5Meik1qUolBRMuPBGb1vLFCD7Ngmdfte3oDYImUJWHA5gVnVkXRAOLQ/zG6eVAdSN0oGAdMmFmL7cImWbU6cTZD57576aBtYXr/+AFM0dzb4ldIgHLWAIhnQNoJ999Qps36Gss3rS0cNmwdiJ02gltPjDNWvmNofX5C911T3JNgybBnOCdBMWPAO185KQg7EeT5oa6J/KmzCvDgvnA4WHBSPGaJ+stbpHwZQlVAMydmJnbhjQXwY=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9dfc96d-c2a7-493d-bf44-08db0f809c5e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 18:15:25.9867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oy0TYI1kpSjpK6ljfqguU9pNkNNK7EDaof6jo+Qhffv+JH9OA2MxfjymCqQM1Oap9zdCKpwwhfeFSbBQjryoDPyMRIONJ+4IUTtJHdjdDe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6805

On 15/02/2023 4:31 pm, Andrew Cooper wrote:
> On 15/02/2023 4:28 pm, Anthony PERARD wrote:
>> On Wed, Feb 15, 2023 at 12:26:40PM +0000, Andrew Cooper wrote:
>>> On 15/02/2023 12:02 pm, Anthony PERARD wrote:
>>>> First, apt complain that it isn't the right way to add keys anymore,
>>>> but hopefully that's just a warning.
>>>>
>>>> Second, we can't install clang-8:
>>>> The following packages have unmet dependencies:
>>>>  clang-8 : Depends: libstdc++-8-dev but it is not installable
>>>>            Depends: libgcc-8-dev but it is not installable
>>>>            Depends: libobjc-8-dev but it is not installable
>>>>            Recommends: llvm-8-dev but it is not going to be installed
>>>>            Recommends: libomp-8-dev but it is not going to be installed
>>>>  libllvm8 : Depends: libffi7 (>= 3.3~20180313) but it is not installable
>>>> E: Unable to correct problems, you have held broken packages.
>>>>
>>>> clang on Debian unstable is now version 14.0.6.
>>>>
>>>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>>> Yeah that's because clang 8 is way obsolete, and http://apt.llvm.org
>>> only supports Clang 15 and later now.
>>>
>>> In hindsight, it was a mistake to take unstable-llvm-8.list in the first
>>> place.
>>>
>>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> I just realize that this change is going to break gitlab testing in the
>> staging-4* branches. So I guess this mean that we will have to backport
>> this patch, or at least the gitlab-ci part.
> I don't think it will.  The currently cached container is still "good"
> for the older branches to use, but we ought to backport the change
> nevertheless.
>
> Given that the container is un(re)buildable anyway, we're not losing
> anything, I don't think.

Ah, so.  Applying just this patch won't break older trees.

But applying this patch, and patch 3, then rebuilding the the debian
unstable container will break older branches, because there will no
longer be anything called clang-8 in the container.

This demonstrates even more that referencing the compiler by exact
version is a mistake.  As is using names like unstable.

As I said up front when we added CI of this form, we were always going
to retrofit some changes to all branches (including the security-only
branches) to keep this working.  These chicken are coming back to roost.

~Andrew

