Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A874497F0
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 16:14:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223458.386185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk6LH-0001jJ-VD; Mon, 08 Nov 2021 15:13:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223458.386185; Mon, 08 Nov 2021 15:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk6LH-0001gS-Ra; Mon, 08 Nov 2021 15:13:51 +0000
Received: by outflank-mailman (input) for mailman id 223458;
 Mon, 08 Nov 2021 15:13:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mk6LG-0001gK-SQ
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 15:13:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79cad9be-40a6-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 16:13:49 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-2gr1LubfMrWYmUuoFjhtbw-1; Mon, 08 Nov 2021 16:13:47 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Mon, 8 Nov
 2021 15:13:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 15:13:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0601CA0036.eurprd06.prod.outlook.com (2603:10a6:203:68::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Mon, 8 Nov 2021 15:13:44 +0000
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
X-Inumbo-ID: 79cad9be-40a6-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636384429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lPCyICozdf2UepPQBEqmMJz8QFZjBQ04YYoBzOsqA5c=;
	b=eI1mf4piAmnouAlQzYZFQJs432OyKOwswd9x8vYJG1U0jz0Q8ZWeHGmhPqsxDg5AzSCi3u
	Y5wJhUduBLRClYfDsIjZt+LWedckc/r6ltlx6Cr3Wop3jcs0eCV6zKr3878lArNyAMJ21/
	gWo65SRPWPv2UzE6vHatNchIZP1SoE4=
X-MC-Unique: 2gr1LubfMrWYmUuoFjhtbw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KpoyInAuDeXfy0qiSBKlsRtfy4iOFW0lxBxlaudOPQ6OPgVjBGvDG2hiIqnOSaNewaMnQLJudJN3lLUibrZgy2QtX3/avQfuFUSynLnykJYMQeotYEgiTzzw6j7Z7WpjuqEXAkJ2iN3F73bkL4iNjRPO8/3lyOF4djNYdsUfZr7xJUySEprqFPsQrEfyZ8lZN4yoZ23MYXwFAYhULqRd9GAx4O5+ErIlOQgZROWotk1nZagPgtJ2Ok/Z7xe48LLKf/ny38O0HP8uP/mWTNayDoB/mBAybOqFDFAmr+woXFlXogorDBFtN1hnUXkxMysJU6T8NRgPkYVM0FVs81BRBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPCyICozdf2UepPQBEqmMJz8QFZjBQ04YYoBzOsqA5c=;
 b=S4V8+n64WFWsTydZdKsAU4J6jCJL/iGHJ3/j+Id6inIQ4/eeYalrVXgjLzv+p7YIA1M0TOA5M3ZYgGfZ65P6fwv3EbBRd/elpz8NxQIxdnxKimbC5EbY6DzDarW3Mjr+vEniozCYZi6ZY7DnHRkH8xawPm0k9dVGS/NqJ7EpS4/1FIX6L7SGd2ELm/8FEMnkz81gzgNPWdJ4Xr6vAzZXgF1BJGE53fj/5Ks6yPA2RGg5lVoqqiLAoJZddLzrN0kYPDYEI0I+4ADKTYoYEIoDFMdZFifEaGjOOSF9hxTB+XjrNjVWHvF/aT6TIE0z+QIo37JUxhX/QqgT7+PHrCeLwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <84a5e7c0-40db-0d02-74a9-d1c6a6ee8f3d@suse.com>
Date: Mon, 8 Nov 2021 16:13:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 1/6][4.16?] x86/x2APIC: defer probe until after IOMMU
 ACPI table parsing
