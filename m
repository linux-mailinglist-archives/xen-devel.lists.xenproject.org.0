Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD824A7433
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 16:05:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264287.457332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFHB1-0002Vu-6l; Wed, 02 Feb 2022 15:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264287.457332; Wed, 02 Feb 2022 15:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFHB1-0002U5-3T; Wed, 02 Feb 2022 15:04:07 +0000
Received: by outflank-mailman (input) for mailman id 264287;
 Wed, 02 Feb 2022 15:04:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFHAz-0002Tx-Fr
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 15:04:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b538ea5-8439-11ec-8f75-fffcc8bd4f1a;
 Wed, 02 Feb 2022 16:04:02 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-T-kNNkshO1iliHAiZevC2A-1; Wed, 02 Feb 2022 16:04:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8095.eurprd04.prod.outlook.com (2603:10a6:102:1c6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Wed, 2 Feb
 2022 15:03:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 15:03:59 +0000
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
X-Inumbo-ID: 5b538ea5-8439-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643814242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5enuSN3lUVUJwJE3Qj/nC6/vUsvH3Ym5GqhOFLC5Ur8=;
	b=LpJ8qf0NC6a6AT/TaKhXgQrSC5lCGgHA2kWvm6PcIU/Z4LD5S441R/IQCrDBRaVOIIfum6
	Ho6UD8zAS9DWIPGGO02xVtnZxOj3X+qHxJ/y0IrMUwF+Ic5ENbXGzYK37CTGFV3qy0W4/h
	eBgItGFXcVSnXLdYyb01MlI9FyO4VKY=
X-MC-Unique: T-kNNkshO1iliHAiZevC2A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oIsfJvmOAsWrl6u79wNwf5pVm74vX+OXE7L6JrVwESNNFqSgR8ekoJpHXBLJNKFuYeWIZ07cxYa7OH55xvboY8956CVqaUikjXxO0kjC7hZbqeOOUmgCqqAuIrJvCv6Ms65qtRJh1uQi9ughwi4wbBW0c6OArF7j29ju3QY7gbZz3OhCh1oRhCoWwb4OFxxCs2/Nr0EWebIyo4uhGMXrBwTORjjFJy5jSMjyHyTUOQ/v7L6fmm+n+Qt+M8v7YQxQ0hdLGaLURl15VDcZ4IuiCFI7xzAAuwkasi4kLFmc7Z1trOUS9SdpCodgwPAk1tMo1WhmnbmfQcfnc0IY2DH2PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBRyNp+ZlYONfsxjoAJA1EX+KoUvSPBAcmhaPQR8834=;
 b=hDrtR06dQ1dBzZ2HUPEKEJAXnGXyDkZtjdEKh2XcUqKSOCnTy5Whnc2NKtVSubXZyRpuiLDqjlQlbpksUjZMTZ0TfScxekEm62uQMittUoHXu6anntPFQEZw0xzCir1/HRnITLC/fQR/DBQLmVAFy/6EB8zGQY/mfMUQ45AJ241fX0eUKXAORDwBVYkcUrtK/Rb2UqzhZpukSXULB6TBXnvKKZVlEwcXf4f1CtWxe9TOdw2iamF1qEVfYXD/7VZvRien1z++Y8T7hgz6VkuA3hZl6HacPOnyJiBCuOxZKC661iX+elj9gLopwxKmFHSnE4SYxjJYSBYeERuJAOnc5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a3043ad7-e72f-1314-a51f-812d73cb6afb@suse.com>
Date: Wed, 2 Feb 2022 16:03:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4] xen/pci: detect when BARs are not suitably positioned
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220202144523.10709-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220202144523.10709-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR05CA0020.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b580814d-3a05-4daf-fd1a-08d9e65d3dfd
X-MS-TrafficTypeDiagnostic: PAXPR04MB8095:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB80954FF3D7034CAE0B913DE0B3279@PAXPR04MB8095.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MNVHyvwdlXe/jIXfLQbGXuJyghNk4djpYs52nnPLWPOg9aOIiJu9M+4NEPAyZJEWCH5B0gwdwoe5Pkk+ydfxsOB6EHnZJVs2+yZSmAAV0u5PfXGPjH8LAIvQkp/O9b6LDFxDQCwvvrBU7AdIRpBYBrqLdWWeclqqg+JBWZibGaWxa+MCRHoSk0A3xc3qeLGzj5WCDkIf7F1TyegnrckuN2jU3IKcFwMjb1oaPj1NYfQSQuVgQmuGi+TKXvkGKair6/t3JUWV1K+cUfN4Oa/RADedq+bmdZgGby2CoBJvBWRZYmAYuE0iO7Vb9Jci8Q4TKH7cYuwhjNInTtCF0+2pboVGppqiaeslB/P83OcNMj05WksXCxEPsNvmf03bU72Cv1fTnzbxMz7sSuD6V3yRX1o6oWQoWpXXIqiTlvjSrMrdclCtIZCevK50ZwGcHaU0iyD9nh2/aqvykXjTiwSbkVs9Maj1epGWOcZBkJICoZrKAgWbDdX3kiJAzBYxgJbYGxphdUWFOPtSZ4n7b4ZCjRXiHv5O07A0p1oI9Rf/qYuIadhQoQtYV77WpgjaA1o/S3QyAYZzKg/3eYrTLWqL2NHEJbQiZw1StHaUImRQu66Ff6mjmCWLH7aJwzD2EKuyXfx07a4Sm0vbov4kAt0mrbetKxBGkdKW4oZr+w++vbpkfByEoYE/A5E+TZKxjUFq2XXazQ93K+7b3Qj+fSAQzpM7E9XHh5xXPkvREndZf+A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(54906003)(66556008)(316002)(31686004)(66476007)(38100700002)(6916009)(66946007)(86362001)(2906002)(508600001)(2616005)(6486002)(186003)(26005)(53546011)(8676002)(8936002)(36756003)(4326008)(5660300002)(31696002)(6506007)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R/Y3St0AGdY58UsSOuaCJRGSCxJBy5dAAWpVjDp4m/NyDyNxcvFRxJ0ToEQn?=
 =?us-ascii?Q?DKjOheEjBmbt1wyMkefsvsO5ej/d1YC4hqWjZ5y1fu0pbpXdGZpMFCFWSdyM?=
 =?us-ascii?Q?uLPjU/jbhyc8E9L1gouK1C/Q+29mZApVrbNb7G6kUJWTQgHw+a/taWhj+x9J?=
 =?us-ascii?Q?qsQ2HKVwcxqa+au1nS4pWESKisUmTm3u/dCxB5b9GxebwgjUlXhyFPDob27+?=
 =?us-ascii?Q?MsVquUzfZEZjsa34Pz2KhlkDFJhyU4DrjS4dNN7Aa4pOKBXNssN5rlWNrPl8?=
 =?us-ascii?Q?PQ7A0CGBEz77l/p2fJXtO/IWct3ffXNc1XArrpVnzCrGKqovYsc/Khy34AkC?=
 =?us-ascii?Q?+zIzx8IZgZNntqXfPm6HoANQ5wzavPBhzBSxrjJ3XcJOKnw1Jg/4CRH1NeRx?=
 =?us-ascii?Q?mNui7R6guitOvx6to9A5Tkp8GpIQ0qv6/6OFiBk+K/ldMAL+ta1UwpQ0Wc1R?=
 =?us-ascii?Q?NXhrrfOAjOqi4+6lEyBbVgvwjiuLZgXTEpl8avSOooiBpKkRegLI1D+Uqc4M?=
 =?us-ascii?Q?czcufWinfVaD0Bb1ZYzDwRRQiZOCJq6zNtDh7ZiJ5fQoXkozkRedfH5dK04O?=
 =?us-ascii?Q?ZT6a+UXDaXxuDqqaCzUUjdUQuvzvV2EH6FFjI+kyblRbnNJ4xJzQg3wZeqw7?=
 =?us-ascii?Q?lIkILLjHCLI4DuWluRHT8aRbeHMNs+mwZ/fZNAZqOKvk3l1IbM+wa2U+ueEq?=
 =?us-ascii?Q?gPgZax5Eukkak2/yXwYFly2NCNJrwraQBruZgaTzc1KE3/yD1vnVAmzYPBTR?=
 =?us-ascii?Q?IW2W//oGMr9hvsReyzMpD5nC7szzhOBqN4wsaET1eD+2Zmc3NEY/+7elgMqg?=
 =?us-ascii?Q?GMwi6EYIxrnR2Acii1Aqu54Xf8MeyubcjSWT2b7tW7yTCKNNU6gthqm/1YgW?=
 =?us-ascii?Q?QZcnmYv2puUkHwvInMexDCt/fEpOvD8SKgkjTqteSUYMYjyyckdmXzlCI+bJ?=
 =?us-ascii?Q?riwkNbE+NmtUVqmTXLYffkiB/MZuoo55W+y56fYeGjeBsm9CUXtoy6rBzEV8?=
 =?us-ascii?Q?83XMJJw/LLDH9AnG5uBBL0FgTd6YncdVl2ShcMDE+n4Se8X1meMxlAJuFznY?=
 =?us-ascii?Q?+6HcJ14SWZE/G3IdFJ8CST72uTy8mgyN+ufAFblvq+uzq106WYdczDM/c2bQ?=
 =?us-ascii?Q?Ym7YqjZyhWsfVcqO0JLbpdr1KUZqmcn0MSv+hlydgaMN/TW8usTZQxORYMMI?=
 =?us-ascii?Q?MCWEuoGH3bMRMKXfmYDT49gggUYIKFi3ZcrPTkC+V6342/t3tc4qx/en5wnB?=
 =?us-ascii?Q?Ri/S7GARA+aTv/Zrt74niyulRRovkGQRZNv5CNuF58dsE0Mdn/laFPFo4GDG?=
 =?us-ascii?Q?TadM5zyyCIXIseanrdXeOSj8+hzkp9g8TzC0fK7yZOy4xoJkitxIgEH37XlN?=
 =?us-ascii?Q?HqvPSagHHv6TBveyLGo/cp9c0SgRZBjVXpWoU0hAIhXgpiYo2ITMUAli2l1I?=
 =?us-ascii?Q?LO2uZv6dgXBRcwpXwlMjHwhRoXF/aCAIrmYHGjl23vgPoA7DPGzlgCJTp9Oo?=
 =?us-ascii?Q?niUi9PEHqK+/QcDMg4Agw3/NNgbMYCcEMV9deGFl7DPL5Rm+BPbMBIZnSduI?=
 =?us-ascii?Q?gvWz611R80Ib/xGvn4n85jmz/WBsBsa4BEDNo4XVgXf4Y6UbdBWWykbKF29W?=
 =?us-ascii?Q?zX6PcXbNkfRQHHxbCnnc/Qc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b580814d-3a05-4daf-fd1a-08d9e65d3dfd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 15:03:59.6975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCkpB3avXkO8VdDny0BOnb1qArEOQTNrvzL33ZWs4iStVPkTzf3CkwzlUzNgCTTcQ8bvFB/hJrlUc6W1u3sz7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8095

On 02.02.2022 15:45, Roger Pau Monne wrote:
> One of the boxes where I was attempting to boot Xen in PVH dom0 mode
> has quirky firmware, as it will handover with a PCI device with memory
> decoding enabled and a BAR of size 4K at address 0. Such BAR overlaps
> with a RAM range on the e820.
>=20
> This interacts badly with the dom0 PVH build, as BARs will be setup on
> the p2m before RAM, so if there's a BAR positioned over a RAM region
> it will trigger a domain crash when the dom0 builder attempts to
> populate that region with a regular RAM page.
>=20
> It's in general a very bad idea to have a BAR overlapping with any
> memory region defined in the memory map, so add some sanity checks for
> devices that are added with memory decoding enabled in order to assure
> that BARs are not placed on top of memory regions defined in the
> memory map. If overlaps are detected just disable the memory decoding
> bit for the device and expect the hardware domain to properly position
> the BAR.
>=20
> Note apply_quirks must be called before check_pdev so that ignore_bars
> is set when calling the later. PCI_HEADER_{NORMAL,BRIDGE}_NR_BARS
> needs to be moved into pci_regs.h so it's defined even in the absence
> of vPCI.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


