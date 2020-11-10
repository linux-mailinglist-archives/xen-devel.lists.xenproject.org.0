Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0FE2AD571
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 12:39:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23295.49967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcRz3-0000sA-Bu; Tue, 10 Nov 2020 11:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23295.49967; Tue, 10 Nov 2020 11:38:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcRz3-0000rl-8f; Tue, 10 Nov 2020 11:38:45 +0000
Received: by outflank-mailman (input) for mailman id 23295;
 Tue, 10 Nov 2020 11:38:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hJ2u=EQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kcRz1-0000rg-Kp
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 11:38:43 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4cacae8a-02c7-4b23-974f-18927ec6a886;
 Tue, 10 Nov 2020 11:38:41 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hJ2u=EQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kcRz1-0000rg-Kp
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 11:38:43 +0000
X-Inumbo-ID: 4cacae8a-02c7-4b23-974f-18927ec6a886
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4cacae8a-02c7-4b23-974f-18927ec6a886;
	Tue, 10 Nov 2020 11:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605008321;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=40PxImIy7N+dTs+m91Fee03wILsi2HFIaT9+AwryQAA=;
  b=C2Bgo9wyPZUcEm0hAtuipocoOijt/cfeU5pnRNfzS+Gxi+GbOTuJmdkM
   GrkDenA/paeH69P6AZ+/iqE5trj7x12/iJMHwsxjrzD0NwwyCauV5Req7
   tb7iHTnp3pg2KJZ6QJfOOzt3fClSGtBYFkY8u7zzajNcP3GIgT3mWQtzB
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: k5Lz4GGEf2jgghS13W3KNJFrkJppOQwP5tPWYYvmg3plpgQZMeqVMaSKkUpuQSECz0SAfqwFRD
 YYLGgProERLplWctzgargJHr9+8XQBWnlw3SDDtIycJxMP1LF2fAOYeA07hxU8UbD0LDiapbHO
 jyg0EAAQ1BXSZ6lYz5RNGa95+oZ0kbGbPBW9nE9nFSE/npezKZInaDFvKElANMiEo+YA+FfrZ/
 H3iU17hBV7fNzOdUBS1Sz7O1sXxpnLrJqsXzdo3kuW0icgstyD9dqFJZ/AoM2o7ge9OasiRsIy
 nTE=
X-SBRS: None
X-MesageID: 30840389
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,466,1596513600"; 
   d="scan'208";a="30840389"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iPodGjUZihmn4BuFGd4pJrPiTzTdOSt4OgDwPIpNcz7M8qlNIV5C1EFAhQao6mkAkakz6V1VgkapJLBN8dXzAJpK7ckePOEnF97wV6YSSj83R+opkkHzKeaDTqvQjnNQw460MD5MrMV7jwH2HH6GOuFiJdubqbrY2eT1MkFya3uZZeuZCmZMDvjBaw1c71TwdoRk2vVC/SfyMAMZFf5kzbm0b/4Q3+djmlB+MpOVDN52X0vAbJT+3Hg+bBagAGcwKVArBx3/EU95KYzmedu4ROpcOYvtMnEv+IrhlUTcQ/Y8mhMtX0B24VLdkpAGOQUCPITSq3WfKZ5uIuL5I4Pv6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=my46kdy4q3mUYkveQ4tkBogWiaNXK1LTx/T3ptmh0bg=;
 b=izA6y4zcxrjPcIFG7ejcVfDplV90pHAlxek3IaCiYLtjkQfd+RGKiIeii537STElU1wrXoKpq6XjWhXPHwox/1XqTxo1qzTko2gkAj+cGBbp5ss4vbDE1dtzFw6sUX/VmL7QXFeqHfq0IHxOZh1t662bSoObVxMREvScTFn0/zL4NFCEyNbx+/Yrp3DT1QX7oGKKmwuQYKFbedLwzXAWQ1mBA7fzOOCaaefympF9se7uASdd3pDgMxHLhLdIRIE/5hgV5GWGW+OYzdVG3QF93CrviVJTj0uDS1CfUUmRfWAnlvPeYlzvUoXkDv77vdmog0lz1/BumHlpbtGfUGR1ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=my46kdy4q3mUYkveQ4tkBogWiaNXK1LTx/T3ptmh0bg=;
 b=os1MgH2Z6lmGURZQVNAVVue2oCY4scJITLoGBOu9w9ic/Ko3hYooY3PtsPi3T2qpZM5P8UcSOMyB2chFpqcACHSD3HmXbePmDOi1rph3f0dP4wVdiTYpjePmoBqA1I6dlnCHzw1F1Byt9CkA5zwLv/zJl9HFfjqhNv16LcHuy2s=
