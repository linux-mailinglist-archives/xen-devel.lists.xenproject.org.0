Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA4B4ED6E7
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 11:29:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296792.505318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZr71-0005dk-UL; Thu, 31 Mar 2022 09:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296792.505318; Thu, 31 Mar 2022 09:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZr71-0005bA-QR; Thu, 31 Mar 2022 09:29:03 +0000
Received: by outflank-mailman (input) for mailman id 296792;
 Thu, 31 Mar 2022 09:29:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDhN=UK=citrix.com=prvs=08274bcc4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nZr6z-0005JJ-U7
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 09:29:02 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff151923-b0d4-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 11:29:00 +0200 (CEST)
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
X-Inumbo-ID: ff151923-b0d4-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648718940;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=2Ob6Rz367wwRVHC+LJMyl5Oz1gR/d/o7lJUHswT1iF4=;
  b=ewp7ATgmremqOLBMOQ2XREv9eP4J9aPw9zjbw6xwDyILJ5tTVY1cnuA7
   vxA3VPewWLiK6u7ZKxhUSzPmc8/BwsaqCUTcaAT1m3oiNha/8BWHGh7Nr
   ebVsvUUh4Pb9EruQktmNTIj9+5AwEMwghdifdiahxEbqBknBFpHvBUl1P
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67633838
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qt7wsaLzIXEvAJ7eFE+RxpUlxSXFcZb7ZxGr2PjKsXjdYENShTMCm
 2FOWm7QP/jcNzbyKNEgPt/n9RgDvZDVzd9nSAVlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2dUx2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NNp6My1cSUWBfeWoPkGSDIHHCdOP6ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glv2JsVTa2OD
 yYfQRtxaUzMYjZIA3VUE74ahdiohFrnfwQN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wp
 GjL4mD4CREyL8GExHyO9XfErv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCsuDpBC99oMdIBslu117HPyFmWAFgGQWsUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZow7eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl4hDGJGT9bxgbQ+0RqmBNzDJrVml
 CJY8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9IdAOvmwheh00bZtsldrVj
 Kn741k5CHh7ZibCUEOKS9jpV5RCIVbIS7wJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyikEsHCrSkMniKqeb+7zkidBAGOHw/kOQOHsarKQt6AmAxTfjXxLIqYYt+mKpJ0OzP+
 xmAtoVwkTITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:pMFkz6yRVEyAPOSPp0M2KrPwKL1zdoMgy1knxilNoHtuA6ulfq
 GV7ZAmPHrP4wr5N0tNpTntAsa9qBDnlaKdg7N+AV7KZmCP0gaVxepZjLfK8nnNHDD/6/4Y9Y
 oISdkaNDQoNykYsS8t2njbL+od
X-IronPort-AV: E=Sophos;i="5.90,224,1643691600"; 
   d="scan'208";a="67633838"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klmzBhd9T1gU8RgFDkdRZrsVbVb2Bge91BowZBamhOkftkFm10HS1vgEXpK+jtWy6euxu3XFpdYKcDnemGMRxxzbte2YRzqR0NBptX92XW/3hObmmK/4CjEitQc93y5jPbuPZYtXRdrqt6U9G5zYxNZ8f6CwpRAqKyPBrAzpoag8Vxw0nte2B1yWqp0+vvi0+5aeUL0uQvqpon2CqAkLGTNnnrs/34jlhxhLVIY4O6cBBKHdrcBJnfWJWFdJsFz2gHYNq0TuzZNxTN67ikZrr/rZ3FHY5NHID9csoJN80Z6JYF3JayoQbDc/Zx6k6zrF84rc3RazZuolChh8LBaIvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAw124Di0ueDnIBDAjnts+YHpoOqLIJr7FiTknmZajY=;
 b=B4RSzIuLkR071UPcdoMK3C2OvIncCTrcbqfkV6wDwnDtxV9Dc7iKs/ndMMSv3suWu/BLmCCNJSmcXx+cMUXd01zEksteGnZG/n4M9XKXVZDDlYb8arL5mowFMHFmQGWZ4gt/9E2NWz+S+p80FSPze6p3UpBQ8ia7d9X1gRavOdzHPnOMW3YpYPIqt3OgxchZSaI0ntz3Nfac6jK4fo7T/xYrhXL1J2CQ/CcYogzaa1CD/FAKGxEgEpTB+J+WBSAGhmpfQEDSXdjglYc5ohV6MqUttOClcBBbhTQ6/Q59bKM97jNFfTIW1CsctsD4ZdnJNSUAzFnFUpIlPnMEi/jvVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAw124Di0ueDnIBDAjnts+YHpoOqLIJr7FiTknmZajY=;
 b=g66nZMAOx86LoUNa2fTd+cpe7chKwb3x8YzuRp0U85rt7zckZ/XCuwNLSNDcI0rqfeeRYZOp8prSwdlq62uzS+tvc5Ya4LbabgC0XEvb/jfAlVjydpdna/KQMHyJJmmTQJGPUXRnkL1bAWnfRNs8437WB6RPlwXC951zTqKNP9M=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests on top of SPEC_CTRL
