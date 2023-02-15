Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1AA6980DF
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 17:31:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496130.766713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSKgo-0005XX-5h; Wed, 15 Feb 2023 16:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496130.766713; Wed, 15 Feb 2023 16:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSKgo-0005UT-2M; Wed, 15 Feb 2023 16:31:26 +0000
Received: by outflank-mailman (input) for mailman id 496130;
 Wed, 15 Feb 2023 16:31:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCKc=6L=citrix.com=prvs=4036dcf8d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSKgn-0005UL-2n
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 16:31:25 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e78a9ce-ad4e-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 17:31:23 +0100 (CET)
Received: from mail-bn1nam02lp2043.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Feb 2023 11:31:19 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5718.namprd03.prod.outlook.com (2603:10b6:510:40::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 16:31:17 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 16:31:17 +0000
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
X-Inumbo-ID: 2e78a9ce-ad4e-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676478683;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RUzntasEA1IGP1I5xMu2oH6cT2IvxJ0KqgxR1n0lYRQ=;
  b=K1iBUFBNlCl37skH35S/JmzQPYKXPwabu2fQXolyhFC8u6VrCIDLfzvO
   blWoHaDHVG8tfCBmscS/aRShP2ZUEj9mNXQaSKrY6vst5Kiqd//LHEwG5
   jNcN7Ylbmxs2U6fa2NIUGxFiYD4uTeXqVw7BhjasJ9Oe6JA9VOIFDYv7r
   8=;
X-IronPort-RemoteIP: 104.47.51.43
X-IronPort-MID: 97178812
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:X+Fe/a59TLdtOzHozOowNgxRtPHGchMFZxGqfqrLsTDasY5as4F+v
 jRKXm+GOfaPYzShctEiOY6+9RtVsZ7dz99jHVFurXwwHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPaoS4QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5my
 qZBMB8gNTO/od2w2IChEPNCi88KFZy+VG8fkikIITDxK98DGcqGaYOToNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OlUoti9ABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCd1LS+3or6QCbFu73mMPOiI2ZFaHuPyEskKlAcxUc
 H4Kw397xUQ13AnxJjXnZDWxpmKEuRgNHcJdCeQg5CmCz6PV50CSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaMiEPIWgPTSQNVwcC7p/op4RbpgnUUt9pHaqxj9v0MTL92
 TaHqG45nbp7sCIQ/6Cy/FSCiTT1oJHMFlQx/l+PAjnj6R5lbom4YYDu8ULc8ftLMIeeSB+Go
 WQAnM+dqusJCPlhiRCwfQnEJ5nxj97tDdEWqQUH80UJn9h1x0OeQA==
IronPort-HdrOrdr: A9a23:ECAl7qtE1+z+xfgfzJByhi1P7skCpIMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhAo6HnBEDkex/hHPFOkO0s1NuZLWvbUQiTXeJfBOnZskTd8kTFn4Yzu8
 ddmsBFeaXN5DNB/KHHCWeDYrMdKe28gduVbKrlvgRQZDAvT5slwxZyCw6dHEEzbA5aBaAhHJ
 7ZwsZcvTKvdVkec8z+XxA+Lp3+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAuQ3k4aeIte2913bnph3uxqUTvOGk5spIBcSKhMRQAjLwijywbIAkYLGGtCBdmpDQ1L5/+u
 Osnz4Qe+BIr1/BdGC8phXgnyP61iw11nPkwViExVP+vM3QXlsBeoB8rLMcViGcx1srvdl63q
 4O9XmerYBrARTJmzm4z8TUVittilG/rRMZ4KUuZkRkIMYjgYJq3MUiFQJuYeE99RvBmfca+T
 xVfYnhDPU/SyLkU5mWhBgi/DWWZAVOIv63eDl+hiWr6UktoJlY9Tpo+CVNpAZxyHt6cegx29
 j5
X-IronPort-AV: E=Sophos;i="5.97,300,1669093200"; 
   d="scan'208";a="97178812"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9ZuoKoJN4h2kx50bqMhccGZ0+Bx71ugx3AoFfKskELxHnwa7H7kgAUXTnp+q/ERwCqaItbGGXDMWFxhpiwQZt7FIFEVmIWDbToYjXIZE5GxYaV8xuPbQbr3Afngxx4ThOp4F/QsP7dPkx9fxOnSl2QFVgquwZgKXoFIkEAWzXPSmbchRbOGv6XraVl/X1MK5Gq8nIS5n7g0fzZqmBvK6VWiITH2/QP08PLC7EWBD7RE/zu6VWA7ixxX8bxDBE6nJ0gxvTWMsfJKEcuA+CTuK0HUWHB/hmzspkfdaEBU+e60kX2zEGrrLbvjxBhHBr/uJWw0XeONXR3AQjI5Nahq5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POhkDcy4T0RVrI40NoLFwQ5a1pXR/V2ypSL+qpH5LK4=;
 b=JsaDqMUnRXrG3j00PIBi4H0Uj0MhbkbkqW/wwLLVzJR6GWHak3/c+K7td2j7o85tai6yewoPH4T9WeihZFnqWKM0ZpIoWMOF0qmeWiXBJpSqo0kh8jV+KlnYDcSH4pqYAFbfq9mGOaLK+R07cZmGc720lMbzPm/Pp7NdxTX7fb7JXpveHk9uy/XT0tzUfA2WE10dISn7uJ02j//XrmrLoL44bReB26s2iOsJlo2mMCV2t9NP/YxPu9Ol7XfrIblD354nDfewB5NbdaDpAs5XESajci2/vTxyjwZvgRGfdHnzxV0k4Mhx5Kzh/ppuWYhQM9KL25p3xcASBe5E/+vQgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POhkDcy4T0RVrI40NoLFwQ5a1pXR/V2ypSL+qpH5LK4=;
 b=WHl7UBFJQrB+k/bODtFerLWIt1IaxLIxMmVeHNIK0BeRCHIvYEbjmLib8cPG45Fv79a1D2zjApjB1iWZqYAds8mBSLFauQqRsD8gtqO94Ct6x55KqO1GZNY+C4xkoSrjep3tisO0kb14jur7dRYyiMEZWjkxZ9OFZQ8F7eUgLNI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6c455c45-18d3-584e-bc8a-a1d22a68fcd3@citrix.com>
Date: Wed, 15 Feb 2023 16:31:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH 1/4] automation: Remove clang-8 from Debian unstable
 container
