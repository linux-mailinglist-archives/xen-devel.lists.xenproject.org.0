Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0314C405B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 09:44:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278853.476261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNWDI-00071q-36; Fri, 25 Feb 2022 08:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278853.476261; Fri, 25 Feb 2022 08:44:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNWDH-0006zb-WA; Fri, 25 Feb 2022 08:44:32 +0000
Received: by outflank-mailman (input) for mailman id 278853;
 Fri, 25 Feb 2022 08:44:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNWDG-0006zS-HV
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 08:44:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24ca2863-9617-11ec-8eb8-a37418f5ba1a;
 Fri, 25 Feb 2022 09:44:28 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2056.outbound.protection.outlook.com [104.47.9.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-PVe12tJIOZqNzLfZl-yF_Q-1; Fri, 25 Feb 2022 09:44:27 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM9PR04MB7620.eurprd04.prod.outlook.com (2603:10a6:20b:2d9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 25 Feb
 2022 08:44:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 08:44:26 +0000
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
X-Inumbo-ID: 24ca2863-9617-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645778669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/iyaoknACxl0d6KOSX3tULqJRL9tvjvk7Oa3iw/mrck=;
	b=fuTZmmpw5dWCU4rWAWli2MMWL1xNDb/OjNDADocpEO/2TLL5iX/7Ff1pqxzKkqL88qDOH5
	yP1RIhAiOEN4TAiviF/4G+jAQh5mqV7T0ZSZJC9YMAxQpq8axB3IvvvtQ8k3sY9D0wzqTC
	Wa3b+3WJ+MY9Y/B1NEihFzmhsBiRgs0=
X-MC-Unique: PVe12tJIOZqNzLfZl-yF_Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtNHkJBnL7SioBm2g3W553qw92Ev6FvMNM0xHsgUYJez5pkXh8415UhvIGMkoKjyxok/Jq4z3BfPtzVNKZnDPzLVVdHaCItzbv2HNVGk3shbIPU/tc/mZym0kwdk9IRYzz1allbXwSvYRELGO2VKU+UeZsxMeAabGI0bqaKbfaWAdWNIhJ/JereDeuxG8wW19xdoBFXd3JEz1zZoZEWNNXlKM9ydDyR70IwdV+e+QLFuOU+uLhXx0SzT47bNFMtgOFZcPYglPfFZxChDCSG7VDu2MLFp3+qYFaJ61aEOB0euesI/jrQv+L0yg94TZZgZZCMnNmWYxEPOBUvRgU99qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iyaoknACxl0d6KOSX3tULqJRL9tvjvk7Oa3iw/mrck=;
 b=amuI7sERtQ3q0DGSnF5qvTQvsuAVdKXLHB8m1nY7/ZAB5694cQxysevxk+QVDrQMDspMxu1VEAlyNKGKFXlDYz/BNSga7TroVquXWV09hyDpBWzo4zu1W44mHku7CdkHUVw/apmX1gH6W+x/nBXKUHzC08AcJ0i5CYJaavsaKLPhYNlVqKBwxVavyokNaJu3txs7VLl76jG7RKaByUrZNmla0RsfhfWqBfEzFd0lFIjR02/WDUyqdFuZnmdN9943xw6iqpH2xeQjWsf1C46+bUvIMVMVHJIHttyOz/SC9Nim11b9gttp4mBURWhqe5P3+r9tvAJ//V5/XCA1/bmy7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <12d8b90b-15b0-c094-71e5-35cfdbfe72b4@suse.com>
Date: Fri, 25 Feb 2022 09:44:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: x86/vmx: Don't spuriously crash the domain when INIT is received
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Thiner Logoer <logoerthiner1@163.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220224194853.17774-1-andrew.cooper3@citrix.com>
 <20220224194853.17774-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220224194853.17774-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d90724e1-f7e4-4d85-e397-08d9f83b0775
X-MS-TrafficTypeDiagnostic: AM9PR04MB7620:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB7620067158568F0B7A9BF611B33E9@AM9PR04MB7620.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S6Ud89IYfh1YyLHZc1NLvRWYL7oWATS18LKVemzqPTnxlN1OSFZAKc+g5GLwY5Rs1enzYKN2ZalfHbIIxXfDEsGpMX+7ob7wO868P2rIGPvCZDNA6CueRUPQb5qzO/3Y87J4LZy1qCfwPLmoOfmZnpQO3bAN9GrIMy5n1OjYvGREP8zwvIkGGWTUCP3uLndrCPuCaYvQXT3tJSaH3gStJHmay7VOeLQyZqB0K9OzKq0gZ6wOUZo1O3zzod+4LI+9YPXDcUGrBs3vNXuFKVvCxHug/71NnSToyF8unQhf2wMKe3VgcNfjl58D2o5q3A/dppVgdfgWh9udTCtKGYUr4xEwW6cNsHadnR7an1Ki3IiNL+qdB7b5P1RlkF/AgSNjCvVPJ5BU6+RvyNeDIYZMSr6d00EPenGhMhx6Hyi8nFXRO3WWPguVz6re74pE9KVr+fU5A+7WkLMDn9ne4TL7UtnW7e3m1smpoZZ95KLkHBk7hEHNhvt6G0Lzgfl057kHmtMtjp/Xr0fGS1rF+FAzm52AfnTMHuu/Ij2ggJfEK+uLvApR23Fcurdrngouks8oqPW+DRmQ/QjF52zsShzoOZZUUYrRvOLLddOJrGHuC0vDnfl8G4v8Syuv2kSchhiD5Orb1/WW1gRpyEo7QtXq9HljheqA0uPgtNi6d8VlLnOK8f6T9l3PJ2r4/DVoXXZctI0lSwaqx5vTwzLKIR+uG4bNRrCWi21zGmlGGciSkm6rLuVjr4gsa33zOq9mDdsO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(8936002)(38100700002)(508600001)(83380400001)(54906003)(6486002)(316002)(6916009)(36756003)(4326008)(66946007)(6506007)(6512007)(31696002)(86362001)(8676002)(66556008)(66476007)(53546011)(5660300002)(2616005)(2906002)(186003)(4744005)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWtkeUE3UlFDTFZLd0JvSUtaN0lLNStXVDMvdkFwaWlUVTk5S1p3ek1ndmFL?=
 =?utf-8?B?NFBHdlhOY1J5NXluUGRYMm9TSUpWeUxpR0c4aGpNMXhodVNMVnpwdDZBcVNh?=
 =?utf-8?B?eEtWazl1Yk1tRjQyUjcvQ3VkR3Nnby81enBGMUF5WTh3YzRaU0N3YXhpTmND?=
 =?utf-8?B?UUZZck5XbVQydFlPeTY5N0ppR3ROampkUXN5RHkyYml6TWd2OEdTU1dNTXR1?=
 =?utf-8?B?QjlFQU5hM2VXL0Y1azg2K25UOUV3K1JLcGNnNG5VRmkrWFVZbkN6T2JiQXdk?=
 =?utf-8?B?aGN0RzMvbkNvTnZucVp1bGR3K016TUNyUnJ2aU96d2l4SGxKUHMxa0U5aWhn?=
 =?utf-8?B?Zi9NektnNlB5cTExb3NFeUd2WWtmdlhCSHNoQjFZRDZrVFFHenRaQnFnSS9B?=
 =?utf-8?B?Q2NHTzRnUjNkSld4QWJBTXpXWHpZUG9weXBQLzRhaFlibTBVM2FPN20wb3ZY?=
 =?utf-8?B?dnVOa1ZmQXRyeW11WHJRZ3IzS2tiKzRkT1FELzRpUUlYS1BtaXllZEQzSVBE?=
 =?utf-8?B?UjJRVVh3Q25yYlhYWmdPL1BlMG5CWlJFbnM1ZC9TYkt1blVqUnRkVEZiQm5L?=
 =?utf-8?B?NVFMM3ljY3doNFhFZzVwWlcrUGpNaWpySnp1ZThQL0VKRDFWY3Nyb1R0bjZC?=
 =?utf-8?B?SkdsaFZaaFdXelRkMC82K3RBc3JHTit2M0hDY3lIRFc3YmV0RStyQUFYWDc2?=
 =?utf-8?B?SEdFTkhralRtcTkzRmFiSy9QVGxDNFlMY3E0T0VLUTBwTDYrak90dURTS2tj?=
 =?utf-8?B?YjBWY1VxZjFsZjg5UUtxWDQxT09ncElLUzJNdGFwZkFOUWV1MVFzTThPTThT?=
 =?utf-8?B?SlJVVEhuNXlRNEF3cjdENTdFdXBpL29Rbnh4Y2pEYTAxbXU0YUd1UkgzdXNY?=
 =?utf-8?B?VjZKdTV3WlNKd0pSSDRNTnA5NkZrK05XbUpIaUZDdkxrYmRmRjlnd29rMVk4?=
 =?utf-8?B?b0dXV3ZZNzBmUGNPMTNmR1dGb0Y2Tzk2a2JUVEUvVGg3TEQ0bWR0QUI4SlNJ?=
 =?utf-8?B?L1preDZQQ0RUb0tMOWZGT0lVQ0JQczFkbHJWMmNJOG00TWdYbk8vQlJuaVky?=
 =?utf-8?B?eWhhMUhBTmZqNnEydnJTTGJYK1JIVnhjdVIxYnFrN2JVQ1NvcFBVcklvc08z?=
 =?utf-8?B?UWk0YXA0Y2h4bDJ1ZFIyNGFvUmd6Qko3K3hOaEZnOFZWc2E0UndZd2o5UHBo?=
 =?utf-8?B?cVg1M0pJWXgxRkl3OVNkZlN4KzJTeEhOVTdQUDI1L3F5WFNHZ0UwNGxzN0dQ?=
 =?utf-8?B?RXJ5enBSa3dXbmtzeUs4Q0NidXhSSXZCczF6bGIvMW84SGxWTjRDY0l3Z2Zv?=
 =?utf-8?B?aUFHZG5rc0ZRbGtWTlZ4aHNxOG1wN1hzdVppa0FLK1pDN2IrVHVhSGRwK0Jo?=
 =?utf-8?B?ZEt0eG9KT1BJd0dITUlqaGowbWZ5RVVIMS94SW13TjlSOUZLVkg2L0IyYWRn?=
 =?utf-8?B?NURCTVJ1VVpBd2lmbVpNR1d6eHVwVXV3Si9DUmk1dXVUS1plUzA3YTF3OGxD?=
 =?utf-8?B?dFBVcldCZHVoQWVlcEVQb05kSDN3dzVUb2ZTYkhKdCtZWFJvcW0vNTh2bUVv?=
 =?utf-8?B?MjkzejI3SFNrR2NVaUxKdlM4b0RVMjRJK0xiekpjekJSZ3J3OTRQR1N6cjBa?=
 =?utf-8?B?UWRQTlgvbEpudFA0VEJSTUZSSUFWR281cktPZGVadGNrTSs4UHpzZENYYjFM?=
 =?utf-8?B?ODdiMWF0OFFtWXpJQ0hCL1NrTm1iZWNlQUdXbnArSkJoQ0tsMWlud3RzVzU3?=
 =?utf-8?B?SjdxL3BJYlcxZ1pPNGFHaGg1NC9aRG9lUUUzRmtjaGZRVy9QQ2YzVmVDNk02?=
 =?utf-8?B?Z2V0aCt0U2tUbVdUMUVYVC91SmJQdHc5Ny9SQUhRQlB6NnJnYjkwL2ZmdjM4?=
 =?utf-8?B?M0w5RlFTbDBIbGFFVC9MMG1FcTJrYUhLRTZ1YWtZQ1Bhbi9ua05BaXd5WVlI?=
 =?utf-8?B?UmdXS0R4ZmNzU3ltQzcvR0N0eXpmZGlOOFZERmpEUXFrZnA5MkNEL0JtNm5N?=
 =?utf-8?B?QnR1eFRodkhFckl4MWZFM0pvN0R0T0VIK1I4WmdnRC9obDYzTEE2WWNkeUVi?=
 =?utf-8?B?VTFPajhHeXZMODg2MnFkUUNUWk83bjVuUHJTUERHZUI0N21jbGd4QmlScnJj?=
 =?utf-8?B?emFXYktkN0Vwd2VVL0NzQlpHN1c2Z1pKSG1PUzF1VHlnc2dKK3hFckNUS2hT?=
 =?utf-8?Q?Eu39DsCcB32G9a/xTeZMrWQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d90724e1-f7e4-4d85-e397-08d9f83b0775
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 08:44:26.3123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: euq9uq2QXR0Z8y77p7gtUG4ieQ6uncd47S6XDOgQacUXGCIsUV6MqbhYbnu6CMjiLM6RR2H1+hilF2xb0XwZsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7620

On 24.02.2022 20:48, Andrew Cooper wrote:
> In VMX operation, the handling of INIT IPIs is changed.  EXIT_REASON_INIT has
> nothing to do with the guest in question, simply signals that an INIT was
> received.
> 
> Ignoring the INIT is probably the wrong thing to do, but is helpful for
> debugging.  Crashing the domain which happens to be in context is definitely
> wrong.  Print an error message and continue.
> 
> Discovered as collateral damage from when an AP triple faults on S3 resume on
> Intel TigerLake platforms.

I'm afraid I don't follow the scenario, which was (only) outlined in
patch 1: Why would the BSP receive INIT in this case? And it also
cannot be that the INIT was received by the vCPU while running on
another CPU: With APs not coming back up, it cannot have been
scheduled to run there. And it would have been de-scheduled before
suspending (i.e. before any INITs are sent).

Jan


