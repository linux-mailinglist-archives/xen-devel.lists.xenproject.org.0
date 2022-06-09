Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCDE54446B
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 09:05:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344690.570259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzCE2-0004jt-8f; Thu, 09 Jun 2022 07:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344690.570259; Thu, 09 Jun 2022 07:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzCE2-0004h6-3m; Thu, 09 Jun 2022 07:05:02 +0000
Received: by outflank-mailman (input) for mailman id 344690;
 Thu, 09 Jun 2022 07:05:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nzCE0-0004ga-JW
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 07:05:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 792ece58-e7c2-11ec-b605-df0040e90b76;
 Thu, 09 Jun 2022 09:04:58 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-haorNSoXNG2QyJ6301i6hg-1; Thu, 09 Jun 2022 09:04:55 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0401MB2646.eurprd04.prod.outlook.com (2603:10a6:4:38::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 07:04:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 07:04:53 +0000
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
X-Inumbo-ID: 792ece58-e7c2-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654758298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sh6OEi6dpaIq+cfESSujIAlMweqMyXandHtIlZg4miQ=;
	b=igZgN5+vBV/BivG2ijfWkIb4sS4MR5lj8P+Y3qxqMwoghYaUpO4ZEzZoeAfpH/7rPbdC79
	LV7oKM2OTvry1rf2GNKI9+QW5YR5JGO7swRLNy+ifR/LE3pwD3ajaDGw5ndgKBJPoold2N
	fe3uPgqtyq1uPdeCzG9r6yS432UHCBg=
X-MC-Unique: haorNSoXNG2QyJ6301i6hg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLpbkylwj2IlsWgKG//12fL8lR21Ssm3UlhzO6owcOjkwfYOqA5hUFSRVcJRuZAyPYas7RTjVcYxtL/sFxzA/poy+yhnAnJpyRkL1EXF2TDJq67kiJotRCtTLZ8HpzdD4xtR26vJUAv3LS8XEtPZfIhEuylIXgJWKPziB/jcQv8weJXd0cmXvob4yB9ZpzfXDyOchI0poH84orXp1UTzP8uRc0lwsxMoU3DjFfedHaimc1gi8nFvLmp0xz7WGZyn6V+rwAgXy7yRr4BX4wyiBZbtk+STiA4RI4U6xtjOBn+iUka0/ZHe5RWxTkZBOTVwlCpQ63FMiwK0ENT78BQ0fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sh6OEi6dpaIq+cfESSujIAlMweqMyXandHtIlZg4miQ=;
 b=ZlXXHSLDmWB+Qp5YKJ+7SQD+hthh2Dwq4K2H3ZGIMqefK1h0XBnifrS04uPJsH2xK56QUvK+a2YAdU5dlMHnT1NmToFh18vi6bqWPsLzxKgTsev7ANmUtdC6fM/t4hl7wZTw8xxE43bu48ExZ/QcXVBK1KpNO4UJE/ODl9NV6HyorSgpPNlEu3OOvghlmptLnEdAw+u/juznGypcGPsgjnMXDrmEitMRaJJCfF+B95C1HO2eUgu1DSgmcLvsUY44IZh9lNNQeAZUvd0Fa6lxuCr089nkfo5SqYERidptR6/g9/WOGCz8fMCePz071nL4PExm816Y3dpzQ9H/9H3quw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sh6OEi6dpaIq+cfESSujIAlMweqMyXandHtIlZg4miQ=;
 b=IWFVkstGqHWi7tGnke1UKN5YlYqQyTcVcL7V/Px6oXI+sOdeksUovAuJu8bity1ul3ILARK1wigaFMCeRt9HDeYnsKNxhm3lXYOZwNh8NywIbSIy+rIpJ50ZsOfl47t61KqAjwC4Wiqk+DcYbmcFlAYCD7aCotdvh6DNXp9QfAGpv63oTxHBhhS4st02GeF2Rm4x9ce9ybnRyaHwhJuwt1fjGlBj1ElE25ylQifRIqzwcSuUJOb9ZrSeinkXnsH7LmtYxsk4hgWLyOwZAzYtWF6FJKJ39Fo0psst6JLsgb9sgTbdEB1CXn6JRo3BcFnH0dcrwWh2vFG3k+NyLz/HOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <880f3273-f92b-2b60-8de0-e69fefbada21@suse.com>
Date: Thu, 9 Jun 2022 09:04:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: MISRA C meeting tomorrow, was: MOVING COMMUNITY CALL Call for
 agenda items for 9 June Community Call @ 1500 UTC
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>, Andrew.Cooper3@citrix.com,
 julien@xen.org, Bertrand.Marquis@arm.com, fusa-sig@lists.xenproject.org,
 roberto.bagnara@bugseng.com
References: <CC75A251-2695-4E9E-95A7-043874B22F32@citrix.com>
 <alpine.DEB.2.22.394.2206010942010.1905099@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2206011324400.1905099@ubuntu-linux-20-04-desktop>
 <ebe4b409-318f-6b2c-0e05-fe9256528b32@suse.com>
 <alpine.DEB.2.22.394.2206061731421.277622@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2206081806020.21215@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2206081806020.21215@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0201CA0021.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8a0de29-1511-4f84-3cae-08da49e65a0a
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2646:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB264609076977638275C20A18B3A79@DB6PR0401MB2646.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7ELFu3Igv2EZh2qS5j9G+MS1NiOlq23bIFTjT6g8pt3gK7w2qud7mhCVVl2QmIK9a8JUrtPlzGwzoN6ws7eblEvq96Z8xCH9YNLmDFBdbvnGad9wPP/cJo3vHLzY2ZXUgPn7jlahVwX9d1EHE95Hnk2V5v1Y2NP/FViP8VLrKgcICRO1C6PrQRyYBmZnBQ52uedxLdrSibLkeLmhF/gxGRHkaDJ1VPuPCeOj0uxWKUGB/dzFRbF4Erw/FKTJRoziQTo3ArpqU600f98hgEYtc41fb94nGP4sGVGmirv7gUvW7Hl+2SBRKOm6BczLnCqHk8uEPBOyLl0xw4JQjY0+uekQjLGAPXeKFXgl0EcctoD+TiU4p0ocJtTkN7GECIpGu3vcQ3fVQy/my4uK/81/g9SDz1qw/iHOEybJyFGZG9U4ku81gXZR68BwZYoE35xmCHiGQ5v1sEsVic3X46UL3yuEsLhqEKP1mMhdbEharRj4aPhAo5HBcbQIkqQ7brG1M1RJKMz3BoBB8A1rNM/Sl465WlmDoIxP8gk65w5a18OwDHSGPWztCFEHO4+i55Efxie14z0Gd20gnikysKWIzlpN28eE9AzzqTjJHnGY4uQ9iTlX5YvhcyQqasDrY7vx8epS50t+nB8AwdtpJRu0KTGcAi6f/W2asHB0WK7C+/Uqxhk3weraGZ+KXac5QrCavKIgNlwaTk45XsV6vx8zmSzQ2HYzudpTPnL11wLalFjbYmDRkfzcmTveyvgPyWbGKaTpuUJVH1L9iLfYggtVWA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(6486002)(6506007)(186003)(6916009)(8936002)(54906003)(53546011)(316002)(2616005)(38100700002)(83380400001)(31696002)(36756003)(7416002)(86362001)(5660300002)(508600001)(4744005)(4326008)(8676002)(6512007)(26005)(66946007)(66476007)(66556008)(31686004)(221023002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVJvalQzYjZKUW45NVNyTlhJNFBGR3drUGhaZWthejJVWVNmQ0s5SlNzc3g0?=
 =?utf-8?B?SEFpOVdFSFZmWGZqNUFsWHZ4WG82bkdCYWpJYkVicHpVNkU1cC9iODd1amlz?=
 =?utf-8?B?M3JWQWlnMk50ZHRocTgvUXlTVHpWbm00a2NvVStTVDdwTlQrYTA0czlncTRL?=
 =?utf-8?B?MUFYaWF4eEZwV1l4M0JVMmRQb293cHExYjNSaDVZQ3NjWWYwSFZYVUdzemo2?=
 =?utf-8?B?NHlXN0JpN0VTMm1aeHpHTTJWSW1JdjdpZ1FRWWNQQ1ZXd3AvWVoyUzVsdnZX?=
 =?utf-8?B?Q0owSWpwVDYwa2hIYlphU29GZElrLy96MmU0d3BrTkYyK0pJVzFTTjVibHIr?=
 =?utf-8?B?ZG43SVBRR0Z0VFFaQUJxYkhhTytocTdnazJuTTN4WnRQRmQrZGJ3WTBzV2NP?=
 =?utf-8?B?WElWSDhQLy9jSGJ5czFPbkdZQmhuVUZvS2dQVmM4RzJLQ3ZlL3pCTm4zdTZa?=
 =?utf-8?B?WmY1amF3a3BrZTJXSHJCT3NEMlFoSmcxYjlSQnByZ3lKdUZOWFM1L0JTb1VN?=
 =?utf-8?B?aWVWNklWbFhrakhKK3JtNVdsclhGQVBEeVhOdmlKMEZkbUF6Q0lvOFZIY3dY?=
 =?utf-8?B?YzRBblFDYm9UcGtacnJOVzUzUzZpTHhkRmFBQmZnR1pKc0piMGhzTjl5SHg1?=
 =?utf-8?B?c1dkczgrWmVUM3FrajAzM2VnbTkrVEdaNkdndCs0cmRWbi9tN3hyblVNNTdU?=
 =?utf-8?B?WnhnNjFDSjBEL1VPR0VnVG5NMTBJNGNwWVpGQTZFL1dENDNPWWJEUGxrZkVK?=
 =?utf-8?B?ZFVNV0d2eGdTdnQzRXlVN2sxQmJhWFhYZ2VBTXBXZmRoNkk4dldWNWY3ZWV5?=
 =?utf-8?B?L2tkN2VrS2tVaXU3a2xGb1RKZlg4K2VpK3p0ckhDTEtQRUo2TkhmN2t2bm9h?=
 =?utf-8?B?STRHTkZFMkNHNE1HNElIOFd0a1plcHNrVFJLTWlIV21DUzh6ZnBIUDdUZzNt?=
 =?utf-8?B?ZkluYnFkVWRzbnl2WVRRUm42WTdDYXJFTGZwVDZuaFJ2SFpVU2lVbHhnemM4?=
 =?utf-8?B?eTJsVlEvY3prZEFuR3hEalZIK0ZaaFcxTUY4aE93V3YyYmhhM1BZMlZrMDYr?=
 =?utf-8?B?dTQyU0VPemZWKzJVSUNnNnBOQnE5bUpJc2V6YS9ya0k2RCtxYkk2ZDk0ajBJ?=
 =?utf-8?B?U3MyYXdHYjlhZkZiaks2UWhkK253aVZYZy93aHdMLzZNVXFPYzdaQlNaWUxn?=
 =?utf-8?B?c0t5OGZkVm1nTVBCaWpERGhjbld5U2EwY2VLUkh3emJnNjczT3VFN2RhZEFB?=
 =?utf-8?B?aVVOODNPbHpLQUoxVkt1SlZObytXeDNwYi9iOTg5ZGF6b1lEdGVWN3B6SWRI?=
 =?utf-8?B?UTFsK3JOa2RlR2oxZEw1ZjNaQ0ZpWGQ4SUliT0VGTVhaSUVtQmMzcDJwbHQ2?=
 =?utf-8?B?UWJFdlFpR2pabWtIR2ZRWll6cTVMNU5EVHArYThjczV3MkZlbVp5K1YrTE1J?=
 =?utf-8?B?dy9zb2Y1OHRDQllRQ1EwVnhMelllTEduR01udWxUWGNHRSt1Y21zZjkvNnM1?=
 =?utf-8?B?YW9DSTVDbEhWSkVNTWJLUFQvWkdvdHlNc3JMeUwrV1RXaWhnVTdrZWtZRzc2?=
 =?utf-8?B?OGx4SldBUXhuQmpHZHc4MUp0SjF1NHVmNFEyTGdzNjBpS1JOSXpRQjgwZHdX?=
 =?utf-8?B?WUJDNTdFcFVjTUx0cFBuK0tmQW84Um0rMXkxQVhqSDYzcHZQK3hsYmV2MENv?=
 =?utf-8?B?akFrdGtzVUxOWmdaRW9ZbXFIRkM4YTAwTjU1NTZLMlNZQXZldnB0Q1ByWVBU?=
 =?utf-8?B?akRsd0U3aS91OFl6M1FycXQ1TmljTVNqU2JiL2Ircklnc1lVUFR2V2NOcFhW?=
 =?utf-8?B?TlRiMUczY256ZmJpVGlwbEhNeG5Za3lHSWI4L29mOVEwUVVSU1h1SDgwUm1U?=
 =?utf-8?B?djNCZWFnejFkbDBWczR3RU9QbDg5UmRtWlpIclI0YXJHL0NwcC9NNUY0cWJq?=
 =?utf-8?B?SzFPSExzTHpobkhzWVVoZnV1c3hlU2taaEFINGV4cDJrT0VZN2RndVVTUU53?=
 =?utf-8?B?Unk2R1VjMXhrVDRYbng0c29rZHBxMk85RVFvODFTeGVkaDNSejQwOGsyZUZa?=
 =?utf-8?B?TlFxVStUbEd6NVlaWUd5bWZwRWRYM3BTY3dQcWJ4dWNWdHByMy9xcXFvWEM3?=
 =?utf-8?B?cHJUWWROYTZ3b2hhS1EvMlpiUytHa1lTTDhiRExya1RGUGxuVFJzOTBKL1pp?=
 =?utf-8?B?YTNFUVQwYkNCMlJLdFB6TU9WRzR6NXlmNXd0cGJ4WWQ0cWJqOWhOZXlBZHBW?=
 =?utf-8?B?czJxU0ovSG1uMWhIcEVJaUNIaTFVTTBiMWhnT25NTGMzSksza1BTL0dxRDFk?=
 =?utf-8?B?dzg5czVDMngzQmt0NVdJQk9pS3djUWxTUkVOSTBxeDIrNDFkTVI3dz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a0de29-1511-4f84-3cae-08da49e65a0a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 07:04:52.9678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R8ExCTg7yJlFpfM8WlxXITW2LfY6TsDNZBIQ4I4XpyxDWDlrYfH2VB2GV4BYhUWiIzPaFtDxHY6MdNB5RLZ9Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2646

On 09.06.2022 03:20, Stefano Stabellini wrote:
> Finally, for Rule 13.2, I updated the link to ECLAIR's results. There
> are a lot more violations than just 4, but I don't know if they are
> valid or false positives.

I've picked just the one case in xen/common/efi/ebmalloc.c to check,
and it says "possibly". That's because evaluation of function call
arguments involves the calling of (in this case two) further
functions. If those functions had side effects (which apparently the
tool can't figure), there would indeed be a problem.

The (Arm based) count of almost 10k violations is clearly a concern.
I don't consider it even remotely reasonable to add 10k comments, no
matter how brief, to cover all the false positives.

Jan


