Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABB3769F96
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 19:39:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573425.898095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWqp-0005u1-IJ; Mon, 31 Jul 2023 17:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573425.898095; Mon, 31 Jul 2023 17:38:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWqp-0005rc-EZ; Mon, 31 Jul 2023 17:38:35 +0000
Received: by outflank-mailman (input) for mailman id 573425;
 Mon, 31 Jul 2023 17:38:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IyhG=DR=citrix.com=prvs=569984122=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qQWqn-0005rS-NG
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 17:38:33 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10306be0-2fc9-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 19:38:31 +0200 (CEST)
Received: from mail-bn7nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Jul 2023 13:38:28 -0400
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by DM4PR03MB6911.namprd03.prod.outlook.com (2603:10b6:8:46::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Mon, 31 Jul
 2023 17:38:25 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::8f94:c73a:ffb7:d5e2]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::8f94:c73a:ffb7:d5e2%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 17:38:25 +0000
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
X-Inumbo-ID: 10306be0-2fc9-11ee-b255-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690825111;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ehQgxGV0ALqij7tdngrosoSIfEyfIJP/HsmnoQ0LRVI=;
  b=FrzluYdPDmBNXPdex/RMj6R/0fUMdsrKl2geujQnDGWyKbxAyRKtN1EP
   OP+gpZQ05mvtz1P8bD/CY5DPflto1gYmMJ9ecEoHlZw7WSMuzQd+47mZp
   Pj8G67p46B9Vxw0s7TE9bv5frS+jBuCXaRoiDNK/KtDkmqIBrHUX03HE8
   Y=;
X-IronPort-RemoteIP: 104.47.70.108
X-IronPort-MID: 118037613
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:md+x36Cl7H8XkhVW/4/iw5YqxClBgxIJ4kV8jS/XYbTApD8l1GdWm
 2AYDGmDMqvYZ2H3LtxybI/j9B8PuJKDm9ZlQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GxD5wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwq9gnAkhT7
 achMg8oMw2Nir3t/5znc7w57igjBJGD0II3nFhFlGmcJ9B5BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK/exuuzi7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraWzXugB9xLT9VU8NZWg1qxy2MdLiY3SEuG/cuY0BHgXvJAf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmW0bbd6QudAmkCTxZCZcYguctwQiYlv
 neLgtfoCDpHoLCTD3WH+d+8pz6oJTIcK2NEYCYeVBYE+PHquoR1hRXKJv5dF6qygszwCCvH6
 TmApygjhJ0elccOka68+DjvnDaEtpXPCAkv6W3/V2ao7Ap/aJSiIZKh7VzW7/FoJ4KeU1XHt
 38B8+CO4eZLAZyTmSilROQWAKrv9/uDKCfbg1NkA98m7TvFxpK4VYVZ4TU7LkE2NM8BIGfte
 BWK4VMX44JPNny3a6Mxe5i2F8kh0annE5LiS+zQad1NJJN2cWdr4R1TWKJZ5Ei1+GBErE31E
 c7znRqEZZrCNZla8Q==
IronPort-HdrOrdr: A9a23:EhCcAqNMFKy/x8BcTjGjsMiBIKoaSvp037BK7S1MoH1uA6ilfq
 WV9sjzuiWatN98Yh8dcLO7Scy9qBHnhP1ICOAqVN/PYOCBggqVxelZhrcKqAeQeREWmNQ86U
 4aSdkYNDXxZ2IK8foT4mODYqkdKA/sytHXuQ/cpU0dPD2Dc8tbnmFE4p7wKDwNeOFBb6BJba
 a01458iBeLX28YVci/DmltZZm/mzWa/KiWGSLvHnQcmXKzsQ8=
X-Talos-CUID: =?us-ascii?q?9a23=3APeNT/WqiM8H/CEVgvkCHCKrmUZEbIn700W+LGlW?=
 =?us-ascii?q?HLDt0RrDKEmC+pJoxxg=3D=3D?=
