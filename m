Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EB3456EED
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 13:37:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227840.394165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo38w-00070k-1G; Fri, 19 Nov 2021 12:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227840.394165; Fri, 19 Nov 2021 12:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo38v-0006yF-UE; Fri, 19 Nov 2021 12:37:25 +0000
Received: by outflank-mailman (input) for mailman id 227840;
 Fri, 19 Nov 2021 12:37:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mo38u-0006y7-4K
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 12:37:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70f601cc-4935-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 13:37:22 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-XhuVAolIPF6forP2NIyvTA-1; Fri, 19 Nov 2021 13:37:20 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2704.eurprd04.prod.outlook.com (2603:10a6:800:b5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 12:37:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 12:37:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.10 via Frontend Transport; Fri, 19 Nov 2021 12:37:17 +0000
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
X-Inumbo-ID: 70f601cc-4935-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637325442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BXC1/GC/jA/j0M97kfJdHFpgJgEnLQOwgy1CPCLmSMQ=;
	b=OtgwN/1JjHXjvfhfumO3YvatZ9y2kxlX7eLI221VMy0GHbAv3qYYXJ8JccvttwyTiiSehQ
	Q2XRZxp47pL0fnMfImAsJ69U7gicBnfrdZM7y+BqZO2JO7X6lQV5i5LvEtPke+Tmt+HEYf
	jY4wfApTza9KLr/ETh1CeDvXGg+9TYs=
X-MC-Unique: XhuVAolIPF6forP2NIyvTA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZ0eCTCZuOX+NFkPudbpSkzdJ/nJCAzNThDKEQnJAiUeDaFnMPSOdFEKPMrFlEx3fnjsucLE/PnAWt8lGV7jA9P73jW6w6Td2vJ6Ktx/DWSfcDWD2n53eQEPFoHdLqyhK+pCIGCwccdr9bSxBay3TfpifF3XYd63sFhoFwU1MXrdw4vASf+VWD+TONgn4eOTaab1ZX+CeIxVDtmS4DopviQO45dwsEeuNRssQlOFtzMr3b89H0q6sMA13KU2AXcnjR6g3xxW/wmFbGQQ+UCuR6hm2kYmLeUKk7W7JbveAxZexEmKG+c8Feb76CwNvkHUL0127mFeBjfLt7uIHcsUpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXC1/GC/jA/j0M97kfJdHFpgJgEnLQOwgy1CPCLmSMQ=;
 b=HBFxbd2sguaZm6NCY4Oz41gRwQFG6ZM4Ex7hixBJrYtR0KLUPLm6fXCo+x1z4dOTWtjaR01g8NeKzOqifmpw0j8LfEQHBuh6Q2IHiALu48BS5x35mpWfmq0vhcEHGhJ4SsKYU/VBLlhznlgywaWYFLnp/eeXiaVFqDvGI47HOzp4sz9QVkW+3jSKRvb6jP3K9cEuqz75gqL891itS/JPr3iUyhbf7hLctBJYyByZQShRcBpoxK020UMFZnLXwt8xWK7j1l+E7u3A2qn2zNItjUgBI3h2O1XJbNsOR4lqoTsQcK28LP45CydOIB7pKP7hME3A76oc4/WtXfkFeZwcNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <44a22c22-62aa-d04f-cc43-d7a64cedbe15@suse.com>
Date: Fri, 19 Nov 2021 13:37:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 05/11] vpci/header: implement guest BAR register
 handlers
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-6-andr2000@gmail.com>
 <6aa1a947-cfc8-ec05-e5a5-151d36fc432c@suse.com>
 <713a0443-b2a4-3c29-7072-ba18970fe6f9@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <713a0443-b2a4-3c29-7072-ba18970fe6f9@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5103f2ff-549c-4d56-3aea-08d9ab59532e
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2704:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2704971F8E0CFFA32F821EB8B39C9@VI1PR0402MB2704.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J5CXhMZJWIsoGDyf/vMAly6bmJ2qn8Pr7R+45DCMi2dOrLTguTTd/R+wR7aCLbIbSi0aILhhKehxopMz4vg0cJxdJTJORW/1VXf6GCAHQwlIX36t+gsA3Jeb/71e2O49V1e2YeuOzG8l5KjeeMa5/vhDf4zNsqER1qK7GA7E2QFIZEv2AeoXwolpOdggXiQSczqEvPY/qUpDPVPMfG7Sl60bgiXiuyu3zSIsV4MV5UEGQA3OXQXuN7ZxMoa9ABXee8i/ptnKT3MAhJW3IXRRN4eKtmvxHbSV60OV7M8oUleUftD4Vm25x1PjQsTWhsMORS9xa7qDtsjrGJcTH5H4z4ssbLKHwZv10VYKOvG3Beygxtw6OCVbDLYgz2HJ8CQr9PxHS29YzorkTYbCSRyEwr0RyLRyKz+XkJcWtnoicfYo+n157PSYSq+5zsLAqjogKtALqA5YDDkzBlB1mPI3kCBDv7D1zJlAuSYJW8QD9wdUFqtZJ5hCNu1MCF1yu0AA76/ly+GziV2EITVjdpBXsZfNEtCaNYiJMdsJ2d/1Cqx2z7NoCZY9c/u9iy9DMu9BPtWL1iTH0AjW86sEJeQmEjEteYWVwxPiRUGaJoq8HgNh1+teDImmIJEEhq6iX4Al3hH07QfHLLztpa+ED+Hzxy0tILFBtpleo+lTgZ4PA9Yei/bKX3FSJMh/VrnlJOXQUmkOZ+l+2MFulEs5xJt7JNmwGJECF2PafJQDD1vYa5EW/+qODWgNxFon+SfxTEWM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(956004)(4326008)(5660300002)(86362001)(54906003)(6916009)(316002)(7416002)(66946007)(16576012)(26005)(186003)(8936002)(6486002)(2906002)(31696002)(38100700002)(36756003)(66476007)(66556008)(8676002)(508600001)(53546011)(31686004)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmVtbTZ6cXdTVnFDYnQrSGRWWS95cEdVbDJDcHY4d08xaVc1c21UZGkvZHNV?=
 =?utf-8?B?d2dkYlA2cTVaYXg4LzF5ZHFiOGpqWHgvUDluZW5vc3NpUVY4OVp3UWF1dHpu?=
 =?utf-8?B?R28vbllNc2xwTXhYdGtXd0hSakljVlI4SWVIZzRrR1Vqd2l4dUd3YjVMWU9w?=
 =?utf-8?B?bk5sYVE0eEtSYWs4dzBuanVKQkhzUVdLQWVxT3Y1UVVYcHUzdGE3elZ5b0Jv?=
 =?utf-8?B?MzZzSUViQmY4eGkvZS8zVUpqd2hMWm11SFFoYjQzQjFseEVSNkIvK3pLOHlo?=
 =?utf-8?B?L3daWFpzL2gycFU3eGNSSjR5RWMwNktUd3JzeVl0d0Z0aW8vdGVyTHNpQyt6?=
 =?utf-8?B?OFMxWHIxNFppZUs2VGZSSHlpeWdiR0VQZzh0bmVQQ1MrWGhoTkMxck81bW11?=
 =?utf-8?B?eVgvMTlISkR0NzFDaUFhL3hTMFAzTzBsMkU2VmVGTHg4L3E2cDREZlkxays4?=
 =?utf-8?B?enppRUEyYlltSk9yb1Nxem1pRmhlT1JsandISkpHdVhFT3RDN08wSFhIZytN?=
 =?utf-8?B?TkVXRWFyZGw4Y1VyZDFqbUpLVytxNm5OeVA0UDhWM1Fodk90T3paUG1hRkNB?=
 =?utf-8?B?a1BCS3daQ01WQXlHS21XYjNGV2N6UjBUTjQ5VVcxcldGMjN5am15bTgydkx0?=
 =?utf-8?B?VXFIQVFaWEpKamRFTVM2N0ZiVXJHSGZFNUJ5a1ZhMlBBQ2c3SlRpZk5TK3Fx?=
 =?utf-8?B?dDRlMUlhRkVpYmRXQ1d1MFpyRWxLZCs3QnZ2MHBMU2pKZ29yZ3REcFNIWGtP?=
 =?utf-8?B?aTYrMWdSZWR6cU90d1VhdUg4YlZhMFhObUFCRGdRVWtqQVVtNUpkQnVpN1hu?=
 =?utf-8?B?RHpYVnVpd2xKVzQ1Mml1Q1QyaGJoT0N5SHAxbWtkUWVwaWoxSDMvZnNiLzVU?=
 =?utf-8?B?MEJLbS9nNS9iMmxJZk5kVDN4OVAxZld4QUVVeHhEZnpPY0tNb1FNa0U1ajVS?=
 =?utf-8?B?SnFtNUxQb1oyeDJsd3ZOWlNSV3gzYmpXUFZvemd5TmVmaHNRMXg2NVd6K2Vh?=
 =?utf-8?B?b1NrYlNOMFcrSThIUFdpTk5LdmRFMzNiU1pIaUt5clltRE9uOThITHI5S0RZ?=
 =?utf-8?B?UjdzMStVTVdtRHB3dHR0MC9TZlluM0l2K1NFNFhmRHkrY3c0ejlsOW5uTVVQ?=
 =?utf-8?B?am1rTU11cU1VY1EzR1JEa2JvT1VGaHMvbTJnRmNqUlpveXdIRnUxOHh2T2Rv?=
 =?utf-8?B?bC9YdmorRVEvQUJRWjNZNHh2M0JxS3ZJTXZGQldYN1kxamlhSEp0aTYvVDI1?=
 =?utf-8?B?NE05OVZIVGZzQjNPRFJHMmdKbW9KU3ptVWNQYStUMUpzSXVGYnRZaWw3VldC?=
 =?utf-8?B?eXBtTjhrNWQzR0NWZGhOZWcvUGsxWlZlWCtaUUh0NDk3c0JvSjdJbE5zNGly?=
 =?utf-8?B?NldzZVFoaEtqMXNoZ3ZJTEF6UmNvYnFWNkVGa044RklVWjBuUGJPUk1DSFZX?=
 =?utf-8?B?a0lRTGZ2QzZVdHliWWJmU0JVWFBYL3h0SlJHdHhJamEzbGRXSWZVVXN1TGFZ?=
 =?utf-8?B?STBabHordVNySklxZ2tzbEZVbisreU5UdHlFeHdGc3YzNC92UTlaeUNIVWpI?=
 =?utf-8?B?US84NzZRL2RmanMxOXd5a3l2eXc4ZnMwVm1SU0FRRHJidW11dnZaVjV5MmJl?=
 =?utf-8?B?UVFnMWdaWEpYZ2N3V3d4OHVnQUFRa1h2WEc4QTBHSTNNRUxCMFY5L2h1Zi9r?=
 =?utf-8?B?WldPencyaVNkSytaUVM0Q3ZlSTl5MlprRithSU4xSEhpQXh1SDloT3B2VFFQ?=
 =?utf-8?B?a0w2bWFhd2hrRm1KOFdLS0FXSy9CbktpNWxleHk2RGJ6YXhwd1V3WlVtaDA3?=
 =?utf-8?B?Q3ovUnE3amtsOVlkMng5N0ljWFEvYWpDV2N0UDh5UEdkbURMVjhiR01uOVUy?=
 =?utf-8?B?SFhYUXZHWlhvWnJVdGs3MmFhRHo3bjI5Y2twV1ZiMHZBTzg1RHkxWjNjbkt3?=
 =?utf-8?B?VjBoWjRUbENIYkpqaUFLc1VwN0NScHFFNi9KaUIxUWdJektENEdTNEFIMURs?=
 =?utf-8?B?M1QvMDE5T0tobUxJZ0dTSFgvRWJ1c2ZraUtCQnkvT0VQdUtFQU91NU5FZU1v?=
 =?utf-8?B?RFR5M09GeE9zV1FVNVVPbTJJd0ZQVkRjamtDaTlZUFNWdmZjcDZHenptSWxD?=
 =?utf-8?B?V25kTkpMU0RBVnloMHNjWGE1a1hZTkNiSCtDTUg5czBCekgzVHc1VERBWmZM?=
 =?utf-8?Q?8LIGOMYUYwvsNF4/Ga3Koo8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5103f2ff-549c-4d56-3aea-08d9ab59532e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 12:37:18.6792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: za421AeswuYTs8q3XDXd11MjgTl1uWJPkGoBBuAufknvwJHuNSS0mYPzD9F/2V1EL/yrik1BJdwOSZftIY0jBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2704

