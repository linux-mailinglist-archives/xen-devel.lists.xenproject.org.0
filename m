Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 181A543789F
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 16:02:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215109.374089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdv6e-00010U-MH; Fri, 22 Oct 2021 14:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215109.374089; Fri, 22 Oct 2021 14:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdv6e-0000yh-J6; Fri, 22 Oct 2021 14:01:12 +0000
Received: by outflank-mailman (input) for mailman id 215109;
 Fri, 22 Oct 2021 14:01:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OBiv=PK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mdv6c-0000yb-9l
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 14:01:10 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b47f8ba-d63d-4ed5-9d8d-88009e99c966;
 Fri, 22 Oct 2021 14:01:07 +0000 (UTC)
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
X-Inumbo-ID: 8b47f8ba-d63d-4ed5-9d8d-88009e99c966
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634911266;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TqIrvSKWU/DwVyXQpeWqTcwxT1jZB50kxJER9vdE09w=;
  b=h+jROFz5pP7zKQ6nLjPw02tDm77i0OQCwvWrjnWC2Mg8NPVgfUd4wWbr
   fs2WUzIvheJLPjsVausH58v0DiW8NM8VRTaIQPNjocVgUNFHnsf2eh9pw
   aKDuIlECOJMe1Mk8KrkusNY8aoAS8NxnQs77S0NZCHfGqyj9Ob0kPGUF/
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: BoGEFxgYLxA7TKholMG4TKWeZp6yIy92zlH9nv2at2lmyv8lNZho8v7OJEf3vyXsIASnIIA5py
 Dytgn3Fv4Hh//Be/wVRLqcQX+ep8JWZ+P7AGsW5T8owM4xKk6wlViWtQ5JBtGB4UV66ZbfcsGA
 DimbUFaQ4r/E5qEFDT3eAygi+GD3cWF6ZBZNLxy7OYbEVBx4TqkMwhxPKu5yfTymGkF/kB58kE
 04fbd+xJj/d+jJlf0xzM58k4OE/1lFgtT7ultxxS0bjE66DFELiJtEmhvjxgaIadfSNYJzCAKk
 uI+uQQxZ6ywmwTI1JxEpV4GY
X-SBRS: 5.1
X-MesageID: 55390137
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Q0xndK4RfOaYBizi4QooLgxRtKLAchMFZxGqfqrLsTDasY5as4F+v
 mQfDzuEa/zZZWHzKop2OY+1pE5TuJKDx99lHAU9rixmHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdh2NQw2rBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z4
 d5EucezdBYVIor0wd5MWARXHxFEMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gTQK2PP
 5NCNlKDajzGTTBOKmU6CKk3p+mR3kihXGZhl1as8P9fD2/7k1UqjemF3MDuUt6ASNhRn02Yj
 nnb5Gm/CRYfXPSe1jit4n+qnvXIny7wRMQVDrLQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAa60iDXtT7GRqirxaspQUAUtBdF+k77gClyafO5QudQG8eQVZpasEitcIwbSwn0
 BmOhdyBONB0mOTLEzTHrO7S9G7sf3hORYMfWcMaZSIO6tW4o7wisg7odo9ZQaWogdHFIz6ll
 lhmsxMCr7kUiMcK0YCy8lbGny+gq/D1c+Il2unEdjn6tl0hNeZJc6TtsAKBta8Rc+51W3HY5
 CBc8/Vy+tziGn1keMale+4KAK2yr8iMNDnRkDaD9LFwqmzzpRZPkW1WiQySxXuF0O5YJlcFg
 2eJ4Gu9AaO/2lPwMcebhKrqU6wXIVDIT4iNaxwtRoMmjmJNXAGG5jpyQkWbwnrglkMh+YlmZ
 8zHIZr1UiZCUvk2pNZTewv7+eV3rszZ7TiLLa0XMjz9iebODJJrYedt3KSyghARs/rf/VS9H
 yd3PMqW0RRPONASkQGMmbP/2WsidCBhbbiv8pQ/XrfafmJORTFwY9eMkOhJU9E0wMxoehLgo
 yjVtrlwkwGk2xUq6GyiNxheVV8Ydc8u9CxhZXVxZQrANrpKSd/H0ZrzvqAfJNEP3Odi0eR1X
 78CfcCBCe5IUTPJ53IWapyVkWCoXEjDadumM3X3bT4hUYRnQgCVqNbochG2rHsFDzattNt4q
 Lqlj1uJTZ0GTgVkLcDXdPPwkA/h4SlDwLp/DxnSP91eWETw64w2eSb/ueA6fpMXIhLZyzrEi
 wvPWUUEpfPAqpMe+cXSgfzWtJ+gFuZzRxIIH2TS4busGzPd+26vnd1JXOqSJGiPX2Lo4qSyI
 +5SyqikYvEAmV9Ltat6Eqpqkv1it4e++ecCw109TnvRblmtBrdxGVW83JFC5v9X27tUmQqqQ
 UbTqNNUDqqEZZH+G1kLKQt7MunajaMImiPf5OgeKVnh4HMl56KOVEhfMkXeiCFZK7cpYoopz
 f145ZwT4g27zBErLsyHnmZf8GHVdi4MVKAut5c7Bo73i1V0lgEeMMKEUiKmsouSb9hsM1UxJ
 m7GjaXPsL1Q207efidhDnPKx+dc2cwDtR0iIIXu/LhVdg4pXsMK4SA=
