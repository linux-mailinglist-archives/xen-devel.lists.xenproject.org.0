Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16956434637
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 09:50:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213622.371905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md6MU-0003KB-6z; Wed, 20 Oct 2021 07:50:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213622.371905; Wed, 20 Oct 2021 07:50:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md6MU-0003Hk-35; Wed, 20 Oct 2021 07:50:10 +0000
Received: by outflank-mailman (input) for mailman id 213622;
 Wed, 20 Oct 2021 07:50:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ou1c=PI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1md6MR-0003Gt-Ur
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 07:50:08 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9aabb323-d9e4-40ea-861b-cd8011d9e6c7;
 Wed, 20 Oct 2021 07:50:05 +0000 (UTC)
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
X-Inumbo-ID: 9aabb323-d9e4-40ea-861b-cd8011d9e6c7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634716205;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=PuqG5i4uKPxiDFeuszJOm7Kx3ast/wehPdAeohe83QA=;
  b=bkhGUzkG5owkVwsXL5p44uCsgT7w/N3RZn0lOOC+NhTZCh8bOen7i8B5
   Aij5ouzD2xIHfZxdFjcfQ2aLsaUMqkafk7BtBN8m8cpellLpWqAER3oe6
   zuS6+csvbVw/tg9EDSv2McaFz2IQdBBmKewM4ln9RmZ83mKPM0nq/GU7G
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +Dc4ICcqZs3UK+MTic9jib1wnV1RaQdzdxeiY2M8N5J1GnKylTjl3XDwm9/ylbtLxScZLqzgHX
 3Um0iuJdYYdHtjaKb7zPorTtVvKLXUt6wUwL3Oj+XzQJma0kvWJWHPYTU9Y87nOAda5wTPOC0R
 WdvW/vv1++5IIeUzaAVhKTmg/Ckl+aZWj4EPJ32R0iVEfFtl7G4s3XUbuGAS/Q7ytbRpx1R/hQ
 mcthtV0NmDVfOH2XVWu/CqFJySg63Sk8SsjLqcf94A1DMSn9z8Kg8IL6yBxfpkhk6YBC/1MNVX
 TThfXi8Eo8hwErRITQQKva72
X-SBRS: 5.1
X-MesageID: 55616917
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:dqsk36Mp6SGbV0fvrR2gkcFynXyQoLVcMsEvi/4bfWQNrUp31mAEz
 mpOWj2PbKuNamD0fIx0YYm3oEkP6J7TztQwTgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Ug7w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxillsgtk
 sdij7utaBoObryRubolCwYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/iXu4YGjW5v7ixINcv/S
 JoaaWV/VkzrZF5lO1UrUaAArej90xETdBUH8QnI9MLb+VP78gt117T8NcvPTfaDT85Vg0Wwq
 3rP+iLyBRRyHN6CzTuI9Fq8i+mJmjn0MKoQHrCl8v9hgHWI23ceThYRUDOTufCkjmauVtQZL
 FYbkgIxqYAi+UrtScPyNzWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnMU7XyAw3
 1mF2dbgHyVysaa9QGiYsLyTqFuaODcXBX8PYzceSgkI6MWlp5s85jrUVcpqGqOxitzzGBnzz
 iqMoSx4gK8c5eYs06i45lnBjyibj57FVBMu5g7XU2Sm6St0fIegIYev7DDmAe1oddjDCAPb5
 T5dxpbYvLtm4YyxeDKlbckEBO3z9dm/FyD9nHk/DsQAqQz15Cv2FWxP2w1WKEBsO8cCXDbmZ
 k7PpA9cjKNu0GuWgbxfON3pVZx7pUT0PZG8DKqMN4sRCnRkXFbfpHkGWKKG44z6fKHAe4kEM
 pCHbd3kM38eDal2pNZdb7ZAieF1rszSKGW6eHwa8/hF+ebBDJJ2Ye1cWLdrUgzfxPnYyOky2
 40HX/ZmMz0FDIXDjtD/qOb/12wiI3khHozRoMdKbOOFKQcOMDh/UKOPn+J5IdA9xv09egL0E
 peVABMwJL3X3iWvFOl3Qio7NOOHsWhX/BrXwhDAzX73giN+MO5DHY8UdoctfKlPyQCQ5aUcc
 hXxQO3ZWq4nYm2eo1w1NMChxKQ/JEXDrV/fZEKNPWlgF6OMsiSUo7cIiCO0r3JQZsd23ONjy
 4CdOvTzG8RTHFo8UZ6KMppCDTqZ5BAgpQ67ZGORSvF7c0Tw6ol6bSv3i/48OcYXLhvfgDCd0
 m6r7d0w/IEheqc5r4vEg76qtYCsH7csF0ZWBTCDv723KTPb7iyoxooZCLSEejXUVWXV/qS+Z
 LoKk6GgYaNfxFsa4ZBhF7tLzL4l44e9rbFt0Qk5Tm7AaE6mC+08LyDej9VPrKBE2pRQpRCyB
 hCU4tBfNLjQYJHlHVcdKRALdOOG0f1IyDDe4e5seBfx5TNt/arBWkJXZkHehCtYJbpzEYUk3
 eZ+55JGt13h0kIna4/UgDpV+mKAKm07f58m7pxKUpX2jgcLy01ZZcCOACHB/5zSOc5HNVMnI
 2HIifOa1ahc3EfLb1E6CWPJgbhGnZ0LtR1HkA0CKlCOloaXj/M7xkQMozE+TwATxRRbyeNjf
 GNsMhQtd6mJ+j5pgulFXnytRF4dVEHIpBSpxgtbjnDdQmmpSnfJfT80Nuu69UwE935RI2pA9
 7aCxWe5CTvncakdBMfptZKJfxA7ceFMyw==
