Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5B14110D9
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 10:20:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190304.340140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSEWW-0003TN-ES; Mon, 20 Sep 2021 08:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190304.340140; Mon, 20 Sep 2021 08:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSEWW-0003Qs-A3; Mon, 20 Sep 2021 08:19:36 +0000
Received: by outflank-mailman (input) for mailman id 190304;
 Mon, 20 Sep 2021 08:19:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSEWV-0003Qm-Bc
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 08:19:35 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fadc63c1-a583-431d-9695-7d17f8d0acbe;
 Mon, 20 Sep 2021 08:19:34 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-2-nioiX3AEM1CtRthzbdCQBw-1; Mon, 20 Sep 2021 10:19:32 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4942.eurprd04.prod.outlook.com (2603:10a6:803:59::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Mon, 20 Sep
 2021 08:19:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 08:19:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0265.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Mon, 20 Sep 2021 08:19:29 +0000
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
X-Inumbo-ID: fadc63c1-a583-431d-9695-7d17f8d0acbe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632125973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XHapG8vGOL6k8MmAWvtdgtXa/ewF3aDJIfEjIaAOB6k=;
	b=FwJX5PZgRaSprrhLldhZgVDml0fcgzEEuj0hh5QBmAszrD/yjImFqSavGmpx3agTaKD/Sc
	sYtylUZIVBrPT4XyBsMs1eirc8MvTTt+LAjoD3SgtnHv0fBcpPo7XGe2zcjLUvPbM2O2Y9
	WOD53WnMBB3ixCcTse0rJdtjoTrTd9o=
X-MC-Unique: nioiX3AEM1CtRthzbdCQBw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEtieiN88TuWYQhzutF/GZiVq7N+zHXmC1Iz8ofaA9mipkaAUUZ3NGGU6vTj8VCSaLV+lyPgkapZ+KmCWWLfyvLX0LSD9DksgzIYtjjM6LYo68IeByzyjBRu6cG6pcqGHH/NuTutlZV67eir1vho6Iykmr2BqB3gHDaEmRaN/UABHd4FXU3lVeSPJTpnvYisOAXcM08KP7OoDtyv6yX4xar7VAf1ChYOvEFIUGyou+fVEiQ7ouIY7GhlQpHCAsJnlLB5A4lcncYmlDQBlkGpElLaxEfZKjLMvBWGKJdq7o54J1rFJs0gH/8ooIsCUEYqk1ZE8Ueagha1ssiHKGXXJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=XHapG8vGOL6k8MmAWvtdgtXa/ewF3aDJIfEjIaAOB6k=;
 b=DXwpXIJ2Aw6cVHz0zosNQG5ky/iJ93fmFJFNCLUmQdhIKVu7Sluvvqq3Vy4zr8biXq9VC7q4Dicv/UYzQ8fxea9CgF2Hr2MdPY9f4OMsOC63S8Ml3vNjTcDQUrkEGGQIjWOlWqk2Mmjfby1uwrFV0ZGbovVFoZre/GlDgHsfdN304wa/O+TFvEzRp8IqtpFwqiilLkaV19+tmML+faydhiZx78rSMQcj9Eyd0maRC6HQGDf/+MSUKCXe10GLHUw7nX8jmzx48WTp4FsqnoUrneCgdSUKLe/Xcv8xQemTOT7tWUwUkFjwdEluWt6PSMBXicSRgwMcxEb2JzAC01Y70w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v1] domctl: hold domctl lock while domain is destroyed
To: Julien Grall <julien@xen.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Dmitry Isaikin <isaikin-dmitry@yandex.ru>, rjstone@amazon.co.uk,
 raphning@amazon.co.uk, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <2e7044de3cd8a6768a20250e61fe262f3a018724.1631790362.git.isaikin-dmitry@yandex.ru>
 <22a4b3c7-7faa-607b-244a-0ab99d7ccfa9@suse.com>
 <16d43ba8-d45f-021c-0e19-e233cb967938@citrix.com>
 <f1dda72c-695f-34d3-619e-ec2aa7696bce@suse.com>
 <01ec71a5-a1f1-b7db-d467-bc4c734db096@xen.org>
 <0fa0d369-c67c-1cdd-0ff8-1542487ffb8a@citrix.com>
 <0c860901-0992-74df-4a53-d75a0971d1f3@suse.com>
 <f6225dc6-0590-3456-8c48-7ab29aa00200@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c242e3cc-d4ed-73b7-8e38-f94a8c479d20@suse.com>
