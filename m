Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FD63A2AE9
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 13:59:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139858.258526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrJKL-0004k0-R2; Thu, 10 Jun 2021 11:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139858.258526; Thu, 10 Jun 2021 11:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrJKL-0004hY-NV; Thu, 10 Jun 2021 11:58:25 +0000
Received: by outflank-mailman (input) for mailman id 139858;
 Thu, 10 Jun 2021 11:58:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iP0d=LE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lrJKJ-0004hS-I6
 for xen-devel@lists.xenproject.org; Thu, 10 Jun 2021 11:58:23 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34daabfc-11de-4734-984a-776cca21dc93;
 Thu, 10 Jun 2021 11:58:20 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-TjGd1bgLPzeoMvIx1dUZgQ-1; Thu, 10 Jun 2021 13:58:18 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2447.eurprd04.prod.outlook.com (2603:10a6:800:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 11:58:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 11:58:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR10CA0078.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:58:16 +0000
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
X-Inumbo-ID: 34daabfc-11de-4734-984a-776cca21dc93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623326299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zB+Ifc4MXF4+UfKXXK2yzfStPqUuJORwZZdfBgnCuQU=;
	b=mhdOChcwIch6FdP0uIvLkcG0IyRR+aylGaCcVtcWus/G27y1tOjifp8cTdzoOWcWnaU28w
	rbptu7B74pS0N1jbPLCvI5eLc+w5DArHPnb48+tSbnJ/CtOI2mOFy9mzA5FyyKzZmlTKGN
	hj7Y2ULfTYfMD6052pNHU/1jX/dZZ4w=
X-MC-Unique: TjGd1bgLPzeoMvIx1dUZgQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m74IX+Z/TzfzUxl/BVeTg40hEauobpOFKvcGQuLUPnQLfWhexJJp086GDtoh5p9yp9uW/Vi+iTfGaDhmAmQR7xYpYxhjIRT8UyfdzLGgRNn53+edUTNg8mBgyzc9nwpPH/UXou5psdbnQ9bQqpiFi7dDwk57Q0v33mjZ++dLTciki7lCecQQa2+80xgpRwPAu+uNslQbDwGbubxPxO21vAT2Ggdg8lv0YLgl0cv0DowC6/cdbM+ECNXUwrY8HUFa1hyIu2DHaAwm2U4TlF4JxSWKW0qr7LKy1EB/05gu37fUtaGaulD8Yhnv6o/wiafCaRo2jF1Wavh4KJB3oTd/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0AQ6SoYlc3WS+MVGsuSs3Udt9q2tHA2ImOQ9mn0ikFc=;
 b=B2IcZUUUTeqU0fjpAt/tLYwLQbGhUTy44sk8QwS1ffVyGOQtI2CPrrDWiOHlIq4pewCWG9TdBr9BS9qjo3R27+uIDp1tqcaFkMwAhujXeKEhBLt+VHkENb7wIrTZ3FnIkKxcuHbihJAtqJH+lI2QjJgMdxFs1AygiMLu3lKBSA/FZ6xWnfnvkG88DVJP7KtILCe6+aliuLUmB43ktLPmvZ51K3Xj7THnBWu+Gdt3DZnRZaiK3pjNtljeBptirdFKICvTc6CgJMVt+VaKUtKC4DVZMRr77UHgjGame4gSakb3zhWqZsS6SyhBWe4RxEeUvItTxDw7ej2sRfMxxhdB7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/9] AMD/IOMMU: re-work locking around sending of commands
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
 <da2e161f-5d5e-c4bb-bce4-7b86e9418a1e@suse.com>
 <31dc681c-8713-7ddd-6c4e-3c385586da4c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <11f4cb58-d0f4-f735-2b18-5e02cb6950e4@suse.com>
