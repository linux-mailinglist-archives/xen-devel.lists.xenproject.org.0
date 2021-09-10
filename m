Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE845406CDC
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 15:25:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184397.333023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOgWo-0006Cq-2u; Fri, 10 Sep 2021 13:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184397.333023; Fri, 10 Sep 2021 13:25:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOgWn-0006Ao-V8; Fri, 10 Sep 2021 13:25:13 +0000
Received: by outflank-mailman (input) for mailman id 184397;
 Fri, 10 Sep 2021 13:25:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FfYJ=OA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOgWm-0006Ai-Su
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 13:25:12 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d89e5bfe-c4ed-46ae-be38-8b57830a60a0;
 Fri, 10 Sep 2021 13:25:12 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-WzngEDSTOZGyBwy1UiR7Mg-1; Fri, 10 Sep 2021 15:25:10 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2606.eurprd04.prod.outlook.com (2603:10a6:800:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Fri, 10 Sep
 2021 13:25:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 13:25:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0207.eurprd02.prod.outlook.com (2603:10a6:20b:28f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16 via Frontend
 Transport; Fri, 10 Sep 2021 13:25:08 +0000
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
X-Inumbo-ID: d89e5bfe-c4ed-46ae-be38-8b57830a60a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631280311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=n6ORjZOM7dm567gcGxcVx+DSkWtwBTE0bA/15enp1lY=;
	b=bWT4qarH7W82D/t3DSzunnVzFmuDoOMT16D6meA6/IKkDwaeY4hY3P3LcsLop8onnrEuqo
	Fv/Hvt8jkuC1ejULmaucjFdBWaaeV4SRBwBjgnadEXZbB9lIH1E2lp3lrNIMPnJRCWnW6L
	XxdNrfosjQXWfM9T+PIsE/WWEaLZc/w=
X-MC-Unique: WzngEDSTOZGyBwy1UiR7Mg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INURRoBI1y1KTqU8NrYRycMFyUCGBOdJ8mzRxEw5kYzqYJfimjfH+zXeRqCtqVFCyrKi53VYOOIzcSC4bCOJht9YFO3z0pAhuWctK4q86wBJoaXCgeEeVEIBYFrqhn/5JWS8w/izFk2Co33I5pdjlmbuU05aoaF7qJ0/URzBSy/rDaobwK+eEzcWQOEDk2OV4yL+Ud505WLIUoiaEZu24pGuHqy02koR2+jY0k9/l7uVY/WN69MQ9iXBtIinGnbxBWqFTgKAUY9yOxsGvx33Cfu6k2rrsBX5SXwjWvtxDAa6yzC6/Mp/hkVMY70UnIVlwuSXPaBrnsRpRxpkAjmFaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=n6ORjZOM7dm567gcGxcVx+DSkWtwBTE0bA/15enp1lY=;
 b=NNWNJRbwjbWa84e5eM3/jFbFMO2nUxJHx7uNHEtISUiuI+Hl5z+cemDf42wEHGwDAH6rBEgYUQoFD5cy2kE64kv62GEUDTcYuH5wTuDdS17O2zGEWVmzNvQ9RktTnzEjROPJjomJBpLi7wiGA1sORWxyMV0W713vCfgEEosxft0N1V/mLPve2KOp3ZYcz+unChmH74nJ6KHDX6AmywCtXJZJUJMQDnE+jzTnLq92I2zFTYnuW/EC+E8dyAyCsDquub1scoG6oO87XXB14hEXc2eg9yj0X/GemJMqAWEYhtHHXkFCSS9m2Y2u5/2dHqLZmrGMK1OxK6wkiI0uUDH2qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.13.4 released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <d076b231-1bc5-e479-72c8-277f0bcfd84d@suse.com>
Date: Fri, 10 Sep 2021 15:25:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0207.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c6a538e-6367-4d39-f2c2-08d9745e690e
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2606:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2606D88D95A193039E65457FB3D69@VI1PR0401MB2606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9dQJO1h3xpeD1psYimH0DK0hGAskBDui8TVF4rbrCGFIazCS5BMyTU6GBdt7GxxJrp1nEtMKizAO1EXkjWTUMFSXekViHUriENFcds2+y9CVd2HOQiXF6nYb0sAbGAYBhd2aVV9IYj7Stkjc5TJHPN9Oh5TKV5q2ZX/ob2SRq5NhIvvqmtMpEds3tzh8pC+M5VWWGe8sD/uy2xH4IJgJLSbtn3/LDLeta0PTRKrFKue/795bkvOn4Mj0USVEU4CJRVXA6jG9h3wraFnZVrsCLC5jG83yBBAsJmaOeRmPo1S7XtfbTgP67B3UhDmLprpV2Jl5OIjdJM0nL39X09VSXhzvGQbnO2h7OSP2T0YQNr/0p+QoduiT+H9g8dnmB5rwEkM5nClVOPs7lmkqZ1ED2kPEHMms7zbdY0Bc/Hy39OUlBBjGUPKTy5Szg1thQD8c/2DnXXs/uj8MpvimyiM9PN04c3sAOxXHfSwoLdMGJ4v9eDVaegdjW3dtUV+z1UqO5GnlxwCDskP1RevMwu/FTj/1xHz2UcBjsG8Ehcgt8z3My5LFvK6nflCs64MLMgAaVl7xOzl7oDyQCOg6xFhosatj7HiLTdduSArP/4Z6s276lFZr62k/WzQsBcBvM38y2PcjOyUDIgmtlGPaS2EjQ6jSfeS8Rzry2ijPIlIMVUjvgWitbLiWSSjzQvYO8BGVFtqvKKwDhGyBX/ibZ+7yKQblKzzaerx/7EGmGuRctuSTIf6/3hSWRzyD0N/Qz9JvqlHmpjxTlhMWu7/xQc4AGX2qdaYn/qm9LqyF9frF8RApG8DbSLcJj1n9oml2bu4J
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(136003)(346002)(366004)(39860400002)(6486002)(966005)(6916009)(478600001)(83380400001)(4326008)(4744005)(450100002)(31686004)(5660300002)(66476007)(66556008)(66946007)(2616005)(316002)(36756003)(956004)(31696002)(7116003)(38100700002)(2906002)(86362001)(8936002)(16576012)(186003)(26005)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RU9YZFowLzZrempOdzh3dzBvZk1nTGNEY05XUGFiWW8vTmJxbGhLVE04aUNR?=
 =?utf-8?B?bW1ONzZxK1lCeEJzRzB6SytFeDUzbEtQMStkREVvcWJiTjRVNWx5Qmd2a3lt?=
 =?utf-8?B?YkFUQndIVk9RY3o1L25ack1YaUZxajA4OVRXeGhpNUw4Z21rbUFpdk5Rbyt1?=
 =?utf-8?B?NTB3b3ZidGFPaXU2VG5VK3N6dUwrVFEwa1laUlBzdXJ6M2J1dEZ0Vk94MEd2?=
 =?utf-8?B?bmxoQko1M0xWUU5BK1MrdVFGejhzUHEyN1VkYkRkV3hsWTRFNGZFS0FBTDNS?=
 =?utf-8?B?bmZIOHFrd2tKNmsza29xY1pySGlUZkUramxLWU5iUktSUXpMNWRkbXVUVC9H?=
 =?utf-8?B?a2kvMEszUStYa29BVWgxa3lVbzFTUS9FcnMyekNwVno3SzcrYVBjemJQZ0gx?=
 =?utf-8?B?Rm1aL1BoTElFcENqamxIZzJZeHVMWis1TWYrTnZiRXE2Qm1UL0h4ZGJrL2FB?=
 =?utf-8?B?WXNVMXc3MDk2azBERUc4SEVnVHZZV2kreWtTZHB0eWoxanhWUWk4NXhMMDZy?=
 =?utf-8?B?OC81WEdsYUpoZkVUaVpTWTc0cXMxV0hNVkk0R05mSC9CVVdHdTBrKzlGZndD?=
 =?utf-8?B?T0pwUDIxTVlZUkxwS0FRQ0pFaWlJMWdDc1dXMk1iTTZFUjI1TEhrSktKb3N3?=
 =?utf-8?B?TlYvZGhhcUFCbkQ4ZHJLZitXamk5M2FKZEh1N2krQjBESDV1cEhoYnh5aUly?=
 =?utf-8?B?NHh0dVVjcTZibE1zbzdybk81dlBFcHp3SkZ5Uzc1cmpvNExybTVNRmxkNm96?=
 =?utf-8?B?YnNuNU1OMGVwaTBUL0IzV3djKzM0MUdEQWRKZ1EyV2p3Mk1rNEdFdW8vbExQ?=
 =?utf-8?B?MWFxN000TThJTkhtSEYxQlhrQU94dllyRjFVR2pQZ214aCs4S3pKeGlibWNP?=
 =?utf-8?B?RVU0UVhrbDNIeCtFSFRBbG5aNmgzSEVzVGlPdFE3NDRjamlnUDVRY2xXS01t?=
 =?utf-8?B?cmRXS3g3TTBBMGN3R0E2M052Nk1aQnFuZ0xNb1pOb2YxQ0tKcjFFeGZTN01p?=
 =?utf-8?B?NzBkT1EzSnA4YURkQVhlTHI1ajFXa0dYRHllZ3JnVmpjY2FLYkV5VTA4VEdN?=
 =?utf-8?B?cVY0OVVvVngvOXlzZXY2d1drNmJpZDUzbEh4SjBsUDZPY2RrSmVnL0paRXU5?=
 =?utf-8?B?T0Y4MnZKa2VMV2dhL2JCTFhLS05WYzdTY3hxTEp0bVBHZGhmRWUxMWN1d21E?=
 =?utf-8?B?MVZSN3JVRmhlQ2dRR01BSVdnWmpFNTgvN3AwbHk1TkZ6UHoxV2dwTXN1emdr?=
 =?utf-8?B?ZTUyU2dVZG1iUTg3N2hlSU13RXg4cVlwZSt4L0t1Um5TM0krWDVSMGJFUjZK?=
 =?utf-8?B?aG5lK3E4ODNLSlB3blptRlhVcGhWdkJ0Vk9FVnJkVGhlN1FtdS9VTS85cFh5?=
 =?utf-8?B?SjVsNDZMcWFUYW15djhLSWRZaDVqaWRhRzhQRkhQWHg5elRSL2ZhM2NaTEJ4?=
 =?utf-8?B?K2RaM3NpNTBZc3RKeTk3RnBCTEZ5OFVPd2tJNFZiTDg0cE84aUxOa1RUU2FH?=
 =?utf-8?B?R0ZlOHJjY3A4OEl3SG1XZ3p5YkJ2K1FTK3hLSDNXZG5kaW5VMGRWNXg3Vy9I?=
 =?utf-8?B?YlJuU0Rwd3ZGRTRrUVBmTDJLUm10VndqUnkvL2V4Uzl4M3VGWlRYR2VJMXFl?=
 =?utf-8?B?azl5THNDRjNLb0dLbHo1TzZ4SCtFY1ZvVzhBWHZjeTAxRS84Q1NaZ2o4UXpT?=
 =?utf-8?B?dktOUWNpQVhJcTVRLzFsdjlKQWRKUlhLWkp0NVEwbnQ2Nmx0YklOWlNsd1dl?=
 =?utf-8?Q?nqjlroirM3u/Bv0onJXtjcDWEGan8gpckqx3k8f?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c6a538e-6367-4d39-f2c2-08d9745e690e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 13:25:08.8960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xT7QRCW5SspvjjOfShORGL1TGRckiJbzp+Q2IHymvdW5uqxPhcenGoBKD4wdiuX+aBjaHPsC2A8S+JZaTeVTtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2606

All,

I am pleased to announce the release of Xen 4.13.4. This is available
immediately from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.13
(tag RELEASE-4.13.4) or from the XenProject download page
https://xenproject.org/downloads/xen-project-archives/xen-project-4-13-series/xen-project-4-13-4/
(where a list of changes can also be found).

We recommend all users of the 4.13 stable series to update to this
last point release made by the Xen Project team from this branch.

Regards, Jan


