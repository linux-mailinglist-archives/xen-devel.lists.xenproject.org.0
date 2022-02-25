Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC85B4C4950
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:40:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279469.477199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNchi-0007tq-NV; Fri, 25 Feb 2022 15:40:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279469.477199; Fri, 25 Feb 2022 15:40:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNchi-0007sR-HE; Fri, 25 Feb 2022 15:40:22 +0000
Received: by outflank-mailman (input) for mailman id 279469;
 Fri, 25 Feb 2022 15:40:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zfiy=TI=citrix.com=prvs=0484f4aa7=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nNchg-0005ID-5Q
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:40:20 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b7dea83-9651-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 16:40:19 +0100 (CET)
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
X-Inumbo-ID: 3b7dea83-9651-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645803618;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=PKNPsUAVRvnP0bndWK3m9763yhv4YFhHq5tw/1e77Uw=;
  b=LE0klMiuiM0cxmffbjhfr0/IKogmaichF5Bhd97yEDDKNFWxMkjQxTeA
   yJNtqqM1zENPiXOEwUwB9CnBxgRT3jBp+5YuAW7WdG3wiZOOTdHel/L8F
   33H1dwW25plkOcTHJgYxiZFgspybm5R35209K9iK+B68VfPW0NeVLUAdz
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65002456
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:iLo4PqPVS7KXPh/vrR2Bl8FynXyQoLVcMsEvi/4bfWQNrUp00GRWy
 GFKXGGCaaqLMWv2e9x1bo3i8ksFu5WHy9BjSAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZj2NMw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z1
 fBziaCrciUTfaTNls44VglWGgcvBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmpo3poSQKi2i
 8wxcBVpXgz6O15zHko7V54ujdeH3UChbGgNwL6SjfVuuDWCpOBr65DvOtfIft2BRe1Og12V4
 GnB+gzRHhEbL5qe0nyMqna3gennkibyWYZUH7q9ntZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6dayaCwZoCjBVvi+ifC50NCHYoLewEn1O2T4rfx3TqlHVMmdH1IadIMkcomSzUMh
 2bcyrsFGgdTmLGSTHuc8JKdojWzJTUZIAc+WMMUcecWy4K9+d9u13ojWv4mSffo1YOtRVkc1
 hjX9HBWulkFsSIcO0xXF3jjiinkmJXGRxVdCu7/DjP8tVMRiGJIiuWVBbnnARRocNfxorqp5
 iFsdy2iAAYmV8DleMulGrhlIV1Rz6zZWAAweHY2d3Xbyxyj+mS4Yadb6yxkKUFiP64sIGG1P
 RCP4F8MvMcLZBNGiJObharrWqzGKoC6SLzYug38NIISMvCdiifdlM2RWaJg9z+0yxV9+U3OE
 ZyabdytHR4n5VdPl1KLqxMm+eZznEgWnDqLLbiilkjP+efONRa9FOZeWHPTP79R0U9xiFiMm
 zqpH5DRkEs3vSyXSnS/zLP/2nhRdSlrXc2t8pcPHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2Popu1NXqjhRrX5RARAGs=
