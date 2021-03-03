Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C66232B5EA
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 09:26:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92736.174772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHMpY-0007oe-1A; Wed, 03 Mar 2021 08:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92736.174772; Wed, 03 Mar 2021 08:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHMpX-0007oC-Sn; Wed, 03 Mar 2021 08:26:03 +0000
Received: by outflank-mailman (input) for mailman id 92736;
 Wed, 03 Mar 2021 08:26:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7pqQ=IB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lHMpX-0007mZ-3u
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 08:26:03 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e5071a3-8de0-4f9a-a884-eb1606359e18;
 Wed, 03 Mar 2021 08:25:58 +0000 (UTC)
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
X-Inumbo-ID: 7e5071a3-8de0-4f9a-a884-eb1606359e18
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614759957;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Bowp7Wjx76RKiUGMtyN1bCNIOiEoEQH+54Xofmt6Xu8=;
  b=YbHuRwCsVsWD0MV8zihPXBq3euf/Nh/Eqc+Fzx6gSeLgRDndWkMQqri0
   K77epKH95LiltdAex1XyPvo0qUozcTnwHQY2ohptpeC23NcwSbkE9+3Bh
   Ti59FZw+3bS2Bi0/3lrUAflPnBhHrrjX0fAhDCRW1NfcQAgPDBfYftvvZ
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dLFieh7Zi3e1s0DJLqo8QBG2mPyZ/Iq5CYIm2WK8XEOVYdndkfdXPOVismd8n0jsOaUtocC2QG
 hNVykmRC8nuZrlwJgY9ashLGLyMKO6dXJka4vWIwlEEAIP6wIgvsfCi+YJ40fh8OE1zwNuu68y
 H4himy3URnNkjINS0X35G8ibDBqqXQGsX1i3DJ6VP9TOu3ozitkImYpWU+eTEewCcsXdFuBp9O
 I39i9opgWh8rjiIaIVnisyacfRlvmn4nTxmLgxUo/SuT7YmnKsCWV9bAJuxXD4xc44mlvg4/4g
 Z10=
X-SBRS: 5.2
X-MesageID: 38330486
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,219,1610427600"; 
   d="scan'208";a="38330486"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=III0ggyLBXW69OMXvG3EaFSo/79OHHLJV57yIlvojLHthBEBdWwiswyDgeIFajWjAV3Hn6OIuIMzNeP5k/i7ZPEL+EENcNu/FyzZnIafg6DyKk3xK8+J3vWzAKNSfJh3gdkMi3t1iYKkRPfii21VhCFlmNo7Vh1x9+w+WDHnetzT1Vs6nD4zKFrnoU35k4FzrJ9YLzJJULPLYCBih609ax8WfiBl6K9wbEvoMeEn70FsZtUYByPgy3te8DUWmaTgeEC9iG9SBF/N5SkH2B+DoAR77PSGlo+5tX0yWOxB3vLFLpMmJDmCpt2mekGKSkrZE+D0slW2xLvXsa0VfQcb0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3LB65WjW0c6CvpRFxDabMFvI7fjVEVfNgsKLhiqLOo=;
 b=U4jHue1ZVwOnVw9OQHgYTfqA8O5qpU3lp8/pNHLafSAlXNXqIElRjkdhe7dPTZaVtN8tdBMmaMnNhREuV9ISezjw4+jYwXRtgLMYUUdLxyPemDXM93tCexBjZk1LemTcR0D3Xdh1OeezjLwZTPeDjsdeTL+/MpRGn6MchibWERFIXxMW02yrCe7cBaAhEBL/wTplTJ6vWRzvOEuGuiCAo2hRWYJE7GIBVm3DB1hQ84aVdLiCE09c1Ld3fPb5DvrJc/T52rtydQ2aFcZRbzDSllFOEyAu8EMObH76Rv0BV4yya3wCBWvrHu2ZjXNYmPahPuY7a6IEbuv6X+KYDw3WXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3LB65WjW0c6CvpRFxDabMFvI7fjVEVfNgsKLhiqLOo=;
 b=XLmnEzlmcotL2o/Df9lSSS6hBeH07oWe54ohGQ3kEXF1puZ+ysaefErGB6f5LB6SZqUDvRBLOAPkXF03QjCH0Vc3culPv0YOyLGkMjNJOtcUjQVCA9Y6fysbEmO2RMnP2O25WG7EQ1kURFtpKJxe1lPNrwZqgaAFjP+LjxvvO8Q=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 for-4.15 0/2] firmware: fix build on Alpine
