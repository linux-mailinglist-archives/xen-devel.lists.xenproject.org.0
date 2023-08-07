Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DCC77278E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 16:22:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578530.906068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT17a-0004cS-0r; Mon, 07 Aug 2023 14:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578530.906068; Mon, 07 Aug 2023 14:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT17Z-0004Yl-UN; Mon, 07 Aug 2023 14:22:09 +0000
Received: by outflank-mailman (input) for mailman id 578530;
 Mon, 07 Aug 2023 14:22:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qT17Y-0004Yf-Mg
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 14:22:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7d00::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c96dad11-352d-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 16:22:06 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8824.eurprd04.prod.outlook.com (2603:10a6:10:2e3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 14:22:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 14:22:04 +0000
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
X-Inumbo-ID: c96dad11-352d-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hpu/oM2MO/1mHgGLIPOWBzCu4gweLIUCR16di918gmvcXX7N+PbHUmJO8arxfyTEk/cbRcqY3aop+akUFr02aI0XPYnhgDhyw5L2SMWAFXLV8UKOtmxfrIhIDhHVWyrHgDX/c401JH6W3w/DzD/HyKZpRBb5PZcCnpaprLo4riZq7/WgKU1pTeLXfGkgHqY+WYKlPJsKlSY+T0n4/XTi+sfOX+bjDQavGIwPo8HjF600r6tFZ/6mx82Y7iUakgXNZEI4dpmRnGVeKl/JRxF4J9q/PIrV8LKOYJBd0ceZ0Yp7u1uAeTd0WowDqVs+3xWxDVwjhpM2y/ADJgiJv5dl7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g03/+5n82cWsivO2bzntOum8YMFLFr1mwYPXGPWHrtw=;
 b=TKyzGmYKQMxcUU9/+15CrYnVwMymwct4VscKPgprepKLq65E/laK7B9XId8uaGkoEW6C66tuiIzQNJFL6HgONP7rusVwJIvo8ahbGyKDs25+b9WaW8+9CDDtWVpqw6rMZ9x6b2ixQMrL+xzsTPj2GCii4p05BdUd+SFlZ7hHnQ4Dv8yMVdsgpLymUQVwa7rS1AC0YktC5/o592LsG/V56H3567sCs1t0ifmhO5e0hs7kxLjl9C/0wew6vKQF0nrYDjKbJN91AhCsLx0bkwljifHCl3GqJeZvqs4ViGF4jt8LIlOqqvy/81jPvWbVt4GMNm6tFB8Xyp4KlXi2HuKArw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g03/+5n82cWsivO2bzntOum8YMFLFr1mwYPXGPWHrtw=;
 b=UiAQ+rQTiv3G/5CznajYmQqUEApC2oZ2+rPWAF276iHkD0MYWVxWZ7rWwrP3ayxYuSQqg1AejAFHaEsq19SyyIIfIMSI8AbIcLHC8iOuJDQclsixqADbHbTsGjcbQzaK6QoCPb66xIBI0utU3Ll+2us8yalUENdp84TzUfwE37YJ0kRE4tbaGYr1OF/6aMwNYcvdx6h589WENNOHfSerJFK13DTVIXFQqks3TYTXqKsRo2HiEWhKAftI2BD3wpztHPN9vd+WHtCpbl72ae6MKCKZdfvK3WcS0fkzlsC8uWdjp+NN5ZmbmK+IUHnW4wCeATLqQ2tL0OPgq24yT/tXaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <264a97c5-d25f-1c2c-9336-4b5744331a6c@suse.com>
Date: Mon, 7 Aug 2023 16:22:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 01/13] AMD/IOMMU: address violations of MISRA C:2012
 Rule 7.3
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
 <2af1f76d2c002dd9f0b01eebf7af516d86bfe91e.1691053438.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2308031740180.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308031740180.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8824:EE_
