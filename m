Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC41577D009
	for <lists+xen-devel@lfdr.de>; Tue, 15 Aug 2023 18:24:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584014.914400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVwqH-0007mw-Iw; Tue, 15 Aug 2023 16:24:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584014.914400; Tue, 15 Aug 2023 16:24:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVwqH-0007jw-FZ; Tue, 15 Aug 2023 16:24:25 +0000
Received: by outflank-mailman (input) for mailman id 584014;
 Tue, 15 Aug 2023 16:24:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nTNg=EA=citrix.com=prvs=584bb2eab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qVwqG-0007jX-1U
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 16:24:24 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30c7b3d6-3b88-11ee-8776-cb3800f73035;
 Tue, 15 Aug 2023 18:24:22 +0200 (CEST)
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Aug 2023 12:24:15 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5449.namprd03.prod.outlook.com (2603:10b6:806:bd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 16:24:11 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 16:24:11 +0000
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
X-Inumbo-ID: 30c7b3d6-3b88-11ee-8776-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692116662;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YtXT+zHkkTDfGW6dkFYSxTk5sUiY/e1LuyMyjgjIiRE=;
  b=JisWk2Jnmm4BifqMrDSPQrZjQZu+yjpVM9LTvMPaJVFjrpWlwGDURraX
   citxu8Fw51Xiv9OfsbVbUgKChTbxlQr/tzgqHShmaApCk01cDvBkxfFUF
   WPXARmyU2b5wqLqy3lvbyv01woQbXmOkULLeiGG5P8fyk8nAuQ4ZCoP7T
   8=;
X-IronPort-RemoteIP: 104.47.70.109
X-IronPort-MID: 118828224
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:S6nREqsTG2/IGnJ381+3ERwVi+fnVNRfMUV32f8akzHdYApBsoF/q
 tZmKT/Xb/ePYDfzLtF/bIrlp0IGsJXUmtFiTgE4+yg3FykT+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Vv0gnRkPaoQ5A+HyiFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwGDECUwqlwMaKkfGlSshcuMoaHND1I9ZK0p1g5Wmx4fcOZ7nmGv2Pz/kHmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ouiP60aIu9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOThpq4w0AfJmgT/DjUrbAuer+O/q3KHUuxPK
 2c+wDIiv6ILoRnDot7VGkfQTGS/lhwVXdZKAvA5wA6Iw6vQpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRu2JCscNn0qZSYbVxoB4N6luIVbph7XVdNiDK6dh8X4Ay3t2
 CuNqDUihrIVlogA0KDT1VXOnz+xvYqPSwkq5Qz/X2S54wc/b4mgD6Sq41XG6fdLLK6CU0KM+
 nMDnqC28+QmHZyL0iuXT40w8KqB4v+ENHjWhwFpFpx4rzC1oSf7LMZX/S10I1pvPoAcYzj1b
 UTPuARXophOIH+taqwxaIW0Yyg38ZXd+R3efqi8RrJzjlJZLWdrIAkGiZas4l3Q
IronPort-HdrOrdr: A9a23:uLnh5aqPKxSU7iNsyP/FKx0aV5oCeYIsimQD101hICG9E/bo9f
 xG+c5w6faaslsssR0b9exoQZPwJ080lqQFgrX5X43CYOCOggLBEGgF1+TfKlbbexEWmNQy6U
 5WSdkaNDShNzNHZB7BkXGF+gwbsb66GX2T9IPjJqtWPHhXgn9bnnxENjo=
X-Talos-CUID: 9a23:OX8pM217LrboW330fl0ZpbxfKsEqT2f7i1PscgymCUdZdrOseUaO5/Yx
X-Talos-MUID: 9a23:Sd80ggmEU7TYY5R2f0lVdnpfDZdN7b6oKXw0mKsWu+KuDzR8KT2k2WE=
X-IronPort-AV: E=Sophos;i="6.01,175,1684814400"; 
   d="scan'208";a="118828224"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PREP67LCP3R19+89Zj0Na9vCo1SEAEckDkd+xWpRJoER9SC0OSzhAJZ938tSlBZ+ALleZcNjOP6PNSUrx9jdNJUeVGYD8xYv1I+nUhSrdiYH86dr/yYtLfiAdRJbj3T8m5m5KfMJi0AZbOcYwX8MjebQoBhaMVC5QkhsVx9nKe+DMIkzOL9wpefTCRS/W5n4cs1Ln2ZpWJQ84fL+0yO52FrzTrI43+D7R4V8kKIxsyOeoTQH0YNkLXLV+oz8E95TuX06Tle5pHN1+4MfYwbujcuTloICUITC7jJHbIY5N6VJH3bXKTx725+htTP80T3105leAVujNlJB2qcLuQN2WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dn+xj7b0Q1Bd8AmbdnUntun8VRaZs0xVnCmRmJe1gZo=;
 b=FTVdU/9eyxMuhDJbCKKNs3wEfoW7PRIC4bhP/JKXxvzJ2085ILrW6MNKwlNuDtAWZom/yh8YczPz4tBPm0/mhWgq9ifrqxmMNpPSWtMxOBhkpOSoMR81QrTmrrGlmdTs9ctJIPV5W8+SclicELB/0rW+n99xck4bI7JalIrB713UQgEjXprg0wdhgem6cFvUlstdOCouHopTtHlXx6pWMH4iUQdBnP5eZJgUGKXQ7rzO29b0lu+EOUfoqrHbdNoo7h8Nab78rbVg7I1hkxSUIeMXRJQvytmh39/+2dpKBbaZF5GCcz6DKluZCnaBGxQlUMozfl+0GUDvzw6/Qiciyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dn+xj7b0Q1Bd8AmbdnUntun8VRaZs0xVnCmRmJe1gZo=;
 b=BubfQ7ttGE8oS2/UyJqMDa4Zcd6TfIc0HPEj+ySFvJemW+FoK4g91Ds2PTvuThyfD8HkiMjWkQoN2Q1iGbivQxDdnI9FgAYwTG2yVITvJydzPmCsoMZe/IP8sVczFObHLngTYKL05iR9lo38qeThK1n+1NXq17mVpMQPJSba6v0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <39aa7f6b-f80d-786c-f91e-49e9cd87c13f@citrix.com>
Date: Tue, 15 Aug 2023 17:24:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] tboot: Disable CET at shutdown
Content-Language: en-GB
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=c3=b3wka?= <mateusz.mowka@intel.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230815161120.33007-1-jandryuk@gmail.com>
In-Reply-To: <20230815161120.33007-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0217.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA0PR03MB5449:EE_
X-MS-Office365-Filtering-Correlation-Id: e408df4d-ff6d-476a-7cd1-08db9dac0e9d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xNx/rJ+YD7X+JIRYQJHl4+buO/NxWuuAQmGAm37iBSUj2+IXPlkdsT7Wr8wuqltdGaQ3/TYAUhWyxbsGTdxCw+r7VMAYZzdFWJkNpNer6ds0MZjxoa9NC5QuKO2gM18LP/Q3m/MW8DIaQytAtZKMRYizaDINKrbirZLuyHSa8tjZJ7BdPdubz94CWP0lstRHsmb4vxzm01y01CabFhTIf/AMQ7xoBCprsywYTgCiHKem3smDPLzHw9s1pvax62T1ETi8bmUtPpV344eYuf3iA7RHcgEY6iqhwDNPn5Ef0flqzXFOg79F44a+FZlcJBxrzjb07GXHWrmtEkhxJJDkyAiE7yGQjM4f/UNx/GczeFf7hRPSFunlU8q2e5H+5+NS3VAsyTOTA1zfMM+Lgm14hXmPL/6AL+G1u9B5YDm5Cxo3fut51K/4ITs5JoYu5gtPVcY3ImutjerjVUGwiiVNP+ZgbvoVwaDvXA2NxMhlgPzIm3HzmlgHVQUECyqRYQ7YN4SCdBCJebb7m5Z8JlGJ+kGKLT0RZNGdjgukN8hdeC3QjOU/YCCqLzex7bgP45rvff/G2GL1PiqU/m89ZViSpai2TCqT2Hb08dongVetcQG9kAR93Q+LObVjUjJ8BoDj2Zm9/rSAq1T3X6tGsv+L/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(396003)(346002)(39860400002)(1800799009)(186009)(451199024)(36756003)(54906003)(4744005)(66476007)(31696002)(66946007)(41300700001)(4326008)(86362001)(66556008)(8676002)(6512007)(6486002)(53546011)(26005)(8936002)(6666004)(6506007)(5660300002)(2616005)(2906002)(31686004)(316002)(478600001)(38100700002)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXcvbko0VDBGQkVWQWNEelZDdGVMdklBY09LODBIc3EvVzdRNURlWWt1Umho?=
 =?utf-8?B?ZCszL210M3JQdm4waVZWNDY0QlZhQ3p5UFh0bGNYdHFyS1FmaWJEZzA0WTBI?=
 =?utf-8?B?M21aWDAxaW1iNlhUd3JTL1o0SWg4eExMR25iL294Rmd0ZS9aYkd1cUFZcjZl?=
 =?utf-8?B?bFIvWHk5WDVCNitvUEorL21TT1VCNzZYSzNjREhEN1d3RHRoejRJQWRya1hI?=
 =?utf-8?B?bm5kUW1zdDZDTHFGVi9TaVV3U2ZOdmI3Y0FSS0JMMVJMRld1ZC9SdVNYaWxl?=
 =?utf-8?B?YXdGVzJudkFWYkJPWkFzUi9wWXJIeWFoNkdnUS9DRk5IVlUrbk9WNzlHTDU5?=
 =?utf-8?B?SEhNQzk2bjdyMWlXOWF6aFZBekw0cEZrUGFxcGloYWZLSGRScjhFY3R6RXMz?=
 =?utf-8?B?R3NnMnNGc1hXTlRKbFVtbnhxOCtYOGFCRnlDdGhBZkI4T0FTeHVVRFhFSGI5?=
 =?utf-8?B?a0FxR0l1a0lCWGJVMjJQZmFZY1FnL0doUjJscGVpVGJvZFJ5NEZtVEtOYVlr?=
 =?utf-8?B?NXlZQjNTcDR0Ykl6U25MMEFnSFBReE5YQjRNUzRiVTQvK1VRZ1hVenpsbzQ0?=
 =?utf-8?B?WUNjRTd6cm0vZWgxSndFK2xrRVBIdzZGME1jWXdnOUhMYkQ0aTVhQmVhZ2h6?=
 =?utf-8?B?LzJGM3BSOTlpZDA1eXZzd0JVVTlhV1U1clcrK0ZGb3dlSWUvYzU0Z2x5ZzYx?=
 =?utf-8?B?aVlQQXB1cTgzL2NDWDRBRUdtQlpLNTI0b0JxYnlRNnIvVkIwYWd3NTlyZDBh?=
 =?utf-8?B?K0hUa0NyeW90TWpYMHlzTG1mUHBJVllsckhNSHd0L2JLS3VOY3dwVXhqL2ZL?=
 =?utf-8?B?c3lVWHVZMUFncU93bDRsMnNzQit2Y1BCcDZhaEdvc3VHcUVFUFRrenhkRXpH?=
 =?utf-8?B?QnowTlRtaXJiSzduVEUxUlJ0UzVWK2poUzVNWlA4dHAxUEtlTkxnMFRwZG9t?=
 =?utf-8?B?MnV0S3BjREphbndtT21xTklYbEdMeDRxcHhucG9BQWxLd2dNZlBYaDRnV3FE?=
 =?utf-8?B?d292UDdkNXhuMmVid1J4dFBFSmRBOEg5VVJtaVZBTEhwbXZTbkdFc0VQSFNN?=
 =?utf-8?B?SnNmcW9qQ01RVklKVXM0eGZSNFZsV1V6VnhnOGMzS1pMT2JBWDF3Ync4OUE1?=
 =?utf-8?B?QXA5Z2xvNDFDMGltVytEUjU5ei80TFNHYWY0M1NUREQ2aFI2M2tWNHEwVjYy?=
 =?utf-8?B?Ym1QMVBQRDhNV2ZkYlpBbDBOSzN2TlBCMjRXSUZoaFRMeHR3QlpiRXZ2SC8y?=
 =?utf-8?B?cU00WlRqU204b3VSaWFkNER1V3VwN0QyTm12dC92eEZQVDI2Q3hxaUlMdWxs?=
 =?utf-8?B?d3VvRmF5dXVudkJHMEw5L09Dc09PL3dtMmhCd3IrV2RVMDFDR2NTdllqcjNH?=
 =?utf-8?B?dmdRRzMrZmRod0htcWREMERmeXBucks5RExiQm4yZFY1YXRkeitOSDBjSVZK?=
 =?utf-8?B?V0twUjdqM1o0ZWJqZjU5Y01uV1MwcWxOV21Sc3F1WjBRODU3M3F2M2ZOdytI?=
 =?utf-8?B?MEZsRzNGeWJ5OUFKZDBCbFVFUUx6M1lQaWlFNmdPQXg4dmdSbSsxbEM5Z2dn?=
 =?utf-8?B?NnBIck8zVE9WZC93N3ZYcFZUMDdZak5nYVplOVFPRmxEU0xwOGU3cTlQK29w?=
 =?utf-8?B?SlFpeUJuTDR4OS8vYmJzNGNGczlwQkJOVGNFRU9tMzZXUnZXRkNxZTdXWTdL?=
 =?utf-8?B?ei9hN3F6NDNERksrZXlxRGtBa2hCenFzangzOG5adDJ5MytTMWN1NlV2VWJh?=
 =?utf-8?B?d1RHN2xhaTdQRHBQVXFZZFFKMnJRQXFFc0FnTkVncDZxNWJ2MjlPUEU4WUli?=
 =?utf-8?B?QkI1NXlNOWZwYVE5emdhTVpKK2ZZYStSWHpSVjl6NWNyTkw1YWxEa1dqVmVu?=
 =?utf-8?B?dVNEdVBmQkVjQTg2UjhJTVpCQTFNUEhOY05HMTduVGIwTXlURGJLTXpvaW54?=
 =?utf-8?B?Y24zOVhXazllSTlBMlVHcTJUM005NjhmRWNRVDR4VHhjNHJaSGZ5UWxkMTFy?=
 =?utf-8?B?TXJkVXVpUVRyOEEvLzA3a1VUeUpRcjhMb1BGdktLM2Z1cjVYQ3dJWTE1OGFq?=
 =?utf-8?B?VFFUK1NRQ01wcVMyM21ya2RKRmN6TzRsOS9jOHFqVnR2N1ZXTk1VakFvcmd5?=
 =?utf-8?B?Z1M0NWh2eG93T1BmMUVtUzBJSEdUOHpWWEVHNUorUVZwWW1rem1QeENySVhW?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?NjF3NTlrZDB1dmdQeDNjWk5aaVoyby9uWDNoMnRPaUVGVldLSml0NFQ4YS84?=
 =?utf-8?B?RlVXa0V2TVAyNEJmVmp1SndpRENvTExPRFdrOXY0T3ZsNk0zak56d0VYZVM2?=
 =?utf-8?B?VFRhSjY5V3J3bmRiMlZGQmthN3dKK2srZDJ4YjQxK25IRDZjVzhWenRNYi8w?=
 =?utf-8?B?Z2t2WlpFbHYvOFdpcFMrdGw0VEtMU2Q3d21kSWcwY1VyU1BQTnJERTNwVzZ1?=
 =?utf-8?B?bGxESEYyOUNYRWhxQllMWnZwZW1GVFNWc2tCT2dNMVBoNlRpMjZKZldBclFL?=
 =?utf-8?B?ZlVqK2pjWGFXMitZd2NHcDdrTnNrWlI3Q2RiR0I4dytJSk1ORjNvN0RTalZt?=
 =?utf-8?B?QU5McWlxcmd3aTBzOThlc0ZCbHFZN0xqOTdYY2lNdE9MdWl0WUFwcTFXZEt3?=
 =?utf-8?B?ZC82cno0K3BrY3ZlaHhFL2x6ODVqREU4eXQ1TTJMNzlYUmZMWWtZZTR5SHhm?=
 =?utf-8?B?WTE2T3kwMHR2NTlMa2MzQWgwN0gyc0tBbjhNYnV4bTNSNStQcjI2eXR4R3lr?=
 =?utf-8?B?TGNFNFdMOWVHUVhjWmtQQjYyeG9zSkdPVVlMbWRzWmpaZWkxeEVQQm12emdv?=
 =?utf-8?B?ZGR1WGlBaGVxY2p5TmJJbHREMHFtMkd4Rkt2dEs4bHlwNU1uUzZJNXRsWVUr?=
 =?utf-8?B?RGg3V1JicHJORkZyTWpZbW81MGR2TmtzOXQ2dFB4N0kyN3FxZWR3eXNJOHBB?=
 =?utf-8?B?ZFl3WStBQWF4MkZ6Z3RueEVqcFhVRmxiUCtFZlRjUWF0Q0g2ZXBCK0plY0RZ?=
 =?utf-8?B?UTRnanlTdEc2ZXlFdGZ5ZENlQVNPa0ZOc3poZExjZWhkRUQ0dTdNY3Z1VTU5?=
 =?utf-8?B?L0M2RmVUWklSSU9zYmJUMnhSUmowcnhCb0FrOFBlM3hHanh5S2hhRi9vWVRZ?=
 =?utf-8?B?ZEs0TkZaT01tNklSMGl4RWcxVnlJT1JCNU1YakRKQmx0bjAwandWR0xvVnVw?=
 =?utf-8?B?NXpsVWwxT2hRN1FHSWo4aU9NWERMM0tramtMai9mZUVCVlhUZkFKbENDS3VM?=
 =?utf-8?B?SWgyL2pkSnpzOThpZVRDRHpLa2ova3V5SWl3Um45VTRXbkFaVVRPd3lWRVJv?=
 =?utf-8?B?K0pJYVVzVGhwT3ZLazVFdXdQbUJ6eUxYVzVvYXZOeXFVbm1GOW1LMkZEeC9L?=
 =?utf-8?B?cFVZKzV0bjlCdmN5a3dBSEMvZTliaGZWUy9zeHVFRnlKeDEyVlNIS3h3RTVL?=
 =?utf-8?B?T0xYeHY1TUNQcWpkWTVXZE1XOWQvTk9NQnFLd25QRFZyUjE1R2UybkZLOENL?=
 =?utf-8?B?V2JMeTZJL2pZSFFnZGpobU51U1Jjd2F6VDJVMGk4V05GV3R1Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e408df4d-ff6d-476a-7cd1-08db9dac0e9d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 16:24:11.2025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UyibJFnwEieIkVSTO5Ysmbq5wRyjDvm24a5i5GDkt0VJmaUlU9mGxLNQBDKz7dPOYu6q+HsvKgPLNcOFJTLh+p3b7iSRjVxt1bQGJRwKEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5449

On 15/08/2023 5:11 pm, Jason Andryuk wrote:
> tboot_shutdown() calls into tboot to perform the actual system shutdown.
> tboot isn't built with endbr annotations, and Xen has CET-IBT enabled on
> newer hardware.  shutdown_entry isn't annotated with endbr and Xen
> faults:
>
> Panic on CPU 0:
> CONTROL-FLOW PROTECTION FAULT: #CP[0003] endbranch
>
> And Xen hangs at this point.
>
> Disabling CET-IBT let Xen and tboot power off, but reboot was
> perfoming a poweroff instead of a warm reboot.  Disabling all of CET,
> i.e. shadow stacks as well, lets tboot reboot properly.
>
> Fixes: cdbe2b0a1aec ("x86: Enable CET Indirect Branch Tracking")
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

:sadpanda:

I guess this is the least bad option going.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


