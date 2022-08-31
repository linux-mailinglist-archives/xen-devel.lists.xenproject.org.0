Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 537CC5A8042
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 16:33:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395759.635602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTOly-0002uY-V2; Wed, 31 Aug 2022 14:32:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395759.635602; Wed, 31 Aug 2022 14:32:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTOly-0002rY-Rr; Wed, 31 Aug 2022 14:32:54 +0000
Received: by outflank-mailman (input) for mailman id 395759;
 Wed, 31 Aug 2022 14:32:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fS8T=ZD=citrix.com=prvs=23534f77e=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1oTOlx-0002rS-A6
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 14:32:53 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c99d2053-2939-11ed-82f2-63bd783d45fa;
 Wed, 31 Aug 2022 16:32:50 +0200 (CEST)
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Aug 2022 10:32:48 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by DM8PR03MB6262.namprd03.prod.outlook.com (2603:10b6:8:26::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 14:32:46 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::50e5:dec2:1f40:9648]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::50e5:dec2:1f40:9648%6]) with mapi id 15.20.5566.021; Wed, 31 Aug 2022
 14:32:46 +0000
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
X-Inumbo-ID: c99d2053-2939-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1661956370;
  h=from:to:subject:date:message-id:mime-version;
  bh=IR58ekNTzRAy+DWGQdiyfJwTVxhmmBxQfvTe90fhHtY=;
  b=DVCmWYo8hdAEdTvuP/1LjfLz+mzeCfpFHE2ux1CN0YKFQeqVeGNQpRIc
   Ri8fUFHj++fj7fcBut03wF5/skQUv1YRRRjZsaIHVdOLoBJ4JK53XlAAW
   XLw05qMnAzhlVy2N+7UQBs6OcvkP3VJajMhHETBrFB1wNCAZCUxtfkJsH
   A=;
