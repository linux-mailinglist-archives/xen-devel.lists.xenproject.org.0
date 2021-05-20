Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA69638AE3A
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 14:30:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130930.244996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljhp7-0007mJ-P1; Thu, 20 May 2021 12:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130930.244996; Thu, 20 May 2021 12:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljhp7-0007k7-KZ; Thu, 20 May 2021 12:30:45 +0000
Received: by outflank-mailman (input) for mailman id 130930;
 Thu, 20 May 2021 12:30:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V2Ic=KP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ljhp6-0007iu-4H
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 12:30:44 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c04ed44d-6193-42e6-9876-75e697ba86b7;
 Thu, 20 May 2021 12:30:43 +0000 (UTC)
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
X-Inumbo-ID: c04ed44d-6193-42e6-9876-75e697ba86b7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621513842;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=pz3YuJzmpguFtK4yG9GS6ET957dZMF7imY4C1CnCr5M=;
  b=dkUUsjX3nOFYCn183Md2Hpy5F5qbUpj9Dn1wH4GKqtS6iZ4WKKBnlc7D
   EFjX8AS4EpFelEwYA+UlxFRvesz/OcuqsOxTwG6UpagamkLHrYREHo1am
   AUnh/X1+6sill9oxL+8fj63uDLBdKi4AFqwcma2X5nzfbgKiGDM6De878
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UQ8p2LR5tn+Kk8TxP1ZzDXvXlH1AdSAjqKyRvU9kGyT0vjqa9E58tMvHvxxZZD5sny7PF0AHM2
 opprexNebWA1W9KI3+xaeTu4ljwQqmpIoYBjCWbfQJyECcNmY2F0MZWaM06o3qoj+R4CNe4uw1
 HnPre1+iq8FgTqYM8M1roxsDimWzPy+OeK8OEy8MpNR5ZqG2hiTjE0kKPa8WqYksK71gvnoKFA
 DcwuEqNmEPw2v1EOz3/eh5X6jHd9gT9jSZdDukj19EtDH3iSnJ+GE5sphsTPDZqUK1FFr4SvNf
 w+g=
X-SBRS: 5.1
X-MesageID: 44217040
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-Data: A9a23:N2uh5KsZttZfLkdMLd0HVZBMR+fnVEteMUV32f8akzHdYApBsoF/q
 tZmKT+HOanYMWPxc4x2aNvkpB4DuMeBydFmT1Nt+XpnHyxA+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAnk/7OHtIQMcacUsxLbVYMpBwJ1FQzwYbVvqYy2YLgW17U6
 IusyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi92M4OQk8lAeiNyCih6bZZE85vMcHWg5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7kq3J1LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6CO
 5BANmIzNHwsZTViYVIoOc8RmNu4rXjTfR9V8kOuorUOtj27IAtZj+G2bYu9lsaxbdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+o6FaK63u5nhkWJwW4eAwFQUkG0ydG7gEOjX9NUK
 2QP5zEj66M18SSDTMT5XhC+iG6JuFgbQdU4O/Yh9AiHx67Q4gCYLmsJVDhMbJohrsBebSMu/
 k+EmZXuHzMHjVGOYSvDrPHO92r0YHVFazVbDcMZcecby4bujt04o0/mdPx6Garltd/+PTqhz
 i/f+UDSmI4vYd43O7STpA6d2mj998mRE2bZ9S2NADv9s1oRiJqNItzwsAKKtZ6sOa7EFgHpg
 ZQSpySJAAni57mjkzaRCMEEAb2k/fqMNDC0bbVHRMJ6rmrFF5JOZ+ltDNBCyKVBaZxsldzBO
 hW7VeZtCHh7ZirCUEOPS9jtY/nGNIC5fTgfahwxUjapSsQpHDJrAQk3Oh/Kt4wTuBFzwcnTx
 qt3ge7zVC1HWMyLPRKdRvsH0K9D+8zN7TiKGPjGI+Cc+efONRa9FOZeWHPTP79R0U9xiFiMm
 zqpH5DRkEs3vSyXSnS/zLP/2nhafCBnWsiu85I/myzqClMOJVzNwsT5mNsJU4dkg75UhqHP+
 HS8UVVf013xmTvMLgDiV5ypQO+HsUpXxZ7jARERAA==
