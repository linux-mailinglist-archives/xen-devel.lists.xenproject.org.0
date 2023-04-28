Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3AA6F185B
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 14:43:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527317.819818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psNRo-0006ds-FW; Fri, 28 Apr 2023 12:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527317.819818; Fri, 28 Apr 2023 12:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psNRo-0006cC-Ch; Fri, 28 Apr 2023 12:43:36 +0000
Received: by outflank-mailman (input) for mailman id 527317;
 Fri, 28 Apr 2023 12:43:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CzbF=AT=citrix.com=prvs=4752babc1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1psNRn-0006c4-EF
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 12:43:35 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4869d867-e5c2-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 14:43:34 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2023 08:43:30 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA3PR03MB7234.namprd03.prod.outlook.com (2603:10b6:806:2f6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Fri, 28 Apr
 2023 12:43:28 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.024; Fri, 28 Apr 2023
 12:43:28 +0000
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
X-Inumbo-ID: 4869d867-e5c2-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682685814;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5TmE0ib5nYT3dzY1XFmJSniHrWs41bPMrCeg4Qzl6eo=;
  b=f6VhkBaY8XDN7gHbdl0edq96NMVhAzZfRabJCGbbW94RU1B7HNlalVFZ
   fbjZrCalFrrd5TEoHR5ZtZZpi7GkEuYEnfKp31tCN090K5Jw/tHVGDzas
   smhVXyRhWRpqr991pBdiAwKxjdGsGi7RbQPq3PmJOK2kMuoC/jyEtOs7Y
   w=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 109660540
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ecO916DMQaZg2RVW/x7iw5YqxClBgxIJ4kV8jS/XYbTApGhz1zcHx
 mcaX22DO62IYmvwfNEnYdnk8kpU75/dxt82QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G9C7gRiDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw4e10JH4V8
 +4iEW5TUjXarOC34JGiY7w57igjBJGD0II3nFhFlGicJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9exuvTm7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraXzH2lAN9OTNVU8NZ1i1nLmFRUJSERcmSiguvmiwmZd81Qf
 hl8Fi0G6PJaGFaQZtD5Uh+xpnKeuVgCUt5UHu89wAqJzbfYpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRutPQAFIGlEYjULJTbp+PHmqYA3yxjJHtBqFffsisWvQG+hh
 TeXsCI5mrMfy9YR0Lm29kzGhDTqoYXVSgky5UPcWWfNAh5FWbNJrreAsTDzhcus5q7AJrVdl
 BDoQ/Sj0d0=
IronPort-HdrOrdr: A9a23:FKXPnKssI11ZsHIT3uKLFg+J7skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-Talos-CUID: 9a23:7m2GxWBzJIa4HkT6EzJs92sLQcY3SESDkkv1emS6CEZKUZTAHA==
X-Talos-MUID: 9a23:f8H9gwttvbJKn2NBKM2nmzpmbJlQpImSD2cyiLYU5MjDEgBvNGLI
X-IronPort-AV: E=Sophos;i="5.99,234,1677560400"; 
   d="scan'208";a="109660540"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gq2WgbflQ3wloA0pXqSWechOBg/mYwrIgSKmrLCo6EfKgH8q6oTYPVht2DqTvx1UDFU9WfDKtCgcHzw8BFXu293uGePUwsCUH70I+9vCmgoj3URKZFnDiI622nDNZnmUzU8h/E3VOGQmL5dKCW7at/CdG1l+vkKywBbAH2M7ZgVgIBUUOKi1Y3ykKn5WLx1PQbDVRaZ0CncCKxCRfqHY6boqJs6AILLhnAR0yRaIbd/Ykn2YJGulhyd+iFHK/I+1i+sACE6rCqasSJd2HifeCMMXoObUcgmnsivq44xN4NcAmRKKvjHvBAQP/5ydhvQUXQP0UuxIzOQx4qATb2p9Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p87CTcF+HpANUKE9O88aZaLB9i6E73I4ciXgdDOh8O4=;
 b=QQgsb5IkjNByUBXTc23ohjqqQdQ9qUShTIYLo7YG9VtpJZ7NRMdDJeGrq0tyWF6kxYspPRHuekvTSmNIwbfTZ9/g3q9vbKaSpE/4Frvp51XLdF5leRSJ7M96Rez/wwU+hl+/k/NEGfNrrewAhAalhagW+07lY43k0a6hTziQHtVHOVEd+/U6fIs/ce8Cugb1rQUt7v4K3mZMjBjDNmeSyFG+rpfHSVUqQ+gmQa58KtRI2VBj5ul+AoivPR1QsM3+we8ARA/xkeML5ZqVBO6C9vCTzqZ1Utm4ghrXxnDp+dWQuFqgAZ+eqW0VGdBdcLEORvdqMvLsngLCs1eMoBdpFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p87CTcF+HpANUKE9O88aZaLB9i6E73I4ciXgdDOh8O4=;
 b=JwPhTnceeraZ1G6vTdZkew5dIb4wF7wakNj5jNhEWGUNlnko/N604+JQZtKyHn+WK3AqdwJijCuyKUp1RLPDSru5k/1tQ2aCKuZcsCOCL6hPz1Gcg5A7SrzaLGfYziHUMZGQjbGarbsKdeB8aCJzWT/TYqjBSR1jMj8QVgo8Nj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2a55b80d-e3f3-ad26-57a2-9c153c6e7334@citrix.com>
Date: Fri, 28 Apr 2023 13:43:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 3/7] tools: Refactor console/io.c to avoid using
 xc_domain_getinfo()
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230428104124.1044-1-alejandro.vallejo@cloud.com>
 <20230428104124.1044-4-alejandro.vallejo@cloud.com>
 <91438b54-df82-f790-7154-c76feea90f18@citrix.com>
