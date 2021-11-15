Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D942A450358
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 12:23:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225797.390013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mma4q-0002rT-AE; Mon, 15 Nov 2021 11:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225797.390013; Mon, 15 Nov 2021 11:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mma4q-0002oi-7E; Mon, 15 Nov 2021 11:23:08 +0000
Received: by outflank-mailman (input) for mailman id 225797;
 Mon, 15 Nov 2021 11:23:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mma4o-0002bn-Vm
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 11:23:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67567d2c-4606-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 12:23:06 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-V_aq52ORNyqg8Blj0HLlZw-1; Mon, 15 Nov 2021 12:23:04 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM8PR04MB7346.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 11:23:03 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670%7]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 11:23:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR08CA0014.eurprd08.prod.outlook.com (2603:10a6:20b:b2::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.16 via Frontend Transport; Mon, 15 Nov 2021 11:23:03 +0000
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
X-Inumbo-ID: 67567d2c-4606-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636975385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=edC8ui9lrYWEPY2rw2pxACeawrElBXnf0gaGc8QcZ3A=;
	b=Vu/DjtaimwceZ/A7vuRn5RLWxHcqSkgDE41MCZDPQJBCveQPs7MOuKeJncLuIijlD2SCct
	RUmBnw5yzobhDiwk9cGm5aVnK8hjVMXakYkh2GV/LtcpiXxok305fLnOZqtq8WZrXpra3i
	TCfpMkPoCNEhuUummFm6/56/LqiSwKs=
X-MC-Unique: V_aq52ORNyqg8Blj0HLlZw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DcnxFBMEj1iAESsw7IwqgUeVqiSmh8APDvAuvCQsConYNE07Qu/kWp2Uy/Jw7PQeAb39SZbxB/3mvPtRZCPTyjTKFV7Np2mf2mrS9NdF2aC3f/lAqvMJeob3nCxUWO96hdkKGXKuIlJ+WanAkQlLzlGIeLm4E6Hdem8SfW9NlST6q7MrpqxcMIE+B/LoYL7xyQ0oGnsmiqZ7tgdpaoBr0UiQXKckL3BdIQWfbc7RYys9GiiEGH2EJqGqT0qYQU6VGdLMLK2h9ovny36Z3ZdC7jrF9l6Py3Ztzm31C7EWbOOB+WliaD1gQpJP4gxiG9/ANb8ZEgxH1rP5dcgj4HvjcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kk2fNYQ9zKHxy3KExTDoF9x8vrUJlbt+lcTc1fthxKo=;
 b=cGcpCkbGl/c+m9uHy7S3BS7bfK3ArZnUWqhAzdILd2KfKYAGFk97KOMBiVn1E7J5xLlTVPVQgBPlEucv0iIKFFjD7PR2rNduA3OBITK2y/7HmLbKduBgOxP62sCmLH4heyuILuUzrhkI+q1KxGafQODsucBKaO5XwfupQzw6KhAtrtBOMjIY6+eTQ53bKiGd4N1v3MmUxdrZ9EpMWrJDCHPjX3sMqf/c97TdiF9ZlhqvpE6I21iQsRZYNtgtkpPWE22pluCUEbPmV6J1pkmwd/f3lehtNXTVwAsXtAvT42kznK1s53gNZG27JVLbk/Mhj1yxYrmZyicA2ypzhJ9u2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <acf6989e-ad10-be32-1429-b643552675cc@suse.com>
Date: Mon, 15 Nov 2021 12:23:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/3] x86/cpufreq: Rework APERF/MPERF handling
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211112182818.30223-1-andrew.cooper3@citrix.com>
 <20211112182818.30223-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211112182818.30223-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR08CA0014.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::26) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0040b2f9-7af6-4cc8-bcf8-08d9a82a49ec
