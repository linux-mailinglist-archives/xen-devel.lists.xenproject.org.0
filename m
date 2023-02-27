Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B59D36A43B4
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 15:07:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502584.774445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWe9m-0002LJ-MN; Mon, 27 Feb 2023 14:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502584.774445; Mon, 27 Feb 2023 14:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWe9m-0002J1-Id; Mon, 27 Feb 2023 14:07:10 +0000
Received: by outflank-mailman (input) for mailman id 502584;
 Mon, 27 Feb 2023 14:07:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mutd=6X=citrix.com=prvs=4152eaadc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pWe9k-0002Iv-T3
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 14:07:08 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03859232-b6a8-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 15:07:06 +0100 (CET)
Received: from mail-dm6nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Feb 2023 09:06:41 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6455.namprd03.prod.outlook.com (2603:10b6:a03:38d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 14:06:38 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 14:06:38 +0000
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
X-Inumbo-ID: 03859232-b6a8-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677506826;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=b/brqdb80fQ8mAmyxDqU90MXjTIzpot+C2CyTNTTdPI=;
  b=d3VOaF9x66k/h/n4epZJMsLXh7JE6B6PbHJRazgDvB4c/mk82P0hGwJj
   80AXJghT1gQMSnzjDIO5x4heDt++VIE2FgceQL9lMK9up9PpI14vwJ8sA
   NzxY6VOZqqm9sjnXDdFJh8A7S4KESq8bASez4gSevdVgSU2608cnPOtKg
   M=;
X-IronPort-RemoteIP: 104.47.59.171
X-IronPort-MID: 98069583
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0MJlZK4sxP6ZSrEg8W5iwwxRtATGchMFZxGqfqrLsTDasY5as4F+v
 jFJWWmPPKmPazTzeop/bo239RlTsJTSx9M3SQFprHs8Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPaoR4weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5ms
 vcaNCkUYy+6odmV27WZE+VH15sxM5y+VG8fkikIITDxK98DGMqGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnUooj+GF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNCTOPpq64x6LGV7jMeAhk1U3SZmujniEifcM9DF
 UFM4zV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8ywSWHG8fVRZadccr8sQxQFQCy
 Vuhj97vQzt1v9W9WX+bs7uZsz62ESwUNnMZIz8JSxMf5Nvuq511iQjAJuuPC4awh9zxXD31n
 TaDqXFkg61J1JFSkaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshTVflhSATlrD0xIYyU
IronPort-HdrOrdr: A9a23:BEsQsauZvrY00VU3RO+Yo/vT7skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-IronPort-AV: E=Sophos;i="5.98,332,1673931600"; 
   d="scan'208";a="98069583"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPOuiwOrdXJWyVDOviYSTosXzMZEkBj5K3Rgat78EjN497dHJseL1Xam8+ckgacBo3g4abzHPTxZiZPLf6Tb5gWWMst3YfpKlk1hHZ2itK3RKZOoMpSngT5RXRBak2qyIbyPr78+BG5FYs+ib6km8mtzNS0ZYf6Epphn086b35+96avuDNiB1ZRxN10jkigGRwybpn69zXehjmPVQD9AY4eDJZXlllRh0biyOERoOOTTeYqfLd5QF8+0db8jApWpQ1rr3vnsHBbIauHgenkd2Sdc0Qnmh/Q0l34Ec95CAHvY0QeRfBC+uug3rZNenIXVYsCSsny4+UChnVqGJ3BeKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDX2vW/r4HnF9lH5pLnNT+JaIccwT2rRSEbYnFJS6Jg=;
 b=U1yBqiGDy6Pwm7zQ/gMfDTyKE7Xcf6If0MGemavXsOEwRrBF/sKPSLJ8UFz2pzxsQRJlNSbFjkZa691ouMD8FA/UzGBTdi5QnhCvdtr1f99uk5yhxQ5OpDQQULoYcObxmlRkuwDAzA9lMhEdOZF6CFAnHW5P5Qi4xNZYKTlG9MecLHwHjJDQmlXbiTntAWdG/CXcEHi1ifdObO3CPLZofggyzZDka7wV4l21Ac7VkzdyrHk3bPK5eZaxj5nsHtUh5ZD0u47l3hSfV0JjmNfydL79ZWKS9DIsc1gzI0zL1SwOrZ4uH9VRXjPnC0iYHEGgndxDGoSvUqRJ/GJLoIE2Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDX2vW/r4HnF9lH5pLnNT+JaIccwT2rRSEbYnFJS6Jg=;
 b=VxDV8+srirg7eCyEx2KpLmGsP/f97aB+Tb20w54/0uszSpFNnfBB6buRkMuh5FrX0WlLT5gXRhV4LYq1FSMruU4q3M7+2cI2M2VZepUZuCKChCrMSEKS1arpyuG7S8LX1okjI8KYINMxqsxCbZIJLm3bHJktY6K2EV1g+AQd5q8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6a888edc-0b5b-117d-a216-ff28ad7bdc41@citrix.com>
Date: Mon, 27 Feb 2023 14:06:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/3] tools: add offsetof() to xen-tools/libs.h
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230227120957.10037-1-jgross@suse.com>
 <20230227120957.10037-4-jgross@suse.com>
 <8865a525-b55d-9b4f-ad2c-fe1f70afd0ba@suse.com>
 <809b25b3-1e8e-43ee-dc3a-1a54a938c9f7@suse.com>
 <da345d46-3027-f0fa-bef7-04494da35ac0@suse.com>
