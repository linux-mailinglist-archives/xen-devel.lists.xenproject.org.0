Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A5B4EF237
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 17:06:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297494.506820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIqg-0005rC-Oj; Fri, 01 Apr 2022 15:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297494.506820; Fri, 01 Apr 2022 15:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIqg-0005od-Kf; Fri, 01 Apr 2022 15:06:02 +0000
Received: by outflank-mailman (input) for mailman id 297494;
 Fri, 01 Apr 2022 15:06:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FwaM=UL=citrix.com=prvs=08375ea47=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1naIqf-0005oV-9K
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 15:06:01 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c5d0cdf-b1cd-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 17:06:00 +0200 (CEST)
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
X-Inumbo-ID: 3c5d0cdf-b1cd-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648825559;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=IcDh3n48SXGCltswn2QBP5U/83++9ulLmrd9BrfHZsE=;
  b=hZn4cigzoRIBPTQwiVrRKl2TOIPo6VsdCNAAwc0gHR0gFJQhTJrqoTYn
   d6gLSJypl9IPaVm2HR15NdKzG6q/+Uf8sr+AmXd1l/1s9/rwAtZ8MSDzi
   MLAu40sCobnt3mO0AS1Ffh6GXTJiay7TsAy0vnIIw3NNe9Bo12HpbdaZz
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67209521
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:aO2tcKwBtUgdHvMJrEt6t+clxirEfRIJ4+MujC+fZmUNrF6WrkVWn
 WEbXWrQPKqJajGgKo0gYYi190xXsMfXx95hTwE5/CAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NY02YHhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplqrOzSiwoN7f126dFYUZcEBsjLLZW5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 JBBOGc1NXwsZTVoP3tOEYIDwNypn2O4WjsCuHXLirootj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKhMQOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO/IV6wKmy6PO2kXaXlpbSj17Nc09pNBjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WvQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT1sTA3Dt4ade51q2VtW
 lBexKByC8hUUfmweNSlGrllIV1Qz6/t3MfgqVBuBYI90D+m5mSue4tdiBknehs5bZteI2e4M
 RKO0e+02HO1FCH1BUOQS9jsY/nGMIC6TYi1PhwqRoQmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu73ZUv2/Z9PlWLsL89EiOdD7nlnmQv7GMCqpzz6gOH2TCPEFt843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnKJqdRKdwBbcCBT6FKfg5U/S9Nv6zFOQQkJI/TQ3akga8pimaFUnf3P5
 XazRglTz1+XuJENAVnihqxLAF83YatCkA==
IronPort-HdrOrdr: A9a23:6r9PCqiIhfG073qDkmQGB50VIHBQX3p13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3IwerwRJVpQRvnhPpICRF4B8btYOCUghrWEGgE1/qi/9SAIVywygc578
 ZdmsdFeaXN5DRB/KTHCUyDYqsdKbq8geCVbIXlvgxQpGhRAskKhWoYe2Wm+w9NNXN77PICZc
 ChD6F81l2dkAEsH72G7w4+Lo7+TrPw5ffbSC9DIyRixBiFjDuu5rK/OQOfxA0iXzRGxqpn2X
 TZkiTij5/T8M2T+1v57Sv+/p5WkNzuxp9oH8qXkPUYLT3ql0KBeJlhYbufpzo4ydvfqmrC0e
 O85ivIDf4DrE85TVvF5ycFHDOQiQrG3kWSjWNwR0GT+fARCghKUPapzrgpDCcxo3BQze2Ulp
 g7gl5x/qAnfi8p1k7Glqj1fgAvmUyurXU4l+kPy3RZTIsFcbdU6ZcS5UVPDf47bWjHAa0cYa
 FT5fvnlb1rmJKhHgfkl3gqxMbpUmU4Hx+ATERHssuJ0yJOlHQ8y0cD3sQQknoJ6Zp4EvB/lq
 j5G7UtkKsLQt4dbKp7CutEScyrCnbVSRaJNG6JO1zoGKwOJnqIoZ/q57c+4v2sZfUzvdYPsY
 WEVEkduX85ekroB8HL1JpX8grVSGH4RjjpwtE23ekxhlQ9fsucDcSuciFaryL7mYRsPiTyYY
 fGBK5r
