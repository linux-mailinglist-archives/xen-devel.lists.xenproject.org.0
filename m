Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADC765F152
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 17:40:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472079.732198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDTHc-0003Mu-Cc; Thu, 05 Jan 2023 16:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472079.732198; Thu, 05 Jan 2023 16:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDTHc-0003KD-8Z; Thu, 05 Jan 2023 16:40:00 +0000
Received: by outflank-mailman (input) for mailman id 472079;
 Thu, 05 Jan 2023 16:39:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+KT=5C=citrix.com=prvs=36272ec6f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDTHa-0003K7-4E
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 16:39:58 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9476fed6-8d17-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 17:39:55 +0100 (CET)
Received: from mail-dm6nam04lp2041.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 11:39:51 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5133.namprd03.prod.outlook.com (2603:10b6:208:1a5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 16:39:48 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 16:39:48 +0000
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
X-Inumbo-ID: 9476fed6-8d17-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672936794;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=KrNF1Nng7ydDEhClHRLc+rGtl/F90VRQU6sC1aXF9SQ=;
  b=Qsk2H+htkcuM4bufC4cTU+oicWBddNQaMmAjTPraVfbsUc5P70AtlVrM
   BJbC4qAyv/+J8m2Nn3q67EOHQRkdZNQk+U7LymJSrnUh1zlAOI0jX6IGl
   wowvsHO9e6hXVlYlIkFj9kd+O+jCsdPnaBZU9fhRzFo3FufipODg9I7cc
   0=;
X-IronPort-RemoteIP: 104.47.73.41
X-IronPort-MID: 91384130
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ubANwaJLze2yMEjBFE+Ra5QlxSXFcZb7ZxGr2PjKsXjdYENS1GcAy
 2YZXm3SPP6NamOgeYonYNyxpBgF6p/VzoJrSVBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mhA5wRjPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5uK2xTs
 tAYEglVa0G4rtqw8Oyads9F05FLwMnDZOvzu1lG5BSBUbMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VspTSKpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eexHirBNtJTNVU8NZTq3OJm1Y1FiEnVFjkotKTyQ2jQ/B2f
 hl8Fi0G6PJaGFaQZt75Uh6joX/CvQMGXNFQEOoS5wSEy66S6AGcbkAGRDNcbN0ttOctWCcnk
 FSOmrvBDztluqyYUnKZ+7Kdqxu9PCEUKSkJYipsZQIB4sL/qYApyBzVR9BoEbWdkdH+Xzr3x
 liipy84gbIRgccV1r6T8lXOgjbqrZ/MJiY3+wHWU2SN/g5/Iom/aOSA8kPH5PxNKIKYSFipv
 3UencWaqucUAvmlmy2ERuEQF7iB/febNybdh1UpFJ4knxy99njmcY1O7TVWIEZyLt1CaTLve
 FXUuw5a+NlUJnTCUENsS4e4CsBvwa2+E93gDqzQdoAWPsE3cxKb9iZzY0LWx3rqjEUnjaA4P
 9GcbNqoCnEZT69gyVJaWtsg7FPi/QhmrUu7eHwx503PPWa2DJJNdYo4DQ==
IronPort-HdrOrdr: A9a23:Rj36s6x+2M8xv+E689KzKrPwKr1zdoMgy1knxilNoH1uA6qlfq
 WV98jzuiWatN98Yh8dcLO7Scq9qBHnlKKdiLN5Vd3OMDUO3lHYTr2KhrGD/9SPIVybysdtkY
 tmbqhiGJnRIDFB/KHHCdCDYrMd/OU=
X-IronPort-AV: E=Sophos;i="5.96,303,1665460800"; 
   d="scan'208";a="91384130"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/BT0ei8KvpBcUPIEQm/KsC4nKi4tAxB4RHvULPE8icLZggMIAN0Z5UHVl7SymfsDgFCuqUyaMionxcINob1Ive3GkepyZOUqycjsUN+t4O6o9kABmtxhYafIs6RluVzsxUSW9/O6jtvEzKHbOMKvLksH3X+ghjUsUvueGcCIapPMrow4B4u2wo06qvn4QFwzWnbhSFi/cBUtO2yq/drh8FAPK0SMJmSytGJw5EQ71t86CF0JuxH419RoJRWTTSsHXNgm1pIi2dlzrP7Zu7bBIYLNHAp2bSoouzPDRK5PALowwsE2SOGY+qepBoXilhpLmWT2ph9SlNcGD41jpBMcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrNF1Nng7ydDEhClHRLc+rGtl/F90VRQU6sC1aXF9SQ=;
 b=XAON5OMb1JLYkiekyqIwvfg3w9zt6FA4TKLqSdadSYFiUIftPJUyOr+lqlnRWIWFnDrAQGQJv4JHaWn8fY//XoifJ+P5GClQpF1/C4YKdZeEJ2H3EtUx+h1enkt5493EkEE7IgMcatQaZBHmm6qZTDKbjR5wPpiDl9V9Tysi5rQTA7p9Y/r7XnwIeSEV+rbpY8mMYIMYmTUCqSFkZSsZtyMinGJ7+y+tiBXUw0EH1Tst7ujRuuB8a4QLt3S52QhU9RIUhffUx9Uufd97rzClhOmP7ca6UuNSAJ02sbZL0Hxmssz+SlFxXgeTrGq5UhodRN/jl/MNUb5byHPj5a2EPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrNF1Nng7ydDEhClHRLc+rGtl/F90VRQU6sC1aXF9SQ=;
 b=v/pOvXVjz/tlF6DDFEPTDb4dgox4gi2gmIGTnM9YdRjktP9GFAv1Q5Kc+m3N+J6J9CGuUX4SkmsijIcjR+gXrBE/q96RHi9RXsI96OIQeJQoQ6XjWLVBUZJHcfU2/XvpUTk3ImEvWaXK08TgizVT293yOf8GSSkMexol437zAYE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Oleksii <oleksii.kurochko@gmail.com>, Jan Beulich <jbeulich@suse.com>
CC: Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Julien
 Grall <julien@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 1/2] arch/riscv: initial RISC-V support to build/run
 minimal Xen
