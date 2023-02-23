Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6126A0D7F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 17:02:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500554.771990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVE2A-0003kL-1l; Thu, 23 Feb 2023 16:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500554.771990; Thu, 23 Feb 2023 16:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVE29-0003hN-Uw; Thu, 23 Feb 2023 16:01:25 +0000
Received: by outflank-mailman (input) for mailman id 500554;
 Thu, 23 Feb 2023 16:01:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fv/5=6T=citrix.com=prvs=411d40f12=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVE28-0003hG-Ck
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 16:01:24 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ff694f5-b393-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 17:01:22 +0100 (CET)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Feb 2023 11:01:18 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6598.namprd03.prod.outlook.com (2603:10b6:a03:38a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 23 Feb
 2023 16:01:16 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 16:01:16 +0000
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
X-Inumbo-ID: 4ff694f5-b393-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677168082;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BTfVlBRZvy9746qOA5Wz4Z3Lm2yuK8BeQKuxREgCjEo=;
  b=ItJaVhWH2WvYKMk0bwfesGd4tNMKxrgTwNkDQGID7yO6Has9gY/NPojk
   PBuvYyJWWJiyjofdVe7W7rpV1nEOgw6mssK+R2LPhKSccZoEsT46iXSsg
   +d9SAaMOewql64c+74jzY/5gaU9DwAINwx+E8A/BLNkx480yqCC+lrSyY
   c=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 98155573
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:88xwmKNzGWwtIKzvrR1glsFynXyQoLVcMsEvi/4bfWQNrUp00jMOx
 mMdWz+DPfqPNGanLdh/a4W+phsC65Ddy9M1TAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tC5AdmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vcqO3BOy
 +A6E2w2fxmS1smL6rbjYNA506zPLOGzVG8ekldJ6GiDSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+/RxvzC7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr6fxH6mBd1JfFG+3tFXmE28yFwINB4bS0qpsbrlu2+3dN0Kf
 iT4/QJr98De7neDS9DhXhSjrWCNpBc0VN9ZEul84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YXeU6radtnWsMDIcBXELeSIfCwUfi/H8pKkjgxSJScxseJNZlfXwEDD0h
 jWV9i43guxJidZRj/nju1fanziru57FCBYv4RnaVX6k6QU/Y5O5Y4uv6h7Q6vMowJulc2Rtd
 UMsw6C2hN3ix7nQ/MBRaI3hxI2U2ss=
IronPort-HdrOrdr: A9a23:67Nug63phD9QRi0LCMrwwwqjBLwkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnO7f6gylNyri9vNMkY
 dMGpIObOEY1GIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.97,322,1669093200"; 
   d="scan'208";a="98155573"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3kIgCcHIkP0v4X5Z7wR4KZilb/yr+um0Q7YRTwEq9gq3nlU3YtFVE7J+sXZuiAagQemNKILj7ZuEFYjLvBg96p4OYPWbHuhBaZYSOV9AkHyfghEVj8o6vgH0VUeW/kWtjupVDIPiFfFdYkjmEbz/2afeicZer2XjQyarm+YKavadJICy4EyRWG+kcErPRigcoY6xVnpIzA/DQS9E2V/tFBS56F2ZJRLV3qRAI60d22nZvsBxvfqMigMpkDharGxnnSPkvTxSlEg2AappGNgBCTRKIvMsxGE08+fpPmwpL/vyGoDGtaizBoz8MZRSeAd1dpZrshAUvrG/yOgLlHzsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTfVlBRZvy9746qOA5Wz4Z3Lm2yuK8BeQKuxREgCjEo=;
 b=WLYmxf/4R+HgnBzDr2gpUgXmr6IISFsEWp5orwlq+gGT6eC5kjJ2OdrW+qo+YpzKUKnETYuW3emkctyOAzYJLmsxM2a87zlLX/MQGZdGnCWyesNzNcraa5r5T/5t2hHX9V7ZqADZOD/3LCIVXhWuL/+q6H5HIX8CDc3+n/AzLjhLVfyoBWcjprkvb1ZiwxLz2SXVZjSk95SNZWFt0IxaUWVkIQA5twhArsSQUhC/UzyKFlYlbJdNSRaE4S9dbUKPE8cAVG9avivqHnPSt3WRsaL/MUuvUuuc9DD5UGUkxtgaf4wdeVSHMqiuWI+1pTVqvsEB0APxRYTu7EJeNQS1pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTfVlBRZvy9746qOA5Wz4Z3Lm2yuK8BeQKuxREgCjEo=;
 b=qRywsHFrY3N0AOLd/zOQkhbT1p5qNv0N7NLzYSZPX9d7+M2lwa9kKxz1hRQWTqefMFBGhLSV24/0DRYwEk1/O4bO+12wvU0/dpen/2MFmTJ9d+QOKSkq2Sa3mPq/rF51bpmEuTmjzEYwWvrgn9N8b8gBdmObzK1XMh0MrCiHHs8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f71bbf79-e452-f2d6-58f9-0f2cf019c7b6@citrix.com>
Date: Thu, 23 Feb 2023 16:01:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v2 2/2] tools/misc: Add xen-vcpus-stats tool
Content-Language: en-GB
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <cover.1665138677.git.matias.vara@vates.fr>
 <df706d6dcfba965909d776dda163fdb261d1a0ea.1665138677.git.matias.vara@vates.fr>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <df706d6dcfba965909d776dda163fdb261d1a0ea.1665138677.git.matias.vara@vates.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0116.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6598:EE_
