Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A097D35FE
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 14:00:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621408.967860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qutbm-0002f8-KZ; Mon, 23 Oct 2023 12:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621408.967860; Mon, 23 Oct 2023 12:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qutbm-0002d0-Ga; Mon, 23 Oct 2023 12:00:34 +0000
Received: by outflank-mailman (input) for mailman id 621408;
 Mon, 23 Oct 2023 12:00:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qutbk-0002co-De
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 12:00:32 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe02::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3b6d98f-719b-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 14:00:31 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8559.eurprd04.prod.outlook.com (2603:10a6:102:216::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 12:00:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 12:00:30 +0000
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
X-Inumbo-ID: c3b6d98f-719b-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHPh8sSW4xRortpLVDzYLxQ/2ksIypcgh6lVNNn8W0xXQGez3FH4aCDgfTOPn1FIKUPGc7tXFEuP7ytatK4I/v86aX6LNaAiYSpM5gliAxBKYm/udAMl2HBFjfWfNl7kPZIW5NQbGDCB9Gq0zm3BQ41Vn4qyz/UFJBuCoJ0T2RggN6GVopDK2zoQOuT6xPAYXjrjqEOryVDZfrfZr+lk+BltTEqdDiUZi/U+P5RKb5Yjp1Gzsb6QIpjDvcQzTFa7yI2BoqlOqOVrDgH58VCXnM3o4cNGIYvuxCHe7+y0r4cm8lfPvlfkLoo6qbVJAuSo71+OLh2XCu3vSfS21VuYUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsGFu2TMHKqRPXWQDS9YTxRvf61IeZVXI4JkWDwm4yE=;
 b=grcHHXQM0c9Y34qtoYdeqqsA4vUD9us9R9+mPVEmSr0R4O/P9QyDFkk6JC/PzwjXIFTeQsSfCKcalijDklsKufXu8bk15bvnCbxHrs9KU5leorjYPfMlNC0wTjjG9Aazt0Vb1xvdsFWzjo6PPJePgSxNISQFmJoRW2mKAyYyITp1TLIh7d47VCXms3hDrPiaXLKsJYsys9xDa/m61rMHBzfPANZh9XRmhJTjt/X+lFUi8q3zCVXjgPWpshxGqeR2E04FkQqaBvkI0HSn8j0Z68405uGv2mpRC3fVgtHHZpg+3J1VHKW2FoAurn0lMx7Sd3h9aFM+HDklikE9FtE28g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsGFu2TMHKqRPXWQDS9YTxRvf61IeZVXI4JkWDwm4yE=;
 b=iNaAV4t+LRhNksXPDjLs9ZCW2Dq8B7OBnDrKQzL8mPruXkj+hZCRXCrbZqJq0i/C+zNBGJft9K1pyU1ArNZVkU6DeVNEVRBvW1yu9i4Hxd09EjD5FeXH6QVOplTNCqU7c/8ubUDuidN8VO7w1AfuQ494wKlQPEnnXXyiNNakKIQdNrDKXZGlYbRIlcE9JoOiwgcR/7VwhRa8rRetIs0BB+0Fp0XCsCWJwoqynN5Qt8f1artYKn4+Sa+SqjiyQMDnFr5v9nN9Ub6CO82zvFaVs6Rcfqwwn/GFybgv01pCgHvb7Nr6yD5uinY6fSQ8J0cLMSV1ceyZhHBccOKTLu+7Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bf683fb8-b903-d734-e3c6-da874798891a@suse.com>
Date: Mon, 23 Oct 2023 14:00:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 15/29] xen/asm-generic: introduce stub header
 xenoprof.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <0b7805d6bd5f16d06656093d964d5d90030958d7.1694702259.git.oleksii.kurochko@gmail.com>
 <0efa2ef6-8815-4b39-bb53-f1d5902e71c7@suse.com>
 <a5d5598d4c0929a69cddbe75d4d17f9521def008.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a5d5598d4c0929a69cddbe75d4d17f9521def008.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0274.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f664db1-c63c-4ea0-32e4-08dbd3bfa71a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	exMwr7yxDnoniEHvQd/UXzuaz9gFquwuW+1+WS+ysO+f7yRwK2kJP4UgHbAGxjt8yiaTTSXajQj7DyxZ+FSwHC3xGVmRQMgUM9vfyGm1WVC65RKIUlaOFbUBKitTm1Sz5ezAdY7ymy9m9vCXYqc1Y4QlhnP0GZjqVItOQatzJnfOVrfMoxKSWEt3QOO23zW0tOP9I0hF8jioKW2f4aTZxExRKuUBmls5/N0nlTOtjYXtmeXAZgjlu1vv+DndpoCP44t7O3z3wBvYMARhfEasNcC9wiuvhGGhN9kn5ERxEi+zT1MVSiIMSLlzz7k1NpcS8eyNs0WcJVXS70VJsbhq4MZIr41Ps4zg/D2oBq6HBekNE1cXqfE1sMG/GLffd6gvG5Hp+/u/WdmTECtTZDlM17xPLOYP5gpEcVHFX4VZpKJaa5hKzS7gv1//EP/L90/HeFgIdGcJ4gFhHk9kYITcLAtbd0wHxXTls7mjfvshkBu41xN/Vzredqjh9LCxoGgvQFC7VtBXoagJ0bI0uYU+ss2noWP+KByogEBctY3KTJZLGdqjHN3FJmfvK7SYlQ0MMd1TrAzyjNMlwYX4jaT3Mwf7dM+XSnmOGHMPWNuwqCeScQ8yTo3M6LacojunOZq8UzafZur7Vvu5Ib/JMev+wqDZNrlT+Jt/zGAdQ82I+Kc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(346002)(376002)(366004)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(2906002)(4744005)(4001150100001)(316002)(6916009)(54906003)(31696002)(86362001)(66946007)(38100700002)(66476007)(66556008)(6506007)(53546011)(6512007)(478600001)(6486002)(83380400001)(26005)(2616005)(4326008)(41300700001)(5660300002)(36756003)(8676002)(8936002)(31686004)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWZvV28xQzE5cEJ0dkdYd3duZlErbjlTVXFhN1N5RkExMktmNWFmVEx5R3RN?=
 =?utf-8?B?OFB6SzhqWHYyQnpHT0kyZlJMV2MxU0YycXlBK3hBUnI3c2luME0yMHF4bjJB?=
 =?utf-8?B?MWVVK3pSL1lmeXlldDduNUxPVnRRMGJVTzdkYkZoQy9lYWFVUXdkUDRNSlJX?=
 =?utf-8?B?TjZFRms1L0hTY1M5UjJoUVdlaG1QTlhtakFzY1g5MkUySC9RcU9INmJNaHRp?=
 =?utf-8?B?b0RBcHUwdkZXNDI4RXVscXkwWnZBcmk4ZjdwWWVFMFUyZU54UXd5YUY1c3Mx?=
 =?utf-8?B?Q1NtOUphOE1XVEpvdnJ2RGx1R3pyOFJsVGhzeXdPaDhQTi9hUFJmYzN5cUIz?=
 =?utf-8?B?WE8vVCs4NHEreTVmazA5SzZMY1pmTVM2RmhMaGNpUmswSERNZXNuZWFQRkx1?=
 =?utf-8?B?TnlCWnJERXZCK1NmWG9zUXNFVTVvbDJTUEFrenVzWDY1RVFYbURuaVB2Y01a?=
 =?utf-8?B?OEltT2VydTB6ZFRCV3M4a1ovYnFpQnVjZTk1ZFlRbWdBVll5UFNDYzdERmt3?=
 =?utf-8?B?OG5xSmVOTnBBRFg2TW12RXVBL0ZlSzU2TVhHSWJ6dktEaWRIUWJob3pvUmlH?=
 =?utf-8?B?R0R5Y0FEbjBwRXVSSmtBalEySTRRdk5yMWI2Q21xWkVvVjJZMUZIMEJ4TVJE?=
 =?utf-8?B?YzhublFjTm02dVM2N1ZyWmRYelZhMTcyeTN2My9sMThQSmVHdW50WHFaQTcv?=
 =?utf-8?B?M3RkNlJBZnFqak96UVNQME9sNDY0U2JBVk1qeWJsRHVWaEI4WUM2NEJvaktu?=
 =?utf-8?B?QlA3a290dGNuYTJYMVczYmcyWldpL3VrdGRiZ0I4bjYvNFZ1VVpsV3hobUVy?=
 =?utf-8?B?M0M4U2ZrTEFrb2NkelkrRW1wbG10TVlTbmJSL3F5VURLOXExbUtZaWl1aFpL?=
 =?utf-8?B?ZXZkWUpTbUdmd0d0N3ZQbEtjc3ZIN04vaWxnLzlhS0NjSnZFd3dTK3NkZjRS?=
 =?utf-8?B?bmcrSjdBS0htNFBkemdNa0Uxb0Vkck9lTTMvY2NMSnc4bVRxRi9LeitzbFNM?=
 =?utf-8?B?QzZIMWorVnUvblhmbGVERXcvQmtEU3MrSGxyRk5WN0dHZno0NWJCeWRNMHdz?=
 =?utf-8?B?SmxvVnFuM0htd25obU4zVUdkMVJHNGdDVGpKUlNtWTRTSXZKa2ExSEF5WWpi?=
 =?utf-8?B?aTI2OHJ6THFEYmNVQ21QVExrR3JQTE1oTnozMjFzZVAwVUJRV3VSUEVIMEFo?=
 =?utf-8?B?blRQV2VSOWNGalpwWnFUNXZLTEIzMXpPVU9IZU5odjVocDRpb3QzY0hPYnZt?=
 =?utf-8?B?c1cwRTVRSXd0ekdlMzlZays1UE5oOHJkQ1kvK3JIb05pdjBnNXlhM2tmWEc3?=
 =?utf-8?B?aDJIWVMyYStwU21SVnkrblZXR3dZcUtxMFQ5a2d6SEZPZDlEM0Q4UlU5U2JC?=
 =?utf-8?B?L29XZXNFRUo4dHlXdkdkN1dWbmM4SlNobUV0dW4zOFkvVTA5bk1OL250dHd1?=
 =?utf-8?B?Q0hqMFJwZXkvUTJ2UGR5ZkpUT3BZN3pNMmprNVp6eC9OUmtERTRNbW41emdS?=
 =?utf-8?B?S3FmckhidXFlVUhZUExYUkxVd2lMQjJMYS9wVHA1UW5FQnRwTXp1T05adWN0?=
 =?utf-8?B?RVRRbk5BcUIycWFQR1o2MVR6cFc3VE96RXdTYm9HSEhaVmdIUlN0TUtqVnQ3?=
 =?utf-8?B?RW0zMUJxbzBMQWs3RlVNN0YyalY5bnJmZmMxR0txcFNjVTlFREVNVjhramt4?=
 =?utf-8?B?bnJtbDZTSVAyMEhSRGx3TTcwaGhZOXBhSWpJQkxuUHBEU3NldmFZd3NpOWFM?=
 =?utf-8?B?T2d4blQvRmxKRGl0Mm5RR2NLNE9mcWpNczVCZGYrUzhrRjIvVTMrWkJBMGZJ?=
 =?utf-8?B?YzZTbHpoQ01haWRPNENLZVYvbXRuN1YvVC9ycVIwMmlwKytVbFF2QlQ5R0xF?=
 =?utf-8?B?WTA5M2ViR1RvSng3SCtWT2hWbXRmS0ovTWNHVHpXSGpYcVdqMXhKZm45dDFS?=
 =?utf-8?B?aDJFQkhvTDZvSWpmSi94WkhGRFhzYWdrRUVQT1o4UzNHNFpUMm0wRHpDOStQ?=
 =?utf-8?B?ZjBIUG0vSVhSREJVVVhLcnZkeGdtWFROa0V0aEdQTzMzc2xNa0dUUjFYOWxL?=
 =?utf-8?B?anMyRVhsVCs5UXoyR0ZaY2hMeGN5ZmI4TjJVZDdON1pNSTQvaGxRSkpBQmJX?=
 =?utf-8?Q?tqwK9CtnzQm1YtHDpFhaLqYLf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f664db1-c63c-4ea0-32e4-08dbd3bfa71a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 12:00:29.9853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2zNnOrzfhE5K9ITI42Rus8KsHVd+F44xU8x+xg3eh6OzdogIUCudcb61WkHsudmNKB3ixeo3OSv74wRHzVGMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8559

On 23.10.2023 13:17, Oleksii wrote:
> On Thu, 2023-10-19 at 12:09 +0200, Jan Beulich wrote:
>> I've made a patch to move #include-s in xen/xenoprof.h, dropping
>> Arm's
>> header (and none going to be needed for RISC-V or PPC). I'll send
>> that
>> patch in due course.
> Could you please share a link with me? I can't find for some reason...

I said "I'll send"; I didn't do, yet. I don't really like sending minor
patches while the tree is closed anyway.

Jan

