Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B8F5067AA
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 11:25:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307936.523349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngk75-0006Qt-7d; Tue, 19 Apr 2022 09:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307936.523349; Tue, 19 Apr 2022 09:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngk75-0006OC-3c; Tue, 19 Apr 2022 09:25:35 +0000
Received: by outflank-mailman (input) for mailman id 307936;
 Tue, 19 Apr 2022 09:25:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ngk73-0006O1-A1
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 09:25:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a901812e-bfc2-11ec-8fbe-03012f2f19d4;
 Tue, 19 Apr 2022 11:25:32 +0200 (CEST)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-MoS0c98HPFqcGvhOPLjRJA-2; Tue, 19 Apr 2022 11:25:30 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB7PR04MB5946.eurprd04.prod.outlook.com (2603:10a6:10:82::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 09:25:25 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.013; Tue, 19 Apr 2022
 09:25:25 +0000
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
X-Inumbo-ID: a901812e-bfc2-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650360332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s4SRGsT3WsC/afQ7S+TOAetnWSUu5B4GZ271bnn/29A=;
	b=KgnfU0krScbd1QTkrDh2ytv3NZD/ehGjNEkTVIGC7ZYq+096aN1C6/tBGEz2pMxc5tclQ8
	Q4uVU/f/sbcvlDDegEmsoRTgtuDeTEPPPQ837NOgDGPeFsbYT3QiSdyEbAElS0O7xe3GcL
	2P486QwNugfelT0FnnR4XVbXBATFch8=
X-MC-Unique: MoS0c98HPFqcGvhOPLjRJA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/acbrCzJx9zkn3c/v9axoi0a9m9EWgdpVAljXsbw8CdLZxEqi3cvQl/D+Udph0ksKfQNImTmHSxzkiYEKjw9kpsKaXC7vEq+u8yVNf3dFS2iffKs2lFcBJ7ILq+NPkfCey2KFOdNwQT0w2cq9nC0i+vhKKzi7zaehQEeqTsoZtQehaD3n6h94RIJciLlkPf/ALC5deIUsd5ULb9LqMgwdyH5E1bNumO3wOsxqAygefa/EXf8tD9kOJVqD8MksLYANWpnV3TnQ9oXlzWmB1joLkQGaFmHZLFwhAP+vPBxUYhlbcPOFiPWKUeyXBfdhQ4iiX4zw629PGcUzuGuZQ88Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4SRGsT3WsC/afQ7S+TOAetnWSUu5B4GZ271bnn/29A=;
 b=j7ciDeGr/eGb6v+lUlcH2ES55IIVLETh9R8TBwULBldvrROkNhiGGwClV1eoyklw9I23fYT8RkUdqx/oNChtztmbe16Ti8cQsYBgX6wwm4xtA46Qqt6l49ranaTwnBPCzvkdo5a3Uic69W01GLinFmmNgWQET5kfxSTVwrP19d8H79WvOJc3+LOTMCn2WthMDcMFXfJq9cMGIY44wtR6m37pyzLPb3X1J5tRgNh9c7ClAVzT4FAAKKMV6/5lV5Mz2s+MaSmbUcYyvrnRULU9LGf0rN4/s2ch+QKiKo+smTVdLFISQEe49N3ta2es+ERex7yMeELH7bCtiEy0oEWwDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c25c4c9e-b2aa-889b-53d8-b396d323c9ae@suse.com>
Date: Tue, 19 Apr 2022 11:25:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] xen: fix XEN_DOMCTL_gdbsx_guestmemio crash
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Cheyenne Wills <cheyenne.wills@gmail.com>, xen-devel@lists.xenproject.org
References: <20220416133158.16162-1-jgross@suse.com>
 <fb19f5ac-b8e9-7cdb-4f72-71b73e6f4b8e@suse.com>
 <eae4f0db-0dbf-44fe-fa37-74aeaa6bc04a@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <eae4f0db-0dbf-44fe-fa37-74aeaa6bc04a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::6) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20e43348-e937-4401-3c7e-08da21e6895b
