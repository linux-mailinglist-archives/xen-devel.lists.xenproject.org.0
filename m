Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5BA5AF749
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:50:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400356.642069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgSK-0000Hv-Rt; Tue, 06 Sep 2022 21:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400356.642069; Tue, 06 Sep 2022 21:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgSK-0000Eb-MQ; Tue, 06 Sep 2022 21:50:04 +0000
Received: by outflank-mailman (input) for mailman id 400356;
 Tue, 06 Sep 2022 21:50:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVgHm-0000Cs-Af
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:39:10 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2055.outbound.protection.outlook.com [40.107.20.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb574e56-2dd1-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 12:52:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8803.eurprd04.prod.outlook.com (2603:10a6:20b:42e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 10:52:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 10:52:18 +0000
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
X-Inumbo-ID: fb574e56-2dd1-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5ZwRvcD3YBWu1xBcdo/29R9L+5LhfnPgUwQQWYL9+4yPRgk55VVMhIq7dWFzLnBVNEGBXBj3tv9Bk5qXNFmfrg1nGACTCWzewQ8CHShyyxpALkPLUDzy2MzCPSLZDmpEWT7TW9aSc+bYso0lWNGk/Eu/qRFAIe2xkfZjxthLkHr6D/ZwnjoBi85v5qqDCF8sj9p0b28/i7nqopsEvQacUNuZ6sesA33zGt7FsPBDyEQRET7pKJZkBDO9VJC/yFAw/78ctO1q6hHbxPLrCDvTowDN6s+4NV8JCKIDTpBm/hfXbJIM0cvaD0FigdcDLQSBMFvSIeB3qAty+fSfFSIeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jik0AS91Z62dGz9zQ9cTsb2Do4NvlItXiH4vIWsfFF8=;
 b=S4UTvLl6TPpwuNNLRrrZ7fa63Ccq8fuhZaJnO0V1ntzKSVnEMAC3oMFOd1z2kKrdHr5vIoo1b6otzD4klROugVS+1wAPUtPKQklQKdt63hTQkFn0QECHOMAxQDPEJyifEZbsWEjYzdYAXUtYivSxh0zkDqHhFwg06KVlb/VcgrwPy2T60vBAd+pE7tsJFJIo03TmlRpBfSwxF7ESb7Mfd7upYCfCVMAQTfqUImL/KnHj5lLB5fGXmukSHPouMfIXL2Dk8OxTgKNfd4Ku0G5ADwJ7b0z5Th9V3L4Uwu4/zYZnRRsVNJn48/9OSJqkxOvMBfhy8nFlW4Nz6zdoVF6TCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jik0AS91Z62dGz9zQ9cTsb2Do4NvlItXiH4vIWsfFF8=;
 b=J8vDJroaGE9L34+44xj96W9qCtuUcGFwJS9skI/wfxnqeI3eXqcRUy3AfQG/MaG7KH6t8E89NtYY8ojJ2s3nUSRKz8K7Fr89/ofojQsNI8tU5NKFSr/YAeTYmMDacI6Dy9OZan0ATm8vkgEiSKyXz8NbrmzO9SaoVIRyve2E+yvSq4Vv0bgjmIgbVKYcip3jgfM2NfxWoLEUaJ3+xQ2EQklKpM97pYjP8usdkIVkMKGc/C3INEAXjwk7+tRIGPDWotwxixCJZBjhtG+YRH8CFRsyb/AtZfVeaC+RfMS+8eH9C/PGPMvirBGA84kH+j4vJC3Si+db7FvljMcNhEwUoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0fb4cab5-beed-777e-ae58-5d8b79893c30@suse.com>
Date: Tue, 6 Sep 2022 12:52:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: Ryzen 6000 (Mobile)
Content-Language: en-US
To: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew.Cooper3@citrix.com
References: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com>
 <ahcgeCqoQJKf6ZfqNjJzlj2HrfbP1WIHtoWUchYWvX-AYoV-eapQJzAPmjPXpOU_pfDsYjgXx3K0CzD9Z2eFHhbpBJpJBidXKBWIFSmDa14=@protonmail.com>
 <55eb8485-0c0d-51cd-c9b8-d517994ec6c6@suse.com>
 <QUNqwybRmGkA3A2mUhDhAo-9qWFOaa1hpbwQG_GhKmVTf70L7qcvpw7ekgAz1S9N1eWVhFChE8KTll9jxNrPF5r2-RC9O3ao2CXL3PHNBlc=@protonmail.com>
 <7807b9cf-a09e-a393-ee7a-dc220a68e56e@suse.com>
 <Zz_iE6KdPdkQ_TjUf-W2ODPIXo2WwXz0JxF5vgPjVuz8uWfJyto5S_nYRzSNrE0jC3r4ILhjkLH_PtW_fmIeTQIQtI6wTZxnUvOl0pr6ne4=@protonmail.com>
 <3b2ad2ca-3c6c-4dcb-c603-bd5440350f20@suse.com>
 <2dHPPtixTlkUXYEzNPFRI4ezKHSe1A2VaThMjBpd1aM3NFkZQuyRdfmNWCigm1oXfdKhOwDJGoPBBIMLYtYhQlENV2eFVZ0G9EMOMj5e6UE=@protonmail.com>
 <941ccb01-adf6-d2ef-9a8a-ea8fdfe69ceb@suse.com>
 <J4OUtvfDQmC1VoMHUDxa-c-c6LAnJzclOfocuzVylOTkOKm7H3Rp64q4svIjtgzGKVHQAuorobWyZxsamZsozAbiV3iZFvn__AjeNBqGf2Q=@protonmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <J4OUtvfDQmC1VoMHUDxa-c-c6LAnJzclOfocuzVylOTkOKm7H3Rp64q4svIjtgzGKVHQAuorobWyZxsamZsozAbiV3iZFvn__AjeNBqGf2Q=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 282c9be2-b28b-46f9-66f0-08da8ff5de69
X-MS-TrafficTypeDiagnostic: AS8PR04MB8803:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qll4QXRwj7CJPVWqElbVoa6cCISQHujFSnzqcVghbSwfc0voQwx54XuU7tQQyqpQUc2kKbimdDI5mGctWk/tAW2aQk02MZNeNYZkOuTfsYNKH55DG8Z9+rrFJcI4WThhbFAifO46ebvIvLhOpTanuP2Ds5aoL25HN9PPPSK9yPFRBghnM3f7LTvQzcv3EQkQhIuGIjmhVJOT5NmzqlLQz1ngqv2jUZWwPolv2RHSokVs4nIjvSB+DqFr8QCQUbw/nfKgii1AkFNf8DCLDGRBPSnf4BKt7P2x3srHk1UuOTx1enZC1818Xv40+AGIXjDQR9LxGpXdsWelh7ubDt5iTffwYuCL8OmM22Oi+oxAgVi2Vk9X2ATq/mqi51pUV5DzGzSDBTujnZ6INqm6p2uRTVs/EM4ISD5Q3DcNXsn7REOPYbQibgrSGg1aXs4H5GpsswZhd/wDPxaN5hHKPYufx5iC2VSL/XUNac1HLRmU5bkzWcbGVXJokqmjY0Buq9sd5LqC+KiXK8TRIT80cHFnyh7ZpaXJqFUNQd3TVfYxvoQONGZ1NPOiX8fGEjocurp9UbADMnjizw69OsthpxS1Mvewn1NGMh2F+o0UiVs/UtVFAxkQufOohJPGQRBtgZjG0U7+be1ZvGFhjsT0sQy/IHDgYNhmaL26xAQKuxfzxIeeq2CyaqRwiB+5oRzt0LqrrGuX3UfDfyT20tr+46OFkF/awc2H330XmbJZeOnrHCh1xuVn8HuTXwX6NuQGP2F1nfH3f/fbOrTn/wD10cqy0mUIScYuoAP98p2CPpbfhwc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(346002)(376002)(366004)(39860400002)(83380400001)(8676002)(66556008)(66476007)(5660300002)(4744005)(66946007)(8936002)(6506007)(6666004)(478600001)(53546011)(26005)(6512007)(6486002)(41300700001)(186003)(2616005)(6916009)(316002)(31696002)(86362001)(36756003)(4326008)(31686004)(2906002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTJLMWNsY0EzbitGQU9RaUgzZG1jK3h6U3pEbzh2U0kvOVRUaGhJa0RSSlBs?=
 =?utf-8?B?WXB3b3hhU1pyUHhCNzFkUHdCQzhlWG1tZUxMNkFOM1RrOFJmaTFJU3NadER2?=
 =?utf-8?B?QnBUQXN6d1RCUlZOYjE5TGhBSTF0ZjA4dEdBR0FnSXNNZmZIMWVXSTl3SXU1?=
 =?utf-8?B?U2dkNkpXS29NMkRQVzBoZzRLaldUTkUxTXNOSXBtOTQxazJOa29mMVJQZXhz?=
 =?utf-8?B?NDlXWXNhWW5xc29jdUl0YWx2YlRGcXR1SmxCQlU5SnJTL2xETm85STZwUXkz?=
 =?utf-8?B?VFRIbWFwUTJuSTM2dFovL0o2TCt1M0ZieEJwakY3TzRsWkJCalBOQ21PSTdQ?=
 =?utf-8?B?TnBRUGFIRmxOcDF1WkN3MVFWWkl6c1hWZVdoRlVGU2hhNThKbkIzRjRpMG5r?=
 =?utf-8?B?cjZXRGVBR284UkdVY21YQm9aZElIbEp5S2dUeG9iaGNzckFmTkkvZVBJZmt5?=
 =?utf-8?B?Y1lXMTJQVXE1SkN3SjRFNGp0M3czYlFJL3BJb1pFMVdJRFEyZkVtbTNZczNP?=
 =?utf-8?B?eVVqSlZSMjJ3MEJDSmpwQWVacG9DNGxtTU1SZzJidG5rUXNkaWJ2bGFxTEx2?=
 =?utf-8?B?RW5pdkdXMndqRzA4SXdSNjR0MzhHVVMyT3BLcllheFBhdGQ1TWZsUUdib1dv?=
 =?utf-8?B?dGVnSVFoVzYvd1llWFVXZUtuaXNTamhROVlDYSs2SWFlb0JsMXkvcWJ6Z0cx?=
 =?utf-8?B?WWFMV0Z3d0tyT1FJS0h2K3VBRmRBc1hCcElXMXF4WHRhRWNxdk5XVFZmRkVP?=
 =?utf-8?B?a2c5T3dFYk4zeEFaajdUSnBuMyszNlAzdjFmdVowakJJcGUwTkx6cUIzQ2J1?=
 =?utf-8?B?QnN0VWRNeXFlc0cvT3U3Y0szVVRoZnRnYStqRk1oMnI1VmNUYWZCODFvVVZJ?=
 =?utf-8?B?SDZPcFJacG9QYlBJcnh1TU9QQ1BMWnZZRVpIYW1zelRRK1JWMzFHWFJoSlhU?=
 =?utf-8?B?bTM1TExsQTRQU3VqbWsvYWxqUFF3WkNsWTdmd3BuNnJDcFd0Wm9PNXZ5Kysz?=
 =?utf-8?B?SkM3alJQMjI0Z2V2RkdGWUhQNXFNVHNpcmN4dTVKZjlndmRSRE5hU1N1M3g4?=
 =?utf-8?B?Tzdqcmh1czNQd1J6ZlB6Y3dtS2paU2pjOW9CbXFxSmRGR0dKVW1meFpRdW9V?=
 =?utf-8?B?K1lwOTdYUVB5KzhDeW0wcHVKblpBelNCVU9rcDd1RXpqdVpFc0JERG1JMkgr?=
 =?utf-8?B?VHNpbEdKQmxSMkpKcStUb0UrR0pXM3ZwRDhkQUg4YjNsN2N3ZHZaZjBZRVVt?=
 =?utf-8?B?dlUySW9xb3NtSUtHYVZrMjlnTUx3R3p5cTF6L05zZENhTnNSZ3FZK09Id0FD?=
 =?utf-8?B?SExidlVRT3lkSUpUODNEOW5WS2Q0aWJCaVdWODVBMnpvNE1uVmdQWng3Z3Ar?=
 =?utf-8?B?ZXNFOEUrSUNtMHdoYmo2ZGZYc1BVOGNNQzE3MTEvNUo0V1VCWVVpUGFFVXRr?=
 =?utf-8?B?WTF3VWp1SHA5TFdwenBxcmpvZGhvZ2NwSkdoM2JqNXdSTlFDTnd0ZUoxOWdG?=
 =?utf-8?B?RXNkVGJ5MzVwdzJIS3RKMWY3RHE2Q3FubVVEVDl4Z256UkdUQzNSVCsyem81?=
 =?utf-8?B?bENBSTVBRjN2dUFLWEluL1c5R3dVMzVjdFV0NnZMdkdsWnNyMTR1MDVwZ2dw?=
 =?utf-8?B?MXY4R0FCK0Uxb0p5OFU1djhxV3doMmhqRFRPTmxBWUFLYVBTZW1zOWNUMlVD?=
 =?utf-8?B?azZ1d0I2SkNueEcwb2Zld3lJWGVlOC9TODltWmd5dFFFbmUvejlyb20xSXhr?=
 =?utf-8?B?alZOTGM5NmNFVlVPQk9la1pRR0t1cTh1NDBHRVVkSzAyOXBTZjhRZmZuQW1J?=
 =?utf-8?B?dC94MCt2Nlo0d2xkTmJMZXNpdkxaM2FGaEZCUGphekpXb1VSeTFSbEt2TGtM?=
 =?utf-8?B?OTlkNmE0UWVGekliR05McVZGclhXbmgwcStJZzRZTHlLaXdxb2luenpjb2da?=
 =?utf-8?B?YTJ0aUJadVAyTUJ0cFVDZkgzS3oxUm5iSGZzQnY4SzhyWHNZL3ZsMUtCdDdD?=
 =?utf-8?B?S3lObDNMTUJyOUJYSmI0Y3J3OVpyM2RFdUFrcVJubllxZ0lUdVNGRHd3ZGJ0?=
 =?utf-8?B?U2I3bWdNcGhTS3dwMW4zVWdlbDhmdFZYMjI1OGk4UXZjYXR4c09ZWDJzaito?=
 =?utf-8?Q?KtlkxPptrwfMtm6EYLRCgekxN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 282c9be2-b28b-46f9-66f0-08da8ff5de69
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 10:52:18.9117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFSE0wgEG7q/Jz4ICDc1eaGC3kJmZZdtkuF8X9vlMlQ+ZfdePscyRiluie3eCKc5PAh4zuC++iBF1DBPVOFmTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8803

On 29.08.2022 17:26, Dylanger Daly wrote:
> Please see the attached iomem and meminfo text files from both Qubes under Xen and functional Fedora Workstation.
> 
> After some investigation, I've seen that I'm able to run a few small VMs just fine, however as soon as I start a larger VM, PCI devices appear to stop working, I assume this is because AMD moved PCI register addresses and Xen doesn't know about this change, so it's mapping this memory for other appVMs to use, resulting in weird behavior? Does that sound correct?

Not really, no. Even if BARs were moved, they still shouldn't overlap RAM.

But yes, BARs moving without Xen knowing would already be a problem. But
then the basic question is: Why would BARs be moved? The only reason I
could see (in the context of VM creation) is if PCI pass-through was
involved. Iirc you said it isn't, though.

Jan

