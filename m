Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF2049C972
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 13:18:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260851.451004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nChF7-0001CU-QB; Wed, 26 Jan 2022 12:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260851.451004; Wed, 26 Jan 2022 12:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nChF7-0001Ae-Mk; Wed, 26 Jan 2022 12:17:41 +0000
Received: by outflank-mailman (input) for mailman id 260851;
 Wed, 26 Jan 2022 12:17:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8h68=SK=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nChF6-0001AY-Nb
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 12:17:41 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f27d6abb-7ea1-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 13:17:38 +0100 (CET)
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
X-Inumbo-ID: f27d6abb-7ea1-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643199458;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=MkRBIVnFcedWxoaiKsxH52qkgJGhbFeEZuzbdctB45A=;
  b=DbAWfRD35mCLJD45T1wkIqLtvWhizabQ6SjofCr9NU0npo4PyqdCyCVM
   mQ3B5cRePaJgE1rTJlX2wO+mkUePOaDIz4hTZb0gjQ9ILyjEUorqfwNGs
   Qi9FL7/rzaK/5NraXtK/2Gjh2jcpPSKCigjIqrAkuiWzQwx/TiAEY4gBz
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DeEVe60V6dTAMMjtEmxVfhbRBEL1KS/YpGG0WIIPSVwSyi1Ji/zEsySO1+4VgSCO2Ia+QIzwDy
 5V3SiS55RVv4nrRwaU92sM6BwbJ9M4xqLoSqrsCHNRKNi1E/56xxSBFVVKBzkY/MbIZSL4TJ/U
 IbxfvB7k7M5gLjaYvrkeWU2wyu9tNWOues6QVZFaZkE1j8MDtFtBGl4GRWeLWMK9dPwl866BcA
 CSXmsB63tIxFSivNF70hF/I8pVR5H6TSVy0WsHj3H8Wo4pT+GYCkeINkhYVJyVjdNI34uf4Qn8
 QsPmNBhCHC1g+2lRvMQ/V7GX
X-SBRS: 5.2
X-MesageID: 64961691
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VOFpu6sce3N+Pb0n4B/FyZ2vxufnVLBZMUV32f8akzHdYApBsoF/q
 tZmKWCEOv2JMDT1eYsjOoSzpENXsMSHm9RrHVM4/ngzEH8R+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYx24bhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplhJWAUxYILJT1kctADChpCChxHo1Z0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JwfQ6+AN
 pNxhTxHXh7HalpWKkgtBbUMgvaHv37Cdg1ipwfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krk1WnkBhARNPSE1CGItHmrg4fnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDYtUupKAswo0TiE5feL0jeCD2cnbiFoPYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLTfbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNL0D2BLwQKChRqlEGp/ZgPQ1
 JTjs5PGhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvGonfxo3bppZKWCBj
 KrvVeV5vs470JyCNvcfXm5MI55ykfiI+SrNC5g4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjmz+7bc2lnnyPjOrPDFbIGOxtGAbfMYgEAFas/V+9H
 yB3bZXakn2ykYTWP0HqzGLkBQladCdgXcGv9ZU/myzqClMOJVzNwsT5mNsJU4dkg75UhqHP+
 HS8UVVf013xmTvMLgDiV5ypQOqHsU9XoS1pMCoyE0yv3nR/M4+j4L1GL8k8fKU99fwlxvlxF
 qFXd8KFC/VJazLG5zVCMsWt8N08LEym1VCUIi6oQDkjZJo8FQbHzcDpI1n0/y4UAyvp6cZn+
 ++81hnWSIYoThh5CJqEc+qmyl685CBPmO97U0bSDMNUfUHgrNpjJyDr16dlKMAQMxTTgDCd0
 l/OUxsfoODMpa4z8cXI2v/Y/9v4TbMmExMDTWfB7LuwOS3LxUaZwNdNALSSYDTQdGLo46H+N
 +9b+O7xba8cl1FQvosiT7sylfAi58HirqNxxxh/GCmZdEyiD75tLyXU3cRLsaERlLZVtRHvB
 xCK89hef76IJNnkABgaIw98NraP0vQdmz/z6/UpIRqluH8rreTfCUgCbQORjCF9LaduNNJ3y
 Ogsj8ca9gijh0d4Kd2BlC1VqzyBI3Fov3/LbX3G7FsHUjYW92w=
