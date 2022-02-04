Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F174F4A9538
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 09:37:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265169.458473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFu5G-0005ku-54; Fri, 04 Feb 2022 08:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265169.458473; Fri, 04 Feb 2022 08:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFu5G-0005io-21; Fri, 04 Feb 2022 08:36:46 +0000
Received: by outflank-mailman (input) for mailman id 265169;
 Fri, 04 Feb 2022 08:36:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gJ0=ST=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFu5E-0005ii-LI
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 08:36:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94c420af-8595-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 09:36:43 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-P5p9eoAONY-4UC6D0kgTsw-1; Fri, 04 Feb 2022 09:36:42 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB6291.eurprd04.prod.outlook.com (2603:10a6:208:13c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Fri, 4 Feb
 2022 08:36:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 08:36:41 +0000
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
X-Inumbo-ID: 94c420af-8595-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643963803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1TotICqAwwNoNsvdJSgFi+8lkACU119xtP8l1WMdwUo=;
	b=LAk2X2uvhyADjEQzVanBgBiQMkQ3FUn+tVMkFHfz/OjITh81W45DByOMQvrMMGyO1PF4nI
	zlYseTtjoC0pIyro7d7tig84I13v62ZZ/Epv5hOlW8UNIGx3i/GCOd7T2VTV4bvUn8tG4u
	mk6WrKYT7bir/4cqabMpZKW0wn3KBKs=
X-MC-Unique: P5p9eoAONY-4UC6D0kgTsw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYM9sj1MfqqPX2t5+G230vI8Ljnuy2cdkthCHc5ukLbaDun/cbaq5ZIMFhgLgCH6NNVAfDQHbCU6ClMTYqJ/1ceYoeSySnBDnDOUKgVqY3qLRlAij+q4EB3h1k6vXZWAsfAtwi8iDZNTyuNk0qXso1o6TFO91HvT2I1ABwFTVny6lJwTsh6lNma/kxlLhPC0OwnMMtiGps84GZda4W5jgVPAjT219h6IT96Ci/Q5SRISHkSyLGlHVQXiPg7ei1VSlXdK9HkUoCTGZrPfVTtcEcp7lC/gEpvDyRaVbMTdwNYylHU0BTowqdqo/d51IDRw5R8wkTyAvuhJCHbhKHpnxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TotICqAwwNoNsvdJSgFi+8lkACU119xtP8l1WMdwUo=;
 b=g8x7Fyg9/AYGvFda/UYy2UDl56ssC0NoVcBE4+mlNqz+for2SgOPLNTga6ZQ5qNnRuWkzQSgGGbTO84Ox/nXKymVwwoQfLyy9juKRhdOdfn5D0hRYPKt6azPQlejfPT1Tqgyo7igErxKd+IIXpb3nNABYJbgQoLTLujCjqCnWCaxsa7XuXq0XCF/mPsL6XXnPbX4sSM6pZDsbFZKDLsVTkFxos7kzHCeMjZeztUFVbCzzNZxDJ2TQDVAOs59hYzSNL+MuARH1hEShL4eVDuYIbFS54u/XNHYWqh8bzCZ5JHc/Hgoo4KZMpLKlEEoqG4/h7NJ3ZP4Vh9HeLi1/2Kcqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b413b9a8-b595-d37e-c1c2-5ffab743cbee@suse.com>
Date: Fri, 4 Feb 2022 09:36:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-4-andr2000@gmail.com>
 <7209889d-8f17-61cc-72a4-97f6dbc1d54d@suse.com>
 <fec9b8f5-05d7-8d0c-2ae0-0224318dfd13@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fec9b8f5-05d7-8d0c-2ae0-0224318dfd13@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0355.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3b341d1-2d21-4897-7952-08d9e7b97782
X-MS-TrafficTypeDiagnostic: AM0PR04MB6291:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6291D96F730FF983EC9B1369B3299@AM0PR04MB6291.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/l+IXUicZ9V0dvKkPGTZykbTCqNyQr9U6yfdyZWkA/7nx6vvNPfmLjzHStcAGCbMyvTCkLET23QPIrn1MUIg9wazZrAWiLSIsk5nfwMUMLwhOPPguWDlGsk1FBDvn0SV3jMH4ccHRC3WmQ+epfE3KQMf3q6YJ8s5lnzgxai/F1J23OKSK1hvsJ6i6aFonHpzTj366iK1oAp0XibnyJLTUOGff8qpykP5sF77OGb3dGhvQM04QWV5Z1mEyN86i6gdhwZKoQNjp4Fdoh+tBUvdibJ6rW8rF6GgT99mtc9n/LLsL1AbxuTdXSPTxJZPjvbTS6+aaSsjME+sHH3cz+6JYWLE3ytDLvgLz5YDDXAa1oTLsCyJfJ0Fw+CjUGvHxvoBFD13ZclVjlDgLfFxZip6umUUGgQS5iHGcvXVETthB15hMskkdH26I2EMPE2Msh5lizeQZr+PAo2liSiXHXjKCwmdZOrfcSVgn7LxngEe8KJ45+d8u39eZKU1YseoDsVPSFUP3/ZKd0jFKrcBvgX1tvWva/eYPsvEiK7ht1hDYBcfUHoZUH5MBh6Vmat7TPYRhpvExwBg9mKwuO8+ywaYaLG2IYMHimJdpht9EkjB2vQXuZvzP63VBiU5BLxbLRzAZ4ZrpSgtC173WpKk/RNcL2qMGh9oRbGlGv+MWSbU1DbzmOS8sypRv7B6zuryyaw4dFMEsupEuBhvdgKWrKH4ABsiIrOdbS3dv752v4CXmDo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(83380400001)(86362001)(66476007)(6486002)(186003)(66946007)(4326008)(38100700002)(5660300002)(66556008)(54906003)(8936002)(8676002)(2906002)(6916009)(53546011)(4744005)(316002)(6506007)(7416002)(6512007)(6666004)(2616005)(26005)(31686004)(508600001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YU95bENWZDUvSVY4YjJvRlZQUTdyZ1IvRzNPa2ZoRXA1RE1Tbnh6Q3hBZVRO?=
 =?utf-8?B?UjBqRlowMVh1UGNyakRHOW03eVhpVFhCdzRIVW5wY0JQUTdveHdzM28zNXBs?=
 =?utf-8?B?Y1ExbFJJQTVjMmVMUkJHenAxUmN3b1pWZG8rMlZIYUdUell1L0FraFJ4dHVT?=
 =?utf-8?B?c05mSXg1cU9wUVBMWEVzQTRKam1FOEpadk9LTzZ2NW9kamUzV3JNZTBBcnJC?=
 =?utf-8?B?QVhhK212V29KYWtKcklQR3Y2L0pPY3lhNFVBR3VSTUZXak11UnVYcFROa3Ew?=
 =?utf-8?B?YTZmbzlLa0VhRWxEK1lvWlpKWWhKakJrejhTdUxFaWlBYjZyZitDWXBmL2t3?=
 =?utf-8?B?VFJBMklEMzAvOEtrV3diUEhCeHlsd2dxK1U4UElWNlF5aVhUQ3Y0dm5NSGth?=
 =?utf-8?B?RGZ1OG9DOEYyV3NHTG1ER1E2TXZqcnFhZ1cvRmx4SWcyRlRZN1drelZGOTZY?=
 =?utf-8?B?UWNBOEExK01xK2U1MjFoejlhRkRPQU1CZUJwVG0xVHkxblJaRGk4ajlES0Jr?=
 =?utf-8?B?T1VBejFZOTExRE1FY2N4UTQrTmNwaVBuV3pxY2RxaUVJTTE1R1l2VnpKYkNB?=
 =?utf-8?B?TnpkdStyMEF4MExaWk5RY2U1NnBScGtTQUk2Y3BMZzdVZ0VYSWZ2RFdVTFZn?=
 =?utf-8?B?eVliNWpPUWJKa2ViVzJiMnBzdUtDRW1BRi9sOG83ckZ0bmFKNXlCOVdaeUhj?=
 =?utf-8?B?UkRUcVVRT1ZpSHFFU05GY2VvSVBVT1dCNWw2NGdib3QvL0pPT1k3Vk0zdjND?=
 =?utf-8?B?R3kwYmZSU0V4WFRtYTNqZGVMOVlsQm9pbnVSN3k0LzM1VmZ5K0pSWjlESml0?=
 =?utf-8?B?cnlWdUZqYy90MFY1bG1ESE1aOTRxeSs4aHR5NmxnbTJ0OTQrOFlPTlBGTmNw?=
 =?utf-8?B?ekp6YzlMZHJzdk93UCtzU1k2WkF2S2RlMGRFT00xbjNZRytGc3hVOFFUZ3JJ?=
 =?utf-8?B?V2had3AzZ3VNeDczZUVzcGpNNGRSUEJVb2E5ajhUTVRHOFZJbThSSUszNWp3?=
 =?utf-8?B?YUhQa3FuRG5WZUN2dk9YTmNLT25YNFBaaTBGeDFwZEhMZlJoQjIvWG5hQ2ZW?=
 =?utf-8?B?M3VHSzJLaTRWV0MzZDQ2YVJrSlNiTDVXYmJVaSs3V2xRaE9hZVNESzJzaGFx?=
 =?utf-8?B?dThwWTNBamJ4V2ZrTkVVV0hESml1YWwvQTVLMnpwclFzM0hXMG53UVNjMGlJ?=
 =?utf-8?B?aDY0TExURFZWcmhWUEJhdEc3V1ZCYUxvT3g4NEczL2NRblhCVncvN1A2TTF4?=
 =?utf-8?B?N1ZtSnBTenRQVlFjQzNhZlFWeGZZRWZtYkNTNVBheVJwcVNaZzk5ZEVDcFlo?=
 =?utf-8?B?K3V4VVdBZXFuYzhTanF3Q2VJeE1nK09TQ1poZ3IydS9kVW00b2FzRUUxdHYy?=
 =?utf-8?B?aUlyRERBQmVBUFhrOUk2d25RMll4V2tKOHBSTGhhN045L1k5R3BwanJEOFRi?=
 =?utf-8?B?a09jb1A2OGFQSWJ2T2d4cVF0dkJzZzJacXVTd2toclQxK0FqTC9OVmFJV2Jq?=
 =?utf-8?B?VEhMaE9SMmNGaGNpakovbFBFVTNMZVlGUllQQ1pFVXZuM1JVNGJkVEt4SGZp?=
 =?utf-8?B?Wk5ZTU8wWDVGSGhNM0VVd2lyYTBRay9QSXN5eE0yMkFOdW5qYzZycWhuM2Zp?=
 =?utf-8?B?RHFUWUZRTXY3N1dTVUZqb0xPQWdva3cwS2FCOVMwVGFqeXJBbW9jT05WSVZN?=
 =?utf-8?B?d1lBaWY4NFhKYVVwZ3JaTnRHYVg5aEo5Vk1IdlZ2bGJLYUNMSE1mRFhXTG52?=
 =?utf-8?B?UnNTYTI5ejdJYk9oVmxUcnlDeVJrbmJMNG9Wa3Q1N3NFN3RseFBkNjByZkkz?=
 =?utf-8?B?Um0zbzcvbnZBU05YLy9DdXoxUzBvUlRneHFpV3JhdVY5ZC9VUjA3bHFFME5m?=
 =?utf-8?B?eFVxK09EOEh6WkVKNUo1M0JGTU9SeTdpbktaWmxTM2Y5UUUya01NNkttN0xw?=
 =?utf-8?B?U21jSVkxL1RzbUtzeitPcndOTTJyMkZITFZ4QVVDYUVUU0ljb0dqQnQ3b1JR?=
 =?utf-8?B?NFJDZjd2cnE5SkRObFR5WkVhK1hwcU42djY5ZXhGRlp1M3FsM2s1VWRXWXJO?=
 =?utf-8?B?R25hNTk0TVlRN0NRRnNsOTRBVGdWYURnZkx2bUR1Q3Jrb2F1ZzQzZythU2x4?=
 =?utf-8?B?M0NjQldjR2FpVTJNM2QwWEpvaDYxbXpTZE5Pdzc4RURQdkVqS1ExcjB2Rktj?=
 =?utf-8?Q?ncM3sNBfU2Hoy1RcRg5HlAc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b341d1-2d21-4897-7952-08d9e7b97782
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 08:36:41.1203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfG7eN3YP5Ojf7E0pTHHIplaiXvK8eMcHKRJ7qe2QCFBClFP0t9mWtmxbDsHjPTM62J3mD1IbFvobfcsOETGUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6291

On 04.02.2022 09:13, Oleksandr Andrushchenko wrote:
> On 04.02.22 09:52, Jan Beulich wrote:
>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
>>
>> At the first glance this simply looks like another unjustified (in the
>> description) change, as you're not converting anything here but you
>> actually add locking (and I realize this was there before, so I'm sorry
>> for not pointing this out earlier). But then I wonder whether you
>> actually tested this
> This is already stated in the cover letter that I have tested two x86
> configurations and tested that on Arm.......

Okay, I'm sorry then. But could you then please point out where I'm
wrong with my analysis?

Jan