Date: Tue, 10 Nov 2020 12:38:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH 4/5] x86/HAP: move nested-P2M flush calculations out of
 locked region
Message-ID: <20201110113830.ttnvs74ud2fo3bxn@Air-de-Roger>
References: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
 <551dc0a2-f5ef-a646-26eb-8a67ae428745@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <551dc0a2-f5ef-a646-26eb-8a67ae428745@suse.com>
X-ClientProxiedBy: LO2P123CA0097.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ce278f9-fd56-4e9d-20e4-08d8856d29aa
X-MS-TrafficTypeDiagnostic: DM6PR03MB4396:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4396FB5D3F96CFC46FFC8AE28FE90@DM6PR03MB4396.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J5dFXGN9N4K6z9yaGQ+2zpkbfg8bdemuxsFxAkcOcmeXRkv9mGrvWIpFQcITatFuIACQz8sLBQq9ewqssPNwITvSVDTgpDjwnHC2UGGPnSCP5DWzATPQx5MLuyOlPdqzCpKWMmGbkFRmFpBf3pqXzSMaC2hI0pjUBgiIt5DOLc0dpaYuop/R1w9KG3iS0LReTw3rPABNokb9BWmgqP8oDGuHk2aou1K0WfVj8WrELmBH/NgBl4m542miNOYH+L0BExLwh7jLqWooCGRo14e4UBvQrjmVLhpJBuLl/oCnoGMTA1N9KZBRO1HL/Np1v01x
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(346002)(366004)(136003)(39860400002)(376002)(4744005)(54906003)(6486002)(85182001)(4326008)(1076003)(9686003)(86362001)(66476007)(66556008)(33716001)(478600001)(2906002)(66946007)(316002)(6666004)(186003)(26005)(83380400001)(6496006)(6916009)(107886003)(8676002)(956004)(8936002)(5660300002)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: wO8ecIKtG7y+HVaOt5Bnkwz9eOt8jMJhtN6iZrUiTlbtZwLfB4QTXSSToyXbJ8Y2CRkh9Dj4k1nCpkEWisn+gholsc9W2DtOvUoEhxmD2TIc5jxgMFB0oTyBfvqeJYdryB6swCNFGvnkDCWHVgWSvwlXtOZSdST7WYA3Yrt52cn+SX+l0FiKcu4aqmWJmdA6KyhyZH+YFxtYPM7wE4+kwTM5GYjVEruH+Hhdgkr/1BG0GywLDQPzFFNoHz8oKmvnJnaf5ePtGUNWLGoErMXCaGpjXiYNqiwPzLTkDC32iKYOgttprh2a5U/v4XbxtbnI2ptxj7thGKY5N6qvPCYRW8a3gcc9MHVFmhM+ah9hSFwyW/WvTRFf9q2PD+2p2KQM+QgjxSco/DKozCj6SZiq3oD2V3hMSRbrg+JA7M9OPiReNL9ERu1IiRxgapN0ERDOuopc8ZSIyGYZ+lG66iAOo2AGsoXCpm/QC8Eah/kTGHhXOVajjemxhBehICerFtdqF6ahIemgyxoShytjI5Ns6UgUZuotiYMMSBaGXN8N+niUbHCa/Oqb4I2ELEVigToYopBPx+F7B9Op27iy5theM2i/8sbHRrFF3RG7mxjiBln/dMF3Pf6Eqcm+2LFkdGcc29wRDv0kn4IVvEF+ytcXwfWdlXWQXfVGL7BWoENLxheSE+zXv5ezmLd7U/mhWtqUfDtKIFatRL/TU+Eum3jJcoGW1RnbNHTih5GkrOX+3iH6sq5z1Bfwpkdc8ls+6SIgMMa6nwRiqISaF69zAlpB6H2wdfEclXZwaujLixZd9TEfC8ggyhPz7Ib6LZuLkVcq5JHPumxiA4kuCPOn0zaxM8jvXVgA4LUUehqwJrSMZ4EWUZDIBcGt45eEadjpfa/4octJzDiTMFYYhcCDgK190A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce278f9-fd56-4e9d-20e4-08d8856d29aa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 11:38:37.1084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPAIYXQhS7L2nikBG718SmDB+zmc2HQkuDPu5SxSNLaI6kHK/jNMaHctE0vD7Cs6faUB0zJCN1ry4JRUwWC3RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4396
X-OriginatorOrg: citrix.com

On Wed, Oct 28, 2020 at 10:24:12AM +0100, Jan Beulich wrote:
> By latching the old MFN into a local variable, these calculations don't
> depend on anything but local variables anymore. Hence the point in time
> when they get performed doesn't matter anymore, so they can be moved
> past the locked region.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

