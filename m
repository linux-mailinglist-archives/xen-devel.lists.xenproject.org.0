Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0BC65F6C7
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 23:28:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472204.732347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDYil-0001rh-3R; Thu, 05 Jan 2023 22:28:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472204.732347; Thu, 05 Jan 2023 22:28:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDYil-0001pH-08; Thu, 05 Jan 2023 22:28:23 +0000
Received: by outflank-mailman (input) for mailman id 472204;
 Thu, 05 Jan 2023 22:28:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+KT=5C=citrix.com=prvs=36272ec6f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDYii-0001p8-Qx
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 22:28:20 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fce2a92-8d48-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 23:28:18 +0100 (CET)
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 17:28:15 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5569.namprd03.prod.outlook.com (2603:10b6:208:287::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 22:28:11 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 22:28:11 +0000
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
X-Inumbo-ID: 3fce2a92-8d48-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672957698;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=i+0q0drz1PnYzIVvpMPaNg9lgG7Tam6XO5zaVwxxGiE=;
  b=L7Xh1nKT3WVRrlE4RciWyMn3y9PikKXeuxMcJsIEe/bsEanMmI+UmNvx
   mpaVUD2pvtZZa3ZmHy6NbfdC5HdOH2MeOdNpxWg6vD5/dPrGcuZHGIc+A
   cerGEOFkx8FUvMr/dRykJTOOZojQurXKqyBEcSVJBGc4vq+k5M0fMX7Cf
   4=;
X-IronPort-RemoteIP: 104.47.55.172
X-IronPort-MID: 91430264
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wiET/qBXMbvdIhVW/+Piw5YqxClBgxIJ4kV8jS/XYbTApGsg1GRTx
 2scWj/SOqvbNGfwetgjbYXjpksO6p/TxtZgQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6p4GpA4wRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw2utICmhVx
 b8hAx8VbiyFqf+m3Je/Y7w57igjBJGD0II3nFhFlGucJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuvDK7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr6WwXijAtxOfFG+3r0xg3eamWYyMzg9VleJg9aQh3S0As0Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBqW1qPe7gKdB24FZj1MctorsIkxXzNC/
 kCNt8PkA3poqrL9YXCA8raZqxuiNC5TKnUNDQcUQA1A79T9rYUbihPUUs0lAKOzlsfyGzz73
 3aNtidWulkIpcsC1qH+91aXhTup/8LNVlRsuV+RWX+55ARkYoLjf5av9VXQ8fdHKsCeU0WFu
 38H3cOZ6YjiEK2wqcBEe81VdJnB2hpPGGe0bYJHd3X5ywmQxg==
IronPort-HdrOrdr: A9a23:5z2GP67If76j9ysXNwPXwPfXdLJyesId70hD6qm+c20tTiX4rb
 HXoB1/73XJYVkqKRQdcLy7Scu9qDbnhP1ICOoqXItKPjOW3FdARbsKheDfKn/bexEWndQtsp
 uIHZIObuEYzmIXsS852mSF+hobr+VvOZrHudvj
X-IronPort-AV: E=Sophos;i="5.96,303,1665460800"; 
   d="scan'208";a="91430264"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zrb9IreDg66tjwfw1OkaJB+jjOghiDSYRM2vPTx61fiYRuQP88+ePftaMXsQBH7q6NptTGAzj7i313qvAx1uxZ7IIeZAgh7uHrx0FVqOA9jCNLkL8nOg0LS3PVAkRddDQ8KyX+Y+sGG2L5WvjZ8sQMW17X9QGer4Gd+jgdj4eNTW7oMyd0H/eV9s/F4ZNhySG2DkQyaXzxxelxU1sS9wVH1aECJQfDc/T1I9ArqCNbAquZSRL16tyWjE2F8Nby60UMSqHOK+g1JyjwU3x8EE3DrNH2JKENlNrqI1Snr5TTZ+tyW46+a22rX5V6EeN74SkicpGj6C4+nZ0/3i2zm+gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+0q0drz1PnYzIVvpMPaNg9lgG7Tam6XO5zaVwxxGiE=;
 b=PZ0g6YEEIh7hXrQbCWrB9z1NAEBfTf2KCL7tBdDvmHBbfFK4+LZ1c7UyhpztHJM41qsBeZ4wS5gjUyVExpKukv+MLxhfMKQlJLCh3A9sAgHncY1yqp+wN2rpjkl8ZKBcnizxxwVWMt/4AQ7LdnHN9/g0lK2CCtEEC6zH9N03KUxQ4p5msV7+5G1fSCl/JKKkDV2PCbgbd0f4qgxQ6NkzWZjXQMr2/j05d5WqXW4WMmS8SOb6+R6EGR85cbfNny6fsfyCqdRxxde5CaNLs9Mzzb/J+2R7cXtZ65XW5x7148vtlgiaR0H8xpjTcytwLu38cohCENh4qau0qEDwfoFgFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+0q0drz1PnYzIVvpMPaNg9lgG7Tam6XO5zaVwxxGiE=;
 b=uZAKkSzuD5sIoLORsSwUOQfzrOpRNOVJNAtok8NqLQd56X5cxS+31tA62uzO8H5P7fCDWOctpKbSWu+xU8M9ljYNZrPLq2d5bPstFIQO4/DA9Cw5la6crYYPPXHds8D552DeVR56L7tPfG1AoRKAqKTsfk6f9kEVB26HiKiapEc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 4/4] xen/version: Introduce non-truncating XENVER_* subops
