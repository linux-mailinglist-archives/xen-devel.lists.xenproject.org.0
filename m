Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5566F4EAB3E
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 12:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295762.503426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ98Q-0007N5-P4; Tue, 29 Mar 2022 10:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295762.503426; Tue, 29 Mar 2022 10:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ98Q-0007LJ-LX; Tue, 29 Mar 2022 10:31:34 +0000
Received: by outflank-mailman (input) for mailman id 295762;
 Tue, 29 Mar 2022 10:31:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kdRh=UI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZ98P-0007LB-Gi
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 10:31:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66a967e6-af4b-11ec-8fbc-03012f2f19d4;
 Tue, 29 Mar 2022 12:31:32 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-i1otViIXN5Gb0opHsT97Og-1; Tue, 29 Mar 2022 12:31:30 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Tue, 29 Mar
 2022 10:31:29 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 10:31:29 +0000
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
X-Inumbo-ID: 66a967e6-af4b-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648549892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cT/vVok2+RUMJXVusQ5sLDu+mraVRC1gf3nhxxO5/DM=;
	b=AJ2We13/Jz39+6v4CeX+qLX9CTy3XKL/VDwBUfVTFmoJUhrFdJTjaIgtn+fbFgDBrMpfF2
	wB8h1UQeJ4m8ycx42mY75OTk8rvHRmmlxBSjsFZ5gd0kOeNKRvljsc9172DCKxJ72wUOJF
	uPJni2wQ5TbHbp1xCWOW+1QxAbNmM14=
X-MC-Unique: i1otViIXN5Gb0opHsT97Og-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuKB687DKjzX4SPjyDI+Y7SPDJwsirsz3BenJhv4hdIahipq7BWZrznZ6f5+HiNRHiCltTCAWlc1wXjmvcF0BZMsZqh/kL7qY0/dNIoUVhFFu1W5+X93+fCvGSGtUYB8I21Ln1eF47Xel4lNVX5AsRHEt7F5VxCXIngP9G5Qv/2L1Mo50kR5pV+1pTj+mm/35QOCFerSWMWfaW9moXXi4fQ52KtO9cYsO9mBjayO5zPv8zW02KNcIK9dqb3Sor+QBeS32SSsEX44LzxJonT2qOjJPuK3mGvuHzMXslDSERaksy3e+xnoWsiQYj8Vbr7+uxuA8QJ+1mNprbX2LCkW9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cT/vVok2+RUMJXVusQ5sLDu+mraVRC1gf3nhxxO5/DM=;
 b=AtYwlhdjXXZHComupOCJckK6XkFdO6qxzF6uqQ63y0NFg9irYbPRXY7jgGzr/enK8JcfKK14QFF60qTw2eN0BorC2T9AULeCYOCjV0xD1TNnG2N6Fhq6o0SU6DbwqN4ud6P375ll1T1rIRWF+rkWlYYd7wB7mRS53RWbV7sCun6o0j3rRtVhJAm56Xfd8Ua1uXUSk6f6KBDyZ7m+RemhwgwGWZ5pJDCBT/pmhEaERDX/e1pVOOHGHJonz5o8OR0VtZ2hs292xzLDT8VCD7q+YSEbTTLmdo52obE3FtpvSMEa44f7LKa2Rbj9hwd3mdaHxcGCDD+w6Sqj3Kmq5MC+pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a4e5b460-6067-1376-3759-bccb68e63c74@suse.com>
