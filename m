Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F703FC2DD
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 08:52:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175476.319686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKxcn-0002ty-BE; Tue, 31 Aug 2021 06:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175476.319686; Tue, 31 Aug 2021 06:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKxcn-0002qw-84; Tue, 31 Aug 2021 06:52:01 +0000
Received: by outflank-mailman (input) for mailman id 175476;
 Tue, 31 Aug 2021 06:51:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mKxcl-0002qq-K8
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 06:51:59 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a8859d6-f9fc-443e-a369-313c9cfc3927;
 Tue, 31 Aug 2021 06:51:58 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-fFXVSXQ_OuSFIC6S5ZS_qg-1; Tue, 31 Aug 2021 08:51:56 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB5906.eurprd04.prod.outlook.com (2603:10a6:208:130::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 06:51:54 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 06:51:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR03CA0051.eurprd03.prod.outlook.com (2603:10a6:208::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Tue, 31 Aug 2021 06:51:53 +0000
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
X-Inumbo-ID: 7a8859d6-f9fc-443e-a369-313c9cfc3927
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630392717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=drZQEylNyNYxAugnIzX//tucIIlmODCRfuPm+RbOEvI=;
	b=X2s6kzEt/e2giJCKQjcSH26DKGRj9kZ+FDVnszxg9RhHkr0InFlBSx+s04cMYL4bkrbPcB
	m4mNrkRC9sMGRWp301GxlAdcykH4cmoKydas2ssaA0vxNvoka8rbJICQKtzr7rP81lCLU+
	J82cf0keRCwR52OwhEgo9O+7B4XxdXs=
X-MC-Unique: fFXVSXQ_OuSFIC6S5ZS_qg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IeVXbPy3guK1BXys3o5UHQNYe6r16N7NpU6JFt6s5MYvuV4s0KB09wjFUn1OUieH3ZEyLzeyqr+zN8tQtIi5GU2MY5Gr2yf6hhbzSineEFeQznWl7ezXjt5meIUy864WTPVLXdjrXXe+88EgbFsaqoyEBGznYO+8+rd5613ZyO1EoBs8vCa07OvsILvRgjZyQePA1n42f0jno0YzwF8QfDo0Seht2qOkyVZJSVXDqlBwpYEBZVhgbVhqZ7H/doBTKuPfjwxovCmPFbKf6nFxMaW5K0W6SGbUoWyfsKP7o42EnY4DAAKc23T4PMFEZDqSCInLQy1hQAZXOBkyUOA1Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drZQEylNyNYxAugnIzX//tucIIlmODCRfuPm+RbOEvI=;
 b=VJeB7DR6+89U7qRZleOYhAdZ4WSQ+WVn0gkJu6XOKJ4j/jP9uqBXORLjpFcYgupgg39NWP/HU1MH6ru3b3uWeewM/26jqGHiYjSSfLE9r8tuxlWBCGbOv9SU3cC4QLaGs3sRQHOChxS2qfk6e0Tzohncz8Zlr30Hspa2EmAz7dwWI8e9veI+ytijuvW5T/O8Z1gcuv7NxnD22iz3dHzWTqAFFb6yFv54NjoePociW3bn4C22YiBDGcV8naQK1FRKu/ilHvHrhFQfl+pH28ixgrknFxSPzgACfueANKbYCGf74xnb8myWl+BeGUep6gO5Ywfk79biwIJybrtDJQuPoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH RFC] vPCI: account for hidden devices in modify_bars()
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6285981f-683f-a043-7025-993613eaea7c@suse.com>
 <b2e8863d-217a-fc0e-3176-a20ef5ad0872@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e87ad2a2-7ee0-a2e7-7bab-0c332aca7aec@suse.com>
Date: Tue, 31 Aug 2021 08:51:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <b2e8863d-217a-fc0e-3176-a20ef5ad0872@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0051.eurprd03.prod.outlook.com (2603:10a6:208::28)
 To AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83c160b3-c584-43c3-10b6-08d96c4bd126
X-MS-TrafficTypeDiagnostic: AM0PR04MB5906:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5906485EC3BFE30E8047D020B3CC9@AM0PR04MB5906.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B4NlnKVgQkV/vNV8wU1cdrtfdmxKJkrmgPwoQ3MNQN5/KCmfDeI4JJVgR1HUqZHLXJOymYOW3f25bSiHKQNk/CTfrVD9k7SCfSYOZSx44U8C/jFUk+PIjtki8C0byCp/mfW12luxDyYnKfn2bUR9mJvzUR+D5XT7WziRXhsx+/sdZghIVM4IBwNIY5XZc0CtLKasK6x7zQC7QVgXVWSva//K1kLbyu0cKnI1jkEBneUQWvwkpfYXbuupn5Mf7zPLsc7owogxfTtU9YbalP4b7PDUQwX0YwvfaCnwSZugODCls8E9w2X+FFR4H0wTdI6lg255e+rZdGHGW3rMcXlbRwY+un8UP5ILv3fUs7A1uVXX/Xe2lap20XCZAlw3L36lyKpR5teijz2w+WTes/C9zb/9vfSQT/fU0+EZUA1pViRywUL2ngSwTyOAhz2vBnZbL0TDbP6tmMkjPsw9Rm+w9qO+F7cCnCMw0Of+5cM+bLsEcFc7SceqamvuOQu60hiuB9GeWEtqaP+EzDlfJ4qR/cppdviGEZ0sNCX/SiOfVvECe1sAEiAbNnHh5fLuCX9YmNQAc6c5RjUfCRAZB9g98yvWBOzX1Xye9McCI6DEQHBt+RcfjdaHOPVB8pTGjxr9RJLDdi7rBBqAV5qgKr82DtFwuCEXIloZkANSNx0hWLd96a5p3/WdTU6bHYKfmyD89XqDXgquMiLvKWKlDVQfXol43hd9SkGoQyqIeILuGi8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(53546011)(5660300002)(31696002)(36756003)(6486002)(2616005)(66556008)(31686004)(956004)(4326008)(2906002)(83380400001)(66946007)(316002)(8936002)(26005)(54906003)(186003)(38100700002)(16576012)(508600001)(66476007)(15650500001)(86362001)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWRhU3lsbE1yaytvVnprbjJlUzZ1djhGaFdmb2ovNmZzVXRWaUlUQUJrV0E5?=
 =?utf-8?B?Y0hrT3AxTDQvNXFLZmgrUDN4K01hS1hzSm4ybGxmWkNGTUlSNnRXM2NwZnQv?=
 =?utf-8?B?dWcxazFKbkRMSjd3N0dYS1RqQUxiOTcyWWJqRjd0dURZZWtzWDB4R0FwMHNt?=
 =?utf-8?B?R2xiQ1g1SW91WmhnVjM1alF5NEN4dEZQV1JQREdnamtKUmZsZ1FJSDNTWjlS?=
 =?utf-8?B?Zi9ZYlZLMkQ0REsyTDNNMXJZZ3I2Ym1COGkvUTJmYlFMVjFVdVhGTXpyTi9T?=
 =?utf-8?B?aDZ2eWNVQVhKR0E0S0hncVZMbTZOSFdJa2ExK2JjL0lVS2JUd1doQzdXdG1M?=
 =?utf-8?B?M2JFZThlQU5RM0FIUVBDb2dLRGlSNjg0NTNPTVFJZ25nNkN4L1R2VGtNd1A2?=
 =?utf-8?B?VTIvOXI4TVg0UVY0Q1l2STJ2OXd0cTZkUTBycDdJM0ZtbWwxRDlrakZZTGY5?=
 =?utf-8?B?MXRuYWVmTVgweTVqbXdaWnpvbDEwb1k5b2E1TGpETExsRjNTWDBobzRDZjN3?=
 =?utf-8?B?SDdGMVBTYVcrK3p0VVRsblpadElQS0FYYXp5b3hZZENPZVdvNk4veTAyMlJk?=
 =?utf-8?B?NmtlcGFIVjFBRkRxMmlGR3IyUlErOGorTlAyNHJFRG5XLzJ4Wi9HNVNXT01G?=
 =?utf-8?B?dWo4RFo5Umd0RTloMEM2T1Baa2h5bVlpOVBicStiUFRXY3NSNFpnTUlUTGNh?=
 =?utf-8?B?N1dSQkpKempIM2V6VWRiUXZUczZIN3graktKaTRFdlFEVlQ5SlkyamNtV21k?=
 =?utf-8?B?QjlRc0tEZE91YUQvMFI5WW1ocmZpdXIzRjgxMWV1MTM5b2F6SktuNGp3Rklu?=
 =?utf-8?B?OGV2WFJKMGxTTEFrRk5HU1JIM1hrMlkxbHZEOXZqamZkMFM1cmFHQXlESlRs?=
 =?utf-8?B?MkwzZm42VjZBR3BPYklTSVNLUS9pVzd4LzNtbjEwdFo0aDdzY09KcjZJbzYy?=
 =?utf-8?B?c0xYdlBobjBROXNzaGVSbDdrbmd0WHg1LzIwTDA2MlZnMkZwa1dzdmVFRVZp?=
 =?utf-8?B?OVVEdEtISU9jSzh4T25zSWFUcTlVUi9lM0NyM1ZJbTV4VWtHUmlySkZqMHd1?=
 =?utf-8?B?Uzg5ZlJyNWlqWUNrMjhTRElXTXd2ejlVL2xTeUFBZFJCTnRxR0x2di9MT01k?=
 =?utf-8?B?NUZDcVV3MTNoNndsTGVWYWNnekxvZXFzaWdWaWtKN3VYejFGbWVVTGpHS1pn?=
 =?utf-8?B?VUF3d1VVRk4wbkRsMmVYWFVsb2czd0paQm42cWRVd3ZSV3RycGk3NDJzWnQx?=
 =?utf-8?B?MHg1d2l6MG9XQWlsOTJQS1MzeHExQVU0bXFURWloTys1alRienhhZkVIazFX?=
 =?utf-8?B?Z00vQ1BNK2J3YjF6U3RoNGtieVMxUWs2NVp3ZERscE40QXVHcmJuRERUQzBX?=
 =?utf-8?B?Skh6b0JEeVZqU2Zad1NmNWV0dUVyVEdGM0FITHdacUc0U2lJa1ZORHFpWllQ?=
 =?utf-8?B?MElNNUdxY2lkOHpBYXRhSWlPT1pkeVUza1c1WkJrek1KcEsrZ1FPQ2V5d0lu?=
 =?utf-8?B?ei9Ua1hRdE55cDNjbDVmWE5GVEF2Rko2V1JlTFVmdjRHOTlBcTJEVTk3SDNP?=
 =?utf-8?B?YkUzUnJzNDl1TXM0Y29vYWRjV3BKeUNtT204aGpYR1JOQlhUS1hheGlnemd0?=
 =?utf-8?B?a3BCSnJXejl5VDhxUFM0ZHVVbldOL215ODYxRXFvTTQ2bjZpdXNSYXFCVnBo?=
 =?utf-8?B?SFFJRlo2RTZMTWUzK0hjWnRXdWV5dWp1TnVTSU5wbHNpWDBQOG1wTWU2cWdw?=
 =?utf-8?Q?6hdkajaiCXxANO0v104fQkZKIRokhrWzPeSvj1m?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c160b3-c584-43c3-10b6-08d96c4bd126
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 06:51:53.8264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PjVUciTgj29O5r0RNb7WKxy3XisGh3uEvxrKOFSpSosQbwNYr89cjERejE78b9U8XMgC90bdbhzs0z/0RAz8uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5906

On 31.08.2021 07:35, Oleksandr Andrushchenko wrote:
> Hello, Jan!
> 
> On 30.08.21 16:04, Jan Beulich wrote:
>> Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
>> console) are associated with DomXEN, not Dom0. This means that while
>> looking for overlapping BARs such devices cannot be found on Dom0's
>> list of devices; DomXEN's list also needs to be scanned.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> RFC: Patch intentionally mis-formatted, as the necessary re-indentation
>>       would make the diff difficult to read. At this point I'd merely
>>       like to gather input towards possible better approaches to solve
>>       the issue (not the least because quite possibly there are further
>>       places needing changing).
>>
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -206,6 +206,7 @@ static int modify_bars(const struct pci_
>>       struct vpci_header *header = &pdev->vpci->header;
>>       struct rangeset *mem = rangeset_new(NULL, NULL, 0);
>>       struct pci_dev *tmp, *dev = NULL;
>> +    const struct domain *d;
>>       const struct vpci_msix *msix = pdev->vpci->msix;
>>       unsigned int i;
>>       int rc;
>> @@ -265,7 +266,8 @@ static int modify_bars(const struct pci_
>>        * Check for overlaps with other BARs. Note that only BARs that are
>>        * currently mapped (enabled) are checked for overlaps.
>>        */
>> -    for_each_pdev ( pdev->domain, tmp )
>> +for ( d = pdev->domain; ; d = dom_xen ) {//todo
> 
> I am not quite sure this will be correct for the cases where pdev->domain != dom0,
> e.g. in the series for PCI passthrough for Arm this can be any guest. For such cases
> we'll force running the loop for dom_xen which I am not sure is desirable.

It is surely not desirable, but it also doesn't happen - see the
is_hardware_domain() check further down (keeping context below).

> Another question is why such a hidden device has its pdev->domain not set correctly,
> so we need to work this around?

Please see _setup_hwdom_pci_devices() and commit e46ea4d44dc0
("PCI: don't allow guest assignment of devices used by Xen")
introducing that temporary override. To permit limited
visibility to Dom0, these devices still need setting up in the
IOMMU for Dom0. Consequently BAR overlap detection also needs
to take these into account (i.e. the goal here is not just to
prevent triggering the ASSERT() in question).

Jan

>> @@ -308,6 +311,7 @@ static int modify_bars(const struct pci_
>>               }
>>           }
>>       }
>> +if ( !is_hardware_domain(d) ) break; }//todo
>>   
>>       ASSERT(dev);
>>   
>>
>>
> 


