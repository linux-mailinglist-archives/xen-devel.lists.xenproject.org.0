Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 543DB4B8731
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 12:55:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274057.469395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKItv-0006Cr-I7; Wed, 16 Feb 2022 11:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274057.469395; Wed, 16 Feb 2022 11:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKItv-0006B0-DF; Wed, 16 Feb 2022 11:55:15 +0000
Received: by outflank-mailman (input) for mailman id 274057;
 Wed, 16 Feb 2022 11:55:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6VyC=S7=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nKItu-0006Au-75
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 11:55:14 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b0ae905-8f1f-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 12:55:12 +0100 (CET)
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
X-Inumbo-ID: 4b0ae905-8f1f-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645012512;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=w1AMShmSEkasRrcVpUKRpw8B41H7gKDFNFnrQyhxxKI=;
  b=HWJeNYw4UJ09Zkcr+3XpoZYlHgub/1fYBG9vj7182jMvibS9lcToDgjK
   2F3aoiqw2mf9qyM6KB1+PUlahmLC7kSoKo/8UVIxo1viQp5w1k8lzx5nc
   dGtbd3AZqjuueETXBOf/Fd6IQpUBlv7I6vBJqD3AVDT81g8ENf5wspMBc
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: lGI3cgPPARmTI3qObh8kIQMC/bJn2to+LbxYw9eORy9tF1Vyfj3iAktGfzmsaAE20AVlrnQGj3
 hOG9Ji4uKIpPrtrCc41HwYnHSDGOawmcrJH+0oOCLHw82n3xrgYaLiIozFEFv/qNcSzQ3z8Bek
 RzfUI+I7ZSnv16XzVLbs05agtiBKlNqwawwCKGAXGuEr4siwCStXZBSYJSygAQZO12Bj/Rwc67
 vlEgXar4DX99m+WcGx4g+OcW00IXXTTPy+gAOsggKAbw1mEj6XFDz375yPFBU2BexUl0o4z5GJ
 YWOEruXNdj/MkuYXC7hQR1fs
X-SBRS: 5.1
X-MesageID: 64332123
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/H0Gf6IbbCYFAwqrFE+RV5IlxSXFcZb7ZxGr2PjKsXjdYENShWQPn
 GsbWjiEbq2NMGrxKdwkb9jl/ExX7J7QnN8wHVRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug6xbZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2rwfF12
 vIVt6aNFyQJO/3Dg/02UR9xRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gls3ZsURKyFD
 yYfQRVuck7sRCJpA3IOK58PvuaC2mC8SwQN/Tp5ooJoujOOnWSdyoPFINfTP9CHW8hRtkKZv
 X7duXT0BAkAM96SwibD9Wij7sfKlDn+UZgfF5W58OBrm1yZwmEPCBwQWkC/qPP/gUm7M/pdI
 UEJ/islrYAp6VemCNL6WnWQqXuP70A0QMBbHas85R3l90bPy1/HXC5eFGcHMYF48p9tLdA36
 rOXt/G3JDh9l+WXc0/D1ZeR/TypIAMXK0ZXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJJN3g/
 9yZhHNg3utO1Kbnw43+pAma2Gz0+vAlWyZovl2/Y46z0u9uiGdJjaSM4EOT0/tPJZ3xorKp7
 CldwJj2AAzj4PiweM2xrAclQenBCxWtamS0bbtT838JrWnFF5mLJ9043d2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPa8SYW4D6qFP4sXOPCdkTNrGgk0OCZ8OEi3ziARfVwXY
 8/HIa5A815GYUiY8NZGb7hEiuJ6rszP7WjSWYr633yaPUm2PxaopUM+GALWNIgRtfrcyC2Mq
 oo3H5bamn13DbylCgGKoNF7ELz/BSVibXwAg5cMLbDrz8sPMDxJNsI9Npt7K9w/xPUKzL6Vl
 px/M2cBoGfCabT8AVziQlhoaa/1XIY5qnQ+PCc2Ok2v1WRlaoGqhJrzvbNuFVX+3OA8n/NyU
 dcffMCMXqZGRjjdomxPZpjhto1yMh+sgFvWbSaiZTE+eb9mRhDIpYC4Lle+qnFWA3rlr9Y6r
 p2hyhjfHcgJSTN9AZuEc/mo1V6w4yQQwbogQ0vSL9BPU0zw64w2eTfph/o6LphUexXOzzeXz
 SiMBhIcqbWfqoM56oCR16uFs52oA611GU8DRzvX6rO/NC/7+Gu/wNAfDLbULG6FDG6tofesf
 +RYyf34IcYrplcSvtouCatvwII/+8Dr++1QwDN7ESiZdF+sEL5hfCWLhJEdqq1Xy7ZFkgKqQ
 UbTqMJCMLCENc65Ql4cIA0pMraK2f0Ow2SA6P00JAPx5TNt/arBWkJXZkHehCtYJbpzEYUk3
 eZ+55JGt13h0kInYoSckyRZ12WQNXhRAawou6YTDJLvlgd2mEpJZobRC3Ou7ZyCAzmW3pLG/
 tNAaHL+uolh
