Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBFF3ACC84
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 15:43:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144652.266218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luElZ-0004RW-Fz; Fri, 18 Jun 2021 13:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144652.266218; Fri, 18 Jun 2021 13:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luElZ-0004OZ-BK; Fri, 18 Jun 2021 13:42:37 +0000
Received: by outflank-mailman (input) for mailman id 144652;
 Fri, 18 Jun 2021 13:42:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lC6W=LM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1luElX-0004OT-IL
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 13:42:35 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4df509cf-ad39-4f7c-8a47-da425e2a9d11;
 Fri, 18 Jun 2021 13:42:34 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-RFWHhx_9N_exPU9AEgOT-A-2; Fri, 18 Jun 2021 15:42:32 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7151.eurprd04.prod.outlook.com (2603:10a6:800:129::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Fri, 18 Jun
 2021 13:42:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 13:42:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19 via Frontend Transport; Fri, 18 Jun 2021 13:42:27 +0000
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
X-Inumbo-ID: 4df509cf-ad39-4f7c-8a47-da425e2a9d11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624023753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Orf2Bk6rJ/wqUaOsji1+IyGfvZ4DN7fRzHlOSSTtWss=;
	b=QxrYb4W1n2DFxSY5fFDk81vnTSGnKN7Dx+i65WJapPrXZZaWvX5E22hVXTIahGCHJ63QgI
	pX1tnO9IOcBtFUifMo1QE8I4tvK5VJOEOG6KfkI3FrZnxPemp3oeHrvGNp9dkZNIYUNjIM
	b3qklRvmrXvmT252TJakhHjgRfYam4A=
X-MC-Unique: RFWHhx_9N_exPU9AEgOT-A-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHoGsd1vr0EjB873neCu6XzwjhqQlihpydz/4/rImwXjWUAYToPFFspPQEgvNzyBPmbqVuCp292Y1QyAumMZwtp8GfBHmzEXxzsKAxjwvZ9OpZvcyDGir61kMInoVKuzQ7H8Id+Ce0u2Wfpp+lkk5sJHaCHR9ctP+B9CCw/PiHp4Jxq+I2DbTXKLlZr0t5XLMJfcEkYFhAtsoS1z4mGdVOQ4w4lDkT2wxFf16/pyNWVPo+FLnpwpgGAyIeKIlCQLL+o7JnRafuO8tKHprGuWj+x2vuiHv4/CyZ38dKo5aHRhxxM3umSBYuZpObsP0da9V90QnQK/a/VkY9p9vH6ukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4noPiWMcK0oPSOckF4kf0ES74lzeH7J4YEp4oJnJ8k=;
 b=P4+avrM5BXOuYPP4nb+1eogrUfksbl7tYnlpNE1g4yrAoiBz+fhuaAZ8clG5FxiFoOQ/0Vv8MxKLD7beU9VSMchqgNJI+ehR+91GPcc6k7JNSG8t3W7UZJTsmf8W07GCT6gos76URluLIwnskXeq/H9flZrB54ob6v+drXizbgIDAYatyBMiVP9kZ+eG0S30KGncyrted5xl2bQ8U41SAiDVU1aSTSN+8/udcGQDzkW7Ndbd2cd7BDB7U9kP6zH5DCzDr9j9YGPXByf3SQtvf+BWVr9d3tkDAm5iFsqtJpe7g3gmDWEfDHrdSYCt7C+ODb/G17uq1lcuUrUqYOzeZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/5] libxencall: osdep_hypercall() should return long
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
 <798b7eec-e31e-1798-773d-c2865fba4be2@suse.com>
 <a8b032ec-bafa-ef50-825f-26e975e64c69@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <31a3f6e7-2fe7-e25b-8e15-82940c9ef03f@suse.com>
