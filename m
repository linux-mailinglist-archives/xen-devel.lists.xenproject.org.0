Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9248B51C33B
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 17:01:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322191.543422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmcyN-0001T2-BI; Thu, 05 May 2022 15:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322191.543422; Thu, 05 May 2022 15:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmcyN-0001QJ-8L; Thu, 05 May 2022 15:00:55 +0000
Received: by outflank-mailman (input) for mailman id 322191;
 Thu, 05 May 2022 15:00:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T22s=VN=citrix.com=prvs=11701087b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nmcyL-0001PR-1F
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 15:00:53 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24faa504-cc84-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 17:00:48 +0200 (CEST)
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 May 2022 11:00:48 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MWHPR03MB2479.namprd03.prod.outlook.com (2603:10b6:300:e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 5 May
 2022 15:00:46 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 15:00:46 +0000
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
X-Inumbo-ID: 24faa504-cc84-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651762851;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8qXF8WGRz8QHati5tnO0AUkiujnurbM7hOJwKFh1Li4=;
  b=Lz6v/N4P4X5BD1xYNWyf0ykKLZEsKYsfEfNyfXvM+hfbxJq42W4wfFU4
   Yj74jD1uu09fUoj1f8IKNdLZ1FesGyfTqZ6u48YN0bftIpfMi7dhlVdw0
   ohjVZYYTnNzIdsNjwU44Q9wE0P7vPSDPzu/bBOOAt/JMQI+BYYZ32Z/pH
   c=;
X-IronPort-RemoteIP: 104.47.66.47
X-IronPort-MID: 73142412
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7zOOpqgEXx6x2L9TXvvKKnRZX161FxEKZh0ujC45NGQN5FlHY01je
 htvCj3UaaqOZWqnfooiaYyy9RsOvZbcmtcyTwNv+yoxRn4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlvQ4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQUwFILnhtQNaDZdHTBME4hG5e7eM2fq5KR/z2WeG5ft69NHKRhseKgnoKNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMu4EegGhYasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUH8wvJ//ZuuQA/yiR204bnIoT1f+XNQJ0JsG+8/
 T/ZxTX2V0Ry2Nu3jGDtHmiXru3FkD7/WYkSPKal7fMsi1qWrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdwWxvXqsrhMaHd1KHIUHBBqlz6PV50OcGTICRzsYMtg+7pdqGnoty
 0ODmM7vCXp3qrqJRHmB97CS6zSvJSwSKmxEbigBJecY3+TeTEgIpkqnZr5e/GSd1bUZxRmYL
 +i2kRUD
IronPort-HdrOrdr: A9a23:GH1c8akbpSrnJ4aT9PRMlkHj4FbpDfOlimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKOzOWw1dATbsSlLcKpgeNJ8SQzI5gPM
 tbAstD4ZjLfCJHZKXBkXaF+rQbsb66GcmT7I+xrkuFDzsaDZ2Ihz0JdjpzeXcGIDWua6BJdq
 Z1saF81kedkDksH4yGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 L4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR0Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqVnSRULAhKePZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDv7nVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLUU5nghBgu/DWQZAVxIv/fKXJy+PB9kgIm0EyR9nFohfD2xRw7hdcAo5ot3Z
 WxDk0nrsALciYsV9MNOA4we7rINoXze2O9DIuzGyWQKEhVAQOFl3bIiI9Flt2CSdgv8KYYvq
 jnfRdxiVMSEniefPFmmqc7vyzwfA==
X-IronPort-AV: E=Sophos;i="5.91,201,1647316800"; 
   d="scan'208";a="73142412"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2l7GNhTWLFWbmuSryazfD7s0qNConYowvwmGcysdr2j41M3Dm1qgexN3RjQU0qwMBk2VpcDTlZP1EhjsQJ/NJVYc7DdghmZIBZjBDddZoE5ghvgHTB4HwfHg205zMzrSn5WkBNLUCCMR+QqZeENu/0Yr8c6te7M2S4c52UNZuyPpEsp3uY4jFiuq+nDMdOB9Rulkv/CeAj8nUVLQadG1uGyS8O13t7tyXG1C3i4+87GF5VCWh18lWpktXyqHkFRBvLeHI/y8gZH5KtqXrOyceuqGZGzCFkRoOrMpdRwa4OVL+lP99+wdodFhIbYvM2wok96FUuVA0wEOrUfOS8Wxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkqHBJ5xv1vnilhPFpsMb3IdDKmG89ejqa/ekVJMMig=;
 b=NkgYwi+6+ZDvb2cAvcb/eAkgCbIKR7FZv7gswAnemGRcSywt0PC9Sp+hJC9l+P9scviTkmp1yGlXeRNn9/mWCVfK+zn5ZqxVUvGRYLt75bUQMS1X5eFpt9FzxuZ/7tKG/FVllMPVwpxoHGOkE/JOO8RmTxatry++QMWSpdKZ8LbaSGCl9gQBxZlI7PaLXbnZzxsUylPEJxK3ECgFI25DsEeuzvwXX80QLhsMMh0k9xMc4xFRALJyM5vNBegaxZMHwXcN4RBLH44zwXdUAHREYxUAQOf79MZ37CVKXlU0iaZuo531px2L6WwRvMiRaWmec15sLumXnoqgLhkmz72dvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FkqHBJ5xv1vnilhPFpsMb3IdDKmG89ejqa/ekVJMMig=;
 b=Sru0MQX5K9oNcObWeQV0ilgphoxmPqKCOvuFEiiNa4wbkwviq3n2REFet9UVLn0CY+7v1M2Gvirwrpx+0/Gl+v1mxOfx58klu5ZyL+nFwy2pjkaRRPCA5g2zAdIPPRtXFn21MdIVzIf0h3sQ7WxNGPw/FgjHFj6rwwCfrg1h+2g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 5 May 2022 17:00:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] PCI: don't allow "pci-phantom=" to mark real devices as
 phantom functions
Message-ID: <YnPmmjPQcPf4ZmO8@Air-de-Roger>
References: <02804746-c5e3-aada-7096-fbb9d04ca952@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02804746-c5e3-aada-7096-fbb9d04ca952@suse.com>
X-ClientProxiedBy: LO4P123CA0114.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66554bf7-aaf8-4883-b85d-08da2ea808f8
X-MS-TrafficTypeDiagnostic: MWHPR03MB2479:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<MWHPR03MB247902F733D90597677D28AC8FC29@MWHPR03MB2479.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PIF3JOa480gC9Pc95kQ0jQ8xhgxIZLecKUYw5MwwJCCmz4k7ij3VnIv26yKgTyjxEGpwZPyzB0iujaTLzOTO75aLle5QShKyRqjN6IKo4+ZDKuqtfq2YFSMnwekunlLhzaZ8p2G45Z6OfSqZQjMWIRyyD2GYaAQzezBR5qJsjjhHKSreBy+4C/EF1k8WbBowEW1QNfwAOh+HF8TexwXmiP0a7Ex46wHXRKxNrhKIVTz/I/9jHzcqcHcERep5bwlFFe2ow/Wif+Eu/acQ/nFobjjQM6N0kc0tmlchHkAWjhvkYv3E91zmdhoOiqdbXnjo+HmKtLUvNlwVHGyIuyOTF+eeZWlA/qdA1G6W/aJ7eliCCtDJSiLi8krju5xSRwV1MdDNAVTf8bqkcsB0LZ6IoRIOn1vUqvf3SGYHC2nvE248HxndODHgLth1shf26f2dx3ykokTXcAt34628W9mNKBxVLINz9dJcEjB0YqA6FPWnkTK1D4Wz2ULTxfN9CDmVa05ZcNEYo32qEzcd/+1Uae6Y5HbPWgnIJmcDXud3dlIVQBk7YnMBfQlZ7t0w8WDXlqCaI6tgd7FgcJCu0xTxDNbDfP3sk/H6ZqeTP19FzEqAgOMe4PNnr3PGuhOQ+EYNq7OqhJ8x2aTPzAs3zFTPig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(2906002)(86362001)(6506007)(33716001)(6916009)(316002)(54906003)(38100700002)(26005)(6512007)(6666004)(9686003)(5660300002)(8936002)(85182001)(82960400001)(83380400001)(107886003)(508600001)(186003)(4326008)(8676002)(6486002)(66476007)(66946007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3JjVGVjTTIyOERLMXpZeGNKSXBKZ1A4UUhNd29Wckh5OTgzazU4L1MxY3pP?=
 =?utf-8?B?WUJaWFQvNjdUeDd5bGdwU2VWUmJSMElCclVSa3dYaWs1L0s5dENhUS9mYXRN?=
 =?utf-8?B?VlhublV1WVhlVDhSaHVUQjg5cjhsblNwaFNZMkorUzVOVTlRSkpkelRKcUs2?=
 =?utf-8?B?RVdpT2FqVDBWNWMzNUJxb3RpWFlhTFhEbmtITklYOXlMcEdHYlZFcnNXUTFi?=
 =?utf-8?B?Vk9weWVUbm9WUkJ5ZUNrNkM5ZFlwd3pGZm1XN0QvemF0WUtKWTY5d1VqUG9o?=
 =?utf-8?B?c2l6ZlZjcHp1QnNYNE1QL01GeG9PbCtKMENSQnpqQ1VHUDZZRVE5akVHdWxF?=
 =?utf-8?B?NENVZWd5R0RYcG0wVjNaQVg0Vy9HREJvYmVVT2xPV3NJMU5RUnBVSHpkeWVM?=
 =?utf-8?B?TTRQdkt3MHpYcDlBWUdMNldpMUFwdTdwUlRjdnJDS1Rrd3g2SktJbU42YzNx?=
 =?utf-8?B?b09xOG9NN2dISnhoTjY0MStWeDhHeC9jQnczUUhNNCtvcjdVWjVvcnRGQTlS?=
 =?utf-8?B?dDg3MVlTcFJReHFSVVBmNEtvNU5qSHVTbmNxNG5SaWpoOHZ1cWRaM3hIWEZv?=
 =?utf-8?B?ak9oWGR1ZjkwbFU1blNDWVlUMkUwRDQ5ek9iV3hnbGgwcHR3cDZDdGVTZGJD?=
 =?utf-8?B?UzBJQk5LRHA4di9XanowdWdKZHpWNFhhdzBsOXVGYlUxTzNBODFlYW5IalJH?=
 =?utf-8?B?ZTNBK1k5dmpDSUwvMC9QQjFYYmdnMDFCbStaMUQrOXVNamZ1MVZWczVFQ2hv?=
 =?utf-8?B?ejZmODM2ckZOVjhNdjdKK2hlRzduSUJzTGt3R2Q1RVFKaWhiVDNjclFpemdu?=
 =?utf-8?B?dXFGUWU4MkNLaEkwU2VuZENlOVN0UFpxVWRnbEwzWjd0d2R1Z0tkR0NWNWJS?=
 =?utf-8?B?aXJqZDN6THh3MGZuSFh0Ky9senZXVGo4VWF5d3dGSUJTTnN4OGdSRXJRRHND?=
 =?utf-8?B?eW5sazQ1WmluSWxneXdCb3krdzVLRTdCcnA1M2R1cnRwMDFUTWlpYytRQ3cx?=
 =?utf-8?B?M0JnbnVXWW0yVVltR095U1g3eVByL0g2clE0KzJ5NzJNZ3E2MUV2a2tWajBk?=
 =?utf-8?B?c1Y0OXhtM0VMY2dxdWgzd2Vydy9Ib3dXSkhEbzh4cmRaQXZ6eVFhQThZUDRQ?=
 =?utf-8?B?R1drdUZrQ3dIeTdhZkcxWDBodXVqL3VTSG4wNklsQjYyMlRBdjVGekF1SXRr?=
 =?utf-8?B?YkdodzhVRWl2WWxDTW9vZHRGRW96Mmp3RXJ3VmxWTCtCdzFhWTVqMTR4TTdS?=
 =?utf-8?B?T2NpZWErNHZwOFVxOCtJQXJ2b250cVdHenFydDJ0RG9IWHlsRUVQUVpYQ1Bl?=
 =?utf-8?B?K0dRdy9XRUhFNXpiR25jaTdNcEYrbEUwbXBZR0dvdlN4UDVOc1ZCTmM3ZXhQ?=
 =?utf-8?B?czV0UVBxVm9xenp6Z2FkdUpMeDZXSUFGa0lacjJwQjRNcVBRL3BaZjd5RlRr?=
 =?utf-8?B?QWtBRGVCTHpreXArUm44bDQ5b1lURHJ3TmZLTFNvamJhckNNN21LdnFZTDkw?=
 =?utf-8?B?TUpaVVRRc2VIU1dkdVUyakZSYlBrZ29sR243Zmd6aSszeFgwMkVNdmgwWjBG?=
 =?utf-8?B?Rm1IQzhvSm8zZHNtUFpuc3hMRmlKcUtTMHdPRkpyaWFIeldwMTErbjlZWnov?=
 =?utf-8?B?cVRwUnQ3MmlJNE8zak9mU2FLK1JaaWJJbWFOcWJSMWJoS0MwSHJReEJWRFYw?=
 =?utf-8?B?ZWNqUndSbkRhTjVKWUdtUXBuaitMUVF0KzYwM3hTdiszaDh2MUpXU3VRZU94?=
 =?utf-8?B?bTE4TFlhR2U0aU05b25MRFlYa2IvVjhuRGdsNVBTeEdjalJNOURDbjExWm5k?=
 =?utf-8?B?WkdHM3RYZzdtTmZ2bjFVV3hUbkp3SERPTzVQdnE1MGl6S2x2REM4cFB1M21r?=
 =?utf-8?B?UHE1Y200dS8zM2tWazdldWl3RmI2V0ZST3U1cmVybmJKV3ZubWYxUlpkVjZl?=
 =?utf-8?B?alFRb1Y5Mld0cklZSjVGeE8vVGFzT09pS3h6Ni9QdUlRUjVRSGN2MGJWUGdu?=
 =?utf-8?B?cTc4WW5zOXZ6c0EvWmR0c0QxZEJUMXd4ODdnRG5ZaVp3S1AvRjZpSDBwWDRB?=
 =?utf-8?B?RC9UMElsdjVXaGhMenQwVTNJNU1Za2Nsc0Q3b2xZVjhxQm9Gck1PL0JDeVFp?=
 =?utf-8?B?MTlGQ2w2aU1YMWEraktxd1BKVWZHVGh2bm9YS2g5VU5HUGtaSTZqSDVRVHJD?=
 =?utf-8?B?bjdHMHozdHBTcmJ3N213cTFZNWNIdVAxajZsUHBxeU1qM3F3SWdDRXhoeEZn?=
 =?utf-8?B?RXVua2xUTkZyZnBmRnVUSXVMWGprNDBFNkV5VmxOUzZveUw0TW94ZFJ0NWNt?=
 =?utf-8?B?SC9qNG1OdnVHampTcHQreU9vVTJhaGpjTUhrTVA5bU1pRmJ5MkU5cHJGcGxT?=
 =?utf-8?Q?mSBs4N+fbrUQCw+I=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66554bf7-aaf8-4883-b85d-08da2ea808f8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 15:00:46.8747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DtLu2ENR/q3xF6R4RlP4ulTaqQ4b3NywEZ8E6BBV8BaSlxUUO0vOmejO383mA2fItZVtV9AzriPkfbFxtfhFYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2479

On Fri, Apr 29, 2022 at 03:05:32PM +0200, Jan Beulich wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> 
> IOMMU code mapping / unmapping devices and interrupts will misbehave if
> a wrong command line option declared a function "phantom" when there's a
> real device at that position. Warn about this and adjust the specified
> stride (in the worst case ignoring the option altogether).
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

FWIW, I would be fine with just discarding the stride option if one of
the phantom devices happen to report vendor/device IDs on the config
space.

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -451,7 +451,24 @@ static struct pci_dev *alloc_pdev(struct
>                           phantom_devs[i].slot == PCI_SLOT(devfn) &&
>                           phantom_devs[i].stride > PCI_FUNC(devfn) )
>                      {
> -                        pdev->phantom_stride = phantom_devs[i].stride;
> +                        pci_sbdf_t sbdf = pdev->sbdf;
> +                        unsigned int stride = phantom_devs[i].stride;
> +
> +                        while ( (sbdf.fn += stride) > PCI_FUNC(devfn) )
> +                        {
> +                            if ( pci_conf_read16(sbdf, PCI_VENDOR_ID) == 0xffff &&
> +                                 pci_conf_read16(sbdf, PCI_DEVICE_ID) == 0xffff )
> +                                continue;
> +                            stride <<= 1;
> +                            printk(XENLOG_WARNING
> +                                   "%pp looks to be a real device; bumping %04x:%02x:%02x stride to %u\n",
> +                                   &sbdf, phantom_devs[i].seg,
> +                                   phantom_devs[i].bus, phantom_devs[i].slot,

Can't you use pdev->sbdf here?

Thanks, Roger.

