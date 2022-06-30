Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1B4561231
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 08:03:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358215.587292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6nGo-0002kH-Ez; Thu, 30 Jun 2022 06:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358215.587292; Thu, 30 Jun 2022 06:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6nGo-0002gs-BQ; Thu, 30 Jun 2022 06:03:18 +0000
Received: by outflank-mailman (input) for mailman id 358215;
 Thu, 30 Jun 2022 06:03:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bdU=XF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o6nGm-0002gm-IT
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 06:03:16 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50069.outbound.protection.outlook.com [40.107.5.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 541b1d78-f83a-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 08:03:15 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8970.eurprd04.prod.outlook.com (2603:10a6:20b:409::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 30 Jun
 2022 06:03:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.014; Thu, 30 Jun 2022
 06:03:12 +0000
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
X-Inumbo-ID: 541b1d78-f83a-11ec-bdce-3d151da133c5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQ+ZQsaKUCnyWJitt8fBJYWrciTqli5VYE8zrk8JLJlJuCvBHr9nYi2ELUHmroy0MBBqxDsOOsWJF82Hazs5akVAQBQhy1nO1SW1SiXGgfNEEm0aziNM0pjHSXIYDrh16XICdLhPwHsAKKvuK7V3jlFLicZEabupCkkElazE2namfHeFjAJmCUZf7Xapc/GH+ewR+68yFRbRHJ3c9vgHbOWCwTF5SypqrwHrhebGCEIemvITFHjvFmXs7G9EJw0+2PNxJ7dEjdBvP/utX+J0RR+2z5J/aNmWJP38Iv89We1No+v+v0fIAuZcDO3sQMk7SIZclii3cJ1PN0Qn9u4oKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJrvZkswdQNrWXwXbUANst9wYDwN/4fVAzNYJsY/MDY=;
 b=ipQHAQgeQdMGCloLr4xKG0jGbocAFR3CMufObnK9QandUpjOGzunk0BV4Kze+1GgmVpW8D2/DI6g/0o6q1VKAEViFd/P+tFdEju4X4iF1Y7XAtiK0jKIcODiccWx0rh4rekvQ4+iu0BRStLUIiAlWK1JwyuleNDQJhqsqT7s1Ikh/UyxpSRYpw24LIsWGKoNXVTBpB3H8a6tffFJT7DcwzUusR7iFy9tP9ZtXkP0g7ArRs3wxTOJ+1rFmNwieLSL8QqhHdAy7FeOfDaAaWM5JTrslnTsas9KVCnpr5eYbcvbwjoR9it8ga0XoTNm1kk+Q5H6inz5b6672oRTOw9hmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJrvZkswdQNrWXwXbUANst9wYDwN/4fVAzNYJsY/MDY=;
 b=E5/yUWvLowa+FoRXz92Exmemahb45RJq1t8llIlBA2703c5p7VrlusBnnVd8cfqk3XvErnrUCiryiBjJTxyKYhft63RNRwdugwRtnQLvfoRJG1Xpn/rC++tbstGqfMauBMTgA8oLJOZzAQBxvAE7XfGvYgSXmga+RtmCjAOvvLF1qRDHGsDWfa/6qxIcPT3MzmZ5SkEnMC1qcW5D4AEn+zZ2z7f+Sz4Pdbe9DrRpbNeqarP6/nlk7/7w5mGQ966/DObMi2s1L1C75rX2pxWXAjsSmo3Cp+zNH3blmS4j+k6AycszS0U5amiQXRa25c+QHgTvblv8/imXmsrcAh82UQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a878aadf-5bc9-184b-d3f8-4e43ffc64262@suse.com>
Date: Thu, 30 Jun 2022 08:03:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH RESEND v10 2/2] x86/xen: Allow per-domain usage of
 hardware virtualized APIC
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
 <rosbrookn@gmail.com>, "Gross, Jurgen" <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Pau_Monn=c3=a9=2c_Roger?= <roger.pau@citrix.com>,
 "Nakajima, Jun" <jun.nakajima@intel.com>,
 Jane Malalane <jane.malalane@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220629135534.19923-1-jane.malalane@citrix.com>
 <20220629135534.19923-3-jane.malalane@citrix.com>
 <BN9PR11MB5276AC94021EA92C539D5F078CBA9@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BN9PR11MB5276AC94021EA92C539D5F078CBA9@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbf2cafc-814d-4283-498d-08da5a5e3706
X-MS-TrafficTypeDiagnostic: AM9PR04MB8970:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5mkLjFrIxy82c5cqGlY9iH1Eyk5jH3gNEGjgcRUL9Lp2aed78lfa/chBW72eMVjEuJWKblnn5Iyls5Y64EI8EoaPztYaF2xFnbcjNnVDyloIfE407ShP4kUikVxfYQhCyRHtYZuFMQIgyKuWxO2xnuuYHhxuD4jzjn+AFlgID0j29i/frSycGF1TAsqTAhbxdk1FJDJBMBFMy5ts6qmX1c6GR9ZlF9Hl97OJbS4IZ6s/mEyQSrDZC/03EXtXh/bBiDjbkezUB3wSkIjUeHJa9JmWRyfNLCqehlxbtaekiiUJ9KSZ23uXEnfDS4hrbAdyBA1jQX0ANGq3gEYSpbOJE+KkK/CmRaUlkDJN6eRBT8zH1NDT4CEKfexINJyKx+pCV5hCeJxc+qIsEj3bEEQDaUtkE8E88cq4oRJ9xJiQV3CE5vdJbYhL9+Rek9Q/YzAfvyfBfY+ahGgGocKjyDrM2FmAfxLuQu1yrq49Mak3dUxPMe8LpzPwhyDbjB1BHK0RUs/chpdC234x4OCgiYjCmi90yFqqxjGtJqRWdTg11a3kJYO5BA6kCSggvjb+DCM8wVJgYoEebk/dJrUBKWr3JuTeagq+F/lsi2QOaYPelRw8icpZcZpp3RVRPluxeEct3gZqzEsI0Oo1tJ4mwnLWjChi+/lI+TOZNgiUYdIteoLCd6dBXhtDpSyJu8e1pbCpt4veExYLIDkJyEsMqLObIS57+BhdWNkcco+mghPCr58o4f20d6y96vO7JpB7JMV6Ri9/0DSgaoOXo2UcZvZqirXD6AxvFf80Xxq4p3w1/BIj8YIQggyHrxTNxePJtrqi722T4n43RRm4wuHT+fHMnTbm3eDz8/gdcYWlLh9nPCI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(39860400002)(376002)(396003)(346002)(83380400001)(36756003)(186003)(38100700002)(2616005)(41300700001)(31686004)(2906002)(53546011)(5660300002)(316002)(66476007)(66556008)(8676002)(66946007)(7416002)(4326008)(8936002)(6506007)(6862004)(6512007)(26005)(6486002)(478600001)(31696002)(86362001)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGZJT3Z4V0xwZEFPUDZEdnRnd2VZWDd1RWp5YmxITnpWSDFOVWdWc1d6eHJJ?=
 =?utf-8?B?YTI0ZS9QQldndmlEV3ZrKzh4dDlQb3JFUzUwMnFmd0tuVzczaXFYUGRhbjJp?=
 =?utf-8?B?RWZkbFgyVHR4M2lndVM4VGZJZ1JSQmFEemtMR1cxb3BVZ0I2ekRNMEhaY1pq?=
 =?utf-8?B?Q0cvTDVSK0lnaGJOZ0E1bjVrNEN0aVpRMG9tck9DQkd4RnEvajRNR1VESkQr?=
 =?utf-8?B?cytDNHJnWlZ4SmpaNjZNVHMyYWZESDNNRm55ODBKT1dhcmEzVFJaalBvVGR1?=
 =?utf-8?B?VVlxSnRHWmJYeVJGTElsQ3dPUlRrZlAwcTNjeEJSbnZiUnRkUHE0VGprWWV4?=
 =?utf-8?B?SjZIZHpJYk9jTmF5Rm02MlZVK1lzb1kzNkw1VkNHeklPL2pTQ1YrM096QzV2?=
 =?utf-8?B?aHczdDJvZGxCMlcvSUFNdGJzMVhhVTFkK1FIU1ArUmRiMGpRdUEvYzlReGZr?=
 =?utf-8?B?UW9QcEtEMlVVUWQrS2VLOTdOdjJ6ZnZRWXpnMWp4aTBuaUdUcUdvUGlwVzFX?=
 =?utf-8?B?ZE9HWndwMS9BazlCaHB0QXV6S3l0QjVMRERmYUxkSXk0dDV0SGNMRlBnRHZ5?=
 =?utf-8?B?UnZjVmNrZkFBTHdwZ09idTVPdXpDUm81Y2pQNUs0L1pYMHdsbTI0ZkZJbTMv?=
 =?utf-8?B?NnJzQW5BeU5xZ0dIRU1mbWtTRFRwMElJVDV6ZU12d1Zha0tEVWR2UlNrWU44?=
 =?utf-8?B?enArenFCQS8zWW00YjBJRmltWTVtMTVKSXZwbjRpMDJKdDEyQWR1ZW55ZXJ2?=
 =?utf-8?B?S2poa1ZLUlM2eGx5VXZKbUVaWWtGOTJXa1ZXc09ZREVnc3JZU0NQUjYxYURa?=
 =?utf-8?B?VnVRM2c4cDE3YXFhdG13Y2JldHg5UDdHdXNDQWZldXQvM0pzWkdoWHZVUlVJ?=
 =?utf-8?B?YjFZZVdmL2VKRFZSdEpSR2d2am84STQwam13UU9WQUQ5SzBVOTNUTXhpYXdp?=
 =?utf-8?B?MUphS2lTbFN2cWZuU1Vwd0M3TnNYY3FRS0d3N0NkZnVwSkFlcy9ZanhqRTNa?=
 =?utf-8?B?YVhIdSt0VXZCRDNKSkdHdUFVUlZNait5em5vRVA3RWk1eS9rYlNob3p0RkE1?=
 =?utf-8?B?a1VTODBFSDhrWlc1TC9TOWpjZGZjTW5sSDE3MkNVNFRGREh5TFNpTVNwYVhv?=
 =?utf-8?B?NE1reGgwWWdNeHdJWFNUZ3o0c3kyUE84SXJnWURUTHNRV3RxNnJ2emVjdnZM?=
 =?utf-8?B?QmJFZjV3Zmx1REtVWU5tSmw0TS9aZmZmUFBxUlhoTHB0V0VsYU9oc3FFVWda?=
 =?utf-8?B?aldjVHpsTUtkZFV4M3NoRFBmcGJDR2pPMkppTjlhZkZyd1dRd1ZiZ0hxalZG?=
 =?utf-8?B?QiswQ2VteGJLWWVOWWF1V21obkc0NGVVL3JHQmhnaEJ1ODYyeGVzWmZISVJx?=
 =?utf-8?B?KzBlNDZ5dDAzZE41ZVgxSE4zVVg2SXJRdGlEMWtaMnBSVW5ERnFrOVcyaDJ2?=
 =?utf-8?B?YnJxS0U2UXVPTS9xbUxnNFJ5Z2VMOW45bEhpenBWZjZ1T2RxdWR1RVZLdlN0?=
 =?utf-8?B?UVBPRmFDRUFQS3RUUHI3VXROaWpwNm1XVmRPQUtFYnQ0RVJYKzJuejZ0M295?=
 =?utf-8?B?VXFyanErWDBvWi9pMXdlbHp0Y2ZqNy9SNVhXVHNzUmdnT0RVNTdET2F6M21L?=
 =?utf-8?B?cHA2VVVXRFpTbzIxWlI5SkQ4TDJTMWs1WDBGSTU1dFVkem9odzdDdTc5a0dj?=
 =?utf-8?B?OUMxWEd4MVc3bmtMcGZya1pzMzM0NGRFeFVxV0EwdnZGWitPNDRaUHB1eVJD?=
 =?utf-8?B?aG9qL2U0RUt6T1BuVmd4U3MydGE3eUpPVzBOTFFid2x3ekFSOHluQlVINXZj?=
 =?utf-8?B?TUt1WjdNbHZ6TEQwbE9LVmNabUR6SFBsNGRmanJqQm1BcFozY1lFdyt1MHVN?=
 =?utf-8?B?TlgyRmh0Z21xZ2t2NmlaMFRRWlhUcXQrbjBqMlRpeHlxQVNtaDdrbkNlVFRX?=
 =?utf-8?B?VFZpYU1JSWpGY3YvMERxWUhYeEtLc1Z2S203Z0tXRXpLQWhqQTEvNW9xZmls?=
 =?utf-8?B?VFM5U0ZMQ1FWQUU0QkUyS1RlSnA2ZG5XSEkzR1BtNzBPb05GdGFwRzRxenBu?=
 =?utf-8?B?SXd1YWlhM2NBOTZpWGltVkVzMDAxYVpnOEc5a0tNeHM0a3IvWWlZaEVPaGJl?=
 =?utf-8?Q?x6mYwv/gCLMM0Kt5pB0y3zSa9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf2cafc-814d-4283-498d-08da5a5e3706
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 06:03:12.5899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQU50DxIWAADHDbu1OJjOHJ2HZkN+gFyqy4wsWXLz5ay+QvGfl24V06qBy3jCybfdOCWKku1aMBDgH3CVSO33A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8970

On 30.06.2022 05:25, Tian, Kevin wrote:
>> From: Jane Malalane <jane.malalane@citrix.com>
>> Sent: Wednesday, June 29, 2022 9:56 PM
>>
>> Introduce a new per-domain creation x86 specific flag to
>> select whether hardware assisted virtualization should be used for
>> x{2}APIC.
>>
>> A per-domain option is added to xl in order to select the usage of
>> x{2}APIC hardware assisted virtualization, as well as a global
>> configuration option.
>>
>> Having all APIC interaction exit to Xen for emulation is slow and can
>> induce much overhead. Hardware can speed up x{2}APIC by decoding the
>> APIC access and providing a VM exit with a more specific exit reason
>> than a regular EPT fault or by altogether avoiding a VM exit.
> 
> Above is obvious and could be removed. 
> 
> I think the key is just the next paragraph for why we
> want this per-domain control.

Indeed, but the paragraph above sets the context. It might be possible
to shorten it, but ...

> Apart from that:
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> 
>>
>> On the other hand, being able to disable x{2}APIC hardware assisted
>> virtualization can be useful for testing and debugging purposes.

... I think it is desirable for this sentence to start with "Otoh" or
alike.

Jan