Date: Tue, 29 Mar 2022 12:31:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] xen: Populate xen.lds.h and make use of its macros
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220322080233.53134-1-michal.orzel@arm.com>
 <20220322080233.53134-3-michal.orzel@arm.com>
 <dbcd0509-6a8a-db5d-bad7-69027256f053@suse.com>
 <7feea62a-c467-560e-5b4e-630996e8f39d@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7feea62a-c467-560e-5b4e-630996e8f39d@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0040.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::11) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 095daafe-5f9c-46ae-6acd-08da116f4943
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7150267715CF2C652BECA728B31E9@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8f0HZJTWt1aHt+Cbty/aMcOqJatI5d73oI8XMcPr9LcJFkQZ6qLScEcydz7s5mX9ymDMSMedN3zyl3Z+3EfKvalSN6kd2gt9/KSjZt5OYwcZ12Dfpk7aYF2yu1YhUa+PAQKTxuYCzKcqXSYH1Aj53ymz79bGI2bJNeyumtO0gJOzRANXfol5+AvHABw/LjOeNA02nYlm7NSVjhPwcNOAnIMkkYs4GiPzml94vayks6jjpXoGaDalbQlGjrilxeZEGn+4L7ESadUo6c2x4Xi0bI27fjyrST+Mvi01anEnobZlfPzV15SGX/bGFL/3x5RRaZuxolrYvVqxuXaFNJ88c98SZxRQ4S52OXCr/5V0s3FfPRvbg01KUjqlljBiZNhvawUHbFOfF7XC14toS2WjI3b/6UM/lboiCDwAcwVprF8jCequh7itbzQ15DEUoapWvGvpVj0DsKx2V9OhLMIhAob+tyCQIpo7uzKAc3wbuZVrTuggt0vXjPJoX7WfifrmoBQRq6qCA5On+dNs+XGE0fA+M+cWSBLBLnO33Pz5u92thh5HLuNXo08fhVSlfyq6tpQ0TOHOaPuQ37T+GyGcBtJxBtEW8i/hMVkd1862qiIGozq1DNCEzadqnmlYEINU/0qOh3e3CzHeMRvF0kffPqsPZ3N86uta9NWXmilu4tWvBEQoBvcocTo6ohMrAjWBeZhHdPAD7J8JwitW6XxcP2wc6r39a9HvztESibvn2yw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(54906003)(38100700002)(316002)(186003)(6486002)(86362001)(2616005)(2906002)(26005)(31696002)(66946007)(8936002)(7416002)(66476007)(8676002)(6916009)(31686004)(66556008)(6506007)(83380400001)(36756003)(5660300002)(4326008)(6512007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZERkbVVuMGsyRSs1VlhoczdrQW5icW16L2FkVVowb2lOakdRVWlpc1ZsSFFU?=
 =?utf-8?B?SWtoSXpLQ3p1QVJReEwvdjB1aXowWmVtRC9LZ3JzdTh6bFI4WVFWbVlDSHlF?=
 =?utf-8?B?QzdVR2VvVzRTRnBsSUJBZm9pd1VlTUVMbkVnNForUU5Rakd2NU5iY3ovdXBn?=
 =?utf-8?B?RW1odlFyekE5N2hFZ3pDekVrMVFxUk9SaTVPR3pGU1ZXQWYrUy9oS3JoZ3Rl?=
 =?utf-8?B?Y0xWUytGSW16S2ZibjRUR080N0RxRGFid3FYVlRFL21FQTdxTFJoRkdUVUdC?=
 =?utf-8?B?STVoV3lZYTFvR1NBeGRtZTNrMytXZ2s2dTduWkd0UDRTLzFPcmZXMXo2YkIv?=
 =?utf-8?B?WXorNURWUjQ2NXdWSUJJSWZkK1c2bi9hM2h3dmh6RDVjT1Y3Um1obXp0Mld2?=
 =?utf-8?B?VzYwOUJJTDJ4RGp5R0dHRDNxL08rKzlxSm5yajUwM1JVRkF3citMeS9ONHJ4?=
 =?utf-8?B?dTRGOS9wSmhSN2VTa3cvak5tRWZCOHV0WitYRUhZc3dYT09tTlNPR0V2UDE3?=
 =?utf-8?B?QjN1VUFDK1RXMlBudTJ4ejA3cGc5T0NyVzEvNVdhYnI3UzFBL1VucGowbis0?=
 =?utf-8?B?T2U0QUQ2bTNiVTlWSmdyT2c2aFpRblAxajlUOHFkOUQ2dFo1a2VQSmExajE1?=
 =?utf-8?B?VUVwZ210ZnJHZmllcmNzSEtEbUF6bURkeHEwNWEyMm5MbktvTWk0WmM0VkFl?=
 =?utf-8?B?NEUrMTVDZG53TkE2TTdtdDZINHcybTZTR0xhWEVjaExxSUE3OEoyQW0ybzdu?=
 =?utf-8?B?cWJHcytacmNBSE4ydTdTOTYvL054aHN0end3RXljendTOWo3YzlmSDRoRGh2?=
 =?utf-8?B?aDhFVC9tZEJoeFpZMTd6Qy9JTXFNNmk5TzFNS1JQaVdRQU1ad2NJalY5Rkti?=
 =?utf-8?B?TmVBTHBrSVd2STd6Z3hwUWhESlA4RGhNMWRPeEJYUnViZjNTUGhKckVvMk5L?=
 =?utf-8?B?WWE0d1dRWVRvdlFNTTl2bXAzMk5QMVdRTi9semdERGtnWmdRR3plRng0c051?=
 =?utf-8?B?NGQyY2NzdG1JYVBiR0YwUGlEeTBkb3F0WGdhRUdZakZKRDFnS2lqejlkWklz?=
 =?utf-8?B?cFFWeDFBRUhpbmF2M09xcXVHbjgxQXo3R2tkbG1lU2V5aGFoN2lVYmxOdjNw?=
 =?utf-8?B?N2Y3dnBVYnF1YlpZb1N3TmlxTFdLSXNBdWdGQks5OFZabXRnbkpxMlY1OGVr?=
 =?utf-8?B?T1U1RXJPQWphaE94dGE2THVSQ01wVVNLTVc3ZE1XZWY2RW9XT05ja1hZV2JB?=
 =?utf-8?B?NUVFYmNhV3JBdTVUVlhkak41dGZaRFowSWdYNnNjZHZvMkltTkJnUXBKNndw?=
 =?utf-8?B?MDNrcnlqNzF3Y1h4emZxNjI2T1U5OWoxMld0b3VLMGJaMndJd211dGVVaGZN?=
 =?utf-8?B?amRQb3JlRFV5L3hLQVlZVTZvTXFPNzNBRXNLM2NpYjZodlloOGhnVDdpU0JS?=
 =?utf-8?B?dENVcUdidi80Vis4YVNhT0pFUDRkMEhPVnJ6bzBmdmJyOCs5VjF3TmJBeTM5?=
 =?utf-8?B?bWdpZWRWMkdQZkhLUnlYZldYTytQMktkTFFTSk1PY3VZNHA4dS9PNHB2ZU9v?=
 =?utf-8?B?YnNvUkxvZjdCeUIxMi9jeGc1WHU2c09RY3JnekZwYk1KZHFJRGlZNjNPYytV?=
 =?utf-8?B?NmFNazdLU3I1VFZpYnBMeUJrMnkzYm95UndxT0NvRkdSUkFKNWx3M1VqN3BM?=
 =?utf-8?B?Qk5ubXg5aFpBSW1haDZLSzg3cjg1cnFzVm1icSsxUTZZbnZxelpvbWh0RUlz?=
 =?utf-8?B?NWJaSms5ZzhwT0JheU5lQlZPNyt0MjVRTm5EVFp0Z2lCQkNQdzdIUVF3RnYw?=
 =?utf-8?B?c2NUc1dMbTh2anRwQ2lOTDBqclhDV0FGa01DbUwyQnhoZ0lxTXk5cXplbTJH?=
 =?utf-8?B?WitTMUlyUU5rQnd6YWtCR3ljYkRRK3hqQUJ4Vmx5dFdnOHBPY3lWbnVaT0Nm?=
 =?utf-8?B?THJpSjVSRCtmc3cxQ0FHL0d0dWtmSTNQd0xReXdlcGxsNXpIcXE0VjQvd1Bt?=
 =?utf-8?B?QUxSU1BJNHcvd3Roa0prNjRLOThqT3JBa2VUQ2FiNWs0UlYva0ptQlh1dGlV?=
 =?utf-8?B?Qlh4Y25QU1VDV21sekZkaU5wMVloc1JvSm1YNm9yWnhpOGxVVFk0Ymo1aEpO?=
 =?utf-8?B?VFZnVHVhcHpiREVlbms0eEE2ZzF5b280aEpnRTNuekUyaVVBUDU3aXpKUEVI?=
 =?utf-8?B?VkxtbVZ1QWs0VmJmeEFMOXJxenNLSkxTK0JXMk9abi9KQ3ZEY2FObDVHTGQr?=
 =?utf-8?B?cHFodng0N3hPenllUXZrbnJvYjh2eS9tQ2JjMktkcE9aWFo0NlZVUzQ5bWhT?=
 =?utf-8?B?SGNGMVVBYTcvLzZZQldLMXp1TlVRSGwzTDBzRzk5NTlCajJLY21Fdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 095daafe-5f9c-46ae-6acd-08da116f4943
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 10:31:29.5481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f24AZxJriPHhxBG8HwBytQY0J6r23ZWEafu3nrUyj1grKH2xvxsLywg2qGI2ipzYv7Rn91lLEJaE0dCeJofDBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

On 29.03.2022 11:37, Michal Orzel wrote:
> On 29.03.2022 11:22, Jan Beulich wrote:
>> On 22.03.2022 09:02, Michal Orzel wrote:
>>> --- a/xen/include/xen/xen.lds.h
>>> +++ b/xen/include/xen/xen.lds.h
>>> @@ -5,4 +5,104 @@
>>>   * Common macros to be used in architecture specific linker scripts.
>>>   */
>>>  
>>> +/* Macros to declare debug sections. */
>>> +#ifdef EFI
>>> +/*
>>> + * Use the NOLOAD directive, despite currently ignored by (at least) GNU ld
>>> + * for PE output, in order to record that we'd prefer these sections to not
>>> + * be loaded into memory.
>>> + */
>>> +#define DECL_DEBUG(x, a) #x ALIGN(a) (NOLOAD) : { *(x) }
>>> +#define DECL_DEBUG2(x, y, a) #x ALIGN(a) (NOLOAD) : { *(x) *(y) }
>>> +#else
>>> +#define DECL_DEBUG(x, a) #x 0 : { *(x) }
>>> +#define DECL_DEBUG2(x, y, a) #x 0 : { *(x) *(y) }
>>> +#endif
>>> +
>>> +/* DWARF debug sections. */
>>> +#define DWARF_DEBUG_SECTIONS                      \
>>
>> May I suggest to call this DWARF2_DEBUG_SECTIONS, to make clear no
>> Dwarf1 section is included here (and we also don't mean to support
>> such debug info)?
>>
> As this list is not full I thought we are going to add DWARF1 sections one day.
> DWARF2_DEBUG_SECTIONS would mean that we list sections only from DWARF2 which is not true
> as we have sections from DWARF3,5, etc. 
> Maybe we should leave it as it is but modify the comment to state:
> /* DWARF2+ debug sections */

Well, yes, but only in a way. Dwarf3 and later are simply extensions
of Dwarf2, whereas Dwarf2 is not an extension of what originally was
called just Dwarf and now is commonly referred to as Dwarf1. I'm
fine with a comment saying Dwarf2+, but I'd like to not see the
construct be named just DWARF_*.

Jan


