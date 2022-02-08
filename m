Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5474B4AD527
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 10:44:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267887.461646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHN2i-0000zQ-LS; Tue, 08 Feb 2022 09:44:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267887.461646; Tue, 08 Feb 2022 09:44:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHN2i-0000x2-IL; Tue, 08 Feb 2022 09:44:12 +0000
Received: by outflank-mailman (input) for mailman id 267887;
 Tue, 08 Feb 2022 09:44:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHN2h-0000ww-WF
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 09:44:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aab15d2f-88c3-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 10:44:10 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-S5V92VZvNz-etqdOKCtHrQ-1; Tue, 08 Feb 2022 10:44:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5248.eurprd04.prod.outlook.com (2603:10a6:803:62::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 09:44:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Tue, 8 Feb 2022
 09:44:03 +0000
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
X-Inumbo-ID: aab15d2f-88c3-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644313450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x/PlDEaxR5PgelK5Hd/vp2HCNr0PMnCJSrPU49yxrmk=;
	b=UcVVHyeatI+KchZZWwLDQjnmJGMIyAZwysDmFrmHK6IW5Mx6SSfgbSpROVQtjwQKVwG0+t
	npdSdrzsSqoLLroDTGcZnmZVvyymJRLvFGJNTUm/83+8/B158OfcCxT08EurqLdPoyPw2H
	vpVU0G0KGAvkZM2KG7VcWyXzranzIG8=
X-MC-Unique: S5V92VZvNz-etqdOKCtHrQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naN2hLllGouNeZZv1GAg1sXTbIxtXXxGPrBHs6O9hXamkPVX2d8KVAMhV/SsfmeD+UBH8uWRprHB7mj+roiJXGQKTjL/Tbc9Qmgh5+uJGVLnqQK0CwEEh/ttEy70TAoa8JVyi6NorNUxK9M4EE+SGtVp2AFvfroRgmSHomGCsqr/4lCPDnaP9hwQeHI+cNarWtdYWRhSXnrwi7TCHpZ5v1Gxx6nnDB2vBJeodV77ZFVvPoKSjzv9qSCQzEQ1M0Hs27DPEo8c+ki/SeiLRteNhXFiDQFEsrzzla9hdX9FWKhGfOJDvPEXC9eWYC7SiSwb0tg+Tq0l0ayRev13QGyMGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/PlDEaxR5PgelK5Hd/vp2HCNr0PMnCJSrPU49yxrmk=;
 b=cHpBau9iDK3F79CbtsVwdFnp3trR3CFNJWM7jZEayTdyKD7JD0xwQ3dWECqXWlx//r8CyWvc5p9c0a2SBYG4LIb0vhyS1f/AYwi+UKA5mDRHzQD1HXdqyo0pDxglGUiuLqRFZJMiFUKOzW6cxUTTAO45DADm31fgI2tjvOIa9hbYHGNmOo/jnz1BF47awdeevs6hNTJpYG0M2TJgy746DXQHCr5AUiIzcl27Twi4I9MXccnj09QP4l4YZOey9qfZNlH0dhFaT6eGKffpaOvR8DVkBTxLsBJrddsqClv5M2jrrAsOtmiIkBS2MYOq7yFLBDNs/Z/BR5bgQaFPQzIfZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0fd8a0ac-dc91-287e-536e-1684892837ab@suse.com>
Date: Tue, 8 Feb 2022 10:44:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 05/13] vpci: add hooks for PCI device assign/de-assign
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
 <20220204063459.680961-6-andr2000@gmail.com>
 <16cea1df-3d0f-d404-2b88-aab47ad5548b@suse.com>
 <3fe6dbe3-51c6-f87f-23f9-cf2e1a924326@epam.com>
 <582ee8f9-7b01-4adc-6a8a-ce8b1dffd534@suse.com>
 <e225553b-b29c-0448-fb9f-f8b513d9f77d@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e225553b-b29c-0448-fb9f-f8b513d9f77d@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0033.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::46) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0e2c1ee-790d-4851-f1c8-08d9eae78a61
