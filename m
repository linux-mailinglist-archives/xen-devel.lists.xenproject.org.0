Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 153D541F344
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 19:39:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200799.355367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWMUR-0002vX-8s; Fri, 01 Oct 2021 17:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200799.355367; Fri, 01 Oct 2021 17:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWMUR-0002sm-5i; Fri, 01 Oct 2021 17:38:31 +0000
Received: by outflank-mailman (input) for mailman id 200799;
 Fri, 01 Oct 2021 17:38:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m+lB=OV=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mWMUP-0002sg-Ci
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 17:38:29 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 912d481b-9f7a-4d53-9161-7cdac3ca1033;
 Fri, 01 Oct 2021 17:38:27 +0000 (UTC)
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
X-Inumbo-ID: 912d481b-9f7a-4d53-9161-7cdac3ca1033
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633109907;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9hnbtrZYVEo5wCc6TgGO5kTiiF5U8l2lVknkRriU0NU=;
  b=J1M3IfxDiA4MyzXQOmeRBLVvrea2EoQM4W95CsIovcRZOzLp/61ZuK5b
   jImVx8707xBg2GogqKpAs8LT+J2hoXOEXrlMsYqjg+6FYG9BHbO6YEATf
   qpFc2l8UIO5ODbO4THMIiIdz3Aaw6M2aOsGIpSafNL5P1bz2Su6kff88P
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: m60S6CW2clrddJUFrbnbgZgVBN0mzt3rEnmuBsgVTR3whthKBiq2TcKNB4Nj5dtR+Vi9euQfu7
 rFEzhGLG5T1rIx7tArDqhuMP4QL1DOroff85ov/Rz4w4yj2Rp8hF5sAeJ5RCy9TJyBs7Ya138N
 RuE13kEOhksBj00qUCz9RIbTXesy0WncFAt7sY8Y/yZ+H+swgpAOImhEUsIDiH7bIBpAP4D6rS
 oGO6slRYMOTHqqAbC2xHC+NxDc42cnYiQK6vdgm+v3yq22NIMvx04tvxst0fMpupStVgEkfE1n
 O+9kuvsXIuoqoZkxfTCk/BH7
X-SBRS: 5.1
X-MesageID: 54561083
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1OBGwqINslfBMAaqFE+RtJMlxSXFcZb7ZxGr2PjKsXjdYENSgmZRz
 zRMCzvQOa6OYGWhLop0Odu0oR5Sv8CHmN8yG1FlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140Eo7wrZi6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2lwcBxz
 fdPn6eVRC4iAfHUts8GcD9XRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gps254XRaaFD
 yYfQTdjXh2ZRiYWAxQGMqwCu+6OoSfdcDIN/Tp5ooJoujOOnWSdyoPFLNrUYZqLXoNcxkKDo
 WTu8GHwAxVcP9uaoRKa9lq8i+mJmjn0MKoQG6e/7eVCm0CIyyoYDxh+fVmxrOS9i0W+c8lCM
 EFS8S0rxYAz606DXtT7Rwe/onOPolgbQdU4O+Q+5RHLza7P5ACxHXQNVDpIYpons6ceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDQcGUA8E7t/LsIw1yBXVQb5LC7Wph9f4HTXxx
 TGiryUkgbgXy8kR2M2GEUvv2mz24MKTF0hsu1uRDjnNAh5FiJCNS9K46V3579x7CYuwRWbdp
 FYvgOu447VbZX2SrxClTOIIFbCvwv+KNjzAnFJid6UcGySRF22LJ94Jv2AnTKt9GoNUIWa2P
 B+7VRZ5vsc7AZe8UUNgj2td4ewEyrL8XfDsS/zZdNZHZpUZmOSvp3o1PR/4M4wAiiERfUAD1
 XWzLZvE4ZUyU/0PIN+KqwE1iuNDKscWnz27eHwD5077uYdynVbMIVv/DHOAb/oi8ISPqxjP/
 tBUOqOikksEC7WkPXKJqNNDfDjmyETX47it96S7kcbZfGJb9JwJUaeNkdvNhaQ/90iqqgs41
 i7kARIJoLYOrXbGNR+LehhehEDHBv5CQYYAFXV0Zz6AgiF7Ca72tft3X8ZnLNEPqb04pdYpH
 qZtRil1KqkWItgx029GNseVQU0LXEnDuD9iyAL/O2VgI848GVaZkjImFyO2nBQz4uOMnZJWi
 5Wr1x/BQIpFQAJnDc3Mb+mowU/3tn8Y8N+elWOSSjWKUEmzooVsNQLrifo7f5MFJRnZn2PI3
 AeKGxYI4+LKptZtotXOgKmFqaavEvd/QRUGTzWKs+7uOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpESyTPVSmA79tOFec2sxLuvEfz7NVo1LuC
 EmO5sNbKfOCP8a8SAwdIw8sb+Ki0/AIm2aNsaRpcRuivCIupeiJS0RfORWImRdxFrotPdN32
 /olte4X9xe71kggPOGZg30G7G+LNHEBDfkq78lIHI/xhwM34VheepiAWDTu6ZSCZtgQYEknJ
 jiY2PjLi7hGnxeQdnMyET7G3PZHhIRIsxdPlQdQK1OMk9vDp/k2wBwOrmhnElULlk1Kg7BpJ
 2xmF0xpPqHfrT5nif9KU32oBwwcVgaS/Vb8ygdRmWDUJ6Vyurch8IHp1T6xwX0k
