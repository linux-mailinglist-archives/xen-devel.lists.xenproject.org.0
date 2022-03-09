Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BF24D2F95
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 14:00:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287829.488059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRvun-0000LG-7p; Wed, 09 Mar 2022 12:59:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287829.488059; Wed, 09 Mar 2022 12:59:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRvun-0000Io-4j; Wed, 09 Mar 2022 12:59:41 +0000
Received: by outflank-mailman (input) for mailman id 287829;
 Wed, 09 Mar 2022 12:59:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRvul-0000Ih-1T
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 12:59:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c66f7b2a-9fa8-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 13:59:37 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2055.outbound.protection.outlook.com [104.47.9.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-lHRD8MfFP66uD_nL3zMIpg-1; Wed, 09 Mar 2022 13:59:36 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8720.eurprd04.prod.outlook.com (2603:10a6:102:21f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 12:59:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 12:59:34 +0000
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
X-Inumbo-ID: c66f7b2a-9fa8-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646830777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sRHmyOeXY3QNuRZ1mSvfumwXSHmstvxjzZU7oIlaH7c=;
	b=DU9kzFEXrI2opYeaiQPnI0D0RoE5ln4EYTr7MhQaaiDw5TxS0OjnhMpNCljdSO16JxqMei
	S5lwn77/D/f7w5n5iaiH3y6ILOCa8+Xw2CW/ImMKxF/WcdQ9k7YhRO9WUlDEpQ9N5zS0wZ
	oLWQU5hBb9ntADn8wrMQ8xjwddB//yo=
X-MC-Unique: lHRD8MfFP66uD_nL3zMIpg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vl9/pH1U0DZv5SI9HUdaFY/QVMMba+j4V/48piyHIy8inPInhJ0gOBsoOGfUqP8TnQpdoG+lzVIHoxNKlEFuU5xWO8v01BLdXaiVwesnGIFpfKn/S8PBOzyumaDRU4kJQ9KpT7ePMP5sAe12Nwp4KDcHgAPa/TnjtCrK1Kd4Xhglk2x/jVlWIQi4Miw8oEpq0wgkxCylqVqhPlfKKkk2gYlhm+l/C1k/DNi4pQwCfE0C7LXG+djglM5mz+yGsGGDK+2NamT5UmurEanNO99l+jr3e9oZepgLmuIZHCzgAoOKzUPgaLhwn0hE+eiTWTwS8fqR75anRuil+4hy03/c/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fHboFt1H1F2EmKeBCsatrn7S9iPmBTgvX5W9kJE2WM=;
 b=UUg7qbR7E579TjOYx7xX5319oaF0keX7/hk03TXCvbMXQkYGfyb0kZj/s/70fS4n0N2n5W7L1Qc6c+vDAiWel9SHNE41X3cJTQdS8tuQ94cq7Ia4RvpE1SNmGUCUKjNN1o/YoyB6IxPqAK2QPT0YDSpH1lRL0xJ4b6OX08t37R9vDZ3L/FrsbDtFCMPM7nPMUDW/YilDQywyaWjtEF4+DIV8cu/jKpzj/VXriQ28JySjo5t4V/swZuqVPWc8NU3qC/j8Bb24c8E9TnJfPZRbkb/0sGdKexmowgJxzgZS6pcQG/Ttk05zCpBq7wWotebJV1aCemZ7lIoKxX/hGdnK4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <39454ee5-4d29-995c-859a-f058d3383295@suse.com>
Date: Wed, 9 Mar 2022 13:59:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 2/2] livepatch: set -f{function,data}-sections compiler
 option
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20220309122846.89696-1-roger.pau@citrix.com>
 <20220309122846.89696-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220309122846.89696-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0068.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02183ce0-7753-4ccc-08a2-08da01cca8c5
X-MS-TrafficTypeDiagnostic: PAXPR04MB8720:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB87205A4A5CB7C74FB5F90D8EB30A9@PAXPR04MB8720.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rmt4RP0xDC2M9DQCR3luyO4yx2wdrlleiNdTHtoD4Hd5QUrNvj3Cz5TmDLFtZb77hKs5itnGxEWltMA6YX5/hBAbvy2NV6KyBCIXG5okgtgyyhzb4Aj6NaKGpFAVz9WsLwYB2MyZX9Wady/7oh98NWPibrS39Y0/A++/IAqay0nmwyMH48k2HXERc/XYgtgrfSH+1fGQUjFpdkD5CWCtOMH26BNp2vg7mPD2WGvZesqwVV88PHfYfDp9TvQ0xY1sdYszeNuiKgTvk+A98kkGUD68dePDDkNyZEBezNeqyIHwUMuADZoCRbq2HXTtvV+i5fmemFiKckyAkNCMvOu3mUYgJVNvea0SBmIcGwyxrC669jPuRYwVlaUFHdRs/1Uif6b832yXNU5QRMeNUqxowmbz5YAp1GIBSzkFuxH/u3V/CKXuWufopDHf9CQgktxs6n6Y5SlUCtT/3Q3tbgJzt+AAy5qtowOWIBAnTc+q+Y/IENHIRXlAx3u1AoHUA2Ip4/njrdI9anyq3qtuNNVD9IIo6UDY81aap6ty1E+4p+nQn+8MYOqnQFRnItVQr63kKoZji9OA73ETVwmpbhDaEydxABf4eWOZTlBVaI8Vx6QP0fwPn/51fD8E/sGzbU0YQCUfHH8W0SXbIykFCjFr9qldUq7ZjSnKv4eF7AyNGD4EBeq81LXPwNWh0A9b99JyTANJNDqsHY/WXab2J4MGTIKpL8utN/Mzcvguuglc+zU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(2616005)(31696002)(86362001)(316002)(6916009)(54906003)(2906002)(38100700002)(508600001)(8936002)(4326008)(7416002)(31686004)(5660300002)(8676002)(66556008)(66476007)(66946007)(6666004)(6506007)(6512007)(83380400001)(36756003)(53546011)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8cl1ATJA41wreBNSfnOoHUekajKCDzfkrhfxMvCJIPsNfYR4MSfG6EMwCiDj?=
 =?us-ascii?Q?431h6ua1JXIqXWuzha/W1RvWAlsswQX8C+ColYms3YlCKsQl9B3BFtggtXKi?=
 =?us-ascii?Q?NDjBYlXizUw+pITAIXobMuWJNRkFiILRo8JHhKSwUx16h+FNxvZe+7P7P6PV?=
 =?us-ascii?Q?ZpqRxW34gRbi/TZe8QxiAhClvc6HcoCOKVgUTuXw/AJqs/zlin0xYlOH/UaG?=
 =?us-ascii?Q?bhNm4Oq98ALkIHyZeG5mNm8Hc6O5XbgxwPlDDkwKeqM4ZoJyvYtR4xaGamxk?=
 =?us-ascii?Q?Xea88PqZyKOW+HMxtuDNV9boeA6DZH7hzDf92pSq/dZQGCCW2nmXbFx3H0wZ?=
 =?us-ascii?Q?eLnVBy8hbFnLB2E95XqNfzljg7h9HvyJ5ZfEaNptUgB/eQVZW+GXvSORchD0?=
 =?us-ascii?Q?OnJ0TeQtqXAQxSlXCCVRpjjDn/kBsScEmwH38iHrBbK093wcxTIyIGJZ0xst?=
 =?us-ascii?Q?Kw7+43t88w9Ztp5xrq6VhYF+Ia+YBhqZrO55iPXhJp1q9COsxeuajXE9dGzq?=
 =?us-ascii?Q?NonkgJcXJaoeRr1qcgeL5CzzKN2rar/206b20is5rfifq4Ans7rAvN0uisEV?=
 =?us-ascii?Q?XabNrtIrXt6r61L2yBcur8nLg/tjnrkwz6NCUkYQ8F2eRILsXrIAE78RSdzF?=
 =?us-ascii?Q?m/vw3mYlwS5tr4etjS5AgNJ6OeOGZSIR2YZNqgg4Hb0BQKzIyz+tjMjRrV5N?=
 =?us-ascii?Q?u3KTEpI+VKKecm2Jt/0rOmhzlJxutVyHZKuWOzHoKBjs+Jyuwetp63PikflA?=
 =?us-ascii?Q?5Wc98naJv+XDsis69yOpJ2XJ/NFQBD1tPjacYjMoUaD/xKQ09oRQTLKspqxQ?=
 =?us-ascii?Q?UFiNflLW5FgLbOgTVBPkOgVR+7Y96w79BpWsAr3GWxFZcWP7SlVeZVpISrme?=
 =?us-ascii?Q?QmRBicFcqY/sNXMmKrBbHFKh6qWvqtYwmOsWOmbGRybcZ+WiDtMsiJG2Z585?=
 =?us-ascii?Q?Z9GfLbA8yeN+x0ldqRIqvdvrR2QFj89QmPPhZb6TNjdMR0Y7NV8mFQPmb0FS?=
 =?us-ascii?Q?NLhJOpAm8Bvlw2H9iOZWhWqdP4pnBjOmq8etnFr/XF78DRhhxHQIjYunHOZC?=
 =?us-ascii?Q?pHMuZz/YvnBLRc18JXkfVxFuwwsFbB3jIwvKNTadQd05hnQzhtRNZ1OgCThm?=
 =?us-ascii?Q?YjICDthkGSjKxRxO+zyEgtNBRDUYtBBLdn5+9SWUbvM5CrQZv8tG7EwRVta2?=
 =?us-ascii?Q?/h0anjBM6r4AKP3XsBX6B85b8hwXBT16hQkBv/eV+ZXGYkpkOLM/f30d4ZZL?=
 =?us-ascii?Q?k9iwq8KUcDjTyDQ/f99Xv7M2TimA6YWu7+mkBsqXExLh0E+F64MqK/dtMTVB?=
 =?us-ascii?Q?Y+BQEM4LReZ1bTrRKsFMcHqwZwCnGjS5lG4ItWchXzWW5uTI4QIIUOuSIVeK?=
 =?us-ascii?Q?yQXFDzyFFumRbExLQ84PZOMHFMOExsyxOaI5/Wfk64DPvOL8LaVxkaEulhFd?=
 =?us-ascii?Q?VkbJWEtu0J4/NCdJNohese5u0uYjFVWey07SJiBJl8Jy8OIodbZvyyQ9LPgB?=
 =?us-ascii?Q?Eh6LV9dZdoLPkQhBO8E4cXsKs8UIjtwN8lomxHEr6QuVT+LpIOD/vLT9SwVM?=
 =?us-ascii?Q?eTaKZB9lqGRHyTBl/uZ2bHITiGaQzA1CR2Gj857ViksSKITktfmxTfDOtvdx?=
 =?us-ascii?Q?tB64KAK3f4pxKflJuWBfo7w=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02183ce0-7753-4ccc-08a2-08da01cca8c5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 12:59:34.4662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ko5bv0OPMFRLhHVc9mryOzden+vC1hJ82MIt9lvzt/P7v2L9QQRNUiwEzQkECHFScI/5d+/QpIg6xXrWD+ZTsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8720

On 09.03.2022 13:28, Roger Pau Monne wrote:
> If livepatching support is enabled build the hypervisor with
> -f{function,data}-sections compiler options, which is required by the
> livepatching tools to detect changes and create livepatches.
>=20
> This shouldn't result in any functional change on the hypervisor
> binary image, but does however require some changes in the linker
> script in order to handle that each function and data item will now be
> placed into its own section in object files. As a result add catch-all
> for .text, .data and .bss in order to merge each individual item
> section into the final image.
>=20
> The main difference will be that .text.startup will end up being part
> of .text rather than .init, and thus won't be freed. .text.exit will
> also be part of .text rather than dropped. Overall this could make the
> image bigger, and package some .text code in a sub-optimal way.
>=20
> On Arm the .data.read_mostly needs to be moved ahead of the .data
> section like it's already done on x86, so the .data.* catch-all
> doesn't also include .data.read_mostly. The alignment of
> .data.read_mostly also needs to be set to PAGE_SIZE so it doesn't end
> up being placed at the tail of a read-only page from the previous
> section. While there move the alignment of the .data section ahead of
> the section declaration, like it's done for other sections.
>=20
> The benefit of having CONFIG_LIVEPATCH enable those compiler option
> is that the livepatch build tools no longer need to fiddle with the
> build system in order to enable them. Note the current livepatch tools
> are broken after the recent build changes due to the way they
> attempt to set  -f{function,data}-sections.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Acked-by: Julien Grall <jgrall@amazon.com> # xen/arm

Reviewed-by: Jan Beulich <jbeulich@suse.com>


