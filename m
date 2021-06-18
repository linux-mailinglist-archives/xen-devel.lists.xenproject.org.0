Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7D73ACB40
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 14:41:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144582.266095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luDo4-0000ml-PP; Fri, 18 Jun 2021 12:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144582.266095; Fri, 18 Jun 2021 12:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luDo4-0000jG-LO; Fri, 18 Jun 2021 12:41:08 +0000
Received: by outflank-mailman (input) for mailman id 144582;
 Fri, 18 Jun 2021 12:41:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lC6W=LM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1luDo3-0000j9-8L
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 12:41:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eeda3ef0-01f2-46d2-bb0b-f7288cee8c8d;
 Fri, 18 Jun 2021 12:41:05 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-7lvNB4lRPpW6XZz-pN2JXg-1; Fri, 18 Jun 2021 14:41:03 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6672.eurprd04.prod.outlook.com (2603:10a6:803:127::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 18 Jun
 2021 12:41:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 12:41:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM9P193CA0017.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Fri, 18 Jun 2021 12:40:58 +0000
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
X-Inumbo-ID: eeda3ef0-01f2-46d2-bb0b-f7288cee8c8d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624020064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+OFRb2re+j8mDXoGLge6DvS83zdPaON/XX9S5Wwy/4A=;
	b=bTc1P7s3NIwVSA5s2iBB3QLZxS/5O0u3e5eCNljRPEZOvnmTLAthyLLf1UDfF/mTIOUAxD
	PYUKdmZ/5G23AR+syt7fp5xjtf0t2vCHOX20P8aCpDQc7omr6lxKS8xTdswWmDPy/M7a7u
	afTJLT37slPqS9ExL3areFAAm3ocF2w=
X-MC-Unique: 7lvNB4lRPpW6XZz-pN2JXg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6CxTyXFg5QyfSK+jmsuzteSOuc4xvQc20FrMVx8Cr7Sw+8kkc9DRdCd9LFmfg6Sj3nOteh8p3u1SM6TFTLLIsEaM2+l6nXYWIu4sDHR4fkktE81CuA2bcWrvujaR/uGW7Pwp89f+sP1iO/IkGTnK5iETKlVz2/KjbFt0gwmIhp8tAc2RnU2LVVdEXI8OBHtL8SLN8D8n9DjqRucl/dun5TS95/H4Nyd7Q5GfJ4Ec31hhSfiGxUqZMO6bas/pmRqJYgJZNGBWgtno2gEJUDg4kS+3EEVI/57K56tZYAN+xLoqce4vY33VrPA8y8wh3BvrgT6zxZW94AjQQ5TPjZXXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joSpaatqX+/3axrhqntVSZyIQpT7Mxe2NSP2FvFuLyA=;
 b=g6AiWqLC1gMz71c7+SIhR9cCekJgOHd39h/z4wKjMKk43aZRR4dtMP9GZHc005MHOYp0KZPfdXa29cDlVupOqjuZZ91cZtZI+E5ta40XtipY/IcYjIAK7f1RoYiZVzplCoCzaFj+YOaf1PVZYo2gxbwhvOYggTN4nlDOLVMvq5wIAGiPoOedjSSihGF9L1PV1M4uNOoACdbI8fTTcqCm1KnIXILovMGTJmgsAq+pJDs3BeBbio0yn4TX/scx9uzUV58f8NYz2AD+BaYIfjqscWihE/hg5nd8X41WvkOpb08kCeD9udesdyBgW2XPVIC27gtQcgDaxwNtGNdPj6mPQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 5/6] xsm: expanding function related macros in dummy.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Tim Deegan <tim@xen.org>, Juergen Gross <jgross@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, persaur@gmail.com,
 christopher.w.clark@gmail.com, adam.schwalm@starlab.io,
 scott.davis@starlab.io, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <20210617233918.10095-6-dpsmith@apertussolutions.com>
 <42e3d58a-edf3-1da9-af6e-c2400f25365c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <60894a2d-0977-18e7-75d3-726695dd06eb@suse.com>
