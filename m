Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 036B54AD539
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 10:52:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267917.461678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNAR-0003fV-3y; Tue, 08 Feb 2022 09:52:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267917.461678; Tue, 08 Feb 2022 09:52:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNAR-0003cd-08; Tue, 08 Feb 2022 09:52:11 +0000
Received: by outflank-mailman (input) for mailman id 267917;
 Tue, 08 Feb 2022 09:52:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHNAP-0003cV-9R
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 09:52:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c754cd59-88c4-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 10:52:08 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-sznXnPTYOlmGs7LbJpMj9w-1; Tue, 08 Feb 2022 10:52:06 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR0402MB3606.eurprd04.prod.outlook.com (2603:10a6:209:8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 09:52:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Tue, 8 Feb 2022
 09:52:05 +0000
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
X-Inumbo-ID: c754cd59-88c4-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644313928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OJQJu6iiSQubJdVRUTTp1qHr67Drvf76PVl7Uxn22lk=;
	b=KqAAfLIGQyZJl3Ogg4U6ZxKLUz/LD0u/vyZZQEFAgNq0spuJoOF0sICVNUa6M37+xZ5Uad
	sDAI3TuOcl0HNH5s3ZWxolxH4fYzNtLE6RpJA4B5fUtMSQo2duB0EoJWcHoM0sdhzkjjSn
	ERZHgT9u82qaes7d4OFeHKapxf3stvU=
X-MC-Unique: sznXnPTYOlmGs7LbJpMj9w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cUjSEfUeFErEEFXvEtqXo/ioXb8xAC0xP2mF1ihHapwpEm7dgsGRqK7dXLLKh8VnasQwvWBnUlfa2QLuIuOeG9SFAVHnI2Atq80OaFAz5SIT/UDfp8MCul/AEsK+E3VJCYlh+RZs2WEdldd28cmi5hsoiy1jTA2YVFk0CcAqU0E6eLiWRAMk8yN0KD517/vXpqvs9E2ArwU2GXFM8kfl9y6BpchUoY75ntwdAKLzEpg1YrGOGBT+2UbnyHDJGHoS4ei3F/F5QbaAkwk2r7A580tKfPGeXhhRgU4AdKUX6bliU50QyMXPTIFFfBA17TwJQoD1Xdjx8G2yN/mmRCYmqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJQJu6iiSQubJdVRUTTp1qHr67Drvf76PVl7Uxn22lk=;
 b=HDIoHRIcFw7FGFoKKwVqKa0yUzC3mgCPUFJDARnlRfkiHL6qV41JGTf63Ya+g27OQn9fixnYgcg/Lz9OjY5CZ5h+zJi0v5/zk/tVSWItm8sTnomVNRMyW2Qhuy+hyrhX9A2CM4rbspQX9Cdcal/BwnlnbZwqSroMLhlEV+gk7TqGErL5TPzSfaWeeUHvFsWhw+T0UlY6QNrTr2sU77Mcwx3XYd8ztN1sPog1N8p0CaMZa8bQ17kkU7UeCwOWKyp6dpwPd5qGHJ/BmtQsDRyRee8r+59LHu+54TwR2unYlrkIl6ygWC+n54hLE7dRBmsU6mzlYutb39YJQOueDHeqmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <186b7264-1190-3df2-415d-f1ec73a7c03f@suse.com>
Date: Tue, 8 Feb 2022 10:52:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 09/13] vpci/header: emulate PCI_COMMAND register for
 guests
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-10-andr2000@gmail.com>
 <7df2379e-1c30-c362-3106-c7ef23af5c73@suse.com>
 <0ff2a524-9a65-861a-df87-cf3f682862d7@epam.com>
 <140e163c-87d0-2ae8-d57b-7ebc6757de9e@suse.com>
 <08d02313-349d-9ad4-926d-0d1419866363@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <08d02313-349d-9ad4-926d-0d1419866363@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0502CA0003.eurprd05.prod.outlook.com
 (2603:10a6:203:91::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e51a5a5f-f396-4770-f637-08d9eae8a9c2
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3606:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB360681FB3E989F2A2E39984FB32D9@AM6PR0402MB3606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6S7l8Fwuu00OstwFmEFiq7Ih5wg84BoA7/CB7R3kXmCShqw5EVeDTubA7uwTm8GtjaY6FdIPC8mGR3cibDeZm9qWK6V9Irlyg2BR3zqHExyHVRn5jEddZjh+KoGvyySQ0fz5SFSQq/kUuNYdedqUiTtumYPBXicHjOSG9w0loEUuEBqt/o/MSeSWVWQcSZ1sLbnIItn+pDkV4OeH5vATLTXoEnYHEr8tZEUo0vhcCZkKCaqyOvB+V/n/pjNR0Viqs6NsFGN/njFTaDIpAJWop3KN36lhU0Khr9CDAzD4tscn/dJeSATAC1anB39MMloK+fBP/rDzrNXYnWZxJ8lODs/ncsv6lUyENZ8D/1pmZ2bGe8BybDBH01qGfufeoyvXMkzmVd7gfZzxCNxyFTPoqf5X6UsXZkePJ3vr7AHm+HdeT+hEFhtPapv32P7gE1S+XR60Uvicxd9lI40+Dh9oWlwRrDvn0JF31MChECNrRrD6FS1W4gqEsk0ljlVWGDty+opz50C6Tt4MQCI/joxK7Hb5t2fRew5UnP/VguRWS4UZchHPLv1NHy36i42WIpGpYWLMM/CmfbDMhxA4Kw/s6MyQKPqWpPqkkSEYT09sPnNZO1wCCMtRrHAfoj8dy9wcTKdflPf58Kg18KACTcwGotThRnEJdbT9wYv87vEFu8DGRvZO/4gbl+xH7OLyPbg5r5E66tpP2kfSqjhUuBGTd/yPWIy4RY+C0/Dn2tkR90s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(38100700002)(5660300002)(6506007)(2616005)(53546011)(6512007)(7416002)(4326008)(66946007)(36756003)(8936002)(54906003)(2906002)(8676002)(26005)(186003)(6486002)(508600001)(6916009)(31696002)(31686004)(86362001)(316002)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEM5eVp1bVg1T09icFR3TmxMTmE2dzN0YVFBT1pyNDBNd2xrVG90cElodjIx?=
 =?utf-8?B?Sk1LeTJuSmR5SzJ2cmRNTlIzM1A2WVErMXp2RkV6M1Z2REdKSFhFZG9WZFox?=
 =?utf-8?B?OWgrc3pXZmNGOERqNm1CWlA4WURvMDBWTnUyb0pVR0RlYVBUNlRHMDliRjkv?=
 =?utf-8?B?L3c3OHpaTmpQZzh0aUxvQU5haDlWTWp4TXRKd1A0cDRmZ1FTaExmMHpIWjFr?=
 =?utf-8?B?S243N1pIT3ZOSTVJbCsrOFc4TWgvNnNnSDhSVlJwb1pjNW0wT0V4L3FwOGVE?=
 =?utf-8?B?Y1BjWWJSb3l1b2dqbkxNNHgvY092TmRhWklqS3ViYnh5YXJWdnpub3BRTm9Y?=
 =?utf-8?B?Z0wvSTAvSzNma2cvNHkzcy9vbm90ZlkrSC8yeVZnRFFyOGk4TGtKRThHL1lB?=
 =?utf-8?B?VWtLTlJEa0xueW1vd3NaYWM4QWVsVlJ2SG1sRnY4UXd4ejBmR0VxZ3NkdWpH?=
 =?utf-8?B?UFNJMkxnamRlSnhxY2lvaTVGVnpoSk9UQnEzc29BUXZIRm9pdTN2NnUwNVhT?=
 =?utf-8?B?NVJVRFczSVg4QlV4TEo1TTNhTVRxVzBYTlNRT3gydllESUdWNEkxZDR2WDRw?=
 =?utf-8?B?MW5NMkUxOWlDTGxueVpnMUdOQWxPWTVWUTVVVVZDQ29JWWU0VXUwWU1xQzFl?=
 =?utf-8?B?Q0NUYnh1aStlN1U0bW5wR2d1S01NZzFZcTZPN2FUYzFzMVRkN1JOSldoRDU3?=
 =?utf-8?B?QUZkSXkrTTBwS3Vsek5aeTVDN0EydHBSU1duNDNSTHMyMjVLTmFGaG51Q2N0?=
 =?utf-8?B?WnVYWEhGdlVlWFBtNkxWeUI2cC92aEEyUi9oa3FCQ0FKTDVPeU1ZdUozenhK?=
 =?utf-8?B?bHNoZEowbDZyNnFTWURBTTFvZ01ndG5aN2tXb2hSRWpwajY2anUwYmV1UjJC?=
 =?utf-8?B?SjhhT0V0TmtJS001emlCeDJvcFYwUUFZT2k1eDdFMEwrdVhlYW8ydlNNbGEx?=
 =?utf-8?B?OFJaZGU2Ny9XU1ZYMWh0dVVrVFNJMDlPRG1WYmdXZjNlR2c3d3duWVRWL01u?=
 =?utf-8?B?YVZrR2JYRlN3U09tK0JUbGwvMEdzbTNNMW0xVi81NENQVHJMOTh2YjV0NERh?=
 =?utf-8?B?RWs0ZkYzQTdicDFmR2REN3pUTkpQRGh5YktFcEpoaFZ6VGI5aXFuVFhqUkpw?=
 =?utf-8?B?c0V3d2NXUnAzVjgvTGNSRVhuMFlMeGRlTjcwam9QU2N2QU9SWXlHOThtenpl?=
 =?utf-8?B?VGZmc2VHRWFqQjJYV2t4bkJPc1p1bEQ2Q3FRMmVsOGVtaUhQUGczOEREa29E?=
 =?utf-8?B?OG56dFdhZVJoLzdFYjZic0E4cFNyeGxjWXM0eSt5eXM4d0NkUDJpQkZ6Skdj?=
 =?utf-8?B?S2cvZzFoWHU3NDlsRW93ckEydGNINENaVFQvNFRqQi9VUS9MdFQ2OXJiY2VH?=
 =?utf-8?B?dW5lbXJzT2VsRFBDeU9RVkN0SmgwWDFZNTNWUkM0RWhNc2NLZWFyNkxmTlFK?=
 =?utf-8?B?ZmhFYXFkcEZ3ek1pZEloVXdBQ09YeUVSMTZqREZISkY5U2Y3Ty9uaXo3b1Iz?=
 =?utf-8?B?MDFDU2w2TGUwOXNNemVBdDNtWGZGSHczdGt6MmhlU3hlZVVLOEp3empIeWx1?=
 =?utf-8?B?QVhzNndDTW92ZlZKUmRyUUt2dWxKajV2bzhmRXpTRlltN0M4dm9rcnVSYXpO?=
 =?utf-8?B?QkNncW9seVFYVS9nTWo4SDhMVngra3NBOHlYNkdJQittbzlNeVlBdTZxSE1o?=
 =?utf-8?B?dWtMZDdHb1VXb29rWE9Mb2VmNHlFTXFQUCtrRG5QRGE0bE9tN3JBV2M3OCtE?=
 =?utf-8?B?aFZIcmNldEZkTjQwbmIxdElBU2lYNmNrcDZNK2RUc1RqZVNuQWdVVUl5THlV?=
 =?utf-8?B?anJSV0sxdHlqOG11NU5OWXhZWlhjaUxWSERrTSs5M2EzSHNnUGdmai9WMi9N?=
 =?utf-8?B?N0NUclJKZjZKanEwMU9tb09LbmFVVng0cW45VHhrcHJqTE0xbnRCNHEzUnhw?=
 =?utf-8?B?L0t6Mm1EdnB2bVFHcEVBN0tXMGJjRDZYVERaZEZtaGRCQlliWXhLU2pzVHQ3?=
 =?utf-8?B?OVhQaTlHNk93RFBkMWxpUnZIZW5RZTIybHJmcVdhSVZBYzh4SnRBWDc3K2xo?=
 =?utf-8?B?enZVSEdEYnhma2lHK3FtQnp6YUk4bkY2YzNrNHRKUU15WnRxbEx3d3JQMURR?=
 =?utf-8?B?dUtqLzN1ZCtJa2gzVTNqblRLaU9DZWdjRlhONUswRXRyWGNiTm5BMldGdkQy?=
 =?utf-8?Q?MwhmLfjnA9QP9fAwrU9Zoxg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e51a5a5f-f396-4770-f637-08d9eae8a9c2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 09:52:05.2480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rnnx2XmNJCOWai2b0V1mWI/YxbUraKDCieaRBr1fi7Lgrm2tgJlEL4Ghep+f9yhNbENT7FAhbEdBmGS2Jvg1Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3606

On 08.02.2022 10:38, Oleksandr Andrushchenko wrote:
> 
> 
> On 08.02.22 11:33, Jan Beulich wrote:
>> On 08.02.2022 09:13, Oleksandr Andrushchenko wrote:
>>> On 04.02.22 16:25, Jan Beulich wrote:
>>>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
>>>>> --- a/xen/drivers/vpci/header.c
>>>>> +++ b/xen/drivers/vpci/header.c
>>>>> @@ -454,6 +454,22 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
>>>>>            pci_conf_write16(pdev->sbdf, reg, cmd);
>>>>>    }
>>>>>    
>>>>> +static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
>>>>> +                            uint32_t cmd, void *data)
>>>>> +{
>>>>> +    /* TODO: Add proper emulation for all bits of the command register. */
>>>>> +
>>>>> +#ifdef CONFIG_HAS_PCI_MSI
>>>>> +    if ( pdev->vpci->msi->enabled || pdev->vpci->msix->enabled )
>>>>> +    {
>>>>> +        /* Guest wants to enable INTx. It can't be enabled if MSI/MSI-X enabled. */
>>>>> +        cmd |= PCI_COMMAND_INTX_DISABLE;
>>>>> +    }
>>>>> +#endif
>>>>> +
>>>>> +    cmd_write(pdev, reg, cmd, data);
>>>>> +}
>>>> It's not really clear to me whether the TODO warrants this being a
>>>> separate function. Personally I'd find it preferable if the logic
>>>> was folded into cmd_write().
>>> Not sure cmd_write needs to have guest's logic. And what's the
>>> profit? Later on, when we decide how PCI_COMMAND can be emulated
>>> this code will live in guest_cmd_write anyways
>> Why "will"? There's nothing conceptually wrong with putting all the
>> emulation logic into cmd_write(), inside an if(!hwdom) conditional.
>> If and when we gain CET-IBT support on the x86 side (and I'm told
>> there's an Arm equivalent of this), then to make this as useful as
>> possible it is going to be desirable to limit the number of functions
>> called through function pointers. You may have seen Andrew's huge
>> "x86: Support for CET Indirect Branch Tracking" series. We want to
>> keep down the number of such annotations; the vast part of the series
>> is about adding of such.
> Well, while I see nothing bad with that, from the code organization
> it would look a bit strange: we don't differentiate hwdom in vpci
> handlers, but instead provide one for hwdom and one for guests.
> While I understand your concern I still think that at the moment
> it will be more in line with the existing code if we provide a dedicated
> handler.

The existing code only deals with Dom0, and hence doesn't have any
pairs of handlers. FTAOD what I said above applies equally to other
separate guest read/write handlers you may be introducing. The
exception being when e.g. a hardware access handler is put in place
for Dom0 (for obvious reasons, I think).

Jan


