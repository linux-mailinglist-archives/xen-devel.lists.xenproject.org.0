Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 079D24ED40F
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 08:43:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296672.505055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZoWG-0003pb-81; Thu, 31 Mar 2022 06:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296672.505055; Thu, 31 Mar 2022 06:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZoWG-0003nk-4p; Thu, 31 Mar 2022 06:42:56 +0000
Received: by outflank-mailman (input) for mailman id 296672;
 Thu, 31 Mar 2022 06:42:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZoWE-0003ne-Ma
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 06:42:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca663692-b0bd-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 08:42:53 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-v-Pk8tb_NMqobvQv_lp0eA-1; Thu, 31 Mar 2022 08:42:51 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB5713.eurprd04.prod.outlook.com (2603:10a6:208:125::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Thu, 31 Mar
 2022 06:42:49 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 06:42:49 +0000
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
X-Inumbo-ID: ca663692-b0bd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648708973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NYffX1l9B47BcT8gYjV+QSbpHHpUkfstJZFWbMO/bx0=;
	b=L9mgMBcL4c8OJVV6MjMD/iRzax6QgVx3g8uIS7H2lKRJFANjt0fgMwyrSLAUy/DS18tPJr
	SAdQVQPUBudXCKrWa/9zL6kNEtWtvKgQawedVx5AYbR4tfXg4zr/VnPc6/pYm/FsQUYgBA
	N44OsYpjJWXD7LNomO63cLy8CFXOhjQ=
X-MC-Unique: v-Pk8tb_NMqobvQv_lp0eA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hd9t+0ibBe4Q49FiT/3EQ6X80V7m60zZmw+jWO1Wr+07Ff5dOQbnUshhXw5W2EiYBYdkvEzbLebA9dPVNzy9WAd3HeunmbxrtL/TVn8ssZJZ45StFK+IF7VWzdsl6piVXNHvCZcoOdeO8oiGD5ZZW1rt/Tdt6aN4CEyvndh5RcJU+3/IdGr7q1o6T4SUJpD7kdiBt74Ndnfwv4w4CSOHq/GMbYCjvcojG7YwO0FnQ5z3WQTYmoEyEo8pUM1W5iyXVOjiTyyH4TJaeIyRfXbGJtf7wO8wte16hnN+FXS405VCQXiHI3gMu23VXHA3PLDnK748+0D0p5m0zARuZHHbEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfV2svkbKV4AHtxzQZYqSwB8DQ5JLjU1dH59H/lAJZc=;
 b=OWlnGFPOEdsDLVJNTpepTYg1qByZDZuL5jQxQsHsolMOVsIzwR5Rv7JGQp6vsXy29utzvMCDUCRYbnceIrQFE1IfT5y7hdspGbMLxl3ApiNjVbdiLycznENNhv8o6ozJJ7bAUcvLgsDtx93e2EkD4oRrYyF4Nhx9S4qjee1M1YUwL3zL91TCZbtYtO4dPWv4txveaGI/9a/0IdsacYXs6A5beGWKkh9VknpKW/2mgjVEro/QnBhnarGMwNLStaPYUs4qBXohHH+kP5NuhnzFVDQcV/5jewqm+xseC4QrFvJRfy2u9X9sBCfx227rYvS9cVA7wOXeyCZIHGeaPCcJcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a6f18801-7959-8fc8-f414-8086ed74ab3a@suse.com>
Date: Thu, 31 Mar 2022 08:42:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] livepatch: account for patch offset when applying NOP
 patch
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Bjoern Doebel <doebel@amazon.de>
References: <772f0afc-64db-6b98-af49-bd970ac78cbb@suse.com>
 <YkSNm0mb47Vc6nGr@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YkSNm0mb47Vc6nGr@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR02CA0018.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::31) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16f1ed1b-bb13-44f3-cc90-08da12e1ac64
