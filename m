Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A89537693
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 10:37:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338368.563133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvatv-0005zQ-7O; Mon, 30 May 2022 08:37:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338368.563133; Mon, 30 May 2022 08:37:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvatv-0005xV-49; Mon, 30 May 2022 08:37:23 +0000
Received: by outflank-mailman (input) for mailman id 338368;
 Mon, 30 May 2022 08:37:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nvatt-0005xP-3e
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 08:37:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7a7cc1a-dff3-11ec-837f-e5687231ffcc;
 Mon, 30 May 2022 10:37:19 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-KfyWfLeaMsOU0Obl9lRU1g-1; Mon, 30 May 2022 10:37:17 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0402MB3581.eurprd04.prod.outlook.com (2603:10a6:803:3::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Mon, 30 May
 2022 08:37:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 08:37:15 +0000
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
X-Inumbo-ID: b7a7cc1a-dff3-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653899839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NAq7axFy1uwL3aPXQ1FEOEQ5isqaMji9i5BtTMst+j0=;
	b=VDy1GTfNETXj5a637mKL68GThCyKPMj6bwnDP+J4SEHfMLVoi9NIQ1K6gfWOXZMK68VJAk
	uOt4yW/aEN0yYZkRfG3UV27bINwq+oPPiuyPLxzm5ywHA2hOEEkl+ALG7rWDo081s1QexZ
	w/qZUx1qs6Wopaz5bBZ7cCyIvcFsM4Y=
X-MC-Unique: KfyWfLeaMsOU0Obl9lRU1g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYZfhEy+5mzzoQi4cQcSgre66kMu68wCtqQUavOMs3wxYpGuKMKrhvjVYhUpx8+I3UUhQuxuYvaxNHRHwwvs9V6bFEgIyTLdkXYDec2EKQqXBSxpzGfqdu++BE6ecrCuMOKFBfiVL/S1pmaVvXgcR/r0EGyAO660OjFzXOQCakVyXRKg4tx97CCmoZJoIQRAqh2tmc7Q6sCgBRk+19qSPFjzBPYKSqyw+eLMjJ1MjOrKjDsnQpdfiioBKy1B3xCGhb2ikgzXdLf9CDu6Yzb5iPuXMol22yJbv/JV33qP42yLGXtXsifAWkYTvxG2Ossy/VVzSP3GIFobXVN9cr7aYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9y4LooOk5kGk6m4nC9HhEYTZys3Q38fa7CKNuNR9fw=;
 b=GsqG3O+g00GutsyTgBJXUpyJEwkCwAkH3Qo4mvO40aY5AcSXjEcNXNjEte0AQd/JIHbfRvOYU7Pold7Fk9URhlkXBBchlVcnnL5lj4mxZKbk1Kch/asLIu1nVva/+AUsYHKsiTkU86e0O8OgtuuFOdO7ylBMHspalz8V4T2vYhE6nrKE3sPYAApRyGZ7hQDlMjDmBlBFCfCeIafNM4ItWAO8dtGtTayz1b0mVZQuED7glRoOxYAwi3zKgpxwn1uKld12CghaOK1AU6H4bPzsQkaITPM1QoRuIe4FTwOCa71Cc9W8fEOOZKZeEGtHmlg5pPXUcVAaIZMOddrbcN2KxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <19b99aea-9969-5f64-dce1-474e7f544b1a@suse.com>
Date: Mon, 30 May 2022 10:37:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] docs/misra: introduce rules.rst
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "George.Dunlap@citrix.com" <George.Dunlap@citrix.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Julien Grall <julien@xen.org>
References: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop>
 <20220525003505.304617-1-sstabellini@kernel.org>
 <a19d22ca-33ef-b348-ac88-490010464bad@xen.org>
 <alpine.DEB.2.22.394.2205251740280.1905099@ubuntu-linux-20-04-desktop>
 <0cf7383d-896e-76f0-b1cc-2f20bd7f368e@suse.com>
 <D9A44AC3-A959-442F-A94C-C9EFB359BEF1@arm.com>
 <da68ca4d-3498-ec6a-7a5d-040f23dd41a6@suse.com>
 <765738F2-97E9-40EF-A50E-2912C7D2A286@arm.com>
 <alpine.DEB.2.22.394.2205261233000.1905099@ubuntu-linux-20-04-desktop>
 <c0b481fb-5172-3515-764f-dba9f906c049@suse.com>
 <alpine.DEB.2.22.394.2205271602320.1905099@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2205271602320.1905099@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0122.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::27) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b72c243-bf5e-4fe8-c174-08da4217999b
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3581:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB35812891FBA4A3391C391538B3DD9@VI1PR0402MB3581.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0rh0YCpcvoX8pb4vHFBWGNM20CppTWlQ2RluQRJ2UQkBkCyN39z6qga8NV5KuLv6ieeZ0R3LoVyhDFZqVAuXhpScKup+SqWC6QaWOmgBjexHv12DUEP1FOF6qhJ7ecoTvAKhWsGWzw7KGuutiMCEwf/zrH9i+jHEQ/48Zi3G0KKc0tjPuvMhs8KfojZKmg1HiJzntFGgQ2kWh74XdZUnNjsyYBAFho+ek1VpVHgA2RuKZg79QnzEaw2pwU+hUo5EHKb0XXvWZU+z/tZT1gdM2MKiuWn/YarqhiGIzLFxsSZY9xHNku2vSQRegDMhY0B8DL+3kPvOMjt4TgTQA4yqjAOi6Azshx6bKvprcCw5EQbu8GijyNmErxdIXY53vqm+udK6EH+OIpwJu1xOEW19yV8YDU+7PoEYTqX6ca58jEEieXW8AIBtJEthe1j+6oaaCORuW4nVklKuS90jer22MsvUYAK0wnw3YjSpI54RN3q6w4uutV4HkMtNOdo9Eo5o32ozL0NxCA9ORyYMaXq+r63TvKAm+i7MGKvfHwh+7aacHY1UDc/aeHnUDjyck096E/MYq2DY/nyOZwA5aTQtANpmwasBPlUeU6nZK6L2usAp5/cMConHTB9WXKDtsK6ImmbLjhh8zwSqfDt3neXhgqAN4NRXp1yZaUJr7HOIgMk4DPLqKFF5OiF8YRq7C7nMgL1p5/26CQRQJ6Z4w+EWWH5mf0JxneRzlk9pwsIyb3s6uYpVCCf1FBS/gaez8lFgR8Py4DN/VMSXUu6dUmO5E+iYzsrHYjZuwofp6bqNtlrkiIA3SI9UiMd2mydHyKyH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(5660300002)(66556008)(53546011)(66946007)(8936002)(6486002)(31696002)(6506007)(86362001)(966005)(6512007)(26005)(2906002)(38100700002)(2616005)(186003)(83380400001)(31686004)(316002)(4326008)(6916009)(8676002)(54906003)(36756003)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HIEmSXWOF3XAaLcaSLw3euKtar9Y31w/o2QK/ou1YpyvN74vnz4yBO8gQBdU?=
 =?us-ascii?Q?IUhlWzwq8ymACt5VW/DOXCkdCY6uaVqA30D8qU4aLdtigFuzoVtiVkgPwfMe?=
 =?us-ascii?Q?yq6CyIE9yT7qxs0tnKTTUOSg6R67Sd731ebew1rRwac3jJCgIStbnh53lvV7?=
 =?us-ascii?Q?DSXU/FE5a8UDSxJy64IhERU7u2xP5dM1nypdsDSSEddorlH1iznWeV5gogxt?=
 =?us-ascii?Q?4V4KgBhV7yjae/lpbnpZgrX5VKziQUjAAvu7qf+mehZQR80ieVdLMJyxLTnk?=
 =?us-ascii?Q?ahpA/Zy8Sn4s/aQLYk6PKHX9n9vD/Jp+RynKhj1r0+Do1UqMkdXSDO1+M8Im?=
 =?us-ascii?Q?tuz2XVZd4SAarR3sSCEr3UBdmpXtn2BA3CkncqkFZYweAq2zA4aeZ67XYwIs?=
 =?us-ascii?Q?/csV3VW0mBzUgIPWdaj+lJxExxdNOd8h/FKQPMAya8SPg0DUK/9s7eoli7Dm?=
 =?us-ascii?Q?G3+e+dEmCOXFRHrNHJDsxDmi++Eze5nEIlCvgmaspork+KJgKQPtNymkt0HD?=
 =?us-ascii?Q?Ud9IfBa+7AIVkil93R4+ak0Km0KkGTxf6B1L3rDJV7zU/BJMPy6AbnJpfpbG?=
 =?us-ascii?Q?aIrFnXKAKXq41U1h4ZGEgiKwjv2FJBxoK5CGS6BlazJ1ugwHym2mTm1rcnHO?=
 =?us-ascii?Q?iWSno68yOLMHG8EkZ+ctu2jP3pclWIQxqn7NE78w4RA/DOe585nPEPs+vZYh?=
 =?us-ascii?Q?51NCU39Uk8S5GNeHfBvxHozWvMg8OvNAdsBWoWlU7j1boyZ6Eahwi9yNnRsT?=
 =?us-ascii?Q?OenW0Kh33av+JA7qdZTH4vgVQoWZQ/2qNji+N37WpVo/T550oG+t5rbRjFok?=
 =?us-ascii?Q?Of7E4TYZqJ3Bcuru8RIwgk1KmgXW2XAzwOHx2WMi7H0x61Sf36fFd+V/W+bq?=
 =?us-ascii?Q?TxdKyAlLVMSVNstyqb1W0OB5NK+9GjItBwG9GosQ6Au8zSatswm/xX4dXgCH?=
 =?us-ascii?Q?04W4EPjclzqWXaRhR4JjX1ZngdDi4Fv59VYIWkS8YJhUAvKkIeo3UreKfksW?=
 =?us-ascii?Q?dRfejmrs7F/L7JKFs5eo3aSltAvu0jwQSe+Vn3LFGffuMsvj+7AHU94pU0Ou?=
 =?us-ascii?Q?8xtjp8ya/2Pi/PurH2Kb9l8hc4tA8LPFiQRdFUByhJIeL50Nu919+I/h7gir?=
 =?us-ascii?Q?rwZKKBWmGSltB4hfsYidKvnr4KUHNkyoQwrk4gjRjw4O9nmRn6m7tPrGhW+0?=
 =?us-ascii?Q?VKMoNMAYAgiDd9ftIqJywOOidbaBuWfAKUMwXGwVt+8Q/LPy/CUDpqs97amF?=
 =?us-ascii?Q?t4XHl7wvOWP2w8rKPnkSJJoHA2QGWJPTH3FRWWvKZyGBcV2Xv5kZ8mr2pxN9?=
 =?us-ascii?Q?c6wLDAq5szyfVt58fwJG0mNRWTl+apMAG/MWJXAvhNm+vSe+HMFQVLpE0ZkV?=
 =?us-ascii?Q?ByvP4QuUT2IQw6Nl4GK436d8svDF0oaOd8thExq7Crr/lY7W8If6cuWnfc6S?=
 =?us-ascii?Q?/qvebdT+CS6uoPnfxs9nMosyXQhimDKBKN+G+9j5OI9UmCOfanKjlE6jHIlV?=
 =?us-ascii?Q?TpOwToeE/V9PBCKS5pf5dweN9nE7S72otV5yCNXHyaoEgKDAa/9VUxnNBAVg?=
 =?us-ascii?Q?f+06uaj8mOxilaZgZbhnnDGJbTFcruJLvRbBUKxhbyv6uEig32WkMhnPn2oi?=
 =?us-ascii?Q?2fjwelCdFDdK4XMRX/X3Je4Q6hDSEQXMHzBfjcpjwIamv9VXTW9N/iA4VEY8?=
 =?us-ascii?Q?olhgXHKXNv+entJoyZ1+2HNaQdnG7mKhyBePn4tMNAN48hJ8XwquiaJempDW?=
 =?us-ascii?Q?AoBxurMUOA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b72c243-bf5e-4fe8-c174-08da4217999b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 08:37:15.6555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRK+nMiE8S0q6434Uo3EUAnPODmMtEYiKG/FtvJ0roMi3U2o0exW0AeCC/QKTa7Y+NcYksI6gXfcjclEXcMLpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3581