Thread-Topic: [PATCH 4/4] xen/version: Introduce non-truncating XENVER_*
 subops
Thread-Index: AQHZH69eYU4qCMuPJUaHOPPUV+yM+a6OfdiAgAAZEwCAAOVUAIAA7l0A
Date: Thu, 5 Jan 2023 22:28:10 +0000
Message-ID: <63789ce5-5dff-c981-4127-d1ef3227595e@citrix.com>
References: <20230103200943.5801-1-andrew.cooper3@citrix.com>
 <20230103200943.5801-5-andrew.cooper3@citrix.com>
 <a0cb9c83-dc4d-5f03-0f65-3756fadfde0b@suse.com>
 <9c9cedd5-cca7-95d4-00bb-f34a56de2695@citrix.com>
 <f90111d0-b94e-8127-3b13-fbe3558d53f7@suse.com>
In-Reply-To: <f90111d0-b94e-8127-3b13-fbe3558d53f7@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BLAPR03MB5569:EE_
x-ms-office365-filtering-correlation-id: b2332e90-9cc2-4dfa-6863-08daef6c20b8
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +8VM/PAO9Hrylt7YNfVEZ6AKAvBUnxz1pNTlPNr2ICjUwtI8H3aH1F0xpa4uxzdXul88dG3+g+9Ki9gCqqYJB0Ciq03D8d4wMjhjaAYWKbgPb33R4/tH0Rhl3i+mTlqW0lRFwakqR6Qdcqs2YkfcIft8z3OOkZGynCMwjFnqBhaieEzc3ZbqjvYJTBMH3F23TnqgkFhVuX61Fd34OdkrR0yTAj63aFV5qIGtSKN9deBBWqXJ7F2VpYancW/AhkjmY2JnSdTEelzqFIpu5J61FR+zNOZGl8wsSg4L+15AIpeqBOlYdoifeLm7kC90SuLE81bOe1w9Msl69MK9rLTDjDgM+wpnMllh3zaOfG4ABgJBnPOflaYsnljU2YML+yPqYCg8XkDyvZarPl6mP0AKDg8t3cjkN9fHhxEx+nLQnRT9oTjmGt3DpRiMh0pbcEfbuefW+1+Wvynhxokc2NHt96pFScFy+xY+z2wL+vnwPF4ShhtwZgjebus6QGwQYuwdJ04/sA8nTtCHUr5vld9EEqM8miZ3u7Xad/qF7oKNJ/Abbho/IFxpLQ5YLqiA9FoGgri60JyxmI9vWItft8iMS7ccjoaULj27qpruo47eOeT8JCwfcbum5/C0dEb1PMnlLqD7CuQDJh1c1vSsnVT/LpSshZyWBpoDQ5mXhYWtoD24TW3owAdjCE04RGvbSjntT/sNo0smFAvu0gCmE2ralgSe3C4uw9ixl2TbPARS+qPCJEgv2N5sJLa8ewzW63zNQYJHRNkUdjTu8Mb7KsN8cQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199015)(2616005)(83380400001)(31696002)(86362001)(38070700005)(122000001)(82960400001)(38100700002)(36756003)(2906002)(6916009)(54906003)(66899015)(5660300002)(91956017)(4326008)(64756008)(8676002)(66946007)(76116006)(66446008)(66556008)(66476007)(8936002)(316002)(41300700001)(478600001)(26005)(186003)(53546011)(6486002)(6512007)(31686004)(6506007)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZDQzaWZrNTYrZmhWcjJoQUkvU0h3ZTg1SkxUbHozaW9hRU5LTlpzTmxhNlo5?=
 =?utf-8?B?N0VteE1TMWF6T0I2ZTFYVjkxYTZIQThFaHU5YW5YdCtrT3hRVzVTd1R4NkF5?=
 =?utf-8?B?U3R6bzlpdDN1ZjBhblZVRHRjakhmeFpKbWVEMzRhS1V1STlydlZJV0k0bDM1?=
 =?utf-8?B?Q3Q2MXA1UTZCZU1Bc2puV1lTNXlLU2N4ei80TWRaSEFjeGk2MU5Ub1pqaFl5?=
 =?utf-8?B?R2dWSUNPWVB3KytzdnhkTUR0SklFRXRPaDNGc1h5aW5hbk9EY0ZLdUdLUUdF?=
 =?utf-8?B?TExOajNzeTEyNy9ETVVtVWN4WlNZY3FvTWJXODRyYXBpZzY0a1NNVGRuR21O?=
 =?utf-8?B?Q21JUmErOGcxYnFtRU5SVVpoL0lMQm5XYXpxSElRS3ZBM3VyUkQ4TC8vNUgx?=
 =?utf-8?B?anUvZzdvWVJjUUJZQUJnZmdLdGg0Vnd4WksvSkZ1QnRadURiOXJoZHZQbkF4?=
 =?utf-8?B?K3o0VDZUN2dUUU15UjcwRllBczYvdDZPOXlUZVhBSS9VVWNVRHZkNUIzSis1?=
 =?utf-8?B?NzM1cW1YOVkxckRxSllYUzVOdEx6ZW12djJkamtyYlFLczBlSVhQUC9jcEtj?=
 =?utf-8?B?TFR3NGFmRDBuZ3RPNDFTRmltbldyNVB0aWZZaTBXQ1J3WlkrZHQ1QS9CNmR0?=
 =?utf-8?B?aEZZNURmT3ZqVCtlMUVmOUliN3l3NC8yQ0plV0xLeG1NWVQ0NDUxWDBCZ3R6?=
 =?utf-8?B?K0cyWERpTnhmbGpycHhHZ213cytIcm5aMzJNUTNRd2t1S3BsamRiZi84S0Vw?=
 =?utf-8?B?Vm1OVnlxQTMrYkdKbHMwRlZjWnIxZWVNNXVmOXBhYmxiMVJvWHRuWnFvZDFy?=
 =?utf-8?B?cDgvWUdKbDY3R080NzBEYk9uU1oxaUlmS3VGazJJOFdYMTVnTDJmYndqL2dL?=
 =?utf-8?B?cVVFdUxZdWlZaVcrZGxCTVZFRk5LaXoyYjd4dms3SHpVd0tiV2RFYWMramJU?=
 =?utf-8?B?dU81VWFma1pLZm9OUlQ4SXd5d3VqS0MwWFo3U0piMlBjNDdneW5nK3djR0Ux?=
 =?utf-8?B?OGRrMHNXMGhrQkdJYnhUWUMyaDBzSCttWFZXVVc4VWZuck1ucldnN1ZyRkwv?=
 =?utf-8?B?NzZnZnh5bkZiVjNxR3M1YW9XK3lCWjB3WmRpNDltTnZxSndrMy95S01pT0Yz?=
 =?utf-8?B?andJejdrLytwSEF0SWM2RVpJOFlibUVZVk5ibFRHaU1Mak5GeXNSbGUwajFN?=
 =?utf-8?B?Q1Z1eVpaVDhWVThmdy9HejFIdlYxR1I5azQwVXpMMUJkVnh3UllTckVhYWxO?=
 =?utf-8?B?c0ZpZ3JJLzZSR09EZmNTdnZPL1IxOEdoOEdDemRLdUNMeWNtQmViRHI3RlhB?=
 =?utf-8?B?SU5tck5WSDBYalpKUHdHaU9lUjAxZmkzQXFlaG9MWWFUSDl5TSt6OENyV00x?=
 =?utf-8?B?RHl4SGNNeU9NT0VTV0N2UzdoNDdnNUpYUDVsU2lsRElpUXpBeFVOR2hYT1pZ?=
 =?utf-8?B?UFArNGFKSlVVK0RRMkU3L1dsTjMxL2tmTVV4M1VqTlhUOFBzUWRTOHhmcG5h?=
 =?utf-8?B?OHJMZTBFL0xyOUZ2bEpMbkNLTUhKbUZpdkJGM2dUbjFFZHNaMFY4OVFtTjVX?=
 =?utf-8?B?bUFoYWU3bzdiVnliRjlieHpaZXpwN2srUGFIN3dqeUhzL3p3Z2g5OVNCR245?=
 =?utf-8?B?b1dvcGk0T1RlR3NwdDROd0hab1Nlam1JcmVJVEFTYXNiZDlIS0VVc2thS3Bm?=
 =?utf-8?B?YldJWWlZS09KMXZOQWpTelZuTWNsRWtNdFpLWmJwdTNsaWVOaDJpVWJFZ1gz?=
 =?utf-8?B?TG1RVXN2ejNId2FyeXpMY0lXdkF5M2xFblM5VDkxNEVjUWpGbW1hUVhySUtr?=
 =?utf-8?B?clVaNGdOS0JTcTdrbTNGSGdXQkVzb0NKMnNZeVRHNWxzcnFtMmptYUJrMFVt?=
 =?utf-8?B?V1NpRlNiL3hmNGNEQ2JZakJ5bTBPanRGVm5aYURtYkxGVGt1aUcxcjRMK0Rn?=
 =?utf-8?B?dU5YVDAzQVNFRG40U3RETjFEb3Z1TjQ5Z0hiWEVEK0ljRUtSR1l5RW8yMVI5?=
 =?utf-8?B?UW80TkdGWmwyRCtmYUFrTmNVeXZRMjlNTXpUVkdDYW8zeE0vTE0za2JYajBK?=
 =?utf-8?B?V3JnVHA5Y0w2ZURJaXg2R1ZZOFFHMGdZa0Nva3RNTER4Tms0SVduVzZEdTdO?=
 =?utf-8?B?TGdCUXM3TnlObis2SnVaZzNUVmx5cGoveXoybGZzVW1tUXBUV2NLbXJJRGQy?=
 =?utf-8?B?UEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E9623949BD3074388EC03CC50EF2EE8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QigMAkdvPPYWVCNoEj4GeJ81KHkEhccDbwreKnpg4dmaRT5iOS8UZIaB1FyUW3qzEgpKlf39PsBzDhgugcHGJYbvfloSMHDIX3Ka7TA7+BFLgLpEvz5OVCsJLXKCsv5Ict3c3si4JMBl/7Bui760HLrwZA5gFEOHSyt/Je8IH/2SfoEjCSsskDSSWzZaTP5Cg2iJ7p6CyKLAaAGz7+rmTsXLYMtEoCKzde/j6KIromPMellAH0PePdnFZuc6Aar/47qleOW7YUHLrjevT59U0XNwf9rsUER4C0kUIKHVc4+Vrpy2KyIWRHtlljFNNkIxdlk2QENn43873ezZ+XVxaF5OannQx01uNMi0LRYKieQ7EcR4ijU65iYKzfDX6MF/fAsVpnU1XUBlhhjloQ1XmFoN+RYfnZKeaGxNfnElPzw3VtZh3qW6PA3EmQIsi8VnDJenciw4sxdceMT42FAmfxFKsP1ZDVkYx6DIoHwk29adQ+0fONo8SHQZIncqWt4zcOsLQDmftiVpxId8FnXDW03m+Z3WRBnH3w3FPPj5G7G6KQVxu+7xQswZUNJtDYgG1WSz8hvkDRkOpPrA4OXqyA9FCETUULT6Rle5D5mOyPgitQPCeFQVY02m9hiU8M+S0Rqm5INADYdOj64ymKCh38oMc9yt7KwCqaSmQjtcC0v6vFTIYYKz3m0Kq7cIQ6tG/T/+o4bOxLqS/sDLSYK7/+M47+jeo9mQ1FMtGcotMQ2ixUgWBb8sVILPqvgTO9ILU/HphuG7FKY3JrBeoS9iSs5FyufEfGyCOeT5RlpZq5Ms/npitoAR65K3gBHLjBDU03vzM7pAfcDpZQomf/IfeF5RmIqC50THRf04BaHGOCpeMjVJwHRZ5oojWRxU6Xmi
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2332e90-9cc2-4dfa-6863-08daef6c20b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2023 22:28:11.0184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wD4otfobODsK4ugo1DAob0VhjshZe2/+E4TFYI6mYy6WyIr0ND+IQ3ERGVmYSE9VMyCmyHut1tE39WgQ3FT50F5KyEbVB0gPP9fijUQuArU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5569

