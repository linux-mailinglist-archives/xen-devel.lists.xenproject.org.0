Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE8E5083EE
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 10:44:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308994.524942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh5we-0002TY-IF; Wed, 20 Apr 2022 08:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308994.524942; Wed, 20 Apr 2022 08:44:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh5we-0002RU-FG; Wed, 20 Apr 2022 08:44:16 +0000
Received: by outflank-mailman (input) for mailman id 308994;
 Wed, 20 Apr 2022 08:44:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nh5wd-0002RO-Bj
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 08:44:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d089841-c086-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 10:44:12 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2058.outbound.protection.outlook.com [104.47.9.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-YyH2zUmBPhqKo9Iyvfi8jQ-1; Wed, 20 Apr 2022 10:44:10 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB4431.eurprd04.prod.outlook.com (2603:10a6:803:6f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 08:44:08 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 08:44:08 +0000
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
X-Inumbo-ID: 0d089841-c086-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650444252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NTFusKZ4cbi3kBlkqkpKnfA3hvI9tKTF/dHM/jhK5+Q=;
	b=KIyELKuQlCnXdG7eQk2vFD62vpLUFCgw1MsIb6fFce8g2bh/Eidoagcp+6IX7iiXdPtA65
	QaOoC+Le1+d9a3MCR7wYCX1GmeBt239F46hXRBVj35o2QvcfYSWoWeU007AznqX8kiJeUY
	2bFodVBdzD1maDzkZIe5cl3rb9EZD3U=
X-MC-Unique: YyH2zUmBPhqKo9Iyvfi8jQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAq7/Z4dPemCpFunou+mMP5caV/9zZNUdHMUlI6q47YfjlN3jPDBu4blJn2DIxxyIWnJxx8uJjsxWLqVgZlgrCEvT9tjE75UhXr1Vmq1MKUjylKCsUwwGTYRrF5sv7pc7Ty8EX2xJT4gTxXWJ8wE9b1vOs7xPdxQVCHKHiJbxgXfu4Q4upC/4MKTkbBeIoEmsG+IxMJXZll8G+ghxjh+ACKXgpfv/JJd+3Qx45Xl5LuG9j8AK5mALypU5KfITyEf6k5ByG7wTGQkC4jvljJqv/IgEF9uIMTWs3omYIU2EqEKw9zmFnAGj84Vyxi3y3p7+KUccSb8nPFaZgdRgB46cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTFusKZ4cbi3kBlkqkpKnfA3hvI9tKTF/dHM/jhK5+Q=;
 b=Z/Ee/OBkUs/z8DNdopJIoBC5uBxzrnjNDtgIomP9gYmFDUbVB/I0SuAdYrW6j8nghvt5tbLMg1u4X8yF4idCqFsDYHd7mF9B9WBJU4dhKEfsxm1sywm92riX70BchC1M1UoxychiSKzw1nUM4ojtCD5MS76v7QKWnAjUhLz2SW3IE4o37cnJh5t0dofXq2qbj1dd3AOnpV6yfWN/ycFZwInTfOhi+S3ir0ckJFiZZRVxKuDgtk1q6A6m1IJhCYlOASS9ZA3Cv/dtjsqeGjQZqye0ENFc6J56Y058+ER0bRrvIi2+4ejnPc8VLOdNsNe1OEyftdY8/BsAlANV/lzIWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1c6196c2-1faa-efdb-1dc7-6dda3c426dfc@suse.com>
Date: Wed, 20 Apr 2022 10:44:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1] page_alloc: assert IRQs are enabled in heap alloc/free
Content-Language: en-US
To: David Vrabel <dvrabel@cantab.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 David Vrabel <dvrabel@amazon.co.uk>, xen-devel@lists.xenproject.org
References: <20220419150134.64704-1-dvrabel@cantab.net>
 <c65c58d3-e553-4247-680a-4d072b1c7c05@suse.com>
 <4c40abc3-10b4-a1c1-8bfe-5ac8539f1075@cantab.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4c40abc3-10b4-a1c1-8bfe-5ac8539f1075@cantab.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0137.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::22) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18d8babf-3022-4f6b-980d-08da22a9eeca
