Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BDF52D5B7
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 16:15:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333009.556786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrgva-00023t-KW; Thu, 19 May 2022 14:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333009.556786; Thu, 19 May 2022 14:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrgva-000220-HE; Thu, 19 May 2022 14:14:58 +0000
Received: by outflank-mailman (input) for mailman id 333009;
 Thu, 19 May 2022 14:14:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrgvZ-00021u-En
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 14:14:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e75ca81-d77e-11ec-837e-e5687231ffcc;
 Thu, 19 May 2022 16:14:56 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-kiYvWRl7MpuvCfgYhD3_qg-1; Thu, 19 May 2022 16:14:51 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5988.eurprd04.prod.outlook.com (2603:10a6:208:11b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Thu, 19 May
 2022 14:14:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.016; Thu, 19 May 2022
 14:14:49 +0000
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
X-Inumbo-ID: 0e75ca81-d77e-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652969694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ap9UYxYQNFVMr9gOus9ZKxdIBgrdSg7K7YbC7n76t8=;
	b=P+MpzIm+wLJqMnmZlDdxtY3buoHnCCFhbOPWKy1S+/0H1ypfKcHnTfG5N1KZZz7ZuVQio7
	cWkcRgviHVGZubr2gfvJgbeiWxkCOOKpGL3p8bVicMDiJ4TWYiaC+6XGvxCTxFOjmZBH9S
	CKr0SDNGkioOzgR2639MTmw/lDLVLLs=
X-MC-Unique: kiYvWRl7MpuvCfgYhD3_qg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhADKJy6Y/+ofIiXNmyuxoqY7AThsTI8y/dFKhcrkUx8WYRaqSc7jnW+33SS65KRiGbQSBdPgjtPqwsPAO/ESbjsMtBZPgc13jvLUV+2UEQ3BofH4G8ArUC1MHINh5uoymMEhOVD4SdV6j95yATLrHVUTC2zaHxJhcqqQucEYvdCdN1GwWtBG5+w2uqIZETDrf+TBXI67b9eIcwImjZcKgZxdvDf6fwezFe1X+sE/xCEOA9mjgyiHHX5dkiY1/bn9Xh4AL3wgff4JX1kj5iB9N938tpqP7DvFNR/NUhnC6xv+wnXTPedHl5mAQlDxnPgHLjmDvRAYK5JUPRs2eUOow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2A1KSEKolR1dcqsQ80tDoRxBIeE5QPuyzbgsBvaRW3g=;
 b=QKjRdDZRzQ75kcl1kQ/3ne/1z6Z7fXMZJVyGKTcJVDlFslTrbXA/qtJq3iL6lp+Cm+VawLksrEOT5h8c1meWtQRCiuqPzi07UVR+RmWWmEQySKOKBS16BBQYEP6BftONB9Hi5Jc49PriSteK6C0s1yXzXcMEp0q7mdc5CQkGMDHL1kFdbU7fBpMsxvfNzCzbaASJxHuLrzUlR+FouvY6PWvelNe7yxBz66T7eGeXxIUKRZQ2zqYRZFZDtk53pMrWmIv9dVbUJYNpADviYRLWlEo1AsuMCWZjFw0mN+H3TamkDRLkVDUX2z8rUxE3ufzyQdMNut4ptwjUx1Cy4cOQaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <90c4d10e-1304-822d-ff85-9f86561d5b00@suse.com>
Date: Thu, 19 May 2022 16:14:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] x86/vmx: implement Notify VM Exit
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20220517132130.38185-1-roger.pau@citrix.com>
 <20220517132130.38185-3-roger.pau@citrix.com>
 <5cf98549-6fc0-67f7-a882-0778e7ab6f98@suse.com>
 <YoY7lrpnSMJjmurA@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YoY7lrpnSMJjmurA@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0021.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::26) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bd7ad76-3063-4d0d-9b47-08da39a1eef8
