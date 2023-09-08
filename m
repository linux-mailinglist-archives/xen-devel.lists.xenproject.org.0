Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A8D7986B3
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 14:02:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597957.932404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeaCC-0003nH-LY; Fri, 08 Sep 2023 12:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597957.932404; Fri, 08 Sep 2023 12:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeaCC-0003kb-Ij; Fri, 08 Sep 2023 12:02:44 +0000
Received: by outflank-mailman (input) for mailman id 597957;
 Fri, 08 Sep 2023 12:02:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=763w=EY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qeaCA-0003gr-UD
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 12:02:42 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2087.outbound.protection.outlook.com [40.107.13.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c7adbde-4e3f-11ee-9b0d-b553b5be7939;
 Fri, 08 Sep 2023 14:02:41 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7828.eurprd04.prod.outlook.com (2603:10a6:20b:24e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Fri, 8 Sep
 2023 12:02:12 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 12:02:12 +0000
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
X-Inumbo-ID: 9c7adbde-4e3f-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1bLOTBmUrD9ljq567J8fQplvuYd4dGsCB4sV0mTGYLxyeR/X7uLDSGHYL8BdOvNoj83MSkeMR4fnhCAzGLQvYsoBhccPil8z0B3yftGH60SV6HtpbFJ12q5XzvWbit4zw70UBPoxkLNVyAIhL3OxYGJyK2g9g2vVW0vWR6V0Mrsh7df5Fteu2WcKf5e3Erj6mujzVlAyTSDBMNBBMwhKLljnmPrG6VUD9idGGfcSx8aGG6hlZpqIC56kvM6rF/sqldGvI41bQJQBiEWNPxT2ynRW2kvongUwQ72XyAXlBmqcm+EjdmBdzjAFHHV1fFjxMxUFp5SdeFPov2kh9baqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QW2v3lRq8nCz2X4VkCus7dvUGo2G6ucmCxIkfLM4lgo=;
 b=n4iiq2/C1cg26A9ceGX6hwoSLdyLPm3ar6wBdIkcndf+ZPgOmjoKJWHvUXETcX40UDLRXspray+i+suFsO8H/jZKrCsIBxByTd6+HC1jSsGfUNbPf8eTM9mNi/gkGmnlLalTrupNjNMuTp/x/z+LKK5TKCiM28Hz5qab88pkwhNFN3WkGIjoKD5TULHp6zxiarMh5GzpiwuVtfLAt8yVRbnZfKT5/lyqeT+CfQaxMyUwknBqnQMpVI0F0Sj7hzWhz9QeaoG6nG/D6g1Iod3opOsz3nneZJKbw7hklZCtGTMIP2J/pIQGzjsFdIl3E3MjSStioCl+5RPefVVLsDnJyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QW2v3lRq8nCz2X4VkCus7dvUGo2G6ucmCxIkfLM4lgo=;
 b=TVGK2dEo03enQ1mMoyAVttloLBGqF6Pu9NY0gXJn7y6F+GTKudZ1DZXEhQpduCNfHRswWpxmYyzy7KkGUMxauAKS/fVJSTxRFiXsSKShRRBLxphCSdIC/xTgqm/tXY7RH81vGx0P6DIUiQZFW7v/R1gaVAX/iY0lvBRXI4LBjqv+9EgfTYGz7kXoU7XhKYmHvvqxkTZBVQEZyUupd53mqVo29/2yIp3OzdXZwEVFEXGaRjAydJ2rgjPGYvykatlNyW0bppKu/IcFXflWLREQyvZTOOkE7MtkEA9wYLMaxMXNgizaNToXSJi218/GkOMPEOxS1BLufAOx5gRlYEzWAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <34c48cf9-79d3-7c19-a1ed-4107aad77ad2@suse.com>
Date: Fri, 8 Sep 2023 14:02:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH] x86: change parameter name in
 {hap,shadow}_track_dirty_vram()
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <d9bf20e655cc5940aad21bcf43c53fe2d2e0ca58.1694164086.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d9bf20e655cc5940aad21bcf43c53fe2d2e0ca58.1694164086.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7828:EE_
X-MS-Office365-Filtering-Correlation-Id: d562dfb7-d946-42a1-6999-08dbb0636fcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DiUQ9KSSm3ZMeaQNew6+cX9TrRcyPRzoDRg4F/nccNV7GKEmKtVpFRUjvzuNwkYwVfOoh4Y6g+LM4ULtdatCctKEtAQFb0Q4dK2jL81nT3l150dmyi74eE2OjCVdL+VZwxQFBZii/mj7qgeCVnaaqdaeZC9fWpEHUg0bgBcI1GpiTLEVGPs7GB+QjlwXAGjD2wZC+Gzp15utWVRmJhEp31iavinD47PsSBFvGt6aax6orZougXRYk4F/yraD1/ejCP/8ljKbj0l1MrJJsSe3OE5n700hGwI8IxjdZL/mOYAzgebzrSUE2RRE4CKmA16ppZBxG/zzs/S+jFzODHp5jsHUOmY7/jBhAsgvc9JeOTjAevlIJgrZatPitKPDh57ui82K3Mi3ShkUZ79ahFddwQ4xKY+lsmf0G/AE5vemIkmUm9KlUS/KYmgV1v2B/IC83ASmFgQsF4e9qH6WnoL28SVoiPHUpe1vQrullZnDCRUfh2/uWNEvL+zZHrH8NRWoV62NMzqCrqXYACD40yiDnNLacyjGld2W522g+LcHOJl/B1Au3sAaxILbMqBr6Ku8WSDOn3k2HtHqu2MhjIRIHg32KtQFtn/VpX5/xlkisrii9In0IE7aYopRSHD7CX7TO9/z82dhYUGDLkhfhTJ6BYcGt943WJuS4WCL0/bvHtk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(396003)(376002)(136003)(1800799009)(451199024)(186009)(6506007)(6486002)(53546011)(478600001)(6512007)(4744005)(26005)(6916009)(41300700001)(54906003)(66476007)(66946007)(5660300002)(66556008)(316002)(2906002)(8676002)(8936002)(4326008)(38100700002)(31696002)(86362001)(2616005)(36756003)(31686004)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eE1xemJJZUFua1Fnd29GRWJsTkVUMFp6a2R1NWVZT3kxNHdKMXdBVUIyZmhz?=
 =?utf-8?B?T3NiMy9MekFHOHBzTGx5Q2hZUUJDME4zZU8xVW1Td2RjUkVXR3k0ZEpoZHB3?=
 =?utf-8?B?YWhlR1BNRHlGa3JsNmJqVExQQkFEVzRqTGZWSVY4amc4cEVXcVdwMXBMR0Jr?=
 =?utf-8?B?c21UVkNNMERpM0lMT3VzVHpLRWRac1dTN1l6blRUdTZYUWw1Q1JTb3cxK1Mw?=
 =?utf-8?B?VlRKWEJtYkVsZzBjS0JmdGVlWmJHdEJyU2kxZk5qMmIyK2l5RS8zdE9lYkdm?=
 =?utf-8?B?ekFpL0RZenpmSkI5NE1zT0lVTG81a1A5MmVGT241MUFHcXJUSm1SSE1RcUdG?=
 =?utf-8?B?enc4VGZxdlpiYVU2ZlArR3ZEWTdYRHNxbWVsNUJpdlE5SjJoMmhCQTBRYWtM?=
 =?utf-8?B?YUdNS1cxTmQ5SU5uWFVhaWRJL0RVKzNIYmwyVGNzWVhBMlR5TEZLTmtlaDd0?=
 =?utf-8?B?UFZDVWpES0ozSmdBTFZheHpVa2w0dy9SSktXNWlEZGtmUEFLR0dySFFyWmFi?=
 =?utf-8?B?RjVTTDFRaCsvcUZUSTBVVkFCUVFtTDUxV1Zlc1VTeFFGSmVaYno5TFdpd2do?=
 =?utf-8?B?ZUU2NlAySVZhRzI3WEViS29LOGk2bjNiejBzUlBLdjFqcEc1QTBNSlZ6cnRQ?=
 =?utf-8?B?YVhJa1dDWWNhTm9yYmowQTByb2wrVUJqT3V2eWlXc3dUb1k5R2Z6NEJTeGN1?=
 =?utf-8?B?dHVMTUZGeEtTOVFpTkpBUkVrTjlkdWRSK1llcEZmMzUrMVNURmNFZ21YZTlR?=
 =?utf-8?B?UDNDenVDSmd6blRDZWg0S3h3N0dEVitzb3hxT2dEMHBkaGNQc1I5dmx2elhw?=
 =?utf-8?B?M2d0aXdxQXo0SFdwN2g4aXVEOXErTHVNb2IyU0JKRE95a1lGZTNqaDUvUG5B?=
 =?utf-8?B?WjJmb3NBRTRFRkRxUzVycVpZTFFYdlJsSXhtVExqMWZTaW1FeGZJbC9vdm5K?=
 =?utf-8?B?UmwwOVlLZVJJSExJYm0wamtIMlhxckxvR0xneXV2SmpMbk4wYlY0bFRNQmpw?=
 =?utf-8?B?NEFFWEd6VzlSeDRzWDIwRTlFajRFQy9DbHp6RFFkMC85OUl2b0xVd0N1cFVi?=
 =?utf-8?B?WUxVa0RUT2ZFZkU3ME1LdVUwYmFtNS9GSForUFNmMVEzTTlDdHdyZm5aMVlM?=
 =?utf-8?B?ekk1cE9sMkpBaVV2cDE4TVcvaExWc25jNGhpYXE1WHU4QWhuRUZ4S3JrVzZw?=
 =?utf-8?B?c1RTbnlUZXBGK2dKc3BNdTdmZjNNNzJ4Ri9aWmdlYS9oM3lhK2N4YVJ4REUw?=
 =?utf-8?B?WFRCOXFweDhFOHVQWG5vWlo4b0NkMGErUnhvYmVvS2pkMmlqSXROenQ0dFZ2?=
 =?utf-8?B?ODlUMm15RmJRbVIrcXYxSWtxaG9kSWlTNDVnUThnZVNKWmtmdEd4ek1hL2VJ?=
 =?utf-8?B?SVBET1l2R3pkZHYvU1JTdVpQcFIyUTU2UE1OVUpBeENJeFk1ZHErQkZqbUFS?=
 =?utf-8?B?dStQdVE4ems3NlNIc0JYYkpONmZTeXFQR2lzMDF0Wlh4ajI0NklOTFhCc2hC?=
 =?utf-8?B?U1AyTVViNklVZUhrVGpsdzZPdlpCU251UWdSTzF0KzBlOU1XS2JLOTV5bEw1?=
 =?utf-8?B?Qm1zUXB6aEY2TGc3Y3VNVG5DWFZsYzhHTjloTGNYUHlBdWdIYnE3eGdyUjdM?=
 =?utf-8?B?MzhreENrRGh2a3Q5T2V6c0hqbGlzcGlrSklYWHhEODlENjFzdUY2KzQzUzVz?=
 =?utf-8?B?d0YyOTFaUTRPeVFra1o2N1piL294V0NDNkRGRDZZVE94VUZ1VXg0bVJtNUZN?=
 =?utf-8?B?dkRXRWNrTXl5eVdMeEZHZWZlSVdaRVRUMVRlKzBpUXNGZ3pucFkxdVZHZm1j?=
 =?utf-8?B?N3NqYUhWUnJrYXFnYVhNRjBVY1YvcWVEZkxwNGNxWXBNQXhXTTRyc3ZiWmdm?=
 =?utf-8?B?VGRJRXBJVzBVY0VIWFhqVjJtM1hPNXBSU0ZKY2h2cU1VSUgwVlhyd0xLODZ2?=
 =?utf-8?B?Z1FEdkdWWmRCR0w0L0FuNDI4MnF1U2dJRHZXeC9OcUpXakVNVzhOeUNCWDAr?=
 =?utf-8?B?YkM1ekxnWXFkS0xCZXFiYTRLT2tZMEJCR0c4TEFvUEQ4NVV4SlRvRUx6TjJm?=
 =?utf-8?B?cDYvOWxkcUVMK2pQZXppbGFHZXRkK2dkWW1JYWdzdHhSVytQU0krbkxxN2xZ?=
 =?utf-8?Q?PR1+xDNNHgCmqLPA1Do0vM49U?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d562dfb7-d946-42a1-6999-08dbb0636fcb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 12:02:12.8219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cco+SLq9UdE2r6gLHrsUNliLZPFBnK1+YX7N4XdeaEDabQ7SVs3QOBodYBEQtWpC2daqI1dmem/mnLtHiaU02g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7828

On 08.09.2023 11:10, Federico Serafini wrote:
> Make function declarations consistent with the corresponding
> definitions to address violations of MISRA C:2012 Rule 8.3.
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