X-IronPort-AV: E=Sophos;i="5.90,227,1643691600"; 
   d="scan'208";a="67209521"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YzQTyeVIDG5dvI0U3bknoCXW//xuXhQZBmCQG+xbQszC38g4HRrjHv8iL3E5LBOkVZq96FKwfe52UcT7cOvRrhgxuVo7txc90Q3Y/f7U3Txw1oMwPU8/mLAlpXATWD8yI/9dNfyF+Y/A2qHbJyyoZEdOLoTVPcmagVDZfE74vjc1oIe4XsCq1TBcZ9t6sMUBwIudBdCTkFxuOx59Auuibcxz6TzK8PnK8FXd/obEofHcgr2UHr0iLXFzcJkJsPNFHebLh60JLmZXpvPayfddEewCNdmcer9GuW+B4xLRu6hLZiGstc/TyODWE/CoRgbS3LzQg9o15o2Zz5CmUK8agg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcDh3n48SXGCltswn2QBP5U/83++9ulLmrd9BrfHZsE=;
 b=AB8FOS3aYsTAdRuh++MqRmQpo4Ezlm8J7Xq2yGTOj7xhm48WZS2jWRtTfDEomn4yY/2g8KbpYkAoJRm/bkAU/0qBLaacdfwFo6ukoJ/bDHRSG6YeNadAaiz/M8ZgxbK8KaAvGCUPRDRJ5scTuTZS3ZXHXi+Xwq29nHeZnR3iO7z9o1kIZfbpChr9cwzvWWR0oy8+AQesEo+XmTOKp5vqN322YeYESVIIg6di0NS33xxEO5sRLBAOypd2rceZ1DKvrp7iVC3eNYN4rEHjdOnfPM99nF0uyVSHC+jiRNaPuN/+lCYQTzoLrR6eSwtnkGgdQ5PsCnCp3MdsOBqCutMbvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcDh3n48SXGCltswn2QBP5U/83++9ulLmrd9BrfHZsE=;
 b=IkWqhUMbPnwetS4aNILxKd+PC8T9m3HHzypaXoUejK9FV5N/cos3Y1NqXRp5Px2qjG/tChEcPtOFk2cSh4iPXovbcTOeIjIPCRfUiBc0DbGPprmm5apxtHULndvvE+u7wr3C1cDhCmNQn+F0X328a2ZcIZ5SXfAhtg2UIob7t0s=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH 1/2] tools/firmware: fix setting of fcf-protection=none
Thread-Topic: [PATCH 1/2] tools/firmware: fix setting of fcf-protection=none
Thread-Index: AQHYRdaC1Ty1lDbR3E6vxjqdlx39GKzbI4SAgAAExYA=
Date: Fri, 1 Apr 2022 15:05:54 +0000
Message-ID: <ed31e78b-087e-869b-8aa0-5d5d0f3183fd@citrix.com>
References: <20220401143720.23160-1-roger.pau@citrix.com>
 <20220401143720.23160-2-roger.pau@citrix.com>
 <e20b3d17-0c2a-b23f-d949-667072a54f58@citrix.com>