X-MS-TrafficTypeDiagnostic: AM0PR04MB5713:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5713C227DD91E8995D0E7502B3E19@AM0PR04MB5713.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZYMuDjhMBC0I7iJDvcGZTmaBvK3ehhpmRnqBEOuXn4rEABu+aKVgnA4PARv8MzFtx27I9rNVyKN/L4xuKWMNBVsq8jCEe2eiKQ5Q+LQtx3fMNRGtP+0AZIiluAQ2CtBPlEuGRwdmhqJ4yGwOy4+8/MU1HxWkwg32/gwW3CqIMZfINU0oEOe5uFpfeyHi4r4bhOTkUZ8t9Lyer9qcLteweocaPgEfjq+okMgA82Yv0nwMbhCyoaa7LkCgBXCcRiAyHBBq2LyoRh0lBsNq2WeggZXhAnLKEqFYdnDR5WSh/zGPPpEvRDR1NKs11qP0RW080xXalBHYXcOdVWXX5uL2Hluu1qJJGffq//R7tpL9jIfVbKc28zBHgmh7hVkC3i8vfYBTV8HSDi8kX1icGKmWCzIQn41VqVHu1kDXr3bnL8dQ0XueavAMhToGtqAX5eG+fbjVikxDprBOODmuD0lii0aq7Kq7r9uiq1mk6GK9q5/KT4KD/WN6t55vNNVMM8cImGE3pw6MVAlwXOpjS+JHQbIG+F1CBrWUBBeYp8fixlPcPCzUzoCxXQcpEcngS2GppLPMqzhE0n6Qo1juh56ptmWXsnXJrEatUOw+Z5lzTqrGjEbJY2aOgeXgwY0N083QIm0jpVKKc1s9yujL0pzHOpmEBtOazp2eQef1lM5fpj/HJk2PH+xCKNRmbJFunb4GzsSid60f8guAu0KAgw5TbOhkUs3x7Cas5v018HevLkA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(8676002)(66556008)(83380400001)(66476007)(66946007)(54906003)(2616005)(4326008)(26005)(186003)(8936002)(6512007)(6916009)(86362001)(316002)(53546011)(31696002)(2906002)(5660300002)(6506007)(36756003)(31686004)(508600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2tTp48xgupujnCY/tfGHNf1U2qHH3u4sVfdJYk0W6IUQ/9XlCHnbKEKxAMy6?=
 =?us-ascii?Q?kJwhhwhBDhwRJWzoxXcIGUd6h6Zm/hYOXJaSwvC5JeFJXsQmCooDu8XTVW8v?=
 =?us-ascii?Q?Ut5bcI9+KhBgA1L40sW7j3/4v4zBUCdqzRUkW0vD0yWVxTTawJ4wb4DSvDOS?=
 =?us-ascii?Q?KE6rhbz+yBa2VAz7IK8qj9XVubcdOqqZZXRR1slaU+ZEGG5a2zs7Wzi5lvTK?=
 =?us-ascii?Q?sBXvTdgnT9ihlhdddtk/eOWN3kJecP/ol/CRszCnWiQlLe0ASFdOUBTd0PBA?=
 =?us-ascii?Q?lv/amSkQgPZRjxoxTl0Ux5yyY+wGbzIYZfK3XNa3HU3RbwHR+Ugb1qoCQSxz?=
 =?us-ascii?Q?Cu8KyLxcLQvT475K+uEKO3OX14ambnSYCdIfqkmmhQDxdjt73Icsct3652/U?=
 =?us-ascii?Q?QuDVktNIzitqKGHC8xnOyGsA+QTlQgDaaayAs2g7cI5pNlfnFdiX7/fjJjJg?=
 =?us-ascii?Q?nB7H4QwYuLMv5aQt//csqEiTkI07l0ncIWhRVPhXYi8bm89rhcZAMM+YbJZh?=
 =?us-ascii?Q?MrH2n6UFzIilE/gW9Si6jw3Qe0ELydipagPsqYeA+bsglSt0x3Ec0AQdxAOY?=
 =?us-ascii?Q?SMKfI+sXPLWQbZeTJ+0Q6PGp6qccTNTCkmZQSaHI6BrYkhE03Qzp5LbzONUF?=
 =?us-ascii?Q?TOtm9cJkTKQBbVMxMkJYcwG2DG9h6sjmRZZXQihNfbXoA8KPto4ogqctcEYH?=
 =?us-ascii?Q?J/BOsUNc/LcLpHEB6ooJCJuYkvVUo9UOwJazwikVeZ5EemcypTIyKFFteYHo?=
 =?us-ascii?Q?8dG3qET6szytdmcg8L9ZCIHQLywrzofa+ISx6q3s57hW1Bvnqew5H2JE2ya8?=
 =?us-ascii?Q?uAPaF2Dz3hKocbWO2jGHE1RdBQCjDjiaomdhwTYPcrRpzk2Mpf7eHO3amRgb?=
 =?us-ascii?Q?UIPdy71U/udrkVPWKKPkBfAtq8nGOxrH6JBjXT8A+auYMXTPd/+OpinRic2C?=
 =?us-ascii?Q?D769uJH0+GjaGaDgGM6BPKTcJ/Noe87/25FlP4ywG9ghQbp4H8KhexogXZZV?=
 =?us-ascii?Q?XVfs6JE+8BZxwHkmMfs316iwTc6lFuEXqdjaxIQmeSJ82AD/gDKXfS/7cjc7?=
 =?us-ascii?Q?zvnRD3P+O3nvhRvURIbDZBjcnn1D+4+P9RV2cZI0lnk3EeBP3qZyz4pZq3+p?=
 =?us-ascii?Q?R7WfA3OyXxqtV8gilcEl9uPSQZ04PpDS15vnATBviCpYE7XF7lJvnueERcbA?=
 =?us-ascii?Q?dE2t1YEzQAXQ0G2D6SKwlPqkos6/dI7PUDEFTSJz8FmhiQIUJDssYz4tvqgt?=
 =?us-ascii?Q?mHJqxAF24cliMmnIIN9NVeSbAxWZSAmmPqvcQTn22a48PFIEjSpE7eqqasym?=
 =?us-ascii?Q?JFhuIuU87NSuGDDEwE9GkkngvlhSHkRHTcWJ+n7qFZqDuJRyKrdA4N6omWFn?=
 =?us-ascii?Q?jafAl20/mmB/CmKipKKtbHk37gHbUL9nDsAjdPFigXvjN4mKod1dxST+Q6qD?=
 =?us-ascii?Q?7Wr+gB7GvAJ0NYq2x0Y+49RuzhSl82axU8zoRLMvgGscuf2G5aWm0RIr2xtE?=
 =?us-ascii?Q?xU28aPQiSgwU+L/e8/i2dWa5rnG3xzmPoS+8Fspa8TUqloTrBWzRVbDAc1z3?=
 =?us-ascii?Q?wfvwZqBOVnTSiI5fkDgMmE2Vbj5v9iapr1TmRwAGBd7yFLhjswuyl1wedcWB?=
 =?us-ascii?Q?gqWstTG1UvroNIGWW8NUJsan9clgsRhHKnhX6alexEwTFcNAFukAp/yZrM/q?=
 =?us-ascii?Q?A8tTN0A8utPLJw2ECC2wsq5uBjWpUU95XbjhPla5NVRo7HPNEw1s49a8q93f?=
 =?us-ascii?Q?P3IhyL6Jsw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f1ed1b-bb13-44f3-cc90-08da12e1ac64
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 06:42:49.6981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9quUpY56JixxufH9LMARLtX7sY7L298AGiMqhrvPG0HzA4TPXnlUVSZB+jRF21GaSMOHPitHnhqEEmBkJX3zgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5713

