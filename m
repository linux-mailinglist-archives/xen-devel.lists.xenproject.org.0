Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FD03A1484
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 14:34:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139300.257626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqxED-00005r-VL; Wed, 09 Jun 2021 12:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139300.257626; Wed, 09 Jun 2021 12:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqxED-0008Ut-SG; Wed, 09 Jun 2021 12:22:37 +0000
Received: by outflank-mailman (input) for mailman id 139300;
 Wed, 09 Jun 2021 12:22:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jMcQ=LD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lqxEC-0008Un-MT
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 12:22:36 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b1d0974-79f0-41dc-9802-f5e02bd3ffff;
 Wed, 09 Jun 2021 12:22:35 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2054.outbound.protection.outlook.com [104.47.1.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-7ZMNU1mXPyq--y9Kh-PtQQ-1; Wed, 09 Jun 2021 14:22:33 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4608.eurprd04.prod.outlook.com (2603:10a6:803:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Wed, 9 Jun
 2021 12:22:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 12:22:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0001.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.24 via Frontend Transport; Wed, 9 Jun 2021 12:22:31 +0000
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
X-Inumbo-ID: 1b1d0974-79f0-41dc-9802-f5e02bd3ffff
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623241354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NxVvP1fuRJ5SOxFkz6gHnG9QC+PljgRsKs8p79VfwDM=;
	b=K+pNxQDo8uLfpE2sbXX3gqVTHjfRM2aPH/ow4rdlu5A6O8T1RmAH2RgQXVYRABXAcYFs/J
	BGgnnK7UwJbPC3/9vzlYJzgB/JK5ohEaciTJIqM4FQz7/03LTl4GECnYLqiaPQ+ExkoCfT
	QPqRmpSrasgpR7kMqmRG3AEFsCkcL8s=
X-MC-Unique: 7ZMNU1mXPyq--y9Kh-PtQQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwH4+Tk7h+5Cdk6+L4vs212yrB8RvPkHgAlSkCH9JQ9zRhRjyx3YY2Y9w2XpZ7u1sMG0ZRrjLk6ZBWEo8nTbxJ4ewF/w/efonju5kgG+ja+BmLZ5nM0eGU/WGeMCxqtwseSOJY+64ZJ+uxKl9pt2IW9xgo+WSjvq2Dn3EfFJ/Gx+cMFWTbJ9byhK5qinX/8k2IzUH+C1tCPjHsjwc4hjgk9xu7kKY0chDsuzuijwnjxiHZiLJheuSlZGc/OPwLro1GPBWrjF+Wwp8VwDFHoiMbKHxqwLwbaisYpzcIwYVx+JPOtPSojh6N9P2IuZPo/48qFgkfXgmdbfponZvdoE7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbD62tgf+tx/Qy9YR6Hs49XELMFmV8y0hAW3fnr51Io=;
 b=EFbS1Iy+nJZ4iYSbZkAEpMk8ZCLI8Bwaqf9efAvDqOjWpebsDLJ7im/04+7ebvtANwa3jKSPoVd7dvHpx12AoC0wQB9Qh9j48BRD+RHYYoxn6LWoOrkIVycft3zLSGUOzjMWaKgQyREicA35pT7tv1zxjtQKwvcDCfUaY+9jV/NGqo19Zns4wgoT8tDbWUy2PyogxV+h0EPBPN0KZ2XFgajAyKFq2allIuu2+uz4WaRKEavlIrXgKAwiGoUPf+/0GpuzY3cBn2oJsRJAiKeyO48OWWkqLsTpomXsFXONol7FWbH2EaF+weG87IGrQK9jF370I+Oqb/P8JiFCnC/ZXw==
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
Message-ID: <a6a9c5a3-a061-3401-671e-48cdb408c694@suse.com>
Date: Wed, 9 Jun 2021 14:22:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <31dc681c-8713-7ddd-6c4e-3c385586da4c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR1P264CA0001.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bbe0e9f-9ece-46d3-f8ed-08d92b414148
X-MS-TrafficTypeDiagnostic: VI1PR04MB4608:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB460884A473E90CF26E34BCC2B3369@VI1PR04MB4608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A/bPoG6ZpjBgK/9JQ767lO1xvPjEHTN4Nsoh/wjVFBDCSXTnJ5l24GfFsfd3mTcg5Pa+JzLj3HnmmwXsDmMbd8weCFhvhNnVPrfmhJSZfRZMdBzz2bHwhsuv3Nn+UAPFjlC9nY1ArQ9jAYupeXvX36rwmncx0/MbDZMnmZLeUtcUJAWORd/eaQOM2/nW99vpiBsbI4UrECkXad4OZ10LBj0PRl2k05qpl1/uWjAB9C5cxi/PEkcKrxJHs/ntqU1RY9xaOObLQCqmFJSY/et+4HPe+xf9HMyOa13W6kcKIkL3Pxe899p3utdcFREt8HpvfZG2BSkcpk34UfJ5IB5dPBk+UzuUewMGtupF46BaVVhTVSxMCE2LEt4b0NAe/hTqtsQTxwHfuVLIl8jMt9xCN+hXghNhEOP88uPo4F0ucycwF55F75rR4KRxEyd35HVvfFmoOz4ei4JCM45Ll4SzHJ3JQt1NVV4gKKWQmw+qI5S/N6QJK54fEYrtD4GTPYk2aYdPxzSQ5Ho0QVV2B27Wz5Y/y11gnmFxneSpC6Cjyf9NRdDbC1No3v/Q35Qtiusj02m/ki8k11m3owgel9fkXhURqsrL8dZsn0ydG0pdTTj2qAw+JZg1zKcoxe9XqhjumDXWEo+f8jyfdhhrmAGhnRwoSz11yp+F3hDrhgYomgImwss1d008d9FUWGzKoBHS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(136003)(39860400002)(396003)(86362001)(36756003)(83380400001)(316002)(26005)(53546011)(66476007)(66556008)(6486002)(54906003)(38100700002)(66946007)(31696002)(16576012)(8676002)(8936002)(31686004)(16526019)(4326008)(956004)(478600001)(5660300002)(2906002)(6916009)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?us-ascii?Q?DXcEm+UBqDbOZWDU/vVHdEK1j+Suk/9BgGEZ/hvV/ybMTC0VEigBX9wwv87b?=
 =?us-ascii?Q?Q54fvQ8YmaVgAYLE2sz26T0rkeizopWJ3sqQheQFF/S9klNq8HPUljMGG7+C?=
 =?us-ascii?Q?MeQ545f9bTE/rB2gQ9l+yR6VkgJoi/n1KXpx3jtqzHJpfA2fFTPHEbSnkfSU?=
 =?us-ascii?Q?wib/dxp/TH0GlPf6gx3j+md+sCmmASirWTdXwwEFAg23kes5TjW0mD4/AkBp?=
 =?us-ascii?Q?REh2YPX1DUnRDun1E9QSVVfOtwlnt6mI31vBlaJNbo2mTur6xTe0I2c7QZxO?=
 =?us-ascii?Q?dnFKW5dWv8nOOT8noU0gSaoHmAjfHA12OU4+2J65hsFAAS2a/Hhjc535EKey?=
 =?us-ascii?Q?wQhOgMuYTttPXt3IYvsJxvn0ji0F2oDVMPuHDpaeAiF+v01O/I7mgZ3Mfz5o?=
 =?us-ascii?Q?Sgi5ST2D6qPdNOWVk6ZYVrWfu/phrwUarr4FLpYjKkmq9+C4SU3t5t+2ERRS?=
 =?us-ascii?Q?xR9FLTISOFnF4wd4UTbNByEoTgg6Im1yZtXQ97UyQorYoCYf0c5D3Lf/HJFb?=
 =?us-ascii?Q?JpD2JMe1/2oUvgJdqbvaiFfvIrvYF7a/uxf7X6UthFe3WF/rc7i+YapbVaeD?=
 =?us-ascii?Q?n9IMrgty/Y7OaSBhSpTflIGrH8h2wuzeoMp2vFK3bOdFbE8QudYyMj5PvNJc?=
 =?us-ascii?Q?4JMsJQ0hJHlNl6hBxcvXIVeGrVsM6AnkQB+bPTUL5v2AKbkD1nl3HWqaYT1X?=
 =?us-ascii?Q?2OiVj9wnROTpXIP4q20E5mUoKgcrhD2XxunPrQ/2qA/YrXgAY2XD3tTIUsda?=
 =?us-ascii?Q?2IiqPk5x7B6BKx9NkFmHrE7j8lW78LjT2w5zWKFk0eYM2zZ49dlRDKeC2XUv?=
 =?us-ascii?Q?LCvEjTXAvvwo18tPdDANFqEcr3LM3ZGqrYZbWz7fHSWugEBKABwdgZGAhXNO?=
 =?us-ascii?Q?y0vzX5PMAPjSH9V4k5BOgDc+A9SaKg+i31rJyXQKcrh7RF12bxnTv/+PglFq?=
 =?us-ascii?Q?7QSmlQYFoAOnNpQAJhcb0Ku3tBHQcFAzZ+ZkNlmPzC9Cv6qnsPm3V4hU4MB0?=
 =?us-ascii?Q?Kmbr+ifU+ZY2h8CxV23Cuumr1ya5goPFkjaQyrWwAHQr1RqTBSNCN4hbcNco?=
 =?us-ascii?Q?3aNAZT+blRKYmz1afvCYrg+SEd4Z21TCuzBHfUOjAdXQej53vjGBp+dq5GS9?=
 =?us-ascii?Q?7gSMfNUSqPjy1v1FuFqt1Ao8oh0kI8SgbvoZEhaO1PrlHeEhnnFcE8xw6oo7?=
 =?us-ascii?Q?IGC9CFYamC47/NpvgOH8XfChTK7VFD66W1HqnoxwkcBiS2rg4kRPTl9nDsla?=
 =?us-ascii?Q?AddErBaVc6TTkEwXeXhvIL7382PlUSV/o4n6aoG/TkjgNN1STesyVinsCoRe?=
 =?us-ascii?Q?UPv5iUUYyCFU62Q1TPGgYW1l?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bbe0e9f-9ece-46d3-f8ed-08d92b414148
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 12:22:31.9044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XiS+yBZfiMZyN7Jb49SH2OSblOJlKIE55QgrGnd0FWM+O1wY/wvMItdj3QhVYOd7HI2cgyy4KhAGTRWx1FiM6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4608

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

Just to make it explicit - the immediate goal isn't so much to
shrink the locked regions as much as possible, but first of all to
avoid spin-waiting in flush_command_buffer() while holding the lock
(and having IRQs off).

> send_iommu_command() is static, as is flush_command_buffer(), so there
> is no need to split the locking like this AFAICT.
>=20
> Instead, each amd_iommu_flush_* external accessor knows exactly what it
> is doing, and whether a wait descriptor is wanted.=C2=A0
> flush_command_buffer() wants merging into send_iommu_command() as a
> "bool wait" parameter, at which point the locking and unlocking moves
> entirely into send_iommu_command() with no pointer games.

Then I can only guess you didn't look closely at the pci_amd_iommu.c
part of the change? You may rest assured that I wouldn't have taken
the chosen route if there was a reasonable alternative (within the
current overall code structure). In fact I had tried first with what
you suggest, and had to make it the way it was posted because of the
requirements of these callers.

I'm also pretty certain Paul wouldn't have given his R-b if there
was this simple an alternative.

Jan