Date: Thu, 10 Jun 2021 13:58:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <31dc681c-8713-7ddd-6c4e-3c385586da4c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR10CA0078.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99569aa1-f59b-4908-243e-08d92c070888
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2447:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB24474F7E28491A5B313D64F6B3359@VI1PR0401MB2447.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h2N4VehMkB+ozmBko3EVwfRIQXBUYxe8RCowjhCc07sMGVelfyWxXE50KkT6QvynGaY/bNl7yHNooeNy3j1iB3nljH1xIHA4oSOG407HfpJjBrcT7RUbb1VcIx2ndPnQnHKjvrkMIdztjghZ/aulgpB5ZGix5yv2UMU5dfWPmg79H2ShEzA+2ax0h7kgr/XiMzlsAnK0Kb/fCwIlyMNTnf77IhCuymwtqTkZ/tHcQQvE4TfkEKllhV848tBSdarhUlhQIO3AWysiaGQ1MbCWmPjd1YGKbC7YksOsKeRskAdoHpvR52ApQfDCY8kR9qu25UpVb1afb7n+2auGWKd2YVgvs2fM5Eh4kdtQXAPsoOp0hzqcWBmNAognvZG3mTBjRvIxu7KobRnoqs65+O200xA02KnT0hHQH7iQOAxYZ3lx6XigZ5d0mCBp6YXV0/3VQ7RPedZ2y5jcU4/AIEMu5ekUX5lC3DulriyGved52mIl7H9jhfxbn6yGvthfxAxRSSdPSINjOiLlaLfvfLEjvIHW9r+0yqya9YQp8iCghtULVf9sbAfqiQbvcF08Aj2blZ2MpKAxFTS3QtRSI/MKZACEXssNqyc96EAhFhO+Xni9SI86/Y8oz9ew/PVgjG6PBOzq3JvNgTG/6ZhOMWmk77AOAVpwIo05Yh+kDgRA+CjczCPGymhwk1POkRp/Q38l
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(396003)(39860400002)(376002)(8936002)(83380400001)(86362001)(16576012)(16526019)(31686004)(6916009)(2906002)(5660300002)(956004)(8676002)(53546011)(26005)(478600001)(2616005)(36756003)(316002)(38100700002)(66946007)(66556008)(54906003)(6486002)(66476007)(186003)(31696002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?us-ascii?Q?EpfHnmEBvM9KDoV/dn3kjOtPof1ERxWuPIcjmNQu7nSIZE3+bxRlBAFZc2xB?=
 =?us-ascii?Q?cdMJIzdZSUlmq+PsOJUMCVMvnYAVWgnVzDhYDm1fmF5xlEHnzOpf3DRTXJYf?=
 =?us-ascii?Q?GdKtqecyHESiPtVVdp5oqVRp4qLTjOIRwqfcDolzi+NOSOMw6sMhI/5MTNQt?=
 =?us-ascii?Q?UbjXduTUmQ1/dvmZQrH3Iz9YV1d92zSBaSHn9loS/0zD9hKgS/oct4I1Wi2s?=
 =?us-ascii?Q?/hOhuoeNvYVDb1N8c7wi4stH/TogMmiu1r4YRRZyfzosVX5cbG3Ev2yf9bL4?=
 =?us-ascii?Q?x4pmNECQeLfGYtkKFuquCCn0jXMFo9WOzj9SBEaMJy317kBfTe1TgKT5Bt5g?=
 =?us-ascii?Q?XmQscut/WBth9RrEi3MFO6w8VzycR2FEHsM+VF5qtwePBDjenAGZ/YkmodaR?=
 =?us-ascii?Q?EaIrEHCAI6L7CYFDsR1t4xzEiioMtlrRx993gWV5QfvXCBm43vn2tXSaErmG?=
 =?us-ascii?Q?kznGuQc1yaVk+jJQdRnNp9fe559VMG/GWywu4LTVPVIwpbfspcs9z1ssAIhE?=
 =?us-ascii?Q?2jNEk8XHT3G/C+rpKsnfoVTUiVfh0wVw2XbZV7g9JaPq/yXmGZmVuMzfTPkX?=
 =?us-ascii?Q?i+BJtIVn0upuFp9gqjQFjG+VBrtkRJRtA5PGgym8Qkez1Gp6ACqq2gqu+1mn?=
 =?us-ascii?Q?o/1o9PSF0AXEZ9CbtAaS8wrJOoQOzN70eIRRBp48/jqa5ozy8ZHRcwg4M178?=
 =?us-ascii?Q?BJ+TImuPJq3LJ13qoRlyYqTe864S8R/TT6RbeeJ44iBZwpcctbDBJo42SZL5?=
 =?us-ascii?Q?y0VQZ/ohznZUKPU7DnYmqYul9kI07f4HxrfvOzszwvPUlOYT4wT1y2NEI5Uj?=
 =?us-ascii?Q?DwdoT9u/N7kww+ld5+6EtMA0/Brd5W38Z7CcYt1QbMxfBWVgxhQxEEhw6UUH?=
 =?us-ascii?Q?f4tYl95A8s0x99dkecMvTU+P8H0r417A6RrQ6J6h+sNUgTXMqn2M2H494mCb?=
 =?us-ascii?Q?PU9Do+eIet/ooVYW7Lf7AD6Bbo0Ox2eXfkZP2b5Da0maGnrETM+ithhiCCdb?=
 =?us-ascii?Q?mLHhJs8na6JqAH3ocYo/pOiDZD/W3+gk80k0fcK0aX5nMPTbWEXMJOEXQb7Z?=
 =?us-ascii?Q?PD4Muosqw6p5fZ/nuxfSqEGNyLRHPdH+OCeM1krrD7il9bu+uvB2BHQjF+ff?=
 =?us-ascii?Q?NCA1CGhOItksD8PNFPnORBj1lGqbRG+XgK4mVnFEbkIMdsI6dmlHI9BoIr2E?=
 =?us-ascii?Q?C/27CFh0e6a4F5Wo+Wj2qF94K94m2Zavd9ROmv6q4SG4HdlmgdQ/aOecplBG?=
 =?us-ascii?Q?Q4xVHEyin6JFVrL/3RRbFyPp9x8Beuputl/ZPgEO/QLmEORxgjS/1E1fbQ+g?=
 =?us-ascii?Q?07c7abfJvmOF0qRADrmUki/3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99569aa1-f59b-4908-243e-08d92c070888
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:58:17.3536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PwYLMQjE9hsAtv10Fwvm/QZMiiRcHn4AWubPO8wZcM96Qm8pWWc/8Of5f7ML0uymaZYqKEg8j6eVWOj2eX1hpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2447

On 09.06.2021 12:53, Andrew Cooper wrote:
> On 09/06/2021 10:27, Jan Beulich wrote:
>> It appears unhelpful to me for flush_command_buffer() to block all
>> progress elsewhere for the given IOMMU by holding its lock while
>> waiting for command completion. Unless the lock is already held,
>> acquire it in send_iommu_command(). Release it in all cases in
>> flush_command_buffer(), before actually starting the wait loop.
>>
>> Some of the involved functions did/do get called with the lock already
>> held: For amd_iommu_flush_intremap() we can simply move the locking
>> inside. For amd_iommu_flush_device() and amd_iommu_flush_all_caches()
>> the lock now gets dropped in the course of the function's operation.
>>
>> Where touching function headers anyway, also adjust types used to be
>> better in line with our coding style and, where applicable, the
>> functions' callers.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Paul Durrant <paul@xen.org>
>=20
> Honestly, I'm -2 to this.=C2=A0 It is horrible obfuscation of the logic.
>=20
> I agree with the premise of not holding the lock when we don't need to,
> but moving the lock/unlocks into different functions makes it impossible
> to follow.=C2=A0 (Also, the static analysers are going to scream at this
> patch, and rightfully so IMO.)
>=20
> send_iommu_command() is static, as is flush_command_buffer(), so there
> is no need to split the locking like this AFAICT.
>=20
> Instead, each amd_iommu_flush_* external accessor knows exactly what it
> is doing, and whether a wait descriptor is wanted.=C2=A0
> flush_command_buffer() wants merging into send_iommu_command() as a
> "bool wait" parameter,

A further remark on this particular suggestion: While this is likely
doable, the result will presumably look a little odd: Besides the
various code paths calling send_iommu_command() and then
flush_command_buffer(), the former is also called _by_ the latter.
I can give this a try, but I'd like to be halfway certain I won't
be asked to undo that later on.

And of course this won't help with the split locking, only with some
of the passing around of the saved / to-be-restored eflags.

As an aside, the suggested "bool wait" parameter would (right now) only
ever get passed a "true" argument, so I'm not convinced it's useful to
have at this point, as then we'd also need to deal with the "false"
case (requiring a completion interrupt to be arranged for, which we
have no handler for) despite that code path being unused (and hence
also un-testable).

Jan