IronPort-HdrOrdr: A9a23:Pi2MtaDqtSEWe+DlHeg8sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6LW90dq7MAzhHPlOkPUs1NaZLXTbUQ6TQr2KgrGSuwEIdxeOkdK1kJ
 0QCZSWa+eAfWSS7/yKmTVQeuxIqLLskNHK9JTjJjVWPGVXgslbnnZE422gYytLrWd9dPgE/d
 anl7F6T23KQwVoUi33PAhJY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX232oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iBnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDA4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWArqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocWTbqjVQGagoBT+q3oYpxqdS32BnTq+/blnQS+pUoJjHfxn6ck7zA9HJFUcegM2w
 2LCNUvqFh0dL5iUUtKPpZ2fSKGMB2+ffvyChPnHb3GLtBNB5ufke+83F0KjNvaD6DgiqFCwa
 j8bA==
X-IronPort-AV: E=Sophos;i="5.87,173,1631592000"; 
   d="scan'208";a="55390137"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgVY6bS4XcRA4yQj/eYM81/4l5lN5blG0PKJl0u9qvxovi9WHu4Hg7ibwOkN6hmG0zCRW0tmU4ii69hKOzMt/TX/qTjMiz+tlWTFpeO/nJJ2V2SGmN4V4/lrg1jM8GwJwv9rfGYiYieyiQY2G6VgdnlJ/6PtGsVx9txy7LfcREYTiCkXzf2qclQjHXnvBVmtdwYhfA/KDxicxRD5sIeYtmMoMPzDwhc9P7VHNUWoBdyktuYGlEvLrCMNMaPmtpEc/Abx47+/AomqRbGQFr1CY9nHG+RwTyFc+WZUGcv/UKDlieC88A0I4sK8dCUm1A1++FYD84oGAQLnPUPPgxmqTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKlQwR57eOPgWtz7lCdOmogpzFIwemmD6XTnjE4GD3g=;
 b=SAc5vFISciuMR/+csgge620rU6vf6SILx/hfFvCSGKIDKaPJtrqfE7aLzg7meA33a9XfSIilInVRL9lv2J0Nd083dvGO4fxICP0TZN5/lx1P935zJioRwVYII3Wkhph/UsTpKmieLLSnmvwKi2K/t0JZ8qg3zvPQ8Ud4GgMBYwvmGrKdl2CkikFnkL0YN2JTCcya4dcuuuQKaIc/JYIgLS6a7vAF3+rHsN6dMIILOtPK9Nt40hCBU1+r4BuMP6t6yNQT9fL6Stpmk/yTIq4FnCwltfVv8RIyJBeqYH1s91SODQjNjSC9+9yA9XFz9YXJ1qwB8LTtRsXAwunDAIwnTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKlQwR57eOPgWtz7lCdOmogpzFIwemmD6XTnjE4GD3g=;
 b=CCMnsmHpssME2IjHY25QCeV3FzksqN89xxY1YhRNFPTjC21AJxJDN1rY2+7uIsUEDtz2JoTTYdjrV0EkDWRMJ7a7yeUOX6JG4fZz1Cvp6gz77WNkru6U6EzJfv/FV43PpWznl63U6O58heVOXxgqJ5BwDV1pR89cUn/GWqJrkc8=
To: Lin Liu <lin.liu@citrix.com>, <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
References: <cover.1634897942.git.lin.liu@citrix.com>
 <89afdafa9020ab77b9d662bd5c8f7b2d31e53c5c.1634897942.git.lin.liu@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/7] xen: implement byteswap.h
