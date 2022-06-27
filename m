Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAC455B952
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 13:03:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356463.584710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5mVy-0001uF-PB; Mon, 27 Jun 2022 11:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356463.584710; Mon, 27 Jun 2022 11:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5mVy-0001rn-Ku; Mon, 27 Jun 2022 11:02:46 +0000
Received: by outflank-mailman (input) for mailman id 356463;
 Mon, 27 Jun 2022 11:02:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CVBH=XC=citrix.com=prvs=1703a0240=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o5mVw-0001rh-Gi
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 11:02:44 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9e0f87b-f608-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 13:02:43 +0200 (CEST)
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jun 2022 07:02:30 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA0PR03MB5404.namprd03.prod.outlook.com (2603:10b6:806:bb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Mon, 27 Jun
 2022 11:02:28 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 11:02:28 +0000
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
X-Inumbo-ID: a9e0f87b-f608-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656327762;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=VhK9pMaLksyDRQaBcn41x0Iuy1G3v/dtS0+GOyxxjTg=;
  b=FI0b6YDmhJlJOgc0POnBZNzxcN5zW6H395kOvMrStTdxXavk/Z3lJTVC
   O3qg/Rg6j1w/o5gdGVxBeqTsup07zVHuQiWQDPmMGvAtuIQwfuH5tJW+p
   yfBlfsFLEwTgeFDJnmwEf/Baq4OqTfUhaknog7tIi6KhF819lWbyhJ2os
   g=;
X-IronPort-RemoteIP: 104.47.55.104
X-IronPort-MID: 74323375
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rAujdql41RCIsA4aLwxUXP7o5gx3J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdXG6Ab/beZDamfI0nPo6ypEtTvpHczNNjHVRl/389QiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EgLd9IR2NYy24DnWVzV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYbwUJIrz8uOEncCZiDWY5Y6Js6rPVGC3q2SCT5xWun3rE5dxLVRlzGLJCv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXuJkBhGtYasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUH9AnP/vFovgA/yiQy8fvXb+LNX+CIYuJnwmiTj
 U/i4UXmV0Ry2Nu3jGDtHmiXru3AhyTgQ6oJCaa1sPVthTW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJvHmRAGxqnOAuh8aWvJTHvc85QXLzbDbiy6bG2wFQzhpeNEg8sgsSlQC3
 FKTg8ngAzAptbSPUG+c7Z+dtzb0Mi8QRUc8YisDQRoA8sPUiog5hRLSTf5uCKewyNbyHFnYw
 TqHsSw/jLU7ltMQ2uOw+lWvqy2ojojESEgy/Aq/dmCq9Ap9YKasYoW67l6d5vFFRLt1VXGEt
 XkA3s2BtuYHCMjVkDTXGb1RWra0+/yCLTvQx0Z1GIUs/Cis/Hjlep1M5DZ5JwFiNcNslSLVX
 XI/cDh5vPd7VEZGp4ctC25tI6zGFZTdKOk=
IronPort-HdrOrdr: A9a23:iipN4668E3xiQj/rfwPXwOjXdLJyesId70hD6qkoc20xTiSZ//
 rCoB1p726RtN93YgBapTngAtj5fZqyz/9ICOUqVotKGTOW2ldAT7sSl7cKoQeBJ8SWzIc06U
 4jSdkcNDSaNzRHZLPBjjVQZOxO/DDoysqVbKzlvhBQpElRGsddBilCe3+mLnE=
X-IronPort-AV: E=Sophos;i="5.92,226,1650945600"; 
   d="scan'208";a="74323375"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYEwiaLTdfAia2CMLXQfOu+z3Op3uKYHtSOH6RuFveWLXbphS41+msVWJ+QXTQ7KP3dNQa2W5z7PBcy6ECcgATnQVJG02kUkCEDBTS3YgG+8YZK6Izl5HbyhOTJVE2H25a9f/fGCYtVJYPOdvEuPzOsXtwXlfm6T/iGMaL0hl/FDeQRBBUy4isOT5TQrYxUOE9JHi7s57jKQIKz1G3xZnDND6XJdm2thtim0zpSJ60rxbxFbCSOcvDW6B+nSa01fmEZERfMQnEcW8Qb15IxUAbN8zi4JJn6iX8RSgt1di8Sfuhlh7zTjRofZsSuIdGf5iBVR+MlsSLVBH+8Lk3jFCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YJvntpC1FV7apJyfockOE8dvjS/AQW83QBeu9E2bf0=;
 b=FGfoXn5sM7pYnmqK1qXK4kePiKMHxCR9NFJeinEO0dcooGSrr3sj1qqDxh+TheYqer1GhvXqdatIOVraPkpZ/kfiiFXtYQn3U8M8wQtjhBg7BBScRIA+PPw+4GQMH8dyxe1ylJVa1C0dMuO/RmxDkbCG+ZGaTvgzMjVFPtL76xmI/kbeqKiGI7g9fRMou3lq7bJaxamHnrLiQ/mONlQKsXMnGEdcm4Vncm/dpdgJcHrSuTSyV7h1t29pfhr4BIoaiNm2kG3ppnvcg/IfP/IZvmeqo5d547fUh+UlusxwyDsXTAimkeH7/JRE2WBLLpLnItBWVTyQ0d5A+c7Y4VzHsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+YJvntpC1FV7apJyfockOE8dvjS/AQW83QBeu9E2bf0=;
 b=IF4tVFu+KRDknYKrEMIABRQNfOSHAOUFp+whfPny63h101I5uOJpLey1CEQQPe8na9SLBVjDiN9js4Bih4TEAckPlV6v5gGaVCt6/qs019WLNRA38a58F3wtetRi4T+tlQpmwxjQbsWivBkt3b2OjdVD9bKxBhEbZvXk8bGn87I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 27 Jun 2022 13:02:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v6 1/9] xen: move do_vcpu_op() to arch specific code
