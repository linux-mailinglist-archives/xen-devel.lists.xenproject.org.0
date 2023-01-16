Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE7B66C966
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 17:49:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478887.742371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHSfm-0003jJ-Fm; Mon, 16 Jan 2023 16:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478887.742371; Mon, 16 Jan 2023 16:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHSfm-0003gU-Bu; Mon, 16 Jan 2023 16:49:26 +0000
Received: by outflank-mailman (input) for mailman id 478887;
 Mon, 16 Jan 2023 16:49:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJiS=5N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHSfk-0003gO-GW
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 16:49:24 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2077.outbound.protection.outlook.com [40.107.15.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id baada170-95bd-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 17:49:23 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB8012.eurprd04.prod.outlook.com (2603:10a6:10:1e6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Mon, 16 Jan
 2023 16:49:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 16:49:21 +0000
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
X-Inumbo-ID: baada170-95bd-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgcKWelc0TVMh1ZUITNcznowlJTGOC06qdiVB2AGUUBLlOpe4ScJMYDR3/v9HI6WugdzsziVjK26cxjVoDwA4YiSnpiNrwg5TDtD8twjOr2vWCHkZ9WoeCtO1UKSk/fibt9qhyNyDipr1K5lrLpjzT8sQosYCjJrCN+4vupXvO5Uc0zvA1ftwMAP+Kz74slYUPnrzMHe0Fml33kmCtJbS4Nf5gubQWAIcshwE+blsobhC947Jjb6Nw/wL/jmj+jtk5nZQQHX8n3fG7twqsJ4bTDr7LnJ6/brPCuOlBPJyHG67K1Gt+VDdyy/oaRB4XXpKUFuB0XrDFGR09s3B0ebXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UI5K4YPy1l5f7L/GJZQp0OCjTek+/dcxDN58TYa2PXw=;
 b=YxC7VXIK3blNjJQ9tGj+9v+LG41CHAMGrTtAH510xAYZatmxSp/ymcmULZ/ISpndQEYtHJ4IQl0GkURf5pmHAq/+mSJMEcbPT7H+acH8wP0D9p5jMltoo1PJYxYZDsMliARsAdiBwTk8cHOD6yLXEM7STTfpCc2XVB05F+l9L+C59EGmrJyaZ1CpkFspYzDosljLhmsdyRF+cfSVntD9aNdF6jxfB6xhA1+GAAKk8usK35AwJdDWbfwuWLYY0cMTYv+W21Ooq95giE15AhOIOY7gVR3Zs2yWKREuhEa6FzjbYJ21iebF2IQCqvMYXRtou3vZo0tzA/9r1skj+f8MOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UI5K4YPy1l5f7L/GJZQp0OCjTek+/dcxDN58TYa2PXw=;
 b=n2UWvXO0XcQNs4Zi+2yBpkRYxiD7af5qVG5tKGB1GgI2CAEoGrG6DTmSet7xVC/idZco0ErMh/OhVXzhLSqyCSn6IwIdxXqkDbG8uDBE8Xx5qE5YkY+biDjCEChzOA8Yr88EMeaVmvTYtLFdrwL0Bl4FLRzCAr097R2IDU5XuWy7dkPz8Wx7ExPifOMatbee58pLeh1/mKXOwHpiVUM/zLW7O8EsTzThaUE8QFQOc3xBIA2CvCx6Afqyr7HMq4lBliL/bUwmIrefAqPhXoFJxltIf9PwD9HgHv4IAHyaof669KzQV1ELWVUgE7DkHzszmIYUbaiI1hMvicKvflGVVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <37367eb9-7700-27f8-1871-b84224f0c63c@suse.com>
Date: Mon, 16 Jan 2023 17:49:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 5/8] x86/iommu: make code addressing CVE-2011-1898 no
 VT-d specific
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230116070431.905594-1-burzalodowa@gmail.com>
 <20230116070431.905594-6-burzalodowa@gmail.com>
 <f620f8ee-e852-de62-53ef-5cd243e4cc09@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f620f8ee-e852-de62-53ef-5cd243e4cc09@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB8012:EE_
X-MS-Office365-Filtering-Correlation-Id: 946135cd-d31e-4a83-bbc4-08daf7e19d74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cRk7e8yBnA8s7+MTaGUrOEvOhjP/ruJRmxdn2Kmo0AWoFv5txV048ZgQDUN/b9zEMRkZj/o51v47aTdomMYBWj72Tupz3XvjIMm8UtJ74eC8b46LXSN5/GtBC5keOL9TzY4sFVoukF+iOP5NX8obzwqP3RKqhGV5fw/cxKabR1pdXNGj+fuKu/2UCTMbmygiH/6m77C+uF7kX+og5OhEmHlyLvWkFECbpkyfJDSvx08Uj8bzplHpofGDApMBcyZCIpgCPo2umhHSjJiiYDFVPt7Y3/Sfj7amORuZflfx7+0F38xCSSpKyHLnp6FUlT3KxuhwIpgg+ccnqZN4CGwSjAdTNUdCrx+SWPJwLrwOR5Rr5/zEYCaIqGYUSzEadNslEj2sSPJPxHaP8FRZpbGgfRvrMqy4Bb2qvtAMFnITkVgUK3V1tGjVk+ASm7l5aYyMu0IS5Bna9lh+/ka0rYQiT2Py49jQo5mUDb5wjicCtJkxpMxkdiGrQ1e/N6RVGN9SjK9GWiQ4tqIJ5EEeNIaHXLV6cWAflAusurjCOL67fTUthaMJ40l/c4YQdf/ozBNwoky4xNGL2OW4vizxoWMPp0XOzHEX8Vqyg5Y6IsIqHz8dJXwBkuaBq3tebhDeI8eJZP7Rq94Q7w4meH/beqIwolv/vjdMux9v9QUvEjJV21MLs7/mW3rOG48XbPLbxj1tNH2aGlv2M2vedkCTMVfUIN9oAR3K2ye8se0HXE3u3/I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(136003)(39860400002)(396003)(376002)(451199015)(41300700001)(2906002)(6506007)(53546011)(5660300002)(8936002)(83380400001)(31686004)(6916009)(38100700002)(66556008)(8676002)(66476007)(66946007)(316002)(54906003)(36756003)(478600001)(4326008)(6486002)(2616005)(86362001)(186003)(31696002)(6512007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHI1OHA5dXRHd1ZvR28rQ3p2UXZtdU1tY2dJNUc0SThvRHdEaGpiRU5udFVM?=
 =?utf-8?B?T3RhMTFPeEFVUjdzYXNWN2dmRllVU2lkYXV6RVN5bWlzbDlWcmN0UDJFU0VZ?=
 =?utf-8?B?UVJRWDFpWHkxSWRRd2QrUVJJSG85RHZ6cmRhc0xnbUdOKzJpUHFvaDNEaXFJ?=
 =?utf-8?B?cnZzb3NWWWF5SXk0OVgxdEYzKzVsRmc1dFFXU2ovcXFqL2NpalB5RTN1Y0oy?=
 =?utf-8?B?Q2tkSjM1Z2dzVDJqeVpzODBrWm42eXlnQjZ3TTcyQ0JGQ2t5aFQvOWdDQllR?=
 =?utf-8?B?bEtXb2FqMHF2clpXUlo1Q1g5ZVdNRjF3ZTY4Qy9QL3MzTlFoTHN0b05Xd1I4?=
 =?utf-8?B?WTFaL3hBa1BnbXNjUjNGdjhwQVFUVGRyVFlaWU1Gd3JxbjI2MmNXaDdzazl1?=
 =?utf-8?B?NDFhUFVKSHBRM1Z0Uzl4c1JWc0JJSytnU3EvY3drUjdRRjhVaGg2YXVleFh5?=
 =?utf-8?B?cHNjMGF4ZjNPQ1JNSG1md0xOSnZjeTdLUE1keEc5OCtYNCtoeVpnQTM5Qm1x?=
 =?utf-8?B?K1JWSHBucEZPeWxnMERYdlUwN1p5dk5uNHdobXcyUkRTR25XN1l4TU5jbU5w?=
 =?utf-8?B?VlpVREhHeVlqTDlaWG5VTXlZZ3k2NEhvZy9ubWRxL1Y5dHBGRG12ZlRQUmVw?=
 =?utf-8?B?cG5XTEZQTVB5M3lLeHJhUTJTK3NCSS9oWmJVa1JoWDNFWERZbzR4RS8zQ2c3?=
 =?utf-8?B?cFUvRXI1NnMyZWpOOFRHRGNKbldxc2ZyYnpDSFdFRUk5QXFQZnlaNWxERy84?=
 =?utf-8?B?ZGFGYlNHajhwTjA5STFtR1hJREhJTFExYXVZWURXVHBMSG8wMXhweUVVZFo0?=
 =?utf-8?B?TUdZSGpXbWhJMlNFZ2xCcURFZDZKZUdLdmViTkRjMXBMK0NBM0lobWJIWWVS?=
 =?utf-8?B?UFdGdFR0QUVyaUd3cmp2VStTalJRdVJlZXo5L1NGM0h2WkdXTGVCOVRIVFcz?=
 =?utf-8?B?dllVeFczbGEyUmxGVXlMT0wreUZHazZIZXlWUHZheTFHTytXNkdET3BObThD?=
 =?utf-8?B?eFZwM0dldUtEUjY2OVAwdlBNYjI0SDcvUWtlNS96VTNVcldFYkdUdXdQWU1J?=
 =?utf-8?B?dEtUcDNHeEczY05DZXZONTduTi96UWUzKzdjaGNma0tCUDFLeVBEeGxMcEpX?=
 =?utf-8?B?KzdoYWw2SUdUY3ZvOEI0REhDeEVVVVVxSFNBSExlSnhDZHJ4NktGUEk5ZjRB?=
 =?utf-8?B?K3lIc3NiWGI5S3lsRDBXTkcyZHdXN2d4MTRhV2RnRExBMm5iQzV2UUdDVnQv?=
 =?utf-8?B?U00zSDAvQm5XQ3pSZGhHZE1nYU14UitNUFU0NGc3ekVGVjZZSFhNYUt3OFJY?=
 =?utf-8?B?bURxSi94bGdISGJXeEdvOWIyblgyNVc5ZXBUZzQ3MkFyVEUrYXRRV1ZEVktH?=
 =?utf-8?B?OTd5QVVMOGZ3R2cvOVM1U2tCVU1ReitDZ2dOQklDUWg1RndqTU10WncxOThq?=
 =?utf-8?B?NFZwSjBOUVR4NVFkQ0dmTnJNT21uUW9sTWw0RTE3ejMrUnZZS2Z2SEk5R0Ir?=
 =?utf-8?B?Unc4dTYydFNIbVhOQlBOZXpTaFZ5TjdQN3JZV0dTMWYxRXNFRThxQXpBTG1W?=
 =?utf-8?B?bW9qaTZmYlMzZGVhT1BxZGxaMkx5Wm1MRVZTT2tackFPeDhzcnJYV2ZQL1V3?=
 =?utf-8?B?bE82WkxqUm5VekU1SVo0K2N4OHdMdHhxMUhSWXBRSjViNHMwSE9jSS9rWmJN?=
 =?utf-8?B?S1huRGdubDVkTGFneE05U1VDWVZWb0QzUHFyV0x6ODR6ZlVJbm94bFBJU0Rx?=
 =?utf-8?B?NGUvQnlzdjNCVGJINDJST1BNZUFSNVlnUVUvK2Y5cGM3VytYTmFCRS81M091?=
 =?utf-8?B?bTcxS05HY2MrUmlvbXdFOXJPWUpsbHNLMEM1ZC9mNHl2azduZGRVQ0lJWFdM?=
 =?utf-8?B?VHRnSjJJVUhFeVlrZ29McG9CbnFLUkVZTEJ5RTZsdk9jUGU4OUhhNUFZSTVW?=
 =?utf-8?B?OHV3VWRLMkhpdkVLQ0ROSUtUL2JOZ1NkVTVpaDNkWERncHpKV3ZxOUpjRTVD?=
 =?utf-8?B?TEx5dUF6UXh5TDZwVkFxOGtXNitXQXdRb1BtdFJJLythQTVyZnNobHRHWW1m?=
 =?utf-8?B?S3BjYzZtVkRWSzB1MnpHeXA1OHFSWUd0a3JvRnREdXFKZkVVdUFUWU5DY0Zl?=
 =?utf-8?Q?84tWnnDf0lzPsrHiRrImFc+CW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 946135cd-d31e-4a83-bbc4-08daf7e19d74
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 16:49:20.9284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aliMcca1qcZADwLljt4VWa9Y0fARZnErVpaZLXUPi6KDhfNXdQoZWSptsDOVzUOZGa+kA4jhALAVUMoRRRmx0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8012

On 16.01.2023 08:21, Xenia Ragiadakou wrote:
> On 1/16/23 09:04, Xenia Ragiadakou wrote:
>> The variable untrusted_msi indicates whether the system is vulnerable to
>> CVE-2011-1898 due to the absence of interrupt remapping  support.
>> AMD iommus with interrupt remapping disabled are also exposed.

It would probably help if you mentioned here explicitly that, while affected,
we don't handle that yet (the code setting the flag would either need to
move out of VT-d specific space, or be cloned accordingly).

>> Therefore move the definition of the variable to the common x86 iommu code.
>>
>> Also, since the current implementation assumes that only PV guests are prone
>> to this attack, take the opportunity to define untrusted_msi only when PV is
>> enabled.
>>
>> No functional change intended.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>[...]
> 
> Here, somehow I missed the part:
> diff --git a/xen/drivers/passthrough/vtd/iommu.c 
> b/xen/drivers/passthrough/vtd/iommu.c
> index dae2426cb9..e97b1fe8cd 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -2767,6 +2767,7 @@ static int cf_check reassign_device_ownership(
>           if ( !has_arch_pdevs(target) )
>               vmx_pi_hooks_assign(target);
> 
> +#ifdef CONFIG_PV
>           /*
>            * Devices assigned to untrusted domains (here assumed to be 
> any domU)
>            * can attempt to send arbitrary LAPIC/MSI messages. We are 
> unprotected
> @@ -2775,6 +2776,7 @@ static int cf_check reassign_device_ownership(
>           if ( !iommu_intremap && !is_hardware_domain(target) &&
>                !is_system_domain(target) )
>               untrusted_msi = true;
> +#endif
> 
>           ret = domain_context_mapping(target, devfn, pdev);
> 
> I will fix it in the next version.
> 

With that added (and preferably the description clarified)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

