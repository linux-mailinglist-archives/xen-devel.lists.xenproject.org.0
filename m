Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2980746986A
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:16:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239047.414319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEmV-00048U-Fa; Mon, 06 Dec 2021 14:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239047.414319; Mon, 06 Dec 2021 14:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEmV-00045p-Bq; Mon, 06 Dec 2021 14:15:51 +0000
Received: by outflank-mailman (input) for mailman id 239047;
 Mon, 06 Dec 2021 14:15:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muEmU-00043L-6d
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:15:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 030da0c2-569f-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 15:15:49 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-FQXdlZ3EN-qiAGFRgtURcQ-1; Mon, 06 Dec 2021 15:15:48 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2446.eurprd04.prod.outlook.com (2603:10a6:800:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Mon, 6 Dec
 2021 14:15:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 14:15:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR04CA0022.eurprd04.prod.outlook.com (2603:10a6:20b:92::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Mon, 6 Dec 2021 14:15:46 +0000
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
X-Inumbo-ID: 030da0c2-569f-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638800149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=v3iQFA/7LIAqjfS4sMAhAUE/Rcgq7GBgOfxiaKoVp54=;
	b=Qa6teoVpZ5+u2rZ4s4CBOJi1eBq+VVl60UwWCnsI4gd+/Qj4ZonyrH8WqFZLtRZwhu+sfJ
	sbdpcFJj4imFtjfPcHiasql2yR47j4JqUY8AwMJ64J+croSXmfhqblzTjqrw4O5MTjDqxs
	Y8EAN0h0KZHDHRIaFq4Ihh2Eut4BW7U=
X-MC-Unique: FQXdlZ3EN-qiAGFRgtURcQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJaf0+uh8LvFL/4eGAmBa8q26zk7u/sDqHj/eQskbDZmxaLrIsworEQ7GHMFjE+V2Z36VunIOwTEB8s9D9bhEbelHEqSZJSkbqpvDRj2H3NLp7RlokHuSz8s6U7eh4EKHk9ekvFhmWWOIyXlfpL88EfIAuZvj3uC3PXFVtwe/+QyjKodAicb9Yc7vP91Rf/uJZ1MvlGJ6/HunQGB8SRHXdMBxeApFI9Eqg9+elR6VlTduUHsbxEaB4MCQMPpNKOv6E1Sq6SVqwuTP7xjf4fE1dxeX96IE6F49obffDRppSwIhvS2HAGdfS+5Oz/pi6lChuNqZL8jN176xddzE0gaFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3iQFA/7LIAqjfS4sMAhAUE/Rcgq7GBgOfxiaKoVp54=;
 b=mWay7bL0R7KAkvaetRMX4V7HUhDtoATxdDKBNHRfCqXMkbQP3RB5ORw7/JhnRAIO6it2bGXocp9dRW6DqpI7dQjx7O5Ow5pAMaaLLMhymh3D2eDhJ9F+yZomInZa8VfzoZvvyMVtVaWm6gLW+yCHrPgkUET1Ub/OycYlH3lNsTmNvuKeOb60fgV+JturcpKoCLkGyQzqQ2DOPX7lWe4kSdSNOmW3ZVmdEtWz0OUi1N3HUwQaTT3bdoHhGmlZxYw2f8oj6lVlyd6PdvwL6WbKHxvOzU2/A5xWVW4ia5+QRzhIMfTuPyE5AhC+Py5M+ooVa4mQherDurm4QCCs0n57pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4af7ce92-8f4b-0be2-2439-a1bfaff59be6@suse.com>
Date: Mon, 6 Dec 2021 15:15:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/7] x86/boot: (mostly) video mode handling adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0022.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d127622f-a535-41fc-fa8f-08d9b8c2e5d9
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2446:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2446E60D6ACAAC427DE6B9D1B36D9@VI1PR0401MB2446.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OkUW5ROvyFkgvMYwFFfremzPQGVdiSj8d1Sy0rL006DXITiOcbSPi7kPDCawI6bPUQyIeGNHQAUFP3aMzG3Y9PPCCYH2a/pFgyAL7Ub9ixAPLnKSsqF7v16MO/i2cox5DuwTOCb3SKAvCKo6C8ntPrZ6oLdS2D6rKDzJ14umjH07n7OkfKh13Tntyy6ioQpthp6jAMKB9PEKKyzaAr4ft+aq2kNgC2cwa+9sWW72E4j5d2sR9mmnrgbV3b040Q/03UnvFCBHAlzfVMOkbBNTbsndbhRGLsCZT28gFkDvUh30SBd5+xRp1KLsVlve4zE0hnkWeiu91Mr6w520ldWra7GYuvuPlM6JQ5847bZE9qSBzI18suY9lhEDefJlebgnQF5fvmjZf8t1i8N75tAxUW/ebTgJ5RPXtxWW0HtCDCdAdXUSbU1kZES4dQ2MldPdbar5gPq/5MxA/n8AUYZSteJKI+oJM/zsJlba7BgtwVEjHztQOPV9RAg9vhRVjRizBY6DbPUD90UPNywz/pSrezVsoRYswglV6F+fAK7I1d67ucb3xaw90wYLOEbtxHrtcx2jEMkthrMW0fBcDx23IpPCAfd/WcAZAA+Mg9/8CNolWWigpx8GtHKkB2we8QQJzoo/gVsMyMIcTa4pwVtZyT/cllYwqCyef6Wypt1dKFEXdd48TTzpmRqixPX6TjEcgodC8hbmSEQNeaPRL69a1h5SeU9zZYgupG1dt7znV+w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(54906003)(8676002)(8936002)(6486002)(4326008)(316002)(2906002)(31696002)(186003)(508600001)(66946007)(6916009)(66556008)(4744005)(36756003)(2616005)(956004)(66476007)(38100700002)(26005)(5660300002)(31686004)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEtPWHQ4SGo5NlZHSmNicnF6SVlDMGFmK3ZiaFplL3JtMTJCb2t4ZEExT0xG?=
 =?utf-8?B?Q0VtZmZyVnlkMlRJYTVaWG01TldhbE5weUZLajhuWmRFS05MQ1FMZGdzYSs5?=
 =?utf-8?B?bFljV3VMS1FWVVpTUk0yd2pSS3pHeXRnaTFQMjFicnFCV3dNWjJRUUZSOW9S?=
 =?utf-8?B?QURsdk81MzdRdHdQdHFvQTBUN2QrTlNKS1JOQmwvSXVRRjhtK25UY1UvQU1n?=
 =?utf-8?B?MDZxSzk5Wk1TNUVBeEpFelFUV2MweXZQSE1VU0ozNjJoenk2R2NEUDBrNjNl?=
 =?utf-8?B?QUk2UitMTFpWeXF2WlltaGlSeWxKTVd4c05ndlJkRk4xZ0VaZDdNZlNOR0pK?=
 =?utf-8?B?dHpSN2JhMExyVktLeUFyMnlqSVlNR1c2L1JrRDVBS0JOMTdpaW5MQ3lpeG1p?=
 =?utf-8?B?Um1OY0hLRXBiUkgzai9LbGY0M09kRjhpeUlQcXloelFvRU1qWUc1SzRTZjU3?=
 =?utf-8?B?elR4RTlaanNZd1N0VnJiVDR6TG9oa1pSS0xIeVRhdmdzREpQcCtaMFNIenBp?=
 =?utf-8?B?cWp4dFFjbzhvMkx2VnhjQ1E1cDBUWmp1N2F3VTYzbXp4Smoxdm5kekhNOTNp?=
 =?utf-8?B?OWllNmdvcUJ3akk0M3g3Y3VlbGVIS200TjdUM1UrOTlEV0ducW9pZklxcHRq?=
 =?utf-8?B?WkNWeXNzKyttRXk1Q0pQb2RMMXluS01vVVE5bWVySXFaMmt0YmRBcVRXM3JN?=
 =?utf-8?B?MW1XeVRSMDBhKzFwZ01qYU1DT1VQbTFyMVhhTjdSd3h6MzNGSVVwVDlnYzM0?=
 =?utf-8?B?dHRMMGdINHdZQzJrQXB3UGNpbFQ2VFJnU1plZjg0a2dFNU9tY0pRdDlndlBj?=
 =?utf-8?B?eTZrU3BaTWxjK1R3YUxPVnk3TXVaMnYxb0V5YnUxR0p6bzYxRk9MenJaeG9R?=
 =?utf-8?B?Y09EeHZSblEyNEowNWtvTy9IOWNET3laa2ZNaFBhNlVJN1ZuTnU1eHJyRGFh?=
 =?utf-8?B?bnFaNlBoeUJpMkZZR1dPaFhDckJiVWl0ekdBT0t4YnVNU2xyU080TVdrNEh2?=
 =?utf-8?B?SHh6VG5HL0dmbmljNERjZmNZUkcvZXVwSDIzN0lWdXVNK2c4U2ZtZzVyUXVh?=
 =?utf-8?B?SC80OFcxL09ZbURFQkFRWGg5UjJZSmZMWExMcWl2TE5MOHZ1cm9HTFVNaDYr?=
 =?utf-8?B?UjV1TjVKaTBKVHZyZmFPZEJOWjBHNHZRSUtkb2tKUWZ3MXhzVVdPUzlWYng2?=
 =?utf-8?B?dzF1SzFPK0g5RGJ6YUMxQXowbXJsZWNESVhCZmhwdWVITFRQdlRTMmhoUEpW?=
 =?utf-8?B?cHpSL1UzOEVIVTJITGwzNEI5SXpFSC92OGcxQ3JBc1JEWm0xTW5IU3pzVmsy?=
 =?utf-8?B?RHk3ajdvY3hqRG5ZL1gxU1BMT1RxVzZvV1RnUlNxY2xYODZ1RG8xWE1vcWV3?=
 =?utf-8?B?MENkdE44T3dWd0M2MW5EWVFmRG1ITWZtYThmZ1FxdHR3Ry9XeS9XR0x3cHA4?=
 =?utf-8?B?OGN1bWN5RHlCU3Awem5CRWxpM1gxMWE4ZWNxeVd0WnB1QTl2ZGtRaHhONjRG?=
 =?utf-8?B?VG5BVjhoWk5KdElmQTNUTWdPRUZGb3VsUVJaTk9peVBYVnZEZytNdm5LMWI3?=
 =?utf-8?B?MC9ON0xzRUdzSGZxZ2o0SVNIMkhXY2tpWTFhZTAwT3lJcVVZKy85QTVFanpG?=
 =?utf-8?B?SkFEV0dKakxZK0plU1NKdVNCeEtVb2VHaGk5ZEc4MG5Cekc1ZmtVYzRrV2Zl?=
 =?utf-8?B?V0c4NUN4cjN2WU9FNVkvM1NJcVB5SFVLN2pnaERqVFdqRlNpa1BiMW1QQnZs?=
 =?utf-8?B?MGNtaThTRUdFRUIvbVZEcWJlbk5GczYyR2dYUEJsL0NCaEhHT3dHWFJ4anVv?=
 =?utf-8?B?U3A2VStVZW1ZTDZUTGY3d21JWjlnbkNadzN3OHpzaXlzSWcxOEhBSCtSdTNP?=
 =?utf-8?B?bzdaWENKRlZ0UndSMDV4cWEyT0xkWVVTRnFZajVNditRMlpHSDFrSXdSaG5y?=
 =?utf-8?B?STJrV29sQWcvT3Y0Y3NRK1pobUQ3VWdFQlB1d295akd1dytkellpNG14ekUv?=
 =?utf-8?B?VDJQbEc4c3U4dCswK2ptWThOclhxS2p1dHZFUUlaS3Rnbi9Ob0l1bWZXNjVm?=
 =?utf-8?B?eDZTc0twVWZuaGI4ZVBBdDBaOExobktIenNubzdERnYydUNmSWhHTTV2Q0pj?=
 =?utf-8?B?ZTdHUEJuKzR1NjcvT3lwK0FLUGlhdVdZVExuUE0rWWJic0k5UDBYeHdrMk5p?=
 =?utf-8?Q?2IBoDz1oeN9fnGPJSYXQAoc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d127622f-a535-41fc-fa8f-08d9b8c2e5d9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 14:15:47.0719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: voJhRoJOfspdgdvNKzXVvAjh0kkdxZnYoXFzqyMop4WYQIJFvWrdv6Gs4wWXKQHxgnUub12Sw6pIvEqVinVO0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2446

v3 has only some re-basing changes compared to v2. I have to admit that
I find it particularly sad that the enhancement done by patch 1 has not
made 4.16. This series had been submitted well in time.

1: make "vga=current" work with graphics modes
2: obtain video info from boot loader
3: EFI: retrieve EDID
4: simplify mode_table
5: fold branches in video handling code
6: fold/replace moves in video handling code
7: fold two MOVs into an ADD

Jan