X-MS-TrafficTypeDiagnostic: DB7PR04MB5946:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB594614FAE7070B39571F7775B3F29@DB7PR04MB5946.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DxfVfAbPHAYohEn4c8snljVUp7dhlxSdV3BQ7ttNd4EfNY0xyu/uRmmbEAWbK9giOr2bd4rUPI0JiZSGlrHJ1t63Rx0DEjxWtqQEbLCK2aACXzkinZMLaBEw1yqyjHmtDKki/3p8pkrFX6T/WEHiCXzBOrmbE133h3gJNmR7/eFsS1g3kFRLw8Ad5/Ctr0e7aBEQPH4KD7G4lscX+oTyv1PZPUe9o3Kw/rCvY2YLaIVGIsufkf6JxEQaOpRKeaJ0ryQVjSw4EQ6sSIzhmJGBWq6N1puOdw66CV8SObOpe/6Sct+5HmauPmmOV1kKWpTLaBG8CgmnhZ3tkSt+JvxLqdwP1xTPAkIYUxzShO2beVqrQbWDCJ75a+cC0c+OrLWS1HAzjohUYiQNhMMxXVa+9JNvUFTrzVhKYJKUTlvqQkzPAfoD/If+zIwVshIWWUeoSYC6aN1hGfVsww8+F64EEhC+m6ByqLSUy1UPVzekKnKt1EvWZSeqGZb3C2Ghxksn+t7D2/Zpwe8OeangsPeXmWWipXoWat7Orc8baNB0UgNmAUi7mJ1YX1OEDGzcbIYLqcVoegRvT1zrOm6PZnkGnsPqY9HJ+StdjMB6QE7huH+lHzSGVdcQ/IXyyKhXi1+zjJSblTN7ud/yKhLrBMvnEsv195Q7o08R2H76l9vp5q6tOgecnbX6Pcbydu5SsSZl77rwiAw4nygC53cMSWVjr0cshvLonhTz1gygeIocgps=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(37006003)(316002)(54906003)(508600001)(8936002)(36756003)(6512007)(53546011)(6506007)(2906002)(5660300002)(38100700002)(6636002)(26005)(2616005)(186003)(6486002)(86362001)(4744005)(6862004)(4326008)(8676002)(31686004)(66556008)(66946007)(66476007)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3UvbHFvSlo2UnZYSGJ2dHFWZWtHSnVkWlVOTWtVOFRsY252RERiWnpMeVdL?=
 =?utf-8?B?TDZtZ3U2bmRSVnhJMGJUUU1BY0ZMK3lmMXBTVjkwaEtMZUxVNTV2MDRnSmJT?=
 =?utf-8?B?WTlDMi9QUFM1UGZhU2xBQ1piUm5KcnR5Z0FvcVU3dk5BM1RPR3JDb0h1VWdu?=
 =?utf-8?B?Q3RBSDJpVnA5RTVmcjU5WVFaN1JUOFpxZGFUL2VMM2VyTUFYMGNUQUdSOVlG?=
 =?utf-8?B?WTVxd2NHUzh3enNDalRwTUZna3RCZnRaME5haXhCTFFmL1NpR1VyME1CT1hx?=
 =?utf-8?B?Tk1NZ0laL0VBL3NJR0pjVy9hWGtzYUI2T2k0MVMvY3RSZEpmRGVRMVZlNldu?=
 =?utf-8?B?NmZqeVBCZHVLSmZNeThrUGJPRE5uTWx2MHBHUHZQRVFKNWhhSEtnVDBRZkNi?=
 =?utf-8?B?enpPbGJsSitxNkpROFBDSFhML05TbGJXR2RIUWl1REtQNHVXckMway9pUmFH?=
 =?utf-8?B?UmwxamtwUXg5TGhSZy9yUURLelhvNnkzRFZXM29TdzR4dGhvMUtHUUR5SHh4?=
 =?utf-8?B?RkIraEowQWh0MWdiSnBTWUhBdzBENzYwTVZKWFkzYXZaeDE0ZEFjS25wQlpr?=
 =?utf-8?B?ZjR4Z1VPMHlvZTJ5NUpOVTlwVldiTnFDbkovZDhrYmlVZTBYMGNmQUxtdWxK?=
 =?utf-8?B?ZzRMMFlTSW1PNkFJdDhBRFlzcXJOeEpBelUzd1o4dkFrSXhpKzdHT0tpY3hk?=
 =?utf-8?B?VXB3OFpPdnQyRlpTaHNoRU1IZ1FESHRXRkpFbk5WSHIzdjNRKzV3R2ZUT1kx?=
 =?utf-8?B?cjZ0MkdsVlp4dFFURmNSK1kwNDI1bkIxUDVVVCtSNUNGNStZNWszZGR0dEt0?=
 =?utf-8?B?NkhQQ3JYZDhLUDd5Q3FiOHBIZmR4bUdyQWovUVByZGgxU0NOR3UxQnB6ZjNI?=
 =?utf-8?B?ME9JbERrS00yT3VNbFFEUFVvVEl2R1BFSExiZG91QTE0dFByWlV6QVJVNXV6?=
 =?utf-8?B?S0UwWVk0T25OZVJURzdyMXBhN2EzQk1QSS85TjM1cnY4RUVrTURQbkpxcVFI?=
 =?utf-8?B?MzEzRnByOG1YVXdvQWErK3BxYldNU0d1MEh0SWFjWUJBeUhUZDhlVTJVaWZ4?=
 =?utf-8?B?MWRnSlJyWnBSeEU5ZkwzUm9xRXZNZEtySTdrckNPU01IWHVIVVV3bXpJUFo4?=
 =?utf-8?B?dHh4bDJ1M2NibE5remZ3d09zc0kvVC8vZVR6OUZuOXo5blJQSDJuazF0UWkx?=
 =?utf-8?B?N0hhbUt3RWhlYWxFNlpQOTB2d0xRSU1LWFB6TXRRZy9zeHpUU0J6K3V5TzVq?=
 =?utf-8?B?RGRncExzZXZmbWhFMGNIUlhhMnI0MFJ4TTgwNTlhMkd6Y2ozcWRwZVNOZkRq?=
 =?utf-8?B?M3Z2RCtEdmwwNXIzYWdmbTYzWE02SndOeUt0S2J2MmhUYXQrSlBmQlVLbGhF?=
 =?utf-8?B?YThsMkc5QjdWNWhMWURtMFNIKzFyeStKc0hNWHdXVmNTb3VxSXNjeFdUbFZO?=
 =?utf-8?B?YVI3OEI5KzVNdEk2MFFDOU1ZT3QrQkVxcU5oS3d0aDIyaHlEWjBZTjlxZnE3?=
 =?utf-8?B?UlIwV1ZUcWZUL09jN2dZLzZUQXdpd3E3Nk03bHhJZTF3SWdWVGs3NVlFTGtl?=
 =?utf-8?B?QXhjNDV0VUNJZFVtVTlSSTIzVllhQ0pEUm9ZcEM1dkhDSS80S1cwNFc4ZHJJ?=
 =?utf-8?B?MWFCTGpMaFlua0dZLzV3RnZuL25Wc3VyME5kU0pDU1NZOWFqNEpManpYVC90?=
 =?utf-8?B?VnEvVTJ3RC9SUEZIS2xsRXNoU21vM3NFdFFSKzBpVVB6dmd3KytTWGhCdXFu?=
 =?utf-8?B?djhOTzRoSVlrWk9ud3VjT2F6blhDSGVYeEl6VVA0aGZPVzhJSmdBWG90TDVS?=
 =?utf-8?B?aEV0bmFOOEhMZ3drS2gxQnA2L096bFBRbnZWTlpvVTlsZXJqVmp6Vk1uektW?=
 =?utf-8?B?bDB2Q05EanN2WWNheXBtN0Ezc1NlT0ZlM0JvdmJtMVFKR2VjVGpydUc1YWhi?=
 =?utf-8?B?c0IvVjZWNnpteG9aRFRVZG9uN1h1ZCtZNXpNRldxNzZCTm9tMk1pNVkzeksy?=
 =?utf-8?B?RllkdlcxR3dCNW52YWF3MWlFeHJzYjNvRXRiUEJ6QzQwTitBaXYwdS9wMWx6?=
 =?utf-8?B?a3M3SGQzdG1ZMEg5cmVmVFpiakhVWG1yL2dhU2txeXBaSXp2U24vZEVTZVZa?=
 =?utf-8?B?eWduVDlJUnZQWjVmd2hNd3dCY1JYaFI5dENGWmx1QTc0alFhZnRwK055Q1hz?=
 =?utf-8?B?bHR6R1N2c3llNEFncnJJSXJESnBhQlNSTFFzbmhRM1F3ZzFrUVM1cmlDZ1pI?=
 =?utf-8?B?RU1PM2pmY3VrVVdrdXJUZmplN2FCYW4rQkFQZUZlM09ka3VLT2lxd3dPWjNX?=
 =?utf-8?B?cEltOTRERHlWemlEczFEZlhyR05lQ1YzT0lTakJCOG40cHg5eDM4QT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e43348-e937-4401-3c7e-08da21e6895b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 09:25:25.8248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25T0xjp9pf2dzH0JzoghuxGHKZ5+XzLCs1B4OfyVDdcGx/8n0cuwba7oEyIJ6P1FmvIu728JvS1oHC3BCvxkgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5946

On 19.04.2022 11:22, Juergen Gross wrote:
> On 19.04.22 10:42, Jan Beulich wrote:
>> On 16.04.2022 15:31, Juergen Gross wrote:
>> And finally I think iommu_do_domctl() needs making resilient against d
>> coming in as NULL. This isn't just to cover the issue here, but perhaps
>> more importantly because XEN_DOMCTL_test_assign_device can legitimately
>> end up having NULL passed here (when the caller passed DOMID_INVALID).
>> We've simply been lucky that libxl doesn't use this variant of calling
>> this domctl. I guess when d is NULL we ought to check the global flag
>> there rather than the per-domain one.
> 
> I think this should be another patch, though.

Sure. I'm happy to make one.

Jan