Message-ID: <YrmOQPQlbAMwULWc@Air-de-Roger>
References: <20220324140139.5899-1-jgross@suse.com>
 <20220324140139.5899-2-jgross@suse.com>
 <YrmGQj/W7KTzJ1vo@Air-de-Roger>
 <8951e03f-ba63-4524-99e9-c030e273c1d1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8951e03f-ba63-4524-99e9-c030e273c1d1@suse.com>
X-ClientProxiedBy: LO4P123CA0404.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffa06ed1-f095-47d6-e1f0-08da582c862e
X-MS-TrafficTypeDiagnostic: SA0PR03MB5404:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ozRw8ZryN5nDBmyt9aOB00b/EiP116SJTXB1cUmf6XUiA8RzRDPxmXJokKWtHsjz+pwkyIe74rPVX6sxigBZLHdsGjkOkSExTI+KrtsAIbmOmUat2ogYCDP62V6HRFHbaBMLAWj3TTehliDBroo4Yd/+Bs1Plihx6s9QrAaK0ai1zUZhopWzQPUZt9UgP6JWGhbccFU/DCpbpfRPF+bGMIVfnP98Uc9OpohQJiQyH6f80pFGP1r9AW6v8uMewfQZR2r6kAEA/Nmd6DUJBCKO2jUn/a9KD6IY/mslfhdtnLXbgywiqcG3TNyR9HpXWeBXNPNz7E/4E2NN5ycac9GgOYh63a3m+dh0bVWL0XYyZoNKyh8S51iKsfX43fV9XunCbVpNo9gZy3JfSPzbtLDyOr11oqpjZ9ktHTVT/npD6rnFslacelYF/nKVxiR01nkioCmpwdaAoLGfo/Mw3lO4fdxkV01HrLoCsJvsxgYO6NeTHMbTEJX3EuqrkxOs3MfjwY0WS4iwc1CSQF7BdizPMiPKHYmFsmaR10G384x1EB7i9p8Gwytg208PaQEsbEmjbHEu5YTr0zAoukhldZd5qP6JU6xBwCZR69cbsZzfXdBQFhcs+YrzK9gJL1/jc1h8CalgHHVoJj5TjVeFa8qNhD8DJOSQ0tHhzwTaRtzgRL6RKkEh0qI5eNB+jyoKwe3cI3UbrtkDuY2J9jsVXpCyIpaFB0xZiSlfjn10UNRvli/tsFfsONvVMI4OyQwCf19F
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(7916004)(136003)(376002)(346002)(396003)(366004)(39860400002)(4326008)(66946007)(8676002)(5660300002)(38100700002)(6486002)(66476007)(66556008)(85182001)(186003)(478600001)(8936002)(41300700001)(53546011)(6916009)(2906002)(86362001)(316002)(33716001)(26005)(6512007)(6506007)(9686003)(82960400001)(54906003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MktKZDdNdVRNTWZ5eFIxRkx4NEFQYllESGlnODViNFA2Q1NXRVB1UU1nbWtZ?=
 =?utf-8?B?MjBIQzRwZ0xrY0gyZ3FZalRiVGR2UDUxaVQ1OXZEdFVvQmVVdk5Ka1ZrV1hS?=
 =?utf-8?B?bVFYcHZYVjFYUnlXZHVCT0tSS21XcWM3a2hnVGEzQURJd3dJVDYzOUo0eVVP?=
 =?utf-8?B?a0U2REF5YkpWTitrdnkrcitwZWFNMXFITVNuTWM3S1g4d2NwbElZdFM1Snl2?=
 =?utf-8?B?S0g5SkNvb29aNkk3cGkrTlRaOE9KaURMZ0Q5RUcyWjBVRkZZemxiUmRTdTEr?=
 =?utf-8?B?dW5GejRvVnlMd0MzdGxsZ1ZKZWNxdG4rRU1LMnBkUk9YakY4c1dpdXphTTVR?=
 =?utf-8?B?R1VZeXJaUXJiUXFpQ1VFRzFqYXpEdE1zMFlJR0QrVDIwVnd6ejdMZkNXVm1y?=
 =?utf-8?B?Ull6Yk9ZMTQ4Y3R5L3hPUHVBZXUwQW5mTW8vTnplalhOY0JQdEdSNUpyOFYw?=
 =?utf-8?B?K1EwbUxUZGc1QXMzTSs3SDREMkdveXowS1pkTjhJL1h1NmJJdUpvYjE1cVg3?=
 =?utf-8?B?NXpPVHA4ZVFYT3hmL1pUUFFMQTc1clIyZkQxL3ptYnhHc0RwQStBZWx4NkVn?=
 =?utf-8?B?dUFObU4yV1FlRHdhYXJlMFRlNG9hemdmV2tEdWh1S0t1c3d6WkZnb1BRbHNw?=
 =?utf-8?B?c3F0Rmc5OFZ2L3BsZlNpVVhnTEc1Y2lYWnUvcEVJcittNzZFYk5WRVE2T1VH?=
 =?utf-8?B?WGZ2VEZoTG5xY2EwbHZaQzB5alVOanpGc1B1Q2Z6M3hTczJPZXcxRjM0YWxM?=
 =?utf-8?B?L211TnJJMVlCWVY0WVdMbkpDQXJiSWdpT2JBUE4zcFQvTHNaUkMvbGd0VEcy?=
 =?utf-8?B?bHVWSThMbUFUcVdTWHhvZWxRU2NSUGNsekxxK2ZldXNyTW1BMHMvNmRFcUhG?=
 =?utf-8?B?cGcvRktBQTRxejkrUWIrRjIwWTlYUXc0YThWWnpWc21nMlg4VzBFVWpNbGhz?=
 =?utf-8?B?WEhmcE1vK2U2OXczQUM1ODRJTkVYOUhrcGV1R05tZmtUaG43a3dRb2daTzIv?=
 =?utf-8?B?UlVnYUZoNVNTTmc0Q2F2STc1bGpoaWl5MDMxd3VJVUtaZ1FkUjMzMHJudGRk?=
 =?utf-8?B?Yk9iSDhRTm16Uno3OUpUR3RpSDdOTlFUS3Qwbit6OW1aTEhlaDUzVk1welB1?=
 =?utf-8?B?MVRJT1NLZHVDSTYrdkZ3T21JcmpTYXdDOVZ5TEZvazFMdmR2NFVHVXNJTzZQ?=
 =?utf-8?B?M2xsR0x4UGRITk5FSHpRb3lNNjNTV056anF2cmtBa1l5UFlWd1c2R1NPNkh0?=
 =?utf-8?B?ZHptemRBN3JWYkcrcnFZYUdCVDdCWGdqNzVQZVVQM0NYTmNWeldKb3oxeXlL?=
 =?utf-8?B?WlhTK1Q1K1pxOFRjdHM2NG9XV0Y3cEtMbjZ4Yk1tR0JYQVZLcTU1Sm01YTY3?=
 =?utf-8?B?UTUvUkJ6QW82NTJUazhKSGswYXdXT2RHUDh5RjhyUGcyaE5MU0JlUlVTM1JG?=
 =?utf-8?B?QnNROXZpMWdTMGZQeEwrcnczRElZeHNDRmdMcFU1cVo2VVFCdVFoSVpUb3Bh?=
 =?utf-8?B?VGJQd0RXZHo5MmN4ODlUT1F5UzF6ZGRFd1cwQnhpMW1LOVBrbVVnMEpxdUFr?=
 =?utf-8?B?RmdNUlNrWnN6SlZmSGVYRmZoVk1FUDUvTnRodzBhd2t5UTBKU0wwTnJ3bkdz?=
 =?utf-8?B?Y1BNRkVyZUROMFJNVE9LZURyNkhac0ttUWg4bDd6WFRWYUVUd3pQYVk2VnBx?=
 =?utf-8?B?WnVGcTdzOEU1N0IwNEl1UWhDcXJLNWRPREdkWlRjOVJRQnNFUkdvdnpneEh4?=
 =?utf-8?B?ajNGdElZK05INzdydWFJbitSVjRYNnpSNlBDTTM3RDdBcDZYT0VzZXI0Z2Nj?=
 =?utf-8?B?VG1xcTlPNFF1M0pOSWZHZXlBM2FabElLblg0b3V5Ri96RmlqMGhnU1huWHRZ?=
 =?utf-8?B?K2x4aC9EY3VsRmY4SGRjTkVsSGdVSUpJc2NUN1BzNGxEbTA3ZGppeFl6YjE5?=
 =?utf-8?B?b2IvdFhGcDNDQTV0dUw3ZEEzZ1JMaU5ER2x4YWpVejZqNXNZUmRlYkhUbE01?=
 =?utf-8?B?MUZtMld6K1JIUTNYbG1PVEpxdS8zZEsySlNERkNxM1RCL2c1dWUxbDhQRVUz?=
 =?utf-8?B?d1NwYURFbG9MT21TTTE3NkdJOVVGalBOcjJ5dkJYU0ZUVnBvdzd6WjdmcDVw?=
 =?utf-8?Q?2BDPZZ3hmgbnjPR+xWuJ9otCJ?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa06ed1-f095-47d6-e1f0-08da582c862e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 11:02:28.1245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OcTwthzGmVA1pYFuz85MCMqkSq2067GMIHu4e/S3nicPf/G+AWZG4aj5dR6p46sXsdONzf7XudjUITSbz0pChw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5404

On Mon, Jun 27, 2022 at 12:40:41PM +0200, Juergen Gross wrote:
> On 27.06.22 12:28, Roger Pau Monné wrote:
> > On Thu, Mar 24, 2022 at 03:01:31PM +0100, Juergen Gross wrote:
> > > The entry point used for the vcpu_op hypercall on Arm is different
> > > from the one on x86 today, as some of the common sub-ops are not
> > > supported on Arm. The Arm specific handler filters out the not
> > > supported sub-ops and then calls the common handler. This leads to the
> > > weird call hierarchy:
> > > 
> > >    do_arm_vcpu_op()
> > >      do_vcpu_op()
> > >        arch_do_vcpu_op()
> > > 
> > > Clean this up by renaming do_vcpu_op() to common_vcpu_op() and
> > > arch_do_vcpu_op() in each architecture to do_vcpu_op(). This way one
> > > of above calls can be avoided without restricting any potential
> > > future use of common sub-ops for Arm.
> > 
> > Wouldn't it be more natural to have do_vcpu_op() contain the common
> > code (AFAICT handlers for
> > VCPUOP_register_{vcpu_info,runstate_memory_area}) and then everything
> > else handled by the x86 arch_do_vcpu_op() handler?
> > 
> > I find the common prefix misleading, as not all the VCPUOP hypercalls
> > are available to all the architectures.
> 
> This would end up in Arm suddenly supporting the sub-ops it doesn't
> (want to) support today. Otherwise it would make no sense that Arm has
> a dedicated entry for this hypercall.

My preference would be for a common do_vcpu_op() that just contains
handlers for VCPUOP_register_{vcpu_info,runstate_memory_area} and then
an empty arch_ handler for Arm, and everything else moved to the x86
arch_ handler.  That obviously implies some code churn, but results in
a cleaner implementation IMO.

Also has the nice benefit of removing unreachable code from the Arm
build, which is also a MISRA-C rule.

> The "common" just wants to express that the code is common. I'm open
> for a better suggestion, though. :-)

Right, it lives in common/ anyway, so there's not a much better name.

Thanks, Roger.