Date: Thu, 31 Mar 2022 11:27:15 +0200
Message-ID: <20220331092717.9023-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331092717.9023-1-roger.pau@citrix.com>
References: <20220331092717.9023-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0036.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e04903d-2b98-4a66-fa54-08da12f8e0ca
X-MS-TrafficTypeDiagnostic: CY4PR03MB3112:EE_
X-Microsoft-Antispam-PRVS: <CY4PR03MB3112B490074BC66D68429EF28FE19@CY4PR03MB3112.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: meX2XbDLk0A4P4S7LfhpSLpxaADbMNtMpEahh6tDvH+6AbFPvBsOx4e2prR8R9Fg/qGohkeVZ3oX0h6MxpTIP9pT8pSXD1aXq9iy0fXtXC6mF1rMPhTgSORQp1yG7DoMwIISywiYVeVHjPPfoiy8okG3UB5aVhjj2pB9yqb1J3orBLXqKptykxvGm8A8awbGivMmZvsIPjrMfujvuJmCEVJyYP+kjE7LQWy787M3Abnu7qvKBzGO6K+PY3dUV6Yw7uQ98cqRJE8KDb9klUeA7NZXz39MwrTFrmHZPOrNpzP1Psg26nqXM1OY8/OtKxDkdtIH4wBIuyh90EvHRDjzKONEyAn+A2PRXiA5Cc87JCWgmUg9YP0N+4ouRK5jNifFspxTsABY+4ndCl4i6Lo9WB5OBP0Xvnj9XbMZsuQJoA9mp/DnEZ7LpzVQ+3qeidyN6JXO5Vl6qyOaJ4d2DwzoKLIADkDOX4mwfxTMDd8s4g6+Y/s2h37d+4r12ujx7Lm9L8a4VaX2TUTcCLCbz+kUkPt6fUl1AdtKp2GMDieN86z2UDj/mXj9gQStJViI3TOvODAB+ssut8AfNgKEJjMfEejx4w4+L2kmI3zPj9WOCspDigERe9VrcdcLerlxs0hOWGeomQXLyVTdw2gQGIutHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(186003)(1076003)(26005)(83380400001)(2906002)(6506007)(2616005)(6666004)(66556008)(5660300002)(54906003)(6512007)(82960400001)(8936002)(6486002)(66476007)(38100700002)(8676002)(6916009)(4326008)(86362001)(316002)(66946007)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTNoNlhxRko2eCtBSkpMd2ZLK2hrSVlzU3dDZVhrTndGRTVXWE5lK3hBeXBB?=
 =?utf-8?B?ZTJlVE5QcGwwUWgrYXFYeUVuVjQzcDdXNDJsMHExR0JhdnJia1BFQmxEdGVz?=
 =?utf-8?B?VkJPalBOQXVMTnNpY1J6dGdCR1pLaVp0KzM2Zmd0T2cyQ2J1dUc2L2dESGhU?=
 =?utf-8?B?NlpsSXMxUUJLckNjcnkvdWI4ZjB4MWp6NUV5V1VjMlJtRkRHQ3BTR05NaVVn?=
 =?utf-8?B?d1FEWmhFdUVwaVZodjRHbFhJeFdWYjJiUUppakxpcWYyUCtvdmVqRFA1c0Fv?=
 =?utf-8?B?THZXZmhDR3NGZU1JVm04L3VRV3ZEcUc1a1dtVGN3aDBTcXlDWkw5UjN1Zm9C?=
 =?utf-8?B?OWJXbTJITnMrTzRsR2Z4R1IxTStSTWFSajZTVXkvaEdSRjZmYnh6OENYKzRI?=
 =?utf-8?B?eUFVWXlvalJHSWJnSFNoL2tMSWR0dGhxZUx5RmZoa1NYN2pSODg3ZTlDS01L?=
 =?utf-8?B?SlZrelhSb09PYnZpUWVsRm5NREhhTmQrczFhQVBrVk1HTDF0RkZ0WVNmTlY0?=
 =?utf-8?B?U1lqbkkwV0ZWYjM3aWU3NHF3aGZwNVl3SjMzckJGZTZ4MExzSXNldEhrRFM3?=
 =?utf-8?B?OVNjQWdCWTJCZDA2OU9ueHJMTWRvNVlrT3pUSjE3Uzl3SGNvSDFYSDA1UmxL?=
 =?utf-8?B?SnJyRDV6aHhnQ0pvK296eVI2S01oN3R3MnZLbTBKNGJBYUQrMjE2N21zL3FY?=
 =?utf-8?B?ajVCUXJTOEFLSXRCT1BiS3A0TVlNV21FMHRmWW52VEdpQmlOWHAxT2ZIZnlv?=
 =?utf-8?B?TXVpckNyVW5Xa01VVVkxYU1sN0dDZzZsaUc4N3ZpaWFJYmxxRnNvYk50V2pJ?=
 =?utf-8?B?dlAxZFNqRCsvYmZQQ0FSSkRRUnNEVnZXQ2cwci95eS82T1VyVi9IdWpDUUhX?=
 =?utf-8?B?Y0dIQWdNVTR5ZEtVUlJjZGsyRDd2NnppS0N4ZmE0Qi9wRWx6S1lxemVHNExl?=
 =?utf-8?B?NnZpdkVxc3M4eFdBcWFTTGgzVjZOMGdXb2w2bDN1RWQrODg5TDJTeVd0K25S?=
 =?utf-8?B?TEJIQmRhYzhUdHZmL3FPK0k3Q0NDa1NiUHlKb0dYVmcvYjRJdVdvMFhxSXpQ?=
 =?utf-8?B?T0k5eE5GM1NVMTRSTkVTL1VkQ2h2OHRHZ0UvT0hrSTE3YnVvdmExT0gxTE84?=
 =?utf-8?B?UFV6OThvYnMwZmkyamQ4Z3dIYzN1WFg0cXh6TENOT1ljcUxuOFZhTWlwVDEz?=
 =?utf-8?B?RUEwNDJJcTVZaDdTclh5WFB4eTRNeFFYQzhiRUpIR3FCamNuUEVNalRLTjd1?=
 =?utf-8?B?UmY3TXc5RUJvenMwN1ByTDZVRHdWdDFiRG5uVVlMbHYyb1Q0Ym5pMEdrK0Ns?=
 =?utf-8?B?QTBpWlJaSWdUbUduUnZzSFVhYnBMNldpTlRLQmNmalh0ZmhHL2FDR0RwV1ls?=
 =?utf-8?B?aGJFcG80Ym9KOVBTcFRuZ2FRNVFyUVRMTzZ0TmlhVFVDbVZQSjRwNUNkRlVy?=
 =?utf-8?B?RzJ1R1pXTk92czVudHhPbkc2bVRhbVZJSWs5dFd1ZXFiQURaL042OVRjUmtx?=
 =?utf-8?B?ZmpHN0taUVppcExaeEZnSCt4NjRkdVlwZGZsbTgwb2lPdHFJSE1LbFRDRzRO?=
 =?utf-8?B?QVFrL0R5akRZUURQaXpyMzVreHlRNDFNTkJhVnNlWlVvRktpdHV1U05mQ1ZZ?=
 =?utf-8?B?ZVgramgraU9GYUVZZHZCM1Z6OVladFFHdDk0OStnUE1vTWI4bnVOVVdnWUZ3?=
 =?utf-8?B?UEcraDNqWnhaMjdRTGpHY3dkdW5INkowQ29WSUtGSFJZTXF0Q2RER0xxZkJo?=
 =?utf-8?B?RE5qeGF0enl6aGtVcGo5U05RK2ZJa1IyclkrQ2V6VzZyckVFYnN2d20zV05n?=
 =?utf-8?B?bVRHdEZubXZDamh0aFI3Y2FnellDSzYyK21mTDF0emJRNnVVM1lFdVQzTjkx?=
 =?utf-8?B?YTFFTUszRTBhTzJtWEZla0NLNUs3QkE5WVVUeXNEejlmN01WamtubkpjbFJM?=
 =?utf-8?B?NXhVZ2JKZEZIR0I0N1Q0QWNneGgzMW04SmNNMUFPTldlM3dDbWYvS3lMdWdM?=
 =?utf-8?B?cVcrMFhHN2VSY0xIaXlFeWJ6RE41OFpYRTlxWER1OERPUE9LUHd0ZmdDZ0E4?=
 =?utf-8?B?NUU2THBxdG5NNFJLckgra2hJVnJYZGZUelU0a2U4RVphZCs5djRJQmpacUJs?=
 =?utf-8?B?dEIrVXo4cEtMZGUwQnd2U0F3YVI2SjNkVHZKRmVEbWZQV1JUVVB1TUZvQ1RV?=
 =?utf-8?B?YXhNMWVzNi93MnBLSmhXdEdIQTBwR01sdURwOHU3Rzk1cHhhbWRpaHhiQkd1?=
 =?utf-8?B?c0xSa3FabmhOUDNQUlNLOWRnV29aaHYvcFNvTEJBWkRlck1RbHBRajJYbit2?=
 =?utf-8?B?RHZTSGN5dmE3ZFRkVGwwWlpXK2d1MFo4di9yUGVpOFRNdzg2TU5NSjBjeEpU?=
 =?utf-8?Q?Ps8COybistSExaDo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e04903d-2b98-4a66-fa54-08da12f8e0ca
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 09:28:56.0197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FrrJy8P635X6O4K59ArvK+qSizY8erekNUxDZ2glAvkIoUJptrWp86BKefLwFg+/MPTdrn1fHFgX+6NarH0qWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3112
X-OriginatorOrg: citrix.com

