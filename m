Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8DF5359B8
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 08:57:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337802.562495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuTuA-0000AE-FN; Fri, 27 May 2022 06:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337802.562495; Fri, 27 May 2022 06:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuTuA-00007O-AQ; Fri, 27 May 2022 06:57:02 +0000
Received: by outflank-mailman (input) for mailman id 337802;
 Fri, 27 May 2022 06:57:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nuTu7-00007I-Ut
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 06:57:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 339b0762-dd8a-11ec-bd2c-47488cf2e6aa;
 Fri, 27 May 2022 08:56:58 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-43-Qj9Y8v9IOka3HoK6pX9kJg-1; Fri, 27 May 2022 08:56:56 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4314.eurprd04.prod.outlook.com (2603:10a6:5:23::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.15; Fri, 27 May
 2022 06:56:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 06:56:54 +0000
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
X-Inumbo-ID: 339b0762-dd8a-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653634618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4zAp+DimYRCk64mdvDT7DD2A8Gi/9KBisBv0i4JsKJQ=;
	b=iu0g47pA6XYOiX3lNPHkHybzd0Jq/v5pnprpsf+zfhiXKy28CRwrGsYbSPvjAbXo8nSHbx
	hrHwG+YS0EyhDwhkaWjCzvNHCe9+TudaPpkknudWzUO58AQ1X24vgdKGFLiBO8MQsFgCkc
	oNreQWH3cATmJoJPl0MwF08EAoqD6aI=
X-MC-Unique: Qj9Y8v9IOka3HoK6pX9kJg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kznVJxRkxE7uOgho4264b0IfXu7qb7Pl4MsNpo1u9f887UJmskbL9wFb5zOTT8Z21JDNrNXvyLFNl2o0e83MPCGrkk5ZIaoHoBSimqwTJQuVWLHLE4Vy5GkkwoCKjudblfILQIJv+p5j6Qt74lALCfqqgARoCo7lEVf02HALiCP8P15jQwVEq5RjTQkQt60bG8c5aA28ig9xPouVhc3P4hjsvH2GB6VSAECFGTpIbeC0oJGy9QC36+4QwFQnei2mHwq22zvQMjgkX0F//ft8mwCbww3KDByClnxKKalLPZFpMyMc4OqGMv6kqramWAzexvrA5aHth2RKZcOc/0PMrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHiqODxADRijnQT3dCOpOYDLozy5qTE8HhY8u7iQdT4=;
 b=bqukQkiz03kGS8XXU+FOtkzVGcURehSKmLAEe7oDR7di+W2vwBJRkZn/UpGxD0fw7z9rj7F//LDrmBWQOqgLNI5OMKPsHOL9RYkslmj6j3axg4aj4ifIEZ2LlwVcd8a0ikuAcO3DmXRW8NoXECVEbHftm7zIolykmczuwoz9pG8HIrTBBDj67eYoYt8qzGG1RgugdOz/wDEKqD5E56RZ+dh18rIPrxIx3QPu+fGEYpBD2Nfa47j9tvT55K5B7fr/TzFcH+N78lUfFvlRVN2ahF+EbnTdU+MKft20ejt4ictJWCi6DvVl78mS+YrvuzZbQdm4lJeOEJxmDVm/UTEVFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c0b481fb-5172-3515-764f-dba9f906c049@suse.com>
Date: Fri, 27 May 2022 08:56:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] docs/misra: introduce rules.rst
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2205261233000.1905099@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P189CA0012.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::27) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 368d7a09-4f9e-438d-af6f-08da3fae1583
X-MS-TrafficTypeDiagnostic: DB7PR04MB4314:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB43146469C57C8FD39A12BFCAB3D89@DB7PR04MB4314.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1dANA44ZIUOgS9L22GS9x5bk1wu/HMJuFfOUrwKL+DzQRABPYKu7saOFOhndXm0jhDcxwQgmGTQuz9oemn2U6Hbz/4JuT9vDWowJgv5tRBnraafZv5iRto1tt2axrs2g54lcj6ZfJB07gvbwzmIbolgfjdfhwDDm/iDG++oq4eeJtqJBrDIROlAWNNaNHCMYevm0xFHiACMxTBfdNPF39PcejXgwdwU7qBE9lyPCCTZl2hiyPkNLKKT/PuggZNCSMLb24an+/dq+sX30nZ5eMRxrDwnNupnJNOj+HrRqoiKhsolN2Yd2K6tFcMnLTUGW6YTDYf7dOEjCUSZR5HPCuubD5ZPKY8Uj/bc13Vh3+TRj3MZItoPDYR1JFzpaNk4Si5ikthl3XXEclON7haCQKj5DjIZIFxIt5DZvhKvb2ySm9jx3FNG1ylLqUMXMVcsYHBAm1lLor/aFH83kDygJJOjPJx0xQ1r7w6YISGBLtDg0YXMsHBWrmEk4wXV/lU9Si6plZF62E3ZVnfLZ7qXx6P3dowiIn1dvUt0fUtsc/0Lv1aL2XD251J/AZiYU9yoxQicCRy97qwbSiax96ofCh4r1f3b8VwQra1pTtFYObvMIADz3rSfqBQmgtJGEncbBl+VT5wEGM0bLCecPYrki301hjtW1gm1mz0wGV3WocyCOX1zLjiTuxkt4h1t7ILk6LbB7MtcjNmO2R+c4XJMEuMQVyD4aHmY3jxI2JpiANmG8JEFIpzniXt0qes8Jbbe7ZsrZHjkts0n+VsJB9uQ6Z8WlUBQtDJMcNU4fMSQR0fjcyCJhnsBtPFIhkcFvEq4R
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(110136005)(316002)(53546011)(6512007)(54906003)(2616005)(26005)(5660300002)(2906002)(6486002)(8936002)(86362001)(31696002)(508600001)(4326008)(8676002)(38100700002)(83380400001)(66556008)(66476007)(66946007)(31686004)(36756003)(186003)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?trrE1Cn+8hQiIcqmaTsO5gLyJoi2V5+KYE56PNO80KMiHOZWQ06Apa/x4rbt?=
 =?us-ascii?Q?9M25cX4gfsSrQFiTFZtKir1svoPUDVyenWlYRCCIa9W4e6HPUDDvxG+KGHvT?=
 =?us-ascii?Q?i/yE/GBWXHi0vFRQ7ZSiSQtyBFUg46NAiSvZFoIKKr2ZP1vgMlYT5DiFzbaZ?=
 =?us-ascii?Q?MEkVcskM4tgvv5CJkw78Xbwi01ABUhjWCxpv5aJS8dvhAa9u99n7JD03zsJ4?=
 =?us-ascii?Q?6qE6E+jQls19p8U0OSOuAUeQTQ/TfqCZl7rmmCC5IHkZPqxLiLP11wF3HnYq?=
 =?us-ascii?Q?O3ksghfP179aoMpzLJp6hU2MzTddaWuLhbOMERuR6Y0V7SWH5ZtilIRC25Va?=
 =?us-ascii?Q?K3sEU437xZ54ryVDRbRQ06Baq6FGlZAsGouGopJEen10FsJ2zB2RSkFwylyL?=
 =?us-ascii?Q?73TTPs3vKwX0bnTbAtHh2xgsKfku/UYp+IQqEU22gtb0WmJXw+vQs4YLv4fb?=
 =?us-ascii?Q?hF594whddEQydDAG6DoA5XFIU+wgr33XCF/Ip9q7FvxjGa0mvDrHmzYZYsXv?=
 =?us-ascii?Q?bC9T64iy/zX6toMK4ZstZCuEJIQtwErSWYYR1Zk6fG5SgZTl14r3wr+8EhMx?=
 =?us-ascii?Q?vPGObb8WC5bAfQdatq7zsJeMbRBgUgHK0gNB928CgxLMcqnra6/HcSU7JQLf?=
 =?us-ascii?Q?n1W8QqGk/OgEUeHnMfR6T5gPHYMfD9XTjYkYY/QsS1VcldLT+7yX4lMB49b9?=
 =?us-ascii?Q?LV5hZ7HALKJcl+c4eIM0ZoNKBoRPniFfUp8+yz0sOhRy2q5cossx6zKmWkl1?=
 =?us-ascii?Q?42zcbG8IknIoB6iFcpRn0cHd10udsn7b6UaiENumdbqb3He1rXEscDZBsBn4?=
 =?us-ascii?Q?PBJMUbX2HRI4Jl2fo/5RweQLtJHeC+dIGLP3zllVWKZLqr3k2KWrVR9JNNf7?=
 =?us-ascii?Q?AsJNGOXu+lPfrnHhPNCv2eZvN9WNkSgfriPA3rUDEDuk7YMEFf1/424404wr?=
 =?us-ascii?Q?/28baa9ety8sZJaDWn+P8Y1PWWz1epbcWXjNPCZGdHZDpvzrOKyCZNXcS4cY?=
 =?us-ascii?Q?aRQK32Us7q9GGRTAUnpWYpqHl5SCXE18UPst1QhhO1/xbFmqXbLoHhhCC1RY?=
 =?us-ascii?Q?/e/l110bUx9lKCKiR1zSbvga++VHGx5oE3YKgLryoj6UpPAohRwKopEEK+XG?=
 =?us-ascii?Q?RiGzIq5D3+bpP+yqb84ch6AkCo2lnoJDC5eH+plnVtwrKqs6m3FgNOnjf54C?=
 =?us-ascii?Q?HfFEShnKJy4Rn4dB20/fZeNkouiWHG68y6D94QrPbZ9nYp4sA0i+5Zl4VRae?=
 =?us-ascii?Q?qV4Je7/3n/IVL/Fd02EFoYZpaRh3yhs/YKxMQ06TonNBKOEshtyRZim03WCX?=
 =?us-ascii?Q?hbo+agaX4oxiRSkXNDDi0104ocHD8RjGcSNs7pGQByixiLn8miVfHUutaE25?=
 =?us-ascii?Q?zpR2IFxyc1f69qUSbfAaAcV7M5aBX7B8EhhCPa5acYvXqNO8zmR1R2ZI/q+5?=
 =?us-ascii?Q?baeSvOg1oi3DUBlg6M9VyxqqcIormc/5NnnGpbwPrICq2sN4IvMNars9WWR0?=
 =?us-ascii?Q?P75hMyEnla2eDVjVETCiNE9AAtnoAEXONwMcqcTEPbbmaxdIllrSTkaIgjp1?=
 =?us-ascii?Q?pyhmpraodRzSQjm7lskMOOXkpVDQKYafWAb9oowqeWazgOa+PG5H2IcLxDmA?=
 =?us-ascii?Q?lDVjrs4qjVOxgnu+VdQPn0GzkrnhLVhNEg0/MavhlpVjHzZxTX9vSsCwQF0L?=
 =?us-ascii?Q?RWHaohB1OrPQLGYVtFWFhD+EZtip6Z4Y4unPtm2uvNWCnf8sDxP2XYqJMmzb?=
 =?us-ascii?Q?mzb4E6Jrcg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 368d7a09-4f9e-438d-af6f-08da3fae1583
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 06:56:54.6344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /F4JTJX2VslPJOnspQ4Za+GPNOgX4bm2OcyRtoq8hFSQpQ50NjrA8YtVXpphRCzecFBlAoqOxGFrTUHDICWo2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4314