T24gMDUvMDEvMjAyMyA4OjE1IGFtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDQuMDEuMjAy
MyAxOTozNCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDA0LzAxLzIwMjMgNTowNCBwbSwg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMDMuMDEuMjAyMyAyMTowOSwgQW5kcmV3IENvb3Bl
ciB3cm90ZToNCj4+Pj4gQVBJL0FCSSB3aXNlLCBYRU5WRVJfYnVpbGRfaWQgY291bGQgYmUgbWVy
Z2VkIGludG8geGVudmVyX3ZhcnN0cmluZ19vcCgpLCBidXQNCj4+Pj4gdGhlIGludGVybmFsIGlu
ZnJhc3RydWN0dXJlIGlzIGF3a3dhcmQuDQo+Pj4gSSBndWVzcyBidWlsZC1pZCBhbHNvIGRvZXNu
J3QgZml0IHRoZSByZXN0IGJlY2F1c2Ugb2Ygbm90IHJldHVybmluZyBzdHJpbmdzLA0KPj4+IGJ1
dCBpbmRlZWQgYW4gYXJyYXkgb2YgYnl0ZXMuIFlvdSBhbHNvIGNvdWxkbid0IHVzZSBzdHJsZW4o
KSBvbiB0aGUgYXJyYXkuDQo+PiBUaGUgZm9ybWF0IGlzIHVuc3BlY2lmaWVkLCBidXQgaXQgaXMg
YSBiYXNlNjQgZW5jb2RlZCBBU0NJSSBzdHJpbmcgKG5vdA0KPj4gTlVMIHRlcm1pbmF0ZWQpLg0K
PiBXaGVyZSBhcmUgeW91IHRha2luZyB0aGlzIGJhc2U2NCBlbmNvZGluZyBmcm9tPyBJIHNlZSB0
aGUgYnVpbGQgSUQgYmVpbmcgcHVyZQ0KPiBiaW5hcnkgZGF0YSwgd2hpY2ggY291bGQgZWFzaWx5
IGhhdmUgYW4gZW1iZWRkZWQgbnVsLg0KDQpPaCwgc28gaXQgaXMuDQoNCkknZCBmYWlsZWQgdG8g
c3BvdCB0aGF0IGxpYnhsIGZvcm1hdHMgaXQgYXV0b21hdGljYWxseSBvbiBiZWhhbGYgb2YgdGhl
DQpjYWxsZXIuDQoNCj4+Pj4gKyAgICBpZiAoIHN6ID4gSU5UMzJfTUFYICkNCj4+Pj4gKyAgICAg
ICAgcmV0dXJuIC1FMkJJRzsgLyogQ29tcGF0IGd1ZXN0cy4gIDJHIG91Z2h0IHRvIGJlIHBsZW50
eS4gKi8NCj4+PiBXaGlsZSB0aGUgY29tbWVudCBoZXJlIGFuZCBpbiB0aGUgcHVibGljIGhlYWRl
ciBtZW50aW9uIGNvbXBhdCBndWVzdHMsDQo+Pj4gdGhlIGNoZWNrIGlzIHVuaWZvcm0uIFdoYXQn
cyB0aGUgZGVhbD8NCj4+IFdlbGwgaXRzIGVpdGhlciB0aGlzLCBvciBhIChjb21hdCA/IElOVDMy
X01BWCA6IElOVDY0X01BWCkgY2hlY2ssIGFsb25nDQo+PiB3aXRoIHRoZSBpZmRlZmFyeSBhbmQg
cHJlZGljYXRlcyByZXF1aXJlZCB0byBtYWtlIHRoYXQgY29tcGlsZS4NCj4+DQo+PiBCdXQgdGhl
cmUncyBub3QgYSBDUFUgdG9kYXkgd2hpY2ggY2FuIGFjdHVhbGx5IG1vdmUgMkcgb2YgZGF0YSAo
d2hpY2ggaXMNCj4+IDRHIG9mIEwxZCBiYW5kd2lkdGgpIHdpdGhvdXQgc3VmZmVyaW5nIHRoZSB3
YXRjaGRvZyAoZXNwZWNpYWxseSBhcyB3ZSd2ZQ0KPj4ganVzdCByZWFkIGl0IG9uY2UgZm9yIHN0
cmxlbigpLCBzbyB0aGF0J3MgNkcgb2YgYmFuZHdpZHRoKSwgbm9yIGRvIEkNCj4+IGV4cGVjdCB0
aGlzIHRvIGNoYW5nZSBpbiB0aGUgZm9yc2VlYWJsZSBmdXR1cmUuDQo+Pg0KPj4gVGhlcmUncyBz
b21lIGJvdW5kYXJ5IChwcm9iYWJseSBmYXIgbG93ZXIpIGJleW9uZCB3aGljaCB3ZSBjYW4ndCB1
c2UgdGhlDQo+PiBhbGdvcml0aG0gaGVyZS4NCj4+DQo+PiBUaGVyZSB3YW50cyB0byBiZSBzb21l
IGxpbWl0LCBhbmQgSSBkb24ndCBmZWVsIGl0IGlzIG5lY2Vzc2FyeSB0byBtYWtlDQo+PiBpdCB2
YXJpYWJsZSBvbiB0aGUgZ3Vlc3QgdHlwZS4NCj4gU3VyZS4gTXkgcXVlc3Rpb24gd2FzIG1lcmVs
eSBiZWNhdXNlIG9mIHRoZSBzcGVjaWFsIG1lbnRpb25pbmcgb2YgMzItYml0IC8NCj4gY29tcGF0
IGd1ZXN0cy4gSSdtIGZpbmUgd2l0aCB0aGUgdW5pdmVyc2FsIGxpbWl0LCBhbmQgSSdkIGFsc28g
YmUgZmluZQ0KPiB3aXRoIGEgbG93ZXIgKHVuaXZlcnNhbCkgYm91bmQuIEFsbCBJJ20gYWZ0ZXIg
aXMgdGhhdCB0aGUgKHRvIG1lIGF0IGxlYXN0KQ0KPiBjb25mdXNpbmcgY29tbWVudHMgYmUgYWRq
dXN0ZWQuDQoNCkhvdyBhYm91dCAxNmsgdGhlbj8NCg0KPj4gQnV0IG92ZXJhbGwsIEknbSBub3Qg
c2VlaW5nIGEgbWFqb3Igb2JqZWN0aW9uIHRvIHRoaXMgY2hhbmdlP8KgIEluIHdoaWNoDQo+PiBj
YXNlIEknbGwgZ28gYWhlYWQgYW5kIGRvIHRoZSB0b29scy8gY2xlYW51cCB0b28gZm9yIHYyLg0K
PiBXZWxsLCBJJ20gbm90IGVudGlyZWx5IGNvbnZpbmNlZCBvZiB0aGUgbmVlZCBmb3IgdGhlIG5l
dyBzdWJvcHMgKHdlIGNvdWxkDQo+IGFzIHdlbGwgaW50cm9kdWNlIGJ1aWxkIHRpbWUgY2hlY2tz
IHRvIG1ha2Ugc3VyZSBubyB0cnVuY2F0aW9uIHdpbGwgb2NjdXINCj4gZm9yIHRoZSBleGlzdGlu
ZyBvbmVzKSwgYnV0IEkgYWxzbyB3b24ndCBvYmplY3QgdG8gdGhlaXIgaW50cm9kdWN0aW9uLiBB
dA0KPiBsZWFzdCBmb3IgdGhlIGNvbW1hbmQgbGluZSBJIGNhbiBzZWUgdGhhdCB3ZSB3aWxsIHdh
bnQgKG5lZWQpIHRvIHN1cHBvcnQNCj4gbW9yZSB0aGFuIDFrIHdvcnRoIG9mIGEgc3RyaW5nLCBj
b25zaWRlcmluZyBob3cgbWFueSBvcHRpb25zIHdlIGhhdmUNCj4gYWNjdW11bGF0ZWQuDQoNCkkn
dmUgbGVnaXRpbWF0ZSBjdXN0b21lciBidWdzIGNhdXNlZCBieSB0aGUgY21kbGluZSBsaW1pdCwg
YW5kIHJlYWwgdGVzdA0KcHJvYmxlbXMgY2F1c2VkIGJ5IHRoZSBleHRyYXZlcnNpb24gbGltaXQg
d2hpY2ggSSdtIHVud2lsbGluZyB0byAiZml4Ig0KYnkgc3RpY2tpbmcgdG8gdGhlIGN1cnJlbnQg
QVBJL0FCSS4NCg0KfkFuZHJldw0K