X-MS-Office365-Filtering-Correlation-Id: c25d5a0f-c694-43fc-c66a-08db15b7313a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uiiTfxrS93lRX4P4MP9BKIPu1CuPc0JQOaKrpW+XEBLYD2ei2wRQBe5QHsaMsSWiiUUJDIbLWFikAZcMytOJPOegvBMNva/vZd7A1U8Q+2QuS3GOfWszsSOBmHJyxR3txVETA8O3IzJY6J6jesJRh8V5bhquiUwLDP1T9vvV2a4SYoM9ByxxVaJ/HR8GrK2AncvaG1EhH7Fe1iCMdmw1ltSjk0AGzLI7kfhCpTvAI6eZsiWfH4wj0CDF9vnzFuR4WGG12+xYPf2JOinfEIlMzlgih8shaOIZMTaWiia3YwL3qursdn2KesN5OyotyQdZ6LOQnt+s3dSVWzH5xe+2HzCh1NnVGeXla83lENzcp/+xprTSfwZwXequ70TBJD83SKCHgxMFetDsB6mwiQQ5XCJDjnxeQ/8s4k7GJZ9DUDuE3Yskh/uTLFw0MPIpMXduhEiSebPlO9bg6G05CiMxK2/2lKd88yXgM5tkfvDSDSw3jJ7P/v4/OQUMqJ1kyfHkT2/mylMvOOGIzGcZkouuzrbMdnVjim9Mu5OeExN+9y8GcoK9o8lPS3bp9ztPavxevmDB5/FVtgV5EvKq4aQbpWiZfhXe9ffwxX+P0g2t9EDQ8zC6mj2XteG4P4RoqtTXIykbfw/cdaf6VKj62X/avIUallYTnmI+Pyf81JIPGzaXIv06mdzAESq0VSsyXOK01cp/JEB5smX3FFCgaijc+DaCRYYCnIv+QO1MYYij9w4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(451199018)(6486002)(53546011)(6506007)(6666004)(36756003)(66899018)(86362001)(478600001)(107886003)(26005)(8936002)(82960400001)(54906003)(41300700001)(8676002)(4326008)(2906002)(2616005)(186003)(5660300002)(316002)(31686004)(83380400001)(31696002)(6512007)(66476007)(66946007)(66556008)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG9xU25uQk1PbmtabEIrOURJWG9tMXY1TUNNbUIreGVuQmxKOTliVEs0RWRw?=
 =?utf-8?B?R1V5N2YwQXV4b2d6QVphMjJreTlWeGNma1dKUTBmbitMUm5qRUdNYUIwQThG?=
 =?utf-8?B?czJUVHRSa1pmT0pVaWNQNmt5djRtYzNIczVZalQrcUdzOTJ1SFJOSVZ5WlF0?=
 =?utf-8?B?ZFZldkR4eE0vRDJDQzUvME5YNnMrWmxoOGFJalg5ZVk5cFBOc3pqZUN0Rkdz?=
 =?utf-8?B?WWxwNGVQdmQvSHdMSUlNTmtibnpYUzhNVG9oaHhBQ1kySkprdjI5Zy80SXBm?=
 =?utf-8?B?ODFXQnlleUJGSHJuR0VoaVNIYWt0UzZTdEJ5aDVVYVhoeHJIWlh4TkJZbUtP?=
 =?utf-8?B?L3cxTmJscTdlRXVmMi9tY3hzVFN0cFAvd293QUM2T0dDcGQwdlk2Z2Y4V0gy?=
 =?utf-8?B?UEthekZLbDVoeWR4V0J4MHM3ZlJxR01RamhOdFJkQzQvUU1JNlFFcnZJRy9E?=
 =?utf-8?B?VDRsMDF0RElMY2hpMUhsYldGZjBjbVQ3TUhYcmtKUTN3RWxYU3dFb25RSkRk?=
 =?utf-8?B?TEZoclphb2lLY2FhWlVETlJISE0rN2s3WVU4LzFvenBXUSt0TzJWQ1BxTUha?=
 =?utf-8?B?OGl2Q09XOXdFeUlDUTJSN1ByN1o4T0FOSDFZS3MwZHJPSENwVGVyajJsaFVW?=
 =?utf-8?B?WjZaMlFsUXJ0WVQ2SEM4eDBlUEZrRnZkMFdUZ05jV3JVaHRycTV6VVoxWWRs?=
 =?utf-8?B?YUFCNVBXY3AxcXg1RlptbUFCQllWZExTOE1XZnhaVTIrWW9XcVN0SWZtUTNx?=
 =?utf-8?B?ZUlHRHY4TlAreUpOWjJGMC9TSEEwelA1VEs3K0QzZDVjL1ZCMkJ0VE5vbjZS?=
 =?utf-8?B?ME1GYVpLSGVhdExuQWNPTUxWd2lUblR0dnFFOTZNS0lHdldMd25yZGZBRUZU?=
 =?utf-8?B?di9tTmw3dEVCbTZOazU2VVBMcStDQ0Qyc2NDb016Z3FOckNFZWFuaDQ0akl5?=
 =?utf-8?B?ZjZnN3ZLREpjbzNpR0cyZXBNUzZlb2FpL2Q2b2ZMekovWjA1VUNCUFBzSC9U?=
 =?utf-8?B?SHVrbTlDVVFwNlYyb1c0TWZVajMxQU5mVXFaUlZtYnM4d0twOGNqMUNlOHA0?=
 =?utf-8?B?RmR4b2pUeTRVdnEvODhDSTlHMXFGRW94ZDNadWlhaUN1SGZQQld4L0pUaWFZ?=
 =?utf-8?B?d3RLL0VJRGxtZUxETFF1NzRQak5nTFlkVGprZFNqd3VDWXdhL2NtaURkOGkx?=
 =?utf-8?B?VGxCbU1CMUFmVHlCVCtIdldQZmlKZ0hFejlmWlBVRHpmUVdYSW8wNnRVdy9I?=
 =?utf-8?B?MFVOTG1aNDRzV0NIakpyeGloMy9tcFNmRTc1MUs1cTJ4YmptZDQzek5lUDls?=
 =?utf-8?B?THNrM0tTaTRNMlBhZE9Wb1JoVnJPdUx3MTM4dkdOSFllaTl3Szg2TU9xZ3VK?=
 =?utf-8?B?cU9kMXZDUFE2N3k5akcwVlJqcndROXpoU1FpSGthRmVxa1N0NkRNbHl3Q1Bz?=
 =?utf-8?B?RktsUTlkRi9HREtFelhFc1lXM2NxSWo4L0Y5MmtpaStYZDhrVlZ4cTdHa0Z0?=
 =?utf-8?B?RG1ScUszM2dBbTUrR1RpYlFhVTRoOStUZHFpM21QZGV0TTk0dEx5MGoxMHB5?=
 =?utf-8?B?TThIMndvY3FWWVV1R2s3UmFqWlRRR0ZhZ2lNSWpGckgvMEVSQWk0Y1V4dzMv?=
 =?utf-8?B?NzFVOWhkNUpSdzlGR1BaV3JMTExCWWxTaTRnTzJLR1hlemJzZldwaWVRVHEr?=
 =?utf-8?B?NDRpNytqKy9FeXIvSmFLNFplWDhQVVhJNWhJcXhuRFlsbzMrWHY0ZTZySU5Q?=
 =?utf-8?B?VHAxTEJDeFFLWS8vQm56bVQrNjdXVVM3SUF6T0ppemp2MXBmbUNQNU1nK3R3?=
 =?utf-8?B?b1Zjbm10R1VlQW91MjdJM2h4OXN6V0dhZUg1Rk9qenhtcUhpRWRHQ3FYL2Z4?=
 =?utf-8?B?aFVMRTNxOHphQ21vUFd4Vm1XL2FMM1RGQ3NqNTJ1NFhuZTJ6YnlGcjByZE1p?=
 =?utf-8?B?b0tweW9TK05kNWdDVjlpeGlpTWJodkUvNW9Ea1FxazlydUwwQnFRN0s3Nkky?=
 =?utf-8?B?WmJMVWR0cE1keldwV3NKWTB4ZExCYThpdktGUHpLakVINldZQVFLTFFUSHhD?=
 =?utf-8?B?TlRpRU4vM3NvN3o4RC9GVXdvT2NzSHB5L0FLaHI1c2tLQzRsa0JRRGpuQUZJ?=
 =?utf-8?B?WGY1RkMxcWtqV01wWkZjU3I1amd3cm1oZDlLNm9GdFhOZWJFaGRoSWx6SCtU?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ps74EcFTEt9XfIZ4xVLhDqmJD7MZv0x7mvFgqZRXCOPdBfl/ckEJUpbS0O31+pYrTLKCy/ozV1OqWlB3310aG7D1XFsmm4V9IwX7bVdTZqyCMgSSU37kDtKeQCty3TYUxuTk7KML6mLSkI9bDIHXE/OAnhNpvFJesHwWQKLvudbLQO9X1DezL+q1OzUCp/2iqM/CN3zm8AMRAoabT5/LGnKNTcbQQIX4YBi/eMYNDtXoiheJBUSyTRQR/qAOF+LsNTraFbq5hS5yudyeECJjOPN9Bc6mYVXKM1kIJ/zkCrxIVbvptK2Jgk1Vz1bCWRay2VeJSa9cl9WpSXeOtRIkmoUvE8fDl1pgD5VE3IZmTX2Q+OYeLGtITeSpk5X7npj1PFLMOIYND0FFUUja05iEw/ATMnsSEQU0tmeJIhgSBPVYgw1tjnfgrIFc3cLyR4JmRifziTsCO+yBvBk+qvZdiCI7WtD55OxNK0f3ri3P/VgDD9+rounnCwb4pF6v9SoGqpMiw7mDORZDw4gUOHHFnb2OvEa4Dv5drfKWh/V1bVCowfWmwI125fBzbCOpWSxJdNagcaQNlcMLjpseyYRdMG6CpHPOVlU0nh7ADf3P13UJmNd5Y/X575qEQR8iV3QZZXUt9FHAc2x/y++nu54hnS5bvhF3H52m/aiB1Yiwt12yZbASTv5VCYSZq8fIfIJipqdiNn+EtnKj9O0iXNVioO6jH8gJaeTC/Aotrm/kqxwYhEPnUVWrUssV4+ojJtOwkIPOgBZC4Pap1q6ySYrjP0bAv/5gbgEavOic5rDf1eq/AiL53OA/5VCWMnpsP5D1H+28YKKZFZohLkVod/OC62adgS5LD08rwo8YpKTH93A=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c25d5a0f-c694-43fc-c66a-08db15b7313a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 16:01:16.3127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7MShVypEkBgbQ5ArZynn85Td20Rv3wjp3CNwm2e8iFOZutpIY10Lh0Qjvl/8IuH2fpg/FQotsi9yEPfWwdZDtmtImKPJYheig4N1+Sw4NU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6598

