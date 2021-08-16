Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 617033ECF8C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 09:42:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167206.305189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFXGL-0002j5-Oy; Mon, 16 Aug 2021 07:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167206.305189; Mon, 16 Aug 2021 07:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFXGL-0002gV-Lg; Mon, 16 Aug 2021 07:42:25 +0000
Received: by outflank-mailman (input) for mailman id 167206;
 Mon, 16 Aug 2021 07:42:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tuO=NH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFXGK-0002gP-Cb
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 07:42:24 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc4cba46-5666-47a1-abcd-28997cda72ea;
 Mon, 16 Aug 2021 07:42:23 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-9CuptK8ePDSmxgPha5KMGA-1;
 Mon, 16 Aug 2021 09:42:21 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Mon, 16 Aug
 2021 07:42:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 07:42:19 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.9 via Frontend Transport; Mon, 16 Aug 2021 07:42:19 +0000
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
X-Inumbo-ID: bc4cba46-5666-47a1-abcd-28997cda72ea
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629099742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bnJ+xxq9ZFGYCNpJ4DOduOBNEmyZdlG+wADsSLwFbNI=;
	b=OGkcVc+0IR4n9nb+mvgwgTA6Zav0LYlP/JWruwBhvvC5KheVom8fYSfbxz9XgYUTA5Seb3
	OJIrxeFTkUsGN1JDBlwx5QaI4mY2bORdLX9Cy++lXWjAnsA7SoQ17aiAvPURuFoJBABa3m
	VS60+oQ0q+Jq0gma3S8CeEU5IFTjORY=
