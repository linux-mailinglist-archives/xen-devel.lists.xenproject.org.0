Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2F452B7CE
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 12:44:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331954.555591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrHA7-0004YH-6M; Wed, 18 May 2022 10:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331954.555591; Wed, 18 May 2022 10:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrHA7-0004VS-2o; Wed, 18 May 2022 10:44:15 +0000
Received: by outflank-mailman (input) for mailman id 331954;
 Wed, 18 May 2022 10:44:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrHA5-0004VI-Di
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 10:44:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74489fc5-d697-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 12:44:12 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-0OTGWANPOre4WwH9PNlUVg-1; Wed, 18 May 2022 12:44:10 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8386.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Wed, 18 May
 2022 10:44:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 10:44:08 +0000
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
X-Inumbo-ID: 74489fc5-d697-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652870652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=toyT0q65ke41PhnSxYKELlMN4aHJ6c1nc6qP0orh5Bo=;
	b=Pdi+UYwEcDILoyL7Ic2o7TqjotLXLgfft2P7DDnnGKt7BUnlK7nepmdXfpUEUL7ccf2zrw
	N0s/hsVgUQZULJI5LN2yUNk4xEyEhpgSFiGJkiA/XaQ6ukQKoJ7yozzKFXrEXOTdyHJz9H
	q3Ztevw6hzAs15CaK7r4jlJn8dlpFRY=
X-MC-Unique: 0OTGWANPOre4WwH9PNlUVg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgB2heJgsDC8JxX4jHeALn1Ceu554EOeQ8zlNTU+1c0ZaE+78Z7SDuHn/bRAghhaxKDiM4ydN6d/ENK7twEkvf2X1He21EaOqQ+Htgjpc8x6jyzFH/BFS097MUjSvGrG3nZwO4ZTKekX0a3MDMOAjccqBGZQ4rKlQt+d2US6nDv1wOHifvFMztkU8w0BgnDMMBzveePCWriz+tlD+TxGs83BcuoOFP7zFExHHh9RRlNlj4gHGlhHC13TuujLgVgkASq5qGtCmOr5HHTD4nifTptQv2koqLlKWSvc9gEZQq43f8iSXhlBdZxkE98X9sKYUstROMavw1IFzB7C+VSArw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0h2MhtvAiylbwO7u2LDU9wyG7PVG1ZU+6D2qfjlzzg=;
 b=jaPVq9tQKsqljVEyNum0h7W4LfSelEkxB6EwKZvOBEjVAJKHDjmdk4DnfLqa9R4T3c40SHyfy94KgZotViV+GLb0shh8EmFlZKrp3rHhzZpIN7M4CvWuBvTRuV1c5Wnf1/88Ik+NLqpkXWuP5nzDoX86wkWYSyntpqmWymOCPo/6u6GH6x7uZbra8e5iGT/Bigd7OoWPZqdZj8fikylLRyA25BNSNon+MABr83/6jMiFUDx8SO8ujLJQddKx+8ciFaCzrE4skdwhUtdRJJmfeB3J3sg2EBv/GN1/+MMKYt8gHl+Hj889zs5JjQ6zMiP7tumUkf0bdx+Ktxzck2zu9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1f029c34-f300-3841-ab20-85aa796b486b@suse.com>
Date: Wed, 18 May 2022 12:44:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 18/21] VT-d: replace all-contiguous page tables by
 superpage mappings
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <98553b89-6296-9e4c-4677-9201cd7cdeef@suse.com>
 <YnuZFkzfjagzk4Hv@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnuZFkzfjagzk4Hv@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR07CA0054.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::32) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2996d7e0-d60b-46df-ee83-08da38bb55fe
