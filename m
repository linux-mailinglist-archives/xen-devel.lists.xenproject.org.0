Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 491266CA96D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 17:44:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515340.798096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgp1I-0005g2-HO; Mon, 27 Mar 2023 15:44:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515340.798096; Mon, 27 Mar 2023 15:44:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgp1I-0005cw-ER; Mon, 27 Mar 2023 15:44:28 +0000
Received: by outflank-mailman (input) for mailman id 515340;
 Mon, 27 Mar 2023 15:44:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pgp1H-0005ck-6H
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 15:44:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40840916-ccb6-11ed-85db-49a42c6b2330;
 Mon, 27 Mar 2023 17:44:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9940.eurprd04.prod.outlook.com (2603:10a6:10:4c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 15:44:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.029; Mon, 27 Mar 2023
 15:44:24 +0000
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
X-Inumbo-ID: 40840916-ccb6-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDCUS1kBOP+zzFb1eAPTvk7HXKQ1YwClEc+ceiWUUHPNV/bZ1qBfl794pF8a+0sh99Tp4WWZHepvl6Yi0Nox993CLQ04C68VTS4wizkgiS/2Y8nEZNF4yvqIn2OkeXSr2wgCYAC0PqttbgBnJPYxOpcqAuAirHCYh0uPcOUjcpU0fCcJnEh2WHL1rri8ufXBXC5PDARtSX063uflTuYT+GEyjHUmzZ+3eqMM4E9GEAXRgo9XWZ4ZISyXNhpjsWuEsGADILsFfgJcFFiZmPwu0QdTVOHAyltierAIvrZfRXdDICAVJkZMrMBSFylYfrpoylw5cQWj5Einm+NG37u9ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6iFoi/hNTfGQYdBRtD95lEI8PTHUKDOfMKdqsgbD1Vg=;
 b=FpgudbK5mi4fQOEb2axCSj6xhdaYwFO1IXajrS0FtDiHuVBaKg2dZhHnqwXK5eBLO0Y7Ork6HXCm/DGkFnErYRUTmH9G4Z/7QaPKNvYoWyWpBywXO7TssEgAs8Oaw7l0JW3lcDZ8Ztt3SB3z5p4qxAI1EYPImeo0pOhCcpWKqxsiLeuf/ezHjn/cDUXGhD/94cB6gc1VE95QeO9iwjCAzio5y/X26sD17DkInPSPUuM6XEzxpsOusUszF2TDcHI9dnqgmkMWAT8c4VghDmwKZVc1Eg3iXW08YR/sTd8zUDNYeqzw35ezzUclvt3NVXn8AO3tI4kCESjlpesaCO5oGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6iFoi/hNTfGQYdBRtD95lEI8PTHUKDOfMKdqsgbD1Vg=;
 b=GlX2/GGrpHp2mrFh/nCuHci1g35l3JivoVrFv6Jf3dnfH4aTfCHyKQidYhvXFOUIRplxkX+96pZmZr08XX960wAyZXsIwWdNuXLRbZf3+yR0PejE63IbSQLRaMwxLwgW+vyZom5oqaWfkmt2kdOq/SYbujumAYmdhWKG8oFMT9Z8COQ6Jl0UAZsfrpL3sia+EkYO7dQ/O88bLlV0f2PPWy2iWLz3yGymJhocQHiT5fDKdv07JNB9m0JSw5Rv/dDJzd3BsbsI6Kc+uvp+/EtMGLKlJ7U5J+JLvO6Jw0bYuDL81lOERQPcf1t+Byx0YczOTKI9KS5nlcPzp6P70PsKfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <42b2a367-d27d-991f-3219-d3800e9a610b@suse.com>
Date: Mon, 27 Mar 2023 17:44:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v4] x86: detect CMOS aliasing on ports other than
 0x70/0x71
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <367d0223-d481-b7a3-3b79-a9bc6f00531e@suse.com>
 <ZBm7N7oEDPlPmZ87@Air-de-Roger>