X-MC-Unique: 9CuptK8ePDSmxgPha5KMGA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFtULm446CooVDytmhpSvTdsPzoF4IfGO21SNZvQQmrZXzp4v3J5axvyY5Orlcpvrhn6Cm/6UeUNLqNFRtQMQ+WRUun+l6xK4D2DRz3a+/JNuzuN524w6DnM2SknCMYTPW3WDuQJxp/hSRo9e7DBzAWOc/j/qn54UPt0Onf/M2LGJ1lSxaY6QQr6qnwa+VGFIr6AVMHzMzpIyUPo/UaPklILOv10bLHd2843fbyG4XbMFDwzdeKWx9PdH7fjfdRBBSl8ndO+2XAPc5jTiowEh12GbK/hqNqWb72EbvxkqFg1ep548adCcgFBoxTFRvLyRfP2NuD9B6vGwyeFyMfp1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEOafbqeScSI2giSwrVPUok6Ozu0erytyMmcGHPGAZU=;
 b=QaLFxAyrwkDakajbM1w1fKUPCFs4qxG2mSrIge9zlYyoIvBde2DZbGplQQSPTixNDEMDBFp7vWn9XdEQ4vldFa74qVkb1iVFzSI6fL/Jpx9syxrwxdtEL3lHOmr5O0s0tYe+ZUvnB0CONnvhNTc7xvCZWUcduEuGjdNNqKzP2COuNrKMwrXGe/NWU+jLukij0JJR7wHmzHzaUcM/hmKAsWjWzIcYTXsHQFnAD8VrBwa6m3JFTJxcBsFcgnUZ+w1FW0cjcy/25Hxu2Fq2lrNs0MF7ezqBLTA0aq8v9Efj1H/9wuU3dj/rg7lZXQa50xmeNE8tW8a3wIGQL94PVclEew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/2] ns16550: do not override fifo size if explicitly set
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210813183139.391546-1-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f69eff5b-cc3d-58bc-3646-7c20edea9fac@suse.com>
Date: Mon, 16 Aug 2021 09:42:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210813183139.391546-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59278516-38ca-4f10-c652-08d96089609e
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70389D141AC49E13169325FFB3FD9@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1K4KZkby4rsThamsT7q30tGVY0XzOtm+wkLCgMpqWHRrKgG/t/Et03v7VQD1pNUudFGw9Z1GRGoyDQXYnPjuZ1eIDc/o1c6I3pedHhkxwKFC73TgRhEQQWgSOs/3TaLrZY77Oj5NnZbhoyXE8KKIWho8QEoEywb1uGtrStNBK+FRjWs4SkYnytIwhzXVCq3fPmXx5C60fR4KNOJJwYyYysGppWZH/kyCxfVg3MwKRBP5dg7cmZbvBsYNqmBoWRvb1hxAAI3dN3+MCiO0gi6Kzb8P/QuR0L+deIBVOmdnDUTLNndmaWo0h5sFEaDId1UjhY6EGXsDKg4ZxdJfeVW9/rbDA1rBMW/+Ww/PaRbk7D1jmAbjILa3nFm2VX2ZPW2oHrXvo4m1X74ch7+I7im29qrNQUH2tnTogAW0LpPRx1v83NXDuj0RtSNyMHaMiQrIZ4Nx4tWZS+iSTZ6887DeE7bFsPkBa8GKNYxHFnJ9iDB9245wL5tdAo1xZy8SbIjcxdDKP75A3vJ/qQq5TkliL6NdOzL52wtfAEfioUlh1YEeTdPjbVnkoFtARuMfyUWd0K7zT5ypWI8LgZzhRndaJQ0Nv2opYGc7E1xL5NWx6/5/pAJeNk9lRTt1HS1IcReAKdOtmoIgFdFMI/9da19z+DUKQpE9lcG6PCsUZd8sW42tyeSzlQotWB1ZmWBHzyay+NVlZQb6CuThiSQwtIDmqRoB9SHhQOxSakxs15ADBOk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39850400004)(136003)(346002)(366004)(376002)(2906002)(86362001)(8936002)(6916009)(478600001)(31696002)(316002)(186003)(5660300002)(6486002)(6666004)(8676002)(66556008)(66476007)(54906003)(16576012)(66946007)(4744005)(53546011)(31686004)(26005)(956004)(2616005)(38100700002)(4326008)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J7zyUgv/VliBBPcZUIA8/b+Z10P3cMDXFjDkftSX2e30SU4t7dfpdXgEpoSA?=
 =?us-ascii?Q?C2Bm7S+9+lGE1dHpw2wcS9JwcYuoqCwGZiJhOEijCtL9aZxtUSlMPWh3tkaI?=
 =?us-ascii?Q?OviWRx/zA+BK65V3zN67vsG4NSLqXfwdjxveH92Th04dJfCqg0t+cAAB4eZM?=
 =?us-ascii?Q?6roN7+/MnfZELOB2BKHpJS+bD+MuRQkxNTgxdNvWsao5tAdHINPiFhmnkyaa?=
 =?us-ascii?Q?vFQuyj9DzHIh/g2BAXyLjbeTGMibdHu5sfHvhwLQdptiAAHbTZqGxz7ctVMQ?=
 =?us-ascii?Q?ZzWPkFOG6/O5nE5MFNLc7cBRDjNI3/Lh7fMdRrPQEPQPmHL+2icRKA1gHcCt?=
 =?us-ascii?Q?IviK4pcRGSwIyDcVcMEeNibOZfgGmGqrvydVULn5CYVAV3Uc560G9XuOr/fN?=
 =?us-ascii?Q?spVcSqT1Zfny1mJoEnbw5lw5l/rWfFLYAO8wa4WmsYBxnhHN2Zhb4lyrd/Z6?=
 =?us-ascii?Q?WsNjxfwrBUksRiTp71KHVqYAvvPeof0yl+4H5UR4DG2zFrx9zG/DbCFRK3A9?=
 =?us-ascii?Q?HOiXRqYxmcf/YJaDSi/eYZMu1Rx+A7S4mBBVMxNQ0MFHsqKzZFRvyLNFpbNC?=
 =?us-ascii?Q?uuAuQiSjmdfCRfz3F5Q2feBvsr7iOCh9gtPQJYEcDaaorNg+xd9ekU4LDQHU?=
 =?us-ascii?Q?AsV6HbBCN8BT3ThE5/sBK6hxhbiyuvssj3Y4zsIUKO7vU9+xoRW4UzK5g/vj?=
 =?us-ascii?Q?dfmG0rLTrzuedKl0t3LiJduUL3b/lqREM8lvX7FGEfDfx06QT7W2goraNfMs?=
 =?us-ascii?Q?m+LI3KPpkq6jh6IwiDTOwwq3+145AehPrkjJiptN+yNQMaihpUDJxHXsXEwV?=
 =?us-ascii?Q?mp2mW4J+Ym7CuEWFki6RBvthI7UtcmYn2zX5xm0GWdUAuG/eAmR0ZM+PMySK?=
 =?us-ascii?Q?FcmcndKRLQUJz9r9cPR5v5JxT6B28xmK9UYCk2jN1TYH2rH/jLkwrCT17CV4?=
 =?us-ascii?Q?PogbXCyUperH8eLxOhL+ICt+BOFz9bFv6Sumb6cqZSDYelEBkpvda5twBZzr?=
 =?us-ascii?Q?D/w9XY7aVOMl+caGsDp0x7a/BkYbs/kC3fWrdfwig+tb3yOr89iooAxmQtv9?=
 =?us-ascii?Q?fL5qYD2kcZuugfbXgD4XeqCyvlDtu4KwSjodqw1cfm4jz28dcU3XE0hNlnYo?=
 =?us-ascii?Q?qg/b9IDFHK5AU6XuHEoWKvny9snORPOhCWhKuBktMfWwg01GWZg6L59xiN11?=
 =?us-ascii?Q?aDAsYi8L2aufPgNtoKv9FiqJX3g0Xb0VX31OyBi5uF+LmDaN3IhtkMLPJChu?=
 =?us-ascii?Q?Jtvxq1esf7bHIWH3RIrQXm/yn9CZt17SBzzDYiJkGrHpr7BKj7hXp/nft57r?=
 =?us-ascii?Q?OmdWPA8fsYs6Bf4fKmhJmyKS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59278516-38ca-4f10-c652-08d96089609e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 07:42:19.8099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g4divGVADGaRIh1iIm9wyuUJbZhgEjKYRnmX35IR4u4mCqcwAu/f1zyr3DhAPuZCy8WIqJeiomOBGV+YGj2gFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

On 13.08.2021 20:31, Marek Marczykowski-G=C3=B3recki wrote:
> If fifo size is already set via uart_params, do not force it to 16 - whic=
h
> may not match the actual hardware. Specifically Exar cards have fifo of
> 256 bytes.
>=20
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