IronPort-HdrOrdr: A9a23:TJTq0q9XKEm3OnpksoVuk+FAdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICO4qTMqftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdOEYbmIK/PoSgjPIaurIqePvmMvD5Za8854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nJfiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvF
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfomoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A3eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wg67VBaM0o9
 gsCZ4Y542mePVmGZ6VNN1xMfdfNVa9My4kEFjiaGgPR5t3c04klfbMkcAIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.88,318,1635220800"; 
   d="scan'208";a="64961691"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qk6imrqB89TI7Tv8e+EOVpkW63rmbJpUy9XhSZByneTg1HqPhjdygwxFhzMdeXOnKBfAZKE3QmE3ngVk+9g5ZVzLGGvnyZa+LaTPs8wh3J4ik8GKVfWKy9UP05L/5T/VC5uxMryibi0BTKUNf2+D1ITL5ZNP5kRXe30sHgv79oE1kHt1outT5ffRZgjTOocXXOLiB61uR3QLqRZzlp7l1YfWrJF1/AuI/kEWOhHFWsXPtXCafwWhg+ZyUz4G6SWIKrMnqw2PsgLBVQRNzsSxaauO+gMv5eHBOWaqeGu66eFIf005OxX5pUNHLuMYq6veppM2D8kgCZ36BQW7l7PmNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pu5v7E6wpEaDLESZ29unUYXoSklMxrmo4g/8dJDRus0=;
 b=HCA0Xi0k2RszNKo5D9ep64qhkzwIh6acbQ6Ny2XpTGgf5TpCJZUl41mxyC43hyMIQTXpf9CSfAgU6lom7nhPgJlgEKEywvdec1G6DevxIqXpQf12sHkpztVaCXu3zYFatiYUPGdj1TJmStrL2/j5gzQysLC4MtZpOcPCkrS7pdAC6Pe5IrX2lT5ofa3x+88DAW9rXoz1Iu05HkgyfE1CIPlJz+N0nBuS2E+1fsJ8CcZqHYRgBL9J5/NAGUPn/I3iSi+1SYHD3h1IbobuY1yQoMgzLP5M4TKRRvHdQ3RI2GnnHYr2rLniOv82e+5g0UlamOO7dK2AXzA+DUkesfR0ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pu5v7E6wpEaDLESZ29unUYXoSklMxrmo4g/8dJDRus0=;
 b=ppia6lVVilZq3pkc728Ng5xV29zfqXqvKE8RDNTuQSQFoRnP0NplO/Mhni5jMei9udgn5iCEssSL0cfuZkz3JzW6yoZTq77is0BqUgqJft+xvxBIMO2XEQsRRP6YBapPUXVoUXNnczPSAdaix2Uh6tWVDlGTpbtSlvJt5jlAWMg=
Date: Wed, 26 Jan 2022 13:17:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/8] x86/msr: Fix migration compatibility issue with
 MSR_SPEC_CTRL
Message-ID: <YfE71yLhvV9W7GT+@Air-de-Roger>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
 <20220126084452.28975-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220126084452.28975-2-andrew.cooper3@citrix.com>