Content-Language: en-GB
To: anthony.perard@gmail.com
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230215120208.35807-1-anthony.perard@citrix.com>
 <20230215120208.35807-2-anthony.perard@citrix.com>
 <6fa7fa56-d30a-e66e-b46f-5e7daffeb487@citrix.com> <Y+0ILtUb+yrVWKxf@l14>
In-Reply-To: <Y+0ILtUb+yrVWKxf@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0340.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB5718:EE_
X-MS-Office365-Filtering-Correlation-Id: 651448b8-603a-4a6c-1a87-08db0f720fb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TPeYvsi0ApY/aeDMaKY7S09Yi6qBMW87zojBmJf5NDGyIhwaaH3oU7sAZTRH8COcd7Qe/MgMYaRi8h9N18e0/Xld/4tSGjt3fXozZXCYqti00A8IyvC3O8ygk63e9OhP0F6slvXShw6f0ybx8bXcEAv7d6b5yiLPfDnc6OI81o3yXI4sserNRuTOGn6BFpTwWTuW7A3x/9jw5qPp1QokZEb45e3vfAjjuBqlFWKSkM2Gu7Z6cK74Q6s2wg6sJjsT5OQkHyPDrTeNei2AMvPTmgVA72o3iBACJlvUIg1X7AuxcLIU4K2MRCdVz9EO+/Jb7V15Qxp+AL3s96B8K/UCiT4BW1psO3DYaz5PqIjmjf5e2Yj21HVp0iXOVP/6iWZtuxPkTWiAuV+jdsQYvqCmY5cOrUtDdksUA37XBE8hOWc4j6ZyUEd+jONPi1NUJ7T2vCbhw+YXJ8KMa7QW3oqFjSfC9Tl+LD0qcw/Aux2dEQVWiYy3mojRVtlz0Vbt7sSLyPPDlPWOL2sV0RPnDN0LhH4X1BbTEvCYpWnIDfe+uS5YfDnI7yAgg3BznGsqEq1ek3NxkoFMFC97a5YWacP3HLDE7o+dgpfUTbrCZBA3MgTUbjCrlck55ayFyF6jZMgPc/uFulXFZ4jASNuQr+NuNmqa3XPJAr4qvDAN2hFv/tqukIZ8nDfFYzm0iZKH83obtp1YD3mimEQPwApB2joqEIjEG9bfBF4j0WXIbQQTVmA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199018)(2616005)(966005)(6486002)(53546011)(478600001)(6512007)(83380400001)(26005)(6666004)(6506007)(186003)(86362001)(36756003)(31696002)(82960400001)(38100700002)(8936002)(66476007)(5660300002)(316002)(54906003)(6916009)(4326008)(41300700001)(8676002)(66946007)(2906002)(66556008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUhEL0xVUGdmMGJEbGNtT2FTbXk4bGpwSmhRam11TGQ2NlZ1Y3FPdS9PbC9N?=
 =?utf-8?B?WERWWXdPRGVoMnFSLzJQUjNXQTZjOFpkS3dkMDZiWlgwZml4UDVlSWJpdnNj?=
 =?utf-8?B?RElEZFN0TmhrUTl3TktoYWtsc1VwRDJPVnA3RFRSRG9tQm9NNDNLWUpWS1hx?=
 =?utf-8?B?eWNSNDhtQTlVay96eGFFM1o2cUhNdHJSUmUxeHVXVWRUSFc2MjVWOG82S2Iz?=
 =?utf-8?B?N2U3OVBqa09QVExmUGdXcHUwczJYTXhYMUNFNjVaVmc3L1l3WWV2RWNMblVl?=
 =?utf-8?B?MlZRc2Y2OFpYUVcwQjRZZGZqNk1iYllWT0Y5MXJjTnNsNFZHU0RiS282Q0hH?=
 =?utf-8?B?eXREV2JRc1luYzlkNGt6LzhLZ2NHOTlQeE5YbE5LOXdkUzZ4ZlJOdnRZL3lY?=
 =?utf-8?B?VWlmTEIxRmxFbFh3L3g5NmlQTGYwRUROZGFkMUZsaGVtUFpQcS9kS1F2b0F3?=
 =?utf-8?B?ZWV1SmR3R2FoemZCOGpSbmhTWWxOTW9UZk5NNEI2RzFTTUJXN3pIWDdKeVQ4?=
 =?utf-8?B?M0J6azhUa0k2Sk9YVlZ5c3QyM3Q3c1dGWDltaWIzU0s1YUo2eXR3UjlGcExs?=
 =?utf-8?B?SCtsc3Q2ZG5BVGdFbEpUeEdSTWd1ZFJWa0paVXpuU2tOTUVPb0tIZG5xRVY4?=
 =?utf-8?B?K0hMV0Npd25LZXN6SVN5c0FMMFlJbzdhWU5kN0dIUThsKytXMG9xckZ2Mm5z?=
 =?utf-8?B?STRqTVdjVU1IMExzU2tFL3lSSEJpV1UvdEFVNTROK2NIQUpsWjlITW50RFdD?=
 =?utf-8?B?d1BEa2NVeXpBbitDR09pL3hMbmdSZms3VFJRSk9ueEdPaHpXd01tdVBPdGts?=
 =?utf-8?B?V1FWaVRGNCtWWXc0emtrZ3JwaGNGSCtxQnRsaXRjZkZWSlVYQ2I0Q1BKY2VX?=
 =?utf-8?B?ZTdQc1RzQys1Z2FpbVVxeUgwQjdybytRZk1nbHRKeFI5dlNTcXlCMmNsZEhK?=
 =?utf-8?B?VitqMXByL21WM0tPNXpZbmR3VnRpNm9GbUprR04zenhKdVhJeSt6blRnSjF0?=
 =?utf-8?B?akFBeG5CODdtRDhBVUk1TUY1WVBGNXEyajBWSDl1dTBZREg3cEJwZ0FwZXVx?=
 =?utf-8?B?Z0F1bVJPdTdRRkRYV2Q1ZVFyN0dCRU1BdncxUzFPUkdMSXBFU05Xc0tDUGc1?=
 =?utf-8?B?S1lhUFFKUEVxaGg3Zm9XeWNxRy9SVXpyVHlXeUFWY2RHOEFtbWNUbXNGRi9E?=
 =?utf-8?B?c3dCay91N0ZRSHorbGhwSFBWZ2x2K29MMHk5K2hpSEpacDBkM3pITFprcXF0?=
 =?utf-8?B?V3RzSnBObmFRT3R5N2NBdUFHOHdrZ29NZnJHRkEvOVZwVmE5ZjlMYVhVZHYy?=
 =?utf-8?B?YTJoaTFWSGFGQkpvSXF3dmRIVHgxcW15ZUFCdUxUZkZuQkIwVEdGdGtHR3ph?=
 =?utf-8?B?QThsc2UxZEUwVkpCdVl5cUFMSStDSnZVYkt6KzByZjc5dHF3cFhqdXc1K3Zv?=
 =?utf-8?B?dE5ITjJIVjZzVEU4dytnSTlxNE5oZWhkMVRheUxGVGc5NCthbENnMC9XbXc5?=
 =?utf-8?B?STJPdVR4NTIyNWpoQ29IcGUwNG5pK01ueElLSEwzUG1EZ1FpNkVJenlaVC9Z?=
 =?utf-8?B?aFMzVFpUdmZNK1dKM3haOExOTU40REQ0ZkJKOEtCeW1qOFNLcVpNQkhUQmV1?=
 =?utf-8?B?dFZQalduSy9ZTHBqRkJYRkRMRFFLU3A1TElsMS9vTEhYbmNxZHdTUlJ5aTZ1?=
 =?utf-8?B?NXJYSmxxQVErc3puY3NueHo0bHo4MFR2b1JRdWJmZkJyUk9xT3dITjRZc3VS?=
 =?utf-8?B?OFN0cnJnRjJmekIybDFkdGd2SmFxUDJ2Q2VJRlZyNlBWb2llMnVqZk1HNzQ4?=
 =?utf-8?B?MExlSjZkeWNVSnRLbjlrVStoVll3UjRWdXFURjZMZWgyMUZpSG5TTDErbmx3?=
 =?utf-8?B?VTRua0FxT3YxQmZwRUJjY3F2RVNoRUZXWUNqSm8rVzFuTGFSellla1JUMmtM?=
 =?utf-8?B?SUNzMmQybldyRUFSZ2hxSDUwdWNUUEhLOFJQNDdIU2IySXo2cW1yUWZPSUkx?=
 =?utf-8?B?NGhESSt5NXN4OVc1ZGZLTS9rNXIvcGxqMUJycXdnK0Z4ZFVkbGxyQUVEaUwz?=
 =?utf-8?B?UWxjQzNxbUt1UkhGUFd3em5lcGx5RjU0S3pFR0dNQ05XdW1vWTVmWm9VNnRI?=
 =?utf-8?B?OWNKazRlR3RydWdPdXVMRWE3dDlORHhSWUdROExNSjhKQXo1MnhyU1FRaXN3?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XAWqxforIJOwpO6PdGq28IhmOrtGsFImmSWKL+mGUG9rQicbAtgwBmdVmj7caWNR97JqcW38f9PdAe7OL0axmyL67gciAcCE2rhDJgm8O8IUytEdSPJ6Woj5JlPd8cV+kXQEfm6c8MxiRbGDkrUiMxO3YHd0ywOJtXj/njoOtaFbMKy65JSlSrVVOnNac2v9CWRAl+BUcfRTjDfw4LOvk8BNimpb+z+AP5cLAiZtOgFSZvrgYveXTyctQ3SpEd6fK4HyyKlK49rmgpAgkyYeF3I+9OBa8DOOPJcGPs+8Hg8RU5YIfrIdDsJEHD4p0qpsVTlw4I+Axrma05oUMrD3OgqfyjVU1wBTRGdDlitqOsFGCYT2El9Ssdg76KdP69E9xz5ACzIS1pUQ96EIm7YjLsJ1zqTYcnzz63cbNDDA+CoSN2FcstEVgmGW61u/xa9XSzpIojmSRR3RCP7tkmiCkghaZN0+irW/eYZVqbbI6cshPECBhbLhmSW5xhEZ2ZQvwxG+UFTdqVQcbzu78HYLA1FSqz1eNa4bChnsSO9q5Le95xOnl3nLXcGETSY5u99MqDE9IJZ5LS7EzG3DGq9T8CHkThxaqTPJTHL7Cuqlth10Odw3m9OvTADv5Ie47NcOfEj+/jjgmvf6g7sw1cEvJcCM3JevNLkCx7AVr5Tv5w7+LXlamYOoJg0xZgnNEGmOa7TSm7DwfttBgU8mg0TlB7sCkp7flNkSwfNclfEjcT77Nvl27iIC6/try2EHVHsTWKnTlAyqKvvLV+HmJCbttOpCr/WFdkaUwjFy4OVvHCQe4OxZFKn8ig5z852T/kMnmATGGt1svnHXPOtPasn2uJizZX+2JeuNYBqMKioUADk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 651448b8-603a-4a6c-1a87-08db0f720fb9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 16:31:17.3003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKl66go3D1TJo42jGKDrI2eFuVxhhkrnY4tKIEVMwJHGfl6tVUsz+Vu5JDe/iRsgIgfiZNmEIGWOiJHjaAwHP9s3xnaECOjB+Hr+PWZx91M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5718

On 15/02/2023 4:28 pm, Anthony PERARD wrote:
> On Wed, Feb 15, 2023 at 12:26:40PM +0000, Andrew Cooper wrote:
>> On 15/02/2023 12:02 pm, Anthony PERARD wrote:
>>> First, apt complain that it isn't the right way to add keys anymore,
>>> but hopefully that's just a warning.
>>>
>>> Second, we can't install clang-8:
>>> The following packages have unmet dependencies:
>>>  clang-8 : Depends: libstdc++-8-dev but it is not installable
>>>            Depends: libgcc-8-dev but it is not installable
>>>            Depends: libobjc-8-dev but it is not installable
>>>            Recommends: llvm-8-dev but it is not going to be installed
>>>            Recommends: libomp-8-dev but it is not going to be installed
>>>  libllvm8 : Depends: libffi7 (>= 3.3~20180313) but it is not installable
>>> E: Unable to correct problems, you have held broken packages.
>>>
>>> clang on Debian unstable is now version 14.0.6.
>>>
>>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>> Yeah that's because clang 8 is way obsolete, and http://apt.llvm.org
>> only supports Clang 15 and later now.
>>
>> In hindsight, it was a mistake to take unstable-llvm-8.list in the first
>> place.
>>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> I just realize that this change is going to break gitlab testing in the
> staging-4* branches. So I guess this mean that we will have to backport
> this patch, or at least the gitlab-ci part.

I don't think it will.  The currently cached container is still "good"
for the older branches to use, but we ought to backport the change
nevertheless.

Given that the container is un(re)buildable anyway, we're not losing
anything, I don't think.

~Andrew

