Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3236FF018
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 12:46:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533231.829704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px3oN-0007Ux-KQ; Thu, 11 May 2023 10:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533231.829704; Thu, 11 May 2023 10:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px3oN-0007S7-Gy; Thu, 11 May 2023 10:46:15 +0000
Received: by outflank-mailman (input) for mailman id 533231;
 Thu, 11 May 2023 10:46:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z+vG=BA=citrix.com=prvs=48888ca5b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1px3oM-0007S1-10
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 10:46:14 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a899071-efe9-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 12:46:11 +0200 (CEST)
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 May 2023 06:46:04 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5048.namprd03.prod.outlook.com (2603:10b6:a03:1e8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 10:46:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 10:46:01 +0000
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
X-Inumbo-ID: 0a899071-efe9-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683801971;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vyIC6SoabYnCQGsG3dwqnSrdPo0DTqBLsuUDGGqBqhg=;
  b=XhncjtdxpKpaKbUGHKMoVeAq1rQFoYxkc9PYnItESatvvgRL7YX8MW06
   l0TN0vgfuTsCM41CnsxSTVE0iOeezKEsCr7gzmh+4XJHiH4/6/HTuOqMw
   6Ds23pK8u4QE7hMo7+X9upO25BYDPUTL8D2kKzG9WSZ1h+E2q9zpMeZ/r
   8=;
X-IronPort-RemoteIP: 104.47.58.103
X-IronPort-MID: 107409039
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hu10KaxZYxJn2mVWxtx6t+fMxyrEfRIJ4+MujC+fZmUNrF6WrkUPn
 GJNCzyCOK2Na2uhL49wPY6xoR5Q7JDUnNM2S1dqrCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRjPKkT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KV9j2
 fs9FWoSVDSaqfyI0aiJQ+JQgtt2eaEHPKtH0p1h5RfwKK9+BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVQquFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAN1OTOzgra8CbFu7n28tIyQzFl+ButLhr2icWogcM
 WJO0397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L86gKUBGECQiRGLsIvsMs7RzsC3
 VuOgt+vDjtq2JWXVHac+7G8vT60fy8PIgcqfjQYRAEI593ipoAbjR/VSNtnVqmvgbXdBjXY0
 z2M6i8kiN07j8ER0L6g1UvamD/qrZ/MJiYl6wOSUm+74wdRYI++e5fu+VXd9exHLouSUh+Gp
 ndspiSFxOUHDJXImCnTRuwIRemt/6zcaGaahkNzFZ488Tjr42SkYY1b/DB5IgFuL9oAfjjqJ
 kTUvGu9+aNuAZdjVocvC6rZNijg5fGI+QjNPhwMUudzXw==
IronPort-HdrOrdr: A9a23:lOxx8qGK6cpqOct8pLqE0seALOsnbusQ8zAXPiFKOH9om6mj/P
 xG88526faZslkssRIb+exoWpPvfZq0z/cci+Qs1NyZPTUO1lHYS71K3M/PxCDhBj271sM179
 YHT0GmMqyUMbGtt7ef3OASKadD/OW6
X-Talos-CUID: 9a23:ycfPr20Q3oCBuKz5+DBqYrxfJO0JdVjglmjqB1aWF1h4Uo+cQmOU5/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3Auasg0wx4eM+QPvQ+sRm5HiAIDU6aqP2tNms0tNY?=
 =?us-ascii?q?CgdKvbQlWGTbHzy6ZGKZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,266,1677560400"; 
   d="scan'208";a="107409039"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNbOsFgUe/UgxLJtCxTBruNW1YtAuC8uaAgmu8MzaAejmck+Ii1I1XJUzfFcnc/mgdDwObsSJqB0pXqKw+gwXq0ezbmzjs8bEvHnGe8RB1MG3qBjPcYtSUUFtXtrdk4gTGiFauAaUztErdJEjnMfX+OU2KnUiluDKr6zMgBvIwP+VlXIoWZUPUthLEHU7dEM8OUXaeYfR/5qjAFsN6VBHpcJf1E5igysTuqaD0Xj1wRrzS2UGxJkqT7m/rs+w5VYJ8dlxwKiaGMWcbf8nTGVdS5x1lBFW1O2b++MhmvmzaCP/eLLmhYB6W7z67AUIcFIt14vp7v0SEvncxKcNslagw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxhnbEX/WYVe0e0YY1SVJfAqgcBhhNlrdLM7udmvtC0=;
 b=g8nIlilA86JH4mYbsIenmRVlr4zL/HGHzVzJdEvVXgfutKfHRgJ9rN2jcPqJwoIOZcwj5vfy/1+dFdQ2gbvs+dC6oAbF5Pg9KxBLee6GUEd948NTn+OX6YMPYRWgM4TD6YYiRM1I/1MOL20QO8f8/9OS5SOynq9mUWRfe+7jnsXKOTtT4xCM/ViUBfmejY4rJW7WG6QXDAdnpquJwnjwJiUvEeLKUuRhXa5cy5u+25QampRU7/+ZToJ+OCh3n/uVEHj40yrMv+Yy5pJERGG3n8oFMjYocEVMDt6hG9KWqpSsc4GH2zF5dfmPG+lGLVJ6nYD7FQAtwduGKzgiYqKRXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxhnbEX/WYVe0e0YY1SVJfAqgcBhhNlrdLM7udmvtC0=;
 b=YiP1+re5YOdfIMys1yGPIkEjRxW1ZgGJJX0xV4sXAaoLYxv169H0Z6e6o6E6DQP9ZZ3zBVuASQ8/YX23XbXOVhkiL/Yr9TVVvcD8zDoMt2uRvRwrjT7Mj6+iZZ1N+gqMwAY5CNUcTk7msw2Yx6JMazDTyHnUEoiCoDRf7TGjPA4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <574e4927-6b92-e33e-d2f2-d92f596912fa@citrix.com>
Date: Thu, 11 May 2023 11:45:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 3/3] domctl: Modify XEN_DOMCTL_getdomaininfo to fail if
 domid is not found
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230509160712.11685-1-alejandro.vallejo@cloud.com>
 <20230509160712.11685-4-alejandro.vallejo@cloud.com>
 <5676f943-d35b-3989-c2de-4c0a46b307fa@suse.com>
