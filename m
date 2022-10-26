Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A06F60E2DA
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 16:07:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430609.682502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onh3P-0004oH-Il; Wed, 26 Oct 2022 14:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430609.682502; Wed, 26 Oct 2022 14:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onh3P-0004lt-FC; Wed, 26 Oct 2022 14:06:47 +0000
Received: by outflank-mailman (input) for mailman id 430609;
 Wed, 26 Oct 2022 14:06:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1onh3O-0004ln-FH
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 14:06:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2086.outbound.protection.outlook.com [40.107.20.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c733e72-5537-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 16:06:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8740.eurprd04.prod.outlook.com (2603:10a6:20b:42d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Wed, 26 Oct
 2022 14:06:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Wed, 26 Oct 2022
 14:06:42 +0000
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
X-Inumbo-ID: 6c733e72-5537-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSyOJYNv6tUFK+RrNsrxi9mQYF9i8R6mNNLp6X4s+FCUsKopfv6ti7qNtOtQ7aTSR/AENmCFwtEIX0KXy2fDic40WKJyTlYyiJKWPL9QyJ9owzJP2Fmlf80JTJMOXIOSTpkTmcYSFDoEw0U+ydrILzVuoIVFgA7LHhIA506fLmqnK3qpGFqswkB75LHlxt+8sJy0g6pwbF34c3VyfzGILEzrkV9OCneEX2nT/9FUxmXFHa6+hXZq0yMNb4kq/MYjVF2Z/Hu5Bl+5fzCP2mUrEF/EN3j27pwlrEU8yBOEKKfnL55ckyE/g/+EssNEso4C7Mm8YjCx7seli14W7MRg/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXq0m7jvoyekWseyL6Ho4aVMtVi5oA7iIXs0LHcyuUg=;
 b=GMJxaxiIxbBKnoqtuzU0902kjp4+PzMi14vB657I5HHBnUENq7HnuuVrSV3KMkNNbVTIFWrgEeq6H1b2qQAzr14tabxRtjm1TJSzIL5YFu1hbH1w68dXRAB5bSddd6gHF3b91JOswUcDTkI8D1/3iRVm8RE0TTt1ZvP+k9MCEo5xsQpqZu5envUmbT87IL4zCIaSQbO1pIZVA9Ylq+Fx1dAps56XSYUOU3y8XGQ0GxSj4lCCtqr+8isnLI0cQT7qids7d3nKmkUpBPrEc1eQ1aQNJgh3aQynG9N+nkk0pinoIgX1drXSM85KiJYlam+pEBuFZKsIlUTZ3mkqRWZUsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXq0m7jvoyekWseyL6Ho4aVMtVi5oA7iIXs0LHcyuUg=;
 b=tJFx77Z8176UEiDNmRzurzFNkjsZtn7apBcHTel/y/qLgGw5deD38jplmEgKcIwTDkaWAdcIkn5C2Fxc8pnQGqLaKZEIFZ/jc8Yd6x6CeLxJhX2wk2pDYqLH3QDRcXSHdyaIJZddZUl1Ez8R2fFWV1WnJYhchlV9flxxWM1yGS8hthnpXZn38cOBAEQqw63+KRZXAlmx+IgUmZRwEpdBRQiBjmKm2h8ANVTNRW7V9OoeL1EHggyM9jE5uj+fr+1bNeaRj+mphjxnBUzKREvxrqlo9fmozyGGwULuY2SDz6+/ExXjAXAMl3p9KemXVEFmbrJUIfUqlvPnHkFEjtKNUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <045428b7-9c4d-cbf6-3ca9-157c516399a9@suse.com>
Date: Wed, 26 Oct 2022 16:06:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH for-4.17 v2 5/5] vpci: refuse BAR writes only if the BAR
 is mapped
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, xen-devel@lists.xenproject.org
References: <20221025144418.66800-1-roger.pau@citrix.com>
 <20221025144418.66800-6-roger.pau@citrix.com>
 <666377e8-fe58-bc9f-70ff-2e21d93c691f@suse.com>
 <Y1k88uhbSNdMvsa+@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y1k88uhbSNdMvsa+@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0124.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::29) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8740:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c48faf-3dfa-4e05-eda1-08dab75b4f50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UHw9LsylyGwSZAWjPdX099MU7MHqe6Yr3nGZEnAPDrBXHfFnp1fWbYiX6Pf20Mt1Xf7M4X5GW2EgKGBWP5zNJaMWcYYTt2SpHAE2ok5bp+DrRSAR1/7NrxU0WdtnWnAVxDOkqKjeKG54N7VHPs/k9Vr3ysN5YYKcKkPbTDrFieeR5VZBQaGfDm/BYWLUJINYN7bJuC5RWhjyMFaql4lRUg57z6b8jhtaqbdHmXGvo02boU5adyBbU8hx4WhKhtGuTbYvQwIidLXOuSfkVSAXya6EQQ/QiSj/xbRYcNrvO+onNmitkFnILFsjkW1YsnA/QmWoLXnfIV78/huzmNye+kx0c4aVs8mtGRdiGzp88u71+6M14kL82Vl3CwV6VRIR6gnvgnevfUi74k0nhbVbyfYVV7HGS6ZeblncC6cQqb4ntuRDvdjJKH4migKhqV96BfbBw8TTy2AVxj1YF/RhxKUm27xmq3gglHsE8emqUdyLVvtxbK7l7QarMbCrLKCqGgjAl9IqLQLNO75yfq4WGiNlcnGHIbS0c0F2JfnaOcGdUXXw/NHSAqckKPvcPwjwquX6+Lg2fO8C31vJddv4tqlqfHAu798EQ6V6M7cDW5WxSFyLwPgBJDHVK4pwFEwUKP2Zz9TdBQvhY4js2ZuioAyUMtLfcpGHsOZWLPTWraKZgZduDBVB04Hy46UklekHRh0WyTad5lDGe0wY0/tCkSt1nicFb9UC7B5/OitFvY5RYHRwbOoUT8kW9WWgtaVP27g8iVf4wpMJA96/JvdhqO9aI/poT0Q25kMwuM/TESM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199015)(31686004)(41300700001)(5660300002)(186003)(66946007)(6916009)(4326008)(8676002)(36756003)(66476007)(86362001)(2906002)(31696002)(66556008)(316002)(478600001)(6486002)(38100700002)(8936002)(53546011)(6512007)(26005)(6506007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2hzRW92RDA2dksrMURjbmJ4SU5vOVQ0eHlBRXhLTDljZ0JTL0R1K1lFV2RO?=
 =?utf-8?B?SVhGN3RsQlRxbTRLTVhZQjJEeGNTNHM3V2d2THRybjY1TXlnbVJwZjFPVXda?=
 =?utf-8?B?Zm1nY0huQ1RXdVlVdHhQcnNjMkZYeXJ4RjN2VVVtUW5sQ29RdDIrUXNBU1Bv?=
 =?utf-8?B?OEI4SVJNc2k5amoxZXFjNFNRQkhDODBDc3dJUUQ1WUFGQ3JsbTVjUnZCZFZI?=
 =?utf-8?B?RHUxc1RxWUhpT0RzWjk1alFic0pUcnlST3JxT2pRQlFmREZ1Y1hxVVg1aFFy?=
 =?utf-8?B?MTl1YitBZEY5L1Q4NVpiNGNDK1JTOVAwYk9odmV1Rlc3WUltajdNRFNOODAx?=
 =?utf-8?B?eDlZU1NSWWx6YjhPT0xRM2lSVGpQbDEzTDdjZXBFUVJkYnlkYlJsQWxQc0Q5?=
 =?utf-8?B?MGpUd3VwTWtwL1o2WndEUVE1SFI1WnJzN0xuM0NieVdBanU5Qnh5NFRtMWJy?=
 =?utf-8?B?amZWU2R4cTZpcTNkQ01VWXhqM1F6WUVIWnUwZFdWT0lBdkJweVAvRWxwSDdL?=
 =?utf-8?B?akJXaEgvVnM2TnNPcG02bUNQYmRGcHgyekJRZFBTTDZrZTBINWxRYTQ1WXpl?=
 =?utf-8?B?a1VQSzJVVVdtWU5BZVlhMjBTSmtsRE1ESEwyRmpUSmxDOHhUWnZpdVBmOHRl?=
 =?utf-8?B?YnRNT1ZTUFBPQ0NpdDRCTHpqQWt4U3JMTVhHS0NucS9pOUZabmtMcUlkWEJI?=
 =?utf-8?B?WWhZUm84K3dMSFRudUNsSzN4WGhrTjlsaVFVaG1UVGh2ZTBOTWw2V1RhYTRS?=
 =?utf-8?B?Nk4xS09RMHN1eWladHcvdXhRSXBVQ3ZwdHg1RUpBQzhNTlpqNmpFV0taMFFH?=
 =?utf-8?B?UmdkQWMvMEhPWFk1Ui9RVVR4cHJlT3NSV0pLYytUNVdiUno2Q0hQdlRqdzZ3?=
 =?utf-8?B?b0krclBwNDdvWDJoTDJDNVVwdnV3RlI4enBORXFHSGtmRitnb3FmYW8vT0Fk?=
 =?utf-8?B?SG1pN25oWUJFVG5jMnVkM2k3alltY0Z2Z0FOYUcxS2NaREszdWM5NUhSdzh0?=
 =?utf-8?B?Q2pBZkVJR0YwNnJVSU84aFVrZ1NncFhIY2t4RlNsUkVMRmRHQStZOGxUb2FH?=
 =?utf-8?B?VGdGSzJqL3ZwUWd4dXc2R0pBS1MxUmlmSGU1TE55YTBUcDBEeVZUMzNGNG5y?=
 =?utf-8?B?Tm1YZENScUJ1V0dLN3JRaWs0eDVPelVLaWEvYXZxcUtKNmdvUFVQc0VBbDd4?=
 =?utf-8?B?UTdYdWxjSjBIL3hSc2lLZUkzcFViRVF4azNranZPclBKSnAwRWlDWXluZ0h2?=
 =?utf-8?B?TjM2a2xGc25tWGpQYnFjOFprSU83YXV6SjE2Q3BxeEg1YXg3VXJsL09idGJz?=
 =?utf-8?B?dXhsOHdFRWYyLzJLOXhKZFFCS1B5MlZGWjhYMWoremtjMDg5MHcvV2JkbHFt?=
 =?utf-8?B?eHI0c2tvVVRjYXdLb1RXZVN2NUNNRjRzRUp6QU5JZUp3eVlHN3cvLytnS1R6?=
 =?utf-8?B?R2lMdlAwbHg0N3doa25sT3NZOFh5MWZ5SGovU1U3L1JRTzdjK3RGV0RBYUM2?=
 =?utf-8?B?T3Z4b1FUNk9XblZvMGhCQlhDVml1MzZsYThXNGtYRE5sTXM2eUt1azdaSnNR?=
 =?utf-8?B?K2R4eGpzZFc5MFpGbWJHazJSV0h3TGppbFhwSi92bFIyNkQ0WjE3NU1pdXRV?=
 =?utf-8?B?NC8xUWlyY09pV0VYWFVsVzZNbGxWUmZ3MXdLazEybEJvd3pnQitEVHlDN0lH?=
 =?utf-8?B?eGJqY2pyQzVKakYyMVBJck9aS2xRcFFhT3Via1ZNUlVQcUp1akpkeEpwK3hh?=
 =?utf-8?B?eklKNm8wazUyNGhEYUpjalhYd1JXcXBybWMrQkhNdmk0REVpNlRpM0hkVno2?=
 =?utf-8?B?REdhSzJ5SDEzMDJWUHluVUFyTytGZk94TlNudUxjR2twNDV3cWdpTlZjL2M5?=
 =?utf-8?B?TVFQT00zOXdWWEt5UE8rRGFpQ3dYcE9zMlRGNEJvbDBoSGYyeFh6ckdUaDNk?=
 =?utf-8?B?eVVnRUwxdEVmSUxzMERoazI2T1NOZkxMMEF4aDcwNVdGYWY0c0RSY2dhSnU2?=
 =?utf-8?B?VXJIU1ptemgrU0JSNzRCSGxYYXZOMTcvd0ErSmpxZFMzUzNSazYyQURlSkxY?=
 =?utf-8?B?WjBLK3FkbjA4Y2FmcXJMUWF5eEhqakdZUG05UlBvc01RemdaMjdKNFRvdmgz?=
 =?utf-8?Q?yr1FVdUp/y+SWEhPAphnw19ZD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c48faf-3dfa-4e05-eda1-08dab75b4f50
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 14:06:42.8207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /7hzbHZZFS3ptEnI9mNcN1mpYYgwqwwth3dT5iSrkwZ39eHqvHQCyRj+uGHUN0B78WoATVR8fvN2ZdCQqaxsNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8740

On 26.10.2022 15:58, Roger Pau Monné wrote:
> On Wed, Oct 26, 2022 at 02:47:43PM +0200, Jan Beulich wrote:
>> On 25.10.2022 16:44, Roger Pau Monne wrote:
>>> @@ -388,12 +391,12 @@ static void cf_check bar_write(
>>>      else
>>>          val &= PCI_BASE_ADDRESS_MEM_MASK;
>>>  
>>> -    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
>>> +    if ( bar->enabled )
>>
>> In 3 of the 4 cases you use header->bars_mapped as replacement. Since it's
>> not clear to me why you don't here, could you explain this to me? (I'm
>> therefore undecided whether this is merely a cosmetic [consistency] issue.)
> 
> No, it's intended to use bar->enabled here rather than
> header->bars_mapped.
> 
> It's possible to have header->bars_mapped == true, but bar->enabled ==
> false if memory decoding is enabled, but this BAR specifically has
> failed to be mapped in the guest p2m, which means dom0 is safe to move
> it for what Xen cares (ie: it won't mess with p2m mappings because
> there are none for the BAR).
> 
> We could be more strict and use header->bars_mapped, but I don't think
> there's a need for it.
> 
> What about adding a comment with:
> 
> /*
>  * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
>  * writes as long as the BAR is not mapped into the p2m.
>  */
> 
> Otherwise I can switch to using header->bars_mapped if you think
> that's clearer.

It's not so much a matter of being clearer, but a matter of consistency:
Why does the same consideration not apply in rom_write()? In fact both
uses there are (already before the change) combined with further
conditions (checking header->rom_enabled and new_enabled). If the
inconsistency is on purpose (and perhaps necessary), I'd like to first
understand why that is before deciding what to do about it. A comment
like you suggest it _may_ be the route to go.

Jan