IronPort-HdrOrdr: A9a23:ipD1gaw9yESn5JcOUOwEKrPx/OskLtp133Aq2lEZdPULSKalfp
 GV98jziyWdtN9xYgBrpTnkAsS9qBznhPtICOUqU4tKGTOW3ldAT7sSoLcKoQeQfxEWn9Q1uc
 hdmupFebrN5DNB7foSlTPIcerIt+P3k5xA692+855Fd3ATV4hQqyNCTiqLGEx/QwdLQbAjEo
 CH28ZBrz28PVwKc8WSHBA+Lqf+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwI0l7X
 POn2XCl+ueWrCAu17hPl3ontdrcejau5l+7fm3+4gowm+FsHfSWG0uYczGgNl/mpDX1L9jqq
 i3n/5nBbU+15qZRBDJnfO5szOQrwoG+jvsz0SVjmDkptG8TDUmC9BZjYYcaRfB7VE81esMmJ
 6j8ljpwaa/Nymw1RgVJuK4JS1Chw6xuz4vgOQTh3tQXc8Xb6JQt5UW+AdPHJIJDEvBmfca+M
 EHNrCj2B5+GWnqE0wxflMftOBEe05DVStubnJyyvB94gIm6UyRlXFotfD3tk1wh64Adw==
X-IronPort-AV: E=Sophos;i="5.85,339,1624334400"; 
   d="scan'208";a="54561083"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfxEgeSjoEGRQ5Hb/e1XRlvbiBldgTlyCpQayR2XFP3PZs5iJ45488lemR+zyfQVoR3HtwrJPXHdW1HHOSI2JV3IA113gQkaSMJmAHvf8KKOdi6HSuI0JNeVjJ6ll8YOghgTfDI819pwqbkKxKPjVfOVVwGUgLlWV941FX56B5Jz3GnUb6RHwTHaL8iQC+rG2ZU+CARaxfQ13EFkt3GXbIwf1vJL1Afn/ipAzgbTr+YOd7s8G0Mg3sxDBxnrVjhIbOtvGXEdtVPLgcbu3etTivS44ctkSMGlP4blTkWYDiLJIPiMhroAMMT7Jd6yS4C0Ry0/9xIsHLZbXdOOe8Z8rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hnbtrZYVEo5wCc6TgGO5kTiiF5U8l2lVknkRriU0NU=;
 b=WQ19KQCDtscx1jVC4N8DVq6dKMQgHolmmlo+t/GOyb1NjxW19FEUQ42xZ9G4Qw383TxlGW1nl/8NA1JpdHnjVoPqqqz5ZnaEdBeR5f5lUX21w/qZJ8EZHEF4Euvg2UGPxizVDRss7peDuMgWM7IojZvrA3xK2jkBnn3AytR9Sv2AlLuG3BohCc9LP3k6X1tBju1T5Q7StH1mz+FxPhul/3nomz9kXb1yT22+FZzj6XB7ULZF6w60/W7xCr0a9e69uvEPgYazY4h/ghQowcDuuLYYnTpAKRg7mqc0KxtmJQtbunfv/8Ks8MtZTWELiI6jTJCqqiRNSo/2DyCUQFIiSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hnbtrZYVEo5wCc6TgGO5kTiiF5U8l2lVknkRriU0NU=;
 b=SWtFT2pulIuxmlFy/yUE6BzMobUJ1QhdHBdUgOqkEs9XvUMfCNKR/70Qv1eeiKvdAUBLXJvhxbAQygJUa5PCI9DVTwyo9kvTa5svNQblc0sH0QNmjXsPkq3JrskRE/0o7XaEeoYFCyIjKF/yYkNatohHRKGIkr1NuyPCpD9Ev70=
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>, Alex
 Olson <this.is.a0lson@gmail.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>, Alex
 Olson <alex.olson@starlab.io>, <xen-devel@lists.xenproject.org>
