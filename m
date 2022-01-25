Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 829E449B1BB
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 11:35:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260047.449024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJAF-0001FI-9y; Tue, 25 Jan 2022 10:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260047.449024; Tue, 25 Jan 2022 10:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJAF-0001DK-6a; Tue, 25 Jan 2022 10:35:03 +0000
Received: by outflank-mailman (input) for mailman id 260047;
 Tue, 25 Jan 2022 10:35:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCJAC-0001DB-Qj
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 10:35:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7238f222-7dca-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 11:34:59 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-ktrcKR2nNtuFyz7s7-DCNQ-1; Tue, 25 Jan 2022 11:34:58 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by PA4PR04MB7774.eurprd04.prod.outlook.com (2603:10a6:102:cc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Tue, 25 Jan
 2022 10:34:56 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607%4]) with mapi id 15.20.4909.019; Tue, 25 Jan 2022
 10:34:56 +0000
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
X-Inumbo-ID: 7238f222-7dca-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643106899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wJOo/wvk8DV0bT1rSv69PJBqcT92jXeyKhTKtwAZHmw=;
	b=T7Rfq7/1ugDxpDn0GIf6l5R0KRLZV5cTdAIyOKervC+n4oRy94U2wk0ndvujL5mlZkSs92
	0ImYHXVegNT5R9xqE437JVAVYWfara0wwN/L34IW/bt52wwi1ZjqIHsxCcRusi/3hhbeXs
	8D69AHjWIfWiAEUPG/UR2isgwY3IR6k=
X-MC-Unique: ktrcKR2nNtuFyz7s7-DCNQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWzDvEZjkILFMQiJ+e3n9sw/K8CIsBBbbJcff+GmaUyb9WjE4Qx92WIXryKxHfFuaEqVuGUb1vFPo3USqc60AL0OKUgoGGy20fKy4QgSmQxz2cebkUQrFe8wIYnp/TIy+1x7LmicMmnS30ng8BMsR/fA2/cATJVGbJGHDvBbtdObQj5zD99rAHElpg7jNZsfQUdFXLgK/i86UWmKOhyZepmhtYvr3xCc3BxXQdp4CiNQ8nuKqxhEhc9zB2qYJgxlfWdzpgwvChFRN6Bu/g3Q2g7yjMBlyr3RaC7mdNDwGE+xZEdbrQ3A8HGEoA+ghATCnpDkl47lH1RbOHL51WLhZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJOo/wvk8DV0bT1rSv69PJBqcT92jXeyKhTKtwAZHmw=;
 b=RLHjN+RNDoGA9UgJ7U0IkBaqS1gek5EWCPBozyVDueagNIm7Dk3dG9+9QC6m1IDmYFA+l3dAIUrSic5UURlcFAckVosVjcrOWxCPHJVtMsBL+lVHUdshhl7H7s9u2IIjSGBPLtugyb0SCYsh1XxrUwhTX00OtA8hROWIWOBKVPQ3KqaCBMMdyxy2hsTY36gRscKzKX55wWEYEa2A5r4DTMMS6IqxESxMJ4ewezY0sBXmsp0NNLDbpbzYFpkUmltGYgQs6B/d8TfM8sxu9TaTwd/ouNDRzfELgwMw2cUatufv1Yhqc+9QQXqLnMr1kn2AblOmgtV3MI8M/vAHlorqiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d80da027-93ac-4819-ef7a-f3fd8592e443@suse.com>