Thread-Topic: [PATCH v4 1/2] arch/riscv: initial RISC-V support to build/run
 minimal Xen
Thread-Index: AQHZIP2Dn/VS+v8CxEaK8nfj7fmLt66P1KmAgAAjsICAAAYtgIAAA8sAgAAEWIA=
Date: Thu, 5 Jan 2023 16:39:47 +0000
Message-ID: <ae6a5904-31e8-ad56-45d4-a5a7467eecb9@citrix.com>
References: <cover.1672912316.git.oleksii.kurochko@gmail.com>
 <ef6dbb71b27c75fe0dffb72d65ab457d27430475.1672912316.git.oleksii.kurochko@gmail.com>
 <591d6624-2bd2-93f0-f5d6-760043230756@suse.com>
 <01888162-49fb-a280-a088-5e81edff3919@citrix.com>
 <439a5b7624dbf4d4ff6acbb9b3a6f15b777ba0fc.camel@gmail.com>
 <8ab7b45a75cdfa332954c8a112cf9b54b4d35c62.camel@gmail.com>
In-Reply-To: <8ab7b45a75cdfa332954c8a112cf9b54b4d35c62.camel@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB5133:EE_
x-ms-office365-filtering-correlation-id: 2923fe1d-be79-4fb7-4014-08daef3b757a
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Pm7Ix79peBDskOd23e6MYcxAAIPGojji3Cxzxi7GUSai3YJSekgqiSVqdWX6V8zl2TdZ8SJUGJyOSr5qVHTy0qysjSzDRI2ZHyWZ1ROJDAC3pzlt2xehrtTbnH/IetLHwOZVuGctpPGd0YiGVB8peBZGAYbCmnYMvN4B6SskkfaLOdCphJI1OMhSfIUjaKW5EFLT+wHDoAgxectiDeIG8jj7gcNHaweMzv0l/vTrOpcX6jtz7DkRriimUPFv0so+RvK0ROVFfvBAJj2GmdmuiJPeICL6QJm/ccEzJVnqUGIdARhRUs7bjFpiG0v50J3rmnMp+RlW6hKT1Et/8fAVcBtocEnKco/cQPpulY3nc3fTgsTEbpHj8QkinDpMq6P5rkD5Qgz9mt7854UcWvs77G7qM5KTqcsHMb8Lcsm+zImUuVsgkCIwqoTJ0yoSwlUuBc6oyfhcZEFvJrFHN+CFSJyv+iKALWI0hiR5aC0L4WF7Ecbknx6qoOdmlgAeoU0rVKCCB/FaF9U0v2HgYf4Q1pp7g6jmcREMkHPe/HJKBtyeJKYGQGYkq/8DOU0CyzaupHUpAMgQ4xe2dPK+k/mVi6F2WHH+JICA/RhvAIE2FhNMgHRpQPkhSIYlpNnr+Gezu5wuuH2bXb1G6IoIhQVoD8IWDm4GrfDpusV8+IZXiFDMqdGpZ5iv6jMV1V+XGVmMHL7yGldu0MqKv6GN1qU8CWJMiMxiN+AXScqJ0YsmVXG+Imlifl/UMekZr1AGORtJ156L1UzsBMjOxuMoMIS/0Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199015)(186003)(6512007)(26005)(83380400001)(53546011)(6506007)(31696002)(86362001)(38070700005)(36756003)(122000001)(38100700002)(82960400001)(2616005)(31686004)(41300700001)(2906002)(5660300002)(7416002)(8936002)(4326008)(71200400001)(478600001)(8676002)(66946007)(110136005)(66556008)(66476007)(76116006)(91956017)(316002)(6486002)(66446008)(64756008)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a2lySUl2b3NzSktwVTNlbjk0UTVGdlMzTzhKTUtyT0s0YzIxQWNvbWp4OVVD?=
 =?utf-8?B?ZzZReVZXVWVkWnl2OVE5dmowM0swVmVaVm1jelFzWFV0QitQbVlPVEEycGU1?=
 =?utf-8?B?TWU2WXRYK3VSY2I1dUdpODJ1WXF3aE41TWFFK2JWcTVXUExXc3BDajhPWG5Q?=
 =?utf-8?B?VmNCb2kvT0R1Mk1WRlkyWlFSTTZiVW4yVVRKRG81d2lWWjFDakhLTVRhM09k?=
 =?utf-8?B?anByWS9UbWlnbkU5R3lsZVNmSW1tR0dqQkZZNlJpRldGN2wxL0xPZEExY01G?=
 =?utf-8?B?VmJNWVU2YkxkL01rUHd6WmFFRHY3cGxqZGVJSTc4dXF3R2VSVUtVREpSdVd4?=
 =?utf-8?B?RnF6UXMybUxhMnBqdjR6VmpRdG9GM3RVTHd0RlB0UU1VbHg3REJtanpnanRo?=
 =?utf-8?B?SEp5TmxjdlN4NjRHa0ozZVR4b1pPM1N3RFBKYzFNL3hDOU5oSWtzWi85REVt?=
 =?utf-8?B?ekRGSUs3clN0NlJlOC93NndJWU5obFpUTVpsWDRCeDVZVlA3ZDhYaXdTYXlh?=
 =?utf-8?B?eU81QWU1d2JqalkwMXp1VVM0bVNLZGk2RmRFOVlwd21LN1JtM1BzYVhySU9I?=
 =?utf-8?B?YjEvcTZNTlJMTFo0U3UrbWovYlNBeWxZU2VWaXdsZ1dXQjJ1cnF1SUJGVmtS?=
 =?utf-8?B?M1VPczc0L2lzaE0yYk55OUhVaFJnSFpYS3hUd0kyYlRsUlRjQWtObThyZVBC?=
 =?utf-8?B?OHhrVDhNSkhnN2Z5QnBpZ3dpZzBteERJZlF6K2VodnJ5dS9mcEVhdGVQMVdn?=
 =?utf-8?B?bXRhUGFMSmhENndua1pKR0xIVi9MeUUwU3pITWtWeTVVc3FoTnI0S2tTY3FT?=
 =?utf-8?B?dmQ5M2t0dUljM3Z2N1czcTdoUURZWGMvYVVvUW9ab0Q2YkpVNHp5NENkQ1BO?=
 =?utf-8?B?NGZ4YmhkWlBoQXpPVTlDVlFiaGxwSDZZa2pCZUdIelZLNlAxcUZDMnhnaUFi?=
 =?utf-8?B?QU5lUFYvM1IzNC9lMG8vS0liMElXcldSWWZWNTFZNThIZGFuVUM1aURoWk4r?=
 =?utf-8?B?SFFxalU5c21FMlQ4ekpRMG01T3JCK1VSYWQ2SnU4RE5xbmsybmUzVHIvL0VX?=
 =?utf-8?B?YURJWG5LYVhScG5rL2JuMEFScDhtYnd6ZFBCVUxGY0xYSDE3SUtIbGV1ckgx?=
 =?utf-8?B?ZWdXMGZNUWQySG9lOEl1Sm8zS1BPSDFIM2dCOVFOTG1RbG5TeFR4ZU1TbTQ4?=
 =?utf-8?B?eXlNL0xSQTVZYndoM2h6RmZ4RE11bWU0Z21lSDN3RW1VSjhjMkl2dHBjZW5k?=
 =?utf-8?B?WjBpbC9pMHNsT0dmaW5aMkYxczhiNG9GTy9rUDZYSjJJbk1xVTFMMThQVDVs?=
 =?utf-8?B?elA3WGRVeXlEb3dCVlBFK2prMFhlcUl4SDFVZjlLa0xSZ3ZyN090aXdCUDBk?=
 =?utf-8?B?RnhacVRGK1dHN3ZJQ0lxUWpxU3A4WVJGWkVUWUNLelJZZjd3bisxbDEwNVZm?=
 =?utf-8?B?TWJXRWVIZnY3a3ZYWVpaZThJNlQwRzR5ei9JMWwxSHp3UE9ZZkhMcFlOczF3?=
 =?utf-8?B?U0tBdnVxQVlwaTNzNmszbm1XSXA3K0ZsL2h2UWJPWlVhZkY0cjZJYWZTRzhz?=
 =?utf-8?B?UHdjclpuZmxEWGZUNG5ucmVoL0xwOThLbENSenRnSENFM3FIM2pWOGhEdENq?=
 =?utf-8?B?UWJSb092VGZkd1NUM3l1QnpaZlNtZXhoVEx4QlBPdjBBQnI2RHUzbEpzeHU0?=
 =?utf-8?B?VFJZbENYcm1wZEduK2d6Z0JuT2J4d0U1NUhacDY5ZVJkTDBPMitrV2dQVzJ3?=
 =?utf-8?B?M0E5amdUYVhkMU1nNjkxUHVEK245QWk0Z3BXNU9GcEt6MlhOVGJVeUZCYkVM?=
 =?utf-8?B?OHA0TTNBb3ZxbHhWNE5NWnQzd0ZYTS9leXBGei9kYVA4eFVtWXB6TFIraHVG?=
 =?utf-8?B?TGxUMTBhcmxtM3d6ZW9mRkQyaVZoNEZyNVgwTWNBMlF5eDIvdmh6MnBrc2Z4?=
 =?utf-8?B?dFhGaGsyRzRxQm55eG5yR3RodTVIQzhrY2NjcUh0blNpUzhxMTlNMG1hdXNI?=
 =?utf-8?B?QnBVRzVvaGxuTGZKdXU3Ly9PelRhTnpyZ0dtNHlJd2gwbXVMUjJNdlIwMHVW?=
 =?utf-8?B?L1JHdUNMS0c0QnR4SEVTdkJhSDc5RWIveUllMnE0RHcyeVhSY0FZY1kvMnFP?=
 =?utf-8?B?bWF4K1RkSklEa1VFNjBCN1BjMkltd3JQSEZ4R2J5RFkva3NtMDltTmFNaXlD?=
 =?utf-8?B?S1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E25CCFE29BEE444A9EF5BD53974AA95C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?cW9GT0c5WHJNaW92Z1dCRUFLNXozakNlc01wSEhNNk1jNmYwTW9TRW5BK2N1?=
 =?utf-8?B?c0pPZThOMEhtVTJaNGxFMXlBMEYrSVo0YnRVNEk1d1V2TmtoOVNxUnZ6U2Q0?=
 =?utf-8?B?KzZseTZwdUt4UUoydkxjbFR4VlpFbGdqa1YrWXQybXBjYWo0bWZ6dzZjUWlN?=
 =?utf-8?B?MlRrZ29BNDFIK1dPZU1vaEN2QW9BSk1taUt1ZXpCYktXL003ckQ2RW1IVFE1?=
 =?utf-8?B?R0RxQVc5RWx1d2ZpSVVCR1oxdzU1b0M5eE5LODhMNjF3NEkyZ2VyeTZ1bTd1?=
 =?utf-8?B?MENSM3YyR09JV2R2ZU5iUVBZMGZlZTR3NXQxVmdiSENTQ2F0czUwdW5qTmpQ?=
 =?utf-8?B?YjZhaHc3SFJXSUVRWU1TRmxXRWlwMUQwMW9HeWhhYTRNYjg2Y01MYlJqZTlr?=
 =?utf-8?B?amdOb2hicktaK3NRdElxaUZkdjkwS3ZsL1BVSFp5UnJUS3lJMEcrVEp5MnRn?=
 =?utf-8?B?cGE2YXNPKzhqdWNBbWZVNUFEaGxxSTIrZEYxOFlIRGdOOWxQVGJDZExKMERK?=
 =?utf-8?B?K3ozRXVEaisvcVA0Vzc5WEpGK1dDMUxSMU9oS05NUSt5a2I0dWIwQS9MWGdy?=
 =?utf-8?B?eVlsODFYMjRnc0ZYVHVJa0lWZEFVYXZTbVhCV0xVL2xyUnBJU2pmZ1JhSTRo?=
 =?utf-8?B?d2hsVm9OeDhKNUFtZDVVNnFyU2tnSTIyOEExYWd2VWlmUFRaaU1rZEpZL0RE?=
 =?utf-8?B?am9ZN2dGL0FHYXR0OWJ2THVES3JPOW5SYU9LS1phU0VMMm9VTm9UTFZLbW56?=
 =?utf-8?B?RWg1eVlBZnpOT2U0dzFiQWFoUzJxSFBFS0F5ejFYR1EwK0lhbzJKOHRFUlV4?=
 =?utf-8?B?NFlsRCtBd3JucWVxVmpNamdEbDF2Y20vUzhiNktnVlhKbFlQWUFtRXRzU0hp?=
 =?utf-8?B?Y2h2VUpVZFJMa0dBSFg5bG9hbFhhakdQL3ZCdFd2bFFNNS9iR0tDbHVTK3dl?=
 =?utf-8?B?cHJwT0Z6TFM5ZHF5cnlab0YrSUh5dENleWdaODZLMVF3R3d0ZzBwVHgxZ1Ar?=
 =?utf-8?B?NzNXd3VqU1pjZG8yMjcvU0oyR1UwbEkzS2J0SzlRc0hpSG9lNXJkTTlyRUli?=
 =?utf-8?B?ZHY4d21ydzdjeXQ5QzEreGhZSm4vWEM5Q2FnZUVob2xRTmE2d2puYjlTVUgx?=
 =?utf-8?B?UHo3a3dRWG5pdVdWeVhpMThsd2g4a1hXajhvOXBSbzUrd0QyTjNGcGErSnFq?=
 =?utf-8?B?a3R2TWNhKzJtUUxRc3JkUXR2aG1wL0lmRCtLWk5raVBSd05oWFZSUnhlY01E?=
 =?utf-8?B?UWJ5QlJZTHFXdjN5M1I4c1hQVUh4MnhvOG5EaE5MT1ZBKzRTMGpQdm5uZHdH?=
 =?utf-8?Q?fH3lSQlFvv1yY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2923fe1d-be79-4fb7-4014-08daef3b757a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2023 16:39:47.8932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0LaO/eli6Go9fPMBrQrklwiGEYnTrP+7Db5zPaC1M4oLk25I0v+y3nQ+a7PhvlX7BCoIExhTqiFhzLSJNRwAHLt9gF7ZiMKqTzeyOjlXOAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5133

