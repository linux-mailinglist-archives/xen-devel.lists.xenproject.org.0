Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB0D6C7032
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 19:29:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514049.795974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfPgr-0004Fe-BF; Thu, 23 Mar 2023 18:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514049.795974; Thu, 23 Mar 2023 18:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfPgr-0004DN-7n; Thu, 23 Mar 2023 18:29:33 +0000
Received: by outflank-mailman (input) for mailman id 514049;
 Thu, 23 Mar 2023 18:29:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1NO=7P=citrix.com=prvs=439d27799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfPgp-0003zz-Pr
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 18:29:31 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4a37aad-c9a8-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 19:29:29 +0100 (CET)
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Mar 2023 14:29:13 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6007.namprd03.prod.outlook.com (2603:10b6:208:31a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 18:29:08 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 18:29:07 +0000
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
X-Inumbo-ID: a4a37aad-c9a8-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679596169;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2xkGB83F9xkndzSK0vhEL3CZvvcaOXJpyWvyyfVQLBI=;
  b=SpkbHp76H3JC6eb5dgN5gXW3emYPk4nNrI3FX8TYWUwesj/f9l/bX8FN
   4X+QpYNCJqdfnWtI7YwJcUkZb+3LNaPTifk///HhUQSoK7MBuyKSuPwnm
   GyYwO+FfnAyR988XwbvUmFUMsKJxaiPu4IrB45eV6GSXM8pUWDPdKPVlv
   0=;
X-IronPort-RemoteIP: 104.47.56.175
X-IronPort-MID: 104493315
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YTdiZq/uQk1+gLUaMHAEDrUDs3+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 jBKCmDUPqzYMDH9LdBzaN+1/E9UuMeHnNJrSwFp/yw8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqoQ5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklx+
 PozBhYNdSmo3fur4vWHDe5Ht+YseZyD0IM34hmMzBn/JNN/GNXoZPyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWNilUujdABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpOSOzjrac36LGV7mM+M1pVCl+Rmvn6qGmsft1xI
 Ek15QN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16bO8vT60fy8PIgcqeS4BZRsI5Z/kuo5bs/7UZtNqEarwhdqsHzj1m
 mmOtHJn2OhVitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5XChAzSJflhTBCwfdg=
IronPort-HdrOrdr: A9a23:Ax9/q6yyou1drNOGVej2KrPwHb1zdoMgy1knxilNoEpuA6mlfq
 GV7Y8mPHrP4lsssR4b6Le90cW7MArhHP1OgLX5X43SODUO0VHAROpfBO3Zsl7d8gLFh4xgPM
 xbAs5D4bPLfCBHZAXBjzVQ0exN/DBKys6VbC7lr0tQcQ==
X-IronPort-AV: E=Sophos;i="5.98,285,1673931600"; 
   d="scan'208";a="104493315"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARhToeCHGMz+DkU3w9t2DClNgcbIfGbESpLmJfDoKUwLa02FU+5v6ft48SYn5VIot3I1dKlFlreo0Rxnr15dmvml+uWtLfftdPlvEulrSf9eMtLKgOAHFtDdHG94ksHDB1fAXRL2ASeAZ57/R/eGCrmBbA/zd0+05GZiMd2Gql8Sur7C7tfq8jpRhIyt3ib/G8FrQb8iD1XlXIE2PNTn1xUlJxx7XXVmQyFeIyhTixSJi4kdEw2ZfoZCnJjhZF1Ywstrt73NB2fh4nugQu5JvAdDTchbvnnELKPSXrhkokT1zYI/F81VCILkYIg4ww3Jc66nKBQMMByfIqi2jrpFPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xkGB83F9xkndzSK0vhEL3CZvvcaOXJpyWvyyfVQLBI=;
 b=INr0rEVYMuSZCbMbLSZlmOV4vJA48EFMTRcbFkIioZ8xy7NfGtu09/PHeWx5+5zoHKENNS9BMr5io6+01ZOet9UVPmtJF5z8S3fbAQfBbG4hgj1Rrz+7ST37qWi9GPAl/3aK5M426zQ2QKYiR2QZzxaSArr6/+C8o9yYJHTUuMoFBSci/hPZjIEK/wW4Mx50Tw9GxgHeHvirnjHKt4LpRoXk2c0naiHampXCaNomyIAwjkUjhI6bkx+SvF/4kI0yLNE9kyPmMIfpzn8mv940i4M23+0Jf6FrSYbg46UfFBWDWAy/+KZVfgjg+6ZX8D0EE/9GdnRNt0bkWcegnxl0fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xkGB83F9xkndzSK0vhEL3CZvvcaOXJpyWvyyfVQLBI=;
 b=PqJne3cuehwrtDHPFx0apsDpeQau6Wi2vafBmjAdrGZeHEohYg4VixEFxtYG9URKE/Px142X4EgPzqxcSk1C1JuOWiUpd+DfLIRxdDrAFlbGRIfamFqVhccE8U+Gm98vfJtgwv6vlq/bxH6zaWTA+xtuJHhFZSDwzyc75qjyjEM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <db24dcfc-b9c1-d242-e3b2-c6d96b9f460d@citrix.com>
Date: Thu, 23 Mar 2023 18:29:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 13/16] x86/shadow: vCPU-s never have "no mode"
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Tim Deegan <tim@xen.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
 <c9905eb6-85ed-e793-e546-472503fe3bff@suse.com>
