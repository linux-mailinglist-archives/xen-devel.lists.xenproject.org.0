Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CECEE4C2C85
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 14:04:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278232.475407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNDn2-0001uN-P5; Thu, 24 Feb 2022 13:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278232.475407; Thu, 24 Feb 2022 13:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNDn2-0001sV-Lm; Thu, 24 Feb 2022 13:04:12 +0000
Received: by outflank-mailman (input) for mailman id 278232;
 Thu, 24 Feb 2022 13:04:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNDn1-0001sN-KS
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 13:04:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41d304ca-9572-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 14:04:10 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2059.outbound.protection.outlook.com [104.47.5.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-XSM-1TjPNPmOSlRJz3gR3Q-1; Thu, 24 Feb 2022 14:04:09 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PA4PR04MB7662.eurprd04.prod.outlook.com (2603:10a6:102:f2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 13:04:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 13:04:07 +0000
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
X-Inumbo-ID: 41d304ca-9572-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645707850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2WuumZucJz4sXSydEPYHjq1IVRJ/Q3Li9fOh+beuZHg=;
	b=Ezj1cahYm4PxcFcLfNtrfoqzBNLiHPn1ER1lFoN3wfHTnkK18Rdeh461tR2NSuECLwa9CS
	saWeep+ucLmjEghalCIYUxwj6vTY4Xbw14cD/ncP5/xNYqxTWerOfNMom4rEgCRYkxSQV7
	65KBdFRuwrkC4pN7OI0LnErkUk6YPNE=
X-MC-Unique: XSM-1TjPNPmOSlRJz3gR3Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVYYBms1Hg+0If4Sp+qhFJlma5lC8uhAytHqQKHbOib1OPmg1JBqQrVoR9+BfhczkJjIgXX00Yfk8R/gBgmXWrr8187RljMzATPg35PasyV5zIboI4WAOub91uFIQXGuIhOly9nMNgDqJ0xxgAlgVqvk8S+8ZAi/h8uthfkDlg6dm8+BJ4gibjm/oOOYS4b+PT2j59myWGacnlV03ThHwuML1Fenesb9jNYCTrsyv/8gES9WDtdMdfHxBffj3BwzdB7bcC5Wb8a9ohcXwXm+oSESdimC/McYP9XNnu5G3qnT/afaphHQhG87WhLo4uDBkpHFqdPVCuTyE0PMO26oLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WuumZucJz4sXSydEPYHjq1IVRJ/Q3Li9fOh+beuZHg=;
 b=BpvU5Ljpc/dynrO6aXtZtPaAOQURbAdubGUvJ+o/ryUqt4UgNiBEWORk4UjVXYWQb6pEvdaPdzCejEvrtngUyk8PmA4CbcUtxdanr8s1S3YQ6ISVwqY2SWPRnV2GvmHH4/KjC1bYgBBM+lteNM8nt8d8q5ZGlReaQo/3YYqqY3iTA2gq40VG/RXrGswhXDJDxhjgUS0LMCLWnaH0s224B5KPPx6AMHHoFs0uBA0Y47W5YOoXx2VSXg+swTMzf6fHjlxTWSLEv7syhzHbWMCvVdVwaFUDR4wD89aCyf8wC+G+pTkVRY5DXaRochAUxE10EKPdPE3E+MlwO752s1FYlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9a335545-f8dd-b676-0b6d-4b29b786e466@suse.com>
Date: Thu, 24 Feb 2022 14:04:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: =?UTF-8?Q?Ping=c2=b2=3a_=5bPATCH_v2=5d_x86/PoD=3a_move_increment_of?=
 =?UTF-8?Q?_entry_count?=
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ac46f25b-e669-f309-b36e-c4760e10479e@suse.com>
 <5b3f46f3-3c9f-57fb-00a5-94128f41e34a@suse.com>
 <b3a79f29-e3ec-6b3f-e569-5d2679a5edef@suse.com>
In-Reply-To: <b3a79f29-e3ec-6b3f-e569-5d2679a5edef@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5P194CA0020.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b94022d-477c-472d-9adf-08d9f7962429
X-MS-TrafficTypeDiagnostic: PA4PR04MB7662:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB7662AAAE3B0630A558FBEDA0B33D9@PA4PR04MB7662.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6NdAtK5TLNIw38b0k199eiCxg0oS577AXUrQe+Ai8gocp3AIgVv5sqmj+v86P41rPnrTTbi9e01fWka5AT1oF0wSgt0n+Pb21VWj7KrvJRpYtLTIOe4d63nGWeNQMR1doNqf4xbcsFhoEB+Kxdr3RNvIXnE4uJf3McW5bBziAurl13SUW4aXCrJ3kTSmo/tIg4TOa0WaMOsv6+WLrzxbATPpPYPbUK0nQuNfR0tP8zQ0gw3ntFcJP2v6vIIf8RaNdElQtlsYJl1iQQQiOY3DLdISdegkIYRnsnwYXW7YMb6kWemG+vR3WjqWYOSCn1SGlnbhz3kPSkNMgJUcoUKSf94oJwJGgnRBjhuWDzFaG/4Z0VnivRqVr/sTygjxb7DjATmhqmrRlCKBJyB42GJgvdcsvrKATBW3fWADcwXLk2GobMwx9wwbe1PYQZ2kLXnb9VNYNhJFnrVaagxzV1kZzmDi6Ra+zPlsGt+0NSBh2yHEoFysY7xXw5qYnyahk8Jb6N8Z5Zp45tHfBJ4/TQpdfaqxlkVrrMh8QDnYZrEG3wnijGiJtyp0IxOMmb0twzqRizQsiNIi8tdiHV7gOz/gTwFJ5ywIgzctX8Z0pVgzzHM6oWh2ZWCAJaxO23FxVOjgHk40n7RaS4Qnc+v0r7mkS0WfQ468kxcsXGxFQiB7Kaq4iyg1rJDs4o5LcXpMINZMZy2RDJsJx0iX/CpA3oy7HwpgzSpbT81qoqmXfmFWX44J/tD4p9lYNEBx9gXEa02Z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(66476007)(4326008)(5660300002)(66556008)(66946007)(6486002)(6506007)(26005)(186003)(316002)(86362001)(31696002)(6916009)(53546011)(8936002)(508600001)(36756003)(31686004)(2906002)(83380400001)(54906003)(2616005)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWEwSDBuQVoyeUZ2dnhHK0RTNXZKbXRqY0xKY1p3Z2xHNG9mbkEyR3dBbXM1?=
 =?utf-8?B?T2g0RjkxbURGQUp5c3RkOGJFalhnaUpYZnVNYlVGYnh6ZkMrRzBNOThrcFp2?=
 =?utf-8?B?cmhXWTBVYWtVQndOZTBMNVBNaGRJU0tJVnQvY0g4ODBNRkpvMURYTTJYVDIy?=
 =?utf-8?B?V3VuWFh4N2M0VE1hU2Jua0VLVTRrZ29rWW9KOHRBOXFHYUNTdDJHYXA3bUxj?=
 =?utf-8?B?QkhZbFh1RGYrd054R0hyOG5sbS9pWFQ0VXlkUDEvcitlcm1yWGZxdm9GbGFs?=
 =?utf-8?B?dnNDUVRVbEExUUdRdkY1eDZOZjlqVk9jYWFxeklCby9zUWhieC9lT3RPcjRX?=
 =?utf-8?B?dkF0cDFib1lXSXJxSGV1VHZ3MTJBWEtsRmhYNUduNUlaNHIzYUcyRG4xMW5Z?=
 =?utf-8?B?QkNtVGNrazRTNUVJVjgzN3FPRE40Q1p5QmcwRDJ1MEFjUEVUQ3pYekFkcFRH?=
 =?utf-8?B?SDBGMzBLZnRLaEhRMEdmQ2xJanoyekIreTN6VGhUbEM5L2puZ0szUWgzUE1U?=
 =?utf-8?B?cExvT3pDNkRKZWJrTTJVNCttbjFtZEZFWnlvNndpZ2ZIRlpRWkFvMkpGbnYz?=
 =?utf-8?B?UHlUZ3ZLQWpNOVpmYnZaUG1lMXBkdXBuN3k5bHkvTDFGY2hvQkZ3SUdLbXlm?=
 =?utf-8?B?aTY2THFUOEY0ZjVCOGVtSGk1NlRkTHBzUlEvY3RBZ3FGZElZUUdYbjVnWjZN?=
 =?utf-8?B?cFFLY08wMHE4Sy90c29wRXJDOUtpODBlK1FrS0o3STBGMjNidGx2cEtzdVdX?=
 =?utf-8?B?VE9BcjRBZWFBSlREZlFDRkZZZjFoV0dLb2JVZ01xQzR1M1VpVlFmdk5TS3lL?=
 =?utf-8?B?a3FZMzk3WHZoVE1rUStNM0M3MXcyNVRMM1l3SUNJWjRpZnF1ZFdkanJMeVpi?=
 =?utf-8?B?dktwQlBUazJiZGFIc09hR2V5bDl6ZUlaRVdCKzVicmxqeVA1MnZ4RnFTcFV5?=
 =?utf-8?B?QVZCQTlyUFFqdTY3c1VjSWhFSDE5SzdBaEFOcWhVUlpZdGt5dGMvbDJWeHVU?=
 =?utf-8?B?cjliajFXcm5ZWHYzVzhNM0hXKzBNVmppM2Y2c29kdHVvZjcvMHFNSWhGVy9n?=
 =?utf-8?B?cjY5bm5IMnFYcTZ1YUVZSWI1ejAxQkJhTW9uZDlYRGpFQnd1YkxwMVpYczJ3?=
 =?utf-8?B?T3RaS3M4NUNLeWJNVFBCY0xWTk1lZHk3UkxySDM2UEljbkZPNGN5RUVuUEVq?=
 =?utf-8?B?TFdOSW1WVm0wUTBIclFuUkVQQ2JKL3FyQVFoTDZTV1lCWEcwOU5xVW40cTlw?=
 =?utf-8?B?ZmNzQU1YUkJ1by9OV25scXFxWWdKUnZqQk8vRktGWGVVbFl3dUtXWGN3WnZO?=
 =?utf-8?B?cHVlMVUybExyaGdYaXcrWkRQa3plR2VlU1RWUzZ3NVQrTjl5ZDI3VlN6cldD?=
 =?utf-8?B?YithSmd4RDhWeXdIWnIvUWZmTU1jWmJDei80RkNvZWo4ZGtIN24wRkJWTDBw?=
 =?utf-8?B?NVBwUHhhdHhGYTBuekRZT2JuQzIvQTRmTGdOWFFLUkIraTR2NmhBcEo4NmNH?=
 =?utf-8?B?c0JsTzVmaHo0azBsMS9nNzYvQTV2MG5UYURQTWVDR1o3V1VQMHh2eHJseXlG?=
 =?utf-8?B?QXd4SUJuMHdwdlNSb3FTOGZkRGZKTVdWdFA4SDdYMDFVaFVmUWdnUWZYcE9p?=
 =?utf-8?B?SXJqQ2JMRm5pS2pKRHFqck9IWEplSSs5ZUJUY2NWM3BtZ1UvWkpoU3Y2TUlz?=
 =?utf-8?B?NEt0Uy85ODcrUDJlTWtCRWlkdEhxc1FsY0VYelZxdDdETzI3c0V2OFpKVUUz?=
 =?utf-8?B?YUdrOEllTHNDN1lYcm92dFhKdnA1Y1h4cGlGRmZva1RiaE9BUlBkZkdhNFhU?=
 =?utf-8?B?ZStKNmZLNW1VMlNIRGhScUVsc0VDZDFRUEszQk9CM0V0SjRqWlhMOFg1eURL?=
 =?utf-8?B?YjR1SFQvWFMvV2pGcHJjeDlqSFRlY21rcVlkT1dWZlhZM0xkRVVEL1FnUjVU?=
 =?utf-8?B?bXczRzdROGRSdWtqTGRidU5mQ0pNVlplc1dJaCtQTXFrWmZOVlVYREYxek5G?=
 =?utf-8?B?TzAxcTVQZUIweGN0Y2ZiRUVIcmRudlZwUVFEMEtVWHFvWDVNeGJuN1lOMXdD?=
 =?utf-8?B?ZmdidXlnWnJieVVuMEplMUJPMnNmODgvSHphVnJYT1k2MXVMY0RKYVFGYjND?=
 =?utf-8?B?WTRSYlRmTlkvSHlRTzNNa1Y0RVM5OVdZd3VTUHM1MXZLQmRnM0VoMUdITlV1?=
 =?utf-8?Q?XNR1Lk3INwJ6TMR4SRBCnLk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b94022d-477c-472d-9adf-08d9f7962429
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 13:04:07.5059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9+jmYhLCZlr2D/rn5mXHaUxXyIKytSu5THcNwCq69u2Bh2BsAA3Z5lbX5jDgY1yp073ZX9ru0650FqdI18s96g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7662

On 27.01.2022 16:04, Jan Beulich wrote:
> On 04.01.2022 11:57, Jan Beulich wrote:
>> When not holding the PoD lock across the entire region covering P2M
>> update and stats update, the entry count should indicate too large a
>> value in preference to a too small one, to avoid functions bailing early
>> when they find the count is zero. Hence increments should happen ahead
>> of P2M updates, while decrements should happen only after. Deal with the
>> one place where this hasn't been the case yet.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: Add comments.
> 
> Ping?

Similarly here: Another 4 weeks have passed ...

Thanks for feedback either way, Jan

>> ---
>> While it might be possible to hold the PoD lock over the entire
>> operation, I didn't want to chance introducing a lock order violation on
>> a perhaps rarely taken code path.
>>
>> --- a/xen/arch/x86/mm/p2m-pod.c
>> +++ b/xen/arch/x86/mm/p2m-pod.c
>> @@ -1342,19 +1342,22 @@ mark_populate_on_demand(struct domain *d
>>          }
>>      }
>>  
>> +    /*
>> +     * Without holding the PoD lock across the entire operation, bump the
>> +     * entry count up front assuming success of p2m_set_entry(), undoing the
>> +     * bump as necessary upon failure.  Bumping only upon success would risk
>> +     * code elsewhere observing entry count being zero despite there actually
>> +     * still being PoD entries.
>> +     */
>> +    pod_lock(p2m);
>> +    p2m->pod.entry_count += (1UL << order) - pod_count;
>> +    pod_unlock(p2m);
>> +
>>      /* Now, actually do the two-way mapping */
>>      rc = p2m_set_entry(p2m, gfn, INVALID_MFN, order,
>>                         p2m_populate_on_demand, p2m->default_access);
>>      if ( rc == 0 )
>> -    {
>> -        pod_lock(p2m);
>> -        p2m->pod.entry_count += 1UL << order;
>> -        p2m->pod.entry_count -= pod_count;
>> -        BUG_ON(p2m->pod.entry_count < 0);
>> -        pod_unlock(p2m);
>> -
>>          ioreq_request_mapcache_invalidate(d);
>> -    }
>>      else if ( order )
>>      {
>>          /*
>> @@ -1366,6 +1369,14 @@ mark_populate_on_demand(struct domain *d
>>                 d, gfn_l, order, rc);
>>          domain_crash(d);
>>      }
>> +    else if ( !pod_count )
>> +    {
>> +        /* Undo earlier increment; see comment above. */
>> +        pod_lock(p2m);
>> +        BUG_ON(!p2m->pod.entry_count);
>> +        --p2m->pod.entry_count;
>> +        pod_unlock(p2m);
>> +    }
>>  
>>  out:
>>      gfn_unlock(p2m, gfn, order);
>>
>>
> 