Date: Tue, 25 Jan 2022 11:34:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, julien@xen.org
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-21-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20210923120236.3692135-21-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70d90f86-6be8-4103-b0ec-08d9dfee54aa
X-MS-TrafficTypeDiagnostic: PA4PR04MB7774:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB77746B22D1F3A567AA5E8FF5B35F9@PA4PR04MB7774.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LuZppkI+/RGjEEvIMZNHTs8bE/ygjVcFqDzFBXY5EJ893UCUj6kv5edfed4MhcQyLK7qF8kjlLsghfwPFCnroG0/zEuO1zg9gs6VkasA+U48eKaMNFfj2Nol/g72SZdU3Lny3ua82rYc2WU+MlSedzMTR+Qtv2prHLxXOgEK5rYWwiRLYhVJ0nMcyPrl+SnPk83eNA/mYJ+e3vJlVU6eoL0h1lXl5gOgn5j1y0qyaO5AK8TXGmdWaL4vLBtrKTqRYJDwFbCYlVzR57x5o5XgH003hTtrm1dRk94bpJtyVjjqXHdsLE6iC3jPr2Azi/CTW8UdS/JSqAGVRBilT6cfwAwP7F7vo0Osgc1ESsF13MLuoAsn8eePWkp/sqWIjtZRWmEnexb9u7J1ZIcJ9gh2p6p8Qx8ZTMkqsCfkHIF9ewFSMEhWxDVu435AiJxSexape6GcqHExHkH5/z92o6LBqFqrcMCyEJYAUS4BNLTt6NXpqCbeMm+dxFys8lGNymROENA61YkEkqEzSMlK9yVmF89qBdgjyaAryFZPHjbnxXMNf890bmjDng6r6S3npggOp/ZO6Y0uSu13gcNfBSqmZOfAUmSu3veFT+iG0Dz1aOzHZHkoa0BICgFwM8wnlLYks6JsPxGt17kVvXBIAeusMkk3YWU5Rzz+rQhCzFOO1EIgb40rUdNdp4yHbp9VYRMwJLQqtEhm+wsnKQ6pcagIwkXrtmEQUZ44CgQtL6bX25vNlOyv4vgFacL97RZ5YeH6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(186003)(53546011)(508600001)(6916009)(8676002)(6506007)(26005)(38100700002)(6512007)(2906002)(83380400001)(86362001)(66946007)(4326008)(5660300002)(66476007)(66556008)(8936002)(6486002)(316002)(31686004)(36756003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUxKSTNzSk1rL0N3ZUs0VTVMMVZ6dENiMytDbmVuRjRKWDRzWXpnMXVwWDdw?=
 =?utf-8?B?enp3MEpFNDRjbTRqTjJqbmxsSTFUa2lyMC94ZFVTV3pGUGVEbTYyMnZjMDR1?=
 =?utf-8?B?dDFmc3RBVVREVVhoWjM1WXYyUXgzRTNySndFOGQ5WHFYbjhHUjRONzZpNmVP?=
 =?utf-8?B?MEpYdTJ0RGRVazZGSWkrV21ZcXB4ZHhzK0pkZERmMGNNb0RyOXFQU2I5NUdo?=
 =?utf-8?B?Y2ZPK0RXZHlFZ2tDcUUrVjZ0VlZ5NGRkdmw3OUFxdHEydGFtQWRLWW9WQ2x4?=
 =?utf-8?B?SENiLzRsRDRqVWVydHFIK0pjMVEraXBDSW5yR0tWemNCRkVzZjNKRWZhTWc0?=
 =?utf-8?B?elV5cksxREtuZG5PVThGWGVtOGpRWmVVQ0Y5ZWJGVnVwMTM3alYvdjNybDBN?=
 =?utf-8?B?YlgzR2VpY1dVNDZ3RVJLM0tudjR3Y2VJL3c3U1NoMHYybVo5dDRsQjQrR3Fq?=
 =?utf-8?B?ZUM0NUtjQ3ZUQXpaRXBYSjk2anFSVkRnU0toOSszdHQwYjZkSDBhOVBYNFg0?=
 =?utf-8?B?RDZtRzh6U2kyRjF1VWxkS3VjUG9tRzZyVDZIK1FpaTduUjZNRk5VeXAweTNt?=
 =?utf-8?B?aVVNTFNpaUZaVlExb0hZUkgyWmtlRDNHd3NIYlFPQmpRNENGaVhJMEt0SDJO?=
 =?utf-8?B?dnJ3VTMyNzVnV0FoZ1gwdVl2ZE04TStJa280OFZFZks2Uis1aVVVbGdKNFNY?=
 =?utf-8?B?VDNUZEdhYTV0bzhsTVl6cmpQZFZTaUhVOXNuUFdTYjJ0VC85RVQ4UEZia3Uw?=
 =?utf-8?B?VmhXTFVKcGdzTUV4VUs4WkpCOVdNSDNlOTk2T0poczVsNEJuRzJOSWVESjNm?=
 =?utf-8?B?bTdpWVlOQkhkYldQNXFGYVdvcTFDeGl1M2d2YjBJOEh5a2xrK2xJbUw4U3VG?=
 =?utf-8?B?ZFQzQlVidThQZ3lsblNSVm9rVE5rUHB3RmpZR3BsRGZOT1lDemN4WTI0Vkhi?=
 =?utf-8?B?TXlkWFNVbEdrOE9POUlPZ3pLQ01yQ3U4Q0hMVERPL0NTaHpuVDVNQ2I5cHdH?=
 =?utf-8?B?RklYak9TRndzOFRlN1lXTGxDOFFHTHBiSEdXTWZlbzhEVnUvZTdFbE11YVIr?=
 =?utf-8?B?MlJsbTVrVVN0MXZ0V2lLb2NCa2FIeWl2cTZhZnVBS2JTaGR1RkRnWDRDQlJK?=
 =?utf-8?B?NVNXOWVVNHgrTVRqZFpMSS9ZVjh4YTZaeEpjWVVjOFZ2eUZXcFNkdTgxODUv?=
 =?utf-8?B?QUMwOUNVNm9CNUYrTWREcnlhdGFmRWdPU3kwQmE1WEp6L3FPMVMxeHY2TkhV?=
 =?utf-8?B?Qll4cjJTQU1DUDFZV2kyY0NqZjVoanM3NzlFNWtOQUxKOGI1SUoxUmtiSEow?=
 =?utf-8?B?NVJzVzFZRVg2TnRXUTlEcjU2dHB6TG9vSHZtZ0l4SzA0dHRpc2FpWDhVYjNn?=
 =?utf-8?B?VWNKbnBjc3RlbUQ0dGI0Y2lmdlI1RXk3cUszWlB2Y3FmanVZNm1DSndTeEdq?=
 =?utf-8?B?VU44TjZVcWZPdDNHS3pqRmJWb1JNdWp6Um9XcUVIU0p2WlcrOHpncUdaQ1Nz?=
 =?utf-8?B?MkFHckh3anEwWHlUR3VVaGxGQjd6U01jOUwwdnJBMnhCdzlJQnEvelA4Qk4w?=
 =?utf-8?B?VXhVcmdrencvV0FIZEJMMitVaXVYdUtqenRSelZ6Yy9xY2NmSE9rQkVJTVVh?=
 =?utf-8?B?SkVYZE5Dc2M4WUw2M043UEZPVmpaSzQyN2xxMnlJZU5EYXkwVzJMRFdKT1NB?=
 =?utf-8?B?WHRiNFU1MHgzbDBlVWl2NDFYZ2tPbFhlbFZlSm1wN3dBckk2M3hRaytXRTQz?=
 =?utf-8?B?ZlpmeUNmOTB4MUlzY0FEZllNOW1XUVA2SjB1T0pjQ3VlcElsbkxCeDIzamdW?=
 =?utf-8?B?cXlIMW5YelUzMzVUdFVkci9iWHl6TkczV2QweHhmUE9mUzlkc296d0kwY093?=
 =?utf-8?B?eXF1NDJVRTNxSVo5dWd3MzFMR1RBRTA5a2ZvNWdPMXQzQmZLcmdJb04wdzU0?=
 =?utf-8?B?M0pHWmlIZHA4Zkh5cEVlWER5bVErblRFQXY5THRDY0VsUVpSVzBwdFV2SFBT?=
 =?utf-8?B?OVBKRzVERTFIQmN2RnhIVTcwZExZVHQxaWFmQXRybXRjdXlmVzBjY0NEVXl1?=
 =?utf-8?B?aVBDWllXaWZ1VlJzUmJsMTUzaXY1R215RzhGZFkzTnN5aDRNM01aM2xkMHg5?=
 =?utf-8?B?Y0o2ZGVQLzNoY0xCLytGazRSbkZvWG5vSjdwQ2pCZEUwQkJHa2VTUXNDSGh4?=
 =?utf-8?Q?r2ceRVBJIBGKLrEL856TjqE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d90f86-6be8-4103-b0ec-08d9dfee54aa
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 10:34:56.6568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gKXwf3N1d6Z0KfM5MfeZfc6tqUC17J5Qsmh/ZrYMZfygK0S59so2ixYzIUTidp5FOJrdj4poam8Bll3maTKdaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7774

On 23.09.2021 14:02, Wei Chen wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -11,6 +11,16 @@ config COMPAT
>  config CORE_PARKING
>  	bool
>  
> +config EFI
> +	bool
> +	---help---
> +      This option provides support for runtime services provided
> +      by UEFI firmware (such as non-volatile variables, realtime
> +      clock, and platform reset). A UEFI stub is also provided to
> +      allow the kernel to be booted as an EFI application. This
> +      is only useful for kernels that may run on systems that have
> +      UEFI firmware.

The way enabling of (full) EFI support works on x86, I consider it
wrong / misleading to put the option in common code. At the very least
the help text would need to call out the extra dependencies. Plus the
help text of course then needs to be generic (i.e. applicable to both
Arm and x86). That's notwithstanding the fact that without a prompt
the help text won't ever be seen while configuring Xen.

Also (nit): Indentation. And please don't use ---help--- anymore in
new code.

> --- a/xen/include/xen/efi.h
> +++ b/xen/include/xen/efi.h
> @@ -25,6 +25,8 @@ extern struct efi efi;
>  
>  #ifndef __ASSEMBLY__
>  
> +#ifdef CONFIG_EFI
> +
>  union xenpf_efi_info;
>  union compat_pf_efi_info;
>  
> @@ -45,6 +47,8 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *);
>  int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *);
>  int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *);
>  
> +#endif /* CONFIG_EFI*/

I can see that in the later patch, when introducing inline stubs,
you would need conditionals here, but I don't think you need them
right here (or you may want to introduce the stubs right away).

Also (nit): Missing blank in the comment.

Jan


