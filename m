Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255AB637A1B
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 14:43:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447950.704617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyCVm-0002mZ-TF; Thu, 24 Nov 2022 13:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447950.704617; Thu, 24 Nov 2022 13:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyCVm-0002k0-QR; Thu, 24 Nov 2022 13:43:30 +0000
Received: by outflank-mailman (input) for mailman id 447950;
 Thu, 24 Nov 2022 13:43:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FYuI=3Y=citrix.com=prvs=3202d56cf=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oyCVk-0002jp-Le
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 13:43:28 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f74502b2-6bfd-11ed-91b6-6bf2151ebd3b;
 Thu, 24 Nov 2022 14:43:25 +0100 (CET)
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Nov 2022 08:43:11 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5378.namprd03.prod.outlook.com (2603:10b6:208:292::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 13:43:09 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5857.018; Thu, 24 Nov 2022
 13:43:09 +0000
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
X-Inumbo-ID: f74502b2-6bfd-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669297405;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=a+QoXY/5fHziO2VRvrfw4vtsMfH0Pj9RY54Cnp3eip0=;
  b=CzbbnqKgPVKUXIDpZj5UtH+9R1vfFcKtvJIhDKACtF8jOp65spI8F9Rn
   lF5OnEFSqhXJb00Iq3mVihVRVz1dhYph1ZdlA2BoSgSJSx/cSfjxiBlnU
   PyO7K1b+VeTuwoi/vVdoViKNi6WBFYntYuJPkrV4n9/VFCjEbjbjYAppf
   Y=;
X-IronPort-RemoteIP: 104.47.55.173
X-IronPort-MID: 84546413
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:nFDNCqgVY7ohwB9cKWuSuYJWX161fBEKZh0ujC45NGQN5FlHY01je
 htvD2vVafqOZjP1c9lxO9vk80wH7JXWnYAyHQtkrSFhH3gb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5QWCzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQWCndWQjXewN6umui7crQvl+AvHszCadZ3VnFIlVk1DN4AaLWaGeDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEsluGya7I5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6ROHlqqA22Qb7Kmo7FDMudUfl8OGAg3WDXO50M
 2032CQQsv1nnKCsZpynN/Gim1aUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebTAjy
 FKhhd7iAj1r9rqPRhqgGqy8qDqzPW0fKz8EbCpdFw8duYC8+8c0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNt2uVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:r4PXT6gfuhKgxuO2ahP7ty8xgXBQX/J23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICRF4B8buYOCUghrTEGgE1/qv/9SAIVy1ygc578
 tdmsdFebrN5DRB7PoSpTPIa+rIo+P3v5xA592uqUuFJDsCA84P0+46MHfjLqQcfnglOXNNLu
 v52iMxnUvERZ14VKSGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftxK/mHwOe1hI+VSoK5bs562
 DKnyHw+63m6piAu17h/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtSJV9V6aEtDUVpvjqzFoxit
 HDrzopIsw2wXLMeWOepwfrxmDboXgTwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp9KZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wXh4SqbpXVd
 WGPvuso8q+QmnqKUwxeVMfmeBEa05DWituhHJy4vB9nQImx0yRhHFoufD31k1wiK7VDaM0p9
 gse54Y6o2nBKUtHN1ALfZETs2tBmPXRxXQdGqUPFT8DakCf2nAspjt/dwOlaiXkbEzvewPca
 76ISVlnH93f1irBdyF3ZVN/ByISGKhXS71wsUb45RioLXzSLfiLCXGETkV4oCdiuRaBteeV+
 e4OZpQDfOmJWzyGZxR1wm7X5VJM3ERXMAcp95+UVOTpcDALJHsq4XgAb7uDauoFSxhVnL0A3
 MFUjS2LMJc7lqzUnu9mxTVU2OFQD2KwXuxKtmuwwE+8vl/CmQXiHlltb2Q3LD6FRRS9qorYU
 B5PLTr1qumuGjexxe701lU
X-IronPort-AV: E=Sophos;i="5.96,190,1665460800"; 
   d="scan'208";a="84546413"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eW7pUUemBlYZCtbMl2w1iwba7zqMDMvYpLls8p9mTqADqTGCb7xK0e5vZLITvaObyO9bA/NNTtMHyXZMwQ8d7vC5SqkwUXgQ5treMEd1W6yQTgfbiQw8iiYZi160FwAfnNqrnNESGlP2HITJuDaTIIvBkqMd9AJReFpsPFTsvSJLsMJJ9QMozy5kxVIJvU7x0Askyw9Isx8kJcJgQdqpUiFChfUhaAn55lMj0wTRJdDRGQwdw6Z8Dwimafh9NAEfa4IvGBogaLURORw+oWw8ootTb4YlyY8t9wv34vP8vFnMQ8JlRHD8i+tlb7X8JmAyhWUOSwwLh+sHRM7PkBlhXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+QoXY/5fHziO2VRvrfw4vtsMfH0Pj9RY54Cnp3eip0=;
 b=Uau4eAiwbVe4lfuVdMhLVCx5rZcSdGkvt4K0hbDqFUlyJyspiXdFspod/9aHMIkZXbqeK3Xer5qMRlF+sVNcNwWL9P3YjmHNgN3ygF/+8riTMBFOSNpu0UARFrWXRf65mLBjkapej69A6aa7IHATvw3Ry5rO9EWfbbcEFY9jJe8vXrwMTpgSO35UBL8hUwo3tJqWFdjXbCt6so18qd1noP69hfWr1deVtFhh0Pgj1S9XIsePztZoOHFbUPbZ7J2jySFh6R9Ep+eDgP6JxP8+WZzjsUMUMZMjNprE3ZeZp57MJpK3wYF+GG48oF++7Dzdu45VohqKnsuEBWpw447sWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+QoXY/5fHziO2VRvrfw4vtsMfH0Pj9RY54Cnp3eip0=;
 b=sZTP8hlWU/JumwPkW9/GeKfU3waaCJ3lxeSKNT9RX9bYic4N2pvJiYz7LiSZTW8AnwHq4qSLat4wmGHQ0TuTovQKPMhw06ZK3wpDRDhe5xue9G2w3mRz50kO41R4i89zexg3wT1sKpO5EDTJbU4pBF2Jk4/6ZKPBNET1yFivgoc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: Re: [PATCH] tools/ocaml/xenctrl: OCaml 5 support, fix use-after-free
Thread-Topic: [PATCH] tools/ocaml/xenctrl: OCaml 5 support, fix use-after-free
Thread-Index: AQHY/4p9GINVmjprlEGx5iAuzyYE1a5NyDSAgABOFgA=
Date: Thu, 24 Nov 2022 13:43:09 +0000
Message-ID: <a49b5770-fc6f-0044-8e03-7162996257bd@citrix.com>
References: <20221123222517.12140-1-andrew.cooper3@citrix.com>
 <D28C9584-F900-479E-AD23-64B8CEB879B2@citrix.com>
In-Reply-To: <D28C9584-F900-479E-AD23-64B8CEB879B2@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BLAPR03MB5378:EE_
x-ms-office365-filtering-correlation-id: 2233fbf5-c982-41e2-36b1-08dace21d2cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 b7vfFVNOnw+TAgQPZtj0j4S7BoCRWd3NmzNgViYpy33+/XWponDXtlesDw8fdI4TNlSPUCuaDEMfXiIopycXGTPA3dGNkzw6+pYTPl/7UZdH3BPhAJoAqjImczXhmgjlYIqfmZ6yeaVSixLM4QzvccLpAHVDQEeQSDi3rMJAAK5vDguz7VGczm16hXt/oaY3ZwbKt7QeEEUpjsurRcDQu8tOclbpTRtZkgceFWVFA4PI+ZLiGpDlYpwS8ji77HAdMYzuyGhLKdXMlHD7xb7AFllBJoEq70+5tpiv08a7ycyiH1WsRGimlhY1BbDKKZOnOXjGmaFvk0xKs4cUpP8JXuMWP5VAqv1umLs7/+8chqK/UV/t8mACAnVr6Krud1UK/fAmq249jpnmWFkVqlp+TOX0R2IK8o0LFBpMU3b1HA9/7iMlgkQrdNBmBxZ8Oo3focHrfvxmssG++bYR1k/1iWZ9+d9e3kYjU6C7BHPtu5n4TwH1wdK2yWdDg3L5xr4s93yS9Gnbwtq+O/Ha4pW2IwNa1GRt+gTP5U1fv6+X+6nGktPH6y9TQhkiZ3LbsYquvETONYAaQ1Os2hSRnHK9kZkOaWPKd2Yq04OrF2CBZLJVIOsHXbMYtnlYRrz+pC5zSykw0VsV0jkppbeGtglZFaYkJIitsRC6k7NteKAY5nuTSPARWcYYQaviaCfI++qq3YZXoxuO3+tUyiYFmLfRa+oeKxMECQy5tj489RyCNT4DdnuEwbUtLH6K0OxXDtiLqc8/VE5c4ZF8lkAxofRJnGrPwlVcb6s0Tibw5GK5pjc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(451199015)(2906002)(31696002)(86362001)(6512007)(83380400001)(37006003)(54906003)(6636002)(107886003)(53546011)(26005)(6506007)(6486002)(966005)(71200400001)(2616005)(186003)(478600001)(82960400001)(41300700001)(8936002)(6862004)(5660300002)(38070700005)(38100700002)(122000001)(4326008)(91956017)(76116006)(66556008)(66476007)(66446008)(64756008)(8676002)(66946007)(31686004)(316002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VElqaXRKd3FRbXY2UmlaZTRJaW9Nemthend1ay9QNkNMZ25mK1FTcDJEY2JY?=
 =?utf-8?B?UHZoSDV3R3pIOWsxZ29YLzhyQTBwWWJnQS91SDQwWnpQS2FZYTRUQjBvSFg4?=
 =?utf-8?B?eGZtVmpuTitIemJPanVCNmk5OVFYbitFRlJjbzJYZnIwNnhWdFhtNTRMU2kz?=
 =?utf-8?B?Si9jUEluK1dDdkUwVmRyVHZUbE82eitIT3dyRzlXb2lzSFNZbkJGNnI0aHBu?=
 =?utf-8?B?bUxLZUVCb1hRWWx0eGc1YllUUDZ5ZVVQNXRyQ1BuY0pvTVBPTWNicjBuQXdi?=
 =?utf-8?B?VjBDakFJM3RxYkd6SEUxTHhNU1FlR3UrUHRKaUJPZllpS2R0di9na2RNVysv?=
 =?utf-8?B?b1FYSGlXYjFYQ0ZGYlU5eVdqVDZwYkFNTFdGZlVLNmh5OW11SS9PUWZKbDlQ?=
 =?utf-8?B?SUFWcE5uc1VsQUlJVDVwTjZoQXRETmpnVmpCYU9QanNSRC96ZjFoa05MVVBY?=
 =?utf-8?B?emxya1NGd1VJU3c5OTVSais5a1IrVCthUWdlZEk4eGRXZi9JRjZ0b2doNkxC?=
 =?utf-8?B?V2JPRFZ3ekJHUllUZkhOSEY0Mk84QTBqeXdxQWZqUC9UZmdxL0dxZUlxR0Fp?=
 =?utf-8?B?VnZTc1NvR0Z6eXBPU3NEcDdLOGpjSmV5OHRQcUJtd0FzZkZOR041b0VCZUtN?=
 =?utf-8?B?RE8wbG9zUXJDNmFGeXdISnlZemFDSllKTkhNcVN3QldsbE9VV3pzR1lsNGl3?=
 =?utf-8?B?TldRbllLNGJQOWpNQ2tZNE4zZDVlK3VLNWxSU095K3UyaVBQT09rVmt6VWJu?=
 =?utf-8?B?NXBqWTl1Ulp5R3d2OEFtZ0wwdU1SVmpCWjFsMXM5aDlHTmVVQk9hZkg2SC9M?=
 =?utf-8?B?TkhNQUdMVnJja0g2aUkzMDR4bHJDNHNkK0VKZ2ZKYWtiYkhPcURuQUEwa0Fy?=
 =?utf-8?B?N0VHdkdIWjZRc2xQbXF0OStDSkdCNXUrZWhlNE5MUjd4KzM1aTcyclRJNll5?=
 =?utf-8?B?WWFPVDlMeGlsK1A5V0YyNTdzTnhwRDNWOGFLelUxMzc3YTducWZmODNhbHNU?=
 =?utf-8?B?VzlqRWF3UC90YXIwY1pDVDVFYnRidlhUNGhTLzRBRXptTTI4R2VvV0FIbERn?=
 =?utf-8?B?WHcwa05XVGtvNXdacHFtR2RPaGxKV3YvSS8xM01tSWxqMnlxTE8xb2lacXdQ?=
 =?utf-8?B?bXhteFpJRTRZNWpzLzI3dWlVS2p4Q3B3bjB3WHNZb01FMXlWdy9MU1RjM0VB?=
 =?utf-8?B?K1FHNlJtK1B2anZJaDZ2ejM3VjhEaXBLSmVqdElpNkNnMng3dE0zaE5adDNK?=
 =?utf-8?B?NlFlbDM4ZUhDdFFRYVVWQ3liSml4RXJVeU1VelNCRVZUdXgrUWlKS2JBaTc2?=
 =?utf-8?B?cmJWTjJDWnl6NDBvZXlFelNReHZ5K0djdEdhL0hyOEw4VGJML1pDdVVrWDlB?=
 =?utf-8?B?KzhEMU1iZ2doa29icTFVdjZvYTUyUkJaTk44TFgvV0Z3d0doZlBQUSswTjFp?=
 =?utf-8?B?bWZJN2VCVU5XUTRmWG5iOU90Ym1qeFoyMWU0R2FtdU9ZbERXTjZXdjhXcmUr?=
 =?utf-8?B?SjFTZkR6RGdSaGJEYmc5Q3o5Rkh0U1lHSHhYL29hSEMzbG1ubFRVMHY1OEJB?=
 =?utf-8?B?eUZqQU1CM205djdpaVlxM25jQm0xWGpLZHVLVnBCNkI1MkNRd2FEdXRWQmpN?=
 =?utf-8?B?SmcxdlA5SC9xT2I1aTJweG40VkNKMkpQaHY2cDZiWTkzS3Y5a2huNVh1VC9t?=
 =?utf-8?B?QXpTdSs4WlpmbTN1RG0vL0w0ZXRlcHBzZThVTVphN1FvU2p6dERiY1VRQ2Ix?=
 =?utf-8?B?TERmWk1ZeWpLWGN2M01PYW5xWDJ0bjZpdVIzY0pJNmQvemlGbERvUXh0TXIz?=
 =?utf-8?B?UjF5Mm5KYkp6cG9CTVllWUQ0Rmt0Z0YwcW9FK2ZQNHNWMUJub0QwemJnc1c3?=
 =?utf-8?B?UFpHbGMyb04zZGRFSXlrVHFGRHZBRDJhd3hqK0I2anR1QlFtRjN1NXNwWE9G?=
 =?utf-8?B?ejE3WEZoV2kwQk0zak02RWtIdEhPZktiRGFCYmRlL0t0alExTmx1V3d6Vi9t?=
 =?utf-8?B?cE9PZXhJMmQ1U1MxMUFCM2JsWmxibTdjREhqK2VidnRsVGJJL3NqUTRtMW1r?=
 =?utf-8?B?d1pOVkNKaEtvZ29WbmNnK1RKNDJlMitNQ0RmQmpOc29QdXRBS2pUYVU3TVZj?=
 =?utf-8?Q?k80ZTOPqnP6PAHFtXqTXBHEKM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <49DD2C4B6B22CA42BFF369FDE739A27B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ELe+zKMrTG14Ko7xRrOrFfe0m7nNCpR1MLy7+lWL3gr7xowmdxKZ+MwA1HnQhaVmtIESG3M6dnjRtUutNB/nJ1vTrPdt5Gkc1BF+EEPCFCCLKFRXy+91BSjUW4JKwwwHdUCIjGizVspTcvZwlmghRg6/qRksvOccLcxJ0iOC442l/bcGTH8f3gnhhQmV9gA/Gv/8AajWYfd/7hPZK9qGA6BF/rbIELNxAWqI3DZTa3bQid6+5ATl+unhUGUyQrIAkFZV+O4MPA39zp4bPtakUUviVjXF2SJqHYlRc1e8HtOnB1UU/yrtyeugQwkpcUrXukqSETIHS/dIl3IFCy8d/dH6ob1b0RDOsH44+BMKO3lPPy4gZFl3DaUY2w6pRiOj5SOfYvr0xB4HkDH8dKfbtULu+4l8PGYeYlzQu+jlkFpokN7RvG7Mwr79I1zCSbT3JIopodJj6F5zg4VbaiZ1pHtZhP1417Gz+gdQ6W4X8+VxDh8SUlZZJp8/CqUnSKxzJDFURluu02ELaYOSa6iOtsybSZRyzobeKxGdbIQizX2EBfcZZRLFkd6myBc4TrOrR6gQw6fT6kVyyktLHN0rIBrMjW+g3w3LPwmSOhZsOYeWR0YJuyLnycDXBYZ4LOvWPXPDkBnQ3VigXlKMe/GXXx+hTpadSJW1BeoOPygGLEPZTyh4wh5QTgkmhS2ZdDRY8fkVzv6ZShxcgKsyF5VaM/pbqvBmiPnmy/+ankQFgarpBucscwgxuEGnj2vngAOuL+nfjMEzUxLnpPucJeG5rnLYd26zzD/b3PjhZy/NXKz2TjW0SnfTQ2QOdjunYgNi
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2233fbf5-c982-41e2-36b1-08dace21d2cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2022 13:43:09.1759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kl39EdkLVD/e1FOK+nCgSKykf2s2IIwo/UXHUA03DFfQdOWVmt8tP6AnRbWNdHbpgyYNEZB9r30wY+B3hvNNfHbejSmic3fl7MjlDNHJtUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5378

T24gMjQvMTEvMjAyMiAwOTowMywgRWR3aW4gVG9yb2sgd3JvdGU6DQo+PiBPbiAyMyBOb3YgMjAy
MiwgYXQgMjI6MjUsIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdy
b3RlOg0KPj4NCj4+IFRoZSBiaW5kaW5nIGZvciB4Y19pbnRlcmZhY2VfY2xvc2UoKSBmcmVlIHRo
ZSB1bmRlcmx5aW5nIGhhbmRsZSB3aGlsZSBsZWF2aW5nDQo+PiB0aGUgT2NhbWwgb2JqZWN0IHN0
aWxsIGluIHNjb3BlIGFuZCB1c2FibGUuICBUaGlzIHdvdWxkIG1ha2UgaXQgZWFzeSB0byBzdWZm
ZXINCj4+IGEgdXNlLWFmdGVyLWZyZWUsIGlmIGl0IHdlcmVuJ3QgZm9yIHRoZSBmYWN0IHRoYXQg
dGhlIHR5cGljYWwgdXNhZ2UgaXMgYXMgYQ0KPj4gc2luZ2xldG9uIHRoYXQgbGl2ZXMgZm9yIHRo
ZSBsaWZldGltZSBvZiB0aGUgcHJvZ3JhbS4NCj4+DQo+PiBPY2FtbCA1IG5vIGxvbmdlciBwZXJt
aXRzIHN0b3JpbmcgYSBuYWtlZCBDIHBvaW50ZXIgaW4gYW4gT2NhbWwgdmFsdWUuDQo+Pg0KPj4g
VGhlcmVmb3JlLCB1c2UgYSBDdXN0b20gYmxvY2suICBUaGlzIGFsbG93cyB1cyB0byB1c2UgdGhl
IGZpbmFsaXNlciBjYWxsYmFjaw0KPj4gdG8gY2FsbCB4Y19pbnRlcmZhY2VfY2xvc2UoKSwgaWYg
dGhlIE9jYW1sIG9iamVjdCBnb2VzIG91dCBvZiBzY29wZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPj4gLS0tDQo+PiBD
QzogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPg0KPj4gQ0M6
IERhdmlkIFNjb3R0IDxkYXZlQHJlY29pbC5vcmc+DQo+PiBDQzogRWR3aW4gVG9yb2sgPGVkdmlu
LnRvcm9rQGNpdHJpeC5jb20+DQo+PiBDQzogUm9iIEhvZXMgPFJvYi5Ib2VzQGNpdHJpeC5jb20+
DQo+Pg0KPj4gSSd2ZSBjb25maXJtZWQgdGhhdCBYZW5jdHJsLmNsb3NlX2hhbmRsZSBkb2VzIGNh
dXNlIHRoZSBmaW5hbGlzZXIgdG8gYmUNCj4+IGNhbGxlZCwgc2ltcGx5IGJ5IGRyb3BwaW5nIHRo
ZSBoYW5kbGUgcmVmZXJlbmNlLg0KPg0KPiBUaGFua3MsIGEgZ29vZCB3YXkgdG8gdGVzdCB0aGlz
IGlzIHdpdGggT0NBTUxSVU5QQVJBTT1jLCBwb3NzaWJsZSB1bmRlciB2YWxncmluZCwgd2hpY2gg
Y2F1c2VzIGFsbCBmaW5hbGlzZXJzIHRvIGJlIGNhbGxlZCBvbiBleGl0DQo+IChub3JtYWxseSB0
aGV5IGFyZSBub3QgYmVjYXVzZSB0aGUgcHJvZ3JhbSBpcyBleGl0aW5nIGFueXdheSkNCg0KSSBk
byB0aGF0IGFueXdheSwgYnV0IGl0J3Mgbm90IHJlbGV2YW50IGhlcmUuDQoNCldoYXQgbWF0dGVy
cyBpcyBjaGVja2luZyB0aGF0IGNhbGxpbmcgY2xvc2VfaGFuZGxlIHJlbGVhc2VzIHRoZSBvYmpl
Y3QNCihhbGJlaXQgd2l0aCBhIGZvcmNlZCBHQyBzd2VlcCkgYmVmb3JlIHRoZSBwcm9ncmFtIGVu
ZHMuDQoNCj4+IGRpZmYgLS1naXQgYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMu
YyBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jDQo+PiBpbmRleCBmMzc4NDhh
ZTBiYjMuLjRlMTIwNDA4NTQyMiAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL29jYW1sL2xpYnMveGMv
eGVuY3RybF9zdHVicy5jDQo+PiArKysgYi90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1
YnMuYw0KPj4gQEAgLTM3LDEzICszNywyOCBAQA0KPj4NCj4+ICNpbmNsdWRlICJtbWFwX3N0dWJz
LmgiDQo+Pg0KPj4gLSNkZWZpbmUgX0goX19oKSAoKHhjX2ludGVyZmFjZSAqKShfX2gpKQ0KPj4g
KyNkZWZpbmUgX0goX19oKSAoKigoeGNfaW50ZXJmYWNlICoqKURhdGFfY3VzdG9tX3ZhbChfX2gp
KSkNCj4+ICNkZWZpbmUgX0QoX19kKSAoKHVpbnQzMl90KUludF92YWwoX19kKSkNCj4NCj4gSSB0
aGluayB0aGlzIHJlcXVpcmVzIGFuIHVwZGF0ZSBpbiB4ZW5vcHNkIHRvbyB0byBtYXRjaCwgb3Ro
ZXJ3aXNlIGl0J2xsIGNyYXNoOg0KPiBodHRwczovL2dpdGh1Yi5jb20veGFwaS1wcm9qZWN0L3hl
bm9wc2QvYmxvYi9tYXN0ZXIvY19zdHVicy94ZW5jdHJsZXh0X3N0dWJzLmMjTDMyDQoNClVyZ2gu
wqAgSSdsbCB0YWtlIGEgbm90ZSB0byBkbyB0aGF0IHdoZW4gYnJpbmdpbmcgaW4gdGhlIGNoYW5n
ZS4NCg0KPiBUaGlzIHdhc24ndCBhbiBpc3N1ZSB3aXRoIHRoZSBvcmlnaW5hbCBwYXRjaCB3aGlj
aCB1c2VkIERhdGFfYWJzdHJhY3RfdmFsIGhlcmUsIGJlY2F1c2UNCj4gdGhhdCAoY3VycmVudGx5
KSBoYXBwZW5zIHRvIGJvaWwgZG93biB0byBqdXN0IGEgY2FzdCAod2l0aCBzb21lIEdDIG1ldGFk
YXRhICpiZWZvcmUqIGl0KSwNCj4gc28gdGhlIG9sZCB3YXkgb2YganVzdCBjYXN0aW5nIE9DYW1s
IHZhbHVlIHRvIEMgcG9pbnRlciBzdGlsbCB3b3JrZWQuDQo+DQo+IEhvd2V2ZXIgRGF0YV9jdXN0
b21fdmFsIGJvaWxzIGRvd24gdG8gYWNjZXNzaW5nIGEgdmFsdWUgYXQgK3NpemVvZih2YWx1ZSkg
b2Zmc2V0LA0KPiBzbyB4ZW5vcHNkIHdvdWxkIG5vdyByZWFkIHRoZSB3cm9uZyBwb2ludGVyLg0K
PiBQZXJoYXBzIGl0IHdvdWxkJ3ZlIGJlZW4gYmV0dGVyIHRvIGhhdmUgdGhpcyBfSCBkZWZpbmVk
IGluIHNvbWUgaGVhZGVyLCBvdGhlcndpc2UgZXh0ZW5kaW5nIFhlbmN0cmwgdGhlIHdheSB4ZW5v
cHNkIGRvZXMgaXQgaXMgcXVpdGUgYnJpdHRsZS4NCg0KRXhwb3J0aW5nIF9IIHdvbid0IGhlbHAg
YmVjYXVzZSBldmVyeXRoaW5nIGlzIHN0YXRpY2FsbHkgYnVpbHQuwqAgSXQncw0KYnJpdHRsZSBi
ZWNhdXNlIHhlbm9wc2QgaGFzIGdvdCBhIGxvY2FsIHBpZWNlIG9mIEMgcGxheWluZyBhcm91bmQg
d2l0aA0KdGhlIGludGVybmFscyBvZiBzb21lb25lIGVsc2UncyBsaWJyYXJ5LsKgIFRoaXMgdmlv
bGF0ZXMgbW9yZSBydWxlcyB0aGFuDQpJIGNhcmUgdG8gbGlzdC4NCg0KV2UgKFhlblNlcnZlcikg
c2hvdWxkIGRlZmluaXRlbHkgd29yayB0byBpbXByb3ZlIHRoaW5ncywgYnV0IHRoaXMgaXMNCmVu
dGlyZWx5IGEgeGVub3BzZCBwcm9ibGVtLCBub3QgYW4gdXBzdHJlYW0gWGVuIHByb2JsZW0uDQoN
Cn5BbmRyZXcNCg==