On 28.05.2022 01:16, Stefano Stabellini wrote:
> On Fri, 27 May 2022, Jan Beulich wrote:
>> On 26.05.2022 21:57, Stefano Stabellini wrote:
>>> On Thu, 26 May 2022, Bertrand Marquis wrote:
>>>>> On 26 May 2022, at 11:15, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 26.05.2022 11:54, Bertrand Marquis wrote:
>>>>>>> On 26 May 2022, at 10:43, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>> On 26.05.2022 03:02, Stefano Stabellini wrote:
>>>>>>>> On Wed, 25 May 2022, Julien Grall wrote:
>>>>>>>>> On 25/05/2022 01:35, Stefano Stabellini wrote:
>>>>>>>>>> +- Rule: Dir 4.7
>>>>>>>>>> + - Severity: Required
>>>>>>>>>> + - Summary: If a function returns error information then that e=
rror
>>>>>>>>>> information shall be tested
>>>>>>>>>> + - Link:
>>>>>>>>>> https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/bl=
ob/master/D_04_07.c
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> ... this one. We are using (void) + a comment when the return is =
ignored on
>>>>>>>>> purpose. This is technically not-compliant with MISRA but the bes=
t we can do
>>>>>>>>> in some situation.
>>>>>>>>>
>>>>>>>>> With your proposed wording, we would technically have to remove t=
hem (or not
>>>>>>>>> introduce new one). So I think we need to document that we are al=
lowing
>>>>>>>>> deviations so long they are commented.
>>>>>>>>
>>>>>>>> Absolutely yes. All of these rules can have deviations as long as =
they
>>>>>>>> make sense and they are commented. Note that we still have to work=
 out
