Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC0241960A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 16:14:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196924.349831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUrOd-0001i7-Lc; Mon, 27 Sep 2021 14:14:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196924.349831; Mon, 27 Sep 2021 14:14:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUrOd-0001fN-Hq; Mon, 27 Sep 2021 14:14:19 +0000
Received: by outflank-mailman (input) for mailman id 196924;
 Mon, 27 Sep 2021 14:14:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g88l=OR=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mUrOb-0001fB-QO
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 14:14:18 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32a74c34-1f9d-11ec-bc4d-12813bfff9fa;
 Mon, 27 Sep 2021 14:14:16 +0000 (UTC)
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
X-Inumbo-ID: 32a74c34-1f9d-11ec-bc4d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632752056;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tlVgqlUaCwykdxCPmHzNbthKGv0kqdLyw1pCdry7ZAU=;
  b=hv9u33Bg3C84hpQvwP7jRLp6mx173lNPzRSjoXlrIf/BE40cHzDlumsH
   WcuWcbbq2OP/pMjDOTtab9L7nVrmCQZ2cVrHz3yjGkKT729R1b8jcH+x2
   p5R+IsHf4EiZGkp8ZP7LzOuPvDwiGHgb6xsa7o14uWLDqjZ2EkH1PRuYL
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: EpbPAmmryCrun1GMsck/hO0TaDRfQsfSjxwTo0Jkuc7IAyNV5AI14z+Ts+PpJ3h/M+yLCXwUoe
 L8XtiUlsh185UQ7m4T8HLIFxHzIPkUqHYqTLLKARvp0iIIeek/pV3dgbclmqj7yQ/6ktIDPbJI
 upi00q1+XfOD1LaKdPoT0dM5xVMkJXkSKx0VK0byUiRIUIxF43H/L2aTra0E/U4xOZKP4As4qT
 yoz//A3dST+nzrFRWQpYF70Fp0vbjRDkNEErEGdyMSwTu89ffPKWYXJvloHnRuhBXXITTNHBmq
 Thvgojj3flYVmDzsllBwjvEg
X-SBRS: 5.1
X-MesageID: 55533150
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:r8ZRzqPxL2puu7PvrR1UkMFynXyQoLVcMsEvi/4bfWQNrUp23jxWn
 DRJCGGHbqmNYTSneNh/OYrlp0oO7MOEyN9gQQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6ZUsxNbVU8En552Eg8w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo2W0x81Y4
 t5OjKKhEEAGPfTWltUdUAYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgWpt3ZsXQK62i
 8wxMgo1YkvHfDp0OBQrCNFjwrauqmCjWmgNwL6SjfVuuDWCpOBr65D9PdyQdtGUSMF9mkeDu
 nmA72n/GgsdNtGU1XyC6H3Eru3AhyTgQ6oJCaa1sPVthTW72Wg7GBAQE1yhrpGRi1G8c8JSL
 VQO/SgjprR081akJuQRRDXh/iTC5ERFHYMNTatqs2lh15Y4/S7JOzAZZxRKa+UYpZZxaj9zz
 FG4n9D2UGkHXKKudVqR8bKdrDWXMCcTLHMfaSJscTbp8+UPs6lp0EuQH48L/Lqdy42tQG6sk
 1hmuQBk390uYdg3O7JXFLwtqxyrvISBagco6gjNUmuh42uVj6b+PNfwuDA3ARtaRbt1r2VtX
 lBYxaByD8hUVPlhcRBhps1WRdlFAN7fbFXhbaZHRcVJythU0yfLkXpsyD9/Plx1Fc0PZCXkZ
 kTe0SsIusQJYivzMf4pM9jrYyjP8UQGPY+8PhwzRoASCqWdiSfdpH0+DaJu9zqFfLcQfVEXZ
 s7ALJfE4YcyAqV71jumL9rxIpdxrh3SMVj7HMihpzz+iOL2TCfMFd8tbQvfBshkvfjsiFiEr
 L5i2z6ilkw3vBvWOXKMr+b+7DkicBAGOHwBg5YMK7HfclY4QjFJ5j246epJRrGJVp99z4/g1
 nq8RlVZ2Bz4g3jGIh+NcXdtdPXkWpMXkJ7xFXZE0Y+A1ydxbICxwr0YcpdrL7Ar+PY6lax/T
 uUfetXGCfNKE2yV9zMYZJj7jYpjaBX02l7eY3v7OGAyL8x6WgjE2t74ZQ+zpiMAOTW66Jklq
 Lq62wKFHZdaH1Z+DNzbYe6Exk+quSRPg/p7WkbFe4EBeEjl/IVwBTb2i/s7f5MFJRnZn2PI3
 AeKGxYI4+LKptZtotXOgKmFqaavEvd/QRUGTzWKs+7uOHCDrGS5wIJGXOKZRhznVTv5qPe4e
 OFY7/DgK/lbzlxEhJVxTuRwxqUk6tqx+7IDllZ4HG/GZkiAA697JiXUxtFGs6BAy+MLuQayX
 U7TqNBWNa/QZZHgGV8VYgEkcv6CxbcfnTyLtaY5J0Dz5SlW+rubUBoNY0nQ2XIFdLYlYpk4x
 eoBudIN713tgxUnBd+KkyRI+jneNXcHSagm6skXDYKDZtDHEb2ejUgw0hPL3aw=
