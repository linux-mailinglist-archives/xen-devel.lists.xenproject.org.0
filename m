Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE63573548F
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 12:57:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551002.860274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBCYf-0002ox-6g; Mon, 19 Jun 2023 10:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551002.860274; Mon, 19 Jun 2023 10:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBCYf-0002lc-3V; Mon, 19 Jun 2023 10:56:29 +0000
Received: by outflank-mailman (input) for mailman id 551002;
 Mon, 19 Jun 2023 10:56:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/FHF=CH=citrix.com=prvs=5274193ea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qBCYd-0002lW-Eu
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 10:56:27 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed71a257-0e8f-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 12:56:23 +0200 (CEST)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jun 2023 06:56:18 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5639.namprd03.prod.outlook.com (2603:10b6:5:2c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 10:56:14 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 10:56:14 +0000
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
X-Inumbo-ID: ed71a257-0e8f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687172183;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=g04rSargJUeLsEGWzHqavvbAGo7qxRFObe3WdUX9kpk=;
  b=JJe/mdffF2JX61N15zAEjjrqC0S8jbNXHBlj0QTxAOQtSdWequfPo8M3
   kS3uhKvfCc9RUI2gwAb4l5MEUW4JHzDp0nlnnkLwMFq0Khb78Jk/HS4NC
   jUXD7X6xft3bYB5DPDSPiuZjol6rWR7gyAziEEqrt+eZQ09FsGtQmR/QF
   w=;
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 112636575
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:eS8HLKOTHg/VjtPvrR2UlsFynXyQoLVcMsEvi/4bfWQNrUpw3jcCm
 mIWUGiPOPaKYzH9c993YY2y8EoHv5WBz981TAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5w1mPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uMwEDhfr
 +YqFGkcN0Hf38C36b6AcPY506zPLOGzVG8ekldJ6GiDSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujeKpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxHmlA9xPS+DQGvhCu2GZmWAWCC0qVAWivuSCrB+VdtBNJ
 BlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQNcvrsMxSBQh3
 0WFmN6vDjtq2JWOUm6U/LqQqTK0OAAWIHUEaCtCShEKi+QPu6k2hxPLC9xlQKi8i4SvHSmqm
 m/T6i8jm78UkMgHkb2h+kzKiC6toZ6PSRMp4gLQXSSu6QYRiJOZWrFEIGPztZ5oRLt1hHHY1
 JTYs6ByNNwzMKw=
IronPort-HdrOrdr: A9a23:7QgcXaBJJWLdh/XlHeg4sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+UYssbQb6KS90KnpewKlyXcH2/hjAV7CZniFhILMFu1fBOTZskHd8kHFh4hgPO
 JbAtlD4b7LfBRHZKTBkXaF+r8bqbHpntHK9IKuqwYLcexzUcFdBkVCe3im+yVNNUl77PECZe
 GhD7981kedkAMsH76G7xc+LpH+juyOvpTqbSMZAVoC5BOVhT2lyJOSKWnX4j4uFxlIzLse72
 79iAry6r+4v/zT8G6c64bm1eUUpDKt8KobOCRC4vJlZwnEu0KNXsBMSreCtDc6rKWG70srqs
 DFp1MaM8F6+xrqDymISU+G4Wjd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7gV6xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklT6voJBiKubzPLd
 MeUf00pcwmK29yVkqp5VWHFebcAkjaHX+9MwE/U4KuoncmzEyQCSMjtY4idzw7heAAoqJ/lp
 L52n4BrsALciYnV9M5OA5Ie7rDNoXse2OKDIvAGyWgKEnwU0i94aIeF90OlaqXkdozvcMPcb
 z6ISRliVI=
X-Talos-CUID: 9a23:TpckhmNIlXi0CO5DXW52rV9OAPIZK2yEnSuIAU6RBV1TV+jA
X-Talos-MUID: 9a23:5nHjdAZ8CbyZyeBTjAPm2z1nNPdU4vq3F102t8QtlsuWOnkl
X-IronPort-AV: E=Sophos;i="6.00,254,1681185600"; 
   d="scan'208";a="112636575"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/iX1SrsfyQw9o9RR6HdxBsieshtWg3RHFnEZQew8qj1g82N77+99q5PKcqJtpSaK9AMxybJVAY1LYntf2JzSAFgTsvcAw4jlBu5oFpVycbwCWJv0CpHxIdTFMyq/1pkyoUDsz3ZGShqDlgeY9yLcDB/BGpdgGCfi+Q2pqm9LbbN/BAf3OCL/rJPCRPyyQtspi3xMyyvi5AGH+gExYZ6htYavTF6PgWUjzCtSFJTrB9C4L9ymTxfNs886b1Qy2H/+Q7l8BWrLBkewknIUD2BvLVWxd+0abEjBM5C8B2QZqhTJDFqloJyXAVyu+PW/w7qjwMs4SiwkGTuy1+epuEDVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g04rSargJUeLsEGWzHqavvbAGo7qxRFObe3WdUX9kpk=;
 b=FwYFEFA7Cs0W1jHZauEw0opIGW9kPu16OfocAFAkrOu8ioC1aUx7uWzwmHgUBLPhlBYkdtmxzK7HdEeXKEWZRAUP7m+QY6eWHU5Ex6dq2v+y4t05w7EPBNtDiNA3Ue4OBveJLJRf2PGQd3i2mf77+Afvea0Vs5gDd9XK6xEguXwHItL/GJLAzJS5x2fJfkAFtZLPAX7vWfDu8LscXIafuqYs4xlA6GMX6mUaAuLO9B24OIyDcT13fK4nYophhzfNzX1kuDipehmyN36cJ+wQbFS21VgqFx9IwG+pkm3Te2qIYc/CC7U7ZaQAZdfxNdojP3e08p+hrRM0r3Gvs6VSVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g04rSargJUeLsEGWzHqavvbAGo7qxRFObe3WdUX9kpk=;
 b=iZgLUaKgyW/83oAwdX1QB4KC+jXa9PKWMkJ/JlGikJShvkCi2j/E/vIS2uVpjy6IRk0GycD0OS6n1zhq+5zVJROxlx5WBk03/LJA6VGADop9oZrLyRfVhz5pwLKJVZCvztEcfQwMdjz5O1xavKotRV2gAGCQEL+jgFJnUduENe8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3b9a51ce-40e5-4895-4eb3-781429ad5072@citrix.com>
Date: Mon, 19 Jun 2023 11:56:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH] automation: Disable QEMU build with Clang older than
 10.0
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230619090932.47957-1-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230619090932.47957-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0052.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DS7PR03MB5639:EE_
X-MS-Office365-Filtering-Correlation-Id: 2415f903-f6a4-43cd-c1e2-08db70b3ccb0
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sMUkboeAmukinI7ReXMUWMwAyim1S4DMwUiMXtdRjWNXRHsE2beCyw1bDbIBzLocgiNPWeaomixr0bY2OVuZLNCTP9kH8JaTCIE/j+ilSVihI5FyDlg3K6wwaRcjL4sHrOLtRg1CiFG9bkjaen+cv0L8Sw8clvz4c+uY2U5GSSl37AebeuQIz1n+Xg4PNkMAH5VWYbAkIewlOo1mNlvvsvIDzi23JmhLzss2TveSWZjEKm3/UOi1EoKTEKGHslImCM/zJsuiWjGHD7kDnYPRc9fcIYNoMFoogwtYgIDtZOQhWFr5Bdhn2qpAfltu8CkvqVKqVATGTFUx6P3wOIcG1nQ7iPnQYta2egm4XoUuj4d790whv93fei4WJ6vWlzO+ehOU8TOnb4HPOoaQ82oMKHFId5uMr30rm+DpnHN9Ymp/9QcOEcCws57wKfIKLy72zRWmFP+0STZ1upWpHfCyIkTzlgRTrGMjepJV2kJ6cz7y1eFpmkvnPp/WV5L+wZEamg/Kpi40WJ+swAwAQg5ARib4oH89zQCb/H8vIHxmCwmzPwcdTTaatL0DaszQKJ1BeJ4kwhm7D4qXII2CVJ5lD+GXh5PMAF9niuIhvC3/Lmk41NMKEtabnm3FbobYc4y3C3uWNIRhspmIwTfpHpeu2A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(451199021)(31696002)(31686004)(82960400001)(38100700002)(86362001)(41300700001)(8936002)(8676002)(5660300002)(66556008)(66476007)(66946007)(316002)(2616005)(6506007)(53546011)(6512007)(26005)(6666004)(186003)(6486002)(478600001)(54906003)(4326008)(2906002)(4744005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUk3VU85ZDNDaGhNTm9BdXBicTg2M3ZTajNpalQzWUtsQW9teGJSZ1oxN01p?=
 =?utf-8?B?UEVmRi92cnppS3o0d2RrUFRpT212cDJBaFRrRUI3N3Z0MEZ4aUhpL1RsV0d1?=
 =?utf-8?B?Z2xESGZGVzRHTk5IQ3BHTWRpVFo4M1JSdi9YdUp2VzYrdEdtWE1rVkhWWStr?=
 =?utf-8?B?Nm9sWTdKRkpYYnBQQkhJY1pWdDVVejl3R0wzUmdMSERtUmcyZDVPWUdlc0Jv?=
 =?utf-8?B?MWNJek9UNHJFUzNiK3QzWVNpZTN6ZkVYWGxqK1NnejFpZFplM1p5eWEvWUZq?=
 =?utf-8?B?VEV3Q01PSlZ5WWJJSm5jSDd1YWh1NTdMN3NyOVU4V1htL0dtdWY0ajM3eEZJ?=
 =?utf-8?B?YmNvTGxRekpPejlTL3hkczJkN0cvRmJQQ3pWRFRRZTFZZUVhVlRYemc0RmQ0?=
 =?utf-8?B?NzBkb3RaOXNvMVlsVDM5N09QRDByUXZJRmRiSnBnUFBLN2VPZXhsdHdwdkp4?=
 =?utf-8?B?ZzhvakxlYmd2bk9SRVk4bks0a0FxQi93OWxKYThOczMwTWQxRHNpNjl1QkFH?=
 =?utf-8?B?MkVGUXZ6VFgwNzJhVW1UWjFGNUNTNE5OL1VTYnZiYnJaaWMrV3N3Z2lydEFI?=
 =?utf-8?B?M2xSbUE1ZVhJdGozWHJBV2REdEwwQ1kyeW1wQ25nbC9tbHByNjkxZ25nelBq?=
 =?utf-8?B?K1ZrRWVOd3hZNDhHd0xoYzNnSFF5TndjMUIza3dxK2NZZERDekZrcm1Ic2M5?=
 =?utf-8?B?NUM2MW9remgvN3lWSWtuQWd2MFJzVmNvK2dEODcyOHlNWVR6THExRzlpU0Qw?=
 =?utf-8?B?Y0YwWTVpNHQwNkxMdHoxR2VXMWJ2U1FhWmJWM2t6dkZjaU92cTQ2aHByUm5t?=
 =?utf-8?B?ZHlZS3NZaFFEL2dBdTB1VC95S2tyTE9CZWxZOUxOM0NDTllzMXBwZnNvWTVx?=
 =?utf-8?B?ellDTWFpNE4raWRuY0pFWHJ4YlM0cCtIQUJPMk9QTyt1RHJMTTV2VFM5aHVk?=
 =?utf-8?B?d2p4ZGloMXplMW1WSWhKZGN5Zmg2YTBEVXAvc1oyQ0crTVYvTndsM0pjWFhR?=
 =?utf-8?B?QlZjWVFHaUlDQ1k2OGc4OHNEQ1ZnSFFBUGJIdkdDV0hlTmRhNXVKUGRHbkpP?=
 =?utf-8?B?VVJnSTNlQ3M5Zk00eHNTMUlJZnQ1bG1rcXZNUFRxamc2R2FrOVhyckhhUDdn?=
 =?utf-8?B?czZCbVhQWDg0ZmFMeTAxajhrYXRUMmRlSVBtdjdRbGF4QmZIWURMYUtObFJV?=
 =?utf-8?B?NnpZelVJbVlwZlYyMGxVRTZ1M1lId3oyU204c3ZKOHBiTFpEWE9BZ09obDdL?=
 =?utf-8?B?UWtZVHhVbms1L2xadnlFTFQ3eVBoSVhoR1BOZFB1N2xrcWJWVDlJUzFCMk1o?=
 =?utf-8?B?V0ZhbytXbzIzYUxsd1FEY3hEV2NTMENkVWZJNWlld0RPZHlPOFpVZDd4Vm1u?=
 =?utf-8?B?aXlTWG90eWlzeHpxYVZrZ0FGSzJpVm9SZFFqRHYraXFrakxoWGtRUUQyRFBR?=
 =?utf-8?B?ZmhHTlhZdk5ndHRaV2dSWFJTLzcvMzRrNVBYUzVORmJwak9xSXpLZFkvZlRa?=
 =?utf-8?B?aGswMEVqTFRTRkFidGRiTGM5QUxuQldKR3VhTnhDYmpQd0RxN2FlM1VITXph?=
 =?utf-8?B?WlpoTCtpOHFFTTRhSnVRaWMrVjdIUkVVZUFjVXIzQmt5bS95TWRZcUNDUXFO?=
 =?utf-8?B?TnE0K0Z6K2Q2djJudk02MGhwTWIyRlUyd2c3SGFpTmplTlUvbGpUZ3Ewem4z?=
 =?utf-8?B?emc1VXd5bGc0VTBTUCtGdEJsYm90WFVYREcyWkpLUmlEdUgrTzVaaW1WSkk4?=
 =?utf-8?B?amRibzJlVTNhYmg3VVFvU0daZGowTDdjTE1GSHg3MlQ0cVdaTDA5eW5QV0Qv?=
 =?utf-8?B?QkErSThJdDNoRVJHZ3ZJd1BobERMSFR1V3JxNjhqeVQ2LzhSTGNhVVZsN0RH?=
 =?utf-8?B?dmdtQzZ5MDYxU2pyMFFVVjViYW4wb2dMalRsV3V5Nit4ejVCTHFjaUpuN01I?=
 =?utf-8?B?aEJ0WitHb05ERU5UY2VjbHhwNS96YlhVQkNQZUxKM0g5bzBkN2hWZ1N6WEJ4?=
 =?utf-8?B?QWNDVFcyUzdTcFNsVTN3eFF0M0lUSFZsRk10aVV2cmYyV0Jva2R5eHpQTk1O?=
 =?utf-8?B?VUVvQmpRdm9iNW5iZ2xMSFdYbFZLU1oybmU0dkdHbFl4U3F3cjNRdXVheXBD?=
 =?utf-8?B?L3NCZ3pyMVI4SU1zbkhITUJTcEJYRUV4QXhHT0d1OTlwc3BXTGFZVUlwbDBY?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ClRzRU8JUGGQWgjIP4JZLkhxePdtknSR3Q08owDjTNW2NGetC6HWA9tGK0vMlpkmUX/Dyj8DMHjErFeKkJs7aS5Iz263ilLqjPNh5+Wj0YJaTUnjkY/tGRC+flYV8OOfDCYhMwP+5zhQ1nEMzEy/LH+Yfq8/PxLkJvSjfdyYdl0mZV2qdJ3GRI/PdUF4CcfpZ1gQ4UVTyfG/E85jhrobCU9NYhPfhAEFRS1ryNSanPjx++Gpc8j6srN3/+cciGHLer3HNJQtxx0u6eEIlSQLJWnMD1nXsalBjn//gv6xEw6yYb4zXOS2AglMh+2G4TKZ7cWeIiY9fGK52k9yw7EI4YQCG8EzYt38/9WKhYE0mToHFEqiyPwi+E9oMTnjXGBS0YXe2Yiwl7OhCApEa+jJQ8VIh8VH9ffLJgCMJX2bFi25OxiZE4B4voMw8OYvTrDLBrkvxft/vcCnc/7UA4Lo3UyMLFGBF/eZmyHWWwps1wc0L6xktLwZP/Fpmc6YYmdBZODAqQHrbk4yglZ4m8YSx45NqKXH/pNQj04N2rfF9kgIBarU7Cxf2ApOyCzwWk4Jgyqc4sN9lawkdPybUcnYvVjPWQ1hRgnB8mcC9juW3qkES8HttTwvKmWxD0hTncUgl3uVzvS50WVTTtjh9FwU/sgTDPK5qur7G8XeMcul3/I9myQ1oWXCdeBwk9cQtPkF/RZxxz3xjgHqZ4QeDWz/Afp21+DsPKyQI8drLELrL1cqsgpVyMBxQRXCbs1wpfYjKSSejM4RkX92Kl3r5CUDp3mwe2zhjSBGDwjgF54QxGSeJnAbRTuwNlrgk0EqaD3WFky5H1cA51fMT6fP9AADeA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2415f903-f6a4-43cd-c1e2-08db70b3ccb0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 10:56:14.3551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BJpKPORHhZzaEWnj4WXt28QSynK9rbi3kNWnTmcKLvpljKJBJ0cCoxkySYnAo6XjqfSZqQEPG1djHGQpP3vOWtV+i/6P0gtnS46J889VvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5639

On 19/06/2023 10:09 am, Anthony PERARD wrote:
> Since QEMU commit 74a1b256d775 ("configure: Bump minimum Clang version
> to 10.0"), or QEMU v8.0, Clang 10.0 is now the minimum to build QEMU.
>
> QEMU 8.0 fails to build on Ubuntu Bionic.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Lovely...

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

