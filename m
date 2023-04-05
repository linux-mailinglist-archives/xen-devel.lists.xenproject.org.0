Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C96DC6D77D8
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 11:11:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518348.804791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjzB6-0006yW-1m; Wed, 05 Apr 2023 09:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518348.804791; Wed, 05 Apr 2023 09:11:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjzB5-0006vw-Ty; Wed, 05 Apr 2023 09:11:39 +0000
Received: by outflank-mailman (input) for mailman id 518348;
 Wed, 05 Apr 2023 09:11:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gw2r=74=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjzB3-0006dR-Tx
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 09:11:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd7d230a-d391-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 11:11:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6771.eurprd04.prod.outlook.com (2603:10a6:208:18d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 09:11:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 09:11:34 +0000
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
X-Inumbo-ID: dd7d230a-d391-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dqqp3kNObjQSdp/LiiaRn7qG//2OqMJZx0AwmnFpHvpT9mJIXN+PSlIOjv/vUDw8xd5hbC4Mkgr6yp8XDvY2/aICNqhqs9eIYVpDElE7LElddvYvM54icm5fXg59gXEKcPv7Mes/IZZB2TfzF7EbyTBVC2rDxSWTVp3b+PxprFGbd3P01IBLH81026WjXx6kHY8GEeNFXOEFTp102acI2Bp4UPVDIOwzAI2OxQhn0L4s9naIK1cNhMHGmadWp1AxQOui6y7bJn03Z5mNJwrA9uYUHXDuI+/ZuXr6yXvjH1b1hDJdonKfIERZ1buIhAftdDAFLGThILJEs4lSW56OUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsIizMNRMggsxTCY+Sd25aj3DYEvJ4MtxDRw2VgDX44=;
 b=VG3p5wPCbAui+vxCWYV2gHzfY16jnXOXp0aQPYDtm3xrFvg+YzebkPjfCwrIWTEweq8mtBiLJTZWIqVGUfhDJXSYnBFJm+0Pz3+gMm05ahpPQp5qWQhxiezh0+6I8Ge5bue+AwbdkSo2/1Zp7wCnC4cHOXRJs7MQHZt5bDznk1psb6QmxlSbEQag0zcXmQz0xUc9MgDvdhvBeS1aZ1D3trwGwdCO4n9qTxoj3QCIWrCef+VYT9LmG5pokCIno+pWU1N55WL5Cd4GI5jlP5s2r+5CHZAkcA59Nd1XPORdUV4ZTmy1NCX4+7nxNsjIGC5Tx/cQExjj9sc3dJAfUsAbOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsIizMNRMggsxTCY+Sd25aj3DYEvJ4MtxDRw2VgDX44=;
 b=z7CPivYOsb2W4E9I2HcknJ8gw9EWVZlJx0joUI2ZKh/wK5DYxaTPpBoN1ZUfw2bkSLlPdsKUPLTBsDF6CeEs2z/ENJ9voek0k84hm5R/RHpzoYs64ecVL65hKTf4IEVC1I9JPwtaZU8Ju10WdleoNs+nDj8mukPBF9ZW7Jm892hGjxgzyLY9Vtum5qsgFZMHex3X5NMCaJ2DMRK+NyAFggqV7Uh1+NUzPR3EpJlyTcLgIOOXqHhMva2SKdLIcRA2ribYgrCkRJYZ/zYCzo3RizugXI3UZwhMOH3TnBRIPZMYPTV8SsH+2qY6Wxp88OipfjBF0mK0fyhKJs2bYup33A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b46ce1ce-19f3-29d2-af50-e1515da4112f@suse.com>
Date: Wed, 5 Apr 2023 11:11:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 3/3] tools/xen-ucode: print information about currently
 loaded ucode
Content-Language: en-US
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20230404160655.2354-1-sergey.dyasli@citrix.com>
 <20230404160655.2354-4-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230404160655.2354-4-sergey.dyasli@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6771:EE_
