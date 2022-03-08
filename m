Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC444D1B5A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 16:09:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287053.486843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRbSQ-0003xT-LQ; Tue, 08 Mar 2022 15:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287053.486843; Tue, 08 Mar 2022 15:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRbSQ-0003ut-Ha; Tue, 08 Mar 2022 15:09:02 +0000
Received: by outflank-mailman (input) for mailman id 287053;
 Tue, 08 Mar 2022 15:09:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRbSO-0003uX-MZ
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 15:09:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae20d31f-9ef1-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 16:08:59 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-sZjO3ipFPaiO3C4da1hBEg-1; Tue, 08 Mar 2022 16:08:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by GV1PR04MB9117.eurprd04.prod.outlook.com (2603:10a6:150:24::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Tue, 8 Mar
 2022 15:08:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 15:08:55 +0000
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
X-Inumbo-ID: ae20d31f-9ef1-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646752138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VDTNMt5+kzm3C7f8VQEZx8HbfVrBeviX92rPR2KqBZ0=;
	b=E+UtZHtXqq/LA6tNh4Lw8JWEafDbJhV81ocwqQ+r2ehGgAJ7Z19SbGy8JsQXTnn2QtFaUh
	CV/QLvHcpH02uvtY8fUvtRymrUeqFuq+/B83BGlOFFGZgCMuGuPcw4G6wt4VwlSROPDrzv
	La3xpNPeb+8xYZ9kuoqBcztGfpjeXDY=
X-MC-Unique: sZjO3ipFPaiO3C4da1hBEg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDE/+ni+530ahZto0ySYotFJ6gK7dKgPaCBFYH18xXlBYG62Y9ZlnThizumGjChgKfr8kwlv8q0diin+o3uaYa9kyJKEa70SbEuO9axyjR0LQnL3te+JwS2hqWL2/b44nFLa5n+KMjMK6XTIH2S2x1/kAXMh3p1aH8fc6IDbYgRTRnl6nf/1vuZ7QV8RKwwDqZQdTNKuqVA8huv1TQ7gh70IixGzETN25FzVBfKk0yjwgIru/N2r4GkkPFtg3XxkCxhlubru0yaUevOkrFjvNquSywMLiWsibWWzDal51iCRKhlNSLvxfEEmFvkF8uQPJtEW2GhDnrqp+RzGLO1kqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCbFunXq3c2JMvBpJfTVRPoI07SaqOTI/5QgAngRxT4=;
 b=Y/r9C83GXzLcOFK7Y6GE7k6W4bF4z7pjoKl+p9RH5daY0s2dEklmv7PWJbUzLXEywyNnE0i/lFZdCBYpGj/gBqdrTnEDDEUOGKky9lmOuzoOL/277NLmvHrR/xwrBsbgRsU2tGLuRK8UH1XlG08PAemC/SsMh/GfNmojFdX3rZLp97UVG7mmwRsPwlRyymW04X78iZ32Ha4cNnISM539DqirlXdsPv3tN1VAWlTPXJB9Elzz0wu1HKK6HJjTk3jIPkw2JZJcTw1hVVreapVQBd3BWhtmDkmjZSP5eaAb+xHnjHKyfz7SCETksnvnORN+s5WCEClpuZ/dwF2NV+xhGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8f37e018-ab41-3e4d-14c7-1a25aa35e958@suse.com>
Date: Tue, 8 Mar 2022 16:08:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 1/2] xen/build: put image header into a separate
 section
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220308134924.83616-1-roger.pau@citrix.com>
 <20220308134924.83616-2-roger.pau@citrix.com>
 <c2e15d35-91b3-ba29-eed0-92fa19a692e8@suse.com>
 <YidlvWBauhcrAQa1@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YidlvWBauhcrAQa1@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR02CA0001.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdc3cb6f-d85b-462b-be9c-08da0115906e
