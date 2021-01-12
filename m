Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1155F2F32B1
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 15:12:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65693.116413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzKOA-0005Df-Tq; Tue, 12 Jan 2021 14:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65693.116413; Tue, 12 Jan 2021 14:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzKOA-0005DG-Qa; Tue, 12 Jan 2021 14:11:14 +0000
Received: by outflank-mailman (input) for mailman id 65693;
 Tue, 12 Jan 2021 14:11:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=59Pv=GP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kzKO9-0005DA-7V
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 14:11:13 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aeefcf1a-463a-4cf4-ac5a-5bf8bf8211f7;
 Tue, 12 Jan 2021 14:11:11 +0000 (UTC)
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
X-Inumbo-ID: aeefcf1a-463a-4cf4-ac5a-5bf8bf8211f7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610460670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2++iFE2eOlj9I/axhWtfsKHARHPwyEaSRM6w8gOsqKo=;
  b=aJbxEYM3KBvN4aX/ERf5G77uMTx6TGQXe+rIQsbErIofr2QmldT7zSWs
   iWxirgDofODrH2YIQpyP4GEqWlzjwpzBzbRsDEUQeRIyKkmaTTfliJvZV
   5nxAAfPl+2SNwoXBPqfrJeKB5yx+5rMyM6RmhwSdZ3mYIChPRpS3pNDiK
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xzP3YzAB91Log+gq0v/GmGyGGOW/OYSwhiB8SXufBN0RS+OZEY/NfdigR0ovnJOeZvjFsuNym7
 dz22e5cVTUDto207XZgzSRVm6oPb9ob3WgI2Do542BzT5eL/uDfWZRmWI49Pd/7Sq2S3nEaiZu
 45ciAtWr5fkVyrn+TKjHhsY7KYJXpfi1j6aYMezmo54mjlVMuRgcUuk4wd/0z5gRG62IMej0M4
 JHWxSIKCPGKaYFK9Ymj8Md5D6/L9Ss7yvrNWp9QYc6ddDkfB2UKFX27MMX59eeAaXH9fQpx9S0
 NWU=
X-SBRS: 5.2
X-MesageID: 34959523
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,341,1602561600"; 
   d="scan'208";a="34959523"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OjpwG/O9Tb3Ghavnx2bUZ3HDQSHE+n2PuHpotg23m9OeBpqRfwkliYJZFO4/TCxc3tSUWcXa8ZogGSTF1Ctc5aXE/WtMHgim2GqsMdkEAtZro8h9X8nQbyELWmCsxgSaPS2pJwLFApCtrSO2dGvraaJKYpfHuUcxJqzxvUsbqzl7yBMYuCRofC+lHrGiD2z5+FMogWLZkOnZPPzinUcNiGm7KbD5KjlUNGru7Xyn/w6n8/8O9LG1k7QdudBK3UNENuLYjw9ecKBBhU3SdLQ9P3bEbKRAexK9G0kjAMniyhMQE3cnQDn2WGzVQ5kJj5bPC6sT8XN1mIIyfR31vQf+Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2++iFE2eOlj9I/axhWtfsKHARHPwyEaSRM6w8gOsqKo=;
 b=WwWrzmemhQCAxzfZAf/ssFbI2J81n2qBUXWstiWoSa06OybswUmHI2px9lmRAqqSBhdorfioPXQecvmqw0ueGAxgCZe/pU+Nv3bbWZJsuFx+25XrVtyKRzCcYxi0VTPhca7prh6NaAhCAYQiNfDH5FSEEWye0T3N6PAiAHLUB00grVznRdrNxKB5721XEM3wv8swdjXBFX9aSFh9pfm6lwn2c3G4QocDXQY4mjxiOgpRDP3Z5r77cNOVtkC4x2aU28qgNN35dGCUqIMEa+Mx+89c+z4ohpfDfvGc9EycellxBvr1RlnF4y05nFefvfvOL1zENaph7CJY/4o6/cJUtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2++iFE2eOlj9I/axhWtfsKHARHPwyEaSRM6w8gOsqKo=;
 b=OPSZg63BdMkAbwGkcvo/2ikSxTMhcxauaaDooc6zyQcvXKI+OB7Ub/UN+Mi1MoI0Ul1yshvPXEmjCZCqJmzT1NqET11xei4+w7dYc7J8lcmI7a/AZfz3wjxrM4CNBfPji4jas1C8q1EEgZv27jgMY/kRm45CRVgQO/KWD3THJaw=
