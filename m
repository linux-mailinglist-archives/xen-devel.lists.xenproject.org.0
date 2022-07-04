Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06598565274
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 12:34:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360137.589519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8JPg-0003ir-TC; Mon, 04 Jul 2022 10:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360137.589519; Mon, 04 Jul 2022 10:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8JPg-0003gA-Q3; Mon, 04 Jul 2022 10:34:44 +0000
Received: by outflank-mailman (input) for mailman id 360137;
 Mon, 04 Jul 2022 10:34:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8JPf-0003g2-Ca
 for xen-devel@lists.xen.org; Mon, 04 Jul 2022 10:34:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9f08f56-fb84-11ec-bd2d-47488cf2e6aa;
 Mon, 04 Jul 2022 12:34:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5443.eurprd04.prod.outlook.com (2603:10a6:208:119::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Mon, 4 Jul
 2022 10:34:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 10:34:41 +0000
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
X-Inumbo-ID: e9f08f56-fb84-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvwBLxBGFGheFdX8vrn6aUCXNhg42hjQx9Bm4XqOlxWrGC8KfbHtSvuDbjWlnoMlMUENMKXq8xVW+FQk0HJLxwpa7IMSipSrP9K/M7QR/RB8Kwg1lQx7jQI/BIU+Aj5+rLjZCFH4T57eP2wcci0KbedlQTUVBzQUK/AaH8vfpBEdWJVaLtWSc/oynr8+hXWzl2jiAxQrGTqGuI7dC35yPJ/5PUA7JLgAulLahdmmdsKFnkUwq/Aho14DmMPA+P7U49/xXWOGPKH9VTe8qoYArlx5fSBCIcfur97tAcTVNdct+DgqrzrlpHL36MInzNTaZYbHHLMr/a9v1q6fOOkOjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmB8PHIf/cQhH8I0LGZmoGJNqgooPT4bDLvyfiXXoB4=;
 b=BLvQq5m+O/q/ABPntS0x/msnpjjranBMN/MxLwFgYOt8SnnONiApFPaEApogSBh1qs+3VloE7ojKJ3cv8uQ8AXQJSKSm+xCUdlUWT6OJvY+Wnf4XES3qhx062WkxXTkrIRFJh0xEAd3im9E/tDmiu8k2D5jXWiL2+ehZrJy9da5atstTb/5Z/ew6wmemdTVySQdx3jpx5iVnLNSW+mKNmutd6q0arFJuFzdYUaZf1492dLmEGkJ5cqHrGUOt0l8IZbpClAnfnhg2W9JJloSAHXBcYdnAY3rFyl4zAUKG8gvc2TPBSo5+ent1cEGqVaZ4B9e9JaeV3w+ZDK7DRXBwXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmB8PHIf/cQhH8I0LGZmoGJNqgooPT4bDLvyfiXXoB4=;
 b=yPCTXVjnVlJjZnxr93ZBSkNM5LUrtnZBY2uqyUz6Ckf+C3kh2z1cIala9RMuVfn36DBQFxwTc05sq79sXhC8REPLnsqAYFkpJoDV9RVN3/epQDcrEz29+H2yNExOmIncwslPteFdDuq2eVP7i6oy2h3X1ouqBVtffFv7HGPujv87xTD+8btXfxZxfcu93ajvna5a3ywU1pR7LBfMWYiUsr6tKszfhrInuf8gJtHZnbkmf1HfulO9MmriAJjvMkwnezS2Kpo3IZyK/Xc9z/4hcI2fF8HJD8hqjxbidnDtG/R6EQpmJqfL2g9sU/gIXLptm9xYCqsqvKxER+cmsmr7og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b6ca0406-4a3e-c7b6-cc24-3c6397b45511@suse.com>
Date: Mon, 4 Jul 2022 12:34:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: PCI pass-through problem for SN570 NVME SSD
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xen.org>,
 "G.R." <firemeteor@users.sourceforge.net>
References: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
 <YsK3/fDX8c0Tzfv0@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YsK3/fDX8c0Tzfv0@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8P250CA0005.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe6981c0-bf3e-42eb-18e7-08da5da8cd6c
X-MS-TrafficTypeDiagnostic: AM0PR04MB5443:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EXpGeksL91FCriRSo6MKoD2+KndYXy04cr4s6dcGY1V/d6wYrbn7i4nc0yCRk4LxfBMaQ86EDWyCYnVnnulKlLPgDGJwvxmIkD6hlkVTeCQ59Umckna317osVbrgbFUPG0Tu2Ax2g9UYztcm/p4nq6a+lZzlc/3U7itPs+mxoUM3v13VDMmhTs3TUqHy51fO3DKe5yZD1MdM0cPVu0NaDfV5OlXMv8/LhApq/YfjUKzhGphtxRSZfLjbVkOF2A7s/uCmUwnF4hA/euoqlShcXe5YZJktgSc3CDOK9Q0I0TVADgCHN/QbXY4wEUq3Rl2gXLgSZGvtZ4iXQi+mGEHHUW1Tn1KciQtaeiZIbaWeBksniVEqBFIvo/Tt15rEAOyojF2Z/k0hz6WSrKzxzZbSAMO4jpVajV11T7Xt77fi9kGdSUhN042uG4dnWNbNXZmIJmWmrH2mqkYahISRinlpkGYzjyNADKW7hpPvB5rAtk/+in8w/fREEMXjCDoo9j51KXafVJG3PKnN0YSjl9YLxT4niDtmrtRTyYkN3ybo3QFBLPTj+qhFP2HaW0fg8g1lLj1MG5Yjxw13BmyJXwnrcdiqdPw8U5SV39jfU26t7CHDl7+606sWhJYmjOS1+GepVUnyz0Yclif/E3pMgQbOadL/4EQHyNnucH2D71t0079A4XM1rKd3QHQeAV2fdgmChIFRoN2l4w5yC/0Zbljyv8xfGzYqADtklFoSotRZwvrxbl/0Oc1s4rYmvFehPhjh1w3EQMqgy74UdylUt8NkiCpPOugcmVI3TnGLHYaitxZQVOvo4OSD74cAQioBNiSQV6y3BwAXLfc56dfeUJlfKO0RIQVZwdcBoDKD3VP0p4Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(136003)(376002)(346002)(366004)(36756003)(86362001)(31696002)(53546011)(38100700002)(186003)(2616005)(41300700001)(26005)(6512007)(8936002)(6486002)(8676002)(66476007)(316002)(66946007)(4326008)(478600001)(6506007)(66556008)(6916009)(31686004)(4744005)(5660300002)(2906002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2hIZTRwaDJyRGhGZ1dYeU5XRk04MkI3Uk8zV2h4cW1jRGpnbnNTRFlsSVh3?=
 =?utf-8?B?K0JEYnhyNitFVUdwQnRUeGJtNUlnTFJSenl1eFNtYXk4MmVjMm5VVzk5UDlF?=
 =?utf-8?B?ZGpYeXNjZFEwSk9JWnJENDNwcjh0Mkd0ZzNid3RHcWJPeDdzRmc4aDhCdHov?=
 =?utf-8?B?aEZ6TUhBeHJRdFdsRnZwbjN2bGZGU2hWYjljVUV6VnFTRlMvUTJNTExuemRG?=
 =?utf-8?B?RG0vZHRnNi9MUEZNR3VGWXNEMXJlblpLSHQyOXNISW11amd6VEU1Tm5CUXQz?=
 =?utf-8?B?dzI1cW9oVkt6bVJxUExoRE5mTVRFQ2ZkNlFrekRuMGVnTlhEUENPM2JZOTZh?=
 =?utf-8?B?SWYvRGlOZmNsR3R6c0VMOWF2MlpLb25HbUxDNVlCLzBMRzQxUjR5dmpMWWcy?=
 =?utf-8?B?QUJrTVpsdjltSmhXNnJrdEJKWFhnWnMxMUlMNmVIM0VvTGdHSlJDVXMxNS9L?=
 =?utf-8?B?dnFvMkJwM0Z4Q2x6R05UemhrSzV1TG5OVC9ock1pKzFubEdaNlo3VGJJMEJ4?=
 =?utf-8?B?SVVVbjR5WjZaOVVPY3pBVC95MDJNeGEyQjhWSmRHMEU4MlMvSWpJOUxNV01D?=
 =?utf-8?B?eWp5aEpRQUFLbE9KbG1rUUxycFVJelVxTk9vZ1dMT2s5QUNLdCs0bVZGTkNU?=
 =?utf-8?B?cm4yY1ZzNUFVU056bnhIYWdBODk3ZkxaaTRGY0RIMFovaGY5ck4yZWQzWlB3?=
 =?utf-8?B?NjQzenJLQkZnT3NLb1NtWmlRNHJCOUlDZkZRTUQweUd2bnUwTGZmb0NQZnNQ?=
 =?utf-8?B?ejFBdWxGUElQK0d0UGh3OWNOSXkzRGtIYXZRN0pYQUhEMzhzbGxscUo1NDV3?=
 =?utf-8?B?UG5KUHBNTU5VV0oyWmN6MFVVRXR1dEh1QUhUcUs0dkJCTUpEM0pOa1E5RDEv?=
 =?utf-8?B?L1FBaE1wN3Y4QW56cnVCM1ZLRTVwQ2dmbG9mWXJEdGVWNnB5bFFzSmNscFFs?=
 =?utf-8?B?clYxazE2ZWp0WmpTa3JjemxKWjlvc3RqTG5Ia1hhWFpGS3RrNVlpK0swRzhv?=
 =?utf-8?B?UWxDdlVneHRnTmNYSXVwNWZJcEh0WlZVVWU0M1FUSDkvZUNua2FFNWo1dUpP?=
 =?utf-8?B?UE4waE1OS1JoYW92bE45a1JBV0VUVCtvdWdXZ2o4RnIwU0liaXVJL1EyUnVU?=
 =?utf-8?B?Q0hwRVFqMmFBemc0aGxhWnNsUW5HallFYjBMOTJvZXJyaVlHSlhOLzNQSkIz?=
 =?utf-8?B?RDVVQTIxSDhHL2VsdU1wWnJXd0VzenFiU003UXlZUGhJZkVDQTFEbmcxNkpj?=
 =?utf-8?B?Mlo1aU9WNHNXejdMNGhWdUVXTTBNUElKeXBDUDFxMkZobngvck5oOGtvY3ZO?=
 =?utf-8?B?YVZ2YXpjU0ZLYjRoMitsUUlsemtVMENieVo5TFB5RnhFTnlYQ2g0bnBOY1NP?=
 =?utf-8?B?K2dQMHRSRUEzMEdBeFpYc0JTSFdkMGFSOFdtNGZVUmpERFlzbDZKSE9Oa1l6?=
 =?utf-8?B?SThLcXNzTk1seVExL0FOSC9odXgwcEwwN1F1bzBRdjg0bVdTTGc0LytKN3Nu?=
 =?utf-8?B?WVl0SnNJV2NhelU4WmorWGxIalpUNFhqYU41b0wxN3liZng2WXplMTRzN3Z1?=
 =?utf-8?B?ZmgwQW1aTDRzNGxERzRacUdjeC9hQTRVZ1FTeVlwVE9JdWhCaWtnS0F2ZzVn?=
 =?utf-8?B?ZmhaRW5DNEt4UEF1SndHK2ppQS9PZWJSdm01RVBBZlhWaEVZVHdaY21NZnpy?=
 =?utf-8?B?ZmFhbzBNdDIwNGJzVmUzLzVPY1BndmNQVXhpdjdoQ2VLQVF6WDQwMENjL2gx?=
 =?utf-8?B?RU1JU1pIWFc1cmxUVVpaVE9LNGtZWkcvTW8wcHFna1lRQ2draTQrZ2trUmtE?=
 =?utf-8?B?R05xaGhDN2JZNE1Oc1Y1anlsa054MUVKRGV0NWJsSy9abklnRGp0YWR3OGVl?=
 =?utf-8?B?WEdyWVJrN3gwVmlvOHhZSzY1S1U3dEphbGRlcHFJeGdpSzRnckptUXBMN0lk?=
 =?utf-8?B?b0J1blltZmZJTWlUcytlNE5rNVFUWkozb3hHczJnWFNIWjFIYy9ZZlp6dmlt?=
 =?utf-8?B?SHcvZmFCY0RTTHRBQVRtaFh5UXhDb3lXaTYyaHc2MStJMFVEWW1oS3Y0aVJY?=
 =?utf-8?B?QWE1WDZ1UVd1V3dRNU8xS3lFeVc3cXkyZWZteVRjaURKNW9SZXJ4UFY3ZUt5?=
 =?utf-8?Q?srfTLGba7+KzLYm/aitf08rjv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6981c0-bf3e-42eb-18e7-08da5da8cd6c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 10:34:41.0055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +8BWFcyvhMbpdbuilAZZQFQd9WS+D72kWSZKViETSyojmzZz1EDLWrbU0sQIsMZcEIoyGBnR/kiQ4baxtFqgNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5443

On 04.07.2022 11:50, Roger Pau Monné wrote:
> On Sun, Jul 03, 2022 at 01:43:11AM +0800, G.R. wrote:
>> Hi everybody,
>>
>> I run into problems passing through a SN570 NVME SSD to a HVM guest.
>> So far I have no idea if the problem is with this specific SSD or with
>> the CPU + motherboard combination or the SW stack.
>> Looking for some suggestions on troubleshooting.
>>
>> List of build info:
>> CPU+motherboard: E-2146G + Gigabyte C246N-WU2
>> XEN version: 4.14.3
> 
> Are you using a debug build of Xen? (if not it would be helpful to do
> so).
> 
>> Dom0: Linux Kernel 5.10 (built from Debian 11.2 kernel source package)
>> The SN570 SSD sits here in the PCI tree:
>>            +-1d.0-[05]----00.0  Sandisk Corp Device 501a

As per this I understand that ...

> I'm slightly confused by the fact that the DPC / AER errors seem to be
> from a device that's different from what you attempt to passthrough?
> (0000:00:1d.0 vs 0000:05:00.0)

... 00:1d.0 is the upstream bridge for 05:00.0.

Jan