X-MS-TrafficTypeDiagnostic: VI1PR04MB5248:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5248E7624C98DA8CD6281C0DB32D9@VI1PR04MB5248.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0ycxx6Qxl9ExWrUl/W0jV7etMAxt7kvAhHNpOIq/KVqvq+x+5SLmJaBafekwVhaQX1uG2KlchNCR/PPcW5y+NMk/5bjcFlaVDkTiB99H1nCBbPyw5f2MzGwW25PDt01XkmSkmvDKuTkepOlHViYnqvp5S9+oxoPEJzOxbSsZ48wWTWlwfTCxt3DCVqJMJbxtBxG7yAYAwHJLS3boTKnj7TpkzZmtJ39jXDZBiVoOVN+K2xOI8pSqtdow5+h4ksRD8hQYQomx19q8WbNjbOVoE9iPiX7NfEGvSljwLPM+Kx3xoiRoW7Vwk9AjsVXFCzahDdQk3d2LRxJ7itcHGgcyUvXQv83TYSIq361kZ6UCMVamUaq2plWCmRtXSWsA6Zat2wytUJmqS5cmXlZF/1AvoGU843/LJpQam45sOwzE1y7FoZF78aRewWH8MCB99hi3RxyjcMmxS9M8G4A4LZd88a4/hQzjKjbtifgDqcDaBcMO6cgjGVsEgzTFHCiSP3u0EnIYCd1e2TWPwR8TaQNBQN05kfsDNjdwmP7AbzafEaqQ/D42f53wcmBfj6N2mjxwLiMZXZBAFGj4I3M/LGm7pZsZhCQNHHoKkM/nogIO/6JTBnr4lOLLbFQ0YdpdmRIiZ7w2qqrDGtI4wVyqrlNWDVdt+CViehARE68gRuUhdItECMNZkYivLGFwP1SVM2oxOBT4HmUkIhJi35CystXgmeD9X7lNEf2n31azmsDMtBg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(6512007)(8936002)(4326008)(66556008)(66476007)(38100700002)(66946007)(86362001)(31696002)(316002)(53546011)(508600001)(6486002)(6916009)(54906003)(6506007)(186003)(31686004)(2906002)(36756003)(2616005)(26005)(7416002)(83380400001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0V0VVhxKzc0Mmk2RXV5eW9rcm5hMnNnc3pFeGpWUlZ5WTBrNWhON2NWMEMx?=
 =?utf-8?B?Mm5XUGF4bnRUUlZkTDZySkVLbUU1Q0ZCSC9mc25zTnBOblM2SWN3eXRreTVv?=
 =?utf-8?B?MnU2cUtubk1rM0o1QmZvSHkxeGpXR04xb05WSVAyYXYxa1VvSzhKQkdEdmdZ?=
 =?utf-8?B?U3B0WVZxZFRXSllyUnZOOVZLVFlMMll2MWM2dWpLeS9Sa3BFK2M2dnFXaDJs?=
 =?utf-8?B?NHVDTkVsQUNNMnk2UWJlQ3V5VS9hckkyRjRSTjh5aU1Senh1Sy9QbG5rOW5y?=
 =?utf-8?B?d2ZQSUNTMTBqRlJ3REpDVXovZks3dmx2T1B2NnRVR2s3QWV0bXFVTFRNamtN?=
 =?utf-8?B?RXhNOWo3OXhUVmVna2lITE1nL2c0UElMZ1FSYWRBTDRIcEJ1WVhRK091VGtC?=
 =?utf-8?B?TVVJNXhNY3RJaU5GNFYxOXpKTDdpYkxadGtYcFcweno4Wm5BN2hNaXBLUy9X?=
 =?utf-8?B?ajBNbXNNM3dxRWN1NjA3cjdGaWtpWTFDN2pKSjBFSjk4MWM5VXBMUGlibTlI?=
 =?utf-8?B?RFZvYkdmMnNvK21CQTBQcTVZZVoreUNvNkxUZW1iYzVpMFJwQXgydktRTUx6?=
 =?utf-8?B?QlhubmpJb054bmdHSzB3d0xxZmtJM2Yyd0lVY05KWEF0T0trT0JDRHJIczFN?=
 =?utf-8?B?cmRxcEZUVG01cnZpc3hXR21waUM4K0JRK1FLZW5kdlJNSGt3dzFiVGgzaXpm?=
 =?utf-8?B?dHgxckswam5EaXhKa1BQVFkzTzFQbXQ3bGZ3NlpsVHBkZTNxdjFwNDhLbCtl?=
 =?utf-8?B?dGQ5VjFxcHV0ZHpBcWwzN01pOHd6QjBWN0IranBmWm1NcS9wdFlxSzNXZFQy?=
 =?utf-8?B?MkVFaVFJRjd3SytJcktnMm5IRDEwVExrZkpxZ0hqOVdhL3ZYZU1lN2lCUTEz?=
 =?utf-8?B?WFF4clRRZEdNZCtmU1F3WFpDb0pRdEZVRGI1emIzaG54aktUeVF0MmN4dlIz?=
 =?utf-8?B?bmRid2w3RDFuT2JTa1MwT3NhSjZiTDBpL1poWC84Ymg2TmtGenplclBna3A1?=
 =?utf-8?B?N0ZiL1VUSnJERkN6dEFhMUl3REdOS1FXRGpFRHBTNEQ1YmVpV2V0UWh0dEJT?=
 =?utf-8?B?dXI5b0VBWDBRdm5iMUUzY1NsQXZodHNvWTR2M3JRcDRTa3BBWnFvWnpSUE1D?=
 =?utf-8?B?LytLVUxDaUM2UHdhQTg5REdkRks4clg5eXBOeFVPVWJ5ZDNJd0lRditlS2xW?=
 =?utf-8?B?YktCRW80SzJtUTV5SEc4eHZnVU5STlU5d1o1UHBuSkpOa0JvQ3Y3RFBJQ3Z3?=
 =?utf-8?B?QkR3VTVkWWFvMDFObTBjWlNPNjlaeUlrOXZRZG5EaXdmTnREeHgrZmFHTktY?=
 =?utf-8?B?dkN2TElROUtZcXJNR2VVK2RTYkhBQmhkc3hBa0ZsSEJzd3kyZEoyS0t0bHFN?=
 =?utf-8?B?c1RuT3lpNGhjSFNxTFRsd1BZZmM1QTBDbUlIS2VLdEJEYmVnMXVuMGUvZkxT?=
 =?utf-8?B?YXFsM3RwVlcxSWhEdVNaM2xqaVFvRmF1QTZtK1J5VytrOTJ5U1d3bVRJd05O?=
 =?utf-8?B?ek9naUpIdzU1SVRlditmUkxJV3dIeUZleWFhQVRQUnh2cFloUVlkWkFjVngy?=
 =?utf-8?B?eWhBeWxsTkphSmw1WHZISjh5dWJMYW92aFFjYktnMVJwcGxBcnhjTm5BK2FV?=
 =?utf-8?B?bHdKR0Q1ZnIyTDNaQlZrTS90QkdUZjYrRFBMeXNjY0paajZaVWhtNWVxUjVq?=
 =?utf-8?B?dVJHUUFrdE8wWU9hcUdaOHUxa1dZRkFkbkRnVHpsOXAzTmpvc0tDUjBvZ0hH?=
 =?utf-8?B?SkVSZDdUVkVueXdEeHdudGo5TWlzQUw2VWxVNStkN1ZDdUNnZC9nSStoenJ5?=
 =?utf-8?B?cGlCd2o0L3owRHl2ZGh3Wk9YTlFxNW1aUG1sZ2RxK1ovVkV5cERKUGtLM1Rp?=
 =?utf-8?B?ZVliVXpCSnJaS2QweU01c1hKZXk4Y296bzB0TFJncmlnZWpWTzNoSWlCQ0ho?=
 =?utf-8?B?YU16QUwvNFNPbkEwNFErS3hWTGlTeU5JUVVxTkEwODUxMW0ycnVGWTlzWGtX?=
 =?utf-8?B?UHpVNWtpQWoxQkZ4ZmZtOTNwdklFYWRYU2lZb2ZzQzFqRCtWTEo0SWVVMzRS?=
 =?utf-8?B?TkF0bEd5RVBER25wTytDaE9Zc3pPOG9EaDY0cUhObDdyMVJYNTdNR1BZc1VQ?=
 =?utf-8?B?cm9pdVUrRkNxN3d3VjZMYWg3ekhvd1VLMHppOEowRVF0dTNTNTljeCt2RDVL?=
 =?utf-8?Q?MWOlvCyuH0FAh6GzG0u7kgc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e2c1ee-790d-4851-f1c8-08d9eae78a61
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 09:44:03.1530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S9hV+h8u7seQpWzAYQmr2UxW1rQBW8H7yPMjJ2odARczMD17vr39BePktL5SZuFUlHdZnI/gXGciikX8wll6KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5248

On 08.02.2022 10:27, Oleksandr Andrushchenko wrote:
> On 08.02.22 11:13, Jan Beulich wrote:
>> On 08.02.2022 09:32, Oleksandr Andrushchenko wrote:
>>> On 07.02.22 18:28, Jan Beulich wrote:
>>>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
>>>>> @@ -1507,6 +1511,8 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>>>>>                            pci_to_dev(pdev), flag);
>>>>>        }
>>>>>    
>>>>> +    rc = vpci_assign_device(d, pdev);
>>>>> +
>>>>>     done:
>>>>>        if ( rc )
>>>>>            printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
>>>> There's no attempt to undo anything in the case of getting back an
>>>> error. ISTR this being deemed okay on the basis that the tool stack
>>>> would then take whatever action, but whatever it is that is supposed
>>>> to deal with errors here wants spelling out in the description.
>>> Why? I don't change the previously expected decision and implementation
>>> of the assign_device function: I use error paths as they were used before
>>> for the existing code. So, I see no clear reason to stress that the existing
>>> and new code relies on the toolstack
>> Saying half a sentence on this is helping review.
> Ok
>>
>>>> What's important is that no caller up the call tree may be left with
>>>> the impression that the device is still owned by the original
>>>> domain. With how you have it, the device is going to be owned by the
>>>> new domain, but not really usable.
>>> This is not true: vpci_assign_device will call vpci_deassign_device
>>> internally if it fails. So, the device won't be assigned in this case
>> No. The device is assigned to whatever pdev->domain holds. Calling
>> vpci_deassign_device() there merely makes sure that the device will
>> have _no_ vPCI data and hooks in place, rather than something
>> partial.
> So, this patch is only dealing with vpci assign/de-assign
> And it rolls back what it did in case of a failure
> It also returns rc in assign_device to signal it has failed
> What else is expected from this patch??

Until now if assign_device() returns an error, this tells the caller
that the device did not change ownership; in the worst case it either
only moved to the quarantine domain, or the new owner may have been
crashed. In no case is the device owned by an alive DomU. You're
changing this property, and hence you need to make clear/sure that
this isn't colliding with assumptions made elsewhere.

Jan


