Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E906F0737
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 16:23:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527016.819151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps2WJ-00028g-QF; Thu, 27 Apr 2023 14:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527016.819151; Thu, 27 Apr 2023 14:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps2WJ-00025g-Mf; Thu, 27 Apr 2023 14:22:51 +0000
Received: by outflank-mailman (input) for mailman id 527016;
 Thu, 27 Apr 2023 14:22:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LZ9G=AS=citrix.com=prvs=474adc217=jennifer.herbert@srs-se1.protection.inumbo.net>)
 id 1ps2WH-00025a-Jh
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 14:22:49 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fab5396c-e506-11ed-b224-6b7b168915f2;
 Thu, 27 Apr 2023 16:22:47 +0200 (CEST)
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2023 10:22:36 -0400
Received: from DS7PR03MB5414.namprd03.prod.outlook.com (2603:10b6:5:2c2::6) by
 BN8PR03MB5026.namprd03.prod.outlook.com (2603:10b6:408:d6::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.22; Thu, 27 Apr 2023 14:22:34 +0000
Received: from DS7PR03MB5414.namprd03.prod.outlook.com
 ([fe80::fdfd:97e5:7c55:82d]) by DS7PR03MB5414.namprd03.prod.outlook.com
 ([fe80::fdfd:97e5:7c55:82d%6]) with mapi id 15.20.6340.022; Thu, 27 Apr 2023
 14:22:34 +0000
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
X-Inumbo-ID: fab5396c-e506-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682605367;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ad63oPpzUqUnt70ypGC9WRVmmhmOSVpciSG8wO3Ozz4=;
  b=HnQ//PP5g9h+inAvYqEAcTyYUgi2PvJyFspPGo1xxvWSIIVkAZIF1G8u
   oeCU65jG6ZoGjKhQ1LXmtU7GpK/zAT1+A6mB11pldHuucDTE5CtJ850l2
   3K6px90YOudoiNEPQ3RNrGxiq9IUncixuuz2gBtb5gAkW10uykF+71Mcn
   U=;
X-IronPort-RemoteIP: 104.47.55.104
X-IronPort-MID: 105852491
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Oq4NjKAqkFuNAhVW/+Liw5YqxClBgxIJ4kV8jS/XYbTApG53gmAEn
 GEdCz/XPfzYZDTyctEjO4qz9kpVuZeDztdnQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G9C4QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw5vY0OHF8+
 fciJzEtM0vYi8mM54CmY7w57igjBJGD0II3nFhFlGmcKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuuzS7IA9ZidABNPLXd9qMRMtYhACYq
 3jM8n7lKhobKMae2XyO9XfEaurnxHumCN9ISOzhnhJsqBqdmS88ChMRbGaAqPulkBS9fs9kN
 0NBr0LCqoB3riRHVOLVXRS+rGSVox00VN9ZEul84waIooLW7gCfB2YJVHhBZcYsudUqbTcry
 kWZ2djuAFRHoLCTDH6Q6LqQhTezIjQOa38PYzceSgkI6MWlp5s85jrNRNt+FK++jvXuBCr9h
 TuNqUADa647iMcK0+C+4grBijf1/pzRFFdtukPQQ36v6R5/aMi9fYu05FPH7PFGaoGEUl2Gu
 3tCkM+bhAwTMayweOW2aL1lNNmUCzytaVUwXXYH80EdygmQ
IronPort-HdrOrdr: A9a23:mz1m0qh7w3c9UiuLJrl/S1501nBQXuEji2hC6mlwRA09TyX4rb
 HWoB1/73TJYVkqKRYdcLy7Scq9qArnlaKdgrNhW4tKPjOKhILAFugLh7cKpQeQeREWndQtsZ
 uIHZIObeEYOmIXsS8q2miF+4dJ+re6GP7Bv4jj80s=
X-Talos-CUID: =?us-ascii?q?9a23=3AYzbFImi6iv3PxqBmXA4iMDoA8zJubm2e9WfiL0S?=
 =?us-ascii?q?CBmdJFebORXSq35F5up87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AWVd2RQ2D56PsUlE2hjWp2+Y53TUjpKrxS28Pn5I?=
 =?us-ascii?q?/hvKNNzBqYTS4kQ+rTdpy?=
X-IronPort-AV: E=Sophos;i="5.99,230,1677560400"; 
   d="scan'208";a="105852491"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJd/WEotfqua+iIaQVGXuX94IiZrFKhWaLJLrLl79HAWMqfaFdXS0UUCxwVE2UvSpjXdNYDlJDhsVrULqdNhHGl2vEsZCvEviBBWQE2MqXjiD+gKmJW1GBldfm46hsJ47UwIFBolDnJwjXfQll0cVCNSeWq4Y530uC67YROAV7xFvf6wbA1Axnlgi/Z2dNRpCfFAW7Grb9NpNhBPLgbp77765ZzDkhcDa9Ye+HlyUwsdPMdC0ox+lp7Uu9Mow+3B7byv5XcLTIsdYedOU3f3mIrNC5jUtf60eX+tZNP5W+FX4YOCixdWDNsRsb4F0OHPtBIjQLOfE83KeBSZbRLr3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmGZ5QmJqK4pu+gOZzCUk686UjjFCwoRO4ZHGu4/hbY=;
 b=lrGEOpe8T9FiUn7OO8i3O7bRp7dvoK8jTQG/8S0qK1esidxh8tWhIp1ir1usbjj6Lu2RNMRWFI6Fd40YQdEo+93liuXTfjA7YiAnjXSItHRNrLOHNErITtGhpRj2zSuEkCZd+g188kO8pVKkSmraNVjs/5p/ua8qeumvizkfs1QRJZ+5fu+DJvKyyxxezrzfW0P7fR5/zbTh9+IyUPvepovUtfFwBDm38D1cmVc1ZGSD9b/InlkceSslsqJx5imvr/3mChwYwNpcADRln4oafZGJSVIshkkrGHeal1tH7Yp5D2oXzn6ajMhvtz+K0Ssd+8vLCgPopvTEtmARU5QRWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmGZ5QmJqK4pu+gOZzCUk686UjjFCwoRO4ZHGu4/hbY=;
 b=PZsFDKLX9TAbFLQtMQ25oMSDAwo6hMbXoiUxbOnT2VkYM/hsIGiExOgxQigAGxwntuDd7gdhgJCQHSdEMcmengQzaOOHtkkGHT7DeZl8P1qDdeWb1CrESfOacvvOYJ9OQVOZC1rFPXMKR1+F/TAFRB4RUZ4EsO1DR95oNJU+4GQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7971962f-2bfe-e824-980a-cc913ead4580@citrix.com>
Date: Thu, 27 Apr 2023 15:22:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 2/2] acpi: Add TPM2 interface definition.
To: Jason Andryuk <jandryuk@gmail.com>
Cc: jennifer.herbert@citrx.com, Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230425174733.795961-1-jennifer.herbert@citrix.com>
 <20230425174733.795961-3-jennifer.herbert@citrix.com>
 <CAKf6xpskM2k5aeLoYLfxnR9KFuK7w3NkZaT_4z-SdOQ8VUc8NQ@mail.gmail.com>
