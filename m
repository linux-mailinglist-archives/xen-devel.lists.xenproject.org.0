Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC0A793D16
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 14:50:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596604.930540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdrzK-0001dy-Gm; Wed, 06 Sep 2023 12:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596604.930540; Wed, 06 Sep 2023 12:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdrzK-0001bI-Dw; Wed, 06 Sep 2023 12:50:30 +0000
Received: by outflank-mailman (input) for mailman id 596604;
 Wed, 06 Sep 2023 12:50:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SxG1=EW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdrzJ-0001bB-5K
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 12:50:29 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f39bab94-4cb3-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 14:50:27 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8486.eurprd04.prod.outlook.com (2603:10a6:20b:419::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 12:50:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 12:50:25 +0000
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
X-Inumbo-ID: f39bab94-4cb3-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYBkojvjnZqKTjaX+m/S03A/iiwlbbCfqBavwEiPXKERg1Lc7hBDv35c2dY0dhKsvKyBA4PANOR6a3UXe08lyjjc42r/+EeWCTF/oCiIcytePQC94zlVI26jiC7Qxq7Fd43bbwfz6tiolqb/xQPU1h4xDJmHUo+qAc4rhQL0wCJY44MQZiuzLcQaWA3KN0BVESACiWxeudxzbfqTrSkbwt2oyp7wyIYiQJMiIldX9vW1U4oxDZyB7D1W8rr5IWSIky2SrocXf4jjEFP3FFyhVrMh9HouPpkVXA/ngDJnrAh6xOMfbRahFPNNwnzHttvBMaPjp8ZFyUrJ6pYoXHitTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7DqZKBsBFGBHGjWHDGWefcFFNcvUMNSS/H7pv+WaNo=;
 b=KrEuSBbIgpXQC8HX1zfiv6z/JnUDZwr7xWzc2A/LVhCmtJ61aGbpc6IFJY3zkzbqfsFHsWx72vSjlp0cWsfhRCIYzIv+iwgacEkZWszoE9z/eLSiVmRaQibSFgNH69NLNKLgrqPfQ+4N3//s6n1BdsXp9t1tv3jz3gQpqnwrN66ZVzqEz1FswEezAVk2VoUSVukZToJrkb91AA9kifYpv22P0fUqEU8eIv6GubUOQ2tNuDZN6cjT3g5Zw4W+UlAT8gn26ZGwcE26uKC3DLSwoDllWtv4OxpIyyQzsEqXkya1OxqfL9C/xIG1hwHFEybDfxyWQCQymyLTPrlxvGis/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7DqZKBsBFGBHGjWHDGWefcFFNcvUMNSS/H7pv+WaNo=;
 b=XKvhAdvh8yb89/8dj4OeQCARWnvz4WLwI7upRdKiyPuGh45neft0zCHyQd3FvYyPc0lMlGD+boWboJZ+/CirKTQ1p1KPzS7PiuOvea1dOQ/zygTwKM9nnpXLP7pVVweIItuPDBFGRI3jiSZcKRsGV5CMnQwDZmAY5uzfrolBBKniiUz1Z8Kgx4jnUGCmuQxmbWIPh9815bOnqIte2F1lM5/yO9Z8kJ4YrXKKsQh9y9K86gUArZcK0dobPxIGEyYlwXdCSSdkozWOHp2sts6Mr1eoSVJBg4CyXMtrDhTgQlt/ErPu/Ztc2FvYqeVRUnH3qFoxNG+7dUtayjubHW+elQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9a42f222-7803-aab6-99c2-6919fb1cc4c3@suse.com>
Date: Wed, 6 Sep 2023 14:50:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2] MAINTAINERS: consolidate vm-event/monitor entry
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <e3ccc381-1fd5-b99c-e37e-5870af401dd0@suse.com>
 <09a93c71-28ed-4593-b8b4-fbb4d2a240f7@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <09a93c71-28ed-4593-b8b4-fbb4d2a240f7@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ff5cf61-941b-41c3-ad06-08dbaed7d6b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CoZQjLLTXwKSBf6/mKmZtbGNDeJpghlorblMs+RskI0ESt/Jhj2910qqnzdk3+ZXiZo4v9VwcouUWPMWJhUJk1PW/Lkljwq0lAxLSsGGe5w8a4BzrqI6Tp0p9NvZS5bx1vM87Kc7M1Qkz4251PcLXdpAjAXydFKEq2XXaHBIYbbo1lNAQLB/BNOosySJmMwUw+7tA0MCurZdByDMSCVl9Mf/O82sHMJNNgEeWFiJUCaEJcvG5xbiCyFtdLFwNKzl3Nfis3Cyxs3qkkkFr/LRtWhSrLOIqOAoDLZ3Xjh919Z14t2ljbBua/mgUxspQWlASdGYNWGoNkf10geuYLpX/xLAKZlb/kMqCI5DGMSzCdvE4yuWwZ27o11pe63ETORW7pFv7F7sMyfN3TOD8FrPKHJTd6KEPynFw/R1csOlrGh/PpxGDVQaVcgCWd0Q3Mhc6A5Wm2sBXQun5Kf+6VRZfk7ZgJ91RiBIy1x4rSuPoekIzWpCDeRd8tpdG3CNVtNaQfP17O/i6HVPCUjS/xpx43/nKyCZwXKdMlEyvJeEvVTzJBCFgj6vrIDYu28kdl6qp6NLj/IfQaFTZ6VZB0SI1wMKKnAIGs1pEZe6ymkxeTbxzC/GPx/e8yByO8d84s+eCGGlGG2Lf3iTieGbZCbePw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(136003)(346002)(366004)(1800799009)(186009)(451199024)(2906002)(83380400001)(6506007)(6486002)(66476007)(66556008)(54906003)(6916009)(316002)(53546011)(66946007)(26005)(478600001)(6666004)(5660300002)(41300700001)(8676002)(8936002)(2616005)(4326008)(6512007)(36756003)(86362001)(31696002)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFphZFU5bDl4Q1VKbkt0V25yajFXTzd6QUIwRC9vbEtMK0tmd0pCYVcvRE9a?=
 =?utf-8?B?RVZmWmg1alVERHZ6MTFIbGMzZmFXZHh3c1g1dkxNaEpkWVBPSmJ4UXVqcFho?=
 =?utf-8?B?TUt1b1B1K3BNVC8yQTJsQ3F2WEpBUnpMUElnbm5QS2o0bnEvbTFnVHgySzM5?=
 =?utf-8?B?Zko0VzlvNGNhbC9vaFExVG9ZVFlZNTBhY001NzRVYTdRbkMraEFCN0FMQjFm?=
 =?utf-8?B?OVF1bGZ0ZE1zYTVOQitsbXpKaEw0RlZzdjVQaWQ3OWNEY3BsTXI1ZmlBd09l?=
 =?utf-8?B?UUZRdUpGTWJTdFgrZWo0VjZ3eS9kc0tISGI4V3poUEl1d1JXMSsvczc3ekpN?=
 =?utf-8?B?Rnp1WGQzejREaHhLUmtGQUpHUlk2d3djTVlhS1d3QlYwRFJscUlLdnErMWFk?=
 =?utf-8?B?bDVjTXRnVkpieXhJRmt5TEFwQTBiUkdrNFNqSGJ3dnhVMFZrcWJKQ0gxdWdk?=
 =?utf-8?B?WTFBRWRJM0lMY3ovWktXWHprVGVTdXFLS3RBQnZVbTJZZGRRUGRWci9sN1NI?=
 =?utf-8?B?MHFIU1ozazR6UnEvSWtBbHE3c0d2V0F3anRHWEMwYS9zanlaYkhWbWZ6dGdK?=
 =?utf-8?B?NGdsVTJITDljV05hQkdUdVQ1V2JSME53TjFwc1A0di9PT0gzeExTeWxHYllB?=
 =?utf-8?B?QXZSSmdlc1FaZTJCREw4OE15ZXRLVVpDcFFZVDJLZE1hU3UrL3pJYTJZVDNx?=
 =?utf-8?B?bUEwTFZiNVYvcURVWHlLL0hLNG1iN0hJOUpyNjFkOUlGQUE4dnN6WkNMK1hu?=
 =?utf-8?B?WkZiUi9aczJzVjRhU1FPTlE1R0lDQ1NwRDQxL2taVCtvWEdxWUMwNnU3UTha?=
 =?utf-8?B?TmhqK3MwdDNIV2VPRzZkQ2Y2S0pTUWRaenVaaVVDbE1JZnhjcEFHUERITEtk?=
 =?utf-8?B?TitBVHBiNWJxbTVrZzM4WFdIRlFXOVRxUjRaS0RtU1ZZV2crV0lITXNQYUt4?=
 =?utf-8?B?cUhRc1J6VjlkVWVFcjk4cHFiQ3hDZW5kYWdHd2V4UjNiQkYrYjlyN0JFUXlv?=
 =?utf-8?B?SHRsbDBFOGFHbkNKV296VTlHTTBtSkNLTG5aYmtRWnhSZ2ZRZ2VVWUdqTGZY?=
 =?utf-8?B?TDdJUE1yYkVYbHF1TkRtY255aWN0U3Vib2VtY0tTYmNvK2pPYmpVK0RvZk5Y?=
 =?utf-8?B?YXpFVHIwc21Qd0VlM2R1d2h2cVNFQWVvQmcxRTlqRVpnVDIyc2R0RkhpZm1Y?=
 =?utf-8?B?OS93QmRDOVFwUVlJZDB5R0gwMWE5VlFzRzhvVE55aGkyVEthQU5nWUVqV284?=
 =?utf-8?B?bi85VEFDcVJ0azEwckI4RmtlMHJCUHZCSDBNWUhxTUxkUlRNQ296czJ3bVl6?=
 =?utf-8?B?TjVsSk5GMEpoSlRsZ09wbjJuTzUwbFdaeEQwd1owMnJBNTlmWStrMTh1QThQ?=
 =?utf-8?B?UEJmUlNzelpoMnd0RE82Ym5OVWFDWGplT3BNODlNM29FaG0zTE1QTmVWLzU4?=
 =?utf-8?B?cGlPcEcwOU90YmowNnpSMC92aERGTVc3cVNvc2srTU92dlJvZXN1R3F5ZnhP?=
 =?utf-8?B?WFBJaHd2YmdYUENVM1RpZU9mRWoxRWo1VXp6RFpnd0N3WFVEWStIMnp4dHVq?=
 =?utf-8?B?VHI0NVVqdEZYWStSc1JHZ3ltd0NMWXUwZVNnckQ5dUNuYUJNOGlzNDhOZjJL?=
 =?utf-8?B?YmRLZ0lVSWNoMEhIUnF5Z0lFK2sybDlKaWhvMDkrM3MrZS9UR3QrTm5MejJW?=
 =?utf-8?B?UDdGK3BZSXFWQTl5S3Q0NTU2VG5EUE1OWThsSHVsTjJYM01IaENCVGJxUENh?=
 =?utf-8?B?dWt3VEc1MTRrT2ZmUmozTmN1MG40R2ROTXBETGVFeWxQbnRsUUpRWTcwTWI0?=
 =?utf-8?B?Ty8yVSt4ZERidHdacjFoOEwyb1Bhd0UzYzd1clQ2YVhMNFdGbVlqUUxCTVZn?=
 =?utf-8?B?WlBWa0lNcUo3YmhDOFQrNUNVREUzbzZJeXo3ZHo2YzlJZUkvYnlTaVN0b2Fh?=
 =?utf-8?B?b25hd3EvU1FHRnd4dmpVcXFZMzJuSkdFelBNcmxpb1RlL3ZLdDdvVnpUcVZa?=
 =?utf-8?B?ck01emF3Y1NLRVZFbFg1Wk9CMWI1ZnlwcE9JbkdxdVJwbWVkdXRWbTVFaHJS?=
 =?utf-8?B?cWJCOXFtOVJEVjlTby90QzJkNHFLczNuZUpQVXBIdFBDU3V2QUE1aWNzNVhn?=
 =?utf-8?Q?cLDIH8XisdIdeDoMJR5UEa9RZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff5cf61-941b-41c3-ad06-08dbaed7d6b1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 12:50:24.7456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PTqfzuoSinfdu7g3YEVbfyxOlnei1n3KufE4FQzErIP4nzwAXf2jXTu7nKsxKdtJzRW66yIQO2o0yfLLXTgL9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8486

