Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE56735A1A
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 16:54:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551154.860522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBGGx-0006kk-D1; Mon, 19 Jun 2023 14:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551154.860522; Mon, 19 Jun 2023 14:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBGGx-0006iL-AF; Mon, 19 Jun 2023 14:54:27 +0000
Received: by outflank-mailman (input) for mailman id 551154;
 Mon, 19 Jun 2023 14:54:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBGGw-0006iB-42
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 14:54:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20629.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2df91863-0eb1-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 16:54:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7467.eurprd04.prod.outlook.com (2603:10a6:102:80::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 14:54:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 14:54:21 +0000
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
X-Inumbo-ID: 2df91863-0eb1-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpF3ZPRGJ8DeBYv6haY8X4aBwtE0g7CiicIqTFuN9fU+fjlcvDD5EI5a8XeorH/liOinXQUn5bTE8t3ai6zsCTIheIJl4acfpvLZVmrLO1tfHqmtl+ikF1Hki7FxR9EpHKBhSmLR21r86czX2jyYSUSdhSpJvFyfKiR47GYXZ3OBLNmnA7symz+IeK+PBVmhrSYgwAzD/UYVDlH4RNA748ius/yJfSuXvG2SDtkJEubWS5PkHATJ7D4/0MrI6MWsJgqS04OetfL7vPCJjb2HUNN2DBAEI6pQ0Gg01jgKEtTwbaQIGZZjsxgbQSx/FhaOWY3gV+GlvjHtSWTtHRHXjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFGjCNmT98+Oxv79gkK71c/wS1nDauxB+D+JaV3HcjA=;
 b=cSE8eypah2/G/BcLkWXx84Cc3Na4hD7XAdh1fvrt/PfB+4O/jjoAssJ34VyGhWE0QTRcmzqTBIWG7o8hzLn1uS2Lw5jWXfbXeKHnlPSiYApD1zLncU8y99egBILoGmQnJ6Ik73Ahyb+J9sWtUYdrEsUmLmZPINPXKgiRgtmK+K44RmNA0lHhGb1E0SItTCR3mV71WtJVYNxoDV1wHUbuiQ6Oel6vJADcuEKLE28SexcmsXw/7Z/tKvDyQjOrdu5PAwVipmFcjf073QR2c9AIMgUWobmf3ecBujbzTIJFleNZ+3ugiHRgHPxDBIGVBK2ZKI+vlN78FI7xkGcdBN4jLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFGjCNmT98+Oxv79gkK71c/wS1nDauxB+D+JaV3HcjA=;
 b=Zlg2YxMQhC9ERsKqnfuYer6/4DBRQVqEvEnnGucMqgItjBMAi69twSuPZ6QxCIxBxVRRumpG5AcGmMbHPgaZpoPPBfS1ZZUB1dKW/rR0B47n2r5PjiGGu29VfHzRJ3jFEHb+zYSmZCtkkzkcYaCY0JiP971nbLt3/M4ccjZVOLAcQ4lzl1XEOZrUHXc0ksMZqqB3r+hWACL4po+CYF/TsZtSMaYOB2F4EgIEnQMuwGxDce4Kou2tE2LerdEJnFnJOeF9QOcwJ4fbVvuQiKMGkiUX3zLv2Bc/4Sl6YPYjcEtd441kReh6pzLcu0kthAovoxfVArZ+QOEk6tuhiO+NtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d11dd297-1db5-3e59-57f7-5fbb3b9ffaa6@suse.com>
Date: Mon, 19 Jun 2023 16:54:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 14/15] xenpm: Add set-cpufreq-cppc subcommand
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230614180253.89958-1-jandryuk@gmail.com>
 <20230614180253.89958-15-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230614180253.89958-15-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7467:EE_
