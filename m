Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F24F6F7CF5
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 08:34:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530233.825716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pup19-0006d1-Uv; Fri, 05 May 2023 06:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530233.825716; Fri, 05 May 2023 06:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pup19-0006ax-RV; Fri, 05 May 2023 06:34:11 +0000
Received: by outflank-mailman (input) for mailman id 530233;
 Fri, 05 May 2023 06:34:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pup18-0006ar-5h
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 06:34:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d65547c9-eb0e-11ed-8611-37d641c3527e;
 Fri, 05 May 2023 08:34:08 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by PA4PR04MB7933.eurprd04.prod.outlook.com (2603:10a6:102:b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 06:34:05 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%7]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 06:34:04 +0000
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
X-Inumbo-ID: d65547c9-eb0e-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nyDMFero+j4xtOww9ukoRCDxK4qNarntpDODw0WM69xzK5d0ZLx5YtKWWkSoRETWPBPIz09bbchIg8cTJfq4uhpx8EHLwHrqx+Ddr9caESB8PhcrlubU0Lcas2R7FCc5X+eGpw7r1gl+cGX8ZxxFz95sVf3XrSkGm3B93ck0Zbvsh8yHAAlcrC83h++N79Gc6Optv1obEF2937WU8Z/m5uYWR29Q5CI0hMaiCk+EY9Etk9ZDN+UgGjcU4Wo7RgcTltQsJY/GR4eVJXzaF4vjcthevCOixagkrsPCdaRA9UJma2xF8We2cQZONtSfPpU3LDHVqImXXC1fEgJOJYYeQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZxrcutvyKcp2criGjoajIUaUNjslOaTNy/anR2x1vY=;
 b=iLtAFIF0UqGThyy7/mcbanun0PlQf3jWwbYkcK+gdW5nKMNiuDOZSXxtrUuYnOZnh6eVvzIrVBsVgQ0Gf3LqX5+Iie2W3ey3IpT4fMTuYThGxUZIcTaYUpMMX1zOt1jNxCMuFSFOqHxNKxLtp7dm18ce6MPXr7mtyRlcDd8w1jy0obgjt8q9rZjYZmTajZcyfxh92Lzy0zuxukKa51hqMR+x8CVYcXmPBULJIhKzKBPS/YNfVI/VctOuspxrvfNRmaGa7nTxmGWhwx335i/u2MleS33OZv5/82PmviacHRsN2yj5xTtxegCMD09hI1GiJNtIgBd9YDMRWI2JnnJdow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZxrcutvyKcp2criGjoajIUaUNjslOaTNy/anR2x1vY=;
 b=1bWPvwUIqNs5ue1sip3DpwajGquDg3zQ78R15qF9XeZ5b0wuw6I95JDNp0tVVNKurVJ27/LGsSoiiSMn2VaI5w8WTU5zZpdHeEQjqyv4zynhxlnxiwStjt2x57QrDE8a0tVu6Q2Qx8k49xUAgM9ZUxwenHzC+KQ7aUkL/TDATmJVQxeHYrqThShKLoPNMtoltIBjdkdGp4Koi308oZ0WlNp5imLMN+CR6GbTpcFVUNEQ+uOXgDwQrkgAemscTziYxIa69ZLfI45L5i4yndiUshFpWdyAljzWa+U98kxo4GeDL87FjwrEtsnhiE6t2eQZ3wwI2IpxdofoUul77iJ1Lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a60ad8ea-95a8-ed15-f862-3872e9fb68ac@suse.com>
Date: Fri, 5 May 2023 08:34:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 1/2] acpi: Make TPM version configurable.
Content-Language: en-US
To: Jennifer Herbert <jennifer.herbert@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230504175146.208936-1-jennifer.herbert@citrix.com>
 <20230504175146.208936-2-jennifer.herbert@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230504175146.208936-2-jennifer.herbert@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::8) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|PA4PR04MB7933:EE_