On 30.03.2022 19:04, Roger Pau Monn=C3=A9 wrote:
> On Wed, Mar 30, 2022 at 01:05:31PM +0200,>> --- a/xen/arch/x86/livepatch.=
c
>> +++ b/xen/arch/x86/livepatch.c
>> @@ -157,9 +157,15 @@ void noinline arch_livepatch_apply(struc
>>       * loaded hotpatch (to avoid racing against other fixups adding/rem=
oving
>>       * ENDBR64 or similar instructions).
>>       */
>> -    if ( is_endbr64(old_ptr) || is_endbr64_poison(func->old_addr) )
>> +    if ( len >=3D ENDBR64_LEN &&
>=20
> Sorry, didn't realize before, but shouldn't this check be using
> old_size instead of len (which is based on new_size)?

Yes and no: In principle yes, but with len =3D=3D func->new_size in the NOP
case, and with arch_livepatch_verify_func() guaranteeing new_size <=3D
old_size, the check is still fine for that case. Plus: If new_size was
less than 4 _but_ there's an ENDBR64 at the start, what would we do? I
think there's more that needs fixing in this regard. So I guess I'll
make a v3 with this extra fix dropped and with the livepatch_insn_len()
invocation simply moved. After all the primary goal is to get the
stable trees unstuck.

Jan