References: <cover.1632512149.git.this.is.a0lson@gmail.com>
 <85b59046315b8a84afa8538aacdea92b19200faa.1632512149.git.this.is.a0lson@gmail.com>
 <d899b058-a201-e2f8-35d2-f0e59ab4bab3@suse.com>
 <d63a0e7d-7f9d-0dcb-0ac9-8995e56698b4@citrix.com>
 <2ff385c7-55bd-4647-efb5-9909addca226@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/1] x86: centralize default APIC id definition
Message-ID: <5464f556-4932-ee6b-b98c-78ad1bc6bdce@citrix.com>
Date: Fri, 1 Oct 2021 18:38:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2ff385c7-55bd-4647-efb5-9909addca226@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0227.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d463de5-83f6-4079-3cbf-08d9850241f7
X-MS-TrafficTypeDiagnostic: BYAPR03MB3799:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB37996E14065670816085F708BAAB9@BYAPR03MB3799.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H828yHrhhmMVgo8sjNjR3ovbhWt0SuRcrykZI8dhWmauIQq9QWpd4Rip5Bw8mx/8/OqtCv4X3JAZYdvBEm8ZeP8SIIBTesvqxKmib69eNaS23EyJB2/8WTttzTOfbDeASvFOffQ5g16xMbRGH16uz7QUXERXAVaMGVJD4S1ui1kkaiyFDrXRDxftg9kPpJci6VVcROmjY6Ddu6AqZVLLMwOCTjRpmeB2DXtoqBi1kYysKgqkTFV1k8dBLe6ju/tRQ+AzQY6c5EOoSi5YXeHSZAsDwQvl71wQEvqeAGSp6bZ9phKNv2aUKthwVkD55xPQv20acPfpPEgmAHtnH3cixhqMpZ6ZS2fGwtLV9lXD6XwrGpEq+JrdElywsFPrioPja6GDFBYl/pzl+0t3TdZ5nFREE2WyvGIdpJ97ZFXghIvvoVr/dsNLlSDYR92l4nZ1w8vIIyGfISjQJsfap5biOPT16KpzDlmwJCIaHA9xs66M3AyKB0d94c6rsSHjJctvDPUhfhWDKnfRJL6dr8zhST38n+J1BSIhF1kLo8l55La1wORo4472jZsTPCrdzFnQSADQa0boESg4ZBB8LFzD4yqJboRx3dr3G8em/9Z2aO6kaGQpEx7ui9pbwE1C6snsYnUd3FuOnMynioKTUcb8Cwi111dowUMMq8uYLm7zcFF9HGo9N4dqWYw5Tf1ckmsRC/w9FfOCuBzfByG9TfojIkOzdfn36p09xVxoTHFo6lk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(2906002)(6486002)(26005)(53546011)(8676002)(86362001)(38100700002)(31686004)(55236004)(316002)(36756003)(186003)(54906003)(31696002)(110136005)(956004)(2616005)(6666004)(83380400001)(5660300002)(4326008)(66946007)(66476007)(66556008)(16576012)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0JnVlpRVG9tQTNwVU9TMzV0MG9jNUdKRFpZUktKNW5rVHlXbmdxb0wxUUEx?=
 =?utf-8?B?ZkNTOTkwbG1kUTdSYTBHSnRWbHFGOUdjUDJVUThTYXBOSEl6bWs3TVdJc2VC?=
 =?utf-8?B?MlFwWXNaZUVMSHNNV1EwNHN2VCtFUmpxYW1nZEZqWlUrQXVXTm1ZZkJydnZo?=
 =?utf-8?B?STd6VGRPTDBlQ1N6d2o2TnJmdk5Pb3JqaW0rQXpPRS9aQnYzY2pNb3hoSTVn?=
 =?utf-8?B?QnZ6RkR6cm9WWkYvb0gvMFNuNFRWcnA5Zk5ENmsrallUOTRPOTZmYmVhZWZQ?=
 =?utf-8?B?azArUmV1ZXhUQVVRalpFaUh6OXd5eWRzcUQwdCtlS3VVN2dVaWxEcXhNY3Ex?=
 =?utf-8?B?aTlOR3cySUtXL05IcUF5ZWUxMFJpa05IN0podHA1VE1iYmhvY1d1RlVLNXg3?=
 =?utf-8?B?LzNsamNuQU12UjlZL0RmK3ZuOWJYM3IrNnA2UzU3OEJualcxU2txMWx6MzVJ?=
 =?utf-8?B?ck1vVWp2U1RwYURSc0dtTGtFb2VTc0dZNnNMRm1VdUY1RFJuekJUdUxjcGRq?=
 =?utf-8?B?c1ZSajdYZGFGZWxTb3NXTzUvS3RyVTBUMncrNEprYk04SjltQ2NpaE0zaVUv?=
 =?utf-8?B?dFRtMGZVeTNiYVV4NzhndVFGcFRnSCsvK3Q5NWFnRnRyUVl4NndXNDY3SU5U?=
 =?utf-8?B?eUxRT2V0SFZlQzI1bXlQVUlabDg3VXBNeDJkcmtzTXYzQU1FNEN6LzdNQTNM?=
 =?utf-8?B?V29lNzBsTzhmYzE3bHF6M0YwUndta2EwOGtkelk0N3ZFUTdlSWpYWEJ3Vi96?=
 =?utf-8?B?cjFjc3BkRkVUaFFtQUlVam5nc2xTT3I4VjQ4QitXdTZtZVhIM3VLeU5HYm1z?=
 =?utf-8?B?YkdIeGJIWHAvTTFDLzVqak9MWkNMNjVUTVJCUUszdlEyMERmeTd6MUtaNUEr?=
 =?utf-8?B?U2x3M0pNY0FSbE5sOEcxMG1vQ1ZLOW9zVzVOOTVvN3Z4QVNrTUpvWE4rNmxQ?=
 =?utf-8?B?aTYyV2V6bHdncXArK20rakoydTV3cWZtcDJqWUFkc1JXQzExYXBXY0Evc2FS?=
 =?utf-8?B?N1JCN1VzVDh1ME8xNzhoMXNiM21EMU9RYWNBUjJxS3ZEVEQ4cmRXajlma1J4?=
 =?utf-8?B?ampKSm5wTnJwN215bk5LUG1LOU83TmxmNzQ4czJRWSsvRlpRYml0MlQ2OE1q?=
 =?utf-8?B?cFBqdmhLUGhxMUZoeWt5a0dkeks1aUJHSlpyMVY5RG9kSzFIUExUeVJZZXlu?=
 =?utf-8?B?a2daSXpkb2x0dGhGdG95aGhWQnVaUzBGVk9YUUppMmRYUloxZ01zK0VwTFpa?=
 =?utf-8?B?czRrOUdsK1c1N2YwTGlodktDQTllRUJpTTE3dVd6SVQ1VnAxSDAwRHpEcE0x?=
 =?utf-8?B?LzBEbnRZTldEcmxxcFlVU2J6VHBUK0p6SzVLSzh4ZmdhV0dlcHRQSG5RRjJV?=
 =?utf-8?B?cmVLVGhlOFRTdTJJVExsR0c0QkVvRHNURFhnL2hza0lDNWZ1SFNoN3BDeWRZ?=
 =?utf-8?B?NzNuV3NsYlMvemNxSzZ2OHRnZEpianZNMFdjK1hkMXhDeTJQZjV1alFMVkUy?=
 =?utf-8?B?a2xPOFE2c2hNQk1PKzJsSHQwR0I0TTczdnVQUG5uUE81Q0tVR1RkdUJqcmUz?=
 =?utf-8?B?a2xzMm5oRW9nbjBtV0sxMW9GS05FQkdZait0dnBQOURQcE4xdFZEd2RHcE9y?=
 =?utf-8?B?N0dRMkpLVlB5M2cwM0JwRTZjQzlUaHFiVitDSWhhTmJTZm9RKzJxR1NBUCtJ?=
 =?utf-8?B?MnBWN3dBK0RWdFRYN2JWZUpYSHlXR293OGtmZ01qR3NZU2JNV1NKRE5SWWND?=
 =?utf-8?Q?9KT+olfZ3GAmPG628YJdWQp0it6K146QwfzftFS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d463de5-83f6-4079-3cbf-08d9850241f7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 17:38:19.4785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kv/lVLPzZBDVb8vrPmqLfyNgMueEHoDQQMRBP40HEJ4Xs3cKAEeWl9jN4ZgtZ4eSKsHZwpI3GakkP2R313RyfMcbdG4Kj+g6VFeNHWmiNak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3799
