Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FC66B9CA5
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 18:13:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509770.786217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc8Co-0000fD-L8; Tue, 14 Mar 2023 17:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509770.786217; Tue, 14 Mar 2023 17:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc8Co-0000cG-I2; Tue, 14 Mar 2023 17:12:58 +0000
Received: by outflank-mailman (input) for mailman id 509770;
 Tue, 14 Mar 2023 17:12:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQyL=7G=citrix.com=prvs=430d4338b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pc8Cm-0000cA-WB
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 17:12:57 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74de159a-c28b-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 18:12:55 +0100 (CET)
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Mar 2023 13:12:43 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6780.namprd03.prod.outlook.com (2603:10b6:a03:40f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 17:12:32 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 17:12:32 +0000
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
X-Inumbo-ID: 74de159a-c28b-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678813974;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WNV3XnPW9hzn7zJ9/1bUyq492kGnuuwMFJTzUYwAIFE=;
  b=RymANpKE+5EJMNZaWH7+3PYSL0nX+XSsGzClJeUE0iMweVkGl+GVPKD7
   UIoCQhzHz8UdjeygC4B496KUuqqKYsoI6Jsi5h2c9GVwNbVXQPI64Qlo+
   RjMiPGXsYh3BL5pcW3tDBS6OPZsFfksOOspJnKUzSM/knbGANIMGGK1PI
   U=;
X-IronPort-RemoteIP: 104.47.55.107
X-IronPort-MID: 103239581
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7W8z+6NZYNrHF1TvrR2QlsFynXyQoLVcMsEvi/4bfWQNrUoq1zYFz
 GEeXWrVa/uKa2fweY0laoWypEkD6JfUzIJqSQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5wBmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uA0Gl1Mq
 dpCETsUYDyz17OZz+ykbNA506zPLOGzVG8ekldJ6GiBSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujCMpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxXihA9NPROTQGvhChl2XnmxUCgMsbgGQ+cGYux+deJVeN
 BlBksYphe1onKCxdfHhVha4sXmCiREBXfJPHud85Azl4qje7hudB2MEZiVcc9Fgv8gzLRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBscOcey9zqoYV2iw2VSN9mSfaxloesQW62x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBNfxooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:wVDjmq3EmT2iAiyvMTVEuwqjBa9xeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtj4fZquz+8T3WB3B8beYOCGghrTEGgG1+ffKlLbak7DH4JmpM
 Jdmu1FeabN5DtB/LjHCWuDc+rIqePvmM7IuQ6d9QYUcegDUdAe0+4TMHf+LqQZfnghOXN0Lu
 v/2iIRzADQBUj/I/7LTkXsGIP41q/2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbfyJTzawk+W
 3llRW8wqm4qfm0xjLVymeWtv1t6Zfc4+oGIPbJptkeKz3qhArtTIN9W4eatDRwjPCz5E0smN
 zspQ5lG8ho8Xvecky8vBOo8Qj91zQF7WPk1Daj8DbeiP28YAh/J9tKhIpffBecw008vOtk2K
 YO+26CrZJYAT7JgSy4vrHzJltXv3vxhUBnvf8YjnRZX4dbQLhNrbYH9EcQNJsbBir15K0uDe
 ErJsDB4/R9d0+cchnizyJS6e3pek52MgaNQ0AEtMDQ+z9KnEphx09d/8AblmdozuNLd7B0o8
 D/doh4nrBHScEbKYhnAv0afMexAmvRBTrRLWO7Oz3cZeE6EkOIj6SyzKQ+5emsdpBN5oA1go
 79XFRRsnN3U17yCPeJwIZA/nn2MSSAtAzWu4NjDqVCy/jBrOKBC1zGdLluqbrvnxwnOLyZZx
 7pU6gmRMMKLgPVaPJ0NkPFKt9vwEIlIb4oU+YAKiOzS/3wW/3XX8zgAYDuzenWYH8Zc1K6JE
 c/dx7OA+gFxnyXexbD8W3ssjXWCwPCwa4=
X-IronPort-AV: E=Sophos;i="5.98,260,1673931600"; 
   d="scan'208";a="103239581"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUCI1eCZcg2eEGnm5cz5ENJ3SkLrWv7V8PgVfRz6h2ndeehMx52Qn76Y7TraYyMQCfbBFBctSxHxWuZfXwBXifzeXd8j9TwFN6JkOOvd9HekJiLl53Zu1/4X8BdNcOlU8XLz5ld2hdRN/I12Xd8ZI/CO2IZPeAJ+sS+EvCFYeUW/NquY4n5DFfmvW+54T5rHwgCdn8ghch0zKm+0Bv5zHbqI8uJHXcToLjTyCwXDIbu3HyBNc6tbdzRF+tVCaKcoNIgCviz1FjDl6UwWSSDv6PoC9ul90xe09aE0LGmzm6wwKRQDZiAlf/IHhkiz9thrpWrTV8oe5NNKC4twkiGazw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzO+0RLzqCwH5Ons/whoIqqGiYWhe3ccpDKQGAatx4g=;
 b=Fa/7EsFFcjj9Jlm9m6c5IlqQKm9ySwK1TsC66ARidqLwVCMETfNbLPysw/xnsCe9BBbh+putV1Xz+hTZ7qGmzPNL+KMyP4MgT+WASgPxyfsHLmnbU78KQclxtYS3BoJGdMYG1koMy7hr4QwSAbynCS1/Dnf5aX6twXs1jA0H5bEiH4DwdIJxeuiUx6I/BSivICmJknMaWxXA5ITnlFRssM2WsOUT7sMlpxsnhVzB1nxIQjH+j9P4XXortBkdQvZxMMWSyzYgSOjGy0R2sC8YYPTYOq/RmkCXdVr9mvUO0aHpkew0MrqHLfyasUYDJA/RmBPu7Gqx3n5jqdFV5v+FlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzO+0RLzqCwH5Ons/whoIqqGiYWhe3ccpDKQGAatx4g=;
 b=DDEjK59gdCoyAMdU+LRDXUBUJDx0yRRavDQDTa11cA5+M0Fy1+7kT9ZjNVApm6cx95xYk/4Ogz0XZUBB/CZwiUESXqSiq7p3DjYTe41HBKtF2nIGNhcmQbl9d8AkKukLcgWQRSwiOmS1rGtyo60hEn51vCnSJMx2HbE/MiaCgY0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <594d64f3-a2ae-dbfe-428c-901fd806e88e@citrix.com>
Date: Tue, 14 Mar 2023 17:12:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [help] Xen 4.14.5 on Devuan 4.0 Chimaera, regression from Xen
 4.0.1
Content-Language: en-GB
To: Denis <tachyon_gun@web.de>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
 <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
 <ce1a289e-6ed7-9b5c-42f5-069f16bd6984@suse.com>
 <trinity-429ff607-c131-4745-8c96-9d7f6f61234f-1678481409956@3c-app-webde-bs42>
 <31151e94-b8b3-15ab-3680-e1c6e2e97530@suse.com>
 <trinity-7e872635-20a4-4120-a08d-2d62a77d2da5-1678756503867@3c-app-webde-bs22>
 <2afa0abe-abe5-a3d8-658f-abc466d78101@suse.com>
 <trinity-7c345507-5695-4649-a62b-be4dd793cc00-1678805608384@3c-app-webde-bap40>
 <e5a4689e-27e1-6992-65f8-c59b669aeaf1@citrix.com>
 <trinity-1d86f8fd-690a-4643-95e2-0f83d138c6ef-1678812509474@3c-app-webde-bap40>
In-Reply-To: <trinity-1d86f8fd-690a-4643-95e2-0f83d138c6ef-1678812509474@3c-app-webde-bap40>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0218.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: db72ba0c-1c96-45d3-cfed-08db24af4c91
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xHsAfrW6moncG7zbiPLkjP7p4mLcA/+m0+7qx6dCXhBUH7FhgHO7Lkcp5XD/wbd9Hv31ia8JPN5hVvVJvZ3kRWhWIWKq01GKhEXvqualc+lfav1YA9UEwwmMy0CJKGrvbGQMzn6ECAHwbZptO6Kxz8+Chj5CkrmWBlVsQ4dRcgqceCvV0wjqGJNPSu9yOdQ1odsqF4PqhJmLDZGMTfYEuLejMNXiIgesWciEUV4/fdTq+NJYv8b4/L0KRk+CNHLnEPwu+rVTLXuZlZHmgSdDMw7eTnA/k6BHkNuGxwoqGX5dVBjTMpUj3pVaF+Iq+Tyuw8OPvOUXkbftJCmxjjIGl81kf97VMnSJAaRBk/BFs3enCMXitPZIRIqjTohOj/0eOkO6pxUqCw5ckirBKoUtHVVc/e3KtL2eNsiE+zo3Y2iWdt2B6YN5POuqVCZk+KStrSVoZeSrHyMDHKI8/5AQgD91ob9IovpiL0NA/Ub0xcqEDNL5qdFwQca9kwhdUbjHdV03KD5/sJ32XEa9xphIHZCHntT6sldWhgzguwv9VUZTDr5FlCH77cT1Fb0UBXFMRr28roi1bVT2ML3nGwyxVHmaFQrLiY1yDHXHsoMfiheuPEdgKgedmumv4r4XLqxGh/lcUy5WyiIisAukfrDEbGtx1wow0VVCk4OEvocKjRvtg63Or53PBBrqQZBH2X5h5UmfcVInMuGaOlh/EBX8H3d/xDbRMNtY4Hw54JZ+L7A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199018)(86362001)(31696002)(36756003)(38100700002)(6916009)(82960400001)(8676002)(66946007)(66476007)(4326008)(478600001)(41300700001)(54906003)(8936002)(66556008)(316002)(5660300002)(2906002)(83380400001)(2616005)(53546011)(186003)(6666004)(6506007)(26005)(6486002)(6512007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3ROMExyU20vaERtcjZ1RWxYZXZlSDUvaDF5aDdEMENLaGwvQ1RwbHI2MGZN?=
 =?utf-8?B?WmI5WEFHMUV4Nm5XNWl3MkNiV3JMRElnSXNJOVlZcmJSaVk3S21QZE5DNTBh?=
 =?utf-8?B?STh2eXF2ZUNJOEdIRDJaS0JvK3V2Lzh6VloxdTdrcndDWDRMcW5hQytyRGo5?=
 =?utf-8?B?Z2pYWkNBR3dOMzJtODN2TFRyVlJGdzNYemkxaDhUK0FDYVQ2WmkvUk9SWGJG?=
 =?utf-8?B?WVg5dnpielBLOGdpVm5aczdxTG0zTENBTmJtR3FubURRZzM0N1NyNGpRUk0r?=
 =?utf-8?B?bmdGN0dzYmMycE9KTk1LVEsveVpPYjByTFFoRi9MSlJDcTFFVHFSOWRJLzlJ?=
 =?utf-8?B?cmNGemtwTkY3UUVQWC9ZWFFwaG53cVgrNU8raDhHbmN1NGhabWVYdFBINVlN?=
 =?utf-8?B?ZFpIanVrOXpnNk9FWEFmZUFqTGxTdllKWEVwM1hXUGQzMmZzZjRZYVdBSFJ2?=
 =?utf-8?B?bW1YdTBDRkdOeFZ5U1Y0YlFWZnV2U3FSdlZsSHExL0ZtKzN0MGVYZTdHRi9E?=
 =?utf-8?B?ekF3Q3lRV2pWRUhQajVEeCs5cVVXVGxjOHptRTl6dG5kZzE3T2lhVnRQTWFG?=
 =?utf-8?B?QmFJalVxT2gxVUxURTN3K1JOY01jUWVxWFFWbVBGV2Y4UTdDQ1pZMnpxYU8z?=
 =?utf-8?B?a0Q0a09rUjBFRmtQSmRqRGF5TXZJTXBJcWM5eTdmU0VNU3d0dTlmeHUvQnJn?=
 =?utf-8?B?Wm1iZ3dvK1JlNVorY2h6YWxHSUxmNyt5UmdUU0s3VnB5Q1N2eWtheUtQWmNk?=
 =?utf-8?B?M08zUHNlaitxN1dxYkgxM2RSL1ozTXNSMC92S0ErWGltUk5GK2VHQzJuVVF2?=
 =?utf-8?B?UVdLRUcyQm0yRVY5c2JTUDZqd04yNm9mQ0FNcGg3SDZvMFJXNzF6dXhyMXhi?=
 =?utf-8?B?c1hpbXhYS1B3cWpxMHRvQWdxSUs1OFVSYXBJaHRsNGlsRHNRNTRqcC9DTSs3?=
 =?utf-8?B?QlJWRkhPSUROOE9jMGpqYlpFSGhvbUJDYXVIaHUvOFBTSkhSTWpRWVdFdkVB?=
 =?utf-8?B?bnBGSTR1UTk2WDBGQmZFSHhWUVpnYzNFaUpicnFDazJuQitaY3JiL1hROEtQ?=
 =?utf-8?B?RHlZOTd2Q2ZERzBrL3Y1MDd2dGx3ZzlwNHJTNmtYTlFwaTkxSjFDSFZ6azVS?=
 =?utf-8?B?QWttYmxFWllpMjhQbTZPVEMvREt3c1dNWUV3Q00rbFlqcEpyV1ZHQThwVXU4?=
 =?utf-8?B?cWlJaEt5a2ptSkcxRGdXR2p3T09SbzdCV2RXU0MxMFFrUCtQUDRuWlR6N2NO?=
 =?utf-8?B?RlhXYnpscncxS20zWjdPbFRsUE9tQjFkaDZFSjB1QmVKMnJ2MWxacm1UZGRx?=
 =?utf-8?B?MEdPbFArclV5dC8xem5wZTNlZUFpZk9kRTNtTUo1L0VEOEpEMlRNaTMydzBq?=
 =?utf-8?B?VmtRblQvZDhLbGs2SXM0eTlTakZVZ1VFODR0VzRoWVl3cHNWekl4dFJGOThi?=
 =?utf-8?B?UzVORHlmRG45ZUNGTktWWnM0MnkvcEFld0hwa1A5RDZRQUJDMDFTRnlLdE1o?=
 =?utf-8?B?ckRzL3Z2UUcvVE5mRlFhd3pJTXJObmNHdFJyNXM0S3J3Y1F5QlA0T1ZMRzNJ?=
 =?utf-8?B?WFpqZEs5V3FJTTRjNkNjTmhzOFprYS8rSmFsdkc2N05pc0sxRWZyQk5icm9a?=
 =?utf-8?B?ajRIQzU5djlNUk9BdjBxVFU4bjZORHUyNS9ieUthRVUzL3F3cnU3cms0dmtl?=
 =?utf-8?B?c1MxTFU0RUd6M29wUGJ2YVR2eDdNdkRNcm90MlU4b0MwbG9TZU5janlSVDdK?=
 =?utf-8?B?Ty9Mc3QyRVROaFA4NHo0d2xxczRTTTdFMHFRR2w4bktlZnNWcjlNdHpCbEZX?=
 =?utf-8?B?MzFPTkkzWk1kaUhkclcyb2pCVmIyK0RIa2k5cGpsSDFNZzJTOFV3aHhxTE5M?=
 =?utf-8?B?NWx2SHNVcElyOERsQjRiVUZKZFdxYUR0RjUvODNzZEl4RGE0VEttNG9vejBm?=
 =?utf-8?B?WUducTllTlhFRDkzTG1waVlaWWRnK0Z6U0dWamJGcEFidUd6cHBvZStBTXU0?=
 =?utf-8?B?VXUzOVJBTkxuT3FRci9HR2pUa25HT3VaazM3ZkpNRTlXSkxyeC8rdEFlUDdK?=
 =?utf-8?B?TXFKV0Zia0ZiZWZsS2hkeHhQYnR5SXpyZ0NqSy84NG9wUDZPdnd5Y1IwdVBr?=
 =?utf-8?B?U0xrT2h1YmdTT043TnBXT2pCUmNyY29mVjN5RlQyZy9FaCt1c3U5a0RWNW5x?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8WJyAdpPF2Y2WEfaSh46eIaoGM7y0e3TK8FyUhitgqGsb4J9zJBtbEwmRZVDLSs3DCOUvmihhACY3ko5CxvyU/cagedzHq8YM1gV2l7k6YY26aSzA76PRgmuBqR20gPDNBTSjIk2cdMeLZWY16kllV3Wb44BnlmZz3Qpb4uRC7vF/TavPWcTg51ShKwSV9SQc2PxlrxZbooV0odLG+HEEyTz0vkOKKo4HyiO6AUvIo8xDzDrkr0gL9Ks0xXW0rI0ZR4C1q/pysxwgL/nfmvLPaEN+qVXvnG6/ZM/lSWmEEZW092JuViJa63N9w9+znHD0BQ+rkP0/ww/kJX+yajhtCz6LFNGBRSfhY1B0cmI8rgcbk0ws4THexJIIJZ8O2Y5uIfqVhry+06u7JIg8xFkWc1XQ/aA/8Otmb52MTNzVgEN7p/XUGEFA/e0OMglzHORvV9YD17m2NQkSDLCw4HXXzOUqz+IuWknrXihk6HDfjqY2QCxmlzXDFcgybiKIUmKbhxpy9CbltMxWVAjVjQOWUjC5Emu5s140g5Aau9v+0RC51HEkSiWkXUbV9s+YjKfiv2lnrXabhsMNYTf8mevh49o463q+K9BlZQf3tzqpB/KENJwUrhfuk8XnS1anRkmyqB2RGVya1s8BLY/UxJ/SQCOldRJEVbqonnW/6n/vbYV8nl6N7gFx//OjtetaJ3fPe/5HvCkfWG/HUB+QzWzoFR1sZ7EgG863evub5qK549rkj1b9kt0Cpb/52xa9JLiZ8Rxxa6U1gEmf7hEbhgxfbynrsAZf1xk/06/lXDLRS6fHMikjWVa5k5HU7JKQ6cz
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db72ba0c-1c96-45d3-cfed-08db24af4c91
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 17:12:32.8370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L/ds383k0SpriMh+oe1htv6rofkjXJGugIu2ZZRBoAmzGcu/qRohFchxT0rElJWbaFIK179In8EOgEpUtpRRqSmGdd/JZ6Oh53bFWc3WAjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6780

On 14/03/2023 4:48 pm, Denis wrote:
> On 14.03.2023 16:11, Andrew Cooper wrote:
>> On 14/03/2023 2:53 pm, Denis wrote:
>>> On 14.03.2023 07:37; Jan Beulich wrote:
>>>> On 14.03.2023 02:15, Denis wrote:
>>>>> On 13.03.2023 10:36, Jan wrote
>>>>>> On 10.03.2023 21:50, Denis wrote:
>>>>>>> Should I test something else?
>>>>>> ... there was no request for any further testing here, for the moment.
>>>>> ah...sorry, going by "Would be nice to have this confirmed forthe system
>>>>> in question, i.e. without Xen underneath Linux" I thought I could test
>>>>> something which might help shed some light on all of this.
>>>> Well, yes, that Linux-without-Xen test would still be useful to have
>>>> results from. I didn't account for this in my earlier reply because
>>>> I had asked for it before already, and I did take "something else"
>>>> for meaning anything that might have turned up as useful from the new
>>>> data you had provided.
>>> What tests could I do or what info should I provide to help?
>> Can you please rebuild Xen with this patch:
>>
>> diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c
>> b/xen/drivers/passthrough/amd/iommu_acpi.c
>> index 2fdebd2d74c9..747eae25f56c 100644
>> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
>> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
>> @@ -1033,7 +1033,7 @@ static int __init parse_ivrs_table(struct
>> acpi_table_header *table)
>>      const struct acpi_ivrs_header *ivrs_block;
>>      unsigned long length;
>>      unsigned int apic;
>> -    bool_t sb_ioapic = !iommu_intremap;
>> +    bool_t sb_ioapic = 1;
>>      int error = 0;
>>  
>>      BUG_ON(!table);
>>
>> which should cause the behaviour to revert back to that of Xen 4.0.1 
>> (i.e. it will fully ignore the checks relating to the southbridge ioapic).
>>
>> Confirm that with this, and booting Xen simply with `iommu=1` that full
>> DMA remapping and interrupt remapping is considered active.
>>
>>
>> Then, can you play around with passing the soundblaster through to VMs. 
>> Looking at the LSPCI you provided, it only supports legacy line interrupts.
>>
>> Does the device work fine, or do you get a bunch of errors on `xl dmesg`
>> about IO page faults (which is a generic "IOMMU said no to something"
>> message)?
> Am I right to assume that I would need the source/header packages from 
> the Devuan 4.0 install and then re-compile Xen?

Yes.

`apt build-dep` to install the build dependencies, and `apt source xen`
to get the Xen sources.

All you actually need to do is is a build of xen.gz, not a full build of
everything, which will simplify things massively if you don't want to
rebuild the world.

~Andrew