X-MS-Office365-Filtering-Correlation-Id: 0787be21-fdae-4be4-7164-08db35b5c07a
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O7C669LueFj1JCSf0BzZTfn7YK9cnkQqWlhWAzz0yeEjeT4sQKgPZ1isMUC4zMSv836svO0vHuQOTdTwKhVpYCJKgWCVBloC59exz/IqHkOjbrgDusVW8B+LYK8F6nBMwkFL77VuWnZ2Vs9ukB+7m6DCYq7D1hrPWthN9aelf6NuKDX2B1HC5vy7DFsrvun3g4Jct9SlLwHlXWFqmxZHatTAK6CwY2ihee2Jxqu6BIstFGVeDPsp09KH61C+nP6tioiwpM7HgePUFfBujWmA4RVUN2gUSgg+SFmGCZGgdH6E1zlzQLw2/zsH2f4yMeeM/SPB5wqShikyESMMo58v6Q4u5ZdgXTpbRRM0CWm1QHsb+6J/0OP1y8jtxlEzpwc/keqXKeo4cjeBMV9h/4J5J2lZnQ9bwXp1QSvXdBgELB3xquqQGPCDZ73SfXNyCzPmE9JuOOrfmkY7hFR7LavufHzVM+ktAJseRnnkabuuTD089m4WUuXy9fUKiQkXu7fEIWAhUI857P2QSZ6lVBOXZZZWk6a9Xzj4WEYwumojV0fSbFBaS/2uvdLCEDo1mLk/fHR7/eI0DPfuVQnsSUDUbGoUY0AuAx5btWus/R3YmjiTPct1puLYL/aquDgPsG+luxP9drK3TB2DUoL+uBE2Lg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199021)(83380400001)(2616005)(6486002)(6506007)(6512007)(316002)(2906002)(478600001)(54906003)(53546011)(26005)(186003)(5660300002)(66476007)(38100700002)(66946007)(66556008)(86362001)(8936002)(6916009)(41300700001)(8676002)(31696002)(4326008)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnovOW5CSitrTFFmd2dKUU80Z3YyY2Y3Q0ZxcGx6QndOZjgwbGJBY3B6ZzND?=
 =?utf-8?B?dDVsckdFVGtKNC84VmxYN3lPOEFSODZXWnhxZ0JJNlBFcWdUeitlcTFFZ1E3?=
 =?utf-8?B?ZWtlNURPS2phdXdwRmRIb2tpNU0rS2k5SG8rNzgzVk9Wb0NZZ1E3ZG5DK2or?=
 =?utf-8?B?SWpGRWE0RkRFekpBSnVaUmRIOXVrMkFjWTNvYkNFVmpBRVM4ZkhOQkx2TSs0?=
 =?utf-8?B?TkFqKzJ3c3M4UXRSL2VYV0x6Q2g5VWh5STdWQTYySmJQVGQ5RlJ6Tm84RE5u?=
 =?utf-8?B?OUlyOHRGMlVwU1RhWlRkMXRaaEZ0U1BlSzRMdkVUZHRWN2ZFWVNBNldBTURR?=
 =?utf-8?B?c3ZMMTJZZWFBVWRZLy9CRk5hbnZXVEJSM1Q4SkZTSk5kWEhiVVYvaElUZ3J1?=
 =?utf-8?B?VzJzbmZCZTZZZzV5VVhnWEtEZzlqQTlwcFFGOE9hRXV0a3hZTkJNK0xoeURp?=
 =?utf-8?B?U21KcWhldnZtZUo4R0pXeThsK0VmcXNsSkJWNGdXbjVUWXpkZUcxT25qNmtZ?=
 =?utf-8?B?MFEwbk0zR2ZPOFQwOE03MVFDRnFSaUVFc2JhQWpMUXVNajI1ZkdMdkpGRndv?=
 =?utf-8?B?c29qcldISGxwMlFjbU0yVk13QUUvMHp3bmpyUUJBdjhobC9pUWhKWHhpZnFH?=
 =?utf-8?B?bDgxdDUzZ2x2ZHJRdHN3U01hM1FjQ1l4b1lFMUVUYXh1NTVTKzlCL2FOeW9G?=
 =?utf-8?B?SGs5N2IyckxzUEZpaU84SWhrT3hTeWZkSjJ0d1JVaDhOc2ZyeVdzUEswNHd6?=
 =?utf-8?B?R1VDNUIzdm1Cb0s0QTdJenlmZFZJS3VGTHpaallBdmlvUVV5bmtGL1huU28w?=
 =?utf-8?B?SG5Ic3h5dkJYc3pHbk1ENHRycnJKeWJwNm1USUpiS00yTzkxSDVYcWlCOEpt?=
 =?utf-8?B?Smg0QU1hYWdIMDZvY0ZpRERzVk5QUjRNWkVtU1hEcnpkWEd4cDd1ZDJ1SjU3?=
 =?utf-8?B?VWJ3QXVvYVdSOFhFSXU5R0dzUXI1UlNwV3RGd0pvRnFLdTZGMmUrR204djMv?=
 =?utf-8?B?aEVZWXp3QkRnUmd1elBBRHkrWFB3TG1SbG1xVHVMbEVGdkpVaHhlT2NVTk1n?=
 =?utf-8?B?cjM4ZVVXNEdoZ1M5a2tnMzc1eHdZV0w1NXlvN1ZQWCsxdFB1TUFiTUoyaW1o?=
 =?utf-8?B?d2pwaC9PdElJNmx1a2RPVzFscTFxdUZGVWZLVGt0T1k3K0ZnbG9GbTdlb1J3?=
 =?utf-8?B?WTZhQWlWS2JEQ3V6dGEvS2RmalZsbXNtSXJhYjZwSHBkZWQ1dXUrUmVsU3VD?=
 =?utf-8?B?aVM0clczalVPR0hLYVIzZUIzcVRtRXNvaklSWUNJdngwZmZqTm01WnFRRTJI?=
 =?utf-8?B?NVlENWsrcmFxUVpWdDdpR1ZHWVZldnAxVkFXR3ltUkZDT1dlOCtUZTFyL1Bk?=
 =?utf-8?B?ZVlWdE9yMTkyc21HQ0Nxc3M2L3JaRHJGZEZVNDFkZnZQV0lvaXFJRisvMy94?=
 =?utf-8?B?Y0lPMDZ5SjN3WW85UnJlZEI3YUhNQitYNkwrQlRYTVZVVndyVzVUVGdqRU9F?=
 =?utf-8?B?UG5xSTRNaUlZZEk4RXJaaWR4Y3lUR2pVOXprcSsxVVpzNFFYalR5cUMzZ2Ns?=
 =?utf-8?B?YW4wR1loTFN5MENjM0NBZ2NhYUlUTGlqb1VIdDZXZUFsYmt0V20xclU5ZGtW?=
 =?utf-8?B?UlMyQlBpelo3M28vMnRaR2djOFVPN2VTUEZHMkI5RllJMTFYWWNhZjFsRVBn?=
 =?utf-8?B?cFdHc29SYXhEZnlIeDdWMWxXTHFHS3Nkd0hsWlJOYU4xcS9TNTRmbytuRlpv?=
 =?utf-8?B?MDRBSWFuY0ZtZGlnMnh5dXkwUytXNnhPOUgydzhTQmNYM2Y4NlVwdmU0UGlp?=
 =?utf-8?B?dEY1bGNkNkc3YVZaY3hLaktJeXhCWnpOQk40bUpCS1N3ZzNORmErM0VyMEwv?=
 =?utf-8?B?bjEvNzh4aWZaemYxa0dYa2huMFZqN1dNeGZ6aTlmOFdZb0FoeDZkTHdGSy84?=
 =?utf-8?B?dmo2SkUwbUhRVzdyOVl2UVhNNXY1L2hjOUdJRDNmbkZDTU02MDhpNmJlTGUr?=
 =?utf-8?B?OHBqTWVjbTFRbFRmak1mcjRxM0RFWFdpWDlZVU1rd3RoakRoVkdRYjB5WUF2?=
 =?utf-8?B?Wmp4VGF2MG5GTlpLci9mQy8xTWIycGpUMStrV0ExcjNST091YWErTDBXS0pY?=
 =?utf-8?Q?MJsezj3/nEfQaOVoIHBlEVquI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0787be21-fdae-4be4-7164-08db35b5c07a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 09:11:33.9218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25QtnpjRaVufSdNAG0CdAnkP7WrWrK/3zZBM7JUqIMwymmcpOgAGPw+m90xwa+tpOg3OHl7WXMwPz6+arylIEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6771

