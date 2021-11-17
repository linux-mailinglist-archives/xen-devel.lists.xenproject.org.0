Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C558245463B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 13:15:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226825.392115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnJph-0007Rp-68; Wed, 17 Nov 2021 12:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226825.392115; Wed, 17 Nov 2021 12:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnJph-0007Oe-2I; Wed, 17 Nov 2021 12:14:33 +0000
Received: by outflank-mailman (input) for mailman id 226825;
 Wed, 17 Nov 2021 12:14:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=74+5=QE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mnJpf-0007OY-Hd
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 12:14:31 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8e165c8-479f-11ec-9787-a32c541c8605;
 Wed, 17 Nov 2021 13:14:29 +0100 (CET)
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
X-Inumbo-ID: e8e165c8-479f-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637151269;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Wuty3OoPe4Mc2XGEFVSRWV0b2n8CO8Hl/wenb9U8GRU=;
  b=Rp/qgxkzbF9fnwhxtgWN0anfHeZBEeS4Wbdm/hiyrepKMM6VQqUGjDEM
   Pcb+5MRAcqp4xVyLC8AUVq1bOV52D4NxToQgEgy+rmSu/2oy2OPpaWIM8
   Zh2DL66SbUEyRsjh4iI4ZJmsjbdeC3FE2Ls/M+obCd+b1dh5jXbB3md45
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: K8NPgpWCCg7y7E6BdBzk1XEcP03c785C1NRrf79ZMTxM7EAOHgNTxZff7GTLieZT1S3afrFial
 yPA2uFAt/sg4UeEJE1p8+rmDi51M7e3Y6OPENbQvWnaHWJqYG2EMBgLEpTrK2eccUUxBBA38DA
 ITG9FWfsUgex0u48uqZlikHOEk//h1G7pCfWmPuGoM+1XoIDPQtDs96FwnnzfEwSQayRjfczVu
 bc0KLcH1YMtRH+4OFOUphpXSUjWwHqKtwk0cFeA9V2N/OlRzxJ8UCSBpMYc9nvSMIoD8okbTW+
 uFJPvMzsinTqIo0kXUREmVRj
X-SBRS: 5.1
X-MesageID: 58413861
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23: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
 FU=
IronPort-HdrOrdr: A9a23:xbW/kqGuM8qmAqKCpLqE7MeALOsnbusQ8zAXPidKOHtom62j5q
 STdZEgviMc5wx8ZJhNo7+90cq7IU80l6Qa3WB5B97LNmTbUQCTTb1K3M/PxCDhBj271sM179
 YET0GmMqySMbGtt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.87,241,1631592000"; 
   d="scan'208";a="58413861"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+yG+sfCTw0kqBBj7hqWctdDXsN8+fEllRnkhBIigmF7ndYEwlfdHnGkxYsE54Lmx1XogU5gMmNLAvp+b5OxSV2qXengucpm5+GyWAA1GYsWekocps5WoU5dA2Ity4pv54tzfFHb0yn1KiAAWqohn09CeFXvlJ92+L3HugvFKsYTkxYJ1kjMWTo+GGEPG9wiJXd01TqhEksdrztM5zn6acO5iXMWBzee2s9FLCwuxV9vcBYizPGXz3l4u4VEJk62F4HDzPRrVBkmYaH/bbA/XX9pJnK7H0r3kX342h0Uy1MvpYZVvyyRXSXdI1PrBrB/rfCB9unli0fu/it4qAuMmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGYkus4ocFIX4HsCTj8pbRA8p+bZmobpucfg9ICCIR8=;
 b=Bdo/uYGTgtP7XmLO9kHGwMa1hbHIC2icSD0ccqZM/64OAhstUwaO4o36Fm72gewtHvRqeYXwshB4juM/xd0UKhiJoPlmxPRHsMOLpqqX0+D7kUhJhAqfvAq7gNkaHO6bPMqj1Ei9acf7QTEUR5KMxFzHM6lBFqegtkK++EKW+UKlBT9UnHEuvvrp4sKlJkJmwtDud73UfYaPI7TkOe3c12Edq8OhHu8Gf0lKLOGhdJ8ttJVntwisrp3qVTbMuvnCjLY5kQKfmwslvqpAzOpRv506PJfvDCkzfsrlqGlQmaZib955V7LSL5E4WueA9Lrt7c7h5yy0R3FEYGzMdOODag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGYkus4ocFIX4HsCTj8pbRA8p+bZmobpucfg9ICCIR8=;
 b=K7orFhy+LAEdzP05w+PUTXRYt5CdWxZJSDJzgPehoDJzWc3iTo9vwurM7OOuSdhDurRJoVzRpSAQJQfb6RKrWkZtapVhopW8swGhXYaz1tIfuNUKrZdGP/KvNtBdpDqI1p0r4uBUeUbSd0uBnC9tTiA7L7ZWpEPgnyymZUHtRiE=