On 26.05.2022 21:57, Stefano Stabellini wrote:
> On Thu, 26 May 2022, Bertrand Marquis wrote:
>>> On 26 May 2022, at 11:15, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 26.05.2022 11:54, Bertrand Marquis wrote:
>>>>> On 26 May 2022, at 10:43, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 26.05.2022 03:02, Stefano Stabellini wrote:
>>>>>> On Wed, 25 May 2022, Julien Grall wrote:
>>>>>>> On 25/05/2022 01:35, Stefano Stabellini wrote:
>>>>>>>> +- Rule: Dir 4.7
>>>>>>>> + - Severity: Required
>>>>>>>> + - Summary: If a function returns error information then that err=
or
>>>>>>>> information shall be tested
>>>>>>>> + - Link:
>>>>>>>> https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob=
/master/D_04_07.c
>>>>>>>
>>>>>>>
>>>>>>> ... this one. We are using (void) + a comment when the return is ig=
nored on
>>>>>>> purpose. This is technically not-compliant with MISRA but the best =
we can do
>>>>>>> in some situation.
>>>>>>>
>>>>>>> With your proposed wording, we would technically have to remove the=
m (or not
>>>>>>> introduce new one). So I think we need to document that we are allo=
wing
>>>>>>> deviations so long they are commented.
>>>>>>
>>>>>> Absolutely yes. All of these rules can have deviations as long as th=
ey
>>>>>> make sense and they are commented. Note that we still have to work o=
ut
>>>>>> a good tagging system so that ECLAIR and cppcheck can recognize the
>>>>>> deviations automatically but for now saying that they need to be
>>>>>> commented is sufficient I think.
>>>>>>
>>>>>> So I'll add the following on top of the file:
>>>>>>
>>>>>> """
>>>>>> It is possible that in specific circumstances it is best not to foll=
ow a
>>>>>> rule because it is not possible or because the alternative leads to
>>>>>> better code quality. Those cases are called "deviations". They are
>>>>>> permissible as long as they are documented with an in-code comment.
>>>>>> """
>>>>>
>>>>> Hmm, so you really mean in-code comments. I don't think this will sca=
le
>>>>> well (see e.g. the DCE related intended deviation), and it also goes
>>>>> against the "no special casing for every static analysis tool" concer=
n
>>>>> I did voice on the call.
>>>>
>>>> On this subject the idea was more to define a =E2=80=9Cxen=E2=80=9D wa=
y to document
>>>> deviations in the code and do it in a way so that we could easily subs=
titute
>>>> the =E2=80=9Cflag=E2=80=9D to adapt it for each analyser using tools o=
r command line options.
>>>
>>> I think the basic scheme of something like this would want laying out
>>> before doc changes like the one here actually go in, so that it's clear
>>> what the action is if a new deviation needs adding for whatever reason
>>> (and also allowing interested people to start contributing patches to
>>> add respective annotations).
>>
>> We will work on that but if we wait for everything to be solved we will
>> never progress.
>> I have a task on my side (ie at arm) to work on that and Luca Fancellu
>> will start working on it next month.
>> Now I do not think that this should block this patch, agreeing on rules =
does
>> not mean will respect all of them in the short term so we can wait a bit=
 as I
