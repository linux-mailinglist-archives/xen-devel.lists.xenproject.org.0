Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E152F7EA5
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 15:56:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68223.122089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0QWK-0005HB-WB; Fri, 15 Jan 2021 14:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68223.122089; Fri, 15 Jan 2021 14:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0QWK-0005Gm-Sx; Fri, 15 Jan 2021 14:56:12 +0000
Received: by outflank-mailman (input) for mailman id 68223;
 Fri, 15 Jan 2021 14:56:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h4P=GS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l0QWJ-0005Gh-Lw
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 14:56:11 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a057599-32af-484c-a3c5-727ea21eae9e;
 Fri, 15 Jan 2021 14:56:10 +0000 (UTC)
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
X-Inumbo-ID: 8a057599-32af-484c-a3c5-727ea21eae9e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610722570;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=9oAR/K+GvKo//pLgiU5mbfhAt6BCr/Zd6mk9N2X+ZBU=;
  b=cM5uLlN5qm1MsmGsmU2VHjgGXlJ/D79MuYvYOb8Ou1IFvlsiRFdOubGh
   SWicQQJmpJAu+4GFL4HXiXN+/KnL+FXbGGzta/B6AHbpAlhzqH/IEEWxa
   vkxnJhzT9b0Y2C21prxb/C+zYvGKQwiL39hfD+jnEScMeS6L86BZN6vtF
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: QLq5yvN17Y2ThrRn0OEDr0pagdJG99dlcBU2PY+hOhMjxmct46v2kY512puW1MPIpjmr1feHJ8
 xngdUMmAodfTMuVsqNoXQtN9l6gCpkWnmNQR01e/WrjIqjpi42iGaU8jgbIw5nzJcOgdOscd8J
 durur57dglqB9E8pK2UnY80vTt2w0Om3SIIwxnVZkiUUFww30VJ5E6XvkxCHWU4dubAnWmGBvo
 rP8+9UPmVM9MZ18zkC1g8ciPRmXnQNxSB/Uwp51BOjwAgf8h3cdEBsl0rnhFE35M/abWXK0zYB
 vlI=
X-SBRS: 5.2
X-MesageID: 36471904
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="36471904"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxoZx2f2mujmyAHV9upgGYCnBjo52W4NMDK37V2qySJ6E1I1sIsTzw2LoxWWeRVXvS81TbpzpDVy9526xfrhaz7JoJSY0Aw76t9onm4gms6fv9ZSxtiiMGK1UuWMqTwJgIY+w4HIkQsMlGgMNSDzk7slaQdgPmBd29CLyUV5tzQuexbDkkXb67mmDs7U8GfIxRLtOS6RW2c8EcNK4HJPl1J9XOJ771l5hWQVJtuh1gBTs26Ncd02dplgYcxK98t2yynrehww4TTsylScV35ZTGhMbgi2u3FQMdwUBZ2GcEjd6rPaX5wKm51rb54voFyMn1X1Guz3PWbVkj/Et/n4fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJmeT+Ap4ZSgbXteOfx49/tvSjzdiM8VxppfM9rWvck=;
 b=LiPI0DMYko7tVBUHgjyyp+Uc6IHbUJiTwdzpKSDXM4nb/11nLTAben+LB9NhP5B5PYpBBZ5KW3UY9SedZfoQHZfT6SEFO3+56eMInwxzoTn2pHiX8XSQ3CJLYfNyRk1K3Dgja55Dfa38jQkq3UPUETJUVJ32W6EYNiPnowQk/ms0gadQjsPNyVjgytCDYyV3fRJojhLOtjb5rDjS6gSEDY4AhoxtuwJJBnME+S8Zcpk8gZQhjUi0butw81OWRJ+cN+3O7/J12cDgiUr0i3PLW1Shw8R5gf6oDkwXNbJ7ALNcujGhF1N4RxOF7p/1XVqaUGS/vq+4k6derLc3tt62mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJmeT+Ap4ZSgbXteOfx49/tvSjzdiM8VxppfM9rWvck=;
 b=etD95kFg9G1JRhjyUyt0vkakWHy0wv7NYR8W5xanAFERbjn38Ay4ods522ifjEv6TyU4VtJGW3iQ6laYrMY6SzmwksC+sCe8sOQZMYgnP2+H338cYf91zhI9zi9zZrvrcWlbhJEepzGAIQhGpcWKZZdX7KlF69Q2KcmLwDmdtec=
