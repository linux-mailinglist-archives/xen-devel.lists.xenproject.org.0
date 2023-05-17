Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DBE706B51
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 16:37:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535932.833993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzIGN-0007D9-I0; Wed, 17 May 2023 14:36:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535932.833993; Wed, 17 May 2023 14:36:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzIGN-0007AZ-FA; Wed, 17 May 2023 14:36:23 +0000
Received: by outflank-mailman (input) for mailman id 535932;
 Wed, 17 May 2023 14:36:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfpx=BG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pzIGM-0007AT-46
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 14:36:22 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fe8468a-f4c0-11ed-8611-37d641c3527e;
 Wed, 17 May 2023 16:36:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8264.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 14:36:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Wed, 17 May 2023
 14:36:17 +0000
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
X-Inumbo-ID: 2fe8468a-f4c0-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNkLk+xdINQxh/bMoUOl+lBOMmM1LtoHPgedHqhY8/447B2jpwCQw55MUVBhGI85oIg/9hYX+ut4yqoPSrWHTnBd0w53BfrdhHx08+ycLGLWrkFBA83YUvem8Gcg6jXAl0zkS7YW81sGWQSKp3oP8RqoL+FK3ylebbJN4dEGX6QrdhjSSfHhRcM6GYWhQC4yzK/0Hfu3ORcrv1awvQS9AFklNxew9lIIHIBH+RXUtjGNN5D0MVpDArVYuCmzYzvpg0l0aDYJXml8xP8FzKRBKg/SWGglbcuqZT3WA2+MLzl67WSQ7XbFY9LnUnZqXGbVCuwaI+59mbbHVy1ETvDSWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qxdf760ncPbPV6iltS8mo2G3uWsOOuPjPTs7ZIt5liw=;
 b=G9pw31PNhrqfzmeP4clMvo3/phWQyDSvikn0G4W1TpKn/YI31a4DFJ587hA1PU60PbcClS9qwlmLZVJQiL4gn2Q6ZkgSHmdeQvbZQIBEGYnOSp5Qsc6hzWzFlfnH4C2UUu6NxetGXKYk4o3lqckyYkq0ABB6yQVbQRfe2141FHT+511NdoPDSGartFJ+5llGF4up/OIFlaRWXpU385iacCDeSslzvWslDxKGRqYcsENCScUVcf6B+MEFlWXVZm0vCH5FegHOV7tgwteyPQxjcekhE6Uw9FYYwuJPDMJ9o0JgMx3x6vEM7kr0JWPVRQtw11EUatF9eBPANYmYPHP4uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qxdf760ncPbPV6iltS8mo2G3uWsOOuPjPTs7ZIt5liw=;
 b=jwg0964lV5dFA/b4SmyhDqpvEYi1SjR1WxtGlBVBUG9Ba00CKGqWPHyHDU4+MCM8zT/z+ChOBLdg2KKXUgagaGNqnnI3U+4LaE56ldRuc9TGpgOulNkDy4MFNA5g8Le4J4WljAwV3/2oVn7VVTp+JjLIPphdqpYrGmnLYqv9gzZ/Lxu3XM1sthm7j5Qlx2GoDYyd7CgF/7f+yEz/hYv9gTyZ+OVNXjF8WdyUqZ49kTRbibrvszmoHcO+8yOWJr7r3iX5TBIJ0bV8xhuv3H0ThGrsMzEjOgH/ZDDrjwu1KnWwMiX1wXc4FeM3YbVfCs+7D3TFwWqoTn6GydsrlPmVow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <54560de4-1c55-c7f0-61ad-84d1e71e47f5@suse.com>
Date: Wed, 17 May 2023 16:36:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/4] x86/vtx: Remove opencoded MSR_ARCH_CAPS check
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230516145334.1271347-1-andrew.cooper3@citrix.com>
 <20230516145334.1271347-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230516145334.1271347-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8264:EE_
