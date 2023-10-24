Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A95A7D473D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 08:18:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621681.968380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvAjz-0002dm-5Q; Tue, 24 Oct 2023 06:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621681.968380; Tue, 24 Oct 2023 06:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvAjz-0002bN-2b; Tue, 24 Oct 2023 06:18:11 +0000
Received: by outflank-mailman (input) for mailman id 621681;
 Tue, 24 Oct 2023 06:18:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=krZT=GG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvAjx-0002bH-Mk
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 06:18:09 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18b7e74a-7235-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 08:18:07 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8517.eurprd04.prod.outlook.com (2603:10a6:10:2d0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Tue, 24 Oct
 2023 06:18:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 06:18:04 +0000
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
X-Inumbo-ID: 18b7e74a-7235-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bh44/ngxNTWc7Sm/ZvO7obM9x4ufMPNfaXCe5KyYEXmZ+wQvL5q1F4MYqxsQ2iTaiZjhWd72voIksIVjMcDeeRMjKhTM9LY19xkmiXYbHW7/mZfqIOHeDPScj5kBMCdaAhgfFqlposC4+y1Cd5rKC0CpQtRmzLNkr/mGIuMpD3JgcBkeaKOzDHcaESUrGx3k8fXvGZNnPnBCTCl2KDC087Qg3cUrd4YTPISWLf7JoWQbPJFxxcKtpfmdkm4HEDQSNY/3HH4JB4vyFtVUQUJMOBeuuePbwbrEAIdgon5B1fq7vjGIGwep/Dw+eA/8f2HNONPMmkAF2+E4yX4smskzGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=meOhckSGz7sB6XMATvRUeZ3/xGpt4+/PdGAQpnQpXNM=;
 b=hgaziBP4iraP7ln7Ug8YovXzrod0XokDDhArnPe6QtiI66YW+/8aWx2+5PxQl1WshhPKEcL4Rmhtl6VbacVku/5FQAoSSMj8PHfy+839eA8QXDRzV0v6nWJ3Fb0xBncHKnITyl4qbJveb+gi7EcATi2yCZcIZCdtOWThz8pTNCPKnkjw0XL2K9e6pGiz0wmQxErsar4j/iRAIBBYc7ST5ct4kKCorZYUvimUcmGGEVunPUcufbUo7Fa2jrWJnBWMsV7iiRe8vFAltbSZCsz/f3in6HO70RXEQ9BrnrsgrFxy1mbh3WCZ4zHcZ/eeswyt3m8jomkcXKEOaQ0x9/cM3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=meOhckSGz7sB6XMATvRUeZ3/xGpt4+/PdGAQpnQpXNM=;
 b=hpseLTGPmPI/UcEM6MMWQB7hclJhayOVlfGVIo/0Yl9EDUC0Tqy7XKWZIYxZPvVR1m7OuWpDyR05Eo0Agv4oOdRDCncQVa1405LAUq7Sxhy7I6n/bkCiMuA/6nAG12Lx3dwW0cOpOVEh+oz6Us0G5yKckGvam6MMXlFd2uyl5+r7drb5gnyuwTac5uC1jjxP9+wXWih1Lqe7OxJUf4IqzheROb8XOLofSWv4bhrzuiKRRuIVIjHxbKO0Hwtq875xi0ftQEOkO5ttAd1e/rcag7RD1kUqFoFtYyYZOFVI7PRe8B9WhrWKCnzGsjtwvpS722h5zD5REjqMpWyrVuL1EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <55f94865-0b81-2e3c-2fe2-ece529cac361@suse.com>
Date: Tue, 24 Oct 2023 08:18:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v4 1/8] xen: modify or add declarations for
 variables where needed
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1698053876.git.nicola.vetrini@bugseng.com>
 <1da22c0b7c32f62f200383af8607caaf1a02ba0d.1698053876.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310231603210.3516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310231603210.3516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0401.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8517:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fad7b93-b2fa-4907-1de8-08dbd458fb9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YW/RhM9z4RowZQt4MZ1sqAzSMPIYQ8M2rie90ds8mr2nV/IXVrrK3VQ3VryG5tFIf5yc9cCLceQ0g1nlhrfjta/lt2YNG+MOg36eR9Ii4rNlWkBezIHPiZo5acvD0wwSqqhGgyaWmx4xmqmmGkJx4V77Adu8YwsUoAbRKvUGSlH45oLvEquqeOKmJ6e2issN4usEKcI5nugqv4AtMv97KUpSYGmDc/BBns8naw+rIJCGbY7BFU5SwyhYVupfSI5nPMemycNde4LBZy4S9T5U/2wPXbcPRsRm9yLtatSrSZcvmbWfm3/SGHhT+owq8n4MifHqlfbfm2YdICeSWfIGGUlB7n6JtHmQOtUNyb5ATUtkl28U/6wIM4X3B7jwAjL7dTWgKjCCjCDl0qnAuc9Imgj8w+9P3Dow9S0bT/N7ZJjR2JvUvQ+qXhA1D51/WOKxaDApSYc7tqkcSyGUD/fMjEeYLP1evxbMlI5aChD46xnkUMBZAC+yFei7vDmXmHwB1zzBqHS19/Pp7PCDTIM/2pgfs/hzT3F+jP6kDYDkiCBtw+YAfSm+m0lKfD0W3140wzc241uhZECXQ87ta+F8Dq7KX8nqa2GDB9lV7NaKsTr/raFEA/ZZrRaXzS/55g1WNg5pFHwKDasATH9d5yGJwQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(376002)(366004)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(6916009)(31686004)(4744005)(2906002)(5660300002)(7416002)(8676002)(4326008)(8936002)(36756003)(66476007)(66556008)(41300700001)(66946007)(54906003)(6506007)(86362001)(6486002)(53546011)(38100700002)(31696002)(316002)(6512007)(2616005)(26005)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmlaenkrNGZiODM2N0hPQkpsYlFzRy95L2E3WWIwZEIvMmRiSlVmR1N0TkVy?=
 =?utf-8?B?dktxWE5YSFlsbUI4dGI4eUFNSGM5dVpYczNybnlnRFdZK0w4WUNpTEM0bFpk?=
 =?utf-8?B?eS90RnNTcEthYlZvOTA0YVdOcUJORXpOWDNVWURzU1dmbXpnVzRLSG42SXZR?=
 =?utf-8?B?SjVoQjNobzVVL3hJMkhTMWhxTm1WV0VZMnhFZVZYdGdtaTJqWDR1elVhRmVH?=
 =?utf-8?B?dDdmamhCdGF6QTRlejBlTEpTeVhZa2V0U3FNV1ZuVXFUVWlBZnhEc1J2OVZa?=
 =?utf-8?B?MWJaekRJVGpKR25FeWl2andVSG9YTTJJSE1oaFRCRWF4eVY2bm9RRmRWQ1dx?=
 =?utf-8?B?WkhidE5uV0NPemczRlRpWENzYlpVZFBUY1FxZ2g0eXFoamMxOVY2SjBLbjBj?=
 =?utf-8?B?ZlRhd0ltZjFEVTlXQjMrRGZsT3hXNGlML3ZjZHlvUnhOVG9qZ2ZqUEdEZGpL?=
 =?utf-8?B?WnVVNmFiTm9maE04RFJyRng0dTJPbG1md1FrU2VuRHBGajNHS2lxK3B5Mk84?=
 =?utf-8?B?djBIU2JYUW8xeis2MjFsSElWaGFiRGJpT1BBQ3V4YStPSVRvK2R0aWx2T1FX?=
 =?utf-8?B?WThQQVNoWEl0L2pzMlA3THg0OFB0NkFkSEpvVlUvc3hrNGI3bVRMU29qU2Rv?=
 =?utf-8?B?Z3JlcitLZ20yV0hNM0I3ZWRLZHpCNUJpbkk5ZElqTE1idk83TW1rSnRua25o?=
 =?utf-8?B?TEFhSXY2VVF5QkNjelY3WW1ZemZWaHlZelQrdmpkek8wQnVNZzh3aEcrWE9T?=
 =?utf-8?B?VjhyVlNYdVNlSUtxNEZ1dDFYNHBZTWtTSFVBWEdrVmkzc0FscGYvdTNCaGxH?=
 =?utf-8?B?eW00UUlSazY2cW1NNXZxTDlnWGdJVm9ZekQ3UXdkL203TldzazNYbjdnWW5H?=
 =?utf-8?B?aXNmWHprdHhPSURFSWtCUktnck1iVFcyYjA0YkN2MzFGOTRCMGpyTE1nNUZy?=
 =?utf-8?B?SUZXbXZXOEZaNFpZMVQ5QnRJSWF6L0RtMW04di80c0VmOXo3Z0NUcGdEY0Vq?=
 =?utf-8?B?ekpGQUpvSEdtMGh2amkvTVNDTGxSTzZyMjlVODhEUHVIalNENXJvdVFNYnZ1?=
 =?utf-8?B?Wm1odW1tOTB6RzFmZTRRRERUQ2cyTGpzVmgrT0dRMXZVZGZUY2FDU0dzWWhp?=
 =?utf-8?B?RHhTVVlFTExHMjlCUlFCVFZLL0Y4NnVzQnlrcE9pblFhVDN4cVVtc01OVUZF?=
 =?utf-8?B?RGkwT3lKYXNUN3E4U3pkaFB5cUtqNDNGdWNUT0ZoQWs1ZVlvaWNwaGpEUTU1?=
 =?utf-8?B?eXArMlM1eXA1R0hFQlNQVjFNRVJEQmlKa1dGYjkvcjdMbGJNU2g4YUdFMXJm?=
 =?utf-8?B?N0h1YWtpYXJRaW5QY3R3WDNJbVhwVEVCZkFUSmhNTFJLejZCcHhHQlNoY05B?=
 =?utf-8?B?eDZqaVJRSVFnNUtsZlc1REdva2gzdEdJWS9YYnVDZjRnTVpzWHF2Z2lDYlQr?=
 =?utf-8?B?TGt2Q1pOY1dmcnQxdFZIbFo3WlJmVXZZSk5UN0tkSitQekZPSyt4Zlc3QUoy?=
 =?utf-8?B?V3lxNWhsQzRJVFVuM1BhdTdpbTFlbzdVVWIra2dWVlo4QjIwZmN4Ri9vQ3Z1?=
 =?utf-8?B?VGZtM2xYNHZ1aWNUeXl4TVlLYThWSmdYMmQ3WGZjODI1T0pGWXVXYkhVbzBa?=
 =?utf-8?B?cmM5SWdWMHFYc0JHcW5QUEJrRUVMbXZZZUNVNXRYbHlKelJTWEh4U0xLZktY?=
 =?utf-8?B?R0JienFaZmMvRlh6VTBHaVlUc2FwdDBVQXJGTGdOL0ZVbzdlZFd4UTVWTEQv?=
 =?utf-8?B?c083S2swT0JxNzJOUkRIT3J2dDljSkh5d1hFZnMyd05IU3VzbFI1cW9Zc1ZH?=
 =?utf-8?B?a2MrbWRnN3Z3VWc2dkRQQnZ2cWNBRmxmUkFPYUlIY3JHSkF6UHVLU1I3MkFJ?=
 =?utf-8?B?YUdrRERPSmI0Z3NhVm5Ycks5dEUvM1JBaFNvZEYzRUNHUVZUWiswU2pWNDhy?=
 =?utf-8?B?TkFOTnhkaTV4bWFOTGNyWTVTRjZTc0JlUlpUTGRxZDR5VEpobTZKWkw1QWhI?=
 =?utf-8?B?NGJrRmlVSXVSczZDVzB5dVFTc3B6Ylc5anVqSnZzR045NkZRRWd4aUowaWUx?=
 =?utf-8?B?ZlRjdW01SFlmT3FCZ21SdXh5Ykk2SFVCWEhnazZMTkx0Q3FUd3NMWmZJbi80?=
 =?utf-8?Q?0qAAk8AJpJ/sOeorHU3w41A9R?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fad7b93-b2fa-4907-1de8-08dbd458fb9d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 06:18:04.7673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ni4ezWojBjGCBB4C6qYFA2W7WAAIwRX7WzGtyDC/G8Ui3DBqfoQ9LUkBYtx12gpNNj/vMYrHPO8Kv1aEfpPdcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8517

On 24.10.2023 01:03, Stefano Stabellini wrote:
> On Mon, 23 Oct 2023, Nicola Vetrini wrote:
>> Some variables with external linkage used in C code do not have
>> a visible declaration where they are defined. Other variables
>> can become static, thereby eliminating the need for a declaration.
>> Doing so also resolves violations of MISRA C:2012 Rule 8.4.
>>
>> Fix typo s/mcinfo_dumpped/mcinfo_dumped/ while making
>> the variable static.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

(for x86)
Acked-by: Jan Beulich <jbeulich@suse.com>


