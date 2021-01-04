Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD562E9829
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 16:14:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61297.107729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwRYX-0004JX-MF; Mon, 04 Jan 2021 15:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61297.107729; Mon, 04 Jan 2021 15:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwRYX-0004J8-IX; Mon, 04 Jan 2021 15:14:01 +0000
Received: by outflank-mailman (input) for mailman id 61297;
 Mon, 04 Jan 2021 15:14:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N5j7=GH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kwRYW-0004J3-5S
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 15:14:00 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b39faf08-262b-4d5c-b999-4914dfdccb2b;
 Mon, 04 Jan 2021 15:13:59 +0000 (UTC)
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
X-Inumbo-ID: b39faf08-262b-4d5c-b999-4914dfdccb2b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609773238;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=tOwR8Zbe95PBMWyk3Tu5moRnskfZG24SLx+B+4MoGVk=;
  b=H+elGlXhiNMmKmLog1yguxe49J6hDLildVVJRTZGNmXYIv3bKREgvzzM
   Yu5mEqCPaHKVBJ6xhDFm8zaUjwA+Uu0yju4r9SwDhPecTVWDpBwFu96lc
   snYymqEKaH+RMbrS+UbM2SsowYqazOtOv1/UytNnXcPUvJ11bVGEB1iJY
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: gnrI8RwDyOzlLurUhAr5fM0Zecsg+A+d359BgTSv6angcHhEZj6WsZO7TrowDmYW15JCuLDCS3
 2xqZd960sfDy1ugT87D9GRFhnqt9OUKY37zT0g6Pia8WA567UF1/XG4+7BxsbSfNc+wBSWLqdd
 E3XvdJ8OtqmT9I4eFbK9Xr2Yrqy+tjz/Aep+TSZEgJqoJhT/yByCZ6NGEjgXr0amLHoQ+uRKY5
 y57qE+BnUeGyNMrEqV9BIFpmNIAyASGN0+sna2/xF3XhH0a2E8uduWIN+pBqJeo2gSCcHrTojW
 Ktc=
X-SBRS: 5.2
X-MesageID: 34346130
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,474,1599537600"; 
   d="scan'208";a="34346130"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ehx3egXH4HsTbk5SgF5PBWzd9dtgt+F0jDJYT6JdQReJdZoAb3DEiC1JX4dlnvz8FQGaXg9MNYHGz69ZFSgciETeIggBz1iDqtStFRh4nGPnCqrCC06uQwbPc2mQ3PxVQtjCHSevUmadklvoeoU2qj6ZaBb+08HVSiWZEoqWNh6O2Tyd6i86KuMEB4vEk42JAaOW5+xqBBjmUqVkBt+ZxdQysikdn6+1WaKfeT0XDMRbjZJ+HPwfunRg7QidCJXhn0I6NF8+w/ZgYztFmIBspNkXP11bkafGEgNHLEZRtlsqqyeaDh4h/NBwTQ9Dff/TKMVLud2VNXGTuWyGJCAV0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnBW8ky96Js1nDXnqMBGU4d65qlQ71xjVJzSuu7fB+M=;
 b=jzG7auea2DJ8hwojW20jqwVhYeTWQtzIswY0EIF6pRLrDSVep78ct8F4pmcwkUp27O6pOuOoVI1yYqEMqKv20WImOPxJVWUpz/52KZ7MqneEzwhL7eze3liqt1CGYB0bGPVgxcitHKtU6JNMScV2L+iUZG/QJLazLgygAlQ8Pwaq9657m94pSx4Eimu8sJh+QcQiJJofJaMFJq0nF9Vlek36QfTK6nnpBYfjgwiCYTMa7K/BRtPtmFghvQQimc7Q+F/j5b9vG3XXx2POzGjDAlX5SZRr41sk43lnHbyAX9I113UGu82tP5FOpJ9qyA7b+7e6JWxQjC858nqvMInRng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnBW8ky96Js1nDXnqMBGU4d65qlQ71xjVJzSuu7fB+M=;
 b=FyIHmXeVmL3EGAMc4pW0gMvdeokpuRnZDNbKTn0s598n7hdL4q2RqjDF4g1wzXsw96DX76XmWEvRAGLNMB9Y2NocDHQymptpt42kaH9B7SFF7zYWPwLKXdBuO9Qk1ymnVowhcHafP7WyoylfpiEF/B+a9TJUoCKW1p7yNEtvMCU=
