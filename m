Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF3F4867E9
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 17:50:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254172.435769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5VyB-0000H1-3L; Thu, 06 Jan 2022 16:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254172.435769; Thu, 06 Jan 2022 16:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5VyA-0000Dd-W7; Thu, 06 Jan 2022 16:50:30 +0000
Received: by outflank-mailman (input) for mailman id 254172;
 Thu, 06 Jan 2022 16:50:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a8QS=RW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n5Vy9-0000DV-Mk
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 16:50:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0bfe587-6f10-11ec-9ce5-af14b9085ebd;
 Thu, 06 Jan 2022 17:50:28 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-N0_bLPAAMPGcLTEYNnDA9Q-1; Thu, 06 Jan 2022 17:50:27 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3295.eurprd04.prod.outlook.com (2603:10a6:802:f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Thu, 6 Jan
 2022 16:50:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.017; Thu, 6 Jan 2022
 16:50:25 +0000
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
X-Inumbo-ID: c0bfe587-6f10-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641487828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UCkfXug9mVVv1+WFamCC8vcrgs01qrHN/SF9rFvG7cc=;
	b=jB6yNjdL9UhwIX8um4e8+jDHb3U6iaTQMQ8c5B+iN0l1JO/HKsT4SkMH9HBSq73TJzYJzH
	Kh9lD6OZkFcn8LcD3ZYkHjl2D3Jx87YmrRqFyi8ska2nOvcVSwLvqGbptawjmoiXdhXRFH
	rMpvn4lpXpXgbQI3qPxx1C3NPDGB8ts=
X-MC-Unique: N0_bLPAAMPGcLTEYNnDA9Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxSlj0HcjZDGhG4C3eDmdSBIDyZ7QDMjuOR/5spoeCd/yL3aW558Q/nVsRV8z+rU/Sn24iIP16xlJl3hTwmFZREreeOLnEr0g+Hd/hZoBRs8OoQAH54Qx2of/1VGCEHyUc4w2Gdr9Tr4CiG8tMUhTd67xuMZpUfn2GJmqbTcHXpVRsOHMJ8DG6Vv4Qyr7GG0mr56gIXGUTP6nlxn7W2sB5KSey3kHvp2Rf7W7awgiilGPrSCuzMqp0uvrSwMyQenLHS0hHgnYafT0P3Wg38nHpKwy+UyfZdPiCIe7eum8hXBI9XHOQ5c2h3sbqrN7WpxoxYn1apyeGrwM/evpt1O6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCkfXug9mVVv1+WFamCC8vcrgs01qrHN/SF9rFvG7cc=;
 b=J+OIKD8LIRsriekkVHFfK6WsA8bh8z/pEn6VZdD+KVMNa7pmFjsvvNe2MI6+x4VQZiKwQzcyZ1A6CTjNShP4e1/6jJ7gyyGtya1pzVIL38XC33N5fLMsvdbFjv1Ybd3XiYgv51lDewH/AYCnQTLEM3f7vgyX2F0+4AIDZkbxEkbv6GycS1kyJ6Ao56BCCuoypIE8XISgmwGuYXHxNCOvoha5kibqNBeWzoMMiSCJRwJbm+tBwgMnxCUclOLPCP3Pw7d6WMN4+Q2qcxV9K1JsZgli5j3TeIjfZY+5VMO6H94sj/TE5vLdJUq6hWYGvRHwu2USn/2nK87FU4Dh8YB3Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <acfd7034-367c-4654-1e9c-49bd1f0da475@suse.com>
Date: Thu, 6 Jan 2022 17:50:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V5] xen/gnttab: Store frame GFN in struct page_info on Arm
Content-Language: en-US
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <1641424268-12968-1-git-send-email-olekstysh@gmail.com>
 <a7a905fe-3feb-507a-7ce4-ed7dce78de86@suse.com>
 <aeba1af9-8386-3bca-dfbd-1c9110ae09de@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aeba1af9-8386-3bca-dfbd-1c9110ae09de@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0011.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82d12b0d-5355-4e2b-7d65-08d9d134a302