On 19.11.2021 13:10, Oleksandr Andrushchenko wrote:
> On 19.11.21 13:58, Jan Beulich wrote:
>> On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> Add relevant vpci register handlers when assigning PCI device to a domain
>>> and remove those when de-assigning. This allows having different
>>> handlers for different domains, e.g. hwdom and other guests.
>>>
>>> Emulate guest BAR register values: this allows creating a guest view
>>> of the registers and emulates size and properties probe as it is done
>>> during PCI device enumeration by the guest.
>>>
>>> ROM BAR is only handled for the hardware domain and for guest domains
>>> there is a stub: at the moment PCI expansion ROM is x86 only, so it
>>> might not be used by other architectures without emulating x86. Other
>>> use-cases may include using that expansion ROM before Xen boots, hence
>>> no emulation is needed in Xen itself. Or when a guest wants to use the
>>> ROM code which seems to be rare.
>> At least in the initial days of EFI there was the concept of EFI byte
>> code, for ROM code to be compiled to such that it would be arch-
>> independent. While I don't mean this to be an argument against leaving
>> out ROM BAR handling for now, this may want mentioning here to avoid
>> giving the impression that it's only x86 which might be affected by
>> this deliberate omission.
> I can put:
> at the moment PCI expansion ROM handling is supported for x86 only
> and it might not be used by other architectures without emulating x86.