X-MS-TrafficTypeDiagnostic: GV1PR04MB9117:EE_
X-Microsoft-Antispam-PRVS:
	<GV1PR04MB91179CDB21CD167B8FE6F9BFB3099@GV1PR04MB9117.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9lNz3K0mwi7cNQdEXuJoyBP8m/dVEv1PZFC941swnZ+oGB7YzVKoN0u149Ibx183PPZBCXmA9nDnlk1/8iNvIWGIM7rbRw08HWVHulXmTWSGi5LChFMGx4eW952pmwkoJHZBnu70SW+zsTKDSRQgEhNQBDReDssbOxFRhqrKqC5kkh5bC9jHq3VKvNf8RE/J3/Ew59mkxCDZcOJMNP59L1aA5h0cbxz+UWI1H48100UwMBEPDHxMONBpUoxvALVHxdj9YG0FBUMaoM+DoV4Y6qneajpurEjeS/kpLXAZpVDTq5KF1sunG4NLSzlZUgthDEHb511nn2qkUK+GTioI4O8Ka27OuEu2VzcLXwhrvtajgbNr7hGgC/5pjKsxNi7SJibJCZB1TbY12RI5EYatsvl8q1aFl5DZWK4PxpPt1Qjksmpp9+EnuaCHqLMa5REMsmjTvdU5P7GcyK/8GnmjXQ3fKr4dKNQdjJ0KAD0vDVpZeHQLCB7cQxk4NwUsYH8C4aesmQ9b8AOawgrpu/Y8JwpBnx/Ms0IM2l8CCTwmXZZEdaRInTZnr1yj6sgqmlm8ZKeIHtydmUYmLrmPeGcIy7bizpxwNwvn3yM2PwflCqz+XWLug5k2Q8xQ3A9oTnQb3gr+bLOiBw1EQkttsA/Uv1XoDaI9WxdjwVWQmLsctYp2WzxlQVDKQo9t1em1eyNmSqKFBt77CDUVsfIHNAVEdwK565iuGWP45cmxP9WwXnY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(26005)(186003)(31696002)(4326008)(8936002)(2616005)(316002)(5660300002)(83380400001)(508600001)(6512007)(6486002)(53546011)(6506007)(38100700002)(66556008)(66946007)(66476007)(8676002)(54906003)(6916009)(36756003)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dycEakbE75Fn9T7gvt8OA2iaqsv0Ikk6IWDRS1uXYnOKcGvm7dXdwh+GIHki?=
 =?us-ascii?Q?J4KgwuhXOiBSVu6xyIgBe77OTayY57MWQp/FYrwCOa5bX/HvfepXRRaU/9qa?=
 =?us-ascii?Q?Q4rOkxTpWIBSjxfyLs4GU6L1fQTm4cQ9almDy61O9iWp6eIVG+jZtiUl13D1?=
 =?us-ascii?Q?21DVbIrxh9bsSAmxgU8GmI1Zm8j7b/We/olUWA65gzs0Mf/jDOs3E4+fVbKR?=
 =?us-ascii?Q?7IOurauE/8ulcKxKoaQvj6MoLZjRmYK1U6risliYjAQdOjBbRbJapF737A3E?=
 =?us-ascii?Q?RIHK7H6eBRGDtfc5a0pg3XHc2ewb9b+SxFDAz/POdBeMDEiAPjKWa3mlAyXC?=
 =?us-ascii?Q?KL44KJ0/G4CP/VVAosuPSKARAMvDST4oe99bXifn91ui3/VaqnbvawXRd/92?=
 =?us-ascii?Q?rANUJFh6/QOrzC6orGpTK2/2Ild/IIeFvSXHtVQDAFSNSrlvw1ypfESocTxm?=
 =?us-ascii?Q?m3xsY8kibtb/jdUIAV854dHf+DrVejSczcDD1+JAz8bqceVtRCa5aFGlVhmS?=
 =?us-ascii?Q?uAKjea271S5BmT/pQa2Qj8AUkXrGkoanwkU8BNJwOsAVPMwxkQ8oH1BEqmCI?=
 =?us-ascii?Q?DUdMQvy2XJdO77T7gubL23NN4E37t9Em5tOEfv1tipdzSDaM2HaNGntVB44D?=
 =?us-ascii?Q?dq4YE9Fkjz4rtPTDLzKH+01vDTrUgNcWSJsxl8z//xzKsZPk58NJdmcpDVeD?=
 =?us-ascii?Q?xOJQJPMMZKOf3PkaOAvb0YhaqLazbUcMTaIK3f9Tdfu8snNMOzuCfcNN7Cee?=
 =?us-ascii?Q?PHBBWfxTERgpmReYvOyj8QR6SdvWi49lalupmGbjuAM03ws0CaQWnsSEkgdu?=
 =?us-ascii?Q?htaMJkwulPPJJ0wW6IlUn5xHt7M4pvB94Fdbxr5ziK4Sa/yLuwYg2VZMhZgK?=
 =?us-ascii?Q?y3dyNHRgWQluvOkelfPQB8PT4oZiYXBaBVM0xtOa6r5lbc+hV2I4iqx/5Lm7?=
 =?us-ascii?Q?UXiYXwyjVaTZL9x5gDRhhA4PMN2aDSEAf4/AvmzwSMT1Zk8MBFGSC2aCpAjJ?=
 =?us-ascii?Q?eQ/Jwhhg72DULHRJlPdRZd5va2Q7fc6oBS+bAa4u4imLPfYiTShkJzoWPLXy?=
 =?us-ascii?Q?H8HynLCN8lzI5ijChVtDzp9dBR45EKlZMKFDYSSxSTrVC1sRVtI2ksNSC0uY?=
 =?us-ascii?Q?7ZGmiLAEo6nFR0tBE/SmmuiBMesfobncNI7pMTxUrLUcArac4jr7Y3T9TuiO?=
 =?us-ascii?Q?ZjWaS4bx4XzaPDO6BjCyyASBfAcCtl6eq6RaoAuGPLBKu2Z/J7Jk1MY/10gw?=
 =?us-ascii?Q?/3YvkVyZ1qZlZnULRSxTaYVUygWpPG7tD2NZ2YIkFQYoG+A330LLK+YDznhm?=
 =?us-ascii?Q?NB/viwmhtnzhODE/2FAGLRHZWVmEZ4WJ6TOyHTW71CxBUzd1xCOwrlrgKlJO?=
 =?us-ascii?Q?FUoFVmbppekotoFpnsZA4fWVrnzcNVf36QwvupY6eST9Qq9FysvLIe2PNscv?=
 =?us-ascii?Q?a91LPKk9aY6YVU6fZzYf9yE3sfn6zx02uM8tr95WsSjEdl2AxZEVP+N76mQb?=
 =?us-ascii?Q?ulXwt48dh8Xx5EM5iYw5bcwpzSxS1Q9FL9xKFa0YW2PIZRo8/N/vsURDqQta?=
 =?us-ascii?Q?WcaeWxg669PxvMwgcuqqEMo1pIYq5ND4RlYdDPYogZu4XYuM1wPt1pKLQj+s?=
 =?us-ascii?Q?mmLQZlAGdtjBrWiHasa2Bck=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc3cb6f-d85b-462b-be9c-08da0115906e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 15:08:55.6558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+kllrbcY6E8sbwAzO5D8XKbLHm2ocZJTksCXUnnm5g4nbAzr7sfnqYUfFKmzmUaZTqMIRHepbHeXE8R0luVNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9117