X-Talos-MUID: 9a23:dCnwkAUQKOJeB9rq/APvgxNvO8lO2IWzGH1Ro7Rc5JeBFTMlbg==
X-IronPort-AV: E=Sophos;i="6.01,245,1684814400"; 
   d="scan'208";a="118037613"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhPyrkijPIEgonrtQ16kFQIrP8nSHKbDqwnwjlc9Fq9hNraHEe7a0LjYZxMDhXyQE36ZqpIVTjiQapYqEIyOmFCm4LVzbB91lVRT+MlKfoFCwjDjPma7lQFyXabZf0QGsxd3NIu0R2JG7ewAJqyadYfXpU7A/P69R4P8kz4A9UTxQ0okt7aRgFCr/fxshdzKq7HUH6s3YxrM7OTDVucVC/jj79UXXN1mmo6qCBBmaQ09+cAHmqZhakyK+SbcHtwyBENGD8ejibvprjvplTx90nUTu7izoPB/NinJcX3+myd2WKwuYUWtDixPosvyOjXVwhu+sCBhkEI/4+GpnzP37g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlWRApsgK5aUZKm+MHscNWsrbzHPHZHaInQ7SZkBRL4=;
 b=M2g+sBoch6FrGaxEVVEh8uUDZtliRAUi+De8NhteUoEPFIcYvrQweHut5HyduvL/EH7CE5n6K3f3X/dnkVIima64etDN5es7YSOiTnPTjmrB53dsZ49hD1GuaMa5URHdhDNaWaZJpq2Egi7/Ayw59gOgd4MAsJL77n1EU6XTfvszOoo/uNeWUeHM3Uwg7AVj5f7flkoFCX08vK+SI0W2JX4fHm5RliFnrNKF++de2ykzLR2XjgwIy9TprP5xXKyiT88xwv9XwaBcHnen1RsMVp9XBfgdloTAS7j1isdo59Y70BC/LXQz+Y78ehG0KoM4Rbs1QnJEt0lJEtftgm5jSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlWRApsgK5aUZKm+MHscNWsrbzHPHZHaInQ7SZkBRL4=;
 b=E97lLLaVXw9shtMkOm/aXeoz1lY7MIi28kyzj4yzhY94b+/FMfWpWuHhwo8H/PXoEwBFD6cFbjajTrh7Mp142w7+YImdD19Hnlb/ZJvnuY47hWSAXIxmEysb3vom8/M5thfcYsFYkcidhPIoUmgL1RhDdz6zDIHUV7I/CPsoykc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <67b5c363-a653-3f5c-ea3a-f52bfac3dc49@citrix.com>
Date: Mon, 31 Jul 2023 18:38:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 5/5] pdx: Add CONFIG_HAS_PDX_COMPRESSION as a common
 Kconfig option
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
 <20230728075903.7838-6-alejandro.vallejo@cloud.com>
 <9f0b7ab4-090f-21ea-2cf8-6ecdc7c02225@citrix.com>
 <3470bc26-3cbc-e0de-53ae-203449493b51@citrix.com>
 <06a3f79e-4345-7a4b-be57-728a8b01befd@suse.com>
