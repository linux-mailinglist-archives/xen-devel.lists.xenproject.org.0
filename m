Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBC42E3A7F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Dec 2020 14:38:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59502.104446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktsiz-0004Db-B7; Mon, 28 Dec 2020 13:38:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59502.104446; Mon, 28 Dec 2020 13:38:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktsiz-0004DC-7r; Mon, 28 Dec 2020 13:38:13 +0000
Received: by outflank-mailman (input) for mailman id 59502;
 Mon, 28 Dec 2020 13:38:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=shBg=GA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ktsix-0004D7-Si
 for xen-devel@lists.xenproject.org; Mon, 28 Dec 2020 13:38:11 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b503f3b0-888f-4887-86bf-801b3cbc34fd;
 Mon, 28 Dec 2020 13:38:09 +0000 (UTC)
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
X-Inumbo-ID: b503f3b0-888f-4887-86bf-801b3cbc34fd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609162689;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xRf/pouNo4W0pR/99rPzXSviSTZuq6CSogXiyONKy1c=;
  b=JdycH0TTmyexkmwhVCGK9sFs4NeZLKO8cmPEsUJQW1H4jvuKYhIsDYEt
   8YbNfQqc4nyfyUfR90WbzL6W8MKt6nLDHqQFKNFWO67P2t1/I6tYvsq5O
   riXnYUEsp1e3HQvUbQm3dOFf+NBtYzTtv93TqdE6TbHEHm1104jjgYCoN
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bBNYazyUy0BFPYINDW07OXv30hb8vVuyx3aK/U2ChA/cgrbbbDEcL4Q6toRG3Qq/Mas0RKN40N
 eXCwejQLcfOfP3EzLVrFKYWsrWtf8WuIf9HvHSTw0BaKUlEQNFec5kvGW2nK0OBGcRUKiKe7YV
 o1aNEj5n+m9uoctTf3+7RvykuRzpq1ZjToIYPzPR52JdZHvRuwqVespF639yfqZbB1zQT7nMPQ
 MMANX2uWQ44DJzzYixTNcnqs93STyG15aepM3a2RWa9IRjOr50ZwPOW205OnbGHvihAhPRlH7A
 c38=
X-SBRS: 5.2
X-MesageID: 34260064
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,455,1599537600"; 
   d="scan'208";a="34260064"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j89o8Ck9YVcdhiCMuB3zokEzJUzee1m0wf3dT5la7ZZRZbtu284KUgKN/h02Ptxx10VEz7/MYg4c6SB763fobyePbYYAmqhCulibT8voe7Ohlb5GDnDWNCnpZZi5BgYpVWVTupSpn5KKXyRlLvr67ink8ErNCd3fOXuTzsXxcJy0cyXLsWvgi7TSJbS8y8Ag/R8sIPP1N6O8hL819T/ci3fM0MOMG/pYWwPnQIddYSesZdnpgbwmMGsLxcy1+dG7M/gIa4+UgNrUqi1xwwWkXVicdICVjUvJeoyXioE2dC0LdQTqOK2aGnFSGG62A3PJVdKE94TE3Cjke8qk3/YuSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTaL4nA/Kna6BnDl7gYzVia0wg/SRxZlzUPM9hmeqf4=;
 b=bTNm5e1kwGuk3L8BkugkNZZR19xFpsLrDfWD9K6Cq8ns/0iUFKg2DaSFUQL1cXxII+a9xdkOefM1wyIlG2mGHv1opkinpVJ8cwy3p7R85rgvOGus43R2FJekhsEcUWyGDQM/g9SiBOta8sr3dOmApgzN4tdNbsgH3MrCcnHsc8Xx2CXLmxGn9H7fIODm31jQuDFZdhXwSi0SKDVxpHF3rNVVMdQQ7N9ttMd9xJwolfKoUB1OYiPD8eb6StSR2r6aBe1+DcZumeuDkjuDvV3HZeAOMalIBpMd39UujRIyrcPPa2nbnuMnlv4WQLSo+f+FjT74br7hLb+TD9YEOWzo9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTaL4nA/Kna6BnDl7gYzVia0wg/SRxZlzUPM9hmeqf4=;
 b=b+6YpUgm8La1nELKPY+d7w7B/zMpd1geFJQSxlZ8TCafvC8rUEyyEDin2pJKgY6qlcNLGDp3BUY2sx50/jsUWYHvSLK+m01v9D+ABRfNVXlhl2aJCidYA4Smsd6JIRrOKS4DyA3/rf+6EHA9t8oW9pSmVtr9rmbuJvjdS2t+Xf4=
Date: Mon, 28 Dec 2020 14:37:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 4/5] x86: hypercall vector is unused when !PV32
Message-ID: <20201228133759.lidihcqkqo3svorw@Air-de-Roger>
References: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
 <6505bcc4-0cb3-42de-9fd5-50da133d6d99@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6505bcc4-0cb3-42de-9fd5-50da133d6d99@suse.com>
