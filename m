Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF5E771D26
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 11:32:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577920.905034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSwbD-00083L-25; Mon, 07 Aug 2023 09:32:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577920.905034; Mon, 07 Aug 2023 09:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSwbC-00081g-VJ; Mon, 07 Aug 2023 09:32:26 +0000
Received: by outflank-mailman (input) for mailman id 577920;
 Mon, 07 Aug 2023 09:32:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qSwbB-00081a-ID
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 09:32:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5013e978-3505-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 11:32:23 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8999.eurprd04.prod.outlook.com (2603:10a6:10:2e2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 09:32:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 09:32:20 +0000
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
X-Inumbo-ID: 5013e978-3505-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdonu+AllvND4dz/fTMCTmUtjLTwjSQcssJrHFCeYn4vW6R6RCham6sj7zXhIO3TkxV07cJyuhyg1njVmb+1rvyqHLvYN+DYBjE1fxk2t+HIHyKSWoEKbEZm92ZXUxLOUpnxzm8rkdYQLMKwwUL1H/TmoqlYRrTk4Zi2WmCl1s/3DLSNkcl3Wvda6rccpEJlSx52rUIhSMZdW0uSz6yEtWXhj1mUjISyI+kajL9fvSK6HMaqKrUeY2OmgGsUrrNGgU4pSFoCyg+iI3cV87doFUboOkOxm5CS/VYAJ2lAZyN35SB+Xwu0b/eCje/96nhueebZY1uMaccLfFtTpTwU7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTXauQIP0NXVPNkQRgWkSezlcKBCrt1mjr7HHbye92E=;
 b=ZYk3gTTc7YAgASIQQTneJZUCuRBFsoSm8HzEWuRjI6YkCHfN9CqyVDsKdvDNbhPjnG5ICydPPRy/lR0C0oEdyi0GOn4787RBnRbWnggdYa7J/05HGC86ORDiA+zz1fpNv8I/Q2qxtPY25VZyxh9GijT8T0jwyablcm0kARa/eSMObbELdtrFOqtB02jX+bf3pcpYuUEhrxKgQzK3bPC2NiVGcszW338GwaHwcp2AsnAq8AwicEg69NqKmUNIQf8axZoaVght6IQDi847On3Oq5jcw6HatL437T1XZ9G/Zcik0cJIaB/vuYdf2ymiskrV0lj6aoBbjdAlXlbEMSOLrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTXauQIP0NXVPNkQRgWkSezlcKBCrt1mjr7HHbye92E=;
 b=uHyF0V8cNaooIdZbCuymSKjLYEtHa/cB7JE8X5pK34j5nVgZIHXThpXlk6XKGDSAyo1Z5TZO6NKjOsfouyRXsCrBXPaJqYC28r59LBdDH+122rmXX97GMDj6yisKJ4tx7lCUykfSiirLy9ynpRUawz0IMtfeF+xViflM/hVo5TMi+zfb/gav04q4eUNgpLjncgCWQC5zA9QKw1mLlHzHCCXbZ3bGxirjdg/UokoK60MoHRuvhjnVMKCShhMVqWGy6xtU8uQ1gYaJ9/b12BiT+5nuh3M/x2V3l02++/JZ8ONIHpdlwE482cpDL+9Xa7EdIwQNraHg26RNiP3TlW3cnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <db982273-fc3b-ec5e-46e8-34ad0976cc38@suse.com>
Date: Mon, 7 Aug 2023 11:32:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 3/6] xen/delay: address MISRA C:2012 Rule 5.3.
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Julien Grall <julien@xen.org>, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
 <e67bd46f204bef64cefdbe7a0b447148f7f9c9c6.1691162261.git.nicola.vetrini@bugseng.com>
 <fed4b27c-91ec-7605-1a71-a0b7c6d7e2e2@suse.com>
 <486ba9e1-2bf0-4446-9ac4-33a256f8d51e@xen.org>
 <9918b8ef-0629-d8fb-3c58-6b20b56b1a93@suse.com>
 <43b45003191044cbae170404f6f4ba46@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <43b45003191044cbae170404f6f4ba46@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8999:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f7377a-4b41-45f4-5777-08db972932d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GLpXHd+xx1dMJ31dPkdJuI9mp4VgRKFA0KknzB/HS5gxDShPpXvarDXbtbaxXgtTr09gxWbsle2Hb7V+H4YEjfM8sRfDqIBQvnQIWP36QJ93nz4Jp1FjFJDuXwnyGaBG5g8Ba40goc6rL9iM+yd0vJ3wQIKB6Iv+GwES+ZGyHT5vo3j1OtKy6acmRyLAZV1RVkJ+nNkLOtanvLR5gknXt3cglks5XtPOXuWaALp6S7BRcOtKPSDQpfMrSRm3ubiG4Uz5IZfvYJI5t5D5EYAu00j1EfOGxfHRLg2bebqDQu3LJ+OaJyAjr+UwDuzH0qIEG0I8SW5xFKYiU8BX8Xf+N/fY4DWVVAXx9LNhm8xg5cCOnUwk/rzNe9X9eE3Lc+TjY674v3dflqwdky/ShBgJX4diuNNnJR+PvECj884j39qkVppfgcCjv/XXmUUq1Hd6/bBcCx6/VQG+n42mYqBi9pxaUvHyiLVE32Suidfuu1R7PlMQLhkGqPvAe5s/+JtJawfGfB684AqcZmRvCMkJk7qKBJwY8BtjZGy5KyRhMUogKCBKKIHIHSWvU9gqEbgLK6VvFxSc5Br/4sbTUi02HCIVhSlyrUFs1BIaaovR5NUP5o8qgqpA0dW8pIB15fCC5LT2gxlm+Yis1AYBBe0Jhg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(376002)(39850400004)(136003)(346002)(186006)(1800799003)(451199021)(2616005)(478600001)(31686004)(6486002)(6512007)(53546011)(26005)(6506007)(41300700001)(66946007)(66556008)(66476007)(8936002)(8676002)(316002)(31696002)(4326008)(2906002)(6916009)(36756003)(54906003)(38100700002)(86362001)(5660300002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmRKZDhWVlNNZHc4VzlwQ0tQQ1hMMTNWdGc3OFNjQ3VnSDU4SjZBa3lmWllu?=
 =?utf-8?B?Rmk5eTFJSlk0dmJ3L0cydHhLQXptbkJUWXB6MTFKeG1EbFFPZ0N3Y2EyTXFp?=
 =?utf-8?B?N3h6d2M1UDlRengzY2VsODQ1cHdiUEtpVElzQW9OZUNWS1FSR1ppaFp3ejZC?=
 =?utf-8?B?LzViS3ZhZkVHdUplTW1jbnIzWmdhVmRXcjBOMk5QMXVqTWpoS0Jya3dJSjFV?=
 =?utf-8?B?U0tPWTVhYzdzVUFnelpHbnNJWStZbmNrSXZJQXZQcGd5MGJrWGowS253YjJK?=
 =?utf-8?B?YmE5Q3JqaWRsUFRXNXpubU05U01jT3ZOTXpKajI1bUZGRUloY3BjRkxJbTVV?=
 =?utf-8?B?TVJoTFBBVTBGVXpDWW40MHEvSTVIbFpINUYyTWIyWVNtWndKTk1ia2hLcFFT?=
 =?utf-8?B?WHd1eUdXRWt1cS9wb1libE50dks4M0lnaktxS2dnMXNpbjdnbmh0VDRLWmVw?=
 =?utf-8?B?QnJkcWlkdjVUZkI3L3A3N3ZFcG5rNUVVcXVXampDdkdBSktma2JLUDBlVStR?=
 =?utf-8?B?cEpyNWhXNGNDeG1jLzB2YVFLeEE2VHllT2xvYXJrbHZnN0tyVENpTm5zT1Q5?=
 =?utf-8?B?c056WWdHems2RWg5Tm92MWxobmhEVXZhcHQwdkNQdmptUG5CUTRhZVo2ajZF?=
 =?utf-8?B?UnhySXJ0cytGdWxsTVJsMFdEWVc5NEdIalFNbVVDWUd1R3Q2Ymg0cDVoU1lV?=
 =?utf-8?B?QW5rcWpJU3JySUNtVWkveVBPSmlOdXpoWjc4TjltbWtpdE5aaEJvTVZORmNR?=
 =?utf-8?B?cVBIM3JrakhUaERSbXU0ZkRRb0NpaGRKcGNXZEJ6Vk9tTzc5N2xrc0s4TURs?=
 =?utf-8?B?Rk1JRkdVeEtkQlV5b0lXRkk0eEdybENFKzBjWkRKV0Z5YzNpUGpoZXVNdGhy?=
 =?utf-8?B?Mko4cktNd05INVNoN2lBb2c3NVYzUjdQbWVydUxQTkpTUzd3K3lBejhnQlVP?=
 =?utf-8?B?U0Z5RE1xSXlXNlRiMkpyK09kZXlwejBzUkxVRjNubXJlZVJmSlBiWXJmeHpH?=
 =?utf-8?B?ZytuNkI5TlVYMkdlRlltTDhFMy9XWDBoTVpGZ3BUaGRhQXo4MHNQenlCbmNC?=
 =?utf-8?B?TG1NSmR0TzQ5aXhWYzZWd0VEVnBscVVCdzc4anFUbzN1TlZULzVRL08yQTd5?=
 =?utf-8?B?b2IrTmZqUlI4MDN6UllhdEZEYkFPK3J2UDdDRy95dFdWbXU3dzd4dUkyRE1U?=
 =?utf-8?B?S09ycmdwRlpBLzE5YWdUZjkvT3VQUjhUZzh5V3NZc2hpKytOdmFHU3RRTnZx?=
 =?utf-8?B?b0xhaFJDM3lzL1dNcmNubkhrdTBPckllZ3BSWVJ6bjNlUzErTmdPaGg2ZHht?=
 =?utf-8?B?VndIVnFnSWZzcUozWStyS0pWdGpjNklFWC9TZ2FET3V4TnJzQWExdXdseWo5?=
 =?utf-8?B?OGZNWnk1bDlpNEUxYzRtVjhzSzJEUnJHRitBeTJidXQ3SjAwSEVEalkzcmtS?=
 =?utf-8?B?cEM4TXRNRXdaNVZIaUlWK3ZMbEJuM0JONTdiUmZsc2h2Nm51STRlNTRwL1VV?=
 =?utf-8?B?S0JkeUR5L1F6alUzVVJMaU1BTTc5UDB2Q1VoRTNiSW1yaEJNczdZNEk3VStu?=
 =?utf-8?B?eTROMTBlSzNxK2FBQVU1Nmp1ZEkrWG1PSEpmK2lVRXU1aEtLNE5lRS9mZjM1?=
 =?utf-8?B?dDd6TVd5bmpsamZEbnh1VlppbURkYzlLaDZXQ3h4aTg0R0RFSDFjRTZ2TmJn?=
 =?utf-8?B?bi9QRWJkdzFmMk5WR0tpYnVvRW4zbEpMM05mV2VvelpDNkpIalBBakVHZlYv?=
 =?utf-8?B?UHdvRDlRNHh1SG5GNzlVK3c1dHFuVFNwVEdhTmhhdVA3czFZeU5zREEzR0FY?=
 =?utf-8?B?R1ZBRzYzT2hRYnRtd1pvTVQ1L1NZMU5MeGU4OHFqZWRTRU4zTXNDVGxEZHRF?=
 =?utf-8?B?enFsUC9PZEkzVnZNNFA5RVlUejRUYUNBVEIybWQ3bjhubmJBK2E5UExCSXRT?=
 =?utf-8?B?RTlaOGZhbkpYNEVyQ2lXaGxUMVVjQ0JHQWtFOG9vWXZsalR4MHNZYk52VTRN?=
 =?utf-8?B?eUZZWVVQOWtkQ2JudkoyMnZvMzNMNmN3UU9IbGRBcC9iVzFCVlpBQmF1MjJm?=
 =?utf-8?B?SGhCR3JyTXROaElCdkNsZE10anhKUDNBYWdEdkN6ZlBFUS8vZzNtb1YvQTd5?=
 =?utf-8?Q?XPTyiyq+3EM92+iDxlSiraHjG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f7377a-4b41-45f4-5777-08db972932d4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 09:32:20.6639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GzEiulYh9Ep9+gk/ttx1dpeiDpIHuOYa0Q8HvtB9qvT8On5L8jQLmygNdaNPeI9k3XRfkH7zNtH9xyHWZzBSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8999

On 07.08.2023 11:23, Nicola Vetrini wrote:
> On 07/08/2023 11:15, Jan Beulich wrote:
>> On 07.08.2023 11:01, Julien Grall wrote:
>>> On 07/08/2023 09:14, Jan Beulich wrote:
>>>> On 04.08.2023 17:27, Nicola Vetrini wrote:
>>>>> --- a/xen/include/xen/delay.h
>>>>> +++ b/xen/include/xen/delay.h
>>>>> @@ -5,6 +5,6 @@
>>>>>
>>>>>   #include <asm/delay.h>
>>>>>   #define mdelay(n) (\
>>>>> -	{unsigned long msec=(n); while (msec--) udelay(1000);})
>>>>> +	{unsigned long msec_=(n); while (msec_--) udelay(1000);})
>>>>
>>>> As elsewhere, please also adjust style while touching the line, at
>>>> least as far as the obviously wrong case goes:
>>>>
>>>> #define mdelay(n) (\
>>>> 	{unsigned long msec_ = (n); while (msec_--) udelay(1000);})
>>>>
>>>> Even better would be
>>>>
>>>> #define mdelay(n) ({ \
>>>> 	unsigned long msec_ = (n); while (msec_--) udelay(1000); \
>>>> })
>>>
>>> If you are touching the style, about converting to a staging inline 
>>> and
>>> also splitting the line in multiple one?
>>
>> I'd be happy about this being done, but I wouldn't want to go as far 
>> with
>> on-commit adjustments. Nicola, are you up to doing so in v2?
> 
> I'm afraid I don't understand what "staging inline" refers to. Other 
> than that, sure thing.

Surely Julien meant static inline.

Jan

