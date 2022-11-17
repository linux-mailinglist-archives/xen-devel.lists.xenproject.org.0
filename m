Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C22AB62E05A
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 16:52:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445276.700391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovhBN-0006wW-W5; Thu, 17 Nov 2022 15:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445276.700391; Thu, 17 Nov 2022 15:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovhBN-0006uj-Sa; Thu, 17 Nov 2022 15:52:05 +0000
Received: by outflank-mailman (input) for mailman id 445276;
 Thu, 17 Nov 2022 15:52:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BOBv=3R=citrix.com=prvs=31353e2df=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ovhBM-0006ud-Hd
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 15:52:04 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6376c15-668f-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 16:52:02 +0100 (CET)
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Nov 2022 10:51:59 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB4942.namprd03.prod.outlook.com (2603:10b6:208:1ad::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Thu, 17 Nov
 2022 15:51:57 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%5]) with mapi id 15.20.5813.020; Thu, 17 Nov 2022
 15:51:57 +0000
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
X-Inumbo-ID: c6376c15-668f-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668700322;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Qt3K/tjGsrID4OSRWP2dbdWOP4OJdeeWOzH3yLoSS00=;
  b=gkjT0pVulQZF3lBj/U967HDeMRR6dmxteIWp5avoTqZqWcPF+65ngVqS
   ygvp6yeAtOEyN0cx5HZWXE8MKaLi9emMtTILJ/5pCuZiibMAsTqQ+e2lK
   +KHJoNxnV2hAgFBJmdyP7Y56PT7N3uGJqqndxIgEx9XlL+Fge0sSUuEc9
   s=;
X-IronPort-RemoteIP: 104.47.57.168
X-IronPort-MID: 85468200
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5AISw6B/xfhmvxVW/7Xiw5YqxClBgxIJ4kV8jS/XYbTApDN33mQCy
 WMWXmrUOvqCa2P3f9BzbdmzpBxT75/WmINnQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WpB4QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw3PhlO1kN9
 tYhDCkJRTaxluW6/I6wRbw57igjBJGD0II3nFhFlGicIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxuvTi7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr+SwX2rAtpKfFG+3tlnnnyVwkETMxZIVQPmub6Yh3ejCs0Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHr7m9WX+bsLCOoluaIjMJJGUPYSsFSwot4NT5pow3yBXVQb5LErOxj9DzMSH9x
 XaNtidWr4sUickHxqCq52ftijinpoXKZgMt7wCRVWWghitzaZS5fYWu5R7e5OxZMYeCZlCbu
 T4PnM32xMADC4uc0hOERuolFausof2CNVXhbUVHGpAg83Gh/iCldIUJuTVmfh43YoADZCPjZ
 1LVtUVJ/phPMXC2bKhxJYWsF8AtyqumHtPgPhzJUudzjlFKXFfv1ElTiYS4hQgBTGBEfXkDB
 Kqm
IronPort-HdrOrdr: A9a23:t01IF6qIObXlVvfHh1HGMjkaV5sDLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXbsibNhcItKLzOWwldAS7sSobcKogeQUREWk9Qw6U
 4OSdkYNDSdNzlHZIPBkXGF+rUbsZa6GcKT9IHjJh5WJGkEBZ2IrT0JczpzeXcGJjWucKBJcK
 Z0kfA3wgZIF052Uu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyR+49bLgFBCc/xEGFxdC260r/2
 TpmxHwovzLiYD79jbsk0voq7hGktrozdVOQOSKl8guMz3pziq4eYh7XLWGnTYt5MWi8kwjnt
 Xgqwope+5z93TSVGeopgaF4Xiv7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twriGknqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYdU99WPBmcUa+d
 tVfYbhDcVtABWnhrfizzBSKemXLzAO99G9MxA/U4KuomNrdTtCvjYlLYQk7ws9HdQGOtl5Dq
 3/Q9pVfPsldL5oUYttQOgGWse5EWrLXFbFN3+TO03uEOUdN2vKsIOf2sR92AiGQu1+8HIJou
 W2bHpI8WopP07+A8yH25NGthjLXWWmRDzojsVT/YJwtLHwTKfidXTrciFkr+Kw5/EERsHLUf
 e6P5xbR/flMGv1AI5MmwnzQYNbJ3USWNAc/tw7R1WNqMTWLZCCjJ2STN/DYL72VTo0UGL2BX
 UOGDD1OcVb90iuHmT1hRDAMkmdDnAXPagAZZQy09Jju7TlbLc8wzT9oW7Jlv2jOHlFrrE8el
 d4Lffujr67zFPGj1r10w==