IronPort-HdrOrdr: A9a23:T11zj6PtyZzrkcBcT1H155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/OxoS5PwPk80kqQFnbX5XI3SITUO3VHHEGgM1/qb/9SNIVyYygcZ79
 YbT0EcMqyBMbEZt7eC3ODQKb9Jq7PmgcPY9ts2jU0dKT2CA5sQnjuRYTzrdHGeKjM2Z6bRWK
 Dsnfau8FGbCAoqh4mAdzQ4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kPEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 XxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72weBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlFXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbdrmGuhHjLkV1RUsZmRtixZJGbDfqFCgL3a79FupgE786NCr/Zv2Uvp9/oGOtB5Dq
 r/Q+JVfYp1P7orhJRGdZE8qPuMex7wqC33QRavyHTcZeo60iH22tTKCItc3pDcRHVP9upqpK
 j8
X-IronPort-AV: E=Sophos;i="5.85,326,1624334400"; 
   d="scan'208";a="55533150"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CY9UD5M/WlEmMf6dvno5ysP8IH8eKCxL0eFympj4KD7J5dbzG2sR+TMviL0ltai0i0rb4l4xSSn6J3weVPnkxSS4XXOJYHfyCNShLv4b6nLFDfPyUGwtZGF/gGzvoYneN/AlRRbJNWlMQEy+HdD6W67Gj9fiAGG1GgrHrXC+nvRIwxcvo6q536FEXY8f7lpcg1dum2RhqBQJ3EwlLEkVr/j0qbXYGx07Qt2dDR2VWpCUcf8KKbLsi9iqGtIS74EQQt0QHbURjISdP09D5hh1vMM5HWl3anXf7vAZ3YWg8UfCsP3DKA0eLfO5PxjlCi6DJvbrQfXr+QgT5sURZuNUXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=tlVgqlUaCwykdxCPmHzNbthKGv0kqdLyw1pCdry7ZAU=;
 b=GPxTxGprj5UqSTB6Ik78QfGhA9c6BJR1j+FDpe4tj7YGrDZ5Ndfgbe4MuipDczKS/NsfUfAk4cwuKHomF3vxfWYL9R2RWC8oHcgcKKCgWH3cjezUscM0OGW+Dmz6Aef4we+Ge0Z+K4xd4/jq50f5HTOR8T8orisw20wsJ/3Y6KSm0q9sRnfV5frlxeIRGbeNq+mtLKLGY5T8ICDXXbJurx1OsIl9s2OMpTZIj6qrb/eEp6D3RNBaGYktkQi0OHoR64UhsVEC+mLeD7+We6YIYdV6q8wTvA68SLrZhQquJceYQn/AJsndd873Fioo++8eWTHvikwsHLMQ+/5Wu2g5nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlVgqlUaCwykdxCPmHzNbthKGv0kqdLyw1pCdry7ZAU=;
 b=jEJc5pkSK2BHv7H3R3U6e5QaZY75ahCFNpD5sVlfp8tBIdr4Eyt1Lq6uTtJ4F8tdZKgTXjkrrUPKxpmGQDWoB2Zf5x2Cs1As5n3vjfs9lHPSQvaXnsr6GeycaL105SQqj6+gq8egkGloyuoP7goI/rVUYoztJQuMfNpNhU5bmOM=
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210927104813.19772-1-jgross@suse.com>
 <20210927104813.19772-3-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 2/2] tools/xenstore: set open file descriptor limit for
 xenstored
