Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B4672592A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 11:02:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544538.850393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6p36-0001px-M1; Wed, 07 Jun 2023 09:01:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544538.850393; Wed, 07 Jun 2023 09:01:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6p36-0001nj-Ig; Wed, 07 Jun 2023 09:01:48 +0000
Received: by outflank-mailman (input) for mailman id 544538;
 Wed, 07 Jun 2023 09:01:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnVY=B3=citrix.com=prvs=5155b7726=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q6p35-0001nd-Cl
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 09:01:47 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec0e52f2-0511-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 11:01:44 +0200 (CEST)
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2023 05:01:32 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5951.namprd03.prod.outlook.com (2603:10b6:a03:2de::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 09:01:28 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6455.028; Wed, 7 Jun 2023
 09:01:27 +0000
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
X-Inumbo-ID: ec0e52f2-0511-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686128505;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=BbHVqC8Fc2JYs6Fc+MVl7kF3al+4sK+IegdfOfo/jNo=;
  b=gA3RCi8Wr6OqA9UGl9elmD7pNMWvpGRpoOJU9OkeEfOP9tE/HsBuNIxi
   UosHKo6CWFNocMJt+cOTddtMbua45BovDjJsgvpEHf+aNACWfR67pFPT9
   foLmjHXaFC1HQLhMUW0nELcQDYSSknAzFC3GEGaClSt9CropwgM3JWl0m
   k=;
X-IronPort-RemoteIP: 104.47.57.176
X-IronPort-MID: 114390415
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pnFtQKwjbOMgwcAwNd56t+enxyrEfRIJ4+MujC+fZmUNrF6WrkUFn
 2RMUGqOa/aCamX3ft1ybou2/UwBvcDXzdBlSgQ+rSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRgPa8T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVoW7
 tEhFA08VQvAt/ya77SJasBHpP12eaEHPKtH0p1h5RfwKK9/BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjeVlVMvuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aTxnKjBNtPfFG+3t41pkzC/FENMSMbbmqhp+GjzX+VB90Kf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZac8AvvsIyQT0s1
 3eKksnvCDgpt6eaIVqf67OVoDWaKSUTa2gYakcsRwYf/8Pqpo11ixvVV8tiC4a8lNizEjb1q
 xi0qyw5i6QWnNQ8/ayx9lDagBqhvpHMCAUy423/XGio8wd4b46NfJGz5B7Q6vMoBJmdZkmMu
 j4Dgcf2xOIBF5iJkASERewfG7fv7PGAWAAwmnZqFpglsjiopXiqeNkJ5CkkfRg3dMEZZTXuf
 Unf/xtL44NeN2eraqkxZJ+tD8Mtzu7rEtGNuu3oU+eiq6NZLGevlByCr2bJhwgBTGBEfXkDB
 Kqm
IronPort-HdrOrdr: A9a23:RSVOf6iOwJqV4kCC2Te/n1e9s3BQX7F23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK/yXcT2/hoAV7CZniehILMFu1fBOTZslnd8kHFltK1tp
 0QDpSWdueAamSS5PySiGfYLz9J+qj8zEnCv5a6854Cd3AIV0k2hD0JcTpzX3cGMzWvQvECZe
 uhz/sCgwDlVWUcb8y9CHVAd+/fp+fTnJajTQ8aCwUh4AyuiyrtzLLhCRCX0joXTjsKmN4ZgC
 P4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GKN2QhtMTIjDMjB/tQIh6QbWNsB08venqwlc3l9
 vnpQsmIq1ImjvsV1DwhSGo9xjr0T4o5XOn4ViEgUH7qci8YD4hEcJOia9QbxOcsiMbzZhB+Z
 MO+1jcm4tcDBvGkii4z9/UVytynk7xhXY5i+Ycg1FWTINbQr5Mqo40+l9TDf47bVTHwbFiNN
 MrINDX5f5Qf1/fR3fFvlN3yNjpZXg3FgfueDlxhuWllxxt2FxpxUoRw8IS2l0a8ogmdpVC7+
 PYdox1ibBnVKYtHO1ALdZEZfHyJn3GQBrKPm7XC0/gDrs7N3XErIOyyKkp5dutZIcDwPIJ6d
 j8uWtjxC8Pkn/VeI2zNMUhyGGPfIz9Z0Wh9ihm3ek2hlWmL4CbcxFqSzgV4ridSrskc4jmss
 2ISexr6s/YXBfT8LlyrnLDsuFpWB8jue0uy6MGsgG107b2A7yvkNDnW9DuA5eoOQoYewrEcw
 s+tX7IVY990nw=
X-Talos-CUID: 9a23:QnXvSWFLduBkbdxjqmJcrFU5I/wYQ0bGj0fOD2C+O0ZAY5+sHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AMPQjog/18O/MgpqGNuel7zKQf+c3xbX/Mn0TqKs?=
 =?us-ascii?q?LgPieMzRqfAa20DviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,223,1681185600"; 
   d="scan'208";a="114390415"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDyfLN1Kj7WFdfN+aUBmS5Zj0XN0b6+hpqCYASK+58G6/2JWxL7Oijn66AkpwStbMsu1YLc5chxaCbXwqq4TnadsinGSCxtTXRxmMn2eQPiArOQe4bpfhi/po7L1nyqjwRZpy03c0A37KSW5rzjkv9lwLreZfvJVrl/BQyWMwCExsv0lz8gvSVn+SSk8VRsk1K77JAas/krL/imvpzs1l55v3QbkbMtdLhkoitL4YTH+rXcAH6lwXJdioT3FcaxGU9yxATU/EHVvjWp84115g+lrT3ABET1wO1hCIpDQCzON1TAmQbZvDNbNntpC+CQ/kfHUGNAjr0IQy/Q8+YYCAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+APwtEMbwH8K+zNBUg7BHZBWWxyyOMBtV/ndUDuzRQ=;
 b=EFQAGIl3iMMztXdnlvMzcZJkQH7ly3GGF9eJ1rBKjoTnsec8t7rpCghxEZSBJ3fytZ9IFc8JcO6Xx5q9R0Fr0zGSjmCJA0jsETwrV84R5jE7jcJKxa5+mBlGdDNinkRR8KEglmz0qmZy+5YbJixyiWWA07wC96UAy9B/naMKTohV1CcJAgRFUiM6lgscCCFnauoUcpOffg3saBH+xi/mlv+aRo5er2rBXdQJo7i+/VQiQKaULIzUKlk98/Jhsm2eswlhWA4JOXUBnrOrvzl0Wg+xl7ZHBo1fUtrO/vnY4PSYYqR+vI6PAQW4muZ7SBFBoSOZjINCaKAahlQfk/g/cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+APwtEMbwH8K+zNBUg7BHZBWWxyyOMBtV/ndUDuzRQ=;
 b=cTNqdzt1OycpNu04dX4YWhmgKkqspn+v/pwXxgtplM/KxlFOBbqkWRsHe0RGJZuiD/Udo4cnD/lUgue/4otoBrWWYTfRJ9XmrQNTBIeQ1zelS3HrxBywr8OlqnpLtJ/mJ7LEqGWv/Fre5MQ4edVHsMDMMe0C70Zp2mIb9Ny6Ves=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2] livepatch: apply_alternatives() is only used for livepatch