X-MS-TrafficTypeDiagnostic: AM0PR04MB5988:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB598888ED55FEE0BC2F068E39B3D09@AM0PR04MB5988.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZnF52DStUof1kpYjCF8kg6u4sMMMeXpYPiEBuiOT/UCBFubq0dJmMQyx7d1lSNZxBqldoyPDyKrTCXmBU/OrdIZKgEfd8n7bCpiujEJApwhqjpTljyBZr065N1M4hKpQ2s4fRqgOfJfJ8Gz1+dLa4owf2c9xPObO7USkmGrLTyFhdctoldTG2AG7HrJfrhPkL5/KUCOb6JPo7THRuPYZgkfYdZukQdumlAQIBEWvd1sQv+pI+29HyaOMeIe7GIB7ujIDSd/cSPYu+f4HtnJ+4A/iWcn0oNfYDL5csjU4tD19sXpLmlL6S4d8HAC9zMUrKcpK+njvHshTVZH4MXJbv/a7XoNymxsKE8F5RDQskoxjnyFlZGcdX/bTCyy2J2Oz2CRz+t0l4eKUhWTR5vX/i711+9SN+NAloIsdb6vFc/6tYfb7FLhV90/f7pzz+ALKUMD3sSmpC/p/mD/uHo1kyu3eZaeSoW90otLUDb5armaPqzS/yCKiAK3oqBw+0BLJdQFxfZQ1OdRjY0esxeaaje6eUhJaLQPYfLlUlVToqodcU0I3Ms8QidC3wYSLUKRobm0wqAUAJg6rH501oH4exyp5i3ODXnw23kAC14vgQyM5RhHxH/IBl23bdAxWfDmt9gE+0OMI/92hdpx0oXsNXWo8SielE0hqySGoGqTngJ7baO1d/x20yXePVxFYK28dzs1u0uPVx7QCy1Y5emTtOwXSo6NYJ2nxQRWnk8VqlvQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(8676002)(66946007)(31696002)(66556008)(8936002)(6916009)(54906003)(86362001)(316002)(2616005)(4326008)(6666004)(6512007)(26005)(6506007)(53546011)(508600001)(38100700002)(4744005)(31686004)(6486002)(2906002)(186003)(83380400001)(36756003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?npL6ifslzlgXXSUggozSA76LuSNs0JhZaTVKzgwLZqB7fESwdwCIrCRfbzUS?=
 =?us-ascii?Q?zkpNw3wiuoexjPsh54g/oQluRB2UYHNmPH1gr7I/sZylVyTh4lRhsa0PY4ho?=
 =?us-ascii?Q?eQC9ADfMNoY056RlogPDZK1jhRiEJrgyxzlal8JUlkkoKDUmdW0q1a7G5p62?=
 =?us-ascii?Q?dpv+WLIleIL6Qih5vdG1fzOMPAiEcS/bNTfnoCZKU74rlRChYaCXj6d+BdEP?=
 =?us-ascii?Q?09YaFLJpT4QrXgdr3nfcxKhkL+4htC8dxxrplQw/jFcpaZ2w+KCWvqKY7VRs?=
 =?us-ascii?Q?4SjJisb14wbGOLZNZNJPE9GmUopvl7gjaZlgyT84hr0g4bDKnux6YWhyZDbO?=
 =?us-ascii?Q?PurvRlthaRhr7Hp7EqEquEJNPEIRH+TcQ7wyrrZgRM1VnyPRg9vVB4H/HiTh?=
 =?us-ascii?Q?Q1PJR3RJ3EI6FgB0JMXCCXlV75huMCZ2+SOlqYGa72yTbIe9LTYcBmwoqzPD?=
 =?us-ascii?Q?WPpRB0lIGsyTb4IToAQWry/ZlPfy1woZ88pBgRArenAeNeMG1p9+JV0E3bN1?=
 =?us-ascii?Q?tt1lElEDXRdRYejFEp5GX301a3SgNcBaKGntilTVOjKCLvCShCpNOnpEJHQr?=
 =?us-ascii?Q?oiiR153dsUOd8kknkM5E6tpDJ5xCCxS8rvMGHNoBd1JiU2hKfPqmZdmgd6qH?=
 =?us-ascii?Q?Nc7ibvLJrhbaVNylGUKsO2fLVay/FkkKb6CyCBcs21/5NNU0wKp3iVtMbR5y?=
 =?us-ascii?Q?DTiBpVMLcsJRLxJTJhezlHiKmHcS/e//+xF9L/kpyzQFYa+36ipAXuQ5mPaB?=
 =?us-ascii?Q?zveECy8Lb1B3yZ+SS1o9PshbPOSu9qLTlhHYATta3tz4LtYdzny1DYFhEARK?=
 =?us-ascii?Q?dhIp8SzCupRk+gVYWXdXie1wGrrXYwvaIiu4LpAhmh6Q486++Cri2XojMZuf?=
 =?us-ascii?Q?3HoWkDgtROhHmVE49RUy+pQK3u2hfhE/LkTIrwDTB/qFNi5G5HFuTJYA9wQN?=
 =?us-ascii?Q?i2Bhwd0AN7dV0V1wJm1DisbAzCyL7Yutw+26EZZImboMowD73MhLnzQkajWu?=
 =?us-ascii?Q?rw7HAcw1XgMW4ON6kg69A2fdWdeWBakTvOCcFixj8afVN9kKHLEhhk1j4Cci?=
 =?us-ascii?Q?c4GYNh0adz6KhFm/lA+3HBNKeEDWPeRoXf7bSTjyVEMIiiEt1+GgHBMsq09C?=
 =?us-ascii?Q?banf2iSACj5IXl4BtU+ikm9wSh2Q2uEsf31UanjjeD+I0FwNBUFFW6TSkGRd?=
 =?us-ascii?Q?9ln3zcb/7stHTem6TR+9KbpUpz/o63DFE5s3WQFema0Jn4H2IKuteoe3amEI?=
 =?us-ascii?Q?G1o7uLIFT+dihROvMkiW5jXZLNSsGmBJoTpEM7PXxhXXiwTvzwJnEiWnO5V8?=
 =?us-ascii?Q?fnw9bo3QxBcFtN3e7kb6xtKqyHNBJr2reuOwSUSgwydNwdo5XJANFoUqkad4?=
 =?us-ascii?Q?AT5ShxEApwu/RYQDPlJyulOl+AGR6FBtGVyilFfVvRvhYxvf7zz/b4IxuY31?=
 =?us-ascii?Q?wXSUIenza2Gifa8/TAgbmvyyDAalT8mWV3v7wWh1jQGoRp52GLDeMUQKq26t?=
 =?us-ascii?Q?Zgu7YY3EoI26G6leYMRAMijdcSd3/Ze4URC8Z4WDOjT+Adjwl07GBxHNRvLJ?=
 =?us-ascii?Q?R9mMHvwxrAkbdykN46g0hWgtkzwPtZbpYktpJR6na6RHB+xStxALdwhtq4j0?=
 =?us-ascii?Q?aFa35RbXyi3illVasOfGMyevDVjmNml08xkyQ9GK2AS3w0F03n8xSM2NGNSr?=
 =?us-ascii?Q?81Acqv5Yfg+etG0CrJGs6bmkC7q93C9zZPc8dcElYMVI39V5bmJwxQmQpPOo?=
 =?us-ascii?Q?D/P17ZOC9g=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd7ad76-3063-4d0d-9b47-08da39a1eef8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 14:14:48.9696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0tuYlmSPv8wV1OfkmthdgGVEhBSG+S7xqISXkwUkX93W2/gnlfxrvOGnuSH/Yn9kraFuB1Fp/NLYSVCpdD9Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5988

On 19.05.2022 14:44, Roger Pau Monn=C3=A9 wrote:
> On Thu, May 19, 2022 at 08:50:55AM +0200, Jan Beulich wrote:
>> On 17.05.2022 15:21, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>>> @@ -4567,6 +4567,30 @@ void vmx_vmexit_handler(struct cpu_user_regs *re=
gs)
>>>           */
>>>          break;
>>> =20
>>> +    case EXIT_REASON_NOTIFY:
>>> +        __vmread(EXIT_QUALIFICATION, &exit_qualification);
>>> +
>>> +        if ( exit_qualification & NOTIFY_VM_CONTEXT_INVALID )
>>> +        {
>>> +            perfc_incr(vmnotify_crash);
>>
>> Is this a useful event to count? We don't count other crash causes,
>> iirc.
>=20
> I thought it was helpful information from an admin PoV, but maybe I'm
> mistaken.  I know we don't count other crash reasons, but that doesn't
> mean it won't be helpful to do so.  Given that users have to opt-in to
> enable counters I suggest to leave the counter there.

Just to be explicit: I don't mind the counter, I merely find its addition
inconsistent with what we've got.

Jan