X-MS-TrafficTypeDiagnostic: AM8PR04MB7346:
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB73468A7F67844C8E2C94AD6FB3989@AM8PR04MB7346.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wA1hDXMFJAdHMN8SPHAGPXC3v8q8+OAETaoM2tdo6QxVrCQKArLi9243VCeYwScDtjZo3Ri3KXPxvziJO9Hta2MBioYiI6K+RijIJuEC1vCuoAZwYB2gk1YEk2c3201KugmoVx77Nv5r8hfrPg3BDcbZNkH9gnc55BzNuUeSpsrNSsHbP1bxFeKFLSHkXi+Otk7VlVvsHwKtNN2T9XPdnL42PpP4TMOjl1ux1j6e5pV5t0cY++NVN37vkWsUQ+e/XYyqsmYIHNfJs2b68Y1YrslR5qwEYSpter6sc+zMREDxCzvL0GUQg1HRXAEPYz9Lq98IvlMjGorvIYyEnCxZcINEYB8IjzfHXrhYZgy+rS8rnbM7VxfJ11tYO/22NMyGN1Og81W5jeFUAKmQccHTYFuWB8sLjY+wI2gQT2V/U+VSk/Hk6GDQ+XDH3SpJJ/4kqZJP/4KInSuoVISpgTYv3o0tZNDrImCZIk2XRCuqqadxMuAamlsvOz7GFKAbL5pkYUiXHUMUX0QrxWTyIwx2e1mI4Nj6SuLalzQvpko8U1sEKfNR97LEbqhoYLGrpCtXD15jlmdvR5yasnSQJ4v0P+K9Y6/Q4gHAaf5eLjbcvpDoBrj+zi5nb364WwZAw+4tLHJ70jyAFZ4p8fgiKerI5zgiiIcWDIZq/iXVK0BjPcQ+IGX7qIu7fGNAdT76y0Hp2V+UZxtAdrSpJB0DKuejNV+5wuNVQYLg1OrIJqi5D05Nr8uj6caTbL1nWh9wuXvK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(508600001)(83380400001)(4326008)(8936002)(38100700002)(8676002)(86362001)(2616005)(956004)(6486002)(5660300002)(53546011)(26005)(186003)(2906002)(31686004)(4744005)(66556008)(54906003)(16576012)(316002)(66476007)(36756003)(6916009)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FLGRsGgeqkmVZlru1bgM6W8jwkn/DDN5y5SO9X7Zl3fmnBTNUK5ecW+3s+YZ?=
 =?us-ascii?Q?xqmN6ZI8QkMakSU6kmsfGsznbVYHxDmtSsnQgdm6b8DLAsz43+mEakVPfiRW?=
 =?us-ascii?Q?JnvGf4ijmrHwKbX6RQWynxK1xypdqraiSxHyzDOBZnRZ5zWznsf2suefVW1u?=
 =?us-ascii?Q?gOJD3pPYb+B5bh/tB6nmy03c91X6d+ISKahfJFk+qaa61Ov2JgP5zR3F5uQJ?=
 =?us-ascii?Q?nUITcHHerjlXja77SU1n9ZdJ1OHvzM5fEG70ECNm1Z4VqhRWqGoG8MylVQ79?=
 =?us-ascii?Q?ItBgTXdDMJ3idcA4EO1f8EBGVSGYfYFeFtniZeCKDZ40etU9SzsA/1H6rZlG?=
 =?us-ascii?Q?itOmX4ByYLZ+jS5xsFtNcls9Ni8rfneuqq+NnQTlcBMrym6HBuvwR+Jg17mQ?=
 =?us-ascii?Q?fKaL6zoUrxQWVDJRYd3OZWseFX/7sdQJ11saJ6pXWSXHU+PEAuIJbREIagDM?=
 =?us-ascii?Q?NxgV6eACr9a36Qr7YmdAXKXyHTbu++Yno/sEn/3XCvj0b6PWGx0ntceD+/tx?=
 =?us-ascii?Q?m89kfI1A+kCXMRaeAn7aK7o5aDOWUZ+BTuQwO1zJVRqwBkHNzOExJAeIf7bE?=
 =?us-ascii?Q?fNBYOG3MD6CGZAyj7MvdBz9qsH+b6+yv8rd546J/rU2+aIdF0RKKiNc7vlmk?=
 =?us-ascii?Q?E5MudettXv5T+m3T48DTgAZfGEKrXaB92PbUyNh04Zm4TOcJMpnnRv9u5tMv?=
 =?us-ascii?Q?MQbUPzAb24A0gysUQZ2zM6VgkFdeqH44kb4QYUv0SnzyZXMmcANU+4cv2Ta4?=
 =?us-ascii?Q?3W+7Lw9FwMlAE3TdGStBXXcGyf8gGXqzBZ7OH3LyfLR1qcT1M6VZzm3AFadk?=
 =?us-ascii?Q?dZgv5efJ6RrN6xYNUdp8CKTgYAJPv+2sXhl8q8nnTlt2BhqnSDUHGRehPph7?=
 =?us-ascii?Q?Dpd9lxWJQBqPic4TF/aO38iid1SpBktvTzTRIFfxIKQ/Rserov2GOluBElD2?=
 =?us-ascii?Q?0seTKaYdw92SpsTltMxcO//EmJP+sx3aJ4DY8YWOxGTqNX63mpxayDvlG1Db?=
 =?us-ascii?Q?PnlPtx9MisxzuKfjjwvmaeV0Qpmn5aIoP8Dgc/Zy8NH0yy8wzTVnod2Iwv6W?=
 =?us-ascii?Q?C9yiBw8/lp8fbQ+/r2zryDppbpJr8sDAMb2nDZR05knpo/9Is9dsPR9ZgoZE?=
 =?us-ascii?Q?Wl7yRJLpAmK4u5vTElTRYWM9n5MedZc9PzZsul/8KukGnw954+cCW6MfmgKD?=
 =?us-ascii?Q?YjRyZSS2CQIeWVTxk7LS7T0kB+a9jjV2SIrZvEHi/fxyeyY/Kual8mO9giK4?=
 =?us-ascii?Q?oWvEuSzuP8pUFUZE2Vc3WeY/xjnVpnNeIsIuyDl6GhTQsql07njt/XhXYOU6?=
 =?us-ascii?Q?ciwP94kt3+BYuViA1BFpbN3dbBUH10HCdFXkJeuRrNeVzKBjBz9KLoW38whs?=
 =?us-ascii?Q?oKwSmXDjKBfrUPWoJBi34xZcXLnJFg9pi/kJfEwmBpm3AE38LWQb1oON8T/f?=
 =?us-ascii?Q?UAS31SbeO3dmbwYTUPB+xCMQ9cIFT7D2VNo6dO8BkF/1OlpW51czuaKQ3iQN?=
 =?us-ascii?Q?4yXiOIS1rCkz1PbthtV6yQ0GRennDWvPoKwRX3SXNfjK2JMg++69spBrwlPu?=
 =?us-ascii?Q?xjsbP1Z8KbT/6t+pN3oD4wFC5XAt4Dq4Bs0F/KtcL6LifwIm7oMJbhXlYGP5?=
 =?us-ascii?Q?nXoiRIHA1hw+ZxP/iAHfns4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0040b2f9-7af6-4cc8-bcf8-08d9a82a49ec
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 11:23:03.2949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQsGoQ7iLZ+F/b+SoXLtNhNVAV5KLYm49eO5SI1oj5f7EbbPmj9uLVRx082CPYSEKAzSpJ4heUpmaaxcZrZ2Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7346

On 12.11.2021 19:28, Andrew Cooper wrote:
> Currently, each feature_detect() (called on CPU add) hook for both cpufre=
q
> drivers duplicates cpu_has_aperfmperf in a per-cpu datastructure, and edi=
ts
> cpufreq_driver.getavg to point at get_measured_perf().
>=20
> As all parts of this are vendor-neutral, drop the function pointer and
> duplicated boolean, and call get_measured_perf() directly.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
>=20
> Slightly RFC.  This does introduce an arch-specific call into a nominally
> arch-neutral driver, but struct cpufreq_policy already had x86-specifics =
in it
> so this is apparently ok.

That's fine for the time being; disentangling for another arch to use the
driver would be quite a bit of work anyway.

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