IronPort-HdrOrdr: A9a23:pjBg+a8doP2Nw4QSlyluk+E6db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc29qBTnhOJICOgqTMqftWzd1ldAQ7sSi7cKrweQeREWs9Qtrp
 uIEJIOeeEYb2IK9PoSiTPQe71LoKjlzEnrv5al854Ed3AVV0gK1XYfNu/0KDwSeOEQbqBJa6
 Z0q/A37waISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGQ9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9wwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgjf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosPD30E1wsa7VcKM0lN
 gsAp4Y5I2mcfVmH56VfN1xOfdfKla9Ny4kY1jiaGgOKsk8SgfwQtjMkfEI2N0=
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="65002456"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwcSFqdMIJhPibQL3kKzcBIiWcSyFaZbsukoEYGlWaUp9c0+k5xE34SvUJwqshuqgb8o5CppxWbKBCZfxmc3QxaEYFqSLflGFWCbT+G+DaLE0rYCdLOpXXFcFVjwqYqL/2pCxeuXPFHvkWv+2gd/jFzXLQVYjRiYbE9Miz+pd2PQ3dQJ6UfSpYHXTX0L8cOk+08JXKdbQ+Zc6BSyqntH7bK/boCqpIACoxPf/gKH3B5jv8FXFITEgLs5JWkXqj796ZT/Zdg35BEL2nJLViCD6Lw8nOBkyLrCRwhpPaWd+OtdnTqOB1uN01/BfLUXYurNdUDifiK0iBuK3wqQ2uJlLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQfSCOTOAbixao4uPBP8gOpZAnH8IT6a2fwSzdK0eqA=;
 b=itGqQrbV0vRP+wppWeoQ4NH2DrfYbptbjFdF4XF4lYSBm00O9FyhZdNqjOFrfT8aTovP1A1AsLkKFcxwyGPu1tD8TMmVbXPGHss4bS1714pzhaSMa5HYQiihnJqEsoRFhy1ZwR62xqyGrDcqLl7TT4nUY8BtKnHiiMjAPx8issFXcUr2RUtT9pzO324EMJEFTSwCN1XInRNV59NL51WZRtMqy7hNNZ6vsHF2UmnrHPIh8h2QFFPvqH1sQz0hmN31q85dIYixWMqqgJS8zxhel/AEtLuwoaKnclE2w0NpfQMliIH4+wOUeVX01OEHZq8Tk2SAFGt92HkDLhezVz4O6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQfSCOTOAbixao4uPBP8gOpZAnH8IT6a2fwSzdK0eqA=;
 b=S6DqQWhnAmORM976B9ASfaW+nMf7T2ewscm+xpRHmukanZz/4rXAe6yemSfmxeYCCvLOQpce98UsrYrkxD4aH8gaPRPHABvmr6v0yBAGm5z8O207rZ/F4mpD0wlD7/MsAIMGzM2eo5ufNdE22I7SFFw/ryfGs2nyrst1lBe6RzA=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Alex Olson <this.is.a0lson@gmail.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 2/2] vpci/msix: fix PBA accesses
