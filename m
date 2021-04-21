Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AD6366755
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 10:54:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114155.217425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ8bY-0004j6-2Q; Wed, 21 Apr 2021 08:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114155.217425; Wed, 21 Apr 2021 08:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ8bX-0004ih-V1; Wed, 21 Apr 2021 08:53:03 +0000
Received: by outflank-mailman (input) for mailman id 114155;
 Wed, 21 Apr 2021 08:53:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wOap=JS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZ8bW-0004ic-4l
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 08:53:02 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 142f0581-5d81-47d9-9c19-3f2658ac5683;
 Wed, 21 Apr 2021 08:53:00 +0000 (UTC)
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
X-Inumbo-ID: 142f0581-5d81-47d9-9c19-3f2658ac5683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618995180;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=wUVbrR4X6MsBe8UWzAQNouDNy/1e0xTUjosLEQ2Vq7g=;
  b=eJXTzelorhRBShaJqEW6McIS4I4dr8KUM+yJBtPg0Z5gnE6vjthrTrl1
   Z2aqQ6y/c2djEjo3JfboxB1YlZzBFTBjoO76sz00GJsMhdn4ekU93XVXC
   F+9nvjSQNOTivrTQirc6OQIMaP+xNhgYQIyQTkm6YJgxV0SJlQ9h1n6Jj
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +i45jOJgid6M+RLv47Hek0PI+9nzsmjIz9wxTYrkX7MQqfHSM5VN/GcvL1yI6VFNATykaIph27
 F0ECkjJOo1udSkZBqaPVXaNGixM9QRy7ipsQillOFPMP8YGUA49Zg4frAfE0MGWJgm3R50sx8Z
 tN0m94/USr4tx9LzuFcX1b99PilOUh407MEpVJgHXK+0COehZYiMaOnx7YGl/7cDju9uK4703d
 i81qVzc76S5IQhFbrHOQ1IOaTmRUutsYn9+qCOAVpbRH5rkNNoF6I7AvRxX/wtQ1NQrQoNK6XP
 yDI=
X-SBRS: 5.2
X-MesageID: 41891863
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Ox/B3K4KbM8k4sN4igPXwVuEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex3h3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdBHW3tV2kZ
 1te60WMrHNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2FXQotLhj0JbDqzOEtwWQVAGN4VFI
 CE4NBGujqnfh0sH7mGL1MCWPXOoMCOqYL+bXc9dmQawSStrRft0r71FBCEwgwTOgkv/Z4O+X
 XI+jaJg5mLnOq8znbnpgvuxrRQ3ODs095SQPGL4/JlVgnEriaNSMBfV6aZvDYzydvfmGoCtN
 XXuR8vM4BSxhrqDxmIiCDg0QXhzzoigkWKoTTz7AqB0K6JNg4SMMZPiZlUdRHU8SMbzapB+Z
 lGwn6DsN5vBQ7A9R6NluTgbQ1glUa/vBMZ4JcupkFYOLFuD4N5nMg0+UNYF4o4ByTq6IwrO/
 kGNrCj2N9mNXyddHzXpW9p3ZiFWWkyBA6PRgw4ttWSyCU+pgE082IogOgk2lsQ/pM0TJdJo8
 zCL6RTjblLCusbd7h0CustSda+Y1a9Di7kASa3GxDKBasHM3XCp9rc+7Mu/tynf5QO0d8bhI
 nBeEkwjx9zR2veTem1mLFb+BHER2uwGR73zNtF2pR/srrgAJL2LCy4Tkw0mcfImYRfPuTrH9
 KIfL5GCf7qKmXjXaxT2RflZpVUIX4CFOIPvNIWXE+Pv9LrJoXmuvezSoeQGJPdVRIfHk/vCH
 oKWzb+YO9a6FqwZ3P+iB/NH1PhE3aPuK5YIez/xaw+2YINPopDvkw+klKi/PyGLjVEr+gTdE
 t6K7X3r7OjqQCNjCL1xlQsHiAYIlde4b3mXX8PjxQNKVnIfbEKvMjaXmxOwn2dJFtaQ9nNGA
 BS43R7kJjHYaC49GQHMZaKI2iah3wcqDahVJEHgJCO4s/jZ9cfFZYpWKt4EC3RDBxrkQNWqG
 NOATV0BXP3J3fLs+GInZYUDObQe51XmwGwO/NZrnrZqAGhv801f2AaWDSvSMaTpg4rS1Nv9x
 pM2p5apIDFtSekKGM5juh9FFFXcmyYDIhLCxm/aJxOlqrmfxxxSmm2lSWX4itDCVbCxgE3vC
 jMPCeUcfbEDh5mtndU3r3D3Xl0em+eFngAIUxSgMlYLyDrq3xz2eiEau6PyGOXcEIF2fxYGi
 rCeyEuLgRnwM2X2BaZlC2ZL2gvwowjM4XmffIeWoCW/knoBJyDlKkAEfMRwY1sM8r2tPQXFc
 2YYA2YIVrDepUU8j3QgkxgHiZ6qHMpy6y1nDLk6XW1x345D775Jk98S7QSPtGb6CzFSp+zoe
 FEpONwmdH1FGP7LuOi4+XwSRVoLxvIu264T+0ys/lvzOoPnYo2O6OeaCfC0XFM4Q43I8j1nn
 4PWagT2sG1BqZfO+gpPx9D9lUnlN6zPFImnwz/DOg5Z0wshRbgTqS0youNjbokGUuaogTsfX
 GZ7i1G5v/ANhHzn4IyOuYVIW5MblI752kn1OSed5fIAAHvU+1Y5lK1Pjucd7BaIZL1VIk4n1
 Jf49uSmfWQeDe98AfMvSFjKqYLyl2Ze6qJcUuxMN8N1ce7N1SKirar58D2rA6fc0rFV20owa
 tfdUIRacxfjCIFl4Nf6FnqdpDK