In-Reply-To: <e20b3d17-0c2a-b23f-d949-667072a54f58@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64118aef-3221-410e-3355-08da13f11e5a
x-ms-traffictypediagnostic: SN2PR03MB2158:EE_
x-microsoft-antispam-prvs: <SN2PR03MB2158EE69B6E6AB4C715673BBBAE09@SN2PR03MB2158.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h44GkBkNQl50vvC0u2+4v5OuhIQUGj5h0JrqCPzg7f9J2D57/YmEfY+WWG8Mn5uZStOzueyg95adaspv2wIf0AEsAZsrwZPO1jkMHpfMXR7WxKacUbCaT7xxr328iNjQ/6yXJK6mgWlCbFFrn+0MKX5rPsckajgl086r3WCkIezYW32yQ5+pV5ilXjbfNSEnKHD0rXvC77DDcfmTEss2J2bj8ucn7MtgIx5ljJacT1Kp8eikHRysD14ZbXNFJHYie5C97L6dlmiz6J790mAuXq0VUID7J3RHgdic4YbWUY1ZCIGI9hYPSma5t/v6T1kIniRyKsmGlzFlX36woJjJCtMGI4B05lqYM4VS6GnwxBQLV0pEGOPB3bSFQg9MyrYg5QcY6ZUMbD0Ie10FU3t6mwDwzgapN127yslem+RFUWMYYsMMwO+YX5B9uOmwsyeHJV2TdTi3XmKkcG+XOQOpmSb9hi82Rq9hVrbUKH3gMCEK6U3kHxZ/MZMG8SRR8yMwQFeVpOZKMpbcyeI7IMknrNxixRHxltuPW/bC+OUvtw1rSnzgiDbnDNRqeJF6racYABeUOeCB66WoiT7DM7tvCDA4X2DUZjH6z+GqB7N7giPAJWCOhFN7S44Dleb622a5n1O6mhJjw1wpoOALgEKOtSE53/uec7mqPJmgSKgdsAXlL58LjH0GibuxuU/+mTE3C0qXM6j41HAPAK0tnl34SfqHufHJzr/LMyMdcAwJkevrolMYfU+XgGja9w84vQ3rPaD9c3BgaWntC4BeOxDaag==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(8936002)(5660300002)(82960400001)(86362001)(508600001)(31696002)(31686004)(76116006)(6486002)(55236004)(66946007)(53546011)(91956017)(64756008)(6506007)(4326008)(8676002)(38100700002)(66446008)(66556008)(110136005)(6512007)(54906003)(66476007)(316002)(2616005)(107886003)(26005)(186003)(36756003)(122000001)(4744005)(2906002)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODg5dWsvMkFCYXBMd3RRZG56Tks1VHdTVUFLaUlNaWhQN1NrNjRrSHdxSzZ1?=
 =?utf-8?B?V3FJSTU3d2pBeHBMaDBXS2puMXBxWTNLZzRJbTV0aEw4NVN1YW1ERmJZNWtr?=
 =?utf-8?B?K2FnQVFjcmNlWk1tQ1RsTkw1V2p4UGZQSjVKcUVzdTlNVmk5NWVnOG9Vc2hv?=
 =?utf-8?B?eHVOM2xNcWFBZFpub1NjRUJIMjArRXJ0Z3dZQ1ltV2pnTHRWdjhIUlhPWWFu?=
 =?utf-8?B?UmRyYUpJNFJPV2d2a2I4Mk9vT2RrMXFLaXp2YUVyZlZibFkzcDBLeWxYejA3?=
 =?utf-8?B?TDhvSmMvSEFGZ3ZsVG5ML0Z5WWhRVEpjUVd5ZDJKQnMzai9DRmFucmgrYjNq?=
 =?utf-8?B?dU0xK08zbG1OVXhQZlY0S05oa2hpelFHbXJLYVRPSUtyWWYrTGkyMGVKMXFG?=
 =?utf-8?B?ZVowVlA2eWxVZVN2QURZbmZEam5vck5TTnh4clNuSmNTUXJFbExGak4wODdS?=
 =?utf-8?B?Nll4RlBiYjNLM2NsWWdXb3dwVW8zUk84SHZUTGNzT281SmcvTzcxL1BVOWNO?=
 =?utf-8?B?ck5IdmtteTdIU1JqVzJIMFVWSHA2ZXJhaEVsV1dGc1VwRlRYT05TZ3M5RXF1?=
 =?utf-8?B?MlhGL2l0K2xtL2RWT1NxS2FnczFqNXNaaTJIamc2bEdvRHNDd2d5c0YwT21K?=
 =?utf-8?B?UWx1c256YUNHclJ6eHZQcDMvbnpZMHlibUdxeHEvUGZhOE9hUjlKL0FSMHZN?=
 =?utf-8?B?bU83a3hydmlRbjFpWE1iY1hnWUc0em4vUjRVdzl3T2N5UHZtWWhQMS94ak5k?=
 =?utf-8?B?WjY4WWpKK0lJc3UzbFVPRGhPL0NuRFc0VElqblNVd2IyUjhZMEpqVm5rTjA3?=
 =?utf-8?B?a0xjNmhLVWErSEZXZ3NJazdXTWIxYjhoc1FhWUdLTmg5VTNFY3dnTWhqL3Za?=
 =?utf-8?B?Mmxva1pZMXM3YXpCeWthdE51SXpZZDV4L3NKR0pramFQUkdhNUN1cU9EMlI0?=
 =?utf-8?B?U1poZlF6c3A4ZnRjcFhsazFoYVdDMlhjT0svaWd6aWlWS2h3QjEvcHhkVVV2?=
 =?utf-8?B?M2h1OGRUT2V6NkMrRkg5T0hsWlhQQS9ZWDU5TGFGV2xKcmpzaEJFZEh0SjFR?=
 =?utf-8?B?YXlHa2xLZjdaRUx5WUt1cTRiempodUhWNzkrNTMreHZ2b1IraVNZVGtoRy9q?=
 =?utf-8?B?emkzVStiWnU5NGlLbWUyQU10VGs1L294MUhnV3RJZGZDWmZoS3ZRSi9zSjJ6?=
 =?utf-8?B?TVR6THlKR29FMW5wbHJMaWZ4aFZSQ1RITUowMkZaK05Pbnh5SGEzM2Q2VGFS?=
 =?utf-8?B?ZUpzZW93S25HRkhmYnhoODFJQUhZKzBycnVtUW10ZVFuT3pzUFdNMElGUHBr?=
 =?utf-8?B?M2lDcmRNUHZMU2o5eFhnVXljdkRGaStVc1Q0U1Q0SEtVa2VwQ0lyNUhaMDJj?=
 =?utf-8?B?ZU90RVlWYWNIYnpKQVlGWWVkaVpvOUx5dFdKMjdqNHg1eHVRR3l1aFdmc2Ur?=
 =?utf-8?B?RnVWNmVUQUJvUmZrWUd4RTFpYWQ5MlNrKzBLeXF3ZzlRS0MxVVpzOXVhTjZK?=
 =?utf-8?B?ZUkvWGJnd3l6elNMRHlXdmlVL3hQODRmZEpSWDNtMzUvS2w1aTIyWC81b01D?=
 =?utf-8?B?dDhlL0lSak95alVURkpuMm83Sy9pejlsRktyYTA2bXg4MHVsd0ExV2NEclRQ?=
 =?utf-8?B?WEs3U2g2VGdhcG5mTkFyM205Q2QwSkN4SjVLSDhMTk5ZT0hlZThBbHpOcExa?=
 =?utf-8?B?TEhVOHU3MmxBMEkrUHRLZzF2aUtnOWlteCt0Q1JzVlhNUU80TzRDVUFZSTNL?=
 =?utf-8?B?RUZPTFpmNHFSaFVCZmoxYkpGK1IzYWVvdTRYdlNmU0w0dm83a29neTVQOC9m?=
 =?utf-8?B?TjFPS1hVSDFPdk1YVUFaUmVRYTlNeGFZTmdFSytRYnpMeXhwc0VSbEoydDgv?=
 =?utf-8?B?a3Q4VlI3NWRjQWtmMyswd3g1Sm5ZL01sVUZMTnNQUnJrcEtlT291dnpic1NF?=
 =?utf-8?B?dGx3S1Fnb2hESi9XMlhmWTBQK0hCV2syZUVLNzkrZ0ZkTkY4OTZHRmQ4RVdl?=
 =?utf-8?B?VjZaTnE1U2t0UG4xSnVKaFgrNTAxU3dCa1hkK1NBTGNpeS9QM0NUYkUxS2RU?=
 =?utf-8?B?U3A5WDg0SzdzeEpUSFhuK0VESXdmcGJBd1gzOVhHa3g2QXR6dE1DZTJlZTVi?=
 =?utf-8?B?c3RkclNGa25jcDV2MHZNWTNyL0wwWWtGdDB1TStaczdCbllGekpDWWN2YXhz?=
 =?utf-8?B?b2YvRk9vbmVQa2NqdUxQV2taVlF3RXJlRWpXTWYwNUc5aHR0TFQxWTNWdU5k?=
 =?utf-8?B?bVM0eUhEaFpxTm9TSmpPUlBYd09rZXpYNUZxVXVPaEFHWkRiblFpYnFpREZV?=
 =?utf-8?B?dVlLR0d6UFROOGRxM0cxS25zZnJSRXQ0REgwRCtkeE40WVhMYTR4UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7189EE020F33414B9EC8ADCEC0CA1AEF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64118aef-3221-410e-3355-08da13f11e5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2022 15:05:54.2526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2cTBjdNodnMp5hCEfvDD4dlb/BGJ8FhEdVr7oPbBUUFfdkI3mjJQnJE+h41d/gAR4YBx/kkDCxDC1W01WJZwUKInVIFNj0IhcLnFIHbb/f0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2158
