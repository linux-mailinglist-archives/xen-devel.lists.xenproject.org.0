Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD924A9A41
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 14:47:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265547.458943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFyv5-00014Y-3b; Fri, 04 Feb 2022 13:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265547.458943; Fri, 04 Feb 2022 13:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFyv4-00011l-WA; Fri, 04 Feb 2022 13:46:35 +0000
Received: by outflank-mailman (input) for mailman id 265547;
 Fri, 04 Feb 2022 13:46:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gJ0=ST=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFyv3-00011f-Fd
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 13:46:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc827ebb-85c0-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 14:46:32 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-1JHuihyKMcKqHmiAz9YvoA-1; Fri, 04 Feb 2022 14:46:31 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR0402MB3576.eurprd04.prod.outlook.com (2603:10a6:209:8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 13:46:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 13:46:29 +0000
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
X-Inumbo-ID: dc827ebb-85c0-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643982392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Uq4wIgYy4oViaNP3YfY+i1MlGYq3bPdpvji8IhZvys=;
	b=SLY1lqBWzXitbhykDZae9odVyRv9Hp8Liy4AA4Vncq61hWA5FGGYWa2g3w3KrxWUV20t2P
	fCD89tJLONU5P5DBof/cOD6tgr8olblN5qn+LiB+t2DIAU3Un+r/tcV78PKVg4RFNdkARM
	zTd83ak1V6ysXplOjJWjoL4qs8bS1O8=
X-MC-Unique: 1JHuihyKMcKqHmiAz9YvoA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGA+2Ylo2wt1D+KQl00TGefAhmphPqX3sUUXSdrs2RerNjA+Gk5+3Sn6O0oN7fTK1s+2ZMQaACmX2I7vOUolB7BoQV8xtOvcXu5H457uZH920IC+Xvri77nEsLAb42JEnAfyhTt8z36D597oOulVXb2ipRk4H4vEYzfQ/aCA1QCtc723r+Nf4vugQcMCmU3maWNABtzHAFR2ES0UO9DF6te1f/w7bHpb/W4+Wed4ljyEq2q7hn55TxXDmz2fvdG+FiFa1waIi9aVUP1poEIA0W6m/dRYimq2JGLIawycEd4kl1YY4WHgbsJ/+J10uZL7BeauX5u9BCMFaXbVEyXLzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RyfF67Jj3oWm+xcD9BoIoW5ugD3+fW+zjhMlKkWfeaI=;
 b=JmTWbeCvYomD3ILGketi6iDsIj8K/Ojd+bZezH0Ncmb71xO+vBtgvq9cFyk42XBOiLkjLLw7ldf5792C+YpRZ6eXfcyC3P+YlTbzDlpy2l3C/NarmheIeLs/TqzSf/q6jyDWX5vueL4TFPC9GTAVPxmityvYWsf1qSRi6HVLS4as6Qj88LbgxqwRXFd2v0PAUz9J+wedr/GmfyI9Zs/ARniJdb80YmGdU9I5aDXCQFMs1KnzYWzP1xpCXOgVP/hc+DmIghqP+1oH5qdcu2yN/s2T++1jR5Iexh1q0EfxsQx0oApL7S+VtU4hSWbbWOUygddD8QEz1tKo93TjYtBk6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eb818153-3ada-ac46-fb14-da975a61574f@suse.com>
Date: Fri, 4 Feb 2022 14:46:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tools/guest: Fix comment regarding CPUID compatibility
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20220203181023.1554-1-andrew.cooper3@citrix.com>
 <53b98995-8cef-48b4-7728-3bfbc236af5f@suse.com>
 <f2ce80ee-f30c-dc6f-e4b7-5d8eddb5b3d5@citrix.com>
 <1333696d-d3c2-15a8-1dd5-7cb0a17ef023@suse.com>
 <a28ff9e8-c022-6384-ee04-c21b69a4fdd2@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a28ff9e8-c022-6384-ee04-c21b69a4fdd2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0101CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96e50411-88c4-4345-4a9a-08d9e7e4bf1c
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3576:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB3576C1992BBA78C3B597AEFFB3299@AM6PR0402MB3576.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OvVbCQyqCPFAEcRChG6D41muKfihuTKN4zvoSMZzbWQDZQpwiIJC7Fd5s0pwwA4djrtEF2Rr3R/77R35He9+8pGifE5YLufp9YJb0NX/4hs/J+cxTlUbcbgyw/gOyRZWW4WWj73w26dI0zxK3lYnhGtfJSNn7maUI33Ltj4wp7Q8LbVoCyCYw2N+CBGfhdEhLpr7P9JuTIDud47uJ8nI3DcxvBHmIPempdXCLWRu8zWLjEpbXYTkgOuPck1jFUBPp1uHvkfp3vdLSmtj6g5adY6lWG9gnnVWQmTbaIbA6ZWTUHXSQsOeziMxy4D9d81Y/Uh/T/wEUVu+nskEOeSEkEzoMNUQ2/imDn1kyzSYqKA9xDnLPYw1rbgXMDSdaE2WCyJSCwn2+pWI7xt4NCssyJIzH2e9zHBiCrAw3X3NBDf/edjwUgsjZeKfyrgBcVYZNr+8qnNpdEczRyJrOk4xH+nvsgjiklOOvpJtv9Y1sJuH+zLaNSq7tTULs35nzGHL2TLW8cSQZzcUfMj0rbtqnPU5vfivOr+93su0d9Q3nlQ3Y+nYwDJSizuIP3YwrROwPYe8ZY86qm3tJKguSXt7rc02yA9vIsr9ZUJULE81myJfv808TYmUJ8sKGFccnfqJBl4emiKwNP8CcQiX8w3OvwoLTB6MhjCkwsMFyxyis8pOn8XCXcsjd9JYl8F0MXZK7ysLXrOTuwMroEwYp7R/GV0c6JEJfhCHdkzPYtBC95M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(2906002)(38100700002)(8936002)(6512007)(8676002)(53546011)(6506007)(26005)(186003)(66556008)(86362001)(66946007)(83380400001)(4326008)(5660300002)(2616005)(31686004)(6486002)(316002)(54906003)(6916009)(508600001)(36756003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VsBccw//Dp8TWl7I1C/Mf6EapNXNquFafYXKnbmk+LSYQBJtjJFJEWxQS9kY?=
 =?us-ascii?Q?mG+NwWhOe0wHm4Ue7xoImXo6EtUJ6o33Omgw17Zu4D0JzMXhyKbTc+Qw7jiJ?=
 =?us-ascii?Q?tuIgx+63uOg4FyeZZnH0nWALCSfPTlbI5XpWsnO5FpQaJfA4SqJ7zbJdBMf8?=
 =?us-ascii?Q?IW292JE5SS2oAfH3WD0COyGlkjhP/jL6yoCUS1SD+S2RPgXlwD1gxx6Z/odM?=
 =?us-ascii?Q?9qCkjxT0KS3BYUmgrDJmX3wnOxSFjH9f23+8SrqsFuF3Zx1+r9gcFl+Udi/q?=
 =?us-ascii?Q?9Y2p6fhbB51fG7R/DbulsLtmqE4pvCfoc66hJcR2uT+ijFcSYhJIgJYfxOe5?=
 =?us-ascii?Q?LcqTTqWta6asGOpNXi1eC77m3y+M0lhnQ08SR3dXup3OjfkR7nUZf+lx9f0n?=
 =?us-ascii?Q?ZBc0ktbWi2sElrctEr2BMVeSCRLX3fl/mkM+d622a3xzIl01co0Zkbm/wy7n?=
 =?us-ascii?Q?lMnuKGxvul5eR9QZiHVF3zrzVbAOJLoPqwe8Ni8vGTFpvsnkr8vI59NK2UFg?=
 =?us-ascii?Q?iZ3ql551nhoMCKn9UpPbWpTrsE6Y7p+eAAEsfxCvo62iBuEvC2h6JqIa2FGM?=
 =?us-ascii?Q?BX+HolWrmVUyzbmVcrY4WyPoPqpJtQo+0vJv9vT3w5BalmRfmVs21I9UNq5f?=
 =?us-ascii?Q?iJIyQGDMjfJIkwPGxMBp2NrnTq3WLNiYYYtyyZlwTZEbhN2TcVHwIp8Akk65?=
 =?us-ascii?Q?ZD78SZAre7yxLh/ZdIFJarAiU4JG31A9NUUfLWaK0nn47wwSPGSU14SotBGB?=
 =?us-ascii?Q?dbPRYA9I9+DBMGcGkFbJFbrD57t89scqVDDNVjnoS0qc9UyB5ZBLxnIEx0MZ?=
 =?us-ascii?Q?fAWw+aiMRRmTCklSc0Gfs5K/PR3eE0ZIMWeAhz9eCNryUQ8d4j6XLiNevvq8?=
 =?us-ascii?Q?Vord92C8XyO1bUkDEsMX04d0CGDmYfklCtissjzO80MBB7gMUWigYa8rmCiz?=
 =?us-ascii?Q?IZpvMMotPZhcLp1h6DXH5awATzbjCQTZygKo3HQ9RfzRRdJ6zp9yjJK3l+Sh?=
 =?us-ascii?Q?NrxGj8aq+1qsBPZPNSs09MEsShMeVOT4v9gHJI2yamgXp/QQiZPmAuyA8hgo?=
 =?us-ascii?Q?mryabKK7Assz8mwiWfV6MnQl5FHhLPxRO0Kr8CHlSe2mwRAf1d2UmbnYLluA?=
 =?us-ascii?Q?USxLMKwsebzBRIoYuNKkuHStsOf/T/AqzSUj5AAQFFCcBNW/TTYRGfoVVpzd?=
 =?us-ascii?Q?0n128Q7EKXXzqvy20HdK/JR3qspVKJcFT6vr5FFDndokfn7oq9mRsVaVvRVv?=
 =?us-ascii?Q?GHTtClTYu2DA6WYfu/DDtad0gXR1yIGxOQ5dxWIn3W99IBn44f1/r0+FkOti?=
 =?us-ascii?Q?+XEajqy5hvZio4B6UOl6Vs042R0Z0gghcvmB4yU1n1C6LcR5QX0w68JDw2vK?=
 =?us-ascii?Q?2T8SSio9cIUcsG77ztypUz6pYYNyrpoYhYAvTmcMuHUGNys54Gd4OUqFykxL?=
 =?us-ascii?Q?dlMffniBTcSIPnnsdYV0Sgs9wVNhGPH7KhHe9djHRMTgocTv7bgsRR8zmmTO?=
 =?us-ascii?Q?tlToNqeqhD2NA5c5R+S8VPtc7UXPwp5KT8d6HsaGRNSOFrXmc0v+/RgXj46H?=
 =?us-ascii?Q?CSjEJhNvGOZw2EMRNlcAcSf8Bh+NVd7PdLTMM0CdwXn5p0pkl+snuJom0SXB?=
 =?us-ascii?Q?nSo2d40cc504oW03Za7ks/o=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e50411-88c4-4345-4a9a-08d9e7e4bf1c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 13:46:29.6685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1xHse4oGwBMmMsHHWyqOev40ohxyomWH6TmZRPNXQu1Xy3/lnfmof+b6/ZUCpNZ8A5hHCcJs1k7oFjVefzpNJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3576

On 04.02.2022 14:34, Andrew Cooper wrote:
> On 04/02/2022 13:09, Jan Beulich wrote:
>> On 04.02.2022 13:12, Andrew Cooper wrote:
>>> On 04/02/2022 08:31, Jan Beulich wrote:
>>>> On 03.02.2022 19:10, Andrew Cooper wrote:
>>>>> It was Xen 4.14 where CPUID data was added to the migration stream, a=
nd 4.13
>>>>> that we need to worry about with regards to compatibility.  Xen 4.12 =
isn't
>>>>> relevant.
>>>>>
>>>>> Expand and correct the commentary.
>>>>>
>>>>> Fixes: 111c8c33a8a1 ("x86/cpuid: do not expand max leaves on restore"=
)
>>>> But doesn't this commit amend 685e922d6f30 ("tools/libxc: Rework
>>>> xc_cpuid_apply_policy() to use {get,set}_cpu_policy()"), which is
>>>> where DEF_MAX_* disappeared?
>>> No. All that happened in that change was that we switched to using
>>>
>>> cpuid.h:89:#define CPUID_GUEST_NR_EXTD_AMD
>>>
>>> instead, which remained the same size until Xen 4.15 when e9b4fe26364
>>> bumped it.
>> Oh, right. I did try to look for a replacement, but managed to miss
>> this. But then, as much as 4.12 isn't relevant, isn't it the case
>> that the fact that CPUID data was added to the stream in 4.14 isn't
>> relevant here either, and it's instead the bumping in 4.15 which is?
>=20
> The fact that the bump happened is relevant, by virtue of the fact there
> logic added to cope.=C2=A0 The fact it was in 4.15 is not relevant - this
> isn't a list of every ABI-relevant change.
>=20
> CPUID data being added to the stream is critically important, because
> that's the point after which we never enter this compatibility path.

If the bump happened before CPUID data was added to the stream, logic to
cope with migrating-in guests would have been required too, wouldn't it.

But anyway, just to be done with this:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


