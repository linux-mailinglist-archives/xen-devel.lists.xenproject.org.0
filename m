Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 946EF70F835
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 16:04:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539058.839559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1p5R-0006BW-Sg; Wed, 24 May 2023 14:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539058.839559; Wed, 24 May 2023 14:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1p5R-00069c-OI; Wed, 24 May 2023 14:03:33 +0000
Received: by outflank-mailman (input) for mailman id 539058;
 Wed, 24 May 2023 14:03:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTJK=BN=citrix.com=prvs=501cbbf32=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q1p5P-00069W-G0
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 14:03:31 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0e751de-fa3b-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 16:03:28 +0200 (CEST)
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2023 10:03:16 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5462.namprd03.prod.outlook.com (2603:10b6:5:2d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 14:03:13 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 14:03:13 +0000
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
X-Inumbo-ID: c0e751de-fa3b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684937007;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=o0YZJClRcMHKqb9OUMWKI0KomM0noTUH1d/DDYOBjBw=;
  b=S9kGyMyFX+4tnuCiTVcstvkw0uds+a3jCm6Jt4WYh2vWPyKpp0eSdA6g
   o8oP5pgcoJjxPKc9xomAB90WGhcvon8Tei0vzM+tuvGfQTixUe9vK01ya
   523KjcZhm/vBsTxosvmRXxsmf71bbMm+MesXshAEeedz84cRmhi0BXIW3
   8=;
X-IronPort-RemoteIP: 104.47.58.100
X-IronPort-MID: 108991531
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:K4Xi/aIClJogvdI3FE+R/JQlxSXFcZb7ZxGr2PjKsXjdYENS1DFUm
 jFMD2CDOamKM2r9KYh0bN++8U0GuJHSnIdnHQplqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4wZiPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4uEVhA8
 /ETdQtdZzuCh/Cd0Oy6bftF05FLwMnDZOvzu1lG5BSAVbMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGLlGSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHurCdNLSebhnhJsqHKB7U0WKzlHbxiYodSalXDhC/YCN
 WVBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQkvsIrQT0h1
 neSgsjkQzdotdW9Vna15rqS6zSoNkAowXQqYCYFSU4J5oflqYRq1hbXFI87SOiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAsjA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:P0X1Q64d7+rwGBnQhgPXwOrXdLJyesId70hD6qkRc20xTiX8ra
 rCoB1173PJYVoqN03I4OrwX5VoIkmsl6Kdg7NwAV7KZmCPhILPFu9fBODZsl7d8kPFl9K14p
 0QF5SWWOeaMbGjt7eB3OBjKadZ/DBbytHPuQ4D9QYXcei1UdAc0+8XYjzra3FLeA==
X-Talos-CUID: 9a23:6C/cCGCAfCWSyZv6E3B3zUASF8t4SS3U53bQMWSoV2dOWpTAHA==
X-Talos-MUID: 9a23:eQ75eAuCqeZbwSdVZs2nqyNJFcJLx/WUS2MNvLYZhZbUEXFuEmLI
X-IronPort-AV: E=Sophos;i="6.00,189,1681185600"; 
   d="scan'208";a="108991531"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFmzvDQRwYd6QkovsHa2wn7mqjYjRXzsGyipnrPKrgFNt7rLFeSgNTxe2bMVuY9moYRmlYsyhjV8+8RxOuOu8f+iv8SahnvcEyuyu3X5njTpS7HSdbf61ixjQ0sGZ4AtOYRDVOmyrnUwL7+O6F1SJBzS+1I1X/xApJdTcvRkDfg5d8869OMM8i0H8g6kGx04H/3RtYtvmdfUEwu8TjaWAIVAw7RJ40s2UBqfPt12T1lEGtLpL8Ca9fOAVXtBoN/HD1OR+2ejxeD/n/t0YyRisaZHh/A4MhE+mmI1JphD5BZA4U+hWtCveGA5igAzcJEMjbLR7pcx2oP+1IbbX1lltw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JArMfPQaRq8QAANfEdYRU40E6c26elQI4m66XtPPgw4=;
 b=l7I5dd2dUuCD31/INvKewNX0h3UbxTtPuLW/40nQcm3oDsQb11FCVTdkx9pYCC8EfNed+2ib2sZA4wFUxO9rQygOFLNii/7dZM93dhvh4oRwui/JOXMnVChAv4vU7S+azJ9rKRNNjS70z17/RDzjpjoapxlk7rRTUzs4hrLLiUIJCGLTWP53UBJR+M8IADHY1RUi1GxThPe144M8u4ThvZHA9ULJMOUs3w3bzoeUj2LAq1wp1LtiMJKvTomqoh9jt0+nhgDBY9wsz03EysSqMpcY4sbOABIH0cPs7wIo3M/x2hqGamqBj2NR58rAtVEn7GfVsEhJ7VqcLbQHB0FP4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JArMfPQaRq8QAANfEdYRU40E6c26elQI4m66XtPPgw4=;
 b=UgC+XGY6ZMYLkUS5YJ6AO9Pl+NXBMX3RI1m4SMY2bKwoWK8aKPkpa97cXVtxkJzbvW/wmUU4JfRaaRwtcv0gq+bfb5ISNjaHmxkSwnuqmcURQ8DYdlsSs6V6q5yI0d5qqjrjyciQxYi4ehrcg2bbgb9RIzEIiahmhbogdVSMqQM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <143ca25b-4689-0cef-e6ce-99defa571159@citrix.com>
Date: Wed, 24 May 2023 15:03:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 05/10] x86/boot: Record MSR_ARCH_CAPS for the Raw and
 Host CPU policy