Use the logic to set shadow SPEC_CTRL values in order to implement
support for VIRT_SPEC_CTRL (signaled by VIRT_SSBD CPUID flag) for HVM
guests. This includes using the spec_ctrl vCPU MSR variable to store
the guest set value of VIRT_SPEC_CTRL.SSBD, which will be OR'ed with
any SPEC_CTRL values being set by the guest.

On hardware having SPEC_CTRL VIRT_SPEC_CTRL will not be offered by
default to guests. VIRT_SPEC_CTRL will only be part of the max CPUID
policy so it can be enabled for compatibility purposes.

Some reasoning regarding why '!s' is used to annotate the feature:
 * '!': the feature might be exposed to guests even when not present
   on the host hardware.
 * 's': the feature won't be exposed by default.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Reword reasoning for using '!s'.
 - Trim comment about only setting SSBD bit in spec_ctrl.raw.

Changes since v1:
 - Only expose VIRT_SSBD if AMD_SSBD is available on the host.
 - Revert change to msr-sc= command line option documentation.
 - Only set or clear the SSBD bit of spec_ctrl.
---
 xen/arch/x86/cpuid.c                        |  7 +++++++
 xen/arch/x86/hvm/hvm.c                      |  1 +
 xen/arch/x86/include/asm/msr.h              |  4 ++++
 xen/arch/x86/msr.c                          | 18 ++++++++++++++++++
 xen/arch/x86/spec_ctrl.c                    |  3 ++-
 xen/include/public/arch-x86/cpufeatureset.h |  2 +-
 6 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index bb554b06a7..4ca77ea870 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -543,6 +543,13 @@ static void __init calculate_hvm_max_policy(void)
         __clear_bit(X86_FEATURE_IBRSB, hvm_featureset);
         __clear_bit(X86_FEATURE_IBRS, hvm_featureset);
     }