X-IronPort-AV: E=Sophos;i="5.96,171,1665460800"; 
   d="scan'208";a="85468200"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iPEQI7Hc5FEg0+GsKiLb/vO83z7pILkxuV1yoBA6YzhVzAQPXYXTP5MdqgDfbhtF4xwt8GY0HMFID1JbpLUeDlcfZl1bp+RStWHDW9AgaF+pcqFbS3GwIF9dHQM7UsYdEztjwhTVCtNaA3Mq8oDfImpGrXjt4EfNAaZpxjbvNzjS6oQJeEMq0gM5MPyZShUp943EmN2YkslxjvKQP1u4/tueNaqYAG888N+L0G6YYAJ0nlvYX8s+2BduX4tQ9BgvM0VTSOiBBiaD5JUgWYCg2S6FfSwjzIA0OITg6qvIKaa33TBcKgQV8PbkVE+ozMb2otRCUcFfIpDGK0doUDFz6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qt3K/tjGsrID4OSRWP2dbdWOP4OJdeeWOzH3yLoSS00=;
 b=AksSWj7f2tPSvvA9mYPTHqfykbCvv+MyhGxr/8HDXboInwSGLJKUoNFTzAEJOdbWuKTndIRhtMa9zSKu3dH9cnkY/j/ToNOBKWyud+RSL25ANpX6q/o9eWewz/MYf7vBPjECFxwicG6cPRg9gVqEjB/ztPlue1daFA/37V4278z03+Jiey56FEc9CZ4XTiFxoruuJsY8x8lCyd9SjXybAPV3i7dgV0BDIYt+g1xmK44r0RT/qgMUV8ebTH6UAlJkKHzwmU7vYwRu4CRhW6c6KXFieVgcm6fRwsDELimBzUZD7BCX9oIzvHWBRI/36ySVej0JPS865GHQNfbSFxlTrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qt3K/tjGsrID4OSRWP2dbdWOP4OJdeeWOzH3yLoSS00=;
 b=sBzAoCn3nUnAWtR9juoAko5+yTb1Prg2ssGND+5iDCE6TvFmpy1aOiosdSG92hHrvbPbdbU/JZC/0eVT9U2yDc4yebWP7DHlOcDCfQxqQPNzuKRC0hFsyoxaWP1ullzBw2RIooifwuluZlvqc2F7FN+mepZdUZJapkkvO6v4DiE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH 1/4] xen: Introduce non-broken hypercalls for the paging
 mempool size
Thread-Topic: [PATCH 1/4] xen: Introduce non-broken hypercalls for the paging
 mempool size
Thread-Index: AQHY+iEUvJBYB0FmNEu7gTGG+j5kxa5C56gAgABdHwA=
Date: Thu, 17 Nov 2022 15:51:56 +0000
Message-ID: <8ca3efae-6ee2-a13a-5a1e-4810cf48ff66@citrix.com>
References: <20221117010804.9384-1-andrew.cooper3@citrix.com>
 <20221117010804.9384-2-andrew.cooper3@citrix.com>
 <50b643b9-0347-4587-0c32-7af018485911@suse.com>