X-MS-TrafficTypeDiagnostic: VI1PR04MB4431:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4431F0970CE1D396CF4914E5B3F59@VI1PR04MB4431.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JjgxEEwOldVptpbh0TwYgCjR8Edkbz6a/P4rstofA8xIPlcLKmLLl8bVnDfs0VDVt/NlgWgnGWcE+ehS/5qhRA17nZyt2rTJt6Zm+xwLgS6B4XP+C2/ZDMNsqnWG0bxFpKjVuFibaNbvllPsNe/F8HPjMXpTccSgrwuhQvt2qwuSACJiG4N1NaSHmpJ7Zr6aMhzHqcDPN0GwIlRHqEIsPtNCMAL0BzFtCu5xNlHntsTz41mHqHndxOtIJtJANNcVkynVkhcLw9Cwt8acGI+KCUsmuqE1dLGZ8iCusBJEmH8hzqrgPwqGZHgGsicu1LJC1T6UjIGXEwPi1ZK4TluQL9kUkBvW+8wYe+CIMw/PV+2z0MMMi9gabH+0kjCtE4zpPqRYab8cGn92rsBcysvCQovmJM8BomU4G2eLUFCf/ABkN5EEsBHi7vEwFpaj5nftj1R3zhXDTozgQI2wrig+DzI0SWnXHo2g4qHOJPMQe5y99vXCdeGQYIXBRLeRxnvxJNTgYjRoSMOtxyNXCJ3xs3K6VBRqOmv1kdfGc2TwwWy78umBfLxkZrwI51Bo5+CP+xGeFoWq7G+v98Ebvfp1wxEcPB9NooYsb0wDnspsZs7ab6lwRskz/LyWUt0bzMk+Q2xaCRtd06Jua3gQefW/KBVd4eLV0sWItVresBVHw6RAS2lJKNZjT5QPWot+KTiWlBvSLU/OxbKJzVlS8znggn6+3IT6kNJFz7Z1RTVm9OA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(4326008)(6916009)(6486002)(66946007)(38100700002)(83380400001)(66556008)(316002)(5660300002)(66476007)(2616005)(31686004)(8676002)(86362001)(31696002)(186003)(26005)(2906002)(36756003)(6512007)(6506007)(6666004)(8936002)(54906003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUhtMEhVSzRQaXdiR2NPUDRlV01nRkpMNDMreUIzdzJRY1NqVjN3WTRMekJ0?=
 =?utf-8?B?OS9BMWw5enBISDhNRUVOZmJ4Z2h6UGIzUWhDemxNMm1sMUpPWDQwVVUyTGJV?=
 =?utf-8?B?eEZXeHR0bVBnaHI0Q2RHU1FybFlGSFNVRnBTY0xnY3ZCZCtCOVRUZGNrWk9w?=
 =?utf-8?B?VzcvY3F2a2ZIM1B5QWI2bHo0V1Frd2pQeUNhV2M1Z1RyT3Bhenhabk8waGxB?=
 =?utf-8?B?TWUrN2VjM2o1QktOaW5NVXM1SGx2eUk2Zm9xVk9ScExycm9hdkxvL3UvVFpM?=
 =?utf-8?B?RUNINHNKNFdDMTJ1TlpqRzFjSGUyMmQ5dzNlMWVQVU1TcTFHOHV1c3F6ZDFF?=
 =?utf-8?B?ZmkvUHN2WHkwZ2dYMFNSRCt6UTY4bGhGSzUwVjNXRWcveWM4ZHJlSzNvamJW?=
 =?utf-8?B?ck9Wa21nNjQrVmRBVno3dEtZMGViMjFwSHZtazBaY3EvN2paajZRc3pzUFhR?=
 =?utf-8?B?Ym5BOG9HOUFKSlJKdVdjWnBROVNLMmFzc3RHQTc4WVN3S1FSUEIzbDdIRzk1?=
 =?utf-8?B?bkNtN1ArL3djdEdSNUVSOWcybWc5QnJZemNEZXVGalZuQTVlR2FhZ00xTm11?=
 =?utf-8?B?OTJFQVJzWktKbFhZeXAwREU1TE1NR1dUZnR0MDJxU0xJR2tvM1FQTmhGYUdt?=
 =?utf-8?B?RWhPdFZ4Rlo3eGEyMTFqUDJoREUyaHQzRTlGUDc3QlE1NGlsQnNTVW4zTU8v?=
 =?utf-8?B?NFgvSHErbkE0S0s2TitaUTR3WmIyUnBNWTVXNlpLN083RGNZYWFpSGtjUnhh?=
 =?utf-8?B?S1VkQjlwK3VBeWJWK0FjRUVJTzlMYkdLK0M4NXVSVUJEd2Nid3JuVVdPc1hj?=
 =?utf-8?B?VlljUnpFVTFwR1hRTldSaFhEM29JZnhsTUlJOVNZOHJBTW00eStWZUZUeHJu?=
 =?utf-8?B?NU5YM0NQd3lqa0xCc0EvK2dEQzZ2c2xWVVhlTmNKcFNBN01OWlVkS1BxT2tn?=
 =?utf-8?B?bFhOL2ptVzBVUkhnTHNVSG5ZOWo5cEl4ZGJzNHBsYWhQZlBUazFxVHVodGs1?=
 =?utf-8?B?TGEremtaTDA0NUtkWHNjOWdJbmhmQkpyczZaUkhlaHBHZFdvN3B5cXgxR3Rq?=
 =?utf-8?B?MUpac29mS2xVcFViR05sS2ovbUQxQU5RVnVlSm1DRUl2SmNEOTFaTHkrZnhR?=
 =?utf-8?B?WjRaSVppQ09RQUNYQnkxTE9vRlRESGErRG9RbEUvLzcycWFYWTl1VTRCd1Ey?=
 =?utf-8?B?RnZnMjZhd3N3RXZsZ3JYRmpKNlc0Ty9FMkF6ZUppRjVVV0ZSMWQvb201V28z?=
 =?utf-8?B?UW9PcU00VzRnSjU4SEZRUnlWRXM4dER1Wnd6WVcxZWRCZW0yb0h5dkE3SnpR?=
 =?utf-8?B?Unh0MTFkWEIwVjBQNEl5aCtXSWtRdkUzK1JaUCtTd2RNNHpQemFIWk5BZU1M?=
 =?utf-8?B?OHlFWFcxOUtzdE80VWM5cEltOTd6dzhseXROZ0RicHdZa3JaQlFRZ0owNmVH?=
 =?utf-8?B?V1BwcVl1ZDFvd3ZOdDhHWSthSnFwWHJENlpnTTNZVGtzdVNVN3RQQlJrU0xC?=
 =?utf-8?B?Qk5NSkhRcktlSHp5UnV3ZkVyckVWdk9jdTFZRmM0blRXdDZZWTd6Q0RaZWRL?=
 =?utf-8?B?V2lueDBLUnlNdUp4UmFQU043UGFsTDV2VlVNOTlsZWpFaG9mZ1lLdXdYQlYy?=
 =?utf-8?B?TW9yQllKNElrNmREYis4bGVqVW5ENlUvNHZuQVlIN2FQUy9GRndxNU5VQXRL?=
 =?utf-8?B?SUFqYzZHUjVmdE5ML0ZxdVZrNHord0NRQVlESDUxTGRtTUE5NjFpMkl0RGNy?=
 =?utf-8?B?amlMdGx3dmpjbFV3VnQwZEJlcXA0YlBibE5HbWpiTWRkdUFBWE9HWVFxbkxm?=
 =?utf-8?B?UmdVbXJiQXAzbmMwbW9ScFhSd3d1WXFrTVo0MnFVSUJOZEVpbmQzQUdLbzhj?=
 =?utf-8?B?ZUpTYnBsL1lGbUttUjltVWRlU2xTdUZqeUNnRjgxZ0xWNnlFV3ZIQVNHeTIw?=
 =?utf-8?B?R215ckc0NE52RjRCN1ErZmZKZGpaeFI4NjMxM0xDbmZiV3dVTjM3RGI2VzNL?=
 =?utf-8?B?bzlJK3cyK1FUWTE3cUVnRVVTUWNlWHNXMHRmU3ZUSnBZR21qaUI2aE9paWZP?=
 =?utf-8?B?QnUvMlJ3RlIvWGxSUE1KMUNEdlBSZkt2ckNpb3JxM1pOK2JWeXpZaTExM2Zj?=
 =?utf-8?B?NFFIWWphdXY5Ujk0dkdBOS81ZzBuNkRXRk55Q1E4eDBxUklIcVVnTE0xQWYz?=
 =?utf-8?B?eDNzaktoTXpPNEZ0ellpek9YVk5kamE3R0FPSzZDSkE0ODY5ZmgxaDFlY2w2?=
 =?utf-8?B?c0dDbnRkK2lzR2ZLYXhBL0JJbzlkTkIyMFpiMk1IdjdwcWYweGZpN2dSUlk4?=
 =?utf-8?B?YllLTXg2VkNwL253Mkxackc5M0tnZG9BeFZzOTFaYUdHSjF6L3A3UT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d8babf-3022-4f6b-980d-08da22a9eeca
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 08:44:08.0073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AumpMZrEnQN0GVHWr9CwWuzJ1mpHYCXFJoGfyYpM2yjzLyXPPZBKBW51zUhE1pRRVBClPFg81+TDFoJHmOZPug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4431

On 20.04.2022 10:13, David Vrabel wrote:
> 
> 
> On 20/04/2022 07:26, Jan Beulich wrote:
>> On 19.04.2022 17:01, David Vrabel wrote:
>>> From: David Vrabel <dvrabel@amazon.co.uk>
>>>
>>> Heap pages can only be safely allocated and freed with interuupts
>>> enabled as they may require a TLB flush which will send IPIs.
>>>
>>> Enhance the assertions in alloc_xenheap_pages() and
>>> alloc_domheap_pages() to check interrupts are enabled. For consistency
>>> the same asserts are used when freeing heap pages.
>>>
>>> As an exception, during early boot when only 1 PCPU is online,
>>> allocations are permitted with interrupts disabled.
>>
>> This exception is tightly coupled with spin lock checking, i.e. the
>> point in time when spin_debug_enable() is called. I think this wants
>> making explicit at least in the code comment, but as a result I also
>> wonder in how far the extended assertions are really worthwhile: Any
>> violation would be detected in check_lock() anyway. Thoughts?
> 
> I was caught out by stop_machine_run() disabling both interrupts and 
> spin lock debugging when running the action function, so check_lock() 
> didn't help in this (admittedly) narrow use case.

Oh, I see - fair point.

Jan

>> Furthermore I'm concerned of Arm not using either SYS_STATE_smp_boot
>> or spin_debug_enable().
> 
> David
> 


