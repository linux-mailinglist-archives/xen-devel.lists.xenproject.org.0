Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EB24BEA56
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 20:21:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276426.472583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMEFH-0000rS-2G; Mon, 21 Feb 2022 19:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276426.472583; Mon, 21 Feb 2022 19:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMEFG-0000pd-VB; Mon, 21 Feb 2022 19:21:14 +0000
Received: by outflank-mailman (input) for mailman id 276426;
 Mon, 21 Feb 2022 19:21:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fvXl=TE=citrix.com=prvs=044a77a3b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMEFF-0000pX-Gh
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 19:21:13 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c572ccc-934b-11ec-8539-5f4723681683;
 Mon, 21 Feb 2022 20:21:11 +0100 (CET)
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
X-Inumbo-ID: 6c572ccc-934b-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645471271;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=uC0klHGT1wqSFpZrvxVI5rezQHtLRZtM72M9KVBJbGg=;
  b=dLDRZEeLSNmdwFyQ7Q01CVqnuQTmsktIl5pJNxtMYdQYDBnKMGRe3vJG
   wNcEeEjvUtZ+02PJVjqLhjW6sjMrjqQ7iJSTQ1nwmVtio02USaCxsFFN/
   kvUR7FOrTZE50iscVUVubyC1vYd2CKFnrkEhL1TULIAZoP7djZu9iK+8Y
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66916276
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:dpkYDaLD3d0hZW+DFE+RxJUlxSXFcZb7ZxGr2PjKsXjdYENSgzUEz
 GIWWGmHa/6JZjegKItxPdvk/U9Uv8DUydY1TVZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2NQx2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NwKlLm+cAECBPSPv7stUBN+EWJEPaITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6iPP
 pRDNmQHgBLoXkNyIlUyDKICgPaxiyHjcRxbjFSEqv9ii4TU5FMoi+W8WDbPQfSaSMMQkkuGq
 2bu+2XiHgpcJNGZ0SCC8H+nmqnIhyyTcIAdDrqj7dZxnUaegGcUDXU+V1G2vP24gU6WQM9EJ
 gof/S9GkEQp3BX1FJ+nBUT++SPa+E5HMzZNLwEkwAjK64/a2gCyPDFHaWFxa9YAtowMRTN/g
 zdlgOjVLTBotbSUT1eU+bGVsS6+NEApEIMSWcMXZVBbuoe++enfmjqKF48+S/Dt0rUZDBmtm
 2jikcQou1kEYSfnPY2f9EuPvT+jr4OhouUdtlSOBTLNAu+UieeYi22UBbrzsKwowGWxFADpU
 J04dy+2tr1mMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8ieRw5bpdZKGKzM
 Sc/XD+9A7cJYROXgVJfOdrtW6zGM4C7fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ7l0gWmDKILbimnkvP7FZrTCPMIVvzGADVNb5RAWLtiFi9z
 uuzwOPQlU0ECbWmOnO/HEx6BQliEEXXzKve8qR/XuWCPhBnCCcmDfrQyqkmYItrg+JekeKgw
 513chYwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:dNwuVKzcVXyr8Q5ItM1dKrPxjOskLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9IYgBdpTiBUJPwJU81bfZOkMcs1MSZLXbbUQyTXcBfBOrZsnLd8kjFl9K1up
 0QC5SWZOeAb2SSyPyKnTVQcOxQgOVvkprY/ts2pk0FJWoBBsEQjDuRSDzraHGeLDM2X6bRf6
 Dsgfav0gDQAEj/Gf7LYEXtMdKzwuHjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoi2X
 KtqX272oyT99WAjjPM3W7a6Jpb3PH7zMFYOcCKgs8Jbh3xlweTYph7UbHqhkF2nAjv0idurD
 D/mWZmAy1B0QKWQohzm2q15+DU6kdr15Yl8y7BvZKsm72jeNtwMbs+uWsQSGqp16NnhqAg7E
 sD5RPri3IcZymw7BjV9pzGUQpnmVGzpmdnmekPj2ZHWY9bc7NJq5cDlXklWqvoMRiKoLzPKt
 MeR/00JcwmBm+yfjTcpC1i0dasVnM8ElOPRVUDoNWc13xTkGpix0UVycQDljNYnahNB6Vs9q
 DBKOBlhbtORsgZYeZ0A/oAW9K+DijITQjXOGyfLFz7HOUMOm7LqZTw/LIpjdvaNaAg3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTXTGC0TV3Wu4hjDlhCy8vBrZbQQFi+oQoV4rmdSt0kc7nmZ8
 o=