Date: Fri, 15 Jan 2021 15:56:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>, "Paul
 Durrant" <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 4/4] x86/dpci: remove the dpci EOI timer
Message-ID: <20210115145600.3deuf2y47ulvn46c@Air-de-Roger>
References: <20210115142820.35224-1-roger.pau@citrix.com>
 <20210115142820.35224-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210115142820.35224-5-roger.pau@citrix.com>
X-ClientProxiedBy: MR2P264CA0162.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a05aab0-f673-4e8d-4065-08d8b965aefc
X-MS-TrafficTypeDiagnostic: DM6PR03MB3948:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB394891EF24A5BAB367062AF08FA70@DM6PR03MB3948.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B/1rxygmA/fRm1Lv98qcgm5lMqA6UqbfI8xB7qkTet2POEJHY5TMEjO6Bd1yADiykqA3udEOVbe3twUNfoOMfA9AaEoan++pHOpVmv2iyS34iMVEeCMy5SBhoztLsFl7L/XHiCWe+TO21rCePztQCmU0b90J/CoCdaw0qrooquU8K0gOMunEvprxhcltjcFhHS05YtZ6F42I0HUILGtjWtzUaJ5lsItGSqTJKE7QaVbV7jJrWPW4Y9iaYpd2v/EztpIUO2q6kr6tv1C2ESjUndspMnoSc9hocKf/CJ7ObNY2REPa3JuHwREmr+wilwU2uZT6eg3/fZGAh5QsgvTfoIC6I8HSFUx6R06nRN+k+ecg1bAmRd8aFAWi6WhA737wkf4iMk+pJ4uNLw8qCvkacG2hApB2UJDPFu7IN6fH5gMabhxA5lnFhaYB+1CijhyaZBeU1xGOjcOi/TKpajdWCy475ZqJKRmIT6hSWKHujEHXA/fXBbIvDW5UHweRdKYxzDbxN8iFDSxKT24QgVwCHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(396003)(366004)(39860400002)(376002)(136003)(6486002)(9686003)(956004)(83380400001)(6916009)(186003)(33716001)(6666004)(8676002)(8936002)(478600001)(85182001)(1076003)(86362001)(2906002)(66476007)(5660300002)(4326008)(66946007)(54906003)(16526019)(66556008)(26005)(6496006)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VFgrQzRZaUJXTUpHVGV3RzZuZnE4eEJidEVYQ0xocDZNL3MvQzhpS0tYTUc5?=
 =?utf-8?B?Nm92WURNc2h3TzZrWHJDUHFFNFE5bGJUc2RyRlhzZ3NlYUZWV0xRaXd2alRV?=
 =?utf-8?B?VTdkb1JHSXVLWnl3c0RmdEV5T1B0K3NiM0FBRzI1eUNhdjBFdVBhelRGRzUy?=
 =?utf-8?B?ZHRyT0VSbVkyM1FiUTJpcE9qdnFjOGlWaXZTS05LNTJwNzJPZEFlK3BJY2dP?=
 =?utf-8?B?bHdwQU9EajVZbmRzSWhFanBVN05zS0ZoMHd4UEdGV05Ddm5BWU0yTlJBVDZU?=
 =?utf-8?B?SnZUWVAzZzdheFJoR2tNRFVBSFBhVXlsOEx0UzY3ZGF1MWFDWlVta0lISzh2?=
 =?utf-8?B?Q0FodGxyaHhScmV6SG9JQlBSWUpzOGNoNG02T1lWdWlVbW9qbHVrTkVYaTc5?=
 =?utf-8?B?dm9rVmtuRE5EU2xvTkhEdnFLa25FKzdCNGpYdG9ja0JNUm9vTHlpRzR6TDhi?=
 =?utf-8?B?N29mL2E5MTUwRG9EbEJwcGVKdVpHem9BWE9qdyt2N0tSS0kwaGxTTWVxTHFT?=
 =?utf-8?B?M2pneFlrLzhVZlFhWW0wVnM4a05MbkFnT0dZUjVjRDI5dFJWdmpRVFc0ZjFK?=
 =?utf-8?B?VU5wVXFpT0lrUVZ3QzZvdGFKbDRwOTJocWpBV2JNSVdFRkw0Vm9vV252SEJ1?=
 =?utf-8?B?WllKOFVpSmZyZUdXejRDakpOUjFRQlFvemRSQ0lpQmkzR0FhUFEzQk9DVU9Y?=
 =?utf-8?B?SjBqRy9NUytUM2l3YlZjK3Y1ZDZwVlZBWlRmTzV0NGxoaUJoVk84d1JCM2Ri?=
 =?utf-8?B?bFhKSC8wTHBkNHlHTitwWURsNk12bk52QVA2THhDVEJjdmtqdDloMmpEdW5p?=
 =?utf-8?B?dHpVVnFyTkpIRXRwTzVsREdmVUpqOVAvTDA4YXY3Y21ocTN4dlFRNm52SDB4?=
 =?utf-8?B?ZW5uS2xtK2VhbmR5SXlzSElEdUhPS3llSWF6dmdFeUcwTlJnYS9xd2tQelJW?=
 =?utf-8?B?RXJFdnJaMFpKUVZ2aHdEQjFIVkYvL2l2VnNOZjVSWkZDdUdlL2NoQ0ZWSFpv?=
 =?utf-8?B?eE1KU1pxaU5mLzRsaDgybkI0OFA4UmNRWW5nNUFSRHJPcWJwOWduTHBjQjBM?=
 =?utf-8?B?dUQ0amF4aCtSNW1mQ1Q5RkFlRVlHVVI5NWY0OFo4aWxBaHNDWmdQNVdkM21X?=
 =?utf-8?B?WjBtVi9yMEV2NjlybHRMQlBxRHpBNzBZNkdpV2tZc2hPb3grandyeXYzOHUv?=
 =?utf-8?B?VzlFL2NNdjNiQWZKOFZuVGtKdmJPTkNGenpxRlppT0lER29nOHZBaVYxTGVP?=
 =?utf-8?B?TWZ1cko3eGEvc2Vza1ZXbUJUMTlQYUxMcEF1a3pHRFE4M1FpOUZwODRGVmZr?=
 =?utf-8?Q?4gIAcgxbCMQdL3shhUKoAZK65z7Y7ORD1/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a05aab0-f673-4e8d-4065-08d8b965aefc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 14:56:05.3847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+Mc63enb7w+kdITG72d2taDTBs7uAVdPUuS2oLD9ol4FIf6CbyE4FF31uYfXSQqajz8JLQsjPt7DJurU/Ngdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3948