Date: Tue, 12 Jan 2021 15:10:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Qing He <qing.he@intel.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Roger Pau =?utf-8?B?TW9ubsOp?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Purpose of translate MSI interrupt into INTx for guest passthrough
Message-ID: <20210112141057.xjbslkq2em56kk3r@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-ClientProxiedBy: PR0P264CA0182.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47445f96-cb97-4102-43a7-08d8b703e596
X-MS-TrafficTypeDiagnostic: DM5PR03MB2714:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB271463511D371B13CBFC853E8FAA0@DM5PR03MB2714.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 98MMVSVTqvm0xvYk6Tvd9y++gMRIQ6DFR0tkCIefVGnTW0RgasfHVrGnEerSWKK4+rGHJpuS1c6pCVDgQXD2lidEZ4p5ic94vdkkw/QifOfcDmkh3tj48kdR5k+RUdjBI4MmvjbNFXQKwcdeuS4qpQa5TXBCOOAVuOMrN6r4PvmtClbPLqCtMoMa7hAsr7kLXhkIHNG3JY8w/mq6ZoY89hym5Hhg3C5PM5fncTsYbAGJU52tJVQtBdAKfkYVb/vJGdbbK0sjc7uQm9PRjhFh+YOo+X8arojf/ZGnF2rqIk1KvyEvrmZWlELGyJoaj0V86vaBe3fJQd30pK6TK/6i2HEhRVdgr5vtPslW8s4sx+gHC5zndMUI4ZoEpOieDNPdhPsbjt+degpjFHTJK6gkVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(396003)(366004)(39860400002)(136003)(376002)(6916009)(316002)(54906003)(66476007)(478600001)(6496006)(86362001)(5660300002)(16526019)(26005)(186003)(8936002)(66556008)(956004)(6486002)(66946007)(85182001)(4326008)(4744005)(8676002)(2906002)(33716001)(9686003)(6666004)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?djhjU3RhWUlOQTRScHBHYmlmRnRBK2xRZWNDZWhjblJ3NDRvNVRVbGVJQSsz?=
 =?utf-8?B?bUM5QkNta2IzSFhHNDg3WnNHUnpzNnlHbjJ2bnUrNVdremNWNFRnSnJzR1JS?=
 =?utf-8?B?bittbEZCOWdsZVpVemJFMGFiWk1YV1ViT2NtYnpVTGI4U1JzNlJrVlpWNE5O?=
 =?utf-8?B?L0ZqSkFEVDZVSGg1Z1JEVDBrM2lFZklLb1ZORW0wcmMyS2p4Tm5HanpYVzNy?=
 =?utf-8?B?NlYrc0JDREZYMzRzNTg1a1Q3V052cFpBcFFZaENObER3OTNOYXNkYUdKQmNF?=
 =?utf-8?B?anhqTDQ2dk1VMGl5MXFBNWRGY21EdW1sYzhDR3NuUXgrT1NiNnlaYmNsbHRR?=
 =?utf-8?B?YXFJd2t1eFMzTW9nWnBwRkNhSGlsMzd5VGxiSDcrMmU2aUtrTURqenBlYVc0?=
 =?utf-8?B?eXhibkpxa0FYaWhFUjlsd2tsYzF3Q25qRmg5dVVCMS9ZRldRSDF4ZGR2dGNn?=
 =?utf-8?B?RUF0U3EwQU01VkRhQ1FHU01xOStVK210WTQrckZkVndtQTdyemZ5RlQrTDF1?=
 =?utf-8?B?MDNtUWMyS3YxOUovem53OUlGcHp4QUYxcmVaY3VHTG5Dako3YVhTY1ZIYlpS?=
 =?utf-8?B?UUJqbmNwbUJvQ1BWUFl2bURhcitHd0FqaVRXb3hSNU9ORWtDS2w5bnpRMG1L?=
 =?utf-8?B?OVF1cU5DQ05KNWkvQzlOc1lWd1J0dzEwOXBEbHJoLzdyd2E1ZUkweUQvNjdS?=
 =?utf-8?B?aVNjckd2aFFvcUZ1NG14SU50KzNiZFpjVDBxRnAvNExhZlB5NHc3R2sweFlm?=
 =?utf-8?B?dE5SaVJmN2QvT2x6V2d0WUxwcHNYcy9XSVgzUVJtZ2pUcyt4WW5DQXJCVXZo?=
 =?utf-8?B?NExRcWYyWEk0UGloTk1nYWNwRFg0d1pzSUVWZ2hia0Y0UGtUdnZIZWtVZGpS?=
 =?utf-8?B?bEQzY01NQ3ExWGdpTmx4TjRrYjFWaVlsUXpxY0tnZjhkVTFHYUk0M1MzT0tC?=
 =?utf-8?B?Q2RlR2lqSkJXRjMvMzM5NXluelRnd3QxVDkrak5tWUhEVjFTRnZsUWc3TFA1?=
 =?utf-8?B?RTgvOTUzWExiajhVeXYva0NEaXQzN0V6dnB4b1NMSldsT1FrU3hPdkFHS1Ax?=
 =?utf-8?B?OFFVMjNnSWpzV09vSzUxNFBTMkJHaXY0Y0VDQjBQUHAzRWcvZVhLYjlOa0Rn?=
 =?utf-8?B?c2lwdUxEajFNSDlPdHQveml2cUgxdG52K3BWUzJmYkVLeTU5ZUNrREw0UTNV?=
 =?utf-8?B?d2N2WkpTS3M3SkJnL3AwN0pRVytodkN0aXlpVUYzRi9NOFNINDZiZDYzeGx1?=
 =?utf-8?B?UmxvcXdJam1OMEdCRDUvbTRsQlZxTVBZY2JhaGo1dGpPRnRlUnBydWx0Tjcx?=
 =?utf-8?Q?3MzJzvdpSLSHtvYClZPa63hYRzxna7oi5G?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 14:11:03.6893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 47445f96-cb97-4102-43a7-08d8b703e596
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ikDQj42RYFNcAJSbZ47bvghJExEbZn1MtbVTbSm/sbphnhDFnTuyM7Nl/Ba37I6ojzhmYmMWKRTgUpfSznGJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2714
X-OriginatorOrg: citrix.com

Hello,

While trying to do some cleanup of the Xen interrupt support for pci
pass though I came across the MSI to INTx translation that Xen is in
theory capable of performing (ie: use a physical MSI interrupt source
and inject that as an INTx to a guest).

AFAICT such functionality is not wired up to the toolstack, so it's
hard to tell what's the indented purpose, or whether it has seen any
usage.

The commit that introduces it seems to be:

11f8ac5ebf passthrough: MSI-INTx translation for HVM

Which contains your SoB. Could you elaborate a bit on what was the
intended purpose, and whether this has never been used?

Thanks, Roger.

