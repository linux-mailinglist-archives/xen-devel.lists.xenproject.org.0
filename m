Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14D44A6FB8
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 12:15:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264063.457023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFDbF-0007Ai-A6; Wed, 02 Feb 2022 11:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264063.457023; Wed, 02 Feb 2022 11:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFDbF-00078p-6t; Wed, 02 Feb 2022 11:14:57 +0000
Received: by outflank-mailman (input) for mailman id 264063;
 Wed, 02 Feb 2022 11:14:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFDbE-00078j-1B
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 11:14:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59311b35-8419-11ec-8f75-fffcc8bd4f1a;
 Wed, 02 Feb 2022 12:14:54 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-1pQ6CSccPBeVr_0oipdxCQ-1; Wed, 02 Feb 2022 12:14:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB9207.eurprd04.prod.outlook.com (2603:10a6:20b:44e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 11:14:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 11:14:52 +0000
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
X-Inumbo-ID: 59311b35-8419-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643800494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9t01eeFkiarElCelzuu7bD0UEGtOl1v1SX0++MOjowg=;
	b=MPGPkEhN7CUcUCS+jOr1gorfXMaMDAQbmkxtsvVdWWezjGGk9ZhUzIv5XMfEaYx/KIpk2g
	p9tSbQEHOqZ/lRmNQefObDDXVvKC7vaZ3zs3VhyjmoFUzbc2gMekItng0HjyaAOvL1BBzI
	RabdORwUbb6DGCBw5vppVDFxmUpSHXk=
X-MC-Unique: 1pQ6CSccPBeVr_0oipdxCQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0n0cHm3krHtTbtD7EnIhSMRNQlVRmRxhvH1ukyymQqP0B1JSd78TPnAV4qfUT1382N5ls9QfyIvvG8OkOXq0OJ+gM4LhX5e/IPcHwMYcF2frEKb9gt3lssxCriIPC7CO+cMUz0FUlNeSZQ2Kw0uaDk5NLi5cA7uI6P4u/11CMgaBMCJRegXL4ibDhVwkMdb/bQYrVRt48whOUzPbx5a5PAudxFnva00TwUwKEpGgy4HRueN2gFPcYHE0vSEcUMrU/ONoiOXSuM6mU9iTgcIZdP4lAvwxDPsENXTKRLy9/70dqeJotC7efENS0ztBXahG1t1+bV2LEhBxkLXGOeIkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFH66RMYlzBVjpL0aGpWug9AljITc3neqTV1mJx/ELU=;
 b=ZNJnlo3zUgA0R+NqlOy8SJV+rlDIqlo9LnPfXXNxVG83zJsHbNzmlHd5svko+REnBembyhyNVTgKcIETCGg6vIWpDOcN843Svyb4mVA87AyDMZ9r4bH1wwZVjIIqTsJ+cv0SLGAn0QQ3g/C/YVn9ElasG9FXuzJGMf4Zpyd4uv+tvpHus4Q1lZTVtPFQHnNXUASTSdzRcGDl4Pg/5st6ELmKgFH3QSS2zTT1tnfj/NP/PofValzo24KAWjTBTDWgvNQDmuUD1aNwglmfmqHy0M1dqqJHjB+IWQzzaa5YVBOXf4QlhEaoYQqEU3KXHNzhPEqQOQFogJ8wGJnHxPsJrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <58209ef8-59e7-129d-c8d5-3edc975892ac@suse.com>
Date: Wed, 2 Feb 2022 12:14:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/4] vpci: move lock outside of struct vpci
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220201162508.417008-1-andr2000@gmail.com>
 <20220201162508.417008-5-andr2000@gmail.com>
 <fc3df33c-d1e5-8c74-01e9-7ea7cea41521@suse.com>
 <e19a0f7a-651e-09a6-c03d-ea5286fe03ba@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e19a0f7a-651e-09a6-c03d-ea5286fe03ba@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR04CA0008.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b75f569d-2dff-40d4-9704-08d9e63d3ba9
