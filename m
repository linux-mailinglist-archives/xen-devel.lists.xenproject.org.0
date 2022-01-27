Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D7749DDF1
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 10:28:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261362.452453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD14V-0006tI-Er; Thu, 27 Jan 2022 09:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261362.452453; Thu, 27 Jan 2022 09:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD14V-0006qd-Ay; Thu, 27 Jan 2022 09:28:03 +0000
Received: by outflank-mailman (input) for mailman id 261362;
 Thu, 27 Jan 2022 09:28:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD14T-0006FP-U7
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 09:28:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bdf1964-7f53-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 10:28:01 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-_rJbMt-uNI2ggUu_NnutzQ-1; Thu, 27 Jan 2022 10:27:59 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB7170.eurprd04.prod.outlook.com (2603:10a6:208:191::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 09:27:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 09:27:58 +0000
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
X-Inumbo-ID: 6bdf1964-7f53-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643275681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W/5k5Xfd3dQOo/Z7xXpJLuCFx/nll2F3if04cciYiyk=;
	b=B87IwNV5+GWWR4EtwqT0M4+02fmFuLem0QnM41MiedOqk2pGbJ+mrKMVPgO4/Oa1Qc6zYx
	WM/0k3tEJuXktse/FlsvQb48/XK/XA2vDCB26h9GtDirlhH5s+hbgjC+awWMWptzpx3R4m
	VWaLWXtu/U1B1VTztdDPYlz9pZRiDFA=
X-MC-Unique: _rJbMt-uNI2ggUu_NnutzQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUAzvDcp8MOJuQhlTmKToADnfl7w9bqfPfWppLZJvsmopxmjyiF5FLgVSZ8dfktWXNrzpNRk0hm5Jz6QLYOwj6NzkNVcdpg8rHHLbMrV/jeI2tsm8OB9/Q24vvWZU4OzNwz6Ipu1oc0YdXT74jJ/spCpMGqycWWeb6XZHqjMfMteLdYY5y5XH1IIRGgjx39Zvv98QZrQLeMT8gHCRtuiHkKs9EEIUSATsGtsO9iXV7QslMEum9Yknew7kLkzBI7dJfW2mFaT4JV5Z7u/j7YImlrcA+sf+USpK90BdYxh5AYcRxYpwI/I+/K0w1ZgEz1lzByuVVSxN8HVBAvfEqiUkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAJMKBzHmpJiyKX99hTGyy4QJF5IOpcj1B8d/meTB1o=;
 b=JBSBBEtaAb4N+qIV77youN/sKdpz+hWOI6+FY3jb1Em4TnDyODb+b8OPYUPtOSFcKps+ygXS+zPdMsCP9qtovVLRY8YT8KDdd2Q8Rn28BCe18Du64w8vLCcwIrupqpXNiSjWlAK95Q4zGuq65E5GVuoTSryAWJKQM6+PODAN7I0AYRDCJyUoz+CBwdVtVWxNmIJ1VylFivjyorBiSbK6/9pMDjxHvhG08YfVN3mfX2e0aAKHKFahDv3oZU0R89bnJxe0hpjTFKE4UnR9KmX5FEZNFnADHhH4TMYoicE8AQQ+CKkx/takBz+aco2tf64wUUmfUe35hmgFNllYWrsbyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <677bb034-242d-e9ce-00ce-57e7214fd4cc@suse.com>
Date: Thu, 27 Jan 2022 10:27:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-21-wei.chen@arm.com>
 <d80da027-93ac-4819-ef7a-f3fd8592e443@suse.com>
 <PAXPR08MB7420AC9A05A6118642F544BD9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <PAXPR08MB7420252BFA15D032BDDF2F4A9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <e135adab-8b21-8dc0-2518-e505a59feb9f@suse.com>
 <PAXPR08MB7420EF1360C2E1D63D278A1B9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <b274899d-55f5-1851-82e6-69898d53e726@suse.com>
 <PAXPR08MB74205D98C454993DCFAE4FFC9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB74205D98C454993DCFAE4FFC9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0039.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a4bd808-fa7d-47bf-6691-08d9e1774e2f
X-MS-TrafficTypeDiagnostic: AM0PR04MB7170:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB71702DB47FFAF62721FB5FFEB3219@AM0PR04MB7170.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MTOUK4VlqJco3ZvNuCc8yEaTsqpoiahLM3SyWjygH/1eohvA1sFidvdqXdjYfAZ1+oU9ggOBm95oLUHVm2xm2pkXXyMfunMT295IJ28cTR111Y9lUMoOiexrQJfg4fMLxV41Q+EqConjX0fAkMAcy2wVz2CD+g+K/wSC3D99miBWnV6Dk7+9/Z4m7SV5arb9zzvwYLy0vvO4Mkt2222982t9ILy8WmGKkRbW/1VKjSUl4qzgcdveA2fFsFTIf4zeVouBpNpkFfKYDfK4HKU/vin+buY1CeLJJqUHVwQfjYtX2wFg8l+dT7xykkbzDHJaT4KF34G2FO3vJnL2UPsRI357MbU3B8I/l1T9C+tzT7QRJ4zyMo8CBfSCOBz9IbP+pwU5ncGtkkkpPyqZnkVyjGgZ2EM0LQnvb4bq+dCBJyaQiy9IXx7ZWL0Ywx5h571ApVqBACLPxK8GDqvLOXbPj4niJvKDIM4Zr8Ygm+eFvM+CJGT/g1JPglqPokgBfcqI69StBiUpiv+O2hj5d1C6mJe6AqD6uk9ni0odu7K5a1gjGp4Nq28vyYfImRIEEAfo1jpOLAym2nfJtyDZHNbuFFJ6I23actfMwBnXXuDKksVH1EyQEEwxFDKxLM+mNDlfy6LZaRjO6lNsszwCPfds4lUFME3kNuMKENYKuqrSpmpBbCJD2+k5R/q13ngyoHZAYoPKMgpCO+rpn43KcpebZ/LbnpFH6xCmb/Efh0NAVgs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(6916009)(54906003)(8676002)(316002)(31696002)(4326008)(66556008)(66476007)(5660300002)(66946007)(8936002)(38100700002)(31686004)(6486002)(2616005)(26005)(186003)(86362001)(508600001)(53546011)(2906002)(6506007)(6512007)(83380400001)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g0kptFLE8XdHx2F61skXIdHR/OgLwM2u2FJLsOx5hXfu8bJYRJy+yztE5YF6?=
 =?us-ascii?Q?FJGD4pynV9V3hX32M0TeZnr2+TS7cbG7eKZ6aU1mYW5tusGLN3XSZJ7oetLE?=
 =?us-ascii?Q?STMocgSyVO5oRFfqPAELrOoKUvgbd9CoiLkWnUCcmMCwh5mrj0CZQE9NctjY?=
 =?us-ascii?Q?5YUK7nUwDwI8a7hywuq6UL+6qDjff643PGRrawNhjQNKg/oSL24+HFlRp2BF?=
 =?us-ascii?Q?4r5Mmk0OeeEn3niZ3Ltg6k/gPKLZLlZ2q7eilm2DG20SnvdWlTBEhvbKnlCr?=
 =?us-ascii?Q?7UQk16FEuDrqFEjREBllPZO6uSgped/P9nEKHQUB2yY6FeDEDI7oXfgz1NPa?=
 =?us-ascii?Q?Rz0IhmIyKbOGDaLz9bdg7TJUSNChHyhLIkj4EZLryqH/neUd1EusF/GNUD7A?=
 =?us-ascii?Q?DnRYOZB/rlIFovpctAhnkYN0TLgIndIAGtWquOflKLC45MyNh/2smREKvIUT?=
 =?us-ascii?Q?ftn4k4N5nMAGU/XbG48KaDAFvAhgA7jitOyHi96A/+g7GZSdxW6AXcPE9V5b?=
 =?us-ascii?Q?0G4ztzWDGWWt2Cta+bcSxZkVD3zQvM9AJAPlnvKxwBmHSOieRqbAuV8stnFJ?=
 =?us-ascii?Q?D+sm3llulTfQnQTnZgXQhE3vYNvykgml5ID7HRXPj5k5C2Ym8qzPHzWsHewp?=
 =?us-ascii?Q?gKssbU+Qf547TSg06MhTZmbo5CSEHvu3x2YeFSXMMA0ABUYHqMV7T4EIonFn?=
 =?us-ascii?Q?rg0XFe0q7g4RlLRDDbBFA7MvExWk1pH5rCPFvx1NzDGbgT9ZxY/Ph5DQyMNC?=
 =?us-ascii?Q?HTPlbc4XlAIUZgztYW7MgZpGMqfOJLpaRatGnrwrp05gIZ1vvZ7/8EdrsVub?=
 =?us-ascii?Q?88N4FGGeVd1EgxSg6z6ts409j4aG/XOf9f4/l8rQfKe53j3qWrHHVGOcPYTk?=
 =?us-ascii?Q?G38gae51b96iVlqxqFTRnt3UkEYOuPOM+4j6k0rL/sV9YsO0nMJX+a6M6X2x?=
 =?us-ascii?Q?THghFgN8nzUjXow6tY3lIem34YePGImlE8gjXM8ztwu36fCiwXbRhOTqCm0f?=
 =?us-ascii?Q?Fnjo2yk8XWhBvB06r24QE6+SCjp8G9XaYxtyCeiYT/4UtezOOHxokHLFQDfy?=
 =?us-ascii?Q?a2GrMnMEiesgYGSHsQXAwSEciSJir/WJM2tG7SKp3T8aLF5PZSJ6KvK+f26z?=
 =?us-ascii?Q?pjx+7cgA+WfacU7kyNazo+9GjbbADskE9rhotDltNrnePCEDUOvAwTK3DRTo?=
 =?us-ascii?Q?2FS53d8PIPChqYkocBq8Ev36z/Y053qQaAfvjW/LvVzTdcsOw/6yYI5UhH15?=
 =?us-ascii?Q?0l64QGKSxJt6PyPxXWfHRt/jKA/7JOfmONmuTeOFds2cgvPW4neqIxa7ZPja?=
 =?us-ascii?Q?ikM1tPworTz20e3H5DNaxoDZO2vzfOPVqBj81qD8a7W3kgoDWzYLhd8EhOoz?=
 =?us-ascii?Q?kElLMfSVweaM1Uq1TV2PDENbSL+UC3rlaK98VRAATfF/N5W1LGZkQzLF4xMO?=
 =?us-ascii?Q?f7q+Dy2WuSxcdMoF5UJeVO2hqgPN4WQ3WQ9LdfTLxaGSFPWagJCY2L67a5m6?=
 =?us-ascii?Q?dQ3c998nMYUa/z6PSwJEDLmTO/gH+QgLND5TU/e+AOtrCsj17zjDGB1f7k0d?=
 =?us-ascii?Q?tvC7uDZQizyhIGGPLydPqbBhEoWHm6hnEtFbKt71oqI2K3m3v48zZTGdn8HJ?=
 =?us-ascii?Q?0v266xapI1OepXroNNYKDuc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4bd808-fa7d-47bf-6691-08d9e1774e2f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 09:27:57.9972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ngU4dHdbv/x5tju0wI492YrB01uY1RdMkvhlOqv2k3gFSBoe9NPzF/WJCpKZl8LgaYD73MTQN3T0fTjz9uQgtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7170

On 27.01.2022 10:25, Wei Chen wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022=E5=B9=B41=E6=9C=8827=E6=97=A5 17:17
>>
>> On 27.01.2022 10:09, Wei Chen wrote:
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 2022=E5=B9=B41=E6=9C=8827=E6=97=A5 17:00
>>>>
>>>> But you realize we already have such a stub file on x86?
>>>>
>>>
>>> Yes, we found the redefinition errors that are caused by x86 stub file
>>> and new macros in stub.h. We had tries to add:
>>> ifeq ($(XEN_BUILD_EFI),y)
>>> CFLAGS-y +=3D -DXEN_BUILD_EFI
>>> XEN_CFLAGS +=3D -DXEN_BUILD_EFI
>>> endif
>>> x86/Makefile to gate these new macros, but it seems that we may need
>>> to change EFI build logic for x86. It will cause more risks for me.
>>> So I want to introduce a similar stub.c in arch/arm.
>>
>> While that's perhaps fine, ideally common bits would be common. Iirc
>> already back at the time I was wondering why stub.c had to be x86-
>> only.
>=20
> Some dummy functions in stub.c can be shared by arm or other architecture=
s.
> But some functions like efi_multiboot2 are architecture dependent.

Right - that's no different from the bulk of the non-stubbed EFI code.
I don't really mind you making an Arm-specific stub file if there's
not very much duplication, but it doesn't feel very good. In the end
it's up to the Arm maintainers anyway.

Jan