Date: Fri, 25 Feb 2022 16:39:56 +0100
Message-ID: <20220225153956.1078-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220225153956.1078-1-roger.pau@citrix.com>
References: <20220225153956.1078-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0131.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f0a5903-821e-46e2-66ee-08d9f8751dc4
X-MS-TrafficTypeDiagnostic: SN6PR03MB3982:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB398206BA5E36077BCF3B71468F3E9@SN6PR03MB3982.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wbt13kLn8Fwcd0NK4EL8ek8xPH0MHAhU04pR0ay1DStH9FyNX1A2fGCCnT/YwWylAF8h1Ka/WsJKfbqsud9WHLWQmmpQyZkflCBLY67iKTRIykvB50CUjrNIyxO5FV4qcsbON60DPAlg54+gNOG0DYF3rX25Hwh9/wGAhbqKC+rVCSj+6SUJkXz9KlSlJ3kHFDst+yOK/ZaNPNw3oEfypM8e8iz97EKlSJ0wkg36iSbTMxvxuKSniYKAt0ITxxK82PsRubG5/g15BbGBxd85AU97xnI8GA8zYzI96zZMGF+SsgYVidNhJtY4Qy1TYyHzIwsivNgjzAfeD1IsFMv0MYKgTRU1Cx/D98veHLwwBAHbmsa8ASgOzzM5GUWXZUV5IVsZE27Qf/pDH9NLN/MEAgPRHJeloR/JZ4iiW8fIRq3D7TpNk07LTIsoMvQNzc6m9Vqwg4iQFcRMFbzU3DR9t75G27fA8SxLKTEj5J8bT1ZBjeYQrxBXt4YhGg5oWmHYzNq0gP56/SPzvDexZpHzVvdJ+wXdT6eukNX2+4+SLaX/ZZRHF406F+p62/c/+wJRsQuOYhGQffDsCKtqpWebi0L3Tk+n3aCxdcUIDaA6AyN4otgL9yIuAHhC1Le5lo+HIcAjZQtLHtDaaa/EbV59PA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(1076003)(82960400001)(6916009)(83380400001)(6666004)(54906003)(86362001)(2906002)(26005)(8936002)(186003)(36756003)(316002)(6486002)(66476007)(66556008)(5660300002)(508600001)(2616005)(8676002)(6506007)(66946007)(4326008)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2JRcWJYNHFKK1B6M2JHbUZWeTBLbkZXcGhTdkROYytDZWp5RTU2OFlVQzhR?=
 =?utf-8?B?aVVQZ2VsWFJhRFRvNEp4UDcxcU1JZ0wvQlBVbHZ6WnhXZVdmbURVbXBXaXVv?=
 =?utf-8?B?azJqSzNtUDlrc08wVW0vSEhXRlZVRW5DMVhXSkFXUTdsUWJsSDR2MGEzM0Vs?=
 =?utf-8?B?TDd2cUpMeEVSd1ppeGJWY0xnNS83aThON2NPQ2tlWjMrZ1dHMHgrTCs2bFBP?=
 =?utf-8?B?dFRpd2dETWJ6RzN6MGh6YTRFdnFuRXc3T2lZMkNEOG8vekQ3N0JaSEZLRUx6?=
 =?utf-8?B?UlJNdUZEOWJuR2VFUmJ3bG1QeTBQZGUzNVR6L1BvWHprT2xuSUxYV0NZMFB6?=
 =?utf-8?B?Nkl4S09VUVBXaE1oTk04L2hRMkZnSFEvOVhBenFqTE1BRnpLT1VvV09DNTRo?=
 =?utf-8?B?b29lblM3M0ZoY25OM2pmRUxYaVpYU0ZjRFMzdWdtQ2RBcXp2YWUrOEV4Nmgz?=
 =?utf-8?B?ZXpqbkVmM3FqNDl3RWdSbTkyaERPeCtxNnI1VDVPcjFmSXpYUnZ5K2FqL0hq?=
 =?utf-8?B?SjZ5KzlTVU9pV3ZxYWxSd0xjYWJlL2luTFYybzk5d0F6c3hRb1JVMldSMDJm?=
 =?utf-8?B?VHB4bjNFdWZydU55TXJuYXdMV1FZcHBhSWIxTUtieHRGZEJQdXRmeCtVa084?=
 =?utf-8?B?NVlWM05URUd6TVJaUXczL2RPSHpQcWhZdnJDTjQxMjRtTGhGNTIvQ2tzRjha?=
 =?utf-8?B?UUlpcUQyZHMzcnlYckhYZi9ocmxjRXZ3VTF6UVJNeDZta2VSVjVtVFdNL0o1?=
 =?utf-8?B?enkrV3FsaXg0MDhBNzI2Ny9IUXUyQURUVG16MHdhTzlMaUJpWnJPS1pPbE80?=
 =?utf-8?B?bTllQmNyZXBhblBpb1plRlNzbkN4aWJpU0ZnZGErd0d1Q3NCaXFxbFRJTUpa?=
 =?utf-8?B?NWtpcVkzbkZ1Y09Cd2VYbnZUalk4OXl6MHc4UUk1MXJ0YlgvT2w4S2NPMVg2?=
 =?utf-8?B?VERlMWNEd2xEWWhBUVlXN1hrdG8zSVBjVTFPZnZrMHFvOWJmRHdUV092RW9M?=
 =?utf-8?B?Zi9hNWNzWnA0V0dURUtGUEg2U1BvTm8zcDFjRWNPeHN1MmxmZ21PS1BlQWZM?=
 =?utf-8?B?REZFR3VPTFl3TUVXQmpaZ1BmcTBsV0pmWWdaUEx6Zjk3WHg1ZFFsMW9KZmFH?=
 =?utf-8?B?bExoUzFFbnczRjdLNlEwSFQ2cG9HVktqZUJ0Q3pLNGdDcWljT1BVc3FsVHpy?=
 =?utf-8?B?cGt0Y05DL2lrTHN0VEpFWVF1Y2t4V1FJNWxLSFBPVTJ5R2JDbGxSOHlnalMw?=
 =?utf-8?B?WlkzS2g1ZDFwdUdnR3NRem1oNXo1dXMyZXVjRUFYQ1Z6NUl6L2NGTGtCdGNB?=
 =?utf-8?B?RkpvNUhLZUxWeWhIdmtQNTJ6T2gzQUp3bk5YbmJMVCtNN0JVdGZUNzRPQVJt?=
 =?utf-8?B?SHU0SUpSWkQrYy9yNkFlUWxQUWNPc3JkcE5QbXpDZ1pYekFBUVVJdkErVlNI?=
 =?utf-8?B?QWxCazVWbmRYb0thTGFCTFN0ZjdrNVNGaHpybmFQUGNpT0t5Y1llUmVIdStl?=
 =?utf-8?B?d1U0a0ZEY2NyTE1Qd2lhakV2bHVGcTZzUmh1c1hTN3hvSjJoa1ZnS29LT1h5?=
 =?utf-8?B?OGo1RDlaZlc0YklKMk51QjJSRUxjYW00NXQ0WUhUY3MxQ1V6TGJOcTZhcHU3?=
 =?utf-8?B?eVNuYTBYZEZtM2Y2SWU0VHNIZm15NENaR3dWSzVyRzFXQjhkbGE3QnlvNEVL?=
 =?utf-8?B?Y3MwV2wweTgzaUtSbGROZHYvM1YxU0N4SmFFR0l2bEJsQWVzR3NISlZpY2ho?=
 =?utf-8?B?RE84M2VlRElyd3MvQytvRHFFb3FGb280VGVxaVI3ODdWYUN5ZjdRbEhXSk1u?=
 =?utf-8?B?cXVJOVk4ejBrOVEwRTJKNHY3N3kwaGNmWVVyMGx0RHVtSTVoOUlaYVpvMFF2?=
 =?utf-8?B?N0xueGtNV0lpWnZrL1VwMFU0blZGU2ttSGM3bnVKMEZLRjAzOFIzMzVKSnFV?=
 =?utf-8?B?UUlzSWtNWU43UlhjNzdWQXZvSzR2T0QrSDJubU5DTHhVVkRZcytZeVVQVDd6?=
 =?utf-8?B?VnhFTjZxV2xQVHFoU1YvVmx1WThqbmd3K2FjbFltR1ZzSnRPYmEwRkpjeUV1?=
 =?utf-8?B?TFZZa1V3dG1PeS9PSS9QcDRwUTNuMEtHanV3QVBzcm52QkkzM0RqT2craXJl?=
 =?utf-8?B?ajA1cjJUbklYVjNLQlRPdUFRZys0V25SbFlzeDh5YVdEWi9UaWMrUjlBeVZj?=
 =?utf-8?Q?hI2pmLaJN4Gjy8G4njuKai4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0a5903-821e-46e2-66ee-08d9f8751dc4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 15:40:14.5002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hFxBudelBJC3FU9hBW/E82GLXa5kjgP2QlxAIoja7rDGvZADcHof/qVQK9bASV7vN+DmmYGU70HmahFdAVJYhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3982