>>>>>>>> a good tagging system so that ECLAIR and cppcheck can recognize th=
e
>>>>>>>> deviations automatically but for now saying that they need to be
>>>>>>>> commented is sufficient I think.
>>>>>>>>
>>>>>>>> So I'll add the following on top of the file:
>>>>>>>>
>>>>>>>> """
>>>>>>>> It is possible that in specific circumstances it is best not to fo=
llow a
>>>>>>>> rule because it is not possible or because the alternative leads t=
o
>>>>>>>> better code quality. Those cases are called "deviations". They are
>>>>>>>> permissible as long as they are documented with an in-code comment=
.
>>>>>>>> """
>>>>>>>
>>>>>>> Hmm, so you really mean in-code comments. I don't think this will s=
cale
>>>>>>> well (see e.g. the DCE related intended deviation), and it also goe=
s
>>>>>>> against the "no special casing for every static analysis tool" conc=
ern
>>>>>>> I did voice on the call.
>>>>>>
>>>>>> On this subject the idea was more to define a =E2=80=9Cxen=E2=80=9D =
way to document
>>>>>> deviations in the code and do it in a way so that we could easily su=
bstitute
>>>>>> the =E2=80=9Cflag=E2=80=9D to adapt it for each analyser using tools=
 or command line options.
