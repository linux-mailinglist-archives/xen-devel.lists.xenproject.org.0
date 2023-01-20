Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED945675BAC
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 18:36:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482043.747343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIvJK-00061p-21; Fri, 20 Jan 2023 17:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482043.747343; Fri, 20 Jan 2023 17:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIvJJ-000605-Uc; Fri, 20 Jan 2023 17:36:17 +0000
Received: by outflank-mailman (input) for mailman id 482043;
 Fri, 20 Jan 2023 17:36:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vlkl=5R=citrix.com=prvs=3778cfab1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pIvJI-0005zz-5k
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 17:36:16 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee1d2d07-98e8-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 18:36:12 +0100 (CET)
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jan 2023 12:36:05 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6865.namprd03.prod.outlook.com (2603:10b6:303:1b5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Fri, 20 Jan
 2023 17:36:03 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.024; Fri, 20 Jan 2023
 17:36:03 +0000
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
X-Inumbo-ID: ee1d2d07-98e8-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674236172;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oqEnxtvyof8znt0qn7lvlru2ub9fDToLj+p44VLQhUY=;
  b=QZKAlrfza1xGsQoy4NHCz46pXK6O6ibJpbB25b8+y1A2poSiUyuwyMyu
   FeqHgRCHb8i+VDZ7H13JzDOanbwdc8CCNP41OMEnf7oIeqNtTLp1uPJUa
   1NBPEKJ98QY7izse0UXurvK5ryDOQ8Q+CHISRqErTOI6pjmPaqDxpUbqm
   Q=;
X-IronPort-RemoteIP: 104.47.66.48
X-IronPort-MID: 96001523
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lINmbaobMRhZo21qzmbAOEoHgTBeBmIuZBIvgKrLsJaIsI4StFCzt
 garIBnUaPiCYjanfd8kOtm0pk9Xv8eEzdNkQANp/Cs8QSIVp5uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weHzSFNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAHc/dQ2vtsCS+674QLBsqcgFFc3UPKpK7xmMzRmBZRonabbqZvyQoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3juarbIq9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOzmrqYz3QfIroAVICYnCHm2i/W2sFCVdehgA
 hVX5Bg0hqdnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBebSAr0
 3eZktWvAiZg2JWFRHTY+rqKoDeaPSkOMXREdSICVREC4dTovMc0lB2nczp4OKu8j9mwHC6qx
 TmP9XI6n+9L0Z5N0Lin91fahT7qvoLOUgM++gTQWCSi8x99Y4mmIYev7DA38Mp9EWpQdXHZ1
 FBspiRUxLlm4U2l/MBVfNgwIQ==
IronPort-HdrOrdr: A9a23:RTxWg6un/VAqCpkJ9aLAMK2y7skDc9V00zEX/kB9WHVpm62j5q
 aTdZEgviMc5wxhPE3I9erhBEDiewK6yXcW2+Qs1N6ZNWGNhILPFvAA0WKI+UyEJ8SRzJ8+6U
 5WScRD4QzLbGST3K7BjjVRTb4br+W6zA==
X-IronPort-AV: E=Sophos;i="5.97,232,1669093200"; 
   d="scan'208";a="96001523"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdKWkmoyho6462BUo8Mre7WMMj5VUDB2zZp5iMvjk45WIm1fVP87eRfUhVk/tnIIPT7fjX1ygLwxvM5+mYERqrAkkf0nEBi2PmUi8raQzboChLiz4XIjFYtHXOWnUQD7qJovzBdj6MgjO/I1m7z+oRkOCN99XmGHkQOnDYj0JqtCwPlauV9R1b9wIECcHbAezLJiYfOFBfotAkr6PQKImb/WqdsAPJsuuF09n6I/Vk8zIs1CmAHDg4JDzWHG3F0o4Z015eACdY+Z5FPKLzi6SFh5mGTl95HUsZ0Ef7V1RRPHQfiwxIrtQGFTDH3W/k6QR6BL/0Ia2VJqvXA8CeiISw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqEnxtvyof8znt0qn7lvlru2ub9fDToLj+p44VLQhUY=;
 b=TMFnNcx9SG/SP33U9azhaERHHLPShaTH1ytatSmXweLGXcPgsp3R1DfcyjsB1WebldSVaA0/fuB1px/s+99PD+fgA10opwdEnTCS6ybjjlqs+hf29b9YhAjqFmHhmgdiJxXuB+6/SjFgvJ1zdc1vOzsH6NnMa8m8qSYx8/mRtg6MtF+u0MxJk+CCtarAw3xOVmvoiICt5sy97LUoRlMTepuiIBI3S9sfh3zm6Sn+vd2PlD/C+JyEgucc29IH4Gp1w+1wWTjPvQfFe5gi79vYciYVXo0+6r35IwTDVyhsEdU6BlZ0WZAu+XVPJmOD6VhoLoQlO5j4+uKqgFmIvjHMXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqEnxtvyof8znt0qn7lvlru2ub9fDToLj+p44VLQhUY=;
 b=rmh5HIiT6oid+UAktE/0mHowXu97orF0AqkgusRsyu8FK/OZUln/AMN1WKorhRjv/rrk64fIJNk60TNxcAP/2KoWheHPbFhY0yij49WGh8+ZnlvV7ZpUrkDOFj94Wwdv/XR1rEzFq9uOgbow0FFc/ykylpc7gtG3yOdKEmAg9KA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 9/9] x86/shadow: harden shadow_size()