X-MS-Office365-Filtering-Correlation-Id: 0380a7f9-1c86-4e4a-b956-08db4d32b8ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lsh9PRYR1wB2b4MjD+6FS18SN7Hosz/E1yjpEL7WXSBSytQn46BaD6ChMLXGhonoTf4MlkssAJZhcpYQhAyaBXRLuByH4PzXUuUOvT6BEjYfzwbEX+VL7riF37vqVbq+Hy7KYs33RnthsF2gTitqw9h2YeB8MWks07op+mTpzZaXtGjzR/if3THAFOoVPQ5GX5+yfwJwM7X2R2iz39k+qcTlIe0d72iDTgwEAfTbyF9gBELG2n8O9qsgc9+w/7HmQDuqoU0YJ/yNEzC4iZ3SDjHIeE3cTWw02ot5ZfbO3MCs3Fz3dYV5YZ0PTOjvmGl3Kbi8Ig703D/B6AgQrnDcXBTA6EazAC/zBNucN/BXeqvLj3OpJhwucMJejWk+12ekyKXbIBlfs4deQh/eNxntA590/OEhf77p9vASFTc4vTNmmFwn+x2afTl2RzN3aJzZPoG3p9iXNTXAgje9vCDi8eXaKGsTJex6MyAszNisboufFM3zCYdl86jZL8AD/0pPjjWmfTHUEToe/y9OmTwbpP+tqIGS7yydaTXxYMT+kokB010yky7+q8bNzTDfhTwS2TlKLldUJLQN265n3XhJEgxsFDR5RcOQ5ek3dYdmQT27S8AdoZ7flBrrKKiNswOjdzvInL9f6aEVsvSnrMKTbw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(39860400002)(366004)(396003)(346002)(451199021)(31696002)(6486002)(86362001)(36756003)(54906003)(316002)(66556008)(66476007)(6916009)(4326008)(66946007)(478600001)(41300700001)(8936002)(5660300002)(8676002)(2906002)(38100700002)(186003)(2616005)(26005)(53546011)(6506007)(6512007)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2JPOTkrUTBMU2REUnM3MVJCd0I5bmlWUUhJYktpRVJ3VGJjT1d1V3Z0cUY1?=
 =?utf-8?B?T0p2elNORm1RS2NtZnNNNytSNTU2NFNpVXBUSUQ0UTJJaVhTTUFxYjNWbVJO?=
 =?utf-8?B?MDBoYk4zSVJqcUFPODdTT2RmZUx1K0FKdmEwVWtRM2JRT2JyWFl0MkZmREF4?=
 =?utf-8?B?eWU2TVh3T0JiMlpNN3hqaWR2dU51RWgzcndxZkdQaUN0UHVESmtBaTBiY2VX?=
 =?utf-8?B?dGZOZzVDSHlCR3VwbU5vak03cDdlbzlWaklHMkliWmh3R2cwdXB2SGttT29J?=
 =?utf-8?B?eGxMYlJtZXBsemdoSWUzbGY3UndiZ2lKRDBwb2VDZFZOSG9tZzNLSUtUbk1Q?=
 =?utf-8?B?VThuVzg1T09Lcjk5dFQ4eEc4b2pnV2J5RnJoRVFUR1BhSTBzNDhmWmZBaytQ?=
 =?utf-8?B?bU03aTFkbXJ1QU4vNGhHKzNGbGJrS0QvczJMclNUNisvSHpFZ1BJRk85T1VQ?=
 =?utf-8?B?MmJvNkxzMkJWUzJkS0tGK3hzZ1M4azFJV2ZialFkdHhCQ3lNWWdxSitsV1Fn?=
 =?utf-8?B?WEQvVmJ6eVlwKzYrbWhoVFFHejhESHM3UkU1YldWd3VqSytiT08yWU9Sb1M3?=
 =?utf-8?B?dHRjSy96UXpDcG1ZTlNqTlg1MTNGQ2paVUFUZ3ZBd3k0Vlltb2gzOHhJZTUx?=
 =?utf-8?B?Q1JWejdhelVpMDlhSTVhd2tST2tqUXBvSlVETjdlYnZsc3hmSmZXMFFHTEdp?=
 =?utf-8?B?cVpNdDhJWWdUZlV5Y2dxc2FKTVhwa0FRUGEyS1AwMFVEbEJSUVRCYVhZbllx?=
 =?utf-8?B?U2NrVzEyeTdlOTFrUXNnOElWNWRpaTVtc0xWT3BjQ21uV2ZpbXI1NDJkcEVl?=
 =?utf-8?B?R1AySHpQeHVQemNxY2w0N2JaTU9RSm43bnZnc01STUZqMTFrakpVRnA0K21x?=
 =?utf-8?B?eHBwWjBvQWZXQ0JNTmxrMTNpd1BBb2NwcXVaQnZOckF6c0YxcjFOWDVkdW1j?=
 =?utf-8?B?WGtqRjc0bi9ZUXdWblIyVDRWQk9TRlhPUVd4Kzk4Wm90SnVXUXpaK0VlWGRO?=
 =?utf-8?B?L0hRMlFVN3BnMzIxQndiOHFaRFFkN2ExaGZUUWYxUGVWSklaSGNjL1NjN01o?=
 =?utf-8?B?ajh1TEhkaUJhZXg3d0RjZldpaDU2WDkwb1dUZlhhNHNMWUt3SDFuSEJJMGJV?=
 =?utf-8?B?a1prN0VuaXZWTE0zeGJkL0l2R0hwQnN4bjJIY1Y2QkkxZVFxckJMZFdpVmFT?=
 =?utf-8?B?Szk4ai9MUnR6MEU2QWxoTFBld3lpYlZyUlF5SjVJUEx2aU81TkhkbmVqS01p?=
 =?utf-8?B?N2hScERVM3l2RXhyVldEa0RTbGRZMDYraHZwaDIvZ0FiYkQxK0MvS0gzZlU5?=
 =?utf-8?B?Sm9qMDdiZFRnbnJqaTJsbnpZaUY1WWNPdzM1UVNFSXcwU1V4alYyckhDK0Y0?=
 =?utf-8?B?VWNDN1c3eTdpQkc1NjFuQlJJSkdtMVdmZDBtdEt4cE85UG5uVzB3b0p5VVFV?=
 =?utf-8?B?eTNrN2Q5Rnczck4zM2NhNzZLL1FPd1cwVzNEanRYWit5QW1JQlAwVk5BZVdZ?=
 =?utf-8?B?aHBpZ1VmUVRPUG5qaXBMWXJJcENJTGlGaTRqMlorM0tZeWlWSmhFaVdUY2RV?=
 =?utf-8?B?UCs3MDA3aWVEdWxzeGhTZWxkbGtpbFFBNlZscm9meE1MZFUxZGhVRldjTSt4?=
 =?utf-8?B?VGV3N3JvVG1XNzVISGJJN0Jia1VteUJVS25DOXM4cjN0L3NIZkErYnA2Q0I1?=
 =?utf-8?B?RnBMZys5ajVETGJMWVJtZEFEK1VVazlLNmllNzFDS0ZhQmZYMnI0eWJFczRs?=
 =?utf-8?B?TTlhRlhTSlVIUU8xVUFJMHpPZWVUaGk2WVZxVVA5NHg4M1VYdmx3WnBpUHNn?=
 =?utf-8?B?R3dPN2MzR0JRaWdRd203dCszRkc1YXpSbmF0UEFueks3bWVaY2gxWnhjdUtw?=
 =?utf-8?B?Si9JTXhNdi9HSitrMDQ3dTRQTHhKMXA0OUxVa0VkV0hkVUN2QVZzakhLbFFy?=
 =?utf-8?B?S2VranJXQzVaYWNyTm4vWi82OTJFUzVFbjNaTnc0RUJZUktzUllOOHVDL3VY?=
 =?utf-8?B?VURlVUN2dEU1bkc4cFFjZkZLV1dhaFoyR05KUDVvb1plQ1p5U21Va3FrRmNi?=
 =?utf-8?B?UkdSOWN2dlJyeHRNaUlyTHR0NTNyeFluMkROYU5nTVJqRVczZExwMUxxM3lY?=
 =?utf-8?Q?cuD0W8tdhVikA3jbGrcItqJPe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0380a7f9-1c86-4e4a-b956-08db4d32b8ba
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 06:34:04.8055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JwNRcXF+jq12C3R8ZapxPB/PS4RPLvSfecmoy9vIenaPF4o3PSfOkjzwoSHgRbx8fNfwJSa07d3y5+EYSrHxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7933

