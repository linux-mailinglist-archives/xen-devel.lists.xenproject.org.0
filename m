Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 701AC30A563
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 11:32:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79727.145139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6WVO-0004rL-VP; Mon, 01 Feb 2021 10:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79727.145139; Mon, 01 Feb 2021 10:32:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6WVO-0004qw-SH; Mon, 01 Feb 2021 10:32:26 +0000
Received: by outflank-mailman (input) for mailman id 79727;
 Mon, 01 Feb 2021 10:32:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dub/=HD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l6WVN-0004qq-2v
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 10:32:25 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 516746b6-4810-4949-902a-e30f047f6d31;
 Mon, 01 Feb 2021 10:32:24 +0000 (UTC)
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
X-Inumbo-ID: 516746b6-4810-4949-902a-e30f047f6d31
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612175544;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=X/sz+7w5Nnf5+URDWqmPGWLRVyoLUEp035G4YNVDJ7k=;
  b=XGW2+xEXN2LQ8sJWuGCUBCsRgeFW+GiCKqzPE4MIu6VjYza3YUGY4DPO
   UC3xgPF/zcjIeP1D3qiashwAsCYE1Ji0/hMo7/mkVujOaiLUUJC9+I8IG
   4VFeUBvZRqR4Iqng6rwkVZ3LVjF/P0JoKzEKNOVmA8nu3ejFoOyGEvjxA
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: AYQIc5pS2CiQNYu8DXI3SavB64O+AfWGYMSavoS9abeteykp/8jYuP0chGaMTbv6BAaZp1d1il
 LsxWuhlCXbCdCiUsJKqD9u//0s13kOOXQ7CyxLzsjOqllLlvPG3GPQCTNwrxJpoUXNxOlK/Raf
 S3ziPfYbunUUCXAn1ropttJjqFLQuaI+1wBTnrO5oX1JvUn1r8SrPN3v0nlPLFsgUt1tKhFOtW
 hvx8gmpLHI6fIXHpq5a063+kGxOhubJmMIESi6KXryH19+RyWnCiiIwpsP7XJu4NxKKGm04V9u
 6qo=
X-SBRS: 5.2
X-MesageID: 36462139
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,392,1602561600"; 
   d="scan'208";a="36462139"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=il082yrhNgFaMwFqbq4MR8Kd1303Bndi6xeDqv2J3efjDSXhJpyebOZSJFelV3Euy1sgX4Xjg36RO9FpJrs/63n4yjd/HC9icwADDX7sImENkgC+99BvZenbA5AIvWIIOONnjAVKPit0V7lVEiKTFGtML+V6zgDCfvP2Di4tWRJbs59022ki2HkdUl9vxOMrUOpU2i1Ac/LMPhOttw5Vr6gkaFyO/AojYghCqzImGV0emVGw+iNFX4WiqwSVeyjkLPWV/5zGG2IYJLxMgVZJE7GH1mTo1au7ALCF9xgl0fd89VsG2LRd5Yi2WSIJaF/rCRmDUVYuZ5qkhk4BS15Dmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91Vhi0/iypvPXtXefs++3QEF8+WC5JsTtXsPN5FWi6k=;
 b=kUQMIDTO52eKdjfHmJs/NK+9BfXyoh8PrifcIOYdTCOBXCJ1gwY/3U8UxPuFLjLSnsvaqW6r2fa4ia+E8ru0EHT0I0Y2CcDkiEiojKFOfTv6gPaCvLhhZSsjmkOHEVvQXqNXp6tXQd/v5qw5Cz1qaUc+vfkY7ghQhnvQyyOZQNf/mtRUIKy5wTaq2xx2P8TAwGd2HeT7uwKIrrM88X0ejdasdk/50WkgCPIkNYCDpuTwZZ/cjWC4EfXYGGx2bt+A15CD2AQ1QnbeGUifPFehq/9Wk650WpKwocUts2nmnzCbTRuk1dOrqKxiO017YxdLGhKxqNhld/1HTKOhoor7pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91Vhi0/iypvPXtXefs++3QEF8+WC5JsTtXsPN5FWi6k=;
 b=ZUBFUZ8NMz9DLKlG+Lzgt5btSo5QZZ216bcOqg5vrg+hPK87In3BZbCWbZ4ezRcOj/j7akwvRkskpLCIt3mEmjbE+FhO7JwJ9HyraxkwKkqn+K6PVaesnPOxCP5sw4LEJLuaUPc4K5eUgl4CI3o5ySEx1saaxh5jjfFhxMCgcH8=