Thread-Topic: [PATCH v2 9/9] x86/shadow: harden shadow_size()
Thread-Index:
 AQHZJcS6xQlTtpJxX0O79yAhgOZJ+66Z2cOAgACwbwCAAAw+gIAAA0qAgAhqSQCAAT6YAIADXTAA
Date: Fri, 20 Jan 2023 17:36:02 +0000
Message-ID: <97f74b0a-5d70-9f8b-1e39-f8ff22650984@citrix.com>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
 <9bea51eb-4fbd-b061-52d7-c6c234d060a1@suse.com>
 <c5d201ac-89ca-6baa-d685-5bef2497183f@citrix.com>
 <a438f16b-7d45-d7e4-2191-4ed7b2077785@suse.com>
 <71e7ba34-f1ea-16fd-ec01-bb2aa454270c@citrix.com>
 <b49793f8-55be-0746-815d-ab7b627d3baa@suse.com>
 <733edba4-6913-97a4-f949-4f8899a3bba9@citrix.com>
 <58790f2f-ba46-df0c-2620-370e3994faea@suse.com>
In-Reply-To: <58790f2f-ba46-df0c-2620-370e3994faea@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MW4PR03MB6865:EE_
x-ms-office365-filtering-correlation-id: a1593ce8-7dfa-4147-a088-08dafb0ccd5d
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 oqxAYTwQFiW0IOCJlzulBdrbddmkP2ovvqnyeCCE+vELtqDOs2+nMVcj4dooxQz08oZCgEzkv8TbbxpTwTY2KBXm24ULJf6gPxG9eRdLQkuLqgaMmeQcRfyoRu93NvI2VIi48cqijFq3XSAMlbBK3SjlR0ScZNG58CsIhwo4e1WWAC7IkehRziO6tXG0gSb8s/Ceu1yH3mibAI1SpMgqYKNYcTTJbLc7dF9l021OureFXb9eA0fHbSbnHFFRsN68JNF8hbmJrJB6lhHGaUkk4QS61rpC0DD3/H5Ik4YKYt6t+wPQ6W7DQ4wfnipHVfVoTGO42Du5efF3JuuJkX6ScfLe/i4HMRhX7c0RpmbSE5ZK3tpjQikVQnkmb9FlR6OA8ND3dhyZGYIucCiNpfuGv2EXxfl0aKNHJbw6Hd25UcgKKBoFm9hns+8xR/mp6LPgiCA4UOJ3IcpAqzbuArrOseSr3nTajxJWSEyv9zlSmvKuHkbMzbL0nh+QCC3EhNtkLR8NYXimSfrvEI4ZkxWf2BwqsU39QFmNtbgLRDu9oeO7HOpLlWcnul5dSM4pUf4FQjbzaSVmLexBiYUxP8s2rRnqJ9zIhUSrLAZjZJ6p3DzweKtwyW2d/Kcs6YKlrAdIaFJTJJK5vIxFEq1Nyzxc7eOnqp9+A8+hNISv7GxEHYk1M4p6n8wyG1mF7QnmJRxr5T4odeoH7prBw/RSGkNMo3loEyMh5IhKXhqdG407AjA7ou8T8dsVNGvFJ9fxk7/18bKOsHlTxIRQmDqtWWklig==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199015)(6506007)(5660300002)(478600001)(6512007)(186003)(53546011)(26005)(2616005)(6916009)(66446008)(66946007)(76116006)(54906003)(8676002)(91956017)(64756008)(316002)(83380400001)(8936002)(31686004)(4326008)(41300700001)(66476007)(66556008)(6486002)(38100700002)(38070700005)(31696002)(2906002)(122000001)(82960400001)(71200400001)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WHE3LzhZRGp6b2FuTjk3WWsxbUlxczdVaXU3VDJhMDE0SG54QmhjcmR2L1ND?=
 =?utf-8?B?aEFUbGpXblhJQ04vbXhwS0JFSHBtSzBlSkdUbnZCTWJObjd6RlRVYUlGS3M2?=
 =?utf-8?B?dm1qay9raTZxc3UwZ3g1R0dDUldQc25YNWt4bDQ2TTNPOHZZOEZRK20zQ3dm?=
 =?utf-8?B?K3JwK3lKVGlQM0cxL3NERkkvcHcyZE8xeEIvZjJtSGQ2V2xobzZ1NmMycDdH?=
 =?utf-8?B?VHBJOXBIREQvaTdkcEdMSldmT1BNMXBpSDE0Vnl4aVJuRkZoS3dHRjZnR25x?=
 =?utf-8?B?YmlKTTdrSXlVTzdzaHhXbjRWR0Y5RzlMalh3MTE2aHFzZ1FXVXhqSWswOEtr?=
 =?utf-8?B?VkxrMFJCWE1ucTF0aHBpcjdWbHNwUWNUTk5HcFlVUTRqd2R1a013c0NjMWwx?=
 =?utf-8?B?SzFCZVZJSWVWZU1KRmh6bEJYRm5TcFRTb2hrUjN3VzZRSkpmWkJNaDJzWWI1?=
 =?utf-8?B?dE9USE9qQW1jTHJSSXhxK003VlN5YlFWZUJUZVp3QUJlQlM2N3BuSGNYRGwy?=
 =?utf-8?B?bVVuaWk3WVFXeFA0eWlZWkNvd1pDSUlwVmkrMDY1Zlp4dG5ScmpnbUk4UDNh?=
 =?utf-8?B?R2xNVWppVUMzTVNaZUZzQ0hWNVRUTkdISDJPVU80MStxelVuL2lNU1VHdXFo?=
 =?utf-8?B?QlVEb01NSFcxeHp5c3o3eXFhdzBrZ2x0a1YzT0E1OFNPS0xtcVlvbXAvWjFM?=
 =?utf-8?B?WVFMREdlSFlaNU9tSlZ2eWh0UmJVNFBBYU1nZmJmVnMvK2ZEY3ZTd2JnLzJM?=
 =?utf-8?B?MUpuK25FaDNXdjBGamE2YlJqeWtCSXFzK3M3Q0NmY3A4YXBTQjZ2RXh6d1pO?=
 =?utf-8?B?WXdqOXNHMGQvL2E3MW1wTkJBUjIySFk4bTByYzA5MmlkSFY2M2hGOVRUQjVz?=
 =?utf-8?B?bkxxbTRieFlEcnFGMkNHaGxxak9sOXkyM3NoR1lFUGlEaUt4RmhQMnpWZ2FN?=
 =?utf-8?B?Nm5CR2M1UlNoUDBweG9oM2cyN2oyQzNVUzJKcjRscEZnYUF0d3BCNjVsbWVG?=
 =?utf-8?B?OEFaWmpNUVRKRzFaWDJlWDR5R21ISFZTemplUHJBTGErbnRBSk41K1Y2eXdW?=
 =?utf-8?B?NWxpak9NTE5WWGY3dUwwT3dIdENwTHM4VkRQamduaWxkQ05QN0ZxNnpuMHNU?=
 =?utf-8?B?Z0V1SGpOUmlLUjF5OFc0aStPaVMzVDgrc3N4QXF4YVVtU3QyQjdHN1IrYTZP?=
 =?utf-8?B?Qkh2di9mamRKbDFNUW85ZDlTc2drVmJPNkdWT2hOaHZFUUhENEcvOUJob3Fm?=
 =?utf-8?B?NHJhc0R1cHBtQzM4RHRwQnhkT2FxZDJCYlR6ZzRMTkNkYnBvTGllaE5SaHlZ?=
 =?utf-8?B?d212ZjhvN0VpbmVhMXlkMFBKZWhXVFMzU1BDeXFPS21PSmdRcXFLSkN0Sjdz?=
 =?utf-8?B?NWhRdWkyQnRQcmRUK2d0WXNFNzhjQjg5SXVCY3VFOVpwbDNaWHBheDlxc0pY?=
 =?utf-8?B?QVhpMHBSUW55ZmJEeDg4QkxvUWJYckFSaUM3a0E2OXRhSTN4VTNONFNqMlA3?=
 =?utf-8?B?dldCQ0lMSk9Wbit0eWNsdG1acUZPSytLdTJ6RDVJWm9ObFZXUTBuYnNKeklM?=
 =?utf-8?B?dklEOGU4VG12ZDFsellKSXQ2bmNDMVNxRjd0S0hxL0cxYjRZQ3RRclptMzQ5?=
 =?utf-8?B?WU9CMlI0bVpuWkJaZlVjMHk5NnNIMnVXY3Q1a00wMk91NS9RRmZVaVRUSk5V?=
 =?utf-8?B?SGpsU1JMUkN4QW5hZlNNQ2dpZ1VZTDZvblIxWmtUbXlETWMzcTQ3TFAvYTBR?=
 =?utf-8?B?alpmSFY0R25FKzNMNXpRZnRjTEJWRllaQm1JNmNDK215bE5TZ0wvczU4dUVX?=
 =?utf-8?B?ZmltOWYrUjErSFEzMmh2R2Q5Y0lPUUJ0ZXBsWnBhU0JYZ1BsdmpLVXk5U29H?=
 =?utf-8?B?TjVoNmZlNjlYT08vL2trM1dxMEQ2aHptRXpaNHRpR3licXE3RDlocDZtNjl2?=
 =?utf-8?B?dFE4RHJiU0R0ODQzZm11TG5KTngwVlRNNHVHWkwxM0pNNzkxd05HTzBXejB0?=
 =?utf-8?B?T3JTMGJYNG84VmdwcHZ6N3Jqa3pKVTlxZkY4R0J3NDlpZFlzNVBDZG1MSXY1?=
 =?utf-8?B?V0NyQTNpVmF6ZFhpbUtCZVQrMlZQM0EvVXlCbkg0M2gyY21sTFlVYlRmeGha?=
 =?utf-8?B?MnZIajAvL0RuazFCOWU2NzFvbjhpZnJBQ3NBczJqTXZsWjE3d3I3c1VOcXFV?=
 =?utf-8?B?K1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <596681536EF28C4FAE8797F56AABD189@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	P9PzYsmFhJXICNdQHKSfNMpZAgr+1RUM/KsZY+zxctNMBf1THpHNkpKfD5hByCbrG8E+MkMXOhfJ5Q06QPTcrtPk6ghxW/tCSrPTOyzIfNCcXDZexcSNl6EKNkNf4ppEkGw021/aMVs1vDhVoexw7Al964RSHLQ38sONCpPDB1Nu6Tkvc4bwO4CWrhQfaxsQFPT5Z1cLK3x9qYXkilqKeCda43E90pe4AOcREHhkeLEujv/L4owwU3lzBw1GEvSuJEWKZ++deXFIxZ5mL7Z1caMw49POcuCaA8yA2blI/2RUCeDn4Yrta0czJLovhCyWlOsIGQiLE9LKOKhDE6C7NUR/a+iPzKMuAuYHGgUDBiBaJDQPLlNy8fNjJCQjXTMllIP/Sc+qIqlV9YnSurliH3qOed2XvvFM8ACOrU6nmDH5p6DHKNDO8CS6rfhTZyfXbNLv+YvHiSVSRWiWIM0lxmyQs5HRTLj6fZFNJSa3sbJigSQo9bXSjWpU25y+A0riWHF9rKS4zVcsEETkGL7p0ObSmNNiD0JEBdf+mNACmPG92jrIOATynNnDtSXfWKfrlgx+YOBpPUZSXn6Twzu/476J7rZ3zIVQc8XVE2znSIzK1Zjel6FOqm+WvHh34tROvmlmnpKFUcz1OLa2TH+oqaamf7OVT1CYA5gq6MOBSDRlZvN5GSbtz59qyuTUZeFjsMMnVAzMmngsth2//EjRd+AEUNEts9zOd28nuukt9+iAfCnNle6K0rbv6S1oTRFtRn6Fk+1OGX7+7ut14i4M5UASfvq4Vf9Wno07gFW9QWS3R3N6md7LM/UI3qNt9jq8
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1593ce8-7dfa-4147-a088-08dafb0ccd5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 17:36:02.9834
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OtrBjM/krzXDiIFopx5plv9UD2VW21o0XRDA2LsrahPGZGLTeSorfrHHAhMgscDrb+SwM3UemrCCQp+h9r4DD9A25XM4JIWN+It0+L9Af0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6865