In-Reply-To: <5676f943-d35b-3989-c2de-4c0a46b307fa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0294.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5048:EE_
X-MS-Office365-Filtering-Correlation-Id: e196fbfd-5da8-4212-1eeb-08db520ce98f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ku5orQqTcCEczbsMe8ukEeuDqNRPacyVBTikdcW7K/n1Hy+XXCoB2zpfZ4tODsP8RfxbWAh5DEl7kfWosWwgs33Ak0bDf1fZVgZ+8mv4JroAw3YYX26NuecHwIb3K8fF6Q6euKUxC7L+cKjr4yHKT7+pLGw5jHrZL6JknbJ7w83JBVSYXyHLydfUZIptyTB7YgENzU+ig75DooEORqmrr49AyWLIDr+Zh/PiHJucxQ3VM8YcnC14NtaivmPTkgFapD0GvUFzr1Akb/rH6qPEgjKOm8DOf0Rh6OJHDT5GrThYBuZdv5oSn89NoGozIuDXq70gZ5H92Hj2hVgrzGFwagAJw5sOcbpee9XQt/a+TT2uUvyVIBnRwfWFjINFGiVcY8/ajQu/D/6rA7RlZQqn+RRE/Vi90/oL67/arMi62T74CYry97afVZpwfvb2USgKLrcFcoBUd3833KzjQ9kEGMgCVfPl658TBEyoLrEWIE+eSZ/z02SBr7iX1mSrrBLVXZWj0/LHD82AkQ7440RwpjLFjROHn5ZR/r66ckYXmk6jPA0q4mgbQVmpjHV/BPISqADSq98YbYwnk+I4ndY9/dWSnn3jBeD2NJsD+yfNqJCtvWt1GUi8TisbmVf163bHE7OigZNWXmQB5PHj5JSZAw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(451199021)(86362001)(478600001)(83380400001)(2616005)(6486002)(31696002)(6506007)(6666004)(6512007)(66476007)(26005)(66946007)(82960400001)(66556008)(110136005)(54906003)(4326008)(316002)(53546011)(186003)(31686004)(5660300002)(38100700002)(8676002)(41300700001)(8936002)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXFuZ05TNzN6cjl2SHk5SFRybDUwVm4xVk1FbnVyMng2eWFhY3VvM21wT3FF?=
 =?utf-8?B?Q3l0R2YydUVSNFExWlNKem41eWFKRFE3QmZzVzExem9ma0hWcTRJQlNjYWF0?=
 =?utf-8?B?Sjh5VURaQUlLczJOWUJML3FXUDlNM0xqSktaYk5xWkVYeThrS0pXRHZGL0xN?=
 =?utf-8?B?bXVWNGJIbDJmUVlTNHFKOVdWRHRUY01UdTI4a01UVTRWQVJmM24vNFNNb3BZ?=
 =?utf-8?B?SEtoNVFZK011Z05TcmNQZWtkcGYrUnJWclRnSzBua0g5Rjh6VUljWkROaHFh?=
 =?utf-8?B?UG10dDlPMkhzS0tha3d2a2UwQUVqYTltWWxkOVBCQVhNMEtlK3lObEZJVENV?=
 =?utf-8?B?aUNOMGdLQWpkcmpXZkh6aTFCVWJjTkpGckJYeW45Tjd0U0VzYmhwUUFhSU02?=
 =?utf-8?B?bGFtL2NGZDJhNzl2U2pyczlIK3E0elNwc2UrQkUwRWtJaTFSNHhBSjZzVWFO?=
 =?utf-8?B?OFY3blorVUllNGk1SGJJWWVoU25jMGtDaFQ3V3I4WDJ4ZnJpd29YelJlNnFC?=
 =?utf-8?B?dHRxQjN5UDJpSzBGRlhnb0FpQTRwNVNmZFZ5ZEVlQVpEeHY2amtmVEV2L3RG?=
 =?utf-8?B?eGsxMkY1VmZ1dUxyV2FaVFg5dlN1cDVhNkNDVzVCRG5KK1Z6azdnTTV1MXhU?=
 =?utf-8?B?bFp1RU44S0VlME84V0NYb2ZFYTErT3grUzkvNTNZNGNBNmtsbnU0OG91M0Fa?=
 =?utf-8?B?UzkvN2lUbHJsWDcyNnBuczd6THlTSjRBbXJNKzV0K1crbkJwWVIvL05UeDdE?=
 =?utf-8?B?NVljZnFicjI0elZuVi80VksweVRaekZnTWFIc2NKYk1Rb0pKVk9INGVyYkhV?=
 =?utf-8?B?S3doSVorZ3RadCtYWWVNVWJZb1YrRDJuSVJ1QVVrUG90Vk9xQ3FaRnR0MHBj?=
 =?utf-8?B?Y0U3SlZYdlgxd2RIMXQvdTZESy9wbDRMRENaRitFUWV4R0NyN0hxL212UE9w?=
 =?utf-8?B?NnhiVHZQTlNCTEtyeGRlelFrdHVuNDJEV2hKc0FLN1JNaEVBajBYTmRZUGhz?=
 =?utf-8?B?a3YyOTlSYmJmRFp3dEJMelhKeDd0NnNiYXVuOWRrQlh0aXR0NGF1WFZnQVpz?=
 =?utf-8?B?TGJUVzNWK1JvRUVqNHdNVWRHMXo4U1RjY1RBcU5iY3hIZ1lOamU3RmFtQ0d1?=
 =?utf-8?B?MEIzWmJWRnFKWWs5VTRvdEFjNmV0ZXpEMklUMGVBMFIreDcxS2lqWUw3cFZO?=
 =?utf-8?B?dm0xSE5sZlFRZHlRd0RmMm1BbHRrZTF6R3dmTGRJT0hPcHFnVkluT0lFUTZr?=
 =?utf-8?B?ME5scnN4b2U2TEU3M1BNTnU4NjNJUUgyZlBTVGNWdWpiQ093RURnemc1WW8x?=
 =?utf-8?B?b3FFakFTY1B2S3FpVFVTcUhrRG5Ib1BwaW5yR0tvb3Bldk9NcS9VWnR6Ym8x?=
 =?utf-8?B?d09SS29nUmUxeCtta3duWmx3VDRWNlIvYXBuMU82TytJZ3BuRW5KQ3YzZlJF?=
 =?utf-8?B?VFNFSHZOd0JsZXhuaDlRWFVzdjhEUjdneEZmSmtpcmZGblVzSEIvZlB4ZXdR?=
 =?utf-8?B?NHJUa2prbGQ4QmN0eVNETzc3c3JDZkdGMGRWc0ZDNlk2YndMcVFBbFpXR1V6?=
 =?utf-8?B?UTh4NjJBZmY0NmVRSm5PWVlncm5ZbkdzZ3RpeVJtZmlLYUZiTjlpTndwL2Ro?=
 =?utf-8?B?aVVCc3NpU2xjWTcrWDRIOG1FcnNVb1JlclpUNzVwTmMzWVp3QjBxckJLMFBr?=
 =?utf-8?B?TkdWazhGOU9MSEVVa1U0TU9LeGlJSWM5VDU4akRuYStlOGNSWmJmeXVuSmxS?=
 =?utf-8?B?Y2VVdnlHeFdBWldRNEtDUGc0ak83UGZwaDg2cVUzODBKOFNrKzBpQ0xVZ0dE?=
 =?utf-8?B?QUFIUlZ3VldEZG5xR29xTlIweHVyL1dkaXFRQkJObUU3K1VDL0pUNmsyUmNC?=
 =?utf-8?B?ZjRsNDNEdDRPemJBYjZKTkpzSGVLc3ZZanZIZUJ3NW85UkpOTTlMM29rMVIz?=
 =?utf-8?B?WlJRQ2w2QmJtREtqRDJRN3k1clJubExHNkVzTmVNUlpaaCs2ZElWaTFyMi91?=
 =?utf-8?B?a3hSc2hjRGY1ZmFTRFdzb1VZL25uaWN5Yi9ucVowTzBNSXYxOUhIaXVRZ255?=
 =?utf-8?B?S0hYaVRhVStBNEduRGtBNkJPT1ppU3F1QU1OZzZoN0taeEJ5WXVla2N0Y0lo?=
 =?utf-8?B?WE1uNm1SSWpTOWYzbFB5ZnZueWw5b2VoM1FVbXJVbzV6ZzQ1SzdaUEhobEw4?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZtD4/QQnJV2bSXxNTzyKMRz+/l2WSqQsDUkuOYIzqG34vQ+FL2xkF8q6MCAHMlyAMX/g4Z9iyTy2VgeKjJrn1kMnCOdrF+qUEr+3V1mwdwVUcuZ5/AyuiDBh5B5ZceX51g22on78hXKoAAQvKl/jgpPLxiE32/qoAjEYbNKVqYUewodQRcH8e2uQifSELXudNaPcBHXGscvW4D8zhgEw6lNtwSgo9LTqbNXg9sfP5x9KaDVqcJ9OzOtmYOMrzRWl5CTeM/yFV28t5FydP6o1AB2QOhg1IvhIL8CfEMyT9ZDeD/HWlmTkHOBZrWBFkWitBm45Ujk11faRzpWw/o+UKwkWF0bgM3UuseQFuUxhLOJd83zT+6cxezQxZh/jImuavZLfRe3aUjCj+PL/CLCe8nD7UAudOtjcVFNOqVh5yTYFKOvdk0FXyKmAFazPVOS5WkQ/SNgCzdBg2ujKgcHK+U2jMnhuYxskDn9RVBKKPgI8x5A1Qmix1EzE2k+MrBHTBlGuuT/rZfjrKb2xo6BAiJ8odmzqLi4zFR1MyPeJDhOaqw3PL4O7mL7yYkegKbvdfhxN+BXpkf4lF25E6z8JTksfiZRf7Rmqbld+jTLxQr1ARS4jzK7THyQ8es+YzRBPzTT094lIVDIl3Wsu9uz9futXcPo5aykTy5ejfMJkuQWGjI4mo6lB5tjeiTgsURNKLSqLblHS12toXtB3KQwSE411JUUDxIryTj+raNO0X6AgpArROEcFvNc9R8N91r4G1eF8aK5AiIPCdmNR51Qf9bp9ibVlknNKFAkGhDkqBuAa1Stem+EvUYM5UBFcW8vZT/PWRcTAYQ8VSFysSZP3axNQkquZl8jFvfQhQx+npxZCHxiXvXitjcFdk46nO00F
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e196fbfd-5da8-4212-1eeb-08db520ce98f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 10:46:01.7514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yAWDEVoGT0UKZ2Sbv50hLiwdhLeplddnLDgVo6rnbi8qenvchZNd1UKfRYnJu2DhgVah+lJyWd+E6mKF7dxGpXb4DA6AS6aRnmS9QewRhVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5048