In-Reply-To: <da345d46-3027-f0fa-bef7-04494da35ac0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0239.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d502cc8-62d2-47fe-dac4-08db18cbd798
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WDv5N3STOfgogB5D6WiNunICG4Kmltxc1OOxRMkc7NtUGpREP8xObMPsR3G1IGvlpb9DRl5rDAl5zWD9o5vw4c4sp8r/19VlTDRvEsfc70ItWywYNpL4NWAkt+PMVTGhAJXb23vEIk7j7359HNt9HLmjrUMDv/Udxlw75EQjOZdcttKR0/5SGtBE6q6tZm3qDsCear/crV/0SGPAY6Y4+UmhkJYfMs9rw+YpT7QvVBquielcVUp2ncSWTwU+Kx2XZltw4IqbiYDCCIRR7d4SbE/bJF9EVJiIxXsILOy++O7dku3qPfHPH46DVx5Y/x3otZvUzR+3pf9RgFF1yUr/hEKXzt+e9hx4wdr2vKhFJ2S5pc87pPGc3doIp2lhIlOPQVM/T07B38R59t/DWuI0Z/sJ76op6LJfPwcyjtnjgVF/qlnEnJS/VUXkiu5YdtdLLJMn+X13pn61xwJslgs+YhJms70tZ08F2dPpr10Z4Zde0Qv66IWmT98SxjNhSiSmWcR07eTl+NJJIDCCIw3f8zbS9u4jnx5D3cM772XAitlls2FszYQsMbW/k/vCyZgYeCMY6aOoR4bAoNpQDFp5VKfjVgGgt2zGLVqB5GOk8puQLIydnB+XFu4UObB+frRDzwsS3WCskmS8v/TJKLy8mF4ELKUrgs8xXmGjktB8IqD3YaUDltxINwZF04+ixJgBco5nAWUVGSZRLhoy2uaz2hPlAZHAYVdFGgJEpTFdEnM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(451199018)(36756003)(54906003)(110136005)(316002)(6666004)(6486002)(66476007)(2616005)(478600001)(53546011)(6506007)(6512007)(186003)(26005)(8936002)(41300700001)(86362001)(31696002)(5660300002)(66946007)(2906002)(66556008)(8676002)(38100700002)(4326008)(82960400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SU1mUlArd0F5Wmc2L0lnWGxPY3lrMGFhYTgxelJ1TDhvT0pldEJHSE1NQm5H?=
 =?utf-8?B?K1U2R1JoT3owclFmbGxhZ1FqNlAyTE1kS0l4d1ZVaEs2VG9FL1VjREtBZTZT?=
 =?utf-8?B?NTh3Zm9Vb1RkS3A1RG9WdGFBcFZWYlNkUW5POXhzQU9RT0wxT3hwdUlpTVdI?=
 =?utf-8?B?ZU5MRnBUVnFlT2xhdFlaUHZUWXNyTG1EWVA5WjUvNjlDS28xUVlRMk8rdjU2?=
 =?utf-8?B?UUZ4SHNNYzNoYUI2RStMalMyVWJjaDJMSG14ZXhJZmtlZWUwK1plQ0dtQU42?=
 =?utf-8?B?Z0pQaGlVY3p2SEpzNFZuWnozV0xoM0tiTFBURVYzdTEwV3V4WmR6R3NxSlZ1?=
 =?utf-8?B?TkxYbXlKZWtYaWJMTS9Talk3TitNUmFMWjlocWdGOWdGYWd2MHVScmh0cWpZ?=
 =?utf-8?B?L2dCWFg3SUwyQ1RBNzF0Uks3VGlQUEZLdlVpMnh5MUFReFZyV2FMaFRwQ3Er?=
 =?utf-8?B?NXBLMXBCSytyeTVDZXBXZGVzVHliNUptTUgwZVJvbTRYMFF4ZGVxb3UxVDRB?=
 =?utf-8?B?RHhMRUR2NXBxL2dxZlFlaGFrZ0pwYnBBZWw4M3NmUTkzSmg4d3hiZFRqUXln?=
 =?utf-8?B?dWFJeWlLdXZtM2hVa3FSbVpGSkh4Z0QwaG1UOHl4a1J6ejFLWjZMZjYwWjhx?=
 =?utf-8?B?Rk9vNUJLTnR3OStYa1hYdU15SEYyeU9MczczTEVyVkExQUpJaHVoZ2prUVJs?=
 =?utf-8?B?T3ZOdTM5R2VvMG9TMFAxY1hySjhSQVo5Yy8veUc4T1NMaWIwUWlGYUZsVWZp?=
 =?utf-8?B?dGFHdlROVVJ4ZDE4a0wyRHRWdy8rRit3VWFyVjRwZFhEKzRmOVpGSFVvN1R1?=
 =?utf-8?B?bWRUbmZrSzlmTXBIMDdidkI5dzN2Um0yUzFJMTdjd2hwQ0M0U211VTRVa3d1?=
 =?utf-8?B?SDBhRk54RmZZanl6ODYxY2RCbGRVRjlRSmtuWXhkY2xXbzRFVmJOMVRDS2FD?=
 =?utf-8?B?UVAvS2hLaXhaTVlRK1V0cTVuWmxLVWp4V2g4V01uMTFkRVN5ZEN0WldXTGFr?=
 =?utf-8?B?cHp4NkJBeDN1N3NINTFEbFlSU2x4bXBEZG8xTHJEMmh3cEJTWWhiUWhiY245?=
 =?utf-8?B?MFlqNnRtWnozWEtHZVo3aStubHo2SkFBdzNIYzNPSk0vaHd3emhoS1dmd0Ru?=
 =?utf-8?B?Rzc3dFMwM2k2NXE3dmFKRzZZYVoycitCNndrTklvWkp6Mm5qekNqWHJTNE9L?=
 =?utf-8?B?d0VuOHBpbmdzYWRvYlVXYk90d1VVV3habmx0VjhhN2RMcThPR3B6bHRPWnVQ?=
 =?utf-8?B?ZmpOeGtTVk01ZjZXNFY5R25keUxvNE5UZGc1amEzenhaY2VrbTZXYkNBTDhH?=
 =?utf-8?B?aUZIcXFUckxWSlp1U3FWU253NUZnK3ZwYmNiSGlFWlgwR1JwMHlobkdac2FI?=
 =?utf-8?B?L0thU3duUW4yMG12ZDAxT1drN1MwSWFDNnVqRTJHWGdyOUhLYW93L3hURW5i?=
 =?utf-8?B?bG4zWS9JM3UvY04yWUxYSGl2aTJrMkxNWHVyNU9yUjd3dHp2bm81RGltK0Zx?=
 =?utf-8?B?Q3J1NlpKL3J1VFBybDBSczdyN2NKbzNRL05LMmNabDN0OVJXRzVJOW05Q3Ro?=
 =?utf-8?B?M2RUZ0RDR0xod2hzRzIwVG9rYXN2cWZRaTZqY2pkYzNyaVRLZHhkUTJsbFdu?=
 =?utf-8?B?bUpsWmovOGhETDNoNmZPQURJYXJjWkREbVJvb0pKSm9CU2tBc3BuL29nNU80?=
 =?utf-8?B?ODdBRDcycCtRdDZ4UmczaUU3Ly9XbXl2OWc3YWdiTVZGUFVrdTF1STRuV0Vx?=
 =?utf-8?B?aDJHcldrcitwYjVOckczblk3aFR5c0svSmNQS1ZTbjhBbUFGNG9RTGJJWVI3?=
 =?utf-8?B?anBzOVN0d3RzUXUycnJlQytDclozY2xlOUlLNUZaby80OFZWbW8wbWYvRUdR?=
 =?utf-8?B?LzJXNzlGZ1FxN01RV2wyaDhCOGdSZVl6OVZjSDhpbzFXU1ZRZU5FRjUreUNK?=
 =?utf-8?B?Rm0zamV5Ty9GKzI1WVVvc05VWDFFQ0E4SFRqYWhqK0NSeXdYNVBFTWhRd2lz?=
 =?utf-8?B?aVVSUGhNdnl2ZlhzVjBDbWVkS0w1emdJaWMxYjlwOU4rN3dueFlIcnlLa0FB?=
 =?utf-8?B?VnhJamhWSXVmZ2FFRkpBalpDTGFCL3Z3dFlaY0xucnhubG4xWWs2eFRxVjlq?=
 =?utf-8?B?TEE0S1Z1cDlzSGtmOFhaRXpNYWl6UEFud3VFa2lKaFlXNUx2eUtYTDVEL0x2?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5VgnvCgCziUrE/amiyLF+bmnnz78QpuV3fXFsq5L9DEa/vIDEW+K1WuXhG9EUPNajlpP3oSwSxZEwvADGr+sLYvTTcpl1okv8ZS2+MlixjZLnLKe1OqnnGo/Ku8lKHB+Y/2x4b7kaHMw9kkGQkd+I5YoqWwji6HTqrpExkm4GApzcRmPqAOGhg1/Jx0IFR/O4m6Gdk+jROZd4zjas+0NF3QvBGLOg5CrUQnOdKQp1grSPn86hYkR9CwB9smIcFwzIWEclTHv2PoDsSgaVuJ4c+fHtpBagYgq1yveSzllOM90xT4nUKABfGEX7e4nVqFhQg2hM6OXBMHzBcVF/jcsV5DDjqp4+wOWoRbk6MMbAgeGszVl6l2j21zBeD8cB3EiBLgJfGqqF92zASqaMtYNzyP+aDjwMOD7Ty3qRDk/sDuGxDL+VDqvShDmx1n0TMHX5Q0Bu1xUjyLg4Ep29vqtVnI3ev6pq2/4Cu3BvLIquX+9c18mF30cp5zsrfSEreip0kEoG7SsW+CS1uBG2HdlC6ac06AolOYBOrUgPwrduKBQMYsXO6mXNBrkJCVWjRHXL72RBkHtKBrY9TIPBxVDZXJld/tHbLeUlZ8/E57gvnMJG370IIAH7fTDp1kKKYuSClqfeH3As0rq/vjCRj4iWvE7QJ3e7xvdqDa79Pv/uYKeRMurZF/vgZpSrMRfSxkKC28Iwzawcs1zZrotrurmXq++huYzxBPOCqmMLJEa9rU9UypZwdt7aLvAZZG2gaNH8W25q84mtOVnC3yh9OehZTT0c6gAzV7m81tiCURix6rvOiTVPzqik0sgeLP+8nA2
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d502cc8-62d2-47fe-dac4-08db18cbd798
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 14:06:38.5571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQnx37y5IqDFktuUx2B7xgCQIC5KZgqeMTUEysDQ/cHYRpERhZm4UQ4FSXdFOIBiR+Xy3qVZPcI7QDFnZTmV2JMCcuZlBUpMFUXgR137WPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6455

On 27/02/2023 12:43 pm, Jan Beulich wrote:
> On 27.02.2023 13:34, Juergen Gross wrote:
>> On 27.02.23 13:31, Jan Beulich wrote:
>>> On 27.02.2023 13:09, Juergen Gross wrote:
>>>> --- a/tools/firmware/hvmloader/util.h
>>>> +++ b/tools/firmware/hvmloader/util.h
>>>> @@ -30,9 +30,6 @@ enum {
>>>>   #define SEL_DATA32          0x0020
>>>>   #define SEL_CODE64          0x0028
>>>>   
>>>> -#undef offsetof
>>>> -#define offsetof(t, m) ((unsigned long)&((t *)0)->m)
>>>> -
>>>>   #undef NULL
>>>>   #define NULL ((void*)0)
>>>>   
>>>> diff --git a/tools/firmware/include/stddef.h b/tools/firmware/include/stddef.h
>>>> index c7f974608a..926ae12fa5 100644
>>>> --- a/tools/firmware/include/stddef.h
>>>> +++ b/tools/firmware/include/stddef.h
>>>> @@ -1,10 +1,10 @@
>>>>   #ifndef _STDDEF_H_
>>>>   #define _STDDEF_H_
>>>>   
>>>> +#include <xen-tools/libs.h>
>>> I'm not convinced firmware/ files can validly include this header.
>> This file only contains macros which don't call any external functions.
>>
>> Would you be fine with me adding a related comment to it?
> If it was to be usable like this, that would be a prereq, but personally
> I don't view this as sufficient. The environment code runs in that lives
> under firmware/ is simply different (hvmloader, for example, is 32-bit
> no matter that the toolstack would normally be 64-bit), so to me it
> feels like setting up a trap for ourselves. If Andrew or Roger are fully
> convinced this is a good move, I won't be standing in the way ...

We still support 32bit builds of the toolstack on multiple
architectures, so I don't see bitness as an argument against.

I am slightly uneasy adding a header like this, but it really is only
common macros and I don't see how it could possibly change from that
given the existing uses.  OTOH, removing things like the problematic
definition of offsetof() is an improvement.

I'd probably tentatively ack this patch, seeing as it is a minor
improvlement, but I think there's a middle option too.  Rename libs.h to
macros.h or common-macros.h?  IMO that would be something that's far
more obviously safe to include into firmware/, and something rather more
descriptive at all of its include sites.

Thoughts?

~Andrew

