Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7995442A7E
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 10:37:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219862.380900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhqE1-0001VT-9q; Tue, 02 Nov 2021 09:37:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219862.380900; Tue, 02 Nov 2021 09:37:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhqE1-0001Tf-5X; Tue, 02 Nov 2021 09:37:01 +0000
Received: by outflank-mailman (input) for mailman id 219862;
 Tue, 02 Nov 2021 09:36:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mhqDz-0001TZ-Gy
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 09:36:59 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c388371-3bc0-11ec-8553-12813bfff9fa;
 Tue, 02 Nov 2021 09:36:58 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-RgN4tQsWPVy_sozovAXDoA-1; Tue, 02 Nov 2021 10:36:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 09:36:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 09:36:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR04CA0024.eurprd04.prod.outlook.com (2603:10a6:20b:92::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15 via Frontend Transport; Tue, 2 Nov 2021 09:36:54 +0000
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
X-Inumbo-ID: 6c388371-3bc0-11ec-8553-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635845817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Veq/klv1OKxZwAll8ea7RB4s9mjKdyAfOEJIOZCUfJQ=;
	b=dj6VmpyanJRP+mcFYSEsBrIpO2fujXDEzfKYhzIJfPZJ+qqRPpTcEPRKgn4qg2YWgggd5v
	vB2jASlRaTUeRGsXZLHq/MJlJAXV9ovxS4rCC9Kx9zS5I8TkxIbw4K2FbL57KTtx8jmA/X
	B7W+ddbQBhf6DBwa8feqLwAIzTOhjRY=
X-MC-Unique: RgN4tQsWPVy_sozovAXDoA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkt3gtBxlIqVbdkFmhwXIhHCoIRJOZ/AGKC2VKqlNCIFp5ZHXOLByV6+GoNY05fMH3pJRvVlfd3oCh7rrgtztPWqKdn4Zpn1fu+n4P2Qyk0zOTFQkUeUfTRk08FxsC/YwDnXUyao9onyenD8lpG3MtJUJJnqCbWwmMMX9CW+t8EPrAJsfsVtk2ZpzY7w0gGaYyHMDkVgcJIfbdnmZJOVtFS+xVd8+Q3XWihKHTs9RpWw61/j8cjMaUP3v7/w5BTzvc9nO3jBkYhIb6wjQ+dwicaenOK1lVY5cbpckSRzYgYca/U0hUEzU2nIftBVTUQa0yulNXR/OOhQTocb3p6JLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZwDP+sqMC4OSfGZ7z7vCRpYhRjUgL0XCUBkN5XtIqA=;
 b=WvJ+M3RdY282dHoWzAoMyowQVzhx2mlrNgxi9A/FkGJG9yPd9rmIJnGVA8X9rT7x7QunL/NxvaO2mxvecBO1bXgs0zXiqifKR0/KmhFXSITBTCAwsjM6fWmB4H3T8KzjtClYJGPNaYzN8vSXkvJEJt2GQWlyWDosykYo9bKHcbvDqGGOJ3d0pVjNdGzzMxtcfe82zbWOSLbCRt1kbKHPjhxZfbU7TTtth9Hyfy8ELyE/zdJ38PD8WGr+N1TlzJiCk0TTdT7q/12aujsOghgz4WnSuEazVTXhHxjnnOXzzuP8d2aITsWdMySuRvbpotD3RSaBGBTwtqWR8JQOaKslEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <18d14f59-7860-946b-b6b8-18e5ed254ca0@suse.com>
Date: Tue, 2 Nov 2021 10:36:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v4 6/6] x86/P2M: relax permissions of PVH Dom0's MMIO
 entries
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <cbdc93a6-e675-420c-f7e8-53aa407766ba@suse.com>
 <4b8c48ba-a563-d036-d4bf-f4f8bdf0efb1@suse.com>
 <YXK7ySGvgTvN8GPR@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YXK7ySGvgTvN8GPR@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR04CA0024.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e626d6c-f165-4105-89b8-08d99de44ecb
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB73601198F3D86528D95B40B1B38B9@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u7gsNdbWfMQ7EtvZ5Ys2em6wQEgDsXm+Sp7oUf2NIRZY7iQkfRY9KLlB9qd/dpknXiaXjDHRNQEJ/32alv/piUPYW3Tcw0DBhqUvJMTEkl0qHmbClJjVoDfUYMVlw32HZOmSLPGhsE7QRXkQgWzoXUKronzRySh/hfsGj+2p8sUdMbLI5Q1VGQ24CMyI+TPCW8tOtceGe+YE0dqleqlwTDgwnRhAPVB8KRSXL1CZj9TzZhOGsMc9HpFboh9EJ5a6nmnhtib5yaDmBjX5GOWRQw6UYKTJYmX5jIdq/DyANrbz5UOgilxCQI7aJBC6F1EuFbIlSRE75grbAhQN8Gd1//iCsQYSMJQN1icZu6pSJOpo7IkUDc6zMBn+Vbl+zVdqijPEQbiOnL82uWXFW5C+yYqhWzLItPOxkZlS9gVl0Vg8wS8XvgGbM8LhySYBRZS2ZYU+fvBN5waCTHEidWpL+5flphnT4dyTIGLSDq7237GyYL/W/8j27nPQ0FM5uCLDb/KM/Qjmt8Fn/DnCJeJ4fqP1q1wdHxFUF8nb69lbTg32wEKvX/JVO0hTBocr5c7vswz5Qv6CsDQr5J7ITo61dCW/K2vUyY2BJNG2EbrqUer99XNReSKeySIYnIMs0ilaIgUYLA9oHr8R1P3jWfX31K+Mm4+2oM3xnUVBvdr646J+AkiytScyTjppgf4kRb6i1K6La+DXVVn2jkHswxevtbIsLBsMpyYPO/thuH/q+XhE4i9uN81iyQAzwvpgPGvu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(186003)(26005)(66476007)(956004)(8936002)(2616005)(8676002)(66946007)(66556008)(38100700002)(316002)(16576012)(6486002)(36756003)(53546011)(5660300002)(31696002)(54906003)(83380400001)(86362001)(31686004)(6916009)(2906002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sPnNuymEKSIHw+CbTSRRHBiBhHa0gzEYIUPx1RntsVTX1spoxtRjOmtARLUO?=
 =?us-ascii?Q?6mPQLhd84dBaC3xrR6BWkgogNgqg/6MrREcQqEoqX7VXnsK9warpunyzeiLV?=
 =?us-ascii?Q?Q++8jARW3yEBiwPSNY1V83FJGbUpSGtkYyo32KjKnYsYBsQZ/2n3O/NvUDa1?=
 =?us-ascii?Q?kfP7fhN5xGZl3StQOOElnymGJks5dmgohmZnpKP2Snyhb521dFejlxvSFNK5?=
 =?us-ascii?Q?deqn3GKw48BHK3FwjSY+fJuSSKuFIf+fdMnabVmFjmmMOBvUtBYDyjzJYIeJ?=
 =?us-ascii?Q?U6MSvOMb3QistDNcK2q8/9MmgsI7PRqz+M21G5iXDxU3p/NDt9fuGkVbqxoX?=
 =?us-ascii?Q?RPzsBwgwTxvkFnQnd6sBfmSvXL+XR8MVKJig/nqGJmrvM9t1C/fE5qIa3BBa?=
 =?us-ascii?Q?QHrfuYZtlBiYtyw1IaSKIYSoe2frc6nzkV+ekFgt3RVlXHAY4RBzGEqFyqQA?=
 =?us-ascii?Q?zmj7jtqrL9LL2KM62MbRNPFfwl7dp+21+K/n0VZ4jxL2hhmh8Q/+ycyT2QnJ?=
 =?us-ascii?Q?12Am51P9oTepQS+CHNXVWFuGz05+XJ7ui3xjbuBPtjOQz3GLnPWISnFe55Zc?=
 =?us-ascii?Q?8s9O4IfTFiZ20O0ryixzr2T2EJyYeTGhbkqaPq9hcQXAYf4vhclcgMdlFxC2?=
 =?us-ascii?Q?Bs8le9iqJ10H5QZSuKhQ6dgCkOeRiklsmo4WccVDhRIpvxDpFF/1N4Ew3Czd?=
 =?us-ascii?Q?8Uo+QlNNx///Uz+KjrkFKCfkjnLRmysg/pX3Qr1jY/NNC9X6Y1txzunJj3rY?=
 =?us-ascii?Q?VsSYugILVSEOlB0Bc9BjsdA1CBTmrj2802sZ/wU1sg2IWoTtO/RBltfU7nOd?=
 =?us-ascii?Q?WBEgu18oIrQrwwi9/VyAI7vlQ5dNqmVg8uS/sDu+yNbKscL1qGU0Q25qtGix?=
 =?us-ascii?Q?ZA4/RkQ2YO1tFNVKC4/dZ3DDI9YwlqSgzOjCCPydD6zZ166xOsifyj9qRW11?=
 =?us-ascii?Q?4JinmZQKfn30yGp+S4JSta+0wT94xWVFWBGj+TZzPCZ+LkL+uIGxWscIkwHI?=
 =?us-ascii?Q?rWn8FUtwWgRYZ0DwOrUjrN4OvGRk1wiBNKPCS8AcEKxk5b49Bb8Jq+Hi4VM0?=
 =?us-ascii?Q?VH8/NkgPFuzND3NRzNyrPZJ7T6GZKkVvlOEP+rCTMo84uYL/RQlLxEQWMx8k?=
 =?us-ascii?Q?+bI0XTpIWq4/6wiB51/9VbCJVSU73wp4xB5K14fIu91TIJ7FrFug1x0Pld9T?=
 =?us-ascii?Q?cwoBj3HMl+yEQvnHEXMrESjWVUOC73NJj0J/lZ1Wqt4sieT4vD2qSeAJCOB0?=
 =?us-ascii?Q?N6OMhTcqqLGfq+PeaZg5WFSlfQj1xFAqrktOCxHtAgw4kae2nNyZZMYa2rMr?=
 =?us-ascii?Q?ykVrxOpwg492ZNapSQ7cStX+fk9VidlM1Z1xwu8ESKsNzKXMPqxVJOgQCFdY?=
 =?us-ascii?Q?r9TImRke51aBF23Aib86ReOuSV2Dss9SsVnNJeZptepm7aAqFhlUepa+V+Ng?=
 =?us-ascii?Q?1ev5qGCI196TYWiTvofr0YJyM0ykrRJb0WuF22CNk8SvtCoXpRbMtYjwOn2R?=
 =?us-ascii?Q?wnSxJq5TDjo8ONgcZvaYwdPCqUMtX/i5gt+8HbV2SNP5fMQ9z2WxjnzFjVEB?=
 =?us-ascii?Q?+RUWZ0cO6OKoURStkKJ93Vc+zQ7qeQqTmKHBW0TLcRDdH1HWaUubyd3NWFjD?=
 =?us-ascii?Q?ONqZij/mZwgemRXLX5v6DSo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e626d6c-f165-4105-89b8-08d99de44ecb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 09:36:55.1431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNOOLe53Xobdm0mehYtabeuwrC7F8xYvG0dIuQe8LcByvOVecINa+iFSBNOK3gFIOB6fKCxzETngkVNEs73NkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

On 22.10.2021 15:25, Roger Pau Monn=C3=A9 wrote:
> On Wed, Sep 29, 2021 at 03:15:48PM +0200, Jan Beulich wrote:
>> To become independent of the sequence of mapping operations, permit
>> "access" to accumulate for Dom0, noting that there's not going to be an
>> introspection agent for it which this might interfere with. While e.g.
>> ideally only ROM regions would get mapped with X set, getting there is
>> quite a bit of work. Plus the use of p2m_access_* here is abusive in the
>> first place.
>=20
> While doing this might be fine on Intel hardware, AMD hardware can
> specify strict mapping access requirements from the IVMD flags, and
> hence we should enforce those.
>=20
> I think a better solution would be to not return error if the only
> divergence between the current mapping and the requested one is the
> access flag. We could log a message in that case about being unable to
> change the access for the gfn.
>=20
> This relies on the RMRR/IVMD regions being setup before any other MMIO
> region, or else Xen would have to clear existing entries on that case.

I guess I'll rather withdraw this change, until such point where we
actually run into an issue here. It was meant as a proactive
measure only anyway ...

Jan


