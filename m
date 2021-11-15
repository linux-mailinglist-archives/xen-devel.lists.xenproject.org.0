Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A98145044F
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 13:20:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225868.390156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmayT-0007hz-C6; Mon, 15 Nov 2021 12:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225868.390156; Mon, 15 Nov 2021 12:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmayT-0007f0-85; Mon, 15 Nov 2021 12:20:37 +0000
Received: by outflank-mailman (input) for mailman id 225868;
 Mon, 15 Nov 2021 12:20:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmayR-0007ec-7S
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 12:20:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e41d566-460e-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 13:20:33 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-0BGazeH_N_W54xiyjIwpZg-1;
 Mon, 15 Nov 2021 13:20:32 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM4PR0401MB2369.eurprd04.prod.outlook.com (2603:10a6:200:53::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19; Mon, 15 Nov
 2021 12:20:31 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670%7]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 12:20:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR04CA0063.eurprd04.prod.outlook.com (2603:10a6:20b:48b::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.19 via Frontend Transport; Mon, 15 Nov 2021 12:20:30 +0000
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
X-Inumbo-ID: 6e41d566-460e-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636978833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AOphCFdwbiDctiYtbm9KifiQWowoqmrLNt+MIbV//yo=;
	b=TgDCufOAjGsn8JPxFFqzXNYXVh2N0Jb4Q2KXgI5eoxEuAecbApb8IQk831N32ysLaeh+go
	2wBTqVO25PoJqsrwu987x+8RGGy9qPGQnRjJkhD3qD2RbMuaisxMNkgji4JFpQ0z2xWNlq
	xrlK7VTuKR5q26u1SmKTGpysERyNMag=
X-MC-Unique: 0BGazeH_N_W54xiyjIwpZg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9dVGjTSMs1560LEzq0KZ3OepiQKKpqf1W0QR9sXJkQdHX+pCNFGHVKEqd6gNtqceD34EbEn3oBIfWphwVoQBnHZW4nB7h132TJaVnbj6NEaUisbH1darm4l2gtrqHsyXbAVkjX4D+yGnA2mwfPIAxIAuN9TtNiJKR7bsCMXiS2KkzfhMf+auKUxXW1xg87AzG2Vp68LtB+tZY53cZOvLRHI7/ZUg1geHtVQQ9jFh8ofgK44hR+HqrTZYKgUgAXfZhcpk3F/4J9ejWwNS8We7e3tbIx4ZthPn7uM+0meeQ3LB+qlC08Rb/41FGdESpRQyI1IDFNj2m969TYdPOoX2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fG9TaRj9u8VyrJyGdGSOl9z6ugFcZQP82E5gOGlRfR8=;
 b=Lhk1UsUl2bRoBdAM3yvkzK9jiVxQaiRheo7kIKAuXVgDRo6xqB4nrNEnolv9nFIHX5Z2rELn+ouOG3pDC4D42OEMvt10IN+q2Bnyz+FvJFw744vuY1WyUUvn/zCrGeMyqPT0i8br2Y7JuJeCmgtreH74roFwpK8v3i/3RkzGFs3OhEtNwaVEPDQYZwT2+SHmCn+lJqD0kjhi2SQ6MVJT9a4NIqWaY/eUIjcZVNAHZPj2tXL60FNx9AvRrRcH7/XjYPzxjwmPP5CAGIhtNjKT03CJ0FToC26UGxt5T68fBdCuXPQQAkd7xfCSGFrn2WCe8cNSV39tQyF7e7eZ97COAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <752a4740-6151-f364-7e05-ea533f0c8b4f@suse.com>
Date: Mon, 15 Nov 2021 13:20:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-4.16 1/4] domctl: introduce a macro to set the grant
 table max version
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Ian Jackson
 <iwj@xenproject.org>, xen-devel@lists.xenproject.org
