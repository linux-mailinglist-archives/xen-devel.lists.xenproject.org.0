Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 494732F6687
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 17:59:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67440.120395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l05y3-0007fq-Fp; Thu, 14 Jan 2021 16:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67440.120395; Thu, 14 Jan 2021 16:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l05y3-0007fP-CN; Thu, 14 Jan 2021 16:59:27 +0000
Received: by outflank-mailman (input) for mailman id 67440;
 Thu, 14 Jan 2021 16:59:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7Rz=GR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l05y1-0007fK-9f
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 16:59:25 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e710573c-5443-4739-8dd6-69793b8f515d;
 Thu, 14 Jan 2021 16:59:24 +0000 (UTC)
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
X-Inumbo-ID: e710573c-5443-4739-8dd6-69793b8f515d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610643564;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Lz+QH4bsi+s1cQF0qjtLP5OkcaVnZ0Qu4qlZxvUtncg=;
  b=CP8m4ZsiCj35vpg/OHJl5OhNdVMIWgd+ePn4Sm4mTbS9uYucCzY1XAVp
   o6sNBk33Wt+bbV2pWLUqjZDRzPG15hX28tLCclXqoQd006wqK2efdjfqU
   sXqKd/qpcCmvsZkj81XgsSG/nNnlAuydzCzi0bIG3MiaVNrEN/dRGFw63
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wvrbibotWmurLJCDVyqMHcl+NxZhwCbJlBbH6FyeZvicQhYWskPlrC8fbbhxN4O0rYaGyl6VGw
 S/v1umZOLdOzoKlEUiHCkMndTPySD4vxwSlY/yBHBsjJQhZWoUMLhbqFN6TUOUES2hFIwSSx1H
 +T8SBGWf59Bjwo9a7s3/qaq1w21FIxTExjGYN67L4HIovwWWYmPKdNi/zSeFtjJFDqD+jsFgjm
 sletX0pID0D3U1FRVnSc/qjgrTMuP7QPQo7jVmPe4oFq3pEZkYau1tc9rMEUKjDzUJwuakgyb2
 zs4=
X-SBRS: 5.2
X-MesageID: 35106134
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,347,1602561600"; 
   d="scan'208";a="35106134"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5AlNS8cHI913siYoSSGJyyleFaA+vwxxAX8WWdKpV0tliHQekVrrFuXY3k8wqi/Uu2r94x4/skldicHbk8WJS0DT0KMC+PgdVmKHe2cLnZuvxiZcrNG5lXaOR8JVD6J/DrANykOoUxGGCys3utmy/5YGrUKHasYccTfxDPSoGFksGI6VvzVraGhtOBje5TfhduND+0umGKiT9jsqk5NXdQCRO2PkazgMwKfW1ji4Xdit4fAkBYNGjQl9iVMHYnb1pRKgN8E7eNPAsazRwv/yWkEn9MyMvTudBwtiFWXyhbPy/roxLTgJPq+ax49rdfwJBhS9CEvlnqTm1QTnMxbjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lz+QH4bsi+s1cQF0qjtLP5OkcaVnZ0Qu4qlZxvUtncg=;
 b=DJzo4aZdRyfVJFG0LjuL3NgyjFOIr/rqjCZz+/e8m6wZlYE7zzwo9Nfu+VbmK9AHsIWSa5GFLkp+5P2qoG7K/i5QGWroVAo+bEcIVEJw4OYbD9syUi0ZOuiKT3/lATSpVeoDbQNrRNl5uZDJrU3hvz6xUP2Adb9da2WJRLqROfzOYmFFRd0dTWi4Aj0+s2lD+WSgPt+uzNc9ieog5tqhykxYNaIWKrkeEYcYD3njEIrW58MNPwohqM43QgPd8P/PZz05OmnRKiJknRNaHuk3MNYNOsIzFR/z/x3yvn/kSQI4WaZcOtscj8Njm7RArkSrBOXhkAg3zooaJz1F0DDImA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lz+QH4bsi+s1cQF0qjtLP5OkcaVnZ0Qu4qlZxvUtncg=;
 b=h5tzww3vmJ5FjyKyOPfgWfa3aqi+rIvnuOtMo3jE2PzfpOshLE4DlOmKowYfos5THj6jI//NVX1+ngUiw+Mzpl83VQO//y6nwPgyqMmxOs4rEcKJkvpPWFF5F6L3CASFCSpG7cTkSlw66AAkb2Y1CiiQ9skIfKG0vs6de02eGYY=