On 11/05/2023 11:41 am, Jan Beulich wrote:
> On 09.05.2023 18:07, Alejandro Vallejo wrote:
>> --- a/xen/common/domctl.c
>> +++ b/xen/common/domctl.c
>> @@ -314,7 +314,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>          /* fall through */
>>      default:
>>          d = rcu_lock_domain_by_id(op->domain);
>> -        if ( !d && op->cmd != XEN_DOMCTL_getdomaininfo )
>> +        if ( !d )
>>              return -ESRCH;
>>      }
>>  
>> @@ -534,42 +534,14 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>  
>>      case XEN_DOMCTL_getdomaininfo:
>>      {
>> -        domid_t dom = DOMID_INVALID;
>> -
>> -        if ( !d )
>> -        {
>> -            ret = -EINVAL;
>> -            if ( op->domain >= DOMID_FIRST_RESERVED )
>> -                break;
>> -
>> -            rcu_read_lock(&domlist_read_lock);
>> -
>> -            dom = op->domain;
>> -            for_each_domain ( d )
>> -                if ( d->domain_id >= dom )
>> -                    break;
>> -        }
>> -
>> -        ret = -ESRCH;
>> -        if ( d == NULL )
>> -            goto getdomaininfo_out;
>> -
>>          ret = xsm_getdomaininfo(XSM_HOOK, d);
>>          if ( ret )
>> -            goto getdomaininfo_out;
>> +            break;
>>  
>>          getdomaininfo(d, &op->u.getdomaininfo);
>>  
>>          op->domain = op->u.getdomaininfo.domain;
>>          copyback = 1;
>> -
>> -    getdomaininfo_out:
>> -        /* When d was non-NULL upon entry, no cleanup is needed. */
>> -        if ( dom == DOMID_INVALID )
>> -            break;
>> -
>> -        rcu_read_unlock(&domlist_read_lock);
>> -        d = NULL;
>>          break;
>>      }
>>  
> I realize it's a little late that this occurs to me, but this being a binary
> incompatible change it should imo have been accompanied by a bump of
> XEN_DOMCTL_INTERFACE_VERSION (which we haven't bumped yet in this release
> cycle).

Oh, sorry.  That's probably my fault.

Do you mind submitting a patch?

~Andrew