Message-ID: <f858dda9-b844-48e4-c079-75296cc36316@citrix.com>
Date: Mon, 27 Sep 2021 15:13:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210927104813.19772-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0157.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::25) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84d8ae59-a21f-42cf-f3b7-08d981c10256
X-MS-TrafficTypeDiagnostic: BYAPR03MB3496:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3496B6A55E87D5EC49241A7ABAA79@BYAPR03MB3496.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QtBG7/ozejH2ThHVV/O6r0KCd0mrVnlqdo7kQOysdCb4RvaXc+CDcuA2DM+WQWS6jHjQbUAF5RN1HBlb8P6qi9HVxfjhEmE+fXNPLTR+ezluaQD26+P/e9IMnqQSRQpBrC4rO0/yS9emL4anYW0pqlSQgqzYhxSPfwUSeI+Y+r0F62j9agzQNMaic2EgQFVFW96KZOXwH5zkKEEhwZn0rOnLvmMtxDItAKxZA0gjmNwI8v8JxVXEafSWlivQuJibvVAu4DVfPc9x2hSn71zK/3ObbHezTKIekUCxgwU7pixX+DHEQoqPcPyoRg5/X482r7v/V7Q45W22xkQQ7PsTbuKgC8hFVoWkolcD3+RJ2frYNAnkyWvopbz9GD4idBEz2jF364k6m33gESu2Zi24VVdJ0Hjr3IW8dT0n+7UELxvSoloqybSWjOfeY9zcKgYoczavmWjKvEY0VozYfHx53y1sFsQqFjFjGPuk2wqekFhvYSqODS7okbfqhlORos+JbBHutLVmWqEv3BU3+Nd4VBSjOBib6PHSbc9mewCguqGENPRd8exi2aCdZboR4HxrZ4jLKaVLqBG2mMdGRTcr6SQfm8eh5WpkXnQVU4SLLaXb97V7MdMAw+Xoi1OFgXgTWTo6PgmPswS5ztzP8wGM0+hGIcvzmSyvRHE6kcp7ODzO1gI/ASY2blMlYK8Z4Xhn3GKvEeEeDuwsxOzbdkZRZHRqwMeTeq5uZzcllnbIWdM6YzC7hkesT0Aw9gOmLc36xk2UHu1uaDArOJwSfgQuvbxEYaW1LurQs7Yaok+SK2eSolLxx3DGdg0Qf+QOcv/8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(31686004)(8936002)(6486002)(53546011)(186003)(966005)(4744005)(2616005)(36756003)(66946007)(66476007)(66556008)(508600001)(26005)(956004)(8676002)(4326008)(2906002)(54906003)(6666004)(316002)(16576012)(38100700002)(31696002)(86362001)(83380400001)(55236004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkRvRlB0dXNDbnRyalJsQmdrMHhseFZWRnBIc3JtUTQ3N3V3QlhhWXNDSHRM?=
 =?utf-8?B?MzUzZ1drNVJFRVhnb3dwYm82SE53TDkvREs5NHJEV01uVWdralpJci8rV0FZ?=
 =?utf-8?B?cGpkLy91Q1hmbVFuaVVhb2NQNW5RdStXNThIK1FyMCt5ckw2K1BFMTNzRHRt?=
 =?utf-8?B?b21HeXJLQjlkVWZlakU5THp2K0l0ZEpSRTg2c0tsN0ZmSktNS3ZKaFRscVNX?=
 =?utf-8?B?K0dEaVlxM1lUaFFQTTFUSjE4ZE05NFl3c1JsdWVjMlNOQlg5TExoQ0JPSm5m?=
 =?utf-8?B?ZlNCUFJidmtHdTlWMnk3NlVCNm9WSXFXKzNWejZDR3RMOFZkM0hMSlV3aC85?=
 =?utf-8?B?ZjJ3QndNLzdhdXN3YXNZbjkyb0pMZlFVQXhQRVgveG51OHUzQkR4Rk1zaFBH?=
 =?utf-8?B?ZkJuVlVJYWM5Z2lmdGVIWjFwZW40NWNtSUpyc3JYSWJCLzhsWnpnQWpLY1BE?=
 =?utf-8?B?dE5JQ1VEdFNpRnhSb2xFZHM1KzJHUlZaVjlOV0dHQnh4QWxVTDNFWFo3c3JZ?=
 =?utf-8?B?RVA2RUJybm5UczdCNEduRWZrN3h2bDVZTUJpS3pNMG52YmQ2c2k4elhqd2N0?=
 =?utf-8?B?aHdRTStOS2xiQjRPY3NDL1ptdmd4L2JQaU9HYmdLc0ZLUUk3eloxTExSUEpN?=
 =?utf-8?B?ZWF2MWpiWHFRNjIvQ0pyS2RhenBYYmxWdkFXSDlTZkdycGpUQWRxcWprVUQr?=
 =?utf-8?B?RlJiRThtSWRXVGVGSkFSVGhaM2FjS05JM0pCWmpjVGoyQjhiRmNOeHhKTk0w?=
 =?utf-8?B?MHNjNEtJT0g0NjN0T3J4NHdua2NMV2hsV1RPM1k3N3VoYlRQMmFldXZkR1px?=
 =?utf-8?B?U09CTGdQTkd2YktpUHk1RnBTUUtMZjhEcndERmVEQ3F3N0lMRjVSd1Z3VTh3?=
 =?utf-8?B?QkR3UUFtY2xFcmVRS29nY3FBZXdydXBIWkYvVVM5YVZNei9vbUVYc0k0NTND?=
 =?utf-8?B?bFNvUER2a0pycmxLZzk3b3pxTE95ekZHVjQwTHlyYmRmT1ZFREhWZjVmWW1R?=
 =?utf-8?B?RXg3bFRFbmFTaHJKc3VrUmI2Rzk2em9iRUdvekxydy9uVnFqcmk4elYweWNU?=
 =?utf-8?B?bUZJeEpzMkZSWHdmQk5GRWh3bUt0Q0YyTGdkWEhMblQvZzFZQTF0cS9hWVpq?=
 =?utf-8?B?MkdiTElXaVB5MWNoWXVnNWlHOU9HejQyWElDVHhoWFFHbFpoYllGQm1zdUN6?=
 =?utf-8?B?VHQyR05GVTRrVTlsbUhoY1RRT0JRUFJPazF5a3I5dUc0K0I0TituWmxEYzg2?=
 =?utf-8?B?aWoxN3NQcGRKUkRSOVh2VVBMTVRma2krbEEwSUlWL3pGM2hkWVQ3dTBOTzRx?=
 =?utf-8?B?R2QvZzdReHBSYVhaTHRTdkpLaGxuQXpWUFBDTmdTRzlOanJWN2FnUktnYWg5?=
 =?utf-8?B?SVJ3aVMyOG9ndjRZMjlsVWd0enMxNlQrbUxyYjRLcGk0UWRIWStaYzY1Y0hL?=
 =?utf-8?B?ekJ0dlFpNXRzSzY0cWc3ZnE1aU9sSjlBL3hiQmZLRzl5UHFYMkNWN2hRRG41?=
 =?utf-8?B?amxkZ2JzcnltWG9LSFNUbEt3MXJxcjNZUlgxQmZMR1ZrSElsV0NpMUFacWFK?=
 =?utf-8?B?YzhjUUdFeXo0S3A3NVdEUkIzNHhMR1loZ080RGZTcm1NVEtkK3FKTWRZY3dQ?=
 =?utf-8?B?U0twUTVVbUwvNHBIUTh3NUwwbzJ2WFdpMUdacFQzWDRXZXJqWFFxSm51YnRE?=
 =?utf-8?B?d2ppdXE2M0dXY3hZckdmVGZMaGM4S3V2QWlzdzJQQnNOb0p3bFhhVE5ZUldO?=
 =?utf-8?Q?Aww5mL5EdvvWVtQeK/uEsC4Nm0gKK0E9lTtUDmr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d8ae59-a21f-42cf-f3b7-08d981c10256
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 14:13:42.1087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4o8y7hq5ydgyfea0QUIQvlyuGyIC/tJOiIQiyDGdYn4zi5pcPa1aFDs+LLZoyQBe49xFMJbtsT6YzrkRYoLmfIMLRbZpkbo0uOQBYTyidAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3496
X-OriginatorOrg: citrix.com

On 27/09/2021 11:48, Juergen Gross wrote:
> Add a configuration item for the maximum number of open file
> descriptors xenstored should be allowed to have.
>
> The default should be "unlimited" in order not to restrict xenstored
> in the number of domains it can support, but unfortunately the prlimit
> command requires specification of a real value for the number of files,
> so use 262144 as the default value.

Citation needed.

prlimit -nunlimited

prlimit --nofile=3Dunlimited

both work fine, and strace confirms they issue correct system calls.

Support for "unlimited" as a parameter has existed for the entire
lifetime of the utility,
https://github.com/karelzak/util-linux/commit/6bac2825af7216c5471148e219dbc=
f62ec5ede84

~Andrew