>> definitely think that how to document violations in the code and in gene=
ral
>> will be a work package on its own and will require some discussion.
>=20
> Right.
>=20
> In general, we'll need to document these deviations and ideally they
> would be documented as in-code comments because they are easier to keep
> in sync with the code. But we won't be able to do that in all cases.
>=20
> We'll also need a special TAG to mark the deviation. Nobody wants
> multiple tagging systems for different tools (ECLAIR, cppcheck,
> Coverity, etc.) We'll come up with one tagging system and introduce
> conversion scripts as needed. Roberto offered to help on the call to
> come up with a generic tagging system.
>=20
> In some cases in-code comments for every deviation would be too verbose.
> We'll want to handle it in another way. It could be a document
> somewhere else, or simply disabling the Rules check in ECLAIR/cppcheck
> (but that partially defeats the purpose.) We'll have to see. I think
> it is going to be on a case by case basis.
>=20
>=20
> In short, I don't think we have all the info and expertise to come up
> with a good deviation system right now. We need to make more progress
> and analize a few specific examples before we can do that. But to gain
> that expertise we need to agree on a set of rules we want to follow
> first, which is this patch series.
>=20
>=20
> So, I think this is the best way we can start the process. We can
> clarify further with the comment on top of this file, and we could even
> remove the specific part about the "in-code comment" with an open-ended
> statement until we come up with a clear deviation strategy. For
> instance:
>=20
> """
> It is possible that in specific circumstances it is best not to follow a
> rule because it is not possible or because the alternative leads to
> better code quality. Those cases are called "deviations". They are
> permissible as long as they are documented.
>=20
> The existing codebase is not 100% compliant with the rules. Some of the
> violations are meant to be documented as deviations, while some others
> should be fixed. Both compliance and documenting deviations on the
> existing codebase is work-in-progress.
> """

This is better, yes, yet I'm still concerned of "existing codebase":
Without it being clear how to deal with deviations, what would we do
with new additions of deviations? We need to be able to say something
concrete in review comments, and prior to getting any review comments
people should at least stand a chance of being able to figure out
what's expected of them.

Jan


