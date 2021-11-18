Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D07C455C10
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 14:01:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227390.393267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnh2T-0006La-MC; Thu, 18 Nov 2021 13:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227390.393267; Thu, 18 Nov 2021 13:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnh2T-0006IU-IF; Thu, 18 Nov 2021 13:01:17 +0000
Received: by outflank-mailman (input) for mailman id 227390;
 Thu, 18 Nov 2021 13:01:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mnh2S-0006IK-4x
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 13:01:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bdcf150-486f-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 14:01:14 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-N9yybh_tPkihtntGZ_Hi7Q-1; Thu, 18 Nov 2021 14:01:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2957.eurprd04.prod.outlook.com (2603:10a6:802:4::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Thu, 18 Nov
 2021 13:01:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 13:01:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR0301CA0002.eurprd03.prod.outlook.com (2603:10a6:20b:468::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20 via Frontend
 Transport; Thu, 18 Nov 2021 13:01:11 +0000
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
X-Inumbo-ID: 9bdcf150-486f-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637240473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tsLtrLFgJMn7k333olsBuKy8Q9kXaSP5kbWmYdkQIB0=;
	b=RkN9Mg0GXtOeQW5zbR3+3RpRzzKjnWoiqlog3LlIQZZh0Uod8RRdalgXGo321/Y+TlsilM
	4wUM+fsbpy9kYNlVKVs85ia6DtTzuoPJ0TYvGRh/knFsEfTXeDuYmSEDI6362HuBbCmKzg
	kg4mPqVK0pq2eN6w5nEJedeL64kmD4Q=
X-MC-Unique: N9yybh_tPkihtntGZ_Hi7Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HWUEMhyWYFKldhh0eftUmSDAYT6bP1fkWIgka2uU3A7+kKUj12m/cvhi7SdDOSNpVgJi7n6IBTduaFlFQiM6opKIyika84z1V42vyu1iFGwdkCs4nTXmDNrqXKnXJU6qpFhMMUQXWFFz01D7oUj2/IP1NAnAejdsJEqEwSpd33IA7X5OaGhDOPtMyDXCb3I4KEbFM6bM6Vvkb6Tp8jVDsqH46vtWZVV/k/ifiYzsyf1eJwz0c2HO1M+xDII+8PMdMby9AWbgDy7FwZHhmbOWugUeBJSrLpVCNjT3cNa8R6PD4wVCDCaqCzijEpZ1id5e92W3LHEoe1mMopvBEZA2ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMHiOjAx7W5b5fB++qkpqRKDBkTMzGM+MytiDHkCVGA=;
 b=bqS4Xgh+od4a6QQpRI/twUA3wXqp6ggAorCenH6zQjfcaVhtShkL9i7ra14YiRv9ddCiITNMI/NaBhyJc9P4uOfoRoOn6rWC2ALHgkCUL4zCFwEKf76JA5O95iYA3oQus9WOAEccik4GHrFgk/osGEtCCUL5SObUros53QWZ+3iRpTx0ulF171X2Ql+txtBSTK4Ti/e0NjlGdZzip+FSLRp3BVKmtAQxywliF/vKtoOLTYypWwtFbtyD2iYEwg6P6uKQ/srnEzMfbRSmMjEdjO1LH1w0U+C4Fnbo+VL+NDLu5egxMuRYSTkPTMyJHJ1DjwILwL4vwtMPsGSbB+rBdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6875511f-5b6f-9924-5852-ae51a469ef33@suse.com>
Date: Thu, 18 Nov 2021 14:01:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 5/5] xen/xsm: Address hypercall ABI problems
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211105135555.24261-1-andrew.cooper3@citrix.com>
 <20211105135555.24261-6-andrew.cooper3@citrix.com>
 <e8a9d0bf-c9d7-a1ab-f50d-7ebaffbb3f8a@suse.com>
 <ae979a87-41c0-51ec-db41-6bcc1eaa896f@srcf.net>
 <ab199183-2413-163c-bc28-9d0b3b4627c2@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ab199183-2413-163c-bc28-9d0b3b4627c2@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR0301CA0002.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: caeea2d6-75e7-45d3-2fc0-08d9aa937edd
X-MS-TrafficTypeDiagnostic: VI1PR04MB2957:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2957ACCD734F15257E235E10B39B9@VI1PR04MB2957.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D92kD3bknZmcbYC+TKHQaQybGX8w938h3+5oF70rzhwnaJ63X+28qzr3DpX1Xe8Ociz3/fjBT2vZPN6IyFLE1AOemlOmaIBrHM/X2ZXqrUiSj4KvphA8QPqBCC2VR7w1lBretzw+ZZ3IDh4442K1H1VwwyagmiusoCHOKUTNpYk3SWIF00FXpJybeMuZT/lFr/2hlLeOc5MlpbFwbdpFEhGXjK+a4f5gWqQbtpmwxeVVrKZ1RkimN8u5qNfdq3msWmgguXYWjwjM1G5rqjdwDqmeXVZ3VVQqym4iF8m4ekkJOk1egvazf0jMGz06HDg7K/pB9Txe/7QzfnlwJPam/RYVJySwZ5c4vKGgYVHP48B1bhrWp7VnerNJtLb6xAbMf3U67NzMxurcJ7vWevXFZ/xTG56Cm2pTBjXMOTKwRt8qFztn+ZglEK/jc7FmtG2LGdkg1y/W1kzgDE4Xx6qnbrawjxofeAbFKWS7hZpLB8kIXb785BA170ZZkMCmS8gweopGXXPugedmCL3WNoIBooM+Ogo+fZ1JQARIoH+hB9VXbp0U2W8gGBKf1K6QDvxFwj56Z0EydCBGySH9NRR4exHQ7bNsBs/IlaBX0BctjcEEOwOJ9NteRmRvCdW00LOqwI7YY7c0grC8RqLaWHv5C0vH5pKLj69r8lEdTClbwOir4/FMyDGsK3T9qDHVS0NZt078mK3HR101ZTLeNoAvfoT9A59UkE9RoVHI5/V3E0AR63eDHM979vXI7ppWs+b+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(66946007)(31686004)(53546011)(956004)(8936002)(110136005)(54906003)(4326008)(8676002)(66476007)(66556008)(36756003)(38100700002)(2906002)(6486002)(508600001)(316002)(31696002)(26005)(16576012)(2616005)(5660300002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WiUsupslC+CzzP9hd/GAW3Y/FgiI9LLPGeKtn11ur22u85rQ8IsWTumfWnvU?=
 =?us-ascii?Q?HhfHLGLn3qud7Wv0Wm1bn/pCWhwznFdYE4orAj9wnu8vvuchBEI6qH05XDqQ?=
 =?us-ascii?Q?78WkxCUofX1uxv93hWqWCQw5FRDosT/3OFu7+LfYYkHTHijcO/Q0019jsvEN?=
 =?us-ascii?Q?+/gEsfPEZuvziZTKC0kMc6o9EjRG0GtFqJoc0MZmfhgYHrnJBHMnUfmb3NCI?=
 =?us-ascii?Q?1w715noIpGxxebs+jb7l7RWzdnjzyz98gvePFY4T70zXJDowj+gtRIWEeGk0?=
 =?us-ascii?Q?koXdnJDAVwNMKbnfypUU5tpRId0Hzfh6usYwnP/RlJNGBxcE3V/xsbuz9VEI?=
 =?us-ascii?Q?eGGcuP76hUGCgyhkTx3A2v6vuHp4IYOAUjimd+h+vKyfa3OYrjNAfftMblI7?=
 =?us-ascii?Q?iNeiKbe8cyKV2YUXLep/Q2j4Gw3kNi0sV1aRLWLrH4dwkWPS5qKN3Txaijza?=
 =?us-ascii?Q?IeGtMF02jDqRuuxsD9BUVaLN1P50JeSRPcE+0YAwCj6LwMKil40QUSgZlare?=
 =?us-ascii?Q?HiwHT40NclFBYl5AC6zr45CrqL+7scWdTmijSHlqsw/3qE2qQNlumJuW1mFZ?=
 =?us-ascii?Q?QLdYsbFOwRWQrvXgmrkgdHTPkVor4VyjfyVTNAs3d0wyBPC6Ov+YVxSYmgJK?=
 =?us-ascii?Q?/s+t4MOlOmAoIj1HolgggWd84ospN0LPlji++NPfgERgypuaGCaAJNqDk0H4?=
 =?us-ascii?Q?qUI8CziZ8E9uP+dZiPI6iDZ4dj4hgb2Mb2f2f8LonnoEkLJzg5tEE8LSim5n?=
 =?us-ascii?Q?ON7GIVZE9aQ4VdSBejJyrIVK7uOVb2Q4A3BCEUV52IVgra3XqWGlSKEuZhgO?=
 =?us-ascii?Q?xlX0adlS8bkIONdbDOojk2h0w3TaP95WDkV/kRresJ52z3t52O3E64BWYdTp?=
 =?us-ascii?Q?l/CwjlEhXovgFlEi3KMIM5vonRD6ygYRqXIJINqvZY9OC8CyqFkhgtwdgObs?=
 =?us-ascii?Q?6gChPduAx2bDO+uVZtHZ3RK8gDX4r2MoKWslpBXN1/IsMv7qXr4GifwriVFk?=
 =?us-ascii?Q?ubXlRDou7VWprqqKlBS+VbNwZykD/PG8RFOeL5zZ6HJWQT6/QD8V2AJ5L0pR?=
 =?us-ascii?Q?IfhjT2+4z11gOyJcdWi0p0rpO6X0NysDLvn+a51D3+BbhNBa2zKgFNSlVTBf?=
 =?us-ascii?Q?5JapOax0eoFUkH1aoB+jzawWW9FvKuI10Nv7Dz3k1kTBSiM8TxpU10v7ynlr?=
 =?us-ascii?Q?puazqHi82i5XI4imvojEYPNlhfJzbJpHVEoUt9bm7xiNOGLqtYZN9iB+AQT1?=
 =?us-ascii?Q?7HlGMA5srdn0WkGg4wJVy9N1ZCgv2CbYHig8iqJHf7npto1ZsOtUam4WLupt?=
 =?us-ascii?Q?laNkhy3VilEEdGXG0A3QnNpWXYrHfBmpzwo5YgJlCwzMKEDokbucN2s6+2NL?=
 =?us-ascii?Q?JaKvLfCcH75IAJeNxBgoBYtfYF+LCJSMLFNwiClR4ihTIaQ5W94MOKFiqwHk?=
 =?us-ascii?Q?QDPTSJVQSnPHBiLFqGbCfOJjOucB3YvL9H7m9AK3hfHuKXgspGck2vcDWFo+?=
 =?us-ascii?Q?Un7c6dkgCpgo6Cl1qvFLCXpxai9PHy2BC9hkDdkmt2PtB+TOUz6HloUsENXG?=
 =?us-ascii?Q?R9U29DCzI/Acv1bPxMV0ig/aP9PaiBlOQ80VYiMkgMbJS3kmCM7ycEud2SeU?=
 =?us-ascii?Q?Af8FLxeugFOdX/ZtPm550EE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caeea2d6-75e7-45d3-2fc0-08d9aa937edd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 13:01:11.6254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2A6pBF065mpK52BQYNOvgNDVOVclv+XHP8bj+w7BAwWYGQRzy+UdKqvony4cl7bBQUgsIozlUcgskNTPFxw2NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2957

On 18.11.2021 00:20, Andrew Cooper wrote:
> On 17/11/2021 23:14, Andrew Cooper wrote:
>> On 08/11/2021 09:50, Jan Beulich wrote:
>>> On 05.11.2021 14:55, Andrew Cooper wrote:
>>>> --- a/xen/xsm/flask/flask_op.c
>>>> +++ b/xen/xsm/flask/flask_op.c
>>>> @@ -22,6 +22,8 @@
>>>> =C2=A0 #include <objsec.h>
>>>> =C2=A0 #include <conditional.h>
>>>> =C2=A0 +#include "../private.h"
>>> Kind of odd: I'd expect a file named such to not get included
>>> across directory levels, unless a single component was split in
>>> such a way (to me Flask and XSM core are separate, yet still
>>> related components).
>>
>> Its all a tangled mess because logically separating XSM and Flask was=20
>> a task done when SILO was introduced.
>>
>> There is not an appropriately located file (under xen/xsm/ ) where the=20
>> prototypes could reasonably live, and this felt like the lesser of the=20
>> available evils.
>=20
> I guess it is worth adding, so we're all on the same page.
>=20
> The thing I actually need to do is fix the fact that the prototypes for=20
> {do,compat}_flask_op() are local in xen/xsm/flask/hooks.c and not in a=20
> header shared with xen/xsm/flask/flask_op.c.

And I fully agree we need to do so. Me saying "kind of odd" also wasn't
meant as an objection, just to express my surprise to see something like
this.

Jan