Sounds at least somewhat better to me.

>>> --- a/xen/drivers/vpci/header.c
>>> +++ b/xen/drivers/vpci/header.c
>>> @@ -408,6 +408,48 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
>>>       pci_conf_write32(pdev->sbdf, reg, val);
>>>   }
>>>   
>>> +static void guest_bar_write(const struct pci_dev *pdev, unsigned int reg,
>>> +                            uint32_t val, void *data)
>>> +{
>>> +    struct vpci_bar *bar = data;
>>> +    bool hi = false;
>>> +
>>> +    if ( bar->type == VPCI_BAR_MEM64_HI )
>>> +    {
>>> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
>>> +        bar--;
>>> +        hi = true;
>>> +    }
>>> +    else
>>> +    {
>>> +        val &= PCI_BASE_ADDRESS_MEM_MASK;
>>> +        val |= bar->type == VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TYPE_32
>>> +                                           : PCI_BASE_ADDRESS_MEM_TYPE_64;
>>> +        val |= bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
>>> +    }
>>> +
>>> +    bar->guest_addr &= ~(0xffffffffull << (hi ? 32 : 0));
>>> +    bar->guest_addr |= (uint64_t)val << (hi ? 32 : 0);
>>> +
>>> +    bar->guest_addr &= ~(bar->size - 1) | ~PCI_BASE_ADDRESS_MEM_MASK;
>>> +}
>>> +
>>> +static uint32_t guest_bar_read(const struct pci_dev *pdev, unsigned int reg,
>>> +                               void *data)
>>> +{
>>> +    const struct vpci_bar *bar = data;
>>> +    bool hi = false;
>>> +
>>> +    if ( bar->type == VPCI_BAR_MEM64_HI )
>>> +    {
>>> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
>>> +        bar--;
>>> +        hi = true;
>>> +    }
>>> +
>>> +    return bar->guest_addr >> (hi ? 32 : 0);
>> I'm afraid "guest_addr" then isn't the best name; maybe "guest_val"?
>> This would make more obvious that there is a meaningful difference
>> from "addr" besides the guest vs host aspect.
> I am not sure I can agree here:
> bar->addr and bar->guest_addr make it clear what are these while
> bar->addr and bar->guest_val would make someone go look for
> additional information about what that val is for.

Feel free to replace "val" with something more suitable. "guest_bar"
maybe? The value definitely is not an address, so "addr" seems
inappropriate / misleading to me.

Jan


