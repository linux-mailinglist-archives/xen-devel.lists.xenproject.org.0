Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8AA456F47
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 14:03:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227887.394267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3Y3-0006aX-JG; Fri, 19 Nov 2021 13:03:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227887.394267; Fri, 19 Nov 2021 13:03:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3Y3-0006Xh-Fq; Fri, 19 Nov 2021 13:03:23 +0000
Received: by outflank-mailman (input) for mailman id 227887;
 Fri, 19 Nov 2021 13:03:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mo3Y2-0006XZ-GY
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 13:03:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12458b5d-4939-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 14:03:21 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2057.outbound.protection.outlook.com [104.47.10.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-jQdgwPY-Mai29UJ2B-EqKg-1; Fri, 19 Nov 2021 14:03:19 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3934.eurprd04.prod.outlook.com (2603:10a6:803:1b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 13:03:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 13:03:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0040.eurprd04.prod.outlook.com (2603:10a6:20b:312::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Fri, 19 Nov 2021 13:03:05 +0000
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
X-Inumbo-ID: 12458b5d-4939-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637327000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mJqToq/iNd+HZMgDfiCtkXGL5gv8m3ek/alQSIVUjzM=;
	b=lpUhLBSy/g2jX5yjcZLvjxD7Nh6eyRWcCSCpsh8bP1U3EiIcbfSpkBwKN8ZjqBD1577bf7
	RrayOUv5AfT8/58Di2dn2q1UjaajcucOTG1n1ANkPdvTmR0mA4nOK/BS1Qq0dpOda3S8Ue
	e4XeXD5+yF2OPCDKbb72hfAj4ZJhJEU=
X-MC-Unique: jQdgwPY-Mai29UJ2B-EqKg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cl04OCGd5Hxe2vnyZn6vrCpk07x8kMF+nSonVcZobvyxxuIidqGksuyI34T3+ugn/dNqisam8u8RBZxrZVmnMAT+8U2/luE7sR5OhRFGfcX8CmRqQDfxLgZOOP1uCkWbw9XdEz0oLdKDg1DnObNYjMhC/wGEn6JZdW+L7SxhgHLwKq0SxrCvAKYy3qgRwc2fST5fbGPo6UF+pr1FcjzUHodMyYaGaQke40s4ZhX1HGRprXVELXbEs7vX1YrT2wg01n1mzx0egT1I7gr7mWxjl0gY3IYzB/JNdO9B34n6tq6sCtdaqKYgd7xSpJv6crF48beAzkhnfBA31+Ozx4hSMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJqToq/iNd+HZMgDfiCtkXGL5gv8m3ek/alQSIVUjzM=;
 b=QWSgEfT8dx6d+0hIchGM3H8ygnnb4XT3wBiUdOn4CkdxOqJ3j8/kU4uWScOjtOLD6fmeUrUH+rGMaDuRFvuBDUzqO1LMAV9kaPY+D0hFH5KaL1ULrDkUcJP0dKuEmJaCvA7fyuGWDDvhBPTWA7CtIQLzo6s3ItAupoD2EeMJQtH+lF9ulQKXgRC/H57BqTWhMIzVPy4EzTd4H/SAUST2oC5K4XAvv+6Ja+7MsypTNWGRGA2IWyIxxIf8dcR6AMAU5d5GSJrq6X4mH11bmIfph/lIC+E8KL1wFbi6aL3ZE2Kd/M/bpjfkVrekrRQFUVtmH7s4TtfBMyb48//aebAvrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bab431c0-c4b4-09e4-cc3e-32ec8b3f5c7e@suse.com>
Date: Fri, 19 Nov 2021 14:02:57 +0100
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
 <44a22c22-62aa-d04f-cc43-d7a64cedbe15@suse.com>
 <6c61bd19-228a-fc12-eb64-00c8c5340292@epam.com>
 <ed2a6b5c-6e3a-07ca-a2f0-532a0de10329@suse.com>
 <c3b58e3c-9644-6e74-5ca1-25df33028b71@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c3b58e3c-9644-6e74-5ca1-25df33028b71@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0040.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab3c3571-908b-4134-2c8e-08d9ab5cf423
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3934:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3934C12C57010B19F6A24B18B39C9@VI1PR0402MB3934.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K1s3UmNQ2znhUcsGjnmBfvS49zdyzOO31HQ9bP15yvlS8Wce+ooX7JpS9L0HTWEnPUlWvPkxEGtO4TYvjK2Tz/Cf1Xg+E16suidjlK6E07/g5oyXcQ+LXMMjZcYeMKyEvO6axeXm5EsnJ8fjZ9jAKbRs7vcCW6MTy68/w2HYxDdNxxR1o4Ip3+TWY//HAUl6RNhXRuXqFq5N8KnHvH9HIr3cqAq7ImJLNsONDfAU3J2QLJOlEfmEigdu61jNPvihPgvc4RbnrXkddJaRcj5pFsBOzW2B+191yenxG2qRbe3QB0bU5G5AKavR2CkLByzxBDBw7de44oy/LjHyTQI6LbNwjJaLIUMOzHkrFmJkKQkaHFt/6YrpsUOrBVv64NmBDfGdaUYJCNeBpybZurFYcHiXYsB4gvdaa3+bByRMLtn6dXcJmSVlHO4Y+/7aumj7eMGAvsTyrS7Ysdq9wjDc+fdu0yi68VBjUrxdR6zvWGqGUPpLzSMXPsMxPAS4RttnOthZvgISidRyVtQWRpeJYcz8Ffm8T+dxogB7KSR5BW876UOAdz6EPtDpPwrLzB+J8P8UJqRYHmf5j0MTlsf0Gn9kSaGbtp7/aKY4ucvfLjMo+AGiPVElLlje2vbP66gPrUQWHJ5UqZseP7qwyx+nzKnXlTuu1pj6IjDZ9hHkqiSCOSVK+FYWQl1DJVSOhkE07Ct9w9qjPd5jvfPlHrgp8f6lyrJ4oRPtoB1Bv0A+IMs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(66946007)(36756003)(8676002)(316002)(508600001)(53546011)(31686004)(2616005)(26005)(956004)(16576012)(5660300002)(66476007)(86362001)(8936002)(2906002)(38100700002)(6666004)(66556008)(7416002)(6486002)(4326008)(31696002)(54906003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGpiMGJoTytOL2k2RWQxeC8vYmNGTngyNTJnRFVLd1o5d0xITHNKNlBnZFlJ?=
 =?utf-8?B?VFZVdmo0N3g2dFFWQytET0NSQS9lMHRBQ09IVzJ3Sk81MmFReFBCdUtYeWhK?=
 =?utf-8?B?enpRMzJHdkVkQlFNd3cxRU9KZHlUSXdFeFVCLzE3MWNhYk14SkZnelhIMmg5?=
 =?utf-8?B?SThMUGIwVWdUVEsvOWUxMWp6eW1UZ0hwY2RSMS84Vis5UFNwYzRxeW5SY1NH?=
 =?utf-8?B?VldzR3dmTmE1b01KR2phOUtwajBoSVFlNEtlTkU3TmtsR2YyaUFObG9CdTBW?=
 =?utf-8?B?bWp6cW1BSnZpV3p0RGJuN3QrMHNFcVJSYU02bWQ2ZXVBYTBpdzFSWlRocWM3?=
 =?utf-8?B?bC9UR0R4VjhxZHV4S1k3cExKdWZyQjZVWWFrZXpZUG0vRWJvaGtjM2s4aVdM?=
 =?utf-8?B?dnVQN2E3Y0pHRjlKVzUxTFFDNnNla3FsSnVGdEZOcW1YM3ZYS2VjeXBHWEs2?=
 =?utf-8?B?RS9zbHAxQ1liYzl1Unp0dmoyZlkvLzE1RTdaR3c0VWRhQ3NDS1VJOEdKL1VR?=
 =?utf-8?B?SHh4VjJtOHdiTnhKNXFTWmd6clhhYm9oL3ZEMXgvYlBLc2p0MTh5Z013UTF3?=
 =?utf-8?B?QVNIcHNCbmRINERaaEM1TVhEVlduOEwwV016ZzhwTXhpREVXMlQ4ZlAwOE1H?=
 =?utf-8?B?Vi9yWGFINm43ejMwTXkwWDVuZDFCYnhWWlFidjUxTW0wRGhZK3Fldk5OUzJG?=
 =?utf-8?B?c20rT003bEVtVTJGWjNWcEFLUEprOXFBQXA4cnBrTmtuM1c1Y0U0MTQzU0hs?=
 =?utf-8?B?QjVsb01QS0RUTnRCSWFvaGhGbFRxV0QxYlFRR2YrTDNSNHZZLzhBTTk0WFpB?=
 =?utf-8?B?S1UyMkkxZmRtcVFXZlBWM3NZa1liaE50R0FkMG16VTdDamdjby9GLzRhLzRN?=
 =?utf-8?B?Unk2ZlR1RklNZ3BCdnZFSjNBblE5NWZacHltRHRjVGxhcGc0VUlrT2VETGdP?=
 =?utf-8?B?YjhVejFSQlo1SzBCd0VWb1VraDRoU0JLdzJnWHludXF4OXVoYk5xbzJxa1Jv?=
 =?utf-8?B?bmthUkQrOGVxTHNKK29OQjUza3JQY0RWbkNGdjRmK1cxZ2NDMGZNcFQ3TkVC?=
 =?utf-8?B?N3pXTURCWVBFWUVkNVlCWTUxRnAxa0RNcHR4cUpkSmhac3dGQnFxSFZZMUtT?=
 =?utf-8?B?RVNGN3FoMTBaSW1QRmY4czJydkhRc3dWNXlsTHFORHMrdFhRL2dCYnl5L0Ix?=
 =?utf-8?B?V3FLV25WMC9BNU1QRlMyN0F3ZEluZDdKNGloUnI1eWVuL3d4WExCeU9NSWdP?=
 =?utf-8?B?M09XSXFRT2w4YUlEOWw3dTF6VVRnaWp3bkVOcis4cytBOFJSdURwV2FXVHM1?=
 =?utf-8?B?elRCVkJUanBHaG9hd0YwbVBsK1hLQTllb0hDWDFTelo2Z2FXcldNcXVwcUxZ?=
 =?utf-8?B?RmZQUENEdlBuTFdlSFMzaTZkYm5oRnM0N2dvU3UzRnBQYmRyNk9hdXZ4c0Ri?=
 =?utf-8?B?SlZQQjlSM2F5YzR5S1JMSVRqNUdNSEdCZEpXNVpINzd6d2toekpKb1Bhd0hZ?=
 =?utf-8?B?MzFyZWtZa0xMQ0tWcWIvRjYvdFVUaWcvankvZWNHdmUyR1hXV3h1VHZST00z?=
 =?utf-8?B?K1h4ajBQNEVVQXJMZ2FiSGRhcUFiblh4ZTV6dTJpbENrMSt0eGlhbUNIdkNN?=
 =?utf-8?B?b2JpdTJrTy9KYjI1WUJiWURFQ2lLZEhXa1lrK2s2bVBGQm9pUHo3ajhwbEFh?=
 =?utf-8?B?VFdEczdpc2ZNK2ZmTDY0OUNGUS9jQTF5SE4vWkk3aWl3UE01ZWtNd0xnUHpB?=
 =?utf-8?B?MWYrd3Y0NVVpSHlHRHdWSkk5MmlpVmJ2L2RhMEczakF4MmlzeXErSXk1elk1?=
 =?utf-8?B?cDFiVXpsemxleGNSMTZpS2xNdGo2ZmxTRDN6SERsOU1ycDRuRDdKazR2VW9D?=
 =?utf-8?B?N1oxem1nYUMwN1dQN1l0UDl3c2Jkdk9BdzNMVE0wbjcxVWNxRlNmUWwzektR?=
 =?utf-8?B?UzRFckZlaVJuVllIVTAxdEZudTJ5OXNYQ1JWTG53c1RkSlF3Z1Vxd1c3dzB2?=
 =?utf-8?B?cVZpZXpYeWFLZktaSEgzTkV5Q05hTUJXbmMxaUtqZ29HSDF1VVNlWXl3WWxJ?=
 =?utf-8?B?Q21WVkpKck5QaENVZlVCSFhFUmtkRzdwOVJNOGtXUExoaGt3VzE0dmdFRlZR?=
 =?utf-8?B?ZUx0a3BUWHlCMnN3WlIxUkZyYlFXR2kzL2xFMzZ5ZVVMYnpsL21tK3hocmR0?=
 =?utf-8?Q?JoVZoIPzU3CVKgORvgp/VA0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3c3571-908b-4134-2c8e-08d9ab5cf423
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 13:03:17.7828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYQC4rrBIsFMY8+KoB8fhLYDzPhdz9EKy+p5hWUwSI5CMLwU3zun3vMoZkwNnFbGmo+PhcltvHEFMVlLBvT8wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3934

On 19.11.2021 13:54, Oleksandr Andrushchenko wrote:
> On 19.11.21 14:49, Jan Beulich wrote:
>> On 19.11.2021 13:46, Oleksandr Andrushchenko wrote:
>>> On 19.11.21 14:37, Jan Beulich wrote:
>>>> On 19.11.2021 13:10, Oleksandr Andrushchenko wrote:
>>>>> On 19.11.21 13:58, Jan Beulich wrote:
>>>>>> On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
>>>>>>> --- a/xen/drivers/vpci/header.c
>>>>>>> +++ b/xen/drivers/vpci/header.c
>>>>>>> @@ -408,6 +408,48 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
>>>>>>>         pci_conf_write32(pdev->sbdf, reg, val);
>>>>>>>     }
>>>>>>>     
>>>>>>> +static void guest_bar_write(const struct pci_dev *pdev, unsigned int reg,
>>>>>>> +                            uint32_t val, void *data)
>>>>>>> +{
>>>>>>> +    struct vpci_bar *bar = data;
>>>>>>> +    bool hi = false;
>>>>>>> +
>>>>>>> +    if ( bar->type == VPCI_BAR_MEM64_HI )
>>>>>>> +    {
>>>>>>> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
>>>>>>> +        bar--;
>>>>>>> +        hi = true;
>>>>>>> +    }
>>>>>>> +    else
>>>>>>> +    {
>>>>>>> +        val &= PCI_BASE_ADDRESS_MEM_MASK;
>>>>>>> +        val |= bar->type == VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TYPE_32
>>>>>>> +                                           : PCI_BASE_ADDRESS_MEM_TYPE_64;
>>>>>>> +        val |= bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    bar->guest_addr &= ~(0xffffffffull << (hi ? 32 : 0));
>>>>>>> +    bar->guest_addr |= (uint64_t)val << (hi ? 32 : 0);
>>>>>>> +
>>>>>>> +    bar->guest_addr &= ~(bar->size - 1) | ~PCI_BASE_ADDRESS_MEM_MASK;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static uint32_t guest_bar_read(const struct pci_dev *pdev, unsigned int reg,
>>>>>>> +                               void *data)
>>>>>>> +{
>>>>>>> +    const struct vpci_bar *bar = data;
>>>>>>> +    bool hi = false;
>>>>>>> +
>>>>>>> +    if ( bar->type == VPCI_BAR_MEM64_HI )
>>>>>>> +    {
>>>>>>> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
>>>>>>> +        bar--;
>>>>>>> +        hi = true;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    return bar->guest_addr >> (hi ? 32 : 0);
>>>>>> I'm afraid "guest_addr" then isn't the best name; maybe "guest_val"?
>>>>>> This would make more obvious that there is a meaningful difference
>>>>>> from "addr" besides the guest vs host aspect.
>>>>> I am not sure I can agree here:
>>>>> bar->addr and bar->guest_addr make it clear what are these while
>>>>> bar->addr and bar->guest_val would make someone go look for
>>>>> additional information about what that val is for.
>>>> Feel free to replace "val" with something more suitable. "guest_bar"
>>>> maybe? The value definitely is not an address, so "addr" seems
>>>> inappropriate / misleading to me.
>>> This is a guest's view on the BAR's address. So to me it is still guest_addr
>> It's a guest's view on the BAR, not just the address. Or else you couldn't
>> simply return the value here without folding in the correct low bits.
> I agree with this this respect as it is indeed address + lower bits.
> How about guest_bar_val then? So it reflects its nature, e.g. the value
> of the BAR as seen by the guest.

Gets a little longish for my taste. I for one wouldn't mind it be just
"guest". In the end Roger has the final say here anyway.

Jan