X-MS-Office365-Filtering-Correlation-Id: b3d91cde-94f7-41ae-4e46-08db9751ac26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ky7FnBrGhLbxj2kVRsPB4xKJ28vE3w1tXhKR9HPNP9WaG8ZDaNCbaswQra0flaaXmAGpkuZOqT1eoVfJrW/Xllkd3tLZGPNppuFey/Kw2DFSbnm7zkr1/BwsZeFTD7Sq2aN7nL1KZyP9S7c6NwGlyHlCJu/UCSbGXpARA1No4bIPSKYYUibFKpoVNWDyUDjsB5pEwYWSJk+NqeA4wBuqhTq4pzyIkkdOT17HhGRuY95l8fB4ZygxaVWQKvnYczlYMOfeWlsyFpyDwB3+G8pR1HBxvOCQhmhMB9RY6h0g0hOFtSvtKSrkUG2Bh8iXZ9tkHez41S2rYoMOSqlqK035OSAgqMEo5QdRVp6THY+72cEMBPebxng1oZ96qzy0yo/I8WrfH3mzE2LyUaXHLk70bnzMalRpmaF1YSkH15XmNJIeVTEpQ/95PjhJlIGnagm5JXX85crR3bBX+Dmrb5blU1htwBKEvUvXTtmoxkIxXlDB+d8jYwc/i0JdlzofYZhH75WJtRbJ6fzeAivxhdg+X8T2fPmhrWbloAeyVSCgJCmQv7RxrYHrPL6Euxy+07wPHublauaCexoV0asnJVFIAi2RHU9c90EJclIRBm/eRW3IXzwPZ5Ght9UDgP+ucHRvaaBpQtV8n9TNWSaPBhjdZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199021)(186006)(1800799003)(2616005)(36756003)(6512007)(4326008)(316002)(6916009)(86362001)(478600001)(54906003)(38100700002)(66946007)(6486002)(66556008)(66476007)(31696002)(53546011)(6506007)(41300700001)(26005)(8676002)(8936002)(4744005)(2906002)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a01IaU84Y3lNRHcwTjBvMjBmeks3cGtmb1I5OTNkbkI2U1FhbGZKaEh4WjIr?=
 =?utf-8?B?QkMxenVNdkRiTXkzdTlkZXZzejJ6aXVxMytvc25KZi9HRERiY0RFcSt1THhy?=
 =?utf-8?B?QVdiM0NJb2gyejMvREtVMGlnNll2WkdhK000SmgrRkZNOTM4YlB5TFNqMDN0?=
 =?utf-8?B?Vm9hOExCbzU2NVU4UDRpUWVMTElRZ04raE1YbVloZCt6UUtoalhxYWViOXFP?=
 =?utf-8?B?NzZVZk0vZFRVTC9wUVZXdDFZdFpKZnpSb0lnT1R0Mk5yWlZiUkdDVmExV0cz?=
 =?utf-8?B?eEc5ZVE4TWVKM0I0enN0d0x3UUhyMUJ3MEtHcXF1YlErcFJtMjJaY2ozSXRD?=
 =?utf-8?B?M1dZUGEyTFJCUnF4SUl0RjJmRGZmekxKTVpOamNoSERLNEJSbG5kOG1DdmxT?=
 =?utf-8?B?Y3FTNHpKT2NlRmRRWUFNYVRvamNuaVVvTGJodVlqcVRRcXdtU0hzQUZKQUJs?=
 =?utf-8?B?SGhIU0tTTmZRcExLN01SY1dyZFFpS2ZqK3dpSmNXNzZHL3pDS3l4djJOSmFM?=
 =?utf-8?B?ai93RDQ4aXhBL0pON09XWHhkTFJ6QnRyQlVkcDEvSUtrV2JvK3JrcEZsblRP?=
 =?utf-8?B?T1BRMm9PV201Mk1Yc0JPTWdMaWFJYmp2RS9FL0RjU21Pb2w4RlpYMlRIeHhn?=
 =?utf-8?B?ME9WS1hZK2JNTEw1bmVBNW5iUHlqSWxrU0c3Z2s2SHJLcUlWU29jdEd4OUF0?=
 =?utf-8?B?YksvcnZoSjlQblVBSUJWY2tmdng5Zk1mMThaZ0JOTkg1YmRXTU42T3JRY3lp?=
 =?utf-8?B?YVZpN3ovYWp1TFJlb252ZkY5Y0swZ083bmxsOGh6M3RYTTZ6NnhLaVJQMndC?=
 =?utf-8?B?blNWeUN6bTZwTlYzTkI2TTlBK25FV1NXRlBsWGJQNENvNE1naVgvYlJSbFM1?=
 =?utf-8?B?R3BlcDQyTnpHM1ZmalErMHNGc2Y4WmhPYU51K0Y4MElxelV6ZmdFQVBGZzJq?=
 =?utf-8?B?Y3FIQTUydXBUQ1IzeUZnUDVocVJLMUlkQThwakZ0c2hsQklWV1BRUUtTWHhX?=
 =?utf-8?B?MlZLWUVTYjNidUExdXgzeEJjZGQ5dGllWmVqRG1qWXlROGg1Q2N2ZGNDd0Ju?=
 =?utf-8?B?OHRnaFJzclJFR1RDV2txRDhkKzVLS1p3T2hJdGdMbzB3dHJnOHVUWFdFYS8w?=
 =?utf-8?B?NG9HQTgwWHFCV1Z3TjdPSTUwQzRDOWE5WW80UlJYT2F6WUx6aTdvR0swME5L?=
 =?utf-8?B?Smk0dW5WSkJEZUZaVCtNajBTc1ZSaEpvWm81OW9xQlBOZDdVOFBiMkNsSXMz?=
 =?utf-8?B?aG9xNXhjaVdRWkhwYWhWUXE1QTN2U1NWMGdTME1GVWxidEllR216QjJZRkp3?=
 =?utf-8?B?cE5TeU9RZ1M0ZmdvUFVYOGxscUloUlFzQjJkNldKcTlnY2JNeFFkdVRhRWhV?=
 =?utf-8?B?aTZNUkV2VE1sU1BuRG9qQ3FJZHdPbVA0ZksrTnFoc01UWU1MRGFPdmdna3Ix?=
 =?utf-8?B?Z1pNVHdla2ZoVFV2aEh4MWZTYnc2M1JaYlZFZ3hxQUdkMW5nTm9SazBIRU5Q?=
 =?utf-8?B?MGxTU0VaMjFYWGFXVUd0OE1zRUpBUkxMTEw0cU1kUXRENENOVGtGcDhkWUFV?=
 =?utf-8?B?UUNNUU5hOGgxUEhqeVhNS0tOdFJQMVEvSEtaVXJ4cWdKRk9yYUVXcGpDbVJ4?=
 =?utf-8?B?clpLaDRMbmNUckRtbHRoK1V4Mm1CSXlwQXBvbEVWNytQTlVCYU9MZHR1aUVI?=
 =?utf-8?B?bmdUZUhjd0FnOVl6UW1VNGZmUlVxZ2w3ZXluZ3V0ZTFSUHJSVU5uUk03ZGJ0?=
 =?utf-8?B?cTg3MENvMm1QMjF5QnRwSG9EaWJ6dHovdWw2c3h1TlVQcmVwc3JsYU5xS3hV?=
 =?utf-8?B?cENIaFd6QWN3dzBnQlVTYTE4OFIvYW1lejZyTHJrL3VtOEJrVWUwTkZOcEFt?=
 =?utf-8?B?L3phV0xyYlRCZ3c0V24vYVJEUXVHRDRIemx5Vm1TMG9IclNMZW1QemhtSjNC?=
 =?utf-8?B?ZmM3ZDRHd0NYNkVvZGFvQWtRSkYzbEsybkNXd0tFbzlqMUhzRWRBUVFEbEI0?=
 =?utf-8?B?bmMxeFc2NEx2dUpPbkJJSmpEY1ZXTFhYV2dlamg5SEp6TmZNNVdpaG4vSUdE?=
 =?utf-8?B?ejRiT01UWjNOcHhkaVhScmlGKzJpT0dUZmtXbnZwUHNiL0VtWVQ3RzU4SFl4?=
 =?utf-8?Q?oIktEcz5VV4d1yo1ELNxH2cqL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d91cde-94f7-41ae-4e46-08db9751ac26
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 14:22:04.1094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MkBHoeVN/1ZbVNB7lxSZWNKSDyu+eyKi033GWIrZkxVCMBJlt09VWFNqEgE+JF+Zv5+lchRJtjJbKtBZKbXobQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8824

On 04.08.2023 02:40, Stefano Stabellini wrote:
> On Thu, 3 Aug 2023, Simone Ballarin wrote:
>> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
>>
>> The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
>> states:
>> "The lowercase character 'l' shall not be used in a literal suffix".
>>
>> Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
>> If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.
>>
>> The changes in this patch are mechanical.
>>
>> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