Message-ID: <ca9c27b5-26ef-dce5-4abd-83cb7d24241e@citrix.com>
Date: Fri, 22 Oct 2021 15:00:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <89afdafa9020ab77b9d662bd5c8f7b2d31e53c5c.1634897942.git.lin.liu@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0389.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bc363a4-95e8-4282-fd58-08d9956462d3
X-MS-TrafficTypeDiagnostic: BY5PR03MB5284:
X-Microsoft-Antispam-PRVS: <BY5PR03MB52845A161FB89A1FE27598C3BA809@BY5PR03MB5284.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xWre6+AT0p5zY+NhsrX/LVxB33Y8j7Flio57KQ9ETWv6AFvHSEaRjqWAgnXO2o3W2ennj+9gExJUe5T+nJJdlAhIAxOfa2Xs83NxUuvaXiuVz8xgi2gygQBpXlVsc2qhf4IfnmGqqmgbR2izqIrY1qRRvWLM/so3Jx8bnB1rX92fTBv4oHQGRpibYxN2+VwZO21iuNkdeh5zxw9UEBfb51B50rziWUC7irhvpmua+a0WfTpfDMmGwZXzyRGU6+2K8Z2sWiy9pCqmMKOzoIT7hxwZNU1qCdNe6GpMe+3WZIc+Z7YShhY9JZOJan7XaI4/OJZ1nz5to7PuILdKryKcpkKWvNvGcWvfI1WJqYk4RqGBi3u+P3Gsl6m9Z+SZaWF4h6604U9PPOjZ3MGcaVDaveKD7Oq3PAhT4NKNunCCVf00dHhZvNBRMh1OQThhbaeaGOIP6wSCOrty2afuLdvpEgJIXuXhQrCzowEeMUnMbSZSdLKbsrMe6ZhYIqQ6toYyKntJCDN2Siz+EVKvj0bcqwwIh4zsgHm4N1jajVwapYv819TI93A8TN7Ewz84kiV4pk4TLghQdrZN5YCzNYaZEEggx2OVLxrp6Qq0p8UdQjSBD3fXrxz7Pxud/dB0paAsRlQ4X7R7TJzP5LTYw6MfwlD7AVc8Pv+5BL9B+L1pDYQMn8Jh7jXseQ5aIddFSifEzoqIzz87r9M6cG7mjn+ZiUMZeFyAJu6qV6LZgGSt3zgJSnS5Sn2WizW4aEBRVWnz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(4326008)(2616005)(66476007)(38100700002)(26005)(36756003)(2906002)(316002)(16576012)(31696002)(186003)(6486002)(508600001)(8676002)(4744005)(86362001)(66946007)(54906003)(956004)(82960400001)(66556008)(6666004)(31686004)(53546011)(83380400001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTEvaDgvcUVDOVhFb3dqejIyNVFLUDFuY1dJamNQMTMrUEdrOHpWWTZiVGFL?=
 =?utf-8?B?U1RyS29VWHJVVjZLMkJJQU5uRkNMWkdQVGRPRGszOWJkQnBrOVIwSHBjVXBv?=
 =?utf-8?B?OTNwa2NTbFp4dFROelhIMXlTZUcvaHU3eTNRcUFJRlRTcmVlVExoeVFQTTNP?=
 =?utf-8?B?R3ZOdEdXU2hPQ3pVcDFhMmFibnhvT3Mwc0JheE9RbGRhSGFYc0hhNlZhaEY3?=
 =?utf-8?B?UWNCV0pUSVdkaW9MRGxieGd0emM5NFJLc0VPL3FrUWd5YnVGREJjeEhKd1hp?=
 =?utf-8?B?YmtBN0QzaXliYWJqblQ1NDZBUnhYUzN4VmFaMExoeCtwS05KUXFvWmUwZFc1?=
 =?utf-8?B?b3QxVnVKaUludEVhVlFXOCs3ZURKRVhBa3J4K3FCMGhvVkdDeGtqZ3l1L0FF?=
 =?utf-8?B?T2Z6OHZpUkFQUDhsbURjUSt6SmNjM0thSkk3SEtYU1QyN1Eyc0p2K1UrZW1w?=
 =?utf-8?B?UEpTWTIrVTdiZ2xodUNRejllTmtpQ3RKMSs1NVBRWTlNYXhPQnpVbThPQTRw?=
 =?utf-8?B?eTVuWHVrbm9IMzk0ekt0TjI5b2dERlptakEyWTFsQ2t3WStPOFNrTk9JUHpU?=
 =?utf-8?B?Q2hMa0swUU53cmpzcWIxcWE2L3BwVVkycW5NY0V5clZMOS9QdEdMUHZObnlG?=
 =?utf-8?B?TzFGL1FSM2p3YjZ2REZOamxmOUFCMmVHcUxmVk9ZcEJiekNVTEVCUUtYZ3Nj?=
 =?utf-8?B?TXdBZ1ZWNTlxTkVhZy9hR2tIcVhxZm9QL2dFczBocWdweU9CclVvNEFLcW1B?=
 =?utf-8?B?ZEtRcDQraFZTSm1Fb3p3eGsyM0dJT0NXaTExYlBsU2FLYnhxM1dDdU5oaGlC?=
 =?utf-8?B?cW8xMDh1UDdyY3FuOWRlbWFLZUVGclpkT0Jhem9MTEFmTDBvN01YRTNaS0Q4?=
 =?utf-8?B?UFBUVWYxVEZaRkxhMjVSUjdlUVNKWTl3R0J5aHZVU1ZVaXl5WExOODFUWkk5?=
 =?utf-8?B?ZFdLUjlGaGVqUWo1MG1UZzExR2pTOGNrSnVJblg0WVg5ZWpFcGx3Nm9OcVdv?=
 =?utf-8?B?TWhSV0t5OXhRazRZMTN5YTlwR21TWDBLSnNHUkhqNk9QZG9PUWNaNC8yY3c3?=
 =?utf-8?B?eUE3UjRHYWM4ZjB5RmtqbkJlUy83dU9KWUJMMFJyRnUxWDRyNkFjUHl2U05R?=
 =?utf-8?B?YjQyS2w4dnZaVkpjZEtNUHJ3a1B1VzIvVTdUSFhyVDNpOTQ3TTd0THJyRVJB?=
 =?utf-8?B?TGZGWERUVFZEOHFOcXBTVlFYaG1USUZJcVFGOGVteVhaNDF3dEVwVEMwWUlC?=
 =?utf-8?B?b1ZrQ3lsbmlJRGdUbEhNa0x3MHdZWGg0VXFoLzM4SFdHb21FdEhCd2NiKzd1?=
 =?utf-8?B?cDk4VFQrZWNRSXhScVhUZHBscDhNOTdnY1k0eDdFMVNDY1pYa3A0aFJ5eDFj?=
 =?utf-8?B?b0p0K0NGMlVNcXVQWXE2d3QrZm9nckgxS052Qk50eW5XMVdUNnU2Z2o4bFdE?=
 =?utf-8?B?TWZXUGFLVzN0ZTMvRERGelgyK2l2ZUMvR1p4ak9LVEdFYjVIUzFQbjdXbVFk?=
 =?utf-8?B?N1YzUUFJL1ZkcFQrRTNQelpVZll2U3dETDdUcjIzZkFoR0xNbnB5cktGUTgr?=
 =?utf-8?B?OVc2U090VmlHbkdwNkM4RmtuU05PS2gzbTZETm9LdFJ2aEtac3RWN3p3cTJ6?=
 =?utf-8?B?dXhnUUNPdkRDYjQ0OXQyRXYvMnJZeHM1NmVYNDI1OWNxWEQ1WktEZHppK0d2?=
 =?utf-8?B?SjJkT1RoNEd4dzRZWFVnL2IwRGhWZXNiMi95NGRIWEljZW1lM2MwT0ZSWHI1?=
 =?utf-8?B?V2dmem5oQW44NjdDVy94TlNMeU5JL1FZWGFpOWNSSWh1MnpYN0ZtS05JRmQ2?=
 =?utf-8?B?K1VHa2hVQy9BUjBOUVdNcVdiT0RqN2trbXE2eE1TNUpILzRKM0JiejVQMDhI?=
 =?utf-8?B?L2M2Q01PK3dHN29jOUlySXA1KzNFQ1A5U0Q4eHZhODJ3K1hXRXlLWU9WQzNT?=
 =?utf-8?Q?pC1EQXG5as9NM1tNWC2vl5714ru2jd8z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc363a4-95e8-4282-fd58-08d9956462d3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 14:01:03.8113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: andrew.cooper3@citrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5284
X-OriginatorOrg: citrix.com

On 22/10/2021 11:47, Lin Liu wrote:
> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
> index 696c7eb89e..68f28082a5 100644
> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -179,4 +179,16 @@
>  # define CLANG_DISABLE_WARN_GCC_COMPAT_END
>  #endif
> =20
> +#if (!defined(__clang__) && (__GNUC__ < 10))

This too lost my feedback.

It needs to be #ifndef __has_builtin because otherwise a random GCC 10
build I have fails with:

/local/security/xen.git/xen/include/xen/byteswap.h:6:19: error: missing
binary operator before token "("
=C2=A0=C2=A0=C2=A0 6 | #if !__has_builtin(__builtin_bswap16)


I suspect it was a build of GCC 10 before __has_builtin() support was
added, but either way, we should be predicating on __has_builtin itself,
not version guesswork.

~Andrew