On 08.03.2022 15:18, Roger Pau Monn=C3=A9 wrote:
> On Tue, Mar 08, 2022 at 02:57:23PM +0100, Jan Beulich wrote:
>> On 08.03.2022 14:49, Roger Pau Monne wrote:
>>> So it can be explicitly placed ahead of the rest of the .text content
>>> in the linker script (and thus the resulting image). This is a
>>> prerequisite for further work that will add a catch-all to the text
>>> section (.text.*).
>>>
>>> Note that placement of the sections inside of .text is also slightly
>>> adjusted to be more similar to the position found in the default GNU
>>> ld linker script.
>>>
>>> The special handling of the object file containing the header data as
>>> the first object file passed to the linker command line can also be
>>> removed.
>>>
>>> While there also remove the special handling of efi/ on x86. There's
>>> no need for the resulting object file to be passed in any special
>>> order to the linker.
>>>
>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>
>> Looks good to me, but I have one question before feeling ready to
>> offer R-b:
>>
>>> @@ -86,8 +84,13 @@ SECTIONS
>>>         *(.text.kexec)          /* Page aligned in the object file. */
>>>         kexec_reloc_end =3D .;
>>> =20
>>> -       *(.text.cold)
>>> -       *(.text.unlikely)
>>> +       *(.text.cold .text.cold.*)
>>> +       *(.text.unlikely .text.*_unlikely .text.unlikely.*)
>>
>> What generates .text.*_unlikely? And if anything really does, why
>> would .text.cold not have a similar equivalent?
>=20
> That matches what I saw in the default linker script from my version
> of GNU ld:
>=20
>     *(.text.unlikely .text.*_unlikely .text.unlikely.*)
>=20
> I really don't know what could generate .text.*_unlikely, but since
> it's part of the default linker script I assumed it was better to just
> add it.

I've checked - gcc up to 4.5.x would generate .text.*_unlikely; from
4.6.x. onwards it would be .text.unlikely.*.

As to the dissimilarity with .text.cold: I wonder why we have that in
the first place. It matches our __cold attribute, just that we don't
use that anywhere afaics.

In any event:
Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit preferably with .text.cold.* dropped again.

Jan


