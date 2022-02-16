Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D264B83C7
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 10:15:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273823.469101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGOT-0000y4-Q2; Wed, 16 Feb 2022 09:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273823.469101; Wed, 16 Feb 2022 09:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGOT-0000vO-MV; Wed, 16 Feb 2022 09:14:37 +0000
Received: by outflank-mailman (input) for mailman id 273823;
 Wed, 16 Feb 2022 09:14:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKGOS-0000v3-3j
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 09:14:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db89a027-8f08-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 10:14:35 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2050.outbound.protection.outlook.com [104.47.10.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-2SIo1XAgNs2NIXUVjSMROQ-1; Wed, 16 Feb 2022 10:14:33 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6927.eurprd04.prod.outlook.com (2603:10a6:803:139::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 16 Feb
 2022 09:14:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 09:14:31 +0000
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
X-Inumbo-ID: db89a027-8f08-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645002874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NrZZgoYJY4MdIwcI5jvVrDweJ3r9pdUYfrO9hKacT04=;
	b=frVSHwBAtomNbz5cNBji/11f/v/k5diaQuhwwD4SEp0HaR/4BK7rN5fWYlKQ1nPlKZCSSe
	S8l98hr4eE9GXqC+BGZc8u59cxuDFITcythBudq/Jo3YfwUPvcEy8yoHAitfr9F7vWBiN+
	fl7YGbdFQKA4a3LaOZ+L7JqAfD1krMI=
X-MC-Unique: 2SIo1XAgNs2NIXUVjSMROQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9TQg/UjlzHMlEGvBpOdcRTZhcapHT8udX1H4SqZtuG8pwvt53rvjc0+8i+/QhP/LyabvcaLarnnPQ9hRXTGN/YLETWQ/bODpe5WSZ89D/gRGGl8S/KHkWc5Nil6K5KdAx/lZ1CrVp0n0Bs1howZpmuXEyixR5gv02D61QPXAcOA5SPxJ1q4o/ENZ6PVDc2BlbAGSbdWeEgRfC7MUXhFqqbevQ9adhVkeOIR1Tdshd1ckUT/NNmMxNd6O+ftLOIcBYeYclDL3auT2oBx9Rh5M9PiWH9Fq0b6oeewZnCRiSDhs0k8tiBWcWksd7ZpEBDgu2L0oAtnWhw/BcMFd6F/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfBFHIon4DQN6FibBfU6ww05ycs8WLzjZ4KvIryNk+8=;
 b=YQRVrGa2WD13NPx5SaSz8jazNRwV3lfmIW2yE2eZASLAU1tspZejE9AD1A7ojkaBvmKyVvXAeKLSr8TYrQ5AvZM0qz7Xlgs8wts3Wa78lxZIHutVV1PcFi5hFFNHfHGuVO8ZXYtvm+6/8nGHri8kGifS8mcDCo8mnE2M0P1Vo07oNH8s9LkKkKiTI+cx76Wkg0o9MCvTwmuHgQjEvsckUo4HAcRfGRWnF9UJiW1H7azGdRETlS+AAmPVmcRCc6C2M1nrEhrYc0YyV0avE5l4DwGepmiH2jwcc8ITYyfuSwYllkKkwQUEeM1IgTaLQIn1GmdQMYoCCvtPPvfVEamd9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9b1830fc-c189-a421-11da-0b854823b741@suse.com>
Date: Wed, 16 Feb 2022 10:14:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 69/70] x86/efi: Disable CET-IBT around Runtime Services
 calls
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-70-andrew.cooper3@citrix.com>
 <0eede8ae-c2a2-cc87-d4cd-47ceffd4e488@suse.com>
 <9909b7ca-3346-a46a-155c-e4a83d99b2fb@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9909b7ca-3346-a46a-155c-e4a83d99b2fb@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR0202CA0045.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3af3e12f-6f49-45b6-5af0-08d9f12cbd81
X-MS-TrafficTypeDiagnostic: VI1PR04MB6927:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB692758BF58B901065ED4BBBEB3359@VI1PR04MB6927.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JL7m9XjMDiLUeNbZl9w4HtiS+SNc67Y2w8dDb68djtLBQ5Ydfuo9guv8eU8jQNffJzk3C2yrnwxakrB77FxjYQ3LdGs/7OedzpoXL/fWXVmzHpaAJhjdGiCZb1/TjUex/nOltYnoZYrc748bcyFouiqoA7NA07hwYL49GkhMq9x5bJGB5bvONAo9TTOM4W15cOEniJwM/qYuvT2L6mLMhFWXJWFC+RpZHQYL+9YZodT+Kd/GNDihdSsGU6+f8/qfoA9FkG1xurFsQZ9puwjeD1l9I8LhxMJrnmvhwVQhDrfmYp3lhp6QsXBVazTzk+WqJ/4XfnL5jXNiiWoqSGjdC/m7ww7Lq/GORBNTowLAbfF7BbJyGCYPr+BnQj8K6niK6r/YP6e8nKcHbGriesIDNG3XBqdE1N36x9qnAKvrkoiTcX1syMbj19Lru80KypRAOJlPiiakgSAE1Q7gQL5pm5GXsBQUzIm0qK9cz+yS0kSnfD6BUR1ppWUsmOk32OrN1lnyyutCOHokstK40dwLeqq41VBkwbEKIsVGNavBe7ACB3foKQIlIUbA40BnY/d/Jcghh47ZOyzbPgVhiayi3oyw0EkTjX81L0A2GjMIaXpq+zlrjOvRukh1OUJ+b6maUoVlbUX940B0YHutl0iYaaC7UbNMy5r0chwN48jxD2S4bquWjjrQt48eYJci4vUva/ILNVc871MGgzAYrnWbvvnj0FjcZqe7350otToS1hXaDqUthaperVuPcm9yaimo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(316002)(66556008)(66946007)(83380400001)(54906003)(6506007)(6512007)(508600001)(6486002)(38100700002)(8676002)(4326008)(66476007)(53546011)(86362001)(36756003)(31686004)(31696002)(2906002)(5660300002)(8936002)(26005)(186003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OLQbQshf6L8PHMY41wZFCCANy/T/6k1MRPw8WhNtGdI9Gd5hOxy1mUAidx8C?=
 =?us-ascii?Q?y39jJDlUUcAS7+OglTTFhb1IOdxuz0m/6TMmhcH4BUPwYqSeYmUKxT7S7YUm?=
 =?us-ascii?Q?U69QecO2NfdYTl05mFdt50dy2Z+7I1amGa73RdQwavIbCc/fhy+jAjAe1JgG?=
 =?us-ascii?Q?Hod+6vXp925+FYiaYRWCJtdRSFjWu5036c9pYp87hEKw0zilNF/SgOqBZrAw?=
 =?us-ascii?Q?qC7U3IDUl9fnh88mf2GcLmausGyjuk2TGhGflyLa0zWdpBGSo6zXho2hiNef?=
 =?us-ascii?Q?DV/2t4pCGi7dLyEXZj4VgfmFf2N/00O7Mu910hX310NrxaEoZhlwPPNlNt6c?=
 =?us-ascii?Q?so6Zw2iZFeyH3Fdi5X7W3eK2KbU8N4ER3yk5LO5j3bdc2aLfEp/cp7BAlm3D?=
 =?us-ascii?Q?8XRYIynEd4zp9RrfKGpb1NQScVpaTzoeRD8G1r9Z6zdf1Rs9wiT4+3Ogog/m?=
 =?us-ascii?Q?MxEE+9jHl1T33SK3A04i7LU0ZHVlOXeWpC0fFUJCPLI1U11iPrn/rkiIXUA3?=
 =?us-ascii?Q?tZuWlWc4Xk0z/phStDaJrvSmBZgrCxN6obiUufPHdpTx+Pa73M9j/qh45e+2?=
 =?us-ascii?Q?n+VcF/I4rJ+Bgrke9CMmXFGquqnahkIH2OXHj1RZG5KKY+3bC2Q2l7fWGANs?=
 =?us-ascii?Q?azRf8jRxcpiKByBZwib5v+jpnW6en8ctyVMkz0FD5ScrGq7SfyNxTiVDBxDX?=
 =?us-ascii?Q?uhofXE5FruUG6oLJchqPs01u1HoAaHVw7PQFZFGuQGMsOVBUV/LBuG1ncdHi?=
 =?us-ascii?Q?zdoPCcYntBW/oVFQc+YVUD3f9VuweaPzcQJGvwA2z/RQ+2Mx23zez5YNG5o/?=
 =?us-ascii?Q?No+J9mSrGC43AA66d0jrm6lh3WBgeLxdsyx0mGYIgsSUVyspUKkHg73L8eaC?=
 =?us-ascii?Q?HloXW9FAYkoqjKfht/mgZCZQ3Kj4pHLSPBsdYg2lBS9BI9Mojj67aFj6jaXT?=
 =?us-ascii?Q?R10oABKkwltlRz5RYBXkNAKkSSLYKBdBdH1AxzP4VyY5UTz8mOVYpbfyiIZt?=
 =?us-ascii?Q?AFsuTk5wxkZo7mu44TGx51xBTJMmvZKehiROXK8ivkMR4w92Bl/KJk3cRmqv?=
 =?us-ascii?Q?nSAhIYaNMZX3fKNun8nVL58OCDx7FnehsxO6MHHDOX5lrM7qp7NdvTgz4Yur?=
 =?us-ascii?Q?1hxe/GV8/0CaooZ5pzL2nzjAq9dWNwAxOlgOEVtSGnxT2ReEewZSZ+2PGXnF?=
 =?us-ascii?Q?A2YpaEwMR2TreGIakbPz1QD8pUOJi6OTEvuwJZAZ7jYvDtHbpoROPhLpLlhb?=
 =?us-ascii?Q?S2e1Eitc9/cjanyzbiUC/uTHRg3hkH1hENPRzVZLvF17udFobBFukn2Dk8wR?=
 =?us-ascii?Q?y4KgA3RKclKilrLvWITPNPtNvcG2eJnseleePTp+ge3r21O80EyLfb792Hze?=
 =?us-ascii?Q?RLQrsUvfQ6qDUJkWPzzM87zOyUOUX3FIPfXDBCwC+dnT7amvU0UyMOolfRFo?=
 =?us-ascii?Q?1QxrmdRVBqr+a6KMb1DZsFK1UhKotxD2MF5/cOQ0RZPxXOj+qogNzi3A7EO6?=
 =?us-ascii?Q?KUvUz3xpYx2UIxcLtlFwgj5L88oIEvXbw2ysnmpSg467bTOxwASz1rN+wgDH?=
 =?us-ascii?Q?tESLkuELTGOwamzqSH+lA1PMtk2k6Hy0I5xF45WTKORMWn9T/yj/Azg2eYcK?=
 =?us-ascii?Q?M1AC1HqWr4B27yKXA1eupjs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af3e12f-6f49-45b6-5af0-08d9f12cbd81
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 09:14:31.1737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQPAbwiYfi4X3EgUccvmwBOGedl7xbsfh2TqtStpfhQSlQVFG1r9lDYdfpR3hFbM1m+ilGsuudZS52ERA1GaEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6927

On 16.02.2022 00:00, Andrew Cooper wrote:
> On 15/02/2022 16:53, Jan Beulich wrote:
>> On 14.02.2022 13:51, Andrew Cooper wrote:
>>> --- a/xen/common/efi/runtime.c
>>> +++ b/xen/common/efi/runtime.c
>>> @@ -21,6 +21,7 @@ struct efi_rs_state {
>>>    * don't strictly need that.
>>>    */
>>>   unsigned long __aligned(32) cr3;
>>> +    unsigned long msr_s_cet;
>>>  #endif
>>>  };
>> The latest with the next addition here we will probably want to ...
>>
>>> @@ -113,6 +114,19 @@ struct efi_rs_state efi_rs_enter(void)
>> ... no longer have this be the function's return type.
>=20
> So about this.
>=20
> why aren't we using __attribute__((force_align_arg_pointer)) ?=C2=A0 It
> exists in at least GCC 4.1 and Clang 6.

Perhaps first and foremost because this is the first time I encounter
this attribute, despite it having been around for so long. However,
Clang 6 would be a little too high for the main box I have a Clang
installed on - that's Clang 5 only (and, afaict, no option to upgrade
without also upgrading the distro, while I'd also like to avoid having
to also build myself Clang binaries; maybe sooner or later that's
going to be unavoidable, though). While from binary searching its
libraries it looks to know of that attribute, it still doesn't accept
its use.

The other issue I see is that using it would be fragile: We cannot
afford to forget putting the attribute on any of the relevant
functions. Whereas the present model makes it impossible to miss
any instance.

Finally the attribute's interaction with -mpreferred-stack-boundary=3D
isn't spelled out anywhere. It looks to behave sanely on gcc 11, but
who knows whether this has always been the case.

Jan

> We're way way overdue bumping the minimum toolchain versions, and Clang
> 3.5=3D>6 is still very obsolete minimum version.=C2=A0 This way, we're no=
t
> depending on some very subtle ABI mechanics to try and keep the stack
> properly aligned.
>=20
> ~Andrew