Date: Wed, 17 Nov 2021 13:14:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Michal Orzel <michal.orzel@arm.com>
CC: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>, Alistair
 Francis <alistair.francis@wdc.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Christian Lindig <christian.lindig@citrix.com>,
	Christopher Clark <christopher.w.clark@gmail.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Dario Faggioli <dfaggioli@suse.com>, David Scott
	<dave@recoil.org>, Doug Goldstein <cardoe@cardoe.com>, Elena Ufimtseva
	<elena.ufimtseva@oracle.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Josh Whitehead
	<josh.whitehead@dornerworks.com>, Juergen Gross <jgross@suse.com>, Jun
 Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, Marek
 =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Meng
 Xu <mengxu@cis.upenn.edu>, Nick Rosbrook <rosbrookn@ainfosec.com>, Paul
 Durrant <paul@xen.org>, Quan Xu <quan.xu0@gmail.com>, Rahul Singh
	<rahul.singh@arm.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Samuel
 Thibault <samuel.thibault@ens-lyon.org>, Shriram Rajagopalan
	<rshriram@cs.ubc.ca>, Stefano Stabellini <sstabellini@kernel.org>, Stewart
 Hildebrand <stewart.hildebrand@dornerworks.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Tim Deegan <tim@xen.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Wei Liu <wl@xen.org>, Community Manager
	<community.manager@xenproject.org>