In-Reply-To: <91438b54-df82-f790-7154-c76feea90f18@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0513.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA3PR03MB7234:EE_
X-MS-Office365-Filtering-Correlation-Id: 49321b15-57b9-4b3f-2946-08db47e62a76
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TByvI7hszIkhiTpwxG5TGLbY/Pq+MqhT25J1GbMkj0JdJSK75AtlCQCsX3OeozzWrcxFQkGIkybWWd+0LG0kBgQLXDaTHmi+w+ZVbKajT75/iNiFjXnDr/fzSGvlSL4ABdq/bLV+2j9dklw4d94pOJhsKj/c/7m/AOjStvn1eJWVFl+NomKSMyvgHoALe3Tv73OFe4fltLkrq+3m0ImtMNf5vkspAYX/vqtJ5SupbM/H+Xs8c0jKrSegrI4WxJ9ftrqukumvIfvG8f2tSDdac1vbt1u09mXjBsBWJrVG4EsT2k6AxSWEW1wUWTD5p/gS0PSbvibwcQltkA/TfazBm47zINiZEW//+w9Wyp0ptzeNGqKjVqJ6vIkGmth2b9XnGtgbKEFRmvla8Zy9iKxZMDjOBp2XaVozgkLX+9p0ORDgy1oSQO0DdCxpMCKinMRY6l1x+2QMavsYMtx11uiupnJUqvj4xNJBRbq6GBWWjA4P0kWBxCrrjfI5C5eeXcmnWgOh8aLsbYA3e8MPf9u8pIr4/Bnzrb8eeQpKjkliZyU37UaFGBsO2kFyvt79aKpvfp30ykGYN/bVWf3vj4lgeoot7wjhASJ30wxlhMcLlQyFvkYVJtRg/hj7bKISnBhszaPz18n5wJBPsrzoiCU1Bg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(451199021)(31686004)(86362001)(186003)(6506007)(26005)(6512007)(38100700002)(5660300002)(53546011)(2616005)(31696002)(6486002)(107886003)(6666004)(83380400001)(478600001)(36756003)(54906003)(110136005)(41300700001)(4744005)(8676002)(8936002)(2906002)(82960400001)(316002)(66556008)(66476007)(66946007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1R6VkFpRDZGRXlaUnhkdE5hWGUrN0N6TURqSmZuNnp2R09yV0JxMUdHM2FP?=
 =?utf-8?B?Q0M1WXZjRGx3ckJOaGNhcmlpcXZueWtEampSd0Joc2xkcUhOdGNoL0orbnUy?=
 =?utf-8?B?SjBDNUl6VHBCU2dkZEpGZ09zdjE4RGhsTU43azVVRlA2OTBaQ3hDL0xoaFhY?=
 =?utf-8?B?N1JvYjI2VlBSTDRDaTErTytwblYvYjcvaElkTEp4T0krbW1MTUhnSmp4SHk5?=
 =?utf-8?B?Z3hsVE5aaXpuWnM0TnpFVUdSbjVpMGZETWsvUUVpR0ZvZ3FmbGhmNWlEVWdv?=
 =?utf-8?B?VWtYcUR0ZmpPR3dZbnJkUFR6MTI4b3IvMER2ZnlhblVUTEYySWszRDZzeE5u?=
 =?utf-8?B?QkdNOGYrN0JHd2NzK1FFcFU4VnFjZU5Ua1hVZ2dqRThKKzlSUm8xLytRcmhK?=
 =?utf-8?B?Q0x2RiswWGRGTlY0M09BN1NQUlVzZVVYY2drMWM2a1UxOHJxQVJuVGJUUk9O?=
 =?utf-8?B?VlRtYTg2ZXM4bkJxZWVOcXFVQzd6dFM1VEN5L0VTcnRJUVhEenJMS2tLQnh0?=
 =?utf-8?B?aUNGbldwVDBBUml1S0J4OGVpbXJBZGp5Wm9vTjl2ZXlOWEdIUVFjTC8vVmhB?=
 =?utf-8?B?d2NPeWVqdlk1eTBEMkR1b09jU2JGaElTNzgwWjE0QnJGSEpqQ2VHNGFmVzFV?=
 =?utf-8?B?eEg5Wjg0Y052eXplN2k3amJDajVOODIzS2NxVzRZYVRubmV4cTRZeGhxQk5a?=
 =?utf-8?B?aEpGWlBvMDN0aXdGUHByaDdvTmhXMTNUZUVpMGNTRlUrbHdVT1AzdklTdDk5?=
 =?utf-8?B?dFRVeGtad3BVMWtuaDFEQWZGVFFibHB2UkE3dzY0OXNzWVBrSDYwaDhUYjZt?=
 =?utf-8?B?cGxCNDFydkxJcmkzeTd5Yk9KbHJ3OXVmWTlzUEpHd1NBYTNYVHdoU0ExNjRR?=
 =?utf-8?B?UXBUdTNpMGl5NjhDL0hHNTk5VGlJOGYrQVdBNUx4Y3QrSTZKbmFNdThqSkVr?=
 =?utf-8?B?cHhnS2t6Qi9OVUlFVlNwcmhLWFhTcENTQnAxc3p0ckJxQmVGN1JsNmh2b3Y0?=
 =?utf-8?B?RzlqQnAyeHdqckIyWmp0UjBXdFlBZ2lnblhUNTZFNGljRjBNem5rTlgzSGJS?=
 =?utf-8?B?VGN6RnlORnhVampIOFZIaXBiZUsxTDFhMUZFaWt5a2hicGhUeHJFVTZiWkl6?=
 =?utf-8?B?dUF1NEE0b1I2ZmNXb0VPN2VXSjhjdlYxUDViRS9Pb25XN3FHc3dFQkJ6QzNP?=
 =?utf-8?B?clpsV1Z2YllaaVpmUXBlZC9KZ0F1ZDNtS2gxZENrenl5Z3NPRUtuR080NDRG?=
 =?utf-8?B?MUtlVWk5aEZKU1lua0ZhdnpVMS9oR09BOU5ya3dPODU3RmNvUnJnbFI4SFR0?=
 =?utf-8?B?d05mZTFpdG1tQ1FkQmUwcGJPQ3RrOHNMVVM5YTBMcEJjODRvNDdHT0wxZlhW?=
 =?utf-8?B?eE5LTDl6RzFvZjZwL2hyVDVHR0xUQVI4R3NsQ2RtcUdLQWJsVXhxY1Z1M3N1?=
 =?utf-8?B?WTZoOFdPa3RPL21MeHYrdE9VOW1SRXd4NCt0bTdLNDFOeElRUFJlU1NTUkk3?=
 =?utf-8?B?enJpTkZWUFQ3T2cwaTlKZGRjbVBJQVlIdzc4TWl1UXIzYzhNL3RtUVc2ZitO?=
 =?utf-8?B?MFI1TGVQbTlaWDh3UDdoQlBVaFlVRFhseVFYYldMdGNrSmtoa1Z1OFBFblNw?=
 =?utf-8?B?aXJxR1h6eW9pbkN2a3pIRWFiNVVnN0pmK1ZmSUZNbjYyN1hHczZqQVRSTk1G?=
 =?utf-8?B?eEJHaVZRN1k1VUEwWnhlYUJrOHVlSHhETVVJM0ZSWEFUci9HWTB6NTV3dm5D?=
 =?utf-8?B?dXpRdXErU2krQnIrT2VmS2FPK1VwQWp2dk0rdVY2dTdsdVB5dXlXd3BDVmRU?=
 =?utf-8?B?TGhmSEQ0ZU0wNnFxbGUvZVlYLzFyYVl0WmJlWkM2elJwaVlCdDI4NUZtRCs1?=
 =?utf-8?B?WWtzTEZxcUhlK1BBWGtLVmNiZXBIOEVMMHlFNzZ3RDg1VEh2VkVadWZkZjk4?=
 =?utf-8?B?aE1HMUYvYmE3TmhTajNJNFpHN3o5YnpoWWJYM1A1TUNrOEIwY1JOYnhxMDl0?=
 =?utf-8?B?NmprNWpRSGEwS04ydDNBVUJhQzNWTEk1YVlKTTBkS3RIVWxvTEVDWEZ3dlpF?=
 =?utf-8?B?RWMrRDA5RFl6cC9yNkxhSDQxdFFTQzI3Zkl2a0JWazdDMm13S1E3M0Z0RHVv?=
 =?utf-8?B?dGdkajBpUERSWGpZMG5oMlo0QkdMdW1HMzM4aW1ycVdEOFM3TlVIRElVUU5o?=
 =?utf-8?B?RHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tc0auVU61KOyzzoGCP6ZObbF5SJ+5iCrb0PfZsinwrlKU+C7kSayc0RJdxMQUiphCNrhgJ7UdVHQQAEzLg7UctsM2LT+D7qUWBceW123n6OGwZTH3k9Nn2xew+j2uw5I2IUxWItamV4n291XP3P2t5AZeqzMSIWMuUubaOuNvffcavfG/sGrtC9FNqBgqbHV0iHg4G+rukuuZYL1D8xX9hI7cVj9hGfgeB4jiDztQl3r3Mpkq2+2oMWUzEPrgh+ibTOBPKwgLm+7/ndqiXPsRB7+isZoenw0Wu6MjDdReir84NA0huhrv82uWfihnItJfgDbPBicXA61OeBGvazooAcqVqc/RW5er6dni/+3ZqSEAkOh66qa4U0mraLTJLp+F115pWeWL4l7fZP6cMSvfvH3sal2t1cWg0Ramw17qGVgGH4qlA8x7RycQ5ThkgjWw3bjipWz1qAXgGJb0EK5HqwFJd3VPs+Yg5E0exrvh6y0rQFPM5z17aZ7DwFZdUOFL9yYZAmq8HF/uU0j98JvmT04DJOP/u+E+yoYKz0ajNjTyriD+5PfG7gZjjcuVUy7aRbQfCxpAksz0VlVO7ywgDCCglDqHKU4bIijk/q8Jup++vY+Zz2SBS3NY8axL9c8R90nk9pYzvCoAo9Igm75HblTRy+G195Js9elY2uqRTIxSx8kqJ60vniwDJvPk0JQQ25mRfXrXlgFYtAwswYKhTr5wbyRXeixML2x8pZitf+4lzCADUGJqJ/5CoxzPqKC58UJ65f/8Xf5KZgkTUxbUeIPe7Bp0NP1X3SgFfLxrK0bL22UYPE0XF6uqreBdxCixp+sUFEnvhFnNBWtYQrU4A==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49321b15-57b9-4b3f-2946-08db47e62a76
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 12:43:28.6064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YHH8MtrEsaMm+38jT1fjJsmD2dXiOhrQzgep1xnfLI5sClvbh00Qf6vJVwofrLSVJyMP9oRJySeeqfFRzcxTuYrtaFZCIOKVBWUi2xyOSdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7234

On 28/04/2023 1:33 pm, Andrew Cooper wrote:
> On 28/04/2023 11:41 am, Alejandro Vallejo wrote:
>> It has 2 avoidable occurences
>>
>> * Check whether a domain is valid, which can be done faster with
>>     xc_domain_getinfo_single()
>> * Domain discovery, which can be done much faster with the sysctl
>>     interface through xc_domain_getinfolist().
> It occurs to me that this isn't really right here.
>
> It's true in principle, but switching to requesting all domains at once
> is a fix for a race condition.
>
> I'd suggest "which can be done in a race free way through ..." and avoid
> saying faster.  It's likely not faster now with the 4M bounce, but we
> can fix that in due course.

Oh, there's also one tabs/spaces indentation hiccup.  That can be fixed
on commit too.

~Andrew