IronPort-HdrOrdr: A9a23:kWhOcKDJ3VLKttLlHegKsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPEfP+UossHFJo6HlBEEZKUmstKKdkrNhQotKOzOW+FdATbsSo7cKpgeAJ8SQzJ8k6U
 4NSdkdNDS0NykGsS+Y2nj6Lz9D+qj9zEnAv463pB0BLXAIV0gj1XYCNu/yKDwqeOAsP+tfKH
 Po3Ls/m9PWQwVwUi3UPAhhY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJm294ZgC
 r4uj28wp/mn+Cwyxfa2WOWxY9RgsHdxtxKA9HJotQJKw/rlh2jaO1aKvi/VXEO0aWSAWQR4Z
 /xSiQbTp1OArTqDzmISC7Wqk7dOfAVmiTfIBGj8CHeSIfCNUwH4oJ69PNkm13imhYdVZhHod
 F2NyjyjesmMTrQ2Cv6/NTGTBdsiw69pmcji/caizhFXZIZc6I5l/1TwKp5KuZKIMvB0vFsLA
 CuNrCq2N9GNVeBK3zJtGhmx9KhGnw1AxedW0AH/siYySJfknx1x1YRgJV3pAZOyLstD51fo+
 jUOKVhk79DCscQcKJmHe8EBc+6EHbETx7AOH+bZV7nCKYEMXTQrIOf2sR42Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmIZG9xjcKV/NFQgFCvsurqSRloeMMYYDABfzPmzGyfHQ0cn3KverL8
 qOBA==
X-IronPort-AV: E=Sophos;i="5.88,373,1635220800"; 
   d="scan'208";a="64332123"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfPzZoLYFD1FdbogjENESIGO1A1oMj6urEt/PsS80ceQI3RI+WvkJ1SyUBeQNGaGPyNU03JFBMWyLLftBSvq+AhrfCDtdv1c4oELV1Wy0Bpsj0ngLhUTxSqq+181mKmBo9OkxZvxRbU1WOseSLk5C3MsJ8K8rKjscn913C+3vLplm/hB2EvoLgnZWIV5e8f4m3qErqNzUW89l+BEOVr9T1tDBwfmJTgGPfeNcTZq5G0fcXy1OzKkE9plhKKBxX9LbRhBbDkN2dxqZJ1e6NZLfl++SZR2G22+GtgU8WVHWZZ1JP4/9GRz9jJGMsFrN+pwlUY2zXKfgjX8v/GzV2niSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1AMShmSEkasRrcVpUKRpw8B41H7gKDFNFnrQyhxxKI=;
 b=Vh4RdGentRs4eN0r4J7zKMaXAjfKlWp11zFum7DpTD+jiB6HRuPvw+EvY76r9tQYmHHXMn8P5842DgxBwpSuLJjCjwTVfp/t+9p6MGzcCQdaY5TTbVrkz/IqLI3t3R+0IsOW32YeZmFhcPrcRjcB7nCcrpp+7+oVrSn0zZtnyNQcwbVxWm5q6qqQQNiU7i3VxRj16d/frNT2dQl2KLm3DzRYYW3/wuHOcFmJC7h15CcD8oU1lnXvfAdpGvEpGhGAJC2/vhkM8fPI+KyiPJNodkg5l8aa3YI8iKNLXBuP/7EqCT27VEo86J9PR6YKYhpccnUPUqMWrjcKWmvKOK9xug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1AMShmSEkasRrcVpUKRpw8B41H7gKDFNFnrQyhxxKI=;
 b=ek0PwfhmIA8bDbbIiJAPWfKNg+57Usn3RDHIY1wiek0sKUwF0wtGAtExuhmFcHCrCZqe+RU3e9ueAhviG1AVRXDcbsRptH9GUIwY1MVnuaTk9oGTLjLPshrt4aGKZpR9z1MtIR8N00kCBtiyMh08/pbSASK4mJiaMjKMYnRZnwo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <amc96@srcf.net>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2 07/70] x86: Build check for embedded endbr64
 instructions