IronPort-HdrOrdr: A9a23:iNbysKkbAw+YZby64nQEDs2+MavpDfMeimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdG9qADnhOVICOgqTPyftWzd1FdAQ7sSibcKrweAJ8S6zJ8l6U
 4CSdk1NDSTNykcsS+S2mDRfLgdKZu8gcaVbIzlvhRQpHRRGsRdBnBCe2Sm+yNNJDVuNN4cLt
 6x98BHrz2vdTA8dcKgHEQIWODFupniiI/mSQRuPW9q1CC+yReTrJLqGRmR2RkTFxlVx605zG
 TDmwvloo2+rvCAzAPG3WO71eUYpDKh8KoMOCW/sLlUFtzesHfqWG2nYczBgNkBmpDv1L/tqq
 iIn/5vBbU215qbRBDOnfKk4Xic7N9p0Q6u9bbQuwqeneXpAD09EMZPnoRfb1/Q7Fchpsh11O
 ZR03uerIc/N2K3oM3R3am9a/hRrDvCnZPiq59hs5VVa/pWVFaQl/1rwKpxKuZJIMvX0vFXLA
 BeNrCv2B8NSyLlU5nwhBge/DWDZAVNIiu7
X-IronPort-AV: E=Sophos;i="5.82,313,1613451600"; 
   d="scan'208";a="44217040"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NuQJOlW44zMV0DU9DZ7GUj4KzeXKrI/FevVEzMkDv1dMHMSyIgD6dPQaSeZCXHb2CcZx3K6L1+6SaYZKNzmqeepS1vS+zLdNV72qGJU7oN4nU95yZeKtSN/Dci12bPT8kc2B/pSQZjO4WSsD87MQ1gWWmTgp84tKZemhrv7aQUr54DDRalrEcdscHVnlDyAqlp5GYadaSEjYUfAeFJgL0fko2p2fCMiymi3hhqYVB1oq+BNJvfCusNJ7r70fV6vwbzEntNOxJjwOMkpEONbggdAK37ndZ3AMF54kcLbhOZqlEBXWBPDQaZU0Cxpb3F2Lj9X1lp6QZZ5NQq4cnY8qLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FX66gErbVbl+5wBpfx4Y0txO4O300Tono3Zv/ra1bB4=;
 b=VlavZ2t0d7r1aUz3XadaFS9t6ea6JhE3tYH6vPLmSUlvCcjR40koHFMTEXGKpwQWBPPAzSx3vvrWliIACFqVA1jiWaz1hWMfeJE4Nhe6YQoDgQV4FEJLHk1ljD5aA4ibBkHtOdc6DxmlkJP/PbkAVwZVbhEghQUSiEcCGgzIAo4CB9Vm6JiEEy9rwdhf99vqVGOte6X4IL4+uKDAFIaUBvA7+1IqOD/KmwrQFO7upolZFMkhTWm/gjwrC0yqsUoQS09z0aLBDEQtdUyGUhxaeYxlJI43o1CtVXnjCRMPcsp92V3eUCrIKMq/RYXOMkmypi8jI25PK0PoIl8UJdv3IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FX66gErbVbl+5wBpfx4Y0txO4O300Tono3Zv/ra1bB4=;
 b=GuIqUt9aFXVbVmZch71cjhCkoZzGF8ayxsH/goGq+9nRYWty/28lfyX87IIZo3WjM8DfNbPtspHU3tGRQzTNR4NIMoUVetqAMDSHmGtrAwNj2Yasnxt8rjAK+paObQ9BvDYMNymdyB1BVCgL6yroiGHkxQsi0pTZSv+qW4Qbp7A=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v3 1/2] libelf: don't attempt to parse __xen_guest for PVH