+    else if ( boot_cpu_has(X86_FEATURE_AMD_SSBD) )
+        /*
+         * If SPEC_CTRL.SSBD is available VIRT_SPEC_CTRL.SSBD can be exposed
+         * and implemented using the former. Expose in the max policy only as
+         * the preference is for guests to use SPEC_CTRL.SSBD if available.
+         */
+        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
 
     /*
      * With VT-x, some features are only supported by Xen if dedicated
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 709a4191ef..595858f2a7 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1334,6 +1334,7 @@ static const uint32_t msrs_to_send[] = {
     MSR_INTEL_MISC_FEATURES_ENABLES,
     MSR_IA32_BNDCFGS,
     MSR_IA32_XSS,
+    MSR_VIRT_SPEC_CTRL,
     MSR_AMD64_DR0_ADDRESS_MASK,
     MSR_AMD64_DR1_ADDRESS_MASK,
     MSR_AMD64_DR2_ADDRESS_MASK,
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index ce4fe51afe..ab6fbb5051 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -291,6 +291,7 @@ struct vcpu_msrs
 {
     /*
      * 0x00000048 - MSR_SPEC_CTRL
+     * 0xc001011f - MSR_VIRT_SPEC_CTRL (if X86_FEATURE_AMD_SSBD)
      *
      * For PV guests, this holds the guest kernel value.  It is accessed on
      * every entry/exit path.
@@ -306,6 +307,9 @@ struct vcpu_msrs
      * We must clear/restore Xen's value before/after VMRUN to avoid unduly
      * influencing the guest.  In order to support "behind the guest's back"
      * protections, we load this value (commonly 0) before VMRUN.
+     *
+     * Once of such "behind the guest's back" usages is setting SPEC_CTRL.SSBD
+     * if the guest sets VIRT_SPEC_CTRL.SSBD.
      */
     struct {
         uint32_t raw;
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 01a15857b7..72c175fd8b 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -381,6 +381,13 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
                ? K8_HWCR_TSC_FREQ_SEL : 0;
         break;
 
+    case MSR_VIRT_SPEC_CTRL:
+        if ( !cp->extd.virt_ssbd )
+            goto gp_fault;
+
+        *val = msrs->spec_ctrl.raw & SPEC_CTRL_SSBD;
+        break;
+
     case MSR_AMD64_DE_CFG:
         if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             goto gp_fault;
@@ -666,6 +673,17 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
             wrmsr_tsc_aux(val);
         break;
 
+    case MSR_VIRT_SPEC_CTRL:
+        if ( !cp->extd.virt_ssbd )
+            goto gp_fault;
+
+        /* Only supports SSBD bit, the rest are ignored. */
+        if ( val & SPEC_CTRL_SSBD )
+            msrs->spec_ctrl.raw |= SPEC_CTRL_SSBD;
+        else
+            msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
+        break;
+
     case MSR_AMD64_DE_CFG:
         /*
          * OpenBSD 6.7 will panic if writing to DE_CFG triggers a #GP:
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 1408e4c7ab..f338bfe292 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -402,12 +402,13 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
      * mitigation support for guests.
      */
 #ifdef CONFIG_HVM
-    printk("  Support for HVM VMs:%s%s%s%s%s\n",
+    printk("  Support for HVM VMs:%s%s%s%s%s%s\n",
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
             boot_cpu_has(X86_FEATURE_MD_CLEAR)   ||
             opt_eager_fpu)                           ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL" : "",
+           boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_VIRT_SPEC_CTRL" : "",
            boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"           : "",
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
            boot_cpu_has(X86_FEATURE_MD_CLEAR)        ? " MD_CLEAR"      : "");
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 9cee4b439e..b797c6bea1 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -265,7 +265,7 @@ XEN_CPUFEATURE(IBRS_SAME_MODE, 8*32+19) /*S  IBRS provides same-mode protection
 XEN_CPUFEATURE(NO_LMSL,       8*32+20) /*S  EFER.LMSLE no longer supported. */
 XEN_CPUFEATURE(AMD_PPIN,      8*32+23) /*   Protected Processor Inventory Number */
 XEN_CPUFEATURE(AMD_SSBD,      8*32+24) /*S  MSR_SPEC_CTRL.SSBD available */
-XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*   MSR_VIRT_SPEC_CTRL.SSBD */
+XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*!s MSR_VIRT_SPEC_CTRL.SSBD */
 XEN_CPUFEATURE(SSB_NO,        8*32+26) /*A  Hardware not vulnerable to SSB */
 XEN_CPUFEATURE(PSFD,          8*32+28) /*S  MSR_SPEC_CTRL.PSFD */
 
-- 
2.35.1


