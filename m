Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA84F6A230E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 21:13:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501554.773363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVeRB-0000R9-Dz; Fri, 24 Feb 2023 20:13:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501554.773363; Fri, 24 Feb 2023 20:13:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVeRB-0000OX-Ae; Fri, 24 Feb 2023 20:13:01 +0000
Received: by outflank-mailman (input) for mailman id 501554;
 Fri, 24 Feb 2023 20:12:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V4+4=6U=citrix.com=prvs=412e064f8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVeR9-0000OP-MD
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 20:12:59 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a07e47aa-b47f-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 21:12:58 +0100 (CET)
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Feb 2023 15:12:55 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6073.namprd03.prod.outlook.com (2603:10b6:408:136::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 20:12:52 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 20:12:52 +0000
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
X-Inumbo-ID: a07e47aa-b47f-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677269577;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oNq/zxWK3J2oMVBAydTBZ00EjFHWerRzfzYbVtiitsw=;
  b=g9IjbVM6EYZzSYIKiy0p0BWJY1Wh0Af9OD3VjKuL2hxdUe16dk5wDIKB
   EEmEuTdX0OrN9IHwiS/fOa61Hlw1st7BLrSf/mzm+I+bj5lZTgG49AWKO
   tkIBcLvpS/kKog0sDXqTTvuIYT0ezLP9+jLYxpOb30ZEODEsLo5LWNCZr
   c=;
X-IronPort-RemoteIP: 104.47.57.176
X-IronPort-MID: 97849954
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xLot2a1Qd5VXWaGO+fbD5ehwkn2cJEfYwER7XKvMYLTBsI5bpzRRy
 mFKDzzXParcN2Pzed8ga4+09UtT75TVmIJmTwBqpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZkOagQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfKGIf2
 KIAbyg2QxWq2d+E2bedcNs8r5F2RCXrFNt3VnBI6xj8VK9jbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvC6Kk1IZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXKkCN5DReDknhJsqHrP92g9MQZIbn6mof+VoUG3WeB5D
 lNBr0LCqoB3riRHVOLVVQCisneAuRIbRNN4HOgz6QXLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313rWeoC62OCMVBXQffiJCRgwAi/H8pKkjgxSJScxseJNZlfXwEDD0h
 jyP8i43guxKidZRjvrlu1fanziru57FCBYv4RnaVX6k6QU/Y5O5Y4uv6h7Q6vMowJulc2Rtd
 UMsw6C2hN3ix7nU/MBRaI3hxI2U2ss=
IronPort-HdrOrdr: A9a23:RpzoTqjzmVlb7ZO3WtZ65WLy6XBQXzp13DAbv31ZSRFFG/FwyP
 rFoB1L73TJYWgqME3IwerwXpVpQRvnlaKdkrNhRItKPTOWz1dASbsO0WKM+UyFJ8STzIBgPM
 RbAt5D4b/LfD9HZK/BiWXWLz9K+qjlzEncv5a6854bd3AJV0gP1WZEIzfeNnczaBhNBJI/Gp
 bZzNFAvSCcdXMeadn+LmUZXsDYzue73K7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFqQrk/a+u2svLgSM0llWjpai+quGRhuerN/b8xfT9Hw+cxzpAKr4RFYFq9wpF2N1HoGxa6+
 Uk5S1QdvibokmhBF2dsF/j3RLt3y0p7GKnwViEgWH7qci8Xz4iDdFd7LgpACcxxnBQzO2U6p
 g7rF6xpt5SF1fNjS7979/HW1VjkVe1u2MrlaoWg2ZEWYUTZbdNpchHlXklZKsoDWb/8sQqAe
 NuBMbT6LJfdk6bdWnQui1qzMa3Vno+Ex+aSgwJu9CT0TJRgHdlpnFosfA3jzMF7tYwWpNE7+
 PLPuBhk6xPVNYfaeZnCOIIUaKMex3wqNL3QRyvyHjcZd460ij22uPKCZ0OlZ2XRKA=
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="97849954"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlejUzrVtq14aL/3zo4dgTO8OeRRZA3jVhLRA9qylmW9upS05sUUOLrTg4LKWVyzbkal0SeWdFPKi2xRllmCCfu7pmTHhJnz/TQHD0kML2iJYnQ/qok2PlqSe5oJ6oSE2BEv/9D90Hy7DWvpY9yx0nKKd5ICl3XFsIG33GIAoIV0nlofuGYdr+UDWZLw593zjO8j6n4U0ND8CQsA6pnLNtKyAYIT6FARkHftSqz9PlxDus7f6Fl/81VxnCWHy1cw8ClzERmSlIFocNbaes9aI4hdZYNsvRZTJYMaATK5vKUx4v85jPIqLDFqjCUwZ2W0ytqSm5OqUSQDwUjSCFgL7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7i/jt+KTi0wVe7bRfcDojkbjGN2u6/RVgMKjz5A+N/E=;
 b=VuTbF+ZeCJD9Jikih6W266lCsw7dV5d0V8Cp9AzKAe2atTwFTFTuJ5zqrvknvQ9yzt4OX0wT4dBjt3YDZbSQWrI5H81zY5k97axZi1MHFCrf1/6tAYOvU9vnqE0wOsiIYNlCzewJRpQKhV7BlAmROcNfTvAOLEzuU6YHZZIUssk8r8kvU+iIpweYBqy68zm2oqoPJF9lLbAfWPxAuE5MxmDl3xQHAPh/Xw+k5qQKLzaLtbENN7lsFuruj0eV7Ga/tjU/eHY5uiWS1M4vWC3Nrr1WRlGZlG3JRi2q5YH0YuBTtMU6iM0FgIYyJSqwsz/iWGaHIGUYddKN8SSOznwgyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7i/jt+KTi0wVe7bRfcDojkbjGN2u6/RVgMKjz5A+N/E=;
 b=JQk2wqJnO0ed3I9oiCYWT74IHJ+ZP1jq62wK2gdrUh67t/UzQbgRWdM5+zkpCCGUHIUkOi/B2prVJXI5k8elb9IpvO2ClgWy1T1+bOGjaJa3CR4CQinuZuGMtKTmDs3p1N7IaWOIpRGtD4VPRP1am7HAu2LID93SRpwkBXfmWls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2c6f4132-9c75-767d-1b98-dca1527c2b58@citrix.com>
Date: Fri, 24 Feb 2023 20:12:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 05/14] x86/svm: move nestedsvm declarations used only
 by svm code to private header
