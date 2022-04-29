Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6004514593
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 11:43:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317101.536271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkN9J-0000ZB-6K; Fri, 29 Apr 2022 09:42:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317101.536271; Fri, 29 Apr 2022 09:42:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkN9J-0000WN-2F; Fri, 29 Apr 2022 09:42:53 +0000
Received: by outflank-mailman (input) for mailman id 317101;
 Fri, 29 Apr 2022 09:42:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTs9=VH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nkN9H-0000WE-Oi
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 09:42:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b700b560-c7a0-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 11:42:42 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-GRfyjdiXPDuNtnKq5JXlOQ-2; Fri, 29 Apr 2022 11:42:46 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB6PR0402MB2871.eurprd04.prod.outlook.com (2603:10a6:4:99::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 29 Apr
 2022 09:42:45 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Fri, 29 Apr 2022
 09:42:45 +0000
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
X-Inumbo-ID: b700b560-c7a0-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651225370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NqhyRjJEkBPZixM2EI5UcQI6uqOO1aQFKdxncf3UlWk=;
	b=UPEamEMW2TRMAq6BokXTUg/weC8Bv4RK4hgRO3mOuJsQYGQRZ3awUjcG1sxRpwQUALSwi6
	ELAFhMtiUn7+1yf8cAfmwv7iI88s+r2NK/q/7ysBnuKPdsed+dTS/xnZFQ8+Mw81SgnXx6
	8eGzgRLzTftRaoybfreFNJIJsbvBwZY=
X-MC-Unique: GRfyjdiXPDuNtnKq5JXlOQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WpRNnSK5Tx0uO60ynl1/3iXhbsigd0F8ySZFlmaqQcLOZSKAVtH09dqenLhQ0KKaTLKiihBdWoZ4Tu8JJ9+eQJJG4/TiNXM6/YBiJFWtsSMAoRfJb0v/VvIPgYNCBiN62eNrnG/OdT0Mti0BfWteGrr+HdIjYlmxl1+EHIUEBQJ/EZDNfobhWGuxXWyj0zhaUJDX/4ohZB0isoe5r9CAJE1dJo1LmRBe0rxRnRHtPA82bjhQPziLupUBPWyP2kg4fXGLr7WGRj5g+QsDbVuHAM2yb4mwbI5xJ6bPJQHgu4IWw6SiQFiBcRooBx6rdBEA3xgJ9LZCTQZVqzGQhNPF9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3n3bJocTB8QXinYCxVTEgtjyEaluQ1aFfAmH4tH+ccs=;
 b=RIqB2kpXWrjty6YinNW3y2/rfUIwku64N5ojZPJJEAyUxnKZIsd/xSOXIuP47IGDuR+almvB5IgGzLXpgYOsxZqTfq5+c+jnvLv9JVBJ6GMdQ5FofFREY7MBatbslf2auRWxrzkfpkHNHTZWFP0TBev3q/2Q1VVtN3YvmtjV5fOcYzJuSqy2Bo2rmEpAUfL5B8C7EwvQGH5LCVWeFDWuRFklQvZko7BGNt9MYwKSI01P9AnvdcOzXT/h1+Y9vbMKKTRIyImnWTWnth5hSVH4HRqzr+4QcbN7s502Nvct//YJp00KSVX6uBpSKDJpJyDuJkppvm93ejMEhWxgHd4u0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2308e187-0174-132b-0ad9-6025e4c43f3a@suse.com>
Date: Fri, 29 Apr 2022 11:42:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/2] linker/lld: do not generate quoted section names
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20220429093644.99574-1-roger.pau@citrix.com>
 <20220429093644.99574-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220429093644.99574-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0098.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::39) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb4a521b-24d6-496e-20df-08da29c49cec
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2871:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0402MB287148D0C0D9D4928B793F11B3FC9@DB6PR0402MB2871.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MuKOVHiu/e+3lvwjdbQBRv+yVDXWaaqsQbRDG03EioMX1XyM36S4/MuT17aRxeUYl3ZNXWyyh95YDGgJHGD0K1nvNnvl6T2kpANJVwfVYqdiFHJQPHw8Th05NNUQ6xDLWEhibBOxOzTKp1emNQyDHRRXWoiFSnzCyThBy3APvT+7soxvoYuZrT9P7SR+eSfVLKuBOwLo8xmKeBtExJaqawrA0r6a1Xx8QUq9XD9B6qSaepO/uB4Xfpc0aNA47ujbhOzVayvpUIr1aihBvzrxGMhA4jwdLJ5jWOdp9Rm7yysvsSWQPCyVfpXYlpLEQYFlbXo9nhnzrsOJ9RF72gzyfeeCr4Hk0OBfdOw/u3+BcvqbsPrssSJtKubJp+AenDGGFau4RVWCLlCBF0uSjsI0W3YLVhO71B1W7SNWlBfWT+bD3W6HclSvmotEZ4RlFcJiRtBMYPnDjxkan3YJ5yDrpLy7Kefd06ROekXDxZcpnu+jvL6FxvcbNxYtVzyZl3u6PNwhJ/XKCcyRtDlb5UgHZgHGALs8WrytgXnPF3n7RXlmsATWkuVPgpibnU8M52fv0dSmYuUbgM1BZisTjvMwXoESUCyp14Mq1zeIV7jx1sCFY/E8j4ZlLsEFnih35BTDkV0w2z46aQ9CvpF+b/7fl038jYzaVmyi0FgGrgRVaQ45aEUFcK1cxpuB/zyYaUAMrl4mhmBXoQNF2fs6X9k3q1z3VtbupNxJHVKCf9JzMus=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(186003)(83380400001)(86362001)(38100700002)(31696002)(4326008)(5660300002)(54906003)(36756003)(6916009)(316002)(4744005)(8936002)(8676002)(66556008)(66476007)(66946007)(2906002)(508600001)(6512007)(53546011)(31686004)(26005)(6506007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KWulDnZbTBCe88fyG9zsP++nixSsCC8dvPkW891WoGBO6nyJKNPc/sw8HaTy?=
 =?us-ascii?Q?AYEHu9RHp5Q2rS6WIH3dZ9ctSGDGvFtR00ZfIOuLq8WuG4j71Jdw3O9xCtZa?=
 =?us-ascii?Q?Nc0l4p1hhv/OxWMIH2TNNO0VUJZQSMQ+J7NzOvtfUDU2EqleRnVWnC+PovjI?=
 =?us-ascii?Q?4UiqK/6jCArWqyCGRljZjvwst9UR5FCRIh0pfu9sAIz0KfyT187tMXnrN/Fy?=
 =?us-ascii?Q?gg4T9WxqTTFzfMt9WiowBVahYs4CvysebSAdD8oxB8lSRJ8Ts0A2aWukBf+i?=
 =?us-ascii?Q?g3XuEVLNetNhoayipYgwfR/Wjlg2lEMFUJaKGTRHz/6o2jl9GbLGkox29GoM?=
 =?us-ascii?Q?Y3XP/gvipZWPnVZeKdOhwUhutuLc1TKppDsHb2ftTWgAN75GJZWY/IDUErM9?=
 =?us-ascii?Q?5IAwhybWCuJCsdJ+BPN50FhKcZiUgx9g+Abwp43XLgMdW6AN5Crw5+SWxJju?=
 =?us-ascii?Q?o5XuNuGQ1StDTylPr4Kn3uVW9cXdisQsDSgrPehzY54PKc0Wd9bdTPDQZ5Hm?=
 =?us-ascii?Q?krS9THFoVH7qAOjhlL1ql9Gr8LjTvLDm2PBH/ltJWIGVAA8nIabytqcpw55h?=
 =?us-ascii?Q?0TgXVTy4m9OZ2TRcY4zC7E7Qso3+HvuJQbiCcQ3pPnjq4VNR0qh4IXyVBn06?=
 =?us-ascii?Q?JkDy0BGuMsJFsqtOw5emh93FWZ5fncazB297ERUVIAcBSDxXvZXm/691X2ki?=
 =?us-ascii?Q?Vung0ZQU3D/FAPfSEac3AvXhhcZsPPfj/eTWyKNRwvqbQv4DIebU/fFEp7QL?=
 =?us-ascii?Q?2x6zN9Eewk828XhukEviqk2BpkeU3tWi9fVIXsMPwIbv/rh/rLiQD5JEktQ8?=
 =?us-ascii?Q?G2SUGAanebXuY8x4/yIATSpMLr2n8EqhqlhFZSGFUv8+vzq3o/1LZG1sZcO2?=
 =?us-ascii?Q?HCx1jgsfi0ubD51KuE/jTvJQ+taTzK8Ye+GGZyd3jIPGcTjHeoa55DkYnD2X?=
 =?us-ascii?Q?L0140VUVOqUDpVp34chKO2nZ9hFQLTZ5aLmVeGYZ7qmmdNAeSC2rChleNIcU?=
 =?us-ascii?Q?7fw6IVl3dIkwlagyh8ziTKB088i+RDQwB6TvBbmLC6DeaAiE4udx2ne7EwBC?=
 =?us-ascii?Q?iIjc77dA2mQQIFaccgIf64w3e/Web6n3JrgK3qMT7dQMyrSdpiSeVlsJNvTC?=
 =?us-ascii?Q?+5I+bvMpV9EGKcr+BpbyFv3bjEmNwn/U8GKQwar9ZOs+DdHiNxgZo9/NBhBv?=
 =?us-ascii?Q?O8A9fqIrKoVjcpNz08dJYyFwi1o4evYXYZSD7B+HMVSchWSETMTwYd4V38V8?=
 =?us-ascii?Q?XsVZ9uZI0MhnvrC+0DNydlgYw1Roak4DQ70ggEQBZLs5ubrAcAEOCpmwg4/G?=
 =?us-ascii?Q?pcTS7Ypn8bQCcYS8uyo3grPvd9eKnbU3NAAu73sFVrVbFf5EKf2jD5sKIWBo?=
 =?us-ascii?Q?UAb+EULFsa8sqOiLZrOnoBwKyZrPBmkuPBTzbJ1gV844sq7qBkijdli3FKhx?=
 =?us-ascii?Q?ERTsVVbtdMnuH/5mK86LQjFBgMqjtoygjLhbtgk51F3DbyJBiLhnw1wOWvBf?=
 =?us-ascii?Q?/BURi6LJwCwLfCozpoNGBHCj5BEOXVNuNNGTGbXRrjOjy1l69wpXTlbS2b33?=
 =?us-ascii?Q?9JKe55quNmors/vO2VVTNIAPK/EASnssbZSiBoAVgD69IZM9047Dk2c+EZ+g?=
 =?us-ascii?Q?zJY3jBD6/JQw3C9dbfU+3zQF873an+6bzEAjuvfBzzSzGOCxmy9D+eulOtD/?=
 =?us-ascii?Q?pCRTp/VTTAxhzXcsQMsGHgkTSve+gslfMfh9Wygkp3/B4uPIS1a/UO0mEJ09?=
 =?us-ascii?Q?lPGFXaEawA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4a521b-24d6-496e-20df-08da29c49cec
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 09:42:45.0489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUw8TiaB9CB0TVYvMnytoy2s7rjA89AapCRG2zcnVjo9idsF3SyFxkcb7zwzuqZgnvspgqpFPpue3E9bSV5jqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2871

On 29.04.2022 11:36, Roger Pau Monne wrote:
> LLVM LD doesn't strip the quotes from the section names, and so the
> resulting binary ends up with section names like:
>=20
>   [ 1] ".text"           PROGBITS         ffff82d040200000  00008000
>        000000000018cbc1  0000000000000000  AX       0     0     4096
>=20
> This confuses some tools (like gdb) and prevents proper parsing of the
> binary.
>=20
> The issue has already been reported and is being fixed in LLD.  In
> order to workaround this issue and keep the GNU ld support define
> different DECL_SECTION macros depending on the used ld
> implementation.
>=20
> Drop the quotes from the definitions of the debug sections in
> DECL_DEBUG{2}, as those quotes are not required for GNU ld either.
>=20
> Fixes: 6254920587c3 ('x86: quote section names when defining them in link=
er script')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


