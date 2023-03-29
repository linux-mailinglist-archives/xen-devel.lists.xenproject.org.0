Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 114906CD53E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 10:52:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516117.799720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phRXx-0002OX-99; Wed, 29 Mar 2023 08:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516117.799720; Wed, 29 Mar 2023 08:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phRXx-0002MI-61; Wed, 29 Mar 2023 08:52:45 +0000
Received: by outflank-mailman (input) for mailman id 516117;
 Wed, 29 Mar 2023 08:52:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phRXv-0002MC-Fj
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 08:52:43 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10b7a333-ce0f-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 10:52:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8981.eurprd04.prod.outlook.com (2603:10a6:10:2e0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 08:52:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 08:52:39 +0000
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
X-Inumbo-ID: 10b7a333-ce0f-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpNelwCLnH03khw8CLOoLpW6les24SyttU9DupJNE+tNKEa3KM+Tfl4Xbq1ppVKrm30ppQL+0BwkRO+Zy0Q9SJEaGTgku+1d93ybv+iT4p6y4MRAXt5TUHyWKBhn6F+M7QmjzBOeInQRDJRUINyiESRxWP4krISBKbq9tmVE16kGI9UOm6VgsExXhygYlvRdZddSOJwMwo8kk3Mjuxk5p7zxFqs561fe1TfV5bpSXZkdGYwBaXSAW347kbgJnEQjXm+BszSWhqMzaHqivpneEveSQrsDQgu/QZpargb6wQ3pGD4i3mpeJsXJafBkg8YiYc1lMyUrH5pPmkQ4Og/VFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgqRLCvRS8UdDHfNHohzGN2fUAUG3Qc8bc8B8ab12HE=;
 b=P1+sh6wnYgVwPlGhOKLuQJ988brRmyVi37jXU3Rqfp62bcgEOKkvd/TDgwNaDWatSJImyCOIBOWsaFQ9WJfVqnvTJg19IA6Wy+V++JkNNnZVDYpSLzFyKffKvEAW94P12zVe6rdhw7BsZrCAHIwMwjwKNQ7uNfdX6c2QQtAdX9Czrhdk3JUXRsV9O9i4wP9tz7R974LJB90/zD73W26fy9m4bh//pRHpL5xMm4fXnl1cada360wt8Pbg5iSPSzAGKM9oWak+pPnaWBBjOepr+eSBOA/Twn7nxI5xjltSz1fEKLb9SU9z2hf1RdCku7a+Pd9tFABgODfiPsBrR0Z9uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgqRLCvRS8UdDHfNHohzGN2fUAUG3Qc8bc8B8ab12HE=;
 b=i22OYISo4fSAgTn5hNdxnZSmui1CbbEegceau3ts8aFKO8V+fN8HigpZHa9PbDTyQ9bY7S5yvENlx9lcCMB0sgwhqi/bjDZzBXVUuvPS/BvMsLiynCCfZGUFT3mepOMO1k96JbYnyr7G7pqJPPdBlU5AbHTfK8zp74drZtiKxk4FVjHGjPHARlTYmh3P0gysRVEF34tZi/asurhEJQZ91bNDb9MNSS5r+y+S6n4NgSgWwZ360ZGBo4bXtUcm9IyxVjoy4vn+T1g6AFbXaFtaZxDayP+vPnooD+On7oQn4k5DRLmUnKKKgZuL9xSB6InPUYncK19zOUKUFFJDDQW3WA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b60c42c4-9d49-0971-f511-16748a77d767@suse.com>
Date: Wed, 29 Mar 2023 10:52:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4] vpci/msix: handle accesses adjacent to the MSI-X table
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20230324121738.4920-1-roger.pau@citrix.com>
 <85db0f26-7f3b-7956-a25b-f5b09db217f7@suse.com>
 <ZCPzX+fpEhQUxZZm@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCPzX+fpEhQUxZZm@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8981:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fa1810d-b153-4105-a7b2-08db3032f35c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ndb+J21oHRnJ3tYwuvImFGPweC/X4ScKCm2nUvlVsdzjQxJUM1PDdRSH3KmsZG+PP5l/FGrGKbi/bAv3yvgQ6/n2gFqFKWRntAR9PpwMWWJtbkYY5CrszkkY1dy1TsV5xsq0yKVvrr5d1xuDfOl+1mHXApnYsjKDmIphxmRbyTJODJwZd0Y7GgScd5TWulJwYhnr8XUPY2neTBgo0xklToDj/UHkZQYfObKQ8jXkIRiUhh/sZpD8+qqGObeQqVwkzC3gYSrcmRI+NLJ5dnNNc8Yc/NbDLzoFiCKlTDXLfdW8NUBfNr4rYpgsECknztuhdQfx/6Hedvtlds8as5ZNezP/clmp5s+1OarSpDF/BtELe28n1rBtxYdofAXeBPJQbdLzVMXiYf1zfuZgCfHyUuo+TtoP9vsdfm2UykFIIBM7/GCa/ukPCfqrvUfrq9LUuCS1JJayJS/Hh+2j5lamYrrYsvYd0LQWInOsbQ2sZrWvmCIohe3WpfsmlW1qoYKDK7CXFEtdOIsxAsP+kmlsFyyOAVi2MOwBDGmOvc5EV6LKle0mnlTamDwoAgj1CV84/JjtdIKG8zYc4cgpmfdKkQjZ1skyxOnihD3ft3ollpI0nL2gLEQ1NkuF+5pofzwLy/8DY5IbUpqc0hxFxErA9g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199021)(53546011)(66556008)(316002)(8676002)(66946007)(6916009)(66476007)(5660300002)(8936002)(38100700002)(41300700001)(4326008)(186003)(6486002)(6506007)(83380400001)(2616005)(6512007)(478600001)(26005)(31696002)(86362001)(2906002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y21iUVRMTUNNVHB5aFdKM3BZcWptNDFNL1NRRmFMNllBTUcxeERDSXZkUGl1?=
 =?utf-8?B?bDJUZ1FVM1VmMWJDelFqVC96MENkQ1NEdkNTVmZBa2xWQjBZTGhWSDBnWVhq?=
 =?utf-8?B?ZkhTRDI0UGtidXRMQmNBSVp1cmw1SThXVi9IdlZoNnczdnhTdDh4L1luOG14?=
 =?utf-8?B?K0Q1S1lqMHo3WG5jYnROQVJLZVEraWlDaHNXbEZIWHlyWHgzSnlLWGlWVCtD?=
 =?utf-8?B?amV6L1BQaUpvUjcxRHc5c3RZRTdlSkllQmIrbUM5eWRJSHhXdEhobXVMNHgy?=
 =?utf-8?B?V2pMazQwTXVJQWZGeXI1QlhnZ1RHU1Q3ak5vSm1kdEFMMkRmOU5FN2tnZG1G?=
 =?utf-8?B?SGg0aDNZaW4wNE1wbVRIdjBVQmlDUVU5NVZlVWR1U0gwYUw4YjJ3UlBTTDBi?=
 =?utf-8?B?bHNJcVplZjFXU1FhYmpieitwYWdWTy94SWdFZnVjaGNQNzEwK3YrbXNHY2Va?=
 =?utf-8?B?VEUwYSthZi8xWVJsWDlqYm9EOVdqdzZNQmZDa3k5bzU2Mkdrck9SYTNpVFY4?=
 =?utf-8?B?MVI2dktRZzBJVngxcmFockpTV1R0cWNlNmhKbHE5bGxCRzJhdUhZYmhYRGlu?=
 =?utf-8?B?ZzBkdGh6YzU2Nlg0Q0tJczg3VWZKdWpJWEhTdTNyN2ZMVEgrYUNXd2F6RnFG?=
 =?utf-8?B?YStFdkZJbVdiamV0dEhLMkd2U1V5MXNUWXpqK2NHRGZzeDB4VzdFY3p6Z2RD?=
 =?utf-8?B?UVArOXdFZmM1cExVVWxQTElLUGNsaDJwMFY2QU0vWkVoYnMzdlFjaDBPeVBW?=
 =?utf-8?B?d0psWnhMbU1JMzRzZHB3RnFNenJPRlphSmxtTm5IdHg5bWRhcGtlMDdzK25H?=
 =?utf-8?B?bDBta0JrczZOWnpnU3hkZVZDZndldW53cUorMUQ3dzAvNnJGL2d6UG5UbGp0?=
 =?utf-8?B?aXRJcHVlU1pYbHF6UXRpTEhUYUJpV2RRNkV2QmVNSWtybksxTXJWVkdLV1pV?=
 =?utf-8?B?S1BlSkIvZlNzMXUyQ2NScHhVTFY0elJKcUtEQzRsSFRZVjEzL1Jua1AxTnlO?=
 =?utf-8?B?MVBJRWlJeEp1cDNZNHllbHhSYzl0WXNNdUpGTkt3Z1FucFdVTGdzajRqNWxL?=
 =?utf-8?B?UC9pTm9CTFNzT2JZYTFUaklPN2lXTUNZdkRjUVpJTGRpQjByYnl1ZWRjbnFF?=
 =?utf-8?B?NmY4amtMMVJKV0NBSUo5eGxUUDlWQmNOMnd1VGEramo1Qk5JcGlveHNicjJK?=
 =?utf-8?B?cnpmdzdlV3B3d1VEejV3UTBqa3d0UzRtUEtubkJkMk5NbGIrQlA5bzQwcUhw?=
 =?utf-8?B?WTludjlGaFJ1eGNuNGNlU21PS3RBL2ViVzBDU0IrNVhQZitWTkpYWDF6Zm1X?=
 =?utf-8?B?alkwNlpXZ3NyY3c3dnlZbUYvQ0pxM3dmOEdkQmQ5cHB2Nnp0bHBUWHdWcWV1?=
 =?utf-8?B?Nk82MWtON0dybXhtVHFFTU9MbkphNDdjejQ4aDE1U3pUd2swU1d5eHdTUDBO?=
 =?utf-8?B?Z1JncGUvNlZNRVRjc2c5YytRcldhS25ydWNpTXAxR1J5T29BTTJEZnpvQlRr?=
 =?utf-8?B?dVZud29wc0QyUm1FMThlM2dTaWlOdWErNk1xMEdCdFQraDUxdVpJTk1zL2kz?=
 =?utf-8?B?Smx3bkVycDNrZHN3VEI4eVFIaFBRa21LL0FLK0VXQ1Q5RDBKTno1QlJZbUJo?=
 =?utf-8?B?bGtMUEttay91M1lzSkJmWDdDSEIvbGVmMlh5Q2h0eDROZEFPNVFqUGZGTGx0?=
 =?utf-8?B?VmdEMTA3LzlnZEFZdkxwbEgrTzgreGlmQ0k1NmVtK21kd2RiWCs4K3ozVnhC?=
 =?utf-8?B?Nnc0ZzhVUGxVL1I4aGhrK20rK2d6V3lsZ29xbFlwWnROT1ZDSzhrcjVVcGVD?=
 =?utf-8?B?ZXA3VksrZHMyTkY4dzQzTzRuUytpNjkyNFo2Mmo4MzltOTJZbVE1RDYwYk94?=
 =?utf-8?B?ZVB6MzIvVlROSHF3elArZHJoVXM4QzNkc0ZHR09uUFdIbHVmcFR0VGFWVCtn?=
 =?utf-8?B?TmdUeUNSQmEwSWVaNms3VDgyWng4VlNOOW5Hai9LOHh3ZlptTFdYMVpTekNn?=
 =?utf-8?B?WXg3LzlEOFhiQ1Z5d1NhQ050M2QrSUh5UnNQTWx4UUtjb29McGs0c3Y0bGd1?=
 =?utf-8?B?OUtscktoRDlHTmpNMTFwMm5ZOHBUN0J5cDI3QlNnMVZzbGpJZE9XZ0w3NEx6?=
 =?utf-8?Q?qLI7AAlsqWnwtBIc2qe/mKVxi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa1810d-b153-4105-a7b2-08db3032f35c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 08:52:39.4107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2DibDd8yejFJ+qtY7qVgU8VOxxv4dx1FiEfh3POfAUmM1xd4HVH+CErzpE5cOAKdjinek3512OLnF/+QMXK3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8981

On 29.03.2023 10:14, Roger Pau Monné wrote:
> On Wed, Mar 29, 2023 at 09:55:27AM +0200, Jan Beulich wrote:
>> On 24.03.2023 13:17, Roger Pau Monne wrote:
>>> The handling of the MSI-X table accesses by Xen requires that any
>>> pages part of the MSI-X related tables are not mapped into the domain
>>> physmap.  As a result, any device registers in the same pages as the
>>> start or the end of the MSIX or PBA tables is not currently
>>> accessible, as the accesses are just dropped.
>>>
>>> Note the spec forbids such placing of registers, as the MSIX and PBA
>>> tables must be 4K isolated from any other registers:
>>>
>>> "If a Base Address register that maps address space for the MSI-X
>>> Table or MSI-X PBA also maps other usable address space that is not
>>> associated with MSI-X structures, locations (e.g., for CSRs) used in
>>> the other address space must not share any naturally aligned 4-KB
>>> address range with one where either MSI-X structure resides."
>>>
>>> Yet the 'Intel Wi-Fi 6 AX201' device on one of my boxes has registers
>>> in the same page as the MSIX tables, and thus won't work on a PVH dom0
>>> without this fix.
>>>
>>> In order to cope with the behavior passthrough any accesses that fall
>>> on the same page as the MSIX tables (but don't fall in between) to the
>>> underlying hardware.  Such forwarding also takes care of the PBA
>>> accesses, so it allows to remove the code doing this handling in
>>> msix_{read,write}.  Note that as a result accesses to the PBA array
>>> are no longer limited to 4 and 8 byte sizes, there's no access size
>>> restriction for PBA accesses documented in the specification.
>>
>> I should have (re)checked the spec. There is a restriction, common to table
>> and PBA: "For all accesses to MSI-X Table and MSI-X PBA fields, software
>> must use aligned full DWORD or aligned full QWORD transactions; otherwise,
>> the result is undefined."
> 
> Thanks for noticing, I really wasn't able to spot it when I checked.
> I guess because of the intermixed "Implementation Note" sections in
> the spec.
> 
> Will amend and resend v5 then.

The patch was committed already, so it'll need to be a incremental new one
if we want to enforce to constraint again. (For just a description change
it's too late now.)

Jan