Date: Wed,  3 Mar 2021 09:25:12 +0100
Message-ID: <20210303082514.8859-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0169.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::8)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3d05af0-7d10-4671-f2d4-08d8de1de637
X-MS-TrafficTypeDiagnostic: DM5PR03MB2971:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2971A536060F7E918D0BB3798F989@DM5PR03MB2971.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O7VcekSjR/VFEPc5R+OF5Ukwcc0UgfV7x5/PuJLsW27ElS8ZAEOrfpAHqvhgPzExEeHNkBMJKTKAWxC+bH2CvwCNQWuZRCnl19zW3TmzEo33L45gz7e6PkI42uyUMX9yoA6sjrnIsbnscoyarjM2MKqOnpwjVSIPYcKDmF5YRwkW8e608xnQcro1XRY8YFlhxZ8ZTK8mivazIKcjiqKyHJFwyg/n/InoJFeUm50NqdCnla1vGBKJLZUBgDXKoPTT8/u8JL8GU0YgX7JjS+ygsptcS4Fm565RbEUvvW+KcsNkMS8fydZxFykslwVMhf//+iC8Jm9kwczi5teDw5eispNjaEbm82xWBVD1Q9ga4R+fVqALJ64FzhngvWY80YyKfKtON8h8mCGWLDEkCBuqLmrRyJe7x5VN4iHgvJrEaFwUvbI+64cLrY8C+4pcMH7o1d4vEng9CWjIEpuEzrujpOUFsj7780IW1f9rgEL1p6GyOzcdxWYVz836I6ELNlTdSiK5GsyB48PwPFwfQ/ZwJUZRwS9poGF/RZdxNZfCD0z2bLCuggzzYpgdZNz6HLElYjYf8sYdpOXyf2+oF44r9DyRWfEO8Z0UlCOWYE6vdyw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(39840400004)(396003)(136003)(83380400001)(316002)(16526019)(186003)(6486002)(4326008)(6916009)(966005)(1076003)(54906003)(26005)(66946007)(36756003)(478600001)(86362001)(6666004)(956004)(8676002)(8936002)(2906002)(66556008)(2616005)(66476007)(6496006)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QVBBcG9nOUU2RENmb0Z5TGRPN2dQcGRaYTYra1I3MnJWYWpHTHY2NWY0VG5G?=
 =?utf-8?B?Tk5XQXk0L1hWTFhWTldIWE5TdXJURkN3ZlZReVZiTU4rZWN2bXp4Yjk1bTRs?=
 =?utf-8?B?VGhyaUtvYk1SeWVIcVREb3Z0QVdiMUpnc1VBei9qZXpBa3dLNDMzd1FIZnhI?=
 =?utf-8?B?b29OWVQ4OHZSeGxCZGFrcDBQMmo0dzZvNllabW9RZThiZjN0N1cxRGdnZmJQ?=
 =?utf-8?B?eU8yRUJvOEJVTzRjclVSekw1c1ZCZDFXU0Z5bnZSblhTUTlmQzhsZ2czd3dU?=
 =?utf-8?B?TlVkWFE3Rkljb3lyb2wza2xkbzRYSnk3Q0ZmaWs1NjlWekZaMkpPeTcvd2Zx?=
 =?utf-8?B?M2czbGhCbzFSZUlkejZNaXIwbDJUK2tSR1A4OFJMSXV4b1ExRjhLYjNkRU1p?=
 =?utf-8?B?RjFWWUNUc0JreTZ3ZDROTGpjcVJKMmRPV1lkVVp1b0hUYkNLVWFBRnlsc1JS?=
 =?utf-8?B?bXZUTFpQYXg3Z0JnZVMvcTVtWDZ2bXdFM2lmTnN4SEc5bDRud016dVg5ZXFq?=
 =?utf-8?B?Tnk5OE5UNytyTjJVc0hIajRyVFp5TGM1UzExdUVIQjdReGJYTkxoekdsWjRS?=
 =?utf-8?B?V2g3WDNmTnE4RWFPd1Fyd0h3QXBrNEF0K1g4cFgxUU1Ha1BtQUdxMi9pSGpl?=
 =?utf-8?B?b1BGTGJBemVYQXdqRDU2dkYyMVE4ZUd2OXhUM2grTlhjTG0zVTFoMnNoVjZB?=
 =?utf-8?B?clBtcHVPS3NXL3VBRjhqZzgrQ3B1eGlHMURCZmR4TzFGZjZ6T2g2bm5zYklO?=
 =?utf-8?B?cXJ1Lzg2eTNqV2xUK3ZCY3dTU2Q4WmtZMXZmUnd6V1ZYeC9vOUw3bkVTb0Zq?=
 =?utf-8?B?TllWOGRGQUw4L1hoUkx6NU5KL2lwYnFLZW1sWjVIU25jV0UwaFZrSTJpeEpr?=
 =?utf-8?B?UVo4eHBBOWcrZHJoQ2REOUpJUlU0S3ZZeisralVid1FWYllYYUF4UHFWM0Vo?=
 =?utf-8?B?SXpqZzRVemdXOXBJL2llOGdkbnlET2tlSU1XNUNXWUhyNEt4elg5SVN4OURi?=
 =?utf-8?B?eHNEMU5jOTRMNXZyM2IrcUFoNVltc1kxT2Y4cW1uWVlyK1pHbmVkRzJ6bmsy?=
 =?utf-8?B?RUQ4MlZyYXI2eUZ0OHZnOWl6TVcrMGlzMzRBNWpWdXBVYW1RRFpncFY2RDdw?=
 =?utf-8?B?VXZYMmw5YWp1WXN0R200Q1RjVkRZRmEzSTBVUFp4VlJSemhOaGh2aVFOMXR0?=
 =?utf-8?B?cXp2Kzdsb1d1L3p6aUtUTkNxNHlLc1Y0ZnVJa3ZVeGFxZXJoTEU3YnIwTjBE?=
 =?utf-8?B?YXhJQXdGT1cveWJ5elA2bHAyS2gwa2ZHT0JUVzdFTUFuSUZ3VTVOUFhQWTUr?=
 =?utf-8?B?WDZQZ0ZWanNWYmpaZVcwUlNCeGlXMUQ3ZUQvNkd3WWFzL09RR2lKSmNEeHNu?=
 =?utf-8?B?bkpkRFkvWGJPcDFpbkFnczQyOUVZVzNoRkc5TFp1eHlEQlZEY1FRdXRLRVN6?=
 =?utf-8?B?NkQzQkp1UUlKdldsdWVpSmsxZERkNDhCdGRaa2JSazRSenZZaU1pWlNWNDVu?=
 =?utf-8?B?TXZzUWRxanpCSXQ4bWFpRENXZ0RhdExnYXpDK0FDY3pmTDR2S3JJenNnYW94?=
 =?utf-8?B?L2JPdXJMRXNaY3FHTklnL2dWQXIrcG1PR3VJVzVqeURBMW83K3hDQ296bnZU?=
 =?utf-8?B?V0d4YzFBU2Vub3RtenFyRHNOUDdSbzg4YW1Xa1BOc2Z4WHovYmR5ZFdENmVi?=
 =?utf-8?B?cGJQcWE0SElRNUxQN0F1a1UxU0xqNFFqSCt3RTZ0NVBIVTFNRm16WVNRN1JO?=
 =?utf-8?Q?+Y7UR2d/E0tEpOq0xk5QXJMnWh8PSgLVVHUxOdQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d05af0-7d10-4671-f2d4-08d8de1de637
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 08:25:27.3228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZuYXjDHR2BMK4cFyA834gj7LdCTNb/S6JWRX9yrOZF78QYdKSzaHas48tM+jkd3PldhbnvnuUf6nwwkqFEJxZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2971
X-OriginatorOrg: citrix.com