In-Reply-To: <50b643b9-0347-4587-0c32-7af018485911@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB4942:EE_
x-ms-office365-filtering-correlation-id: 43f6a1c1-cf81-4c7c-1a93-08dac8b3a80a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 fPqlmf2nbg/BOxE0aC1rRp+1xpBx9VSM73lWhf5lPt0o8gOvK+3jO9DQpW7cmAz2DCYjTtjAunxyXwNY5rNu/tq3U1Sz3jfwHa4D7bG8KCqpKVF+cd/i913fgR+szCZWFgjL2ECL1v+j7e8AjdtMnEy6StQ8XXYSwLzQ5ghkbNkw82tLuJMcCNUeQ0zCMair5JXGab4/AYiJRGwXDbpg0oVsJVt3VJxjAdpp93yqRMP87Lur/BhAkLoAlS9gK7h1KXS+r++93DofqOCqOq385eC4hj3Dtg+n0cU8mHnRBaxiDtp8n+UzrWM8o++XeWQl+IgvyM8GdXOxWqnQUyMslpsqCBPxNVwT0CfU3pblMbGzTn994tk1WyNJuEhDrti1Lw0cvIF6lF+GPjgCNnmI3NN2oIn/5qll/+K2LFIn2umTgKaHJCtXleURLKQUuf/FxClWVzeIwUrQ6H5cUZegRNyqbgNY1n4loILtH9XBOEKpz8H6sTgcPUbDYwaCRWlJXp7PwQZDi03058Jviy8maSRBpPl3iBXS9rTDnfLkfRqQE8goLolJwTfeV8UYZRrBBU2olZ7ywruBSM68l482fap5xpIxQTFrnG0xCtZeGbtY2g5rDx6OfB8740S6szE2oSUmKWrhsa5DHboH/fq+FI8DMzl8wX7HBLuNgADhdSihUvP5bl+7518Nhcm+UfDH/svr6RLygYzyd8EqlP/1M/4Y7ZF9sKBT1048NVVxlkfdMLmXyTr8SQAeoSrGrhwUjxt/cxgTJSSgHI2gZr+cIQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199015)(31686004)(8676002)(41300700001)(91956017)(8936002)(5660300002)(64756008)(4326008)(66946007)(76116006)(66556008)(66476007)(66446008)(54906003)(316002)(71200400001)(110136005)(38070700005)(6486002)(122000001)(478600001)(107886003)(26005)(36756003)(6512007)(6506007)(86362001)(31696002)(2906002)(2616005)(38100700002)(186003)(82960400001)(53546011)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZWFseW9US0tOUU8valpCMXpQdWFwbjBYRkkvVVZjQlVaZ3RLZnc0dkRyNkY0?=
 =?utf-8?B?RFdXZkFlbXZLNTFUTk1ucTVCcEc3VEtnUng0OXVhNTF1STZDVjVvN3Bsbk1j?=
 =?utf-8?B?eS9KR1FvRzh4YzdweFAzV1B3WXR1ZHRDcjNCbGhZMUN0dW5MNjdQNHJuOWZx?=
 =?utf-8?B?TTRFckdlQWpTNEloV0M1Y0lpazJlalBnM2FhdERNNEhhUlJQbU1BUFNpcnc0?=
 =?utf-8?B?c2VQQXFXZmgyc2tsRmh2UHpMS0lsdFBHeFN6NXE4a0dSWUc4a29CeDJOSlNL?=
 =?utf-8?B?QXkrOWU2dlUvbEJZdHBQWjBiZzlqL1E1RzVOS2dLdDF3VE96NElPOU0vbzIx?=
 =?utf-8?B?cG1VWFZzYnZnRnVQOFZTelZESG9VcmtLZzJKZ2ZRN3RkUGxBam9hT1dUYlhN?=
 =?utf-8?B?RE5OUHFpRm92ejNHMU9hOHZHOEdtRHlQOEtPUUF4elk3S2RadlZXaXBmNFNz?=
 =?utf-8?B?SkZlOGh6NlY3T1ZSeXpZcSs5Y0dyWGRDRi90S1dDekEyWGU4ZHhwN2N5clVv?=
 =?utf-8?B?MWhVaGZaRHZEcFA4cC90b09FYzBjWVN6aUZwRDVyMjlWNTdtcW96SmREZFBt?=
 =?utf-8?B?VGdRMGdPOGFQSEI5YTU2UE5EZFZSc0YyU01TY0tqdWNha0NaSXFFZDlLWDRx?=
 =?utf-8?B?UlhmcXhVY2g3M2dYU2JSVXFCSlFTdTlseHk1RTNyRDA1OCtQeURKWTFoUU1S?=
 =?utf-8?B?SzlWVWtJSkJXcERIdnk0UmJ4eFJEbmdta0JSeHAwKzhGZjlwZDBuRnoydElL?=
 =?utf-8?B?ZVh0NzR2ZjRYcENJSTJneHVzNDJoRUpLTk1WTWhMbkMva3FnYUFzSHpwMmZr?=
 =?utf-8?B?RkZQMlBIaHpCd2Y5N0tuWVR1K2Jpb3lta1FldXN4NjNRN2l5Z1V6NjdjY2I0?=
 =?utf-8?B?U3RKU0I4M0M1bEMvTGVHb3Y5WTNhQ21TdUFkdXZUUFFuS1VFa0hiL2h2MEVG?=
 =?utf-8?B?TTltZXdwT2loNnZwcHpNVCtmcVI3ZERGZWJJSTkvWEVhaGNmcjZ2TTc4QnFL?=
 =?utf-8?B?Wk1ERGY4VEY3Y1lMTlM1SVNRQm9Dc0xUWmlpNW12L1ZDbFBCMEw1eWlnK2xM?=
 =?utf-8?B?cUhzSTMvT0hJQ0ZEc0NPVDJPR2FYKzJqbzBYREQ2aUcvRWZXQlhlZS91Y2FZ?=
 =?utf-8?B?UTRpS2dOekthb0xSL3RFTk0ram14R1UrZ0dmY3JOSDYwRDAzY0Mxek8yMnlZ?=
 =?utf-8?B?WUNONGpzZ29JazNZcHNDU2lNSHlONVpyUVBwQTBtOEFXUVowUG1RN3lMdWhF?=
 =?utf-8?B?ZjJlSE5NMUFPY011T0tseXA3Vit3QXorT3NXUUd0N1JmK0tYc3Q4aFhtM3Nz?=
 =?utf-8?B?S1ZTeE1adTZIMzRBblI5NHp3bUFTVEJadVBXWEY3dlY3SnZGV0U5Qlg5UnhY?=
 =?utf-8?B?OEFTSEVBS0gwZC9VZVZiMlRkQ2xtc0FyR3VDaitXSnRRREJJdjhUcXpGZG5q?=
 =?utf-8?B?TWpoSzVCR3pja2krTXZaMW9zV2RlRHpkUDZ2ME0xWUNPNlRSOWNTYmpNZFNH?=
 =?utf-8?B?MHh4eFdOeDhUcEQyL3JrNWt1eml4U05Wdkx4YkVQakJMYWE1dEpCc3pWWi9H?=
 =?utf-8?B?WWFJWTVuZTJMS0dySDYyRk4rVlpRV0w5bU02RU16Q0xINFBuVFJHbzBzQWtX?=
 =?utf-8?B?aktRUllOeStlTHlvNmFmOWZHMVFPREdBc2RCSlgyRUFaYlF2cFpNNngreHJD?=
 =?utf-8?B?KzBXSVY5NXRGSEpQVE5GVE43aXJGaXowSzB6WnJYMVdIc2c2QTlydkFmTEdG?=
 =?utf-8?B?eURHRWNlWER4MGd4S3JGcGJ1ellyTkZVM3orWVR0T093QlQzRnRuZE1UVVRx?=
 =?utf-8?B?Q25JQkxnMTRZaWFQMlFUdkgrb3ZMQWMvOUdsSjA3Rk83NytEdkhzaVkyQk1u?=
 =?utf-8?B?cnJmSnJ0dmwxNjN5dlczbjgyT0RMNEU0RnphVm1nZzRweW04N21FWkFlNlRR?=
 =?utf-8?B?K3JPUHNMZG54T2JXWm5RajMwMVhsVGlmZ2VndFQzaUxpVDZKMEllS0Q3Z2VQ?=
 =?utf-8?B?TExGYXJCdHAzVjJoaXlqa0NCZk9STHB3VisyUDh5RWJZZXQrZ3A3SEhZMkhu?=
 =?utf-8?B?QVVJdENFQ0JyZHM4R0tyWlFGdkVkZWwxbGlSRW4rUW9DNEdPeUxmSllQV1Ay?=
 =?utf-8?Q?CFny8EAycNoJCvPLSd+RmugaZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9FDAE8DBE6498247A26C208D2048AE86@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?MGFyMUVaK2dYcVFBekxQWnhqMk4rVnBqZlQvaXBXOUMyMzNLRGFPQ3Fkallt?=
 =?utf-8?B?d3JMa1RDbEVnVXBSSy9GcXlwVzNWNXh0NUFreHV0L08rRjhTL3h0TlF3b2Zi?=
 =?utf-8?B?OFVVcDc5RTViM3lFMTBTd1FMZ3FuYk9PTXBJajJWQk1Wak0xY2w4VUVGYXla?=
 =?utf-8?B?cFhISkJjSk1tN1UzME9FTXRweTQ1V014Vk5lRXJ6bzJlc2hqM3pGZDcxeFlF?=
 =?utf-8?B?YVZHb2VCbVNua1FMSThxMkxndi9iaEo2MFB1MkdXZTJUeHU4OTNaUEhUOE41?=
 =?utf-8?B?bXdJd0taUU9UN0dHV2M3WkFiWkdOUStPTlFHWS84SWlROHhjMWIyaEs1dG5S?=
 =?utf-8?B?bjVmUEtuTjZkUllxMVRGVzhLYzdjUWxMSTk1L1l6YnBDRFg5WXlWcWpJK2Jk?=
 =?utf-8?B?R0ZISlRUazVnTlliZXB6MjlETHNlOVhPWTFvUWFsdjRQYmVoZmd3QU9hUkNS?=
 =?utf-8?B?RllGN2Y1T3ozWExVWGN0K251KzhLWEkzc2p2SWlQaG1sSXZ5WHp6V1J3a3Fk?=
 =?utf-8?B?dHJKZTNqMmNmODFCUzdVanNlQlNGdlNiM3gwS1NBRHBNTnB2aFQ4VCtNZ2xx?=
 =?utf-8?B?TThmblhXN0VGMTIwTnRMWVJiVXhWS0JzTG1GZXhtS3VyVDRrVVJaOUMxWFd1?=
 =?utf-8?B?dkMwSER1RTYyZHM4di9YL0Q1UzNXT09XQkhZS2hmRFpxNGFCSGFtVzUzS0lR?=
 =?utf-8?B?cUtrSVBUM1FCZ0M1d0Mxc25Ed3JVSkNCeU9nSTIzVXpFV0Mzb0l3cTI4dHYy?=
 =?utf-8?B?U0hhSkRUU2dMQjBaK2Iza3NaOHduZkxRRGRUY3RSbWpXZXV3OTcyQWpZMnB5?=
 =?utf-8?B?OHo5dmwrVy9xQmZmNjBlRUlWbGZHZVdrSTd6ZXFQL1RxUFlVTm4rOThBSFlI?=
 =?utf-8?B?QXZWSFRXajNVd1EydE1MVms4cVRnOEpWeDI1RXo3dER1amgxTCtiY3ltcDhZ?=
 =?utf-8?B?dlV1d3JZVmdoQUJkR2txTXlzK1loTWVCb1hSNzVYY0FPS2ZXMTlMYUZLbE54?=
 =?utf-8?B?U2hNOVpob2EvUS9XSjFsVnRiWG85bk94TDdUYUdwNVJNRlhES1ozSG9Qckwy?=
 =?utf-8?B?OEVwOEJjRHpPVks1SEt4SjV0dkpHSEdaWjVJK2hjSDVBZXoremZPYUtQVVEv?=
 =?utf-8?B?V3djQk5Pb292d29qRVJxK0FvKzlJdkpzdVdScmpOR2JnSnJPMmlvZXpNUktB?=
 =?utf-8?B?eXVsWEg1ZWdUKzZFYWlqVXlYVkw4UTF2aWh6Ly9KN1RhVVN5TVB1YUhxQWh5?=
 =?utf-8?Q?FSe/yuDuS6wjhk0?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f6a1c1-cf81-4c7c-1a93-08dac8b3a80a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2022 15:51:56.9657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z5n5C4S94wYkCY6eCVlbL5IxCpvuoujDVo2ap3Fq+peUItLXC6+3jp/uMjrhC7ULhj/PLwH6En/ioa1z+R7iPjw9aFvQsIarkmUXJXlh37c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4942