Date: Thu, 20 May 2021 14:30:11 +0200
Message-ID: <20210520123012.89855-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520123012.89855-1-roger.pau@citrix.com>
References: <20210520123012.89855-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0040.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 460f9abf-1ebf-4ce4-7cf1-08d91b8b0dbf
X-MS-TrafficTypeDiagnostic: DM6PR03MB3738:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3738F218B2C96DF78CB91F1A8F2A9@DM6PR03MB3738.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RAvq3dkgZeXoN83o2IeCLj0MS6uuk7h7p7KeW7jHRFBnv1eP25IvjwpEkZKxIdLF9we9RaEORhXktUMhmglRJdOZ80cQNGwiWQB4GVy+Pwdcq9p3CfRzPoq+bAb2vBrsc9SZIghauOaPeiGfPEC/0JIpPx21BMc9V4EnkWEtrp1UZE/UhxBnn5Wl+ikhwoKfT6riR1CbTxMR0BJ47TTvKLmAjlXTvhbPGSecVIEtk5enZAYx6KqzWvSDC0SWJHDZ1JeRbqZNDGD5epiDZGcpHN/lDes5i8yYANmlwH7NtqZOnWDrWmn0Zi3//amiPycZvnWNfdvIQFsCFmt9/tzy+shZ99ahJxIZog8jd8plrJOZSALepyPgYOif6zcE2tvqUQkLlG+0EClf7MOdk1J1J2/w2pZdWtSz8z8eiK8hwhRauJYIi8JSdms5iCzXZcD0oCacqfRzvFLAeau5Izb/ifJPr1RbO57/iC/sDMMecz5wU2vr89p2SzbIAFgTNRUP5GBJcavsZBvhYirOPmTrFvjwhvF13kZe7pwZ1uUYinvEm6D6a1egu6xtiTKod/W9gs24BTx9JEwMeVugEWQulM3Qc3TEIe6Hv9abzpBHVo8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(1076003)(478600001)(66476007)(86362001)(8936002)(2906002)(36756003)(4326008)(6916009)(6486002)(5660300002)(4744005)(8676002)(6496006)(66556008)(38100700002)(26005)(83380400001)(316002)(66946007)(2616005)(186003)(16526019)(6666004)(956004)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VDYxNHduODA5Y1RsVGlENU8vWmFWbFhxbnM1cUk5THBhUmQ3Vyt6MlR4dzVy?=
 =?utf-8?B?R1FyNS9WeUxjVUt6ZU9oZjlkU2UxR2J2ams2L1JVNit4VjJwdnZnbnZWVXl2?=
 =?utf-8?B?RndqanM2ODIrejFUVEpKQzRLRTEzSEk2d0xLM0E0Ynk0WHNaOWZ2UmtKcVJq?=
 =?utf-8?B?cHlmMUcwMFU2eUN2TmJsZ2IvQncwbVFjMC9ZQlYrdGlQU0lQeUpUb3lkRFpH?=
 =?utf-8?B?NjF5bUdDbFV6KzZWNUd0bkQ2elliUW16aGo2VXByNlg4bVRCNlNvbjhNc0VT?=
 =?utf-8?B?ZEZaMVBVbUg4UDM0eGJlYjFoWGFydi9ydjF1YTlCQTJlR0dRSC80MkZNL0sr?=
 =?utf-8?B?VEt2eU9WSnNPYmZhTlRkOWpTOHdERTFKaCtFZlhRNVpZZk9XVHRUYTQ0SEE1?=
 =?utf-8?B?aEJUbTBZa3Jkc2xGMVNBdkhiak9OSStiU1d1MFFQUDRBVVhTcTZNSnFhMjI5?=
 =?utf-8?B?eXZCa3JuUFlpbXZDUGxBMm9IaUt6TUw0SXZ1OUl3cDNtajRxeG9MNisvOTdh?=
 =?utf-8?B?RFpEa3c0eXBsVGpFZUxZNXVxZTZYQ2pCOFhrSWdRMFY2Z2FZS0xDSUtiTFJZ?=
 =?utf-8?B?c0ZtZ3h5azY0L2ErYzVvd1lMVEFvdFYrNlNCUHFSbU5abUJETHFVYU5XdkN5?=
 =?utf-8?B?WjhnaEpEQkJjVER0dnByeUlYR1hRUE1uTmVYbjc3Q0UrQXhFQkhZQkIzSUJk?=
 =?utf-8?B?dkc4NTFId1MwaHpyM1NZdW84ZVVoOFFaVDJXRFpMbnJzU0l2VnlYcDJ5S3dS?=
 =?utf-8?B?bnNGOXVvU3NOelVhYWpXQkRkWm9UNDlPKzRpTk42N3l0MUJ4eUlNd2pTajBQ?=
 =?utf-8?B?Ulg4dEdlaUgwNjRlUmlVOG1lN1QxWmhjYjVmY0dOSzdrZ1A3emNhd1JHWUp5?=
 =?utf-8?B?ditUUS9LU0JNckVMNW9STEFpVGYzWW9mRWlhcW5WQU9hQktVRE9wMlgyQkpE?=
 =?utf-8?B?WHdZclpMVkx0NW14WkJTOGJQWWZ5eHN5aWRFN1M0dUNudng3KzlDbHJhN0dO?=
 =?utf-8?B?ZXRRNTNNTTY1YUtiMlNvT20rS0xJR0pRS1ROdTF5N003WUxjeENHcGxOYi8w?=
 =?utf-8?B?M2xOVXJBbXVmVEN2TUJINXNsbXpRTHRSYXJ6N3lpdjdzeXQ4bzJCZnBVVDF6?=
 =?utf-8?B?Z0JQRFNZS2dpalBxRXpMWGxlbEkvYmRlWktwelk5bnZWKzFRQkNXL1NWa1hJ?=
 =?utf-8?B?SGJ6TUc1V2srNmE1dTk3OGZFZUZrc3hNN3p2QVJreW1EUVJMTnJxNFNPMElW?=
 =?utf-8?B?MVV1OWV0SXNoYnlpSlAwT2FwNUthREd6QzhQZUsyTC9menV6ajdzdzdTbTB4?=
 =?utf-8?B?d2d3eWtveVdxemRneXNWbTY1bE9Fc2tOMnREbm54bDA5bkc2VnNjN2dSS05i?=
 =?utf-8?B?WWV1Mk90SFNYODRHLytEYm40TjJLaFFTckFhaUJpaWlhSU1sSjVQbERudGdz?=
 =?utf-8?B?TUE5VW4rcFBtRnVuN0JBc1puN2lpTm9na0krRk1uUWJKZHI3MGhFRGdPNi8w?=
 =?utf-8?B?UmkwVCtYNDg4NTIybXEwSDczVlJFWjQrYmUzQ1hGbXRVc3dGRGR2eUpkUU1L?=
 =?utf-8?B?ZUxsY2VyYU56WW5ERlFmRGh1cXJqU3FUcmFGUXhBQ1QrbjRzQjFlcTU1R3Ns?=
 =?utf-8?B?SHNCZGx4Q3Q4Rzg5VzZWZGt4WElDbE14VXVYSENWM2lRcnRpSG1BazMwWjZ5?=
 =?utf-8?B?SzZSRXdPVm9PRjZ4VTNrSzNxUG1OWEN1cDBRbVZndXhwc2VIL0ZNY3ZWMmFx?=
 =?utf-8?Q?6gotedSg4ZPVnNHIBurAnfhCGvmuXJ33YFebcOu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 460f9abf-1ebf-4ce4-7cf1-08d91b8b0dbf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 12:30:29.6793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+vAAGOKYR39RxVx8DC259yl+hCE62yg5XP/O0txNEV50b2Axmn3iClfmq2GHTq10oakq/O6UbqFxPyT+nHMlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3738
X-OriginatorOrg: citrix.com

The legacy __xen_guest section doesn't support the PHYS32_ENTRY
elfnote, so it's pointless to attempt to parse the elfnotes from that
section when called from an hvm container.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - New in this version.
---
 xen/common/libelf/libelf-dominfo.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/common/libelf/libelf-dominfo.c b/xen/common/libelf/libelf-dominfo.c
index 69c94b6f3bb..abea1011c18 100644
--- a/xen/common/libelf/libelf-dominfo.c
+++ b/xen/common/libelf/libelf-dominfo.c
@@ -577,10 +577,8 @@ elf_errorstatus elf_xen_parse(struct elf_binary *elf,
 
     }
 
-    /*
-     * Finally fall back to the __xen_guest section.
-     */
-    if ( xen_elfnotes == 0 )
+    /* Finally fall back to the __xen_guest section for PV guests only. */
+    if ( xen_elfnotes == 0 && !hvm )
     {
         shdr = elf_shdr_by_name(elf, "__xen_guest");
         if ( ELF_HANDLE_VALID(shdr) )
-- 
2.31.1


