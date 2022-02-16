Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF134B8251
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 08:54:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273746.469002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKF8e-0004fk-Vz; Wed, 16 Feb 2022 07:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273746.469002; Wed, 16 Feb 2022 07:54:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKF8e-0004dt-Sk; Wed, 16 Feb 2022 07:54:12 +0000
Received: by outflank-mailman (input) for mailman id 273746;
 Wed, 16 Feb 2022 07:54:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKF8d-0004dm-MJ
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 07:54:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f456701-8efd-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 08:54:09 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-rE-wBMqQMM-A5Cuaqt18sQ-1; Wed, 16 Feb 2022 08:54:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5166.eurprd04.prod.outlook.com (2603:10a6:803:53::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Wed, 16 Feb
 2022 07:54:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 07:54:05 +0000
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
X-Inumbo-ID: 9f456701-8efd-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644998049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1vU3j7f/cd9nomR1UVLO6ZvBCxTBOl2FF7nVJvM4JrM=;
	b=hzhC21aeeJCf9Bla8V2H22lf4Bq4SEbdDGjiG6jWJHZRhePlv3MzAsn/tNGC+IxvvkRpLP
	zjgY3jeNmmn83tzLklWCVrRHQTy2nSFPZpfW5+6pZ68SH9xb2W+fhUdinvVCeAP8AoDByo
	/4QyPu+K9pZVRyIEoi2GjC9+Bb3GxLU=
X-MC-Unique: rE-wBMqQMM-A5Cuaqt18sQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ho97QhmDxwjjzk2fw7GTawOpYjdYwRpMtL4Ar7SPrwMGzcVsrfPYTnrSlr5WNb3KtFeWD0KK88wy/e5u4qraNVA9Xx21gqyQAcsHHkuJ2jta29jABRxocmL021bYJ0JEVUyk72Yg03Q7Idx6oqeUOMOa7L2/NwcavDoxfXODpmtc0t9S+/FzuKStoHUDhA4Spl4liA2rvPxsVqst+AR+Zxk6aD/n1Wc5oMiSiYBfnrPeHwgbe3eczMnQqK8jqXhMJO0/mCKEQ+Wmu5Ks3TU6EerWMEvcVpVAMgdL/zGuJfdBQJ9+84TpTowx/xe4uLngWDC/GvRfe7g9v2YJYph7Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PA3hg//FA1dv8Cgam5+erljiIcWjJ8bYyyRvBR/Rxg=;
 b=h3qbhEb4u486ptxb8hMBYW+XfCp5M+nD0LL1t9hqm1TtaorKquMRv9nMuUp+omOd7w34jn356nyj6iD73ML9ZATbg0U0Gk8NuE5VVJ+qTFv77QJpov+8q0l7/qbMGPa05UcuvW3Vq5Wc761UCCLnEKSxxGay1rcVBjRjcrGZEDOMWyX+CxGd4yLM4XdvVsl0hF7PA71ah8ky+LgiIbL2yVOVb5qEYB9n/fknRBC3nP0iCZjFDd+JIqQ08Aze8rlwwc/kbfaoEuEmZEh575jXlWk/rdwp/aXsCDAAjMM6MpJNM/a5/IQd0EnljP9peFboxMRNCjlj5Gxs4GDB4v+5qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e20eeaa5-d782-de4e-0208-96826d877ac0@suse.com>
Date: Wed, 16 Feb 2022 08:54:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 16/16] x86/P2M: the majority for struct p2m_domain's
 fields are HVM-only
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: George Dunlap <George.Dunlap@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <e5362b33-0f5b-ba2b-d033-ca0a09e5fd54@suse.com>
 <EFFE5241-CB1D-4173-87F9-16AC428902F7@citrix.com>
 <c9fc136c-e7cb-e15d-869c-a952b5b6dc31@suse.com>