>>>>>
>>>>> I think the basic scheme of something like this would want laying out
>>>>> before doc changes like the one here actually go in, so that it's cle=
ar
>>>>> what the action is if a new deviation needs adding for whatever reaso=
n
>>>>> (and also allowing interested people to start contributing patches to
>>>>> add respective annotations).
>>>>
>>>> We will work on that but if we wait for everything to be solved we wil=
l
>>>> never progress.
>>>> I have a task on my side (ie at arm) to work on that and Luca Fancellu
>>>> will start working on it next month.
>>>> Now I do not think that this should block this patch, agreeing on rule=
s does
>>>> not mean will respect all of them in the short term so we can wait a b=
it as I
>>>> definitely think that how to document violations in the code and in ge=
neral
>>>> will be a work package on its own and will require some discussion.
>>>
>>> Right.
>>>
>>> In general, we'll need to document these deviations and ideally they
>>> would be documented as in-code comments because they are easier to keep
>>> in sync with the code. But we won't be able to do that in all cases.
>>>
>>> We'll also need a special TAG to mark the deviation. Nobody wants
>>> multiple tagging systems for different tools (ECLAIR, cppcheck,
>>> Coverity, etc.) We'll come up with one tagging system and introduce
>>> conversion scripts as needed. Roberto offered to help on the call to
>>> come up with a generic tagging system.
>>>
>>> In some cases in-code comments for every deviation would be too verbose=
.
>>> We'll want to handle it in another way. It could be a document
>>> somewhere else, or simply disabling the Rules check in ECLAIR/cppcheck
>>> (but that partially defeats the purpose.) We'll have to see. I think
>>> it is going to be on a case by case basis.
>>>
>>>
>>> In short, I don't think we have all the info and expertise to come up
>>> with a good deviation system right now. We need to make more progress
>>> and analize a few specific examples before we can do that. But to gain
>>> that expertise we need to agree on a set of rules we want to follow
>>> first, which is this patch series.
>>>
>>>
>>> So, I think this is the best way we can start the process. We can
>>> clarify further with the comment on top of this file, and we could even
>>> remove the specific part about the "in-code comment" with an open-ended
>>> statement until we come up with a clear deviation strategy. For
>>> instance:
>>>
>>> """
>>> It is possible that in specific circumstances it is best not to follow =
a
>>> rule because it is not possible or because the alternative leads to
>>> better code quality. Those cases are called "deviations". They are
>>> permissible as long as they are documented.
>>>
>>> The existing codebase is not 100% compliant with the rules. Some of the
>>> violations are meant to be documented as deviations, while some others
>>> should be fixed. Both compliance and documenting deviations on the
>>> existing codebase is work-in-progress.
>>> """
>>
>> This is better, yes, yet I'm still concerned of "existing codebase":
>> Without it being clear how to deal with deviations, what would we do
>> with new additions of deviations? We need to be able to say something
>> concrete in review comments, and prior to getting any review comments
>> people should at least stand a chance of being able to figure out
>> what's expected of them.
>=20
>=20
> I think you are right that it would be nice to provide a guideline for
> new patches. Even a simple one. For new patches, if it is not an in-code
> comment it could be part of the commit message. (Also it is unlikely
> that a new patch would introduce very many new deviations.)
>=20
> What about the following:
>=20
> """
> It is possible that in specific circumstances it is best not to follow a
> rule because it is not possible or because the alternative leads to
> better code quality. Those cases are called "deviations". They are
> permissible as long as they are documented, either as an in-code comment
> or as part of the commit message. Other documentation mechanisms are
> work-in-progress.
>=20
> The existing codebase is not 100% compliant with the rules. Some of the
> violations are meant to be documented as deviations, while some others
> should be fixed. Both compliance and documenting deviations on the
> existing codebase are work-in-progress.
> """
>=20
> The goal is to provide a basic frame of reference for new patches, while
> also saying that we are still working on the documentation system.

Fine with me for the time being.

Jan