Thread-Topic: [PATCH v2 07/70] x86: Build check for embedded endbr64
 instructions
Thread-Index: AQHYIaGvWqdqb3ZDi0C7/EewX8xTwqyUuZIAgAAssICAAPiHAIAANgUA
Date: Wed, 16 Feb 2022 11:55:04 +0000
Message-ID: <b80670a7-8802-4734-35a1-c7e0ec785da0@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-8-andrew.cooper3@citrix.com>
 <95c29039-302c-256b-d381-2b5b8b9c1a4a@suse.com>
 <8c6d9714-7e45-1603-a5ad-d49fc060304e@srcf.net>
 <7c5ff089-780b-9965-4765-be3ef210a913@suse.com>
In-Reply-To: <7c5ff089-780b-9965-4765-be3ef210a913@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b52cafc7-6e72-4ed3-098d-08d9f1432b9f
x-ms-traffictypediagnostic: BN6PR03MB2820:EE_
x-microsoft-antispam-prvs: <BN6PR03MB2820AF6C3F8E3DDA4A47C03CBA359@BN6PR03MB2820.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cyrdMnOYnr/GLJRJS+DZ4IS81O3aId10aRTkXN1ovIJRAH4AMaZKA3vyxy/pgkb9l28WbxACKnEpCBq67xxNsQOeKegcp+3tEYAZlcK3MupQ9DhvurWoN5DwrGo8PWQMmzb7+JaRJP4oRxg8yFe4OYDq1crGQPdGsHLi/jUIOqIqNKI1VkvvnnPM6MV/GwafvxSFaMuFjg/Wt+R4FDGj8mqy+1lDL/Gcmd+YWIEDdVicU34o6Gk8N5v+Em9b3pnoFIW+pspUfnvwXppTgQZYZHvtj1yr517tOrCCcHNIC1sFCNR1k8Yc2GKpDer3RPXj7qYn4LOyky9mCRRTRTm/yJOh0KJbiPUe1sATA1hO2hpRwo5h/wngK7bDfp3PlwpQUcAiWAL3NYYq0BBx0T/7rodSMF1W7lOLeVYBzeSBxaIH23iKd+G0UaQMjhSb0ypCS4dUK3O7VQS6qMNBFcNYI5jzRum9vxIgoMmfIivA7rlKkXDDHtByklM8lT8AkMC16wW4O2DflpkLzwlQOk3e6J1UNfT2zbC8zXODSyDLtoz492Wxfuf7p7C2Y1tdtELEwOCZh0j6mb6WqKgTBgkCY56Q2181RwXV+GvKJIJo374je9fBOOqQWaZ3vSc2p8TIfxDlsBadF2tqwSw3DhBjF6GNed1Hp+q1QHaOgPu9zaRL0znquoyIEWqe3fsj/HRC6/MCoIqi3UedXTQaDiAEbiBYkjkRUS8BkcJl9pK8kEcWXidAHyeqE//C+51iWGi0Nj6z6CKQn/QEhRfVGEe/fg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(91956017)(86362001)(66556008)(2616005)(8676002)(4326008)(66476007)(6506007)(66446008)(64756008)(31696002)(8936002)(76116006)(66946007)(6512007)(2906002)(71200400001)(53546011)(83380400001)(186003)(26005)(5660300002)(38070700005)(122000001)(316002)(36756003)(31686004)(38100700002)(6486002)(54906003)(110136005)(508600001)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2hkay9JQjJGZWtEWm04Q0xmSzdvNmFjNXZQa0Q2dHhPR25ieExQOVdYeGJx?=
 =?utf-8?B?dDVqSTJWaDRMUnhtTTF2ZWV2S055UGVBVFphMzhMQWdCb3U4WjlyeEJXMERM?=
 =?utf-8?B?eG12bndtZE5xYkc5UWRCWFhLdWZKaVI3SWFBbnZjZnQ0SWdFV2M1Nm9JanJu?=
 =?utf-8?B?dzFWK1NncWNCbnFoTnYzMEtkSGpIeDlQZlhSc3VoYmxZdm5GOXNra3hodnZh?=
 =?utf-8?B?U1g0VVR4WTNnS05JME5tSlY2MkVDa2lrYWZxVjFWRkxPaHpVcWUyYkRjWllZ?=
 =?utf-8?B?cE1LOElmZVFhb09sbHBWSEIzbnVPM05wanR6OGRVczJzamh0ekR3OTZhMnlX?=
 =?utf-8?B?d2VrL3BlK2E3RXBmbXRpRXdwUi9hc1JaWDFLc0J0VW92ZWgyamVzdThNbVpn?=
 =?utf-8?B?VCtubjNRd2FzSEwzZDYybUgzQjc2QmVybStXUnorUS80MnNHU0pzb1c5WDhX?=
 =?utf-8?B?MCtwS3RQWFlMbWZOQXV5MC9kNGQvNkp6ek5kam1SOGFEVkdoWm83WStDUVdk?=
 =?utf-8?B?NzhBdGZUUWZGL3NraUh6V3FVSkZGQjNqcW1zMTROYVY2d0M4MGpWQzQ3ejRK?=
 =?utf-8?B?bU1pNGZTS2ZYTDB3Ukw0cERhU0VMa09OYWZMVGJWV1VvUE1Dc2pNb0F2d2FS?=
 =?utf-8?B?dENVMXNMUU5QOW53ZnpFU1NYa0crcDdqVzkwUFRpSDFMSVo1M0VVVjdHUE92?=
 =?utf-8?B?eEdEbHBidTByd25EbHcxZnJSMjM4MzY2SE9aUjdxUURRbDRpeHRJYVJZakpW?=
 =?utf-8?B?bGNrSG9mN3dPNm4vV3B4bng0cE9mRXIyZ1Q2VThKRW5nbDlKa0VSck0zMXhk?=
 =?utf-8?B?MG1HZW5BMXhWTmRqaWNxR2ZHNnI5V205b1hNakZxK2dTRThOS3F4UDhQMHNX?=
 =?utf-8?B?emRVdURONktDQnFBRDFjYW1GY1UzVlVOazhMa1dVVitRalpWOVFjcG9PeXlY?=
 =?utf-8?B?dHBlTHlKN29xWnhwVGZVMnhHekJOc3l4OVVSZ2cwWHdZd2ltNWdIaFJ6bjNI?=
 =?utf-8?B?QXVobVV2dlNvKzdCbnk3Ny9NUUNjU1l6akxXZUNMNWRBWllTUmVOazNaUjlo?=
 =?utf-8?B?U0dtVENJM0h1bFdpZGFmNHRPK0Y3ZHdXUEZORlIxRXdaM3cwY2VDSmlDQW81?=
 =?utf-8?B?eXBJZHJvNEZkT2pVRmdnYWRSdU9neDkxMGxxYUFtMnc1MlEzUlJ1YjJUYTJz?=
 =?utf-8?B?RXJKMnlXajREd0d6SFlXK21vVzZZMEd1WVpPdTdrK09neE1aeVdYWkxBVkN0?=
 =?utf-8?B?ZDI5THlIZW8wU2ZQRnZYeWM5REloMU90V0JydjhKeEo0bWRHeUdWN1J3WUtq?=
 =?utf-8?B?ZTlZMW9PMnFjSHBBeG5ZejRxQ0hkdVFEdGI4aGNDc1lnYVZIdWJQdjcwajJu?=
 =?utf-8?B?aFRCM2wzZWprNUZWMU1GZWNpRnZHRHVxam84YXdqK2E3VnQvTG5CUmNrRWRj?=
 =?utf-8?B?YStmQ0V6cWhnT1kzVnpOSHE2THBJeTlvWGhmaC91S201TlAvU2RLQU5VYVgy?=
 =?utf-8?B?ai8vMHk0SDl2MXYxVDZncDQ0YVF0cGRmRE4zd0JwREs5YTB4NlI1Y3BqTmxk?=
 =?utf-8?B?b0FXM2REL0YrSmdvTVlpbnR3dmhxZElYdE9HZEpFWERJU0FyWmpTZE8zanh3?=
 =?utf-8?B?dFFkVU96Y3dOenNnTmdJM2swQ2JJTTVBN01RaEs4K3kra2UveGdmdGhvQU5J?=
 =?utf-8?B?U1hqRFllaFBxUCt1UGVKT2lpVFp3eEc0QXZFUUdBeTYxSXVIUjhCLzAwYlNn?=
 =?utf-8?B?eW5wNHJaamlFMlVDT0ZDc0tjWlBNbmFTQklRdC8wZmJZRE5OblBNV2RQL2lr?=
 =?utf-8?B?VWJ4d0xRM1NlWTUralVsQUdBREdKbUZMWGJWcHdSd2syeUxxNGRPc2JwVThz?=
 =?utf-8?B?S3NScy9QdXhFOEFsbTNvT0VLWks5Sm1ZRGJsaTZvMzNWRzZXNjF0MU5xM3N6?=
 =?utf-8?B?eDRHT0JIdWJtd0NkaGlPMitET2FxemVYLy9MQy9QUWZVeUpEeEJMNUdNcUUx?=
 =?utf-8?B?SHhuSXVNL1pSV09LVmlaQ3U2amhURjdTb2d6a3dQZnM5ejRPVEh3ZWZQUDhl?=
 =?utf-8?B?UGF1Zk51L0E2Z0hmemZFU2REZ1E4T3UvNFFiYXRhNmZDcWIzdlBwQ3pjd2w0?=
 =?utf-8?B?ZWZQRnA2Y3RyL0JzQTNpU3dhbDdVY3VmeWJyUFV1YTR5OFF2VUJXbWJBL1NW?=
 =?utf-8?B?cmptbndTUGJKOUFNamk2R0hlQVM1SWhnaUZGWDZlVDY0OVRaMGtFOGhLOHpu?=
 =?utf-8?B?djR0MjZDMTdSaE05SitmYXh6bGNRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1A4EBCBDB1008419F7F40DC488CFB60@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b52cafc7-6e72-4ed3-098d-08d9f1432b9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2022 11:55:04.5644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OsFDRgrcw2TSVoducGxyWZ9D2lH9JOp7WttA6xABo/J8i9Bic1nbREF2EBUBJRCUTB7GspmLbS9hCWo6FrIjqPuqYXnCGVlVKDz0BMp3aX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2820