X-IronPort-RemoteIP: 104.47.66.47
X-IronPort-MID: 79482745
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AL5NE7qJSG529Ly1kFE//H55y1QzLRhNe6xNEt?=
 =?us-ascii?q?3ClJ83I83xWrbca/1dBu4V+B9VlCD9gz7ZC0hmrA96SIuGHBTG82S7rxTUTn?=
 =?us-ascii?q?AUwuVo1VM8/yqlK2PCsDufJGiZT0/ujQd6M5Rk0zBZyokdw0Fa4qkq3uNaUf?=
 =?us-ascii?q?Q0gm/B6uTXUqtZfizfubNCypkLelUvOkJ9T04mYZLN4Ls8CDM/2DQ7xTEvEk?=
 =?us-ascii?q?UBH/ERfQNh2hgddlHZqFLVnMMbE6P2pVthTleRk0kzC6HYd++R5ghQ7tPbPQ?=
 =?us-ascii?q?noJ/nKS17DlgoMb3JMkJ5ypQGAku/tehgIFW0OXmg535vxo4QX/WcWCCdrBf?=
 =?us-ascii?q?5vWhwYF0XeNhRlK/FG0222MMGt6+TUBBOUTKRzTXBFSxk9tUCA5dKnrEc43I?=
 =?us-ascii?q?bRcRMooF0Way+1UWWYTIQ269cVR8yqAHP7yd7+NM3Ik0qoE+oMipSSnzLE5E?=
 =?us-ascii?q?zmEb2ZVWFLaEzVgwpDT2X3TJfynnMI/5kwPHrEIFlmqYX6jFndKMd8sVsRxr?=
 =?us-ascii?q?9llD12/OHqCQK47/sFIqqSELm0JR2eBQAJWg1vsCuuSZUXpt0zOQ77a/Gh52?=
 =?us-ascii?q?AImv6DiKjnIuKDz/yP3Zwvf3ojlWp+pcdWu9mnsPzzDYSXB9kfnS3C6MgeXt?=
 =?us-ascii?q?uj9jf6QNzU4TpgSsCe174d+4Ia/yqhUKLZpIeQdQLGcGqpBHmQPKBG2cX4fN?=
 =?us-ascii?q?w0KrrdTRxEC1tviqb2NCYB5lY8ePSp8a0pO/2MR7oAL+MmIPw2UxHv6OB5bc?=
 =?us-ascii?q?Yc0BB6bDGh0klchd7E2kUepLKsGYZ4ZCsVPEbMgDq2KwZozf5kHk8fxx+vOL?=
 =?us-ascii?q?ByU/Vc31PfJHZfmecBebCWn3eFrY+GhPm2WXxNNJjuNYNsSpbUlvq6UwTVSj?=
 =?us-ascii?q?SI8OC+yJFfgupI5JZw2vc01apa9/452rsinX7yt4OjOZ5QSUYnBUM1nk0Kx2?=
 =?us-ascii?q?pbJczJPmsG55+IUGJBfy181q0O+gKl1xoQnUv90ApQmyqcP/X6xVWEwGuszx?=
 =?us-ascii?q?UiiLD9vnQ3y35A/Umn7cNMSGVcgTy9y32zoEzsAZmjC91naJznbcnK5uDIUn?=
 =?us-ascii?q?iUAFzwiAqXDi8/Kxh9ddAjIQknAps9d18Goz3ohlFPc1WtMBekWzlk+GaGwc?=
 =?us-ascii?q?i0jhymhpZCf5YPE6oeodTL/cl0IikzlKY0nm2UzsDTw6idkvzAc4qsLij0vW?=
 =?us-ascii?q?u57NzMYaniuTESSSyE4J3uy2+p/8WWBVB43EHrg9AdaCiW5z4vWmg7Ht8yFX?=
 =?us-ascii?q?nUbKSnS0mLen0pn2StGSUAzWRSyP7NCFRsU59gzvp/RE1fSglSfTsNZpjxKx?=
 =?us-ascii?q?PKxN/IIZeXW91GJzuVoP9diAlSI76uYgTotyekpKR9e1MnBLvQTdn8A2x5Ko?=
 =?us-ascii?q?oZuIWvvBKzkfx4giMJiF2dfA7RLIgrMVr4zWfqngnqnwQen+HFp8pgmeAbD9?=
 =?us-ascii?q?9OFI3O9Upnoe15YUIr7cC5PsM4cXiVq7qV+l2l0qqe25q/5IY6lrUCSSW534?=
 =?us-ascii?q?mfCVj7aHusqMGy5LavQiBfJaBO6R0ScnxMMt6LD+zxswIs1dykrxBLT55pbG?=
 =?us-ascii?q?4h1ZFGXLN06+MpfXn82+zTtkyLyAPbXTibbQrC+OoGB3qH2yf7DRy4bFzAx0?=
 =?us-ascii?q?DFuwIvLmC7oBFoAXNBOAt+v9MB6DUvpezF8Pa/N0LJvskR9YNuiNdQdZmVbU?=
 =?us-ascii?q?l4q+6ScxI8EiCZj6377/BV+wUrK8DR2mQbRBO+ZRwvdHbkRdK/VXRNdXhNZs?=
 =?us-ascii?q?CUW2SOVFfQE2fb/D/fiRarKVQOY3Twbf04m6NANoxOsdzfcfdVGirqFc/71K?=
 =?us-ascii?q?KAM9IZuBZuKWPH43xpS4aU70tJoimH1jHutJ4UH1taE/dEZdhNDkC5ZodWzg?=
 =?us-ascii?q?60/v9xgT9W4M8Ts8OYsK9TA1fVJ57x+lJyouF/pIQLv2htCUpjVKGNRaieT/?=
 =?us-ascii?q?FUJxk5mvWVy+lI3j51Hwo5XSlEafNzHEZHSMJbTQFIiHKnkV7vZQnhjE643e?=
 =?us-ascii?q?YbgLnZmvsLnaKi29ZZG51ePAKuBDPz8wb77BB1p0fwvGFkYPutFAqyR2FTPt?=
 =?us-ascii?q?sHjnpav1ESQdYYd55B9Dk0K+4SzoNZpbUu92koKWHIYV9FprhYGp/SJsPXH3?=
 =?us-ascii?q?3t43lCqejQxF39CPo5xu6clqlgbe4eoZEPPoi7rJ+npKJMw9dmcq6qZxQFhA?=
 =?us-ascii?q?A9tnjoXAC3+KMrABT31LLvVm+Cd+2HHRkqwdFGhBfrjG4PCuD1UCySgn5LdL?=
 =?us-ascii?q?tfmOuByfX970Uz5BQ7ksrwbvHpifZDSI+70wOt6tyWMGXm09V0vi6MF5UUFO?=
 =?us-ascii?q?Y4aGfOFyIAef3oLVH5n6wvKZJBoVt2DKaeqAi1nSHmdd32CDjtkF0ybPt/JA?=
 =?us-ascii?q?07Dhsg+pfLiDFsqi/8WXapu4zh93xMZFzL/F+a+QXkb6/Wbnz09FadgxwPFw?=
 =?us-ascii?q?2bf6dZllSRlCkLlplocj5DgX0D9ddMnaAqcdAdBgiJvFzWRvPk=3D?=
