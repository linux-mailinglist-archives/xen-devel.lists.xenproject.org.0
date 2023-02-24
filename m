Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD9D6A1A9A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 11:51:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500897.772441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVVf6-0005u9-59; Fri, 24 Feb 2023 10:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500897.772441; Fri, 24 Feb 2023 10:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVVf6-0005rs-1q; Fri, 24 Feb 2023 10:50:48 +0000
Received: by outflank-mailman (input) for mailman id 500897;
 Fri, 24 Feb 2023 10:50:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V4+4=6U=citrix.com=prvs=412e064f8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVVf3-0005rm-Mc
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 10:50:45 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14c0d1cc-b431-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 11:50:43 +0100 (CET)
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Feb 2023 05:50:36 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5721.namprd03.prod.outlook.com (2603:10b6:806:117::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Fri, 24 Feb
 2023 10:50:30 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 10:50:30 +0000
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
X-Inumbo-ID: 14c0d1cc-b431-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677235843;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wQW0tVFHbRWREiactdV7dwWmnC6byRBmE0FxAt33bi0=;
  b=BQmpnSSSzifi3ymjWaxbO1DHwXbEIHFqbOqXsXhOvuOdTyQNxWcH8+Ak
   oMIrLVgQ/c22n7gsFTpuy9Kx/FoqBDUqvSlA0FsuY3RWie73kzCOIiMXZ
   H40cS5SSrz3xAzXg61nf4bEwe8/SafCVUK1kuDrve2BZ9XNScFFHi5fPA
   k=;
X-IronPort-RemoteIP: 104.47.70.100
X-IronPort-MID: 100818965
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8nsIdK707wEii2sJlsZ65AxRtBXGchMFZxGqfqrLsTDasY5as4F+v
 mUdWGiOOvqPNDSgfYxzOY20o00O7ZHUzNJjTFY5/itmHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPaoR4AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mp
 NA1ECocYCy/3Ly92qqQdrVIwe4GFZy+VG8fkikIITDxK98DGMiGaYOVoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6MlEooiOCF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtKTO3hpq803TV/wEQUIgUZaGaiucO2k2qPfuoGN
 34a5iMh+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6GAkAUQzgHb8Yp3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqWMMfZQ4M4t2mqodsiBvKF45nCPTs1oWzHizsy
 TeXqiR4n68UkcMAy6S8+xbAni6ooZ/KCAUy4207Q16Y0++wX6b9D6TA1LQRxa8owFqxJrVZg
 EU5pg==
IronPort-HdrOrdr: A9a23:596/uq0fZcLKN12+xL6OygqjBLYkLtp133Aq2lEZdPUzSKClfq
 GV88jzsCWetN9/Yh8dcLy7WZVoI0mslqKdkLNwAV7KZmCP0gaVxepZnOnfKlPbaknD398Y+a
 B8c7VvTP3cZGIK6voSOTPIduod/A==
X-IronPort-AV: E=Sophos;i="5.97,324,1669093200"; 
   d="scan'208";a="100818965"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D45Pcj2aUI63gbYEhHdlDtNZpuPWSKVCgd4y85kA6dyqwarM6OWzpaXpcqe6iFHIoPG6m4pk30wcQEwZ7+c9jhEv+0p3tlBUoIlLnFkc3rOx2cS6fVaxLiwfed+Nzku0WjYI70XBugO2mcGpPxZX47Hyf1afG8cCT+sxnH/beqe01BlVjwJQWoaHcIWlrcgafKtQG8M5pwHYgVvo/MR96ne0DwYy8e8WfoVyeA8VvZ+oYbtbht6bNKmmmgUJ35ShFI2uzCWe5cExwqEzwsD2/LI4ThFc44mKrrMs7t9QtoAFLcU23klLIMw7c4m82qkLiIetfBUQRR28AsuCPOpPng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEWFSXOJzM0VAOxMbmcE5UR2SI9UuGakZIz+PDYLc14=;
 b=QDTGyFQST26eFoL0VoGAW/PxOata4oaatwWGNM4V7aywFXTlX1PfEEeSFaQgcbz7Bwhmf//0gk6wwKe5a4AvwHJLfT4ccIL9S1mR0VXBWNSE7ihj789uVnoN+3RgJYzKa+X0eDwqldkPf6Fnkqw4fi45QRnplczl7xn621y5yUK08EwG/uos3S9dZBrDF3FR3WDcqXABMi+niB7deNceRe6oxA4ptELR7jBCfplgrARjGd1zbzncln2zvITxAGJLAAvVSNsUAoRNP/QVtjrX46jw2JwVCsU5PVokvyCZKw43jg57/TJH7BmDg03K1xcfVE4u5xD4FDK2JoGIUywuPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEWFSXOJzM0VAOxMbmcE5UR2SI9UuGakZIz+PDYLc14=;
 b=s3s3T30qlUG1u6K0C6rkxanOCByA2AyYDOCQHayQQsA7IfJfIJc50tanAGqFPwL8M8XchlUZjCDhhRhJt5EftRIiXcjDqf11S7S4wTS21oFsg+m4cdvXpCqV1qruTEev4SgQnvbnM6gjus3Trd2t1pcRnoc8gBwP3Abn9mtHVGc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <de4b7eab-7ae1-d444-6cfa-dc782277e355@citrix.com>
Date: Fri, 24 Feb 2023 10:50:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen: Work around Clang -E vs -Wunicode bug
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230223220358.2611252-1-andrew.cooper3@citrix.com>
 <f35274a1-1669-345c-2436-0eddcba558af@suse.com>
In-Reply-To: <f35274a1-1669-345c-2436-0eddcba558af@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0210.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA2PR03MB5721:EE_
X-MS-Office365-Filtering-Correlation-Id: 62a52780-7c53-4343-8dc3-08db1654f234
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OV2kJUd+0pAb9tQee60dRLJdhkDAr1srR5WEJyzRQgBcbNm5DF4nOMWgPffpEyrrEWiJOTjpGkMaPP0Aed4jjpPudrNDnXpENYcVZoSUPdpAkHZyMDh/UXech6GLoJhDrPQzSZEKo4FCxCh4x7uu38AswGmOBpePizYVzsryGg6+QVfQMIGuaoZHmIbImCQja6/MK0ACficlCl927oSvGa5Uhi9FOsSRGUYocCwm2GMbG+fGPPoBZOze4WByhgkRiqHl+yq4+hSiKLYFrctY5lDG8pIp4qed1MB5KIkp2buEHSApwwOn8T2/SvTqkVVK9WQaxC1uIz0RIukD0THJVyFH4Zc+CkiH9ETxwBdOLmEXe3S8y6ZuXebdI9cVxdDWMyNv80bHLroZeeUHEFzRTp0tP45ZzfLY/AtpEuU1pMZCgAepKMq/lWIUNEPtJcU4xhAiKrSBSSBEffpcjvuXJZyVXzaVomkZvQN+HT9kpkvBxvnEkvb66LWkfhUVddMgWRCp/0ALDlVaWDTI7ozDz2ghXx6juP1D/5vRMkxZm40krfrEZHeb/5+l4FmXtdB3Rgtp0eMqb7HcWTXSXoUgsNBhF1Dg6Qd3pEpj72tiYmnoLGyR10Veu8S+eU7rgLwO1jyeKtHFMAa+Xdudg//a7PnONCw5rFinJnjoFBJjOYjmaFvTFgYbKehfoTYoAIxum1ktS2gpTM0TSuLnpOwXH5D0p/nY+4MlylP77XpHAXw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199018)(41300700001)(31696002)(8936002)(86362001)(316002)(4326008)(66946007)(6916009)(31686004)(5660300002)(8676002)(66556008)(66476007)(2906002)(6486002)(966005)(54906003)(478600001)(6506007)(26005)(53546011)(6512007)(36756003)(6666004)(186003)(82960400001)(2616005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2pibDhRZUt1eVUydjl3em02bUt1U1prWHl6VUJkT24vd1pEUU56VGltbUZy?=
 =?utf-8?B?d0JOMERqR2tUcHhGcnBReVZkYXhHeGNLYkNQaGhIclhzWm1oMVArbXdjS3pp?=
 =?utf-8?B?UWJrUTNreEtxVDBOaEhqbmZjUE9yc0V5NEJoTU81OFFncWRqMDJ3bVVSMmZS?=
 =?utf-8?B?WVhJaEw5VDV4UStBOXZLUytxWXRKSkV6Z0pkSjFqZkdzSXBLVENWLzlDSGFR?=
 =?utf-8?B?cm1BSG9KZElBZjJyeXA4ZUhKUkNtdVRWKzBlUGRQZmR4OG83dDhVRlpGVlVt?=
 =?utf-8?B?THYrNG00TkViMmY5OHdreUVFYkdOaVZ1VEx0L2ZnNGx0TEM0UGJpTHp3T2Mw?=
 =?utf-8?B?U20xdGFWV1BzdVYvMC82eTBldG5pNjNkOUhhTFpGYXJSS1UxakJ3S3hGRlZW?=
 =?utf-8?B?M005ZFY1M3luRDQ1T3lHa0xNN0tUaGx1YlN0SFVTN0FObnh6UktpRTcwdmJ2?=
 =?utf-8?B?RjZXckxXU0N4dlVPMW9FK2JqMU9mZHcxNWVrNFRHNEk3a0NHdW5BVi9ZekJy?=
 =?utf-8?B?Tm9HcFNmWTV1ejJDYko2ajBBQ0k1OHV5UmJoSHF6aDBqSEVUaURLdFp5aGlY?=
 =?utf-8?B?a3pQaXhCd08yZTFkYzZaRnQ0K3ZWaW5pVWpXR1VWUFJTSTZlZDYxL0x4Njk2?=
 =?utf-8?B?QXAvcmcxMmJyWkNLb2h5T1ErdlJ0N05VeGVMaVk4dFU1WHcrMS8xRzd4bW9D?=
 =?utf-8?B?SHFvTElIRzgrS29tMW1MNU1CVHRIQ1V4eU1TdzMxRWNqZHZnNXhyc1AvN1RI?=
 =?utf-8?B?c2JBR2Y0RUFOMnVDZ2FLUG0yUElYQ0FPd1JiUTREVXZyTHVvZ3pwemt5M1RE?=
 =?utf-8?B?VWxDWkVGTkdBaENYeGJ3YWJjeVF6RnJXVEFPc2pBU0tZQjZhMmwzR0VEMXB3?=
 =?utf-8?B?WUF5c0pFQ2dIUHlKR2FUeG1ZelI2NGxiZmVGNnlWRENmZURYalByNlJjMHY1?=
 =?utf-8?B?VmdmRXlzQmdnTUk0M3FHVmxBK3k3bkZHbEJRU2NnaFh0RlAvTlBHNVI2ZDhl?=
 =?utf-8?B?allxclMzRlJDbTlGSGhBWEpURlk5cmtnOG8xdk1nUndva3F5c3pEKzVZZlR5?=
 =?utf-8?B?U1hyQWhBY2FURVNKQXJtQ2k5elh6RElCbEh2bjdOdWJHeFBwQStBUVNTalNH?=
 =?utf-8?B?U1NMTmhUUnZhYkRXeWxxNUZaS0lyVC93RThwSEsrRTNLdDd2UGIzN2MwaFVU?=
 =?utf-8?B?elFDcnIzQXBHV2c4NkdCSjFqelVCQ2VPTVVBR3JaRldkcHhWT05PRUZPTnRF?=
 =?utf-8?B?ekx4dkYyL0h4T1kxSzhFMjliUFJsK2owRFQ0b0Z3VUpIejRWdmxVMXZITEhP?=
 =?utf-8?B?STZ5ZlRmUmZWSWdLZk14MEN4SUF0ODNkalByNkw5ejRDdkVibEtMenlLc0NJ?=
 =?utf-8?B?WW1GRVBoWHZkZEd3WE1kaEpwUnJieHIxYVpic2VMMVR6YVFsRkx0b3JUd3FI?=
 =?utf-8?B?Y2pxOFFTSHdRS29zOGVkYnphNFlSR0VWQTgrVnZYdDhBNEhpUkJNbDJmcmZT?=
 =?utf-8?B?TnpuUEtGc3Z5Z291ak9iWE9EM0NzelNHa1hOUStZeFBzWUo4b2FGSnZFZWRK?=
 =?utf-8?B?Zkl1Rm42QjJ6VzQwNkxaT203MlVJK1VkWlIrRU0rVlExcmFKdnhuU0d3K3M1?=
 =?utf-8?B?ckU1ZmdzSXY3ZGdYaklyQzdxRUZWUkFqWXU5YUVVTm9MNzMxazB1MEVYNjM0?=
 =?utf-8?B?Z0xWcUI4SVFwQ3dYdE1Bck5ValUzQk9WYUFDT2hCY0cwK0pWVzZCNVJreE5y?=
 =?utf-8?B?YVFhKzdtV2FKSkpIQitYSU9OSWVBbU43KzZYVUZmeW5USWJLYi9SdE9DK0F4?=
 =?utf-8?B?VU5UVTMrYWtyRGNRbDdwM2NENUw4Tjdpek1xNmJiczA5NURrUWFYLzYya0lV?=
 =?utf-8?B?ZmNRd1NndzRRMzQzUCt6OE1wTHAzdzJ0Rms2QldYUmducVBPVWE4TGdOUitF?=
 =?utf-8?B?MVBmZS94WE81N0FXNTdVWXhzTjBYY0oxK2t2TFZwMFNWbDNHWEJqOXhWajho?=
 =?utf-8?B?Y2VtcWJkT3Q5L0lKME9mK0RtTHVPdnpIUklqTjNiMzlJbGp3KzZReHIwOGRp?=
 =?utf-8?B?TDlyQ3lOOE1CZzRYOTg2YXp4NU9WUVFhamI5YlBLRHJHd21Ea25UcG9qY3Vy?=
 =?utf-8?B?ZXU2Rk1IQ0ZNSVFPTURCM0djWGtCcnVhcys2cFpCckRkNnJuYjRyNXR2RjNl?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/anNION0lCyHAe08Q+AFgR/ewnwhLNWkLngR1ja8pHDRnHXs/fq84MG2kDKLngvnalmRUfGFVWdE9pV0fDcTlZ+J1wLn0QRZSafot2MVRKWJ2jp2uHurV6Jnzj/rhCr15V5Suxv993gOk+edlMw0dyqMrq4HmDihwJsp6nJVkrNpLM2ptTTu6uYd3diR/MLRh34FTCu+mTVUpqc5nPWfiqAqPKHvbD4azEnRCfh6LvhnmlA+YAwLR9JSTxPttC3dhaVvBi9K2Ohghen5m3a3fOyg43HwmWxO8xjU3gPDB/bXVJs56TJjr4E5n1csNmt943hHiFtxKT1lmLYSiphWNb0aWfeJr73es2Br8SW2kkoXctQQD3CtooX8ccffIyRVlbJKg32dGtHewVRGak9KW+Br7gmljoV/d1G/w3tBWKaGU6gHq1+veXbuOGgIKAo+kdX2GPDalyXZZpqqx9s1Ckirm18rRblf4GvkeWIYmCisqgwtDlVQUWcIjlnMecvyIFZyk4iBGc80RyQ8nt9KEaQbsM8y78VaL7IbvASWM64cbNL+A/CX50ZmzbZOPLxOW/ddM1U5LCblALMNyFCMn8LG03gB1RsxQKcwcdbPI3KxQxrH7JQOjgVz0hVU8oHfFtFw97g0ikeNv5/Z8l1C6k0J+GUduUnr0Qy8L0qMfw69sYkrokAZPaWMUqxPi3YNndVd4CNWNLLpG6p9wAKId9xeV23SuLwr41h//zeqx13oVFG8ys49jXdfjWRkMM2tgZbQWjkYiDqkr2SZerCjCemrBaUJ7V/Lkmoc73n3MuHkSSk10UQQG8bFTBxQ4uVgqEApqrbSe++5ROPo1Vrd/Q==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a52780-7c53-4343-8dc3-08db1654f234
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 10:50:30.2932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FVOWq52ZhInJTQ/BpBEEZj9iTLjctypkfC+2xaXBcssCVNAX5u3CHxFbvPCYkWAZd6q8HZlbu1+lEpO7NpRuSjWggRbZQHhczTK2UJdjECA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5721

On 24/02/2023 7:27 am, Jan Beulich wrote:
> On 23.02.2023 23:03, Andrew Cooper wrote:
>> https://github.com/llvm/llvm-project/issues/60958
>>
>> While trying to work around a different Clang-IAS bug, I stubled onto
>>
>>   In file included from arch/x86/asm-macros.c:3:
>>   ./arch/x86/include/asm/spec_ctrl_asm.h:144:19: error: \u used with
>>   no following hex digits; treating as '\' followed by identifier [-Werror,-Wunicode]
>>   .L\@_fill_rsb_loop\uniq:
>>                     ^
>>
>> It turns out that Clang -E is sensitive to the file extension of the source
>> file it is processing.
> I'm inclined to say there's no bug there in Clang. Gcc, while not affected
> in this specific regard, also treats .c and .S differently in some perhaps
> subtle ways.

This part was just an observation.

Whether .c and .S should be treated the same or not, this -Wunicode
diagnostic is given against something which isn't in a char/string
literal, and that is a bug.

>
>> asm-macros should really have been .S from the outset, as it is ultimately
>> generating assembly, not C.  Rename it, which causes Clang not to complain.
>>
>> We need to introduce rules for generating a .i file from .S, and substituting
>> c_flags for a_flags lets us drop the now-redundant -D__ASSEMBLY__.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