X-OriginatorOrg: citrix.com

T24gMTYvMDIvMjAyMiAwODo0MSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gQW55IHplcm8tcGFk
ZGluZyBpbnNlcnRlZCBhbnl3aGVyZSBieSB0aGUgbGlua2VyIGNhbg0KPj4+IHJlc3VsdCBpbiBh
biBpbW1lZGlhdGVseSBmb2xsb3dpbmcgRU5EQlIgdG8gYmUgbWlzc2VkIChiZWNhdXNlDQo+Pj4g
c2VxdWVuY2VzIG9mIHplcm9zIHJlc2VtYmxlIDItYnl0ZSBpbnNucykuDQo+PiBJJ20gbm90IHN1
cmUgdGhpcyBpcyBhIHByb2JsZW0uwqAgVGhpcyBwYXNzIGlzIGxvb2tpbmcgZm9yIGV2ZXJ5dGhp
bmcNCj4+IHRoYXQgb2JqZHVtcCB0aGlua3MgaXMgYSBsZWdhbCBlbmRicjY0IGluc3RydWN0aW9u
LCBhbmQgaXQgc3BsaXRzIGF0IGxhYmVscy4NCj4gT2gsIHJpZ2h0IC0gSSBkaWQgbWlzcyB0aGUg
c3BsaXR0aW5nIGF0IGxhYmVscyBhc3BlY3QuIEhvcGVmdWxseQ0KPiBvYmpkdW1wIGlzIHJlYWxs
eSBjb25zaXN0ZW50IHdpdGggdGhpcy4NCg0KQ2VydGFpbmx5IGFwcGVhcnMgdG8gYmUgaW4gbXkg
ZXhwZXJpZW5jZS4NCg0KPj4+PiArIw0KPj4+PiArIyBTZWNvbmQsIGxvb2sgZm9yIGFueSBlbmRi
cjY0IGJ5dGUgc2VxdWVuY2UNCj4+Pj4gKyMgVGhpcyBoYXMgYSBjb3VwbGUgb2YgY29tcGxpY2F0
aW9uczoNCj4+Pj4gKyMNCj4+Pj4gKyMgMSkgR3JlcCBiaW5hcnkgc2VhcmNoIGlzbid0IFZNQSBh
d2FyZS4gIENvcHkgLnRleHQgb3V0IGFzIGJpbmFyeSwgY2F1c2luZw0KPj4+PiArIyAgICB0aGUg
Z3JlcCBvZmZzZXQgdG8gYmUgZnJvbSB0aGUgc3RhcnQgb2YgLnRleHQuDQo+Pj4+ICsjDQo+Pj4+
ICsjIDIpIEFXSyBjYW4ndCBhZGQgNjRiaXQgaW50ZWdlcnMsIGJlY2F1c2UgaW50ZXJuYWxseSBh
bGwgbnVtYmVycyBhcmUgZG91Ymxlcy4NCj4+Pj4gKyMgICAgV2hlbiB0aGUgdXBwZXIgYml0cyBh
cmUgc2V0LCB0aGUgZXhwb25lbnRzIHdvcnRoIG9mIHByZWNpc2lvbiBpcyBsb3N0IGluDQo+Pj4+
ICsjICAgIHRoZSBsb3dlciBiaXRzLCByb3VuZGluZyBpbnRlZ2VycyB0byB0aGUgbmVhcmVzdCA0
ay4NCj4+Pj4gKyMNCj4+Pj4gKyMgICAgSW5zdGVhZCwgdXNlIHRoZSBmYWN0IHRoYXQgWGVuJ3Mg
LnRleHQgaXMgd2l0aGluIGEgMUcgYWxpZ25lZCByZWdpb24sIGFuZA0KPj4+PiArIyAgICBzcGxp
dCB0aGUgVk1BIGluIGhhbGYgc28gQVdLJ3MgbnVtZXJpYyBhZGRpdGlvbiBpcyBvbmx5IHdvcmtp
bmcgb24gMzIgYml0DQo+Pj4+ICsjICAgIG51bWJlcnMsIHdoaWNoIGRvbid0IGxvc2UgcHJlY2lz
aW9uLg0KPj4+PiArIw0KPj4+PiArZXZhbCAkKCR7T0JKRFVNUH0gLWggfCBhd2sgJyQyID09ICIu
dGV4dCIge3ByaW50ZiAidm1hX2hpPSVzXG52bWFfbG89JXNcbiIsIHN1YnN0cigkNCwgMSwgOCks
IHN1YnN0cigkNCwgOSwgMTYpfScpDQo+Pj4+ICsNCj4+Pj4gKyR7T0JKQ09QWX0gLU8gYmluYXJ5
ICRURVhUX0JJTg0KPj4+PiArZ3JlcCAtYW9iICIkKHByaW50ZiAnXDM2M1wxN1wzNlwzNzInKSIg
JFRFWFRfQklOIHwNCj4+Pj4gKyAgICBhd2sgLUYnOicgJ3twcmludGYgIiVzJXhcbiIsICInJHZt
YV9oaSciLCBzdHJ0b251bSgweCckdm1hX2xvJykgKyAkMX0nID4gJEFMTA0KPj4+IE5vbmUgb2Yg
dGhlIHRocmVlIG9wdGlvbnMgcGFzc2VkIHRvIGdyZXAgbG9vayB0byBiZSBzdGFuZGFyZGl6ZWQu
DQo+Pj4gSXMgdGhpcyBnb2luZyB0byBjYXVzZSBwcm9ibGVtcyBvbiBub24tTGludXggc3lzdGVt
cz8gU2hvdWxkIHRoaXMNCj4+PiBjaGVja2luZyBwZXJoYXBzIGJlIHB1dCBiZWhpbmQgYSBzZXBh
cmF0ZSBLY29uZmlnIG9wdGlvbj8NCj4+IENJIHNheXMgdGhhdCBGcmVlQlNEIGlzIGVudGlyZWx5
IGhhcHB5LCB3aGlsZSBBbHBpbmUgTGludXggaXNuJ3QuwqAgVGhpcw0KPj4gaXMgYmVjYXVzZSBB
bHBpbmUgaGFzIGJ1c3lib3gncyBncmVwIHVubGVzcyB5b3UgaW5zdGFsbCB0aGUgR05VIGdyZXAN
Cj4+IHBhY2thZ2UsIGFuZCBJJ20gZG9pbmcgYSBmaXggdG8gb3VyIGNvbnRhaW5lci4NCj4+DQo+
PiBNeSBwbGFuIHRvIGZpeCB0aGlzIGlzIHRvIGp1c3QgZGVjbGFyZSBhICJncmVwIGNhcGFibGUg
b2YgYmluYXJ5DQo+PiBzZWFyY2hpbmciIGEgY29uZGl0aW9uYWwgYnVpbGQgcmVxdWlyZW1lbnQg
Zm9yIFhlbi7CoCBJIGRvbid0IHRoaW5rIHRoaXMNCj4+IGlzIG9uZXJvdXMsIGFuZCB0aGVyZSBu
byBvdGhlciBwbGF1c2libGUgYWx0ZXJuYXRpdmVzIGhlcmUuDQo+Pg0KPj4gVGhlIG90aGVyIG9w
dGlvbiBpcyB0byBkZXRlY3QgdGhlIGFic2VuY2Ugb2Ygc3VwcG9ydCBhbiBza2lwIHRoZSBjaGVj
ay7CoA0KPj4gSXQgaXMgYWZ0ZXIgYWxsIGEgZGVmZW5jZSBpbiBkZXB0aCBzY2hlbWUsIGFuZCBh
bnl0aGluZyBsaWFibGUgdG8gY2F1c2UNCj4+IGEgcHJvYmxlbSB3b3VsZCBiZSBjYXVnaHQgaW4g
Q0kgYW55d2F5Lg0KPiBJJ2QgZmF2b3IgdGhlIGxhdHRlciBhcHByb2FjaCAoYnV0IEkgd291bGRu
J3QgbWluZCB0aGUgY29uZGl0aW9uYWwgYnVpbGQNCj4gcmVxdWlyZW1lbnQsIGlmIHlvdSBhbmQg
b3RoZXJzIGRlZW0gdGhhdCBiZXR0ZXIpLCB3aXRoIGEgd2FybmluZyBpc3N1ZWQNCj4gd2hlbiB0
aGUgY2hlY2sgY2FuJ3QgYmUgcGVyZm9ybWVkLiBJIGhhdmUgdG8gYWRtaXQgdGhhdCBJIGRpZG4n
dCBleHBlY3QNCj4gdGhlcmUgd291bGQgYmUgbm8gc2ltcGxlIGFuZCBzdGFuZGFyZGl6ZWQgYmlu
YXJ5IHNlYXJjaCB0b29sIG9uIFVuaXgtZXMuDQoNCk9rLCBzbyBsZXRzIGRvIHRoaXM6DQoNCjEp
IFRoaXMgc2NyaXB0IGdldHMgYSBjaGVjayBmb3IgJChncmVwIC1hb2IpIGFuZCBlbWl0cyBhIHdh
cm5pbmcgdG8NCnN0ZGVyciBidXQgZXhpdHMgMC7CoCBUaGlzIGxldHMgcGVvcGxlIHVzaW5nIElC
VCBrbm93IHRoYXQgc29tZXRoaW5nIHdhcw0KbWlzc2luZy4NCg0KMikgT3B0aW9uYWwgYnVpbGQg
ZGVwZW5kZW5jeSBvZiBgZ3JlcCAtYW9iYCBmb3IgWGVuLsKgIChqdXN0IGEgdHdlYWsgdG8NClJF
QURNRSkNCg0KMykgVXBkYXRlIHRoZSBhbHBpbmUgY29udGFpbmVycyB0byBub3QgbWlzcyBvdXQu
DQoNCn5BbmRyZXcNCg==