X-IronPort-AV: E=Sophos;i="5.93,278,1654574400"; 
   d="asc'?scan'208";a="79482745"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRNzpGf50bnclB4ogB64baSNG27+PrP582/HiRL9hOqffZlQ9DcA+iq2SFd0Oz/q4JgxW4vadn0GezOYWhkq4rW8xW3rxro7X0WSb7p8GsCyRNMR4f91Qk9Xf7qq7zc/P/nptCY4bsKxopE/5q1BFQGrbLxVhvYJ5UqNUJSPp70uN9IB9neRFfxofsn4ziNo2qGJqS6IpXc3BZeUeAkZ1S9RDUk+IgQUgOA1RkwWqna9RSyng+/qmy4k0vM2PprPQ9TE8KDSDBpU2/okD+X2t7JpviGZEnKEn9ok3n5+PsZ01OMhdvFyEH6AI7oSqvNlwHEUnuky5nlepT0T3h8/nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s90qAuN5PhtxuB7A9oZ92FR8Z9hJcu3lEJbzaDL5Cq0=;
 b=Bp36L38KCOVLMY0hm9usrKWLoJRU6baV6QzWC/wzyNsQcCyB1FKa8Z8cK21Phr3mH/5vqjqhRGmUqk+MhvCeSYBNGkBACO+3MtHwihZzYhBa3/lb9jo8yJLhNmbe/GB60H8CxzWSKf3LNeZKfzCZVn4IXjQY0+nN/5+ZRZYAN/ZfBkfa8p/ZQhcM+JvgRi/29y2NnfF4OuMUrrfZLCxOzGIF2NP2x3aASFJRKub/KuPsqAvs6gisPhoBS8LDFJC7UfiD8dTfMxRbQS1NiLxRR6BcNwl+hiQzJXB6PRl23VextLN4keO3cYg/0RLl4pRl21pqbyd2ltRrKmtH1P1Hsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s90qAuN5PhtxuB7A9oZ92FR8Z9hJcu3lEJbzaDL5Cq0=;
 b=S+q2/LAMQB2OKeQoFLSOZ/qw63ci1Us4WFq7IGopMq6Mujp9Boe3H22Q6g4YA+jrHtP8bkTrapHES1bHP3fHUSZH+gGEMpyxyW63jZiPfjSypk6NbY8dkdTN9E7FJbODrLiBF4zvbUd6k2hIeqA1/sbkAmUQNLJxvwSMIucWa5Q=