X-IronPort-AV: E=Sophos;i="5.88,386,1635220800"; 
   d="scan'208";a="66916276"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1AXjqzLtz1gmGKS4e2UYBsOFP4fWs43qlH3pUGiEN1Y27r9cUjwdnc9WLx8NgZEEFicz0TPqF/sT+cfq7JcM4TrvUGb5DnHE0c7Y3Ffiy5HwoYt7inLZB+21/c80gHyH0rTMtzOzPSXc7gBa/9dJLjtUNBfenD4BpGHeZyD4in/CZmYCAQot3gIws2dcOVMfR/uzV+dDNxxc4GHZSux5ePs0PffNE74LRNOrg3KV5jXhzlvYUzThOl3Evq8ni0lTM9jemRPfejLLI4eq5Ke0aTJ80O6MRPjhi4hlH+ouek+r62WHrIl0f86Z9FTk6g7t84Tdb7bExSUFsC7KkeM6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uC0klHGT1wqSFpZrvxVI5rezQHtLRZtM72M9KVBJbGg=;
 b=gbw1eBP74IUdYikXPY1aLQ5M/6du6bg28ckdx5QsDGza+VRW9tO+EN0ecbv2NU0fhMrMwWzGwPs1wnolbI57zKh3k6h6OXjdOSJkoS4lK/C4GUKn7N5sBwNc2j/k1GvVJ294DxAVzYEzt0S/VetgIyr6RfPKQt+ebvEBqhPUb4VGehPyifSy25ZXmrgngC2UAvnBKFsf6dm5KdKQX2hGP9vMDd4ykAXgyBXZ2IgpnBLYlLJ0dmtnnYl9b25COa9SydC0GfkrcXlGDmjY2bEW23m6L4uATqsz8D28eTK0RaCG4d2Un7pdZSUiWTGkqANn3FxANuURIbXGSDYTMk8u+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uC0klHGT1wqSFpZrvxVI5rezQHtLRZtM72M9KVBJbGg=;
 b=PxQAvGiD69y0Ks5SnWFdR5MqXP2KwE7eC+uFOmOkYExc+wWE9X7VKCEZRIRr+4J5eHCXHRcyfBSM9ks4DbiwKzyFqGFaAGEICXH4OV28qWZRVjnmjQu0X4wlHnmWpxQYgy43zyxMGjr+wrpDmdgK1hZcW8Uq40ql9uND3bCxMnc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Juergen Gross <jgross@suse.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 04/70] x86/pv-shim: Don't modify the hypercall table
Thread-Topic: [PATCH v2 04/70] x86/pv-shim: Don't modify the hypercall table
Thread-Index: AQHYIaGhGuRO8pqNlkK4xub7I1FLsayTC50AgAAE4YCAAAF7gIADsLoAgADKGoCABuBFAA==
Date: Mon, 21 Feb 2022 19:21:04 +0000
Message-ID: <f1a3e319-4810-49eb-7ae0-a044499e85a1@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-5-andrew.cooper3@citrix.com>
 <4d8ab414-caf4-5a12-4cb7-a88c633cfd66@suse.com>
 <e18c0c5a-d00b-adf9-d4b0-28e702a18241@srcf.net>
 <6566bf52-58da-f804-f5c2-fca64c1f150c@suse.com>
 <f0889e93-aec0-443e-b3fc-081892edaf2b@citrix.com>
 <44e0ab16-e807-c8f5-deef-7094b7aecdeb@suse.com>