X-ClientProxiedBy: PR2P264CA0033.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf0746cb-b9a6-46c7-13d4-08d9e0c5d403
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6647:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB6647009CDAC329E49D5596B48F209@SJ0PR03MB6647.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: amK7PEz9StVxKZ2JlCeClWlW0Wq9Gk6qlEHAGle7nvt5PWW+8/xqQrTkx8auXv3GDYi6sq+zwT75NTfO/gcORe8GVzAKmJLjJnsPSsWVq49MzmSmrQO+w1LgBR1hmDEjH12HPnF7K0fKxIxIzIu3aMuXrIlavDyvO6vbHKlz5dEV0YA8DlIFur2aQwE4mQOAmmxkJw//BLWH7elZ76Xzbx+NtHk3/7GA8Wk8M/DwsPpD00qJtni6pOOZPMO3czrakkhqJsDEGrOpVzAgaUXQzwC99oBJGHxgHz3f0DGhCkxYDeAORMFnAMfLq7BxGcqVuD1hY+qzxJxk3ETRApc2RrvZrbFCFB8uRuGRjvgj+SGT2L0699oNrB8KzYyg50568fOhUxKgD2SAyTOutP0/12DaM1EEBSWCgcOg+iBK8vc4VJMAz9F2z2lcv3NeAteKGubZ3lrGExdtwRZ0NDdRDvjkts5Hut61KEcyq2/t2zlkfZuneEv1NiwyNP/D9ndiqXvmIdLCLEcfDX2zjRm72wjrDgylcYVPFgaLPT4peWHHLQP6TmqV8ricfY32fTZplalpNFHEU1aWgZT7W0r9Oe3WI5gPl/TL1JDuwyJj5QPKpVQ0AqO+tvUOjtVthkslnk4Li8bm/NXa9u0MUhGxqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6512007)(4326008)(66946007)(66556008)(6666004)(6862004)(9686003)(186003)(82960400001)(6506007)(85182001)(316002)(66476007)(6486002)(54906003)(2906002)(26005)(83380400001)(8676002)(33716001)(8936002)(6636002)(5660300002)(38100700002)(508600001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UklXclJiUVhoM1l0cU9wTjA2N1dpT1Mvc3RpRG1sQy9GSFJHcDd1ZzJpZkNT?=
 =?utf-8?B?VUR3a0VIbC9RQUt5bExiMjQ4YjZDWHluNWhLbFJ0SmIwVGV5a1NRYXdWV2xW?=
 =?utf-8?B?TlBuRk1nWVRpTi8xbnZzb1dtMDZPL1Qzdm5FL2U0S1RITDJSbWlWeGpDSXl6?=
 =?utf-8?B?dUI2TmN5MUN4NkxlbVlqNm8xSVV4dmV5RFM5a2didndWVDBTdCt3SndCVVVl?=
 =?utf-8?B?emZMZVlQWUVhRExZQ1k1K0NuNUVKVXBSaWJEY3QyNVIrU3FGZG5HcktGMERH?=
 =?utf-8?B?dGwyUEpISkFLekdVaHdrdlRmcEJoZEhyY1B1SHFBSkpjS0YzSG5LaHA5VGFB?=
 =?utf-8?B?VFN2VDlmWGQvREhmaWllejhFQWZlTEFtcmZQYzF6UHlybGJ1VmRiUE9mcjJx?=
 =?utf-8?B?N2VHU3hRWDZkU2EwUFdQNVBlTkw2dXlsdDJUZVZFcG5aYkdra2RDQjdZc2Jr?=
 =?utf-8?B?QWhGMkNleFZ4Ny9mVkVqdnhtNENVcHl6eStleTUwOEZSN2ZMZHVtdjhSOUhY?=
 =?utf-8?B?TlQ0TVhqQ3Q2SStzTVIxNU9vZ29oN0Nwd0tyTUswVU1lQ3BnQ0R2TStscHlu?=
 =?utf-8?B?a1ZuUUN1dHQzU25za25GT01EYkQzcVRJYTZzVnhqeHh6b2JYSjMyc3ZZNFFk?=
 =?utf-8?B?ZjhsOXcybHZJcnVydTRKOEQxT0Z6WlpmdytaVDN1d0k0OERlZE1WY0ZVRlVG?=
 =?utf-8?B?cE10ZjNGSzNJTGFxS1NqTnJ2UVY5UWdlbXY0RGV3UlNnVE8vZ3g2Wm9OZzlU?=
 =?utf-8?B?ZUhEQmowQmJvbEZudnI0ajlycVgybzlYbFJ6a29OdWlaZW9WTlJRb3ozbW1r?=
 =?utf-8?B?ZDdvREtnQWJiQ3dGQXVPRlRHYzZPVWhWT3c2SWswbi9VUUpLYytZRTdpVXQy?=
 =?utf-8?B?RW05Wm9WZGdzNUZaaUp6OWlRZGNIYVd2a25nVjRUMUhwbEUxcHMyUUMxZjdM?=
 =?utf-8?B?OHZaYlhMK1JTV2x3WmxwT0E2MW9qei9LNnY4R0JnbXNUZXdudVVyeHdxdzAy?=
 =?utf-8?B?MkpVMzlxV1pmY3hMeGZHeU0vTE5lektrNDhaVjFoeFNWSXkvQnRGaEpiODFk?=
 =?utf-8?B?Tm9ZN3VwREZJaU5RdUV2RllvUjhaWHJSa0FpUFJkSWprOE9vMHV0bzVvSUJ5?=
 =?utf-8?B?QmZKcDNNK00wYUplZ0RFWHl4Y1luclBNSUt4YnpwaUkzaGxpN0dLNXhEZnVu?=
 =?utf-8?B?UEJWTVkwSVBad05QVjloWEdPaWVVVU5BVUVrcW9NazBZNEVjUkF2RXNNbStQ?=
 =?utf-8?B?S2dBcXBnakFuVXVDaTU0clJYMjE2TkVRTVVhN3VKdWZuN2pucWJMT2xKQmpi?=
 =?utf-8?B?aGN0Q3BlMWJSY21RK2hINGdTK3RTeWJYUXVQYkZsa1hsQWVpTVFMNkdueVl6?=
 =?utf-8?B?QzhBUDBPRCtBY2Q1V2xsOGE3MENwa3F6NHoweldzUHczaW9weXRJdWlZbEpY?=
 =?utf-8?B?N3lud2t5T1pBUjNaUDBybGcxNHpmUTdwUnVLV2N6emEwZnQzUi9PL0lOcndD?=
 =?utf-8?B?V202QithTkJIS09mTjJ2RUVpa2ZuOTFQNHdBQk85QUNIU2VBSTE3QWFhTWYy?=
 =?utf-8?B?aEdzdWFuQ1p3L3Bma3ZHazRMSGdKek9XQ0dwWThjUzhLQlB2U1A2Y1dFOHIv?=
 =?utf-8?B?TXdJQTZBV0ZoZDE2WjQzdUllbVczWDlkeTdaYk9DSU5VYnRjMTloaUQ3MlpP?=
 =?utf-8?B?Y2dKOVZadGdBTko2b2RyUW5KeC9SMmV0b0tXanBBOEhvNlN1OGJHQlY1d2lN?=
 =?utf-8?B?aDhkR0F5aWwvMm1xcU1FeDFyZW5YaW5HOXprRldCSWh5NkpKKzE2SU5DcXpy?=
 =?utf-8?B?MUVQSlZOME1MU2NzVDk5MWFkVUc5SnI5WTFBWGt5Q3k2Z3oyUm1XNkIwdUgy?=
 =?utf-8?B?aEs3RCtEZzJabkVJUFZtL2hLVWdkMUk4QVFGUkkzbFhvaGloT0FLY1JObnRB?=
 =?utf-8?B?Z2p5cG1kS2lsRFBlL1hxSFl0eCtLcEFlTW16RHgyUnJOclVIWjQxU3JvMVZM?=
 =?utf-8?B?M3h3OXQ4WUdPY3RLYzgxT2NTRTBkTUJiRkVDd3NyS000WHExbTJ6SkZpTGpT?=
 =?utf-8?B?NWo5amJ2anNiK1J5RUR1bU94K1poZ0dMQUJpU3BsL3l5SENFSjh0aFhzV3FE?=
 =?utf-8?B?ZUV5ZFY4dFh4NmlScUVtblZhWmIyV3NJV1pGc256NXlpVjZjT2w2VkQ5MTh5?=
 =?utf-8?Q?Y2hj09Z0pHCq33IX5b3ULcg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0746cb-b9a6-46c7-13d4-08d9e0c5d403
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 12:17:32.1348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Js5ZVQy04Xqc/5bHLUo55czNSe8UQ8Vr5VqfcjiCBubikwN9jCSiLKR44i4xhAgcaE3YYIPXM7hDaKVs2IP5kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6647
X-OriginatorOrg: citrix.com