X-MS-TrafficTypeDiagnostic: VI1PR04MB3295:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3295D0E2890599977302D390B34C9@VI1PR04MB3295.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cdhrnTcgZx6O+YAT8xKfsH+oUMN+VrQDgVplaUDdqTz/0E14Of5/ZdsxeIO0mTE/in50QxXzTZnP63co4tdRuZGP8VKcI8xsCdDfXvjSMGC4dd3mo6GeJKN8LmG+Ath/zGMKg0veAnqERgTejizKopGBJZyxtNvtiuWf+FX61aTfnHIEtRfVKTgnzpsMOGRo8ei/20CRvuDqU3umVsrNwbI1uPnh+MsmAlm3/PluTyENYLlt5MYF3EpeCmB9IOR3H6XJ+wn4/PR/R+Ldtelq5608zGL8otOLgpJYEZvJ9VZ7gufF/U9RQTxDGeCDe8/8fO7KOOQ5NRrgbh+WGLUQq4W+Iq1a1iVhKPKPR5FXTxCMGivLOhRrYYXaoOta8PSm+a7QH+KCxFT/HOVootzu3jcyaplRdSH7Wq+bCOYuh1wL/kv0Gl5x9I7+aDxe6C9Vk5zEn68bewhVBti49VP5aubnHqjQ86Md+cqaKZWLf70UjF6hLMxPyyV7ybJlU5q09Sb3NLdiL0wn69qURG3TfMvFkhJdNzglbmdhEL0PdXXze3bdRHjuQEcgjBIc9VstUZs240kPNUaGOHxLRUjIcLWlLV+Zs6GOj5DnxChhxyKN1ruxm3U7eQE+37KzlSZxVULE/Ie7sfForvWE+ixiC0nSnNSsX3Nij2ZtmQj926/ISBLOJDAH+eEyoSQKXos4ObrJ/Wlna7PSZidBBtRaYHBkGOxR3rVTRMWsSAz4BZu8E59cict8rK5aURf5VBz1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(8936002)(186003)(6486002)(66556008)(66476007)(54906003)(2906002)(558084003)(66946007)(38100700002)(508600001)(2616005)(36756003)(53546011)(6506007)(6666004)(8676002)(6512007)(86362001)(31696002)(4326008)(6916009)(7416002)(5660300002)(316002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0RHZnJoQkFuU2REKzlJa2ZGQmYxd05ZbXE4UE5rR0JQdnB1cXRwMWEvd25B?=
 =?utf-8?B?VFZRbFRCSnB1NGJHM2Y5R2psbVF0UlAxaUozbGxMMlAvMWNYbGk1c3dPdU1a?=
 =?utf-8?B?aytBWXI2VEdKcXJ1L2phS0R4d2FPdjhOaXRIWHJveW5tUi9wRFV3UnZtODMr?=
 =?utf-8?B?T0xUSFhvcG5Ec3VGdHB6c0trdFFiRzh1S1RjRFJJOFU4SWtpZzZ5TWZ0T0hu?=
 =?utf-8?B?T2RhUmhTUEFtU0JXc2RPMS9JaUZWUmlsdlhSOUVHVkgrUGEyN1h4V3lqSDEz?=
 =?utf-8?B?SkorMlJSNW1yNXdRM0x2NDNKMitIVGZmVDhXV3JRalBpMk5SNWhOR09OMVk5?=
 =?utf-8?B?SlVEd1A2VHZqRkl6WERKNUJlV281NWZ5TXFmd1RZSVJ3ekd5ZFJla3JuMDZ1?=
 =?utf-8?B?bkF5N05oOVIvZ0NZVUxZT1dNMXZDTis1bWdncUJkQW1PMGJkR3RqeXUwNHBa?=
 =?utf-8?B?TmVXMXNZemZOSHAybDdzU1lqenQ5MW9INzl0MDl4YmVrOVlYeXNOVFQvQlNk?=
 =?utf-8?B?Y2dmRWF4TGpia016clhBUW5yK1lrTEtoVUVKcTQ3WjJxdDBqTWVhS05UR0My?=
 =?utf-8?B?cWYvQlVNY1FqTTBpNHNoN3UwUUtLZGZwN25YcTFxZk9HWUsvMlh6RDBMd05K?=
 =?utf-8?B?R3dPcEtDNDRFMkZDNmxQanpvekdiRkMzdFZxTWthd25rdWc5ZkkrMHZvS3FZ?=
 =?utf-8?B?RXpCcGNTVDA0TGVYNkZiR2haVTdLMEtUWlZBQmcwL2dKUmFRbzNMbTJVVGUy?=
 =?utf-8?B?aXhKdU84eGRlN09hSmF3VnpPVWkyc3ZtaFJKMHhMZFFwQi9Vc01xNHROQ0Vv?=
 =?utf-8?B?bzlaV0dLRmV1YVN2Ry9haUlzb2tSY2FKRVlLL1p3c29jY0JmVjdxY2xaMzVM?=
 =?utf-8?B?c1B1azh3MzZsVU5xZ2EvWUNIakpKL05TTXBlcE5OUWxxSDRaM3dPTlU1YUtq?=
 =?utf-8?B?VFArY1VqVkRJSDRaYm1XUTBCT1BCTmpDMjdZSnZ2djBFYVJWZW1UOHpOT1Zq?=
 =?utf-8?B?S0dBRlVrbjJVYzNhaTZEbHpsWGZnWGFreHM3Zk1FRVVqQitpSlNadFZnWmx5?=
 =?utf-8?B?OVN1b2ltWC9qUitLV0M5NG4rdHo2RjlpakNoKzFmSDcyNEtqSUx5eklRYy8z?=
 =?utf-8?B?b29zZUhhYUZFcWkwUGw5N0lRajRZbjdlb2VPR2ttcS9pcEtpVnROVWdtanRm?=
 =?utf-8?B?TjZhc1RQMHMybVI5MHhIZjF6RjNPMXluazJRNDE5ZDJ1M3FQSVVEMEJWSDJG?=
 =?utf-8?B?N0ExalU1RWc4MVMzcUc2NkdJL3FPalpoZExzYVVOaDVncDhpeW44bHZ5YWNk?=
 =?utf-8?B?dXJ2eWJPN3luamxMVWZSV1ZGZGZ3TC8yNDJTei94ZjFwNW9Ta0NlRDIwQnFr?=
 =?utf-8?B?bUpiMmpzRXcxa1hocElHT2hvcnIwNU9zUkY3d3V5dVFFTGxBT2NOdjdtYlMv?=
 =?utf-8?B?Y2NWS0VIbFhZY1BSWUxYbndzMUlpeWRzUnc1SVZQc1hlOUNFbC8rZ2k0UDV5?=
 =?utf-8?B?UE5JVnJnVlU5aTJLNkNsUnRXZzEyZG5obkozRlNvY3JPK25jWTVmKzMrNU1x?=
 =?utf-8?B?azJiTmhUb1FrS3dFWnFsNXNiTGZwYktuMDR5RUNTUTNFUkZ0VGE0bXFzQi9j?=
 =?utf-8?B?Wm43c2ZoQlVsbm9lSU1jUDgrVzllaWdtejg5STRLc0UyNnorYXpBVjZqOWlM?=
 =?utf-8?B?OUNUSmxZaEM5OFBGNDc3dWpqTUZjSVQxV0dEWmhYUFFhOWgvMmFCV1JnSHBJ?=
 =?utf-8?B?RGRlWGgzK3phM2Z3R3pVTjk3bWlrWVZOWml6UGdlTjRVbWFuUEo3Qmk3cHp6?=
 =?utf-8?B?a01NaUJiYWEyL3duQXNRZUFKUXZlQldLTzRsSXdiVHBHYmVlK1RWQXVSbWkw?=
 =?utf-8?B?cE9aTGVBTnYzRE4vNEhwTUxseXNyM1BZa2Y2WG5QbCtibHhOS1pHaGVPeUNm?=
 =?utf-8?B?d2U3eG4vZThXREdhc1JxZW5IY291QS9NRlVKdzVaSEZQWWFza0ZRSHduYUhR?=
 =?utf-8?B?K0RSazJLQytBU05ad2pLY25nS2xZS0NFNVRWQ3FmREw3UUhJQnRSSkpRTHZk?=
 =?utf-8?B?clhaUXdoVXluNkdkcUQ5SzJCZVIvNWhSc3ByaFRDdE5KaGt4eXh0cGFici82?=
 =?utf-8?B?emlqTG9XeENKVEdmQjBtdzB3a3o0ZmZMMENUNkdxcjFhMmFOaDBid1ZhYnZF?=
 =?utf-8?Q?D7LyaIuZbgRf4HzbBkmitds=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d12b0d-5355-4e2b-7d65-08d9d134a302
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 16:50:25.4279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ASNKFqGZeSn1jM/UsG5t8Ed2K/xsKvzCAsXjnXmbGKy2sMjW6+AHX+RJ4xu9z1PPtF2Xn/kzg+ezzWcxeOsSnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3295

On 06.01.2022 17:30, Oleksandr wrote:
> In case you don't have any other objections shall I re-push v5.1 with 
> proposed adjustments now?

I'd suggest you wait for feedback by others. After all there may also
be opposition to what I have said (in which case you'd go back and
forth).

Jan


