Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE372F7F09
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 16:09:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68247.122137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0QjD-0006vd-3Q; Fri, 15 Jan 2021 15:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68247.122137; Fri, 15 Jan 2021 15:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0QjD-0006vE-0B; Fri, 15 Jan 2021 15:09:31 +0000
Received: by outflank-mailman (input) for mailman id 68247;
 Fri, 15 Jan 2021 15:09:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h4P=GS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l0QjB-0006v9-93
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 15:09:29 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5fb9605c-6b51-4464-9247-12a992107e3d;
 Fri, 15 Jan 2021 15:09:27 +0000 (UTC)
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
X-Inumbo-ID: 5fb9605c-6b51-4464-9247-12a992107e3d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610723367;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=cSy6A0sbCh/+YoP/aIeibVLf0dsoODyxeS4/mhunsRk=;
  b=dR0SzgOXgExM/IdvWX044prL6JNCmoTqbTjd2vcpvE8JJbtOEZjGP3nR
   uzS5B/Q/a5irRLLkfMlm+0y/xkhBQ/IcMMc4MRQEOio1TRidbmB7SZJFZ
   RnU6MWMjcIzwyaZ+jTYTpjxnrDTEHi9pAj/d31nSqEPhPn72a1LLqQRv9
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Ba1r51A/r8PliHs+ppfpBk+Ztaea3VjXHsPdN+w1C7LMAoX4ZU3dUvWBFDLNjftEL32ahS/wT0
 u8qw2k3oAkmRBqY7NnrJDaAZGdoQeBn3kTEaHJNjfr7vNh6kIBmVOULKeQsQMM3IN4ZmuA3MRF
 EIo1EABD/yi8mlSa+3xNcfNjNmOjnMxwq9NKsg3aPEb95soCMYMaOgH/40suVLo4owGATiCuDM
 qnpXwmQRWmUNLS5WdegMfWzfsf4OET7hVT31jCin1zQrSTEh9+jdEsea2l5XRD/jgLgf9xDRux
 iGc=
X-SBRS: 5.2
X-MesageID: 35397108
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="35397108"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PW1wl0Uwj7L6SrCtsOdRXZklmd6ERtcVplYXe0HRhdnT+Boyx5Q7jcmy9yrigBNEDUxHITSp34X9cQWgU6QQ3Fc/sM6WxQ7yPLM9bgfIA0XWB2tlDaP21xdMAcycex0eUuSsB6geT65l6I2/lZ1/bSyfMW/uwA4jPxvPAdacJiaaslHVLII6iZMgClUi4BpjvHnq2JynCqj3eDjNqVxwXWWOLIA/XpOW7pk/IL6wu4hOYkVMvjqzMz5vQ/B6je7nxA+ADKZkVhVN06X+0uH7tma+5fINPt/UvXe3zd1Nm1Oqtm0KvMUy4dGd3mTarQhhRSMonzKiGSdo/kF0SRmCRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RAa0AhmQMJMUiOzwXCdWnlHsSFeTxQ0szFK2yVJ+G50=;
 b=jUVVx39adMLvC+p2CLdCPMtYuGkfLrMhX/pOarvozuifjqVU4pdWiCFWjKgWu9OXEJq3cuQiNUy9ySXVVPNQxVf1V98J83Wr+J7CWiY9DIlUYy4Ooo8N+4ObWXMQs4URTmnLqnEM1BhUoFgJkkdKatrcgSA61H09vzJbBGzfJbO0bEo8hUnTcaO+CiOxGfRRvp36T3LfkbX6pc0TlVmWOCJgkc5bNJEdueoj6tyjvsHjekv/izYpNiZMqSGZrZiMHaRK/mO1NuxeZDN47NiEY6xjqDBIx751ApjKOpcdSwmKHJnH8InFmH8OqyYTgkwaVurbeJls/zoVrBJjVklnpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RAa0AhmQMJMUiOzwXCdWnlHsSFeTxQ0szFK2yVJ+G50=;
 b=QnEN6lsxVf5mVNXhRA5LwbP0BK2Ilwu6KzJqs9kZjtlDCcM0vgX0uehBH89TmHWo9xpvquoINGBuem27Q7hNpIpcBV+ZH4t7qSlWBbi1L2ycJyQeXG+d9bsPfHEZ3O5PkKxjU+hak0yiS/h6WlmSNBWpItTT622HYchveFUJVV4=
