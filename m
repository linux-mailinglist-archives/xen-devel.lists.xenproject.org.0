Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 955434089D3
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 13:03:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185622.334308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPjjK-0006ew-T1; Mon, 13 Sep 2021 11:02:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185622.334308; Mon, 13 Sep 2021 11:02:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPjjK-0006c3-Pz; Mon, 13 Sep 2021 11:02:30 +0000
Received: by outflank-mailman (input) for mailman id 185622;
 Mon, 13 Sep 2021 11:02:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mPjjJ-0006bZ-73
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 11:02:29 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1203d6e4-1482-11ec-b3a8-12813bfff9fa;
 Mon, 13 Sep 2021 11:02:23 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-8dxmdYFKNO6XUMh9q41vyQ-1; Mon, 13 Sep 2021 13:02:20 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5902.eurprd04.prod.outlook.com (2603:10a6:803:ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Mon, 13 Sep
 2021 11:02:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 11:02:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0013.eurprd09.prod.outlook.com (2603:10a6:102:b7::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 11:02:18 +0000
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
X-Inumbo-ID: 1203d6e4-1482-11ec-b3a8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631530942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bUI1q/jRgHPdFA8Csjovr+XAr2YYQ4AnKtiho9gb5Pw=;
	b=UPiGs7t4IBnl6yxsel+XPi5Cj/GlaX2HRyMrtMPB6VC5fNffuM6kn8RrANpKktGteKF7MB
	xXmCSgr9/1dRuMv1wKtUrDLnoFC2Y8fwtNPnQrLfEF0RJ8P371CGBmAauDDTfoTs8WMMek
	XF4QJm4aAYy/fBnsXbmYqwCoSYj2C2M=
X-MC-Unique: 8dxmdYFKNO6XUMh9q41vyQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qoh9AprcOE0yF+7kyYDcrghKnyRpAZ4ukKTraIk41zvlPcolo8lm0sAP+d4EWOkWYliSlCdd6HbK1YlHVFCwLIClAT7xOQvvRXavVnwXyzYNlC0OwlhzkuLsuFFGgUcM6HEXlUTz9DCUZLyibtsErmXG2SNYvXOebBIg91wal1CnyqQt4CW4N36FTdfvx690rIxj2MZ3Mf8PiB9o9+qsk2lRT+Y1EkLljShppnG+A/nbLhvrBtpggqpUMuAiGxL/GaDKsMsIwicOdl+ns6HUgtnxGPZY1poo7mrcpvPX/J/4O1wUyZYe0RYDC1b8672uL5DLgeLQd2SYd0PSFsbRmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=bUI1q/jRgHPdFA8Csjovr+XAr2YYQ4AnKtiho9gb5Pw=;
 b=LmI40m4iiMfXqep+l3GtDV+95vQCutkCbbqKVjh00QT7KLSFHpzTQM+FJEhNAqwBG67oshttFRd6g9ztglDeg8EutZFmIx3SiRBwUAmq3zCTZMBIqu4FSIh+U4f5A5onuWRgAj5h3bJi6cwUbgT1Zqoq/ZKTQuQaHb6Yms6nA8UYeJvypA0K5P1n1TOJU/r/Vez2sjw8GKgu+7PlDQbVSJheMqzvQL+dP6zb4EUMWdD6/6dFZvQmHSLO7JsKVLEIe2J5/9GwDczfTFm9t4eT9eecB1LQD3bnkYRDaw7m7YUvYlW/W9E92oLGU30BCDpZwjioUgnmmDc4ryzwUA4t2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.14.3 released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <d0a3c066-f3be-ab7f-3194-5320ad01ea09@suse.com>
Date: Mon, 13 Sep 2021 13:02:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3PR09CA0013.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: defda201-1dd2-4c9f-7bc1-08d976a5f3f1
X-MS-TrafficTypeDiagnostic: VI1PR04MB5902:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB590268F83083755E6E327134B3D99@VI1PR04MB5902.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F2BXtLcSffSDYSvhd9UhVA/SxA9VPbfCD4pg8DeRr3TLi26HB5U/BjAFLPqHKdzrAsU/vcEMRZR3VIWjG87gue3+aH7bq+n5DV4SntpRoA+rSx8SvGlr7GqyE/n4FCK4XIYrdT/ivsZOnO6M+SAPrF8RxCYjnVfHarCUwuc6q2j5TlJzBYjHhCGs8cg0mDOjmnsMiL9rUqBHTZBY+Ak+vxpbuYZPhwae0yVJhh2MyDh+KRjjTEsgSNAlbsDGX7NM4LSfWUTlPjrPeNaDm+M9cxxxf8Ot4R8y5s/9k2H2f3gSSne0JumMbOu3XOX8UWwu8/zzcQMquww/NbK+OwQndJiAs68+9D4KGj9qA3Y9o5asXB67kWwHJGu5ilwmAqGwOlC6LBlXIadNH+I136IdgEk6k/VwN9pNZDLrn2HoVD262s2zJkPYt8H8JIKgwJxrMsLtYbTT79Z9i9llgXplNHHwIjwF7I0zeH3lvN+GcfTk14siIjO/cvhYRN3QA8mg4W8A2dH092eX/pdaVdR1YNacF6LfmMoGnHlw1dBv3tfgrHx0CiuCdqibJGP9d7K8nZ67jtabIfuWl3/VnWkdaecwbPJmk7wPCiN/pVt0lORvwXVLZKUdkMItzogDfnO5LZGDf1rKDimS6NJSwzZQxnwbndZJb4p6J0/NCzcRx+Mp3ZnU9J2wlzHcNGcm3ZOuoQ/iI63vgf8HFayA+q3I8yE7YVlcv6FqSF3zPJ275LEinTzODCJOWNv5oBSmUWgGwtP4vS64PdkRdMFyDTqoQg8Wi3SJTU/6mH9Lq30ajg/EVPAEN2pxt2MbHaYaqMER
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(346002)(366004)(136003)(376002)(31686004)(38100700002)(6916009)(316002)(66946007)(4744005)(956004)(2616005)(7116003)(5660300002)(66556008)(36756003)(66476007)(6486002)(2906002)(16576012)(26005)(966005)(450100002)(86362001)(186003)(4326008)(8676002)(31696002)(83380400001)(478600001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWhrREl2WlJEczNyTWp3UWdKV1oxYlM1MjV1ZnNselp4dU12TXZCK2pIZGs1?=
 =?utf-8?B?QTlwRUJOOTA2OTBNeHZmZUg1MzUyaTBHa2dycGdPNEZYOFZlVW9CdG5DQUFN?=
 =?utf-8?B?UWh4dW8xbmJTR0NuSW8wREgwMDFMS2RmVCt6cHZNR25ONWZDNnROaTVKZmVJ?=
 =?utf-8?B?SEVZN01ydS80NXpXK1NheVFOWGQxaWJaR1NtQnltNVFYZE41UHNscXQyRHZP?=
 =?utf-8?B?Yjdyd2pJbnZ4VFZqZHM3TXE1cnBUVHAxeEVCOTBpb2owRStWZjBRdWRVbkFo?=
 =?utf-8?B?NFlsZE1WZDM2QjFsTDZ0N2FnUnJGVjZIdFowTnhaSUh5TUxIQ1h5VUhGenhU?=
 =?utf-8?B?aFhiZDQ0MEppa2Q2QnQ5MzZxeVNSUUIycDlCWmtrdXBaemFrbzdDa3lHNVM1?=
 =?utf-8?B?L2dJLzUrLzFsTXc4TlNzd2J5ZGw4ZlBuakFtY2wzQmFSVEtkUXRleHFrcUw5?=
 =?utf-8?B?MVhTK3dCYWV0NndvU2hiTzVDSS9zYm91ODlzRURvQVVXbGJWVzFSSmlVemND?=
 =?utf-8?B?bDRXZWM1SlBQZm1zNUNhSVJlWHlNbmNmOFpJbC9wUzlNNGZRbzFwdStjWEFa?=
 =?utf-8?B?OStuMElINXBiNkU2dmo3VUJiWnAva0RxWTBFY1A0VjI1MlRFank4aXl6ZWJY?=
 =?utf-8?B?ZDZMbjV0aC9YODYwUGpUMy85SzMrTnAwQ21ra1Q5VVlZS2ZGcnpIUHBLOG1N?=
 =?utf-8?B?Rm1TMHNRYTE3NkNPMk1CSFZUREpJNDBIWWJjTkR3Y2gzU2M4ZUhmUlBVbWND?=
 =?utf-8?B?WHFESURIRnhpbS9yYlVWWWN2QmNrVXM0am42TTBKS0xsQTRoOTNYZHF2Ulo1?=
 =?utf-8?B?eVp2S2F1WnE0Mm9DcnAwMzVKRjMzVHZqYk1tRDFRS0lYVVlPcm8yTkN5QW1i?=
 =?utf-8?B?MTA2SldIcGZDeGxDYkFtcnpnL1N6U0trNVpQOCtvTm5oTW1rUXYvUXk2aU9r?=
 =?utf-8?B?c1FSeGFCQ291U2htZFQ4dTJDS2pYaDlPbitkQ3pKTnpFdjN6QnB3TVdnRUdM?=
 =?utf-8?B?Zlk0QkFQL3JDQ2RyUG5yY2pQT2JxWlFFS2poM2JtYjk4aVBjdzJjanhPVEhR?=
 =?utf-8?B?L3d5NXhKYXNqUnRFNks0VmtMQkNxVmw0cmZYN3NXZ1pTb3BzbmRkVDBUeUg4?=
 =?utf-8?B?Ly84SG0wMHJMYVFYSDFNVTRzNWx4YlRrZXlEQlNBaExHV3hLcjZway9sQngz?=
 =?utf-8?B?Tk5OeFVpQ0hxSHRpLzNwdjlLL2ZqN0ZHZXZOTEt6c05acXRYaTRGN0FQWnQ3?=
 =?utf-8?B?T0NNQ3p1SGNPV2dCOFNJaXRSMDBYTUVDaFJJK3ZWWjlMK1JCZm5lRWhUZ2l1?=
 =?utf-8?B?bERKMjVGeDArS1JvQytmRFZjS1FyN0N5RWNsZGlvR3hxWlJPR29jaEVlaGts?=
 =?utf-8?B?ZHRkMzR6WDVvVEZJdUVobU1sYmJodkh1UmJpSkFiUU1UZWpCNlpLVGdMVTcz?=
 =?utf-8?B?NFo0WnEwRjRvWnhyM3drcVQvKzJDSldlT01uK1RMS3dpYzl2bHhWNWo1MWs1?=
 =?utf-8?B?U0RnOXZ6YzNMNm4zVUV1UVNZT09aOFJaWmI1WElmM3BlWklQS2hoQkhlWFBN?=
 =?utf-8?B?UjU4a1JaT0RrR3E2TGk2Tzdjd1lqUXJPMTA5Wk53OGlhamtTK29zeDlwYkM3?=
 =?utf-8?B?Sktya0tobitOOHh3SVN1WWhMT3k0TUFsVW5NYkU4cE1OY3RIK1ozSWhRZDJu?=
 =?utf-8?B?dUNwd2tvTzhQMXFHRUxDMElDbGVqRVBxOGY3M3Fja1RoSW5tM3o3R3RQdEZV?=
 =?utf-8?Q?q6OiSMeXtmBBNaPVtySZ605TM0ZSwDOk3BgqHJV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: defda201-1dd2-4c9f-7bc1-08d976a5f3f1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 11:02:18.5036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQ6HIlie9qqT51ZF4rWgUoV0G0MXm61Xi2C7TlNVgB1UZPaEJMUDfC7EkkToJINQB2VsFDmiZKJJWc+gupEXJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5902

All,

we're pleased to announce the release of Xen 4.14.3. This is available
immediately from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.14
(tag RELEASE-4.14.3) or from the XenProject download page
https://xenproject.org/downloads/xen-project-archives/xen-project-4-14-series/xen-project-4-14-3/
(where a list of changes can also be found).

We recommend all users of the 4.14 stable series to update to this
latest point release.

Regards, Jan


