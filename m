Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98C870927E
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 11:03:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536795.835501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzw17-0005pt-BE; Fri, 19 May 2023 09:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536795.835501; Fri, 19 May 2023 09:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzw17-0005oG-7l; Fri, 19 May 2023 09:03:17 +0000
Received: by outflank-mailman (input) for mailman id 536795;
 Fri, 19 May 2023 09:03:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TMQ+=BI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pzw15-0005lA-Nd
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 09:03:15 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc6a6a18-f623-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 11:03:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8766.eurprd04.prod.outlook.com (2603:10a6:102:20d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 09:03:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 09:03:11 +0000
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
X-Inumbo-ID: fc6a6a18-f623-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OI66tjwjUHfH/lR+tUDi+bKyscnhhxpy6Cnr0NkEi6ZNcrfDPDloZoHadVmnEueMoea9hPTvoWY9omRGotXWIUe/yvTDh1wWgc2WriiE5Jg+4g1HZX5IECp/vJwhBXFyYlDkdHckhcTDfFcAUgKt8yCUUn+hEQpdJFtXFwcfyY4SWH26auyvpoupEP4OToxJyerLpmVaTevmfa0vr947+vsHpRMeNanemAm3k64kOCG41djBQGwqHwdUeLllXB1+rZTtKaYQzwQ8UmeADGJx2shADF0P/2UlObIx+D5pcLORza2xGovpnf3lDvE3B7+3F9BNdclUfWf0ciZmCTHzwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CO/tG9xjduflqkPIA/YpkDUJU43YBT8Ah8eOFkSyE0=;
 b=Z01Tptgqghby6b0Y5bfNTrSIiZzKEp+JnnN5WPwu/YnAfF5x1MWbwHJ1eIoJYbel9E/kylRJMP3tX8tJ2tiNfjAqkhpExR2vNWJ2YfNC2xbxtYMxWMhZ9wDfo/t+Kz68hW8Gr6mduRxwKlqG8BdvlLVFQY94wQGWnSg8EYc+k0Llkq8Iyy7ntEq+r7Xc5lapoT3ek3EFTpSGKTtVW6lgc1Dv5IdkkWfCmL8hNV8/340RX0dfL47pUES0tvhO/h6JoAW5rfAdF7T1jDK4+hfooPrtpDXnkb32a62UkodqxI7z1n54lx5J3ko2X7Ba3ynw4pcpb6Q52jl1psjTOJp6rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CO/tG9xjduflqkPIA/YpkDUJU43YBT8Ah8eOFkSyE0=;
 b=ZMFqq2+01Hfio5U/mGjgUlaAUIC9OdSSI2G4CnjEtFmxGDpcHc/lm4/z4vtM7pA1ifnXvCmJ3Ng6v5I6R8sx2/KvkMUYwxg7g2pZSN3LopX2+ARtkOKE94h+gQaL29zQdmCVHqG7APygyjKhaTMqshJrM3G3qtUmvAB0MCAjDokYts1PIM6n0By3Etv6puRglwTkDmAzqDnxxN4oPwH/Eh5fvHZ4wDXcFfeBf5xoBsOsMU27MgE47IHpkYH7djlYdiB8OPNmtQ0URGpqNHLIF4MI0j/rSY1K9AhqBvdnxujw8IDIry1eDJPvtYIuOKGByNi4f4KVm8+b3dyDkjtSBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <81eae127-b3d7-b1ea-901d-d139ebf5aa21@suse.com>
Date: Fri, 19 May 2023 11:03:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] pci: fix pci_get_pdev() to always account for the segment
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20230518105738.16695-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230518105738.16695-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0257.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: 403ca812-e1d4-495e-caef-08db5847de9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rcRfIOcxQxi9ASndmqtkorCVl/yNHelDXvg3WN6orRX9Fn40mLou6aJ8CXhrce4jeVIpVTQFj3sFSLn9fThzvdGaNQXwZcehxmEmEZ3ZZHTYseXqDgs2rExOBD2D7i1W3l4p+6Jg3+yfXLZJiyGu7Nc0rR7wFHZynBIFFWiOfoeU0jjGyJ+E0LZ9qMNdV/bKhzCKLq+tuAg87mZ8Ctsl+cL8TrKrfCqSr8FDwNbt3rTS/BE1+qijLnWtpgarJs5UfM/QJ7j+1ccZEDVDn3GKEG7vBG81Sd/Z92QDX8TzdKPt1GZTrEE3y/PBgY7xjR2OlfVVuvS1+A7BLtyB0s79Wj6WHacnpHt6RP+v9V+eTzMdat0Pt+15Q8u+R/WxzX9MpvB6baa9xmPzc03byLtowf19FS+TStY9VyCPznVxQFEAzBuOpA0GEIUGvoN2or1QzRbx0URgZ5oz59K5rSC0zUQ/29+T7bqqNRU9cKTBxhl+t7v50TPnh+IAm89KJGkk/tRu77VbaOpSqAH5uwMpNyaRmCGPGLjQYa0le7fN4TQyRVuGu4gi4fejE7uTj5la/uSu5Lli3Qr5BmClbwTWdtQ4Wr+5YnRyeQa7qtTYx2B3gzuAxF4tLFfXmzXYh2qAi1RrmfCNY+IB+3Wey1wsYQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199021)(31686004)(478600001)(6916009)(66476007)(66556008)(4326008)(66946007)(316002)(31696002)(86362001)(36756003)(83380400001)(6512007)(53546011)(6506007)(2616005)(26005)(186003)(8676002)(41300700001)(15650500001)(2906002)(5660300002)(6486002)(8936002)(4744005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGNqeUhyS21wb0t0UlROdDlmQzMxei82QTBacTdSbEVVOHhuNDA0OGMwaHBZ?=
 =?utf-8?B?a3NDaW95Rzd0QlE1UmpKa3VrcFQrL3k0ODJlNGJHaUxwOUlyaVcvUldGRUNq?=
 =?utf-8?B?RHVzeXA0NU5HZmNWY29uUmZpYmFIck9zKzV5TlJvMVdzTEFpNnBvYjArdVZ5?=
 =?utf-8?B?WFhjTEdXMDZ1NzEvb0lOcmRuUjMwWmdtVkl3b3p0cndNMzJpOHhnZmtZb1FH?=
 =?utf-8?B?U3NQdUxwejAzUm5PdTkrQmpyTnFoejVVdHBZdEptWmh1OFNxQUZuQlk1ZTdJ?=
 =?utf-8?B?M1A4cUtucFBvWDRTVWxPdW05OEh1RksvcWQwNUFiRmNUbFo1YnZnaHpXM3Ba?=
 =?utf-8?B?T1R5aDdPQURKNFNXWVpEYVV1V1JITGNvb1VOSGd2Mng2YkRNOCtjNW45eVlS?=
 =?utf-8?B?bHZhUitIU2tWNzFMZjZJbDFrSXQ5M2lMaFQ4d2l0Mi9PWVZTMjhLVDVzcjdT?=
 =?utf-8?B?SHhLb0dtdW9ETmNOdFF3dlR2Q3hPcWdUVjFGMVhhRWwzNXJnTVFVQjEvUFZw?=
 =?utf-8?B?TXRXZFJOZjFtQkV2ZzNwQThSeTRrc1ZCK0FOblB5cE54cW8xcE5QN0k5dW9O?=
 =?utf-8?B?TEZDY2ZvYm1oYlpoaEM1MHRSdDNzeDN4dlZ0Q1hjaWdwWjFMaHJYOURqU3dL?=
 =?utf-8?B?VDZFblI4bUkzc2JSTWlQWmZQNHcxN2dOUTZhZExPSTVEdnEwaHRYWVJMQm90?=
 =?utf-8?B?RDhGSVArMXF5WmtyRDhqMXdkeEJ2d0JuZTZ6bk9IZFovY1VjRTlZWDNpZzJO?=
 =?utf-8?B?cjRkdGIyOGFSbmUxTTU2UjdjMWx5ZGpnRkVoOHRDUWx5WlBPUHpQYlFidW9N?=
 =?utf-8?B?TjFoVjlVdVpwTGxkazhnUWpnWnoyaE5iaDUzY2VDYlI3OTVJYndNR1drQ3lV?=
 =?utf-8?B?V3h6QXFDWTFBK2YreGZNdWNZN1I5bnhxVXE2bUVZeWJraU1zb2JUNFdjVERG?=
 =?utf-8?B?cTVCeVVTeElYMlliVE51SjhEenV0bXJPWDdEYnJQaCtiZUZIZTNaSm5zQUFu?=
 =?utf-8?B?TVJaTUwyQTBNNXZmbnpGKzRhcXYyeUoxaXc5RVErTmJhUlV5ZENqYmNTMGxY?=
 =?utf-8?B?Qi95bEppNnJVK1g3RDlrMTF2RFJrMkVkaHZmSmkyUUFMRWRUSTlaM0xWUjhn?=
 =?utf-8?B?QUJaNk4raGpXeVZiZ0RZTlhtbVdncERMUEhPU3NKdjlqYURKRFRTSEFydWJW?=
 =?utf-8?B?SkZzakhTWThCQ0tZbFFHVi9uZlZxZWhWSm1EWnhmNi9reTBGSDFLYU5mY3Nr?=
 =?utf-8?B?V2ZoUDladGNpUTRtM2dYUEJkL2xnT1ltYXY1TzZXellyRk4xNnFia0RlU3F0?=
 =?utf-8?B?b3RwaG1ONkhkYTdybWsxclpGS0JoYnBNVTFZTzVDc3JEa1liMzBZaFQ3a1By?=
 =?utf-8?B?eWZ2VXF1OVl1WEpITHVkRFVyeWYyQ0VNcFN5NHdraWtnYkFnbkl4VnZHK0F0?=
 =?utf-8?B?aTR6NlBOWEF6dUcrcDJSemE3dXVUNVUxUUE5dDZRNHNLOGMwcmd3N1lMVlZp?=
 =?utf-8?B?dmU0czN0UFdKZ3dyR09Sc3FieG1VZVVDSmVXYWphWW44OGZHYU00NjlkU1NX?=
 =?utf-8?B?WDhxZU1aZkk3bEJXaVJoRHJOTFkzaGt2ZTRtZ3QxTjVoZm8zRURuQlFqbTFz?=
 =?utf-8?B?ZDk4OWQ4TnZnaUxaNW1xTmVZVTUwLzR3Q2Z3OWpiVlBzYTBaYWN2UWh1a2Mz?=
 =?utf-8?B?Rnc1dFpSbDNqSzUwQTZEWGRWQzVWN1lCMk5NK2lzZ1hEais3bHFVamlZWVh3?=
 =?utf-8?B?aVVKSTJZQ2UxdWc1Vkx6b3d1ZXNCQjhtWGxtaDg5Y1JGZTJab3VxS1pxM1ZV?=
 =?utf-8?B?YkFoVlFYcitPZXhONVk0WGdEeENBZDlnNVZjWDdsYjhBQnRHQ0Q4aVljOWdK?=
 =?utf-8?B?SEp3M3JraURlVEwrbDAvdzFIeVk2WE9zNmxpczNxd0dkOXN1QVp2NWtiNlZ6?=
 =?utf-8?B?WU1CRExLb1ZJODAvRW9qRzBxc00yZkZPV3dFK1pvcmtacVM3WlpzWjNHeDdr?=
 =?utf-8?B?TkVOQ1dwcDRYYkd5WDdreHdQOUVscmVSdjhwUzYwKzU0YkxPOG83T2YxK3JS?=
 =?utf-8?B?dnYvM1lnN25WdjZPbUtWNkdMZ01BYVl1NndFVndMaWMvcytQQXRCWmt4emZE?=
 =?utf-8?Q?N1V+6M+UBYWlELzPTtr6DK8+H?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 403ca812-e1d4-495e-caef-08db5847de9a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 09:03:10.7424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8vjQQcTpB2pzlzQ+wfq9ajG7OmjVX7Lcr9v8SVR7rqb4ZcV49TIsbZ3Tw/PXuXmgufc4xm3lT3nk1vPVD8bvJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8766

On 18.05.2023 12:57, Roger Pau Monne wrote:
> When a domain parameter is provided to pci_get_pdev() the search
> function would match against the bdf, without taking the segment into
> account.
> 
> Fix this and also account for the passed segment.
> 
> Fixes: 8cf6e0738906 ('PCI: simplify (and thus correct) pci_get_pdev{,_by_domain}()')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> There's no mention in 8cf6e0738906 that avoiding the segment check is
> fine, and hence I assume it's an oversight, as it should be possible
> to have devices from multiple segments assigned to the same domain.

I guess this was a lack of editing after copy-and-paste from the
loops iterating over pseg->alldevs_list. Thanks much for spotting!

Jan