Date: Fri, 15 Jan 2021 16:09:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Manuel Bouyer <bouyer@netbsd.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] NetBSD: Fix lock directory path
Message-ID: <20210115150919.dolwtbqwbochgp2v@Air-de-Roger>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-2-bouyer@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210112181242.1570-2-bouyer@antioche.eu.org>
X-ClientProxiedBy: PR0P264CA0262.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::34)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a56139e2-f877-4063-f96e-08d8b9678ad3
X-MS-TrafficTypeDiagnostic: DM5PR03MB3369:
X-Microsoft-Antispam-PRVS: <DM5PR03MB3369428F0F53FD099A3D19348FA70@DM5PR03MB3369.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cv1lJ/jJS+txd32TbHtypv6JBt/V08Cy60/ldTfvaVrqPQgukJurFSVh+riQ50kVOQAeVzjA6lATjG0GYlkNzLEhpWSS3OZDBrXh1Sdaa4uDEHqMtD7fJ0sjyg4ZGCHIVRWHxd1OD4nGJcT1WnpDq4vlbEJuXJDbRXkiHgOI9hFP0N685zK2jK42jDiSEMOp/+1AU9ITf+S70AT786YNNRpDbXAKYAxwV21VDaJPQOVQ8V1s0pE8gsvEUTY6AkkttIBJeE34eMUBiArvUrdRSOXrzKYHmJExJ7dfThwQLCd18NNyt2yKUEkYZAUrL4NuStt+TO9oiR8SXRN5RoFo9Lk5giLQ+ruWJc5ckZznNdrI+aLLjMKAa7R8VOBMSefoKeBHBvj9tCF6oD+pPkiylA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(54906003)(16526019)(6486002)(956004)(316002)(66476007)(2906002)(8936002)(6916009)(83380400001)(66556008)(8676002)(66946007)(478600001)(558084003)(6496006)(1076003)(33716001)(6666004)(4326008)(86362001)(26005)(186003)(5660300002)(9686003)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NEZFSUVCMXpsczM0c0VxYWNhSk00azdkQ2picHA4cHhPRVQ5Q1FhL3U0MWJa?=
 =?utf-8?B?V2JqaUZmbDRJaGxibEtlR2NiSWNwUlY5SENmSUFJYVY2RWdnMGxPdGVqSHhZ?=
 =?utf-8?B?R2VBT1phTUF6cWRIYm1sZVhQSG0zTk1MRC9XcVR1cGhHNWVFbi90Ujk3SjZ2?=
 =?utf-8?B?Q0lBdnd1UVgrT0xaQ0FEMGpiMldXa1FtdWREUFlLNVZIUElHRk45SVl0YzhY?=
 =?utf-8?B?K3paVEYrOWhjN1RqRnhUN204Mld5UVI0VnFlV1NWbjRJL2l1NXRlWkk4cFRv?=
 =?utf-8?B?TEY2TEhmYlBvamUvK3cyUDhoTHNNVlZoTzhyKzV4WHVqSVNaNmZvbFlnaUhX?=
 =?utf-8?B?cXdwOWpWNnlSbmUzUlYwYnZvbVd3L3hUSFlxeVVZa0VZTEREQTR2RFVmWnh6?=
 =?utf-8?B?MEJsUFhOQ3FoLzQ1WFk2RWRNaGhBVHkybkNTd2xwNzFCbmwyU3JURnRBZk05?=
 =?utf-8?B?R1IxV2NXS0FIZWJVNTUvUS9wNHgvYnFUUFcxNXVRbVNmL2ZPWVZvd05maVhj?=
 =?utf-8?B?YXdBOHdYUG42R2JySXRwOE5uTUhOenVEeE9Md3RNb1E3S3hKcE9LUXU4Rno5?=
 =?utf-8?B?U2NpalVaMENQbDcxbTlHSWk0cVNxMUt6VXBMODVtSkIxNDFSUEI1QWxKa0Q1?=
 =?utf-8?B?WDYxZ3BtaFR1cVdRK2lrRHdFMitpWG00SSt0K01jOGFnOXlyQW40MWFLMzlz?=
 =?utf-8?B?V1l6OXRhV0VScHNkQ2dJK055cXdvcDJPeVZ1Tm5rekhzeGQ5N0ZkT2pHYnFY?=
 =?utf-8?B?amQ2WnJUZFNUYzFZc21TWEtTeFY3bkVRdEdVa29iZGQ4ckhCa1h3emxvRk9W?=
 =?utf-8?B?Yjd6SkFLK3BvQlg2a2Y4UG15WWwvbUpTM2ZheXN3VXdXVnFoS2RUWFVmMDk4?=
 =?utf-8?B?VWc1WUxWMjNsWHdSTE1oaDdScHhWSDlXRzlFbC9UZklDUkJnVFQwQjh5b3ZY?=
 =?utf-8?B?dlhxNUFBbG0xdHFyb1pmM0FqWWs1c1Qwa08rSTB3dU5LaVk5aGNydmJTejgv?=
 =?utf-8?B?bkltd25ZcHpEbjdHaGJBWTFSUGhuWFlQTGN5MHJPUUtEcVZvRVJlUGdINk95?=
 =?utf-8?B?TlRiWnhlL2h4VEZldDJqOEladmpFQk1WREJUV2tsaHdEbVhBdXRQNVhpc1hW?=
 =?utf-8?B?d255UkVGeDdEZ1FjT3JQUmc2S1Z2cTJObWdNMXFFTVRSWlNDYW0wN2NYdkpO?=
 =?utf-8?B?cFFwTlFiSmxwOGFLVy9rc3BnQW55ZDY5Y2grdWpLeW5jRDlva1lmV2JLL1VO?=
 =?utf-8?B?Qy81cHgzK25nSWl3MjlMMmErajFvak1iS0VoUE42KzNHY0RMTU5NcHViWTZ5?=
 =?utf-8?Q?rW0EwFmfHAheVWUAUTemaiSqf4gixnI6Te?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a56139e2-f877-4063-f96e-08d8b9678ad3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 15:09:23.6107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQzEqbQXNySWP11sNPFPpTQmquVccUQ7K93a5QfgtMY0BYKOZdwvtQK+MsDNTRyJoM8w4XV+5o9mxpQgijzuKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3369
X-OriginatorOrg: citrix.com

On Tue, Jan 12, 2021 at 07:12:22PM +0100, Manuel Bouyer wrote:
> From: Manuel Bouyer <bouyer@netbsd.org>
> 
> On NetBSD the lock directory is in /var/run/
> 
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