References: <20211115121741.3719-1-roger.pau@citrix.com>
 <20211115121741.3719-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211115121741.3719-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0063.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::9) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d90c141-45ea-401a-6d0a-08d9a8325157
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2369:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM4PR0401MB236922D8D7337B1C1B7D319AB3989@AM4PR0401MB2369.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1UmiIsH9XSqG1dkwFdvhlPP+xxS69VHExNMU1YFd8WJkMK0KwRF7wJum949sf60HPuKcX75aqkxenPnQJpkFt8RhKtxVcG0j5Snc8kUTe8fDg/L4wsGSnwIomj6z1OCMWY1AIFahgfUf3lkEtkjiOUECra7f4iyWO8A31H2hWmKfDH3q1UMWi4CGojzFiX3Jf//BfE7vgpf5m0GKo7oAElLTypXZBl9UX13yKOgQlreNS+7nbB3W/6qlwLEGBgHDQhI4CeBXNU2TV2KQLwmkdfb6WmFaiHoBnlpAPY75W4PkWsveW+x6pqrEAVRAXch3BBWGzmDUt3k0Z/11CnHDdEBrupDY9DtOdIE6iLBeCErKiR4iQuBOmmxrjUty79mT96I5gPRXWklwfUOSk2YjCk5Uhvafmf3Sa+0AZ1YNX/pE00CvuRfC+JAis5URmicYZAhowzfdAwYmAZyvweVWHYGXRWVBMD1HvRv5CBZ/tznSRcQGYdQUv3kKyp1lwzzvacJQnAjmcOEpm0FocAlkta6kSjgMP9LxT7lB6iscA1vk9ThnlrnIaC5kv0SK2d4ShrZDz820W5+orvw0XdRAmxvsQlLRgMWhprrXo9fy2FC0WDWg53md10jMpJn00ZyGF4b6S79vpTreYpL8iPgimLGln6F1CJXNB1NXUSoHdN/5XkM+o5d3XRWCoeZo1T9vO8vDFASOSnPoKQSRYV/4ZzeISHEFdU43Wj+erpUPXBM53X5cTJ/wod1vJO6A0Hrz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(66946007)(86362001)(956004)(83380400001)(16576012)(31696002)(2616005)(66476007)(316002)(26005)(186003)(8936002)(6486002)(7416002)(31686004)(5660300002)(6916009)(66556008)(36756003)(4326008)(53546011)(38100700002)(4744005)(508600001)(2906002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p2SVtcBkXzNRzfDFTZQ4ioyyaORAB8iHjlSnKHjqJN2d2gS5mY0vnYobhWp4?=
 =?us-ascii?Q?y/+J2Xwzn+jrS2scek3odvcy2hPQkiD6W/GUmWosoRC67tMoYxeGJ9/aBNOy?=
 =?us-ascii?Q?7NQqCPHD1llGVBp9HG4J3QZhFbg0zqKkBlu+ElsW2DZkvUGJJhQhlURsEGMf?=
 =?us-ascii?Q?znDedX22OOzqrV3hpleulGjytE+vI/sgQU71Nxz1j8CtsnU4mgC1vA3JTu8T?=
 =?us-ascii?Q?io0iBIwjkp1UI7JsB/RBCUBzsnBI8C1/5GbhDlR1XET4GNY43PDJgWjfYUow?=
 =?us-ascii?Q?Ch8R/O+y5Y4iP3SEWVtgyuB7dKsuG4Zec+WHA2Fb7FCekTJ2HoVrIPENa0gw?=
 =?us-ascii?Q?+trG6SPmesmGCnnLKGvH5o+qbjQZT1MzBoxgOZh1d53P6dOIHvA2f5DTVT87?=
 =?us-ascii?Q?6aHvHmwIs8IgVxZTf8bjCMvd+GuPZKAP4VQCgkqLiOGCZFS5ePvHNJmI5W4H?=
 =?us-ascii?Q?Mgs+E8iv5LCXQsoxvkzb73nhimeut++kMOeab6LyWlmnirFL6rZewCNuMpCe?=
 =?us-ascii?Q?7PEk7rDXPaNvpBongFIthH02IPxWmq3XuLD7HM+VnFnWisvx7wc4nfm746Qu?=
 =?us-ascii?Q?LP/lZDZoK6HGUOba09RD0MYm1jYHqdWAg1XNhsZSFAVhR9OFRVhmjSr3zuuM?=
 =?us-ascii?Q?FoZ5Cmn4wWWpMxhgS9FusByh3/4+Y1HbdfX+G+VFAWi/+oaOiFRyoitBq1ev?=
 =?us-ascii?Q?PORqMx03DvCvW8YpYEaRJSVzt590RPOeP67ULTajGpeeRp8iBXQZfmtIQGOn?=
 =?us-ascii?Q?OljCvtSmqa/eX29VOQFl3iYethNc3YYY3DS5dMHPEr7pUpPAhjOLSQ75/2v9?=
 =?us-ascii?Q?LDL8Fjvlyy+tN5xLayys0u6KBgixiv7MVWti0fzw3NbpFYSq4FFbHAAcISgF?=
 =?us-ascii?Q?TqROMlYgiiZg+pSmwY+m8FC29jkn8SUoZQ56Gq68UOK9dQrh56QV3fTT3mSa?=
 =?us-ascii?Q?/dQmCbRSu19wji+/bsC+6ripjPONYLOlzNSzVxSF8jEunxnXJ5KaM8/W0Wmz?=
 =?us-ascii?Q?n+4acotnsKyvy5aagtSgA2FO/ll+s5MSPB2/GzU53epMkmtjGx30vORi+TmE?=
 =?us-ascii?Q?noltACbgkuTuOT3bA2Wh6sa4woP2FZUkvKbocGTO/pqx/M0OdunI/9OsZHYV?=
 =?us-ascii?Q?9rhNSqKgwT/GbGKeoUQgLXSundqMVu7mXP+VOAEztVhk35j78Glp1YkdFxTr?=
 =?us-ascii?Q?pMF/6eFlUerBC1oHJHXlzFEQB3+xUNRLElVc3NAF3NkU5uZNzjFubfQ3YH45?=
 =?us-ascii?Q?+AzA5lzxMcC+WeOxErCJknWJxoszrwVju0ht4qhHGRTnD3DFABN3t/o/jTiy?=
 =?us-ascii?Q?chrHU/w2n41Uuauwcb3aSFIZJ/cT3v0G9p8iCZpo9p3A2/g1phEPfL23myjp?=
 =?us-ascii?Q?nNKzywDzP1ld7CTcXiwbGk7yNEAKfJ8n5OFTWoE/wKP+U9fb3t+xS4rEIlux?=
 =?us-ascii?Q?iIafhOwa9HvNi4l+cs89WTHiSH0GMGVcmom/SYqZ0kLN/2keHXGUV9pBDVCj?=
 =?us-ascii?Q?9pqr2VX3A/DBjhlOZ48VtGHJ7ptlrEc7A5DqG9edSvKyYmgM7nznVr/wp6Ba?=
 =?us-ascii?Q?VTyibpKAhQ9vEqgxK1YYgiVmByMu9STsvVe2+kMuKSKYg9HxYsFI44ZOWed4?=
 =?us-ascii?Q?uhL9PljU4IWQ8Uzx3zwvK78=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d90c141-45ea-401a-6d0a-08d9a8325157
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 12:20:31.7150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+W5sHndbrXRJLK/d1PSNPzBq/6iKWR3eG9EbWmpSWdmc/bKArFO3/EUtvuUIysZM7iU7YMu2eh0VERvMjVDCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2369

On 15.11.2021 13:17, Roger Pau Monne wrote:
> Such macro just clamps the passed version to fit in the designated
> bits of the domctl field. The main purpose is to make it clearer in
> the code when max grant version is being set in the grant_opts field.
>=20
> Existing users that where setting the version in the grant_opts field
> are switched to use the macro.
>=20
> No functional change intended.
>=20
> Requested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