X-IronPort-AV: E=Sophos;i="5.82,238,1613451600"; 
   d="scan'208";a="41891863"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltL+mKbcNO6ELuUGWhKeDLhDRdxhi8qOWhJ89zyRzpsWXnyaJNz9pjry5cMpQ2krEL+pJNbre92g+pl1D2+bFxsHcstOCilwgJ/NRgHwCFxCZvD0LneeyF8CEWyrmInCRblA7LVIt9mN/I3j795x/npQk9UsthpsRTvfWILvhVqBnrcP9qORLKeGxsUW3TMz+j9d/KmtWoc6JpgliqaBm9CJdkma4bJys23USKvDS/udzA7yyr5nov22wtKBwPBFgAWv4JCGuARamuo987xxLyZlLmQInMhewfPRAT6PdcigjELoGP8Gjx5EXNTeLcDc9f5G+tzmTisGhonsITF8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSLUUaZ+LeZR2cL3b2vS2vOSstN/bAtcZudGm9it4m4=;
 b=aOI4YjposfSqpTLY970o+llDS05jtQ3DOvqkDFyuXCdiviYEq75yeNLZfRmQNipceDq8IYbCLb3vEwebK/4ydMeBk3oa2ydyf78N+zNtGe40Lor53rqchJeasHtBIgDvZmBXZl+YtIoVBZa1FI6ttBL2PjagKgy0nZlQVrYRpDKTqTFZ0RxmTLj0pXVK5LTumpy9ckCmbVL90/a2p9lki5xnzQpE4wZBBbIwUaymPwSm38XUqeNK7a9OCKSH08JjkBH0ksg858JpQS/dVTmCFzuQJljj2djbHTJYLFw8SAFtfJTHwJGcabGAPfTnB6RcUVRF+avZz6xA7M+652WfCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSLUUaZ+LeZR2cL3b2vS2vOSstN/bAtcZudGm9it4m4=;
 b=FgLMCJGoi9SMRQuoVh+NQT2IxE/+iw5awKdF+EBid7vBAAWGO6sKo46OHYrFbQVxK3nL49mfMLQq0L9YTfIZyBuswm7lWcj0l0OKUbi1bfraLL7dum11ZIPwrrkdp9AfPqKH3NDZZGclj0efPVqDBr8ldie0OsXqTDGetes2mDc=