Date: Fri, 18 Jun 2021 15:42:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <a8b032ec-bafa-ef50-825f-26e975e64c69@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P191CA0013.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7c0d045-7fa3-4fdb-fea6-08d9325ee9d0
X-MS-TrafficTypeDiagnostic: VI1PR04MB7151:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB715106D1A862A3565C0A1294B30D9@VI1PR04MB7151.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Esbs6Z85E5i6Poj/qdlCwM30YrNjC2OI4zs/CCR2XylDlroXLKlayoorLL+wMNOUolFzv7/9s0KxDufIzgREtAaX2eVdSr95qGRxwD5bytuqA4eO01JWHQwEl7Oxq8EPxfTnPbWERa1cRPvOu+hEeBIVfNiKWE/JPXTK4ofl6GLkgEv23AFqgZFUMxEKJaTCxORw6VuePzhRAZ8jLPWB5W0k35lCMB8TzUJ/4DkRwatAr7VIirCc3fDry0q5mUXhiog7Fd5HpNo9tBxSZknkFjrUQr1lUu0evLP6B+gnOlWTwUkT0WWcEb/ufK41iwecqKyVu98l13boeX92XVppCIAa2clgoi5qZzToIBbygY9BB2Zpgc1q8w6nMREh3s9leP3swuMpTEUnWvY233LIgOQiCmlYA3MpinRurWg6siMtRUvkdIaWiTDa6+j78VuAztfbh4oC6V6Y2qDgw+aoPVB/nvUt63ycTBXUIh1IS1Bbu3UqtT8Cw+Oy9sOFEANEciIP1ZIDwH6WigErBeoyJsputcDuz1UubYbHAUF5dJnieFFL6WJQ9xOxcXDlMQvx4vZj7pPK8VUdNo8lbmabfaY5OUS1D9vQQdu8+iw/vTyNcnwfstXDYn/ni6eQCBDJFYzSn3o7FxDsn17e075j/cgAwJOuLDSUcfB5gBkDuvjb4MdE7HwxHwPs48o8LMnf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(39850400004)(346002)(366004)(136003)(5660300002)(38100700002)(956004)(6916009)(16576012)(4326008)(8676002)(83380400001)(2616005)(2906002)(66556008)(53546011)(8936002)(54906003)(186003)(66476007)(16526019)(66946007)(316002)(36756003)(31696002)(6486002)(31686004)(26005)(86362001)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B6CDsJTbEYhNCdNBlLWdZXHnoYr8/HSLe3B69s7pqqUBPiAfxfWJoNA4qw4f?=
 =?us-ascii?Q?C9vv9o9PYQMFswWDGN1wA/1tDbIgfamyXglf8ek4zktd9CyJdxemZoOga6zc?=
 =?us-ascii?Q?FofBipKZ0vaoInM4FfncBjYo+JVlAn1PLbYsT660vmWAHtlpbbsT0gqVKei9?=
 =?us-ascii?Q?ygtXtp5s9hd64r6+UbYiT+UosVmb92FloOpxG05I9ddFXLER8XG+ZJpGc8Pj?=
 =?us-ascii?Q?dgh/isGVh7/2wT5uh4V2+HW7uVyhD2KKnhBsvzbjte/QvReWd1aBpPnhYVBU?=
 =?us-ascii?Q?cwSqCoQS5SiDcS7WK3UZ7vo2ZsU8PAMVeMrR4pona/Ut2fIHedzf6xu4le4f?=
 =?us-ascii?Q?5qgtH+cS+MUlGcX0peDSfOa7S1CL+T9PQpf7BfSodQ6LZl992cI871WO6ch3?=
 =?us-ascii?Q?4NT8fLW2JYtq1g/OC9T/pl7n1A8elrLG5NEDC4h81meBz2RZEGDATORmtb2f?=
 =?us-ascii?Q?7G02mkTTngdBXtVWiVMDuYdrki/VCVqw/0cHFc5KQtoeMb4i7+XCkwx1MPwA?=
 =?us-ascii?Q?1jUvRTMBv/V2/3ZIF8L9CkoGfujkifkUCzWv4XFO7H3rx11+2LAkgxrxZWiC?=
 =?us-ascii?Q?8tR+nVD7yf+ubsfRdiAwOl/h0r35jMwra9QOVZvleCZktZXMHAwM6QEadb/z?=
 =?us-ascii?Q?4bRCCFbPxI/ZehCjOeGpoeSSZbSc/WRXyT4b/8G6QR4SjV6409nWnJaC8fCa?=
 =?us-ascii?Q?Roxw3Yc5meWfw4vWtuU+Tdhh/fTLxK7P05UMnnQVAEvMUICboRX1ov5MoEH5?=
 =?us-ascii?Q?Vu/6xYLaUY/5h/wtExlcgJhrgyfNKZPJpnldaFxzf1qik2BsXqXaUi77yhSg?=
 =?us-ascii?Q?QWReZEfth0fv0qlwHWNDVu/oLeN4sqbJ13xNucECZgiMEjqmzYI4PW+Arc/U?=
 =?us-ascii?Q?gZ7dn5NCqhZM/H7OAqLXhrK+ig5ObjMXz43Gdb3sRqAlRjIYvpC7whMJgnqD?=
 =?us-ascii?Q?Je6yzPRun0/fZb7M8pRPVFtlrEZQ9XshbMZwkVtr7tf8srWcJU3Wx1KSOO1c?=
 =?us-ascii?Q?r6gQs5mQpFPcbhaleLY7fYqrzzr4htl55Se2Bb8R/Dua72jnIGKHR25XEoFO?=
 =?us-ascii?Q?9oSiGe5khfq+175fxwLh36lTvnxp22V9HqiDQi3deub/BMcaqfz0NiAOdcds?=
 =?us-ascii?Q?xjKv3jm6kGbcM+C6KGmE4WzdhvgkpRLk+R/cM9fgjsyS0Qz1rix/rXU4z2G6?=
 =?us-ascii?Q?HgbuVei8UtoRYUzGhuxMje8f/J8DB3/HYS8DrIDG5+4+GKpcZRlTE8UtGP9G?=
 =?us-ascii?Q?OnMqiOM2U7SHrzP4oN8M+zUw5nEIBAJXCS8q+A06jQ0IlbGlep8WNiV90las?=
 =?us-ascii?Q?jrUDZG1Rt5x/63DQLXgprnR0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c0d045-7fa3-4fdb-fea6-08d9325ee9d0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 13:42:28.3586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Ytk01q6a6vgLt2DwUZKLMEkyOXV1NYbvqT3wOfc5yQtTCghU8Wz/vOaIh9BoAjC5CCowOtw7wxt+UFjJe7EdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7151