Date: Wed,  7 Jun 2023 11:01:20 +0200
Message-Id: <20230607090120.49597-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0040.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::28)
 To SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5951:EE_
X-MS-Office365-Filtering-Correlation-Id: cd4cc189-5439-47ee-1d2e-08db6735c731
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BBnAN6ZEWMUTg1Op8grMaaFgDYNzwaF32ELHZAvi0QveTqGT6ZjoUe9fzccTwOP6FRNIbrF5nnNBwM13P2AEFho9b6cZndXsCfJ3PcfASrANPjLxFoAQrODvz0Q7MiWg6ZZ2TBgxdWQZrbINbX3LrY3PJCGVsPdjhqUhZ9+uyKEmjTYCWG9KvdsMja8lY61ubBGxJhnQtDOzotvceMPjfahYnHzkI51D1m8iqLIU0h3itu8wRUJmlI/uys7wC4/GkCXwG/PQ/WxR7AFkbyZOJieQKAzJ1p0T/kW0O4ShwbzokcIWZzewPKSVU5OrzFTa29e3k8oZ64SVptYJUEl1/o1MW2vX1QcSpGfG+ouN/5QZmeMleLWM/gztb2TnYZtyZ0zq69YAHmleTLi8wvA0wVOADcU1uscGoxGmcIWuZu59BYYI+s8xShCZI3u4TZBGsGaGgCtYj8skfYGDRNx1em5jj8nTOBiym5qBLKgQzyml2SSjIen8BCo7JR8xne7gHFhj2ECEVKEKPH9nU87xbyWEGNT/SpyY2tHBEVJcWpQEex3pcz9lMHdbEL3oRwZA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199021)(6486002)(6666004)(186003)(2616005)(83380400001)(86362001)(36756003)(38100700002)(82960400001)(6512007)(1076003)(6506007)(26005)(6916009)(316002)(54906003)(8676002)(4326008)(66946007)(66556008)(8936002)(66476007)(5660300002)(478600001)(41300700001)(2906002)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1dvRmZBK0xIK1JLbDdZYkttTXRzU2h1c3JtZGZaa3pOTStSSmJqSVVxcnY2?=
 =?utf-8?B?L29VRUgyMTJHY2gyM3Q5VHZpd2gzdk8rbmRRQ1VWdGVNdmZlV0JVSHZnSE9P?=
 =?utf-8?B?N0NUdXI4WVhFdzVVa2h0ZG1TUWtJTksrTFF1cXdqYTdrbXNFVzVkUlgwcFVQ?=
 =?utf-8?B?bSsrZXI1MDV6TDNXN1AzanFtMnQ2N0xwUlJMbDJ5dTRrZHk0ZHhpQkM4T1Rk?=
 =?utf-8?B?VEd6UUwzUUFXYm52UFZuNkI0cVhOVlFxY0JRNDVEV2NPOGdPcTBRUXZDT20r?=
 =?utf-8?B?OHM2WW5SUHhzZ0w1dDNGMTFtVkNtdFdnQTZsVjNjQnlISk0yNldiWEV2T0Np?=
 =?utf-8?B?TEcrMHBReFFpQmVDUERWNzU3blNNanR2WWMvaVhRdGtnS25aMUduRGZSR1Uv?=
 =?utf-8?B?OGRscXZFZUhlZnBUaThtNjAzUllmL1MrRmh1V096RWo0TFcwQXhuK3pqbDRr?=
 =?utf-8?B?NkUwQWlUN0tXanVxNVlwYXRTTTliZmpKanh4Q0F5anYyWmlwd0RkZ0tka01Y?=
 =?utf-8?B?NHdHOElmK2k2OERpNThkK2tiSnBOa3M0MmYwSGZsbWE2OFJvamYwNGRiMk11?=
 =?utf-8?B?UVoxMTlYVm9NOGk4STZ2dFp6Q1VjNkpHRHRFM20vUmtjWnF5My9RSGJQU3Er?=
 =?utf-8?B?MmpqaWFJZURpN0p5cS8wNTJLeGZwcFl5L2ZVTW42cUpSRTRWS0QrTXlvSlk0?=
 =?utf-8?B?Rk9SaU5vMGhXUnh2VzlDQzhuRjJqR2tPUXRKZVVERk1NYThwTUpRaDFaQko4?=
 =?utf-8?B?VnZhcnlTaVQ0alJBYnpRbmIySUVSU21wWGNlN2lwdWtZdm5mcFF0b1dla3Nh?=
 =?utf-8?B?RHU4REFzNS83Wk1HMS9kcW5lQUNxUUd4TFNZdmU0Mm1qazM3VUZDa05hSG9p?=
 =?utf-8?B?SjJveDVuT0U5bWJ4SjNIRzBzci90SGFrVkxXczVUdHlZM0krSVRLbGE2VmU1?=
 =?utf-8?B?TFdSa3hYSEd3MW8vbEl6ZitxdHByQ3YrQVp0Z1d2OVFXWTl3dWE3MEFFUzR4?=
 =?utf-8?B?ejlmSXo4MmkwcERUQStKckhLTUpyVDZVU1M1dUVGekRLeEhnRDFEdWp1eDNx?=
 =?utf-8?B?TWFsOWl5eGxTenhJeFlCdGppQ1RadHJWUC9pRTlEY0FwUUxId2hnZHNZUmtx?=
 =?utf-8?B?anBtZkpZV0hlTUpGSzF4ZGt4WSs2Z3V5MUE5S2Y0dUc5MUVqMVRweHhXQmFP?=
 =?utf-8?B?Y0F2MHNEZnhFbUJIRFVlMEJRdmhERDNKdDA5UldkWjRZc2xPL2hFWWdFLzNE?=
 =?utf-8?B?V211dERFR3ZpRnh1Tnl4SEJFWXprM3JXV3BGWWw2M1oxaGczTkdDVUo1S3Qz?=
 =?utf-8?B?YjFiTGJERXFuUE1JaHQrNkVYOFQ0THJhT0ZlSE82VW51TmlUaGpza2M5QkdG?=
 =?utf-8?B?KzI3Qi90aXZBMFMvZmJ2UnJ3emFYa3o3NFdGYTUvUjl1ZXpZNW0zdlpZZnNR?=
 =?utf-8?B?ZVN4OEY4OHp5NW5zL2FGc2h5R3RtVnpLTnk0ZXV1dkJEUHNoekd3SmZpZXZM?=
 =?utf-8?B?aTNmS3NZNVpZNlNURUV4eWxWV2hkckJnNkNxWnVpWURidnNYdWZ6MG1CUnp6?=
 =?utf-8?B?cE0xbXQ2eVVXWnpiQlJaOGMrNkRTZ3Q4bzZlMS9vdnBxOFZ4OXhCbkYraU54?=
 =?utf-8?B?VFBEM1hKYlhqY1dFZjdWa1RhUDRQOFVCQkJCbVJ3dkJPUWJpaGdQUnNiYVEz?=
 =?utf-8?B?WFRBc052ak9ITm00N0dFMG01c05xYW5udnZvK3h6YTF3Z3VZVU5lVVB4dG83?=
 =?utf-8?B?OGUzZzhFMFlSaDN4eVpYS09lUjF3VlZUbGVtNkpSNk1IZVFhMEVQUlVWbmVs?=
 =?utf-8?B?VkhSOVJMSjdzeEhLaWN0eC92SFhpb1YyM1RON2YvK3NCdkN1V0FVZ294MlZZ?=
 =?utf-8?B?TjdsM3dnd3pxZTdydWR5QUh5MU9oN0lJN3ZYYlJkT2xSeXdJRGQyUzFld0VR?=
 =?utf-8?B?cHVqV1RmcXg1TlI2bWd5dURicW1GMFpHR05lRXdNSSs1WHh2TmRTUVI1dTFZ?=
 =?utf-8?B?QUl4VUEvb1owNW5iMytNNWNXTXkvN0dQblBCQ1dlckNTU3VxRDdYbVBKY1N1?=
 =?utf-8?B?dDJzaFg5a2hvVzRVTXJtcEpYTFdNdDI4RitsU04xU2lyN3ljRDNKUkg4Z0p4?=
 =?utf-8?B?Z0g0TEtNdm1qdXcxbGpOL3d1VDdSbUEraWdNQ3VmOGZRaVdpUEI4T3IxK1Js?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fBTziGaRV5AkQOn08f/1YOh4LWXZwMeKAR0YH3/nrEgJrkh5ArF9gf6EayNXtBpPipmPDau88aAmkuaoL5wOr1XlH/+oT+ekS8hyd2Qy+gQGAGBkq56dBALWr/BkX/Ec4VeHb/fYTyV0YBuJjFpEzwWtNI1YYtwrvSkknUuSyP+9ebNV/6GbxWqNJJJRyxHBCc1VeBTT5wx4iE/+8JkJAy3S0DWUIb0uUbmHa5w2+47kvP/eMTX4ETlZ9WAe+/4q9UhIolzAre/ZgG7Ho5+y0tEsLF8D4FviEmIueUPVW3YGhvJuIfCJ9nITeJ8iRr5VFnIRqArKoopyFHBbOd3uPNWF0XkSOiTrei+a7p1yzPS5Ez51qM8Eyw6XcAImdzrXkIgX06cz7QvSrK8m/NNS6UfdgkXP/XvbFVi88UZn4eHoh23CF1VOXC3VR7ZSSRK7LlKZf16qjjDHwmRS6zyR6eB2fZclIPt/e6Bsrr3TQV/sNGtynrZDn6FSVjN4NJIb8PkeDJye6m5KvaQ82obvqZXyWurNQHLyFWcgepAV9T7ImeJxge24XRhbsXbdcirfi2p/j+gTZWfeowp1Ikma+t3l3U/7LAE/lTx1eAkU2cT+ab+gUp2H77ybqBL7pEhOEBl7DpUYOXM8pI/9/GyB95x40l5VLzj8kYPJUWf/BfjnR3FtHHosLfIPwIRG7ITqLOj3mnut6SjE3umWHVK9rPeXG69NzcX6x5iD5bCng/I2oiUXiLoRkEFYV7SGvhi4n4b7Jn6X+W8krkLibthYQ7i+qRB8bqTmqMtYCw/d56M8Qw/6oWiZspJfiqBGWvYp7GouRsm+aUK0S/WobWXW/fCn3VLF9HuqTfLXZkYYCUnmifv436pK7NQUNj2GpPAbdlUmNuCrExGXOj6NppUFaHA6sJcWHBLVo7qSy3EU3Eg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4cc189-5439-47ee-1d2e-08db6735c731
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 09:01:27.8491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hU47qv9j9KySBz5yd5o52eb4puz7h4Q7819C/1CMooXCt74Zxq0nUvQXDA7cKFUbYbYqTJoE8BEl5qi8Tz4R2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5951

Guard it with CONFIG_LIVEPATCH.  Note alternatives are applied at boot
using _apply_alternatives().

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
Changes since v1:
 - Do not guard function prototypes.
---
Andrew raised a valid point of moving the prototype to a common
header, but since I'm not longer touching the prototypes I'm not
introducing such header here.
---
 xen/arch/arm/alternative.c | 2 ++
 xen/arch/x86/alternative.c | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
index 7366af4ea646..016e66978b6d 100644
--- a/xen/arch/arm/alternative.c
+++ b/xen/arch/arm/alternative.c
@@ -223,6 +223,7 @@ void __init apply_alternatives_all(void)
     vunmap(xenmap);
 }
 
+#ifdef CONFIG_LIVEPATCH
 int apply_alternatives(const struct alt_instr *start, const struct alt_instr *end)
 {
     const struct alt_region region = {
@@ -232,6 +233,7 @@ int apply_alternatives(const struct alt_instr *start, const struct alt_instr *en
 
     return __apply_alternatives(&region, 0);
 }
+#endif
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 99482766b51f..21af0e825822 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -358,11 +358,12 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
     }
 }
 
-void init_or_livepatch apply_alternatives(struct alt_instr *start,
-                                          struct alt_instr *end)
+#ifdef CONFIG_LIVEPATCH
+void apply_alternatives(struct alt_instr *start, struct alt_instr *end)
 {
     _apply_alternatives(start, end, true);
 }
+#endif
 
 static unsigned int __initdata alt_todo;
 static unsigned int __initdata alt_done;
-- 
2.40.0