T24gMTcvMTEvMjAyMiAxMDoxOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE3LjExLjIwMjIg
MDI6MDgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBUaGUgZXhpc3RpbmcgWEVOX0RPTUNUTF9T
SEFET1dfT1Bfe0dFVCxTRVR9X0FMTE9DQVRJT04gaGF2ZSBwcm9ibGVtczoNCj4+DQo+PiAgKiBB
bGwgc2V0X2FsbG9jYXRpb24oKSBmbGF2b3VycyBoYXZlIGFuIG92ZXJmbG93LWJlZm9yZS13aWRl
biBidWcgd2hlbg0KPj4gICAgY2FsY3VsYXRpbmcgInNjLT5tYiA8PCAoMjAgLSBQQUdFX1NISUZU
KSIuDQo+PiAgKiBBbGwgZmxhdm91cnMgaGF2ZSBhIGdyYW51bGFyaXR5IG9mIDFNLiAgVGhpcyB3
YXMgdG9sZXJhYmxlIHdoZW4gdGhlIHNpemUgb2YNCj4+ICAgIHRoZSBwb29sIGNvdWxkIG9ubHkg
YmUgc2V0IGF0IHRoZSBzYW1lIGdyYW51bGFyaXR5LCBidXQgaXMgYnJva2VuIG5vdyB0aGF0DQo+
PiAgICBBUk0gaGFzIGEgMTYtcGFnZSBzdG9wZ2FwIGFsbG9jYXRpb24gaW4gdXNlLg0KPj4gICog
QWxsIGdldF9hbGxvY2F0aW9uKCkgZmxhdm91cnMgcm91bmQgdXAsIGFuZCBpbiBwYXJ0aWN1bGFy
IHR1cm4gMCBpbnRvIDEsDQo+PiAgICBtZWFuaW5nIHRoZSBnZXQgb3AgcmV0dXJucyBqdW5rIGJl
Zm9yZSBhIHN1Y2Nlc3NmdWwgc2V0IG9wLg0KPj4gICogVGhlIHg4NiBmbGF2b3VycyByZWplY3Qg
dGhlIGh5cGVyY2FsbHMgYmVmb3JlIHRoZSBWTSBoYXMgdkNQVXMgYWxsb2NhdGVkLA0KPj4gICAg
ZGVzcGl0ZSB0aGUgcG9vbCBzaXplIGJlaW5nIGEgZG9tYWluIHByb3BlcnR5Lg0KPj4gICogRXZl
biB0aGUgaHlwZXJjYWxsIG5hbWVzIGFyZSBsb25nLW9ic29sZXRlLg0KPj4NCj4+IEltcGxlbWVu
dCBhIGJldHRlciBpbnRlcmZhY2UsIHdoaWNoIGNhbiBiZSBmaXJzdCB1c2VkIHRvIHVuaXQgdGVz
dCB0aGUNCj4+IGJlaGF2aW91ciwgYW5kIHN1YnNlcXVlbnRseSBjb3JyZWN0IGEgYnJva2VuIGlt
cGxlbWVudGF0aW9uLiAgVGhlIG9sZA0KPj4gaW50ZXJmYWNlIHdpbGwgYmUgcmV0aXJlZCBpbiBk
dWUgY291cnNlLg0KPj4NCj4+IFRoZSB1bml0IG9mIGJ5dGVzIChhcyBvcHBvc2VkIHBhZ2VzKSBp
cyBhIGRlbGliZXJhdGUgQVBJL0FCSSBpbXByb3ZlbWVudCB0bw0KPj4gbW9yZSBlYXNpbHkgc3Vw
cG9ydCBtdWx0aXBsZSBwYWdlIGdyYW51bGFyaXRpZXMuDQo+Pg0KPj4gVGhpcyBpcyBwYXJ0IG9m
IFhTQS00MDkgLyBDVkUtMjAyMi0zMzc0Ny4NCj4gV2hpbGUgSSdtIG5vdCBjb252aW5jZWQgb2Yg
dGhpcyBhdHRyaWJ1dGlvbiwgLi4uDQoNCkkgdGhpbmsgdGhpcyB2ZXJ5IG11Y2ggZGVwZW5kcyBv
biBob3cgY3JpdGljYWwgdGhlIHVuaXQgdGVzdCBpcyBkZWVtZWQuDQoNCklmIHRoaXMgd2FzIGRv
bmUgdGhlIGZpcnN0IHRpbWUgYXJvdW5kLCBpdCB3b3VsZCBhbGwgaGF2ZSBoYWQNCmF0dHJpYnV0
aW9uLsKgIFdlJ3JlIG9uIHRoZSAzcmQgc2V0IG9mIGZpeGVzLCBhbmQgdGhlIHVuaXQgdGVzdCBp
cyBhIGtleQ0KanVzdGlmaWNhdGlvbiBvZiB0aGUgc2FmZXR5IG9mIHRoZSBmaXguDQoNCj4+IFNp
Z25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+
PiBSZWxlYXNlLWFja2VkLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+IFJl
dmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ICMgaHlwZXJ2aXNvcg0K
DQpUaGFua3MuDQoNCj4gYWxiZWl0IHdpdGggcmVtYXJrczoNCj4NCj4+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9tbS9wYWdpbmcuYw0KPj4gKysrIGIveGVuL2FyY2gveDg2L21tL3BhZ2luZy5jDQo+PiBA
QCAtOTc3LDYgKzk3Nyw0OSBAQCBpbnQgX19pbml0IHBhZ2luZ19zZXRfYWxsb2NhdGlvbihzdHJ1
Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgcGFnZXMsDQo+PiAgfQ0KPj4gICNlbmRpZg0KPj4g
IA0KPj4gK2ludCBhcmNoX2dldF9wYWdpbmdfbWVtcG9vbF9zaXplKHN0cnVjdCBkb21haW4gKmQs
IHVpbnQ2NF90ICpzaXplKQ0KPj4gK3sNCj4+ICsgICAgaW50IHJjOw0KPj4gKw0KPj4gKyAgICBp
ZiAoIGlzX3B2X2RvbWFpbihkKSApICAgICAgICAgICAgICAgICAvKiBUT0RPOiBSZWxheCBpbiBk
dWUgY291cnNlICovDQo+PiArICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7DQo+IEkgZ3Vlc3Mg
dGhpcyBpcyBtZXJlbHkgZm9yIHN5bW1ldHJ5IHdpdGggLi4uDQo+DQo+PiAraW50IGFyY2hfc2V0
X3BhZ2luZ19tZW1wb29sX3NpemUoc3RydWN0IGRvbWFpbiAqZCwgdWludDY0X3Qgc2l6ZSkNCj4+
ICt7DQo+PiArICAgIHVuc2lnbmVkIGxvbmcgcGFnZXMgPSBzaXplID4+IFBBR0VfU0hJRlQ7DQo+
PiArICAgIGJvb2wgcHJlZW1wdGVkID0gZmFsc2U7DQo+PiArICAgIGludCByYzsNCj4+ICsNCj4+
ICsgICAgaWYgKCBpc19wdl9kb21haW4oZCkgKSAgICAgICAgICAgICAgICAgLyogVE9ETzogUmVs
YXggaW4gZHVlIGNvdXJzZSAqLw0KPj4gKyAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiAu
Li4gdGhpcywgc2luY2Ugb3RoZXJ3aXNlICJnZXQiIG91Z2h0IHRvIGJlIGZpbmUgZm9yIFBWPw0K
DQpJdHMgdGhlIHNhZmVzdCBjb3Vyc2Ugb2YgYWN0aW9uLCBnaXZlbiBvdGhlciBrbm93biBpc3N1
ZXMgd2l0aCBQVi7CoA0KVGhlcmUncyBubyBuZWVkIGZvciBhIHdvcmtpbmcgZ2V0IHdpdGhvdXQg
YSB3b3JraW5nIHNldC4NCg0KPg0KPj4gQEAgLTk0Niw2ICs5NDksMjIgQEAgc3RydWN0IHhlbl9k
b21jdGxfY2FjaGVmbHVzaCB7DQo+PiAgICAgIHhlbl9wZm5fdCBzdGFydF9wZm4sIG5yX3BmbnM7
DQo+PiAgfTsNCj4+ICANCj4+ICsvKg0KPj4gKyAqIFhFTl9ET01DVExfZ2V0X3BhZ2luZ19tZW1w
b29sX3NpemUgLyBYRU5fRE9NQ1RMX3NldF9wYWdpbmdfbWVtcG9vbF9zaXplLg0KPj4gKyAqDQo+
PiArICogR2V0IG9yIHNldCB0aGUgcGFnaW5nIG1lbW9yeSBwb29sIHNpemUuICBUaGUgc2l6ZSBp
cyBpbiBieXRlcy4NCj4+ICsgKg0KPj4gKyAqIFRoaXMgaXMgYSBkZWRpY2F0ZWQgcG9vbCBvZiBt
ZW1vcnkgZm9yIFhlbiB0byB1c2Ugd2hpbGUgbWFuYWdpbmcgdGhlIGd1ZXN0LA0KPj4gKyAqIHR5
cGljYWxseSBjb250YWluaW5nIHBhZ2V0YWJsZXMuICBBcyBzdWNoLCB0aGVyZSBpcyBhbiBpbXBs
ZW1lbnRhdGlvbg0KPj4gKyAqIHNwZWNpZmljIG1pbmltdW0gZ3JhbnVsYXJpdHkuDQo+PiArICoN
Cj4+ICsgKiBUaGUgc2V0IG9wZXJhdGlvbiBjYW4gZmFpbCBtaWQtd2F5IHRocm91Z2ggdGhlIHJl
cXVlc3QgKGUuZy4gWGVuIHJ1bm5pbmcNCj4+ICsgKiBvdXQgb2YgbWVtb3J5LCBubyBmcmVlIG1l
bW9yeSB0byByZWNsYWltIGZyb20gdGhlIHBvb2wsIGV0Yy4pLg0KPj4gKyAqLw0KPj4gK3N0cnVj
dCB4ZW5fZG9tY3RsX3BhZ2luZ19tZW1wb29sIHsNCj4+ICsgICAgdWludDY0X2FsaWduZWRfdCBz
aXplOyAvKiBJTi9PVVQuICBTaXplIGluIGJ5dGVzLiAqLw0KPiBXaGlsZSBsaWtlbHkgcGVvcGxl
IHdpbGwgY29ycmVjdGx5IGluZmVyIHdoYXQgaXMgbWVhbnQsIHN0cmljdGx5IHNwZWFraW5nDQo+
IHRoaXMgaXMgd3Jvbmc6IFRoZSBmaWVsZCBpcyBJTiBmb3IgInNldCIgYW5kIE9VVCBmb3IgImdl
dCIuDQoNCkknbGwgZHJvcCB0aGVtLCB0byByZWR1Y2UgYW55IHBvc3NpYmxlIGNvbmZ1c2lvbi7C
oCBBcyB5b3Ugc2F5LCB0aGUNCm1lYW5pbmcgaXMgZW50aXJlbHkgY2xlYXIuDQoNCn5BbmRyZXcN
Cg==

