Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C84864A96EF
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 10:37:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265292.458627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFv1E-0002nm-L5; Fri, 04 Feb 2022 09:36:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265292.458627; Fri, 04 Feb 2022 09:36:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFv1E-0002kQ-H4; Fri, 04 Feb 2022 09:36:40 +0000
Received: by outflank-mailman (input) for mailman id 265292;
 Fri, 04 Feb 2022 09:36:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gJ0=ST=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFv1C-0002k4-Pa
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 09:36:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2e29f68-859d-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 10:36:37 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-TVWdnPrYO0SprBAY23uYVA-1; Fri, 04 Feb 2022 10:36:36 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB6086.eurprd04.prod.outlook.com (2603:10a6:20b:b8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.16; Fri, 4 Feb
 2022 09:36:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 09:36:35 +0000
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
X-Inumbo-ID: f2e29f68-859d-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643967397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZmuTAhhq6iJjyFHiqbf6kWQ/PYd0FMLJgXKe7242Q0g=;
	b=KXE2LVp/h2tZPzcMVwOWI29SlCevrnxYpq9/gAyfmWJX4GzLtipOh+qkbvbJNthOSvHcyx
	sUekPnwq9fPml50R8vSMGyWa8W8O4/VXf7uywD9jc3GzFzpziIpVNPfnTt0Pj9eRI4/d31
	QBqATaZ0pisVCIgdjimAymP/qOP7nqc=
X-MC-Unique: TVWdnPrYO0SprBAY23uYVA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaCqQ9Bab8tiBbx1pjq9kQkBOnUs+y1P72hXL9Ngj/2Y1bFSEu/CHwHSE6azItUcpm3/g9hf9B1BJc2+crEaMnOXQN0jdVF1a4WiNZi42rZ6mVpS7Si5gASbZxNDdt8TdrBk5GK+8kr3Ax6hckGgxfcOaEZuTVGsGucZYIZzvta5eZU3CyOYSe+gbUVwITwFIV8UsMWfYyC4YwWbxMQ6TCPkrwFaqQlaf0dC0aCQmgq//ABIAN4LwZVWX/Jp+uypluimQAXyoTXFueLb7grN0YU5+Pr/yT46QomyXkneIP/zHkXvhmRGl/LHpsyXaaQ7dO0bWrLxpwVRHsATroiujw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSRIHbcLpCujUBzdmAjhOBMcVTvBUzvxjySGwyZ0sRU=;
 b=ZFgP4RhCV0EUR4bls1+izCg6OUKH868Bgf1oVegwkJ8zBK+UsyKfiC27jkWUK5rzP14cW4OCgrV+pxMhCHJmjmt0s19ooQcOdR5umwV9UwmEumc6zKfvMJuuQvdKy+1t4Qc+M7niMNOMskOaYnXaPP6sE0FOBEKEeolwYYHvzCDJYpAb6NxmeoC9a4fgcPGmnM6z0SLa91fLWlzr/skevOXiqK4PFQY2jTf7aP+U75HccqfvNQN/ubbbjAflKKJu5OXBA3+8M9nqnfVgU9lqyeG4affL5CMI2GsyxnNgR6lFUENH0f2jS2Le+lt6htPnlGwgOu8kNaljOtp+gtVwGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4a6560ef-00b6-15ad-ef9f-3fdd2edd9edb@suse.com>
Date: Fri, 4 Feb 2022 10:36:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/2] x86/mm: tidy XENMEM_{get,set}_pod_target handling
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <6fe7b036-2bdb-b391-4e6c-1b5d7e05a119@suse.com>
 <8cba4cd0-d218-da1b-dcea-4cc3047c0946@suse.com>
 <Yfqf5jiO0cHjR6gR@Air-de-Roger>
 <4a325d1e-85e0-09ea-e2ab-f0aae123d4c9@suse.com>
 <YfzxsLefGoTD5bvN@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YfzxsLefGoTD5bvN@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR02CA0034.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::47) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cd2ce82-1381-4d04-165f-08d9e7c1d5a9
