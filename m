Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A193BBA77
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 11:47:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150013.277430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0LCS-0007gC-Cr; Mon, 05 Jul 2021 09:47:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150013.277430; Mon, 05 Jul 2021 09:47:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0LCS-0007db-9e; Mon, 05 Jul 2021 09:47:36 +0000
Received: by outflank-mailman (input) for mailman id 150013;
 Mon, 05 Jul 2021 09:47:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qt1=L5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1m0LCQ-0007dV-NA
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 09:47:34 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93fe4a2a-b445-4d1c-8f9e-0a2cbdf1354a;
 Mon, 05 Jul 2021 09:47:33 +0000 (UTC)
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
X-Inumbo-ID: 93fe4a2a-b445-4d1c-8f9e-0a2cbdf1354a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625478453;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iUtEilgZoF8dQmmEdjYe8oevo8CDCXJko0OWxJ4UjF0=;
  b=QwGYiDlogq9byEMo8hpS4x6FX2gpyA9atS2AlLnvsh3DVFLEpaPYu52+
   oScAUG2NSjCyvK2adrS0BpWdVPD6bojMdqgRIOjgGvbE6zclgaN+TSEdn
   nzHY1v3OqUTF3UDKX/giHpzZwP5Kho6Ny/9pOu4hRQTZVqyHqAd2B6tZ0
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wdPBSu6NDlD1ib6zE6ZAWrajWYg5BTXeOo9a3xYPpCToVg+BkniB+8BSBHl17/Ii0nuZ3tDzvi
 kaAzUUOUN9jcTLsXvu+BLqVwIhjQq13ICwRZd2nQsE5fzGh4vE7+6AXeWeI5uW/RZEm1BY9OsG
 aCwk5WfrmP7xf5QDUis0IkNOQrQzjOZkxaAMvlKibDs5m0Gcst32eYGRm/hrTzncjmX2CfPK0q
 haEoTV9rqBm+6NXF5Ob6tRk8n6dY+PcV2jsoLnJNlDsLKr1ChPso+lQzwp6Zm0e03tlJugB5+7
 UCg=
X-SBRS: 5.1
X-MesageID: 47571795
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:N3KXM6Br1RucqonlHehHsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6LW90dq7MAzhHPlOkPUs1NaZLXTbUQ6TQr2KgrGSuwEIdxeOkdK1kJ
 0QCZSWa+eAfmSS7/yKmTVQeuxIqLLskNHK9JLjJjVWPGVXgslbnndE422gYytLrWd9dPgE/d
 anl7F6T23KQwVnUi33PAhIY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX222oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iCnz4Qe+BIr1/BdGC8phXgnyP61iw11nPkwViExVP+vM3QXlsBeol8rLMcViGcx1srvdl63q
 4O9XmerYBrARTJmzm4z8TUVittilG/rRMZ4K4uZkRkIM4jgYJq3MgiFBs/KuZGIMu60vFnLA
 BWNrCf2B4MGmnqKUww1wJUsa6RtndaJGbMfqFNgL3N79FspgEP86Iv/r1Wop4xzuNId3B63Z
 WzDk1JrsAFciZEV9MxOA8+KfHHQ1AlFii8Tl56Z26XTJ06Bw==
X-IronPort-AV: E=Sophos;i="5.83,325,1616472000"; 
   d="scan'208";a="47571795"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFAhf0F0Uu9DtQyuF8ZwpptS2bIRP0K2k2oWhl4G6ku5WzbLVycE29vrEdtMM6vcDRVZ3bS+qqNHNW9R3WKoKpW78y0ofBcu5JuQsqyTuaM3wQP5GofxJmxaBcRouoCrfMGCGVSZ/8AkNwO/KcqHQBQyds5ADmguFIKwKmZzqq61oppv/E9JzpThpLU9Z58fO/QdkJyl98hfvmUVaTPjAlFPfVmb7Pw6ycMo4OlpnJ1fintNC+LmnIe0OME7B+c92kag25Yihgsm2KHcD+cvbhCx819myJX4KZ+itBlBehYuswf/UIlSN4JSg8NGKlky+xc6DQkAGEEiHgQXQNNENg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUtEilgZoF8dQmmEdjYe8oevo8CDCXJko0OWxJ4UjF0=;
 b=kHqsCQGeJwLcvtqVzXb6V3HJflwU0VUKOegrMu9tSeEXUVX4tcIvkuYwlaN/qZKQvKSFlrMBI+cq4hUgs5G2OgYsKqIWtKeDlSIujuy0ui2EEB6nRXOnYc3ef9rIXw4XBdQhp1eGTK4p2n85Ad9V36NKllsBn8quZJyMjhdVElLHkP/VTcfXp4Lq33NJOM1bUkJeeuMlb7o8lng+Bs1o6OXFk7LfHM94uIy5dU7Czx54T9gHQrqHa0OcLjYNZpRwgiuvn2ve9XgVZkZQ8o4pFBLaVV5ZDBYhd27VeOwoBnVYk6y6k/K89ySZXv9qXAn0BplEQeE/ijpKewAfbmlwAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUtEilgZoF8dQmmEdjYe8oevo8CDCXJko0OWxJ4UjF0=;
 b=tkrMWhEYj7uRfK3+Qxm+RW31AljkzoYSJxtuhn42615p0Goy6p+lw3V7uLlOODYbZVxatHmeZsPpn1rAOlBunnmROY9BHhfxqangs17Oho8Tobu/h/ej18cE9jcJO714A9hbMjgCSDDnEyJPjDOy4t97mwUNM3NpLWXpsyAj/wM=