X-MS-TrafficTypeDiagnostic: AS8PR04MB9207:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB9207E9DC1324146775BADC7BB3279@AS8PR04MB9207.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	keFHDFWkV6OliBgy91ooO5+HrnICMHR+SURikb3XkLpXvTB9ifaER8acMu54kTFsVFZxWZD0vIm7xh41JShiUk7VEnKB2QdV4rtqz40XHpKtp+KxDc0ubNsSTf8SLG+rCRByximW1MSFgsP3PwD4BT2+VUscY+okwqN5D3pKRhsEvAoP4FZP7svyQpoxksqbyC+enQv82Jvd02VvjJZxaehRzm8IHJ0So3N0EzvpJo1h/uENXf4vlvhwCh+BzMyDccHZ07Ij60CFod/VLqHcJQmciR6ZN2MQ+U0YDmRJJiyH3qjo6mXArIF3A1OxNaRUSdEuUwy4zrCLv3W4/6gIjcJ2YX9Alt+6fEJ7X9M+wxUd2ES2UWV3VuXxnXty2T4gYc04Qn6EiCs8eMOZhFJZvVe/8iPjjOYEaz4/t5cMSghimzTvTzDpCFlG4wZTQj+vIS5ev0cDJoQOpcvtL/g1MMv5eS3W7IdEek/p7+MsO/bVwdDCDg0IihrOBOEbYPsgiz90FMvJnwzkvTO1zrXic50O/IWYMeVk24kk3m69Lkwj3cbfqBxTEbx/pjFcG5MvU3XFkDK6MGhQN6Txapm57O4m0fmj2OwJTXaKp1e+9GqsYzYuW7DJGTHXf9e+ujABrleJ5cizF6QI7vsWkIDDWstO7bC9taLy2RAZ1z2+4tyxnP6ptymbB9UPZ1nh4LhI1p+M2KpCN/0kjvaKW9VZFLHy6fr/swOomRNfjbxw1FwISET9O4Tt4wWIFhvDw0bKk0kgyzSCXEOMDEcg0G7ASzJ5n7gixqv9xnb5qzQqhz7jOM4T/CLES/yIZL+pAzN/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(4326008)(7416002)(66946007)(38100700002)(508600001)(66476007)(66556008)(26005)(186003)(53546011)(966005)(6666004)(83380400001)(5660300002)(6506007)(36756003)(8676002)(316002)(6916009)(2906002)(6512007)(54906003)(2616005)(6486002)(8936002)(31686004)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VF13qYTpkyh+wfFDe9CQP308NHyVndvOWwaqWcc0Qfek3hSyKlSy0oX9zsZz?=
 =?us-ascii?Q?m9VR2Xd4oo/1zC12MmBSHuxsc1zXXx5EU5z47ufes7yrq3oomire6/+ZxXlG?=
 =?us-ascii?Q?gQceXbzI5/e+SBewWrgFtyw581W2guxyIoVnBo7yww+Mp27m/wHZ8yQjRBWl?=
 =?us-ascii?Q?SZKlXf1npYk+WglRI29StNagD146Rt8wibPVstuS0AvRLzidkNejI2hXlTA+?=
 =?us-ascii?Q?GJsMDaBNbtaUUGIOIoYnKSjLV+VYNVuz3zxm7i2+8LI67mApu4o9Qz0WMugj?=
 =?us-ascii?Q?rNba9a8jhbGvxSGn52bByUH3ezSa/7fwzqjooKwRj28uwk6cCCkZ5AaJx4hb?=
 =?us-ascii?Q?EozWXlgFiNZ0cVcrDkdP0a+HFx2VRvrQPaVa7yZ0ySfuEjMeBUAJIR3hoY1E?=
 =?us-ascii?Q?eYQI98aAYZRHZl6D350IekeABk/mllzMp+tCZcwvdypug9s8ECdTD3Tvdl9c?=
 =?us-ascii?Q?eBH+r8vFsOTgj6cpZ9Qn2Wi6vtwDKmFjR8A1T0MqarHJZCKjfKO+m5MTXkAK?=
 =?us-ascii?Q?QK8QOENztgUilZ9TzQptjIzFqTGgs1eRqBJLodZyCgADL7eS/V2XJbvsf5oL?=
 =?us-ascii?Q?AeV0Ne+SrCAa8EZhN3xtrvDApbAvHUjEv++qpGGJiacvLVmG8qitxgODWIoh?=
 =?us-ascii?Q?X8xn8nvxN6L8SG+DNyYUGShDW/Hr7dzZLqB+G/+V/TF58Am/es1NKjj+wBE2?=
 =?us-ascii?Q?dOf6rDxiChQ+KuyXSfSC0IS6Kk8vy3AG2uJ5YLekFsFecxCju/B4M+2lB6zI?=
 =?us-ascii?Q?HPSlLH+8GkphXbUWs+k5yZwgZj3nttMeebkiOMm5p9kJsmWCQM2TeLM0ZKTg?=
 =?us-ascii?Q?XGsIqvDVoD1kMuixAs9xvLQ/b/LTjIvj4SuCwb3EiZPSljV7jzRyy4BHDikf?=
 =?us-ascii?Q?HGGCWGm/8O+1plMUMeR89gmZ0TRZ4H+0gzc4jpXEOh51jTC44Qx3T7O7P9v2?=
 =?us-ascii?Q?Rom0v+RrQSD7gK+zYCwLoCBnKgT7CqbXScet2MHkXkhLP2dG++RcqnlBrW+n?=
 =?us-ascii?Q?2MYIE1I5UIXObKFY9Dvs5W0Wt51k5J0BpdPzohIVP62vELyHvhtZ7+C7beiq?=
 =?us-ascii?Q?DvnJ34kLkyqeLQeKx4JFsg99YjBTQGlYL1aaS/LYYuDf9vW9pSQre+1uhn26?=
 =?us-ascii?Q?OlrcUbnWaM/5B4hea6oQZV1vI5QTcYCvUf0Sm20HmEfijSlzdDroXY1qNcN8?=
 =?us-ascii?Q?7J5mnZRPKibj2xUn5ESB06uNM6AE0eAqaWykCo8Lw46FvGwo6Cvc8mWbvfA3?=
 =?us-ascii?Q?0gYEfMJ4w+/tkAhXnMAqigC9layGnvvN2nVevKe+zZK4NFO5aiJNDvoLeXAM?=
 =?us-ascii?Q?IAEt4xllb5HTHQwanSgA2zfM2Coj4TN3jgzFLATJPw305yC7wvK0efLiBxF7?=
 =?us-ascii?Q?4Pukpy0A5DZSnQFUrzlsILhjOYjCCxDQs805+jS19yDW36BlO6+lW1ucmvfQ?=
 =?us-ascii?Q?9NgpPdoYXaPB3yFQXIZa7c6pIYVMYPygagl9WfPt662COy5IWv11a56BCxns?=
 =?us-ascii?Q?QdfYo+A+R9xzksDrOKC89E/U6e3Sc2nIWYBijbcy35PQomPRqsFpADys/5Wx?=
 =?us-ascii?Q?GQUhusl6Kb1p3QgETTUw94cS7Nfz/s+4JSwxXrq9LRPT1nPmX3B+c7PSTYT4?=
 =?us-ascii?Q?gWEKHscdqN2fH65YiE9BetU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b75f569d-2dff-40d4-9704-08d9e63d3ba9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 11:14:51.9405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzvuvrd+81WMTZGC0du51rRAil4GZLco6lO7eesQHAj5G4hDo5Ywzet+FXT2ERKnbqgw/Md+EB0I7tnLKeX31A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9207