X-MS-TrafficTypeDiagnostic: AM6PR04MB6086:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6086CE20A1957BFA8F157341B3299@AM6PR04MB6086.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4iNXvgKZJAkjACoY1lqDnQdcLsSmlz6aEqRdamCBGRv0sh7RtsgAz02UofwjV64L1rVf5PEEMvh3M8HGLf5NfYyT0sQcFMCjE0Gh4EejAT6OZFq0n0W21zOQYcTSj8bddP402sxSmQN6R4IM6J46h+eVN01ENzYs4KlZAkEYwOQVvYuc8F9c0AuS4El8QRY2WvSaGzsvkVk68s302xAKlhVf3TeOHx3Xd3k2/G4P7Mkqp7ve1bzxEbxA5aZgml80wcfTLlvZzEAP4jPPCEEE6UFTwTPjsVp3tyBvlhgKjz1qFGnRh555DOQvXP2oGZkjcIKF3bRmBbIXq76sIuwpshOGHuQoGdhb0T8TernuxCoKq+JukqJdS0GsD+RmbwoxzLhgkWULVLxnOZ7wpifchQVFKH+AIQTlgtDsDA4z6hT9G9NvFF+C0YteUDvW43OPPFKhFAzB3xmBz0ArhFG/ZW0NlhUl+rhQ532aeFCFmuIxVCyx2uWzOj2ai7poFyFl9BK1RCNTqttpxf3+EV5AhtTaldRSkJD3Ueb4/39EmT4U4nBo0C5r0+UsYwVVbOxH+JbVMhsHbjyNZpxScQ0HDP20CAGV6MuuJ8T5s1rtHXiAGILqYuz+KdPn8T7CVYj3ZkzIoeW+hFn87IpsyqL9nSxP8fGZyx4EvboJiomRzwYyc514NnkcPtwbC8IWKAsL8D1aq7lCg3cMHSnvde1cgkIrQWFKgGaaVlU/IFyRNqE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(5660300002)(31696002)(2906002)(4744005)(36756003)(6486002)(31686004)(508600001)(38100700002)(26005)(186003)(53546011)(86362001)(6506007)(316002)(2616005)(6512007)(54906003)(6916009)(8936002)(4326008)(8676002)(66476007)(66556008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BeYXSnJEnV9qzv4wBMJpJrWxLKhM7jf1BoeJe51WucHB2j4qCf2Kio5N0h4O?=
 =?us-ascii?Q?gsrwGoVIYa7z5ens0DBtCo0PBCBSJy0oGqkEynqZxiwMK29JTdWl34IrXH/s?=
 =?us-ascii?Q?FdC8ekS1zn0j3BEZLDaKYPrRZHoqwMsA8IEdM60Es2R09S0mBW3QPou6Ycai?=
 =?us-ascii?Q?Tyw3fvPJtVozvN5FQSDZk4bZNYoWiGTrztCQ55WI/Iie/S+edxhJLXNeJ2NT?=
 =?us-ascii?Q?b4eiDSbsFzyByRRULUuEjDi0+xcT4ZKQWUfcOpNeZUCiDEYml9v9MtygjHbE?=
 =?us-ascii?Q?sk72jvv4bOt1Mag4/m3JgvXgCT6Cp4T+bDv4Qi6bH0aTeqKIUwGyUmENqeS/?=
 =?us-ascii?Q?k0Crx+JuCGMywZm3WTejmCwG0z6wwUpAs2oCOU82ML2DQVFVVrVAHzH5GR7c?=
 =?us-ascii?Q?DMjwxGou+1/QYsnbNMmBK2BHm3XxFsQRaeDG55e8s/aI0Qi6ICgRP7kLpkeC?=
 =?us-ascii?Q?oA7c54zEedA50ePOWzqt98ka1vLUkoffqFXhhqmp2T9ChOL6avu0v2hwEvwC?=
 =?us-ascii?Q?R6Y0YcWxv/9Ik/uj2j/LTHYPpCCKiU5WXnvZlKyBL5FJukPUX/YpM/DGzBzy?=
 =?us-ascii?Q?jfy/qweKeCznNRAT/lKqLfP2lpXn4dOiQFqM+uS+I78c5jLVUPJc5Ay/nZGL?=
 =?us-ascii?Q?SQmKGPW7ELotmWuD5aO8x2pNdYcQOz4tbvo3Yc6ToGmUK2EYhdTBDhEo5wWW?=
 =?us-ascii?Q?x2/YR7L06C5+BxtUYhSTvpLesV1rslePe4dU1y6/whK9PZbvG6ifp/c4GYTS?=
 =?us-ascii?Q?qvJqws6ZZNHWWXoGNBsxOB08lJVXMy0w0a0bJ7S9UsCJeZhzZLcKaLzTzG9t?=
 =?us-ascii?Q?Sq4gI9kYZieZAD3se4X+OmbDnXJcB6e9c2fSHE/7fGNiTlXimkS+WMAeb2wW?=
 =?us-ascii?Q?8CFBEjh4TImIIlOkoA7GuKDgnfO9PFe8ywNtD3CHNeEXFmagpNg/zjcF+I/2?=
 =?us-ascii?Q?+WxjAKAdK/XYKWsO6cc86rZPUtR11BS4bliKRRZTTYoo3opGZy0XN88WFPpt?=
 =?us-ascii?Q?xYyhOEPHqTHLZrieD/jsNQyJV+k1JLSdvfxwdiielVLP2BVVLNP6fpHjPHsy?=
 =?us-ascii?Q?Pry6MS3/WKqckTsYH7iL7eBuDYkcUtdQ1w3m+9YgoGEqeYzsHTj8q78WrPDs?=
 =?us-ascii?Q?DAL3QZzP5gIXscuRbKpgo6rxuPXI45OwQtT8RAgDlJuw+7IgZpqj5r6kb2MV?=
 =?us-ascii?Q?tvFcFJJfjHn6WivWDIPJK6ATSgHT24vUkC9JpTIGil858jG2rqKyuP8r2gis?=
 =?us-ascii?Q?Zy/Rj0u4+vpQvQz4280psVtnk86SBlcemu70dF7UQp+jBiwNpj9lC0HUcoPZ?=
 =?us-ascii?Q?1wfEIzy6o8mcAQCZAsGOjDqUyXVAzMWC/2AwuRr1j9ip7DAXImTSNCgUFAXd?=
 =?us-ascii?Q?RrgEHI3h+sQQS/3/OuCh4RHa22EtERwn4GdR9xDWefcdoEnbkiA3bSssArme?=
 =?us-ascii?Q?VRgkzGFLKZjcietuxd6fEBCt82JVHUMt9sb/szmofELCPTZG0T+ilVJFx20h?=
 =?us-ascii?Q?8RVJPyK9U25sQZqn8BD2DsOL5NJF25Mwl4ZjRj0y9Hju9qV7SKYltGB7c59F?=
 =?us-ascii?Q?2C50FMEiqOYbFdEt9TrLER06YC3s5xXWOhA1sfHMTRJjJkYWYrwiVHqULEWl?=
 =?us-ascii?Q?KUs3QU7jl/otaytZ/74tnXE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd2ce82-1381-4d04-165f-08d9e7c1d5a9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 09:36:35.0062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ja57xB20CueYwMoSlY6eIg40DMPogH/n7uQ41txmp87z9qFYQnAMEvZmZS++ah9aYfKsTkSlFTn2XsuX/aLPtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6086

On 04.02.2022 10:28, Roger Pau Monn=C3=A9 wrote:
> On Wed, Feb 02, 2022 at 04:29:37PM +0100, Jan Beulich wrote:
>> On 02.02.2022 16:14, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, Jan 04, 2022 at 10:41:53AM +0100, Jan Beulich wrote:
>>>> Do away with the "pod_target_out_unlock" label. In particular by foldi=
ng
>>>> if()-s, the logic can be expressed with less code (and no goto-s) this
>>>> way.
>>>>
>>>> Limit scope of "p2m", constifying it at the same time.
>>>
>>> Is this stale? I cannot find any reference to a p2m variable in the
>>> chunks below.
>>
>> Indeed it is, leftover from rebasing over the introduction of
>> p2m_pod_get_mem_target() in what is now patch 1. Dropped.
>=20
> I'm happy with this change with the commit adjusted:
>=20
> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

> Not sure if you can commit this now regardless of patch 1?

I think it can be moved ahead; there looks to be only a minor contextual
dependency.

Jan


