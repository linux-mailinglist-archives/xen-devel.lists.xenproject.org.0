Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAEE6FC87C
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 16:04:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532233.828324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwNwS-00070n-6a; Tue, 09 May 2023 14:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532233.828324; Tue, 09 May 2023 14:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwNwS-0006xo-2H; Tue, 09 May 2023 14:03:48 +0000
Received: by outflank-mailman (input) for mailman id 532233;
 Tue, 09 May 2023 14:03:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vSxc=A6=citrix.com=prvs=486b9cf0a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pwNwQ-0006xP-HK
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 14:03:46 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e694ffd-ee72-11ed-b229-6b7b168915f2;
 Tue, 09 May 2023 16:03:44 +0200 (CEST)
Received: from mail-bn8nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 May 2023 10:03:36 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5363.namprd03.prod.outlook.com (2603:10b6:a03:225::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 14:03:34 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 14:03:33 +0000
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
X-Inumbo-ID: 4e694ffd-ee72-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683641024;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AqTAeukQRylbsfIdYnWv38oZH9fwytMBSHnXx258v3g=;
  b=Y42yKCMC9INQYyWdSaPf1kEv6axokBYqPX8nJW1CQ4e2rT7tBM/5+Uku
   5i3bZ1/JNOxnTu5Vebj6ltNtOn3PFnsXst+G2BEEn5FI5pjOhQ5YBFCL0
   PuAdlFRn6pE5W1WSRnxGvG0U+DU6pHqEXawQUMYRE2lN3bkPC/4ltL1WF
   I=;
X-IronPort-RemoteIP: 104.47.55.170
X-IronPort-MID: 110846984
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:p7rKMatjY8Y0z4LafK8crfZ0eOfnVHtfMUV32f8akzHdYApBsoF/q
 tZmKT+GafqCMWamf9F/a4TlphtQ78SHyoRhQVM/pCg0RCsS+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AKGxiFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBm4QVVO9rsiK7+ylZq5jweoOFpbqM9ZK0p1g5Wmx4fcOZ7nmGv+Pz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60b4K9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOThrq423gzDmgT/DjUrc16HiqGJoXWBRvd4F
 1IfxysPtZQboRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBscOcey9zqoYV2hBSfSN9mSfSxloesRmm2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBNrxooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:CJzdU6GwUeYiCHSwpLqFBJLXdLJyesId70hD6qkvc20vTiXIrb
 HXoB1E726MtN9IYgBXpTiBUJPwP080hqQFqLX5XI3SGjUO3VHCEGgM1/qR/9SNIVyDygcZ79
 YWT0EcMqyoMbEZt7eO3ODQKb9JrajigcfY/5ai854ud3AfV0gK1XYJNu/vKDwEeOAwP+tIKH
 Pz3Ls5m9IvEU56UixmbkN1OdTrlpnnmI/rawMBHD4LrDCUizml8qT3HnGjr1kjuyAl+9gfGG
 7++TDR1+GGibWW2xXc32jc49B/n8bg8MJKAIihm9UYMTLljyevfcBEV6eZtD44jemz4BJy+e
 O8+CsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRu1kGbuusvwQRM9Eo5kiZhCehXUxkI8tJVX0b
 5N3Uieq51LZCmwxBjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VOI1oJlOm1KkXVM
 1VSO3M7vdfdl2XK1rDuHN0/dCqVnMvWj+bX0k5vNCP2TQ+pgEk86JY/r1Bop4zzuNtd3B23Z
 WVDk2ursAcciYiV9MiOA7Ge7rkNoWCe2OYDIvYGyWuKEhOAQOHl3b0i49a2Aj8Qv01Jd0J6c
 78uAszjw4Pk0WEM7zs4HVMmSq9IllUWV/Wu6RjzpB8o7L4QrCDC1zNdHk+18SnuPkRGcvdRr
 K6P49XGebqKS/0FZ9OxBCWYegWFZAyarxXhj8AYSPNnuvbbonx8uDLevfaI7TgVT4iR2PkG3
 MGGDz+Pt9J4EynUmLxxEG5YQKrRmXvuZZrVKTK9ekaz4YAcoVKrwgOkFy8osWGMydLvKA6dF
 Z3ZLnnjqS4r2+r+nug1RQsBjNNSkJOpLnwWXJDogEHd0vybLYYot2aPXtf2XOWTyUPD/8+0D
 Qv5mif1ZjHY6B4nxpSQe5PGljqwkcumA==
X-Talos-CUID: 9a23:846CtWypnWOUEVcoIYzlBgU6RN0eMUP05kv/fVGUTmkuZpCvFl6frfY=
X-Talos-MUID: =?us-ascii?q?9a23=3A7HiRhA7VDK/DP8/Szr8uLIyTxoxVxaGSIxg9uq4?=
 =?us-ascii?q?5puyjCTJ7Bja8lAieF9o=3D?=
X-IronPort-AV: E=Sophos;i="5.99,262,1677560400"; 
   d="scan'208";a="110846984"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFCd2Ms9aveMUTNZ+48oVx4aBEIsiMsd5H2zKfQa0kzwYjdudQ77sBP77gw6TD/SmWukFmKvU9fXU7vvwWygaQwnXQVuFr1MDPs4h1c75dvIP2CCO3G57uz2t1zZtZ04YPOcm8o83dApxatNhPsJp2/612Gr7Z/bqMs80BZCdNWx+cGxkBEwfGsuz7Ng5U8cFoSbb9WJ+rCV4UYuG0Dwhj2zo2Po/hjNEANk31HJgMh3qd5nFFnC+vpXHxtxGUOneY2D+ZwjC2iZ0lisMVT+Inax6Ex1bUU+Xa08M7RJzYu/6AMtme793j7BBqKAemVY6tQUrBBSXGL96d4YwlUsbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7Zc+P+cWPl8jk6EPp5iLJmV9pal8auTQVg8uTmw1Uk=;
 b=ZkFLWkgxK75AJ/696+shuutSWpkoy256ztdfkXDs3rMnK977LCAbXmLjgMnnMKXTjDtlqj7nGC78pMyKfCSkvD90UveBimMLF+dEyQ242vopX0BLpRJnVcOA5yFP9Hii7Fs8w4WOSTZKhqXsQI4R7Ifni6hwYiqklmmNLXE4s0eD0VU4VkS81Rl20GUMs1kDq+SmpxkWCDI/BbnYl266RV0ycfIERU0wzF4jGpDA74JFrJaHZqdOBz/bm7lxLosgbyi7ZDwQbjNahEs1uMfEEqT9OKgHYEuvRps8EUGurFK4g8HyfgoIs2CbMDSh4H8lym1DbkenKZsPd9nlZxPDNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7Zc+P+cWPl8jk6EPp5iLJmV9pal8auTQVg8uTmw1Uk=;
 b=oqnlpW537MrrjUz/HiqFkDaqG1b1ZSVaeNeWuSQ9Qv8ABVJH3S7b5fPHZUMj/hXeW0WSAgjQcgR9hBCss0eX5E2nNkpsY8ySyhEX1X9DzkCvquFTPzQBoA3yz9YxHdgrRuGaxCiQ/v5gDNpq8vCBNXEUoQjd/Z9K5ERzn4kRFw8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e888dc16-66bf-fc15-9ddd-f10879b79a5d@citrix.com>
Date: Tue, 9 May 2023 15:03:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/6] x86/cpu-policy: Disentangle X86_NR_FEAT and
 FEATURESET_NR_ENTRIES
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
 <20230504193924.3305496-6-andrew.cooper3@citrix.com>
 <9613df3b-c49f-6034-ff99-7a6ea9286f0f@suse.com>