IronPort-HdrOrdr: A9a23:yk0qpKDSBUOfUxTlHeka55DYdb4zR+YMi2TDj3oBLyC8cqSj+f
 xG785rrCMc6QxhLE3I9urwWpVoLUmxyXcx2/h3AV7AZniQhILLFvAG0WKK+VSJcEeSygce79
 YFT0EUMrzN5C1B/KXHCX6Dc+rIruPpzEniv5an854kd3AQV0lHhz0JQzpz1ncGMjVuFN4yT4
 OG4MBKvSCtdHINYK2Adww4tsb41qf2fMiKW296O/YFhTP+8Q9BqNPBYmalNllyaUI//V9tm1
 K14TAQVMiYwo6G4w6Zymva9ZgTg9f61t5fbfb8+vQ9O3Hwjg6zaMB/V6aZvDYzydvfm2oXrA
 ==
X-IronPort-AV: E=Sophos;i="5.87,166,1631592000"; 
   d="scan'208";a="55616917"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KaZMeU7k3/LBY7OtnfHj0YeYKyBo4ooU1BNzY1oz6G9uDADZUOghOvl7CU8G4A3qtt7/S3D25kZJryH+2lVN3zHv69VgrnWZ6jEQBxjKVKu5VE8ngEM22yLWH6VjHOtNaoScHIoFo8dHExCfJUaYOPism7cdvOUW0Ys0fs5MHWlL8WIkA8iWIFzDiVBTPFICVwQTo1IKUaVZdHiMSKcjJHNsF9VW1MXA9dU9bw+b5zZN6TMWbX/xa0GWoVSNacttLwgIWosyVf4NEkGUQ252uakuMYDXWdHLdqBL/V0nSvqFNEJdbpBY9O8m645LoTBielEXHk6sn8yqIEnCiwJ5/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pKlgnD6MkN3KSMd8ywkU3dD8ruRKSqhywXbmEvrglE=;
 b=BStuLmdJpym9fRey15iDdMBrPJ8SY+53K9C8OJpTv/6EqOnT2RbtxiAAbHmM5xr3vTGXb1uSl1ZsnmycTN4tbGR7QPqxWfWdtooEnihtslt7jLhhgpVHRLmP7craoQyeJty5yakmsyudxfsP10dM9F4+BPuJOMwqiCzTWxt48IxLuPjxbeH2l9kHzQLBDKtqWAfU2EQ34JYVXuCdUnAGHFnTdEN8nJfBZWcoJmrHtehm8rY9lCy9zsI6PfvnNmdN1Wq4/igYBji/KjjUfNfJZiUVw7B0WWMkceNKLZOsKp8ti0N5SpytAf5e1JZjRUUZcDBX7PdtU67wwoamzs1CQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pKlgnD6MkN3KSMd8ywkU3dD8ruRKSqhywXbmEvrglE=;
 b=QzfddKZPMveXgD2nV+O4UJuOUIDfcTbygZDvN4jzJTPV+KgBkX0YJZjT96teIqpHL6d1i28jWlSQrrCBykqXQ1z6OqU/1jAsv10hyf7wYh9HYQt/2/n6ZDgNeZYjaRAAuCK84kNc5dnnTaqLA/3Ca0KH+AFRU2D4tWGOJ7vj2Wc=
