Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 172064C31B3
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 17:43:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278504.475786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNHD8-0000Gv-LQ; Thu, 24 Feb 2022 16:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278504.475786; Thu, 24 Feb 2022 16:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNHD8-0000E2-Gq; Thu, 24 Feb 2022 16:43:22 +0000
Received: by outflank-mailman (input) for mailman id 278504;
 Thu, 24 Feb 2022 16:43:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNHD6-0000Dw-Hb
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 16:43:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id deeb0633-9590-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 17:43:19 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2054.outbound.protection.outlook.com [104.47.6.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-uY8oQFtHO1WaARFOUQ3kiQ-1; Thu, 24 Feb 2022 17:43:17 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4424.eurprd04.prod.outlook.com (2603:10a6:20b:1e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.27; Thu, 24 Feb
 2022 16:43:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 16:43:16 +0000
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
X-Inumbo-ID: deeb0633-9590-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645720998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W6Ps70Sf/Udog8fbpdUoBek2hV338nFs/0uA0xlJ0ng=;
	b=G1vcsDxvgjXbOqJ8Y9PzSUKZqGdFg29/T5C6jpJS3LCKX8FVFrhQMEi/j2DWc/8hZCiT53
	+NIa+bNyIie5XcJv+SUzEDXs5mEMjw3tmrouX1r8AdKMRZiQ0+bdWMk6hYnlcuFf7w+hcF
	9MzHTw94107uYqhn1SU/4PAVYaTIqlI=
X-MC-Unique: uY8oQFtHO1WaARFOUQ3kiQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltEoL19yuMwQskrskQXDgnZQUP/Hqg4d5PsbLnbchJnqY8Yku5WUqVHHuiMI1RCeTdGEaumVyvgE3MProUHgMJkhJl2dDVYEinZmJxzaBffglceQnMtdnp2PgubROvUoxMnhHWuPgPLM/u2JUxKM969keSG9S4JA2w3Lrv0Fk+q1W5hm3hqmFIWg7LeVRVQYejfNuNB8oQIGsQDaSGB+ljdnZrKBGhI9ozteJVFCXaCfWyb6fjQRcJ3Qpf/b1bO+gN6BN4XSTFawdl542dBBWemBojVajklsdWK2D67OsUQX4RREK9quD44MJ2vlbySU1FxrHNrkrQ4lgJ86bH6KyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lctuyp3sqxjRhuRF/ZUXDYC9j5FpRHWS77F2/NW8LoA=;
 b=mZwjjh/b4wtRUatJFbGBkgyW3lcDqh5J7rEQts1mMECzToAyeJF5L+M8P1rWq8eRJule0wkgD1cCFd0Biu4PvjoRytRcYNlYzLmF+cLiaGUOSSPN5We5w47ueXI1yV597bHcXSAXAmbYtRd1710yWcP0+KJuhiOG4YOj3mYC1Z0A1Ia1v+8gVVc5t8lnl9dw7s7S1oxB4mHaDbt3ENzJEj/xBrUaeNCH3crM7X/FZHMTYRbFHKyEigYGv4G0f/huex/UAGdCya/igk/451Zjex1jBhfCq2fGl87aKZRbQ/BKEPQ3IblO94tlQDQBRI3E/DZfSS+TsBjDZ+amOVmV9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <87b47562-7689-de37-f2ee-df05ef01c923@suse.com>
Date: Thu, 24 Feb 2022 17:43:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] pci/ats: do not allow broken devices to be assigned to
 guests
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org
References: <20220224163701.89404-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220224163701.89404-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0201CA0017.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88a738cb-5f6a-4ca4-2f0a-08d9f7b4c13d
X-MS-TrafficTypeDiagnostic: AM6PR04MB4424:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4424A363FD620843BE123B4CB33D9@AM6PR04MB4424.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	THjcmSAkt5yiglymTRVN8w/0lSgRPyXdUO9EQvFRls/Uh7QGQrp3QOBjQAXYiTrCXzidiMBx8oOU/CarZImV/5ymUDQD3kLXbNyBkNMSoPX4gTDnWG/SXg0YhGVYbPauVMKqZZWC/zbku/kOVR7hvLja2pjy6c4UnKA3bmH7fBHMsXi8QCcIJpu0YfwUsOM6zy4Relqh3H+oeZ/YsK47mFM58osgWE68umfRt6Vp5jANFLODfYsakLpZ909frfJm/mzNqP4MPNVRH/SX/m3flWu2F8U2eN+l8cZDXIfKUYll43/QEDVxg7yP9GYg4mj+9UYrawygxkVkJmwVo1uw+0r5/Hf2PP80vEEI1MUXLqhe4EaqcGXGYDw83Ve8aO1Ir75vLK8GWP5b6W2WOQ+2zott1cURr3Pj1cdOmwOUIk16DrIad/EIp91vfUC/hjLvpNxisN064D1OUcAwBjj8CiRt0h8TwV0sW0s0nluwfKDvxGe623wyxbPdfFo9u57km3F7ZGky2hSw2toJyxSz9zJw/k7CoLEEJ9aIV9S7mUYQCbV/KTUWIDk/lKHnuMss/OOMqwDCqOKASgsaWok1kVBGjQvGCfmJmm9nRZy4fdYPiEZH0dfNP4sZ8H4YmsjFAaAigAGAqDMTq3AkvjPaYjs/0bdjLN7tQ2ow88ircOJR3SBSqda9m9q8P/qbb5S0D1HOh4szzSZaC1nRxDxc9p3FPep7nSZhwyomKzNFTQg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(316002)(5660300002)(83380400001)(31686004)(26005)(2616005)(66946007)(4326008)(186003)(66556008)(66476007)(8676002)(8936002)(4744005)(54906003)(7416002)(6486002)(6916009)(31696002)(2906002)(36756003)(6506007)(6512007)(38100700002)(86362001)(6666004)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TBgHDVhPqgiY1PvruB76kc/vL/ooLWdsEvL9JfcPCqeIKEVHOQKGrXNgTPdV?=
 =?us-ascii?Q?rLMRmjh0kMWasNeTXyPElejIq7CYTbCpSMGZuT61N7Ym9ceVm6rteF2uqWRJ?=
 =?us-ascii?Q?CTj3d0NhJ9pSCWaneIe517+Q8TFxmB0OIowOe9LffZVCOj0ycm8V9uhgk280?=
 =?us-ascii?Q?uPNgl1ndlLUzbJGJmL3tXHne+xcn1c7lb0dCChODq2U3rUzM0zYKwqqKHhb2?=
 =?us-ascii?Q?C1siU9zJD+uGlSYpT1RFHM3RzY5b3CcxN8XN6bdhtzm1A7HDgPoOoXqCOZGE?=
 =?us-ascii?Q?mteTMLIDYvKUDM8X7raDnszWHuiDK5WDIptnjDKxqRobnN991+G0dQM3M2Dj?=
 =?us-ascii?Q?26ju9Cm6g4hE4UWPQ3v5FP5h1dY9Xex8z81Nv+Y+5hdQQKSq7hEoTwebJ/fY?=
 =?us-ascii?Q?vIh6QS7TOzSGF+m8erNhlbkFGHUQXSkyX2D5P5VR0/EoemSXxtU6vsPrtr05?=
 =?us-ascii?Q?PZbKpQC7M1OJjkm/7A5wqaVKz41cstNU3UAzStvyE2EMpSIl14uT+tHyQZRo?=
 =?us-ascii?Q?zcSrH3TgJxcM1UUH2TI5+5Ghrn3+dkwyWJzRLcbQnA7rC1nmaMGKYnMaoqWv?=
 =?us-ascii?Q?M7DH1PnHZKPgzfHeoKvdTuDodp5DU25ltIsP8wFU95fhAR1i7KE0JYM44nJ1?=
 =?us-ascii?Q?HWYugCDDWou/63EqyomjSJ/6F/O9JU48P+kU1C5vYzkG+SdNBnSCIVjXP2Pb?=
 =?us-ascii?Q?WvMd7YXbevGOf352qX3O1VOYybb5huvcEjjIw6MSd6VxPDUdYkyjLcurI7Vi?=
 =?us-ascii?Q?MwWIQQu4w9AY+OF+LfTHPfqn7tVymV7pB8O7acMT9MgdbVRI/AFX/SJF1pZg?=
 =?us-ascii?Q?0hIwlsn9nvOuYqf/p+XNM30JJTZDNAoADS3bnKWt6YVPrXgaOM6LEQek/s6I?=
 =?us-ascii?Q?djVBNd39ki6x23u9kqLWnkwKAN0RJwYOBgk33BOp1+R4LAx43nRMs+JX8NHs?=
 =?us-ascii?Q?MfE7b55yfHc9Xp2vFTpM67nK5oYa/L+sZzQuk0kP7XGH4RNvTC+xem0FZnEw?=
 =?us-ascii?Q?N0pD/8azvnstKktljx6DGru9WrDXOxH3RFjSEuMxoJbOpO2lh0iqa+x7UXAu?=
 =?us-ascii?Q?/TUUp3XRmkwbiyTqFs0n36BnzMuT3d1yhuhY4Nemz70JXjcNWJVGXDBgAg9t?=
 =?us-ascii?Q?sMimFNz4d+LBSs4vULism2FMvgqkhT1JIjXZ572gmyEteycRSf4vOhg+cfcL?=
 =?us-ascii?Q?7Ev5ZuHdRH1TGfY5APl/sK+5s1AviC643+PHqjF56DMeIR/FPOZXYUAGZmLm?=
 =?us-ascii?Q?Zf6Fu3FLRv4M3qUkGT4hTKhSrbAIVqShKZjJxKTSiAo1wKGp7pA3KdQqNNbe?=
 =?us-ascii?Q?cbzXlp9uDDiXZrEab/USQ8vVc5k30UdeJcpupgukiZON1EfNG5JfegZcANY3?=
 =?us-ascii?Q?qclmUrRmspft/7UVZqsa7P6B4TmAdflW/v2zHq3ZYn0raeG4Sv/KX4/YVbA1?=
 =?us-ascii?Q?uhF/OWAaxESyQkd+BH+Dm6PlaViz7BfLOg27qJp8Bt6am244r7q6PvYQvb1L?=
 =?us-ascii?Q?vFFsc6DYmlhNBkvIaa4ZfzFmU++VdjTcQTDNpoVREnNETsE45VWzYfMmSJnL?=
 =?us-ascii?Q?SgdqjUKEGFBDdhpmIx8aZmU8JlYUDiQj7fyjy+xL9M0KsfLTeIIuwgiwb8A8?=
 =?us-ascii?Q?1vKz+2pJbha4+0VYodXEUL4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a738cb-5f6a-4ca4-2f0a-08d9f7b4c13d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 16:43:15.9384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /5GGkw4v8RaS3mt2yEBlKe5v4AcXbSWigtqX7jkbEN3sHATBI5MZktEeMxViW3dgrGDhGriuXeKZxIth1SqonQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4424

On 24.02.2022 17:37, Roger Pau Monne wrote:
> Introduce a new field to mark devices as broken: having it set
> prevents the device from being assigned to guests. Use the field in
> order to mark ATS devices that have failed a flush as broken, thus
> preventing them to be assigned to any guest.
>=20
> This allows the device IOMMU context entry to be cleaned up properly,
> as calling _pci_hide_device will just change the ownership of the
> device, but the IOMMU context entry of the device would be left as-is.
> It would also leak a Domain ID, as removing the device from it's
> previous owner will allow releasing the DID used by the device without
> having cleaned up the context entry.

This DID aspect is VT-d specific, isn't it? I'd be inclined to ask to
make this explicit (which could be done while committing if no other
need for a v3 arises).

> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