X-MS-Office365-Filtering-Correlation-Id: ef7e986f-0813-4590-e377-08db56e412d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c7MFCkoJtK1r5pxoVSIN745Q99FaGJ0XvIBtHOWcQJWTfxq/4W+Wt06d4McddNwAcmrIXtTSd95Hxy82u+pHTsAdm3D+zbNoN3lZdIBPjMvRvXl+7YvtJuqDFbIYmzCc6HYEE0tGHGQmxYAcfcjCW+FaL+x3RKsdmaSAGNCbVfLwW3UBGUXKZHwBgnhS6nYu0SfhjAoINLwqS7y3wIztMDPA+hd15exzICAUlXXSk+i5x+TOKhzUOiP4T1JMZVIA8BqyCa2eYuZhJhuyrqKl8DGOIh6J/wUutSlniNprffHXC30ijnRqsyjoEmaYG1vYJPutyQjvB/2j6b18CW59vjLsYdHqDP6RFDtoGteX6meegQq7pXl7Q37oSZzWgDQz4q/7LCLcSEkEDc2ksYNfWitgcizZzrjCAc6HFtvxiOjdTDnGF3cWI7e2xzBUWt4Ti265Zj8Rz2CqxycwMathGNuS0YY7ScptZ5J76AwkoqD3+zo5WRF2mL0KBEQCPn++/5sYmFF+Y0BTdc4gA1PC1QM6dgbRXakBz2iVIJfXEXz4eUreEvSftamdVKY0iqYKe2m9P5+GGBjsAu5aSKOyYqVIH/4/HfEESY2OA5dBt3SQdX227STFBMlucEKZ+IQxCBKQy/JnOCegMD37YOPDiQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199021)(66556008)(66476007)(66946007)(31686004)(478600001)(53546011)(54906003)(4326008)(6916009)(316002)(6486002)(41300700001)(5660300002)(26005)(186003)(8676002)(8936002)(6512007)(6506007)(2616005)(4744005)(2906002)(36756003)(38100700002)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDdxUStjMUlGc2tRVEEwWWoybm5yZGNvNm5XUGwyUytFWklMUThLNGR1VjN1?=
 =?utf-8?B?WFBZb0FYSTdxWUZxdURXTmJCK2dwa2ZSWWhSSjMySk55cUVuTEluLzBPRFJH?=
 =?utf-8?B?NWNDbVU3dEJ2eVNXRnNVNWtpaTRZczhFUThFM3lWcHpzU3BKZVV4WkhWL3po?=
 =?utf-8?B?cnZxMGFyN2RUMzE1bElxckh5dXZscHhlYzlnNkZXUlp0bERvcDYyVUJRZHBR?=
 =?utf-8?B?RlNJam1CbWZhMG9KWHVITmhKVk5ObXk4WmxxaXdlZlh6R21Hd2FVS2xvZ0Rx?=
 =?utf-8?B?RHg3eXhPT01VT2JzbTJOcFY2MHMzNkdnajk5S0ZUOG9JcU0zeTZrL3VMcS8z?=
 =?utf-8?B?d2kybC9WRkxCdnhVbm5iWUVxdzdZQStndUJlYzlTdDJEV3JFRERudlN5V1B3?=
 =?utf-8?B?Tk56emFMTFNuMXVXdXo3R1FxUzExVm1iWm5KWjQ5MDQ5aUtMZTJuR1VMUndN?=
 =?utf-8?B?OTRiUk9RUjlKN29LaHM3QWNWd3Jiczd0cFFyVXRGRllCTmgyYXhOTldnR2dm?=
 =?utf-8?B?RCs4dG45WElzZzNlczVkV0RUYzlla2RoLzVkOTVQZGczZHkweWl3dHNBcStU?=
 =?utf-8?B?S2RHK2J4MWJDbnRRVDZGakhyVXgwci9OcUdoNEkwcDAwcjNvbzMyNTJscDhx?=
 =?utf-8?B?YkhzYkwwZlo2SlhsRHpVUGVHK2dmSkFMbFVyR21RMkRKbUdmSlpLckxEL3BB?=
 =?utf-8?B?SEwxWjEvK1lFNUJ3b3Z2WU5hdnh1dkVoZ0R5Tit1NFBPeWdNNXVGNmFnL2RW?=
 =?utf-8?B?T0k0aml6SkU1UXZ3LzhRaTl3dmtNWUpQRUJsTCtZT04rWm1Fd2tRMEdsUGNw?=
 =?utf-8?B?LzhZd2swUkxpY2JzTWpURDZyVytTTUNLTTh6dC84UTlSdmpINU9Lclc0M0Y4?=
 =?utf-8?B?QXZoNDlyY1NNNVVHODJkYUovdHAvdnphaUpZQ3J5ZUhNZWhqUlpENXhsR3Zk?=
 =?utf-8?B?N0dsM3N1WUdTdFdTOXM0aWRVdmhKQ1hyRDFjZlJjMW1IdGVMNjdFUGgzeU9W?=
 =?utf-8?B?RWlOcEdMbEszemtSNUwvcWpYaDhlbkZsMW9TZXg1dkR0NjJlZDZaMHMyS3Z5?=
 =?utf-8?B?RkVpbXFBNTEvOE5zZUtwMU0yUDZaT1M4eUV4MkZ6WnF6cWlaRCtiOHpVNi9M?=
 =?utf-8?B?bktlTWJ4bW4zTFhvenJrZkxFOW84ZEdTUzVmeVYvTE4vYWwrbjRhZ2QzanVD?=
 =?utf-8?B?aWRWbjZRWSszZm5nV1phbDZZY2N6bWt1Y0UwSmo5UHQ1V01QYlJZS1R3RWxm?=
 =?utf-8?B?QzliZmtBVklEd0RvS201UUVzNEdCemdRdmNDUnBnOWcxTnZqS2pHNTZKb2M1?=
 =?utf-8?B?NFkrbjFKZ0hLT2RWT0FIdTB3YVZQSitOeHk2bDNyMHFnRW5CWFVnVFFVaFJZ?=
 =?utf-8?B?VWh1Y3NVUHBPU1daN2hIOXZETXdkeDZjd3NMMWYrZHhSM0c3eXNzMjZBVVgz?=
 =?utf-8?B?NklrTTdkVHA5VWNUbEg0cmZvQXlRQWRtNzJMUk83YXVNMnl1NEk0V0JpMm9m?=
 =?utf-8?B?NHJtZCtnV09zWURrYVpzZ0tHLzZTYTl0SFo0T1Q0d21EUmZrN0c3dUdmd1ph?=
 =?utf-8?B?aFZkQXNuT3lFeHRUU2ZEU04xaHJQTHNyQW5Wcm90UFluRXJvZ1FDc1psOTY0?=
 =?utf-8?B?c2NzSWlwSENKYWFxSXhXVFNPL3QxcTFNbXZRWFNWMFp5V2x2WGp4NDlBRmNI?=
 =?utf-8?B?YVBod2QvTlk5bXdocVlxaDh4cExpdHZkM21sRGwrMjV4RkR6c3A2Z3owT0dx?=
 =?utf-8?B?N1p0RldKM015MENJS3ZwYUxKRXN3VC9yc0J1cG5QdjFPSmJNQnM5bGFtM09o?=
 =?utf-8?B?M0taQXloV1g2ZXkzYklSZ09iS2QybDcvem9vQUxqWGQ1YWNDM3lEMHh0bVpw?=
 =?utf-8?B?KytacS9OcEpDYmJNdGQyYm1sY1AyVHQzOVZEb3Vtd1AyQWsrYkdmWUVRSjFa?=
 =?utf-8?B?STZIbjV2TU12Z0l4TUhtajlZTElXdVBTMmxGcGZmTzA4eDl3QWRrM205aTJC?=
 =?utf-8?B?R1RaQk5PK2tzRDVZcUVmRUdVbmJzSlk1WTJFOEtYNktYRy9RZVpCdVNXUW5Y?=
 =?utf-8?B?R01RdDVQR2hKQzhNaUVDRExtaWQyc1RPc3Q1MTVGY0pRYS9SRHNPRVQ4bGdR?=
 =?utf-8?Q?JtAXrcUkSOBvrDegFWKZMhukN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7e986f-0813-4590-e377-08db56e412d7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 14:36:17.3682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UuaLLMJOTQia3WFTI+0Fsf4KR2Mpa4FD129/TPm5tXeAciHQvYVbYAiV6lsglB89BmwHAHp3+FbOMPoHt3j47A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8264

On 16.05.2023 16:53, Andrew Cooper wrote:
> MSR_ARCH_CAPS data is now included in featureset information.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit, like in one of the patches in the earlier series, ...

> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -183,6 +183,9 @@ static inline bool boot_cpu_has(unsigned int feat)
>  #define cpu_has_avx_vnni_int8   boot_cpu_has(X86_FEATURE_AVX_VNNI_INT8)
>  #define cpu_has_avx_ne_convert  boot_cpu_has(X86_FEATURE_AVX_NE_CONVERT)
>  
> +/* MSR_ARCH_CAPS 10A */
> +#define cpu_has_if_pschange_mc_no boot_cpu_has(X86_FEATURE_IF_PSCHANGE_MC_NO)

... I'm not convinced that having the (unadorned) MSR index here
is really helpful. In particular to people not knowing the indexes
by heart (possibly most except you) the number may actually look
odd / misplaced there.

Jan

