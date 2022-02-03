Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD164A85C2
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 15:06:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264808.458059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFckt-0007YJ-Um; Thu, 03 Feb 2022 14:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264808.458059; Thu, 03 Feb 2022 14:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFckt-0007Vw-Qx; Thu, 03 Feb 2022 14:06:35 +0000
Received: by outflank-mailman (input) for mailman id 264808;
 Thu, 03 Feb 2022 14:06:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfZ=SS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFckr-0006zt-Df
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 14:06:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d82090d-84fa-11ec-8eb8-a37418f5ba1a;
 Thu, 03 Feb 2022 15:06:32 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-RtRnLS0VMYuJjgIg7PDz5g-2; Thu, 03 Feb 2022 15:06:31 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4502.eurprd04.prod.outlook.com (2603:10a6:20b:1e::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 14:06:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 14:06:27 +0000
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
X-Inumbo-ID: 7d82090d-84fa-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643897192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fTJlA7TTaL3xCbOgLXNAaiKwODuEMRIYffQ3vaXAS2I=;
	b=jrmOgpLwuOQ6cHlsjkYjJzFtOG4GbMWpd84GlAiuo4F4HFTLT+7AlON7zFxYIdQPS0YM1z
	AEeK5u346o6vIEFtujzJ91NLPCv+n0L0iF9E/vQLb7mjkQZcmJz6ixlx2uC2OBOcikiPNy
	k4UkoyK0Z5x8WPIo6TU/CUSyUg7a1Ec=
X-MC-Unique: RtRnLS0VMYuJjgIg7PDz5g-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJrEr0l8X9xx2dDAeOUhV1+Csz1kziuPiGWlz0umj8qtB7QfgcgrQiY8kbAGT2dWmhQdJXhWc2QZK0/fVNbEnk/KGGDZ3aSRSMHO+YFVQ1q6mPU4iU0SHzQOJrduWo3Pm87x0cptUAv8q3UpuYfaITar7/Fbqfo01uvWUTBiTb47JtYrfa/fkQpobaKZqMgLNhGaROHtQ1+cXSSkmCEyc7kM0LKFxbcFSMLWJy16TzM9BY279TzOqfaPTDjfMD1qZkd9TekFaVs0VAmRzei/nfMQOYqm69mo1Q+mQM/x1r7HtYFlj0FUedzOJJAMjl17ELvLFPqhUJJg5ieaNA5IAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opj1CAKwFYlKWMUE70JjRXBz6CijP/Uc3r88g87i9BU=;
 b=AU1uFh0SyR7VzkwH9VgBeK3b+tzVyDx5KEUijsSzwyI3yU00h4jXgBtMWJjG89du/KEANbXp8drzkpXLXwwkxF2eu4TUpHxmEnbr0ho/bcY8zZPeeN/r5/mGGW3hLemy/qekS472nNn7TlSIr1Oko4VyURNy0WDH5iEB7DbOoAohBphErnqHZxD/yP4Kyk2GIyNvKKRGXFpx0UGmNzuD5c7xpACOX0YCgj58klhxnG1wlI3hJNFTZ/mqmwS1r9IjLMjrDdHgRlLBA8Ia/pDAroGHiyFt+djPFOXy5ANzX3dXN+bSvJMph1UvKFqTb8utC6r+iF6YaZqhHynT9+XIYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <09a5284a-4cf4-1b86-47ee-03b572639763@suse.com>
Date: Thu, 3 Feb 2022 15:06:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tools/libxl: don't allow IOMMU usage with PoD
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20220203110651.17419-1-roger.pau@citrix.com>
 <bae9ad85-a26a-67f7-93af-166cc743e046@suse.com>
 <YfvdsDQA/QfZAewh@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YfvdsDQA/QfZAewh@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR04CA0057.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51f69950-bfee-4599-f35c-08d9e71e5e7e
X-MS-TrafficTypeDiagnostic: AM6PR04MB4502:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4502D874A3B4A91B9BD55802B3289@AM6PR04MB4502.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uRMkUDgKLm028ExGCmIVAq7VuU6sqMb4APu1FC/uqCczDoAuxwLuzaiBdwmWjqv4vpfNc/E0tl3OCqFVY08KcRedIowondND2LNU18EMLmbOfS3HwJaDOBENTZsaJj2V+tSlrWPzcFXi7Rov8CbkaX9QrTjB8wWWQIb/cBmDqgUWIxLHYNJecKnucWQl7KpMQZIKzsw0U39+TQJRnIzn6JK5QE3fPCO/rO8V5a5+ljcNB17Z6UsBskc0GlGqiRpkeHCkvz4lR/dBFifKyUh3EOxmo+MmrOb5SP0zWUjP+/2ZUx0j1lKaIxyHmh89TP40guUbCP3WkArU7/fKqwfID6DkyoBuFUuZQGvXsdwETpAfD0Uaqqb1jHWuPO4e0f2roP17+31a06JqT9nWgsx9kdIs3JpY1z2Qml2Ihz6cI7U8NLdeTwO0p5b5lDEtddTYoQ5lmUBlPZiYiU30ACZQUwVEECU9ebFbaQKN6QXSxKvPMrZcyb84Gy/qQoof26fZbx6xd5NDW46zDse38H2GFHYxotpC0ckOYf+xwyVE4P/9ovvkmtrMLqWn4oytAz5SFgZOsm92l4R2ssj4/QtomZxaMHdJiLsBYctEt5PvH7a9Zborp0mdMg3FsoqSzuddiu5SZzq6WksuRsmqz8vPMBYcACFddOZCuMWK+Dkz6I9M2tY7PlYMEMlmwbsfd9DAOSwz6aNnc0BqKM/qHHW3yd9Vd895qZue7kLO1Od3SXNunLqJvJykXa3fWGR9sC70
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(31696002)(8936002)(6486002)(66476007)(66946007)(66556008)(8676002)(38100700002)(4326008)(86362001)(2616005)(186003)(26005)(53546011)(6512007)(31686004)(2906002)(36756003)(6916009)(54906003)(316002)(6506007)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DrtMlqJx2zDaVcn+jQMEzbzf2jAuD1ftt0YGFCOpYnMASPtD2qAALc0CWIv5?=
 =?us-ascii?Q?o8gB0Iv1WDQNcFfhrxgh1EZm/9jfIV+4DF2HFRYkJ06V0wQ2l6LUnLVbesOx?=
 =?us-ascii?Q?ZABaLjmaXUc12dzR2i9TJrFSfjR9guBZUk8Bc4iM+6NiGXYI45HYWyCpjeX5?=
 =?us-ascii?Q?bPsUY6XBjDzwqzB/sPmaMVSAqhmOtdamr7/h/2aRecCOG5y59CwvzzzE2JBx?=
 =?us-ascii?Q?Q1KdHjc/56+ghF9wrHsoeeJWdmnKrFb13UYpmcY+M7fvGN8UHlsKuHIO0n3t?=
 =?us-ascii?Q?j0RXhbX2LR53PzfJpv3TERW+01pD8+QyfbCQX7mTSnlC+LzS2aJpmWXLPfLe?=
 =?us-ascii?Q?jTqB5F8WupYvqobvlqXrOaO9fEw/rA3r9xC0n9sQdFKPfHtdUyFjZCW2roIs?=
 =?us-ascii?Q?Gu/EOWV9pP+Ee/uCVw9jqgOsarANW7JxAfSFD4sH2gaZl+I3R3/BPsUZtZ8A?=
 =?us-ascii?Q?78Hk1m0lWmihekeJ/smiaXclvvNLM0OL1gdvTrdWdIzpyf4Nrqi2pVzhlK8G?=
 =?us-ascii?Q?jCVs3o/umtWKWHWxR2s1YDnpfbXN+Etd69SzJmFyHpOXvfSoKDbAmbGTeRwX?=
 =?us-ascii?Q?RcEqGLXdMaQnmTAAayPaosBi9ygbJHIrExzlBW5oBeV86/sN5M37MTNJGE/D?=
 =?us-ascii?Q?v39QE6/jBTd4oGDTONFpslBtVRC8ScqvL9BQdTYraMla57r4KCaz0NkVjik8?=
 =?us-ascii?Q?PNKA2SELbGgA6T2+A35vUe2Lh2klg3IzaRiVhbVZGWQ66h9IBeFVxuTRX9bi?=
 =?us-ascii?Q?B1RPXQDHqfRU3DuQhinocK4FiXe17GwosSPeMX6H0/JPmCyP/isFc926jAU+?=
 =?us-ascii?Q?EdJKsd4z5X/keEJblxKWI69QOmBeJOGm/5IexoeYtq3usTJRTwLscmfuSpIO?=
 =?us-ascii?Q?i3L5eWP9nHmaQQOvL+6RBWd/uSvPFJhw7/W5PhNRWMYVYFBmXDU4uda+EBtF?=
 =?us-ascii?Q?3WiqSaDXLii5UtVmXRRtOmYIU0nOzy5jroyhxqtWTVuB3XZ42rSeqL6foDzx?=
 =?us-ascii?Q?xxh4HoucVbnc9l21BG4K9vQeXiWr+7LagiPqf/92cjKwfWlvn9iLrMNqspKU?=
 =?us-ascii?Q?peBlbRnKPt7LuZzX7C5g7xJxK+UWn0DznQpBiqAJ2sBzgxG9YpQrEjkufBRA?=
 =?us-ascii?Q?z+SUybnaRDIrH2u2+5QoEjJCE8S0ValviHCnyq4vxIiaWq0Zsp9ieh0zC3dc?=
 =?us-ascii?Q?NsI0lVQbETJk71yFFsJVu4L5aX4KSCIAtMN3ZZhIq2UO4GsWF81ABpTfYU9h?=
 =?us-ascii?Q?l36iCa2Mc8SY7Vn0tZOt1ifsw6hglnxRzMTv//T7hCUzH6sTBGmB7NjJPMVm?=
 =?us-ascii?Q?VYunZb1xfc7zk2u9JZ0dAS5CcG4sZ53D7tQ4HmYyIPZnDSSy+q3Eh1+vKFk0?=
 =?us-ascii?Q?jcuny3ygn7SSw0nc+jMHakdc31BV5PEuVaa/gPSwpH3tAn+ZxexODs1NRsm9?=
 =?us-ascii?Q?EdtgR7J1GazPnf/s/KNLGHn/4LQfBseB5kMczqz8lbjbBRbPOLVeYxrpJDkx?=
 =?us-ascii?Q?HcgihYJWELicsd+h4tnxZYULnvq6bJ/I+coTdCSAUYK8XREXwDsSoHTvvVC8?=
 =?us-ascii?Q?o/BxugowF7Rka8e32+G4j6OyS2c5M//7+vZibLUBT9Ib7csM5npbtIYZRxdp?=
 =?us-ascii?Q?aIo+zR8kpDaVZCIyy3MHN4Q=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f69950-bfee-4599-f35c-08d9e71e5e7e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 14:06:27.1455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qNf2NA/hbY39EBasMDsB6TN2XAxuiDwqx4c0UNcKRTJKJKNRaynWJwtCHOjYfp19oYbXe6woh4tnBJJXoh+tWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4502

On 03.02.2022 14:50, Roger Pau Monn=C3=A9 wrote:
> On Thu, Feb 03, 2022 at 12:55:56PM +0100, Jan Beulich wrote:
>> On 03.02.2022 12:06, Roger Pau Monne wrote:
>>> Prevent libxl from creating guests that attempts to use PoD together
>>> with an IOMMU, even if no devices are actually assigned.
>>>
>>> While the hypervisor could support using PoD together with an IOMMU as
>>> long as no devices are assigned, such usage seems doubtful. There's no
>>> guarantee the guest has ballooned down enough memory for PoD to no
>>> longer be active, and thus a later assignment of a PCI device to such
>>> domain could fail.
>>
>> That's not a precise description of the constraint: The guest ballooning
>> down enough only means entries =3D=3D cache, but for device assignment w=
e
>> need entries =3D=3D 0 (and a guarantee that no new entries can appear, b=
ut I
>> think this is already the case once a guest was launched).
>=20
> Would you be OK with:
>=20
> "While the hypervisor could support using PoD together with an IOMMU as
> long as no devices are assigned, such usage seems doubtful. There's no
> guarantee the guest has PoD no longer be active, and thus a later
> assignment of a PCI device to such domain could fail."

Yes, thanks, this sounds better (to me at least).

Jan