X-MS-TrafficTypeDiagnostic: AS8PR04MB8386:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB8386296A7CD3959660F00363B3D19@AS8PR04MB8386.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KmVfnnarL3Srh5yYETV/9TlIEx4o0vZfhsVm6znXdx6iC9oQ30S0wKJxxHDFxVBUeXJLFaysyblFYQthFBQ+ERmPMHeWYqy/e5k7OP5peD4lAa+8CGEuX1dfcIJ322eCFeBcnqAyAEJNsWyzk+JBCDc0JUo8ARykHpUzk9zsLOx3/F+CosBFEw5aAta8zlG3WnA/05Be3LItxdwbgi3eq7/Ocm4vaefEW/dEfI4qEQzpYVM+7B9giNAaTn63j7QWLZgu/ll+wGwVjFgZg/R+BrQqTPtBOQcKcdxWy1agiLLLEDVblNroYcvD1HuUv+YGa069ylm4P5EDoZCtG//GgO2WUGwqldaslwuGD9ZfhdKtCbPtgoVoCJOWJSmW1nnpZILvvTn/tALCDTndU2lZIQRAI/rFK7w69ckEvEn8lP2162MwI76+cBwuX4ZRdHjCJrKDJRp7+VviE3/pkLQAA8rtErMya0McB7Llz7yj/AVmiWhDGNqkIfklywhG9iKVKHbH5cWqAs3RMoG+OGANvJnq8QSH4sNMdVGzfy5SKmw5EtfolHZrbdegWW7sRcGAYvEligQLk3YhIXeV9cWxbpgb/sAdjSvmAGGn/n5YhEhNDJTrtvjYVVFnfaGidN3EEd8Y/lwAFKq7J+dgRETRCv18TZcO0v3s2joQcQKTOy4ALfKDhpWpOsj/E9b0koW/kTYtzXggcvQ489akZtB33XW+zQBtFvnJCDrv54HafUxZhn/xOS3hllNn324ewOoe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(6916009)(66476007)(26005)(6512007)(316002)(8676002)(53546011)(6506007)(4326008)(2616005)(83380400001)(36756003)(5660300002)(38100700002)(6486002)(86362001)(8936002)(2906002)(508600001)(66946007)(186003)(31686004)(66556008)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FdbfcWNgvi3Cpja4KF5zyWawRBfcVA/mquFZSoVBfNuu1ucAGWgbDSzmbgCf?=
 =?us-ascii?Q?ONEeUR9VTWAleg4XdoSjJ5gbpB6PW4umHUqXtcWKb+m0COX5rz1aTsuEGiE3?=
 =?us-ascii?Q?7sAotpbBh7lRpGjEA+2YcFvYLDQ3U+ND1v/5B1p+uSY/oduImbn0rbrNgQ0x?=
 =?us-ascii?Q?PZCN5ZdAxKrOdsfUSuZyaorVPWrSUx73xA+zO/XMtm5cbzZtdLCNMfowH1u2?=
 =?us-ascii?Q?Q/3/suRuyeUoeip+GkFhbg7R0F8T8hziGGqLpWuaD9vqwkTF1hU096D1IXHD?=
 =?us-ascii?Q?nkPujiPq5eRuUynlhVMDvD/tEiL/pjJO/+FWloa+WLiTgg2vtTYg8hJEy1RR?=
 =?us-ascii?Q?r1yjc429jPq72N+hI70UeNLx1zRDDmTKAzfRm682YLcjPyk1wOM3qTMJAuA1?=
 =?us-ascii?Q?MubomLrWY2kxq0AJ+AxhWskC+y1t76VOcP9LHrdw/V2qeIJmeivq5M6AZRpn?=
 =?us-ascii?Q?5eR0WyewlZ4zyi+//L29uKFClJ03b6paUrRIbh8M1OGioKto57wc1cf/yH/L?=
 =?us-ascii?Q?UGoQTQalYNrBhEL7bxjtkLI0ZzPEsSE+Tsyc7oXteWQJyizMTDvNhDB83D54?=
 =?us-ascii?Q?LF1bGRW2oCNVtOu7BrdsoE3NyLpBnidWh8zAYJKf1OOie/fX58QE+F4nVd2I?=
 =?us-ascii?Q?9BGn35KpYxJwbGCM2zf5ITRkmXCQD0pzZWoVxvqMYoJN+mMTMmRTPAUeCmVj?=
 =?us-ascii?Q?ZIfVV5ViVWWJFyCnozcqM48Jw+XEzipvStiINt/UfnE9KO2nt36oNYkQuskW?=
 =?us-ascii?Q?7AZeK6zyPXuz2K4VsDSggVQEUs6OQzriq8+12Q1SRhVyA2zr/BcOhOGFQrvR?=
 =?us-ascii?Q?2RzkA+g/tG1tGbDOmIN5p/1xb4kbDUbRclUrQjJJq3X3Z3YrH5rmSRVcbYSj?=
 =?us-ascii?Q?Q0IPll4qdd7rcFpXBkFtXDzeQJbti+idoRariK2+ZOmRZ6uXCduDqZ+i7Zo9?=
 =?us-ascii?Q?fYAkQk6IKXkS5dWD7nni2eSx+5s+q+sp4cSj2tq0efXU/ErAxi/hKomQ1FzE?=
 =?us-ascii?Q?rsv2UEfw315d+t3R/yGg6+IQPAnMTIv9Nn1b/aAallo+NAewxPDyX2KSgx50?=
 =?us-ascii?Q?DXw/cWHIdHo36I87n9Ng2Yv61XRQGRCGU6U9NJCPqSB8UraZud0oN9drup0v?=
 =?us-ascii?Q?PsL59BnSwHk8cdQAkfMfymZyNHsxvE2DIklOX7yl/OFX9IN5f1dNFZUcrwrT?=
 =?us-ascii?Q?m55Dyc53Fx8UCUXDFu2tqzOMqwd7Cj3Hfzw5m9wZRCayE87g0TTZK+/SVLVb?=
 =?us-ascii?Q?Q0LU87XAGRoPiOUa2NMNSZS11URulL8SsefuKkxs2yA32+hhny/uGLPXf05R?=
 =?us-ascii?Q?+h5viDfA63Un7b/Dle+BwB5nqpi9vXzhGQReTl/JHuIJKQkDHVbACgtZK+N9?=
 =?us-ascii?Q?LIxhNSSX3m0JnMbETY4Rcfhc0CYZ6+VcvZ9ZukZlrLmpNTvoGirByvqr1UJK?=
 =?us-ascii?Q?VwURgZBE4QHG6qF5KKdvGm3cRZ8us1rqVqan73ulpGgiEgeNTjOBKP8OcKly?=
 =?us-ascii?Q?hv419p/3N9s/yW3u+AUIwZ0BCdKRvANgRBiO+Fj/VppDq3vBgP9A3xc9sOlh?=
 =?us-ascii?Q?Jr0PCOZxuBAbIyH0NyqSP0TsOCUrSY7+DXyyMqLXIGpRj6nEckYhvOWZUMLn?=
 =?us-ascii?Q?uQO/h3xsKh3s2nNOzl1ll+4omNU53NIz/J+kQ5qTcONLhG2Gt7uU/j+yTfkT?=
 =?us-ascii?Q?fiMoXqQD5UOSrq8BJvZYDnQqqZrNRToeMMHqmiCjqsrt9MNqo/cX3g9GLtqY?=
 =?us-ascii?Q?ONYIaCoMEg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2996d7e0-d60b-46df-ee83-08da38bb55fe
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 10:44:08.0563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eoKnvp7VNOnz2/UY0e3z8eZg+sBrsbqieCH9Gh8LH0qjExlNmeoLIpCvw2AkC4XyTiHQFJnbR0j8ZaInLhPzkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8386

On 11.05.2022 13:08, Roger Pau Monn=C3=A9 wrote:
> On Mon, Apr 25, 2022 at 10:43:45AM +0200, Jan Beulich wrote:
>> When a page table ends up with all contiguous entries (including all
>> identical attributes), it can be replaced by a superpage entry at the
>> next higher level. The page table itself can then be scheduled for
>> freeing.
>>
>> The adjustment to LEVEL_MASK is merely to avoid leaving a latent trap
>> for whenever we (and obviously hardware) start supporting 512G mappings.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
>=20
> Like on the AMD side, I wonder whether you can get away with only

FTAOD I take it you mean "like on the all-empty side", as on AMD we
don't need to do any cache flushing?

> doing a cache flush for the last (highest level) PTE, as the lower
> ones won't be reachable anyway, as the page-table is freed.

But that freeing will happen only later, with a TLB flush in between.
Until then we would better make sure the IOMMU sees what was written,
even if it reading a stale value _should_ be benign.

Jan

> Then the flush could be done outside of the locked region.
>=20
> The rest LGTM.
>=20
> Thanks, Roger.
>=20


