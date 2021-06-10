Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 327793A2C09
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 14:53:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139899.258589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrKBT-0004Vc-K2; Thu, 10 Jun 2021 12:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139899.258589; Thu, 10 Jun 2021 12:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrKBT-0004Sy-F6; Thu, 10 Jun 2021 12:53:19 +0000
Received: by outflank-mailman (input) for mailman id 139899;
 Thu, 10 Jun 2021 12:53:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iP0d=LE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lrKBS-0004SW-2R
 for xen-devel@lists.xenproject.org; Thu, 10 Jun 2021 12:53:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7a7dec5-c834-4c44-b390-84f0b48477cb;
 Thu, 10 Jun 2021 12:53:17 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2058.outbound.protection.outlook.com [104.47.5.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-3Iiq9H7_MiaA5CQvDCAieg-1; Thu, 10 Jun 2021 14:53:15 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Thu, 10 Jun
 2021 12:53:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 12:53:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0017.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 12:53:12 +0000
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
X-Inumbo-ID: a7a7dec5-c834-4c44-b390-84f0b48477cb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623329596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xPEiC67X521QgKA6rtQ6VgPTXw/sFtmSynNaJxT8BfI=;
	b=kAb4C+AWM8M9u3ZWf1sZ3Q7cs9pp+hWixYjpeUBkyISHdC4reSPSU1D9QkzZ8TWxUpNdUN
	36TkIYvzqJ4lpxmVdmbosEPRBdvg6ABbcBKbuLicOyDrjzFEWdCLJKvYp9HfxtPhkg5EqI
	GtZUrblXHoBFIVOqC82MN/fkkRv8vOk=
X-MC-Unique: 3Iiq9H7_MiaA5CQvDCAieg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/O1qS2DSfWtwhCptCsmZwnEqi7L6K0yfBsT4w2crTGa8hAmCe+mK4RvYmWP7PoMOAyotBexK+QCqP5vqIGxEd04IwLrN3tqcnDZjmtx6T+kUIbjg3D5/3uafXXbd1pXLyABRZv4SKeOS+bs6MbrC2zcSqm45Htn0LWhvJ9DEgYsAzlDeqZX+rSRY5Npx9PaY0rGHmDzCwmILaLuBOMTCr0cmjBQ56IdofvY4YbVBHZE/fZvKws+Wfk0xTnJo62Wt+eci1Cexh5J4+sLTQkzJldLL76A1BW/0UK3UmXjkNILyFIb1ba0qUWEK2o/k73jpsIOMBcPTMol5EutqPtCXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+UtJaeCpPZZSW2vKfmvlg34TfCyVyIQawQiaVpBwaQ=;
 b=Jgi7LeYXd6KOn8X2cWwGCSfyJf5wPkdspHAftzrYsHivVR0AlCAsyPyJAS/YwU1Jh0009zaywvtwPQ4J1izAgS/Ip0XoBOASSa2OkvyQiibk46MMcDd+6LlwU832xXlo1Cag46PtjXr0tDB3hpxPVEv12oL3lziFHrcKTs0DqDZB0SumUU7EBgXL5IaLgFCPvir050w1pBI/GLZvbhjhOQc5HPBBRX4eWF6GupSUXPZdMdSSlqncKkOssPkraPH/QJcDK+YZWV3233OIguzRFaxYfVpl3seXbBx15F5/VuBttWbN7KN02EE2wtIp3LwWP9Y34S07QuVg/x4YYZ2kDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/9] AMD/IOMMU: re-work locking around sending of commands
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
 <da2e161f-5d5e-c4bb-bce4-7b86e9418a1e@suse.com>
 <31dc681c-8713-7ddd-6c4e-3c385586da4c@citrix.com>
 <11f4cb58-d0f4-f735-2b18-5e02cb6950e4@suse.com>