In-Reply-To: <06a3f79e-4345-7a4b-be57-728a8b01befd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0026.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::6) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR03MB3618:EE_|DM4PR03MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: 80cbceb3-3109-471f-f222-08db91ecf11c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SuokF5vfv0sRV9qyp5U6siNz7neG735Q/1bPTaK0liUd8mFKBxm0UrCIC+V6QiZ7+04IS/Y4Iou8ZOuVn2fAgTLdABofjub6NuEL0VGOjMNNNWwEs9g5VisOoiVc7natB6tCIpFHTWtCqWjA+2pAW+EfJLbWAh6ezfkv+hBRaLlhxbHHiY1CsCJ7mGwt+CSAwwFOJCHk7UpJCOiD41RAi1D5g7I9meRBKIgMN34CkP1LGEoTXACd1ljJUPwINW33+tzVdQgkND/5j5SJJ0D7l2OCwCjjGl+gJO4HMFNYJ8OJifn7FO5LK/aBcjbnuq0duax5irlrVYjUlsQb0XF/meTwq89W/+YkCodp1i9RiEC1doTIRNAtlV1qzY9khtyF2APZnHbrtFdB9waCaDiIiXXevebB/Swak3gk60hEbwPMiQYsB+RCyyNF2TwmXoOPc3Q1Vuj/U8FoA0YCz73Ti6S0I5DrXM6HMFfqUkY5LZ2q8Mk2qNKeAgUF7no2sI/xRwJH4ZPixZNLThZDaZlmtwWWq/DGt5MXge9qffdE/KNDbgFwmp/kUKfbJMWkEi3xldVjtSjAopOStRcdY29U4/AAZNOaCalqj9njpX6gzZVbX+Szgl0Tn6f0j9X3QrMIyTfrvALjEz+i5Kw1Ie5tgQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199021)(8936002)(8676002)(26005)(54906003)(31686004)(41300700001)(82960400001)(316002)(6916009)(4326008)(6512007)(66899021)(5660300002)(186003)(6506007)(6666004)(478600001)(66556008)(66946007)(6486002)(66476007)(7416002)(53546011)(31696002)(86362001)(2616005)(36756003)(83380400001)(2906002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUl2R2w3VjRWb2JNcG5KdlUzbVl1M3JoSmFYUGVodGdPWmNjc0dJVmlrcFBw?=
 =?utf-8?B?TGl2L0hDa3JQZitkaTQ1dkJyYm44SGxoUUxrVW9FSTZjK21oZ3FaTUF3aDlh?=
 =?utf-8?B?cTNKMWVxVjlWOWppeUlkcEJyOFhjaWVPTk1KOTVucmhmSW50bmhWSFJ3a1Zt?=
 =?utf-8?B?M1FiaTVja01rd08yVmRHQlJKVzI0bDZQb1czM3lLSm50elN2UDdDdnV5K01m?=
 =?utf-8?B?ZGRYbEY0VGx6K1luUGtzN091NEYwZUxQcGNTc0wyWWx5eWpMQ285bFZ3MHlR?=
 =?utf-8?B?VldNVVJCeXRDQkF1UTNIRTBsWWI5ekpacllISlYzTU85YXVPQkZxVGRLWmV2?=
 =?utf-8?B?Y0krY2M5QmtDd1VjeXROWjZoUm1CdE81Tm9kTlVQdlFYQU9Tei80eHFDVS9Q?=
 =?utf-8?B?VFdjUTc4dFhWRFBHOFV0QXo2UzZKUlV0RWQxRTJIQWIxSFJES2g0Qi9PWUpY?=
 =?utf-8?B?UjNEcmlldisraXdRTEt5Q09pSGp4aDFHbTdhMVNTaWlTL1pFaXoyVFdwMGRa?=
 =?utf-8?B?anRwNEtBK2p2Vys1eUpUU3JOazdzd2tkWlAzS0VqWkYrdmx3VU1xVUoxMzdW?=
 =?utf-8?B?UWdvVERKeGp4TXRwZ3NyWk9WUnlYeVVNTmhGS3NlczlNbG11bXowUTc5WnF0?=
 =?utf-8?B?bmdpTzRXci9IK0NuWWFwNXZOUnRIekhCaEF1Z0pRODhEeHM1SEFvd1hnUDFi?=
 =?utf-8?B?Zks3UmsvaUxnMjQ3QzUzOTFtMU5Mbm9YT2J1MHIrUHoydTdxUUNwM3NBVWk5?=
 =?utf-8?B?cC9QZjhXSStJYk50ZzVpL3dwWnVmQ2Z3RitaZE80VWpPWUVtcWRFbk85SVcx?=
 =?utf-8?B?MkxlTG1oU1BHTld2WDMrT1VsWGVCRm9xQnBRVGQ0OExibkxzOHBuc0cySFBN?=
 =?utf-8?B?K3NhbGZvV1dnTTd5UTRxT1RXVndzL2dUOW9QR0pzamt3RFdhcmdEOVVyc1Jt?=
 =?utf-8?B?dkhJMWErRmxSVmhpQ1pzWFQrU25BT2g4UHduZE9hQUlVR2FybGR2R3UyYVZF?=
 =?utf-8?B?UjV4azMyWWFvOHJHKy9YQXpseHF6WjZMZ2JSalpVaDVaMXpaWWxnRDZiZGlI?=
 =?utf-8?B?RnF3LzFmZDlvTUs3eHNFOURidzBxcjl2ZUwyeTNwVzJJc0FRbExjUWFBVU9t?=
 =?utf-8?B?S2hKQkJYNDhtcFF3SXN5dzR3MnBhWUROREpQR3FoVDVNSVZwaUNFcjFmZTJP?=
 =?utf-8?B?MDJHUjVVVE1jTXZEdGpLa1N5Y3BXRkR2UDFQR0ZvL3BjWm5Kd21yZElxazVz?=
 =?utf-8?B?dTBldCtDa1VkTGx2VC9tMG11ODZwYkJQM0xOY3FuSC9SQStQSzRZeHV2NEph?=
 =?utf-8?B?RENSb3V2NUhIWFJxcnQ4QUhjZnVyZ0VRNDFRaDNGTWVOd2tTTHZkT2hRQzQr?=
 =?utf-8?B?dGs2M0t5WmhGbm9vTkt2YlhuVUp3MmNGL1FNWmdHc1N4SkgvcWhYaUtqQXpw?=
 =?utf-8?B?MlpVQVp4NWM0RlJKZ3c4RFlGQ2pkUUhXaVpBZi9jUUEvK0NCQXVhQ3hMbmJE?=
 =?utf-8?B?Qy9MYmZtcXpsVmJ5VTdhSVZMSEk3VkpERWw3K2lta2daK3hIOUwvdTBMSHVR?=
 =?utf-8?B?emZKcENhaGhxdElRUHJ0SFpvSEFRSUc0anIxMDNuR21ZTlRiUE5HSkVPdERM?=
 =?utf-8?B?elhwWWovYkVEZHpqK1VUT3FrQlFtL2RIS0lYVG1PYy9QUSs4SDJSUjNneWR4?=
 =?utf-8?B?dWdNQ2tGMEFPKzNyQy9IMVVLTm1XcHNNTDlFSHdrc0VvZGlFTnQ0SlNFM1Rm?=
 =?utf-8?B?SzFkWk53RFpQdUM0RGZUekJ3a1MyR0h2cXF4NUZjUXFDbFJ1ODlpSk1xb3kv?=
 =?utf-8?B?QWczK3ZwQWlGbDhoem5aUytNSXlQUzJ6L3h2WkhwNW5DMWlCclhuUE9OSWZo?=
 =?utf-8?B?UmJ1a2tlUnZaYnJ3Mm1OdVl3a3VJSTZ0MkFTdVZ3RTljNXpMdVpJZUI2eHFz?=
 =?utf-8?B?ZnMvWEkxNDlwZFF6RUxVRFdZdklSSFZScDFWSWc4bjIvRE1tNVU4bnZKcEpH?=
 =?utf-8?B?WnFrNXJ5UThicWU5QXhOWUU1OEZ6aEdubU1xSERwNmhBWEgrejQvZUtxUnd3?=
 =?utf-8?B?cU9BdHJiaC9QWklqNzJBQ3hXUkpVRitsa21JWDZTZHVpSENXSXJtMkhGZjMr?=
 =?utf-8?B?YVZwZGE1dC9PTmRxNnlRQXBnR2FaQkVkaW9tSDBWOWFJUzZJam1DUFBDbk9k?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8ZmEZenxOokW3sPI5bdEHyIDNdWl7ApCuNE6EGL/Bo/ITuBfzycaUB/JzYWIe8+1+P53GR5SrFkLOem/rKwiqO5XIEqrCEvhVuPMC9Z6xA0H1d/Navp+P8sVHW9oKKpikYaNR+FLQsdHVlxKRY4Mtr/GzcAuvTKdE9mxn8O2IuLCp+S7Cno/wvHUE0aFyNAtmZUV4AaIsigDfiDDKOXd9BibrQy5KfBNwTB/oZ07xV6lNs03oPwS7COtXDRFCpJC7dOOroX2ZXuUtNRkIPUM9XCoZKJ82cureddV+5IafVUbtdWr8XNQCkjfVn7DlOw6nsidOfmf+JUXy+C1pyMpbXxbS1KgjOSOVh8PsOOZiitDP4L1NxquWYGz4dciEw8zQnickmbhAUNdqxUd1WjQlKd/ZrvZq2kZzVXimQU2C5PfNt5KINcUjacfu7S0G/RpKcHH+5INtPcHwD7OQDsBY7QhsT8QJOg5riyFFyI54WCx7ePCGEIC5wIhSA2nJ3A8k12PF8wmqfIszX5PwMqPovd3sakxekxLN9YwMey3WNAJNTzJ3T3914XimrHmKrtcgdQUsUfLgwyGEGaR2bosIqdtvA976kqyun1vsHQCZyhroPQHfQB8kj82qtEpN/j/R2ADX60nFmfui5UPCiQSgEm6BWwD7YKf3ty2seJjDxELm9WcgFPBB48Cx8Lw4RUXvW8hrZ99tTLNvhasm8+scl8sOTvkBuFo28OLiXV9SxM7OAxdPy0/OfoPJG4pLPFt8XZek2Yol6LE101QkJbb93zDJbjd6LqOcs3Nu4ezo+DLRzYBoQaZzVeZjJj717IvhyCFWcvl2/mFr2+UINimVNhxkyQKQGh5g6xz5/mI75AT6Ieh5zzwriuOsTPHYstUpIltCVaXnw7KnDyXQH+YVwzbdlGubM83wTd78Z5Hg+c=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80cbceb3-3109-471f-f222-08db91ecf11c
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 17:38:24.9257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P8erYUoR3k6emS1URFQJONRCqqEYdMSqMscawwAxRXgPqE0bCwH4wD/ZevPZveKpz+8hBP29o4W8pC+p0AIW//SKo1zb2e+DKrpv9SBSNUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6911

On 31/07/2023 9:00 am, Jan Beulich wrote:
> On 28.07.2023 18:58, Andrew Cooper wrote:
>> On 28/07/2023 5:36 pm, Andrew Cooper wrote:
>>> On 28/07/2023 8:59 am, Alejandro Vallejo wrote:
>>>> Adds a new compile-time flag to allow disabling pdx compression and
>>>> compiles out compression-related code/data. It also shorts the pdx<->pfn
>>>> conversion macros and creates stubs for masking fucntions.
>>>>
>>>> While at it, removes the old arch-defined CONFIG_HAS_PDX flag, as it was
>>>> not removable in practice.
>>>>
>>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>>> ---
>>>> v2:
>>>>   * Merged v1/patch2: Removal of CONFIG_HAS_PDX here (Jan)
>>> This series is now looking fine, except for the Kconfig aspect.
>>>
>>> This is not something any user or developer should ever be queried
>>> about.  The feedback on the documentation patches alone show that it's
>>> not understood well by the maintainers, even if the principle is accepted.
>>>
>>> There is never any reason to have this active on x86.
> We can of course continue to disagree here. At least with EXPERT=y
> selecting this option ought to remain possible for x86. Whether or
> not the original systems this scheme was developed for ever went
> public, such systems did (do) exist, and hence running Xen sensibly
> on them (without losing all memory except that on node 0) ought to
> be possible.

There's one system which never made its way into production,
support-for-which in the no-op case is causing a 10% perf hit in at
least one metric, 17% in another.

... and your seriously arguing that we should continue to take this perf
hit?

It is very likely that said machine(s) aren't even powered on these
days, and even if it is on, the vendor can take the overhead of turning
PDX compression on until such time as they make a production system.

Furthermore, it is unrealistic to think that such a machine will ever
make its way into production.  Linux has never PDX compression, and
by-and-large if it doesn't run Linux, you can't sell it in the first place.


It is utterly unreasonable to be carrying this overhead in the first
place.  PDX compression *should not* have been committed on-by-default
in the first place.  (Yes, I know there was no Kconfig back then, and
the review process was non-existent, but someone really should have said
no).

It is equally unreasonable to offer people (under Expert or not) an
ability to shoot themselves in the foot like this.


If in the very unlikely case that such a system does come into
existence, we can consider re-enabling PDX compression (and by that, I
mean doing it in a less invasive way in the common case), but there's
very little chance this will ever be a path we need to take.

>>   Indeed, Julien's
>>> quick metric shows how much performance we waste by having it enabled.
>> Further to this, bloat-o-meter says net -30k of code and there are
>> plenty of fastpaths getting a several cacheline reduction from this.
> A similar reduction was achieved

Really?  You think that replacing the innermost shift and masking with
an alternative that has a shorter instruction sequence gets you the same
net reduction in code?

I do not find that claim credible.

>  by the BMI2-alt-patching series I
> had put together, yet you weren't willing to come to consensus on
> it.

You have AMD machines, and your patch was alleged to be a performance
improvement.  So the fact you didn't spot the problems with PEXT/PDEP on
all AMD hardware prior to Fam19h suggests there was insufficient testing
for an alleged performance improvement.

The patch you posted:

1) Added extra complexity via alternatives, and
2) Reduced performance on AMD systems prior to Fam19h.

in an area of code which useless on all shipping x86 systems.

You literally micro-anti-optimised a no-op path to a more expensive (on
one vendor at least) no-op path, claiming it to be a performance
improvement.

There is no possible way any form of your patch can ever beat
Alejandro's work of just compiling-out the useless logic wholesale.

~Andrew