Date: Wed, 21 Apr 2021 10:52:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/8] x86/EFI: sections may not live at VA 0 in PE binaries
Message-ID: <YH/nzmkQMhsJE4mw@Air-de-Roger>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <5d7c61b0-8441-dccc-4917-cc8a436fd96f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5d7c61b0-8441-dccc-4917-cc8a436fd96f@suse.com>
X-ClientProxiedBy: PR0P264CA0242.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::14)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0517ad6-c6bd-40f1-2ffb-08d904a2ce7f
X-MS-TrafficTypeDiagnostic: DS7PR03MB5463:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5463B95958CD45057ABAB4BA8F479@DS7PR03MB5463.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ssrm1ZYb0s1NBYJagxKHosYsCnCGKkMPkFHuJnm5TZ2oBY7Gahy8nb7N5ascSzX4q3Pyt49hf3ajYNr0xkRNxG4Pf7sRX4gtmekh4vEOiwm5HNQ9y9sE6FRJI6bgudJMGWeIdnBZpW+2SsSYN/qeA7g9116+eOty85CMLLlDiMIJj/Oe+MKpFwvw1AwPBHHksO6NViaNxW4gfs/CT3z1K+cqT11LdTAc4l7AG48DGwEv+FcVttoW6s9xr/CnwqBPmHxgVokEjWA5eiePslwigYiaEasuUifbvqYuaGlO0LBmFJjeLomXs01BKQ8EdNuJCXvHHF+/qNNUCJAbPVn0IbbX7YBdQ91OgKOhbEWoCXFlrVxEp154NxKnuucDOx44wwyxluLuj4Gfd6Y9/gpMkMW98zFKXjRoK6TDiVsxpJuKXpXWlHa3mZL4P4FF+ehrYS3ikegPpTH/TgugljNC+Gwt7Ng80w2V/b6cXHcC+q+VyL5ecMcJwcfojOVrhKGvM7982IicBSspdXJF8ivxeMEiRDKiLpo+WSFSfSxib7CAk/OfE+x0HoYtmsspcSbgaGG/lYTXO6OF+QUaaIWaX/oYK7W8CyjnVYwHxHea6yY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(39860400002)(376002)(366004)(136003)(396003)(4326008)(54906003)(26005)(186003)(478600001)(6486002)(5660300002)(6496006)(6666004)(956004)(6916009)(8676002)(316002)(2906002)(16526019)(86362001)(38100700002)(85182001)(33716001)(66476007)(66946007)(9686003)(66556008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VFlCMnJ5TExGMFlsemxzcUh6bmcyVEkrK0x0UHFKYVRTbzU1Z2NiUWZJMktB?=
 =?utf-8?B?ZlVWT0xlckE1cVpzT3RmOGNsTTJFZWg2WGh4T21BUHVzeGpNbHg1UHZyakV1?=
 =?utf-8?B?UXRoWWk0eHlpWnljR3JoMzlHZE1aVSs2V0FvTEpiTThVMmYxV0RFRnd2Nnpj?=
 =?utf-8?B?c1MxUHc0N2tVcGlyK2hSaVVXMDR0VS95TWhaaWZFNHBMZ1lLblk2V29xYkNG?=
 =?utf-8?B?S3hPYk1EVHkrZjliMCtXWTE1VTB0Wmk5dXF6WE4yRENmWngwUTV2SVg1RnRi?=
 =?utf-8?B?cGdCMUNYK0Z3czQzaUd6cS82QUdVMGk3SzJjdzZzQnNBWldIMXRMV3psK282?=
 =?utf-8?B?bXFTRE5lcTZnSGFMdEN0OEtudHJBa1BDa3U2ZlFOWXJPUlUzcmtVelpoNVJM?=
 =?utf-8?B?eVFXblUxUkk2OTFLWEFHQlVPQitNL0FRdFlTRC9mTFBnWVZSNjBsZ2I4M3Q1?=
 =?utf-8?B?V3BrS08xTzJSS0crRWhidU5vR3BTbGsyRDNYV3RMd2w3SzRvemlpVHBtRkxB?=
 =?utf-8?B?VXpDWjRBejcvNHBic0k5NnVBYXZxeEgzQXJGSDg3WDRrZDRTRHBGc1JkOVRX?=
 =?utf-8?B?K0NYMG0xaVpIanJLcGxoaExFRW9mc1k3NXFkY2xVRUwxa2VPc3dmV2NJdUM2?=
 =?utf-8?B?OEdTeVlrNHFiejc4RTgyRldFb3RydzdIY3ZZV2pTeU1DSmc4Rm9FUk8xZWFl?=
 =?utf-8?B?akJNdGRER1BmU21ud1VCWkwzOXM2STRhRVpUb2psODdnUmpKMzErL1NTSE1U?=
 =?utf-8?B?a1BoL3JHV0U0UzdtL3U2MFRGNURYN0lwVDFEbXhmM1BLbUdudi9xUGNNMVp3?=
 =?utf-8?B?VWJUcEY1bkJBd0t2Y2ZhUi9xS1ZBUURqbVNoOHRSZEZqb1gzYmhQZEhvcmpH?=
 =?utf-8?B?bkFUVGxvTW9wMTlaVXdRRFJSb0hqTUZSYkw5aG01UHhzVmlOc1kxR3NyUEow?=
 =?utf-8?B?T2ZyL1NFRG9ra1hXQlpQMjMzNFdDWW1xWDgxQkNsdTQzQjZSMlZ6em1kdlUx?=
 =?utf-8?B?TVhjaWY3VUV4VUtzVEJRa2Y5THUvTE1iaUMvZGFOV2NzckhCWEU5QkpIb2l4?=
 =?utf-8?B?MGkyS1l0T29UVE9BNDVNWjVXWVF2SzN6K0YxVVFkYVluL2tTa2ZWM1VBQkRO?=
 =?utf-8?B?blNkOFdFZkUxb3hOb2o2N2ltYkNya1NPeDByVDZiSjl5bEUyb2JVRjVNTFpK?=
 =?utf-8?B?cFJoWTRlZFNqME1RaFM1TWM1TnlNM2JNeDZNN2VzRS9BL1dnbXpzbDREM1A5?=
 =?utf-8?B?T2tGaWhZd1BNZzE4bGVrRGJyT1h3eEVieWx1dU14YkZRY21TODZwRzh2TGlG?=
 =?utf-8?B?RG1NclZ4SW04ay93YXhzZ3MvdVU2NXVuaENERDRlK0VGNUVuSmJZQVJIckhj?=
 =?utf-8?B?ZHlwZWhnQ3I4OXZsZUdIRFBEQWFmeTZsR2MzUVdMZmNic2ZqYWorTm95S0NJ?=
 =?utf-8?B?UlpSaVBwQ25WNlJMTms2TVJkMndzWU5UaDdSV29kb2hKS3l3eWxZeG1yWVVv?=
 =?utf-8?B?aThFL2d6K0p6RzN1bEZGZVNsK3ZiYWcvUVRKMjRKemxXTzRiSHN1ZnNjL01B?=
 =?utf-8?B?c3pyODZMckZtUmpZOTArRGFicnBCV3BFVjZBdmNDUC82N0RqOG9aRURvRGZx?=
 =?utf-8?B?eHM2c3VLY01sZzNRTjFQdTZLT1JtSjUxQVQ1bnZEaVF3TTNoZ2l6SlV1Vng0?=
 =?utf-8?B?c2p0dzhBTTJuN2hTUTdnYXBRR1RGSGpKNkZaVlowQ1pqSWV1Rk1qSVJCYldo?=
 =?utf-8?Q?lUhnvMqXQasLa6tw+yvpnZeayyTewq0G52gdVEk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0517ad6-c6bd-40f1-2ffb-08d904a2ce7f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 08:52:34.7610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7r0bb4+SIKXPzhpHsvVQ9VqePBoMByk6CEH5QgtIYl9BhLbqdGlk77V9v8p3wkf7D1Fpa0OzlvnLdkENe+8bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5463
X-OriginatorOrg: citrix.com

On Thu, Apr 01, 2021 at 11:44:45AM +0200, Jan Beulich wrote:
> PE binaries specify section addresses by (32-bit) RVA. GNU ld up to at
> least 2.36 would silently truncate the (negative) difference when a
> section is placed below the image base. Such sections would also be
> wrongly placed ahead of all "normal" ones. Since, for the time being,
> we build xen.efi with --strip-debug anyway, .stab* can't appear. And
> .comment has an entry in /DISCARD/ already anyway in the EFI case.
> 
> Because of their unclear origin, keep the directives for the ELF case
> though.

It's my understadng thonse sections are only there for debug purposes,
and never part of the final xen binary as they are stripped?

Could we maybe remove the section load address of 0 and instead just
use the (NOLOAD) directive?

Does it really matter to place them at address 0?

I also wonder, is this change fixing some existing bug, or it's just a
cleanup change?

I also only see the .comment section in my binary output, so maybe
it's fine to just remove them from the script?

Does the Arm linker script need a similar treatment?

Thanks, Roger.