From: Jennifer Herbert <jennifer.herbert@citrix.com>
In-Reply-To: <CAKf6xpskM2k5aeLoYLfxnR9KFuK7w3NkZaT_4z-SdOQ8VUc8NQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0372.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::17) To DS7PR03MB5414.namprd03.prod.outlook.com
 (2603:10b6:5:2c2::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB5414:EE_|BN8PR03MB5026:EE_
X-MS-Office365-Filtering-Correlation-Id: ab294a8a-52e1-40ef-5c87-08db472ad7ec
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eWnie+LYwaz7izyNJMAyYsiyTToXR8jZv6eBpXCWCvGbHQXBIaic7gAHEbry2BkP1dL6P7a6ohkZcZtqoHVPR6lrjHdlzPyr5hWXGFZSR9GuPHvO+DmHpABMvFEUjpOXJYP9AcGU17JD8rEdAkPw5aNbyfORpKKvHpx3kRrk7OIPOoxtq5odlsKodBkG6WMR7HKinKrPcCmvTsqgPc1VURaeZy0hiouERnU/FAObGeYuPtwo2qSpRD5DCLtbBEbZrCxdEprTMcbhEZnw2/fIKcPOtFykS/5W6lWSV0EekKK4WBinpmLih8sa1hFq9rdJg0c+PRhKjkqt/JyBgLTjZwpffsskHosclFOpE0IvEvaeo8/qwU94gWwLX3ce1PvN46NYFWzhXKdvuex/bZweQCdkxU5ZWs+YqoR+FU6SEuEeIVNMUkStqjkW/n/eJlrXby3QKBpr5miBrkyPlVeGuB6BiVhNk73TnFZxWyAfAK57iHBvRMSHtq33blCdm1HO6/uwi5LiTLZxJ17FRzxYTi5bk2UvZRbpbaL/SEBvEfC46gW7VKHL/150BisIhwW9KQip6UBM+laledTQB16OA26oRDXVdJvyRSMTADLagMr5vtDRzywuLlz3i3XcQTeHb3MAUHEsA10Sp88XmUd/2Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5414.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199021)(6666004)(31686004)(82960400001)(478600001)(54906003)(6486002)(186003)(38100700002)(2616005)(66946007)(66556008)(66476007)(316002)(6916009)(4326008)(41300700001)(6512007)(6506007)(26005)(107886003)(86362001)(53546011)(36756003)(8676002)(8936002)(44832011)(31696002)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVI5aVNObituU29nSWx6c1BnVVZYbnBOQTdMRisySXRtMnkzblVFRnJvZjN2?=
 =?utf-8?B?N3FrMDB4aUVsUXc3d3R4U2hUcFRPbmw5ZklNWjdOdDZGZFRFRWowLy9nRnRt?=
 =?utf-8?B?RFRRdGZSdGsrMVN5Q2lmSXp0NlJVVC9KRU14cm82K3dLL2QzV1E2YmRaSmMw?=
 =?utf-8?B?bDBHZ1VWK1d4K282OE1pVkhvVzM2OEpJazlWS2d1K2NHUWd2cU03NjBlanVX?=
 =?utf-8?B?Vm00cG94NEFnZStlVlJFNWlXUE9XNUt5Z3drSW9jbjVaQTR0Q1BPMUY2ak9P?=
 =?utf-8?B?cUVTMTdKSGNSSEpsZFN3RWlTQjlwR0V1cFBzdjVUT3JES3czRjlaWjh4WndC?=
 =?utf-8?B?aVBOUDQxR0o3V2pSdDM1S2NuMHMrVHdDMGpXKzU5OHFIdzhITThjTEtKUm5s?=
 =?utf-8?B?WVcwRVRiUlBKZWZJQS9SUlExbjBkdFBCR0hnSzZHRHNmYnBaOFNBRjFocGFW?=
 =?utf-8?B?dDFadFIvdHBOelVBRldqQXdqbW5pODhaWmFVN3dqeUJTUFlaNCtFZTh5VW9E?=
 =?utf-8?B?c2NjUHNiTTNrY29nUzFoMnVOejNkcHlEcVFFL2hTbElmS3FqSzJlYWQzNnR4?=
 =?utf-8?B?SWt1OWFQbjhkbkVkbXF4NXo0ZDNsSDRhU2JrOEUyNjRYUUwzVHlkMzBPcXpv?=
 =?utf-8?B?MnkrNUhBYUJRelkrVnc3NndkZnEra3RpekJWQkVMSXZrSkc5c2g3U2xGZ3lo?=
 =?utf-8?B?TU9FV1pGYkllQysxaG5MNWRFNjNTeXVjSC80Q1h4VkZOUEpZNDBuK2VpTXA3?=
 =?utf-8?B?ZHJrUDE4aVRxbjkyYUpwOHpPZ2tKclhKeUZ3cmhTSVpCTTNVUzB1MWFMZTA2?=
 =?utf-8?B?MTV4SG1jSllEcEtRcklQR1c5SWRRUlhGcHFoSTJtUzFQalcxaEorVUlRVnIr?=
 =?utf-8?B?UWdubktYZjBsS3dVU2NQOWs4czNtNGsxOWFxcUhBMjJ2MmdPUS9yUkcvU0py?=
 =?utf-8?B?RGNXQnp6L3ZyQ0F4SURqelRGRmpjWmhuQWtwUi9YaFZrVmt2dmp1VEZud2dY?=
 =?utf-8?B?UXVQQVFJVWY4eERlQUVSa0puNThoSEpPNTVLaTFCc0pab1dtYUJaUXlJTWpV?=
 =?utf-8?B?ODNZbHc5YzBwODFoTllDNHE5cUtZWTV4KzdkQ0xkR2VNbXY4ME1kNzJldmNY?=
 =?utf-8?B?QkdkalR0NkthYjdpQVJjUTlFdDVNaHJiR09uWmQyK3c4ZUpIMyt1djlFeitH?=
 =?utf-8?B?cFpOUFFDWUM4cU9ZU0pnWTQzSGxEWWEwUjVMUEhBaEdFWHd3cE1lYUxjdzV3?=
 =?utf-8?B?d1FqbmVnVVVySXVENkQ0UGwzUEIvbStFQ21rQkt1RVczQ3ZHWmR5cHBuMjVt?=
 =?utf-8?B?dGV4NU9BOUlCdlY4aWRTd2QxL1I0ZkRJdk9JYjJZaWZtdmcxN3lNdjkvTmtj?=
 =?utf-8?B?djJERjVKTHZGVll2Yitia2lEMFZzVjVGdXdEUlYwYXdKbC9CM2JhdjBNWkYy?=
 =?utf-8?B?d3BxbUU1TjhpZHRPSXB6eWxiaktPU1JQRUZLMEFpdUx0SytENEhkdUZyalE5?=
 =?utf-8?B?STM1K1Y2NVI2TFFxRWd4YzZQTzB5R09sRDR1TnRVSFhzRDRzV3ZPLzV3Snd5?=
 =?utf-8?B?Z21CanQwT1JObTB2T00zRjJhVHdrdERka0kwcXFuajFudnZreWJUY3padDVy?=
 =?utf-8?B?aHpVN2VZNE9RZHgrK3dWeFdtbzg3eml3dXpaNlBCMTd2bFBVSGJaUm5aS2RY?=
 =?utf-8?B?QnRvZ2JidC9lNlZIMHVBakdOMWhEMEJYT0dqcnd1TS9YaUwyUXNtVGI2THFs?=
 =?utf-8?B?WVUrWE8rQU5IdXNlK2thNE9GdFVCTForaS81Mzl5aWN2VnNCTDZLN3VUMHVq?=
 =?utf-8?B?bDZyYUc4elFGV1NZbUhUUUdYYVdLeVZBVWFxSVQwUWRXTmEwKzd1NkZ4Y3F3?=
 =?utf-8?B?UVY4bzNjZzR6NytQR1lRaFp1NGZxenFGZi9EMGpJWnRXdkJHSjNIaXlaS2pD?=
 =?utf-8?B?SW8zNzU5eEptYng5UVUwMVRiaVArWndJdTc4djY2NFZqN29IaXNzM3NwS2ty?=
 =?utf-8?B?UDU4bzBVYytGbk80eWU2eGtlcmx0R2xEUm1RUkhUWmxCdGFpZXN2NFRTRjVR?=
 =?utf-8?B?bEoydzRJdUkzLzJSWDVFTDJrKzZrTmZrL2dXd0VCdi9HeXdLTXpReDJUZGda?=
 =?utf-8?B?RllPMXFONDAwZW1HZUJoREl6bEUzOVdhL0pIVzN0ams0aXlPYnB6a3pPTVlV?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	B2V6jTbwqHuq9gxOLsi1cIFn9AjOi0/LHw8kYBKtEqx2LjQA79fUOPNYjaf4wUwQW6k7QEk+jR+R/Dcf4avBSBADC0Jmu3ZdPsQUgcjtHaawV76QDyd1K4xnXZf8kQJrXRSO+87U8Tf844vCNxJBm2SEqqDAJnUjSNt51V8/pdK6ApMFQgXjmyAN6DzTru3TwBly393gyHXAQaTHp19Vau7mqbbi+QcO7uO8Ihd1fgZT+ZS/QPT+fOCUDBlJjdQtPhhkuW8nEFt62z/s36ufYmkDhqbxTBJ8Xn8YxAnXBiEZk2zDXVnGtirfd3sO5d8oYOLbzUjnGaoXexZNbdBntXlwv95PchAQg3q9zaT2kP7rleoYfElXIjfIOUvFeIsTgHv8n7hr36LiIHphCl8jmf8Doz2QJbe2ZCI2tqLDAXLIZq3XCXMbu64h2tu+9qRMtfBNTAe6RZdtvd5QFClEMkkKMH/ifx4Utgg+uQRbwikmJ1XVmw+XaLAef4LZ2W23Dbm6kxjbgggNBJxJgUBkiLrrl1zEjAgXPeil5oJXYaevBsgigwY5pZmn+pLf26y8gcM8nqT+15U81dJNTFMoZjYt1wkV7brMxFSs9235tm8D6IXHh3S/8CAQh82gGeXfI72meH0Q6BZnL7cKFYO2LdpnskiJUqVCAOrSfR3qsTzydUGpqMReekS6ABgrBkJRY8JHLeehqNHPQ7N0GzdwD5ncRpDgFsqPfA81ylIgqAoqkHwQD/O0/Q99QJQZD/APA0M0/Hae6VmODCGHKu/iVKbY0TXaZVVRfN6zN5m2lWGkGlhliQnHVLRXyIybgkNorAJr+1YoZYDnLsva+aTZ9GPOKFzioP78WH03SzSWt4Q=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab294a8a-52e1-40ef-5c87-08db472ad7ec
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5414.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 14:22:34.1715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12j0gKGNh45nF48292Fow6FqO4TQdM016DqGXVV3Jkk7ipA8TmOec/GOYMaiHtCrPpc22JbdZcGoO+3tSw0r2+YPiib7G0UFAnEkJnDECRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5026