On Wed, Jan 26, 2022 at 08:44:45AM +0000, Andrew Cooper wrote:
> This bug existed in early in 2018 between MSR_SPEC_CTRL arriving in microcode,
> and SSBD arriving a few months later.  It went unnoticed presumably because
> everyone was busy rebooting everything.
> 
> The same bug will reappear when adding PSFD support.
> 
> Clamp the guest MSR_SPEC_CTRL value to that permitted by CPUID on migrate.
> The guest is already playing with reserved bits at this point, and clamping
> the value will prevent a migration to a less capable host from failing.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  xen/arch/x86/hvm/hvm.c         | 25 +++++++++++++++++++++++--
>  xen/arch/x86/include/asm/msr.h |  2 ++
>  xen/arch/x86/msr.c             | 33 +++++++++++++++++++++------------
>  3 files changed, 46 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index d7d3299b431e..c4ddb8607d9c 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -1340,6 +1340,7 @@ static const uint32_t msrs_to_send[] = {
>  
>  static int hvm_save_cpu_msrs(struct vcpu *v, hvm_domain_context_t *h)
>  {
> +    const struct domain *d = v->domain;
>      struct hvm_save_descriptor *desc = _p(&h->data[h->cur]);
>      struct hvm_msr *ctxt;
>      unsigned int i;
> @@ -1355,7 +1356,8 @@ static int hvm_save_cpu_msrs(struct vcpu *v, hvm_domain_context_t *h)
>      for ( i = 0; i < ARRAY_SIZE(msrs_to_send); ++i )
>      {
>          uint64_t val;
> -        int rc = guest_rdmsr(v, msrs_to_send[i], &val);
> +        unsigned int msr = msrs_to_send[i];
> +        int rc = guest_rdmsr(v, msr, &val);
>  
>          /*
>           * It is the programmers responsibility to ensure that
> @@ -1375,7 +1377,26 @@ static int hvm_save_cpu_msrs(struct vcpu *v, hvm_domain_context_t *h)
>          if ( !val )
>              continue; /* Skip empty MSRs. */
>  
> -        ctxt->msr[ctxt->count].index = msrs_to_send[i];
> +        /*
> +         * Guests are given full access to certain MSRs for performance
> +         * reasons.  A consequence is that Xen is unable to enforce that all
> +         * bits disallowed by the CPUID policy yield #GP, and an enterprising
> +         * guest may be able to set and use a bit it ought to leave alone.
> +         *
> +         * When migrating from a more capable host to a less capable one, such
> +         * bits may be rejected by the destination, and the migration failed.
> +         *
> +         * Discard such bits here on the source side.  Such bits have reserved
> +         * behaviour, and the guest has only itself to blame.
> +         */
> +        switch ( msr )
> +        {
> +        case MSR_SPEC_CTRL:
> +            val &= msr_spec_ctrl_valid_bits(d->arch.cpuid);
> +            break;
> +        }

Should you move the check for !val here, in case the clearing done
here zeros the MSR?

> +
> +        ctxt->msr[ctxt->count].index = msr;
>          ctxt->msr[ctxt->count++].val = val;
>      }
>  
> diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
> index 10039c2d227b..657a3295613d 100644
> --- a/xen/arch/x86/include/asm/msr.h
> +++ b/xen/arch/x86/include/asm/msr.h
> @@ -277,6 +277,8 @@ static inline void wrmsr_tsc_aux(uint32_t val)
>      }
>  }
>  
> +uint64_t msr_spec_ctrl_valid_bits(const struct cpuid_policy *cp);
> +
>  extern struct msr_policy     raw_msr_policy,
>                              host_msr_policy,
>                            pv_max_msr_policy,
> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> index 2cc355575d45..5e80c8b47c21 100644
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -435,6 +435,24 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>      return X86EMUL_EXCEPTION;
>  }
>  
> +/*
> + * Caller to confirm that MSR_SPEC_CTRL is available.  Intel and AMD have
> + * separate CPUID features for this functionality, but only set will be
> + * active.
> + */
> +uint64_t msr_spec_ctrl_valid_bits(const struct cpuid_policy *cp)
> +{
> +    bool ssbd = cp->feat.ssbd;
> +
> +    /*
> +     * Note: SPEC_CTRL_STIBP is specified as safe to use (i.e. ignored)
> +     * when STIBP isn't enumerated in hardware.
> +     */
> +    return (SPEC_CTRL_IBRS | SPEC_CTRL_STIBP |
> +            (ssbd       ? SPEC_CTRL_SSBD       : 0) |
> +            0);

The format here looks weird to me, and I don't get why you
unconditionally or a 0 at the end?

I would also be fine with using cp->feat.ssbd directly here.

Thanks, Roger.