In-Reply-To: <c9fc136c-e7cb-e15d-869c-a952b5b6dc31@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0304.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d4f48c6-4c26-43ba-7ca3-08d9f1218108
X-MS-TrafficTypeDiagnostic: VI1PR04MB5166:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5166F365AAD54956723DFD3CB3359@VI1PR04MB5166.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rxob07qKVbyhVn/tgCmMbLQVu8zUIXjkP+AzlFAaH4Kj9fN9fgCAoNf5zTJn7IFe+Mpz0iXyZ9PffGDk199JnBqCYSeiUc/0ayfTvEMf7MgzxbwEYXmF6lKFf0Tnx6jsT0eyAWu3jndrl8Z8ZaMmFgn4RD3q2bG1ofiOzCpBJOq7Om1zBrdQf/kx0sMD1FAfFKFdukFgmWERu2RC/zXU60cAdaWM2Av0JjFXbvVp7mvaAJdiZ++yd7299tWgvCkzHtJsFpNCRkrDzVvRxSqQlqqDNMXnh7aOMcCzqZPtp1WXaDjRox69leSu24Eim1G06BZwioKJ4p08XlFhgWyzE1CYLfSREExv7l0+DuovF6M3ZUf3zzIqNv/F9STTKgvUyK0raGS+H6pOPU6OBopaoibmVGjlkQlrvbrxasu2tq8JQFpUYtJluisAuBdEWeESJZ5lIHyOP6eUkyL4QrIXK/vHIwn0GoDvAjKkYFpuzJ1QO68bhpz8AW1LvWaXTtg7OEDj+MPv13+oW8Q2UUxxoBzHGn3oFkQm0uWE0ZPgITp7maZK5maQyDvnaPojV+alngAhaei/75awByGQCQ+uKP8GE0pqKe3fbWixrhp5jsalBrkSht5sGRYcAdouMXH9HRd5ndhuCnS5qfK4n4uAOW9ohssjrPyOwpG2Dky0Qb5eGS+VWKNqW+ul/0BWxfMiGKojFmmx1T2MySR+MIuNyuv82OOui1MCJATd6G04GGk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(38100700002)(4326008)(2906002)(54906003)(66556008)(53546011)(66476007)(6916009)(36756003)(6512007)(86362001)(31686004)(66946007)(6506007)(83380400001)(8676002)(316002)(6486002)(6666004)(186003)(8936002)(26005)(2616005)(5660300002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B//cssW5ljsbXy+CwMe9fjxvIST5ZWoi0Ix4jxAVnzkF1T72aOJj5jQBKx0o?=
 =?us-ascii?Q?3fE4RZModo/7B6naDIwMRerrasscSFKk85yUX4t1tlHEzqzd93AG12dsjYYh?=
 =?us-ascii?Q?ZOCGIdAQ39eKH+c9xDSKmDnClSXa2Ngn4VxTKO/l7R6TzjlcCE7XS3zKe0Vz?=
 =?us-ascii?Q?mFhg6ZBiMOCR2WFjCw6qbjK5eIYAD8+QCjXh5czjOjh+YTIw3pk0oSMnVvUz?=
 =?us-ascii?Q?wHg/xXBj7fE21XdNw2jM5vHIrNrVlJFkWDsbyUcDxDYI+YySgmf/GNYxc79v?=
 =?us-ascii?Q?dqgkp0mF2VcVH91nE0xTMb4BKOAOOd6Ws3mKsr0wmnX5qzfCIYGluo78HEwv?=
 =?us-ascii?Q?bJzG3ne2T4RJYIS+N1Aoc62POTGVQlRd3pEkIWEKCeAo/3Ffpg9uv+tTl649?=
 =?us-ascii?Q?LsSGSv/p3HPV3PfjUqOwRyZKcfGegqdZUr4NoNZpTYYhlptF68oG00BrF1a3?=
 =?us-ascii?Q?bFft0Itduehzuw9CVRxenyVMZYTS3YWKRKqr9oDzLEbH7PO1SjtL+PEGXg9V?=
 =?us-ascii?Q?lSu/LYBkyn4FMGkrSjw9G7ETZj51AlfHb0Dl7Goj0/yjRJAPngYU3Xtz2H1R?=
 =?us-ascii?Q?3RQftyDbZ7cN1K74eKqRy5p21CigPp1h5ZX5ptUJTtij7g2gV4HHWbXvYF8E?=
 =?us-ascii?Q?sGstOMTfcX0HVvngnttPKo9Afh650wdWVYMH2tA7OOYdPshHjDozIng5bUmn?=
 =?us-ascii?Q?d/j0ehTmrjcxanGh+lLYOxfdMIJPP0jkOYPXrPiTEyRmXgJ4PNN24Kv6bcTM?=
 =?us-ascii?Q?Bu/dt7ukYkafxQVEW/YLQVU60ZOUhjyNQjKFjxRtbBxDvQF7AllU3B75PK4o?=
 =?us-ascii?Q?TbPsRumARA8MGWEaFrCE5+bnfUgL87RT7kVc4elj+FwIPndydTv81wfTUXZX?=
 =?us-ascii?Q?DS1u57mNwvumSTZ7/JEVYFlwZlsTFQnvgnYgpjmOJr1eeviONmj/r7W3cmDt?=
 =?us-ascii?Q?1HFG+CL/qv19f81cB4W2JqW7Za3gHWsg46RUYpp6L3Xwc7w0UwCJ2XaixKqC?=
 =?us-ascii?Q?4LuzW/pXDE2xOBVpi3dqQRK2FQScaN0kATWYdiN+RJE4B3TeihIyh+K/ajxw?=
 =?us-ascii?Q?4ecgtpNA9MwIspqq6YSZGorqCCcxe14b+jD/KP9HbGJEC28wxnERoHNP4TfR?=
 =?us-ascii?Q?A2Nj7GABraJQjnYlGcGT2H29Mlp+q5YHJp+fdu7CXCiX0EhJj763uKXO24UY?=
 =?us-ascii?Q?iiKdRckCc1Ruus+ybSDzttGz6hczTOWVBXKV5JcFrge4ishhH3crPYFOKJOq?=
 =?us-ascii?Q?hrp2cSJFDquMO96g2IBMOyYrKrAe5sLLX1jRCWmbR4NzqAWcG/TfPHH5vbkH?=
 =?us-ascii?Q?3p5w/KEzh0BB1OXPnRrqE1LMBkiN+xt0suFPw4M4Np88zOJpffj2qVqirCmZ?=
 =?us-ascii?Q?2E1J1pXV2i2Ckuse7yer75scLG+4GNDBIvSDqsArgxJNFMnk1FeAqyLaenVM?=
 =?us-ascii?Q?DVsfl3SwL0qJX9nYCBhOpYfQ7MxevL2fnLqrEw1E64r0PyhGJtUUliSrINDN?=
 =?us-ascii?Q?roXeW4PbulnDua7VZryflTeWDEPDJf+xLEr9T5dxjY9zxBOoG3UHWrxneF51?=
 =?us-ascii?Q?ClUZsc4nxOiP+BaCsK7SBKadRwgzT4Y8DUEEcTxG6R45lkHtsSewqdwy5MSj?=
 =?us-ascii?Q?66jpvZEOnEPHMyXcUYU6j0s=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4f48c6-4c26-43ba-7ca3-08d9f1218108
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 07:54:05.3480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJqOhXE3xultk1gpUImnmp1BPl6PA9+j1yT7EXVmtaNQyIb9YAqw8ueRWu4/yqGoKQBYc8ewQDoVHuj2t0ReRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5166

On 14.02.2022 17:07, Jan Beulich wrote:
> On 14.02.2022 16:51, George Dunlap wrote:
>>> On Jul 5, 2021, at 5:15 PM, Jan Beulich <JBeulich@suse.com> wrote:
>>>
>>> ..., as are the majority of the locks involved. Conditionalize things
>>> accordingly.
>>>
>>> Also adjust the ioreq field's indentation at this occasion.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Reviewed-by: George Dunlap <george.dunlap@citrix.com>
>=20
> Thanks.
>=20
>> With one question=E2=80=A6
>>
>>> @@ -905,10 +917,10 @@ int p2m_altp2m_propagate_change(struct d
>>> /* Set a specific p2m view visibility */
>>> int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int idx,
>>>                                    uint8_t visible);
>>> -#else
>>> +#else /* CONFIG_HVM */
>>> struct p2m_domain *p2m_get_altp2m(struct vcpu *v);
>>> static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx) {}
>>> -#endif
>>> +#endif /* CONFIG_HVM */
>>
>> This is relatively minor, but what=E2=80=99s the normal for how to label=
 #else macros here?  Wouldn=E2=80=99t you normally see =E2=80=9C#endif /* C=
ONFIG_HVM */=E2=80=9C and think that the immediately preceding lines are co=
mpiled only if CONFIG_HVM is defined?  I.e., would this be more accurate to=
 write =E2=80=9C!CONFIG_HVM=E2=80=9D here?
>>
>> I realize in this case it=E2=80=99s not a big deal since the #else is ju=
st three lines above it, but since you took the time to add the comment in =
there, it seems like it=E2=80=99s worth the time to have a quick think abou=
t whether that=E2=80=99s the right thing to do.
>=20
> Hmm, yes, let me make this !CONFIG_HVM. I think we're not really
> consistent with this, but I agree it's more natural like you say.

Coming to write a similar construct elsewhere, I've realized this is
odd. Looking through include/asm/, the model generally used is

#ifdef CONFIG_xyz
#else /* !CONFIG_xyz */
#endif /* CONFIG_xyz */

That's what I'll switch to here then as well.

Jan


