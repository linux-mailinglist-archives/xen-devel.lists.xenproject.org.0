Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9A94ADA6C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 14:53:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268370.462202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHQvQ-0001t7-NS; Tue, 08 Feb 2022 13:52:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268370.462202; Tue, 08 Feb 2022 13:52:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHQvQ-0001rB-Ib; Tue, 08 Feb 2022 13:52:56 +0000
Received: by outflank-mailman (input) for mailman id 268370;
 Tue, 08 Feb 2022 13:52:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHQvP-0001pr-G3
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 13:52:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69d4eb6b-88e6-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 14:52:54 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-3DC1BjnpNmarerkCrVEtuA-1; Tue, 08 Feb 2022 14:52:52 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB6691.eurprd04.prod.outlook.com (2603:10a6:208:17a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 13:52:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Tue, 8 Feb 2022
 13:52:50 +0000
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
X-Inumbo-ID: 69d4eb6b-88e6-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644328374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vzThoDqH63O1U50rIVwI3pPFBPNpdKBHP0mIpM+R/QI=;
	b=T/U28dlKZE+KgbymnbtNmZvluQ1Hto74f9aaC2VURFarxBW4DnUcFbvhS5SWiqE5VZdLy1
	az8cGQuFSiDQwQRVpObDJNPQchgZeJXVY3+VejBN1fWwxK9dV/9AbCLsf5tnvAMmldS8H8
	RBLy/Lz+Yduy3doLlNpgtUDzn/7NCNw=
X-MC-Unique: 3DC1BjnpNmarerkCrVEtuA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wu8nloiEPtfyHqCXlHdqv8H1Bi1GcSNTOYEnlcZ/Jwk1keUCkfu2ZXUO01XT8IoWQqN6XSaKMZwSakzxcQGnPYibNW8QJ8JDpKq4DPvvSET658h5OZPIWsos+KCa+s+L9mMBs5eSml2FfQe+sr2V/F1tSJkNxCv4U2KnKuikCJBaIs7gActUHYkk4xO8Nm2qv3tSP/s1twdqqPhkJlvU2DYHC3JThcuhz/LpQ409ZYwrPN0Xea9Ebl/esbX4tD2cIAChkI+ojt9nZ/Au8LMnse0qLTfcvxVkjpbTLimThInnGtmC//klSU2pcPA/c2Cy3oksf5JQWPaKTknJhHK0IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzThoDqH63O1U50rIVwI3pPFBPNpdKBHP0mIpM+R/QI=;
 b=jf+2IT93kn2D1FsnljDDFGahC6CgjSgNf1u66MfD/moMQVHNmjZRhyPro7F4HaySwiDgLB9uokKV/0hPpwQPDUVY+hVwo+YJ2tQ0GaHDa15vjhgYQCc0+pPF1pILUkdRJMQmJ5Zck9Ws/7dyYc2Xwen7VoLHs90Xe1N1j0wbVY1Juga4hycOpb3Y08YUJZaPuxq+dQUX6KX90hNThmaYHAdzVE/7o7Dja/0dnHzDwQbPw2mZeZe7qrb9Jaz8xLlcWJHadhzJHXa8PKCFvurS9FRI6cel1jNSDi1ZCpGKEa0V9ytcxcZ3LHTNDIHxB3izb7XS3escp04NhLxwQnOgIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f725c58c-1f70-893c-b6a4-649c636263ec@suse.com>
Date: Tue, 8 Feb 2022 14:52:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Content-Language: en-US
To: Jane Malalane <Jane.Malalane@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220127160133.11608-1-jane.malalane@citrix.com>
 <20220127160133.11608-3-jane.malalane@citrix.com>
 <8b59b7d7-2d0a-0b8a-f936-1e537dfc4f9a@suse.com>
 <a4af7c49-99af-b66a-a05f-2907fa6d50f1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a4af7c49-99af-b66a-a05f-2907fa6d50f1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0031.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0738cbbe-a235-4e26-fddb-08d9eb0a4bfd
X-MS-TrafficTypeDiagnostic: AM0PR04MB6691:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB66915746FC180536F954B1FFB32D9@AM0PR04MB6691.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0Br3+/roqMWHu/IMvrmwUaCqHTcf5soZgwPSoj7O7sEpPhv8460NRdvJ50QUJQnODQo+oMxf0Fyy27IuS/DWwoQJo51Ot4Q5O6bSiO0pXnyTVrRyLn658/kJOk9gslk3kCggKOPKTyba1HkInbO9RPt+zygM3E9zRrigSVB3fVDhN9Ihd57IfvAAeWbo/lJrQpDHm/rUHJgrTfJzVA7v/9pCbmPKSmRH+7rVm8lYq+/CGBveqEdiRplA/RROg51Qts9CDvrXKrHYmCuIqE/F824HmSJ6LurSL5E9RSqnrxFslWVXd9qcs3aKMWn1zIhpjC/zlW9dfRoTByIJF9wO6rO8Erdt/31cYDZl8LOdPtIWarbpC/wvLnm+8Vb9Te1lwJf+pDD9DaBEXt8fk+C3FwMONihcTGIYuRJGX/aobnLRmk2y08hoW6pgIifsaOcEOB+gXXlpvWZuSdiLg+lvFFtCNsaZHEeQnq7X7JLOvaxGMIEcMGVlKUnnOnEG9uKM3GcKIDNDxvdIttJhCe+/V+F4K0escQn4dBu5UdJ9HnYvZk/USZCe03zvMxE7nD9w3oqJ6HGBPyqFiGTNCj/yJqWL/b5QjAA5anu35p1SqH0b25sULtV6z1o0qOeduqmmSR+TTTnGxrQLj3lbwTAKCzLX29Q9/aoGLh0vT1xCkU2JmaQTk2yLuI2HF/K9x09e/kSegXA1T5dvcSwMJtAV7LoyMUXU50YkAgZXJXo7dMB/ITqeFXZdeu1eHhqEEKXF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(31686004)(316002)(2616005)(8676002)(66556008)(66476007)(66946007)(6506007)(31696002)(8936002)(4326008)(6512007)(6916009)(53546011)(54906003)(508600001)(7416002)(86362001)(83380400001)(36756003)(5660300002)(186003)(26005)(2906002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MldheHVMTU9rUjJ5Nmh1ak1hTEhLdjNVSFowWk5Pb0grbjhMS3VtTzUxMCtn?=
 =?utf-8?B?Rnh2YUR4UlNRNGxEM1NQWkY1TEN6N3ltbFVRQlNoTXFFTjZKLzhkOW5ma1Ry?=
 =?utf-8?B?Q2trSlhuUFo4OHdwMFNJdEtMR0ExU2xlTWtNQkVQZ0YrRjM0Zit3NzZPL0Zv?=
 =?utf-8?B?ZXZnTm15Q290RU5oU1QrMGQ0MDMxV1dwbTlYTFNKN1lHdWRRMjdnRngwWHNO?=
 =?utf-8?B?WEROTWRjNUJNY2hJWGsrRFhvUHdGdEhaRHVSMTBWMDZWb0NheGdJNjRTV2o5?=
 =?utf-8?B?dG5KdWNLVjZWQjhGUWVuc1JWaVljaTRDeVJRZmErMGo1QytpZ2hadlAwcmdV?=
 =?utf-8?B?NDU3QnA1QXl1ZGRlck9paTc2blM0VEpPSy82YWFCbmJyRHcxb1BRY09obGpo?=
 =?utf-8?B?WHEzcDBudzRjZEpHdmJNc3BtTnpIUTlZeDY3djBoU3dPclg2eGRQendhMVRL?=
 =?utf-8?B?bmpZNXZBVGtheGxlaDkzRTREdGFldzJQa01nd0ZiL2JrdmZXMmtZMDdkcEwz?=
 =?utf-8?B?Uk9FWEhBdC9QKzFHeWRsNXoxZlpHUG4zQlFjQXdiUHV0UVBwM2wyWFROOHBK?=
 =?utf-8?B?TGc1K2I2REh0aDRQMGE0Y1JGMzl4QkpiSHYvY1FKdXZlZ1J1UkZ1bWFEWitJ?=
 =?utf-8?B?Ym1XZ256ajUrNHdla0FLOVRETUp4bFVqTWFSM3R4cWY3K2J2L3ZLWUkzTDFy?=
 =?utf-8?B?anlVclZoMDNWcVBORVk0VEhQV0x0alpkRERRSXpmRVNZUi8vSUE2dzRvS0JL?=
 =?utf-8?B?SUpLWEliVE43cFFUOUIwRG1RY3gxV0tJQnB5MUpwLzZ3dG03OWNVaFJ0ZVR1?=
 =?utf-8?B?aXlaRzArS3hPMXdwWE9UYmhVZWtHazRqbjRUdFpwUTRTSG1oN21Nd3FNVkhl?=
 =?utf-8?B?T1dLWEEwaGZEb1FNM3JIaDdxaFh3ZFplaDRJWkZKZUl2ZjFQb1dsZU56RUNh?=
 =?utf-8?B?UW1LSkFHRmJRUjZlZS9KbkFhei9zYUh3Ny9JQU40S05JbHpvVDZWeGNWVDlw?=
 =?utf-8?B?cU9tRW9KMVlYeUQ4OEJXZjRXbVpFZlh1NFhmTFVkWVBiRlppbnhFZDZ2THFr?=
 =?utf-8?B?Vkk4ZnRHdlh6UE1zRUdnM3JDOGFycnlPWDRuUUk0S0oxSDI0L2VYV2FvNlJO?=
 =?utf-8?B?Zyt5YUpKa2VJbkJ3a05iamtwV1JKdjVRY1J0L09DRytnR29ZckQ0T3hrUTVQ?=
 =?utf-8?B?RGxrWXRMTEpzU29yRW9xMXRHb0Jtbm8rTzVmRzQ2OG0vT21qc1RjRzFxYVJI?=
 =?utf-8?B?VWRmc2NrRytVdTUxOGMwL1IzQ01VcXVLSFBiNHl3Nm5Cd0cxbUFaRThYak1o?=
 =?utf-8?B?QzVFZlo1NzJ2TnJlQVFSd0ZYd01QZis3RFFnQ3drRHp2ZFpnTC92Sy9KUUpn?=
 =?utf-8?B?Uks4UEMwcHRWems2TVBERitSTEhqaHNheEZGYlNJaVNyZXJHRXVJaFpNclRJ?=
 =?utf-8?B?R2VpMlA4OHhZTThnYnBMY29sWm82cThkaWFGNC9HQjNmLzZ0WWVJd2xQNnQ0?=
 =?utf-8?B?WEkvTUpkWWplUEdBb29NOG04cGtINWJOejIzY2ZINlQzY2lmczJFWXlONTkv?=
 =?utf-8?B?RXJ2SjFoYU5QTzg3VndRVG1ZdlJac0dhalU3dHRKd05xOE5BOXUvbFdwRml0?=
 =?utf-8?B?azJsK01jUjNYTzBRQ3hEWDIzeDdFMmVPazVBMGNDMEF2dE1sRkZjVU5ZNVRB?=
 =?utf-8?B?TjJFbjVKUHRJRUdqOVQrbW16OEdCZHFXTGd6L0REck5KQlQ4UitvNjAxZmpx?=
 =?utf-8?B?R0Z5YXg2SjlaQUYrbTBKV2p1bW9YTEFUMzRXeUpUclZ6TGlqRElMbU5qSTN6?=
 =?utf-8?B?VjgzWVp1eHBKMEQ3czVPd3hPb1hsaEhwSTVJeDF0N2JUQ0lqQnhxNVk2ZS9h?=
 =?utf-8?B?WTI3NGx1M0pBc1V3YTZsM2pzNllEMTkwVTVPclRhWUdFT1VGdElkTE1XT2xG?=
 =?utf-8?B?UmprUSsyNnl0VlpKNFJoNXlWWEsyajNiZ0V0bW4rbHdLU1Z4b3BGSTUxUjJq?=
 =?utf-8?B?dTR0YVM1Y0Z0MzYwRzE1cklRZzFaeTlVQlFwaVI2aFlVc2xBcjhkSGQxS3Uw?=
 =?utf-8?B?T3pERHV2VTdlaFN1a0tGR1RrdUhDNkZIQ0l6WHppck1SU1FlK0E0RmR5RGd4?=
 =?utf-8?B?bUhGYyttcCt1dGRQQ2lGNGV4U2lMeHpvRXh6SkdBSnJ2SFNrNjNVbms2RFFW?=
 =?utf-8?Q?SzyeT65rZGLJ4GR1mfw+z4g=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0738cbbe-a235-4e26-fddb-08d9eb0a4bfd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 13:52:50.8022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ISUFoE/hqBUly6zcB6y/+Xx6J4fbqKeV9zvpWBf5qI2ZxMkoC5RuDEae3KUllsQMzhDbODy5PUa//l41+KdpXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6691

On 08.02.2022 14:27, Jane Malalane wrote:
> On 31/01/2022 12:05, Jan Beulich wrote:
>> On 27.01.2022 17:01, Jane Malalane wrote:
>>> Introduce a new per-domain creation x86 specific flag to
>>> select whether hardware assisted virtualization should be used for
>>> x{2}APIC.
>>>
>>> A per-domain option is added to xl in order to select the usage of
>>> x{2}APIC hardware assisted vitualization, as well as a global
>>> configuration option.
>>>
>>> Having all APIC interaction exit to Xen for emulation is slow and can
>>> induce much overhead. Hardware can speed up x{2}APIC by running APIC
>>> read/write accesses without taking a VM exit.
>>
>> This is odd to read for a patch which makes it possible to _turn off_
>> acceleration. Instead it would be interesting to know what problems
>> you have encountered making it desirable to have a way to turn this off.
> 
> After speaking to Andrew he told me of a performance regression that was 
> reported some time ago when enabling apicv related to the pass-through 
> LAPIC timer of a HVM guest causing Xen to intercept the LAPIC timer MSR, 
> making anything that uses the LAPIC timer end up slower than it was 
> before. So, adressing your comment here, other than mentioning how being 
> able to disable acceleration for apicv can be useful when testing and 
> debugging, do you think it's worth mentioning (in more detail) that this 
> perf problem exists, in the commit message.

Yes, I think it would be worth mentioning, as then the purpose of this
change is also to be a workaround there, not just testing/debugging. In
fact this workaround may then be viewed as the primary purpose.

Jan


