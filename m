Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA917BB66C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 13:29:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613552.954137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoj1O-0004XF-13; Fri, 06 Oct 2023 11:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613552.954137; Fri, 06 Oct 2023 11:29:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoj1N-0004Ub-UL; Fri, 06 Oct 2023 11:29:29 +0000
Received: by outflank-mailman (input) for mailman id 613552;
 Fri, 06 Oct 2023 11:29:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Twl1=FU=citrix.com=prvs=63654eace=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qoj1M-0004UR-5v
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 11:29:28 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ac44fae-643b-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 13:29:27 +0200 (CEST)
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Oct 2023 07:29:19 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB5927.namprd03.prod.outlook.com (2603:10b6:510:41::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Fri, 6 Oct
 2023 11:29:18 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Fri, 6 Oct 2023
 11:29:18 +0000
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
X-Inumbo-ID: 9ac44fae-643b-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696591766;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=BmpLTWdaj97lbyFBtQVU0m9xDsYq00lxwIHt4ns4/Z0=;
  b=HDNrA9cWlr7045zo8diTgt8gaNE6HPP/E4SdnHX7WXhQd1cejLd7/1h6
   dJ2o1svRXcVf4ZhxP+SMpGSiFFAyVhsSukG4Ii5gEk9daAGzbAf6mtXEn
   S7Lq1Fi97YkSWI0MzDo4a1dQmRusrCZnPaofq26I2bpJJE0Vb+pvC3eGd
   A=;
X-CSE-ConnectionGUID: 638PdYy6Tm2Z2Pf5g5JVlQ==
X-CSE-MsgGUID: tcxqoul3TyKVyQwMjTLkcg==
X-IronPort-RemoteIP: 104.47.59.172
X-IronPort-MID: 127582579
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:FeGfVqDUaLsEPBVW/63iw5YqxClBgxIJ4kV8jS/XYbTApDomgzwOm
 2VJD2jVO62NMWKjcot0Ydi38UxUvp/VxtZjQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsMpvlDs15K6p4WtA4ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwpL0nOW1/5
 KIkLWo/NCiN2u3r4oy/c7w57igjBJGD0II3nFhFlGucIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9OxuvDK7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqC3x1rWSwnKTtIQ6CLao7/l3hAav108tGSQJcFmHhfqyhRvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLkgJSCRQLuMvssAeTCYvk
 FSOmrvBDjtqtaCTSG6MsLKdqzq9NDI9PWIEfTUDTwYO/5/kuo5bphDFQ8tnEaW1psboAjy2y
 DePxAA8mrESgMgjx6i9u1fdjFqEvYPVRwQ44gHWWGON7Q5jYoOhIYuy5jDz8vJoPIufCF6bs
 xA5d9O26ekPCdSBkXKLSeBURrWxva/aanvbnEJlGIQn+3K14Xm/cItM4TZ4YkB0LsIDfjyva
 0jW0e9M2KJu0LKRRfcfS+qM5w4ClMAMyfyNuijoU+dz
IronPort-HdrOrdr: A9a23:WZ/yiq0Ubkai/8lMr4alvwqjBAMkLtp133Aq2lEZdPWaSK2lfq
 eV7ZAmPH7P+VMssRQb8+xoV5PsfZqxz/JICWd4B8bZYOCkghrSEGlahbGSvgEIYheOitK1t5
 0BT0EOMqyTMbEgt7ec3ODQKb9Jq+VvlprGuQ609QYPcegFUc9dBi5Ce3mmO3wzaglaJIYzUK
 GR7tBAoFObCAwqR/X+KHkZfvTJ4+bGnpL+YRIAGnccmXCzpALtxr7mMgSSmiwTWTNXwbsk7C
 zsngHj6r+42svLuyP05iv874l2hNCk8NdFCcCW4/JlTAnEhwqzeYRnU6CDujcuydvflmoXrA
 ==
X-Talos-CUID: =?us-ascii?q?9a23=3AgrwDn2gg+r3vMoV6aVEzTbUPIzJuLCaN9HvhMhG?=
 =?us-ascii?q?EDDxbEoWbFFDN2p1gqp87?=
X-Talos-MUID: 9a23:JRPOsQnSUoS3MgRNLlqVdnp+P9dx5LmqU3wcsqsXgtahNxBUODyS2WE=
X-IronPort-AV: E=Sophos;i="6.03,204,1694750400"; 
   d="scan'208";a="127582579"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlZ+fM6dtyZ3VRNH7u2T6nWacAPgl3+xT6YiuuufLF0x6v+s9FSR+5kP4sTLUMmMBxUc5+3xxYvApI75znKxiFqfFthTa6fN+HqvJiT0SjORwunDw8FjGSHpo2/0XoI7LG7xfjO9MOFGDPu41k/xq1nWT86FdTkGg/689s8kMcE9tBfBmzxVQEpOabZvCZrQfzNaXafnM4CduarnE2YfSLUDK3aWD+X8aXYYUZHoAu6eZPMFqYmVYNfxO4kAYkJUoVnK717/MzxZ627VBYgNvqjGieVknQnjI28TsYxY1oGp/UbTP0iuVtXjHhKcD40Cv1HSwnHQzV1vGoDqg/sZ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbitnJdJhcnjzK3oKZpTNzJ1d7duMx6lCRu/MBrQgi8=;
 b=KcQQYZmAYW9sBkHFPSR7oFdxGtfNfzLOaPF8CN65cRPiH0/IFO6T72V8fURdlf3HeDxy1fdPh27B0hN7bEe46/5byqFizCb63LrxVV5T5Q5u+S/XI2kvxoRv9RHEQV3m5zG6n9Q3TVCjX6t/0Qxu/k3O5TLF0RYFqmj45MJ28WE2p2NdfQ8WPHjvuintAgTrfeI9bdSAv91KVDoqPJWZnLiNzrRFHdm1jOCsXii9e/wQhf1mDKt3V7fWhUOuWYJyxjPNC355bF2vkSfuC5/EBbs97V2FT3STfRbPZrOWM2W5RZkM2391C2uH4mIXckKrRzx8PmgcZB9E8jCFY6yorA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbitnJdJhcnjzK3oKZpTNzJ1d7duMx6lCRu/MBrQgi8=;
 b=T7gv/L5kvJYrJx80XC3S6u9yjwDgxPsCooNLdRFgFeFOaxwuWptRFLqqrZf1P9UQ/TwzgbEOaO/8Pu6Ha2XZaBITd9IxQJyvS+lW1GAgNWEMgE+QU6DFPU6iDKV2oWCk67x1JlGgXYetZrCW796/slG+Also9LgEPpbIK7zAKHI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 6 Oct 2023 13:29:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] domain: expose newly introduced hypercalls as XENFEAT
