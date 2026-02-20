Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCPzHwh7mGnlJAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 16:17:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4292168D24
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 16:17:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237270.1539652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtSFh-0006SU-Ur; Fri, 20 Feb 2026 15:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237270.1539652; Fri, 20 Feb 2026 15:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtSFh-0006QK-RZ; Fri, 20 Feb 2026 15:17:09 +0000
Received: by outflank-mailman (input) for mailman id 1237270;
 Fri, 20 Feb 2026 15:17:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rFK=AY=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vtSFg-0005tw-GN
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 15:17:08 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 350e31ae-0e6f-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 16:17:03 +0100 (CET)
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by BLAPR03MB5603.namprd03.prod.outlook.com (2603:10b6:208:29b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Fri, 20 Feb
 2026 15:16:57 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 15:16:57 +0000
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
X-Inumbo-ID: 350e31ae-0e6f-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hf8039kKbEzFaS3J7G8htUbR6ynUT+5vwCvPb7NAEe0fshLVtO89JBF+K6njyZePeMAv81QTkNtN2S9fSrdeK3l/gOVnzKB/38pxfKVLVBGqTh0am+70ImgVQyeXSx5a2Tv6zmB0VFnJmAGu0Tn2bKvlhh7/ZsEyeYJqSEyUxiInaA7nX4K0VEjuQDUy1BfM/MPgg2pszFobKWJOyI0uBz+PP5TmbSQOzc3LGYO7li8oHc6tR5WXhFaFKVdPc3XYdgkEHrKNGlvY1b76jRhao8mn9BL0+psGpxfmYNxxF1fckyUSSUKb7HBrbzbWcMV8Ao0aWWZ0EzGfs2aIRF8s1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44BdH1H5ikua9BYyOTRKPJoj2lHpZG9Ti1VmyFOxR8U=;
 b=oQir2DOIddT/G1OVf6taUO2rIZ5drc/pYAute6BqFYE86wMZF//EpjAjrCpJLEE9gGLj92ZAu9YXLz9l81A9TrEP55aDV0VmdbRcUgr2Qp8RLNWDGtOXqa+/h7cRCIEOtodhWbHoZmuCXy2mHd2UgUOBSwyB/lJ/FTzx2USD5qMQ81aaj6mEIKHW694WDKrG+nQcU4+ObH60oeJttgYb08gB5rGp1/fb0O3JmP1i+Wgu7tKZAfMG5Svg4nNJoFhxpZeGk3pioX8/O3X/AN5E6sBnXluaYhxYFkBuKB/70o4h2/rOB5WnEYD050pjef3KIhhA9CcjOJnnr48E7gdIiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44BdH1H5ikua9BYyOTRKPJoj2lHpZG9Ti1VmyFOxR8U=;
 b=GLxtjjQMccqWEcBaK2p+o6t9Occu2ZqFQwfZjDHzIQpzjs+t2wlKENF5yrPt3KF/EsnXYm84FtPqmF6OCY3Oj6rPP5IzG9keHiRKdRr1XuzIxaCN4dnFJWx2Kw8kapOckfVP4tuRa2zr0uUxILnOqVuWYwf/B5SiQv0h+uqVhLc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d7ba3286-9a29-4263-95a8-8859e8f2c599@citrix.com>
Date: Fri, 20 Feb 2026 15:16:54 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v3 12/12] x86/shadow: adjust monitor table prealloc amount
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
 <ca8abb5a-8a47-247d-cf56-e730dc76ab20@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <ca8abb5a-8a47-247d-cf56-e730dc76ab20@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::20) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|BLAPR03MB5603:EE_