Date: Fri, 18 Jun 2021 14:40:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <42e3d58a-edf3-1da9-af6e-c2400f25365c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM9P193CA0017.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3d7b74f-3254-4f9d-7374-08d9325653d6
X-MS-TrafficTypeDiagnostic: VE1PR04MB6672:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6672B8003C75D269AA044F58B30D9@VE1PR04MB6672.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2vnufVPNpcrtrXAqhvaxwiwxQ37uwK2ZvOEmEohg+8qtEwiTv2QHLtKTk6qPHZeiy/qBjEGYBRXFdJzJ+c6xYLe40n935zWbZUrJ66wkHpRSu1+nuFi+3pN7bQSaAtzloR1LFQUne3VRdxBPC6Q4UQHGIxCpPjs/f4h/1cisRjibmS2ZMsy9v5gVl+VQFfmHUh83k2PRJU+aQQzO0NfGhfrhZK2i9ziztt2r7kJ2WjGRyMbKrGbbjaaaJIKTXb8meAOfcgNCg1LmKTpw+4cD9dZXgLklCiMh5v4GxY1/fYl2EBF+SXXOGcmlUvCtg0VefXEiq3C1WBzhQd7hCGEY0idTjfCANbxP52El72jK1GUyXKVzyPz3PGz0uAuHaBJcY3b/hlc541voplIzL1bC7/MX+5qlRWBHtgMXUPGp6AB0LNqUm9YpH3N6lreSftwP2bcexWw9OFBcWKdvw/9eGcabf6BXAK+0OiR4oK/yBqw/FNqN8YEJDhtHEYaL4MkpUSMXkxdBQuB3LALKUUt9U2JNXqa2VIgm/QlltqCq/zEgL8ppUycHl+6lLYBo3Wyr4TJNJzTHPBkzkT5dyxN2sGMZJ4E7FFV63OWH3Z5q5vt9WvuJXS5vkDl7PhvpRHP8f3UsGaPBL+e08N+Bc7/vgA3komtuJS/fuowsb9EWpbV5wGMtZVoBz+3anC6nPyh6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39850400004)(136003)(366004)(376002)(346002)(6486002)(6916009)(86362001)(186003)(8936002)(31686004)(36756003)(16576012)(16526019)(26005)(7416002)(38100700002)(2906002)(8676002)(83380400001)(5660300002)(66476007)(316002)(66556008)(66946007)(2616005)(956004)(54906003)(53546011)(4326008)(31696002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yPlycS7T/tnvLJlv2fjRIKBHd/zskjvMNFmxLaWYbRlDJreUprHjy99aJvEI?=
 =?us-ascii?Q?xk+QDWhv1yLXRIpSqqiSJrTE26KW42iuXtu7AUdZzDDxkxX3EUhSkIRkOJKs?=
 =?us-ascii?Q?H5+4Z3mZJRzGhjemAaVBu9UR84iV7C/QjklPu1ufPFEzPAqkZ780wbDDfrFF?=
 =?us-ascii?Q?dmvMLiktd2AnqBz7JRpmQGr6eTSnLdEw+Py37ZNym3vcGM8WZTu4Cgtjud1h?=
 =?us-ascii?Q?ynXjBmvlYfOaQQFHWNwGYnfFrbl7fKU2WuSVZTlwMUX9wqfv4P9JiJrixtph?=
 =?us-ascii?Q?efKtKmM/HLVy8fTd+ep4nO+/ZreHyZuUi7d9wASDGrt+v9VzCGv5mYdhELbd?=
 =?us-ascii?Q?wcl/s5CMKWrHteALBzeiK4aZupaN4m0DvAQzoqlVaC0LDSZqA+qmW9pqKk6Z?=
 =?us-ascii?Q?IhLHEzw93avbUD4Wdj8UunCkhODlWBWIMpvAbY//QOhpJ8an41QvMxbcdhuY?=
 =?us-ascii?Q?2u9DUEey5DzdGUw2oZ9KikzPYF6fnCduRYQOFmuohAOvrIQBF0S+rhM5aMY0?=
 =?us-ascii?Q?tazZKhzdDc0Zc5PRXv+dt4/AceBTSqAjhlRqtrgZ3I7ESz4Jj7H/N4vhhfVO?=
 =?us-ascii?Q?L3dbRS5GqoKsW6textIJie2O7KktU0rJu5FHtbDmoXoVtmnN1lVwp+DTMOYd?=
 =?us-ascii?Q?kQmUCPAfswfFYaSPcWNRMn+GhTkSVleJCjybfJzCvIlM0ZROhqO8cWWrrdEs?=
 =?us-ascii?Q?ZBWzrmItFjMjcNtQCCz0yDigad5KF9yMW9XfncJTDR2tF0KNQzOhV6YNOz3D?=
 =?us-ascii?Q?ajuo2NN8nwWXdsghLYhnUSJGtl6K9rczFkx3ThjUH6cufAeDmH8RH2QehkMk?=
 =?us-ascii?Q?ljnKkLf2JrLLikRVygjkuvrHTpe1TY/HnejiqvDxCU6bkCs4sTVun4tLqute?=
 =?us-ascii?Q?/Z3WrrDe+HyMu46/m7TvegIcrzqsf2lxrQX6/14HvmUljGEFSconwzxDhzbO?=
 =?us-ascii?Q?7L9lPILyko2IClFVihYUpAKKQr1pF7yOvVuDR0AuBRGOyKfsRmq3XBdblJZh?=
 =?us-ascii?Q?rWfZL6Xe6fp0v45Wh7c60oIj06Jp/SfzjrSSyQsXleZ40IT108xzX1OMV1NQ?=
 =?us-ascii?Q?OIuw+9eyoKIZaBeFbwayyqM7NtFOmKX044+KUKQKSXTox4mkEEc4i7wJodMS?=
 =?us-ascii?Q?zdVF1xAPvpr2l7GeZ9LWuCPevWxRqjLy0udoqUaSzlthVawLvZ7PNzaQ+NpN?=
 =?us-ascii?Q?zkQCbwN/6bwmEi/nDx+L1gPbrrAswbUWzBfNws42f+P3CVQZYbhCBTHnmB9j?=
 =?us-ascii?Q?IBAkS4XpFLZJ2MsdMqhFcnFqMzpotNfMMP0p8MRv27hVxXyT4YuSOkyCia/G?=
 =?us-ascii?Q?c/GbxjvCbqaGuzl84wJsKHUj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d7b74f-3254-4f9d-7374-08d9325653d6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 12:41:01.1841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ABR8EIWWHOvnJS/Wx5gQiXu6vqGqIjzPRf/LzaKilzf37lAw/71J2hrk6z/j6MrQWvixEThEknW198in5Qj8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6672

On 18.06.2021 14:03, Andrew Cooper wrote:
> On 18/06/2021 00:39, Daniel P. Smith wrote:
>> diff --git a/xen/xsm/dummy.h b/xen/xsm/dummy.h
>> index 7e2bb09dac..0f8ea163af 100644
>> --- a/xen/xsm/dummy.h
>> +++ b/xen/xsm/dummy.h
>> @@ -9,7 +9,7 @@
>>   *
>>   *
>>   *  Each XSM hook implementing an access check should have its first pa=
rameter
>> - *  preceded by XSM_DEFAULT_ARG (or use XSM_DEFAULT_VOID if it has no
>> + *  preceded by (or use XSM_DEFAULT_VOID if it has no
>>   *  arguments). The first non-declaration statement shold be XSM_ASSERT=
_ACTION
>>   *  with the expected type of the hook, which will either define or che=
ck the
>>   *  value of action.
>> @@ -47,14 +47,12 @@ void __xsm_action_mismatch_detected(void);
>>   * xsm_default_t argument available, so the value from the assertion is=
 used to
>>   * initialize the variable.
>>   */
>> -#define XSM_INLINE __maybe_unused
>=20
> Nothing in a header file should ever need __maybe_unused.=C2=A0 Now that =
the
> !XSM case has been untangled, I think this can be dropped, rather than
> expanded inline.
>=20
>> -
>> -#define XSM_DEFAULT_ARG /* */
>>  #define XSM_DEFAULT_VOID void
>=20
> XSM_DEFAULT_VOID needs to disappear too.=C2=A0 I can't see what it is eve=
n
> doing before the cleanup, because if it is missing, you'll fail the
> compile for using K&R style functions.

You need to look at the state before patch 3 to see its purpose. Patch 3
removed the other variant, and hence the need for this one as well, but
I think it is reasonable to not clean up everything in one go (unless
it would mean touching exactly the same code a 2nd time later on).

Jan


