Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC261773A7A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:28:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579887.908067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMkZ-0006fH-F3; Tue, 08 Aug 2023 13:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579887.908067; Tue, 08 Aug 2023 13:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMkZ-0006dI-CD; Tue, 08 Aug 2023 13:27:51 +0000
Received: by outflank-mailman (input) for mailman id 579887;
 Tue, 08 Aug 2023 13:27:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTMkY-0006dC-GI
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:27:50 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e4b174f-35ef-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 15:27:49 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9773.eurprd04.prod.outlook.com (2603:10a6:10:4ed::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 13:27:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 13:27:47 +0000
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
X-Inumbo-ID: 5e4b174f-35ef-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5IN8Ibj612KarmZ85cMngmIlSEj6XMzDxcKsmUJP0lu1HkmTzdloxrfRCCM04Au+Z4yMZcgGtEkoTUzGzRqixBOO//0lWgQTj/DrIQ3FC8yJ3JkT5hLX4Ifqj1HofKsw42Ykg5QTaaq6I1vicUnAQrLZITZz1KtCCJiV87dX5w7HSY5OQLcMlur2Odh8E9ac7Y5pK+9I1Jc+c2PO4V8SO9ChUYBQxV86l9bQuPV1Yj/1uovpxTRI3xIAnD57RgYrp9mAL/Q1YwpNPAmCoiqY2wKGPcNDXeIZW3PXzHh+83YqPou+m78KUUrOPhN51RdzXfPbgZwjRMKAe9E+jut3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+1bKuDF35nMD+PYNOUpTAuzjL08nbd+vBgymUMmn3s=;
 b=df5IM0af2Vk9olW5jUUG7X67Q92m0BCNkWVxTIN3KqwrbkxzQnvS8S9JOYovF7rf9c9LC7nBhrccx9bb0P93YN7Sq6VyZ7WqNimBNFvY51UDvkWEAvJX56B0S/znsBPfDkTkUcLd2knTMsfk8ydCAReo0wdLaiUxwCYsDNIVBMpVMriaq8IIzNVGws0ZW3gpsEdCdUbMK7Mba/p+9bqxkeQ31SvrjkvC7hP7c5o0uUoH1ZJzJ0FWjc3P0+WgG77WX0eF6C2RlceI3jHCaDK0HDTekpGDsgwdR14F+BRC/zTZwDwjCHx5bfmzREo2uENtXiY/75a40gEOc1Op6UTu1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+1bKuDF35nMD+PYNOUpTAuzjL08nbd+vBgymUMmn3s=;
 b=mJuuHF+xlGVpH/hzVfZdq4N/1GqluVxtq5BWwM/g4S5mycSb7KkF6g6ms4EaZrgK/FslRFa+959VEGzx/AEc0W7HL4mOS0dO2ordQpxqCp8IcIl0VBKZMpqZ7+YOlh7LmxWBLQE0kVqclu6muOciZj+oDlZvXDq3khnfC1IIUOeeZwdrnSiTY727f4nJI5tWVnCM/Ex3MnTxhTONxlqfUUluVzDVtIwvBzPG3v/VHAIFPiCcnKyDRt+zPygN8gsy2BBrEYk0AGaOx87jAMWBCw6FtqtS7EEFK8tFJvJrvb1mXel+Z+/OkkKUziwSLqVxbL383a6cJ3wFwrU0LsrVeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <10f10773-698e-e834-14dc-51477388fda8@suse.com>
Date: Tue, 8 Aug 2023 15:27:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v3 2/2] x86/setup: address MISRA C:2012 Rule 5.3 and
 8.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691488505.git.nicola.vetrini@bugseng.com>
 <05ff36ef9e1838ac782201998f49f6f56f78332a.1691488505.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <05ff36ef9e1838ac782201998f49f6f56f78332a.1691488505.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9773:EE_