X-MS-Office365-Filtering-Correlation-Id: c581a3a3-258b-4115-dd2e-08de7093168d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eUdIaFR3WE9RQW1kT3grTDZsMEJ3OWFOWGwzTGY2YUJTWFk0cXFOank3NG16?=
 =?utf-8?B?NzJyVWZndVAveFBYRlNWbUR6M3ZmTnJDNXBFZGxwQVpxdU9UV2czS2hMQ1U4?=
 =?utf-8?B?ekRQNkN4K0hXMkh2dVo5dkhNZ1ZpM3lOVVg4RFhlbWZRR1hFWjBWRHVNWnVL?=
 =?utf-8?B?WkRwcHNRWGN2Q1A4SG9taW53cWY1MkZ4cWY1bEZFV1MxNisxZzJiQTNRbDUv?=
 =?utf-8?B?bmNuV0lhSC9YbDBtSG5va05aZ25GcTNxVnFuZ2Z2RWptN3VZNTJuenF3MmNw?=
 =?utf-8?B?MUhERUVPeS9wek1kMUpRUGZ2WHBNV3MzL2pocXVCMjZwQlluelkxZWlMWVRk?=
 =?utf-8?B?emkzUlZYM2ZacldOT2dDVndRaVFTRkRGbGdmQ25NT0QvdEVyQmwraGNsejQ2?=
 =?utf-8?B?QlNldTBZZXlBZlVtTE43c3Q2S0kwZjNwMEl1RzFlNTJEMUlLS1NmQXhPZTd0?=
 =?utf-8?B?V2VSUllZeGxWeExwckQ0ZnZOTWl0RXZIdnAvQnVVL0VsNStnWVRuRVdOcUJP?=
 =?utf-8?B?QjJ3NmJrdDM3cGhjSE83a1huamRLVXNjYUtJNWV5YlpFRTRwVHd5LzhYUFhw?=
 =?utf-8?B?dzJVcHRMTFJEU2tyZCtRL2Z1aFB4NGpRbkdJVmk5SkMzbEpEM3pSRWMzYWph?=
 =?utf-8?B?YXhuSGNOWnF5YnR3TzJDR2ZNZ01aeXBBUjlIM3RUWUZZdnp2cmVkVDA2Zy9u?=
 =?utf-8?B?dHAxWXhXQ3ZVU1crWTdyVGVqalYyVlhyM0swdDdNd2RmL2I4cjF4a0JLeDZj?=
 =?utf-8?B?bXVUVGlUZnpDSE1TY0lFNjVTNlpNZXMrd1YwZm1kSzdHSXZuK1VSYkdNNlN4?=
 =?utf-8?B?MXB4Vk9mK1dsRWhocW5lRy82clo2a3Y5bXYrTVBLdTV1WDE0MURCNUc3Y1N6?=
 =?utf-8?B?aWg5Tm94b3NJRm4yR1lXWUZBZTRIM1hBT2dWbTdGWVV3eDFqQ0JOcnZ1VlR0?=
 =?utf-8?B?SEY1dzVwcXNPallLb3dDcm5QYmVYR3gxWFQwUWo0MUVKaGlzSGp2SkxQMFlU?=
 =?utf-8?B?M2JXT056L0piT3JkR3dpWmZSbnpuVzFhMlExdEd3dDF5VUF2WWhLM1dFNU0z?=
 =?utf-8?B?OXNOMWpiQzFqVFk4eTRjMWQ0cGRRMEdYMlZLYmd3NTRwRWdDem5BUWdrMTla?=
 =?utf-8?B?dkRmeGs5dHRIZ3dBa1c2NWpUUnk0emQwY1JFblZiZ0lkRDRRdVhlMkwybEhu?=
 =?utf-8?B?Q3lPN2ZxQ2RvZzR4TUtVR2tseVA5RUNzM0dGSFYvZUdFMEQ4R0IxRExjYkJ1?=
 =?utf-8?B?bDdVRHZERHRjYjAyMnJIVDlRVWFtMXJlTm00ODhCQVVVVFJOd2ViMC9LelYv?=
 =?utf-8?B?RkYvc2ZSeTlvNnNyV1VwOVJjeC81R0FmMTlPYTg0UURqWSt4QzVhcTlob0pO?=
 =?utf-8?B?YVp1ZlBBMFJyTU5jMVRhdXc1MWhQQTJFblFxeW1BY3FNdTIzWmRiTllabncr?=
 =?utf-8?B?V3JQSFhtSnFod0J2d0JVOC9ONUVjTXhBVVk4L3BmZllxQmdMUWtmdEpOVWZI?=
 =?utf-8?B?T1pQVG5OVmlKbnVMZnYxQjEyMm9QS3pjL1FzVFhkTDAwYzc0cTA5VktCcTFI?=
 =?utf-8?B?NnhlVnlnRmdPa1JTdEpQSW5EV0ROZG9udURtVzdIa1lBVmM3TDluY05vazM3?=
 =?utf-8?B?ZkdxVE5rMENOdmJObWZUU0F3cFl5aktIWXlGb0hGR2pxVGVwdWtVTzNHNUNw?=
 =?utf-8?B?N0pnZjBDRGZLc1FzeVJ6L3VJckx0bmdZSVZJVXd0TWxpZjUxYi92NWtvcm5C?=
 =?utf-8?B?R0dPNVRiV3NkQnVySHVQWDFhWS9PQjdNVFJ3Tmxxajd2VXpQenlZdWFONkJJ?=
 =?utf-8?B?S2JVei9mdmZDTDUyWXBGU1QxWi9pZnJjZm1aK3dQb3JHNldzZVd6ZFMvb2xU?=
 =?utf-8?B?Q05aNlorL09SeE1oWUVRMktJOVNvaDMxRTkwSXFQMTdyVUt0TkJ6MXQ1Qy9p?=
 =?utf-8?B?d3dScGtnUkZ4ajVTT25DMDdBaVVBVWNuYkhuZ2VZbTlKN0NTMnNxYmFEaHVz?=
 =?utf-8?B?WmdJZmpGVEg4SWJyZ09idFNvbHNqeGhZSHdPeE15YkFFU09IUE5zdWYza1dO?=
 =?utf-8?B?Vmo3clJSbzVKbElUT3lOMmEwOHpIVDZ5VDZObTdsR3pMYWVOWldhRnNwNlZy?=
 =?utf-8?Q?l2ks=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aG84QUpCR2ZnTmVJUjQ5OHdEVVpDWE1JemdZTzl4RzhiemJ1ZDYzT1U3TkNu?=
 =?utf-8?B?aTI2eCs3THl4Z3lXY1VpYUVLa3JuNW9wVTVwNnZ3Z2NnbkYrZXpZdGRKVGQ3?=
 =?utf-8?B?RUcxc0NvUEJPRGtrUGt3eHZWakV4WFRveFVXN0NSZTFpSWRWa2lUT2NYR1RJ?=
 =?utf-8?B?TWx6aFZaUHZrSjdoeDN4c1Z2alkvTUUvWG9yRHF6VXNmZFB5d0UzSDB0VVIz?=
 =?utf-8?B?OEhESkpOempaSWRjNmRicVV4ejQwc200ZEtTS2ErK08raElMZG8wYkNKSEI3?=
 =?utf-8?B?Ym9DenhxYUpWbk1SNWJqVCt3bGgzazJqU3YrS1lFcW5UcCtTVnBnNnBERnZD?=
 =?utf-8?B?aUJNaHN6blQzRTZMN01sODBqUG4rb3JsUFo0SnIyMk9kbkJWUlo1VG5xdFFG?=
 =?utf-8?B?UGdEbUpSd1ZBK2lvNTJkQUsrSVpzQ21CbG42aXdnWEs3RHRNS0ZXc2NORUEw?=
 =?utf-8?B?UnY0MzRJUGhlWUN6UE9UalNxcWJKWGVrZ1dCd0RQUzZTbjBpODVpV0RacTM1?=
 =?utf-8?B?alV3VEZTSkVDS3hDcDQ5WWhVYWhUQlVPQmRJcUdGR3FDZk5FS0dFRElUOXRa?=
 =?utf-8?B?Rk4zRXhmTjhPUE93eGs3VWwyaXppRWtlYWd1ZTk4SG1Pc2o3c0tZUzFWaVVx?=
 =?utf-8?B?ZE5XR2tSanNJRUdKRjI5ZE82RU8xek01OFJvZlJJaW05OTVuQXA1aHduNUMv?=
 =?utf-8?B?LzBTeEJ3NjNyb1VidHdFSHdJWUxibTNuYXhibGhIYWRYdDdUZExGZFVXbkpV?=
 =?utf-8?B?Qi9kOGRxT1hpMjJlWTRvUjRkV1ZDeWlBTDdEQnpQaWpydmd1M1hDb2tyWUVs?=
 =?utf-8?B?dUV6by81NWpLcm1DR1ZUalZsQXBWMTVTaGw2T0FxeThFV0dXelRBMENBSDVz?=
 =?utf-8?B?TFlxUmRLWHJ5UlQ1RkJSOFBkcTlaYzJYWi91bHJkTXVvMlE0Q2RrN2NJL1Jl?=
 =?utf-8?B?ekM5QnY2cVg0VU5SSnMzWHIxQ05ZZ0V4MmJxaGhySmhtUHBrbjh1cFhkU0NO?=
 =?utf-8?B?ZU5GeldnVmJock9rOExuUVdjNXBicm95T0lnN0xNbGE1dVM0VnJORU1YMTNu?=
 =?utf-8?B?U3cvM0QxQVQzT0MzZlhGcVZVSSttQVhjbFhOak9ZRUlIRTNKMnlzd2Fhb0xS?=
 =?utf-8?B?VFFTZWVIdHJDNzV3S0dJMHoyY2tHd0pWbU9KM21qMUpOZW4yRFl6ekEzTGpy?=
 =?utf-8?B?OVh1MHNDNFpPU2t5SzBySWIrbEJLMFZZVGxiNUFLalVSbmY1VDRNb1NEUnFC?=
 =?utf-8?B?MnFkeCtTb2xVT1ZhcVBWNzNjQlYvNEltRm1qMW4yakYyNHlZUGVWRWJqNElK?=
 =?utf-8?B?TlJnZ3ZTbTNZbXNlakN0UExFNnZWOG1TdkpJdWNWMkVSRlNoT0hkUi9TeFVR?=
 =?utf-8?B?L200a0dqZGxSclRMcnoxNkJJQnRVZklqL0ZCakhDaDMyaEkvR2ZQYkxYQ1lO?=
 =?utf-8?B?NUVScjVJaCtlWmVid2g5bWhTZHNQTW0vNDBqRi83QUpIbE1QWmp6U0pYZ2ZQ?=
 =?utf-8?B?aHBpRVBya3ljenU2Z05RaC9uWCs2RWNZa3BJWFMwNHhjRlQ0Nm1adm1qWGU5?=
 =?utf-8?B?QnczaGUzdFAxOW1qTFRGdHF0OU1yV2lQQkJwMytLZ1QzaTZ0cVAzSkxoQmNJ?=
 =?utf-8?B?SXNMVkJhZmJwUFRJYk5BQVkzSzd3OHhLM1p1bTBSWDR2aVRMT2FXUmlRY29I?=
 =?utf-8?B?ZThibW9Qc3VaY2gyczdkTDRoR3h4bThPOFQ3RlpJeitHeFk0QjFEdlZiNUJv?=
 =?utf-8?B?R2dPK3B2a21IU0FhOTkrRngzTmZWS0QxNCtwNEVPaDE2aHliYk0rRUgvcm8x?=
 =?utf-8?B?V2Z6aHR0UFlMdHIrQTA3TGhTWkdTR0JITElGYkZLQ1g4QlN3VU1EMjgzNHpy?=
 =?utf-8?B?QkJUL0N2bENtMFpBaVZBaVg5Sk4rNDBURkR0VzhlUktFakF0SkxiMXlDalNi?=
 =?utf-8?B?Sm9RSENLdm5wQXlzVXFsUzBWZlIyMXBvVHhBb1ZvZFRTOUUvT044TTZwK3Rj?=
 =?utf-8?B?andSKzVXd2tPZmg5M3FPbHlpdTEzZk5MTkpZNHI1MlpEZStOcWlEY1h2UVZ1?=
 =?utf-8?B?WjhjWGtoSHhlMUlCSkxEU3lRRkZkZDMreWFXUGpEd0FqTHBua3hHWnEzNUg4?=
 =?utf-8?B?dmswcWM3eXU0aHpsdzJBVnh5dzl1UlFRSnBnU0pIdlZ0Q040UHFqMWdobUtP?=
 =?utf-8?B?UEIvMGxCaTIvbmdFckdLR0ZyOThyYjY4dFRKN2RpejVTUHN3dTJhb0dwMTE0?=
 =?utf-8?B?L1pOUXZuU2NOQ3ZYUVhyUlZmNzBHUnBDdlFoVVRzbktXUnM3bDYwMTJJNGhV?=
 =?utf-8?B?M0ZNVmxDbVRabVpoN2s2MXhEeW9vSEM1bnd0dEhIRW5SKzgvOFVGL2FKVVBM?=
 =?utf-8?Q?j6uJosZKVdONcc8c=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c581a3a3-258b-4115-dd2e-08de7093168d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 15:16:57.5347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N04RVIYzyB1IenOQAo3dIC7ig9GdytfqRjAYoIKU3cugKiTDl/qgpNBcyoY3MY+5oo1yQdFmYLqNwUP6E4q7S2QpTGBtsxqeg2tOTd+bMfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5603
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:wl@xen.org,m:roger.pau@citrix.com,m:tim@xen.org,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E4292168D24
X-Rspamd-Action: no action

On 16/05/2023 8:42 am, Jan Beulich wrote:
> While 670d6b908ff2 ('x86 shadow: Move the shadow linear mapping for
> n-on-3-on-4 shadows so') bumped the amount by one too little for the
> 32-on-64 case (which luckily was dead code, and hence a bump wasn't
> necessary in the first place), 0b841314dace ('x86/shadow:
> sh_{make,destroy}_monitor_table() are "even more" HVM-only'), dropping
> the dead code, then didn't adjust the amount back. Yet even the original
> amount was too high in certain cases. Switch to pre-allocating just as
> much as is going to be needed.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