To: Olaf Hering <olaf@aepfle.de>
CC: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, <xen-devel@lists.xenproject.org>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-7-olaf@aepfle.de> <YN88m0tvHKxF7+NI@mail-itl>
 <e285cef0-4c85-35a1-37a9-f56ec9122002@citrix.com>
 <20210705101838.2f760ed9.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v20210701 06/40] tools: fix Python3.4 TypeError in format
 string
Message-ID: <e5419479-e132-0c49-882d-acbbe216ddca@citrix.com>
Date: Mon, 5 Jul 2021 10:47:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210705101838.2f760ed9.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0277.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9301c23e-a7e1-4570-00ab-08d93f99e737
X-MS-TrafficTypeDiagnostic: BYAPR03MB4550:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4550B2DE281C269A29AB623FBA1C9@BYAPR03MB4550.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wxBaZB0NAKBFSEdHo89/g+SkfzktpZtTNqapBKJx/Gq3MPNmbtHkllB6p8dDQC6UUFBxPuW7XKRmSKTtKWLEjzS/Gqg19T2g+CfOpskwq7aVYlXVXehjJVfCUNwgYh6mLNBlcMAU9yQ/IQNU/fsSzi1drx0857gEasRTzkV6q6fTwrnwZkIFhrtvKZPTN8OoUpV7TXLjyDmG6B1x07FKX0jp4cd2cbrN4FQNNUdVN7DVIdQJ334VaMtjD/PBF/oEhkZafUs9OHlSgvrp4mXNU2ZUTy9XcMqTgLcXiioBEiX8V4plT5ozxwvZcZzCvqiLkPGtLBflXfIJox4lce4vBoEyU/LPAFFzkk8S11fC09ZWgOa3RVPOkad9xQ5SAD+Yi3NW+2e6jrdgk9bVlZdIxa0zpBti/iiaNQs1Rxk/HxKL/qz96Cl30hyx0qY6RsgnRoIXncK8WacuSdriPmhSHamRi8VUDIbg0b3i1zybDjBJGf/F1QPdh4L3bfp3HOOG3zbCYKx6UnurhRphOg32Sixu37rf2DaPnvQgOenHSKeAHgjqN9CYBQ6Se7AkdkodnQ1Blsl+MHb42l+NJB7CVLjFTvbTfPnqXtvQKLaKuqgLF/hvSSjclUdDpnGMstLddUbGY9yZqFF91Xa7VSN+vnsxDqIIHRqIhjlOkH1bmZeeYljIT26mJlONeWbyjiNroI54Jf0GEv0X/o8KlifNvHJo6DfkdNb3M7Ftk/d46ec=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(2906002)(31696002)(316002)(16576012)(36756003)(66946007)(54906003)(6486002)(53546011)(26005)(16526019)(8676002)(8936002)(478600001)(6666004)(38100700002)(66476007)(66556008)(186003)(956004)(31686004)(6916009)(86362001)(2616005)(4744005)(5660300002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?rs/w2KrYAUP6WVB6elX5xtdHeJaV7aWRhSMEZmP/lpGE/RsP6BesjVuh?=
 =?Windows-1252?Q?RJaLU03pRL5ZQwswekoh4KJ8IKSM2g+1YuqpdzQzgTRT5ZvY9/zKEx+j?=
 =?Windows-1252?Q?+mpnTO0Dj8DKZ2ircjCnIqp+FK2OH1GSoutRLKlrzzLf5QSuQ5Dek1MY?=
 =?Windows-1252?Q?+tiN2ZYvohrIfTah9ET9/LaIvd0ek/76JWBEbZ96GpglY5RlVz3Bi2I9?=
 =?Windows-1252?Q?waSK6tQUU9CpM784vqTpk/k3Pb4J4ld1yGzPCUZHe0cUdRd1T34+Zkq1?=
 =?Windows-1252?Q?C4Bo/2vZdcPWvjWVZARaa8T55ufyv3ttVRLfqAhLQQZZsbxDhEgUJCYY?=
 =?Windows-1252?Q?LA2GVYzYZAOWO+d1d5u3BCfGmwKSwNMggjK4nqgyFFKeKeD+g+soMADm?=
 =?Windows-1252?Q?RscimEMPUvlR58dsUjhkM9yyqOBqgj+fYhdVTy9OOwo+QI5iJJcWkXuW?=
 =?Windows-1252?Q?glUiU/Rk2NfFIexfO3grEB3GrLU9lxupGS8ibewAZ8u+NaMPtTkfVdY/?=
 =?Windows-1252?Q?gcSsGs/I6MzzKAKjn4EOSdNp/7xqaE/xLwL2UbWd2SvAK9Tp9SZRFYJA?=
 =?Windows-1252?Q?5r61JtVSpvENONQCTcAvwxyrE6k3uMgSCLU2GUsV37VsU8d4ZCPS2JW/?=
 =?Windows-1252?Q?MFM/Pf47bXgitb3ZKtcv6ZYR2dnXNMsCPIFvzDNrlC6rrC7+ZOSofnH3?=
 =?Windows-1252?Q?K5GP1rAcRTDtawhWUVXup2NFJwWwMAFa7NNrZzhEu4Z2hKIJab1VRfAj?=
 =?Windows-1252?Q?9sn1t/3svm4OKxKRQ8Mx+L5wsLb0nYzRsPbrOyCC0qlIJSU+32CoURdL?=
 =?Windows-1252?Q?XYAneuHzeG9InmfNNnuow2HMIYTJ7oopODCfLa8PUId0wEAOI+PCbYES?=
 =?Windows-1252?Q?dnDRF2RFSt9KouVfC2N1Wgxp7tVzUSxVFr0v4QlPGE8BSZUcN4Ycioks?=
 =?Windows-1252?Q?4d5riw2smOZSaFwal4fW02wr6E9aoGpLZ+lZqHJz84krZkpjra4qDH8S?=
 =?Windows-1252?Q?3MF+Y9KDm+UIAJrLb8hzhhTKns1LYkT4PwMwio3Jax1cbGnpgN0gHZ0d?=
 =?Windows-1252?Q?zs9jBGrLKB14U/jfdufyg3fgNsLMdja/KkKhg+9R4Xkl4M9Nzc02Eu1p?=
 =?Windows-1252?Q?AfkFwX1I1WKleOvAu8qzTfr3Cw6VFYys3+QBnDLIF1npUGvP2OJ0WoJN?=
 =?Windows-1252?Q?QwQBVGRc5lE4akWy8D+5mAgqkXm+gp8jgonloiAJ8SVnvzHwYmzP9HSc?=
 =?Windows-1252?Q?DDH1hjPdpIS7cAuqozqcE5CSVh5yT/FR/XZY9FFx/aS6Ui6Txc3CRO/x?=
 =?Windows-1252?Q?74vJmmqRAdKNEpnY0ff3xfX/1W3iQP7cp5q6Mr3OlhhGmmnxTpP/KQlH?=
 =?Windows-1252?Q?zc3boCRGXb9DteUIxu/auECxFQ8FwCgOUfxaN/Ma45ajKZ+cOjZOlQuC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9301c23e-a7e1-4570-00ab-08d93f99e737
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 09:47:29.3942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fy2voBRv9jszifVhvr67A6YNSDgFTwifwpJk+u/eO9BvqNXOn/DbvzQvjLbqflKW/ogz/P6F7MhkC/06alRcdCjDxVoGTePkxPqVc/vJ3+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4550
X-OriginatorOrg: citrix.com

On 05/07/2021 09:18, Olaf Hering wrote:
> Am Fri, 2 Jul 2021 17:39:54 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>
>> However, the % (phys, ) with the trailing comma is deliberate to work
>> around a common python error, so wants to remain if you're keeping the
>> %-formatting.
> What error is that?

>>> def p1(arg):
...=A0 =A0=A0 print("%s" % arg)
>>> def p2(arg):
...=A0 =A0=A0 print("%s" % (arg, ))

>>> p1("foo")
foo
>>> p2("foo")
foo

>>> p1(("foo", "bar"))
Traceback (most recent call last):
=A0 File "<stdin>", line 1, in <module>
=A0 File "<stdin>", line 2, in p1
TypeError: not all arguments converted during string formatting

>>> p2(("foo", "bar"))
('foo', 'bar')


The % operator has some type ambiguity with how it works.=A0 (foo, )
forces arg to be a 1-tuple as far as formatting is concerned.

~Andrew


