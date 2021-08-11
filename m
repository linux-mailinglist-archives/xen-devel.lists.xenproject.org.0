Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4B53E9114
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 14:30:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166024.303208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDnNC-00030z-SP; Wed, 11 Aug 2021 12:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166024.303208; Wed, 11 Aug 2021 12:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDnNC-0002xt-PR; Wed, 11 Aug 2021 12:30:18 +0000
Received: by outflank-mailman (input) for mailman id 166024;
 Wed, 11 Aug 2021 12:30:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjOV=NC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mDnNB-0002xn-DV
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 12:30:17 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e18de7b2-fa9f-11eb-a06f-12813bfff9fa;
 Wed, 11 Aug 2021 12:30:16 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-8-cb7SduzJOzKOiYzCGpRdGw-1; Wed, 11 Aug 2021 14:30:14 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4845.eurprd04.prod.outlook.com (2603:10a6:803:51::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Wed, 11 Aug
 2021 12:30:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4394.025; Wed, 11 Aug 2021
 12:30:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FRYP281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.5 via Frontend Transport; Wed, 11 Aug 2021 12:30:09 +0000
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
X-Inumbo-ID: e18de7b2-fa9f-11eb-a06f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628685015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zZzJJer0XQpU5PJran3+edB7jLA2yVqcx+tj+afI9/w=;
	b=QXOx4GetAnq0Ze/JrB84YHOtyO+SjtsQ+yd/Tn4/ojZL3EBs41Y0VUErGgPWl2bB/qAtN/
	FAnrP9SBnvB4wbngisMB6Rj6wXHJ4m9HV1bwU1ULXv29xXtLFCVbDhxQn9yf5dRTaMHxle
	hcjy/wme3bIwXuyghDnKsnh+qgZxVFA=
X-MC-Unique: cb7SduzJOzKOiYzCGpRdGw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JlekA9eDUQ8JIxbh0r0GvsrZOPungeGjNpCxKXID6scJiMZ/I1qn5iefSzdzhjHICrM2oa3eAX4JTlFJDbyz8FKaoalhIdRlVdrmDkfq7BnRm/TLJodx+lkVRoD/KPs8xn4hNO9iLn+2l19TaLFz1y4zGOmeV7qaytrtvzsmkdgvSybLYKGhFmKdcejZ5Cow+R/p06ouTGAn+nCQh6EqMwtb2cpJqmFtmaOWJwPF67noIul+sj05pH47+11iq9wBVSwiu6Y1USivH8yrzOeILJeIXNpgFnel/5bUuZD9v2Nwa8R+JWkPmkANtj8jPaCdxqpZWeTBxJ5Ql5N6GhCBZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZzJJer0XQpU5PJran3+edB7jLA2yVqcx+tj+afI9/w=;
 b=DtIfBOODuCj/1O5+N1OK8UDFNIpm8dHU2O615FzXsOxxLbVmWZGmxIPaOyUXHSIq7CHqoMEdx6pIN9P/lUgBWaB/W88WZ4N0X93rNCJr7EzWF70m6xlRWPc6yIHaJ0ogtGKPA46ueaqft2zPcdbmzykqscu0DuRmnjOqpGHaqacnIL+B+ALQc9j8xTqLyvZx9UKCQybhZ+2XYLgyJczsbBwTzXRXOxrC1afPgdLXmtKwR7kT62l2NkgTXxkru6cpXWVOlt6JFZ6qxAOuJsDtcYAGG7XDQh6IfKM5B0YEF0gbq87FV/+3DAfh2m/Todr+I0Fq8YJOV5q1+PGJtNALiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] tests/xenstore: link in librt