X-ClientProxiedBy: LO2P265CA0490.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d1f8339-d2ad-4a34-276e-08d8ab35cda1
X-MS-TrafficTypeDiagnostic: DM6PR03MB5322:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB532203007D67EAE167EF14368FD90@DM6PR03MB5322.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RoeVrDTJ5go5OS6eGyfIk/WF2i8/63UxCBxGLYCEnR08CgR2asDmGTi8y9XMcfVltkLivRSc26vBTZyM+i6w1Ob49MAgFjZudOm8NunM4qNo5O1Z1XyKPSQbO0rZbSyGiWhV0qMlKj0O8a0AjcN7j4R2rM0gzXkyvakyppKDwZXNRLgWaeedlTPCQQvEGuiBNZa4M2uwdKPos+0FIlbH5BezXRgapw981XmbLqMsddhY45za3ZlDRKug910JqR9rifb8/BxtXJTs7sJ5Xyyp8mezhecizBLNlheUWvcFXe0L/WjnYqGNBW8bM1divhC8Tv5oDrxjnT2eYXGTYsCw0dHUREJFgux2+dOEHfwCTLW7zcKzBvFz8GHhANBBp0MviY/Dw5wq1hW1vbtFINwdjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(346002)(376002)(396003)(366004)(39850400004)(66556008)(8676002)(2906002)(66946007)(66476007)(6486002)(9686003)(6666004)(4326008)(33716001)(478600001)(6496006)(186003)(16526019)(54906003)(26005)(1076003)(5660300002)(316002)(4744005)(86362001)(6916009)(956004)(85182001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b1hYeHhkNFJpRmM2YzNiQUdlMHBHUHVRNVJPenVpNDJ3V1NMeE9EeFZuYmh3?=
 =?utf-8?B?ZjA0QkdSc0FnREFnYTRYejBIVUpDRUMxeWlzaGh2NXJ3bDdTUCt4eDFiTWly?=
 =?utf-8?B?Umc4ZDMwWjhyNlc4Z2d0Mld1MVh3RDdwWXpudGNaeHZncUlFTlRQYXFhYXlE?=
 =?utf-8?B?T09rSGQ3bGp3djhZcnRGU3p0eHI4VUhPVzV1c3lrZkF4WisyampvQmRMNytM?=
 =?utf-8?B?ZndpZ1pzMGdIRm9ScmRramVCUjh0OE1tME9QRGJ4SWhya3hLSDFSakpKM2cx?=
 =?utf-8?B?bTdWOEttNnFLT3V1RSttVy8vZHpMZkRjZzBZMlFJbngwcUFCK01DbmNsV1J5?=
 =?utf-8?B?cFZibmVGZXhmT3JmUEdDdzFEOVhTckZGd3lranlBdDJneTVTek5jNWlIcEtV?=
 =?utf-8?B?cXkzNysxeU5GV08yRkxXZk9PQ2J0NWFBc3JYU1owRGFWa3NCUlc5WnZDNHdO?=
 =?utf-8?B?SW1nM2FRYlpUQVRTRU9QcW84YTZGczMzZ0tQMDRPaHNwSWlvUkIwdGdmSHdI?=
 =?utf-8?B?UGhUeFlqTlB4KzF3ZFJyM3dwU2Q5UGZjVnNlNXJ6Yy9YVmZQUDFFdmRNSU1q?=
 =?utf-8?B?MEVYWDJyaGxFeVgvQVB3eWdpblNiR1hSN2pvWG9INWxnSElYM1VKbnlYcEFH?=
 =?utf-8?B?Q25ZMnFMalNQS2NLY2t5OTM2d0JuMkNoazVyeVp3TjJ6elNROVpVVHNuT2xp?=
 =?utf-8?B?MncxM2NkN0RMWW9wS1lVZ2dVaGNkaFplL2NrMFFsZEExMHB1RjcxcHZ3VVVM?=
 =?utf-8?B?QTc1eTJXQkwwSmJyOW9URXVZcDJJWk9lRkI2cXNPWEZ5Q0gxZ0szQnJVRlUx?=
 =?utf-8?B?UGl0RlpKM2lBWVJ0ZENTR3Q0SXZyZUFvYnFhRE45YitHN0VocU52WDBWYUc5?=
 =?utf-8?B?N2wvWnJ0WWQ3dUJqZ1R1anE4RHE3MHo2WTd4R09ZSTI0Y0pjTloxK1FSMy9x?=
 =?utf-8?B?QTNGZGk4dzQzei9XUUcwYmdzODBQUUZRTjZrb2VsYzVOb3g3RzZOTTVYVlBr?=
 =?utf-8?B?Sm1DRXNPSlVmNjI0ZkcrMnNTSG5CTDRsMUNYT1hEL0dvRnRNWUVEY3Z3RUpk?=
 =?utf-8?B?MzdrcUFRU3ZiVm1XQWlNTUJ5cXd3U0VPZVNRRzlVTDFucFMvS0s4bmZPNmJu?=
 =?utf-8?B?V1JxK1pMVlV6VHlwSVoweWdubUVYOXg4SlN2ZE5OczhvRXpDeks0MFF0VGY3?=
 =?utf-8?B?WG9acnNGNnp3cEZscUw1YnRGQVZkZ3FrdEYwTy8yTTRuZnZSaFRyTmpRYUNE?=
 =?utf-8?B?bEVCK0tBb0VqOWlDZVJPZElFMGZ6WGVDMTd0dWJkQUVQbzF5Y3U1dTdCTEdH?=
 =?utf-8?Q?2ChBWMhnRUnRMXaXUX9rDm6al16v70imv4?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2020 13:38:04.3356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d1f8339-d2ad-4a34-276e-08d8ab35cda1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VipiqEiu6CZcVv9MSodHoyfsfhyD7wlrXqXn9srLaI685j71hHOhqnEAz11T90x2oXFH5u/OMjnmx59JxocEdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5322
X-OriginatorOrg: citrix.com

On Wed, Nov 25, 2020 at 09:50:51AM +0100, Jan Beulich wrote:
> This vector can be used as an ordinary interrupt handling one in this
> case. To be sure no references are left, make the #define itself
> conditional.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