X-OriginatorOrg: citrix.com

Map the PBA in order to access it from the MSI-X read and write
handlers. Note that previously the handlers would pass the physical
host address into the {read,write}{l,q} handlers, which is wrong as
those expect a linear address.

Map the PBA using ioremap when the first access is performed. Note
that 32bit arches might want to abstract the call to ioremap into a
vPCI arch handler, so they can use a fixmap range to map the PBA.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Alex Olson <this.is.a0lson@gmail.com>
---
Changes since v1:
 - Also handle writes.

I don't seem to have a box with a driver that will try to access the
PBA, so I would consider this specific code path only build tested. At
least it doesn't seem to regress the current state of vPCI.
---
 xen/drivers/vpci/msix.c | 55 +++++++++++++++++++++++++++++++++++++----
 xen/drivers/vpci/vpci.c |  2 ++
 xen/include/xen/vpci.h  |  2 ++
 3 files changed, 54 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index a1fa7a5f13..9fbc111ecc 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -198,8 +198,13 @@ static int cf_check msix_read(
     if ( !access_allowed(msix->pdev, addr, len) )
         return X86EMUL_OKAY;
 
+    spin_lock(&msix->pdev->vpci->lock);
     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
     {
+        struct vpci *vpci = msix->pdev->vpci;
+        paddr_t base = vmsix_table_addr(vpci, VPCI_MSIX_PBA);
+        unsigned int idx = addr - base;
+
         /*
          * Access to PBA.
          *
@@ -207,25 +212,43 @@ static int cf_check msix_read(
          * guest address space. If this changes the address will need to be
          * translated.
          */
+
+        if ( !msix->pba )
+        {
+            msix->pba = ioremap(base, vmsix_table_size(vpci, VPCI_MSIX_PBA));
+            if ( !msix->pba )
+            {
+                /*
+                 * If unable to map the PBA return all 1s (all pending): it's
+                 * likely better to trigger spurious events than drop them.
+                 */
+                spin_unlock(&vpci->lock);
+                gprintk(XENLOG_WARNING,
+                        "%pp: unable to map MSI-X PBA, report all pending\n",
+                        msix->pdev);
+                return X86EMUL_OKAY;
+           }
+        }
+
         switch ( len )
         {
         case 4:
-            *data = readl(addr);
+            *data = readl(msix->pba + idx);
             break;
 
         case 8:
-            *data = readq(addr);
+            *data = readq(msix->pba + idx);
             break;
 
         default:
             ASSERT_UNREACHABLE();
             break;
         }
+        spin_unlock(&vpci->lock);
 
         return X86EMUL_OKAY;
     }
 
-    spin_lock(&msix->pdev->vpci->lock);
     entry = get_entry(msix, addr);
     offset = addr & (PCI_MSIX_ENTRY_SIZE - 1);
 
@@ -273,27 +296,49 @@ static int cf_check msix_write(
     if ( !access_allowed(msix->pdev, addr, len) )
         return X86EMUL_OKAY;
 
+    spin_lock(&msix->pdev->vpci->lock);
     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
     {
+        struct vpci *vpci = msix->pdev->vpci;
+        paddr_t base = vmsix_table_addr(vpci, VPCI_MSIX_PBA);
+        unsigned int idx = addr - base;
 
         if ( !is_hardware_domain(d) )
+        {
             /* Ignore writes to PBA for DomUs, it's behavior is undefined. */
+            spin_unlock(&vpci->lock);
             return X86EMUL_OKAY;
+        }
+
+        if ( !msix->pba )
+        {
+            msix->pba = ioremap(base, vmsix_table_size(vpci, VPCI_MSIX_PBA));
+            if ( !msix->pba )
+            {
+                /* Unable to map the PBA, ignore write. */
+                spin_unlock(&vpci->lock);
+                gprintk(XENLOG_WARNING,
+                        "%pp: unable to map MSI-X PBA, write ignored\n",
+                        msix->pdev);
+                return X86EMUL_OKAY;
+           }
+        }
 
         switch ( len )
         {
         case 4:
-            writel(data, addr);
+            writel(data, msix->pba + idx);
             break;
 
         case 8:
-            writeq(data, addr);
+            writeq(data, msix->pba + idx);
             break;
 
         default:
             ASSERT_UNREACHABLE();
             break;
         }
+        spin_unlock(&vpci->lock);
 
         return X86EMUL_OKAY;
     }
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index f3b32d66cb..9fb3c05b2b 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -51,6 +51,8 @@ void vpci_remove_device(struct pci_dev *pdev)
         xfree(r);
     }
     spin_unlock(&pdev->vpci->lock);
+    if ( pdev->vpci->msix && pdev->vpci->msix->pba )
+        iounmap(pdev->vpci->msix->pba);
     xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
     xfree(pdev->vpci);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index bcad1516ae..c399b101ee 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -127,6 +127,8 @@ struct vpci {
         bool enabled         : 1;
         /* Masked? */
         bool masked          : 1;
+        /* PBA map */
+        void *pba;
         /* Entries. */
         struct vpci_msix_entry {
             uint64_t addr;
-- 
2.34.1