Date: Thu, 14 Jan 2021 17:59:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH] argo: don't leak stack contents when returning ring info
Message-ID: <20210114165914.rtnzuf5qolifcxv4@Air-de-Roger>
References: <a2621d1e-dd52-4e46-9e4b-dffd94e73993@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a2621d1e-dd52-4e46-9e4b-dffd94e73993@suse.com>
X-ClientProxiedBy: MR2P264CA0094.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 565a3700-f4f0-4ac0-5ed5-08d8b8adbc76
X-MS-TrafficTypeDiagnostic: DM6PR03MB5323:
X-Microsoft-Antispam-PRVS: <DM6PR03MB53234238DF2ACED1081F9B5F8FA80@DM6PR03MB5323.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0x8opN+On5pcdSe+X4RTl97icJafktMoMWWOUaoCQpB27u+5hvsM2FIUFElUKRWpPSzFJ1aSXg0pbGW2SsungACz9quika8IKqZssU9/2ukUeGPMb4xBSKxyW07IAekbeoKjg4nrGaS5rHGUQ1Oo2Xb6gRMANDERuz59vVXm32mLTMq3E4usXaHQuurwliaIXZqnq8JPM6rjwSbMDs2N2vvET8b13TaITmhYRdCaw2wOCZEWvT9s4flCsqDlpBcECsMVlRuyKqdIFl4aR2j6V6NogN3UALcVCPdopeNrPtl3Mr0VcbCLPMbe2qLht/qdgtJwVwWmlXyLDWz3ZqAoggE+wRLmJmqLtRNgBfC77vr0X7Zl9QsjXis7ElCvHJXU3EDOnCXwAjhlowIRLsGE1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(6666004)(9686003)(66476007)(2906002)(33716001)(8936002)(4326008)(316002)(6916009)(956004)(86362001)(85182001)(66556008)(66946007)(54906003)(6486002)(478600001)(5660300002)(83380400001)(1076003)(26005)(4744005)(186003)(16526019)(8676002)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bFh4MXFoamNkVUtWUjcrT3FoN2UwVlBjeFBpWHZDRDhLWTdnMExzNEVOU05C?=
 =?utf-8?B?ZDBnQS9NSHhvUnJ0Vllud2xZVWJTRVlIejE4OW1KZUVjMnh1Tjl5NDRqSkU5?=
 =?utf-8?B?TmtpQTRWRmZwVHJMN0o0bjB5WTl6ZzNQdGhYeHpqUGZ5RUlMV3BLcks3Tnlw?=
 =?utf-8?B?dTVvQ1JNbHJRUmRFQWhZYVlFM3RMV3lYWVFQcHBseERwVHJQR2U5ZldKMG5m?=
 =?utf-8?B?cnFDUnRJTEdvMlR4eVdYT3N2ci9TRUlCUEl3QlJPblY3NEIzeFFnT1NnQ01V?=
 =?utf-8?B?eG9vUHFWRnEyV1RaZGRQYkROYUl6TmxielhJU1ZsMXNGZ3dpRmZLV0t5Wk9t?=
 =?utf-8?B?T29KQU9JclBBd1BFTXN6SXloL0loZ21GUXRpRDBxWFVaemNmb0FTaUFFOXMv?=
 =?utf-8?B?Wld6U21FZTRmcG9ZRWNhQi9qWXhBMzVVNVhFd3NhczAyOWlmcXdoZFI5cHdT?=
 =?utf-8?B?ZmlBSmdjTWRjSEplQUdRQUovSkJKODJXa3R6NjVVTlljRWVubHhCeVQ3QWRB?=
 =?utf-8?B?RnhEcnhrU0lmNVhBTXcyd0pNREhRZTFPL0tBdU1wYmFveXcrSUwvMTdqMDhG?=
 =?utf-8?B?T2lwRE1YU2QvSEI5QUJCTHZtMDdzczBJbnZkZ3pHeUVmNURnVFljRjVRM1dF?=
 =?utf-8?B?VTV3TWJ3Q2lMZGNJRnF2eG1ubUkydTdSbHErSGZaekNTcWNNcGx0Qis4UW96?=
 =?utf-8?B?V05PTFVtdEY2QWFRMTVuYyttZndwM2MyU2dhQWxPdmJad2RsbGJ1dmdrTi9q?=
 =?utf-8?B?TVlsVXpicG1uandWTkdxMCtXemttZjFhWXRNbzZneDB6cjhGeFI4MjBUbW9H?=
 =?utf-8?B?YndrQjE5ZlNXQllCd1NtbmE5U1BLUE9sQWtDYXphWkdqWUVmVk9BNTlLYnhh?=
 =?utf-8?B?SDNDMkJXd1VoY0ZFN05lYU5FOU1DbE44dzhiQjZ0eW0rS1pxVGpPTFdJWFNJ?=
 =?utf-8?B?Z2pGaC83dGdKYTJGTjM5bXF2UmJnMFdJZ1VSY1hZV0d0TXdsMFBMeW5tc2hw?=
 =?utf-8?B?S1cwWlZWblp5SFNSOGFWRmRrY0xPT0VPNGFtT0xUZDdjSkJ2UW1zMG42bEx3?=
 =?utf-8?B?MjFFNEZqemtrTXFzU1J2TTRlSlRVL1E0SmlEQUpmVVh6Q2tTbWtNOHBFQXFW?=
 =?utf-8?B?Wk9nclM3TmdCZDNIbktRN3hTYkx2Y1VoN3FsNWdHajFKM3hFTjU0QnVYSFo2?=
 =?utf-8?B?NWdjNThXUTFYSGI4Q3FHaU54NUlUdHlVLzJtWFFQVjBxaVM5T2xBb2dWcHI1?=
 =?utf-8?B?bHdKRlkxczBKK1Mwc1VNek1TNWw5Mk1UelduYWFSb1AvZ2VudHFPbHhWb241?=
 =?utf-8?Q?33bFw4QqFesZNMP/62Iucdg8slL0RVKPFf?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 16:59:20.2129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 565a3700-f4f0-4ac0-5ed5-08d8b8adbc76
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ORnkwWBVnIob8+xQy94K5WmeJwg63AR8mDkf2PedwFvle3WuQo01IjXi57qc7B+oevwU3yYPWz8Ow2vIewwTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5323
X-OriginatorOrg: citrix.com

On Thu, Jan 14, 2021 at 03:01:06PM +0100, Jan Beulich wrote:
> The max_message_size field of the output gets filled only when the flags
> field is non-zero. Don't copy back uninitialized data to guest context.

I'm afraid I'm missing something. AFAICT ent gets filled from the
user-space contents of data_ent_hnd that's copied from user-space at
the top of the function, so there's no leak from hypervisor stack in
the return path?

Thanks, Roger.

