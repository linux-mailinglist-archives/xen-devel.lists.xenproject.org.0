Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 138AD4B6E76
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 15:14:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273209.468312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJyaf-00041o-HH; Tue, 15 Feb 2022 14:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273209.468312; Tue, 15 Feb 2022 14:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJyaf-0003zx-E8; Tue, 15 Feb 2022 14:14:01 +0000
Received: by outflank-mailman (input) for mailman id 273209;
 Tue, 15 Feb 2022 14:14:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p95L=S6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJyae-0003zr-0h
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 14:14:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83ec60c7-8e69-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 15:13:58 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2058.outbound.protection.outlook.com [104.47.2.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-rBoJEjRqOG22AoAVWLazyw-1; Tue, 15 Feb 2022 15:13:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR04MB2972.eurprd04.prod.outlook.com (2603:10a6:7:1e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Tue, 15 Feb
 2022 14:13:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Tue, 15 Feb 2022
 14:13:56 +0000
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
X-Inumbo-ID: 83ec60c7-8e69-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644934438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vITAXfpxMsWQ19MluGR+K2xujRwAEOMY+Wd2yCKgqfw=;
	b=XCx8hLlaTEPGz1ymT3D0qYJHRG6L4HdbqdG3IyVgHKntQirx/XlBHJQ0jIaSfbjTcIGAQw
	htxH/QDGcc6osyPGjHB8d21VhxhiDlUFTjMnxK4TH6qE9C2pRl4/l6ZS3d2Ti84ixRArCQ
	c0d5OkJI7swxonSU1fiIqubA0qNW38E=
X-MC-Unique: rBoJEjRqOG22AoAVWLazyw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFtAFNiqgNYa4vfI11jTGM0YZ42E564If/ze1PWc56NHab+N2nyngyD5CoO6JhfOQ5xF999STUdDTzOuHK+xHUP/4SkjWj1V95+ELK0gDuWg2wAzRytNy3Q4m68jm20XkQtIbCVjREx1O3IF7IYZDCqDyd/QpnElX4sQdCUibfwCFsjD92BUxRT4Ul5hKOfRH9CQd/YwaUJM8FSMjlxms4uwvQ0JdRX5YDH4nzPmcc5aEH01sBnauPGYbQR5jOTfguoaKbrNzIS3MEuuDNe85H81mvrTlK+WnSo+QEkfOSEET9J/rgSht/TFyvwsQwOtNus/w/3ShPWEbGCgCaUozQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZR6gVge5Kk8yqJ9+685L/Ewmkuay5svUTOsyY0vD1Y=;
 b=gAxfqJ+MFkKx+D4p40q298tpbjotWPAR6TQ4RuLm0/xVU9m30J0uwH0Fl57Ln+OPLmAeA7u1NQDjo4JqUALNSlBwlzYQibsPWOhNbRPPOVhZLuRK6e7eWW6hQlSFnkRpnBaazhrHovuBOLt5O58v9HUpcCh9woLCU21XHImgb6213LaASkmnh1uwpHAuvb7D1AdTfHepQv/ui+V2XRc9GtR6C3kWI3I6kap1VZPS54UTtiMspAeUUHXaBgrGXtwYDZjPDCkDs4K2/+4yYT+fdZskwxUZs0qKRzj7IHcdI4I2dWZu7k7P193/SSayZPaNvzaCBpkZrX5KoEhUx8sA2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <21e40ac1-277a-8675-1299-54561ab3d2d6@suse.com>
Date: Tue, 15 Feb 2022 15:13:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 34/70] x86/emul: CFI hardening
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-35-andrew.cooper3@citrix.com>
 <2a5e1893-506e-e4fc-dbff-6001feec1e99@suse.com>
 <d62fddef-5cae-7334-ed0b-cc2c9313f040@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d62fddef-5cae-7334-ed0b-cc2c9313f040@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR02CA0005.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a4ef642-7e73-4792-9005-08d9f08d66f8
X-MS-TrafficTypeDiagnostic: HE1PR04MB2972:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR04MB297297DC6B5253ECF277DD0DB3349@HE1PR04MB2972.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KKVD15b/1yhdQYceZnimw48SUNO07kwZmfVJ8H8eVsjrE74pBBEZ5iNfi4i1MCUXBNOQniW67ty5qiZ43NH75rO8U62Jco6bH2E2lDJj96QW/Nzg/fzB4e4gIxL8QL9Pv3FG1lH4A1JcimPMtHvrhXj3ZSgSwwUsQmtExz1s15coaW0UWT1qdr+EEkcOeLoIh+K8JTV3aLoBY8aYoDoDcqyyYijCbh4f7D/1IJGfplmr4c99CtQOYz7QV/1bEX6FQCS/AmAv5V0bbi8GWhkpKWL0vAZ7VEgU0XhfBxpkWnqvtcI+DoFA7/7nYFTuorVD+1jlvocPFy4wfVDoHHJ92T2vTTa9gNCpDvqYKZuxmwBd5+IS6wF5BzCM84epHPXU3u9fpEMi3Mwjq+OTBvRCh9f+3zWwZICK8BsZG4JCVa7HbTAniTK1CAa084huI1OkeqQUtem7P67y/wcEez87P/Ocx4mxGI2ZE7DpxfqMnw8OkRw6xRBx//0SL5SP942eCFm8sxqEVibOX5yeppHsqMoRsIg0aLPdK6LUbAzMROWTpeFH5Yp3NZsBtTs5k3SVVQeuJV0QdpcloHEOC+XQ49H6C+iyQBA94fdretQh1bS7zW2VP5EWIJ+z1GyAqY6JMd3GjEH20Tzy13cJLz1TiJw70F6pFGdPJUBTP+z8GDnQ2OcdLJ+KrHrEIlRjxRtt77BhJiQPnrrkk7sn3RuSDfpK8doIgmxXtrmHyOYl5pnRwDcsebUantZY4RJ/PneE/HcZhMre2u5Mm4q+ed0NVLVSu6+WYR0pLj41/8vNoRA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(86362001)(26005)(31696002)(110136005)(66946007)(66556008)(66476007)(8676002)(4326008)(186003)(508600001)(6486002)(2906002)(38100700002)(31686004)(5660300002)(6506007)(8936002)(53546011)(6666004)(2616005)(36756003)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hMso/lAElN7xyR0MUsP6jt+fgVZu/lhs18pDX+cUCbs76ePQUo1xb0wQYmvQ?=
 =?us-ascii?Q?9XDeZMxEq8IJNiPp6dAPcLALQPDv7QfkZXBZPTVs5k2UhlYHSQIoo0A0jqhb?=
 =?us-ascii?Q?n6USYLdG56sgi/fcO4DvIQKtr8xHwrzClOdj22ypvyp5fda2eTYOohQuGAr2?=
 =?us-ascii?Q?KPwhnbjkNjIBsTEglit748AssBxX011NSA4ppjkxq3QfKxTWqEgalWaLW4Fs?=
 =?us-ascii?Q?+sQeKQO7GvkPigSTPGeTA8EzUwPd2NxBvn0QTJynNcPbjnT0WfsOcNAO/gNG?=
 =?us-ascii?Q?GIoUkSBGKb4ASR1FW9qCae6PHfXX5wH5DFMHNQFYOViF1MJwMy/WZWfw4krV?=
 =?us-ascii?Q?OcYJETds0eBQC7UzsdTBHFjs6HnIwMLnFJSDQ1+IyWvx4NilXMrok4fqbbqN?=
 =?us-ascii?Q?Sq1HMUJGSHZF8g4923bUQh4Dc5Nk2bzq5Iqny6h2BXuY1lQDJJRO9X3Qhs4l?=
 =?us-ascii?Q?d/vqdQedKERkgnhd3R6R3CS0QXaR0Z+s+rom9p+OsoekFVYqdxePRx/i6rzO?=
 =?us-ascii?Q?yg/KK8mFdFdjia23gCIAE2JErmT0Emzqaq6dtXB8qBWHGUVq2Sj9vagXV03c?=
 =?us-ascii?Q?h8gBCc6xvHAWFOyQ43a4KNX5gkL0F5fHmpu1x7LnzpmQlYQq0wv5W1nm1o2b?=
 =?us-ascii?Q?veApJJXOYFR6F5B35FtW18cG4w0IzvFjoiwJNcjdu8fQDiIW925z5YoCVyz1?=
 =?us-ascii?Q?G4aE0ENQFa5tCKYXy77xVAgKqTRDwj7N2JV9T6GKTg0LQ3SHv7Ig4cNowQON?=
 =?us-ascii?Q?GXO1gxnQuKkPMbK5cLMsbDLJ5IJLBkReVD1/NTkRLZQm9SGsR6w9/MjBHudt?=
 =?us-ascii?Q?+OjzwYGm7c5P/3go+woin1rvv2Piigt7+Evz/tzIq/PU3hKKCWKysG8i0Zfn?=
 =?us-ascii?Q?Of1Xm9402fnRiDhB7059htavEygixkPQCnzC/LF6jkpC6V9UVOxaA9XQ+AI2?=
 =?us-ascii?Q?9fCIHWsfYH+2Q3Peg4+F/EzmSXoU8JrXN9q1Q5oWLKqQ2Irk5g54+oM6YSFj?=
 =?us-ascii?Q?JuXZyuIWdjVmmQywjYLKLVyB8cKkhIUIQZnXg9X42yLbSj1wpC/AgwCkWTAE?=
 =?us-ascii?Q?KjTHMZ6Tu6Sa7SM8gqX4w+LDHmGmTn2DWSSFkp+oleG76HL1HpWAfTjvxQkY?=
 =?us-ascii?Q?YMTKFCBxjVuSgJEm6IE40dWUT/v14v6YbtVpW6e3cjAR8EyfupyGzsm5NiU/?=
 =?us-ascii?Q?5um/kEtkRjhCXrc1Q+vF9s+V23eDCxCuAHM+XuSZXj3oHCty2yBgycv3eM0+?=
 =?us-ascii?Q?l+pRPXea8SjWO85FbZ4xtkU3qCmmuLq4CKQhh9gjMv9Cx+WZsPpvo+mQtF0C?=
 =?us-ascii?Q?2wsycQINdyeXsz2ZFUQsTTzNpoVyvoC8J1zftQ17Lp4ejPIVzauMF6VnyaqK?=
 =?us-ascii?Q?mMQhgbzVNCag+/YAs98Lvi0kTPTnERZwMK5S6bll7oaQmhJmWLQL/pWx3ZCe?=
 =?us-ascii?Q?aQidvdoqVIhA6qFPwGzLP6sWC+PL77hU95tiJViwYJqV4/nOO/RT/b6quILF?=
 =?us-ascii?Q?1View0M6G2rvVantmtLAZsXjo0JEHfqdnQalLMf6Q24KPfaHmZbW60xVAr1a?=
 =?us-ascii?Q?OfUTJQy8AMElfq2TkMFijWuAPa0C1Ud112giHhssZP4eQmxjhtjPQ83tb2y7?=
 =?us-ascii?Q?h+vhyv0k4TB10mHlnLLXKYU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4ef642-7e73-4792-9005-08d9f08d66f8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 14:13:55.9819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WX457fUJLjmXrjnZgp+pVBGG8esJAFG7Qu1behaeVOqtvsRmkBD5fsVG2boB6ZTk52lqQsXGvr55yvnJIw8Vdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB2972

On 15.02.2022 14:43, Andrew Cooper wrote:
> On 14/02/2022 13:38, Jan Beulich wrote:
>> On 14.02.2022 13:50, Andrew Cooper wrote:
>>> Control Flow Integrity schemes use toolchain and optionally hardware su=
pport
>>> to help protect against call/jump/return oriented programming attacks.
>>>
>>> Use cf_check to annotate function pointer targets for the toolchain.
>>>
>>> pv_emul_is_mem_write() is only used in a single file.  Having it as a s=
tatic
>>> inline is pointless because it can't be inlined to begin with.
>> I'd like you to consider to re-word this:
>=20
> This is the reworded version.
>=20
>> It being static inline was for
>> the case of there appearing a 2nd user. I don't view such as pointless.
>=20
> I find that impossible to reconcile with your normal review feedback.

Interesting. I don't think I would have objected to something like
this, if it was conceivable that a 2nd user may appear. I don't
think this is the only inline function we've got with just a single
user. I also don't think this is the only inline function we've got
with its address taken, and hence having an out-of-line instantiation.

> It is unconditionally forced out of line because of how it's used,
> meaning that if it ever got used in a second translation unit we'd end
> up with a duplicate function, at which point it would need to be
> non-static and exported to pass review.=C2=A0 (And sanity.)

I'm afraid you've lost me here. What duplicate function? Before and
after the patch the function is static; what changes is merely the
"inline". Two CUs can have identically named static functions, can't
they? Or if that's not the point you try to make, then I have no idea
what it is that you're trying to tell me.

Jan


