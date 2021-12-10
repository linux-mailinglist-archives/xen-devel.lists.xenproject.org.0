Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E07470222
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 14:55:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243910.422022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvgMN-00080M-1p; Fri, 10 Dec 2021 13:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243910.422022; Fri, 10 Dec 2021 13:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvgMM-0007yc-Uz; Fri, 10 Dec 2021 13:54:50 +0000
Received: by outflank-mailman (input) for mailman id 243910;
 Fri, 10 Dec 2021 13:54:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aCrA=Q3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvgML-0007yI-Kf
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 13:54:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd39a283-59c0-11ec-a831-37629979565c;
 Fri, 10 Dec 2021 14:54:48 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-cpB0g7vzPfOOelMY6jrsmw-1; Fri, 10 Dec 2021 14:54:47 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5742.eurprd04.prod.outlook.com (2603:10a6:803:e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Fri, 10 Dec
 2021 13:54:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Fri, 10 Dec 2021
 13:54:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0502CA0004.eurprd05.prod.outlook.com (2603:10a6:203:91::14) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 13:54:42 +0000
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
X-Inumbo-ID: bd39a283-59c0-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639144488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bvQaTh/W4/ZFBNazhXfSywTqj098D6zTo+tO7eNR/ws=;
	b=kyO0qf1wHP8Awx1vUBW9YBRKAYO73cTZZs7xJe7p++tse96SxPUVon+kmy4JsZF5qQuKAt
	aPp9WkBtrKLugjeumL7dsb/CZ5jcGcYJDRi0dnLzS//QYwJKZTxP9cCMCvvNn2KYamsCTj
	3o1Wb3l2GGODUDV370GY90qo8cIa3QA=
X-MC-Unique: cpB0g7vzPfOOelMY6jrsmw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U40sF20vGotss51JPNM6y53Fl5AsddQy6uhRWfkPedtNBgHO6CqOI67eNG2Fr0pXwqeXDNQVt6sPEqJEZXNFh8nqK1X6EWKsIHuwGK0AiXNaGGs7oi7VctYafn1XdN5Tjg1i9iupQXRBqBpBI1j9lldYJ8qfC8tMJuNHLdHMhB+SeqmzkwbH947QaJ33r5Dfk8C6Nr+7RrQI2rmehsE4MVmi/232pYXSD5kJdRBwIX8SSosgNIz8PjTeLuYN4+AcHRTbegGskbTE5gquED8YKlfxLlhZIGKuPJDxBln0OcPIwsTEQxOVgQSL0BV8StnNOBS7S7dNazKGqSwZuVpH+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvQaTh/W4/ZFBNazhXfSywTqj098D6zTo+tO7eNR/ws=;
 b=HdoxRSo8957hZ6kZ8xVUqnhTahJHkbiFqzXOXxjU3l6LfmqxhBRfZhx+i4VW9J+KmZ+nx311b7qsVXG6QQIgtO2Ef2ml7PXA63ohSoexRxnMkH4NncEs0AGnahDc2VxQPevICf9yiJX3tWiViNLvFyf579QFd/jrWZgxKnH7hb0GbTtUbHZxCv0X/lP83PZ1gnYSc1Sdj/8USlSYx9w8BwcPvfnjJLAVOQaEq8LYcMSYc6yvTwpS9I1nOQzdANu3/4dXUlWLkisirNdpia9Nk+OMOhA8IqGcpV1NzpzFjt+MBW+4FDKrSCNCW3vBsvNOCTttZ+4C2dKbWc3d+soqbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d23a7603-47c2-43b5-5365-02f437fd46b1@suse.com>
Date: Fri, 10 Dec 2021 14:54:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2] libxc: avoid clobbering errno in
 xc_domain_pod_target()
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <ac9ffddc-b102-9876-7a46-345078c3423c@suse.com>
 <52F30125-172C-4AC8-B3A6-104D7914CDB0@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <52F30125-172C-4AC8-B3A6-104D7914CDB0@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0502CA0004.eurprd05.prod.outlook.com
 (2603:10a6:203:91::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2881e67-a61c-4584-8b62-08d9bbe49e47
X-MS-TrafficTypeDiagnostic: VI1PR04MB5742:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57422AF438DA1AC47FEAFDCCB3719@VI1PR04MB5742.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+JOPWcxrnKSJ7h+W20eJ6O6id5t/0J7WY8AqIrCFpmV+ipHEoLwKdR4KGbtC/a6k7MbRxfsPr3jON4dBVcqw9elm02f8s8h5/XWtp9+jAL6dBHsLIHQqg+uTGs8+yOwAPKYfBY0bGxiAHD7ADqDT7fiop8Aj9ifB0X1KQwt4dRzp0nnUqRrpB3zn3tK2m2Xkvhif9VykghpnHHaceRrJXfzZRp2vKEgPabbjRiWnRIjrwwASW2YBriNon+iMiPJ6tNJthOeGwxiNNN36gLoyS/KZKU6kPQtXoy6I6eQtx+WZpAb9vZWXxpBUuRK7W8bPVn4D1JwnpGu5QzeMWCbS2FQUMJyrH5HbWjacadpCUVxuax2wGJd4SDCz8iAdvD4UfOhar4Vgce+rH/9mnK/YyVvaIDMfzHSbybbMzODOvp7plBePAE/omgawO9G/szEkowZzIv0bEWB2UATM6lkKZtjwtUw1f0DeVJ2O3Ku3+F1Zq3GNJ9Ls4R9e03jt7QHihM8wq8MF0OWwrTMQQkHFWhW3Lx2xclaqJ/0pWEnxe3dsZ8qxJMUXFddGdTxtye95GyWs0D0hbs1yXxnPPkIgswu4Mf4Xm5ZNtADPPq5c0gaZbEHDSBPGWJ3ePzy9Xeugtwbui1OGH40LXFxdBEoUp8aVnn3jndlJK3QLHY3KMgSRyKsf7CcA9s2vmTLteNLta21Ozzn7ycpnIGMoPoBcowFv1iY/l/vKW7QE/sb3/3fOc+D61oYAijCrhw19mqlc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(5660300002)(86362001)(8676002)(186003)(6916009)(38100700002)(6486002)(53546011)(6666004)(4326008)(956004)(8936002)(2906002)(2616005)(16576012)(508600001)(316002)(31686004)(36756003)(31696002)(66946007)(54906003)(26005)(66556008)(107886003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEVadDlCMmxueEN1TkNObGZDY0dOdkhzSjJ6UVdNUFVFL3Erb09qa05yS3Bq?=
 =?utf-8?B?aFBGa29wZEQ2UEd4N2RYM21CWVN1T3A3aDQ5Ni9rS1BlcWhtZGF3ZXNIR09J?=
 =?utf-8?B?aHpscnZKM0IyUHUvYmZuU0pYOWszM2lmM2lUQ0M5WmFtR1dKbHE4QkNGL2tS?=
 =?utf-8?B?ZXcyeDl1akl0NE5vRnlnYmdJZFRleitqcWNkMmVUYWFqVDBEOE9xL2p0NlJK?=
 =?utf-8?B?S3N2cVYzYSs3M0pBakcxd01DellHcGY3cThLWFJUaUhuTWxPcWM1bmlnNlNG?=
 =?utf-8?B?VHFDQVlpdzBzbTl3MHdmVXY0QmxUUmJJdWl2RTJPOVAzUFd2OUxuUUd6VVVT?=
 =?utf-8?B?WHRCWnFIZVdFUnVlQWE1Y2llVnljd2czRU45Yk1HMk5YVHFCR1lKSmlSaml1?=
 =?utf-8?B?U0J3cjdVNjBmMFFNbm9vTkZMQzJRamNXQjlxS3dOS2pvYlhwUjhONThVemVr?=
 =?utf-8?B?N3hCbWlJellPVmFEbmVpOHV2R2R3VjM4eVZhQ0FwRkxlcjhsTGcvQlMrTmMy?=
 =?utf-8?B?eVdSWWNNUmFNUWJTRG5xdHQ4YTdFUmpmVks0QTkyODcwZDdmTDYvYWhVRlUx?=
 =?utf-8?B?Uk0wV2RqTkZuK3FwWTd3OFhzdW5pUlVCRzFQbWpTRTZCbVF1d2lvbTZmQ2FC?=
 =?utf-8?B?ZFpYakVScE0xbFo2bVlrVHBFbFZVeXhvUXVVOEV5dENiaVRZSVNBRTNwNmow?=
 =?utf-8?B?aFJrWUlQQkNWUXpBNm5XQ2M5TGtiRTFUaHY0MjNvTlFvbmNJazlrZmFPd2F6?=
 =?utf-8?B?anp0NEFqSkhBSTc4cnVkTytWay9maVRJUjkrZzB2eERuUjczMFlLd2pXMnQz?=
 =?utf-8?B?cStnY3FNaVNYc2h3MVE0dXJGOFBZVmppNnFOMHI0aWNYYTVMd3dUd3VzUjZN?=
 =?utf-8?B?YVBKYndKUXpXNjVzNS9WZFBXeFVRYVE2NkFBQ3lpcVlCMWJ4T1hVcTVlK09l?=
 =?utf-8?B?K3RZSFZNcVlKQ2kxemtxNFcrZ0RqeWRJSG5JQ1AreFQ1clZYR0lFRWJ1eWtk?=
 =?utf-8?B?S216WVZRMGtUSTJ0L0cvOUhMd3l4K1Qra0ZOVGxjTWJqeGFuam5ZZmk2cG9l?=
 =?utf-8?B?NmxVNVgzeGFaZ0RZUDBSNUhoZlJlUW1XYllsN01uTlQzdTh3bDVNUC96bEE0?=
 =?utf-8?B?SkI1djBoSnRNQm5CSU42ZFhXYnJCQ1IzZjAwcVpsaEVjUjVaR1NjdDZ3d09L?=
 =?utf-8?B?WHFIem16ZForSjZiVlVnc2l2R3N1U0JKSndXS1BLYmYxZ1FCaUl0ZVVvenk0?=
 =?utf-8?B?MllwYVRidzNjVzliNFBCWHFOYmNQWnNVeW50RWpmaGJvTVJJUjE2TUxLcVdH?=
 =?utf-8?B?TlhwU1N5Y1FrcWtWanJRNUxSdHlCZDF2K0dXajFJWE14aDJTckZ4UE8vTTR5?=
 =?utf-8?B?akdIb3B5bkdxK2piUjd3WENPL3RJbkpHWnpIcUtUMHpxUkVEdDVFdVNtcGtI?=
 =?utf-8?B?RjVLYlVTVkJLdGFFRmdLK0hCT1YzUG9zLzJFME1nRWc5YVQya3p5YW9Dd2Uw?=
 =?utf-8?B?ODFheFJxRVZCbmpteEpkV3VGdW9QWDgyOGFHUlVnbjhKOEo0L0RiU2h2OHBY?=
 =?utf-8?B?Z0hlSnlTVnY3NFZuTnVJc3h0VVN4RTRIa0hBSXZWZGkvVEhqZUpodllHUmxh?=
 =?utf-8?B?dlNSQUVEcG4rOEFkby9sdVYrUHhhY0ZPbUtUUHVBajdwUVhGUm8raWJyQWsx?=
 =?utf-8?B?alRwdlBJZ3VHTldtZDk0MUdhQjQyTU5lTHJHWjZxaHQ1TUhDbXJncG9Ed1ND?=
 =?utf-8?B?WXdob1hhTktNNGlHT2ZTcWJwRGhya0dVSXVzTDh3ZWF0RHBoaXU3T0lqV3JG?=
 =?utf-8?B?T0xPMUVnVnJLbWhJT2xVSEk4QTNpdWhzRlJvakIxZ3Y2SW9SZmFCSWFwQmw5?=
 =?utf-8?B?N2NRaHF5aVJGSE1PWEFZckgrZmxPbDBOOUg0aGNKTzRtbjA2a25wY1hUTHln?=
 =?utf-8?B?TzRjcmQ3cGcwVWNzZ3N4SWdFOXRhbUgxNiszS0xuR3lZaGJOendTajZEcTZZ?=
 =?utf-8?B?QVZ6Zk8zeXFmVlhJZ2pLaFZEU0dVY25MUStKUmpBWHU2cC8rTjR0anJiekFr?=
 =?utf-8?B?VU5ndHRhK0FqZTIzdkJSa0ttVXpjRDRYS3d6SkhyM1lVZFF5SzVsUzNSTHdn?=
 =?utf-8?B?SHdvU0JVM05YSXFVNS80ckZVQlFvc3ZqSlNPRHVLVVNCdTFtLzZMUE9XUnRX?=
 =?utf-8?Q?L3kpReIikwLu2ODe4AFus5s=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2881e67-a61c-4584-8b62-08d9bbe49e47
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 13:54:43.4450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7HkDXvAmFXv9ae75g6920TfVEQM51i+JsMTbH9jl1Njg4QE1samQo+zccNt3WvvIeg1gl8KEone33cn3VN0udg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5742

On 10.12.2021 14:50, Bertrand Marquis wrote:
>> On 10 Dec 2021, at 13:11, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> do_memory_op() supplies return value and has "errno" set the usual way.
>> Don't overwrite "errno" with 1 (aka EPERM on at least Linux). There's
>> also no reason to overwrite "err".
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks.

> But if err can really only be 0 or -1, I do wonder if the else forcing err to 0 could
> be removed but I must say I have no idea if do_memory_op could return a value >0.

Indeed - see ...

>> ---
>> While the hypervisor side of the hypercall gives the impression of being
>> able to return positive values as of 637a283f17eb ("PoD: Allow
>> pod_set_cache_target hypercall to be preempted"), due to the use of
>> "rc >= 0" there, afaict that's not actually the case. IOW "err" can
>> really only be 0 or -1 here, and hence its setting to zero may also be
>> worthwhile to drop.
>> ---

... this.

Jan