On 02.02.2022 12:03, Oleksandr Andrushchenko wrote:
> On 02.02.22 11:22, Jan Beulich wrote:
>> On 01.02.2022 17:25, Oleksandr Andrushchenko wrote:
>>> From: Roger Pau Monne <roger.pau@citrix.com>
>>>
>>> This way the lock can be used to check whether vpci is present, and
>>> removal can be performed while holding the lock, in order to make
>>> sure there are no accesses to the contents of the vpci struct.
>>> Previously removal could race with vpci_read for example, since the
>>> lock was dropped prior to freeing pdev->vpci.
>>>
>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.co=
m>
>>> ---
>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Cc: Jan Beulich <jbeulich@suse.com>
>>> Cc: Julien Grall <julien@xen.org>
>>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>>> ---
>>> New in v5 of this series: this is an updated version of the patch publi=
shed at
>>> https://urldefense.com/v3/__https://lore.kernel.org/xen-devel/201807170=
94830.54806-2-roger.pau@citrix.com/__;!!GF_29dbcQIUBPA!jmmcewY6y9Ur4rgvOgqs=
cz8gBWaod2JnQOkHvWtYKgnqeU6BoWJTqCN3UDpCw3io8Ynk-wBXhA$ [lore[.]kernel[.]or=
g]
>>>
>>> Changes since v5:
>> This is a little odd in a series implicitly tagged as v1.
>>
>>> --- a/xen/drivers/vpci/header.c
>>> +++ b/xen/drivers/vpci/header.c
>>> @@ -142,12 +142,13 @@ bool vpci_process_pending(struct vcpu *v)
>>>           if ( rc =3D=3D -ERESTART )
>>>               return true;
>>>  =20
>>> -        spin_lock(&v->vpci.pdev->vpci->lock);
>>> -        /* Disable memory decoding unconditionally on failure. */
>>> -        modify_decoding(v->vpci.pdev,
>>> -                        rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vp=
ci.cmd,
>>> -                        !rc && v->vpci.rom_only);
>>> -        spin_unlock(&v->vpci.pdev->vpci->lock);
>>> +        spin_lock(&v->vpci.pdev->vpci_lock);
>>> +        if ( v->vpci.pdev->vpci )
>>> +            /* Disable memory decoding unconditionally on failure. */
>>> +            modify_decoding(v->vpci.pdev,
>>> +                            rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v=
->vpci.cmd,
>>> +                            !rc && v->vpci.rom_only);
>>> +        spin_unlock(&v->vpci.pdev->vpci_lock);
>> While I certainly see the point, the addition of this if() (and a
>> few more elsewhere) isn't covered by title or description.
> The commit message says:
> "This way the lock can be used to check whether vpci is present, and
> removal can be performed while holding the lock, in order to make
> sure there are no accesses to the contents of the vpci struct."
> So, I think this is enough to describe the fact that after you have locke=
d
> the protected structure may have gone already and we need to
> re-check it is still present.

I'm afraid that to me "can be used" describes future behavior, as
opposed to e.g. "is used". If you want to point out both aspects,
maybe "... can be used (and in a few cases is used right away) ..."?

Jan