Date: Mon, 20 Sep 2021 10:19:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <f6225dc6-0590-3456-8c48-7ab29aa00200@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0265.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85a2d57f-b30d-48f2-1c37-08d97c0f5e81
X-MS-TrafficTypeDiagnostic: VI1PR04MB4942:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB494245E9BEC2A8A9D298224FB3A09@VI1PR04MB4942.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wCg3nREFKT8aFarEE8RfArIqMTggtj3HBrhMp8PIqSiB21710EDUMDSA+sbEkKgDmjqUasKCXMaBcUH2Lhe/PlK4QL1tiwjQRPEvQo3EBPKElgf9a4AT4ZaitD6cG+C8CfvAY6i+LXiMo3KZ1lmantZSdf5qflkXRjbBsL5MJUHbx/CPfojbk5pcCUf8BNuka4OWb25z0gCKF0zxOeUIHAuxxNiTMhjj5kM9uwn38tnx5uYe3K2X/7UzJkyOAO6Mg3Y1SsAbF8ebxy4uiC6QJaOqk/XtaZTEV2JyRv5HmPue+sZ7ef/L0k2OD3QgtWfChHDN82Q281CRYcewduOtR7qBTFPm1kdsAZj3kM/LtAXRxEYT9grttFH9M01HMLk51NUsyDkiMBQjluEvcV2Q/1nZxzGCpQVc0LBisyqeEJ9LxMxtcRziOs3B/QdUc88mgbnXe/Bna+QswDTgIAp62T3Be4HFO1Q8udhnoK0GCf9W9l1Czxs+FMA41GZyecQjhkRj0HNqz5JnbIOfI/g8tJb+XdYvNdp4j+9ZzLMVoTGhxsBlaNCxLb6qdK/EZBCDI3NKHgXF+dZJPyBEc+owGoXd0B2fihCXklJlPnrLsNZOr+QbeNz6zJU38WI5m19c77FilVROAW/Qu7sQ1MqULA49XR5YfFBTBbnJjOhcB60Re1rELSJklPOi9PNuyemMgybZ2P9ROQiNliwSK1ZQg3WKoWGkxf1lUwq8ri2iJTM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(376002)(39860400002)(396003)(136003)(6486002)(2616005)(38100700002)(6916009)(7416002)(66946007)(956004)(186003)(26005)(83380400001)(36756003)(31696002)(53546011)(86362001)(2906002)(4744005)(54906003)(316002)(5660300002)(16576012)(31686004)(4326008)(66556008)(8676002)(478600001)(8936002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXBMNGlWa2NTUVBPTGxMUjRvUmRVODFEVTIxZjdTdlM1Q29yenVDbkM4UGlR?=
 =?utf-8?B?b0JmM29YQ2NvOWJLOHBXVWc2WTFQcytydUtveWUyOTI0eE84eUV6RU1QcjJm?=
 =?utf-8?B?aVVnNlBaUklMOWxDNmV6eGcyNituNytLNlhESXJzaFlvbDEyd0VrdlhuNWFz?=
 =?utf-8?B?Q04ycmZtS2hMU1VobHFnMzl6RnJydG9tbmpiaHJ0MXFSa25Pbjl0bjV4S0wy?=
 =?utf-8?B?NmxURUN4bHdFUyt1b2hGODkwOXRhSUc3ZjVnSlNPOE5iR3VJN0M5TldOdkh0?=
 =?utf-8?B?LzFQTCttOFFDNUxGSitpV1JhYi9JcWpPQ0JLMnZXM1IwOFV2azlHUERWRXBQ?=
 =?utf-8?B?TXpjM0JMUm9BWDF6UDZKOXZqdGE4dmwrQVFoUm8rclNPWlhZV213VzV6cDlQ?=
 =?utf-8?B?UEc0ZzFCK25sczAyakwyS0o0aUdMVXkwLzJYckNBWDc0R0RiU2djc3RJcFZG?=
 =?utf-8?B?SUJsRm1pY1U0aHVQWWNzVXoyZ251TTIyVWYxb2I3RG16ZytUcmo4ODR5Y0Yr?=
 =?utf-8?B?dzhpNmVySFZRN1lYSVlQalplZC8xT21hWnhJN2NmZ3orVWg3eXh0MldObFBy?=
 =?utf-8?B?dzlXSnU5aTJUdDNaanVIam5rZmRDcy9LZyt4d1hHWnBpYnMzRXN1YUJDT3lv?=
 =?utf-8?B?cUp4UFAzbngrZ3gxalIwN3JuZzJ4ZHRJZG9tUXM3cEdaV2FSbVl0MGZLT3NC?=
 =?utf-8?B?dlZWQ0VsZGdMb2U4YUxSdENLd2phb2xqTjNCVUkzbW1PckNWMDlKRWRPcDlM?=
 =?utf-8?B?ZXVjMzlSRjUreDZJV1BRQlRydEkxVGQxY000ZHdmVElqbTN2dXR5MDdsUWJF?=
 =?utf-8?B?TUJldkliK2E4R1dJUFRnY2JEV01kbnJNODVsVXZxcVF2MGV4dGc5R0JicWFO?=
 =?utf-8?B?eWVRalhsbzk1UVBvSWdaRUZKMGdRQTlMaSs4QS9FRkY2bE5TMEpSc0Z6YTdl?=
 =?utf-8?B?R0h4c2czdTBTMHNEaVpGSTVoYkUxR29VVTF6VkJYcEtjbWJBUWJlWjVMWk5o?=
 =?utf-8?B?YlhFZ0pNNkliSlkyZEl1dlVUTTNhbXcwUmFEUmk3ZFF3REplVDR3blpscjRY?=
 =?utf-8?B?ZTFIeDZBaEhhZmFHTjQ3KzYwRXhhU2RhUGlkQXArOU9rNjlQK3ppa09UMGNo?=
 =?utf-8?B?aDJQMktOYmZ2SE5yVk5NSWRaRlNiTThqU3EvYnJTZG92RTZiK01WbUQxdUph?=
 =?utf-8?B?eElOWmtvZlY4L2VtMFdjekM0cVdLZmw1UFl0R0t6Q2NNREw0YzBSMTJ1YjVB?=
 =?utf-8?B?bDZEd1JiL09FN1J0VTFvTm1tOGF5cVJMS1JPakNBMlBMejlNNFNGR3FNVWx6?=
 =?utf-8?B?YTdKSEUyaTRjaXMxY0M1VDN1M2N1d0Uxa040a2FaRnJDdnU0alRCRVhiTmVG?=
 =?utf-8?B?b000TWUwRzFWOXA1c3o1M0ZNRjd4eGdETXpKbGNDT0ZSQXF3MnBXWEpvYlVB?=
 =?utf-8?B?MlVqUEsrckZ1TjJuUVJPdzZIU25mRWJ5OHV2SGplcTRNUkxpUnJwUFBIMml2?=
 =?utf-8?B?bEJRczdnbm1ZSGdjUVZWQytGQzNEbnJmN2NiTzN2N05hY0JnZTJJb1p4N2NO?=
 =?utf-8?B?ZjVpYUhraE14cUlqRFdJdldtUXpqekFORW9wei9MQzNjak1EeXpVeFBzZ2dT?=
 =?utf-8?B?ZGtzYkVHdjc5Sy9LODU2U3JhYVNWdDg1cWZnKzQ5R1crNWhNQ0VNbGVqK3RX?=
 =?utf-8?B?TTE4T1ZhSXIzc2c2YWpxWUJMYlBlc2o0a3hHTnZoTHZyMThFZWlXZVYrZkVF?=
 =?utf-8?Q?N3itjP5/hiWZmDK+yBt9kC4hQkZmoYLa+wErEY/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a2d57f-b30d-48f2-1c37-08d97c0f5e81
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 08:19:30.2648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gE7+JpUld+MYA9ixvqLZfAlU1NMdB/FK2RHLRxtJqIINKnRCv+O8R3tLsGK/wPo6m9vWGSkIr7p5vku/htBGew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4942

On 17.09.2021 18:01, Julien Grall wrote:
> I will quote what Hongyan wrote back on the first report:
> 
> "
> The best solution is to make the heap scalable instead of a global
> lock, but that is not going to be trivial.
> 
> Of course, another solution is to keep the domctl lock dropped in
> domain_kill() but have another domain_kill lock so that competing
> domain_kill()s will try to take that lock and back off with hypercall
> continuation. But this is kind of hacky (we introduce a lock to reduce
> spinlock contention elsewhere), which is probably not a solution but a
> workaround.
> "

Interesting. Is contention on the heap lock merely suspected or
was that lock proven to be the problem one?

Jan


