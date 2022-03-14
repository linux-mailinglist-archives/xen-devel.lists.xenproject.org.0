Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1340E4D8892
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 16:52:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290292.492283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTmzp-0000wY-NM; Mon, 14 Mar 2022 15:52:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290292.492283; Mon, 14 Mar 2022 15:52:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTmzp-0000tx-Jt; Mon, 14 Mar 2022 15:52:33 +0000
Received: by outflank-mailman (input) for mailman id 290292;
 Mon, 14 Mar 2022 15:52:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=29fN=TZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nTmzn-0000tr-J0
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 15:52:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c10d779f-a3ae-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 16:52:30 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-wDLHUocZNVyyjx1CPQF_WA-1; Mon, 14 Mar 2022 16:52:28 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4856.eurprd04.prod.outlook.com (2603:10a6:20b:b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28; Mon, 14 Mar
 2022 15:52:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 15:52:27 +0000
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
X-Inumbo-ID: c10d779f-a3ae-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647273149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gi0kvoCeGznfWH/zlTRfHM4dCGkcCkj+iXUc8/BeZcc=;
	b=IumD+gmjk8eueQtHZJw0TgoL8o3Ne0rgnuTaPwXJ80f8vfeAdIjKLeartnDOTzBhA/o2Nk
	SFEpBYBCTa6gt+NQiabyMlt99q8aQHR9/EdGdUD23ZY9IO98iiY0uDxagz7HCoVjXcqrs4
	YwmSzKdJ4ugZXX1l5tJ549nPlUIgWJ0=
X-MC-Unique: wDLHUocZNVyyjx1CPQF_WA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwiNYeFQuUoGS8s4knv1aES06J5OijafuATSUFN/qL6XFGc4hrmzMiz/vpALA4xO6sfVr7T1/u49m1ucE8VD2UX19A5YVs5Ecm1V4Q8g1iJtKFo+cAf5MgYNO2UtJNiodWClhqFDiGcmFcQ0o17PYl5iALhQc6UIZoloNTJEyR4z+skOEwki61Sp2gEmbEl/kQ9zPYNqFzw2FJF471M09e9uX8gJg3pjkQpLVksc9EshC/l7ezLeCt42vV6mRe20W6Lr9vrbv26yK7xDq9OqmbjCtMcbeXGqqXJcFa5GSVRLAjKbDWsEv+12BOHq8bGDrTi7CpoMUd2qxT3PPYIsrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6vE5WWcQP6eabTvZAxGrySwv542C5lwLueZFCRXq2s=;
 b=AK++5qtpy54MBt4Rye3dyKe0Ze8oS/s8U8oCTIuf7omptJkv9Kud5idKGN0XI1JTRQEg6npFhA27kjpm6MdPC2Zb/cffdSVka3Qm9l7UO0WVlb9h0/EYP3Y/Ym1Ajpw8W/lvabuSojLZkK6Z6I9+X2gRtYMVGR5U5AAdGQ0yLhuXgIvIy0a0+vAYrvbyZrOSexsveeHuEo7jfpNS0LAfhYqZ+TVyMk2uCh4OWVjjgmdtdSfiuNjggPVY31bDvRYLfyBqXk2RRQxcfkZLHJS2fA1wir5HQ3F7PnZcKo8KU72CxvGnu613RPiuOEh8G3Da+sUVIDDI7Y9D+r4b7gE7Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0b463533-3070-9de7-2fa8-bc502d47f748@suse.com>
Date: Mon, 14 Mar 2022 16:52:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests
 using legacy SSBD
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220201164651.6369-1-roger.pau@citrix.com>
 <20220201164651.6369-4-roger.pau@citrix.com>
 <63da71fb-820f-bab5-4cec-f9ec54ffbce1@suse.com>
 <Yi9gCkK3Qhr3awNI@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yi9gCkK3Qhr3awNI@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR07CA0026.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bfb1e30-9e22-4fab-d9a4-08da05d2a363
X-MS-TrafficTypeDiagnostic: AM6PR04MB4856:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4856242359DE58FE8D82186EB30F9@AM6PR04MB4856.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6XVaNO3eOYnn8tE7zNGquVUmbAKzTN4lUiY7VKYaLep2Pyt6EuPbgVxNP7Wsp6yGd6MSlye25QUpHO+0KNuvYawXdDFxdwhlTJOVk31sthb9t1uDqPeCC73bFLmsX81rE6I4iiECGuco8a8pDr8lpOuxZgxbi5+gR3Nvzf5UxImdyBcTzCr/tS877FSrE6yJFwQ9Qp8l0X72nXuygeDexojN6VSqExQn7btbeeTG1VvzOUBHMNthtbI3IV/T4nPHVLCYSGRLlqAV+FaxEJOL6bdrqtZM9Pt57v5w0hkX1b2oDeuxD/a6RrRCpyDzGp6Rom3Fik8WsCxpftnB+nLzl5DK0sKtaLS+tyQLTx0Zb1AgpI2AwyGh6kgpY97x5aH4YI87HaIlxAd4CO/R67Bgn40qvUuGo+yY+2mQRYHSrBovwDOot+Gpf+W8bbG3/2IuYq/rM0dS1UPjXebjznTICkKO9NFdueoSEiAYVQrCR2aVUP9OPDSHUjFCJ1N6365wUWtGsxQqkl/BwnPJezROonQcKpFiTJwu8lvkFPAHRGBmjN51CBUQG0RKCC6+CLhVzyjJHOyteIs13k+6++TCE+igSQmcfhlYZNvBJnDZyJfbBHYouS5iZYJbwlFHArsoM9p+QSmOqjAptIjwisICMID0BLcQPBVDtYuMrXByjdsyEmrPfCtN69eFj+Ky3UTPblVOdmoiSHf3ari3yGQrYwZwmT82NfKGZ7mBV/AykDk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(53546011)(4744005)(31686004)(66946007)(2906002)(508600001)(36756003)(31696002)(8936002)(66476007)(66556008)(5660300002)(2616005)(38100700002)(26005)(83380400001)(186003)(316002)(8676002)(54906003)(86362001)(6486002)(4326008)(6916009)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0TqEUSOc5uQCONIY+VGb0WNNvhKXYOo6QisQdmtRqCvPucYIh0OsG2hCL6PI?=
 =?us-ascii?Q?/9lHCDMMiHOtnhRJjgGdvtvnzsnMj/3KEX82ArtNBi1bNEF5Uit2nRNXkC17?=
 =?us-ascii?Q?ElXSpx+EZec+O8v3KPSmyLNyQVvVwpMPO+KZVv4z8+4SxdQtPvtpelJ/vQh9?=
 =?us-ascii?Q?BU3jxnwdzOR7B9rp6PK537IrGH5Hxexs+Dp4ZMoKF7k8M9LxG+bFQbkI45I3?=
 =?us-ascii?Q?vKdL7TpueXAgw/T7fh04mkSrpYym/6Ykug/3Q5i3JKwUOD6QWHoyGR6+4BWT?=
 =?us-ascii?Q?UYSIq2HGgE43wONoKfztfXCr5QrPXhnVQiP3Lo5a/91Uf6dycH7JWE9PUk9D?=
 =?us-ascii?Q?Zb7vAWebPhkLYAABjIsDmXd5r1qcm9sf70o2zauv4YvJTnbTWxsQFqo7t+9U?=
 =?us-ascii?Q?KfvTexDji7vLRjrEHX6TsppMBp5XiTQcqZZ5lZLzmCGp2DW7+GoJAb9EWkM/?=
 =?us-ascii?Q?VYUaqdmIYrvnDFTibrzR+xzpYaE0UjPV4KzC35f0bQselfdyBzcpJoabW3Mm?=
 =?us-ascii?Q?TTXggZmt36pEBAGE57i/lXgVTvccnhCqkrk2O48HEMOx1RPhJbBqQS17K8Cu?=
 =?us-ascii?Q?wB6UWYldP9KnN5AYbMErP8z/oQ+H1APsKthugnY92qd6Ak6xOfEnk5kT4Yrx?=
 =?us-ascii?Q?kxYb8uJ/TLWr8fjcAmVqql3PMd2jr8dIyhh8WuHE9hQJvQkLMCDBF12/A1wX?=
 =?us-ascii?Q?gE14U3jCwAENKiCHJVW+SCNUB2Eg6YhQyGKCqrhu0DB/1YWcfE9RrxLLRjV8?=
 =?us-ascii?Q?6cqPO1h/ZRmDljEhgszIrJVxLylktpqzr38WS25eR5KWwVnRG2Y02t6xITKl?=
 =?us-ascii?Q?25w4iyrOHzihqOIAkqYOrAvcciO3myBMoLYkQ1A/M/4E4vcZQEfHxBPKuaMN?=
 =?us-ascii?Q?Kquk7B7LXqUXDUk0bbPyreoism8Ljblk8PHGy7HRro7krapZ3vtYhPkJAYcx?=
 =?us-ascii?Q?NWXfKPvjfVVHMLOZ9MhfDJMmYVkJK3PcrEu+tuYzVfxek3wnrT8A0Lv3ZF2B?=
 =?us-ascii?Q?Db3/yOOcEUo5EHh1GvGso4fhM7jZdamIDjWB1pN2pT33BjAPxoPHamBdi2+4?=
 =?us-ascii?Q?+7fHoPYKXJFXz0/NCY1c9GAiuGVf9Nt11+6P5H5XDXZK9/rtiKjcz236y5SC?=
 =?us-ascii?Q?JiJ0rMDaOrWsWQ0eu58fMXMhhi9nzbK5Ykwy9p5+IB9DmxMh6IUEmFuKBRvs?=
 =?us-ascii?Q?WEtfKnY+T6X73YY47RGqzIYytCG04isDLg4A2PDjCWYlf7K97FXqM+K5qN6g?=
 =?us-ascii?Q?XHBoGSF1sp4iGUnfudWfautRUMlT624Nmk2oP9qpG0sPThdlqkc2mKGf5Nfx?=
 =?us-ascii?Q?en5Sc98PQqsaFFjPL23FZuvImWiXVyolCjSWbaJyqM2PQN6PfU3Uwp9SpPep?=
 =?us-ascii?Q?TnL2S8t93opkAjgQ+tMVbo3zi66aPt0+2hbd1WZSD+ZD6v5+JzA1kT+DvL+J?=
 =?us-ascii?Q?BeUxiUg1fh4PsUL7ALqJcufqLwjRxlZR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bfb1e30-9e22-4fab-d9a4-08da05d2a363
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 15:52:27.0097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lPjde4ebsSIyI2kV1JlfyPKscyyXfhuJ82/KWCXIYzDFuIrzHx3qv/mhQ3rJdEnE25aSfFLtq4+i748F1tCXSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4856

On 14.03.2022 16:32, Roger Pau Monn=C3=A9 wrote:
> On Mon, Feb 14, 2022 at 05:44:01PM +0100, Jan Beulich wrote:
>> On 01.02.2022 17:46, Roger Pau Monne wrote:
>>> +	ASSERT(core->count <=3D c->x86_num_siblings);
>>> +	if ((enable  && core->count =3D=3D 1) ||
>>> +	    (!enable && core->count =3D=3D 0))
>>
>> Maybe simply "if ( core->count =3D=3D enable )"? Or do compilers not lik=
e
>> comparisons with booleans?
>=20
> I had it like that, but decided to switch to the current code just
> before sending because I think it's clearer. I didn't get complaints
> from compilers, but I felt it was kind of abusing to compare a boolean
> with and integer.
>=20
> If you wish I can restore to that form.

Well, if you don't like that alternative form, and since I don't like
the redundancy, how about

    if ( enable ? core->count =3D=3D 1 : !core->count )

? It was actually via this transformation how I landed at what I did
suggest.

Jan