From: George Dunlap <George.Dunlap@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: ANNOUNCEMENT: Design sessions website is up!
Thread-Topic: ANNOUNCEMENT: Design sessions website is up!
Thread-Index: AQHYvUaJV0i/b8E8wk+orMJeQfxn2w==
Date: Wed, 31 Aug 2022 14:32:46 +0000
Message-ID: <0BA930BC-AC8E-4BD4-BC1A-C6C2A3E52FDC@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6ec96d5-7956-478b-5c8b-08da8b5dac33
x-ms-traffictypediagnostic: DM8PR03MB6262:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 mg56Z5Dj7Nvac53yWz/0cl5L1XShvadBRv8wfwVrROFDcD12Ti/NyGmXyxnMrIl6ZM9459hcgjQVJzHg0qX3xJBHY+NNtgC8K+AWc8TJ9Iv14NK8QieI3b54BQXNCgWJ7UKRy9nnz8marJ+IpERLyf9lg6W/F3m9v8s1KJxkIcSQ9TX3wtTgfKaEKGXT+W/cHiaFa+JsNjxuy2A9eR/3hoCWLqzry3r6oP0oe156jstDZflSjfeQ8JsDHuUiuv2dxHfgrccTT2FlSRHZ1QwSwNwCFwzkfIxjV8OxtfMmScsofyU2TrPhMakOTXlqpyT/+S0UCoycJQ+iqLYreEjEJi+xO5lYZXg/DNOAFELf4hxNfDAo/Xd9xLF1hsMGrisBOlQKgw6jNY0jx5byF9DJ0aw62tllKUy/s55Emkv4a1KoWwvJbGhqwd1Q6c4pxTziEwHISi4zjVVdsn/iVBBkj+FoOeBsXuE18cq0TXigCdsYYcDZ5+6N3QppoGXCUrTPoRLl9cfQOk3YWcIxfTs/U5yyspKcqV6qrrbHFhodIMPi2R7onalDcN0uTlo8d+wyqAo9RT7V1soxqURHd9g/Vcw127UgkzeScjZl/1RT/G/IXkULf7L++i6N2M3sPlynsK9CnzK0y5FgFY/faew2H/jrxYU8SDm99NXjgeUD8nP0fmPsnPvzziUjSgqI6QLYCVDcjTavQZsGpdf0bdl4wZBNiFmu74GO+aiybJmSYw80hV5D7h0rLS2U0K3mu2fA8jv/nOsAL8fQ1fo5S9NA4imGU8XXzHFTpR+mmcOB4Dg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(5660300002)(36756003)(2616005)(83380400001)(2906002)(122000001)(8936002)(26005)(38100700002)(6512007)(66446008)(8676002)(33656002)(71200400001)(6916009)(76116006)(66946007)(66556008)(91956017)(38070700005)(6506007)(64756008)(66476007)(186003)(316002)(86362001)(41300700001)(99936003)(82960400001)(478600001)(6486002)(966005)(49320200007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aHVHSmJETlcwUW03Sjlyc3FLZGw5WUpKQ1pRREZNQVphWWxtZnNrdXkzZ3ZM?=
 =?utf-8?B?amtRNCtIQ1ZiakFTSjFHVFV6cUVOSWI4YUxzOHpRczRrMHZhd2R0bDhXOFBE?=
 =?utf-8?B?d1RoSVMvWGt4K055eUcraTBjclgrQzk3WGVVa3FVbUJnVHhOSVVDOVNNSjdj?=
 =?utf-8?B?b0MyanlQQXFKVllIYnBNTm84ZG5jclhGZ3dGVSsrd0t5ZmMxRUUvTm1SMkNU?=
 =?utf-8?B?SnFLTXUra1V0QVFNQW1nUnpzZmtacE9COXNkMlU2TE9FRXBJK2VLN3E1SkZN?=
 =?utf-8?B?Szlpc0Q1eTVtWjJzMnRDU3MxczBvbGVSVjVWS1ZKSVd6ZmFaWExDcDRwdE9R?=
 =?utf-8?B?cTlUaXZxVnNLako3Z1F1aW1PUFlKUURuNzBUS1hFK0tCY3BMcnhYYys2Ym4v?=
 =?utf-8?B?Y243VDZPVnlxQlNucFRPcDFBdys0UW5jNFFqNkx3VDI2SncxUU03cFpVcjly?=
 =?utf-8?B?ZldQQjV0WHU2c29Mbkg4ajZ5NWNDNmR6clpFTFR3eG1tV1NUTEdoTGVPNE4v?=
 =?utf-8?B?L3NjM1Z2Tlo4YmdBZDVTdDFRelRVZHRZcXQremlWM1RJaDlLaTBLVUQ1cFFt?=
 =?utf-8?B?VW80VFdYMHlFWUJhak1QSmYrL1ozRWxvSUtWaEptYUNnV3RqUWxjR2M0cWdp?=
 =?utf-8?B?MDN3czcxampsdGZweHlXNFlBZWI3SnVuT3B3dHFrV1p6SHZkRHlXeHE2UWw0?=
 =?utf-8?B?R1lua3dsa1hDZSsxSHQvd1R0dFByS1I1NFlrdE5uaStvQlBLSkQ5QmUwUENx?=
 =?utf-8?B?SmhwK1hKdDRHZUNBd0RVaVc5Y1BhdUJESHBrN3hOWE0yeWhPR0JmTktaL01h?=
 =?utf-8?B?NlB4ZmZNMWJtQm42NWhFZVNXZEhmN0RCMWcySzlFanFWMk80TGlVL1FpdE5u?=
 =?utf-8?B?VkdZNEMyOW00aWdJTFl6dEFFUFhmay9kUWFhWDBFaHRYanNsaDRQNEtTZmlZ?=
 =?utf-8?B?QngwR2JXRkxCM01Va0dEMzNkOGplRlFiUXVHUTFKT0F6THhyUCtxMzAybXQ1?=
 =?utf-8?B?bmNWalFqbjd0ZndhRFFFYStISzdkdHhKMGdFdTJ6cVRsNC9OY2dVNnhVUHZo?=
 =?utf-8?B?d2FRT2F1WE56cHhtUEFWOVU4dUV4ZGx1TVRyanBoWkFuNGpMR1RQS0xSdUU1?=
 =?utf-8?B?UU0ySDJZUlJ3cUlEcnhVWlI3Und4QmdIYmpMY3A5OFlFRU9CMmdpb2dFYndU?=
 =?utf-8?B?ZnJiWUpaU21xZlcwT2hnUXVJangrVVZmR0JkRVl5a3Mvd1g0NmlTcDJhblVI?=
 =?utf-8?B?SmxYYjY4SC9SWEdFeFNIQmdrb3lKajBIaTRQVU5WTEZZOVZFQTZBYVJ6ejRk?=
 =?utf-8?B?WjdROGJHaVJqYTk3T05LUkJSVTgyNm5WOUtJN2c4TjNzODhBRGpiZ3I4ek1B?=
 =?utf-8?B?SWdyQ1h5ajR0OWxwQUMyajBYbmZZbU9xL2dYR3VlWGYwTnluTVk4dWNpbWFz?=
 =?utf-8?B?dzFVd0N4OStMaDRXU1ExZzV1L3c0SHNrLzFSOXRsdlhXYkhwQzE2bnR4Sjd6?=
 =?utf-8?B?b3dkSXB1WEhPRmpBL2tPYnVGdlpoUVpCWmtIdThBRGNCVm4wRG12NFNYaVJK?=
 =?utf-8?B?U0xMcE1QcGk5LzBYT2JJbWxDK2hUS1gzeWJKNkE3eTM2SmFDNGhpUHl1YkRO?=
 =?utf-8?B?MVl2UGRabFBGOVVwWFV6enZVSUU0ai9tc0lmY09FQkZXSzdKUWRpV0hCMGpE?=
 =?utf-8?B?WnpzMCsrVTFNQmVXTStJWWg5Y1hXNGJmc1M5dU91TVBkV3hSellnK2tHK3pH?=
 =?utf-8?B?VjJTRkVpcVl0WkRHbFl5Z25PYVZIMENQWDFOMjdwUXhlbUc5UG1vZUNTRzdF?=
 =?utf-8?B?bmswc3RkZ0dYWDhGaG5SRjdPRFpIV0VYdzg0aU4vaWIwWklTUExseVRhcGw4?=
 =?utf-8?B?WDgzbGE4NllHdVhaY1A2ZnMyYUhmYm5DZ2I3SG9XeG9xaXorWVkrWUJsODJC?=
 =?utf-8?B?Y1BNeEN6U044Y3dKaFNla2U3Yi91Qzk2TWhNUE1jOFQyUWFJYklrUmxPMWVX?=
 =?utf-8?B?UThRT05qMjVrMWZHMklvczFaSEpLdk00Z1k4eHp2d0VsL0xrU0Z4MUFid2x4?=
 =?utf-8?B?OS9NM1d4NWNITlhTbnExSFQ3RmRMRFRnOXJFVUE4ZHY0Z0hMUE1lSVkvVmVC?=
 =?utf-8?B?cjgyRGJjT2UrWk9Bcmk3enNnUldJT1JlUXlpKzROd01URHZ4UEpWRVowaThG?=
 =?utf-8?B?b0E9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F983FB21-9ECD-4F74-92F4-E65FC7D0D48B";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ec96d5-7956-478b-5c8b-08da8b5dac33
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 14:32:46.3144
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VXtBWFDNsgeAzq+9zhqBR4lme8XBMR3eW/pcbv0gPOxFPSmSaQWLzEDctW55Q4CyVeF/vil5Oc7wJyJLfvG/eU6QvUOI0Wx3a1P0iiT8mJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6262

--Apple-Mail=_F983FB21-9ECD-4F74-92F4-E65FC7D0D48B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hey all,

The design session website is up:

https://design-sessions.xenproject.org

If you=E2=80=99re attending the event in Cambridge, please register an =
account and submit your topics for discussion.

As a reminder, here=E2=80=99s how we tried to balance ease-of-use with =
fighting spam:

During =E2=80=9Cphase 1=E2=80=9D, anyone can create an account; but =
accounts by default start as =E2=80=9Cunverified=E2=80=9D.

Unverified accounts can create design sessions, but those sessions are =
not visible until approved by the admin.  Unverified accounts can also =
modify their own sessions=E2=80=99 titles and descriptions, but those =
changes aren=E2=80=99t visible until approved by the admin.

The admin can manually verify any account that looks like it=E2=80=99s =
valid.  Verified accounts=E2=80=99 design sessions are visible =
immediately.

At some point, we send out a verification code to all attendees; usually =
a week before the conference.  This starts phase 2, where anyone can =
still create an account; but attendees can verify *themselves* by =
putting in the verification code.

Once the conference starts, we move on to phase 3, where you must have a =
verification code to create an account.  (And naturally your account =
starts in the =E2=80=98verified=E2=80=99 state.)

See you at the Summit!

 -George

--Apple-Mail=_F983FB21-9ECD-4F74-92F4-E65FC7D0D48B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmMPcQ0ACgkQshXHp8eE
G+00wggAvWefk3JamV827zxUwB6Olz4mSdeeDSUkjYJ4o1pbW00Uu6MhfzBEbS3a
hPHdmOHw39edVqfrzvHxSZPorCeeZ4xvR8i+YvpzfflOcNnUaJ6xQqhBgfad/3OF
SEHKRqicdBUezMfO522p+Lr5TF3TvaL4X0tsfM+P32LwEfaMdZ4Gk8p9fV5Y7nGD
1ei77UkCCkMGCMAD07ZxW45c6KUaWtKrFnx5QsMOUCeSv7OQYeBMVsIobmAGntWR
7aLD1qbcQwwQ88Oa9PIg2N6w4jmApqsU7BBUDBEfWwNhwJx503PPTrH5kkXkg2kE
tm0YEK1dX4YtjEd9Ax/wT+3apcnCLg==
=1YOt
-----END PGP SIGNATURE-----

--Apple-Mail=_F983FB21-9ECD-4F74-92F4-E65FC7D0D48B--