Date: Mon, 1 Feb 2021 11:32:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
	=?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>, Tamas
 K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v8 07/16] xen+tools: Introduce XEN_SYSCTL_PHYSCAP_vmtrace
Message-ID: <YBfYraDV6LLDJLCX@Air-de-Roger>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
 <20210130025852.12430-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210130025852.12430-8-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR2P264CA0043.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::31)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08ff36eb-0112-48a0-d21b-08d8c69ca776
X-MS-TrafficTypeDiagnostic: DM6PR03MB3915:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB391554D41E4D5856D80AB4D58FB69@DM6PR03MB3915.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xxBwlIeFsqYxI83UBud0YP9e4Zt6OSJvSst4lrlLShJShhCOFMzyVfNgqcuePtYiRkPiUl4X+1tJ54cGEIitsmcXp3Zb3D27GqDpxJW3DqFG1zlhk8x0f0vYomWyUpGFZDaP46pAFphQr4Ou/SW1XkZexKDIySXzjU22vLvwgpBD3kqcssHaHNrqHgnRIj/pDsp06TROBuEQaOq0xVTabsZKsLtfATAXJ41tm4eD32jsfh+JBN37w6dmgRtW6UOU9Mqc0XTP/3x8W/OF4VgQrvy9DFjxyF6W/LK8rC08/3m1d8Df+BTt11L2FfANLQFCd4hKHdvEbikkP+ipcmPBN8aRe+YKlPh+KGxj8QDizFme9xOSAWn+CyXG/6J9nq45RBz6zyMwVIU+8q7//l5zqUYMXMNO+dAR2z+kDqyaJ6vVPr5KCpn1N8IE7I/X9V1yFDU5ssBfHteF8mBCR2G5eEWiU4TIj1BEnAkqBec7Evxyh0kt5yzkwcxSE991qE7KRzKiZX1NGBGo+dXMTKVSAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(346002)(39850400004)(376002)(136003)(396003)(16526019)(186003)(2906002)(4744005)(8936002)(478600001)(6636002)(66556008)(8676002)(6486002)(66946007)(66476007)(85182001)(6862004)(26005)(316002)(6666004)(5660300002)(33716001)(86362001)(54906003)(9686003)(956004)(6496006)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SWNST01EbVdKMDhzZU9RYjlmYnpCZ1JFSjFmaW1sTEZUODZUUlk2UTErN01H?=
 =?utf-8?B?TGpVaElGS3lzUTVlbTBWcUE2NzFiN3VaNmlQNW1tM0xDdlA5cmJMYldsYnNo?=
 =?utf-8?B?ZjlCbW5IYzM1clhKVFFxalYxZHBMOGhJdW10VFcweEhDM2swZlNBRzVpLzNB?=
 =?utf-8?B?VWJEMmt3SU1TQkZRbktiYUJrVFNNSHM0UEVxSkpmSG44N3craEsxRUlqdzVr?=
 =?utf-8?B?d1RQbnpIQjRxUGMzOVVZQVNkbVM5SUwzV21JV1RvQmpBUXA5VGtvNG1JNHNa?=
 =?utf-8?B?MFRFTS9xK21OYklzdGJRRmRLV0VKMnZlV0lERWVkQ1hydkUyTW5UQ2MrTCs0?=
 =?utf-8?B?dll0VDR4ZWo0R3ozS2xpd0RxWTR5NmxUOCszZWZGYi9JUnpkbmJPNDZZMGVj?=
 =?utf-8?B?dTFJM0h4clNQMXpaWDVrWnBBSnNyL1hWSjJUbWJyTEZaOWpCRFF3Vm1rdGZl?=
 =?utf-8?B?aUkrM1BOcnp6RXc5VUYrVFNzVkc1dDJDeFk2eTY5S2JhdFU2Ty9GUzdib2kz?=
 =?utf-8?B?Z25oYURROERpam9oQXl4Zk9JZ0VIY2NWOXU5TDVzRjlidERyU25VeWVYclVB?=
 =?utf-8?B?T1JyL28ybHhxMElJN3g0WlJtSUJsWG9JS3dpbjdwdkFEWTE0Z1JybTYyWlEx?=
 =?utf-8?B?Q1hLcTJLLzdjNXJhMEdDTVhZdmsyT3BLdnZEY1pNS2M2MVdmY1FqYWtGcVZ3?=
 =?utf-8?B?c1hIZDMxWFhMK2NqUkpYVHcvc0RWSDZGSVF1TDZnK2NzUVgwWWpxYll6bXRm?=
 =?utf-8?B?b2JyaDk5V0ptTVZtaEV5L2s3cTVKSkVkQi8yT2twYTBlNCtoYktKVHlsWFZN?=
 =?utf-8?B?YUl4NjdncWJOM2pvT3o5eUx2MzhtdGtYejgyOGNkZ2xqMk5TNFNDWTUyTStt?=
 =?utf-8?B?WHh0cGFCNlVDd0VDL3JYalZZS09ESm9EbUJ5ejgxWDJrV09kQ0FXaXBOQ0VU?=
 =?utf-8?B?YzJlSzRhWUF5TnJKcFM0aGpnR0xCTXhuMm1ueDdJYkozU0xuQnFNb3J3b1Y3?=
 =?utf-8?B?cWgxcmEyWW5YWFZrRmxJZkl1L2ltQ0hYaFRRRGRNcUVHdnNNR0FFUFNoODBM?=
 =?utf-8?B?UkIvV0NPV2NuK1hNcEFqbDlDR0cvajVGRGFud21ndXpidnQrR04xcE52dTV0?=
 =?utf-8?B?bFl0VUdDYVFaTXpQVlVZaGdVUTBIMFhaTTJWaGMvNjVDUUhTK2MxaDVVUTdG?=
 =?utf-8?B?RUVCdG1Gc0NNSTZXd1oyT1ZCZTNieE43dUphQWkwUmZtc2cyYXFhbzFVclIv?=
 =?utf-8?B?d0lZcHNqWnZiVVU5eE9wNXU3cmlPUkU5YWZqdmx2TXF4c0xKdS85MjZybzhF?=
 =?utf-8?B?RzR1aDY4NFlMdE5vT0s3UVJ6NGdhUXNkMFdYcENqd3hyYkVBNnVKYmZMbGRZ?=
 =?utf-8?B?WSs3T3JjSVNPZ0dYUEZoRE5FNm9VYzVJZTdPNjk0K2RCRXlYZ1J6VVB5M3hT?=
 =?utf-8?B?ajBZRWI4ZStmZzdOakYyNUpVWTdMenVKS3IvYU5RPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ff36eb-0112-48a0-d21b-08d8c69ca776
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 10:32:20.0979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fUa+1qDXv8G7OoR1Rvs8zB/UKGBGkexBbc91sNPtUpH+TW7/SLB3hJk8kZGI++Jz/dOccSoEZ41LPW47cCbCVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3915
X-OriginatorOrg: citrix.com

On Sat, Jan 30, 2021 at 02:58:43AM +0000, Andrew Cooper wrote:
> We're about to introduce support for Intel Processor Trace, but similar
> functionality exists in other platforms.
> 
> Aspects of vmtrace can reasonably can be common, so start with
> XEN_SYSCTL_PHYSCAP_vmtrace and plumb the signal from Xen all the way down into
> `xl info`.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