Message-ID: <3fe5f85c-3702-286c-46a3-d90eb094123f@suse.com>
Date: Wed, 11 Aug 2021 14:30:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::13)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 989dacad-305f-4de8-30ac-08d95cc3c279
X-MS-TrafficTypeDiagnostic: VI1PR04MB4845:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4845100B9E26D483D014EB3BB3F89@VI1PR04MB4845.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zqqpKfjmbnwJZTo1yQpa3/tXeUrO8OeUBe85e7rFprACbCmo5Je3f2qYmoiMWx7UoYpWRFIwJgEWNuoE0jcc+iLWzXqY+xM8PM8KXHl4ksoYV5ou7UwGySPkRfYkvN8iVmxRrTl4E5FEr61E7V7xDD1kp0F4VPccx9pyZWURAL5UXRgbLpbciX8HooxJrwyFlhI4YoFK1Y8cmu6BvSP4sXEOVOUbSxSbwi8TJNyo59ELhtZ9RE2bx9Tp9LPQa/xDbgmzIJrDgouHG2TwoPcOZsBS2+8BZe8PxZI8OKn3EpkljM44+TtSoNJCxDa18fr5AafvmNHU4gV7Tk1+28FskR7D1U9gf0yFIi8oBecWxzUqkPLYDniBm4I0fdE/rpUKmjlwtT/msZG8pR/eygxw8TW4eyE0neoj7Ui3Hjooo/KaXEzgJQ3m4ic8Dq9urHBpZnx+PxsAJ8ra85Mps6yG4qzkoWPI6f/yy5Bc6NCqLAtKrBRcGFLpE2EXxiGCEuftriHM0EwOitzS4YdtgVBKHEBi6JKZNJRjtySoxA0+S4zQZdJmYh/h42ljHojReNhWUsdwzb7luOL33XyZTedmq7OWoF0YlX4Z4zac+XxxfjtgLez1NcXIW/OZX8eliGQInNED2J6zg3XcleRVv5CNXVYELM0zyDz8lJd3gUBtcwzf6n0LlvSqYdXs3kRQM9/7t+PPmtlxaa1mPkUBnhbJI58i5+r3eVGgV6RVwV5vJLY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(8936002)(31696002)(36756003)(86362001)(508600001)(83380400001)(6916009)(26005)(8676002)(186003)(2906002)(316002)(54906003)(31686004)(66946007)(4326008)(66476007)(5660300002)(66556008)(2616005)(38100700002)(956004)(6486002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVk4U2xLaTg0NHBJS0N1Ly9WandJNzVNeUdwb01GWnA5YjRxT00ydGFYRG0v?=
 =?utf-8?B?OXFqRTNHdEhHRkplVUdWYXpUK0pDaVkxYjRPUmJMZE5TY1UzaEc3NjJqRUx3?=
 =?utf-8?B?UnhHR29qV0hGb0VWNXpScWFhNkxQU1NNZE1EVktaNFBWVmlkNmhNT2h2YTc2?=
 =?utf-8?B?OXExeVh6UE5uVDVLVVVPdXAyVnZUb2Fnc29CQ0dJRDR6TkxuWUdIV1JLLzZF?=
 =?utf-8?B?MGdEdU44bmJvTjNkN3dmTm1VZDJwRHFCRDNYckVmZ2dIanYvVzIvY0lxTHZ5?=
 =?utf-8?B?U21aZVlIMlkyTm9URDZ6NFljWXNONzdva3FRKzQ3a2JkTXpxMVRaVHR3OXh1?=
 =?utf-8?B?a0x0TEVmdytFS3VPWjZDZFBsMFFkWXNVbCtLY0NocjEwU1h4NjZEVWI4UmJn?=
 =?utf-8?B?YS91RUYwc050OFdVOXJXeE8rNmJmNThoOTVvSjEvaGppTm0rajZIQS9xVWgy?=
 =?utf-8?B?TUlocHdmSXptMzR1NEVxOXNmQzArSlFNQ1UySzVxdXBRTDNDWVIvV3hhanBm?=
 =?utf-8?B?QVRPbHN5MWtnLy8xQUZQOGRQcWVWeWkxbk5FTlFxenBYQVFIVkYzRUhibzlm?=
 =?utf-8?B?RGJKb1RueFRUNS9rekVod1pPcktEQzJqRnNIdkNuZ3JTanhJYjhHSktYUHFv?=
 =?utf-8?B?ZVorMEpKZWtOVUU3Y0xBdTVoUHFrMW0rQWYyNlp1dERuZDZjaGtDZjZ2b3Vw?=
 =?utf-8?B?Qld3T2kyV1RvMEFnN0hrbVpqWmJCWGhqeWJtNFI2NjVPSDZYaXBVNUt4MnhQ?=
 =?utf-8?B?SXowbnVnL0tteitXTFAzaXpKQS9DSmx0bmxldWdBaU5zdXRDSzlyNEM5bkll?=
 =?utf-8?B?RkxONFJpNUUwVWdhVXhBc1ZBTkdTZkRLQVpzNHhnNHY5N3BSTzZtUEt1OGZx?=
 =?utf-8?B?N2FMd1N3RlM3UUdWZCtLT00zdmU4aUgzcEY5RVJXeGZ4NDZPc1dzOGVhRFRM?=
 =?utf-8?B?Mlp3MjNxL1UwSkN3TXI4b3pGaHkyMDdlTTVXQkFIbUlMengrY3AzV3J4b0Jr?=
 =?utf-8?B?eTJsR0NFQktSdFQxYzVuSE1jbnREbkJxUWtPWVoyOHduS2VFOHhLQVBRdDdu?=
 =?utf-8?B?aWo4aDZlYTFmdDFxenlHVDQvVWVndFFJYXJCL2l1eExBbVp3OFpkampkZGk0?=
 =?utf-8?B?OFdXSElPN25ldlU2SUN0QUJQeHkybFg4WDZvaVNBWFZOVmZFRGtRYWhFVXRF?=
 =?utf-8?B?UTRIdkkvTkJ2RjdwaVlJQzl6am1JbE5tck9MeXZpZDdTbTR2WFMxYmdkU0tS?=
 =?utf-8?B?SzI3NjJHU2RlUFRGZVRzQ0I3K01vM0pZTThrenRLR3dMaEZnM1I3MzRVQmk4?=
 =?utf-8?B?WWhrVUtLbXpDd1hKT0krMG90ZlhaZGN0MUp4cXJjV2lKZ3NsaTFjNmM0WGFx?=
 =?utf-8?B?MEoxYkM5SHBsMVZoR0pMSmdRSU5pT3AwT1QyTUoxNmkyUGJHMWJxYUU4LzZN?=
 =?utf-8?B?R0ZzSFFFVVg0UWE0bFBYNWViWnpuWVo5aWIrWGk0d3MyeEs3d3FzUlBhZkRB?=
 =?utf-8?B?cXBaOUh5a2cyMXNFMWp0QlBWTmt6R2RveC9uWmJSWSs1L1dmb3p0dFY5akVB?=
 =?utf-8?B?UmtVZ3VyZWRwYW5QWlk1clVrL2F2R2dkUTROUW8wMU1UT0dCakE5Y0dRWnl6?=
 =?utf-8?B?bXlrTmRUNW9JenNQOXllOE9ST2FYNjdpRjRKM2Jpb28wRUt4dGp4NzBSbTRr?=
 =?utf-8?B?b05BOUdJY3lMNlRUQzQxbHUyZklHaElTdWRjc1l2cDVXdm9aTHNqcitXNVZt?=
 =?utf-8?Q?I8hKNmp+BTXK+647YkUoQlGKCIoiukxOrYnxeDt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 989dacad-305f-4de8-30ac-08d95cc3c279
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 12:30:10.1595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gXat3qe1abV03yWTfFJSjgjEMaHWNKVYoB3qXOwKVkldCE3Y42RyPgqpWpyawEvYS1DWM6BsDrdXBe2V+uds1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4845

Old enough glibc has clock_gettime() in librt.so, hence the library
needs to be specified to the linker.

Fixes: 93c9edbef51b ("tests/xenstore: Rework Makefile")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Cc list based on the assumption that the XENSTORE section of
./MAINTAINERS probably ought to list the containing directory.

--- a/tools/tests/xenstore/Makefile
+++ b/tools/tests/xenstore/Makefile
@@ -31,6 +31,7 @@ CFLAGS += -Werror
 CFLAGS += $(CFLAGS_libxenstore)
 CFLAGS += $(APPEND_CFLAGS)
 
+LDFLAGS += -lrt
 LDFLAGS += $(LDLIBS_libxenstore)
 LDFLAGS += $(APPEND_LDFLAGS)
 