Hello,

While the series started as a build fix for Alpine I think they are
interesting on their own for other OSes/distros.

The main risk for patch 1 is breaking the build in some obscure
distro/OS and toolchain combination. We aim to have this mostly covered
by gitlab CI. Patch 2 main risk is breaking the Alpine containers in
gitlab CI, but they are already failing.

Wanted to send this yesterday but was waiting on gitlab CI output, it's now
all green:

https://gitlab.com/xen-project/people/royger/xen/-/pipelines/264321420

Thanks, Roger.

Roger Pau Monne (2):
  firmware: provide a stand alone set of headers
  automation: enable rombios build on Alpine

 automation/scripts/build                      |  5 +--
 tools/firmware/Rules.mk                       | 13 +++++++
 tools/firmware/include/stdarg.h               | 10 +++++
 tools/firmware/include/stdbool.h              |  9 +++++
 tools/firmware/include/stddef.h               | 10 +++++
 tools/firmware/include/stdint.h               | 39 +++++++++++++++++++
 tools/firmware/rombios/32bit/rombios_compat.h |  4 +-
 7 files changed, 84 insertions(+), 6 deletions(-)
 create mode 100644 tools/firmware/include/stdarg.h
 create mode 100644 tools/firmware/include/stdbool.h
 create mode 100644 tools/firmware/include/stddef.h
 create mode 100644 tools/firmware/include/stdint.h

-- 
2.30.1


