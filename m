Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1201A534D23
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 12:15:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337540.562157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuAWM-0005F7-Sh; Thu, 26 May 2022 10:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337540.562157; Thu, 26 May 2022 10:15:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuAWM-0005CY-Ox; Thu, 26 May 2022 10:15:10 +0000
Received: by outflank-mailman (input) for mailman id 337540;
 Thu, 26 May 2022 10:15:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jalH=WC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nuAWL-0005CS-HQ
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 10:15:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b82b6b98-dcdc-11ec-837f-e5687231ffcc;
 Thu, 26 May 2022 12:15:08 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-47xxy-5vOJeYPLkgM8HvTg-1; Thu, 26 May 2022 12:15:06 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6291.eurprd04.prod.outlook.com (2603:10a6:208:13c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 10:15:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Thu, 26 May 2022
 10:15:04 +0000
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
X-Inumbo-ID: b82b6b98-dcdc-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653560108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pZBYc84n2HpSCJ8I/f0P9KwHpsJrFQtDFaetXxsVnro=;
	b=Hvn3jKn1+noye9AcL2LpL/TDel6UkmaeQERBiBlJaAgSzwCvVjIG9Tgc3HUPvtvGRR8tAb
	LvHPWgXU+6xI9Ss60utNsIM35YUC7pUQNJ3D433xXBJMNzVwn6I9PCHf/IcNbq7rn+SmLP
	6uEPFfvvrAdJGqkbkkQPuHoc3QjoZlE=
X-MC-Unique: 47xxy-5vOJeYPLkgM8HvTg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+dgnRmmVlZRserBWSodveC/SNVgyMDPscp0VplqRZNkRRu1aaa0GYx+nmY1RS+PGX0eBGHJE0fLjoTKuQEOimZ9zqFtsZoG58Lzdg7YEK3lbSw8EQCcRFfJkhZGdX5C2s4GwH5LnZjXkRJUpQGUBuZv24UtwEDilC6wErgbETmKIpgVIaNbXKVgZ4g0Xp7SnTW0+Gw4nZFVbOLyzu3B0IxDOs7KZ0B+6s4Ljfwwj8QYijlIaeidnnj31yRbaBQXWtIZyissq65CJEOJ34ph24VJMBFeJwKKGdwrXh5+FUx5g/qoNDp5cawFk7/yIqVzbFHW2QCQ7vt+66KFPIVlSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtY+Ge1WLqy+YFusYrJZ2rj6wWLQgqpFp9BYYuuWpgM=;
 b=KY2hoGk0CB51cx+BqV9Np9QIHaq28kXoKTD5dmf+EaKzjAjCJNppRkRdVkUR5DEBopFYgMFu77V7+AD3/vmHLdW1rEOL+sM8ObPe20jKSSXZ1rGzH62S1ZHbMZMIjhyA8Hax3x/jGeIarbKGKDGLjSlxD2BEkgw/wRtw/2nYxJ3oQfZ9AmFytfJHonIRDWnFNTCbl2GtEDm8775tibvDTd2/J5S9fHrszVnQpRMz8+idhDwy/Q/VE3xZFmFjhKg1mfbQtPNbgovD/oLq/T8FnXMLIWsnE59ed0nW9kyFXHPq3yebOzbpy+x1KakIlWrOmPJpHYdZuoNfAFYwxZIY8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <da68ca4d-3498-ec6a-7a5d-040f23dd41a6@suse.com>
Date: Thu, 26 May 2022 12:15:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] docs/misra: introduce rules.rst
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <D9A44AC3-A959-442F-A94C-C9EFB359BEF1@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0105.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1786ebf1-5e2d-41ee-48c4-08da3f009a2b
X-MS-TrafficTypeDiagnostic: AM0PR04MB6291:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6291960DB1666362B2D38280B3D99@AM0PR04MB6291.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qwIVw8oVY2SJgjkILa4XlIUu6PcKN1sMeq/oW59/aQtqzyZI68UAdurc6OtTIPCpQZBl+Pghe0JxI0vo8eEBbgA+LrW9+TJAh0kKV5+sHvf9+NLDz7tgh3oycsNt6HkSMYdAzL+SkZ+qLjwrczLoBwOfNo6xdNulxQTJI2HSsPs4QvxCNSM4TA9TPGKe6vy2NGGGg02i00jl3ejXcXMKMx47ijPhrmJKHsvK+TB9En+NCPvGEIO1uCKzhLLA5xCjKzXb9ZHdZNp/s9XC3H5ntjIti6Wzh/rMMnab3qb370OFmwXMNFM4LSG6woVr911OhBIsig8maEggbHfIXIFRDIKeRQSVUXtRRKONOIZd0p7oNjfsDkzdV47lCCmPOPgIg3g1abD7Krzn7uHEyQOGMVyApZkMR/HIz7+NfTd0FkwMqC+krRYkM/9KhOT+WN4xb+ssc2viwiOFwgKAiXLI7oYVWMp9hfqFuw7v20b02CvwXLJ/qoGkiqyu8Pcn5WRrDpUAOsLCyG2zFuDkrfAJJiYN6ET13WBRgDOMK7wAjLkmrAnXrW4R9ExzrHx59g7riGx2Co4onnu5RgON3aZZrIHMh7WLAt7ywhIKYOY3oeas+O7b7Bbj7z5mOu7HRhW1No2ODARBU5M+3MpqeoqcQqY5xjPwylUJ6XHm6kVtdhqmNuUuT/34Jk8Rm2Lbi1fSuve830VMYQcMmHyhv1yvqY7OyZx0GrNSm6VZ+YkFcNEgDDjNKWC6jU/MMdkX14rS+MaDw3oiRxdL3t1iDq3kdhdGWFUpar9xw3E1XBfE5xqOuI5pvNAiFQSdTH7lt+rE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(316002)(6486002)(6506007)(6512007)(966005)(54906003)(6916009)(186003)(31696002)(2616005)(86362001)(8936002)(2906002)(36756003)(508600001)(38100700002)(5660300002)(66946007)(8676002)(66476007)(66556008)(4326008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BRbsMzH6nbYoyDBVCX7744cV9rfMkm4pAgDQnuYu63GRnMxbqXcbzGU39f/X?=
 =?us-ascii?Q?KDFqFAZ5zD42ViMUKJucbmD9rt8dCVWtPXMUXBm1J36PfsBUFwfMUcSuxc5F?=
 =?us-ascii?Q?ieg0f+5kTdWq2RUsynv8CY4CgLWw83BGpDwmMP/TqNOySE0kvaxsvxg7Q+o9?=
 =?us-ascii?Q?eNjGf6Zx427ic8Mi1qrCz1SZd7tMFpBboLsWLFYsv7ZBA+8x/MZeNWAhwFjA?=
 =?us-ascii?Q?Iq64qPn9gISSPC8oUI+zElv/elmOhg8jkeNeDLpvThO8Qo2duhvW30/SQ7d+?=
 =?us-ascii?Q?3dtq+ccaQnFdQH9jKwYWS71BlyN1yyVk8P/7xUPm5VmP4x4nohCgdMnqfkUq?=
 =?us-ascii?Q?rB3PrcBLvIMj0Ptj708cXY5o17GVII9iJ2vJ675KSZbQ4L+0cw9/ZEB4FmPW?=
 =?us-ascii?Q?2my6AkJ/27lkW7j3zPRYGRiB7/ZrHTcy1zzPsXoNoiouQ7hcOZNj6Cfg1bNE?=
 =?us-ascii?Q?4BZggpDvT06eS8pmNLeEj4XikQVeTfMdCTZVk/dgX31NqU7lEoEOWotH3wJh?=
 =?us-ascii?Q?oZQBfV7DYvlau08FLKgiSPO/z9ayixQX0a6Nzyow5C2vhtx1qlPiN6U4gwB2?=
 =?us-ascii?Q?DqF5S0wWyc+mygDEh2aLuQ5sYvsJrRDeI7kGQs0GwvF4A98AXfANNmc0qgJz?=
 =?us-ascii?Q?pgHYrBAQIBP3IXcECJU9ZUTm9+olBazOnTPuud+oJg+O3vf7X3F5saaFgNBh?=
 =?us-ascii?Q?CBcRFqOsI802fYZQ/6+tYf9FQgJj1SMY1BTNEMhGVL49vyL4/aHcTBRMFz6s?=
 =?us-ascii?Q?gfmbfh+KyuMUSaZ+0d/ju3VTwy1ae68VjWvxSV3LB67oGxHxDMNmPLFbXe7x?=
 =?us-ascii?Q?dtszIiqW/gJKl7AdFJ6QGFlIY6ibsLcxwbzmc+QvJqHFjY1bZo7UzRgcosX5?=
 =?us-ascii?Q?PFKPxTc6pTsOq6yM3M1U61zFRuWKaWyRn7LdYh+/dBVo7KSBwq8YALpOO5QT?=
 =?us-ascii?Q?daefQT+vWDtiPiEl2vDrogESitsKkeAmdIiQsYW6J5L2bMjA54VoAZi6bigl?=
 =?us-ascii?Q?sdx0URxr2NIKuwQusHZQtnvl4soB4JIH6kUcfNkPgm5WtTEBgrTVRJj5uw+p?=
 =?us-ascii?Q?DzijjA+k66uw34oTrSf3ZEZWTPxtvbQhjGxWxedP6Qqj0BR/Nxadj8Hrkycz?=
 =?us-ascii?Q?GcyF75S3796P1RSHpoxTyEjGvk+z5atZE3ChElLDIKrrH0ppytBgLBfyv8Ji?=
 =?us-ascii?Q?/M0qtEzMpvfHxSQeV74fJBQ8MSTQ0F5vsveiqcWUD3lmlFkX/0Jkyt8XK44M?=
 =?us-ascii?Q?OazgkFTbTNBlEmQI5Bn1rkp9xgLKBDZAEZKKnTJqZGff0Du6d6FXluvgaHcD?=
 =?us-ascii?Q?tm1XXQgRI/9m3Drkq/BrdRzQ/pQK1xMQNOTYZYIEF4yEtTmf27TbVIM+Pq18?=
 =?us-ascii?Q?KUDTubkiAw7Q5nz1kOAuySGuoC1OMEh6j1O3CD/dSqzDP90bsS1vWpEIUD8L?=
 =?us-ascii?Q?+Ipu/W31BzkZztLFpkeRr/EQSz77UYB1kRNQSHhJunH+Jgp9RLtcEyuRqupp?=
 =?us-ascii?Q?VXZuJNuf0o73it8/MP9qp1bTIlmvXaHDld42QNDS03QbUMnwI0515bOtJomF?=
 =?us-ascii?Q?4B7MgJK4pH4moyFK9W8bmDbmPiM5uqWK8nlRSsk24DPLTXfOXXTDzEDogamc?=
 =?us-ascii?Q?EEu9uayCj8gDmvIPB4wB0N1JHZFl+gPqxA2O91/V7wzZ+ydtvYIpHGTV5MQD?=
 =?us-ascii?Q?rxQlFu0Vo3u7qVwopsqc4/b0FuPT4ZMv1q2sd4md6AcgqLNQ92pUSFAn5r31?=
 =?us-ascii?Q?lsS2mys7THKFIC7E7qNkjNG6RVpj9gtgBSWyOaYHq0/Ud6gxtbmMol7MEs4K?=
X-MS-Exchange-AntiSpam-MessageData-1: SUXNIUQQLLwL3w==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1786ebf1-5e2d-41ee-48c4-08da3f009a2b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 10:15:04.6674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJbIZ09Qj6sdaRMb00IUo6nbwEk2uTqGatAs+fqNVNL+xqGOBlp0o3boSdMhX2nOpfl2zqXX8l4faPz8E6e3Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6291

On 26.05.2022 11:54, Bertrand Marquis wrote:
> Hi Jan,
>=20
>> On 26 May 2022, at 10:43, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 26.05.2022 03:02, Stefano Stabellini wrote:
>>> On Wed, 25 May 2022, Julien Grall wrote:
>>>> On 25/05/2022 01:35, Stefano Stabellini wrote:
>>>>> +- Rule: Dir 4.7
>>>>> + - Severity: Required
>>>>> + - Summary: If a function returns error information then that error
>>>>> information shall be tested
>>>>> + - Link:
>>>>> https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/ma=
ster/D_04_07.c
>>>>
>>>>
>>>> ... this one. We are using (void) + a comment when the return is ignor=
ed on
>>>> purpose. This is technically not-compliant with MISRA but the best we =
can do
>>>> in some situation.
>>>>
>>>> With your proposed wording, we would technically have to remove them (=
or not
>>>> introduce new one). So I think we need to document that we are allowin=
g
>>>> deviations so long they are commented.
>>>
>>> Absolutely yes. All of these rules can have deviations as long as they
>>> make sense and they are commented. Note that we still have to work out
>>> a good tagging system so that ECLAIR and cppcheck can recognize the
>>> deviations automatically but for now saying that they need to be
>>> commented is sufficient I think.
>>>
>>> So I'll add the following on top of the file:
>>>
>>> """
>>> It is possible that in specific circumstances it is best not to follow =
a
>>> rule because it is not possible or because the alternative leads to
>>> better code quality. Those cases are called "deviations". They are
>>> permissible as long as they are documented with an in-code comment.
>>> """
>>
>> Hmm, so you really mean in-code comments. I don't think this will scale
>> well (see e.g. the DCE related intended deviation), and it also goes
>> against the "no special casing for every static analysis tool" concern
>> I did voice on the call.
>=20
> On this subject the idea was more to define a =E2=80=9Cxen=E2=80=9D way t=
o document
> deviations in the code and do it in a way so that we could easily substit=
ute
> the =E2=80=9Cflag=E2=80=9D to adapt it for each analyser using tools or c=
ommand line options.

I think the basic scheme of something like this would want laying out
before doc changes like the one here actually go in, so that it's clear
what the action is if a new deviation needs adding for whatever reason
(and also allowing interested people to start contributing patches to
add respective annotations).

Jan


