Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A256F197E
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 15:30:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527332.819868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psOAq-0005lI-0b; Fri, 28 Apr 2023 13:30:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527332.819868; Fri, 28 Apr 2023 13:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psOAp-0005gX-SN; Fri, 28 Apr 2023 13:30:07 +0000
Received: by outflank-mailman (input) for mailman id 527332;
 Fri, 28 Apr 2023 13:30:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CzbF=AT=citrix.com=prvs=4752babc1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1psOAo-0005ba-1Q
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 13:30:06 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7dde610-e5c8-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 15:30:04 +0200 (CEST)
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2023 09:29:56 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by LV8PR03MB7445.namprd03.prod.outlook.com (2603:10b6:408:191::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.23; Fri, 28 Apr
 2023 13:29:53 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.024; Fri, 28 Apr 2023
 13:29:52 +0000
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
X-Inumbo-ID: c7dde610-e5c8-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682688604;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IqKP5l5H501Wy+dDXHrm5OIQs9mLS/TkDv0zSinRTlE=;
  b=BAnBPEFVanBAwQCvaadsDNLpxSgEkVKsSDHQK92E8bWd2kDOEu4/SP2C
   eNQ7pLQsmM542Md8pwB9Eu6c/hZjmrWITk729V0fLL+hu2nUgxBLPkx0V
   pSDy/z1EfpBPtLlLt7EKFv7RE2HyLbhKWmXY1cpv6Br874U+++dODaYUi
   o=;
X-IronPort-RemoteIP: 104.47.66.48
X-IronPort-MID: 109666873
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:oRtH96AMz/GuTBVW/8ziw5YqxClBgxIJ4kV8jS/XYbTApDwngTEAz
 2ocDG2Pa/aIZWagfNF+bYy39ENSucXXzt9kQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G9C7gRiDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw6MhrWG5e9
 KIkGSEdbzm4lqW7y6OUc7w57igjBJGD0II3nFhFlGucKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTL++xrswA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE37eew32lCN1JfFG+3tl6uV6dxzM8MjMTd3vgpPOVhXSVHOsKf
 iT4/QJr98De7neDTNbnWAajiGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLT5lvaCRSHmd3qyJtj70Mi8QRUcAeCsFQA0t89Tl5oYpgXrnVc1/GaS4itn0HzDYw
 D2QqiU6wbIJgqYjyKGT7V3BxTW2qfD0ohUd4wzWWieg8Vl/bYv8PYiwswCHvbBHMZqTSUSHs
 D4cgc+C4esSDJaL0iuQXOEKG7Lv7PGAWNHBvWNS81Aa32zF0xaekUp4uVmS+G8B3h44RALU
IronPort-HdrOrdr: A9a23:seGJS6uLG+wvtt7sIv/3P0YX7skDzdV00zEX/kB9WHVpmwKj9v
 xG+85rsyMc6QxhP03I/OrrBEDuex7hHPJOjbX5eI3SPzUPVgOTXf1fBMjZskDd8xSXzJ8j6U
 4YSdkBNDSTNzhHZLfBkW2F+o0bsaC6GcmT7I+0854ud3AJV0gH1WhE422gYyhLrWd9a6bRPa
 Dsl/Zvln6PeWk3cs/+PXUMRe7Fzue77q7OUFopBwMH9ALLtj+j6Kf7Hx+Ety1uKA9n8PMN8X
 Xljwe83amos+i6xhjAk0ff4o9bgsGJ8KoyOOW8zuYUNxTxgUKTaINtV6bqhkFMnN2S
X-Talos-CUID: 9a23:lhoIsWF7MNoIIjIEqmJ12lJNFdAkLEHs3WfRCnSpTmtiWZKsHAo=
X-Talos-MUID: 9a23:0DezEguGR8uA9U9S/s2noyFbN8lpvIuUJkUvsc4DseWLDwc3AmLI
X-IronPort-AV: E=Sophos;i="5.99,234,1677560400"; 
   d="scan'208";a="109666873"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdoVLSm8uJY75CIaBP4+TM8U/NjjLyZdaB4BJ8yClyLbLb68dapNz9MrwnyJpiZaFb2YUmz/Aq8Pualqob2LepVQT8JD+csceb9FNjCwPGDsbV+qcf47FpQog5C6bio0gUmOCkD+qQYhKkEUuHXcRon4wb7X2rLzqMzzYq67AjMx7An9ePTq4h/p5SOAjzJNGltDtExysoflwFjVgWeozFKMBW16duSgEoRPCbRnycLR2+TSRHiRyaxcOJmh6oCFFjH96Dmraf/VFa5Woryx7iv6g6z2ZlLbXQ88W/EkDqVZSXzlmtSXlca0Xna+eWXFTmtT/hGgn2/k2/HDzmEetA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqKP5l5H501Wy+dDXHrm5OIQs9mLS/TkDv0zSinRTlE=;
 b=G9jmQD//FazmB5q/ABVxozHkK/cA9y5ePIhd35njcV+OiRG+Wfm6zEY4F6H51IN8UmZsyOiH5NZQz3PykkwU2eToVxyMogBAAg1UwC46twIpjJTZDrnJ3/yb8zI70Mulf+8A3p+oglpDThuuUNA/rVDrWPMuDbHqdhnxxWH7u6fNiy3Bmi0I5Jw/gFVzvSeQC7JSYVIdHLhLA/ysUriUdD/MRxMKp9D+HYSbsSsigqYeVRdrrzotklS7MmTnBgMv8bFWBOkONsJOxiddxF/Y8X0WU7ua0p2dpKfHn2db0HH1HKZhZ0SMzTKekOL8xqxroU/hDGNxQT4DPf4S+PpNAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqKP5l5H501Wy+dDXHrm5OIQs9mLS/TkDv0zSinRTlE=;
 b=lDvf9KOXrkFxUAnNfDzTGxYHnm8qNZLQUkEMaZJdLUc/x+yJ9VrrJEqtGFFU6A1NMFI7q8A/DaoG66Ir92ID5mwZn1yvGPS/ngGxmCqlb+UubGQKSpdvOT+kHfeUhFY4FdwWxd2OTX2wEQ1oyqbF+YHIq6QPxIiMWDsOUIFa1sw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e5d00d25-b395-39d0-6fc7-c596c2249477@citrix.com>
Date: Fri, 28 Apr 2023 14:29:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] MAINTAINERS: add more xenstore files
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230428132756.8763-1-jgross@suse.com>
In-Reply-To: <20230428132756.8763-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0581.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|LV8PR03MB7445:EE_
X-MS-Office365-Filtering-Correlation-Id: f8e01f13-3102-4ead-656b-08db47eca54e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KAL+BI7t/vjLo6jXNgERTM3SGaV5H9kN9UgiOUfvihTvzKZdvxVdXKEGxutFunaMBxUYV9r6n8qahp6UhQHGb7NJUKVkIgrv11C0DDvceJRwGWG5TCuMv6tRyDOyq4uu0dwm1Y2jv3/5NZ9HpGjq2lQER8BBN5D4XBlfHS/TX/NjGJUrZtpE3htzc+rU07X2vYzVS4soiGGt1fvhdcyFNm+OaEwlAkxPOEUOqbFAP8g3u6DrN8UJrBfQCSd4fuYmakI+TUn97UYsNT3hIIxy6hqDTX0Vg888OMvqn4NppOkOXYIETANyAqQ5x2wnFA3Zem2eaJRWNIRv5Hpq3cp3+3q/kYormfxxhAeToqCFlto43CVrNjsgzF2z9VrP63cjLtszx7JQ+4qMJfqjpfqHhgqiteO55JwFNa3yj2Q2ei4m2K7Sd/hmsWAkKYmyrkG1NTl6mQsNCMB/yNCoqn8eceSusqTAUXjADSyzRxNgu4AzzwBgtjRMBsEFQa0TSjI0sxbBSISOXLuZ6SbAaan3kSdpDcy0QFV4aw7AjtKcEe++w1uBbykDrM172AdxPOPhP6WHz56bRDbnRo/RNWelmtlAousUhFhfD5rWxt4tlpbYLygNanu0zs0EAJ3RDbiM4QVWaikczJUlDpiLv6yWdw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199021)(86362001)(186003)(31686004)(66476007)(66946007)(4326008)(41300700001)(82960400001)(6506007)(6512007)(53546011)(66556008)(26005)(316002)(31696002)(6666004)(83380400001)(6486002)(2616005)(54906003)(478600001)(36756003)(5660300002)(38100700002)(4744005)(2906002)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEhtS3F0enJVVEpuMVp0cHZseHkrdENUWUgrbXRFYzFxVW04SmJiSDdKR1BJ?=
 =?utf-8?B?OG1pSXZLL1Fyc1dGYkIzU1B0UmY3SjE5WENTaEVCVkxmcHVaM0JObnppdXRX?=
 =?utf-8?B?V3dyN1NvYVFCY0Rpd2haWVl1bXdrWE9uQXYyR3dzNW82bDVWaE53bCtONFpl?=
 =?utf-8?B?eVhoeVZ5c1lmTG1lMkxKSDBldUREZUNJbG9Vdk5XRGI1K0tnVXJlUzRqY3JG?=
 =?utf-8?B?Ly9NWTdsQWJGazdTQlpQUUErZEl3YktnMG8rc2pYSHdsZkZGZVQ1MTR5MkJ5?=
 =?utf-8?B?SG5adDBnR1ZoK0JtWDl3QnlsVC9qaDExUDJGQ21rcGwwMDRUSDJCbnBLb0tV?=
 =?utf-8?B?cW9sOXlOUlNoR0toOFc1YTZ3c3FZNWlaQjlQUCs2aW1hVFB0YkFZZmFIRkJJ?=
 =?utf-8?B?WE1TWk5Odm91b1QyajFUaEdiVzhlUlh4ZGpNVFpNSHg1MTQvcVliU2ErMEpr?=
 =?utf-8?B?Lzc1azM5aWlBVzFGMGJ5YjZOZDZMYXlXOXYzL3FRSFdBVHIxQlFGTWh0cWVj?=
 =?utf-8?B?VjQ0aDhFdi93OG5YbWVHZncyS1BxYTQrTEhWQlRzRlpJYmoxQWdjTkJGaXl1?=
 =?utf-8?B?YVlDekRueFF5R2tZNWtZbnM5NGt3NkgrYTY2MjU3RjBwY1RiYUs5M3lDclRT?=
 =?utf-8?B?SloxcGVYTzVZYmU4a0d3NHNWZDdzWk9qRmczQXpNVEs2MDA5cTg5UmJCTE5j?=
 =?utf-8?B?aERYaldXSGJhRnBBdEc4eHNma1hIdGpPU1VPTldXeVYrUWJtU1BFT2ViZHBn?=
 =?utf-8?B?bTFVaTgrOFR4N1M2Q0tPUzNaR1RGbzVwODZ2YnpLNWh4blNYV1ZHZU1MY1Rv?=
 =?utf-8?B?Rng4c1FDOFRxa3BaVzZkSnVOeEwzdEgwS09RZEwyVHE1d2tCcGxPdTdBM1FO?=
 =?utf-8?B?QlB5MlYzTnpKTE4wWlZLdTRCVCt1dVNGejVVUGEwOFhwSjA0VlVJOVIvQVpk?=
 =?utf-8?B?VXZ1ZGMxZ29RK0dsTng1VWdUSVdkU0RScjcxanYzMzIrTmRtTlFQa2F0ZWFT?=
 =?utf-8?B?RlRVWFlCZ3hKR3NaN0pIcThJbGpaTHZpK2RWaklRQ2dTbXJwUVdKYWF2Mjcz?=
 =?utf-8?B?MC95c0NkalQ1eDR4MjZta1J3WWtuVXpJdy9GQmpud084bjlKVGxlWWVZTGRz?=
 =?utf-8?B?QmpGcmVNQWFDblIzWlAzVVVVWlpWZnhDR3kvMHB6MUF6MUtpbGZpNUlJSUFm?=
 =?utf-8?B?Zit4cGZJeDFnMGpnSkdEdXhONTM3LzV0VFJTYUROTTd2SVRJZnV1UG83Ty9l?=
 =?utf-8?B?RlFZQkRDVUlUK2liVkRkTWwyQUgwOE1veWJ4MmVPRWJmSW9nakFUbmxRUkM2?=
 =?utf-8?B?YUVpalRLRFpRNUhDVSs1NGErV2RMbDJnZzdadzR4WEl4Z1dieFFwQmlVS1Fo?=
 =?utf-8?B?dGJRdHhuUUwxSnJNZEpUWkRmV210MXRCdzgrd1ZUZElmb2hRSkM0SHRIakZP?=
 =?utf-8?B?akYxSXZYak56b3FpZG1hN0xmekQ0VzhmVmwxeW5nSmNmQkRsNE16ZWdUbmxU?=
 =?utf-8?B?cXNjVkZORDQvT0pjMi9leFFtdkFuRUhQT2ZCZ3VsMHB6V1I4b08xNU5NRFJu?=
 =?utf-8?B?djZPSXMyTU40MThBVkVEQ2w2NTJ3NjhTWU1wdTNHQ21TZFhxZXZLMjFsK0hB?=
 =?utf-8?B?ak50ZHJ3YlozVTlHOU1VdEJlL0xZNjdoNEJtdEIyQnVCK0ZIbSthNDNjY3dI?=
 =?utf-8?B?SjBMc1loUFFHeFRSV3hDdk40dVJQUkRhalA3SDUzRHBNK3pHdFV6WW5YZ0hZ?=
 =?utf-8?B?UENCemJ4SmNMWHdMZmYvT1YwbmtGM0Fab1AyMXpOSFhJM3FLREhuNmdRTFV5?=
 =?utf-8?B?Wko5L3ZkQzNCUWJXSHZQc1E2TVBaeU9Md2xMNmkraUphNzhtV0s1OXYrSDk4?=
 =?utf-8?B?OWVzQk53MzFxeHN5US9HYjdkYmF5dlFJT0FPK0o0MEFVUCtxSWJSSDE1Nkxn?=
 =?utf-8?B?TENMam00V2lDZzUwYktjVEk4SnM0K0d4alo3K1ZWM0RJSFJqZGh0cnprUS9J?=
 =?utf-8?B?YjRPelAvMzF1YXpoQmJ5dmg1RXVwcUhTTWYrUmo4cWdtNjNVUVAvWlpWeGFJ?=
 =?utf-8?B?TVovNkRZOEFxSUYxRmhVRXJXamxhT2swVWxPaHQ3ZStuVmxBQTBLb2Q2Ny83?=
 =?utf-8?B?WDRVcEdWRFBrRlpRa2tuTzk4aU91cUVsRkNyUkdnZURCaWZ3RDdoVzAyN0Ju?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xddr4u1Om1petEwF0Umm+fj7m1aWTp+4Wk/v/3iLEeUXKsybhJqc/vHKlNuQe9+IyMJQzgxkOoAxFlqCpTw4zz/9NqvfGTLhg6FkXFipxgroMZblny8//SEjRv+G227FOkiiGc+03XJaBzGcWGacCrS4Wp8Ax4T6+yhuzfdf77OEVALGDPfyfdPwTvDpqyhJH8QYOhuJPW/UFlOp0DmwUFgm/7JyPpH911PA8XIlHa9ZlNgv8Jan8EtiGnNmpbksIrMgEj2B3tjNhtAzNVmZGAg50LmrpuzCgBZB7kkaXSR16h70tSIA6dOq55TR7VIqgAamf+UOmHcXkyjM/ErypxN51NKKMMTDt8ZpQbX+ik+H0i9lPWnE/OPSGBXvAKzY0VNL6TMSgUrGQitnE5Tj6EC3K7UqRKZI9wFWHQnWQ9rXvdmVmvBEMsc9s8Nf2gKf4DLgazqnumDq78mEL5on+Bdtrl50hmVbUkrUmKZMfpOpw7JqoPhxIFxxusdREIo6eISzzjDPOJOUdn0eWFL5aWiLCkFWrHTPwRzHyVxPP3fhpRlPaecUpgv9FWU7YFBDP3R7YKPboXcJhz6DaRtVHzUNZhVCCdAoPm7PIpOr8E09losjGOL5QsskOwcHOwzdJPd9PrVvzQQpi9k5SGfPd3ISjX1Gq/bpOkeN7vv+ofl30lJbEacqnWKcvtqCmwOLeLwk0vkkgmm7HO6VYlvyJxjEA4LFM26rsOK6fmzL/p4PLt1l41Qsa536TT4g+Rs2xwR1OW0yj/bL9tpcCF5L5n7dVE8gb4MSgXKlJaR4wrpAtIZ/UrJdsAHkOOzzxEvXffLdvUcNHuQZfBwUBhXO59loG1EpjqQ3HuUFkBlWN5o=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e01f13-3102-4ead-656b-08db47eca54e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 13:29:51.7580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P620so7b3ty8PH8cN+CtlgroP+ms81S+QA8owbYQxg/917hXGTnXTcDWObqqz8ON1wnevFRlIQiVi/9I6fAxzEwaDFzV3JbphnLmfhLGhtE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7445

On 28/04/2023 2:27 pm, Juergen Gross wrote:
> Xenstore consists of more files than just the tools/xenstore directory.
>
> Add them to the XENSTORE block.
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