Subject: Re: [PATCH for-4.16 2/2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
Message-ID: <YZTyGiP9Jy0M/4cK@Air-de-Roger>
References: <20211117095338.14947-1-roger.pau@citrix.com>
 <20211117095338.14947-3-roger.pau@citrix.com>
 <7354e1bf-f34e-c604-b126-fdbfd53afe62@xen.org>
 <0e8ab234-edf4-10d4-74ea-ddb9d1e2953c@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e8ab234-edf4-10d4-74ea-ddb9d1e2953c@arm.com>
X-ClientProxiedBy: MR2P264CA0164.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c747a79-4d96-47dc-674a-08d9a9c3cac5
X-MS-TrafficTypeDiagnostic: DM5PR03MB2923:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR03MB292361D7DBFBA3C41E807F558F9A9@DM5PR03MB2923.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PNKbSNKnLvAqdpZ6xl8ojnwUD2K1GL+n4b2h06K/MoQZezGXa0YiO0c9JiuX01nPdUAnUhGZdeetx/uUpUsncd8xpMooc+IUPT7PDUoAqLxJ70Nh88SE0QTI5Oj5orVMXhmULgHGfVy/8vsX/SDH6CPicUhImp8pz7eJ0u4TWK6FxT1u30X/BdvzWlWSt1Abay7AsgXH3uXLxzvEC+kBaUF06vvjaeaam0MKDfUN0eKON9H0nAhsWqWwl7Hx7ePI2pq+zOAO7qF/7gESmbAvhqekX7NuOA+KO6jBwyE+xbZwbPcsOAYkjdAiADcxv65wAL4WqvJ/SOV/BVdXUV7Nkbim5mMY4KwisuZGJyLky43P5pc9JnhDsiBfxoVKNNezqxyRvvopWePEMzVq5EDvALlJWlyYHjBEyMRnxvk4tNr3GepiZY2b4OAFjCXD3eNa6UMzMozNk3MUckQYYADU1LE0OwZga79RU5M7E/NolnOo0p/imrMKM4NxHVEvd4nXwdyoa+LmdSUL2lnPMEg3yo7yCfvgm4z9aRuUeGXouGF5+dSytRHJSDqEickURh/F6oIhERHNvUT+1xH47TYF25CmVFDkiRJa/YVQrpnlEfTZ7qWWZejjTcdpKwq8FWwprMvOxIVL/zSOyS7JIKBkFGny6PjA0OCxuJnwpp0MEtifO2G8SV8bIf0Ov1wzM1AH+qubpUUunVxI5Hwh/nCLeTnQ+atRe+6fcjco7VLoTmwD+SbTQ2czZ06Kv3R1lSRDft+WyX5gVQnccvFAS4fgC7ENJlxRNKLsvsl1NuMV/ojrHVBj1oY3hidPpoE8R0yc3MbfE/DEkbxF7/TjuVwvUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6486002)(6916009)(6496006)(26005)(66946007)(83380400001)(2906002)(8936002)(9686003)(38100700002)(33716001)(8676002)(86362001)(956004)(66476007)(66556008)(5660300002)(316002)(54906003)(186003)(85182001)(4326008)(53546011)(7416002)(7406005)(6666004)(82960400001)(508600001)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3lld1BZQ1ZGNldZQS9VUElteDFhM2hjRllTalVMeXQ0U3ZDWnp1azU5cU1U?=
 =?utf-8?B?eVVYNmlYUlZzZ0x5SmlyRjE0aWVQSEhkdXJRa1J3YzNhcEVma21oRk9jVWVu?=
 =?utf-8?B?QkVEdWNwMnFONS9td0dUVWlTeVY1V1dzNmdKQ3lGM3c4Wmw3U1Q2T1dnQmhj?=
 =?utf-8?B?eC9JZ1NOR1g4b0dpc2Y3MVJvS0RkR2NaZ28zV3VQZUFObkVsNk4zNlhSUExH?=
 =?utf-8?B?TXVIbUhUcHNNd0JNSERFbDhORm5JTGpCMWNldzR1TXI2QW9aNDFkSEJPWDIx?=
 =?utf-8?B?YXpLSm1QOXg5SWZwNlE2bWJIYjQyTktwbGllc1ZxRERnSmdzS3NDaGt6aXFo?=
 =?utf-8?B?MU9WMEs3dGUvb2ttOWxSQis3aThFWU9laDIvczRDNEMrRkJibU5PeWNISEEw?=
 =?utf-8?B?WXFtVWNxbllGcnc0YnIrL3BKTXdRYkNNb1RROTVRTUdpWEx5cHJlM2p4NE9q?=
 =?utf-8?B?RWpUTTRsNk43dHlPY2NCZWVJUkNJRlJoVGt2cGlwOG13b2FXV0ptN1VNaEwx?=
 =?utf-8?B?WGtaMUIwdFliZXZCVnVRN04rUGNPMHpyN0xTa1MwbkUveGNLMXlmaEF3K2pj?=
 =?utf-8?B?Qm05MHZoQXJUZnNyRFBwdzFGaFE3Zk1nMnh5UlZ1N3N4S3RpNmtzZjlUa2VW?=
 =?utf-8?B?WmFBTGZHOVljR3o0SzZYeHEvVElmeEVTQTJtanRKaWRsQm1ob01hUUZXTTNn?=
 =?utf-8?B?cTRtaGZidHVwVVRtcERabGtubnYxMEMvZ29pbEc1WllDSElhSHJJQ3IrZnBv?=
 =?utf-8?B?WEx2WVk2Ly9JNlJyNjJjWkdmOVZuTjRLMzZ2YWZuOHZ6QXd2TmRKSlJXSWxv?=
 =?utf-8?B?RjNOaEc2ZUN6aFdxbjFDdW5lRWVqUUxiTWVheGNHcjd1TllBM3hsM3h0SHVO?=
 =?utf-8?B?ZHhaajhPOGYrQUpVd2l6NHpzNjd6QzlsU3R4Z2lnMjFMZnFucGoxMEhDbUF5?=
 =?utf-8?B?RldxNVdTOU9SdlBZTzVneUxjb3hOZnVyM3I5Tkg0bGJRMFN5NTJvVm12TU5y?=
 =?utf-8?B?cFBFK2d0T1paMi9La3c4VWJmY0pTcDlmeDdoVk5nOXhnb1o3YUsza3BENWFD?=
 =?utf-8?B?dGZ4Zm9VTHRtTVpESXhCYzllODFyVmtHNUtPSk5iUnpJSmtkT0ErQTJvc2h1?=
 =?utf-8?B?WVdFOTJDYVNjdjdZcnVkUDhNeVJ0VG1LN3dVZWk4QTcrOEZHd0d0Q3FqdXJz?=
 =?utf-8?B?QWVDSFZCVXlaUzZsRTVjRi9HWmVFWlM5V0lWbmZRdmdUeS9Fbjg3NFpNeHZa?=
 =?utf-8?B?aytzd0t2Ymhrbk1jZndPWDZCU2U1S29ROEJVVHVtWWdiTk5tMm9nS29Jd2ZX?=
 =?utf-8?B?Z2F4Z0YwVi9lZEJsN0xYenhFWitESWxYK3htNGVrbzJnOHp3cEQ3alJSdmNm?=
 =?utf-8?B?VnZYbXBTZmxERlFLWll3ajZsWEdmM3pKdU5Wa0thS0dlVWJ4MWlJeE13WWFM?=
 =?utf-8?B?cy9UalQ2UGtxMkEvZ3lwS1NpaWxUaTdkTGt4WnZMOXF6akVjTlQ1MXJNQnhI?=
 =?utf-8?B?MndkY2RDR1pqYUd6V1FvdGhyV0RGWjNyN2ZPOWxmbXJicnh5VU00ZDdjWUJ5?=
 =?utf-8?B?SzZubzRXWnoxRHdoZjBLN3FyR0NHbWd5MUYwWmZzSUVXWGlKZWZRYzhrY0Zs?=
 =?utf-8?B?ZkdQTk1YL1VPdTNDUFNCQXhsN0JvSUdZeThiZVExdmVjNE1SLytiVVpJL01D?=
 =?utf-8?B?R2g0VzNQNERBQmZ1eGw2RDRSOHVReGJ6OEFoL09HZEZEaUZxenAyVWNEeEV0?=
 =?utf-8?B?Rzl6bVUrOWlTQ3Q2YXpEamprTkx5NVJBOHI1OGptbGNVOWphZG9VelpUZjVq?=
 =?utf-8?B?V3VtdXd3YXhpbGZ0RGpSeXNVNlFLeGVBK2wyd2ZNL2xLa1ZUOVRyZkdwWkZl?=
 =?utf-8?B?SFcvbnlGNE9saFFZRndreHA4Znl4cFg3c2Jtb3lzaXoyUHh5Uk9nMFFkaUNw?=
 =?utf-8?B?NVlyOXRIRkF5VlViMjg2SklqWFYxTmZyVHg1MjBxa3g0VHdsb1k0RlBWd0pr?=
 =?utf-8?B?Rm54WFB5NTM3aHlnRyt0VUZKV29UZVRNdWxrL0s1ZzNhU2xlTWs4dW5OQUpM?=
 =?utf-8?B?MkhXckdVRDh6b1A3bFR5L3BjeGl4MTJ4VW5VbXFieW5EeTF4am1JOUhMcXFP?=
 =?utf-8?B?NlJoZ1FJakVhMCtvQzd1aEhWRDFZOFlNSzFQT3JBM3lxNXRzQ3lPc3ZOZVMr?=
 =?utf-8?Q?A6LMsfFx0iu7PTJcSkoNuNs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c747a79-4d96-47dc-674a-08d9a9c3cac5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 12:14:23.7159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2U1Z90kpuUZlKhwoFe2d+mu8eXj5OgjXs8OWl00RVbwLzqgJ80pNg0x4oGN8tRiFpV+tHBYAzDMFn2LPBc9/6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2923