In-Reply-To: <c9905eb6-85ed-e793-e546-472503fe3bff@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0173.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BL1PR03MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f590579-2594-4467-94f9-08db2bcc7d16
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uiTFHoL4TYhof3c3hm1K2ica/0/0E/ITl0VDnlfXg55huo49pKnXplBmu5LfNDTRDTTQi9oPg85YUDyA+fCoEC3En/TJfJ/o9VVFRBuH4ZX+zciAf7heTJ3wNozaXeS5vK8gfPi+sfGEioI68ENT5d2tDKuOk94ekmzQimtm2eRZG8BqACWkBQoZDOkpAt8RiurVxv5diyL60rqkWX8890vd8skCNHGYZM4lIeND3iLaoKvYpD5RiLy8kp/Wqzsm4D6R0aSQWtrfe4mM++HmhKlo3WyJzE9NL8TBuKkJrDO0TRq+oznUmgK00tzqNdWLMhE1XC/BK+2t1EKEMfRI70ZATBfMvVKHAs6sAxzdphcL9lfGClk6zkn6smi2XnasLtclZdf8dEHU3ec+5hh5LqWVgebD4oAm3HATYQ8E5Dc0Tl8p0fTnr4l3NA0gppSULFk8prcSvE0GVko07/rEK6Gupg2TFDNAe97Mzzm4fMiWmn8z19I+i+CEOFZ1L/EZ9DF03sMF+RDVUFFbDvUNxn++cANp485EubVsFT5g/+gt7QwrncWEumDyKTCjCE37eBtqSFEvBLff68x5Z+/SgULtlVlZr0K0vS6JbbrOTPKvPyTbIAr0qdpGLDO531QYNWgpKfI5s8KWjrJnf1xjKh/eSlkCB5e2YFtokHmKfLMR9C+dBMiamwtrsil0MDV4eZrLc2msVuX8o2PnILrNfynp+mPNPaRnklz3vId69AE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199018)(31686004)(66899018)(41300700001)(4744005)(66556008)(5660300002)(4326008)(66476007)(2906002)(8676002)(86362001)(31696002)(36756003)(82960400001)(38100700002)(6486002)(26005)(6666004)(110136005)(478600001)(316002)(8936002)(83380400001)(54906003)(66946007)(6506007)(6512007)(2616005)(186003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2FPdDM3eDl0TDRZa3A0N1FxTk1VUWhGcHNYa1h3eVUwTFlTOWZnaUNzVGk5?=
 =?utf-8?B?dlRmSlVtVTU2ZXptYWZFWmFrdXNVZTd5Rko2cmFrdUQxVDQ1c1ZtKzQxOHlP?=
 =?utf-8?B?Q0xyM0xkSGhUbVZzSVYzSnFrNnhnZXZCQlBLaWxTQWpTWnQ5elVoanB6UmlG?=
 =?utf-8?B?TkFMelJIMTNia2VYRm9vRHdISjhGVmFjZHBKZzIrTmhnb2JiaFZORm81U3M1?=
 =?utf-8?B?L2RGc3VVbDIvNnp0a3YyVWxieUhqaHFzcE9GdXJrd0llUU16V1pKZHl6d29V?=
 =?utf-8?B?dStRSlFMazdEeEVLdTBHTzFxVUc1WWxqalhEQVEwOEpMZXdJeExWNHZiMExB?=
 =?utf-8?B?dzhFZktaMlllUFNZekdpa1RPQ3JpN3JVb1R4SG9yTHpIYUtGZ2ttNlpBTmJS?=
 =?utf-8?B?S09pQStscEJPTS9iT1pVU2V0Y2VMYXUzTjFMV1luOHo1dStWeGpJZ09KUzFv?=
 =?utf-8?B?ZmpxektUZWVybExXTVkxWWcwdHVteWhMbnhIVDJ3NVRsVmxHeVUwTnRubnZV?=
 =?utf-8?B?cUNJUXRSbFE4ZlpoRVdyVi92cmNUMU52a0U2UlViMy9CdUkyb1E3dTZQUzF5?=
 =?utf-8?B?WGVRZ3AvZEJjTzVhR0NFRm85aWhCa0YxcVlNL3YyeHh5MzdKS0EyZXpDMXBh?=
 =?utf-8?B?TEM0bi9wR3VnZytmelVyemMwRGNFcW5MVE9CbFQ5bFNaejgxS2p1cUgwazI4?=
 =?utf-8?B?ZjdHSk51S0YrUFpaWm1TSTM1anh3bmdEUTF4bjR4OG4vQjFVeERZM2lzRnRz?=
 =?utf-8?B?WGw5c3RJZWY1YThySUN6QVB2a0VsVHJjMnVXdGw1KzM1SW1qbGw0Vm1SYjRP?=
 =?utf-8?B?TURJVkpndzhzc1RvYVVWeXhVTEFheWV4RDRxdkJGVmhIcnM0WXZQT21tUjE2?=
 =?utf-8?B?dFRzRW9DaUZnendoeXFYdDg1b1FwWVN2UFE4SnFobVc2QWdibytKVWMrbFJ5?=
 =?utf-8?B?VHU0bHBGZGYyZzVGZlVTbVg5c0l2UldqWkNqSU9kZnZ5RDdaRTFOSzFVckpa?=
 =?utf-8?B?VTZnVkp1eG5lSUZBbXlNaHhIa1U3UGVPVW1IOEJQcW1hTklPVUwxbm5YVEVF?=
 =?utf-8?B?U3UweGJDZkltNEJwNWsrcXAyQmozSVVTTllIR3VyT3dEeGxsRnZDOTQ1U29k?=
 =?utf-8?B?NGVQaEVpZDFnWFlTUUJyeVEvUlRLSVBSdy9GZ0c3SkZHYnkvNHltS2ptUkZG?=
 =?utf-8?B?cFFFYTBhclRZN0czd0xGZzNKdGkyRDlYT1kxZWtFZXF4VHF2ZTZjbFV0WTNL?=
 =?utf-8?B?clI5R3QvTTNNVFIyaW1BZG5JL0FJSmsxbEMwVTZOMnIvSCtBYVBKNlIrR2dO?=
 =?utf-8?B?SlJJL0w5Q1FQTkJNaE9LSktvSlJ4RGxaMklKMGl0cFUyaFRQUjFaWUd4OVVH?=
 =?utf-8?B?YmV0L2swRVZoaXMvM3krZmp2VXJUb1VRNUJLZGlFVVhweWEvU1JYNmo1Wjcx?=
 =?utf-8?B?cEZhMUdhYmo3UDdTSkFGQThwakpEL2lneXFSQ0hpVlgzblpMTFREL1ZSTTlK?=
 =?utf-8?B?S1Q2VWxkZS9YYmhoWHE0ZzZUWCszeFRxWVBzaTdKeURqa0c2MWZFREJvUDlP?=
 =?utf-8?B?dzl2b1hucHBBazEvZWtWaDJyWUFKMFA0dGVsYzhZWXUxTDZIT3RGZUJXWG43?=
 =?utf-8?B?ZFU3cjcvTXE1bkV2YzlrQk81aVQwWG5xcUdHN3Nlbzk4OVE2ZW5GdEJVQ2FK?=
 =?utf-8?B?dGtPdStNczhKY0FPYWlUbncxSVJKdCtZaGhPSHRodms5UEhTK1VxOTFkc2ZZ?=
 =?utf-8?B?QUI3NVJBc25YcC9yNUhLdTFJWWNwUEpmVEgzTEVEelkxYjEyNEgyTnFiazZh?=
 =?utf-8?B?Z092OWY0L01MTThNOUhvaFhEODJlT3dHYTlFVlg4NXRsdlB3WmV0QmFhakhD?=
 =?utf-8?B?V013SU1ETUFUdlJYajRuR29ZVEVtL1dqSlJ3Nk9UeWRWaXhlOUh2VWIvbUxR?=
 =?utf-8?B?NkJSS1g1YXRRVGhqdFJTeUJOZmJtL1hVVWg2OURUKzMyT3NRSGxPNUF1WVRM?=
 =?utf-8?B?MXo0Y2RsWUhFaHc5NWVnWGNBMkJNZzFSTUcyN09XL01XUm5zQS9yWGNiTmFM?=
 =?utf-8?B?SGdoVjVPT1Q1bzVtaWV2aVIvVnl1M0JTcFA2aHVsdzM1RDJNU1hOWmtPalZl?=
 =?utf-8?B?UkpKL1g1QU9FMkpoV2o2anV4MFB2SFcyVFIvRTc3NGVtcXhmUHMrM2IwaVpa?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gopeIirlGYo2sOQJjIyGRYRlZtVyPzKP4XwDIEAS9AY8TxWUAWHa5qP2Moelts2+RR/f5acCARLOgqCugGeXzS5RLLij6pi+me/5Ft6307kh1wvdKGnMS9HVLKXdtI9VYsgt7Z+y9vjoZE2cEMBYfu47IIhXPk4OatXxSY4hBBn/+PlZoJNWi2wQHm0b8BDQAde4w0MpIGcT0q8hVomTRdh4HYkRq/0aE6Z+qUxUvJf8IJJhLudAFFqFSTVnKfro6cumUx4iCIuuGpDYLmyH8QgQcVL+ipb/fac1uw/TJ12aeimKQGmGGO9WESt0edHWbGcABaIIlqzn5HAcSC67VNCftndMzQ4paY2yp5nCx2ooPiGbmxTlZUYbBGFLH/B8dwlAY4NAJeFyP1CBp8yxm6ychwgRymoJcJOSAQccWPIeF4C+bha8HcrYAD7ppv9Kl8mejRZ+cWy8RX1vRKDC4WIJrrUADDbWxtOU83hzd37KRxPCiKu/Dkcd3PJ6HXG8Nr+6Jn+gl3fooq8CP8CQXEAKwBBMQ2lbWhOI0EqU7AoKYRyzBf2tqBS4i0z9pM4WSC7imQHVvfCRPyL/wuSVj1LHVho+M2hgqV0u+PpCZkUPICLumHBcnZo/rXRIqpgDsDucOwxPkDopb+Xf2KwKR4gMS/7cKDwByUpJZfvzUyNVRwMhWu70pXQr9jA+qZcuXZM4WA4Lfj5U1+xbZY4C0tfcCojxnbFE1a4A+fx+BZQMcwEty5XyRjlV7OI5HjdTJpi6d1/hPymqDsjzMJaEPW7QVxiuelMpZkja4hJHpBECXBoiVvSHW/hfofdQy2Fb
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f590579-2594-4467-94f9-08db2bcc7d16
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 18:29:07.8292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eowaf1B53Q15lvE2Pq3zE8vgmZoqPQy+cLFomx7tw4cdYrYk78mewjNy3zwGTJt4z83dj28F8nLfyi6rB6tNyyQ8uoP1QcZykVw9sS5bcro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6007

On 22/03/2023 9:36 am, Jan Beulich wrote:
> With an initial mode installed by shadow_vcpu_init(), there's no need
> for sh_update_paging_modes() to deal with the "mode is still unset"
> case. Leave an assertion, though.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