Date: Wed, 20 Oct 2021 09:49:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
CC: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>,
	<Oleksandr_Andrushchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v2 1/1] xen/pci: Install vpci handlers on x86 and fix
 exit path
Message-ID: <YW/KDHnZHz72mjuQ@MacBook-Air-de-Roger.local>
References: <cover.1634659471.git.bertrand.marquis@arm.com>
 <d788dcce9e344a39f6761633f0e96774ab42c2aa.1634659471.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d788dcce9e344a39f6761633f0e96774ab42c2aa.1634659471.git.bertrand.marquis@arm.com>
X-ClientProxiedBy: LO4P123CA0140.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 056c85dc-0864-4bce-9046-08d9939e2acc
X-MS-TrafficTypeDiagnostic: DM6PR03MB5084:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB508451E14B212AF0853D4C308FBE9@DM6PR03MB5084.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fc39iKXJEFshM7rubY8nr7KsI4Yy8rCJvm04hvP4ohAcC+nRikyZsKY3GqOFbnnfu0zNqVPuNJYvZ7p91mTYsbUpuv8QD4AqADQD+u4BcN4/6xYKajDqjPt4ttmp/UfiJW0xM3RhDbwXH7beiRz+jstmxq0esdFgrFAWGGJpVmISWSjGUfNpPpBNlHmPxT1eFJVDv1vyenj7LzxY+tqDijDSV9tEcSmcEYiTo9W1EwF5T02iNUQ83VIl0UnEtK4Aasw5DFfw7CWQ3svNHdUvAO0mLQi01FOB03fcF49bClQnk5fCp9/l34rRKGJ1SW5gz3OIVM/d247houykkcOfffD1mtgZGEmTDTU++72ozjn1f1KhheybtxL0hHRJB9p2pjbBwRFQUv5RW7RQW1By7ZCvmk5zaIxcioLpxXGjQTyQ6LDueQrAbet1PLMUpi8ksCrEIS2fSv++X24zU8F+RgEPt3XX8ir4gBd4BGDwM/t5V3grdYXsTxjYfKzR3sIhK00kiy2lWbh5nFvKg+5OAt84bJ+2+qxWSH4TLy82vS7Kr04qE9Ewkp6eWHXu/0GS+ZfVnLPRuLGH+QAYc5aVW184xUDTtqtzwindoeeFMsuhq3hyb3kwGMh8hB4kzXvJotzJEQULblfIfmJWjYEw/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(6496006)(38100700002)(186003)(66556008)(82960400001)(6666004)(86362001)(508600001)(83380400001)(66476007)(9686003)(6916009)(8676002)(2906002)(66946007)(956004)(5660300002)(7416002)(85182001)(8936002)(26005)(6486002)(316002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVRzQThDRk95SVlkZTVKeVAwcml6VERPeWMxZTNSR2JCWlFsWkRPMUtLd1Jt?=
 =?utf-8?B?R3c3aUhjdHQrVFJrUnhqb3lJY3hDYW9ZamRsbEllNHA5endiNHhLN1Jtc0hi?=
 =?utf-8?B?TlJPUU0vbjhJeVFwbStoSitNNW9nR2tSSHNOZFRhQ0w3ZkdaVjdISFhoQWla?=
 =?utf-8?B?WCtaZFJCaklpNjVKaGxYdzVkS0V1UFROWnVldTF1ODV1ZmhGS1gvYTR3T0lF?=
 =?utf-8?B?MkE0c1BtT3J1UlFoQ3N3RFdRSTFaQXhDL1lsWEpzcm04cTU4dU9obXVoclpV?=
 =?utf-8?B?WllBdEpEQ0dNUXBheGNkbzJqaXY3WjRvV05FaWVhN1VFQVh3ZDlNcVE5eml3?=
 =?utf-8?B?VG43b0F1S3RqOWdaMW9kZ1ZkVmIrY0JHNkRZcm9SYmxEOXlxbXBEcmFqQldN?=
 =?utf-8?B?bDVYVE8za2JXOTlzQWIrL1hGOHBkUnhPL0ZxbC9aN2dkY2ZIOEEzMFVTVHkw?=
 =?utf-8?B?Mll3WThmd041bFE0czIwaWM5b2lMbStxRCt0MENwZ2R3VDRUMzkvcE1reCtE?=
 =?utf-8?B?MG8vVjFXTHNwMnpvaEZTZGNyRTFVOW9qTWFvL2VpWE1MbmRxaXJZZFRlRDFX?=
 =?utf-8?B?cm1IeXpQSHFKbzd1Zlk5U2g2VlRubWhjcStjQWZUbTZDbWhZQitMdlhDMy85?=
 =?utf-8?B?dmlxam9KZ2xmdHRtUkMxcXdwWHk4d1pPbUpCS1BET2FRd3c3R2xqVzFzdmpK?=
 =?utf-8?B?MXl1SnI4QW5JR1BqUExOQjh0R2E1VFloMzZwSHBJQ0pOb3hBd01iYVV2Tm1C?=
 =?utf-8?B?bUhsay94NngzREg1dlZzandNaUF5Z2JJSDhWdittSFdGdnU4WWhPWmVxMW04?=
 =?utf-8?B?UlpMc3FDSTVrTFdnTFNGK2F2VGNFaTBiMCtsazlVMjVQajJnbzN1Q01hME5w?=
 =?utf-8?B?QURBRU9TR1Nhcm5jQS9QbmEzZ2ttZGZ5dm9Ec0pWTHpwWXdNUElJWGdCcTNG?=
 =?utf-8?B?R1N2VWtOWklENlF2Nnd4ek9PVnRmWU5sdmVZUUtERHRFNzM0WFVvQ0MrWXRn?=
 =?utf-8?B?OG1jc0Zna2ErSURidysxY2ZRTGtVNUxWd09pM0V5Z0hKazM2bmZqYXdpQy9W?=
 =?utf-8?B?MURGaWFHbTZOL0FwMHhUbGJ6L2dqSkpoaE1IQi9oaGFOVGpNNzZtVmh0ekVO?=
 =?utf-8?B?cFpoSmk4cDBnVng0bmVOQVI5c3JIeTdOQzM5NUYyNEh3ei9LY05aYW1vbWVU?=
 =?utf-8?B?MFBORVFqb21sSUtkZkFmeHVDOVVrdDhnZ1kwS0xoL0hLSGZyWEwzTmRVRDJq?=
 =?utf-8?B?TjJ2djV6ZXgxYnpLTlVjMWpEZlBjZ25STU9icDJmbFBqS1pnK1hkcnp4WmNZ?=
 =?utf-8?B?cjVsZEN0TmVpQVNpajltUWNpcitCbzRCaXVQRFFTR3FpeC8xWEFHQkNpTU56?=
 =?utf-8?B?SUdBZVg0ckUyTXV0NVhiVk9hSStwY1d1TytoM1VjRHlVbUNLbk1JK0Z5OFdw?=
 =?utf-8?B?YUZSSnViUjRkbnhFTm9OZVpvLzlPeUFLZ0luM3ZxT1pmRlpVc0NXT0xPL3gr?=
 =?utf-8?B?VlFKa1VOOGlwS2dmbkhLN3h6SXFadmlPclVLakVUYVFxb014UnQ1N3JQYnl2?=
 =?utf-8?B?andjNVNKdGhMa2RiNjlqT1pOZEwrZUQ1dk5WTzA5Nm15QktzZkZLTVp4eERl?=
 =?utf-8?B?ckp3N0R4TVhqTFNtMkxnZVhON2twc1hveE50Umlpc2dCWlIzeTJ6dWlXVWI3?=
 =?utf-8?B?L2F4dnpUYjRYeTZhT3ZDUzFkVmRrSXltS3kwKzNXM3lKN2pMNzVPc0t1MVVo?=
 =?utf-8?Q?KUiSwOzp8aMsfc+jrISEjhc2FpM8Kx8FBGTgO1D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 056c85dc-0864-4bce-9046-08d9939e2acc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 07:49:38.3194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roger.pau@citrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5084
X-OriginatorOrg: citrix.com

On Tue, Oct 19, 2021 at 05:08:28PM +0100, Bertrand Marquis wrote:
> Xen might not be able to discover at boot time all devices or some devices
> might appear after specific actions from dom0.
> In this case dom0 can use the PHYSDEVOP_pci_device_add to signal some
> PCI devices to Xen.
> As those devices where not known from Xen before, the vpci handlers must
> be properly installed during pci_device_add for x86 PVH Dom0, in the
> same way as what is done currently on arm (where Xen does not detect PCI
> devices but relies on Dom0 to declare them all the time).
> 
> So this patch is removing the ifdef protecting the call to
> vpci_add_handlers and the comment which was arm specific.
> 
> vpci_add_handlers is called on during pci_device_add which can be called
> at runtime through hypercall physdev_op.
> Remove __hwdom_init as the call is not limited anymore to hardware
> domain init and fix linker script to only keep vpci_array in rodata
> section.
> 
> Add missing vpci handlers cleanup during pci_device_remove and in case
> of error with iommu during pci_device_add.
> 
> Add empty static inline for vpci_remove_device when CONFIG_VPCI is not
> defined.
> 
> Fixes: d59168dc05 ("xen/arm: Enable the existing x86 virtual PCI support
> for ARM")
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v2
> - add comment suggested by Jan on top of vpci_add_handlers call
> - merge the 3 patches of the serie in one patch and renamed it
> - fix x86 and arm linker script to only keep vpci_array in rodata and
> only when CONFIG_VPCI is set.
> ---
>  xen/arch/arm/xen.lds.S        | 9 +--------
>  xen/arch/x86/xen.lds.S        | 9 +--------
>  xen/drivers/passthrough/pci.c | 8 ++++----
>  xen/drivers/vpci/vpci.c       | 2 +-
>  xen/include/xen/vpci.h        | 2 ++
>  5 files changed, 9 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index b773f91f1c..08016948ab 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -60,7 +60,7 @@ SECTIONS
>         *(.proc.info)
>         __proc_info_end = .;
>  
> -#if defined(CONFIG_HAS_VPCI) && defined(CONFIG_LATE_HWDOM)
> +#ifdef CONFIG_HAS_VPCI
>         . = ALIGN(POINTER_ALIGN);
>         __start_vpci_array = .;
>         *(SORT(.data.vpci.*))
> @@ -189,13 +189,6 @@ SECTIONS
>         *(.init_array)
>         *(SORT(.init_array.*))
>         __ctors_end = .;
> -
> -#if defined(CONFIG_HAS_VPCI) && !defined(CONFIG_LATE_HWDOM)
> -       . = ALIGN(POINTER_ALIGN);
> -       __start_vpci_array = .;
> -       *(SORT(.data.vpci.*))
> -       __end_vpci_array = .;
> -#endif
>    } :text
>    __init_end_efi = .;
>    . = ALIGN(STACK_SIZE);
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index 11b1da2154..87e344d4dd 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -134,7 +134,7 @@ SECTIONS
>         *(.ex_table.pre)
>         __stop___pre_ex_table = .;
>  
> -#if defined(CONFIG_HAS_VPCI) && defined(CONFIG_LATE_HWDOM)
> +#ifdef CONFIG_HAS_VPCI
>         . = ALIGN(POINTER_ALIGN);
>         __start_vpci_array = .;
>         *(SORT(.data.vpci.*))
> @@ -247,13 +247,6 @@ SECTIONS
>         *(.init_array)
>         *(SORT(.init_array.*))
>         __ctors_end = .;
> -
> -#if defined(CONFIG_HAS_VPCI) && !defined(CONFIG_LATE_HWDOM)
> -       . = ALIGN(POINTER_ALIGN);
> -       __start_vpci_array = .;
> -       *(SORT(.data.vpci.*))
> -       __end_vpci_array = .;
> -#endif
>    } PHDR(text)
>  
>    . = ALIGN(SECTION_ALIGN);
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 35e0190796..8928a1c07d 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -756,10 +756,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>      if ( !pdev->domain )
>      {
>          pdev->domain = hardware_domain;
> -#ifdef CONFIG_ARM
>          /*
> -         * On ARM PCI devices discovery will be done by Dom0. Add vpci handler
> -         * when Dom0 inform XEN to add the PCI devices in XEN.
> +         * For devices not discovered by Xen during boot, add vPCI handlers
> +         * when Dom0 first informs Xen about such devices.
>           */
>          ret = vpci_add_handlers(pdev);
>          if ( ret )
> @@ -768,10 +767,10 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>              pdev->domain = NULL;
>              goto out;
>          }
> -#endif
>          ret = iommu_add_device(pdev);
>          if ( ret )
>          {
> +            vpci_remove_device(pdev);
>              pdev->domain = NULL;
>              goto out;
>          }
> @@ -819,6 +818,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>      list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>          if ( pdev->bus == bus && pdev->devfn == devfn )
>          {
> +            vpci_remove_device(pdev);

vpci_remove_device is missing a check for has_vpci(pdev->domain), as
it will unconditionally access pdev->vpci otherwise, and that would be
wrong for domains not using vpci.

It might also be good to add an ASSERT(!pdev->vpci) to
vpci_add_handlers in order to make sure there are no duplicated calls
to vpci_add_handlers, but that can be done in a separate patch.

Thanks, Roger.

