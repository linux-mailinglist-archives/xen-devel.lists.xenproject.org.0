Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FAD4FB92C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 12:14:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302855.516672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndr3p-00033j-5Y; Mon, 11 Apr 2022 10:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302855.516672; Mon, 11 Apr 2022 10:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndr3p-00030t-21; Mon, 11 Apr 2022 10:14:17 +0000
Received: by outflank-mailman (input) for mailman id 302855;
 Mon, 11 Apr 2022 10:14:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ndr3n-0002jB-B6
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 10:14:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e137617-b980-11ec-8fbc-03012f2f19d4;
 Mon, 11 Apr 2022 12:14:05 +0200 (CEST)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2057.outbound.protection.outlook.com [104.47.0.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-BBAP4GEQMKiglsMqO2SObQ-1; Mon, 11 Apr 2022 12:14:12 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PAXPR04MB8751.eurprd04.prod.outlook.com (2603:10a6:102:20d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 10:14:10 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 10:14:10 +0000
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
X-Inumbo-ID: 1e137617-b980-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649672054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cgBrnlbHbE94Dz2W5x+JupnQlSRJao/RXKVbaSgnKLI=;
	b=GZ5XVGipxms8lyL20B5xgMBvqTKw8LJSdVj/qp7iftaX+UbsfKtsjqmgWipcjBBBjXKHpV
	7oAUkwk4zFPzriOTq9nLyEJB1nBX6Qh53vbk+3sRUPK03T45T6Zhsed9v9x4FxDqOHZCJq
	i2U+hmPAC/19on6xjgHlUCkrDgateGM=
X-MC-Unique: BBAP4GEQMKiglsMqO2SObQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6lA+UH47g/cJRJapzyCVfdXRtlYbHhuXe2rEULESejmkyJRu5d1QKCRFSE2UP8F+l3/O02KBJXpo5JDxp9YB+noD8zETaE/21GBCPaK8E17pHbonN+6HsPpCeUj5pGGM7P/i5o+Z8vY7kiRosLWTybJTNNUyvE0G1jbWdEY7pjS9/ok6XPelo3ersd2Bd4Exwlr7E1t1az022DoQGQGO4+OEeNHtUY28OcL6905pATHW9W8i5libqalFFiuubW9kn1uyyHQ78XVJxFelo7s4vPrpDO4Gbbzz1qRbuZaCGwepRW7RdHJJTzEpTeewMCKIfIaW8vf8DejCwObdST/XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HsbicQS0HX6tFXGhI53aC6PdMclvFfXjvfs7N5vWcQE=;
 b=hEFa+hch1aZUMqAjphqa59DTRS2Wb874FolxgEaNcMs87j9UYiuyfCGCr5IY5AJGkVXutpsOyl17DTkZiK62TyGerz5nhK47ndOh/kO6x399XypLSC01oOZc2H7YKNmkTERSV0cSHO4Wgvm03QrIXhrj3QlWcSyiLWXIDvaQ5AtPpX6rdugrI8oL2r81adwFgHDf0sGgyECQiDEv9qckxuNoua0An6wvGn/k8C2joNGymIS8Lys7SAI0gNkHqDJOf5x9JzF5SrnHPaZuETu2LfEG2vTSbYlHK2JvND4JcxOwqr3+HcjIFDdMc4swEJI8sKbcPGSYg5Ld2rhOtZxqaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c940dfcc-322d-afa6-7f30-bc0a1b981581@suse.com>
Date: Mon, 11 Apr 2022 12:14:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Ping: [PATCH v4 1/8] x86/boot: make "vga=current" work with
 graphics modes
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <3fb7f3e9-a6cf-4f8e-1141-100848b1bdd0@suse.com>
 <YkwBpKcyrnuXyNPa@Air-de-Roger>
 <65d3068b-fde5-951b-9a60-4ba1dcd89a49@suse.com>
 <01992254-1a4d-850d-78c5-7e4ee738cffe@suse.com>
 <PA4PR08MB6253CEB380333171F2829F7492EA9@PA4PR08MB6253.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PA4PR08MB6253CEB380333171F2829F7492EA9@PA4PR08MB6253.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR0301CA0012.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::25) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa7fec71-677e-45b3-bf94-08da1ba40552
X-MS-TrafficTypeDiagnostic: PAXPR04MB8751:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB8751C315B89917B5EE8AF670B3EA9@PAXPR04MB8751.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	enDBV1fsR7fKEI4E+Z+ndujMK4nNUOEA5W5kikbKEXO5BgpjWrnDv3RVLPwfRbi4c7AL4eORWB8s06iwqm1nine9cxzLp+pISvk5Qe/gsGizlsJWzo3cu/0yOTPfaJDIVlWUmvEXsXvTCCm+BKhj/yiqX8IrJMjJEm8QtgfEHuWaIMkZKCY/1VK7k6i6FgjpZGTTVre5CSdZl0CdrF8uY1liF6+pHxgk32rQf9vyWP0WKDuWjEMhbFmdKbRPX7ffDHZRC/Ic4tJNdQLyshY2H/fR4P8Zo31Q6nvMu0MVC2HRmgar6Wy0WXtt9OyjKwVQbWkCjjRGq3M4z0W64ImO/lwfZDVyZyQEHlYQrHv6SMtxEq1zrea4SzlF6fjQEa+DnhvNIPGt0lqYg5DObJg8EQYdTHy9YdoEKIJkz2e20xVhUaWy/r3oA1zTncNbTZ/dSmCxPXMelRQVObf/MukSu3FtZ3TmlD8zDYVwXlOeSeKe9dfksJgqo5MWfVAS17eA5MCHK7fFsDD52g766nI7k60fag0PV8E/soTnm32iSHBgT+HoybG1FUebyq3fqaFp1gaJiPcY4ztHaQVuifWwP0lohHNMpA/x4/bJAg0Pux7pMZbce6fUYHgzsiZLEcpoRl9mWsT49sK3AIRYbhGujT2XLDjH8gvBFvsIhi9X+8bamQoU2MfxLUkAL9EJlbDPdbNrF/FKIMqnRwTI3XZjT35dVMlcVLnPjRSA+5CkBoc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(6486002)(26005)(5660300002)(4744005)(186003)(2906002)(36756003)(31686004)(316002)(508600001)(2616005)(4326008)(66946007)(6916009)(86362001)(8676002)(31696002)(66556008)(66476007)(54906003)(53546011)(6506007)(6512007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SBfLaEklyXk/1tnGx1/mV3j/0oyh+OOQp3f5qE4HbV/cP6DzAfcQSppaguNG?=
 =?us-ascii?Q?LXjhdlgrN2ecIM3Np2BIlRzWg6cIQ6Rb7R2hjWDIt0Dn6bQpf1d0enJOMddb?=
 =?us-ascii?Q?t1Nj3pvV/JjMUrAAEiRNPAhYzFx130vrk7cTh2d1XaXKcbIuxF0J4z1/Rnkb?=
 =?us-ascii?Q?jglw7Qw/UhuzAni3W8L9fgfUZyadf+nUuHrnMeJdoOTO+BbF8k/eLL6vieX/?=
 =?us-ascii?Q?pdqk8a2Nm0pMmkZzpy2twr/m978p+rfORQi2UgpN3HXZI2lK+Gp02WhJBCEu?=
 =?us-ascii?Q?bj3cnMhXPOrpm3YMbXKdK85xK242c8VzkWuY9MZwkzjertBko5we4hDTMLYf?=
 =?us-ascii?Q?yRxzKKq/iLxMUctaE2Ulv596s7OgWs7COw+DEvXcF1uucgkmvqaA9yIK1QiC?=
 =?us-ascii?Q?eJVV1aDwM4fmNwbpBqkoDBcMmXY8a35XoQwK9Fa2adOR31cvs/ObGuWpbbro?=
 =?us-ascii?Q?rzJ615MdNB8iFyY8Z9f0DcupF9sJLf4+Mj6KJaxLQi4S8cvY1Shy7FkWy78u?=
 =?us-ascii?Q?J/Q0HsIdz4C1a96dILT29Ro0vyvvDBmZpZupixbtfn/Ds36abMaaH9QmAcy9?=
 =?us-ascii?Q?+t4nZk0VPXRF1UNLBSFlP8FuVlu66uC2BS4CbbCDyfz5GrwMqWs/uYEfGMw7?=
 =?us-ascii?Q?dR5aPtVTkvdaO55jyuvJlipG+N5G34YLyaM27fMBOdd4X3Vee4tuCFDwvSgV?=
 =?us-ascii?Q?SLryDWy5dxrf9A8AbcjBXuSoJqaEYlxYcw9FFdP/sSqryGZ/5JVOWj/d+qU2?=
 =?us-ascii?Q?DkSB1q2OVz0WKgXYhBh0b6tA/FYo+f/kHHEFE0h00ryqzZyQ7VopOzajKy93?=
 =?us-ascii?Q?w/ZamLncpIydgGszRsbuga24Lq7jIrQPq8ksekYj7+i5zf5HNffGQHr9lq7Y?=
 =?us-ascii?Q?WzuA/d4J43QzD0edvC8FRKAZH8kmF5+HskDe41eQS4T6qOJSb+XQFzt2shIC?=
 =?us-ascii?Q?iEAwvEHqZdX71hMc7fIg9OBRY5jXBnMDZ7635JyS6htUFTPdkDRaNkBXxR2p?=
 =?us-ascii?Q?vOiA5jnRbq0gbCVKBMbKYbQpbq4zMKdMN26UlfPWpCKR80kDifV/W+BIgoNs?=
 =?us-ascii?Q?R3wKPW02x6NuXLzRuUfvmEP5qUyAUaT7Gaq8o0Pwfs9yBMQ6733J5EyrJ5YE?=
 =?us-ascii?Q?DsO79ntiIE4b86YrKQB7X6+uIkRNuIG45OqxHARbJGrFy8ObyxZ3OMEeDeye?=
 =?us-ascii?Q?dLICEw+HC/Yf9regeKRRbGpDpPGilIek2tmt+NurwW4bbDu32u7iYjyAJuTD?=
 =?us-ascii?Q?pmNI88oDJzgdLQD1EgjKvTNL3YWQp69BqhVFXw7XKCQLOq8cr1IiM0dEVhdm?=
 =?us-ascii?Q?CaRBl+6CpbJ0Al6tpoYHCRP4j9qUI0YrK+Ew0+IwVfC7vDfsbUhKCdsREut0?=
 =?us-ascii?Q?sZNOnmz+NdLadDykxGKSmSbn3CRdyc+E23DdQ3j+X1/iNq+jX1v7sWFd5ch1?=
 =?us-ascii?Q?neyLI1PygSGaNRVBVIjQeMURLdI55+pe5IjxKMcAdIBHmXG69cc1fHOVikjT?=
 =?us-ascii?Q?8rymjIJ7Gueh4uAuEysYlbME1vYCp/KcilTOYcU2+AFsmwt9cf+H5TO080th?=
 =?us-ascii?Q?Zs7bJu6LlqYj4K0352DR8/2Iv5hFtKrAaVr6gK0lJiLHeHjXAbfFi9EtGQD/?=
 =?us-ascii?Q?CgjsITIZZzaQVRCyi+Je1hMP+uxIaklAzR17KePKcJvquulIDDBlTzZ9+ace?=
 =?us-ascii?Q?RbwtuWq4ZhIhClBllkVkAH9eZjBjOuvdBtliVGE5+lgFeGRJZNvVRURZK2aA?=
 =?us-ascii?Q?JeM5/c76gg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa7fec71-677e-45b3-bf94-08da1ba40552
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 10:14:10.5648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvwI/XSFyZovjk9RCSAIXKyL9luET45YSiehRT9wji1BgJTvr8MLiI+eXg5V6QabIkYtOhRETsO1Dl/EUuPuWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8751

On 11.04.2022 12:11, Henry Wang wrote:
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>>
>>> May I ask for an ack or otherwise for the changelog entry, please?
>>
>> Ping? This is the only thing missing for me to commit the remaining
>> parts of this series.
>=20
> Sorry for the late response, the previous e-mail that you directly
> "to"ed me fell through the cracks somehow.
>=20
> Acked-by: Henry Wang <Henry.Wang@arm.com>

Thanks.

> Since you also mentioned the changelog entry, I will take a note of this
> series and we can have a discussion about adding it when we do the
> next Xen release (4.17). Would that sound ok with you?

"Adding it" where? Maybe you mean to the release notes, but that's not
entirely clear.

Jan