Content-Language: en-US
In-Reply-To: <ZBm7N7oEDPlPmZ87@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9940:EE_
X-MS-Office365-Filtering-Correlation-Id: 2900ef22-0d7f-4eb2-9d30-08db2eda23e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FJL+4paDoXg/ycVNf0ysJhsr84sny++jvoh8V2OjhcDzmxEpk0WyXp85M2bpKU/t7ZiXMA47oUZyIhWQ79aKT8eNLhIftaHSOGt1z6s0nERKlDT34k2ar2V6e64OjirLWyC3Qamvco6il9Y8saCwrjcMjBAIsxdVDulIfOFJY5el3Z8KG4BpxOHZXKwaQpth+1mlgnD1FgyRek4D/sJRyFSwmGmFdvFyL0MjjFX04qmRhw3Yz0+CcZD27cmYHR/Uo709MaN/57po+uZ6pVCy/06QayFFBlT+CYJq1E3XQvGSG11Gul4+LeGnI/dcclhgH4uaZ9yUTe45qQSB+BoLQvWIexw0tGcNWwvXEAHpddNbCvoF9O8wX1xw0evjmIKSBboejwi1j6S0mKBNp6rUD7pE7tSeQxmVQzhM8CrR2PpfKJkgd7/weIMEO+wWURRSkNPH/NlsA63u7GEjW1E8ngtxP/MZQEBFba7gJpcRGbXkIFcCWW5Igmc6z3cvmnLA9z1VVrWFN7wknV7o9IGJ1bm68EXd5/xtjRn8mjq2aKTpRGXWR9Jyu2NRoRXU+uLyWjOaazfIDega/dX+mlEeEftEHvjKmFovb0AxbE6cjrIodZ9xXz5SmlgsYFS5fDNcOyGrlgemwVcwrR5PldKokQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199021)(31696002)(36756003)(86362001)(38100700002)(2906002)(31686004)(478600001)(6486002)(83380400001)(2616005)(26005)(6506007)(6512007)(6916009)(66556008)(66946007)(54906003)(4326008)(316002)(8676002)(66476007)(186003)(53546011)(5660300002)(41300700001)(8936002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGtMcllyZW1GVXR3QjVzM3premdURG51UzdaTEd6TkM3cExEbEd1UVRidTlV?=
 =?utf-8?B?VVpyOW9wZUxNZitJdmo5cDZucDRhZDVqTDRzREF3clNLWmpkSlhhbkVrc1kr?=
 =?utf-8?B?Z3ZTQlF6TWhXblN0ZmdBVnlZZDdVaXc4R2VuQ29WSzA5dFg0bEpDWlZGME5y?=
 =?utf-8?B?TTVVTEpIazZmd0lZMEdZTldIRkptem5PNHpUbjhSR3BtbE9YRHlkemNESDZU?=
 =?utf-8?B?Y1R5cUFOOFBML0pHN3BPbkVhWHFvbVZIenpTZlNWUm9IZmM3WHE1MFBGS1dq?=
 =?utf-8?B?VHZGYkxMRFl5VXg3Z3phelBTZTg1ZmlISm5XNkpNeE5xMGxwNWlFUnV6Ukk4?=
 =?utf-8?B?eDVDMXV6MWdTNXJ1cFVsczFGVks1SjBiUDBSMTJBY0twcVRjcVVubDdrQVN0?=
 =?utf-8?B?NnBDOWwwV3M1T2o5RVNoaXJCYmp0TlF4M3IzY3B6djkyTDRhdHhGbFVoTmRL?=
 =?utf-8?B?Y1JwZ2g4YnRZVWoxd212RWZ5azNrWURURXNnRTZyTmx5ODJVc2l2VWhuSVlV?=
 =?utf-8?B?QlY2SzFTMFQzQy9EK2crSndxQld2bC8yaWp3blZoMDltYmY0bEw5UnRjcWl1?=
 =?utf-8?B?Q2tFelI0WGRyWGxlRjJwL05UMjhGc0FCbDhkZ2ZXOXhnUzdOOGNQbWxJM1pa?=
 =?utf-8?B?ajNKMEs0UndoYzB1SkVtdk5QSFp0TU52RnBkcmdNWm9yMzhoUzFUdTdHMStK?=
 =?utf-8?B?YnVZQjFXOHJScjRWZzY2UFRneFFTUE1CK3NlcXlUN3JuMGFBRkI1eFdsa0Qz?=
 =?utf-8?B?Q2JJQnk3RnVobXFXdW5WVUUwemF3VVhGN1BweTBaSHFPQ09LamxDRGJPaEs0?=
 =?utf-8?B?ZE5WRXRMU2E4bEJLUXF0V3lEd2JTYnhYaGNhY3BiYmh3MFhOcFFONVdLTW5n?=
 =?utf-8?B?ek5WMUlpNTcyK1lTbVFMczE0T2hmMG9rNkVNSEFXQzBMMlZGMHRtaTN5bDdu?=
 =?utf-8?B?TU1WNlBSNkh5am5qazl0Mm1rcWp6dThQQmtMdTRWTEVRbXVkZmpNTDF0YWFM?=
 =?utf-8?B?S1VUM25hMmlDRXBsb2twQmwyRzZoNWE3MEl4VWZYQ25OMWJTa2dRUHFqbjRk?=
 =?utf-8?B?K3AzMzZFYXlWRVlSOEZhdFE5SmlpZFQ3bnlqSUZNajBobTBRa25FWjlpM09u?=
 =?utf-8?B?OVMrQ01FUThOcUtQdFJVaDhUNkh0ZVp4UENRdzN1S3dFVUR4eEY0RzVVTlRB?=
 =?utf-8?B?OHVpWGlXRmRZMmdXaU1QTWhYZU9LamlCTHJMRHl1bktMRTBzWnFOUjBQOVpH?=
 =?utf-8?B?TjFPSHdJc25kS3FJV1lER1F3RGNvRW1GQmFTYlZ2QU5kZW0vdDArL2lqaWxR?=
 =?utf-8?B?RmZLT2pvQXRKaXd5b004TEs5NkxiOEpBZXlvbGtQREVUendCQUxnbVMwUlFO?=
 =?utf-8?B?YzY3ZUlQNmh5K3F1ajdycWVjN0VtK21nWTNEekFIOGNoZW52RGJPY2pKY3FR?=
 =?utf-8?B?eHp6K1NIeU54MzNvWUlJYnpjWngrNEJyaVpJNkVUV3VJbkhDc0M4K0hoUDlS?=
 =?utf-8?B?NFNLUEk2dmpFYm1lY3hWZkNLdCtRMThUaEFGbnE0OEsrMjZkU0FXTTU4TExr?=
 =?utf-8?B?eG1zamNVTERFRC9VWjV0NVdvcDhZTFg3by9uY0lIaGVISWd3Z0pSdTZOcC90?=
 =?utf-8?B?em11U21KM09pd2FaTnp0c04rTnZlSUtmaWRJVFY4MDJiSTlwNjBaQUdiVzRl?=
 =?utf-8?B?dStJazRGZXBEZkh2aE5rTXA5UnhPOVNCNEloRXBiOU9BcDdMZVRxazB4ZjZB?=
 =?utf-8?B?b1VJUnlHUHAxWTh6N2Vra3ZpN1RaampSVmJsdG9mWEo0UlBsaXhXR3V5b0VC?=
 =?utf-8?B?RnNXM1dhRUpYMVdOTTA5NjYrS2NyM0w4SUVNSjBlcFdpUEZrNXoramlyT0x3?=
 =?utf-8?B?Q2hjWGRPNmJjaFVhUGNXQ3ViWW5Ca2R2aFpZVndUdWErZDkzVEVXdG5Qajh5?=
 =?utf-8?B?TFhPK0Mxd0t3SDliWlV4NHo1Y2tHNnlYMFF1bDBpcmpJbGQwWEdVQlovL0lu?=
 =?utf-8?B?WTBDbG51SjIrMlFLbGtRWnZoSzRYMmp3QVBtbUhYWkFqWllHWitzeVZnVzNU?=
 =?utf-8?B?SFR2OEhTYTVaWE1zN0V2OUpVSmhwRlVXUTdhVDVOd01WWFpBb0JCOEJDc0lm?=
 =?utf-8?Q?5iF0XRk29mozCcnv9y3CPjd9C?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2900ef22-0d7f-4eb2-9d30-08db2eda23e0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 15:44:24.4754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pl7f3lxPlxhlMG760ollMLSBJLdmMwLZGnJzn+kNs4md/NTRm/8TTCwKUOOfTrBHeUw5YcQHIMROMsiNKP16QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9940

On 21.03.2023 15:12, Roger Pau Monné wrote:
> On Mon, Mar 20, 2023 at 09:32:26AM +0100, Jan Beulich wrote:
>> ... in order to also intercept Dom0 accesses through the alias ports.
> 
> I'm trying to get some documentation about this aliasing, but so far I
> haven't been able to find any.  Do you have any references of where I
> might be able to find it?
> 
>> Also stop intercepting accesses to the CMOS ports if we won't ourselves
>> use the CMOS RTC.
> 
> Could this create any concerns with the ability to disable NMIs if we
> no longer filter accesses to the RTC?

I've added "..., because of there being none." If there's no RTC, I don't
think it's specified what function (if any) port 70 bit 7 has.

Jan