X-OriginatorOrg: citrix.com

On Fri, Jan 15, 2021 at 03:28:20PM +0100, Roger Pau Monne wrote:
> Current interrupt pass though code will setup a timer for each
> interrupt injected to the guest that requires an EOI from the guest.
> Such timer would perform two actions if the guest doesn't EOI the
> interrupt before a given period of time. The first one is deasserting
> the virtual line, the second is perform an EOI of the physical
> interrupt source if it requires such.
> 
> The deasserting of the guest virtual line is wrong, since it messes
> with the interrupt status of the guest. This seems to have been done
> in order to compensate for missing deasserts when certain interrupt
> controller actions are performed. The original motivation of the
> introduction of the timer was to fix issues when a GSI was shared
> between different guests. We believe that other changes in the
> interrupt handling code (ie: proper propagation of EOI related actions
> to dpci) will have fixed such errors now.
> 
> Performing an EOI of the physical interrupt source is redundant, since
> there's already a timer that takes care of this for all interrupts,
> not just the HVM dpci ones, see irq_guest_action_t struct eoi_timer
> field.
> 
> Since both of the actions performed by the dpci timer are not
> required, remove it altogether.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Add parentheses.

This is a lie because I forgot to refresh the patch before sending.
Will send a new version if required.

Thanks, Roger.