X-OriginatorOrg: citrix.com

T24gMDEvMDQvMjAyMiAxNTo0OCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDEvMDQvMjAy
MiAxNTozNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPj4gU2V0dGluZyB0aGUgZmNmLXByb3Rl
Y3Rpb249bm9uZSBvcHRpb24gaW4gRU1CRURERURfRVhUUkFfQ0ZMQUdTIGluIHRoZQ0KPj4gTWFr
ZWZpbGUgZG9lc24ndCBnZXQgaXQgcHJvcGFnYXRlZCB0byB0aGUgc3ViZGlyZWN0b3JpZXMsIHNv
IGluc3RlYWQNCj4+IHNldCB0aGUgZmxhZyBpbiBmaXJtd2FyZS9SdWxlcy5taywgbGlrZSBpdCdz
IGRvbmUgZm9yIG90aGVyIGNvbXBpbGVyDQo+PiBmbGFncy4NCj4+DQo+PiBGaXhlczogMzY2N2Y3
ZjhmNyAoJ3g4NjogSW50cm9kdWNlIHN1cHBvcnQgZm9yIENFVC1JQlQnKQ0KPj4gU2lnbmVkLW9m
Zi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IEFja2VkLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQpUaGlzIGFsc28g
bmVlZHMgYmFja3BvcnRpbmcgd2l0aCB0aGUgWFNBLTM5OCBDRVQtSUJUIGZpeGVzLg0KDQp+QW5k
cmV3DQo=