Content-Language: en-US
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <royger@FreeBSD.org>
References: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
 <43d8cc88-aae0-5a82-7b4b-756dd54dd223@suse.com>
 <YYVQAH7OYmFSVOei@Air-de-Roger>
 <24965.21029.795504.152439@mariner.uk.xensource.com>
 <89eda99d-67da-ad97-6040-db79702636bd@suse.com>
 <24969.15479.681521.102446@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <24969.15479.681521.102446@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0036.eurprd06.prod.outlook.com
 (2603:10a6:203:68::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18693585-85eb-4d1a-2aa2-08d9a2ca5b7d
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23358A777DFE8047C442AABEB3919@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E+ECSSP1mHNQFwOnTEq8SFz2qx3Jq2Tt7YSXkpACttTVQdGWtypgZA2PVCN8eHdA8jz9WaVSMG2Sgd0sUXqzYorXmvtPvj3PcCj4MEcJxj6xGsEzWjOmtkbsSAl7mojM/ifPvfF/6VW3LgwfVmONh/8gUJAiBjxWilA6f+VizDAuoCG//9wU56T6uKI82rAwwAa1T300Kn06U5zDgKG3i4dSWQpJuMelUU98CwjUATi/K1mqvo6o1USy63zdAA6Nd1JlzRSFi8mLz/2rJjDD+M7CKu2fqDi7E/NPWM/mH1BXy254eT3oY09sbOpzE2dLi8rPOKMCIdAV1nCGJhzH/Ij70p+vl/XdJAcr0gsUqKkB8WMp2pGnxJxYwLfjhwisBowbH8zf0y7r7MvWuhASTiIznTF2zznmcUwkkeSxIvs2uCUgoXXlWp5ztTTLcARo8c5fLvAjKZ6uFhvB892OkDJ7B4ExnkMl/XfEUXecPWb8o9CZmNhMIA1X72BFXjEovEL0/bkvuvVW1oWMHwMEJ+KC55KTiYBIKqQiQi64VdL8a6PBD8nMbnbzjHOwQ5pE7E5tBbMSwa4ZV7YFi4znBlgGz/B1tWOeBHj9SVCZSnpwb9j3It1e0JI249P/JHnuHxYhD8tWCCDjJoFDUQkGJcaKjUD/Cd2TZHyCIt1enWoHXsmS5/nnrkCaHyQX1+DYxgILvR691WBJKNT41xu0VGFo7ziSO5FHhJVgLskSlTuzGrtFQUSvp7+Um7U5JuYa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(66476007)(53546011)(186003)(16576012)(54906003)(83380400001)(31686004)(508600001)(8676002)(66946007)(66556008)(5660300002)(2616005)(316002)(26005)(6486002)(31696002)(8936002)(36756003)(38100700002)(2906002)(86362001)(4326008)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkJaTkg4bUdHREdRanVUa2E5S09TQmljTHpMeHVDZVlZdEFhYXBoK1pNekpT?=
 =?utf-8?B?S3gyOE5SeTVtVWtLYSsva2VBNmhjVzIvK1U1WXNzRWhhSmFmeVh1V0NqcnNh?=
 =?utf-8?B?VGUweVV3enFmMDZwVTZEK0ZjWDl0QjNFY3UwenpTM2FXVDdKSnZiZkpySHUw?=
 =?utf-8?B?WDdnYWVoeHJLNlIyUzJqZnY1OVp1UUI2MVRFYlBPd1JCK2hIbEgzR0RPcnR0?=
 =?utf-8?B?dVkzeENRTURqVTljQzVWY2duRytPdmo4NzFtMzhGTWlWQVQyUlhCLzJ3U1pr?=
 =?utf-8?B?QVB5bGd1UmJmR2JqYkNOM25BcUFoZFh6dDVYcFlZWEtzVnQyZVNrRi9qeDVU?=
 =?utf-8?B?MVRKV2IyWmNMRDU2OEpDQ2JGSnZIYlNsMVMxbnkwNUhkV1FRdjZXYWpUbmE2?=
 =?utf-8?B?dWl6ODBBbEszTXBRT3FtaVV5YlFhUlRQYU5iMDFXMEQ5VWVlcVAzalJMR1R1?=
 =?utf-8?B?NlRVYitNWnNFNHpDM3d0djBnd0FDZkFsQzM0MmJJK2IwbXpwbVlOTlBZSTlJ?=
 =?utf-8?B?YlBoUEd1Ri9WQTJXQTRpOTZlNTNycWJsVTFZem9yYkJWVzgyS1NqbGpTcXJJ?=
 =?utf-8?B?Rkk2ZjZPSDAzZUVQVi9PR1NSdmh5bVBDWEx0eDNIcVlsWnNoVFBlOEVVQ0ZY?=
 =?utf-8?B?OHdIMkVMQWlmVlRpQ1o5WTFkL3ZwMGE2NGEyVjA1TzVWVGl0QXNSZHZGSEpG?=
 =?utf-8?B?NndDbjFPTmdHdy9ZMS9DbUVYSFp5Y09JZTRGbEM2Z1pNb2VKK0dNRHNGR2w2?=
 =?utf-8?B?RmNrd09FdGw5Z2lOTCs3RTM5TVBVTVhTUDluaS8xMUpQQTdUY1BrdzhYRjA4?=
 =?utf-8?B?WHp0MUtpakpNUDBRb1Izakk4M0FsaDJmWTJGZEZNam1VejJ1VjdaVEs1WFdD?=
 =?utf-8?B?Zzl3Ty8zdStsKzRzNmRLUHQzRzNIUjJ2UStyZnMyMEZuOHhsM0VPT0dPdmM1?=
 =?utf-8?B?U1JBU0ptZUxvb1JNWTAzUzA1MDhDWnZDa3hSUk5KTXBZcHZFRDU5MDBpYUVt?=
 =?utf-8?B?SXRva1dYdmVYR1JOZHcyVXpVWnRpU0p4Y0FBV2xURnlKYjQ1RUljTW9JSUZt?=
 =?utf-8?B?R2g3SGs2QVl5UFZ6WVRVY3NsVkRYMCtQUjNpbURPWkcweDN1NGMvVWYwVXVR?=
 =?utf-8?B?M0dTc0drMnN1aW96VFlrdUliOWRITWU2L2laaGpWUi8ySVV1dTcza21PdS85?=
 =?utf-8?B?NmlGV3ZoMGY5cXplUFIzZkNNRER0anBwd1JoaGpiM0Nud0ZGK0VQMDNFaXpJ?=
 =?utf-8?B?amNQKzlaZG85dU1PYkFDQlZuMFRUTDY5SDh1cldnS29ZNWxDMFlhcFlycGdw?=
 =?utf-8?B?Nm1rT3lqTjFtQjdlSDFKOVgwM3UrRFVMcmplTkdtVHVOaXkrcFV6bGdYVElB?=
 =?utf-8?B?TkNTcVdMREhzZFpoTzZUbnBhU0tRV3dPMEFDNkFlMkpNNUZ1TGU1N3NaZHZh?=
 =?utf-8?B?dXRQWS9FVzdzSExlUEw3VVFPVUJDcUp5bVF1UTRWNWJJTDJMeUFEbitMVlYy?=
 =?utf-8?B?V3BiY2V0ck5XQ29pK2dWNTNBRDY3SzZPeUNjVCsvVGNMRVF5TG9KRmdpUkxx?=
 =?utf-8?B?REV2K0p0R2ErcGV5M2lOeVVYeFhMWEF1ektqeTZwdjN1TXBqRFltWVZ4bXll?=
 =?utf-8?B?ZTdVTDFQcE1xZWdZWmowMU9ZY3dBeHFBaHZLUENLQ09QbWN0TmFLbEFVN2tP?=
 =?utf-8?B?VmRKb1NFNzhRN2l6KzdXWmZjZWNTZzBMVnFlUEVtZm5nOGh3Y2plbVIxSFRN?=
 =?utf-8?B?Vm9zR1czRmtyTmx3L2xscTMvRjk1RFZvaXJqYVIxcjFWTFFadW1zYUl3R1NF?=
 =?utf-8?B?WFo3eFJROVJMV3E0SkxKNGZOQTFaaEovRzgzNmhLV0xuM1BTY24rZEhndllE?=
 =?utf-8?B?cVpsYlF6cTN5SmRsRDBqbHRTenhiRG02L0RkWVJyaUZHVjB6Yk9pQVRWNmRV?=
 =?utf-8?B?NFJoa0JOSm43TGtvdFdKdDBHQXdPamRrYXduVEhqQkxzSFl5NnU4THEraWdY?=
 =?utf-8?B?NGFHMUtSN1huSkNJYWxtYUxqUEF5VTlBNVVLZWxRWkI3WWxJeGNHZmIzM2dp?=
 =?utf-8?B?Z0JGRXZBeGtPd3d4ZzZXcVJlTHRKMTkvMVZOZDkzZUd2bDBEUzdlU1VyU1pZ?=
 =?utf-8?B?dVFkVG5lRFgzV2tZUHkzNFpLZGF2aDFwamVqQ3FSK3hoUlpId21OdEFGRFI3?=
 =?utf-8?Q?/IOM2zNhLQnp9xqz/uu64Pg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18693585-85eb-4d1a-2aa2-08d9a2ca5b7d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 15:13:45.2758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P6kVvoXtC9ULChTCdd6yCKjhf/3QRjKl9uwWTbNjfzErvsqmd/QPRT9n8MSR+jd5/4/zP3pk2wstq+DXyV29Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

On 08.11.2021 16:04, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH v2 1/6][4.16?] x86/x2APIC: defer probe until after IOMMU ACPI table parsing"):
>> On 05.11.2021 16:47, Ian Jackson wrote:
>>> This part confused me.  Under what circumstances would we backport
>>> this ?  AIUI it would be backporting a potentially-fragile and
>>> not-readily-testable bugfix, for a theoretical scenario with a
>>> straightforward workaround.
>>
>> Well, I've said "candidate" for this very reason: To me, every bug
>> fix is a candidate. Whether risks outweigh the potential benefits is
>> then influencing whether to _actually_ take the change. A reason to
>> take it despite the available workaround might be that
>> "straightforward" doesn't also mean "obvious" here. IOW once you
>> know what to do, doing so is easy. But one first needs to arrive
>> there.
> 
> Could we not do a smaller fix that would print something in the boot
> output, mabye ?  That would be a lower risk change.

Hmm, maybe something could be done, but at the risk of getting the
conditions there wrong (and hence having false positives and/or
false negatives, confusing users at best) and with likely a clumsy
log message ("abc ran before xyz"), suggesting that we actually
know how to do better. IOW - I'd rather not go this route, and it
would feel better to me to simply defer this change to post-4.16
if we deem it too risky to put it in now.

> So far, I think the tradeoff here isn't looking very good: a risk of
> unclear magnitude for many users, vs a hard crash at boot for a set of
> users we believe to be empty.
> 
> As ever, feel free to contradict me if I have the wrong end of one of
> the many sticks here...

I think you've got it quite right. I did put the question mark in the
tag specifically to make clear that while I'd like this to be
considered, I'm myself not convinced the risks outweigh the benefits.

Jan