On 06.09.2023 14:40, Anthony PERARD wrote:
> On Thu, Aug 31, 2023 at 08:15:13AM +0200, Jan Beulich wrote:
>> If the F: description is to be trusted, the two xen/arch/x86/hvm/
>> lines were fully redundant with the earlier wildcard ones. Arch header
>> files, otoh, were no longer covered by anything as of the move from
>> include/asm-*/ to arch/*/include/asm/. Further also generalize (by
>> folding) the x86- and Arm-specific mem_access.c entries.
>>
>> Finally, again assuming the F: description can be trusted, there's no
>> point listing arch/, common/, and include/ entries separately. Fold
>> them all.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> -F:	xen/arch/*/monitor.c
>> -F:	xen/arch/*/vm_event.c
>> -F:	xen/arch/arm/mem_access.c
>> -F:	xen/arch/x86/include/asm/hvm/monitor.h
>> -F:	xen/arch/x86/include/asm/hvm/vm_event.h
>> -F:	xen/arch/x86/mm/mem_access.c
>> -F:	xen/arch/x86/hvm/monitor.c
>> -F:	xen/arch/x86/hvm/vm_event.c
>> -F:	xen/common/mem_access.c
>> -F:	xen/common/monitor.c
>> -F:	xen/common/vm_event.c
>> -F:	xen/include/*/mem_access.h
>> -F:	xen/include/*/monitor.h
>> -F:	xen/include/*/vm_event.h
>> +F:	xen/*/mem_access.[ch]
>> +F:	xen/*/monitor.[ch]
>> +F:	xen/*/vm_event.[ch]
> 
> 
> Hi,
> 
> Did you mean to for example change the maintainer ship of
> "xen/arch/x86/mm/mem_access.c"? Before it was:
>     - VM EVENT, MEM ACCESS and MONITOR
>     - X86 MEMORY MANAGEMENT
>     - X86 ARCHITECTURE
> And now, it's just:
>     - X86 MEMORY MANAGEMENT
>     - X86 ARCHITECTURE
> 
> (see ./scripts/get_maintainer.pl --sections -f xen/arch/x86/mm/mem_access.c)
> 
> Also, now "xen/include/xen/monitor.h" is only "THE REST".

No, no change of maintainership was intended. But there was an uncertainty,
which is why I said "assuming the F: description can be trusted". So ...

> On the other hand, there's no change for "xen/common/monitor.c", so the
> pattern works for this particular file.

... together with this observation, I take it that

	   F:	*/net/*		all files in "any top level directory"/net

is actually at best misleading / ambiguous - I read it as not just a single
level of directories, but it may well be that that's what is meant. At
which point the question is how "any number of directories" could be
expressed. Would **/ or .../**/... work here? I'm afraid my Perl is far
from sufficient to actually spot where (and hence how) this is handled in
the script.

Jan