On 04.04.2023 18:06, Sergey Dyasli wrote:
> Add an option to xen-ucode tool to print the currently loaded ucode
> revision and also print it during usage info.  Print CPU signature and
> platform flags as well.  The raw data comes from XENPF_get_cpu_version
> and XENPF_get_ucode_revision platform ops.
> 
> Example output:
>     Intel:
>     CPU signature 06-55-04 (raw 0x00050654) pf 0x1 revision 0x02006e05
> 
>     AMD:
>     CPU signature fam19h (raw 0x00a00f11) revision 0x0a0011ce

Wouldn't it make sense to also report the model number here, even if
ucode blob file names (currently) don't include it?

While for the revision always printing 8 digits is definitely helpful, I
wonder whether the two top nibbles of the raw value wouldn't better be
omitted. (I understand Andrew did ask for this, but it's unclear to me
why he extended this request to the raw fields.)

> --- a/tools/misc/xen-ucode.c
> +++ b/tools/misc/xen-ucode.c
> @@ -12,22 +12,89 @@
>  #include <fcntl.h>
>  #include <xenctrl.h>
>  
> +static xc_interface *xch;
> +
> +static const char intel_id[] = "GenuineIntel";
> +static const char   amd_id[] = "AuthenticAMD";
> +
> +static void show_curr_cpu(FILE *f)
> +{
> +    int ret;
> +    struct xenpf_pcpu_version cpu_ver = { .xen_cpuid = 0 };
> +    struct xenpf_ucode_revision ucode_rev = { .cpu = 0 };

As mentioned before - the current state of the system may be
inconsistent, so I question the entire lack of a way to know of
this by using this tool (even if via a specific command line
option, defaulting to CPU0-only).

> +    ret = xc_get_cpu_version(xch, &cpu_ver);
> +    if ( ret )
> +    {
> +        fprintf(f, "Failed to get CPU information. (err: %s)\n",
> +                strerror(errno));
> +        exit(1);

Errors want to go to stderr, I would say (just like is already the case
in main()).

> +    }
> +
> +    ret = xc_get_ucode_revision(xch, &ucode_rev);
> +    if ( ret )
> +    {
> +        fprintf(f, "Failed to get microcode information. (err: %s)\n",
> +                strerror(errno));
> +        exit(1);
> +    }
> +
> +    /*
> +     * Print signature in a form that allows to quickly identify which ucode
> +     * blob to load, e.g.:
> +     *
> +     *      Intel:   /lib/firmware/intel-ucode/06-55-04
> +     *      AMD:     /lib/firmware/amd-ucode/microcode_amd_fam19h.bin
> +     */
> +    if ( memcmp(cpu_ver.vendor_id, intel_id,
> +                sizeof(cpu_ver.vendor_id)) == 0 )
> +    {
> +        fprintf(f, "CPU signature %02x-%02x-%02x (raw 0x%08x) pf %#x revision 0x%08x\n",
> +                   cpu_ver.family, cpu_ver.model, cpu_ver.stepping,
> +                   ucode_rev.signature, ucode_rev.pf, ucode_rev.revision);

Nit: Indentation (also below). I think you mean

        fprintf(f,
                "CPU signature %02x-%02x-%02x (raw 0x%08x) pf %#x revision 0x%08x\n",
                cpu_ver.family, cpu_ver.model, cpu_ver.stepping,
                ucode_rev.signature, ucode_rev.pf, ucode_rev.revision);

> +    }
> +    else if ( memcmp(cpu_ver.vendor_id, amd_id,
> +                     sizeof(cpu_ver.vendor_id)) == 0 )
> +    {
> +        fprintf(f, "CPU signature fam%xh (raw 0x%08x) revision 0x%08x\n",
> +                   cpu_ver.family, ucode_rev.signature, ucode_rev.revision);
> +    }
> +    else
> +    {
> +        fprintf(f, "Unsupported CPU vendor: %s\n", cpu_ver.vendor_id);
> +        exit(3);
> +    }
> +}
> +
>  int main(int argc, char *argv[])
>  {
>      int fd, ret;
>      char *filename, *buf;
>      size_t len;
>      struct stat st;
> -    xc_interface *xch;
> +
> +    xch = xc_interface_open(NULL, NULL, 0);
> +    if ( xch == NULL )
> +    {
> +        fprintf(stderr, "Error opening xc interface. (err: %s)\n",
> +                strerror(errno));
> +        exit(1);
> +    }
>  
>      if ( argc < 2 )
>      {
> -        fprintf(stderr,
> -                "xen-ucode: Xen microcode updating tool\n"
> -                "Usage: %s <microcode blob>\n", argv[0]);
> +        fprintf(stderr, "xen-ucode: Xen microcode updating tool\n");
> +        show_curr_cpu(stderr);

I recall you had it this way before, but I don't see why this information
needs to be part of argument error handling. Furthermore, considering the
possibility of hitting an error path in show_curr_cpu(), I think ...

> +        fprintf(stderr, "Usage: %s <microcode blob>\n", argv[0]);

... this would need printing first, and perhaps ...

>          exit(2);

... the exit code also shouldn't be anything other than 2 in that event.

Jan