Message-ID: <f3f47e98-e18c-50f1-ade9-e4b4df055b5a@suse.com>
Date: Thu, 10 Jun 2021 14:53:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <11f4cb58-d0f4-f735-2b18-5e02cb6950e4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR1P264CA0017.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ba52f58-783a-4afa-27bd-08d92c0eb516
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233577C47C319650E7429D8CB3359@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mFzoOVUzusWVgQLFvGz7fcHg85p3P1olcd/w/sDWHAKkUPXnNDothr1mqfpPrSlsHNVQo4Mld8fmCWxRx+0PZv5GohgU3XIhxdgC4F24L7Wg9FoUFGapdunFRQDkPnLjeEMCaoK90z+AUaWhF2igXq0Tt7XkEYlx4FfOGssRzTIRCwU94m05H736BUsQh2nmV+a3ePrCBMuctLj7yHqXeMqQbBxrRhJ5+vp4q7ySIzXQfuI+sHD2+HIdGCrSyLHxVwZtGGJV/Ya7OppwQECdnmGP9NLrvRwqmCe5shHh6gMqLknWKzr8fySwtUYtuEO6aG1QqQLvbT76MwRE2J9f50TkiFM5YKu7A2d5XNzhBUrg7zkWioO1otVx9+RikrUkjwESBNYlPdztyJPGCzhx025SFY38/vOh+Jr4a9BcDxqiDilIiT7Ir0avH2NKp2lz3mE7RMHvduIZIMCw4l2l1YqvO0palKJrtugGsZaN4o1OX9PTMrTc3cvfW2rgrB6Ew51za2VqQKa1g098Oywkl8pbRtIby38Ki1l0VkVf9eaak7jsXDL/yUBnnN+mqNN+pFfFoFk9mtmOM9XRRqqZmF3SciZOwZnlvoEnNsxxyoiLXdaC58bUML9nRj1YnZsbfLblqL2u7PFjR1tbiKBsiMQS8/GZ9QpoBWCM9QZRDWXZBKY5YMbPV6ez+8Jr0fKz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(376002)(346002)(136003)(366004)(396003)(5660300002)(86362001)(16576012)(8936002)(38100700002)(66556008)(53546011)(66476007)(316002)(31696002)(26005)(66946007)(2906002)(36756003)(54906003)(186003)(16526019)(83380400001)(956004)(2616005)(6916009)(478600001)(6486002)(4326008)(8676002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?us-ascii?Q?/tdcbnYd9vmrE6ha3lJQcuC2mm3ivF+aytGRRT1nd6ZYO4N0g1g4u3t3fZF3?=
 =?us-ascii?Q?FXPLsZim4zZxt+sY0ADIrsjJfTAvgEHFYinhFJtiZ2+j6YpgmaiApac5qOkA?=
 =?us-ascii?Q?IKXBc+49bnYrrT8a0i2tR+RPvQtchTjoUsNx7YIzL5BOiVMY2OxGVO2L6A5n?=
 =?us-ascii?Q?CHcG/C+RXRrViINuo1qRw6w+SlJI3Z72dnj4vhIbcPnkzjCRDUKu3bX9C2YY?=
 =?us-ascii?Q?Xq8Dgpbx1PdLzvBNOM328LYghJT17RhxmgHDzaSKnIoFlWg6Yy7bYDgAY3ap?=
 =?us-ascii?Q?Tvl0B5YSfFnKEXhBl1CCmyv7r8zfzpzwzKlBPyuC9ApE4k+AXJ7pgGpEC6HW?=
 =?us-ascii?Q?PenNzY/hdeznXSppELFrne/5DRYgGUva3kQj9jrJQD1nNvzQyZ/APFAbTtdT?=
 =?us-ascii?Q?NGt5MaYkjp6CIjagDQ3QamOnNt4qmx8RBJ+TE3FM+BOAZkg0prW9C9hBJ0v3?=
 =?us-ascii?Q?WnnRTExwhYnyQgH8y+LjrPVkdQZHH7CA5mOjLnFbXNrVerBLs3O/9vd6McAh?=
 =?us-ascii?Q?AUB/TLIVvbzS6CJrtfOfvkDYQktdUl8HlT2IRHqw0vH9b+cjIWyF524QKMu+?=
 =?us-ascii?Q?QI///BEPs7BWxDItiLvlGx4QpcsWU33CmBl9SVlalpPvR9+yFbTMEecSF65M?=
 =?us-ascii?Q?dj2NkFJCl8IKAZMq2oost8H1gsPATlZhIQKHuj1tRRQGddN4gp4K2onal2pP?=
 =?us-ascii?Q?v++VXODEUc8uiOkXXC9uPYGgm588cdJ/NW+tPQWxabX8HcCYZTT0SKfePwPt?=
 =?us-ascii?Q?o8zSE3sCe9IPZSlg+uXLNwhHCmTdn7aPxcMZJJ8AYXjTbBT/dIHcvxwoI6jM?=
 =?us-ascii?Q?1VhEhc5okJD7m7hh9qVsLQWBmkFspeDWaOBaztNkd72WeIT4v4YolH9B5bve?=
 =?us-ascii?Q?jZao9yxXncawsNHOK9ze7sIgPNZJ8m1ZriUV2k+ruzyq9kzArDjn2HUuDOXR?=
 =?us-ascii?Q?pJoRJQFtBI2Lm3ijAedkLvSIxldFIUgs//a10X6XV5cjRPfzX+ZEAFluD1L9?=
 =?us-ascii?Q?lcT5/TX4KPSaJ0jU2FFn47xJpmNNA8v+hYwVqdh2JYYaIm6WZfVkEXCirMAi?=
 =?us-ascii?Q?PKZgBahniWDwM9cKTR+fwB3yjPqErRUKaqiLz4BzO2QkwMr25qB1CbM4CExa?=
 =?us-ascii?Q?Sg1YNV9OFhTRrakwAsMvr4y55hAFstAfu/iIei9pyiC58rsOzeIatR6/aYHg?=
 =?us-ascii?Q?bOUSpxtFoPv67cmdSiVDe+Q6fAH0err/AAJu8JddV26iZP5B5tnDOIz0/v6w?=
 =?us-ascii?Q?MXcTwA86YaM33368lVtQf5A/M3waT+nwNmAyDYU6nIrkaPqVFSlMdGOgDLHC?=
 =?us-ascii?Q?rnkofWXyjtDmYDrwmgFA5Kom?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba52f58-783a-4afa-27bd-08d92c0eb516
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 12:53:13.0167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IouY1rGn/T9b5x77sBCBsQqmJF/M53rq+DBJVs0Imz1jxvs0JzM4MZA7ulaQ7MDsbwVTnzjrh/eyKPPwvTIEpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

On 10.06.2021 13:58, Jan Beulich wrote:
> On 09.06.2021 12:53, Andrew Cooper wrote:
>> On 09/06/2021 10:27, Jan Beulich wrote:
>>> It appears unhelpful to me for flush_command_buffer() to block all
>>> progress elsewhere for the given IOMMU by holding its lock while
>>> waiting for command completion. Unless the lock is already held,
>>> acquire it in send_iommu_command(). Release it in all cases in
>>> flush_command_buffer(), before actually starting the wait loop.
>>>
>>> Some of the involved functions did/do get called with the lock already
>>> held: For amd_iommu_flush_intremap() we can simply move the locking
>>> inside. For amd_iommu_flush_device() and amd_iommu_flush_all_caches()
>>> the lock now gets dropped in the course of the function's operation.
>>>
>>> Where touching function headers anyway, also adjust types used to be
>>> better in line with our coding style and, where applicable, the
>>> functions' callers.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> Reviewed-by: Paul Durrant <paul@xen.org>
>>
>> Honestly, I'm -2 to this.=C2=A0 It is horrible obfuscation of the logic.
>>
>> I agree with the premise of not holding the lock when we don't need to,
>> but moving the lock/unlocks into different functions makes it impossible
>> to follow.=C2=A0 (Also, the static analysers are going to scream at this
>> patch, and rightfully so IMO.)
>>
>> send_iommu_command() is static, as is flush_command_buffer(), so there
>> is no need to split the locking like this AFAICT.
>>
>> Instead, each amd_iommu_flush_* external accessor knows exactly what it
>> is doing, and whether a wait descriptor is wanted.=C2=A0
>> flush_command_buffer() wants merging into send_iommu_command() as a
>> "bool wait" parameter,
>=20
> A further remark on this particular suggestion: While this is likely
> doable, the result will presumably look a little odd: Besides the
> various code paths calling send_iommu_command() and then
> flush_command_buffer(), the former is also called _by_ the latter.
> I can give this a try, but I'd like to be halfway certain I won't
> be asked to undo that later on.
>=20
> And of course this won't help with the split locking, only with some
> of the passing around of the saved / to-be-restored eflags.

Actually, different observation: I don't think there really is a need
for either amd_iommu_flush_device() or amd_iommu_flush_all_caches()
to be called with the lock held. The callers can drop the lock, and
then all locking in iommu_cmd.c can likely be contained to
send_iommu_command() alone, without any need to fold in
flush_command_buffer().

Jan


