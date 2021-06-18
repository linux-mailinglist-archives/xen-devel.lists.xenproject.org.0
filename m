Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 029213ACBB1
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 15:05:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144600.266126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luEAx-0004UA-BN; Fri, 18 Jun 2021 13:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144600.266126; Fri, 18 Jun 2021 13:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luEAx-0004SL-8A; Fri, 18 Jun 2021 13:04:47 +0000
Received: by outflank-mailman (input) for mailman id 144600;
 Fri, 18 Jun 2021 13:04:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lC6W=LM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1luEAv-0004SE-Ie
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 13:04:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b5e361e-914c-4c1b-b48f-0f7e7e191113;
 Fri, 18 Jun 2021 13:04:44 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2056.outbound.protection.outlook.com [104.47.9.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-p5ILw7PnOdi8YDQBJ5wKdg-2; Fri, 18 Jun 2021 15:04:43 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3775.eurprd04.prod.outlook.com (2603:10a6:803:1a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Fri, 18 Jun
 2021 13:04:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 13:04:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR01CA0160.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Fri, 18 Jun 2021 13:04:35 +0000
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
X-Inumbo-ID: 9b5e361e-914c-4c1b-b48f-0f7e7e191113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624021483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+XYIl0P8/37oeSEJ9m/Nvpg/h5kqwzo66zY/oUVIkpI=;
	b=I0hxK+rl1uStAO3w8ChCgsgltvAcsMqki60Y24bFyr1kri0faUwmol5yPqDEBX6W5ikX/G
	VqqehuGvidzTWHLxP1Qw+ks6eJ+PF8a/WFyOvtRVAIKbPbxfKp56yxkD+n9o/oSMQGhHQq
	6xZUxtKgImVWdFFCdVAhumZ1ZSeuGhI=
X-MC-Unique: p5ILw7PnOdi8YDQBJ5wKdg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CzIixGGDhSjTbSQXTCvFPrYPr3OFCIWe3SPLeU+A89DgNVhZYYyjaBgifglAujZQVJ1AF7ZEeq+C90MCGoj8LlTAlzYREB/2oAHIy4c19Sbs2RGOBs7ZHQAtgsuvz//DRTCBzHidFCyxPNAVG9CP2obOXPYl/TFgHh03y5V1gBc6q+MEQgXdGR2QcN6T9nrfE41aEaxPuo+y2q9k6MR/o/X3wPBhVjgyGFK3VHCF7z6JTm7AZ4X7/puVe/QtgCQH7kLI3OoU3At3vmiOkljjEhCSwdDUrPC7+ORkHLFPoakprrdNQnAsN1f4+D6GQZWeH3OnIjOGrRbBQcz3DAc90w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XYIl0P8/37oeSEJ9m/Nvpg/h5kqwzo66zY/oUVIkpI=;
 b=HqdgO0y1ptF1/9NN+A8SDPdA8bvnXFgXbCWmqp1Xow7KuaCYtWrElY/Bt4EjSFcUJ1mmdNy9kNCWJjc5ZaxltjEKCBRFTKhT7lrJBu18qMHh3wwJkJJVrlLMpvB/lE+/xtYxzQgBa92AyVDv58+SJ9OS5OMCh73KLAUpZZFXVO+cYoiF2H2rv0sCebOCGUYEACyU7sBlybcc986wpefMrEp186Fv2Ag//KFqXL0UfbumiSIAkKWv34nh/JyTZhvwVee6R00zBdiJe/9EJiK7YNQwUPqsR7GoEpZ+6RTEUsFIVGrOtyRduL395Rg+SKgDrh1slZmNrjR5acQTn6k8TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 0/5] allow xc_domain_maximum_gpfn() to observe full GFN
 value
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>
References: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
Message-ID: <6fc7ff85-efde-bce9-ee44-bf11fb577309@suse.com>
Date: Fri, 18 Jun 2021 15:04:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR01CA0160.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9dc28238-f3d5-4e0f-1170-08d932599f81
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3775:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB37757F976400496DE8CD8C02B30D9@VI1PR0402MB3775.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hTX6DnF314Sh8Z6gdwtWWl30rBX+F4YiORPhB5sYltuCltS58jO94yqewuWUK22CgFtiyPhigVN5AyuW4XHBFTJKH8ZOPk6gLa5fz1lqZzRH2BL35W92GUdzay5XBWEScoX0x7j9blPSMWjmvHo9i2H/09egxPkSiar94xCC/+tw/P/QX9OLehxnOBUsCKqNFrVu0e79yl6DdDRpnE5ko4+0qrC1LZYc4UDZNzD1Pa1+4B5e40Gw9g3/OVPwLcFgVMg3QQ09A1PfIFjFqCgAyO963mMaN3mF+JjZts1A/S4b27uwke7bShWiFD070M/8yVSLLHL6keHzSfZGX3zMOW05LX5pjoH0I5a6k5IbEIxAmyu2bcMYH3gmwXo3ZtMu6E5bqxWNLJCZgnPHKReADncJl5/nMbYGtbwObO7AiXBGiMRjRb4l9sGXS9y0H8+41fce0YMT+Xf5PgSUPJBBLoZ/MwtdABRfpuKTN0AsbaI5UpKzr96mnMIifEaTrACoIpzduzKz9rybHlR9gUtaSrGL+VX5EUoXeCs0xXkrKW2PsKT5En6ya1MGTERyymyOdxdkYRKP6ryneGB8eMaItq965r8/x5xolRIFP2tfkGTVcJ6+cWwCj3bTdr7zI7TUKyfZcaQHp8TWaCsanuzSgw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(39850400004)(376002)(396003)(136003)(8936002)(2906002)(16576012)(66476007)(31696002)(66946007)(54906003)(186003)(26005)(38100700002)(107886003)(2616005)(956004)(66556008)(86362001)(4326008)(16526019)(316002)(6486002)(5660300002)(558084003)(8676002)(31686004)(6916009)(478600001)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTkrbnVYT0VsaUxWeEswVUhPQUFTSGlEUGhLcmtLVkdLME5KYllDM2x4RjBW?=
 =?utf-8?B?NFEyMXlaUjFqcFV4SEp6aXJUa0o2aW9IV3FrbGZ5YjdTWXhlYjBsTHlVeTJW?=
 =?utf-8?B?RkY3S29MbjhPN2hrK0ZGQzMrUWFQRG53Z3pHTG1JQkM5a2Z3c1V4dkxsNXF1?=
 =?utf-8?B?dEJPU2dtb05yOFR3ZVdUMW5MajFKdlVVUXNNMS8vV2xnVXNzRi9UK0pSNWlO?=
 =?utf-8?B?Tk5lVW5ndUx0QTJRS0ljY2tFbnc2SjNXU3VIWlJ1ZVI2T25XZzZxLzBnMFdj?=
 =?utf-8?B?L25Za0VibVczVWxMTXZwQXRlQVdwWTI0clVUQVd0WVFmenZhdVpDYkpXenFs?=
 =?utf-8?B?b0pZaHNicXBlcTlYYTB4cmsrMGJnbGpQeXFEWXpDR0N1WFVQb2ZwME9tRWNk?=
 =?utf-8?B?T25aWWgzNjBzQ2k0U1ljSE1jWkYzYVpnMkVSVGxFMnlKVks1eW00OUNrVklM?=
 =?utf-8?B?WTI4MTA2QXpIbmpUVDY5c1h0SXJETkp1MktUTUppRDZKbWpYQm5aVmp2MC9G?=
 =?utf-8?B?S0U2dGVYTWY0Vnl6emMzOCs3M1B3Ym9yNFVjSU5PSnp5R3VvU2RDaWhzSFE5?=
 =?utf-8?B?R2JocllYU2ljK3REcktvOU1WL210ZnlIRnF3QzhMS3NLejdsYUJxUmJHQ2dS?=
 =?utf-8?B?NXpCK09pTzNTdHR0cUdNeUg4MHVVRFVISG5JQXhGVDNXQ1luZ1VySTIvMWdE?=
 =?utf-8?B?T01OQlh4VWlsUTRDNVA3bVJyZUwwTWxkS0wwMmpNM28vT3gxUmFheFViK1ZG?=
 =?utf-8?B?Ymt6UTZQeE1wZ0R1U1JQK0lWL0U2bVR4ckQ1ZDhtTjhkTHg5eU43QlU4YVUy?=
 =?utf-8?B?ZXFhMU4rOWRSWlp1ckJUa1UxSFJpWE5RM0JUc2tseGtGTHdZR0VuTkZCczRk?=
 =?utf-8?B?UDVyaDNzTzVaVzNkMmt4WEpLVWVmOFdMZVFaSmxzb09ERlJYZThTdjV3OFhn?=
 =?utf-8?B?YmVIMTlYTmVZbkRTWFNHdksrZTc2djI3KzV1elZqNy9qOWJjenZob0RlZ1Vn?=
 =?utf-8?B?eExMS29RVDFUNU8xTFNGRFVuR0NSK2xJOTdTQWJzTnM1dmhFREtmNVJ5cUR4?=
 =?utf-8?B?aXR4M083VkdqMUJJczhuR0puWHZUQjh6dWMxcXEwZ200TDVOT2VRM1Fuc0RC?=
 =?utf-8?B?UURQVlZqMVp0dzVNaTEyemtXVkQrdDV1YWdzbGFCSnJHSlFQNWF6N1Y0S0cv?=
 =?utf-8?B?Z0plek8zeTNnZUFzL3NISlVONFc5VjlsNDFtT1B0R2FuM2dZWU9hdDlvMjM4?=
 =?utf-8?B?MGhvM2o1S0UwWlQwaklIZ0JXRGQ4QzZDSkFzRUE4Q3lLV0d5SWpyM2hmQUdx?=
 =?utf-8?B?UWRTY2YxTXV0R2ZxMDluaWRUYVR3VXVFWDFJSmIwa1ZuS014UzB0dkZSSjZY?=
 =?utf-8?B?bVpRNWl5SW15dlVsYWp4QlVPNVgrZ08vNE9BaFB5WnZYcXJiUnVMQUl3eVpZ?=
 =?utf-8?B?WUI3WGJ5K3hCN3Z2VTdVVkVOelBQSGtDY1hYNmhGVmJuY2NOTElWampFb1hw?=
 =?utf-8?B?S3NLODJWMkdkazJpSkloYlFFNjEvTnIxNHVtT0xScm0xY25oU3VOa2xhNFV1?=
 =?utf-8?B?OGo5NEdhdWdHR3ByendvWHl5Q3NyeTcycjhGeHVMUk9oYWkyQ0FxMjh3Zzdo?=
 =?utf-8?B?Z2F6YWdTT2E3Sks1SXQrTGJHYXZHUmFWZFhSek9QNjdqRFNEYnhLbENvcERE?=
 =?utf-8?B?bzFyZFhsdElYZDRXeTFvSjI1MnQ0bVBDajBmSGpqakduZkd6V1BDN2xObXgw?=
 =?utf-8?Q?xuxzrjHKT//b8XQRG2ssmpbvqJ7E+2p62QLc0Pk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc28238-f3d5-4e0f-1170-08d932599f81
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 13:04:36.0219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qR6L/R6X9DO1Va5sXvvMhqhfmHpFk/ZMk3Kjp/L2bnAohB2MS3ThH9sgRNC/6nFzMEDRtKMNJTRcLnyupJ08A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3775

As to the title, xc_maximum_ram_page() is similarly affected. Plus,
perhaps less worrying, xc_sharing_{freed,used}_pages().

Jan