In-Reply-To: <44e0ab16-e807-c8f5-deef-7094b7aecdeb@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed3851b4-dfc3-47cf-3ed2-08d9f56f4deb
x-ms-traffictypediagnostic: SN4PR03MB6781:EE_
x-microsoft-antispam-prvs: <SN4PR03MB6781625FC64589AAB385C97BBA3A9@SN4PR03MB6781.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LMOj0WprIAGDyf9ztQYHeTsE6Uq8+ayRV/AfswIOdzFi96o5UTFKm5kVys4S+kqx0dBQXEnCgY8jV2Ppm5cdcyHgVPy5kfZSCouZ4luNe5vkRWy3v7KBHeZwmEdSkrLV0Og7YK2y9BUjt9qtTL9X6hRNp4BQNIzQF4J7KYfoySp2G3Y2IIy9Y5BnbTxw93eUp9Yk/XPh7DjyQV0UOJy9sDwlywNuT76JwYYmbK6iKSbVchfwcqUCycxrPLMftgXCmQTwDmhZlHcd0mUaky5mzdkkSvylgs5j6o6KcZkSSUN+BsAjNfwPIbOk/qGLBStl52sqWZZPwfz+XggqMAHsuAwF7urVD/2T13dH4+tiwfR2Xf+LrDg2mmph6WBkX6ypogWi8SN+WswrAdGB9iYgiCP/qLGIgNY41PdHlMOVEFsV2TsJxpXaYIyeP+5ujgDx3GZ7ZS/tu5VnHC8YZeZp0tXnLcdi04O8xYyerWkyN95pDVLe0GyxIApSFHtkIwZKvT6qz4pM3ko0gnwCij/ThY1vhHKbGAx9Omt9Lw2wRDbPCyarJk8dBHbB9PDCEZMVrBdNvg/UDmuUI3ed5lizqKkxBzYtvteKGjX1P+Fj9Zq9iLA7pf9hPxiUxMMmZQBWo1bTITRSZDxd2afUn8ZQ2RHCw7jCMRdOnqO0B+3SViEAwLydefP9+9E/pUY7eVh9DG9PjAhNKr3sclpbZ5yBz5OAEVgbBwcjGFbfr9T0LKZc+OioC9Mh4uQbJHgBVuWMNxSsS46sFNuOKvx1y2mKZQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31686004)(53546011)(2616005)(6486002)(26005)(38070700005)(316002)(6916009)(54906003)(186003)(66574015)(6506007)(6512007)(91956017)(36756003)(8936002)(76116006)(66476007)(66446008)(66946007)(66556008)(82960400001)(38100700002)(4326008)(83380400001)(122000001)(71200400001)(86362001)(31696002)(508600001)(5660300002)(8676002)(2906002)(64756008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YlhYWHJURXVhWDRIWngvcjZGb2pDLzdNU1Iwbk85UWxLM1p1dk5FNGFsRjhK?=
 =?utf-8?B?MGdsK3RwOER6WFMrT0dXUEJGbEVlblN4NkVkd0Q3WTRZc3NBMHA4TTMrSUVw?=
 =?utf-8?B?QlFSOHIzeTlYamFXMmk1akdzWkp6WWJuU2VoS3ZKT2tFeEVpcjBWWDFQN3BI?=
 =?utf-8?B?NWR4RUVEVy94akJTZVU1MERpUE9NQk04TERnZ2hmNi91VlhTOGNDTStNcTMv?=
 =?utf-8?B?MHpOYXVFOXlvcFNrcVRaN1haeHU2eUhBVFdnb0xscEJzRXJJVGFFRWFGS1ZR?=
 =?utf-8?B?OTZyQ2hMY0dVL3JhSllBTFpMTVoycDNmWmo5UjZ4MDZRWE5ETU5ENGVjMW93?=
 =?utf-8?B?Q0ZSRmtNeWp3UnRLTDdPLzl6bldLRkdHY0xGWVFZc2V3UDVwM0M3QmFmbFlZ?=
 =?utf-8?B?SzdkTGs0Y28ralZncGdUZ0VhYkxHdmZRUXhYTUhkTGJ1SVVPVnc3VGZ0VmFC?=
 =?utf-8?B?bWxQeTR1aHczRy92dTE1SW9QTmJ0aUk2MnBxV3BNOFhCMmt2Y3ArVFJzajR0?=
 =?utf-8?B?VHlOdFVjd1AreGJmdGYwQUdXL0JqWTJkRGIzWEZWMmg4NGp0MllWRjUyN3BK?=
 =?utf-8?B?VGg4S3ZmVzF2Mm03MjkvK0tqVUQ2SzI3elgvTk9jd2xZcUtNRW80Z0FhLzZE?=
 =?utf-8?B?U1dVMFBRQ3NHU3pPS1F5MGdGY1JZNXlJOERmQSttMldLM2s1dHJTOVFLZkNi?=
 =?utf-8?B?bHdMam5Lc0tnQzZPSC81U3V3NUtWS2FkdndYVktMNytHbDc4QURDMjRSOTM3?=
 =?utf-8?B?U1RBdHU2MENUNWlWL04zRXcwV2FnNFpEaTdXUnFMZW5QWUU4K3Bpb1NHY3Nn?=
 =?utf-8?B?b2NHWUVWcHUzTXJ1UU5tdEc4ZmFXL0tnZFZGNmRpOEhkWHRuT3VaeHpTTnlw?=
 =?utf-8?B?eHZqa3hEZXNsQWxPbVNIU1hZeFYyKzRVTlBhUjltZ0diTEVxRlNFazgySmlM?=
 =?utf-8?B?MEtvMk1FaUQvVUVqdG10QXh3U3h6c2xwblZsQndROUJVU2JuZDg3TFpRTmJJ?=
 =?utf-8?B?NnZ0RERsUmV2Q3dMZkdNNTlEY3RpeGorcmpZTnZER0VqYjdxLytvamtaOGE3?=
 =?utf-8?B?ZDBSdG4yVnh2ZmlIcTVBbkZCNzhOb25OaExUYnpKalBlWUIrcFJDR2JuQzdY?=
 =?utf-8?B?elpzT1FGSlhzTXpSM1l3SGhCdE9YZjRjNG5UTzdzckQrbTU2S1Y2SmVCU1lR?=
 =?utf-8?B?cUpCTnpIbkJKYk5YMnJaazJMd0Y4aFloc09IM0I1aUJhMmphdGxGd1Eycmhx?=
 =?utf-8?B?bnZtdWhkVXc2di85QzRHd3piUXpDSjBhN0xYMklaQnJ1Zm5idVFENEpLQ0ZE?=
 =?utf-8?B?dUtvK0ZYdlNMMnhCeHVIbHlzTE5xb1RuMXE1YUpFcmo5TzBvczRCTmQrYUN2?=
 =?utf-8?B?TzNKbjJhUFJ5VFk0N3dNZEFaanJPZGdGS1p2RHAvNG9SYTQzQURNQkR5ZW00?=
 =?utf-8?B?OHpGWVhHRWFIZDlMTytUQXdiZXlzeEk4R0Q3ellkNDJvVElYQ2tiNE11cDBC?=
 =?utf-8?B?ZVI5VCt2TmdvekhmcWR1R3N0SmhrSEZMQ1VqK0ROdVJxUVhDNktmRk4vM3ZC?=
 =?utf-8?B?bGx4Tmc0NEt2NHhRQ2lKcFB4TkV1YVBheGQ0anFscERuS1phU3ZuNjhOZHdh?=
 =?utf-8?B?UW9xWHdXc0tha0RGQlpPOXk2b3JyYXRBYysrQitLcHdzRW9oT3ZDU3JabHl6?=
 =?utf-8?B?TWREbWlhTmFmM3liZzZmbjRmcVVqcGpCSzJlYmtkdk5uQnNsZmw1M094MG5L?=
 =?utf-8?B?WFQyZ29JUXNkdDgzMGFZNmM3NVdzdnpIWkt3ZkUyazhnc29BZVZuTk9YdytE?=
 =?utf-8?B?K2xlSTdvS2krZlhnNjEvQ3JRbVpjUWllSk0vVU5nd0tiUlpPU0p2ZGtucWJm?=
 =?utf-8?B?djVNQ3hBc1BCTGNMczYzcXhrSmNNZkYzaE1jU0ZBTFJqeWw1cWg5TDN2TXN3?=
 =?utf-8?B?ODlBa2Y0ZEVOMTBERm9JMjY5UndvTk00S0FrVUVwbklyZWN2NE85eW5iSkRI?=
 =?utf-8?B?T0syQWxmY000cG94cFBETnhUV1Z6ZDcxNDVwd3pVWXZkYWpicjhrcTRqeXVO?=
 =?utf-8?B?TCtTY3M1Nmh6S3RZaGlKZXJ2TkVDdlozc1FBOHV1NE1zeXg0ZUN3bGtGRndG?=
 =?utf-8?B?bTFwVWJtZXlyNFFWKzJJV09rcG95b2ErdEpWajhZOE5NSE1PWDc2YVNrQlhU?=
 =?utf-8?B?ZGJWQUQ1NnVHQlp0SUNvazFEM2pKQXdjbnBxelhnM20xa3F5VFVlOGdqYW5S?=
 =?utf-8?B?TTlIdTlMdXMya0tndmJlRUorazh3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <79562BDB795EF74491B522A7C0F4E7EC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed3851b4-dfc3-47cf-3ed2-08d9f56f4deb
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2022 19:21:04.6448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y75dAZD0SmmIMU5lr67vEGOFeomJVmHqH/yZlV+9/WFtHpqc4Vxuh+tt/DC8+dek7L29WHGPfr6TbY/OfaHUjxSxIz13m2AowudmbB7UvrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6781
X-OriginatorOrg: citrix.com

T24gMTcvMDIvMjAyMiAxMDoyMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE2LjAyLjIwMjIg
MjM6MTcsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxNC8wMi8yMDIyIDEzOjU2LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAxNC4wMi4yMDIyIDE0OjUwLCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4+PiBPbiAxNC8wMi8yMDIyIDEzOjMzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+
IE9uIDE0LjAyLjIwMjIgMTM6NTAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+Pj4+Pj4gRnJvbTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4+Pj4+DQo+Pj4+Pj4gV2hlbiBydW5u
aW5nIGFzIHB2LXNoaW0gdGhlIGh5cGVyY2FsbCBpcyBtb2RpZmllZCB0b2RheSBpbiBvcmRlciB0
bw0KPj4+Pj4+IHJlcGxhY2UgdGhlIGZ1bmN0aW9ucyBmb3IgX19IWVBFUlZJU09SX2V2ZW50X2No
YW5uZWxfb3AgYW5kDQo+Pj4+Pj4gX19IWVBFUlZJU09SX2dyYW50X3RhYmxlX29wIGh5cGVyY2Fs
bHMuDQo+Pj4+Pj4NCj4+Pj4+PiBDaGFuZ2UgdGhpcyB0byBjYWxsIHRoZSByZWxhdGVkIGZ1bmN0
aW9ucyBmcm9tIHRoZSBub3JtYWwgaGFuZGxlcnMNCj4+Pj4+PiBpbnN0ZWFkIHdoZW4gcnVubmlu
ZyBhcyBzaGltLiBUaGUgcGVyZm9ybWFuY2UgaW1wbGljYXRpb25zIGFyZSBub3QNCj4+Pj4+PiBy
ZWFsbHkgcmVsZXZhbnQsIGFzIGEgbm9ybWFsIHByb2R1Y3Rpb24gaHlwZXJ2aXNvciB3aWxsIG5v
dCBiZQ0KPj4+Pj4+IGNvbmZpZ3VyZWQgdG8gc3VwcG9ydCBzaGltIG1vZGUsIHNvIHRoZSByZWxh
dGVkIGNhbGxzIHdpbGwgYmUgZHJvcHBlZA0KPj4+Pj4+IGR1ZSB0byBvcHRpbWl6YXRpb24gb2Yg
dGhlIGNvbXBpbGVyLg0KPj4+Pj4+DQo+Pj4+Pj4gTm90ZSB0aGF0IGZvciB0aGUgQ09ORklHX1BW
X1NISU1fRVhDTFVTSVZFIGNhc2UgdGhlcmUgaXMgYSBkdW1teQ0KPj4+Pj4+IHdyYXBwZXIgZG9f
Z3JhbnRfdGFibGVfb3AoKSBuZWVkZWQsIGFzIGluIHRoaXMgY2FzZSBncmFudF90YWJsZS5jDQo+
Pj4+Pj4gaXNuJ3QgYmVpbmcgYnVpbHQuDQo+Pj4+Pj4NCj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4+Pj4+IEkgZG9uJ3QgdGhp
bmsgeW91IHN5bmMtZWQgdGhpcyB3aXRoIErDvHJnZW4ncyB2My4gVGhlcmUgd2VyZSBvbmx5IG1p
bm9yDQo+Pj4+PiBjaGFuZ2VzIGJ1dCBoYXZpbmcgYSBzdGFsZSB2ZXJzaW9uIHNlbnQgdHdvIG1v
bnRocyBsYXRlciBpc24ndCB2ZXJ5DQo+Pj4+PiBuaWNlLg0KPj4+PiBJIGRpZCByZXN5bmMuwqAg
V2hhdCBkbyB5b3UgdGhpbmsgaXMgbWlzc2luZz8NCj4+PiBBIGZldyBsaWtlbHkoKSAvIHVubGlr
ZWx5KCkgYXMgZmFyIGFzIEkgY291bGQgc2VlLg0KPj4gT2ggdGhvc2UgdHdvLsKgIEkgYXBwZWFy
IHRvIGhhdmUgZm9yZ290IHRvIGVtYWlsLg0KPj4NCj4+IFRoZXkncmUgd3JvbmcgLSBvYnNlcnZl
IHRoZXkncmUgaW4gYW4gaWZuZGVmIGJsb2NrLCBub3QgYW4gaWZkZWYgYmxvY2suwqANCj4gSSBk
b24ndCBzZWUgaG93IHRoZSAodW5yZWxhdGVkKSAjaWZuZGVmIG1hdHRlcnMgaGVyZTogVGhlICNp
Zm5kZWYNCj4gaXMgYWJvdXQgZ3JhbnQgdGFibGUgYXZhaWxhYmlsaXR5LiBUaGUgdHdvIGxpa2Vs
eSgpIGFyZSBhYm91dA0KPiBydW5uaW5nIGFzIHNoaW0uIEknbSBvZiB0aGUgZmlybSBvcGluaW9u
IHRoYXQgYSBiaW5hcnkgYnVpbHQNCj4gd2l0aG91dCBQVl9TSElNX0VYQ0xVU0lWRSBpcyBmYXIg
bW9yZSBsaWtlbHkgdG8gYmUgdXNlZCBhcyBhIGJhcmUNCj4gbWV0YWwgaHlwZXJ2aXNvci4gQW5k
IGZvciBhIFBWX1NISU1fRVhDTFVTSVZFIGh5cGVydmlzb3IgdGhlDQo+IGNvbmRpdGlvbnMgYXJl
IGNvbnN0YW50IGFueXdheSwgYW5kIGhlbmNlIHRoZSB1bmxpa2VseSgpIGhhcyBubw0KPiBlZmZl
Y3QuDQo+DQo+IEFuZCBpZiB5b3VyIHdheSBzaG91bGQgcmVhbGx5IGJlIGZvbGxvd2VkLCB3aHkg
ZGlkIHlvdSBkZWVtIHRoZSB0d28NCj4gdW5saWtlbHkoKSBpbiBkb19ldmVudF9jaGFubmVsX29w
KCkgYW5kIGRvX2dyYW50X3RhYmxlX29wKCkgb2theT8NCg0KQmVjYXVzZSB0aG9zZSBhcmUgYXQg
bGVhc3Qgbm90IGluY29ycmVjdC7CoCAoSSBzdGlsbCB0aGluayB3ZSBoYXZlIGZhcg0KdG9vIG1h
bnkgYW5ub3RhdGlvbnMsIGFuZCBJIGRvdWJ0IHRoZXkncmUgYWxsIGhlbHBmdWwuKQ0KDQpUaGUg
Z250dGFiIHN0dWJzIGluIHRoZSAhR05UVEFCIGNhc2UgZXhpc3Qgc3RyaWN0bHkgZm9yIGNvbXBp
bGUgdGVzdHMNCih0aGVyZSdzIG5vIHN1Y2ggdGhpbmcgYXMgYSBwcm9kdWN0aW9uIGJ1aWxkIG9m
IFhlbiB3aXRob3V0IGdyYW50DQp0YWJsZXMpIGFuZCBQVl9TSElNX0VYQ0xVU0lWRSBidWlsZHMu
DQoNCkNvZGUgbGF5b3V0IG9ubHkgbWF0dGVycyBmb3IgY2FzZXMgd2hlcmUgd2UncmUgZXhlY3V0
aW5nIGNvZGUsIHdoaWNoIGlzDQp0aGUgUFYgU2hpbSBjYXNlLCBhdCB3aGljaCBwb2ludCB0aGUg
Y29uZGl0aW9uIGlzIGNvbnN0YW50IGFuZCBkb2Vzbid0DQpnZW5lcmF0ZSBhIGJyYW5jaC4NCg0K
QSBjb21waWxlciBvdWdodCB0byByYWlzZSBhIHdhcm5pbmcgb24gZmluZGluZyB0aGF0IF9fYnVp
bHRpbl9leHBlY3QoKQ0KaGFzIGEgY29uc3RhbnQgcGFyYW1ldGVyLCBiZWNhdXNlIGl0J3MgYSBu
b3AgaW4gb25lIGNhc2UsIGFuZA0KZGVtb25zdHJhYmx5IGZhbHNlIGluIHRoZSBvdGhlci4NCg0K
QXMgZm9yIHRoZSBmdW5jdGlvbiBpbiBxdWVzdGlvbiwgdGhlIGNvbXBpbGVkIHJlc3VsdCBpcyBh
biB1bmNvbmRpdGlvbmFsDQp0YWlsY2FsbCB0byBwdl9zaGltX2dyYW50X3RhYmxlX29wLg0KDQp+
QW5kcmV3DQo=