T24gMTgvMDEvMjAyMyAyOjEzIHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTcuMDEuMjAy
MyAyMDoxMywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDEyLzAxLzIwMjMgMTA6NDIgYW0s
IEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDEyLjAxLjIwMjMgMTE6MzEsIEFuZHJldyBDb29w
ZXIgd3JvdGU6DQo+Pj4+IE9uIDEyLzAxLzIwMjMgOTo0NyBhbSwgSmFuIEJldWxpY2ggd3JvdGU6
DQo+Pj4+PiBPbiAxMi4wMS4yMDIzIDAwOjE1LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+Pj4+
IE9uIDExLzAxLzIwMjMgMTo1NyBwbSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+IE1ha2Ug
SFZNPXkgcmVsZWFzZSBidWlsZCBiZWhhdmlvciBwcm9uZSBhZ2FpbnN0IGFycmF5IG92ZXJydW4s
IGJ5DQo+Pj4+Pj4+IChhYil1c2luZyBhcnJheV9hY2Nlc3Nfbm9zcGVjKCkuIFRoaXMgaXMgaW4g
cGFydGljdWxhciB0byBndWFyZCBhZ2FpbnN0DQo+Pj4+Pj4+IGUuZy4gU0hfdHlwZV91bnVzZWQg
bWFraW5nIGl0IGhlcmUgdW5pbnRlbnRpb25hbGx5Lg0KPj4+Pj4+Pg0KPj4+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+Pj4+Pj4+IC0tLQ0KPj4+
Pj4+PiB2MjogTmV3Lg0KPj4+Pj4+Pg0KPj4+Pj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vc2hh
ZG93L3ByaXZhdGUuaA0KPj4+Pj4+PiArKysgYi94ZW4vYXJjaC94ODYvbW0vc2hhZG93L3ByaXZh
dGUuaA0KPj4+Pj4+PiBAQCAtMjcsNiArMjcsNyBAQA0KPj4+Pj4+PiAgLy8gYmVlbiBpbmNsdWRl
ZC4uLg0KPj4+Pj4+PiAgI2luY2x1ZGUgPGFzbS9wYWdlLmg+DQo+Pj4+Pj4+ICAjaW5jbHVkZSA8
eGVuL2RvbWFpbl9wYWdlLmg+DQo+Pj4+Pj4+ICsjaW5jbHVkZSA8eGVuL25vc3BlYy5oPg0KPj4+
Pj4+PiAgI2luY2x1ZGUgPGFzbS94ODZfZW11bGF0ZS5oPg0KPj4+Pj4+PiAgI2luY2x1ZGUgPGFz
bS9odm0vc3VwcG9ydC5oPg0KPj4+Pj4+PiAgI2luY2x1ZGUgPGFzbS9hdG9taWMuaD4NCj4+Pj4+
Pj4gQEAgLTM2OCw3ICszNjksNyBAQCBzaGFkb3dfc2l6ZSh1bnNpZ25lZCBpbnQgc2hhZG93X3R5
cGUpDQo+Pj4+Pj4+ICB7DQo+Pj4+Pj4+ICAjaWZkZWYgQ09ORklHX0hWTQ0KPj4+Pj4+PiAgICAg
IEFTU0VSVChzaGFkb3dfdHlwZSA8IEFSUkFZX1NJWkUoc2hfdHlwZV90b19zaXplKSk7DQo+Pj4+
Pj4+IC0gICAgcmV0dXJuIHNoX3R5cGVfdG9fc2l6ZVtzaGFkb3dfdHlwZV07DQo+Pj4+Pj4+ICsg
ICAgcmV0dXJuIGFycmF5X2FjY2Vzc19ub3NwZWMoc2hfdHlwZV90b19zaXplLCBzaGFkb3dfdHlw
ZSk7DQo+Pj4+Pj4gSSBkb24ndCB0aGluayB0aGlzIGlzIHdhcnJhbnRlZC4NCj4+Pj4+Pg0KPj4+
Pj4+IEZpcnN0LCBpZiB0aGUgY29tbWl0IG1lc3NhZ2Ugd2VyZSBhY2N1cmF0ZSwgdGhlbiBpdCdz
IGEgcHJvYmxlbSBmb3IgYWxsDQo+Pj4+Pj4gYXJyYXlzIG9mIHNpemUgU0hfdHlwZV91bnVzZWQs
IHlldCB5b3UndmUgb25seSBhZGp1c3RlZCBhIHNpbmdsZSBpbnN0YW5jZS4NCj4+Pj4+IEJlY2F1
c2UgSSB0aGluayB0aGUgcmlzayBpcyBoaWdoZXIgaGVyZSB0aGFuIGZvciBvdGhlciBhcnJheXMu
IEluDQo+Pj4+PiBvdGhlciBjYXNlcyB3ZSBoYXZlIHN1aXRhYmxlIGJ1aWxkLXRpbWUgY2hlY2tz
IChIQVNIX0NBTExCQUNLU19DSEVDSygpDQo+Pj4+PiBpbiBwYXJ0aWN1bGFyKSB3aGljaCB3b3Vs
ZCB0cmlwIHVwb24gaW5hcHByb3ByaWF0ZSB1c2Ugb2Ygb25lIG9mIHRoZQ0KPj4+Pj4gdHlwZXMg
d2hpY2ggYXJlIGFsaWFzZWQgdG8gU0hfdHlwZV91bnVzZWQgd2hlbiAhSFZNLg0KPj4+Pj4NCj4+
Pj4+PiBTZWNvbmRseSwgaWYgaXQgd2VyZSByZWxpYWJseSAxNiB0aGVuIHdlIGNvdWxkIGRvIHRo
ZSBiYXNpY2FsbHktZnJlZQ0KPj4+Pj4+ICJ0eXBlICY9IDE1OyIgbW9kaWZpY2F0aW9uLsKgIChJ
dCBhcHBlYXJzIG15IGNoYW5nZSB0byBkbyB0aGlzDQo+Pj4+Pj4gYXV0b21hdGljYWxseSBoYXNu
J3QgYmVlbiB0YWtlbiB5ZXQuKSwgYnV0IHdlJ2xsIGVuZCB1cCB3aXRoIGxmZW5jZQ0KPj4+Pj4+
IHZhcmlhdGlvbiBoZXJlLg0KPj4+Pj4gSG93IGNvdWxkIGFueXRoaW5nIGJlICJyZWxpYWJseSAx
NiI/IFN1Y2ggZW51bXMgY2FuIGNoYW5nZSBhdCBhbnkgdGltZToNCj4+Pj4+IFRoZXkgZGlkIHdo
ZW4gbWFraW5nIEhWTSB0eXBlcyBjb25kaXRpb25hbCwgYW5kIHRoZXkgd2lsbCBhZ2FpbiB3aGVu
DQo+Pj4+PiBhZGRpbmcgdHlwZXMgbmVlZGVkIGZvciA1LWxldmVsIHBhZ2luZy4NCj4+Pj4+DQo+
Pj4+Pj4gQnV0IHRoZSB2YWx1ZSBpc24ndCBhdHRhY2tlciBjb250cm9sbGVkLsKgIHNoYWRvd190
eXBlIGFsd2F5cyBjb21lcyBmcm9tDQo+Pj4+Pj4gWGVuJ3MgbWV0YWRhdGEgYWJvdXQgdGhlIGd1
ZXN0LCBub3QgdGhlIGd1ZXN0IGl0c2VsZi7CoCBTbyBJIGRvbid0IHNlZQ0KPj4+Pj4+IGhvdyB0
aGlzIGNhbiBjb25jZWl2YWJseSBiZSBhIHNwZWN1bGF0aXZlIGlzc3VlIGV2ZW4gaW4gcHJpbmNp
cGxlLg0KPj4+Pj4gSSBkaWRuJ3Qgc2F5IGFueXRoaW5nIGFib3V0IHRoZXJlIGJlaW5nIGEgc3Bl
Y3VsYXRpdmUgaXNzdWUgaGVyZS4gSXQNCj4+Pj4+IGlzIGZvciB0aGlzIHZlcnkgcmVhc29uIHRo
YXQgSSB3cm90ZSAiKGFiKXVzaW5nIi4NCj4+Pj4gVGhlbiBpdCBpcyBlbnRpcmVseSB3cm9uZyB0
byBiZSB1c2luZyBhIG5vc3BlYyBhY2Nlc3Nvci4NCj4+Pj4NCj4+Pj4gU3BlY3VsYXRpb24gcHJv
YmxlbXMgYXJlIHN1YnRsZSBlbm91Z2gsIHdpdGhvdXQgZmFsc2UgdXNlcyBvZiB0aGUgc2FmZXR5
DQo+Pj4+IGhlbHBlcnMuDQo+Pj4+DQo+Pj4+IElmIHlvdSB3YW50IHRvICJoYXJkZW4iIGFnYWlu
c3QgcnVudGltZSBhcmNoaXRlY3R1cmFsIGVycm9ycywgeW91IHdhbnQNCj4+Pj4gdG8gdXAgdGhl
IEFTU0VSVCgpIHRvIGEgQlVHKCksIHdoaWNoIHdpbGwgZXhlY3V0ZSBmYXN0ZXIgdGhhbiBzdGlj
a2luZw0KPj4+PiBhbiBoaWRpbmcgYW4gbGZlbmNlIGluIGhlcmUsIGFuZCBub3QgaGlkZSB3aGF0
IGlzIG9idmlvdXNseSBhIG1ham9yDQo+Pj4+IG1hbGZ1bmN0aW9uIGluIHRoZSBzaGFkb3cgcGFn
ZXRhYmxlIGxvZ2ljLg0KPj4+IEkgc2hvdWxkIGhhdmUgY29tbWVudGVkIG9uIHRoaXMgZWFybGll
ciBhbHJlYWR5OiBXaGF0IGxmZW5jZSBhcmUgeW91DQo+Pj4gdGFsa2luZyBhYm91dD8NCj4+IFRo
ZSBvbmUgSSB0aG91Z2h0IHdhcyBoaWRpbmcgdW5kZXIgYXJyYXlfYWNjZXNzX25vc3BlYygpLCBi
dXQgSSBmb3Jnb3QNCj4+IHdlJ2QgZG9uZSB0aGUgc2JiIHRyaWNrLg0KPj4NCj4+PiBBcyB0byBC
VUcoKSAtIHRoZSBnb2FsIGhlcmUgc3BlY2lmaWNhbGx5IGlzIHRvIGF2b2lkIGENCj4+PiBjcmFz
aCBpbiByZWxlYXNlIGJ1aWxkcywgYnkgZm9yY2luZyB0aGUgZnVuY3Rpb24gdG8gcmV0dXJuIHpl
cm8gKHZpYQ0KPj4+IGhhdmluZyBpdCB1c2UgYXJyYXkgc2xvdCB6ZXJvIGZvciBvdXQgb2YgcmFu
Z2UgaW5kZXhlcykuDQo+PiBJJ20gdmVyeSB1bmVhc3kgYWJvdXQgaGF2aW5nIHNvbWV0aGluZyB0
aGlzIGRlZXAgaW5zaWRlIGEgY29tcG9uZW50LA0KPj4gd2hpY2ggQVNTRVJUKClzIGNvcnJlY3Ru
ZXNzIGRvaW5nIHNvbWV0aGluZyBjdXN0b20gbGlrZSB0aGlzICJqdXN0IHRvDQo+PiBhdm9pZCBj
cmFzaGluZyIuDQo+Pg0KPj4gVGhlcmUgaXMgZWl0aGVyIHNvbWV0aGluZyBpbXBvcnRhbnQgd2hp
Y2ggbWFrZXMgdGhpcyBtb3JlIGxpa2VseSB0aGFuDQo+PiBtb3N0IHRvIGdvIHdyb25nIGF0IHJ1
bnRpbWUsIG9yIHRoZXJlIGlzIG5vdC7CoCBBbmQgaG9uZXN0bHksIEkgY2FuJ3Qgc2VlDQo+PiB3
aHkgaXQgaXMgbW9yZSByaXNreSBhdCBydW50aW1lLg0KPiBXZWxsLCBva2F5LiBJIGRpZCBleHBs
YWluIHdoeSBJIHRoaW5rIHRoZXJlIGlzIGFuIGluY3JlYXNlZCByaXNrIGhlcmUuDQo+DQo+PiBJ
ZiB3ZSByZWFsbHkgZG8gbmVlZCB0byBjbGFtcCBpdCwgdGhlbiB3ZSBuZWVkIGEgYnJhbmQgbmV3
IGhlbHBlciB3aXRoIGENCj4+IG5hbWUgdGhhdCBkb2Vzbid0IHJlZmVyZW5jZSBzcGVjdWxhdGlv
biBhdCBhbGwuwqAgSXQncyBmaW5lIGZvciAqX25vc3BlYw0KPj4gdG8gcmV1c2UgdGhpcyBoZWxw
ZXIsIHN0YXRpbmcgdGhlIHNhZmV0eSBvZiBkb2luZyBzbywgYnV0IGF0IGEgY29kZQ0KPj4gbGV2
ZWwgdGhlcmUgbmVlZCB0byBiZSB0d28gYXBwcm9wcmlhdGVseSBuYW1lZCBoZWxwZXJzIGZvciB0
aGVpciB0d28NCj4+IGxvZ2ljYWxseS11bnJlbGF0ZWQgcHVycG9zZXMuDQo+IEkgZG9uJ3QgdGhp
bmsgYW55dGhpbmcgY2FuIHNlbnNpYmx5IGJlIG1hZGUgZm9yIG1vcmUgZ2VuZXJhbCBwdXJwb3Nl
DQo+IChub3Qgc3BlY3VsYXRpb24gcmVsYXRlZCkgdXNlLiBIZXJlIEknbSBzcGVjaWZpY2FsbHkg
dXRpbGl6aW5nIHRoYXQNCj4gYXJyYXkgc2xvdCAwIGlzIGJlaW5nIHBpY2tlZCBhcyB0aGUgZmFs
bGJhY2sgc2xvdCBfYW5kXyB0aGF0IHNsb3QgaXMNCj4gYWN0dWFsbHkgc3VpdGFibGUuIFRoaXMg
bWF5IG5vdCBiZSB0aGUgY2FzZSBmb3Igb3RoZXIgYXJyYXlzLg0KPg0KPiBBbnl3YXkgLSB0YWtp
bmcgdGhpbmdzIHRvZ2V0aGVyIEkgd2lsbCB0aGVuIHNpbXBseSBjb25zaWRlciB0aGUgcGF0Y2gN
Cj4gcmVqZWN0ZWQsIGRlc3BpdGUgaXQgYmVpbmcgYSBzZWVtaW5nbHkgZWFzeSBzdGVwIG9mIGhh
cmRlbmluZy4NCg0KSSBkb24ndCBoYXZlIGEgcHJvYmxlbSwgaW4gcHJpbmNpcGxlLCB3aXRoIHNv
bWV0aGluZyBsaWtlDQphcnJheV9jbGFtcChhcnIsIGlkeCkgYXMgbG9uZyBhcyBpdCBjb21lcyB3
aXRoIGEgQVBJIGRlc2NyaXB0aW9uIG1ha2luZw0KaXQgY2xlYXIgdGhhdCBpdCB0dXJucyBvdXQt
b2YtYm91bmRzIGluZGljZXMgaW50byAwLg0KDQpCdXQgdXNlIG9mIHRoaXMgaW4gY29kZSBhbHNv
IG5lZWRzIHRvIGNvbWUgd2l0aCBhIGNvbW1lbnQgZXhwbGFpbmluZyB3aHkNCnRoZSBwaWVjZSBv
ZiBjb2RlIGlzIHJpc2t5IGVub3VnaCB0byBqdXN0aWZ5IGl0LsKgIChBcyBtdWNoIGFzIGFueXRo
aW5nDQplbHNlLCBzbyB3ZSBjYW4gZmlndXJlIG91dCB3aGVuIHRvIHJlbW92ZSBpdCBpZiB0aGUg
cHJlY29uZGl0aW9ucyBjaGFuZ2UuKQ0KDQp+QW5kcmV3DQo=