On 18.06.2021 15:26, Andrew Cooper wrote:
> On 18/06/2021 11:23, Jan Beulich wrote:
>> Some hypercalls, memory-op in particular, can return values requiring
>> more than 31 bits to represent. Hence the underlying layers need to make
>> sure they won't truncate such values. (Note that for Solaris the
>> function also gets renamed, to match the other OSes.)
>=20
> Spot the environment which obviously hasn't been compiled since the
> 4.5(?) timeframe...
>=20
> Also, I'm fairly sure the comment in the NetBSD version is false when it
> says it is copying the Linux way of doing things - I'm pretty sure it
> means copying the FreeBSD way.

It doesn't say "copy", but "mimic", and I think what it means is the
effect for its callers. Therefore I think the comment makes sense in
its current shape. And I don't think I should change it right here
anyway.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> I think the commit message needs to state that this doesn't fix
> truncation in the Linux or Solaris, nor the truncation in the
> xencall{0..5}() public APIs.=C2=A0 It only fixes truncation issues for
> FreeBSD, MiniOS and NetBSD.

I've added

"Due to them merely propagating ioctl()'s return value, this change is
 benign on Linux and Solaris. IOW there's an actual effect here only for
 the BSDs and MiniOS, but even then further adjustments are needed at the
 xencall<N>() level."

> With a suitable adjustment, and ideally a fix to the NetBSD comment,
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan


