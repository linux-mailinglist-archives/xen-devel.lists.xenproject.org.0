Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D545C48D461
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 10:38:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257040.441446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7wYT-0005oY-BF; Thu, 13 Jan 2022 09:38:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257040.441446; Thu, 13 Jan 2022 09:38:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7wYT-0005lI-7K; Thu, 13 Jan 2022 09:38:01 +0000
Received: by outflank-mailman (input) for mailman id 257040;
 Thu, 13 Jan 2022 09:37:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fwfT=R5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7wYR-0005lC-1l
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 09:37:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7db3a803-7454-11ec-bcf3-e9554a921baa;
 Thu, 13 Jan 2022 10:37:57 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-faEO4oIfNJW8-j3r_NCoag-1; Thu, 13 Jan 2022 10:37:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6384.eurprd04.prod.outlook.com (2603:10a6:803:126::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Thu, 13 Jan
 2022 09:37:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Thu, 13 Jan 2022
 09:37:55 +0000
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
X-Inumbo-ID: 7db3a803-7454-11ec-bcf3-e9554a921baa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642066677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xM+QfnSElr65gkmYPfZbeGLhJ/h9r8nonqYSF85w40o=;
	b=nIYaqMVybDiaFEhMP9jzoVy5uy/EwY3u3n18CRtx0rEUpuhxSZHhYP9zwNDOMO0RY33Bx/
	IVHPbO5CjiqQfTn01NKCpsLX4o+/XxoQobXE4aVLDYINjZozqxdj+cBbPgzg8m3SQ3QvwA
	4uDZ7PU+X+6OalWowLXYlRFoSxTwCy0=
X-MC-Unique: faEO4oIfNJW8-j3r_NCoag-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G3rRAz5QoIhAuTtbdgB7ZekU9vbtY4oe+C2FW5DiTgqaAUE3Ce6J3p+5PjBEUidR2kZ0mdgDkkoIQTkPHV6/q5dx1mosjJi1t/H0B9bgw6tU58VjMnsuymNajR4B+NajVJK8m+CBkihSpNyK2GnFArrqZ0HUIfScWxl9pVcKYjNaXlD2eL54pKZnlkDRSbPbdWY9xSB4WAipEmSCr08VJDwwehXx70DmA0s1U+38ZyKdfoedKIEAqTq8h+xarjzN2P3J2/xac0S/HsPUyaSZoZJriw3SCGembyrpvLtqBVR1Zwc6/WH9+whTkXbvrgClaT1yq00tkefKrpyacystfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xM+QfnSElr65gkmYPfZbeGLhJ/h9r8nonqYSF85w40o=;
 b=oaAbz4Nr1WF8w+ZstvZ7zZGKF0EMqvyq6bMIxgD2KlCkzkHDzpDWs1voAGL8+PipnUkeCaaOFmiQOJjcuM3DL3/lit+gNA4Y/JLJAyu7Z+3chEsapKEbN+d0FXem6ZCe8DSXYD7YwRyzaodNbqIq4LBIOKSn4y8mxJkGPuGUwuVtUdzslhvCd6LTXgt5PNugH+XvPUKiUHWJ6TI7oBu6xmOzZAab2E8jZWrqB+DELLrSgyVeDuceZ8MPZFeHZEvpYxoLHioNS2nfp6Ms3lYniHWt2q8RjtwhW846WQiDodPiAqj5PMx0NlSIcvki7ucAn8Y1rwLAkKxNwVNA2FBkiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0bd1cdac-14cc-dda4-90a1-50a1993ff978@suse.com>
Date: Thu, 13 Jan 2022 10:37:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 1/2] x86/time: use relative counts in calibration loops
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <595b3447-0eba-dfc8-fa24-6bb8b964a137@suse.com>
 <34662095-6f58-4471-8bbf-1bdf67650fb2@suse.com>
In-Reply-To: <34662095-6f58-4471-8bbf-1bdf67650fb2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0059.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8c601f8-dfd3-4af3-5464-08d9d678606e
X-MS-TrafficTypeDiagnostic: VE1PR04MB6384:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB63842EBB36CAA140CA8B61ADB3539@VE1PR04MB6384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oo6/SyLaK4mbyI8GqiO29/4u7I8cBEvDa8jBdY9yohLO1YADxEDzbXxH5QCX8Ql22zTu7imrPQmvXXTe8Jm5VWgzx/x1muG/jQtHMpf6szWQQfoaEmRy2iQR+MxDJD6rAsnVqMYQqRCGCeM7vqy8zgjyAWpMnkotGzCF5mKvPR9h5AWvaRh/iWNxfZ7AyM2wWm7urkk08pXIfWTQd9/ewIDdGJ3CN5xyqLjhQnWr8xSLRuzyPV5yn2vDbeqpyLvU0cYV5GO3pcc2hqAci9fHg0fuRVaHqAReYKlfzRhCKUWLqtaKaMiVUWfLdRRxL5kirPHhIxSzj1H0XaRWN/QoE4P6ReMuVbUvA6VKdUa8x1DvIJVJaTWJE49PqmRGmMJdppW8totTARrglkxAyeXDwRsa9q4mkosteUdM2h5kmyjxxGF3sV+dbK7OOtgdh5QVE9JjtdQ7Oft/2DzG4FV4mOHXd/uHVXZ9PU1OyOSs/tilOg5drVz1Leq0HbA7BO/iNu0NLiRtUQvIE4ZL7TtWrP+ik8hQDvRP2ZPZyUBUzK8UdDFuncmoAE1pudWj21uEo6RpRmaZWNulhV0/ODM9fMMz8l9NIi5eAFXuLL94xUXU8hcFv3aQHvLM05Bs4yOL3lqluUfiDXuFqaTs5ErnrqJzQP2ltfSU9Fbj1R2pjxh2Ye0HESBs+rXuE3sAQHjiwXQCDMYH5UlvPJYG5xrWsm7V96cI6Exm3ddjZy/j0Ks=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(66476007)(8936002)(66556008)(36756003)(6512007)(31696002)(66946007)(5660300002)(8676002)(508600001)(26005)(4744005)(6486002)(2906002)(53546011)(6506007)(38100700002)(54906003)(110136005)(83380400001)(31686004)(316002)(4326008)(86362001)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHZBak02RGZlb0FUK0NhZUNzYUtSRk9Ob1UydlF4eDhpNHN4K1JscTNvb25H?=
 =?utf-8?B?RDVFWDlJQzBGQXUyTThrVXRSRkUyclkvMWMzVWZwU1VKMHQyaWRuclBralV0?=
 =?utf-8?B?bnROZkgzYnZBSzIxSGNFN25TUkVCNG5FQ3ArakpMZGVtY1MyQ3VuYi9wWXp2?=
 =?utf-8?B?ZVM3VXB3OHdLalhqOHdsdmIrRVZkYmk5ZWRQaU5ybENRTmkrK3pxNXF4YzAw?=
 =?utf-8?B?dkNxSUY5SWJMb0NMWG94aFBycFJLT0pEcmtvWTlmMlpJVkhRYndmNENqWHY2?=
 =?utf-8?B?TXduRkRPRTcrOEJUZlpnN3dkV1BvZ1QrRlY1WU5UQktSS3R6RUhPbkdadldX?=
 =?utf-8?B?S1VXbTB5VUJHQitaOVg4akNkK09WeTl2em5QaUVQSWhQd0w3MUk1WVJJY0Ja?=
 =?utf-8?B?OFJjNVU5YjlUVDR1OFVpblpqRDVNeTJIWWZ6OElLSTdRTjBBZ0tseWUzdlFC?=
 =?utf-8?B?QVhKNldwTHd5SitkbzNrVExvdGYwaFRwVi9nYzZ5VEJ1RUpVN3ZBcHByN1lu?=
 =?utf-8?B?bjJpT3dnZkJud3c5QkNUY3ptQnhGUkdqaGlmQk51QVpsRk5jWFlMSFdQaGZJ?=
 =?utf-8?B?UjBWZTVpajdrSWRSQTVwQ2dMRS9QVHVRWGRwMkpZSFI5REdnVUxOdjBiZFVI?=
 =?utf-8?B?MnZlb3BnUExKT2RFZnIwb2VrR2N6ZXNhMHRRb21wdi9FWVpJdWNZT0FBNkVt?=
 =?utf-8?B?bDlMdEFKTzdGVUFYQWQ2Skc0cXhlWFVVMnNaVU5DQjU4VjB6WTFzWnJyVEtw?=
 =?utf-8?B?U2dqRC9vcmhqaWRacEJqeGREait5UFowTUx0eENnWjBEL21BTENLd0ZrRzBz?=
 =?utf-8?B?VHA4Mm5ZdnBPWDJ0d1g1bVJhN3ZXT0gxbDBxUHdmNzF2dHE0TFJ6UUlEeXJ6?=
 =?utf-8?B?ZEl1cE1rd1FHN1g4ZDBYZGs0S2xlZElBN3V4a2JTTzhCUXhNRmlXQ1hhQm5Z?=
 =?utf-8?B?Q1ppNmZLc2ZPdXQySStCOHlTeE40QWtrTXFVdnVYd0t4cklhbkgzdXV2bDIr?=
 =?utf-8?B?QUFvREJBLzNDaC9kNGFyNDFhZ09uc2Zaa0tnUXdnZS8wc0ZLUTYzREMvYUFm?=
 =?utf-8?B?UmM3RS83aG1UUXRwRnQrZitQZTR3Ty9wT1hlbnJ5L3NCOUJmY2VGM1pydTlY?=
 =?utf-8?B?UUNRUElhcC9vbmRXc050NzVrRWQraVFkbVpHSlhVc0t0eHcvTGRwYk5tc2FY?=
 =?utf-8?B?bmlwUk1UM1dDbXlsQzI2YXV3OW9RbGN3bGQvWWJUVzZyOWFxUHhtZWY2aTFw?=
 =?utf-8?B?YVlaZm00Z1h3Sm1xYWg0T3hzcWN6RWJFWUExeEx4Z3BsRWYwTjVQeDAvUkV3?=
 =?utf-8?B?V1hEK3ZyaUw3RElkMjNsMHhROFE0L1JjMExkOCsvaEVJaXVHYUlBMUZ0L0dL?=
 =?utf-8?B?VVB4OHhYVFViQ3hVNWhOUWZ1ZmE3UUhKdmQ4NG9vVk13N1FBTk41QmQyNVNL?=
 =?utf-8?B?ZENSMS8xV2UwYXJjRmxacU4zb24yelRRMzR5VHlrT3FJQzBHWmFFVlhxbGdp?=
 =?utf-8?B?VGUvUFRoQWFSWHlxb2RQeXNOblQ5THNmUVpXVExoSVJWbDBkd1dIU3d2ckhT?=
 =?utf-8?B?L2JIUCs5MFRBcGFjem1YL3lxakMrb3RzRnRFeUJiQ05Pc2svVEhhN0ZwRktj?=
 =?utf-8?B?YUJUcHBFWjlBT2ZqK0NjbnlDY1IrZUZYRExlMGhQMmpwSnNvY2RxSk5KUUVj?=
 =?utf-8?B?UXRickQwTUEwLy9TUDdFbndROVJUZWZaNmZ2bFFVY0xEMnFiSFVEMEh2bmEy?=
 =?utf-8?B?RWliSXBURXpKTTU1bTl5Y0todzVzN011eDgrVnhFQmppYVNaZngxeHJzcWs0?=
 =?utf-8?B?ZHpxWjhNaWp3WjNhTnZTMWhlOHlqTThBS2d3TUk1OXhET3g5UEs2ZmRQYkxi?=
 =?utf-8?B?dGVBWk5lK0wzclZNS2V1dUNlbUlXRm9JR283aHVHR3BBVEpGc2VJUEZTUGF3?=
 =?utf-8?B?UEVCSFZQZ3Rnc0cyVDlGYTVrYnREZUtHMEptN1FLUmYrM01UODBKUmtJekQ3?=
 =?utf-8?B?ZWZvcjNsTVA2cU11N3V1QTBsN1BwQjM0ZFhSOTN5VHlQenlSU2ZQZ2djM2Jv?=
 =?utf-8?B?QWc5Z05KUFNDUlYzQU1MYXB1Mk9VdmlvaWJkYUZJeTFlU0QrWXlac3huUzI1?=
 =?utf-8?B?bVpOOUNvelMyWVhmczgzc0FKRHFPakF2MDdQVURGMDhWanlmYWk3dXoxdXRv?=
 =?utf-8?Q?mn1/nulsefonEuzQ4Waqy4A=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c601f8-dfd3-4af3-5464-08d9d678606e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 09:37:55.4537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCwUPgmqck3DaGVX4wOb0ne9FO/40qG2wkpHEsizxIVrx14dCqqtDopwrr6TJXGjxNT0j4Cm2tMLGVpDJ91NDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6384

On 12.01.2022 09:55, Jan Beulich wrote:
> @@ -504,11 +501,8 @@ static s64 __init init_pmtimer(struct pl
>  
>      count = inl(pmtmr_ioport) & mask;
>      start = rdtsc_ordered();
> -    target = count + CALIBRATE_VALUE(ACPI_PM_FREQUENCY);
> -    if ( target < count )
> -        while ( (inl(pmtmr_ioport) & mask) >= count )
> -            continue;
> -    while ( (inl(pmtmr_ioport) & mask) < target )
> +    target = CALIBRATE_VALUE(ACPI_PM_FREQUENCY);
> +    while ( (elapsed = (inl(pmtmr_ioport) & mask) - count) < target )

I think this is wrong, and instead needs to be

    while ( (elapsed = (inl(pmtmr_ioport) - count) & mask) < target )

There no similar issue with HPET as there we always have full 32 bits
available.

Roger - you gave your R-b. If you agree, I'd like to retain that with
the fix in place. But I'm not going to commit either variant ahead of
hearing back from you.

Jan

>          continue;
>  
>      return (rdtsc_ordered() - start) * CALIBRATE_FRAC;
> 
> 