X-MS-Office365-Filtering-Correlation-Id: 83409d74-a98e-400e-f6b7-08db98134157
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xqdZ+54HsLabC+TnsUgVcFdaVCRD3C0wXgQTpXoZbj0cGSC+dylRu2XSLTDt1JmrHu5r0oad7qfe6B4kWqbl3lzByN7vdGtQi7Uqm6PJ4YcW1pP3PF/I56XwlU7kKKWa9aGqVQ35gXXxwkk/TTHFinCPVlEfO+VYyJxqlWZW7AQiRI8YAtt2w/ATkezVPVhc2Kv11KmLfP8CSb+91KC2NEp/66Is5dGpPc1lr0K5V3ohw+1CNz1oAkKAj9Y9DsrrLLaD+RrrmhkmpJ4levC2EjUVn7Iyq9vJS3v5L/Aaa+LvOxJDzBrWFiQwWC4lnac7W9MGmKKU+3t1nx9ewUzypn051KeOfYJ8TqOR4b1OvyTL797YBHdG+ExkcgABB7C4+hPv5fefNRz3omXDOmQDiqFGLV0+hU5AcWFvsmrcAZUJ8zEs3VFIojLn6qLrSWgN4RTHUD3jRin9MZ9BS0D94dAN3X6ghjCrB/PfBNuBBN+TIuO1p/A0iJYZcetzbO7dmOfPrsIhd8twuRBUY22zXSV0ULuqg2HkjIXdVrZiDOUyr5lCrmVQ63er+A3D2/YcdnUlXsanFfX4OyxWhrcNmZKaM9XLey9OqpEbtWpBMRMTj0227O6/Zmpp52MHIfXcfxQkjmIv1tPdyGOXdBxBaQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199021)(186006)(1800799003)(8936002)(7416002)(8676002)(5660300002)(6916009)(4326008)(41300700001)(316002)(86362001)(31696002)(2906002)(4744005)(6486002)(6512007)(6666004)(2616005)(53546011)(26005)(6506007)(36756003)(66476007)(66556008)(66946007)(478600001)(31686004)(54906003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T01YeStjbndjcU9mM1d0MWd3RjFNNVFabWo3K2FldjdQNXBlMEtsQTNBdlo4?=
 =?utf-8?B?MGxObmF6MXNSZ0p0cE1hYmUzWDlhU0R2TGZ1ZFR2NVlPaUJKek9SZ1JsTVVP?=
 =?utf-8?B?a1FyQS8xVHBqMTN1VC92ZE53bm13NG9LVUo1K0pUekUxbzB3RUlRSHZtMHFM?=
 =?utf-8?B?elVOM2NTbjhjdEJreXhORTlZTUNJTFAvZ2xNT09JdXZhalc0aWw3YnhjQnpw?=
 =?utf-8?B?azhlMFcvRW9kMHdKYTBGVGoyOXBndk5aKzJ5aEUxL1hxdUF1UDFhVU1tYThm?=
 =?utf-8?B?VmVlelRjTGdQeHhmZlJoTUNZenlaSUVScFIzbWhJVHlMM214TXMvVURqMWUx?=
 =?utf-8?B?QnllNnovZEVaNjlxYmRsMUF4KzVIUWZRc3FpdDRWc1d3c09QZTIwa2dIakFv?=
 =?utf-8?B?NUNLVmxkVm10b0RHL2NUSDRTMzUyajBoMW1CUmZ0aDEwOVJnVXJVKzVPZlNU?=
 =?utf-8?B?cWQ1MW9xNnlvQUJVVG81bG9RZDBRQ3U3ZXI2eEgwbzFDbVlaa2YvNXZCUWhz?=
 =?utf-8?B?cFRYbHlnRVRDckp6Uk5kRkVES0lWNVI3cnBQUjgrZE4wU0ZYVS9ReUxTVFNE?=
 =?utf-8?B?V0VFVXVzd2RnWUs2blQ4ak9MWHk4T0o0SUFsdUVTa3VJZEt2K0tjQksrajVq?=
 =?utf-8?B?bE5neDFPaDFqckkvMVp1cHR1K1k4cjJhbUVOUlVHKzl0bDM3ak52UGJFcWdq?=
 =?utf-8?B?SWlremFmZ25lSm1yeUhPQ0NRRDZDWitFZWh0elFEUVJzcmgzRytHSGhwZ1pz?=
 =?utf-8?B?ZmE4ZzBGZ2FSVzRuL2R2OEltbjlOWTJYT0NuUDA2ZDY5VE9HRkM0M1ZnWTFw?=
 =?utf-8?B?bTJSSEsyWnV2REtuTzVsOWtDMUdmaVVYbklIejRkQitENE5YV3o0QXd3MG42?=
 =?utf-8?B?Z2tZeXJxKzRJVjA2eVg4c2NldW0ySENPL1loclMxb1NlOGRlSW5XZ1huYUdK?=
 =?utf-8?B?SjFCaVl4bjhIU2VoRERGbWpLdDU0YVh6dHRLSmcvWHFSVmNxeXJVTVNiMnRi?=
 =?utf-8?B?M2ZzSGZHbER5UTNIRzNSYkt5am1KaDViUEh6VUhkS2s2djFWQTlESVZ5My9j?=
 =?utf-8?B?ZUZYTk41V3NCL1pOZVFmWG5YMU5RSlVKcFE1MmFzWnMySFJSdlpoRmtIanlt?=
 =?utf-8?B?bksydkR6NzhYTVdaalFhWE10TUo2UjFWRm1xVGpGZzI2bXVwbzg0dmRlc3RQ?=
 =?utf-8?B?ZkJkNnN5Z2tWUU1jNlQyTlJqVm00NzZ4dHpjVmV5NmxyL3hRTjQ3cUhGMnFs?=
 =?utf-8?B?emhUTUdQZ2pvUHRRTFNkWTd1NklqeTNiUG8rRXBxQ2ZRR1RycHJxZEk4M1dy?=
 =?utf-8?B?Vm9rSlNacHZFcUNqVmdoVjNMbXdoRy9qNTZBNnR4YWlRMTBuSHhkZW5GN3NS?=
 =?utf-8?B?SHVpd01oNU9GdHNLNFJUWklrNTdadEJDejRuT0Z2NC9JbG9tZGE5U05IeU9u?=
 =?utf-8?B?NEk3aEd2N0JGMWxYMVlwZ1dRQ2VNdkJuNXhNQ0c4T1AvcXNEdFVQS1ZQNisv?=
 =?utf-8?B?QmxkL0kyamF1US9qaklhUldWVTdTWHJ2RnU0VVkxdkloSHBuOEdMZkdWcDJD?=
 =?utf-8?B?ai82TlZ1UTh6Yk9Odm5xZWdtbHVNY0pzVWg1MVBaZ292a3dlemM5ZkhFSkZ3?=
 =?utf-8?B?RnMvWVpoakNCUXNiNzZ2Z2NKMjN3UHk2M2JsZXRsS2RnRlp0cTUzTmY4RHRp?=
 =?utf-8?B?KzBDN0FhVmMwSkVoNTh1cWt2L3BESGNUWHlqNWFubUpmbk1iK0ZWcGxBMTc3?=
 =?utf-8?B?Z3B3U2Zyc3orTklKMHk3MEw5ZEZ3Y0pINFhnMSt6QTZxYit5Y1RjdGVkZzQ1?=
 =?utf-8?B?R2locmozSnhWRzJBNWF3Z0FEeU1EdDJzbVpxRFhaL1h5NmNuSmMwaUxSNVMy?=
 =?utf-8?B?dDl0WnBtRUhKUnJhTFZrM09UeitPeFhMYkpLcm54dHhBYkJ3Sk9EVEZtSS9i?=
 =?utf-8?B?Qjl5R3JsN0R4MzF6RStFT1c5VzNxSGE1M2trWmZ3TnJVMU4raTZRQXBFOGd3?=
 =?utf-8?B?ak0xZjA0TGpJeEFTeXFETXVHczV0UC8zTmtIT3lydTFWOEl6NWlpbEI3anRP?=
 =?utf-8?B?cVJHRFdoN2szbkx4Um1QaFdOcWw1bnkrN3l3Ync1NEFiNUFVVVgvT0NsYzBz?=
 =?utf-8?Q?seHPz7OK2h2xpFAgWn2rWxWCk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83409d74-a98e-400e-f6b7-08db98134157
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 13:27:47.2252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++ckueVIMNc/Y4U32RMSvEOC1iO85poyJikh6vIC/sFIr2bJQXjahGahMM06XfaPQ2KmvZs2xjaH6V8da+zr5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9773

On 08.08.2023 14:22, Nicola Vetrini wrote:
> The parameters in the function declaration 'construct_dom0' violate
> Rule 8.3:
> "All declarations of an object or function shall use the same names
> and type qualifiers", but also cause shadowing inside the declaration
> scope with the variable "static struct file __initdata kernel;" in
> 'xen/common/efi/boot.c'. Renaming the parameters in the declaration
> resolves both issues
> 
> The local variable 'mask' is removed because it shadows the homonymous
> variable defined in an outer scope. There's no change to the semantics since
> the last use of this variable is in the scope touched by this commit.
> 
> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