On 04.05.2023 19:51, Jennifer Herbert wrote:
> This patch makes the TPM version, for which the ACPI library probes, configurable.
> If acpi_config.tpm_verison is set to 1, it indicates that 1.2 (TCPA) should be probed.
> I have also added to hvmloader an option to allow setting this new config, which can
> be triggered by setting the platform/tpm_verion xenstore key.
> 
> Signed-off-by: Jennifer Herbert <jennifer.herbert@citrix.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit with two minor further request (which I'd be happy to make while
committing):

> --- a/tools/firmware/hvmloader/util.c
> +++ b/tools/firmware/hvmloader/util.c
> @@ -920,6 +920,8 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
>  {
>      const char *s;
>      struct acpi_ctxt ctxt;
> +    long long tpm_version = 0;

I don't see the need for an initializer here.

> @@ -967,8 +969,6 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
>      s = xenstore_read("platform/generation-id", "0:0");
>      if ( s )
>      {
> -        char *end;
> -
>          config->vm_gid[0] = strtoll(s, &end, 0);
>          config->vm_gid[1] = 0;
>          if ( end && end[0] == ':' )

While there is a similarly odd pattern here, ...

> @@ -994,13 +994,27 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
>      if ( !strncmp(xenstore_read("platform/acpi_laptop_slate", "0"), "1", 1)  )
>          config->table_flags |= ACPI_HAS_SSDT_LAPTOP_SLATE;
>  
> -    config->table_flags |= (ACPI_HAS_TCPA | ACPI_HAS_IOAPIC |
> -                            ACPI_HAS_WAET | ACPI_HAS_PMTIMER |
> -                            ACPI_HAS_BUTTONS | ACPI_HAS_VGA |
> -                            ACPI_HAS_8042 | ACPI_HAS_CMOS_RTC);
> +    config->table_flags |= (ACPI_HAS_IOAPIC | ACPI_HAS_WAET |
> +                            ACPI_HAS_PMTIMER | ACPI_HAS_BUTTONS |
> +                            ACPI_HAS_VGA | ACPI_HAS_8042 |
> +                            ACPI_HAS_CMOS_RTC);
>      config->acpi_revision = 4;
>  
> -    config->tis_hdr = (uint16_t *)ACPI_TIS_HDR_ADDRESS;
> +    config->tpm_version = 0;
> +    s = xenstore_read("platform/tpm_version", "1");
> +    tpm_version = strtoll(s, &end, 0);
> +
> +    if ( end && end[0] == '\0' )

... I don't think it should be further propagated. There's no need for
the left hand part of the condition.

Jan

