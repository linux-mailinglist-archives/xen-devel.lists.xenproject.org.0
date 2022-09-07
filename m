Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE555AFFEB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 11:08:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401043.642712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVr2R-0004CL-MM; Wed, 07 Sep 2022 09:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401043.642712; Wed, 07 Sep 2022 09:08:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVr2R-00048p-Ip; Wed, 07 Sep 2022 09:08:03 +0000
Received: by outflank-mailman (input) for mailman id 401043;
 Wed, 07 Sep 2022 09:08:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2ywg=ZK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVr2Q-00048j-0l
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 09:08:02 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130052.outbound.protection.outlook.com [40.107.13.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9236c47a-2e8c-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 11:08:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0401MB2480.eurprd04.prod.outlook.com (2603:10a6:800:4e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 09:07:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 09:07:57 +0000
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
X-Inumbo-ID: 9236c47a-2e8c-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfzJden5q3XhwppaYqFU7PNsJrpVzVY8mIciT7CRTkGajcHfK1nrd13yz0byrIPmIq0znz/koBp7CDp9WwQvM36v8Sd488ToReS4WN8zw726jqFka4xXhPx1vHm1H/TRikKiAg2w8HmfFJm7doCxpUEAX4bJUMYRZVg9R0RTf73DBI1NgNhC3092Xh+DbfsF/zVwcUibygvN3dbwaNzZsfWK8cyWiwkwb5EwbjCE0A3VvTy/7AjBCbtelmLtuYSbdBbapsuJurSAv6OqvM8IYQ47HvKyc3QB6xJcv/CsZEAeNoZeuzZ3KFYb9vhOpXhuHc+ElBRuUEF7dF1dZeMPhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBa91PnP2x0fp5wjpYDvgS06tRVGYHeIkGXQRkxwGwY=;
 b=FvSgkkW+WwwygvOo2atpRa/eANFkHtNxrnpdgqnA3YtsHuPU30O3/rew3IgyIzqxsB1KIcLmv1sIU6KF05mxbGXxFjUPmlc6tyBHMWMYBzJQNYMyFeNmVQS1WqdBPFKsKis975iYyoj/RzeR6BEwTJwfl+Y81PDu+bDRHz52VLY8G+RFN8+J55a7SAxi4v7XoPXxZKDjco0zMUzNx/63H+oGcgJwmqTPQrGjW6o2mo3IqhODKrHZkbb6pZJudGg69exqkJxEInjR4f8JC2A6XmAChVy+xzVTX6rLIZDHo2IPDVvz1VrPJ8N7rnP+TxlyjTwd0tztOvoTksh/OEWlvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBa91PnP2x0fp5wjpYDvgS06tRVGYHeIkGXQRkxwGwY=;
 b=W64jv0RBbEus5enNmfx9M7dT/Xss+RQrS6BJwJPstNFEUjDiam/0/T9VQMfPmWq9g2q9a+8mKktkGEXYs79wVkakG6p3esJyFT0uR5dFlQ5pZK2xIHr9qPD+bcAGexidVyoinhJEJF6FzDllgEnxmhSZLOymzppK/d21zgnv8wrl38Bkcmeb2P2+oHswwT7GdSCtdpZj+YJR3sCGQ7PMrsXXAXTsQruFnbqRTf0LQSMcJYdrcoWZVw7ji0j97ucMNsQCdtm7SMLbtMOiqgq48GpqNNigDCTCZmzoaJ+yob48odWl7uFmnTAcp4Nf19b3UlsnoCpcpFAPbU9qjtusxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4ac67001-9406-6cac-b032-b6cbefb598b5@suse.com>
Date: Wed, 7 Sep 2022 11:07:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, Rahul Singh
 <rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1662024325.git.rahul.singh@arm.com>
 <e30beac1480f03b51933d8016ad9aed8855ffc18.1662024325.git.rahul.singh@arm.com>
 <alpine.DEB.2.22.394.2209021719270.3931@ubuntu-linux-20-04-desktop>
 <f40f1ac1-fe19-9d62-06d0-b049d4edcd85@suse.com>
 <5948f099-7287-2743-aa24-3c7a17033877@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5948f099-7287-2743-aa24-3c7a17033877@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR0401MB2480:EE_
X-MS-Office365-Filtering-Correlation-Id: 843ee25e-2158-4e8d-8c86-08da90b07483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oVGqcyuM7uVk4LJgiwYWbJv3rhp7dFQg5m6SMDvUI4e0qzGDTKwPngF2JCpivYOhvOghNdCm9vXZ8w0dbnCofkYs4cQ9kVw+f0LNHdkXzd+O/2Jj7p5dezGxrahr9g15iq209KIBg8bih0pNANUOdhDDN07Jw7EiFlkUjXMIpK81cqKOpSrogTp44ZUgo82auDJvF3Vjz0xyQa55ycjqgcLI85lBXy7lfsBqnJsxm5fBfwUb7ahQFiSnLZMAVUQ7WqCYa6cAlKzy3X4LJzYEkd1Pf/50oWyRYaheXk+fVmVPGN8NfNXobFTd9FEQnZ9kUOhCvmKN21WdRzUv6GSEp6tMMRgpthAiq6fio9AZtuRWsSarFlTtNCMAJbU/7IW0crPICWsrEjWaaMFfozCEy6Ko4ox2+1J3vV8OLDv1Zadqbw4IV9Jz+Uw7gdvjY/Haqc51KCd3Z6R86sHd5knZ+bZx7ve7gZH7NNUTbg6090+Do3zSoeIjBo7csmkOCI1O6cdKOgVw4HQHuR1SQen+Ve+aviNHQx1psWsTrPKpSV5NUKoKO+kIn/ZJOiAvPp07MMRqtgXG5UvkebEAA2w4W2SIV1XulSo8lqoB41tPTiCXDLdMxAJOkAMh22j2lHfD7suberAnPpiOpURCruhVTHyYFTAKtHg9fnPYgAYO1RtT+bEIV+YqZSlptppWXWm8/bZHaVhSuBvCndd7W0n8ogRoSTv69ROgijkEZ7dp9ODC+FRK3S9Cd1IKLfgmQlkyJklp8RdKAreQqDQ6mVirORlUZ67MEtgd4O6V6uO6bnQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(136003)(376002)(39860400002)(366004)(6916009)(54906003)(83380400001)(26005)(6512007)(478600001)(53546011)(316002)(6506007)(31686004)(186003)(36756003)(31696002)(86362001)(66946007)(4326008)(2616005)(8676002)(66556008)(66476007)(2906002)(8936002)(5660300002)(7416002)(41300700001)(6486002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWFRcXEwdjVEVTJ4MW13WTJZYjlidUNWeU9IZnhjdW5wY1RhTllZVjRDSlc1?=
 =?utf-8?B?MERKdVlrZXBkeG1Ea3lrSVo2WUttSVlnQXFCYThwNEdUeUJKWnNmZmZ3Vjkr?=
 =?utf-8?B?dFRiT3V2bUk5ZnRGSERkOWdOdHBJMWdBbk1rVk1MSnAyMGI5N0lJL3hHZE1j?=
 =?utf-8?B?TUdUejhlVFpPT21mUzVocnRXSDczbXNubCtrODJaM1FwcDVsdjFnY2JrOEZB?=
 =?utf-8?B?SXdzeDhEZThDSHRNcHBMeEdFM2lkRGFveEZFUXI1R3hHYzR5VnpxUHNPR1Fh?=
 =?utf-8?B?THVrK0hFWmdzN1RQZWsrV2FaMURVZE82TzYrRE82T1ExRXZQYVQxdHpVNCtM?=
 =?utf-8?B?eTNPdXRyQmdCQlZTMk4xTzg3bjRSaW5sZlp1bGNTK3V4Q2FvRThLeHgzRFNI?=
 =?utf-8?B?THl4M3kvbkR0b2gxdnZEcFR2Q3FZcmlabnZReWl4WUdnMEs2M0tQL1BiNldM?=
 =?utf-8?B?V0RpNW53emo1ZXlZU3VybWd3UzllWE9HR0UwR1c5bVZQckMxbW90N01wMnNj?=
 =?utf-8?B?VVpmTmlrZDdpTEJGTWYvc2o1eVBNRnY5M3hXZmlHWUhCMzFXVjI2RVBUVnFM?=
 =?utf-8?B?YnJEYzZCY2lSay9YcW9EUHkwWVU0aEdRemNNOVVlNU9DOFl2L2I0QXo5Rnd1?=
 =?utf-8?B?bVZ4MTd1N09LNzlzOUZubFJrbU5XN2RZWGRzOUJaU0xpVDRoVW54Q3pCc1Fm?=
 =?utf-8?B?TVVuUUhIUXJ0b2pUUWFUbXdsWVExbjZTL2JlVS9VTjJrVjZUaXFyOHh5bTNV?=
 =?utf-8?B?VnRCZ3BQQmpIZDFPNUNaTVZ3SDlCa0hZaFZabk51VkY3RTRiVFE2a2pDN29z?=
 =?utf-8?B?ZmU4NFY5SldMNTJ5ZVZJZkZtMGhuWEFkcXJCZ1UyVzBkVFFqR0RZWGovR2dq?=
 =?utf-8?B?eFdSZVZ5YUdRRWtQTm1jYVZ0WUtKSWxES0NiMFQvRSttOTJJSVBkdEFodDdW?=
 =?utf-8?B?RFZwSTc1VlpEdFlIazcxS0R6S2NHTmF3aGNEY3pWZFVFdFhURUNUWUU5ZCtI?=
 =?utf-8?B?RmRGdWRpN1c1MlMzR2dlOFBLanpDZVliN2ZFN0R5VG44ckgyYlNoS2FtZEVo?=
 =?utf-8?B?TlFJRHFYR0t5M1RBdjBCbWRBK0dsMndyRlVReVNVaGUzaFpRWHpZbnYvdkNq?=
 =?utf-8?B?VnVpWm4wNkJURkF3KzNCeUFMeWhuVCtnbVJ0WDRwMDRNbVlDRDgzQ0RzSGNI?=
 =?utf-8?B?OU9TdktCTzFkR3pKeUpJaWRMTFBIVkxoZGxjMjBFMDIzQVk4amhRMjhaTkxn?=
 =?utf-8?B?Z3lEeFhTRFM1RUlFYUk4c2RrK3A4d0lmUytzc1Q2RktMcGtjdW1EdStwWmRC?=
 =?utf-8?B?ZmNGRzFIdTB6SE1SdDlXekpGcEZxRk9xNk5IM2pvSFUrS2VrL05SQmxLY1lL?=
 =?utf-8?B?K1V0VHNueXo5THFhMUtZK1NqOENYMHdLVHYxWEZudEVTTU5ibHhlTEhuT1lk?=
 =?utf-8?B?SXZjbDRzeDZwby9uNWlIV2JPRWdicTM4RnV2MjM0dXFmNmU0UG9HODlENWdK?=
 =?utf-8?B?ckdiazkwcGVJMDg5MnJ1QlRIV1Y1TkZWeFVtWEJzbXlTOXMzaEJVVW9KN1Nv?=
 =?utf-8?B?VjMySmthSlJuTGd5LzF6RUxwSmtsZmpYS0hvVEcwMGdMZ1k4M2lQODJmL0Zj?=
 =?utf-8?B?OUN3aHF2R0VoR0c5UnU3NDg5ZXdEQ2Iya0xDVS9kRHlTNW53bUFaQ0d2Vmx5?=
 =?utf-8?B?RENjWHhITXJsZW1iTnVWRk41N3l4M2syWmdFVUxrd0F6Z3NVWFVaekNKN1lD?=
 =?utf-8?B?S28zU2gvaXhHUDJOVExSbEpRTzlDcnJpakZESUZaZ3BSQU9XVWpMUVRKdUZG?=
 =?utf-8?B?NmsrdTZtUDFlYW4ySjQwV2tJaDR3aU9YYWx2bkp4eEtLczJPVGhvRzlRNXBh?=
 =?utf-8?B?bWRiWjdVMXV3b093OWo4R2FLbWNSZWtSbjU4VnJRTFI4N1IraFpxYmxkY0hl?=
 =?utf-8?B?eHhORnpOL2RCY3llVFZjMktpUmp1YTNIenlXbVpzYUVNY0l3cjcxRTNFN0Qy?=
 =?utf-8?B?Zi9NOW52WUk1aDVEVGtFeTRrTkFvbHBDQk5uNE5MY20ycXduUTN4QXhxU1lj?=
 =?utf-8?B?bWF3VVR1OFZpS1UzM21va3V0cWlGZ0NwYzlieEUrNk5acEUvZ1I1VmgzMkhL?=
 =?utf-8?Q?OXbrStdr2wkf/smN/OqMkLM1r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 843ee25e-2158-4e8d-8c86-08da90b07483
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 09:07:57.0706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTAMrpRcyuoqA5k4BKTOIBQA3x+9Kod7wrdxtC8tvCN6RKGayNq8WKK+bF2j79RfgkQQoxrTza60fc1KZZSp1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2480

On 07.09.2022 10:58, Julien Grall wrote:
> Hi Jan & Stefano,
> 
> On 06/09/2022 09:53, Jan Beulich wrote:
>> On 03.09.2022 02:24, Stefano Stabellini wrote:
>>> On Thu, 1 Sep 2022, Rahul Singh wrote:
>>>> @@ -363,6 +373,39 @@ int __init pci_host_bridge_mappings(struct domain *d)
>>>>       return 0;
>>>>   }
>>>>   
>>>> +static int is_bar_valid(const struct dt_device_node *dev,
>>>> +                        uint64_t addr, uint64_t len, void *data)
>>>> +{
>>>> +    struct pdev_bar *bar_data = data;
>>>> +    unsigned long s = mfn_x(bar_data->start);
>>>> +    unsigned long e = mfn_x(bar_data->end);
>>>> +
>>>> +    if ( (s <= e) && (s >= PFN_DOWN(addr)) && (e <= PFN_UP(addr + len - 1)) )
>>>> +        bar_data->is_valid =  true;
>>>
>>>
>>> This patch looks good and you addressed all Jan's comment well. Before I
>>> ack it, one question.
>>>
>>> I know that you made this change to address Jan's comment but using
>>> PFN_DOWN for the (s >= PFN_DOWN(addr)) check and PFN_UP for the (e <=
>>> PFN_UP(addr + len - 1)) check means that we are relaxing the
>>> requirements, aren't we?
>>>
>>> I know that this discussion is a bit pointless because addr and len should
>>> always be page aligned, and if they weren't it would be a mistake.
> 
> Hmmm.... Is that requirement written down somewhere?

What do you mean here? Isn't it quite obvious that every byte in the
address space may only be used for a single purpose? I.e. if a byte
is covered by a BAR, it cannot also be covered by a RAM region or
yet something else (e.g. MMIO beyond BARs of PCI devices). What
happens if BAR and RAM indeed overlap depends on fabric and chipset,
but it'll either result in chaos if two parties respond to a single
request on the bus, or it'll be (hopefully) deterministic (for any
individual system) which of the two takes "precedence".

I think we've had a similar discussion a little while ago already in
the context of vPCI with guest address space in mind. The same (imo
obvious) "rule" spelled out above applies there and here.

Jan

> The reason I am 
> asking is "page-aligned" will vary depending on the software. In the 
> past we had a couple of cases where the region would be 4KB-aligned but 
> not necessarily 64KB-aligned.
> 
> If the answer is no to my question then...
> 
>> But
>>> assuming that they are not page aligned, wouldn't we want this check to
>>> be a strict as possible?
>>>
>>> Wouldn't we want to ensure that the [s,e] range is a strict subset of
>>> [addr,addr+len-1] ? If so we would need to do the following instead:
>>>
>>>      if ( (s <= e) && (s >= PFN_UP(addr)) && (e <= PFN_DOWN(addr + len - 1)) )
>>>          bar_data->is_valid =  true;
>>
>> But that might mean (in theory at least) a partial overlap, which has
>> to be avoided. The only alternative that I see to Rahul's original
>> code is to omit use of PFN_DOWN() and PFN_UP() in this construct
>> altogether. Assuming that's correct for the passed in (addr,len)
>> tuple.
> 
> ... I think we would want to drop PFN_DOWN/PFN_UP here.
> 
> Cheers,
> 


