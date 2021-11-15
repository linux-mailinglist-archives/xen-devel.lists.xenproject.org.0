Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2177450455
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 13:22:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225876.390178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmazo-0000T2-2h; Mon, 15 Nov 2021 12:22:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225876.390178; Mon, 15 Nov 2021 12:22:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmazn-0000QI-Vi; Mon, 15 Nov 2021 12:21:59 +0000
Received: by outflank-mailman (input) for mailman id 225876;
 Mon, 15 Nov 2021 12:21:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmazm-00087p-78
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 12:21:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a03bb729-460e-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 13:21:57 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-6-mvcKrpd1MpWEBcQNmzrDCQ-1; Mon, 15 Nov 2021 13:21:56 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM4PR0401MB2369.eurprd04.prod.outlook.com (2603:10a6:200:53::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19; Mon, 15 Nov
 2021 12:21:55 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670%7]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 12:21:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR05CA0020.eurprd05.prod.outlook.com (2603:10a6:20b:311::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Mon, 15 Nov 2021 12:21:54 +0000
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
X-Inumbo-ID: a03bb729-460e-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636978917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jlV/dch0PV1U1JmSwGOFez6YVimpcgHdahUu6kUHod4=;
	b=nP+DCpg7ODYZ+GAT4FveFQDYUFVqf2DJ5T2bhNrQ5qLpm66tBzrIGGcZeGZ/T6/dLVtUFO
	z3HPRb9VgN2IO4jTHxHsr4biMNElgM3DYQzkNU5j2XLtCecZo5uSIf4/fPmM3saBeTH/RE
	2XGCPrsA6wtOqyF+BaoLBG+RfoA+9bY=
X-MC-Unique: mvcKrpd1MpWEBcQNmzrDCQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8npMUUkPnyBg9yXL7nlSY+fYn9XabJJ2r6k9/+CutA1LGNdx+MmIqhtJCDoiCBc1FjJZc4PyP/iW1SeufH2LleAKFPPygUXBC/z86OGcagtLYuvtgeCn0d0sGpX2VREiT3OXBhFh/MnhHEaAFUce8K+CTg+5Xk/bVvXUaui9hY04zQe27j3iKda9k5+VYh3XdQdUa3Cz85UdqPKEf6Y/zjzxqOmS13iySgLTODuZTX/c47kDpQ6zYeUK3gu2zkG7c73MgclJhUBqt1nnlMF1jRzbuJWaEoD1kvheWuviDTJttNgapR2zOKCdQa3yiRo8m+cD4W+43M5rQOWu8MNow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0ds/jHOmhhAX/8VReP1wD1CO+MOJ6ym+WNZDbKLFWE=;
 b=mpoXB2FF75KhJ+9vtKmq0fZDseqGFAK0asK+TQcVK95UhHKn5DbyLAKjsli8R7i1NRGrbPyNTfX+vTztXjXdj/k2yTVNG6IwjyzfLzTBGXSF/mL82+rzdVfFm0BYUm9BXpS4IhUWpL96ZHowlAY1AEbrq/C8E72z2DugU7BOYxGyPEZwxzLnEoefU/Wt7gxHQUgwwkM9/xFXyFTU27p+aYBn2MOsPYELd9QJQpPvRNIvPAzZaBh/MF5NSmKZL8/KA2Z0Upabkx8nTAyNEzpwop4te77HsqLxvBHqnHVFC3srgRZAeelwvEjUk/Cug8G2McHDSCFbd8iJRUBSvUsoVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ef51a5a6-52db-e2a3-a1c3-5026f6315d38@suse.com>
Date: Mon, 15 Nov 2021 13:21:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-4.16 3/4] test/tsx: set grant version for created
 domains
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
References: <20211115121741.3719-1-roger.pau@citrix.com>
 <20211115121741.3719-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211115121741.3719-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR05CA0020.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::25) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59538098-aae8-418b-1098-08d9a832834d
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2369:
X-Microsoft-Antispam-PRVS:
	<AM4PR0401MB23698682D4A6743880D72D51B3989@AM4PR0401MB2369.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e1bz+3lRjQGPkRRoH0VUU9G8C2NeeMoZUcWJ/xm+Vl9moNrCWagZvL7Xih9I0zx5peDn7hBiEaYfV7hrqz0OUI1/ccLaXUX6rurp+6P+Y/l/76CdJi4UyxsAnvLJdR23B+d9b5MB80BpxQ9SEEp0d6Rr/a+Tgd0W5oAhCESdFx/t/ww/XR7w07zTdPEr48HYZab/vhlQv6coXI1cUPIh1gkBK5prJvJpFfjO2klTzq2oEih69KgC7OB6SrHbqCuosN/QPpPib4hI5k/WGjIqDe5q3c2pecnTkOeC58jzjU1wfls8PhXaSDZeOUhgSF2xyrXcLU03d+DO8cCbE6orpaD6/q0GJH6gbt3uExSIyAEgBUtNCck/jXdzbRj2Pr2P3Lix+4iItzWaCChqpqpfmMHX4L82sbqn+ESlMPstuRziY5rnEgzXK/9k/eHJXywY04nDLEuZ5JKsuAO5N10UYkD4Ex5qFivmrpORk2XT4VRjIP7vUEzgO1vDlyr7BQtA6znIk8ZhdmL3oNhUbuNphPYsvH6rL5kqbJfU8OV9X4jftGWlgiVqhjkO9+xkfk9xYjt7nJy3vdF1CIUvGSRNf6vq4IJMHUFdr6YMS2FbV+XimZImsaMV1v5bDI5TklVRmDzwixrCVmSExaFrJkXwM6bzCW8zVCE08JToCsp2dsfzX68aMiceMsTQxYgPr58TDj9OhtbO1j/xb1ez8UsSQGeIJo39/Dh97KrGf0uslj5LPkgqo7LC626Atgn86VLR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(66946007)(86362001)(956004)(16576012)(31696002)(2616005)(66476007)(316002)(26005)(186003)(8936002)(6486002)(31686004)(5660300002)(6916009)(66556008)(36756003)(4326008)(53546011)(38100700002)(4744005)(508600001)(2906002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tFcVye3eEmsO5+KaMfSw8mTqSKle0yUPadSHgzG/tC3/9YlFf35Q/ZkyclLV?=
 =?us-ascii?Q?DfQ/+2n9g2jf9ze7uFUy55OBhu+F0kVeQWPJrU+jiNlF7pXiljvdpQGY5skg?=
 =?us-ascii?Q?F9qTxe8o2ejZa6TJI/DpVk3WCezWtJqgKhPEMzRTcUHJHNQk3TheBkFdL3J4?=
 =?us-ascii?Q?AStnKuf8bcz6ocsoIYuOGtSRS/BnLpL/gNEW+q5Rk1V9jM/pA/SJHEqVjZss?=
 =?us-ascii?Q?YhimuKZYWQaLOYJKp0laJrlR7BmsXxwQOjVThk/xWROJxcJzrOgpa3Jkaa0y?=
 =?us-ascii?Q?Nz89bnMpHJILnGGrVr8dJGiBgvf3+UwgeOCRkP7h/njvZDGea2Qvd9LT4yXr?=
 =?us-ascii?Q?weFl9QheNiLmRDWOeOkwR3HyI1562SxmtqCmXZEwCeeJRcRqbv+5fxgQKsDF?=
 =?us-ascii?Q?6T99XB2eTRYZ+IstpOq3XlKuHi19ba013qRvAIUBLpB5CS2ahXa3FP/b55c4?=
 =?us-ascii?Q?8bL7veNBMAZClXTXfsg/V9vLs37X2vW+FdvptHxwXpQXKBaS7NYOBaYqSbg4?=
 =?us-ascii?Q?vJraNlFUbKXKmX/LblzG65jdk0NnFHG+aHtDPQmrl8HV8NvyspJZFYAm2PZ/?=
 =?us-ascii?Q?QHO8QqwFdlDxIp17CDesIuYGoOYhuJ1kex/HlG+PaWg1NnxZnlaHp+b8zXm4?=
 =?us-ascii?Q?d6VGpZ+4rYYkAp6pVXi3/NzR8Eklw7FOkXPMQ3c6Ip2C9dzRF5SDck8VNI7c?=
 =?us-ascii?Q?Ln/gu9H/lfVwtfQeoQdT8DU+6wE8WRPD2g8bBBCYpgqRP1opyJ3YeuAHW1V7?=
 =?us-ascii?Q?T+rUrcD2YGqR5U8Rnsxo2LzYOe9KLL0oN/rVddNZfym3ceEhkwHH2dFyNdcR?=
 =?us-ascii?Q?W1yvxwG9lKFRN2GqPb2OdOIccbLuVd4KkeW5GcAMNpZX9TLJxzNnFtFVXICw?=
 =?us-ascii?Q?dRBkV42WU/QJ3OlWjecb3i2D0nC7FqePCaX5+oOGwkQC+U8pJzDxh0U4FT0A?=
 =?us-ascii?Q?s8hvWZU9z0w6y4wV0Y0/jZfYCiyLM7/BoF8kVfthoXSm4ymF6pDlmuy3wPzx?=
 =?us-ascii?Q?A4jxsHYqli3+GPafNDwdVl9VEQZNlRQ4xU6mVDyjkmzYVjiItl3KspiJiOi3?=
 =?us-ascii?Q?2dLr/QSnuWWji6kAsQh32KMa5aT8cLaGbTbpw7oygPkSOpC4YLWx+Qvkk881?=
 =?us-ascii?Q?ZpUSkzB0rgCZxjHpmNKOQ6j2VYv30cw6V+FBRr9ptjF6veGCwGwc81KsiUfx?=
 =?us-ascii?Q?/eVxGKKWBkcsjZhIJEC3tleH/IqgP9ESjn3qDBJGtqfQPQhAcPQfavovK9BS?=
 =?us-ascii?Q?t0GKhG1LLbHNtja+7bHwO3Y1XibjI/ndgx9YiZEk02P9retKBWVwFll3qrx1?=
 =?us-ascii?Q?a9m/Ts2QBbFyZ8ghl0uLQ4o27kdujrMN6kScPiTO3jvl8vNyULCpOGKww4eu?=
 =?us-ascii?Q?MkvGsOxsh5ZHLTtDHEmuV9RgieYAkH3Siv5ys261OVt1AX7bzZDkbmGenC64?=
 =?us-ascii?Q?AYjuufvW7wAW6qhTiL0CTnogB3Y5ic4HicGeB/fDEYRoEVb5+4ByqzHKM2Lv?=
 =?us-ascii?Q?1Wy3JUsNR1muJZ4AhdUD1n/QJ+02qvsKDWzyn7HqMsBFh36PV6UlWAXKCH9c?=
 =?us-ascii?Q?rVk9GOwfxh3A6GC8UR50Aj62TVFU7Dj8VFpwAJUmkWnu5E+w7hLVWb7Xt7Lk?=
 =?us-ascii?Q?nX3gXPgQ4hoWd2jaUNhMKns=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59538098-aae8-418b-1098-08d9a832834d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 12:21:55.5222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/XSwbBhdvdMnq0AR35J/xmpIl9m9+gy0nQg+s5zK3SePhoAk2zlFxC6xHrtrjHDCB9FZrxB3JoxZQP54npIjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2369

On 15.11.2021 13:17, Roger Pau Monne wrote:
> Set the grant table version for the created domains to use version 1,
> as such tests domains don't require the usage of the grant table at
> all. A TODO note is added to switch those dummy domains to not have a
> grant table at all when possible. Without setting the grant version
> the domains for the tests cannot be created.
>=20
> Fixes: 7379f9e10a ('gnttab: allow setting max version per-domain')
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