Content-Language: en-GB
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
 <20230224185010.3692754-6-burzalodowa@gmail.com>
In-Reply-To: <20230224185010.3692754-6-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0042.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN9PR03MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: e8bc281b-b150-4018-5c6a-08db16a381d3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jKtnCn5nclbrrFxAykSyRkziSMHNYxZsAl0uBMZjADOwupEgVKFuTSlN1KwLHrZ5LIkK0wU9STs3Au1x1/0C08T74fkQoOxAXy8JltNQbrKV3heIFp1mXm5hqb/7ADKats5nlAQ2hHYhmCAVTZyfcU/xbTP9NnxjcdTXCVbBLsJw4ZxUAaCf7kQkpAIceCZiXZu1WUlHi79mcP68Fnt4mql09vESocfMPrdJlmN0eMZwVEaOIPrRjzOjcUldZGishU1xtmrw6M4YRkbL5HH6FfctvM1RznuAeOLXGpEyQaK+5jT3bcw0zWzzwp6+d5+k5E5PXOpjuD9RiQRURMGXhNEkR6b1HmwuHXNQScJf4BdWBBmKIKTX/Xmvq4OXxtA51Pw9GhZrb8y0bDZVs1xKHFJSjK5ym4Ducy7SzJNToh1XVVF6GWSfygFybvhcAL3OPK9ZL2bA9Er4kui4upDI8Tl9fqMybIL4jkxWftVdmsTXPFI2ctmpjjZmROs/5MK4XRRYrvn5rlrZUkSNJ1FGg3H8GwFrKemPjk30GqCJcxssJAC+7AvJlHYqTIA0YxdOm9qsYeUg1GJds3vAQyPrlE1yIY8WpRYkPF4lx6LRIQMv9/ZaNGetqKbHaWDEy9rskK9nXs1GmgrdwGP6tL30ggc+QhvCFq6k6QTWIekiCzy3+tn+3dNAUqP6VCbA+S9krceUdPFzSKRnQ29hlctDA3pS4ILarcH66pfLkDpaVyo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199018)(31686004)(2906002)(8936002)(41300700001)(5660300002)(66946007)(4326008)(83380400001)(66476007)(66556008)(8676002)(6666004)(53546011)(316002)(36756003)(478600001)(186003)(6486002)(6506007)(38100700002)(2616005)(6512007)(82960400001)(26005)(86362001)(54906003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmxaSHRyME42RW9BV0xxSVBrSjlRbzVseGtpNkNKZ2hmU1lSd0RyTHQya01o?=
 =?utf-8?B?QitRTG1tVk4rdmlIL2RYMHJuUEd3bHBXdFR5YWNncDlCT0Z4dUJ4aDk1Qytr?=
 =?utf-8?B?SXkwNkMzeWpNTG5CNFJONVNXNlVsUkNqb2RJWDlMVEs1NjRaQWoreUZxTkY4?=
 =?utf-8?B?SEk0TDhUYlpXL3NYV2NXeDlqdEtiWXcrdUVMVU1sRTE3cEdJdDRuZTh5dk9F?=
 =?utf-8?B?c1RBR2UvcFdHYkJqY1NrS0tHclVFdTY1aDEwK3BSVjdxQWV6T3dXMDZENDV5?=
 =?utf-8?B?RWJBeWVlWFhEWTNFdlBaaXloZ1NDMFVudm9mbjcxbkJwMDV4bmZQblM5ZnMx?=
 =?utf-8?B?RXBkZFdYOXE5aGdIOG9EdkYzMVlLOGFIc2REVWpkcUJoeEE1UWpFNUtqT25q?=
 =?utf-8?B?QnJhbWV6SGpkVzBjUHRlaVhIaGh4YlkvQVM5ZkNlZkNHWHFqVmVMWkZPL1o4?=
 =?utf-8?B?cUFwNmRTOGFRaGNDampBVlVkcDFXa0NNL0hub0Rib1pkcDdMeW1VdHVzamxa?=
 =?utf-8?B?NlllbEJOZ2Z4ZlNVUndXbDVPUUxxMUh2ZzBLS1hEWDFZRmdJUjJEeTFKajZj?=
 =?utf-8?B?UFhDZDJBQ0QyS3ZFY25JYVlnN09YOFdCRDhpamZZVW5ob0tkWS9Vb3FMMEU2?=
 =?utf-8?B?QXFreHVLRVlzdzMyZklvdytJbkNLMHJuaUhWa0d6dVgwSkY3a2hsdEtISVY3?=
 =?utf-8?B?aWU1VGhqeVdnejZPVkd0ZnZHb0lrdEtTdk5CQUl2RDY1VDA5dEFxMHhrVm9Y?=
 =?utf-8?B?TDE5b3diSmpydzRwZ1hBSkhmU0NEVlF2Sm5rV1VhbTRsUXU1NmpocWVTUllw?=
 =?utf-8?B?Z2JNV0d5QlIxbXIya3pSamZqaHVyNHZJYnpjakRTZTB4WTlhR2VMclp0byt2?=
 =?utf-8?B?aWRJSUxsZXNpVnhPTDFSZS9qc1ZwSVhZOHdpNGJEY3ZJdmtBMlFvQ3ZkY09y?=
 =?utf-8?B?a3orZlp0eFVkNGZtd0ppaFc0V29HTVVFaXRZMWJCNDEvaGxJZ0x4cExHeTFv?=
 =?utf-8?B?K0dVRG5GN3VBZnYxeEo0TDF0Y0M2eURwL1pkWmhkNWdqeXBwNzcvMjIybWFP?=
 =?utf-8?B?THFIYTBpYld2WjhIbnRBc1QvbFU4TVh2RGJOVVNqWitIQ1djWk9sdDFYUWRP?=
 =?utf-8?B?dFp2bEVqNU9pWWp2ZllGd2JWeHcwMVIzL2d3dVZqM0Y1OXc1QXRQVU9PTVJC?=
 =?utf-8?B?dVJ4b3VDUjdYNUVMb2tuSG85OHZHMXM0dGNleUtuUy9OZVZRc0o1N0xTZWhR?=
 =?utf-8?B?QmtCRGJzZXVUMEZTMkk2RWVzMzk4V3ozNERyWDRXelh1SnQ3UHJXKzYzbG1C?=
 =?utf-8?B?enBVWVc3MVdJUHFNdXJxNXNBNFVrSGVNUzRlK3J0OU9KQmNlL3k1c2F4T2tj?=
 =?utf-8?B?d3RDSThwTjJlWERkT2pyN0VvQlh1Sy9WMHVNVWR4dVo0d2sxWUZJMkJNV2hh?=
 =?utf-8?B?R0Q3YjZucUhsUlBwd1Rqb3lmbWZ0eUNxWkpCaklzWWVHdkpXcU1pZDl1UmxJ?=
 =?utf-8?B?alVHQ2Z5SStEcmRXcTFyNmMvRnNpWmdlcVk5bkNTRzY4TnMvcHZEeGt5dGoy?=
 =?utf-8?B?K1VmTlByMzhFak1kQUU0eU51SUZpVVNjSzlkY3BTRVgvWUdkK25jdkxQVFJ4?=
 =?utf-8?B?SEdITTVDVE9WdHYrRlJoRThYOUxrenhCRHZBOE43SnpERzlTMitMTE9VdHA1?=
 =?utf-8?B?OWh2dFd0dGozSm05L25BMnBaQUorRHo1WkFwN2VJU0NOTFpkVVY2REprWUdy?=
 =?utf-8?B?RFpBbDV0SVFpS2pqUEVUNC9JSldmNFVaME1maUNwWEhXbHdxajAreUVlOEpC?=
 =?utf-8?B?eWExT2wrcjFxbE00MUhtWXlMdTJqdVMxR3dhNVVXWFhoM25MbUFLMlRIU3o0?=
 =?utf-8?B?TkhoL1B6ZUMxSHdlSWgvbUk1a2YxSnIwU0I4M05jcVVCeGxyU3pFa1huYWEx?=
 =?utf-8?B?WmJuQUZveVV6Q2duemREVE1KNWt5SE9vTHJoTThtWDJkS0ZuMGp2TFJPc3VW?=
 =?utf-8?B?RS84dGV4RktkZmQrVEhCZFhIT3B1V2MwV21VYUFjZzkrZUMvYjdGbjRmV3NI?=
 =?utf-8?B?emVnblF1MG5vcHFFTmlaMzhsU3JidWxoREtla0dHNjNZTUdPMmxHTFpQVTZO?=
 =?utf-8?B?dk9FbDdzaS9SSlJXcVBZaEMvdkRnYTVUNGtSZ1F4b2swSU9JNnJHMmJ4THF4?=
 =?utf-8?B?cGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	D/LHk0BgrbsU7OO7D53rHtH+Rnw5meW8BxVBPrdQZthPePOp189sY3fuJNQp5+UA3HD4+F7hm0gMLl6ovQWCjeTeO7enYsJCzDg/JFJBQUSkT37RK/ZvmNfU4BkQ6vEP5pM0JZ+/sqzitfEg6vRX8GerNYvpWiPdlwBZ2SbV9Yzwvbp5gHQ6EJ50DJXrHHboPzZabnebA5L5cS3gSDzjyrEELHkAEV5YQAkfdRhffeNOIkbkAABY4sEk+eKnqZPphntOhNQ5RNx+mKSuoHZsTct4JLfBCVgKyvUkT4lJSnJVmzppZT47AYOwxIS8iweMhrpxLRCyXPHJodV1QW5/4u18mWA4fbDUxnZdq6JUWuXUTZJ/MHgiJO2s8X0uwDHhWeZ4DKIDhAItPraNax3Sui0+5gqczLHji3GMY2g548pT8STXKZKLRw7qgx1RoAwxk4JrD5XCrj6KA5XCO02p0LKYSb5+4xsHCpEmw1J8rtlaFq8mzJ6L98ykty/u9n7otgzvVYVojvQeAcYdbCt5YrNFpBzATOMalAUjl/CiCMCqCKOywfcfjdak56kxYoFU/Xf5CPa5fubDlhUuXBnBbx/4DBe4dzdJUO25/Au0hVAat70Y/2qkXW6mduodm08peAKPWVQhzVmzECGBwmH135dVT8oB1nZt8WZd32zbO+8vb8c9KozCOpdZJcwJeaIimWMMvfKZtgM1xi9LRDWz92l3yXF62GdcjgReLbeE9AM3F/xw+AXCoK2qfLGiYq9XpBgolVpT8NhEcun2Ob7x9G+TClueVmLTe4aYLBnTCr9vqwzNvGA3L1bVBssW5kIKjEdk1KAeFoMpArBdUPJyTUsd18HbJzWzMsNrI7rnkIg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8bc281b-b150-4018-5c6a-08db16a381d3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 20:12:51.9774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fON4rdD1YReWCsZtYKfOoGHQGD7XCkJUsR8rvsy7jKgmZnqzR4RFJHkBSFAoveveGELEW7oDRTMa4BEWsP1mRD+Ik1Q+qBHkDY44n3aoWt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6073

On 24/02/2023 6:50 pm, Xenia Ragiadakou wrote:
> diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedhvm.h
> new file mode 100644
> index 0000000000..43245e13de
> --- /dev/null
> +++ b/xen/arch/x86/hvm/svm/nestedhvm.h
> @@ -0,0 +1,77 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * nestedsvm.h: Nested Virtualization
> + *
> + * Copyright (c) 2011, Advanced Micro Devices, Inc
> + */
> +
> +#ifndef __X86_HVM_SVM_NESTEDHVM_PRIV_H__
> +#define __X86_HVM_SVM_NESTEDHVM_PRIV_H__
> +
> +#include <xen/mm.h>
> +#include <xen/types.h>
> +
> +#include <asm/hvm/vcpu.h>
> +#include <asm/hvm/hvm.h>
> +#include <asm/hvm/nestedhvm.h>
> +#include <asm/msr-index.h>
> +
> +/* SVM specific intblk types, cannot be an enum because gcc 4.5 complains */
> +/* GIF cleared */
> +#define hvm_intblk_svm_gif      hvm_intblk_arch

I know you're just moving code, but I simply don't believe this comment.

This additional delta seems to compile fine:

diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index dbb0022190a8..111b10673cf4 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -154,7 +154,7 @@ void svm_intr_assist(void)
             return;
 
         intblk = hvm_interrupt_blocked(v, intack);
-        if ( intblk == hvm_intblk_svm_gif )
+        if ( intblk == hvm_intblk_arch ) /* GIF */
         {
             ASSERT(nestedhvm_enabled(v->domain));
             return;
diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h
b/xen/arch/x86/hvm/svm/nestedhvm.h
index 43245e13deb7..c7747daae24a 100644
--- a/xen/arch/x86/hvm/svm/nestedhvm.h
+++ b/xen/arch/x86/hvm/svm/nestedhvm.h
@@ -16,10 +16,6 @@
 #include <asm/hvm/nestedhvm.h>
 #include <asm/msr-index.h>
 
-/* SVM specific intblk types, cannot be an enum because gcc 4.5
complains */
-/* GIF cleared */
-#define hvm_intblk_svm_gif      hvm_intblk_arch
-
 #define vcpu_nestedsvm(v) (vcpu_nestedhvm(v).u.nsvm)
 
 /* True when l1 guest enabled SVM in EFER */
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c
b/xen/arch/x86/hvm/svm/nestedsvm.c
index 92316c6624ce..1794eb2105be 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1247,7 +1247,7 @@ enum hvm_intblk cf_check nsvm_intr_blocked(struct
vcpu *v)
     ASSERT(nestedhvm_enabled(v->domain));
 
     if ( !nestedsvm_gif_isset(v) )
-        return hvm_intblk_svm_gif;
+        return hvm_intblk_arch;
 
     if ( nestedhvm_vcpu_in_guestmode(v) )
     {


but the first hunk demonstrates an error in the original logic. 
Architecturally, GIF can become set for SKINIT, and in systems where SVM
isn't available.

I'm unsure whether its better to fix this up in this patch, or defer it
for later.

> +
> +#define vcpu_nestedsvm(v) (vcpu_nestedhvm(v).u.nsvm)
> +
> +/* True when l1 guest enabled SVM in EFER */
> +#define nsvm_efer_svm_enabled(v) \
> +    (!!((v)->arch.hvm.guest_efer & EFER_SVME))

This seems to be the only use of asm/msr-index.h, and it's a macro so
the header is actually unused.

I'd drop the include - its a very common header anyway.

~Andrew

