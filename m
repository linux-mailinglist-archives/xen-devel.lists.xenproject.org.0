Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E10568BE9E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 14:46:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490460.759159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP1oV-0002ai-F3; Mon, 06 Feb 2023 13:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490460.759159; Mon, 06 Feb 2023 13:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP1oV-0002YY-CK; Mon, 06 Feb 2023 13:45:43 +0000
Received: by outflank-mailman (input) for mailman id 490460;
 Mon, 06 Feb 2023 13:45:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N+3J=6C=citrix.com=prvs=394ad1b64=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pP1oU-0002YS-Dn
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 13:45:42 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a45534d-a624-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 14:45:40 +0100 (CET)
Received: from mail-dm6nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 08:45:33 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5335.namprd03.prod.outlook.com (2603:10b6:610:91::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 13:45:31 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 13:45:31 +0000
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
X-Inumbo-ID: 8a45534d-a624-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675691140;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZAHp/lI4t8TkQiHunAeTFynX07AwyNhhAq0BWBQF6kU=;
  b=B94jycVGWJld/PCGcD6sxd0IqTB6Xdj9PxgIpnKoMMeRp9K2sXW/kasQ
   B72R+NeraVTszF/QiCmIvGF/bT/QNgRsWZ80ZxEy9zT74cPztG/FL7rT7
   +juzpBMNs6G6jRjoHG2afUzTgFGeFWHN4Traq3254w40FeTr3kr1B4+o6
   M=;
X-IronPort-RemoteIP: 104.47.58.102
X-IronPort-MID: 94688837
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:IVmMr6spvvqZRj0obCZa7L6lAefnVGtfMUV32f8akzHdYApBsoF/q
 tZmKWyOafqLY2WkLooiboiyo0IF65SHxoNkGgdpriwwFC0b+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj51v0gnRkPaoQ5AWGySFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwFjEONw7Evc6M8pWAcvFVnuABfOTaI9ZK0p1g5Wmx4fcOZ7nmGv2PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60aIC9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOzkqK460AbMroAVIARNRVLmh92VsB+7BY59F
 lEE3S0F9ZFnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8sjeaKSUTa2gYakcsTwQf5ML4iJoulR+JRdFmeJNZlfXwEDD0h
 jyP8i43guxLidZRjv3hu1fanziru57FCBYv4RnaVX6k6QU/Y5O5Y4uv6h7Q6vMowJulc2Rtd
 UMsw6C2hN3ix7nX/MBRaI3hxI2U2ss=
IronPort-HdrOrdr: A9a23:MppvW6C0xssw6X/lHela55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZImPHrP4gr5N0tOpTntAse9qDbnhPxICOoqTNCftWvdyQiVxehZhOOP/9SjIVyaygc078
 xdmsNFebnN5DZB7PoT4GODYqkdKNvsytHXuQ8JpU0dPD2DaMtbnndE4h7wKDwOeOHfb6BJaa
 Z14KB81kKdUEVSVOuXLF8fUdPOotXa/aiWHSLvV3YcmXKzZSrD0s+BLySl
X-IronPort-AV: E=Sophos;i="5.97,276,1669093200"; 
   d="scan'208";a="94688837"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXJdhhKT3uqjC3ZFkzA/uBz3ovm72btmaU3TN65zds7Qznwi0yGcAwjnQadqhaj+16N3qUp8CzsNFMhQsXgNblhlIpTCerHFsbzx774VOvBO1rB9hcncbanKzYYISHs8dTKA54duLjTR0tLL2HAkCR3wu3+JKjijFQf8fop9jUYGeqrtUD/MGb7fCKjSWFWHE19VGb5Mld8AtMdoUl4VLJccpDhEAInPr/VRBwC7EAwiRA/pYCF/dVibp5/jPgwxJnpngzZ4OFhQ90Al3c1nFMy4792ynlEcJtHKxw+P42qjIvfy7CuNccMCISrvUToaDwZOE/5uR38zvIGO2mYqCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAHp/lI4t8TkQiHunAeTFynX07AwyNhhAq0BWBQF6kU=;
 b=e1BniGKbIZyl/z910PUZXmpu46nuQQlf/leuxVGDYM+CcrUljA4hT2+WNs6zwG0Kjsgjyu72poypmeT4IM3uwAxoZtEyFPnRd66OxaN5EMKUY1fLEC7SiV1JUqPfMUDS0RQBai8bTo6RSwVDnOCDCr/08mE1ZrLyt43QKO5VTdMtkXZ0LImxVwktZORvjcA7RtWL3MfC0mectx1/L35rlarLL1sUXQEDSUGIsmOsitDj6jyno08giUwwDxxwe7FQCS8SkJtZIoAlkJKzUiF6WZPtWi26A9jkGbkpqVxv+YWGsLYMzJltf9bctLjLFKZ1P6qbo3SFhE7p3UKKtP+TOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAHp/lI4t8TkQiHunAeTFynX07AwyNhhAq0BWBQF6kU=;
 b=Rhhe+iTekP4vHnHZ+3a1cN5nuVxLf0xgWWcYMR2I/m3aNXjF+czFqHtpMhBBbBi7xN3achDkpuWm2lLIqBW0PhuQ1AqMaPvZeBgSMrrNWE1HQ5tJyTaAgzzTCWBzlFtHYfhxXzDcnwh5HZZUyeQsAINbOndtAosO1uOTHff0Okc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8f19c3eb-bb1e-b3b8-926e-caa6b2f2eee5@citrix.com>
Date: Mon, 6 Feb 2023 13:45:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] libxl/x86: use public interface TSC mode definitions
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <0d80ade5-dcf2-b0b3-ba4c-010962a6febc@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <0d80ade5-dcf2-b0b3-ba4c-010962a6febc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0083.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH2PR03MB5335:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aba4131-97bd-481e-bf57-08db084869d3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xM4R3Tmopsc3tDAdMWHOD+JvCKziDHEAAzluKcgDmkZ/MHKmmLazlZWgsGr36NvFen3SFu+YB/F7nLWlQX7wIEbYgMhsMIWYoU/1g3IJM2+HO95txhJ0K0FDongXxgS+wRhlSEqnG70XpWmb/zrsZT1Y67PgNp6+ggdKXvoJtJSpC9FI+A2NDT1IyDw+lzxzIRqMjVpR6fMhXoWEXIF4Z9UEnWp0apg1xEGRruXBXMhG1VYmjpn8dCDGloyPzFHDuQ39Inz+N8Jv6A2lCvCFyLg6RhS9Tpd7GNtsMq+KDKWfWGOfHZQxk+e1+beYTkUkMbIlTCfz9hcDZEFdLF4tNG0rP8GIrnViHUvsBk70orMXefQL9royfDKwHLe3AWeasJfN+ZgGh1dcxPfHuavmwf4CXf1sPab3ELMSlVYk9MV9NL9kTcRxf9MX8e0jcNtPoRiR62LC07zjVoHaoIO2YhDTUS9eM8Y8wJlfTRjX0dl0euYYq+57Kt/peJE1ur0DAG+3QyOJ0J0iOj3S075diWxDgDOt/yaG3Aq/fh0lVbCRus/zpUGNzUAzVz/Go33GtPU6uujUcTc3oHACAAtnUQo0I3p6pXPQyDWTEmSKCBCdy/SC75kEfLwa+n8QknabZFRLLXBtT4296LPbunjc4Ij66ak1N5UU4J0Wsp9RZjh1GtWSkHKpdu3KiODjuluq16NOFduzW6nLvIB/jELD8BU4vMdvboUzJZSWD17XU1Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(451199018)(478600001)(110136005)(316002)(54906003)(6506007)(4744005)(53546011)(6666004)(2616005)(6512007)(26005)(186003)(31686004)(31696002)(36756003)(6486002)(5660300002)(86362001)(82960400001)(38100700002)(66946007)(4326008)(8676002)(2906002)(8936002)(66556008)(41300700001)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1MrL1ZwcE5sdFFRdlppRFNEU0ZHVFFPUmZQSzFTRUE0Z0JpQml3Sk05elFv?=
 =?utf-8?B?VEtzWXpPR3hRd0Iwc21TcGZtelVwMjhBR1ltZmxYbjQ5cTRmQTZPcmt4aHdU?=
 =?utf-8?B?VjIwckJBMHhKcUZ2TmRSUGU1MlhXdlVXM2o2UE1XY3ZPaEd4WlhkRmdzL0ww?=
 =?utf-8?B?clBQeGc1SThIVGRlSlMvL1hIb2srY3RGdElvSUpIK3VTemJXNThJRFljNVFq?=
 =?utf-8?B?K1RqOTdpUGRLdlhuNENJVVJlbFA1TjUyM29ITTR4Rm1zend2VEJZNWpYMTcz?=
 =?utf-8?B?L25sRmh0WGxseXdmU2VXcndKZ3FYbExGcG9YUnZ4MzFMLzl4R2xnUVo3eWo5?=
 =?utf-8?B?WVk4ckhFdTBicDVBMWI0eTlVck9GdWZZY2xkTk5EeVcxRVlBaHdVelh4TXVS?=
 =?utf-8?B?TXNtSmVRREhzc3crejBqYTRWTlJCdlRJNFpQUlY2amR3eDk4YW9mNDRpaFps?=
 =?utf-8?B?MU1wc1pJYTdKbitqTUZUekhkQUhndGxWQTI0SG5yU3dMdi9abk02QjdXRno3?=
 =?utf-8?B?WWRNU25QZ3FsMUZOZ3pobHlBUXMzNjdLRnh1YVdNZmUxYkZkNkJkTG84a0Fr?=
 =?utf-8?B?SVUvSEpOdzluUHNCZnpodTdiWk1JcXhyQ24zKy9WRjRXOWtVSFBCN0tNVWtU?=
 =?utf-8?B?cE1NTW03Qmx1QlRBL1RGclhua2FYVkMxRlQ0aVB5QjF6LzhBZW9SRjFMeUJQ?=
 =?utf-8?B?djVmK2F6OEg0ZWMwZGVGb2NhaktoOE9WMjVlb01kT3JaUjB2Znd0RFN0SitD?=
 =?utf-8?B?NmtIWHVmWTM5Zll6ZFJHQktyR0lHS0srZFgwSlJtT1pjSXVzWk9Nb3NtV3cy?=
 =?utf-8?B?cWJUNFZkY2ljT2FWOXU1NHBUMk1hVnZkQ3owM09KenY3TzNOT0xCbXdLT0Ri?=
 =?utf-8?B?WUtoQVFLV3RlTjc3R2xsOE5BV0h6dEpGK0FTMkcySU1yZXZRME02QUpaSmdI?=
 =?utf-8?B?Smc2anhTOEVlbTdYVWlINjN0RHRyMzNtU1BYbnFVQjVRSlp5Y21lMCtLQjli?=
 =?utf-8?B?Q2M4RjFmbU5paXY2a3luNmhhMVVxbWUyMXI3SGkyNko4TnB5T3hlWjBhQjh0?=
 =?utf-8?B?OHRhSWZqZzJWZzBnd3kwSEdsNDZYZ01tSk1GdDlEcjVMaUZjeUJXVyt0M2ww?=
 =?utf-8?B?d3MvWmNsMG4xOCtXa0R5UlBkM3dlM1NqUEkyVVpKNm9jbUN6NnlBTWloRm5v?=
 =?utf-8?B?dzBlQVgxeDd0M2h4czE0QkdGWUQ5N29uMk1EbWl4NzFGWWQ4bDF1bFFEU1Ny?=
 =?utf-8?B?bEV3MnIxTHQ0MlVzeVo5dWNFTDNjK3NaMlEwNXRMT0VlWmxEQzRWOVlPWGJM?=
 =?utf-8?B?WXdsQ1FxdWlQTHA1TUxGd0NaMTR0SjNxZ2EvSDFyWnB2OElKN3ZIYU5aRHpq?=
 =?utf-8?B?bGoxaS9WQUhNdCtaVjlYMkJnRzVWekhSZVRjRUJOdzFLS0d6cU5heWVEeW94?=
 =?utf-8?B?UzdTekxuN2RUYVhSZjdRd3pncUxIbndWL3dmWTRTK0xHeG9sYTFYMTlkMFM2?=
 =?utf-8?B?NkhwelcrU1BEbVlKVmJ4QTdXWVoxTVR1UWovL0Mwb1UzMjFjZ1dOUnFhSDBG?=
 =?utf-8?B?R0hsQzc2UW10empnSHoyVTRwKy9tNGR6cVNWbUdnRkwvOWUyVWRhUi9ESzQr?=
 =?utf-8?B?S0FLN1ZTWnNqZTgvZFh6V1Z4Y25FcVpEMElpMDBpMy85YWxxbm1XRFBDWE5E?=
 =?utf-8?B?c0xIMkRZa3RQZkVRd0ROVm92eDdBZzhtNEpWdDlodzJIelRVem82c3Z1SXkv?=
 =?utf-8?B?Q3k1SENYeVJFamVCaFZabGhWWUFML1FZN1dYZm53L201SURsWlF4Yk8zUkVh?=
 =?utf-8?B?S05jZk5INi9kNGpxTGF2RHB5TWZ4Tnc1UlF3clhobkxNOUovN01rV25WOVBH?=
 =?utf-8?B?KzNrVFRCS1ArMVRnbXVSYXdnVHlZNUJCRFpPZXdqb3BZSEI5Nnp1UlRjL256?=
 =?utf-8?B?MEdjOGNOcG54ZEpVYXg4Mm5EbnNEQjJ3NDBvSkhLaDdGZ3c1WmZmT3pYWUF0?=
 =?utf-8?B?T2llN2daN015VlM3SWwzVmNjR0grUTd5MGFUZFJkM2k5aUI2L3NQNzU1cXRE?=
 =?utf-8?B?dlhyZ3ltcjk5ZHJGandLa3d3V0czS0hTcG5MUHNRSDJYZ3Baa3VVbmxYOWhq?=
 =?utf-8?B?RFc2S2VCYXAwOUlkekdyY3NuZENtNEJvVGIxUVp3anAyZXNWdlMvR0V3Z2Qr?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oB++t5Li9pndLfD+jxKkvHmbRJF5PHnNCvz2bhFdHIy1FFtXLnPozMDGKeK+rcb5OM/N3C5HrM3QyF6BqDl2QMmizZtuboqXMbvpWgJfXyDLpNluuo/PLfsOoJQIUDjBIyXX3T9mXNUttFL4UYkruW3j8NYiaVvGS4nHRi1x5tfKLcC9lS67BAId3OdlVO7EVjQLUUK7TSLjUMaMNDsGtDGf/8tvoRK3ECkumU8fruUvmutfQstes41hnNgInKbmL0+GjANvWMO8zoQDTVTkLMhX8oj//thmYGssTsSFgN+LpkKZSe4SJm6xwsyYdAvsKOj7mQJ5wnRMIOxDp0rnj1twPJByQjqGr2ze6rmgVjapdQsrWnYmriUUx3NEB/zwWG3daI7aT/PDjwm9xBPxa6uAVRG1PsyOFULsNv7+y8+8b/zuvkJzmAr/UETe7zfc1xZlvQeecLqtMUQEm3xRQfXscgmsN8l6jNt9oVW9+b6ly/u9f1bT5s/6m6va8hTsxHiokZz+HIZHfzAu+2xst/0e5naJfuZbuN5EOV0urglNMWoohOfgrZr1G/1uRPUcEXIyQleor8idYAfkZcNOlk8OCbMG2iEmxf8OpPseDJNF+AkSL0inER898u3Am8JoXddrhAq7BwKEILNqCAhkqmWzBVshtWwam2bcBIvLlTF9HNdyIXmJKLInY/j5azjL+tEQT4QvIwe6Zf9BEezAWdowT5pkuE09/3fLZkxxjgI1HUrRio+qtjmr456dvflDNA/jwILAC5EyYbRFRiOlemiOcSRH6hk2O/KuLGHnsSeubDsM7GNvgmn57qzPbQty
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aba4131-97bd-481e-bf57-08db084869d3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 13:45:31.2334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eoq0/YmsvbEaezOINXjx5j1Scf7Mcp5QOpQL9PbvVWJkT9/8Mx+Qo5s5OoOgietIDSf0Ty4slOgLD7ZJ/AxbBhgnwEBIJyWp6FuiXJ84bbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5335

On 06/02/2023 12:33 pm, Jan Beulich wrote:
> Now that they're properly represented in the public interface, stop
> using literal numbers.
>
> No functional change intended.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

(Take 2, trying to sort out my email aliases properly.)