X-OriginatorOrg: citrix.com

On Wed, Nov 17, 2021 at 12:44:25PM +0100, Michal Orzel wrote:
> Hi,
> 
> On 17.11.2021 11:00, Julien Grall wrote:
> > Hi,
> > 
> > On 17/11/2021 09:53, Roger Pau Monne wrote:
> >> Document some of the relevant changes during the 4.16 release cycle,
> >> likely more entries are missing.
> >>
> >> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >> ---
> >>   CHANGELOG.md | 11 +++++++++++
> >>   1 file changed, 11 insertions(+)
> >>
> >> diff --git a/CHANGELOG.md b/CHANGELOG.md
> >> index ad1a8c2bc2..8b0bdd9cf0 100644
> >> --- a/CHANGELOG.md
> >> +++ b/CHANGELOG.md
> >> @@ -21,6 +21,17 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >>    - qemu-traditional based device models (both, qemu-traditional and ioemu-stubdom) will
> >>      no longer be built per default. In order to be able to use those, configure needs to
> >>      be called with "--enable-qemu-traditional" as parameter.
> >> + - Fixes for credit2 scheduler stability in corner case conditions.
> >> + - Ongoing improvements in the hypervisor build system.
> >> + - vtpmmgr miscellaneous fixes in preparation for TPM 2.0 support.
> >> + - 32bit PV guests only supported in shim mode.
> >> + - Improved PVH dom0 debug key handling.
> >> + - Fix booting on some Intel systems without a PIT (i8254).
> >> +
> >> +### Added
> >> + - 32bit Arm builds to the automated tests.
> >> + - New x86 pagetable APIs.
> >> + - Arm vPMU support.
> > 
> > I would add "Early" or something similar because this can only work in a constrained setup.
> > 
> +1.
> I would say:
> "Arm early vPMU support for guests."

I've used limited instead of early, as using early could be confused
with early boot support or some such IMO.

Thanks, Roger.