On 07/10/2022 1:39 pm, Matias Ezequiel Vara Larsen wrote:

A couple of observations, all unrelated to the stats themselves.

Although overall, I'm not entirely certain that a tool like this is
going to be very helpful after initial development.  Something to
consider would be to alter libxenstat to use this new interface?

> diff --git a/tools/misc/Makefile b/tools/misc/Makefile
> index 2b683819d4..837e4b50da 100644
> --- a/tools/misc/Makefile
> +++ b/tools/misc/Makefile
> @@ -49,6 +49,7 @@ TARGETS_COPY += xenpvnetboot
>
> # Everything which needs to be built
> TARGETS_BUILD := $(filter-out $(TARGETS_COPY),$(TARGETS_ALL))
> +TARGETS_BUILD += xen-vcpus-stats

This patch is whitespace corrupted.  If at all possible, you need to see
about getting `git send-email` working to send patches with, as it deals
with most of the whitespace problems for you.

I'm afraid you can't simply copy the patch text into an email and send that.

>
> # ... including build-only targets
> TARGETS_BUILD-$(CONFIG_X86)    += xen-vmtrace
> @@ -135,4 +136,9 @@ xencov: xencov.o
> xen-ucode: xen-ucode.o
>     $(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
>
> +xen-vcpus-stats.o: CFLAGS += $(CFLAGS_libxenforeginmemory)
> +
> +xen-vcpus-stats: xen-vcpus-stats.o
> +    $(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl)
> $(LDLIBS_libxenforeignmemory) $(APPEND_LDFLAGS)
> +
> -include $(DEPS_INCLUDE)
> diff --git a/tools/misc/xen-vcpus-stats.c b/tools/misc/xen-vcpus-stats.c
> new file mode 100644
> index 0000000000..29d0efb124
> --- /dev/null
> +++ b/tools/misc/xen-vcpus-stats.c
> @@ -0,0 +1,87 @@
> +#include <err.h>
> +#include <errno.h>
> +#include <error.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/mman.h>
> +#include <signal.h>
> +
> +#include <xenctrl.h>
> +#include <xenforeignmemory.h>
> +#include <xen/vcpu.h>
> +
> +#define rmb()   asm volatile("lfence":::"memory")

This is rmb(), but rmb() isn't what you want.

You want smp_rmb(), which is

#define smp_rmb() asm volatile ("" ::: "memory")


I'm surprised we haven't got this in a common location, considering how
often it goes wrong.  (Doesn't help that there's plenty of buggy
examples to copy, even in xen.git)

> +
> +static sig_atomic_t interrupted;
> +static void close_handler(int signum)
> +{
> +    interrupted = 1;
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    xenforeignmemory_handle *fh;
> +    xenforeignmemory_resource_handle *res;
> +    size_t size;
> +    int rc, domid, period, vcpu;
> +    shared_vcpustatspage_t * info;

shared_vcpustatspage_t *info;

no space after the *.

But you also cannot have a single structure describing that.  I'll reply
to the cover letter discussing ABIs.

> +    struct sigaction act;
> +    uint32_t version;
> +    uint64_t value;
> +
> +    if (argc != 4 ) {

{ on a new line.

> +        fprintf(stderr, "Usage: %s <domid> <vcpu> <period>\n", argv[0]);
> +        return 1;
> +    }
> +
> +    domid = atoi(argv[1]);
> +    vcpu = atoi(argv[2]);
> +    period = atoi(argv[3]);
> +
> +    act.sa_handler = close_handler;
> +    act.sa_flags = 0;
> +    sigemptyset(&act.sa_mask);
> +    sigaction(SIGHUP,  &act, NULL);
> +    sigaction(SIGTERM, &act, NULL);
> +    sigaction(SIGINT,  &act, NULL);
> +    sigaction(SIGALRM, &act, NULL);
> +
> +    fh = xenforeignmemory_open(NULL, 0);
> +
> +    if ( !fh )
> +        err(1, "xenforeignmemory_open");
> +
> +    rc = xenforeignmemory_resource_size(
> +        fh, domid, XENMEM_resource_stats_table,
> +        0, &size);
> +
> +    if ( rc )
> +        err(1, "Fail: Get size");
> +
> +    res = xenforeignmemory_map_resource(
> +        fh, domid, XENMEM_resource_stats_table,
> +        0, XENMEM_resource_stats_frame_vcpustats, size >> XC_PAGE_SHIFT,
> +        (void **)&info, PROT_READ, 0);
> +
> +    if ( !res )
> +        err(1, "Fail: Map");
> +
> +    while ( !interrupted ) {

{ on newline again.

> +        sleep(period);
> +        do {
> +            version = info->vcpu_info[vcpu].version;
> +            rmb();
> +            value = info->vcpu_info[vcpu].runstate_running_time;
> +            rmb();
> +        } while ((info->vcpu_info[vcpu].version & 1) ||
> +                (version != info->vcpu_info[vcpu].version));

So I think this will function correctly.

But I do recall seeing a rather nice way of wrapping a sequence lock in
C99.  I'll see if I can find it.

> +        printf("running_vcpu_time[%d]: %ld\n", vcpu, value);
> +    }
> +
> +    rc = xenforeignmemory_unmap_resource(fh, res);
> +    if ( rc )
> +        err(1, "Fail: Unmap");

Given that you unmap(), you ought to close the fh handle too.

~Andrew

> +
> +    return 0;
> +}