T24gMDUvMDEvMjAyMyA0OjI0IHBtLCBPbGVrc2lpIHdyb3RlOg0KPiBPbiBUaHUsIDIwMjMtMDEt
MDUgYXQgMTg6MTAgKzAyMDAsIE9sZWtzaWkgd3JvdGU6DQo+PiBPbiBUaHUsIDIwMjMtMDEtMDUg
YXQgMTU6NDggKzAwMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+Pj4gT24gMDUvMDEvMjAyMyAx
OjQwIHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4gT24gMDUuMDEuMjAyMyAxMzowMSwgT2xl
a3NpaSBLdXJvY2hrbyB3cm90ZToNCj4+Pj4+IFRvIHJ1biBpbiBkZWJ1ZyBtb2RlIHNob3VsZCBi
ZSBkb25lIHRoZSBmb2xsb3dpbmcgaW5zdHJ1Y3Rpb25zOg0KPj4+Pj4gwqAkIHFlbXUtc3lzdGVt
LXJpc2N2NjQgLU0gdmlydCAtc21wIDEgLW5vZ3JhcGhpYyAtbSAyZyBcDQo+Pj4+PiDCoMKgwqDC
oMKgwqDCoCAta2VybmVsIHhlbi94ZW4gLXMgLVMNCj4+Pj4+IMKgIyBJbiBzZXBhcmF0ZSB0ZXJt
aW5hbDoNCj4+Pj4+IMKgJCByaXNjdjY0LWJ1aWxkcm9vdC1saW51eC1nbnUtZ2RiDQo+Pj4+PiDC
oCQgdGFyZ2V0IHJlbW90ZSA6MTIzNA0KPj4+Pj4gwqAkIGFkZC1zeW1ib2wtZmlsZSA8eGVuX3Ny
Yz4veGVuL3hlbi1zeW1zIDB4ODAyMDAwMDANCj4+Pj4+IMKgJCBoYiAqMHg4MDIwMDAwMA0KPj4+
Pj4gwqAkIGMgIyBpdCBzaG91bGQgc3RvcCBhdCBpbnN0cnVjdGlvbiBqIDB4ODAyMDAwMDAgPHN0
YXJ0Pg0KPj4+PiBUaGlzIHN1Z2dlc3RzIHRvIG1lIHRoYXQgWGVuIGlzIG1lYW50IHRvIHJ1biBh
dCBWQSAweDgwMjAwMDAwLA0KPj4+PiB3aGVyZWFzIC4uLg0KPj4+Pg0KPj4+Pj4gLS0tIGEveGVu
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY29uZmlnLmgNCj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2NvbmZpZy5oDQo+Pj4+PiBAQCAtMSw2ICsxLDkgQEANCj4+Pj4+IMKg
I2lmbmRlZiBfX1JJU0NWX0NPTkZJR19IX18NCj4+Pj4+IMKgI2RlZmluZSBfX1JJU0NWX0NPTkZJ
R19IX18NCj4+Pj4+IMKgDQo+Pj4+PiArI2luY2x1ZGUgPHhlbi9jb25zdC5oPg0KPj4+Pj4gKyNp
bmNsdWRlIDx4ZW4vcGFnZS1zaXplLmg+DQo+Pj4+PiArDQo+Pj4+PiDCoCNpZiBkZWZpbmVkKENP
TkZJR19SSVNDVl82NCkNCj4+Pj4+IMKgIyBkZWZpbmUgTE9OR19CWVRFT1JERVIgMw0KPj4+Pj4g
wqAjIGRlZmluZSBFTEZTSVpFIDY0DQo+Pj4+PiBAQCAtMjgsNyArMzEsNyBAQA0KPj4+Pj4gwqAN
Cj4+Pj4+IMKgLyogTGlua2FnZSBmb3IgUklTQ1YgKi8NCj4+Pj4+IMKgI2lmZGVmIF9fQVNTRU1C
TFlfXw0KPj4+Pj4gLSNkZWZpbmUgQUxJR04gLmFsaWduIDINCj4+Pj4+ICsjZGVmaW5lIEFMSUdO
IC5hbGlnbiA0DQo+Pj4+PiDCoA0KPj4+Pj4gwqAjZGVmaW5lIEVOVFJZKG5hbWUpwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0K
Pj4+Pj4gwqDCoCAuZ2xvYmwgbmFtZTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4+Pj4gQEAgLTM2LDYg
KzM5LDEwIEBADQo+Pj4+PiDCoMKgIG5hbWU6DQo+Pj4+PiDCoCNlbmRpZg0KPj4+Pj4gwqANCj4+
Pj4+ICsjZGVmaW5lIFhFTl9WSVJUX1NUQVJUwqAgX0FUKFVMLCAweDAwMjAwMDAwKQ0KPj4+PiAu
Li4gaGVyZSB5b3Ugc3BlY2lmeSBhIG11Y2ggbG93ZXIgYWRkcmVzcyAoYW5kIHRvIGJlIGhvbmVz
dCBldmVuDQo+Pj4+IDB4ODAyMDAwMDANCj4+Pj4gbG9va3MgcHJldHR5IGxvdyB0byBtZSBmb3Ig
NjQtYml0LCBhbmQgcGVyaGFwcyBldmVuIGZvciAzMi1iaXQpLg0KPj4+PiBDb3VsZCB5b3UNCj4+
Pj4gY2xhcmlmeSB3aGF0IHRoZSBwbGFucyBoZXJlIGFyZT8gTWF5YmUgdGhpcyBpcyBtZXJlbHkg
YSB0ZW1wb3JhcnkNCj4+Pj4gdGhpbmcsDQo+Pj4+IGJ1dCBub3QgY2FsbGVkIG91dCBhcyBzdWNo
Pw0KPj4+IEl0J3Mgc3RhbGUgZnJvbSB2MSB3aGljaCBoYWQ6DQo+Pj4NCj4+PiAjZGVmaW5lIFhF
Tl9WSVJUX1NUQVJUwqAgMHg4MDIwMDAwMA0KPiBMZXQncyBzd2l0Y2ggWEVOX1ZJUlRfU1RBUlQg
dG8gMHgwMDAwMDAwMDgwMjAwMDAwIHdoaWxlIHdlIGRvbid0IGhhdmUNCj4gYW55IE1NVSBzdXBw
b3J0IGFzIDB4ODAyMDAwMDAgaXMgYW4gYWRkcmVzcyB3aGVyZSBPcGVuU0JJIHdpbGwgbG9hZA0K
PiBiaW5hcnkgKGluIG91ciBjYXNlIFhlbikuDQoNCk9rLsKgIEkndmUgZml4ZWQgdGhhdCB1cCBh
bmQgcHVzaGVkIHdpdGggYSB0d2Vha2VkIGNvbW1pdCBtZXNzYWdlLg0KDQp+QW5kcmV3DQo=