Message-ID: <ZR_viJjXDw-M8ror@MacBookPdeRoger>
References: <20231006091353.96367-1-roger.pau@citrix.com>
 <20231006091353.96367-3-roger.pau@citrix.com>
 <ac4842a9-7f62-4c64-9a3a-2ec2b1e97699@citrix.com>
 <ZR_pRUvNLXQ0ftt1@MacBookPdeRoger>
 <c9b260af-0d97-4117-a62a-5adc8b5e2621@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9b260af-0d97-4117-a62a-5adc8b5e2621@citrix.com>
X-ClientProxiedBy: LO4P265CA0094.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB5927:EE_
X-MS-Office365-Filtering-Correlation-Id: ee0b7f9f-e137-4d42-4340-08dbc65f7a50
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pDHbm/5TTBNPLMAf9gXqr2UDQyLaIm4GK5b6tOf7TsvIDxrl1huWQHV+Oj3HN1x9lARTJ1we7KRx80khp9UvZVtDz+Jc7nMO9IgHOc8UO/cpb4cj+qTyChbNGuoMu1YCHgMKxNqB+e+AJavHLLswL1dl5cZ/S1OlENd5GNylv78CyYKf5NT2lvKCawrSUvcdOr5UMUTkxgDgptjgQrjYqFdJIj6ojTX8bb4USMe+OoTm5ZgJO/jKW2lzYhc7unZTXX80ujrXCz52toUwxgGHWkbSRiw1aQerLaop766Qbw8Eaa7kzAsMBn/YF36o8BTELOInhu4ItVRRjws5BbeoBW8u/AO4iNVEfWZCnmc0IXNM/J4JNN5NR7Frcrly0uKQsPfDhpNkbXoh4qJyh2VSFVEQtnK3VfbPdfsiugVUEVpJfTjgHxlPOz2Zo9OQ2k8jGpAI2sb5Fb4cMOAUh4rdJqnQkhd5WI834bKufL5bnqMiFTWItIlsv8K6sPQV7PCF7z9yBcyg0Ar8viXMbWcsK1DfiPhMdWO3wc3gzyNuOKQSdAOhLs4S9lYVqjDjWVWL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(346002)(396003)(366004)(136003)(376002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(66476007)(26005)(2906002)(6636002)(8676002)(4326008)(66946007)(5660300002)(6862004)(41300700001)(54906003)(8936002)(66556008)(6486002)(9686003)(478600001)(6666004)(6506007)(6512007)(53546011)(33716001)(316002)(83380400001)(82960400001)(38100700002)(86362001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3BDT2lKYU9mTjZDMlhNd3FUempHZnIxdkV3ZWtmYU9tdThVZklLY1dNQ3B2?=
 =?utf-8?B?aldTTjJqS0Y0bkt5WmVXMG1lZFlaWWF6MUVnUmRlQVJQc2RnTm9zczlHK01K?=
 =?utf-8?B?UVEyRE01ZTdveldSU2c0YUgxRU1EakI2c093ZTQzaFNKMnlIaFY3ZEdrZlNq?=
 =?utf-8?B?UHlTRUk3RTNaMDJyMnJHdVorR2ZucStDcURGZUdzUnl0ellrdDJyVGovSEVq?=
 =?utf-8?B?RXhpM0s4WS9rNExmSFdLeER5TzljU0dLTFAvM0JYTmptTVRIRDRXczZQL214?=
 =?utf-8?B?YytoWDh0Ymd6cXRNQ0ExK1MxV0dPbkVPRXREOVI4emxTSmo1STlpaFl4Szlo?=
 =?utf-8?B?WVdjOU9ZcUFVNDhrZUxjdkNVTitEYWZaOWkwREh4OUdJeGFLY0xBUWtDb3lq?=
 =?utf-8?B?KzcvdXlqRk44Wk1zSjlHNkVYSE9sZ2hyTGxJRzlaaE5jQk9wR3RvSjRyMkla?=
 =?utf-8?B?RjAzNFFjWEJxRkl1T2hFbEcxZ3dyT2hXR05zQVVHMmdwNENScnY2eFRlaHc4?=
 =?utf-8?B?YjlneU8wSUdVcmRTTG1DVmR0SnJNcGY0TnY4ejNMTlRzS0pNU0pLQjI4amJw?=
 =?utf-8?B?M3ZtOHVXb0dlSkFTMDVVNmQ3eDJaRGJaNXB2R1Fuc2xsazBMNDF5Mk41dUJ0?=
 =?utf-8?B?VDJSUGdnM1I0aFlGRVdEWDI3YWk2S1B6U0FiaW9iVTErODM0NlRzcUJQUGN5?=
 =?utf-8?B?TXZvYXFPeDRpZXJCdnZFUlE1M1hkY2NwdTdORTB5dkJtNDZjY3lOUGREdHJ0?=
 =?utf-8?B?QjJIOStxT2ZncUUyVmVDbGk5QURzK3JvQlJyeVZXWTg1aVJZbGtNbEFUaFQ3?=
 =?utf-8?B?cklpODlzbENiYlVBZ3dVRWE2c0lmT3AyOGFialA4WkJteUROaEZvdVUvZnVj?=
 =?utf-8?B?L2xtSXhSenRIT0lVbTVraTNMZzdJeGhWbkJpdnQzUlFtbE1pQ1BiMVQ0QWhn?=
 =?utf-8?B?UHRVT0dkQ20xcStCcHVlNGQva21iU2VMZktlaGo4endreW1BZ0JlMlI4L2JT?=
 =?utf-8?B?S016WnRkM3VKZC82aUpmMHNuZHRsUGg3dnNhalpvbXRwbFIwKy83Wnp3VWZL?=
 =?utf-8?B?ZTNEc3FsNlpVT3FkTjZqVmhQQzZQODhCRXdDZ1BkdVgyMEwrSmthajJ2N1Qr?=
 =?utf-8?B?ckdCMGRjb0pUOTl0c3lVYlZlZXlDOThscVBURmM1RE1QLzdXSE1VSjFlYk9z?=
 =?utf-8?B?V3lDakVqaUNiY3hQdkw1QzNYa2FpbC9aa1NPQllFbjNkMFZ2T0QxZ2s3aHla?=
 =?utf-8?B?cDN6WFNEbE1wSFppUGc5anBhMkpCdmh1T00xRTBpektrZW1NK3JRbTZWYTVT?=
 =?utf-8?B?UzA5ZTRsTSs3YXRFczlLNkpWZis3TjZIRlBPOERkSEJWMHZ1Nmtqd2xCTVhn?=
 =?utf-8?B?MlE4QWx5Y0VQOGN6UTFGbndPUnk4VVpXN1E0YmppMlFPd3hqeFhTb0NCeVNu?=
 =?utf-8?B?Ri8vVVpmQWZGNHZvZ2hBeWJKNnB4VGpubUhmaU0wai9RZkxsZjM5MjZQOUlW?=
 =?utf-8?B?RG1PdWNjVVZTSnBWQm43S0JQQUNVdjFIcnJSQmw3NEpqeXpVMDFhQVRUQ1lY?=
 =?utf-8?B?Ykh3dFRqUmJGRFRYd0I3eCtTa0FwaEtKN2p1Q2I1M2NlRGpFcVB3K1hId0pV?=
 =?utf-8?B?YUZEYXYyQmxuUzJGd0cxaFZsWm1xOHhuWmZLRWgzRmp5aiswQUlUNkJOSXdB?=
 =?utf-8?B?bDlERStSOEtzdUR1UnNvY1gxaUdzTnJpOFdOa2pMcmFzb2N0VWVPaWVtZkZv?=
 =?utf-8?B?ayt5a3JwRU9NQ1lydHcrZEhFbDZyd0F6MlZld2ZDVUZZUFNTaWZBb1ZsYmc5?=
 =?utf-8?B?b3JDNzBBdjdJZzlXNXpVcGRua2ViNDZ1MVBHcCthNlFkcW1Bc0dHemZUcXhY?=
 =?utf-8?B?OFM2R2RVQTBGTE9YTnQ0MGdGZ2V4dm5IMGk5aDlpcFZja1R5b1lNM2ZaN2Q0?=
 =?utf-8?B?Z2VkSkdObVU4UGVrWExtK1lRMWpJY3NlSGFKSjJyNmlqYXR3OHhSTHJBRXpY?=
 =?utf-8?B?N0tROFVvQjdqTllXazBQSFBvbnpRQUYvRlZBY2p3R2hCc1FrVnA1T0JTd1hp?=
 =?utf-8?B?V2IrRUY1Y2FaTjFtbVBpRGpIai9LTG1EYnZKQ1crMVhQdjI4b0VhTFZscEdK?=
 =?utf-8?B?MHRPYUUrZ21wY09NclIxM0s5bTNaSzNtS1FWbDFpbnpsQzc5bU5jWFpQSUh0?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9v2fHc0cnyaS7D1ddW+PTb0VtkCLm0P5/6eA/FGJMdFleWd26GdbCmb4WybRxCG797nOeMPFvZmnX7YUdCFgBrfqKJWpIBOachXSBoDjBPdlM9YZfl+Hr///7KJnXs+EwnGFoyLwwM2Xv2TvXdQ1EmegoNW9WmAUYLUuztwzRcnIR+IO52mxyqxR0mSykZXeuJHJ3buPxvLslpdV8FiSz8DuTNfaHai7SnLqQ6G2FMXGdJ6kuHHgIzUpmHHvZSdVM/ilhLQ3HMtAZWO8ac1vANgvUAkFGGf2CwHS9HpPI9Cahv8WeTfPBAgubi9aOND8ve0PupZnrBj137CJ7J4fynjw4UhhxFaq1tU3bm5z9ccwj0jOZ7fPOle52tmJNZIY3T1jGQxn9IGtLVSlfdbw094Qg4HWw9xx0w5CElJewTyaipitwTQgW8gPS752yY7VVXMfhyR4pYN+4W9mOZHS9NiQBVXl6bPhVywTX/rJ0rqaVzcMm7fYimPofSteHlSnvKGv+PQ3IjqAFqJ9KurAQCpXz1Z4+0orlDom2z3lZ3curXY201dIkNPowXwpzohKOoW5Yj8sdL5L1LQts8ek/vMObq1F0ZpV1DftFoPGStZgN44sZKhpqZCUaVGZl9+O3iX2gBT6XT3GYoZjg+1y4HsE/Np/XH+sjywfQX3gSMVdU2BOU1AsYsHZzVVNB9IT0v+Xa/SUJYfX+9FNXuEOuz/lFGvtxKKY3JHhIHdbeBxOa55t4NOacIutHvEZC8DTNH4PqrImpXsugEQ2SAS7u6GFOOZETeUcut1Hely3rJldkXGNO3kRyryfNPPku/J4E6hwdYT0caqpJLD99/e2/xOnzpPMIW1htIx4Bp6/5TIw5lXJJN/hfEQJO97RQzghugxiKrc4Kn/xGC06IzeGuJjrMsh+T740mct7OPcGjwQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee0b7f9f-e137-4d42-4340-08dbc65f7a50
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 11:29:18.1972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: moXqxOqr9cUI3j6wGGD7AyfxzcqO/sqYphlX5GpZnw/BM7IO9uFAafdkAZ93EQGLM4ut+YKsfRmGVBj4Tq2/3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5927

On Fri, Oct 06, 2023 at 12:19:29PM +0100, Andrew Cooper wrote:
> On 06/10/2023 12:02 pm, Roger Pau Monné wrote:
> > On Fri, Oct 06, 2023 at 11:47:48AM +0100, Andrew Cooper wrote:
> >> diff --git a/xen/common/domain.c b/xen/common/domain.c
> >> index b8281d7cff9d..df994bd30fd2 100644
> >> --- a/xen/common/domain.c
> >> +++ b/xen/common/domain.c
> >> @@ -1998,6 +1998,10 @@ long common_vcpu_op(int cmd, struct vcpu *v
> >>      {
> >>          struct vcpu_register_runstate_memory_area area;
> >>  
> >> +        rc = -ENOSYS;
> >> +        if ( 0 /* TODO: Dom's XENFEAT_runstate_phys_area setting */ )
> >> +            break;
> >> +
> >>          rc = -EFAULT;
> >>          if ( copy_from_guest(&area.addr.p, arg, 1) )
> >>              break;
> >>
> >> and a matching one for XENFEAT_vcpu_time_phys_area because I'm even more
> >> serious about this becoming a domain controllable setting following what
> >> OSSTest had to say overnight.
> > While this is all fine, please note that the newly added code
> > {,un}map_guest_area() is also used by the existing
> > VCPUOP_register_vcpu_info hypercall, and that one can't be disabled.
> 
> Yeah, I'm aware we're stuck there, but a crap interface from the past is
> not an excuse not to do new interfaces properly.

Right, want I intended to say is that if we are worried the new
{,un}map_guest_area() might be buggy, and would like to have a way to
disable it, just preventing usage of
VCPUOP_register_{runstate,vcpu_info}_phys_area won't be enough as the
newly introduced function is also used by the existing
VCPUOP_register_vcpu_info.

Not that we shouldn't add the checks, just that those won't cover all
usages of {,un}map_guest_area().

Thanks, Roger.