X-MS-Office365-Filtering-Correlation-Id: a76fa6b1-4b87-4c96-f61f-08db70d51063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TATGUxxM9WqWPcUtwlaw1mMplYEQWVgobwan/w0BUzhwwp7uvdZ/Hkm+LbXvy2di6Z7ocZXP9KJl4iSj89ry97eS16rOWQKMRT9M0qZ/CyrAHuICAPzdE1MELsn5s8WGFx/eoGo9dVEd/DOTWG10+1DfLw1VP26vhvWB0zZH3IMbxjCQKStqjq8zqdMCOeK+P/PWcWs7a5X5yyCzeYrDMoe6/P+OHl8Neb5ZASVOskLzFJ6ocTpVYX33V+6ZE6Bj/w5LsB64f7Cl3SvHtgrDxF7wh5mY2hb0naj1dANsTDczBaxmHV0G0mZEPxdgcRftl5Vtt1Or17CGgWVY3s4IATL9p/x5RZOxQR0q6vHipODiGljqkwJjhDNe+6sN0fk2cHddMSaG3h53IIb6rHUt4XDbpWZDp+FHPPVClS5NBvpsWH7DYv7TMIqOXwI+Vb9Mqrgvn3ODmwQzX+XzdoAdaZnPGKYe/facbD9oizSdFLqCXecMCGpoJUCUCxKtK/kFS/mWsawmo77SIo07ZATSroU1Et+aTXIAo52MoeT4u1ZoGUC0tGeQm620Ydk9xp1b5qFxcgHOiztzpRpbjBnb+G/bTTauAL0z1HPKhfQYLaJDsqhf+rsTXDd9s5xn0ZVUydz9rcxUbMjOynrWVdjJyA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199021)(478600001)(31696002)(86362001)(6486002)(316002)(38100700002)(66946007)(66476007)(66556008)(4326008)(6916009)(6506007)(6512007)(53546011)(186003)(2616005)(26005)(54906003)(31686004)(41300700001)(5660300002)(8676002)(8936002)(2906002)(4744005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEJPaS9aOWZnSCtsc0NTRi9sTEM3d1NRNHZpdnNhN0IzQ2crS01Tb1Y0ckJT?=
 =?utf-8?B?Z1BZK1h1S1U1aXZ4cGVKU3pLZU9PYkNMRVIra2ZWMzYvOEU3Rm9UVStPek5C?=
 =?utf-8?B?RTFBYVhibktReE1RSUFlUFdiLzRTMFdNSkhsREhZZkZISzdvYUpMVFRya3Z5?=
 =?utf-8?B?YUhhZUpxS2tCWENqVTZjMStWYmZhWUdrYjlyQlNnS0RQa2ZGT09ET2pMZ1ZR?=
 =?utf-8?B?ZFBjTTdTU0xrT2ZVd2hJTWdLN1B1Wmd0MTB5anlEZWtXNXdBUjBLYythWWRi?=
 =?utf-8?B?b0Y1dlMzWTE4SXdacDVnQ0s0Sk9oM0lYd3VQTVU1U3FiS3hWY1IzOU83RGhC?=
 =?utf-8?B?bGZpTUNTZWtEK1lhaFU0YjBkTDhHbS9uNVlBR2RMMVloSzFXNWMrS1QrYXc3?=
 =?utf-8?B?ZFhHMzRhVFNMWEo4SUs2aGpzVmQ2VCswMEpvTUJtWXF4L2RpYmczd2VaNGRq?=
 =?utf-8?B?UkZRWFJ0QWxDY0luVHJibWF0TnJUajZpd0dxbDM3MktHYmNYU09Vbitlelhm?=
 =?utf-8?B?U0NHcEg5VnJFaTdTYTV0a2xXZGhxbWdKUkZIT2dOVlVhU2M0cGpaTHk1Ymhp?=
 =?utf-8?B?VC9zWjlVdVhBMmNyelFMVWd6WkZwcFdhL1U0S25XOHp0dnFlb0p6N2R6RURF?=
 =?utf-8?B?eWhxdSs2dVE4enRFajZ6TytabEloQVMrZGl0U3BtNElDbUM1a1Z1M0pFR01L?=
 =?utf-8?B?Sm5kT1BHOTJyYUxHOHQ0QkVoSUI4OS9QdndFNG96NVBmSEl3UnM4YWVGQ0xn?=
 =?utf-8?B?YmF2aExZSDdsRng0endXdGNkNnlRWk1nY1pQVE1qRjRiNWw2cFRReUJnTXhB?=
 =?utf-8?B?RitlQjQ1YmpJejB6VTJESzU0RHU5WUduQ1N6N0ZicmtwR2hGSFo4cUVpRWZq?=
 =?utf-8?B?TGRQaEJIMmhrZ3h4cDFMaktvbXIvUUJER3loTTZ6UmxVQkg4MWlJSTRGekFM?=
 =?utf-8?B?TVBIcE42R0pDWTRkYzZYc0FPY1VPZkFKVTJPSW8xN1gvb2d1MDZsWmpXNHIw?=
 =?utf-8?B?bzJ1Njc3Q3BrUjU0WnBEMW5qWW52bHBoaDdEamRjaHhVcWVhMndGdm9jTEp4?=
 =?utf-8?B?U2E4T1hNZ1B1UkJyb2pUWWZVQjNPaUxDQXh3MCtXSlZ4d2JldEw5SzE3MU81?=
 =?utf-8?B?TjdmOEphM0cwUlVjMFh2V3pNVzJ2Q2FWL01TaEVmemVFZ3NNNEVBN01uRE1L?=
 =?utf-8?B?RFRURWorUW0rNXdkS2dJSWJXdTMyRWxyNU1qRXYwNXZxUDB1UE1pVm8xQ3Ni?=
 =?utf-8?B?WFJKZXdpZXNIU1hPWHlPVzRhUEJSTWZ0eStuMHNVcHRsQnhidzlUZ3B4TWpX?=
 =?utf-8?B?RXFkQWhNZWVTUnJCOUx0R0N3b3dqZVFBQWVMQ1VrcmZCTUlXbWN3ZHhNc0dy?=
 =?utf-8?B?SVk3M2FlRVJOM2JxODEyaG1GMG5RcGFrSjNucVo5RzF1eU1oY1BmZHVyL2cw?=
 =?utf-8?B?L3JMTld6bURlV0M0MmhaUUxPcjdaeW1NM1ZZOW8rZ0gyaWozZzBqOXBRM2Fm?=
 =?utf-8?B?N0NmQlJLWkFYYnBhVlNnZERkREU4NUI0NU5iYnB1WXRDakJVdTF3WklPaWdi?=
 =?utf-8?B?dmd0aHE3NDBZZ0RUZk9EdURuS3BMSW10c1VhUncxT1QxeUxMRkp3dzZBMGJB?=
 =?utf-8?B?RkVKR2plTlZ1THhvazFTUi9JbnNkMURYWkFEdU1JdWpiSHI5L3hlT2pWallq?=
 =?utf-8?B?UUEwSld4VlU1R3BIZFN1dGRjbmliM0VpaUNrVkJBd2pzL05NbUluRVhORWVk?=
 =?utf-8?B?djUvdWpIOURwY2xBQWUrTU9CdmUzcWd1UXEzSVJqT3kydEdZR2VGdVQ5d215?=
 =?utf-8?B?aGZOVDBET0FxVUwrNEllTStwaFVCR29xNFlFdWRTUnN0Q3JZV3pJVkVMZE1j?=
 =?utf-8?B?Ynl0VHFvUzlSNUErV1hyRGYyY21yYVZ1bGpydEJna3lUTngzOXVPSkNBV1hQ?=
 =?utf-8?B?MWRvQXpWcUhQTFgydWJ2dGc4TWVZZUZmdUlDb1h1Ym5Za04rSXZFaTJudlZ0?=
 =?utf-8?B?WGZPbUk5OG1Ga3lnRGRXVkpEWXJTTnRTSGFtQ28wL2p3K1pkandMbGVsUXR1?=
 =?utf-8?B?YWs1cTFoTmkvQ3BaYmRLQkFaNy9oTmhlWlZFUUk2ZGdTN3VDRmZtZ0VVSTVu?=
 =?utf-8?Q?BQMEebnhmOGm4QSWLgLR5nYHV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a76fa6b1-4b87-4c96-f61f-08db70d51063
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 14:54:20.9626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o11b2xMaRmPHJ87Ltjmoo+Cmi1QHXiU0FND3WYN4HdhbNHYbWN97otwouOuNodEH2R/a/X4BJI0z5Epc9Ir0MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7467

On 14.06.2023 20:02, Jason Andryuk wrote:
> +static void cppc_set_func(int argc, char *argv[])
> +{
> +    xc_set_cppc_para_t set_cppc = {};
> +    int cpuid = -1;
> +    int i = 0;

While cpuid needs to remain of signed type, i wants to be unsigned int.

> +    if ( parse_cppc_opts(&set_cppc, &cpuid, argc, argv) )
> +        exit(EINVAL);
> +
> +    if ( cpuid != -1 )
> +    {
> +        i = cpuid;
> +        max_cpu_nr = i + 1;

While it looks like (ab)using the global variable this way is okay for
now, I'd prefer if you added a local variable instead, such that the
global can retain its meaning. Then
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