X-OriginatorOrg: citrix.com

On 01/10/2021 16:08, Juergen Gross wrote:
> On 01.10.21 16:29, Andrew Cooper wrote:
>> On 01/10/2021 15:19, Jan Beulich wrote:
>>> On 24.09.2021 21:39, Alex Olson wrote:
>>>> Inspired by an earlier attempt by Chao Gao <chao.gao@intel.com>,
>>>> this revision aims to put the hypervisor in control of x86 APIC
>>>> identifier
>>>> definition instead of hard-coding a formula in multiple places
>>>> (libxl, hvmloader, hypervisor).
>>>>
>>>> This is intended as a first step toward exposing/altering CPU topology
>>>> seen by guests.
>>>>
>>>> Changes:
>>>>
>>>> - Add field to vlapic for holding default ID (on reset)
>>>>
>>>> - add HVMOP_get_vcpu_topology_id hypercall so libxl (for PVH domains)
>>>> =C2=A0=C2=A0 can access APIC ids needed for ACPI table definition prio=
r to
>>>> domain start.
>>>>
>>>> - For HVM guests, hvmloader now also uses the same hypercall.
>>>>
>>>> - Make CPUID code use vlapic ID instead of hard-coded formula
>>>> =C2=A0=C2=A0 for runtime reporting to guests
>>> I'm afraid a primary question from back at the time remains: How is
>>> migration of a guest from an old hypervisor to one with this change
>>> in place going to work?
>>
>> I'm afraid its not.
>>
>> Fixing this is incredibly complicated.=C2=A0 I have a vague plan, but it
>> needs building on the still-pending libxl cpuid work of Rogers.
>>
>> Both the toolstack and Xen need to learn about how to describe topology
>> correctly (and I'm afraid this patch isn't correct even for a number of
>> the simple cases), and know about "every VM booted up until this point
>> in time" being wrong.
>
> What about:
>
> - adding APIC-Id to the migration stream
> - adding an optional translation layer for guest APIC-Id to the
> =C2=A0 hypervisor
> - adding the functionality to set a specific APIC-Id for a vcpu
> =C2=A0 (will use the translation layer if not the same as preferred
> =C2=A0 by the hypervisor)