On 26/04/2023 21:29, Jason Andryuk wrote:
> On Tue, Apr 25, 2023 at 1:48 PM Jennifer Herbert
> <jennifer.herbert@citrix.com> wrote:
>> This patch introduces an optional TPM 2 interface definition to the ACPI table,
>> which is to be used as part of a vTPM 2 implementation.
>>
>> Signed-off-by: Jennifer Herbert <jennifer.herbert@citrix.com>
>> ---
> ...
>> diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
>> index f39a8e584f..51272530fe 100644
>> --- a/tools/firmware/hvmloader/util.c
>> +++ b/tools/firmware/hvmloader/util.c
>> @@ -1009,6 +1009,15 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
>>           config->table_flags |= ACPI_HAS_TPM;
>>           config->tis_hdr = (uint16_t *)ACPI_TIS_HDR_ADDRESS;
>>           break;
>> +
>> +    case 2:
>> +        config->table_flags |= ACPI_HAS_TPM;
>> +        config->crb_id = (uint16_t *)TPM_CRB_INTF_ID;
>> +
>> +        mem_hole_populate_ram(TPM_LOG_AREA_ADDRESS >> PAGE_SHIFT,
>> +                              TPM_LOG_SIZE >> PAGE_SHIFT);
>> +        memset((void *)TPM_LOG_AREA_ADDRESS, 0, TPM_LOG_SIZE);
> TPM_LOG_AREA_ADDRESS is reserved in the e820 table since it is the
> high memory range after the ACPI data, correct?

This is my understanding yes.  We made sure to put it well clear of the 
qemu impremnted TPM, just incase it later decided to support more 
localitie levels,  but still well within the RESERVED area, in the e820.


-jenny



> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
>
> Thanks,
> Jason
>