Content-Language: en-GB
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230524112526.3475200-1-andrew.cooper3@citrix.com>
 <20230524112526.3475200-6-andrew.cooper3@citrix.com>
In-Reply-To: <20230524112526.3475200-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0643.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DS7PR03MB5462:EE_
X-MS-Office365-Filtering-Correlation-Id: 30f306be-53ea-42af-88a9-08db5c5f9cbe
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZtGlkrTTcYJC3mRy04dE7vq7418IhG4a6MYKVPHy9doIMU4G2HG77fr389bEtN6lgNs9IvdQZgtDuCkLULVrh0nHSNZf/vZM0ZuL10Tke4rVc2/WrHlpnMOV/3wwjiiL1UvZt0M/BCVWudS1ciGzOHhB46JJRfFMLYRWtlLaSB5rDsUJktOsMQxcUxPYhLrGv6y1S+VZNRs8MpQb25lzh9Tb2EnDYKrTOc3XMsJapv61/c+C65aBgNJ8xTFAiqVXxdRkb6x/QiziuN7U7/rVJjiOZPytpH3LPfWBOoP4sSDfe2+dV4ENlpUNA+zy0WVOsxBxhIBbcvdXqQ6+YS0jT4KOOAnl/cJqwVNbuieX76VivLzaKUtDUNNY+7d9rZpLT+IGRmkxbkgiOYu2YKOWpiod/NiQvHbDLpF26PYb4Z2i/zo3paVzbFMExd5tlRX2Krwdu0+ZLzDsmWhgAIGY6UveFCZAACb4Svdt/rf10RWHCuE0L0qI+VoWjW4IPWBz+Tw7cl9ynCPrzLXLtaE7Gn1KD3Ztmh9GIHGb1Ed1YR1qLT/GdPli7oyIMm7j8i6OTVV/8zocEplddy2Lq0Zc+aMqy7R+/KxSMmeGlm2FBxscDO1T+32EJO2q6ZK1qvEVfZmwSDP33iU4KRSqtBWKcg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(451199021)(4744005)(2906002)(2616005)(36756003)(186003)(8936002)(8676002)(5660300002)(6512007)(6506007)(26005)(53546011)(478600001)(66946007)(66556008)(66476007)(6916009)(4326008)(31696002)(86362001)(54906003)(31686004)(38100700002)(82960400001)(41300700001)(6486002)(316002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bW5iU3lCSjkwb0M2bjR2TTRXbnZKcGpiS0NwTWp2ZkFnNk5hSjVmMVhQbjlG?=
 =?utf-8?B?ZkRGRkxLbUIrejNHZWxWa2dteWpuM2FRaUlGMDQ0ZWNqN0t3eDluVG9YTHRX?=
 =?utf-8?B?RFFmRE11cnZRZHRwYVVES1owTVFKVnFjajFhVXBNNGRtSEJ3T0NJQ2I0dDNn?=
 =?utf-8?B?UDZ3QUNFYm05aG1RY0VESWljcWxwUnUrVisvOVF2K2thKzhmZjdsdnRMQ3BG?=
 =?utf-8?B?M2ZIaVdLZm1BQTF5eUxaajJ6Wko2WHpxZHhGYlRGYk05UXMwdmRsUFN6KzBT?=
 =?utf-8?B?VE5pN00vdFNZNHNVUUFVT1c5bHpiVkFMbGJidDRlYkVxMjVCZnVTTndTbHg3?=
 =?utf-8?B?ZjdFb2VhWlUxL1hGT0N1L3JYWXNqbHhEL0Izd01wVmNDVVI4Yi8rOWRlaHVx?=
 =?utf-8?B?K2lCS2E4bm9UZWx4M0hKZDdHSFdtdWF4Z1gxTjFXdWhuWFE3V1lKL1htU0pL?=
 =?utf-8?B?elF2WEpaaDNBdzF4T2J1Z1lIN1d1Zk0wQnpDRHJiakVzVGVVS1RmTHBTYnlX?=
 =?utf-8?B?VmF0aEs4L0U5M0lOSlZtbERQT01uRTJxRFpJQm5Id2oyc3JnemtRa25zdlgy?=
 =?utf-8?B?UW9Sc21jNHhndGFOWm5xcmd4cTFLb1NBdTd5T0dsZThHRnpka1JUTXVIVG02?=
 =?utf-8?B?MTN1eDQvNTVMMURGekVzQnQ5ZC9ublpnS25IUG5EcTY0eEZoVlZYSzJpMUE1?=
 =?utf-8?B?N0hPc2lqU2xuVW1za1h5aG41d1ZUQmloMlVQaThsTHlja3RvR3krdkZhL3J4?=
 =?utf-8?B?elZKemlwdTN2Y3FPNjJzdm5pRDdPV2U5aGlXRmRwaHg2cllEY3RsbkllUWx4?=
 =?utf-8?B?QlZsZmY2WGh3Szg3dlkxdDRxSWorTThvWWc2TE5BcDlES2lPNzRrVjNKV0or?=
 =?utf-8?B?R2tyUm5pTzZ0dUp4cTJRUENsdEo3WFNUTEMwdVdtUzhWT2dZRGpoMjhmd3Y3?=
 =?utf-8?B?QjR3NDgzMVVNM1ljTFY2d2piL0U5WUlYTHN2ZTdVMUlIZWZGaFpQZjkzRVRv?=
 =?utf-8?B?eDBsVWRQUkliOS95UnZHVHdyOHZlNHdaZ0VVSDhxSWNLUDkxUk1ud2hsQ3Ny?=
 =?utf-8?B?bkUzRHFQa0VPbDZPQktaMVJBMXp2SkVTUWxaelFtOW5wWllvOGpNM2RIa3Q5?=
 =?utf-8?B?dHJKU3NxSTNuek9aNUhrWWd4L2VUMHU3ZEN4UDRnMFo0dlNmZE5aWEZZTmVh?=
 =?utf-8?B?R1pVNkY2M1JmWHhCUDgxSjBhQ1RyNmltR0huc3FrVi9iV3NzRUkrenJEWFNF?=
 =?utf-8?B?U2l3WEg4WUkwRlRUS3pxTmUwakZ2cmVwY0R0R3htTVdjUmZ5Ly93UnJIbUti?=
 =?utf-8?B?bUtiV2hIY1JlMkJ1Z2hzVklsTGZ0WVRFS1ZnSktrNjdDRkJiUHhyLzZ3Yk9Y?=
 =?utf-8?B?ZFpGdjltMGVnMDdVUFMwTWtrS1hEdEJVNlV2SDBreEhaeDR2YmZ3cTdncVVj?=
 =?utf-8?B?V2lEMHhFazVhM1VMYlRXdThYQWl0Z1NpaXB3YzAwN2krU1J2SnZCSWVhb1F3?=
 =?utf-8?B?N0JDK0lJVEJENmIwcTY3Nk5WY1ZvZW1XWXFaTUhiUGV3QTZCOHZ0T3pwV0Zn?=
 =?utf-8?B?ODVLVkhrclhCYzdpOUxNbUpmZnU2YWYwUmREMDFxNzlXUGxiS0VFMklSTjdh?=
 =?utf-8?B?aUQ0NTZOYVZUUEtndnUzdmhzUEJSenZKU3JESzBybzVLeEJ2YnFVckpiZTdx?=
 =?utf-8?B?T2xUSnZRR3lMRmo0S0huTERaWlVHT3hQdnNJaTVjbGJMQ3lhU2twRC91VmN6?=
 =?utf-8?B?OFAzTXJCZDc1WWs2VXZSbEtnVGV3RzYyMTNGdXVZL1BTQ1Q3ZGlNeTRxckRD?=
 =?utf-8?B?ZmJCa083VGoxNXBsV2xqckZEUy96QW5qcEZ0cEZ6eVFROG9pU1FQOWFXc2tk?=
 =?utf-8?B?VUgvWjVjejltYWdpUi9EanI2NTF1akFsUEVCL29wNEdDQzV0RHpjMW95UWFD?=
 =?utf-8?B?cTg5SEh4eWhldHdrOUc5YUNuMlZtOWxZRUYxT080bGM2M29mUmRHS0xJVmt4?=
 =?utf-8?B?MGo3VkV2OWRFUTd4M241T3hzVnlQS25XL2o0dThQQzNQT2F1MGNsYkhEWHZz?=
 =?utf-8?B?M2JkYVpjQ1hXb01JN04yUkRsNmdCT3NxaTFZUjRjSFc4NUZGYWsyWkQ1ZnNt?=
 =?utf-8?B?Ni9wdzVEbHBLaXFBQ05XekxveC9SOEpYM3BPNHFMWlpLTzhsSXIxYVVjZ1pt?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	z8fa8rnWWLYU3LRt5HFYBL6FkH9eKfoXtSaiZguAhf+bHEX17Cq0+w4xIxHiCBsk+ZHAXGo34SY4ZthW23YrBpZceH4Z3KU0GSYKlyltkq2XKZvilL9FVxdPhgDlS0uREEabY15iO+NxVskSfUVoBMll66f4Y+y39HTsqeOryOlj9v1oMNwWo1D2UzDB7u9JE4nzXMCGtXc1ispnMpEfEq+j8D76aN2cQ7yQ0A77cYdre+gdxjOF7q9oj1U++r7eONEuKfvYVWBh5r/fGkOhH1Z/ZnoNG/1ENqDgbLZZGz2UI7rm5tVkJw9kFwRc3f/TDmuwEbTPFhooe2z2BIRBuNfRq6gJGzTGx15prmJiSDLZYbQ0rAwgB4rldBVSb5hdU/cnxUbAblweiEtykWQgkLE5BiA9VTAqturZSwOdm6MYHs9sDenTfCHtWMI5XFuea5USYREBta4IKvZLsZ4VhrxUkqGe4IlI2Y91tcVrkoxr+nB4hzxjg7W9SxSmwifpadpu+A1i8/tOTh6Eo5TEdUNgZ7DWjWmHv9mqvzXf8aCNufRZ5S2MLMh1TGObzYQKDViVbmZockE933U5RNDNKIldhtcXYx2grsofsyAo64jQRn2cIPBxBm6+mPWvPlXmoSpRtoEPGrK5SQfatikOD1A9ILbwMGitEI6oVu7SHeDmMXXi7vmPAeNQp1+yOa/zi8sGHy++Br2DRfZGYNk3dqbFPPhl4MkfnnG3tAXt2QoYewcfh7eblcXabZg0LPqZgpb3vzfCBoPRksahWCebFzjhl420c4MOKHBTBc9lh+WZpViuhzWK262nchiuJteK
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f306be-53ea-42af-88a9-08db5c5f9cbe
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 14:03:12.8268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMvYFQDNCC7iEMzOTVgIJnbpcyyKsO7NeMAExW9rfxj1If8SYcIjkHhrmFoyjbeVgmQuiW04suaqNRbeC7DXyU8jyO4E50tm6eGzVgwGny8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5462

On 24/05/2023 12:25 pm, Andrew Cooper wrote:
> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
> index 9bbb385db42d..f1084bb1ed36 100644
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -477,6 +477,11 @@ static void generic_identify(struct cpuinfo_x86 *c)
>  		cpuid_count(0xd, 1,
>  			    &c->x86_capability[FEATURESET_Da1],
>  			    &tmp, &tmp, &tmp);
> +
> +	if (test_bit(X86_FEATURE_ARCH_CAPS, c->x86_capability))
> +		rdmsr(MSR_ARCH_CAPABILITIES,
> +		      c->x86_capability[FEATURESET_10Al],
> +		      c->x86_capability[FEATURESET_10Ah]);

I managed to send out a stale version.  I've corrected this and the
other instances locally.

~Andrew