The vCPU APIC IDs are already in the migration stream.=C2=A0 They're just t=
oo
late in the stream for any easy fixup.

A second problem we have is that (x)APIC IDs are writeable under Xen,
but writeability of the register is a model specific trait to being
with.=C2=A0 Furthermore, you get potentially differing behaviour depending =
on
whether APICV is enabled or not.=C2=A0 I plan to fix this by simply outlawi=
ng
it - OSes don't renumber the APICs in the first place (just like they
don't move the MMIO window), and all they'll do is break things.

The main topology problem is that we have no interlink between the
CPUID-described data, and the default APIC IDs chosen.=C2=A0 There are 5
different algorithms to choose from (vendor and CPU dependent) and we
implement 0 of them.

The xl config file needs more than just cpuid=3D data to express the
topology correctly, because for non-power-of-two systems, there need to
be gaps in the APIC_ID space, and this needs communicating to Xen too.=C2=
=A0
(For old AMD, we also need a slide, but we can probably leave that as an
exercise to anyone who cares, which seems to be noone so far).

Either way, when the toolstack can reason about topologies correctly, we
can extend the xl json in the stream.=C2=A0 The absense of the marker serve=
s
as "This VM didn't boot with sane topology", which we can use the
fallback logic (see libxl__cpuid_legacy() and the soon to exist
companion in libxc) to re-synthesize the old pattern for when data is
missing in the stream.

Any change to the topology algorithms before the toolstack is capable of
doing everything else leaves us with two[1] different kinds of VMs that
we can't tell apart, and cannot cope with in a compatible way.

~Andrew

[1] Actually 3.=C2=A0 XenServer still has a revert of ca2eee92df44 in the
patchqueue because that broke VMs which migrated across the point.=C2=A0 As
it's from 2008, pre-and-post VMs aren't something we need to care about,
because anyone still running Xen 3.3 has far bigger problems than this
to worry about.