In-Reply-To: <9613df3b-c49f-6034-ff99-7a6ea9286f0f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0071.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::35) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5363:EE_
X-MS-Office365-Filtering-Correlation-Id: c1fb9fd9-aad6-46f8-c362-08db50962cfe
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lEi1XvpvdEfLe1Qgrq51Zb9Sg1b9r7B1dznbrSY/2pUJERso7a+3EE24yBGUbB2Sk/XydyoyUmH7BnGMTkpeLRo1D7MK6YJHyHOsYI5zhMaCPIBJCM88waL1/nydeUK0H0jgBZAfpf9uci82oRHy60ZhJ+vpjwhSuGIoidLrenZjJD9eaDVhNMgo/162XLLwvLqCC2sLl5RndoEpN4/vho4b+HDWQHX+SEC55Z2EF1sEt1j6CCGJvN3t/ItTqPNU0KqA2czTM0C6aCsXJVNqc55FUTBjzugOQibBh7VPvFUNRwgDl33syZWaBTqCLVX+T5vlsY1GZTVb114xvKwmRtdsllch8Q8FU52Vc33tOxrnfEN/PrFKOUzkBdYrNdijPobaoT3WwTr094so5Hisv4kyfjEzNvHRuasB5XjTEm3Ypz+IKJJPdDmhAFHqw4HgYSAcfUScrXgu97GiWHO3YFpWIsuUa5iwo9nP2unTt9+1y5DODcjXqES5DrVoPG48MyLE5teG8qyZQR8cB4O5xdvfRt7WaV5zyK5RFpbOSzR7N6AYRQMdZKR60gJri0DQwNZXsFRyXoL50w8PXu238hY/09nxOZH51o7IpQlyjETjw5ff6si970EgpW7ioszlMmIf+CrEsymn1Onb7ruDbDczgTjBbTZ1M3/cQuMG9uQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199021)(83380400001)(2616005)(186003)(2906002)(38100700002)(36756003)(31696002)(86362001)(82960400001)(5660300002)(8936002)(8676002)(966005)(66946007)(66556008)(66476007)(6916009)(4326008)(478600001)(6666004)(6486002)(41300700001)(316002)(31686004)(53546011)(66899021)(6506007)(6512007)(26005)(54906003)(522954003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlB1d2FuemF6N1U2T0xGK3A1VVd2cjgrUnFmdDJYREpGaWdFYlZGelM3SG9F?=
 =?utf-8?B?UTJHekpaQW9aNklnZG1KRmxaOGZpbjY0a0FhRktwTWZMMHFNUGRyS3hkREY3?=
 =?utf-8?B?anlKYkdUZEdqQWlxc1NudHZzYWpVNXI3Z21aangwK2tvK0VCWGFMS3ZWeDFy?=
 =?utf-8?B?YlJiQzRaZURNZTJkbHlyVmFZZC9nTTFnUVZEY0VaWWQ4S1FlQUx0SjVrQ1NV?=
 =?utf-8?B?NGV3VmR6a0tza29hQmxYMU9wZU05THprLzJiYXRQME9wVy9PMThtQ1RlVWZq?=
 =?utf-8?B?ZWZuOC9rajdvdStWdXA4WWs2OFpaZGN6aEJJalAvYjZBVEQwaTJQWCtpYWtm?=
 =?utf-8?B?MWNxb2JBdHc0cTlVbWpCVUxBVDVsVTRpUEI4VnQ5emtNWTNwQSs1aWQ2cGJT?=
 =?utf-8?B?aEtqUDREbUt2T0lqQkdyMkVUa0ZYRmV5YWdWeTV1Tnl1NVRaeHlKaEU0RjhC?=
 =?utf-8?B?UVM2cDlqS0lKZWg5MC94c0xwSHBxeWxFRlcwdjFXZ0VmTElIRkpkYXY0NFZB?=
 =?utf-8?B?Q2ttWjJLanBuRzVic3ZaanRTWENnZkRvaGNMbG5lRnNYRS93T3RFQTZ1ZHdk?=
 =?utf-8?B?eFVlWFJnWlU2N0lDd0E3czV3aXIyM3FMNmIxNXFsZ0NNS3I0WWMrK0dOSmxp?=
 =?utf-8?B?ZndEbHVTUzRwNlE1QXA5cmtSYmVhVDc5dDg5bEVJYTFtWk1pS1JVRUJCM0NR?=
 =?utf-8?B?VHNiNHhGWU4wVS8rY09wWnJEMFJhR0dsOGphYzFaZ2ZBZ1RuNDJMWVAvRW1N?=
 =?utf-8?B?TWhTalV3R0MwajBObWxHTEM1S1NHWEE0akhFRWpVYjFEWjBvVTNFdEQ4OGYz?=
 =?utf-8?B?TllTSEtwdHpwWTFjQmpFM2JNN0NmQVNBNWFrVVNlVkU0NWlpZk93bDV3Zzkw?=
 =?utf-8?B?aE5TZFJqY2hHb3NKek56azZ0ckkwdjJ6bjFONy96ZlUwM2toclgrYkwxaHFW?=
 =?utf-8?B?Y1c5THNVcTVEeFZxUUQ2R0xYejZHMENFbXhWSWJQdjIyNStIQ1JySm5SZHZ2?=
 =?utf-8?B?SW81ZFFpbkZHc2tSc1d1UG80NHNZU2JHOFZYc0RPS250NXVacHQvaXJ2S3Ni?=
 =?utf-8?B?MERKS0RxSFJXemxWQkQ2NlUxdG5IU1lMSFo0Uncydndvak9RT3I0SXFJcy94?=
 =?utf-8?B?cnVVVVlmR25oODZqYnJ1dW1LaUdydXNHS003YWJ0Y1E2WjNDaldGeFNiTUtD?=
 =?utf-8?B?aExFNXhOa1hIUEEvTGpJeDNweGxEb1FyU1M2cFlCRHYwdkxpcHkxUWxmYU1X?=
 =?utf-8?B?ekFDYm82dEo3WWZUdWdmR002T25ScGsxaTBXNWhTQlprN01KL21jNTduU0sz?=
 =?utf-8?B?Wmk0dVFFcm5lc29ERWxnOEhsRXc2dnJ5cTJsN2pWWkdLZ2JUSHdaU0g4RzZN?=
 =?utf-8?B?ZXVkaDBMUGNLV0tkNklnMW5PMk9XL29RY3RNWFkyR2pOeTJINFN4MGxsdERr?=
 =?utf-8?B?WVVkbDhNVUVwUkE3cGp6UkphTWg4azhENXQ1K01IbjhaQVFsUXdXR1BwTTlw?=
 =?utf-8?B?NVl0MmVlcWdmcm5Cci8vTzJRbzhSeFVTdVhMQ3VnOWVTZzkrazZDTFFzS1VS?=
 =?utf-8?B?QnUzN1VwMWhoV0xFNXByQ0dzNlZnWnFuUFlXQWh0WURXWGpFclJNMmYyWUU4?=
 =?utf-8?B?Q3ExNmFGY0orMHdRcEpETkpMT3pyY1loYXNvQXZJZWJXZjU1b0h0RkxYYnlD?=
 =?utf-8?B?WS9HSTVEWlREOG9rQW9yZXA0MEJMaVRuYmxoMHQyeGU2cy8xeUlmTEtWMGdm?=
 =?utf-8?B?bHRXUld0TEtuUndlSlFsNlVCMm9FZWhiM0Fiakk0RU4yWnpINkxqNVdOUHcz?=
 =?utf-8?B?TGRnMTU0T3RBNGVvenZxVko4VXF3RzJ3c3VvSkhQWVQyTU9FbG00c0x0YUQ5?=
 =?utf-8?B?YmoyUjhJelRsOFpPVjdwRzhuOWtmUFMxbWNlVWtQc2NlMDlXaWdmNDRBT3Zn?=
 =?utf-8?B?TTVBcmxtejlNanBEMFgxVmtkOVdjajl6ZVRxbmZrTzEwcWlMTE5DbHo3cVo3?=
 =?utf-8?B?czdiSjgvem83eGZtV2dGblBJSFlmQnBlczJnVndPNENMTEI2TGZVRGZ2K1pY?=
 =?utf-8?B?MUoxQzhadGxYQXJaWEV4OFBWMUNxeWZGWlQ2TllPSFh2QU5kb1J0bDNkaHM5?=
 =?utf-8?B?RGJGMEhmd3ZNTmdPb0VDcmF1SE5YWnBVNjArYktrcDZ2cUFJMlVIWlpZdkM1?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zEb2OgPEj9nSbdlvXKDfEqx4MDwVCRGXgDe3HBQ5/OLybkjqe5mJs0p0QOa2qBCOj+tctaSCBIJyMMp5scF7OgodzlzG7c5naIq1Y0T9VaAw7lcF/3hiNCM/sWeWHXB4vDMwTzDD5I8RqeDze+Ab69dLMkasaujmcdW2XGA3eXgxJMavXwAQ6royLq1xlnbvrFIY49oeB2XzikwLIrxhZ27xSmsQy6AVrRXcsFegCCwliGRnDGBzcFZI8y5eP0yEwd2pcZ4ZGxLUFH0VmE/NDFg/Jun1yFPmNIEeSvc/7HeCntA2NLQAh633J8W+QKV+5oT9+G4jWbcZE5GmjhIc1/nm6HxqjITkqPtTUP1q9gdhNxpbcOwO/tMz/7c6DVBzUDTQJCa/E2TrgA43PbmsOCE98IZFrOO2Hc8ls6FeyRo5rpJD3gPaWqa1qyaaeTjqqGIsz0d/SiBhf5dYPIotHj/YqI+H/wpm8CinrxFcd7h54tYV8RrRzQ0stjRFV50h6epR/m/pnS5AZbZQ/NSwioZXrwih5LnvSbo4b0A0QJMJSeZ75s2+DOZ+CP6AR5SxGdp+MsfTUGOj8Qn6D1Lzz7UeS9fHA7WG2lTFMEh6kY4bXMZMBbk3Bbd71o2SjGGh0qsAWdfL4p7AgcUGoDSL/w3h/esgq5eJSSfPpntuMqxC/8CDe5NhqiUAFiU8eKw5/un3I+JIv5c3t0zJo9SIrfJepDFm9ylWDP681CI1/kyYso7ZmwJH8w9A96Ih7upXVwBqlWMXMJJTOk911Ot7JyQdJqS3GDO8zx/7C2xN/CqPknpSx6ret3sDwNPbqx3i
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1fb9fd9-aad6-46f8-c362-08db50962cfe
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 14:03:33.6735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8ey1mD8Qrevh/ZjN3pgB2AvZY6iOd4q44uxKDFEYRP+Kz1WEkrygpI40Ui9i4ULyWdLLQEwDKoYO7MafzQw7yTza8ukAzduzak0sayI/9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5363

On 08/05/2023 8:45 am, Jan Beulich wrote:
> On 04.05.2023 21:39, Andrew Cooper wrote:
>> When adding new words to a featureset, there is a reasonable amount of
>> boilerplate and it is preforable to split the addition into multiple patches.
>>
>> GCC 12 spotted a real (transient) error which occurs when splitting additions
>> like this.  Right now, FEATURESET_NR_ENTRIES is dynamically generated from the
>> highest numeric XEN_CPUFEATURE() value, and can be less than what the
>> FEATURESET_* constants suggest the length of a featureset bitmap ought to be.
>>
>> This causes the policy <-> featureset converters to genuinely access
>> out-of-bounds on the featureset array.
>>
>> Rework X86_NR_FEAT to be related to FEATURESET_* alone, allowing it
>> specifically to grow larger than FEATURESET_NR_ENTRIES.
>>
>> Reported-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> While, like you, I could live with the previous patch even if I don't
> particularly like it, I'm not convinced of the route you take here.

It's the route you tentatively agreed to in
https://lore.kernel.org/xen-devel/a282c338-98ab-6c3f-314b-267a5a82bad1@suse.com/

> Can't
> we instead improve build-time checking, so the issue spotted late in the
> build by gcc12 can be spotted earlier and/or be connected better to the
> underlying reason?

I don't understand what you mean by this.  For the transient period of
time, Xen's idea of a featureset *is* longer the autogen idea, hence the
work in this patch to decouple the two.

>
> One idea I have would deal with another aspect I don't like about our
> present XEN_CPUFEATURE() as well: The *32 that's there in every use of
> the macro. How about
>
> XEN_CPUFEATURE(FSRCS,        10, 12) /*A  Fast Short REP CMPSB/SCASB */
>
> as the common use and e.g.
>
> XEN_CPUFEATURE(16)
>
> or (if that ends up easier in gen-cpuid-py and/or the public header)
> something like
>
> XEN_CPUFEATURE(, 16, )
>
> as the placeholder required for (at least trailing) unpopulated slots? Of
> course the macro used may also be one of a different name, which may even
> be necessary to keep the public header reasonably simple; maybe as much
> as avoiding use of compiler extensions there. (This would then mean to
> leave alone XEN_CPUFEATURE(), and my secondary adjustment would perhaps
> become an independent change to make.)

Honestly, I don't want to hide the *32 part of the expression.  This
logic is already magic enough.

If we were to do something like this, I don't see what's wrong with just
having the value as a regular define at the end anyway.

One way or another with this approach, something needs updating in the
tail of cpufeatureset.h, and gen-cpuid.py can easily parse for a
specific named constant, and it will be less magic than overloading
XEN_CPUFEATURE().

>> To preempt what I expect will be the first review question, no FEATURESET_*
>> can't become an enumeration, because the constants undergo token concatination
>> in the preprocess as part of making DECL_BITFIELD() work.
> Just as a remark: I had trouble understanding this. Which was a result of
> you referring to token concatenation being the problem (which is fine when
> the results are enumerators), when really the issue is with the result of
> the concatenation wanting to be expanded to a literal number.
>
> Then again - do CPUID_BITFIELD_<n> really need to be named that way?
> Couldn't they equally well be CPUID_BITFIELD_1d, CPUID_BITFIELD_e1c, and
> alike, thus removing the need for intermediate macro expansion?

gen-cpuid.py doesn't know the short names; only Xen does, which is why
the expansion needs to know the name->word mapping.

I suppose this can be fixed, but it will require more magic comments and
more parsing to achieve.

~Andrew