Date: Mon, 4 Jan 2021 16:13:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>
Subject: Re: Ping: [PATCH 2/4] x86/ACPI: fix S3 wakeup vector mapping
Message-ID: <20210104151346.xclivtwf57t5flrj@Air-de-Roger>
References: <c0210cbf-c07d-7fa6-2ae0-59764514836a@suse.com>
 <20201123152454.yjr3jgvsyucftrff@Air-de-Roger>
 <79776889-c566-5f07-abfe-2cb79cfa78fa@suse.com>
 <20201123160752.uzczcxnz5ytvtd46@Air-de-Roger>
 <fe2ec163-c6c7-12d6-0c89-57a238514e25@citrix.com>
 <094e9e27-e01f-6020-c091-f9c546e92028@suse.com>
 <1d971d71-9a7e-f97c-6575-7f427dc1553e@suse.com>
 <301f6814-3827-5aab-c105-74ebee66091f@suse.com>
 <20201229105403.7velkoskewx5lafs@Air-de-Roger>
 <1594a3cd-05b1-3e81-18fa-f6bd3d7f0667@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1594a3cd-05b1-3e81-18fa-f6bd3d7f0667@suse.com>
X-ClientProxiedBy: MRXP264CA0033.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eed9625d-209b-4816-c4b5-08d8b0c35841
X-MS-TrafficTypeDiagnostic: DM6PR03MB5356:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5356EDD3F619AEA50AE5262A8FD20@DM6PR03MB5356.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7TBPD26cFU5Nl0aOo5x2Ni+x/5kGO47LZD7PWs9Ugysn1znZF23Z2pz8+3rVLRdcHsvRZ0wgw4IruCNSkZJqsmvMR+8h8BJQDB/WbEGYgn9M1S5/ZYInNtfZRpPRtAtbRfGm8G/zk+S2QLpR8UfMhVyN+nx/NCG5MX7CvBaBDTicrDZm5JOsXEnF56kZY4VTO/lM4uCPF3ZaWe5uIE7Ws97B7/3vnU2h8N+V6FcwC+0HiNramsVsU46QE12oRb6aDBBI6pFHJ1+OfMN5BKrsg4vRxR9GAj7C8PgW4hZaEBZR1yDR+mK8SGkCyX+GGpW3ZMDdiuFh2RlrNOBplDN8NB9neX1GK4I4RkQZGeSO3RCfuF3g56eATLS8aeEyCUzqCqZoYW9MvkxfSzA/lgVwwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(366004)(396003)(39860400002)(376002)(346002)(316002)(5660300002)(66556008)(54906003)(2906002)(6496006)(8936002)(66946007)(86362001)(26005)(66476007)(1076003)(4744005)(6916009)(53546011)(186003)(16526019)(8676002)(9686003)(6486002)(33716001)(4326008)(478600001)(6666004)(83380400001)(956004)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K2VSUU1PWGQ4bjBZdTQ2bDZ6dWUxcHdsSUMxVXdQb1EvNURuS2ZwSXhnZ0ZR?=
 =?utf-8?B?MnJyUlBiV0ErSFJqczAyMUVCaURUVUN4NlZlMFRQemFoeWhQY0orTGdHaFB1?=
 =?utf-8?B?VGI3TjlYTzVFNG1ieGs4ajhUZnBLVTJKQ0NBcC9KUy9EcGtjTGxLVHFxYlZ5?=
 =?utf-8?B?YVozazVwekNONk16bkRvekgxTE11TU9GMFdMSk1xQjFmc2dGMzBHSFZFbTdp?=
 =?utf-8?B?K0MyaGxTMnRDOUVHSGFIZlBNVXAwcERQcUhpQXZ5SjdqcU1PU2c5RHkxeXVo?=
 =?utf-8?B?TXI4Y3BNREo5d0RBbjkxb1VjcHN1Z2dHVzFhYndPaGZjb3lZVnZoZmVtaHJI?=
 =?utf-8?B?NExDL2RBZFNYTllCaG54UFFqTUUzMURHVllXd2w2bUFjdjF6RVh6SHo5YTRM?=
 =?utf-8?B?aGM0czh6R0xIRjgwek8rWjhMMUhkeXNLNGo0WHBKaVNpajNYem9WOGpnRnds?=
 =?utf-8?B?TUxyQWJLR1VJcjRiWEg0SWt2bkJSK2QyeUNUd2k0NWZiVXh1eHlJQjMzcW9Y?=
 =?utf-8?B?aFFwekNrbXk0VHRCMzdiTE5xTHltdzZwamY2eHRESnMwNTN6d2RnZEdhSnRJ?=
 =?utf-8?B?U1Q2V0h1VjZvM2dYZytuMk5BUHBJcDZsZmhqcko2NjZUSmFCNTQvbzEvVnNs?=
 =?utf-8?B?S282MTJaWTMxRjRHb3ZtLzc3N2tEK0VOdHJYODZDelNQM2hqSFE5TkFqZGk0?=
 =?utf-8?B?MzEwd2w0T3U4Qmx0S3k2NE05eTJNd1R4eEhiaVd1SXV5UFZpVTh1UlBZSXpP?=
 =?utf-8?B?TzZTcU5Tc1RoZk1HQzJLL3doQVNzUW50MUgwSkY5S1U4b1JWZjNpUldqcW1o?=
 =?utf-8?B?bVkyZ05JYllWSHB1bmNTS1F4TGlSU3NqNDE0anBQckN4MDVaV2tRclJOOTRu?=
 =?utf-8?B?VG5UNWpSMFUyRTJmZGdKYWczemxIUzErVzNCTnplTm9JaFJIVzJqWjBaZVM5?=
 =?utf-8?B?eTJHcTRmK1l1Rm9iSnE1TVJya2VYVmFmZnBMQ3F3QXozQTdWMkVVcmI1bGtI?=
 =?utf-8?B?ejg0eHdNNHQ2QmkvZW80ZklaTnpaZWxNKy9wVm9ML083b0Nxb0VFZEJ3NEpM?=
 =?utf-8?B?UjlJNXA5UkkzOTZpdEVwalVEd0hzaFZWd3JIcmJCeXNtbE9pbkdhNkRwb004?=
 =?utf-8?B?YnIvTSswMkhaMTBjMjRYVEt0YU1WZU1iakxTVkNoemluM3BQTE5ZSTFma2dz?=
 =?utf-8?B?ZUpjYVl2MkRKTUVCMTBad29Dd3JZbEJyaGk3Vy83NFgzZ25sWUxhVVRBczJZ?=
 =?utf-8?B?S2hqRWMyaEVlM3drN01zUk1sM2wyOVlnRUEzVGJacDN6RlhieEhLVE0vSTZr?=
 =?utf-8?Q?zuEMeZ+wHyc4ctFXLwklvpdh8rc2dQR5uz?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 15:13:51.8024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: eed9625d-209b-4816-c4b5-08d8b0c35841
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gI4KU3uBLM5GvcBlotjgbYNWgy+qwQIy6RuBSl0emYFs4pXKIT1cu1Ajwq1/5YEezsKMglFox9MINuvH1I9SOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5356
X-OriginatorOrg: citrix.com

On Mon, Jan 04, 2021 at 03:03:07PM +0100, Jan Beulich wrote:
> On 29.12.2020 11:54, Roger Pau Monné wrote:
> > My preference however would be for this to use vmap. Could the mapping
> > be established in acpi_fadt_parse_sleep_info instead of having to map
> > and unmap every time in acpi_sleep_prepare?
> 
> Establishing a permanent mapping would seem like a waste of resources
> to me, no matter that it's just a single page. In particular if the
> system would never really make any attempt to enter S3.

IMO I would rather have a simpler path going into suspension (ie: not
having to create a mapping to get the vector at all) with the cost of
using one page of virtual address space permanently.

Thanks, Roger.

